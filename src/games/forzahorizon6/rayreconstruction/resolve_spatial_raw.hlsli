// forzahorizon6-rr: current-frame spatial reconstruction used by the RTGI
// temporal-filter replacements (High 0xAF4E3D44; Medium 0x95FA8898).
//
// Faithful port of the original pass's per-pixel paths with all cross-frame
// state removed: the material single-sample path and the 3x3 normal/depth-
// weighted sample reconstruction are reproduced as-is (material/gbuffer/
// instance decode, confidence gates, YCoCg + normal-lobe output transform,
// NaN guards); the world-cache blend (u30/u31), the previous-frame history
// blend (t26/t27/t28) and the wave average are dropped. Every pixel resolves
// from the current frame's radiance samples only; the meta counter writes 1.
//
// Two compile variants share this body:
//   - raw (FH6_SPATIAL_BOTH = 0): the current-frame 3x3 reconstruction. No
//     wrapper uses it at present.
//   - centre-only (FH6_SPATIAL_BOTH = 1, used by both tier replacements): each
//     pixel resolves from its own sample alone, with no
//     spatial neighbourhood and no cross-frame state.

#ifndef FH6_SPATIAL_BOTH
#define FH6_SPATIAL_BOTH 0
#endif

cbuffer cb : register(b0, space36)
{
    float4 m[50] : packoffset(c0);
};

Texture2D<uint4> g_gbuffer : register(t6, space36);
Texture2D<float4> g_radiance : register(t20, space36);
Texture2D<float4> g_normal : register(t37, space36);
Texture2D<uint4> g_material : register(t47, space36);
Buffer<uint4> g_instances : register(t96, space0);
RWTexture2D<float4> g_out_a : register(u2, space36);
RWTexture2D<float4> g_out_b : register(u3, space36);
RWTexture2D<int4> g_out_meta : register(u4, space36);

// Engine packed-normal decode (12/12-bit fields, octahedral fold).
float3 DecodePackedNormal(float packed)
{
    const uint bits = asuint(packed);
    const float nx = float((bits >> 8u) & 4095u) * 0.0004884005174972116947174072265625f - 1.0f;
    const float ny = float(bits >> 20u) * 0.0004884005174972116947174072265625f - 1.0f;
    const float nz = 1.0f - abs(nx) - abs(ny);
    const float negative = clamp(-nz, 0.0f, 1.0f);
    const float3 normal = float3(
        ((nx >= 0.0f) ? -negative : negative) + nx,
        ((ny >= 0.0f) ? -negative : negative) + ny,
        nz);
    return normal * rsqrt(dot(normal, normal));
}

// Original per-sample confidence gate (m[22].y selects the wave mode).
float ConfidenceGate(float confidence, float threshold, bool wave_mode)
{
    if (wave_mode) return (confidence > 0.0f) ? clamp(confidence / threshold, 0.0f, 1.0f) : 1.0f;
    return ((confidence > 0.0f) && (confidence < threshold)) ? 0.0f : 1.0f;
}

bool IsNonFinite(float value)
{
    return (asuint(value) & 2139095040u) == 2139095040u;
}

[numthreads(8, 8, 1)]
void main(uint3 global_id : SV_DispatchThreadID)
{
    const uint2 px = global_id.xy;
    const uint2 bounds = uint2(asuint(m[14].x), asuint(m[14].y));
    if (px.x >= bounds.x || px.y >= bounds.y) return;

    const float4 own = g_normal.Load(int3(px, 0));
    if (!(own.y > 0.0f))
    {
        g_out_meta[px] = int4(0, 0, 0, 0);
        g_out_a[px] = float4(0.0f, 0.0f, 0.0f, 1.0f);
        g_out_b[px] = 0.0f.xxxx;
        return;
    }

    // Original hash-jittered material lookup coordinate.
    const uint seed = (px.x * 5u) + px.y;
    const uint hash_x = seed + 37u;
    const uint hash_x2 = ((hash_x >> 8u) ^ hash_x) + 1759714724u;
    const uint hash_x3 = ((hash_x2 << 8u) ^ hash_x2) * 458671337u;
    const uint hash_y = seed + 38u;
    const uint hash_y2 = ((hash_y >> 8u) ^ hash_y) + 1759714724u;
    const uint hash_y3 = ((hash_y2 << 8u) ^ hash_y2) * 458671337u;
    const uint2 material_px = uint2(
        uint((float((hash_x3 & 16777215u) ^ (hash_x3 >> 8u)) * 5.9604644775390625e-08f + float(px.x)) * m[25].x),
        uint((float((hash_y3 & 16777215u) ^ (hash_y3 >> 8u)) * 5.9604644775390625e-08f + float(px.y)) * m[25].y));

    const uint4 gbuffer = g_gbuffer.Load(int3(material_px, 0));
    const uint material_class = g_material.Load(int3(material_px, 0)).y;
    const uint flag_128 = gbuffer.w & 128u;
    const uint instance_index = (flag_128 != 0u) ? 1u : ((gbuffer.x << 7u) | gbuffer.w);
    const uint class_flag = ((material_class & 64u) != 0u) ? uint((material_class & 4294967167u) != 66u) : 4294967295u;
    const uint flags = g_instances.Load(instance_index * 4u).x;
    const uint base_flags = ((flags & 1u) != 0u) ? 0u : 18u;
    uint material_flags;
    if (flag_128 == 0u)
    {
        const bool dynamic = ((flags & 2097152u) != 0u) && (class_flag == clamp(class_flag, 0u, 1u));
        material_flags = dynamic ? (base_flags | 128u) : base_flags;
    }
    else
    {
        material_flags = gbuffer.w;
    }
    const bool opaque = ((material_flags & 128u) | (g_instances.Load(instance_index * 4u + 1u).x & 512u)) == 0u;
    const float confidence_threshold = opaque ? m[28].x : m[28].y;
    const bool wave_mode = (asuint(m[22].y) & 1u) != 0u;

    const float3 normal = DecodePackedNormal(own.x);
    const float depth = own.y;

    // Gather the 3x3 neighbourhood once: samples and the original
    // reconstruction weights.
    const float facing = clamp(-dot(m[6].xyz, normal), 0.0f, 1.0f);
    float4 samples[9];
    float sample_weights[9];
    [unroll] for (int dy = -1; dy <= 1; ++dy)
    {
        [unroll] for (int dx = -1; dx <= 1; ++dx)
        {
            const int index = (dy + 1) * 3 + (dx + 1);
            const uint2 sample_px = uint2(clamp(int2(px) + int2(dx, dy), int2(0, 0), int2(bounds) - 1));
            const float4 sample_normal_depth = g_normal.Load(int3(sample_px, 0));
            samples[index] = g_radiance.Load(int3(sample_px, 0));
            float sample_weight;
            if (index == 4)
            {
                sample_weight = 1.0f;
            }
            else
            {
                sample_weight = 0.0f;
                if (sample_normal_depth.y > 0.0f)
                {
                    const float axis = ((dx == 0) || (dy == 0)) ? 0.5f : 0.33333334f;
                    const float depth_ratio = clamp(
                        exp2((abs(depth - sample_normal_depth.y) * (-facing)) / max(0.001f, sample_normal_depth.y + depth)),
                        0.0f, 1.0f);
                    sample_weight = clamp(dot(normal, DecodePackedNormal(sample_normal_depth.x)), 0.0f, 1.0f) * axis * depth_ratio;
                }
            }
            sample_weights[index] = sample_weight;
        }
    }

    float co;
    float cg;
    float yv;
    float varc;
    float weight;

#if FH6_SPATIAL_BOTH
    if (true)
#else
    if (((flags & 32770u) == 32768u) && (asuint(m[49].x) != 0u))
#endif
    {
        // Original material single-sample path.
        const float3 sample = samples[4].xyz;
        weight = ConfidenceGate(samples[4].w, confidence_threshold, wave_mode);
        const float sum = dot(sample, 1.0f.xxx);
        const float clamped_sum = clamp(sum * 0.03125f, 0.0f, 1.0f) * 32.0f;
        const float3 v = (sum > 0.0f) ? (clamped_sum * sample / sum) : 0.0f.xxx;
        co = dot(float3(0.5f, 0.0f, -0.5f), v);
        cg = dot(float3(-0.25f, 0.5f, -0.25f), v);
        yv = dot(float3(0.25f, 0.5f, 0.25f), v) * 0.5f;
        varc = 0.0f;
    }
    else
    {
        // Original 3x3 normal/depth-weighted reconstruction, current frame only.
        float3 radiance_sum = 0.0f.xxx;
        float weight_sum = 0.0f;
        float gate_sum = 0.0f;
        [unroll] for (int index = 0; index < 9; ++index)
        {
            const float3 sample = samples[index].xyz;
            const float sample_weight = sample_weights[index];
            radiance_sum += sample * sample_weight;
            weight_sum += sample_weight;
            gate_sum += ConfidenceGate(samples[index].w, confidence_threshold, wave_mode) * sample_weight;
        }
        float3 radiance;
        if (weight_sum > 0.0f)
        {
            radiance = radiance_sum / weight_sum;
            weight = gate_sum / weight_sum;
        }
        else
        {
            radiance = 0.0f.xxx;
            weight = 1.0f;
        }
        const float sum = dot(radiance, 1.0f.xxx);
        const float clamped_sum = clamp(sum * 0.03125f, 0.0f, 1.0f) * 32.0f;
        const float3 v = (sum > 0.0f) ? (clamped_sum * radiance / sum) : 0.0f.xxx;
        co = dot(float3(0.5f, 0.0f, -0.5f), v);
        cg = dot(float3(-0.25f, 0.5f, -0.25f), v);
        yv = dot(float3(0.25f, 0.5f, 0.25f), v) * 0.5f;
        varc = abs(weight - (weight * weight));
    }

    const float3 normal_lobe = yv * normal;
    g_out_meta[px] = int4(1, 1, 1, 1);
    g_out_a[px] = (IsNonFinite(co) || IsNonFinite(cg) || IsNonFinite(varc) || IsNonFinite(weight))
                      ? float4(0.0f, 0.0f, 0.0f, 0.0f)
                      : float4(co, cg, varc, weight);
    g_out_b[px] = (IsNonFinite(normal_lobe.x) || IsNonFinite(normal_lobe.y) || IsNonFinite(normal_lobe.z) || IsNonFinite(yv))
                      ? 0.0f.xxxx
                      : float4(normal_lobe, yv);
}
