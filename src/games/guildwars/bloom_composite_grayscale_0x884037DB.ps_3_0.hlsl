// 0x884037DB -- original: Direct3D 9 ps_1_1, rewritten for ps_3_0.
// Exact arithmetic reconstructed from the original compiled instruction stream.
// No intentional HDR clamp was added. Output register: COLOR0.
//
// Original assembly:
//   def c2, 0.2125, 0.7154, 0.0721, 0
//   tex t0
//   tex t1
//   mov_sat r0, c1
//   dp3 r1, t0, c2
//   lrp r0, r0, t0, r1
//   mul_x2 r1, t1, c0
//   add r0, r1, r0
//
// c0: per-channel additive overlay strength (game-supplied).
// c1: per-channel color-vs-grayscale blend (game-supplied; clamped to [0, 1]).
// c2: local compile-time Rec.709-style luminance coefficients, not runtime c2.

#include "./shared.h"

float4 AdditiveScale : register(c0);
float4 ColorBlend    : register(c1);

sampler2D BaseTexture     : register(s0);
sampler2D AdditiveTexture : register(s1);

float4 main(float2 baseUV : TEXCOORD0,
            float2 additiveUV : TEXCOORD1) : COLOR0
{
    float4 baseColor = tex2D(BaseTexture, baseUV);
    float4 overlayColor = tex2D(AdditiveTexture, additiveUV);

    const float3 lumaCoefficients = float3(0.2125, 0.7154, 0.0721);
    float luminance = dot(baseColor.rgb, lumaCoefficients);

    // Original mov_sat: only the blend parameter is saturated, not the image.
    float4 blend = saturate(ColorBlend);

    // Original lrp: blend * baseColor + (1 - blend) * luminance.
    // This also affects alpha: grayscale branch sets alpha to luminance.
    float4 graded = lerp(float4(luminance, luminance, luminance, luminance),
                         baseColor, blend);

    if (CUSTOM_BLOOM_TYPE == 1.f) {
        float3 bloom_weight = 0.3f * CUSTOM_BLOOM_STRENGTH * (2.f * AdditiveScale.rgb);
        return float4(lerp(graded.rgb, overlayColor.rgb, bloom_weight) * (1.f + bloom_weight), graded.a);
    }

    overlayColor.rgb *= CUSTOM_BLOOM_STRENGTH;
    // Original mul_x2 and add: overlay is doubled and added in RGBA.
    return graded + 2.0 * overlayColor * AdditiveScale;
}
