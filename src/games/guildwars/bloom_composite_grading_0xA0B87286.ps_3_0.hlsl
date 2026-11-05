#include "./shared.h"

// 0xA0B87286 -- decompiled Direct3D 9 pixel shader (ps_1_1 -> ps_3_0)
// Entry point: main, target profile: ps_3_0.
// Base texture: s0 (texcoord0), additive texture: s1 (texcoord1).
// Assumes both implicit ps_1_1 texture stages use 2D samplers.
// Runtime constants: c1-c4. The source shader internally DEFines c0
// to Rec.709 approximate luminance coefficients.
// No saturate/clamp has been introduced; arithmetic is intentionally HDR-unbounded.

float4 c1 : register(c1);  // Additive texture scaling (multiplied by 2)
float4 c2 : register(c2);  // Per-channel original-vs-grayscale interpolation
float4 c3 : register(c3);  // Graded gain (rgba), plus blend weight in .w
float4 c4 : register(c4);  // Complement color modulation (rgba)

sampler2D BaseTexture : register(s0);
sampler2D AdditiveTexture : register(s1);

float4 main(float2 baseUV : TEXCOORD0, float2 additiveUV : TEXCOORD1) : COLOR0
{
    float4 baseColor = tex2D(BaseTexture, baseUV);
    float4 additiveColor = tex2D(AdditiveTexture, additiveUV);

    // The original bytecode specifies these exact approximate Rec.709 weights.
    float luminance = dot(baseColor.rgb, float3(0.2125, 0.7154, 0.0721));

    // In the original, lrp overwrites texture register t0.rgb; in parallel,
    // t0.a is replaced by squared luminance (original sampled alpha is lost).
    float4 gradedColor;
    gradedColor.rgb = lerp(float3(luminance, luminance, luminance), baseColor.rgb, c2.rgb);
    gradedColor.a = luminance * luminance;

    float4 gainColor = gradedColor * c3;
    float4 inverseModulation = 1.0 - (1.0 - gradedColor) * c4;
    // The original SDR blend weight cannot exceed one; retain HDR color range
    // without letting bright pixels extrapolate the grading curve.
    float4 brightnessBlend = lerp(gainColor, inverseModulation, saturate(gradedColor.a));
    float4 originalBlend = lerp(gradedColor, brightnessBlend, c3.w);

    float4 result;
    if (CUSTOM_BLOOM_TYPE == 1.f) {
        float3 bloom_weight = 0.3f * CUSTOM_BLOOM_STRENGTH * (2.f * c1.rgb);
        result = float4(lerp(originalBlend.rgb, additiveColor.rgb, bloom_weight) * (1.f + bloom_weight), originalBlend.a);
    } else {
        additiveColor.rgb *= CUSTOM_BLOOM_STRENGTH;
        // In ps_1_1 the multiply destination had shift=1 (multiply result by 2).
        result = originalBlend + 2.0 * (c1 * additiveColor);
    }
    return result;
}
