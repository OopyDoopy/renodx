// 0x9A74E7B6 -- faithful D3D9 pixel shader rewrite, targeting ps_3_0.
// Original: ps_2_0. Entry point: main. Requires one 2D texture on s0.
//
// TEXCOORD0.xy = center UV
// TEXCOORD1.xy = blur step / texel offset, in UV units
// TEXCOORD2.xy = lower UV bounds, TEXCOORD2.zw = upper UV bounds
//
// All nine samples use the exact original min(max(uv, boundsMin), boundsMax)
// UV constraint. The blur uses an RGBA Gaussian kernel with weights:
//
//       1   2   1
//       2   4   2   * (1 / 16)
//       1   2   1
//
// No HDR clipping, saturate, or input color normalization is performed.
// Game constants c0=(4,2,1/16,0) and c1=(1,-1,0,0) are DEF constants
// in the original bytecode, NOT external runtime shader constants.

#include "./shared.h"

sampler2D BloomTexture : register(s0);

float2 ConstrainUV(float2 sampleUV, float4 bounds)
{
    // Preserve the original order: max against lower bound, then min
    // against upper bound (not a saturate of the sampled color).
    return min(max(sampleUV, bounds.xy), bounds.zw);
}

float4 main(
    float2 centerUV : TEXCOORD0,
    float2 blurStep : TEXCOORD1,
    float4 uvBounds : TEXCOORD2) : COLOR0
{
    // Apply the same UV constraint independently to all nine samples.
    float4 left = tex2D(BloomTexture, ConstrainUV(centerUV + float2(-blurStep.x, 0.0), uvBounds));
    float4 center = tex2D(BloomTexture, ConstrainUV(centerUV, uvBounds));
    float4 right = tex2D(BloomTexture, ConstrainUV(centerUV + float2(blurStep.x, 0.0), uvBounds));
    float4 up = tex2D(BloomTexture, ConstrainUV(centerUV + float2(0.0, -blurStep.y), uvBounds));
    float4 down = tex2D(BloomTexture, ConstrainUV(centerUV + float2(0.0, blurStep.y), uvBounds));

    float4 upLeft = tex2D(BloomTexture, ConstrainUV(centerUV - blurStep, uvBounds));
    float4 upRight = tex2D(BloomTexture, ConstrainUV(centerUV + float2(blurStep.x, -blurStep.y), uvBounds));
    float4 downLeft = tex2D(BloomTexture, ConstrainUV(centerUV + float2(-blurStep.x, blurStep.y), uvBounds));
    float4 downRight = tex2D(BloomTexture, ConstrainUV(centerUV + blurStep, uvBounds));

    float4 total = 2.0 * left + 4.0 * center;
    total += 2.0 * right;
    total += 2.0 * up;
    total += 2.0 * down;
    total += upLeft;
    total += upRight;
    total += downLeft;
    total += downRight;
    total *= (1.0 / 16.0);
    return total;
}
