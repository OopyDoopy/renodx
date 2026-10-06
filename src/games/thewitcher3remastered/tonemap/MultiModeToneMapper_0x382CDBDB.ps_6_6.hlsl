// Reconstructed from MultiModeToneMapper_0x382CDBDB.ps_6_6.ll
// Shader model: ps_6_6
// Original DXIL entry point: ps_main
//
// Resource bindings and cbuffer byte layouts are preserved.
//
// High-level behavior:
//   - t0: source color buffer, loaded by SV_Position
//   - t1: exposure/adaptation texture, only texel (0, 0).r is read
//   - mode 0: normalized Hable / Uncharted-style tone curve
//   - mode 1: inset -> log normalize -> parametric/polynomial curve
//             -> per-channel shaping -> saturation -> outset -> power 2.2
//   - mode 2: exposure-adjusted passthrough
//   - RenoDX tone-map type 2 overrides the game mode with Prism grading and tone mapping
//   - output alpha: absolute BT.709 luminance of the exposure-adjusted input
//
// Only these CustomPixelConsts registers are used:
//   c4, c7, c8, c16, c19
//
// Only SharedPixelConsts register c221.w is used. RenoDX grading controls are
// supplied by include/common.hlsl from the injected settings buffer.

Texture2D<float4> gSource   : register(t0);
Texture2D<float4> gExposure : register(t1);

cbuffer CustomPixelConsts : register(b3)
{
    float4 gCustom[25]; // 400 bytes
};

cbuffer SharedPixelConsts : register(b12)
{
    float4 gShared[341]; // 5456 bytes
};

#include "./prism_tonemap.hlsli"
#include "../include/common.hlsl"
#include "./agx_tonemap.hlsli"

struct PSInput
{
    float4 position : SV_Position;
};


// -----------------------------------------------------------------------------
// Helpers
// -----------------------------------------------------------------------------

float3 Pow3(float3 x, float3 p)
{
    return float3(
        pow(x.x, p.x),
        pow(x.y, p.y),
        pow(x.z, p.z));
}


// -----------------------------------------------------------------------------
// Exposure / adaptation
// -----------------------------------------------------------------------------

float ComputeExposureScale(
    float exposureSample,
    float exposureReferenceScale,
    float exposureExponent,
    float exposureMin,
    float exposureMax)
{
    // Exact structure reconstructed from the LLVM:
    //
    // reference = exposureReferenceScale * 11.2
    // adapted   = reference * pow(clamp(exposureSample) / reference,
    //                             exposureExponent)
    // scale     = exposureReferenceScale / adapted

    const float whitePoint = 11.1999998093f;

    float reference =
        exposureReferenceScale * whitePoint;

    float exposure =
        clamp(exposureSample, exposureMin, exposureMax);

    exposure = max(exposure, 0.0000999999975f);

    float adapted =
        reference
        * pow(exposure / reference, exposureExponent);

    return exposureReferenceScale / adapted;
}


// -----------------------------------------------------------------------------
// Mode 0: Hable / rational filmic curve
// -----------------------------------------------------------------------------

float HableRaw(
    float x,
    float A,
    float B,
    float C,
    float D,
    float E,
    float F)
{
    return
        ((x * (A * x + C * B) + D * E)
       / (x * (A * x + B)     + D * F))
       - E / F;
}

float3 ApplyHableNormalized(
    float3 color,
    float A,
    float B,
    float C,
    float D,
    float E,
    float F,
    float outputScale)
{
    const float whitePoint = 11.1999998093f;

    float white =
        max(HableRaw(whitePoint, A, B, C, D, E, F), 0.0f);

    float3 mapped;

    mapped.x =
        max(HableRaw(color.x, A, B, C, D, E, F), 0.0f);

    mapped.y =
        max(HableRaw(color.y, A, B, C, D, E, F), 0.0f);

    mapped.z =
        max(HableRaw(color.z, A, B, C, D, E, F), 0.0f);

    return mapped * outputScale / white;
}


// -----------------------------------------------------------------------------
// Mode 1: log-domain filmic path
// -----------------------------------------------------------------------------

static const float3x3 LOG_INSET_MATRIX =
{
    0.8424790502f, 0.0784336030f, 0.0792237446f,
    0.0423282422f, 0.8784686327f, 0.0791661292f,
    0.0423756540f, 0.0784336030f, 0.8791429996f
};

static const float3x3 LOG_OUTSET_MATRIX =
{
     1.1968790293f, -0.0980208814f, -0.0990297422f,
    -0.0528968535f,  1.1519031525f, -0.0989611745f,
    -0.0529716350f, -0.0980434492f,  1.1510736942f
};

float SignedPow(float x, float p)
{
    if (x == 0.0f)
        return 0.0f;

    return (x > 0.0f ? 1.0f : -1.0f) * pow(abs(x), p);
}

float PolynomialToneCurve(float x)
{
    float x2 = x * x;
    float x3 = x2 * x;
    float x4 = x2 * x2;

    return
          x4 * (
              15.5f * x2
            + 31.9599990845f
            - 40.1399993896f * x)
        - 6.8680000305f * x3
        + 0.4298000038f * x2
        + 0.1190999970f * x
        - 0.00231999997f;
}

float ParametricToneCurve(
    float x,
    float scale,
    float highPower,
    float lowPower,
    float lowShoulder,
    float pivot)
{
    float highBase = (1.0f - pivot) * scale;
    float highShape = SignedPow(2.0f * highBase, highPower) - 1.0f;
    float highNorm = SignedPow(
        SignedPow(highBase, -highPower) * highShape,
        -1.0f / highPower);

    float lowBase = pivot * scale;
    float lowShape = SignedPow(2.0f * lowBase, lowPower) - 1.0f;
    float lowNorm = SignedPow(
        SignedPow(lowBase, -lowPower) * lowShape,
        -1.0f / lowPower);
    lowNorm *= (1.0f - lowShoulder);

    if (x >= pivot)
    {
        float u = (x - pivot) * scale / highNorm;
        float shaped = SignedPow(u, highPower);
        float denominator = SignedPow(shaped + 1.0f, 1.0f / highPower);
        return highNorm * (u / denominator) + 0.5f;
    }

    float u = (x - pivot) * scale / (-lowNorm);
    float shaped = SignedPow(u, lowPower);
    float denominator = SignedPow(shaped + 1.0f, 1.0f / lowPower);
    return -(lowNorm * (u / denominator)) + 0.5f;
}

float3 ApplyLogDomainToneMap(
    float3 color,
    float3 postCurveScale,
    float saturation,
    float3 postCurvePower,
    float logRangeScale,
    float curveScale,
    float highPower,
    float lowPower,
    float lowShoulder,
    float pivot,
    bool useParametricCurve,
    bool enableHighlightExtension,
    float vanillaBendBlend)
{
    // Inset / formation space.
    float3 inset =
        mul(LOG_INSET_MATRIX, color);

    // Log-domain normalization range.
    float logMin =
        log(logRangeScale * (1.0f / 1024.0f));

    float logMax =
        log(logRangeScale * 90.5096664429f);

    float3 logColor =
        log(inset);

    if (enableHighlightExtension)
    {
        // Preserve the lower log bound while allowing normalized values above 1.
        logColor = max(logColor, logMin.xxx);
    }
    else
    {
        logColor = clamp(logColor, logMin.xxx, logMax.xxx);
    }

    float3 normalized =
        (logColor - logMin)
        / (logMax - logMin);

    float3 curved;
    if (enableHighlightExtension)
    {
        curved = AgxApplyExtendedToneCurve(
            normalized,
            inset,
            logMin,
            logMax - logMin,
            postCurveScale,
            postCurvePower,
            float4(curveScale, lowPower, lowShoulder, pivot),
            highPower,
            useParametricCurve,
            vanillaBendBlend);
    }
    else if (useParametricCurve)
    {
        curved = float3(
            ParametricToneCurve(normalized.r, curveScale, highPower, lowPower, lowShoulder, pivot),
            ParametricToneCurve(normalized.g, curveScale, highPower, lowPower, lowShoulder, pivot),
            ParametricToneCurve(normalized.b, curveScale, highPower, lowPower, lowShoulder, pivot));
    }
    else
    {
        curved = float3(
            PolynomialToneCurve(normalized.r),
            PolynomialToneCurve(normalized.g),
            PolynomialToneCurve(normalized.b));
    }

    if (!enableHighlightExtension)
    {
        // Preserve the current Vanilla per-channel scale and power path.
        curved *= postCurveScale;
        curved = Pow3(curved, postCurvePower);
    }

    // Saturation around linear BT.709 luminance.
    const float3 luminanceWeights =
        float3(
            0.2126729041f,
            0.7151522040f,
            0.0721750036f);

    float luminance =
        dot(curved, luminanceWeights);

    curved =
        luminance.xxx
        + (curved - luminance.xxx) * saturation;

    curved =
        max(curved, 0.0f);

    // Return from inset space.
    float3 outColor =
        mul(LOG_OUTSET_MATRIX, curved);

    // Exact floor and power from the DXIL.
    outColor =
        max(outColor, 0.0000999999975f);

    outColor =
        pow(outColor, 2.2000000477f);

    return outColor;
}


// -----------------------------------------------------------------------------
// Main
// -----------------------------------------------------------------------------

float4 ps_main(PSInput input) : SV_Target0
{
    int2 pixel =
        int2(input.position.xy);

    // -------------------------------------------------------------------------
    // Relevant cbuffer aliases.
    // -------------------------------------------------------------------------

    const float4 C4  = gCustom[4];
    float4 C7  = gCustom[7];
    float4 C8  = gCustom[8];
    float4 C16 = gCustom[16];
    float4 C19 = gCustom[19];
    bool useParametricCurve = gShared[221].w > 0.0f;
    if ((uint)C4.x == 1u)
    {
        AgxModifyCurveParameters(
            C7, C8, C16, C19, useParametricCurve,
            RENODX_TONE_MAP_TYPE == 2.0f
                && PRISM_BLACK_FLOOR < 1.0f);
    }

    // C4:
    //   x = tone-map mode
    //       0 = Hable/rational
    //       1 = log-domain filmic
    //       2 = passthrough
    //   y = minimum exposure texture value
    //   z = maximum exposure texture value
    //
    // C7:
    //   mode 0:
    //     x = Hable A
    //     y = Hable B
    //     z = Hable C
    //
    //   mode 1:
    //     xyz = post-curve RGB scale
    //     w   = saturation
    //
    // C8:
    //   mode 0:
    //     x = Hable D
    //     y = Hable E
    //     z = Hable F
    //
    //   mode 1:
    //     xyz = per-channel post-curve power
    //     w   = log-range scale
    //
    // C16:
    //   x = exposure reference scale
    //   y = Hable output scale
    //   z = exposure/adaptation exponent
    //   w = log-domain high-side curve exponent
    //
    // C19:
    //   x = log-domain curve scale
    //   y = log-domain low-side exponent
    //   z = low-side shoulder factor
    //   w = curve pivot
    //
    // gShared[221].w:
    //   > 0 selects the parametric log-domain curve.
    //   <= 0 selects the fixed polynomial curve.

    // -------------------------------------------------------------------------
    // Exposure.
    // -------------------------------------------------------------------------

    float exposureSample =
        gExposure.Load(int3(0, 0, 0)).r;

    float3 source =
        gSource.Load(int3(pixel, 0)).rgb;

    float exposureScale =
        ComputeExposureScale(
            exposureSample,
            C16.x,
            C16.z,
            C4.y,
            C4.z);

    float userExposureScale = RENODX_TONE_MAP_TYPE != 0.0f
        ? RENODX_TONE_MAP_EXPOSURE
        : 1.0f;
    const float totalExposureScale = exposureScale * userExposureScale;

    float3 exposed = source * totalExposureScale;

    // Output alpha is calculated before tone mapping.
    const float3 bt709Luma =
        float3(
            0.2125999928f,
            0.7152000070f,
            0.0722000003f);

    float outputAlpha =
        abs(dot(exposed, bt709Luma));

    const AgxToneCurveSettings agxCurve = {
        C7.xyz,
        C8.xyz,
        C7.w,
        C8.w,
        C19.x,
        C16.w,
        C19.y,
        C19.z,
        C19.w,
        useParametricCurve,
        shader_injection.agx_vanilla_bend,
    };

    uint mode = (uint)C4.x;
    float3 outputColor;

#if 0
    outputColor = exposed;
    return float4(outputColor, outputAlpha);
#endif

    if (RENODX_TONE_MAP_TYPE == 2.0f)
    {
        const bool hasInflectionMatch = false;
        float matchedAnchorIn = 0.18f;
        float matchedAnchorOut = 0.18f;
        float matchedSlopeScale = 1.0f;

        outputColor = ApplyPrismGradingForCurrentOutput(
            exposed,
            agxCurve,
            mode == 1u,
            matchedAnchorIn,
            matchedAnchorOut,
            matchedSlopeScale);
        outputAlpha = abs(dot(exposed, bt709Luma));
        if (mode == 1u)
        {
            outputColor = AgxDrawCurveValues(
                outputColor, input.position.xy, float2(10.0f, 10.0f), 'A',
                gCustom[7], gCustom[8], gCustom[16], gCustom[19],
                C7, C8, C16, C19, gShared[221].w > 0.0f, useParametricCurve,
                int4(7, 8, 16, 19),
                hasInflectionMatch,
                1.0f,
                log2(max(matchedAnchorIn, 0.000001f) / 0.18f),
                matchedSlopeScale);
        }
        return float4(outputColor, outputAlpha);
    }

    if (mode == 2u)
    {
        // Exposure-adjusted passthrough.
        outputColor = exposed;
    }
    else if (mode == 1u)
    {
        bool enableHighlightExtension =
            RENODX_TONE_MAP_TYPE == 1.0f;

        outputColor =
            ApplyLogDomainToneMap(
                exposed,

                // postCurveScale
                C7.xyz,

                // saturation
                C7.w,

                // postCurvePower
                C8.xyz,

                // logRangeScale
                C8.w,

                // curveScale
                C19.x,

                // highPower
                C16.w,

                // lowPower
                C19.y,

                // lowShoulder
                C19.z,

                // pivot
                C19.w,

                useParametricCurve,
                enableHighlightExtension,
                shader_injection.agx_vanilla_bend);
    }
    else
    {
        // Default / mode 0:
        // normalized Hable-style rational curve.

        outputColor =
            ApplyHableNormalized(
                exposed,
                C7.x,  // A
                C7.y,  // B
                C7.z,  // C
                C8.x,  // D
                C8.y,  // E
                C8.z,  // F
                C16.y);
    }

    if (mode == 1u)
    {
        outputColor = AgxDrawCurveValues(
            outputColor, input.position.xy, float2(10.0f, 10.0f), 'A',
            gCustom[7], gCustom[8], gCustom[16], gCustom[19],
            C7, C8, C16, C19, gShared[221].w > 0.0f, useParametricCurve,
            int4(7, 8, 16, 19), false, 1.0f, 0.0f, 1.0f);
    }
    return float4(
        outputColor,
        outputAlpha);
}


// Compatibility entry point for shader replacement systems that compile
// explicitly with -E main.
float4 main(PSInput input) : SV_Target0
{
    return ps_main(input);
}
