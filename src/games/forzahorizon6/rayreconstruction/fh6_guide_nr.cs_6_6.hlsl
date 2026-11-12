// forzahorizon6-rr: DLSS-RR guide generation (M3a).
//
// Not a replacement — this is the add-on's own compute pass, dispatched on the
// game's command list right before the RR evaluate (control-rr rrg pattern).
// It decodes the packed G-buffer normal written by the G-buffer writers
// (R32_UINT target, 12+12-bit packing at bits 8..19 / 20..31, as decoded by
// the game's own resolve chain) and packs it with a roughness value the way
// DLSS-RR wants it (ePacked: normal xyz + roughness in alpha). It also writes
// a linear-albedo copy (DLSS-RR rejects sRGB albedo) and an approximate
// SpecularAlbedo guide from the captured albedo (no first-class live specular
// target identified yet).
//
// Root signature (created in guides.hpp), 6 root parameters:
//   b0: 16 root constants: uint4 p + float4 m0/m1/m2
//       p.x = width, p.y = height
//       p.z = flags:
//             bit0 = transform normals world->view with m0..m2
//             bit1 = roughness from material bits (else constant)
//             bit2 = material field select (0 = .y 7-bit field, 1 = .z)
//             bit3 = reserved
//             bit4 = invert (roughness = 1 - field/127)
//       p.w = constant roughness in milliunits (p.w / 1000)
//   m0..m2 = world->view matrix rows (Streamline matrix helper convention)
//   t0: root SRV = packed normal bits (r32_uint G-buffer target)
//   t1: root SRV = material bits (r8g8b8a8_uint G-buffer target)
//   t2: root SRV = albedo (r8g8b8a8_srgb G-buffer target, linearized on read)
//   u0: root UAV = RGBA16F NormalRoughness output
//   u1: root UAV = RGBA8 specular albedo output
//   u2: root UAV = RGBA16F linear diffuse albedo output

Texture2D<uint> g_normal_bits : register(t0);
Texture2D<uint4> g_material_bits : register(t1);
Texture2D<float4> g_albedo : register(t2);
RWTexture2D<float4> g_out : register(u0);
RWTexture2D<float4> g_spec : register(u1);
RWTexture2D<float4> g_albedo_out : register(u2);

cbuffer Params : register(b0)
{
    uint4 p;
    float4 m0;
    float4 m1;
    float4 m2;
};

[numthreads(8, 8, 1)]
void main(uint3 id : SV_DispatchThreadID)
{
    if (id.x >= p.x || id.y >= p.y) return;

    // Exact copy of the resolve chain's packed-normal decode.
    const uint packed = g_normal_bits.Load(int3(int2(id.xy), 0)).x;
    const float nx0 = (float((packed >> 8u) & 4095u) * 0.0004884005174972116947174072265625f) - 1.0f;
    const float ny0 = (float(packed >> 20u) * 0.0004884005174972116947174072265625f) - 1.0f;
    const float nz0 = 1.0f - abs(nx0) - abs(ny0);
    const float neg = clamp(-nz0, 0.0f, 1.0f);
    const float nxn = ((nx0 >= 0.0f) ? -neg : neg) + nx0;
    const float nyn = ((ny0 >= 0.0f) ? -neg : neg) + ny0;
    const float nlen = rsqrt(dot(float3(nxn, nyn, nz0), float3(nxn, nyn, nz0)));
    float3 n = float3(nxn, nyn, nz0) * nlen;

    // The G-buffer packs world-space normals (built from WORLDNORMAL); DLSS-RR
    // from Streamline receives the game's real world->view matrix, so feed
    // view-space normals (control-rr convention); rows-as-basis per
    // sl_matrix_helpers: view.axis = dot(world_normal, row).
    if ((p.z & 1u) != 0u)
    {
        n = normalize(float3(dot(m0.xyz, n), dot(m1.xyz, n), dot(m2.xyz, n)));
    }

    float roughness;
    if ((p.z & 2u) != 0u)
    {
        // Candidate 7-bit gloss/spec term from the material target (live
        // verified: exact field and inversion are picked interactively).
        const uint4 mat = g_material_bits.Load(int3(int2(id.xy), 0));
        const uint field = (((p.z >> 2u) & 1u) != 0u) ? (mat.z & 127u) : (mat.y & 127u);
        const float gloss = float(field) * (1.0f / 127.0f);
        roughness = (((p.z >> 4u) & 1u) != 0u) ? (1.0f - gloss) : gloss;
        roughness = clamp(roughness, 0.0f, 1.0f);
    }
    else
    {
        roughness = clamp(float(p.w) * 0.001f, 0.0f, 1.0f);
    }

    g_out[id.xy] = float4(n, roughness);

    // Linear diffuse albedo copy: DLSS-RR requires linear albedo and rejects
    // sRGB textures; the sample is already linear (hardware sRGB decode on the
    // t2 SRV read).
    const float3 albedo = saturate(g_albedo.Load(int3(int2(id.xy), 0)).rgb);
    g_albedo_out[id.xy] = float4(albedo, 1.0f);

    // Approximate specular albedo from the linearized sRGB albedo: dielectric
    // floor plus a squared-albedo term (the game's own F0 estimate used the
    // same albedo^2 shape against a 0.04 base).
    const float3 specular = saturate(0.04f + albedo * albedo * 0.5f);
    g_spec[id.xy] = float4(specular, 1.0f);
}
