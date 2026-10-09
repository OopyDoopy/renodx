// Corrected reconstruction of 0x724E225F.ps_6_6.ll
// Shader model: ps_6_6
// Original DXIL entry point: ps_main
//
// This shader evaluates TWO independent tone-map passes from the same
// source/exposure texture, then blends the COMPLETED pass results using C13.x.
//
// Important corrections from the prior rewrite:
//   1. Exposure is read from t1.Load(int3(0, 0, 0)), matching the original DXIL.
//      There is no per-pixel exposure lookup through gShared[287].
//   2. Mode 0 is ONLY normalized Hable.
//   3. Mode 2 is ONLY exposure-adjusted passthrough.
//   4. The log/AgX scale -> power -> saturation -> outset -> 2.2 stage belongs
//      ONLY to mode 1.
//   5. Both tone-map passes independently use the extended AgX path when
//      RENODX_TONE_MAP_TYPE == 1, using each pass's own parameters.
//   6. Pass A and Pass B are blended only AFTER each pass has fully completed.
//   7. RenoDX tone-map type 2 independently Prism-maps both exposed passes,
//      then blends them using the original pass blend.
//
// Pass A:
//   mode / exposure clamp : C4
//   curve scale+saturation: C7
//   power+log range       : C8
//   exposure/high power   : C16
//   curve parameters      : C19
//
// Pass B:
//   mode / exposure clamp : C9
//   curve scale+saturation: C11
//   power+log range       : C12
//   exposure/high power   : C17
//   curve parameters      : C20
//
// Final blend:
//   C13.x

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
    const float whitePoint = 11.1999998093f;

    float reference =
        exposureReferenceScale * whitePoint;

    float exposure =
        clamp(exposureSample, exposureMin, exposureMax);

    exposure =
        max(exposure, 0.0000999999975f);

    float adapted =
        reference
        * pow(exposure / reference, exposureExponent);

    return exposureReferenceScale / adapted;
}


// -----------------------------------------------------------------------------
// Mode 0: Hable / rational filmic
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
// Mode 1: log-domain / AgX-like filmic path
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
    float highBase =
        (1.0f - pivot) * scale;

    float highShape =
        SignedPow(2.0f * highBase, highPower) - 1.0f;

    float highNorm =
        SignedPow(
            SignedPow(highBase, -highPower) * highShape,
            -1.0f / highPower);

    float lowBase =
        pivot * scale;

    float lowShape =
        SignedPow(2.0f * lowBase, lowPower) - 1.0f;

    float lowNorm =
        SignedPow(
            SignedPow(lowBase, -lowPower) * lowShape,
            -1.0f / lowPower);

    lowNorm *=
        (1.0f - lowShoulder);

    if (x >= pivot)
    {
        float u =
            (x - pivot) * scale / highNorm;

        float shaped =
            SignedPow(u, highPower);

        float denominator =
            SignedPow(
                shaped + 1.0f,
                1.0f / highPower);

        return highNorm * (u / denominator) + 0.5f;
    }

    float u =
        (x - pivot) * scale / (-lowNorm);

    float shaped =
        SignedPow(u, lowPower);

    float denominator =
        SignedPow(
            shaped + 1.0f,
            1.0f / lowPower);

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
    // -------------------------------------------------------------------------
    // Formation / inset space
    // -------------------------------------------------------------------------

    float3 inset =
        mul(LOG_INSET_MATRIX, color);

    float logMin =
        log(logRangeScale * (1.0f / 1024.0f));

    float logMax =
        log(logRangeScale * 90.5096664429f);

    float3 logColor =
        log(inset);

    if (enableHighlightExtension)
    {
        // Keep the original lower boundary, but deliberately do not clamp
        // highlights to logMax so the extended curve can operate above 1.
        logColor =
            max(logColor, logMin.xxx);
    }
    else
    {
        logColor =
            clamp(logColor, logMin.xxx, logMax.xxx);
    }

    float3 normalized =
        (logColor - logMin)
        / (logMax - logMin);

    // -------------------------------------------------------------------------
    // Tone curve
    // -------------------------------------------------------------------------

    float3 curved;

    if (enableHighlightExtension)
    {
        // IMPORTANT:
        // This function performs the extended curve plus the Vanilla
        // per-channel postCurveScale/postCurvePower shaping internally.
        //
        // Because ApplyLogDomainToneMap is called independently for both
        // passes, BOTH Pass A and Pass B receive their own extension before
        // the final C13.x blend.
        curved =
            AgxApplyExtendedToneCurve(
                normalized,
                inset,
                logMin,
                logMax - logMin,
                postCurveScale,
                postCurvePower,
                float4(
                    curveScale,
                    lowPower,
                    lowShoulder,
                    pivot),
                highPower,
                useParametricCurve,
                vanillaBendBlend);
    }
    else if (useParametricCurve)
    {
        curved =
            float3(
                ParametricToneCurve(
                    normalized.r,
                    curveScale,
                    highPower,
                    lowPower,
                    lowShoulder,
                    pivot),

                ParametricToneCurve(
                    normalized.g,
                    curveScale,
                    highPower,
                    lowPower,
                    lowShoulder,
                    pivot),

                ParametricToneCurve(
                    normalized.b,
                    curveScale,
                    highPower,
                    lowPower,
                    lowShoulder,
                    pivot));
    }
    else
    {
        curved =
            float3(
                PolynomialToneCurve(normalized.r),
                PolynomialToneCurve(normalized.g),
                PolynomialToneCurve(normalized.b));
    }

    if (!enableHighlightExtension)
    {
        // Exact Vanilla mode-1 shaping.
        curved *=
            postCurveScale;

        curved =
            Pow3(curved, postCurvePower);
    }

    // -------------------------------------------------------------------------
    // Mode-1-only saturation / outset / fixed 2.2 output power
    // -------------------------------------------------------------------------

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

    float3 outColor =
        mul(LOG_OUTSET_MATRIX, curved);

    outColor =
        max(outColor, 0.0000999999975f);

    outColor =
        pow(outColor, 2.2000000477f);

    return outColor;
}


// -----------------------------------------------------------------------------
// One complete game tone-map pass
// -----------------------------------------------------------------------------

float3 ApplyGameToneMap(
    float3 exposed,
    uint mode,
    float4 curveScaleAndSaturation,
    float4 curvePowerAndLogRange,
    float4 exposureAndHighPower,
    float4 curveParameters,
    bool useParametricCurve,
    bool enableHighlightExtension,
    float vanillaBendBlend)
{
    // Mode 2: exact exposure-adjusted passthrough.
    //
    // Do NOT run this through the mode-1 scale/power/saturation/outset stage.
    if (mode == 2u)
    {
        return exposed;
    }

    // Mode 1: full log-domain / AgX path.
    if (mode == 1u)
    {
        return
            ApplyLogDomainToneMap(
                exposed,

                // postCurveScale
                curveScaleAndSaturation.xyz,

                // saturation
                curveScaleAndSaturation.w,

                // postCurvePower
                curvePowerAndLogRange.xyz,

                // logRangeScale
                curvePowerAndLogRange.w,

                // curveScale
                curveParameters.x,

                // highPower
                exposureAndHighPower.w,

                // lowPower
                curveParameters.y,

                // lowShoulder
                curveParameters.z,

                // pivot
                curveParameters.w,

                useParametricCurve,
                enableHighlightExtension,
                vanillaBendBlend);
    }

    // Mode 0/default: exact normalized Hable path.
    //
    // Do NOT run Hable through the mode-1 saturation/outset/2.2 stage.
    return
        ApplyHableNormalized(
            exposed,

            // A, B, C
            curveScaleAndSaturation.x,
            curveScaleAndSaturation.y,
            curveScaleAndSaturation.z,

            // D, E, F
            curvePowerAndLogRange.x,
            curvePowerAndLogRange.y,
            curvePowerAndLogRange.z,

            // Hable output scale
            exposureAndHighPower.y);
}

float ComputeVanillaTonemapPeak(
    uint mode,
    float4 curveScaleAndSaturation,
    float4 curvePowerAndLogRange,
    float4 exposureAndHighPower,
    float4 curveParameters,
    bool useParametricCurve)
{
    if (mode == 2u)
    {
        // Passthrough has no finite output ceiling.
        return 0.0f;
    }

    if (mode == 1u)
    {
        float maximumInput = max(curvePowerAndLogRange.w * 90.5096664429f, 1.0e-6f);
        float logMin = log(curvePowerAndLogRange.w * (1.0f / 1024.0f));
        float logMax = log(curvePowerAndLogRange.w * 90.5096664429f);
        float normalized = saturate(
            (clamp(log(maximumInput), logMin, logMax) - logMin)
            / (logMax - logMin));
        float curved = useParametricCurve
            ? ParametricToneCurve(
                normalized,
                curveParameters.x,
                exposureAndHighPower.w,
                curveParameters.y,
                curveParameters.z,
                curveParameters.w)
            : PolynomialToneCurve(normalized);
        curved = pow(
            max(curved * curveScaleAndSaturation.x, 0.0f),
            curvePowerAndLogRange.x);
        return pow(max(curved, 0.0000999999975f), 2.2000000477f);
    }

    float A = curveScaleAndSaturation.x;
    float B = curveScaleAndSaturation.y;
    float C = curveScaleAndSaturation.z;
    float D = curvePowerAndLogRange.x;
    float E = curvePowerAndLogRange.y;
    float F = curvePowerAndLogRange.z;
    float white = max(HableRaw(11.1999998093f, A, B, C, D, E, F), 1.0e-6f);
    float asymptote = max(1.0f - E / F, 0.0f);
    return max(asymptote * exposureAndHighPower.y / white, 0.0f);
}

float BlendVanillaTonemapPeaks(float peakA, float peakB, float blend)
{
    if (blend == 0.0f) return peakA;
    if (blend == 1.0f) return peakB;
    if (peakA <= 0.0f || peakB <= 0.0f) return 0.0f;
    return max(lerp(peakA, peakB, blend), 0.0f);
}


// -----------------------------------------------------------------------------
// Main
// -----------------------------------------------------------------------------

float4 ps_main(PSInput input) : SV_Target0
{
    const int2 pixel =
        int2(input.position.xy);

    // Original DXIL reads the exposure texture ONCE at (0, 0).
    const float exposureSample =
        gExposure.Load(int3(0, 0, 0)).r;

    float3 source =
        gSource.Load(int3(pixel, 0)).rgb;


    // -------------------------------------------------------------------------
    // Pass A parameters
    // -------------------------------------------------------------------------

    const float4 A_ModeExposure = gCustom[4];
    float4 A_ScaleSat     = gCustom[7];
    float4 A_PowerLog     = gCustom[8];
    float4 A_Exposure     = gCustom[16];
    float4 A_Curve        = gCustom[19];


    // -------------------------------------------------------------------------
    // Pass B parameters
    // -------------------------------------------------------------------------

    const float4 B_ModeExposure = gCustom[9];
    float4 B_ScaleSat     = gCustom[11];
    float4 B_PowerLog     = gCustom[12];
    float4 B_Exposure     = gCustom[17];
    float4 B_Curve        = gCustom[20];
    bool useParametricCurveA = gShared[221].w > 0.0f;
    bool useParametricCurveB = useParametricCurveA;
    float vanillaTonemapPeakA = 0.0f;
    float vanillaTonemapPeakB = 0.0f;
    if (RENODX_TONE_MAP_TYPE >= 1.0f && all(pixel == 0))
    {
        vanillaTonemapPeakA = ComputeVanillaTonemapPeak(
            (uint)A_ModeExposure.x,
            A_ScaleSat,
            A_PowerLog,
            A_Exposure,
            A_Curve,
            useParametricCurveA);
        vanillaTonemapPeakB = ComputeVanillaTonemapPeak(
            (uint)B_ModeExposure.x,
            B_ScaleSat,
            B_PowerLog,
            B_Exposure,
            B_Curve,
            useParametricCurveB);
    }
    if ((uint)A_ModeExposure.x == 1u)
    {
        AgxModifyCurveParameters(
            A_ScaleSat, A_PowerLog, A_Exposure, A_Curve, useParametricCurveA,
            RENODX_TONE_MAP_TYPE == 2.0f
                && PRISM_BLACK_FLOOR < 1.0f);
    }
    if ((uint)B_ModeExposure.x == 1u)
    {
        AgxModifyCurveParameters(
            B_ScaleSat, B_PowerLog, B_Exposure, B_Curve, useParametricCurveB,
            RENODX_TONE_MAP_TYPE == 2.0f
                && PRISM_BLACK_FLOOR < 1.0f);
    }
    if (RENODX_TONE_MAP_TYPE < 2.0f)
    {
        if ((uint)A_ModeExposure.x == 1u)
        {
            AgxApplyBlackFloor(
                A_Curve.z,
                A_ScaleSat.xyz,
                A_PowerLog.xyz,
                A_Curve.x,
                A_Curve.y,
                A_Curve.w,
                useParametricCurveA,
                LAST_IS_HDR ? max(RENODX_DIFFUSE_WHITE_NITS, 0.000001f) : 100.0f);
        }
        if ((uint)B_ModeExposure.x == 1u)
        {
            AgxApplyBlackFloor(
                B_Curve.z,
                B_ScaleSat.xyz,
                B_PowerLog.xyz,
                B_Curve.x,
                B_Curve.y,
                B_Curve.w,
                useParametricCurveB,
                LAST_IS_HDR ? max(RENODX_DIFFUSE_WHITE_NITS, 0.000001f) : 100.0f);
        }
    }


    // -------------------------------------------------------------------------
    // Independent exposure calculations
    // -------------------------------------------------------------------------

    float exposureScaleA =
        ComputeExposureScale(
            exposureSample,
            A_Exposure.x,
            A_Exposure.z,
            A_ModeExposure.y,
            A_ModeExposure.z);

    float exposureScaleB =
        ComputeExposureScale(
            exposureSample,
            B_Exposure.x,
            B_Exposure.z,
            B_ModeExposure.y,
            B_ModeExposure.z);

    float userExposureScale = RENODX_TONE_MAP_TYPE != 0.0f
        ? RENODX_TONE_MAP_EXPOSURE
        : 1.0f;
    float totalExposureScaleA = exposureScaleA * userExposureScale;
    float totalExposureScaleB = exposureScaleB * userExposureScale;

    float3 exposedA = source * totalExposureScaleA;
    float3 exposedB = source * totalExposureScaleB;

    const float3 bt709Luma =
        float3(
            0.2125999928f,
            0.7152000070f,
            0.0722000003f);
    float alphaA = abs(dot(exposedA, bt709Luma));
    float alphaB = abs(dot(exposedB, bt709Luma));
    float vanillaTonemapPeak = BlendVanillaTonemapPeaks(
        vanillaTonemapPeakA,
        vanillaTonemapPeakB,
        gCustom[13].x);

    const AgxToneCurveSettings agxCurveA = {
        A_ScaleSat.xyz,
        A_PowerLog.xyz,
        A_ScaleSat.w,
        A_PowerLog.w,
        A_Curve.x,
        A_Exposure.w,
        A_Curve.y,
        A_Curve.z,
        A_Curve.w,
        useParametricCurveA,
        shader_injection.agx_vanilla_bend,
    };
    const AgxToneCurveSettings agxCurveB = {
        B_ScaleSat.xyz,
        B_PowerLog.xyz,
        B_ScaleSat.w,
        B_PowerLog.w,
        B_Curve.x,
        B_Exposure.w,
        B_Curve.y,
        B_Curve.z,
        B_Curve.w,
        useParametricCurveB,
        shader_injection.agx_vanilla_bend,
    };

    if (RENODX_TONE_MAP_TYPE == 2.0f)
    {
        const bool hasInflectionMatchA = false;
        const bool hasInflectionMatchB = false;
        float matchedAnchorInA = 0.18f;
        float matchedAnchorOutA = 0.18f;
        float matchedAnchorInB = 0.18f;
        float matchedAnchorOutB = 0.18f;
        float matchedSlopeScaleA = 1.0f;
        float matchedSlopeScaleB = 1.0f;

        float3 prismOutputA = ApplyPrismGradingForCurrentOutput(
            exposedA,
            agxCurveA,
            (uint)A_ModeExposure.x == 1u,
            totalExposureScaleA,
            matchedAnchorInA,
            matchedAnchorOutA,
            matchedSlopeScaleA);
        float3 prismOutputB = ApplyPrismGradingForCurrentOutput(
            exposedB,
            agxCurveB,
            (uint)B_ModeExposure.x == 1u,
            totalExposureScaleB,
            matchedAnchorInB,
            matchedAnchorOutB,
            matchedSlopeScaleB);
        float prismBlend = gCustom[13].x;
        float3 prismOutput = lerp(prismOutputA, prismOutputB, prismBlend);
        if ((uint)A_ModeExposure.x == 1u)
        {
            prismOutput = AgxDrawCurveValues(
                prismOutput, input.position.xy, float2(10, 10), 'A',
                gCustom[7], gCustom[8], gCustom[16], gCustom[19],
                A_ScaleSat, A_PowerLog, A_Exposure, A_Curve,
                gShared[221].w > 0.0f, useParametricCurveA, int4(7, 8, 16, 19),
                hasInflectionMatchA, 1.0f,
                log2(max(matchedAnchorInA, 0.000001f) / 0.18f),
                matchedSlopeScaleA);
        }
        if ((uint)B_ModeExposure.x == 1u)
        {
            prismOutput = AgxDrawCurveValues(
                prismOutput, input.position.xy, float2(10, 178), 'B',
                gCustom[11], gCustom[12], gCustom[17], gCustom[20],
                B_ScaleSat, B_PowerLog, B_Exposure, B_Curve,
                gShared[221].w > 0.0f, useParametricCurveB, int4(11, 12, 17, 20),
                hasInflectionMatchB, 1.0f,
                log2(max(matchedAnchorInB, 0.000001f) / 0.18f),
                matchedSlopeScaleB);
        }
        return float4(
            prismOutput,
            EncodePostProcessingPeak(
                vanillaTonemapPeak,
                input.position,
                lerp(alphaA, alphaB, prismBlend)));
    }

    // Match each branch's grade pivot to its own AgX inflection after its
    // independent game exposure and the user exposure have been applied.
    if (RENODX_TONE_MAP_TYPE == 1.0f)
    {
        float inflectionAnchorA = AgxToneCurveInflectionInput(
            A_PowerLog.w,
            useParametricCurveA,
            A_Curve,
            totalExposureScaleA);
        float inflectionAnchorB = AgxToneCurveInflectionInput(
            B_PowerLog.w,
            useParametricCurveB,
            B_Curve,
            totalExposureScaleB);

        exposedA = ApplyVanillaPlusGrading(exposedA, inflectionAnchorA);
        exposedB = ApplyVanillaPlusGrading(exposedB, inflectionAnchorB);
    }


    // -------------------------------------------------------------------------
    // Independently tone-map BOTH passes
    // -------------------------------------------------------------------------

    const bool enableHighlightExtension =
        RENODX_TONE_MAP_TYPE == 1.0f;

    const float vanillaBendBlend =
        shader_injection.agx_vanilla_bend;


    // Pass A is fully tone-mapped/extended using Pass A's own parameters.
    float3 outputA =
        ApplyGameToneMap(
            exposedA,
            (uint)A_ModeExposure.x,
            A_ScaleSat,
            A_PowerLog,
            A_Exposure,
            A_Curve,
            useParametricCurveA,
            enableHighlightExtension,
            vanillaBendBlend);


    // Pass B is independently fully tone-mapped/extended using Pass B's
    // separate parameters.
    float3 outputB =
        ApplyGameToneMap(
            exposedB,
            (uint)B_ModeExposure.x,
            B_ScaleSat,
            B_PowerLog,
            B_Exposure,
            B_Curve,
            useParametricCurveB,
            enableHighlightExtension,
            vanillaBendBlend);


    // -------------------------------------------------------------------------
    // Blend the FINISHED pass results
    // -------------------------------------------------------------------------

    const float blend =
        gCustom[13].x;

    float3 finalRGB =
        lerp(
            outputA,
            outputB,
            blend);


    // Alpha in the original shader is the same blend applied to each pass's
    // pre-tonemap absolute BT.709 luminance.
    float finalAlpha =
        lerp(
            alphaA,
            alphaB,
            blend);


    if ((uint)A_ModeExposure.x == 1u)
    {
        finalRGB = AgxDrawCurveValues(finalRGB, input.position.xy, float2(10, 10), 'A',
            gCustom[7], gCustom[8], gCustom[16], gCustom[19],
            A_ScaleSat, A_PowerLog, A_Exposure, A_Curve,
            gShared[221].w > 0.0f, useParametricCurveA, int4(7, 8, 16, 19), false, 1.0f, 0.0f, 1.0f);
    }
    if ((uint)B_ModeExposure.x == 1u)
    {
        finalRGB = AgxDrawCurveValues(finalRGB, input.position.xy, float2(10, 178), 'B',
            gCustom[11], gCustom[12], gCustom[17], gCustom[20],
            B_ScaleSat, B_PowerLog, B_Exposure, B_Curve,
            gShared[221].w > 0.0f, useParametricCurveB, int4(11, 12, 17, 20), false, 1.0f, 0.0f, 1.0f);
    }
    return float4(
        finalRGB,
        EncodePostProcessingPeak(vanillaTonemapPeak, input.position, finalAlpha));
}


// Compatibility entry point for replacement systems that explicitly compile
// with "-E main".
float4 main(PSInput input) : SV_Target0
{
    return ps_main(input);
}
