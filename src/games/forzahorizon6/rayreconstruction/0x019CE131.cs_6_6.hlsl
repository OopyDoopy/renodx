// resolve_0x019CE131 — High RTGI_Resolve, draw 5441.
// Faithful pointwise replacement: preserves the game's depth rejection,
// packed-normal decode, CoCg reconstruction, and normal-lobe contribution.

Texture2D<uint4> g_packed_normal : register(t0, space36);
Texture2D<float4> g_depth : register(t1, space36);
Texture2D<half4> g_radiance_a : register(t22, space36);
Texture2D<half4> g_radiance_b : register(t23, space36);
RWTexture2D<float4> g_output : register(u0, space36);

cbuffer Constants : register(b0, space36)
{
    float4 g_depth_constants : packoffset(c0.x);
    int2 g_radiance_scale : packoffset(c20.x);
};

[numthreads(8, 8, 1)]
void main(uint3 dispatch_id : SV_DispatchThreadID)
{
    const int2 pixel = int2(dispatch_id.xy);
    uint output_width, output_height;
    g_output.GetDimensions(output_width, output_height);
    if (dispatch_id.x >= output_width || dispatch_id.y >= output_height)
    {
        return;
    }

    const float depth = g_depth.Load(int3(pixel, 0)).x;
    const float linear_depth = (depth <= 0.0f)
                                   ? 0.0f
                                   : (g_depth_constants.w / (depth - g_depth_constants.z));
    if (linear_depth <= 1.0e-6f)
    {
        g_output[pixel] = float4(0.0f, 0.0f, 0.0f, 1.0f);
        return;
    }

    const uint4 packed_normal = g_packed_normal.Load(int3(pixel, 0));
    float2 oct = float2(
        float((packed_normal.x >> 8u) & 4095u),
        float(packed_normal.x >> 20u)) * 0.0004884005174972117f - 1.0f;
    const float nz = 1.0f - abs(oct.x) - abs(oct.y);
    const float fold = saturate(-nz);
    const float3 decoded = float3(
        oct.x + ((oct.x >= 0.0f) ? -fold : fold),
        oct.y + ((oct.y >= 0.0f) ? -fold : fold),
        nz);
    float3 normal = decoded * rsqrt(dot(decoded, decoded));
    normal *= rsqrt(dot(normal, normal));

    const int2 radiance_pixel = pixel / g_radiance_scale;
    const half4 radiance_a = g_radiance_a.Load(int3(radiance_pixel, 0));
    const half4 radiance_b = g_radiance_b.Load(int3(radiance_pixel, 0));
    const float normal_lobe = dot(normal, float3(radiance_b.xyz)) + radiance_b.w;

    g_output[pixel] = float4(
        (radiance_a.x - radiance_a.y) + normal_lobe,
        normal_lobe + radiance_a.y,
        normal_lobe - radiance_a.y - radiance_a.x,
        radiance_a.w);
}
