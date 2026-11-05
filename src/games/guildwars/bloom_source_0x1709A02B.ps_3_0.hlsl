// 0x1709A02B -- 9-tap Gaussian blur originally compiled as ps_2_0.
// Reconstructed HLSL targeting Direct3D 9 ps_3_0.
// Entry point: main. Sampler s0 is a 2D texture.
// TEXCOORD0.xy = center UV
// TEXCOORD1.xy = axial horizontal/vertical step
// TEXCOORD2.xy = separate diagonal step (IMPORTANT: not necessarily identical)
// TEXCOORD3.xy = minimum allowed UV, .zw = maximum allowed UV.
// Internal DEF c0=(4,2,1/16,0), c2=(1,-1,0,0) are built-in constants.
// Internal DEF c1 = (0.299, 0.587, 0.114, 0) is the BT.601-style luma vector.
// Gaussian weights: corners 1/16; sides 2/16; center 4/16.
// Uses all RGBA components and clamps ONLY UV coordinates, not color values.

#include "./shared.h"

sampler2D BloomTexture : register(s0);

float2 ConstrainUV(float2 uv, float4 bounds)
{
    return min(max(uv, bounds.xy), bounds.zw);
}

float4 main(
    float2 centerUV : TEXCOORD0,
    float2 axialStep : TEXCOORD1,
    float2 diagonalStep : TEXCOORD2,
    float4 uvBounds : TEXCOORD3) : COLOR0
{
    float4 left       = tex2D(BloomTexture, ConstrainUV(centerUV + float2(-axialStep.x, 0.0), uvBounds));
    float4 center     = tex2D(BloomTexture, ConstrainUV(centerUV, uvBounds));
    float4 right      = tex2D(BloomTexture, ConstrainUV(centerUV + float2( axialStep.x, 0.0), uvBounds));
    float4 up         = tex2D(BloomTexture, ConstrainUV(centerUV + float2(0.0, -axialStep.y), uvBounds));
    float4 down       = tex2D(BloomTexture, ConstrainUV(centerUV + float2(0.0,  axialStep.y), uvBounds));
    float4 upLeft     = tex2D(BloomTexture, ConstrainUV(centerUV - diagonalStep, uvBounds));
    float4 upRight    = tex2D(BloomTexture, ConstrainUV(centerUV + float2(diagonalStep.x, -diagonalStep.y), uvBounds));
    float4 downLeft   = tex2D(BloomTexture, ConstrainUV(centerUV + float2(-diagonalStep.x, diagonalStep.y), uvBounds));
    float4 downRight  = tex2D(BloomTexture, ConstrainUV(centerUV + diagonalStep, uvBounds));

    // Preserve accumulation order from bytecode (including 2*left before 4*center).
    float4 accum = left + left;
    accum = 4.0 * center + accum;
    accum = 2.0 * right + accum;
    accum = 2.0 * up + accum;
    accum = 2.0 * down + accum;
    accum = upLeft + accum;
    accum = upRight + accum;
    accum = downLeft + accum;
    accum = downRight + accum;
    float4 blurred = accum * (1.0 / 16.0);
    if (CUSTOM_BLOOM_TYPE == 1.f) return blurred;
    // Additional luminance-weighted bloom modulation; Rec.601 coefficients.
    float luminance = dot(blurred.rgb, float3(0.299, 0.587, 0.114));
    return blurred * luminance;
}
