// 0xD1E3C8AE -- decompiled additive compositor, originally ps_1_1.
// Rewritten for Direct3D 9 ps_3_0. Entry point: main.
// Original shader assembly:
//   tex t0
//   tex t1
//   mul_x2 r0, t1, c0
//   add r0, r0, t0
// The _x2 multiplier is explicitly retained. All components, including alpha,
// are combined. This version does not emulate any implicit ps_1_1 precision
// limitations or final render-target clamping.
// Runtime pixel shader constant: c0 (float4 scale of texture s1).

#include "./shared.h"

float4 OverlayScale : register(c0);
sampler2D BaseTexture    : register(s0);
sampler2D AdditiveTexture: register(s1);

float4 main(float2 baseUV : TEXCOORD0, float2 additiveUV : TEXCOORD1) : COLOR0
{
    float4 base = tex2D(BaseTexture, baseUV);
    float4 overlay = tex2D(AdditiveTexture, additiveUV);
    if (CUSTOM_BLOOM_TYPE == 1.f) {
        float3 bloom_weight = 0.3f * CUSTOM_BLOOM_STRENGTH * (2.f * OverlayScale.rgb);
        return float4(lerp(base.rgb, overlay.rgb, bloom_weight) * (1.f + bloom_weight), base.a);
    }
    overlay.rgb *= CUSTOM_BLOOM_STRENGTH;
    return base + (overlay * OverlayScale) * 2.0;
}
