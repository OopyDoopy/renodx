// Reconstructed from NISSharpening_0x3650C210.cs_6_6 DXIL/LLVM.
//
// This is the NVIDIA Image Scaling (NIS) sharpening-only path as compiled here:
//   - 32x32 output block per thread group
//   - 128 threads per group
//   - 38x38 groupshared luma tile (32 + 5-tap support + 1)
//   - SDR / BT.709 luma coefficients
//   - no viewport bounds path in this compiled variant
//
// Resource bindings and constant-buffer layout are preserved from the original shader.

#include "../shared.h"

Texture2D<float4>   t0 : register(t0);
RWTexture2D<float4> u0 : register(u0);
SamplerState        s0 : register(s0);

cbuffer cb0 : register(b0)
{
    // c0
    float kDetectRatio       : packoffset(c0.x);
    float kDetectThreshold   : packoffset(c0.y);
    float kMinContrastRatio  : packoffset(c0.z);
    float kRatioNorm         : packoffset(c0.w);

    // c1
    float kContrastBoost     : packoffset(c1.x);
    float kEpsilon           : packoffset(c1.y);
    float kSharpStartY       : packoffset(c1.z);
    float kSharpScaleY       : packoffset(c1.w);

    // c2
    float kSharpStrengthMin   : packoffset(c2.x);
    float kSharpStrengthScale : packoffset(c2.y);
    float kSharpLimitMin      : packoffset(c2.z);
    float kSharpLimitScale    : packoffset(c2.w);

    // c3 -- present in the original NIS config, unused by this sharpening-only shader.
    float kScaleX   : packoffset(c3.x);
    float kScaleY   : packoffset(c3.y);
    float kDstNormX : packoffset(c3.z);
    float kDstNormY : packoffset(c3.w);

    // c4
    float kSrcNormX : packoffset(c4.x);
    float kSrcNormY : packoffset(c4.y);
    uint  kInputViewportOriginX : packoffset(c4.z);
    uint  kInputViewportOriginY : packoffset(c4.w);

    // c5 -- unused in this compiled no-viewport variant.
    uint kInputViewportWidth   : packoffset(c5.x);
    uint kInputViewportHeight  : packoffset(c5.y);
    uint kOutputViewportOriginX : packoffset(c5.z);
    uint kOutputViewportOriginY : packoffset(c5.w);

    // c6 -- unused in this compiled no-viewport variant.
    uint  kOutputViewportWidth  : packoffset(c6.x);
    uint  kOutputViewportHeight : packoffset(c6.y);
    float reserved0             : packoffset(c6.z);
    float reserved1             : packoffset(c6.w);
};

#define BLOCK_WIDTH       32
#define BLOCK_HEIGHT      32
#define THREAD_GROUP_SIZE 128

#define SUPPORT_SIZE 5
#define TILE_WIDTH   (BLOCK_WIDTH  + SUPPORT_SIZE + 1) // 38
#define TILE_HEIGHT  (BLOCK_HEIGHT + SUPPORT_SIZE + 1) // 38

groupshared float gLumaTile[TILE_HEIGHT][TILE_WIDTH];

float GetLuma(float3 rgb)
{
    // Exact coefficients visible in the DXIL.
    return rgb.r * 0.2126f
         + rgb.g * 0.7152f
         + rgb.b * 0.0722f;
}

float CalcLTI(
    float y0,
    float y1,
    float y2,
    float y3,
    float y4)
{
    const float aMin = min(min(y0, y1), y2);
    const float aMax = max(max(y0, y1), y2);

    const float bMin = min(min(y2, y3), y4);
    const float bMax = max(max(y2, y3), y4);

    const float aContrast = aMax - aMin;
    const float bContrast = bMax - bMin;

    const float highContrast = max(aContrast, bContrast);
    const float lowContrast  = min(aContrast, bContrast);

    const float contrastRatio = highContrast / (lowContrast + kEpsilon);

    // Suppress sharpening where the local contrast ratio indicates ringing risk.
    return (1.0f - saturate((contrastRatio - kMinContrastRatio) * kRatioNorm))
         * kContrastBoost;
}

float EvalUSM(
    float y0,
    float y1,
    float y2,
    float y3,
    float y4,
    float sharpnessStrength,
    float sharpnessLimit)
{
    // NIS 5-tap sharpening profile.
    float usm = -0.6001f * y1
              +  1.2002f * y2
              -  0.6001f * y3;

    usm *= sharpnessStrength;

    // Limit positive and negative overshoot relative to center luma.
    usm = min(sharpnessLimit, max(-sharpnessLimit, usm));

    // Local tone-invariance / ringing suppression.
    usm *= CalcLTI(y0, y1, y2, y3, y4);

    return usm;
}

float4 GetDirectionalUSM(float p[5][5])
{
    const float center = p[2][2];

    // Brightness-dependent sharpening ramp.
    const float scaleY =
        1.0f - saturate((center - kSharpStartY) * kSharpScaleY);

    const float sharpnessStrength =
        (kSharpStrengthMin + kSharpStrengthScale * scaleY) * CUSTOM_SHARPNESS;

    const float sharpnessLimit =
        (kSharpLimitMin + kSharpLimitScale * scaleY) * center;

    float4 result;

    // "0 degree" path in NIS: vertical 5-tap line through the center.
    result.x = EvalUSM(
        p[0][2], p[1][2], p[2][2], p[3][2], p[4][2],
        sharpnessStrength, sharpnessLimit);

    // "90 degree" path: horizontal 5-tap line.
    result.y = EvalUSM(
        p[2][0], p[2][1], p[2][2], p[2][3], p[2][4],
        sharpnessStrength, sharpnessLimit);

    // 45 degree path. Intermediate samples are half-pixel diagonal interpolations.
    const float d45_1 = 0.5f * (p[2][1] + p[1][2]);
    const float d45_3 = 0.5f * (p[3][2] + p[2][3]);

    result.z = EvalUSM(
        p[1][1], d45_1, p[2][2], d45_3, p[3][3],
        sharpnessStrength, sharpnessLimit);

    // 135 degree path.
    const float d135_1 = 0.5f * (p[3][2] + p[2][1]);
    const float d135_3 = 0.5f * (p[2][3] + p[1][2]);

    result.w = EvalUSM(
        p[3][1], d135_1, p[2][2], d135_3, p[1][3],
        sharpnessStrength, sharpnessLimit);

    return result;
}

float4 GetEdgeWeights(float p[5][5])
{
    // The original function evaluates a centered 3x3 edge detector within the
    // 5x5 sharpening support.

    const float g0 = abs(
          p[1][1] + p[1][2] + p[1][3]
        - p[3][1] - p[3][2] - p[3][3]);

    const float g45 = abs(
          p[2][1] + p[1][1] + p[1][2]
        - p[3][2] - p[3][3] - p[2][3]);

    const float g90 = abs(
          p[1][1] + p[2][1] + p[3][1]
        - p[1][3] - p[2][3] - p[3][3]);

    const float g135 = abs(
          p[2][1] + p[3][1] + p[3][2]
        - p[1][2] - p[1][3] - p[2][3]);

    const float g0_90Max   = max(g0, g90);
    const float g0_90Min   = min(g0, g90);
    const float g45_135Max = max(g45, g135);
    const float g45_135Min = min(g45, g135);

    if (g0_90Max + g45_135Max == 0.0f)
        return float4(0.0f, 0.0f, 0.0f, 0.0f);

    const float e0_90 =
        min(g0_90Max / (g0_90Max + g45_135Max), 1.0f);

    const float e45_135 = 1.0f - e0_90;

    const bool detect0_90 =
           (g0_90Max > g0_90Min * kDetectRatio)
        && (g0_90Max > kDetectThreshold)
        && (g0_90Max > g45_135Min);

    const bool detect45_135 =
           (g45_135Max > g45_135Min * kDetectRatio)
        && (g45_135Max > kDetectThreshold)
        && (g45_135Max > g0_90Min);

    const bool prefer0   = (g0_90Max   == g0);
    const bool prefer45  = (g45_135Max == g45);

    const bool bothFamiliesDetected = detect0_90 && detect45_135;

    const float familyWeight0_90 =
        bothFamiliesDetected ? e0_90 : 1.0f;

    const float familyWeight45_135 =
        bothFamiliesDetected ? e45_135 : 1.0f;

    float4 weights = float4(0.0f, 0.0f, 0.0f, 0.0f);

    weights.x = (detect0_90   &&  prefer0)  ? familyWeight0_90   : 0.0f;
    weights.y = (detect0_90   && !prefer0)  ? familyWeight0_90   : 0.0f;
    weights.z = (detect45_135 &&  prefer45) ? familyWeight45_135 : 0.0f;
    weights.w = (detect45_135 && !prefer45) ? familyWeight45_135 : 0.0f;

    return weights;
}

[numthreads(THREAD_GROUP_SIZE, 1, 1)]
void main(
    uint3 groupID       : SV_GroupID,
    uint3 groupThreadID : SV_GroupThreadID)
{
    const uint2 blockOrigin = groupID.xy * uint2(BLOCK_WIDTH, BLOCK_HEIGHT);

    if (CUSTOM_SHARPENING_TYPE != 0.f)
    {
        for (uint k = groupThreadID.x;
             k < BLOCK_WIDTH * BLOCK_HEIGHT;
             k += THREAD_GROUP_SIZE)
        {
            const uint2 pos = uint2(
                k % BLOCK_WIDTH,
                k / BLOCK_WIDTH);
            const uint2 dstPixel = blockOrigin + pos;
            const float2 uv =
                (float2(dstPixel) + 0.5f)
                * float2(kSrcNormX, kSrcNormY);

            u0[dstPixel] = t0.SampleLevel(s0, uv, 0.0f);
        }

        return;
    }

    // -------------------------------------------------------------------------
    // 1. Populate a 38x38 shared luma tile.
    //
    // Each loop iteration loads a 2x2 quad. The original broken decompile
    // incorrectly inserted an unconditional break after the first iteration.
    // DXIL shows the loop advancing by THREAD_GROUP_SIZE * 2 == 256.
    // -------------------------------------------------------------------------

    const float supportShift = 0.5f - (SUPPORT_SIZE / 2); // -1.5

    for (uint i = groupThreadID.x * 2;
         i < (TILE_WIDTH * TILE_HEIGHT) / 2;
         i += THREAD_GROUP_SIZE * 2)
    {
        const uint2 tilePos = uint2(
            i % TILE_WIDTH,
            (i / TILE_WIDTH) * 2);

        [unroll]
        for (uint dy = 0; dy < 2; ++dy)
        {
            [unroll]
            for (uint dx = 0; dx < 2; ++dx)
            {
                const float2 srcPixel =
                    float2(blockOrigin + tilePos + uint2(dx, dy))
                    + supportShift;

                const float2 uv =
                    srcPixel * float2(kSrcNormX, kSrcNormY);

                const float4 sampleColor = t0.SampleLevel(s0, uv, 0.0f);

                gLumaTile[tilePos.y + dy][tilePos.x + dx] =
                    GetLuma(sampleColor.rgb);
            }
        }
    }

    GroupMemoryBarrierWithGroupSync();

    // -------------------------------------------------------------------------
    // 2. Sharpen all 32x32 = 1024 output pixels.
    //
    // With 128 threads this gives each thread up to eight output pixels:
    // thread, thread+128, ... thread+896.
    // -------------------------------------------------------------------------

    for (uint k = groupThreadID.x;
         k < BLOCK_WIDTH * BLOCK_HEIGHT;
         k += THREAD_GROUP_SIZE)
    {
        const uint2 pos = uint2(
            k % BLOCK_WIDTH,
            k / BLOCK_WIDTH);

        float p[5][5];

        [unroll]
        for (uint y = 0; y < 5; ++y)
        {
            [unroll]
            for (uint x = 0; x < 5; ++x)
            {
                p[y][x] = gLumaTile[pos.y + y][pos.x + x];
            }
        }

        const float4 directionalUSM = GetDirectionalUSM(p);
        const float4 edgeWeights   = GetEdgeWeights(p);

        const float sharpenedLumaDelta =
            dot(directionalUSM, edgeWeights);

        const uint2 dstPixel = blockOrigin + pos;

        const float2 uv =
            (float2(dstPixel) + 0.5f)
            * float2(kSrcNormX, kSrcNormY);

        float4 color = t0.SampleLevel(s0, uv, 0.0f);

        // The compiled shader applies the same luma correction to RGB and
        // leaves alpha unchanged.
        color.rgb += sharpenedLumaDelta;

        u0[dstPixel] = color;
    }
}
