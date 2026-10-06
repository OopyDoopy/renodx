#ifndef THEWITCHER3REMASTERED_TONEMAP_AGX_TONEMAP_HLSLI_
#define THEWITCHER3REMASTERED_TONEMAP_AGX_TONEMAP_HLSLI_

#include "../shared.h"
#if 0
#include "../../../shaders/canvas.hlsl"
#endif

#ifndef AGX_SHOW_CURVE_VALUES
#define AGX_SHOW_CURVE_VALUES shader_injection.custom_debug_show_agx_curve_values
#endif

void AgxModifyCurveParameters(
    inout float4 scaleSat,
    inout float4 powerLog,
    inout float4 exposure,
    inout float4 curve,
    inout bool useParametricCurve,
    bool useCustomAgxParameters)
{
    if (RENODX_TONE_MAP_TYPE != 0.0f && useCustomAgxParameters)
    {
        // Experiment here. Exposure xyz remains the game's exposure setup.
        scaleSat.xyz = scaleSat.xyz; // Post-curve RGB scale.
        scaleSat.w = scaleSat.w;     // Saturation.
        powerLog.xyz = powerLog.xyz; // Post-curve RGB power.
        powerLog.w = powerLog.w;     // Log-range scale.
        exposure.w = exposure.w;     // High-side power.
        curve.x = curve.x;           // Curve scale.
        curve.y = curve.y;           // Low-side power.
        curve.z = curve.z;           // Low shoulder.

        // float safeLogRangeScale = max(powerLog.w, 0.000001f);
        // float logMinimum = log(safeLogRangeScale / 1024.0f);
        // float logMaximum = log(safeLogRangeScale * 90.5096664429f);
        // float linearPivot = 0.20f;
        // float normalizedPivot = saturate(
        //     (log(linearPivot) - logMinimum) / (logMaximum - logMinimum));
        // curve.w = min(curve.w, normalizedPivot); // Cap pivot at linear input 0.20.
        curve.w = curve.w;
        useParametricCurve = useParametricCurve;
    }
}

#if 0
void AgxDrawCurveValueRow(
    inout renodx::canvas::Context ctx,
    int parameterIndex,
    float3 original,
    float3 modified,
    int componentCount)
{
    renodx::canvas::SetColor(ctx, 0x7ec8e3, 1.0f, 1.0f);
    if (parameterIndex == 0) renodx::canvas::DrawText(ctx, 's', 'c', 'a', 'l', 'e', 'S', 'a', 't', '.', 'x', 'y', 'z');
    else if (parameterIndex == 1) renodx::canvas::DrawText(ctx, 's', 'c', 'a', 'l', 'e', 'S', 'a', 't', '.', 'w');
    else if (parameterIndex == 2) renodx::canvas::DrawText(ctx, 'p', 'o', 'w', 'e', 'r', 'L', 'o', 'g', '.', 'x', 'y', 'z');
    else if (parameterIndex == 3) renodx::canvas::DrawText(ctx, 'p', 'o', 'w', 'e', 'r', 'L', 'o', 'g', '.', 'w');
    else if (parameterIndex == 4) renodx::canvas::DrawText(ctx, 'e', 'x', 'p', 'o', 's', 'u', 'r', 'e', '.', 'w');
    else if (parameterIndex == 5) renodx::canvas::DrawText(ctx, 'c', 'u', 'r', 'v', 'e', '.', 'x');
    else if (parameterIndex == 6) renodx::canvas::DrawText(ctx, 'c', 'u', 'r', 'v', 'e', '.', 'y');
    else if (parameterIndex == 7) renodx::canvas::DrawText(ctx, 'c', 'u', 'r', 'v', 'e', '.', 'z');
    else if (parameterIndex == 8) renodx::canvas::DrawText(ctx, 'c', 'u', 'r', 'v', 'e', '.', 'w');
    else
    {
        renodx::canvas::DrawText(ctx, 'u', 's', 'e', 'P', 'a', 'r', 'a', 'm', 'e', 't', 'r', 'i', 'c');
        renodx::canvas::DrawText(ctx, 'C', 'u', 'r', 'v', 'e');
    }
    renodx::canvas::InsertSpace(ctx);
    renodx::canvas::SetColor(ctx, 0xffffff, 1.0f, 1.0f);
    renodx::canvas::DrawText(ctx, 'O', ':');
    for (int component = 0; component < componentCount; ++component)
    {
        renodx::canvas::DrawFloat(ctx, original[component], 0.0f, 3.0f);
        renodx::canvas::InsertSpace(ctx);
    }
    renodx::canvas::SetColor(ctx, 0x3df58f, 1.0f, 1.0f);
    renodx::canvas::DrawText(ctx, 'M', ':');
    for (int component = 0; component < componentCount; ++component)
    {
        renodx::canvas::DrawFloat(ctx, modified[component], 0.0f, 3.0f);
        renodx::canvas::InsertSpace(ctx);
    }
    renodx::canvas::NewLine(ctx);
}
#endif

float3 AgxDrawCurveValues(
    float3 color, float2 position, float2 origin, int passLabel,
    float4 originalScaleSat, float4 originalPowerLog,
    float4 originalExposure, float4 originalCurve,
    float4 scaleSat, float4 powerLog, float4 exposure, float4 curve,
    bool originalParametric, bool modifiedParametric,
    int4 registerIndices,
    bool hasMidgrayInflectionDistance,
    float exposureAdjustment,
    float midgrayInflectionDistanceStops,
    float matchedSlope)
{
#if 0
    if (AGX_SHOW_CURVE_VALUES != 0.0f
        && RENODX_TONE_MAP_TYPE != 0.0f
        && all(position >= origin) && all(position < origin + float2(620.0f, 190.0f)))
    {
        renodx::canvas::Context ctx = renodx::canvas::CreateContext(
            position, origin + 8.0f, float2(8.0f, 12.0f), color,
            1.0f, 1.0f.xxx, 1.0f, 1.0f, renodx::canvas::MODE_NORMAL, 0.0f, 1.15f);
        renodx::canvas::SetColor(ctx, 0x101418, 0.96f, 1.0f);
        renodx::canvas::FillRect(ctx, origin, origin + float2(620.0f, 190.0f));
        renodx::canvas::SetColor(ctx, 0xffffff, 1.0f, 1.0f);
        renodx::canvas::DrawText(ctx, 'A', 'G', 'X', ' ', passLabel, ' ', 'O', '/', 'M');
        renodx::canvas::NewLine(ctx);
        AgxDrawCurveValueRow(ctx, 0, originalScaleSat.xyz, scaleSat.xyz, 3);
        AgxDrawCurveValueRow(ctx, 1, originalScaleSat.www, scaleSat.www, 1);
        AgxDrawCurveValueRow(ctx, 2, originalPowerLog.xyz, powerLog.xyz, 3);
        AgxDrawCurveValueRow(ctx, 3, originalPowerLog.www, powerLog.www, 1);
        AgxDrawCurveValueRow(ctx, 4, originalExposure.www, exposure.www, 1);
        AgxDrawCurveValueRow(ctx, 5, originalCurve.xxx, curve.xxx, 1);
        AgxDrawCurveValueRow(ctx, 6, originalCurve.yyy, curve.yyy, 1);
        AgxDrawCurveValueRow(ctx, 7, originalCurve.zzz, curve.zzz, 1);
        AgxDrawCurveValueRow(ctx, 8, originalCurve.www, curve.www, 1);
        AgxDrawCurveValueRow(ctx, 9,
            (originalParametric ? 1.0f : 0.0f).xxx,
            (modifiedParametric ? 1.0f : 0.0f).xxx, 1);
        if (hasMidgrayInflectionDistance)
        {
            renodx::canvas::SetColor(ctx, 0xf5a97f, 1.0f, 1.0f);
            renodx::canvas::DrawText(ctx, 'E', 'X', 'P', ' ', 'X', ':');
            renodx::canvas::InsertSpace(ctx);
            renodx::canvas::DrawFloat(ctx, exposureAdjustment, 0.0f, 3.0f);
            renodx::canvas::NewLine(ctx);
            renodx::canvas::DrawText(ctx, 'S', 'L', 'O', 'P', 'E', ':');
            renodx::canvas::InsertSpace(ctx);
            renodx::canvas::DrawFloat(ctx, matchedSlope, 0.0f, 2.0f);
            renodx::canvas::NewLine(ctx);
            renodx::canvas::DrawText(ctx, 'M', 'G', ' ', 'T', 'O', ' ', 'I', 'N', 'F', ':');
            renodx::canvas::InsertSpace(ctx);
            renodx::canvas::DrawFloat(ctx, midgrayInflectionDistanceStops, 0.0f, 2.0f);
            renodx::canvas::InsertSpace(ctx);
            renodx::canvas::DrawText(ctx, 'S', 'T', 'O', 'P', 'S');
        }
        return ctx.output_color;
    }
#endif
    return color;
}

struct AgxToneCurveSettings {
    float3 post_curve_scale;
    float3 post_curve_power;
    float saturation;
    float log_range_scale;
    float curve_scale;
    float high_power;
    float low_power;
    float low_shoulder;
    float pivot;
    bool use_parametric_curve;
    float vanilla_bend_blend;
};

float AgxSignedPower(float x, float power)
{
    if (x == 0.0f)
    {
        return 0.0f;
    }

    return (x > 0.0f ? 1.0f : -1.0f) * pow(abs(x), power);
}

float AgxPolynomialToneCurve(float x)
{
    float x2 = x * x;
    float x3 = x2 * x;
    float x4 = x2 * x2;

    return x4 * (15.5f * x2 + 31.9599990845f - 40.1399993896f * x)
        + 0.1190999970f * x
        - 0.00231999997f
        + 0.4298000038f * x2
        - 6.8680000305f * x3;
}

float AgxPolynomialToneCurveSlope(float x)
{
    float x2 = x * x;
    float x3 = x2 * x;
    float x4 = x2 * x2;
    float x5 = x4 * x;

    return (((((93.0f * x5) - (200.6999969482f * x4))
        + (127.8399963379f * x3)) - (20.6040000916f * x2))
        + (0.8596000075f * x)) + 0.119099997f;
}

float2 AgxFindPolynomialInflectionAndSlope()
{
    // Main positive-to-negative curvature crossing of the fixed polynomial.
    const float inflection = 0.62240456f;
    return float2(inflection, AgxPolynomialToneCurveSlope(inflection));
}

float2 AgxFindToneCurveInflectionAndSlope(
    bool useParametricCurve,
    float4 curveParams)
{
    return useParametricCurve
        ? float2(curveParams.w, curveParams.x)
        : AgxFindPolynomialInflectionAndSlope();
}

float AgxToneCurveInflectionInput(
    float logRangeScale,
    bool useParametricCurve,
    float4 curveParams,
    float exposureScale)
{
    float2 inflection = AgxFindToneCurveInflectionAndSlope(
        useParametricCurve,
        curveParams);
    float safeLogRangeScale = max(logRangeScale, 0.000001f);
    float logMinimum = log(safeLogRangeScale / 1024.0f);
    float logMaximum = log(safeLogRangeScale * 90.5096664429f);
    float inflectionInput = exp(
        logMinimum + inflection.x * (logMaximum - logMinimum));
    return inflectionInput * exposureScale;
}

float AgxParametricToneCurve(
    float x,
    float scale,
    float lowPower,
    float lowShoulder,
    float pivot,
    float highPower)
{
    float highBase = (1.0f - pivot) * scale;
    float highA = AgxSignedPower(2.0f * highBase, highPower) - 1.0f;
    float highB = AgxSignedPower(highBase, -highPower) * highA;
    float highNorm = AgxSignedPower(highB, -1.0f / highPower);

    float lowBase = pivot * scale;
    float lowA = AgxSignedPower(2.0f * lowBase, lowPower) - 1.0f;
    float lowB = AgxSignedPower(lowBase, -lowPower) * lowA;
    float lowNorm = AgxSignedPower(lowB, -1.0f / lowPower);
    lowNorm *= (1.0f - lowShoulder);

    if (x >= pivot)
    {
        float u = (x - pivot) * scale / highNorm;
        float shaped = AgxSignedPower(u, highPower);
        float denominator = AgxSignedPower(shaped + 1.0f, 1.0f / highPower);
        return highNorm * (u / denominator) + 0.5f;
    }

    float u = (x - pivot) * scale / (-lowNorm);
    float shaped = AgxSignedPower(u, lowPower);
    float denominator = AgxSignedPower(shaped + 1.0f, 1.0f / lowPower);
    return -(lowNorm * (u / denominator)) + 0.5f;
}

float AgxEvaluateBoundedToneCurve(
    float x,
    bool useParametricCurve,
    float4 curveParams,
    float highPower)
{
    float vanillaInput = min(x, 1.0f);
    return useParametricCurve
        ? AgxParametricToneCurve(
            vanillaInput,
            curveParams.x,
            curveParams.y,
            curveParams.z,
            curveParams.w,
            highPower)
        : AgxPolynomialToneCurve(vanillaInput);
}

float AgxToneCurveSlope(
    float x,
    bool useParametricCurve,
    float4 curveParams,
    float highPower)
{
    return useParametricCurve
        ? curveParams.x
        : AgxPolynomialToneCurveSlope(x);
}

float AgxExtendToneCurveLinear(
    float normalizedLogInput,
    float linearInput,
    float logMinimum,
    float logRange,
    float postCurveScale,
    float postCurvePower,
    bool useParametricCurve,
    float4 curveParams,
    float highPower,
    float2 anchor,
    float vanillaBendBlend)
{
    float vanillaCurve = AgxEvaluateBoundedToneCurve(
        normalizedLogInput, useParametricCurve, curveParams, highPower);
    float vanillaShaped = pow(max(vanillaCurve * postCurveScale, 0.0f), postCurvePower);

    float pivotLinearInput = exp(logMinimum + anchor.x * logRange);
    if (linearInput <= pivotLinearInput)
    {
        return vanillaShaped;
    }

    float pivotCurve = AgxEvaluateBoundedToneCurve(
        anchor.x, useParametricCurve, curveParams, highPower);
    float pivotBeforePower = max(pivotCurve * postCurveScale, 0.0f);
    float pivotOutput = pow(pivotBeforePower, postCurvePower);

    // Convert d(curve)/d(normalized log input) to a linear-light tangent.
    // d(normalized log input)/d(linear input) = 1 / (linear input * log range).
    float curveSlope = AgxToneCurveSlope(
        anchor.x, useParametricCurve, curveParams, highPower);
    float shoulderlessCurve = pivotCurve
        + curveSlope * (normalizedLogInput - anchor.x);
    float shoulderlessShaped = pow(
        max(shoulderlessCurve * postCurveScale, 0.0f),
        postCurvePower);

    float outputSlope = postCurvePower
        * postCurveScale
        * curveSlope
        * pow(max(pivotBeforePower, 1.0e-6f), postCurvePower - 1.0f)
        / (pivotLinearInput * logRange);
    float linearTangent = pivotOutput + outputSlope * (linearInput - pivotLinearInput);

    // Match Control Resonant: blend the linear-light tangent back toward the
    // shoulderless AgX continuation, not toward a curve clamped at SDR white.
    float shoulderBlend = saturate(vanillaBendBlend) * 0.792f;
    return lerp(linearTangent, shoulderlessShaped, shoulderBlend);
}

float3 AgxApplyExtendedToneCurve(
    float3 normalizedLogInput,
    float3 linearInput,
    float logMinimum,
    float logRange,
    float3 postCurveScale,
    float3 postCurvePower,
    float4 curveParams,
    float highPower,
    bool useParametricCurve,
    float vanillaBendBlend)
{
    float2 anchor = useParametricCurve
        ? float2(curveParams.w, curveParams.x)
        : AgxFindPolynomialInflectionAndSlope();

    return float3(
        AgxExtendToneCurveLinear(
            normalizedLogInput.r, linearInput.r, logMinimum, logRange,
            postCurveScale.r, postCurvePower.r, useParametricCurve,
            curveParams, highPower, anchor, vanillaBendBlend),
        AgxExtendToneCurveLinear(
            normalizedLogInput.g, linearInput.g, logMinimum, logRange,
            postCurveScale.g, postCurvePower.g, useParametricCurve,
            curveParams, highPower, anchor, vanillaBendBlend),
        AgxExtendToneCurveLinear(
            normalizedLogInput.b, linearInput.b, logMinimum, logRange,
            postCurveScale.b, postCurvePower.b, useParametricCurve,
            curveParams, highPower, anchor, vanillaBendBlend));
}

float3 AgxApplyExtendedToneCurveOnly(
    float3 color,
    AgxToneCurveSettings settings)
{
    float safeLogRangeScale = max(settings.log_range_scale, 0.000001f);
    float logMinimum = log(safeLogRangeScale * (1.0f / 1024.0f));
    float logMaximum = log(safeLogRangeScale * 90.5096664429f);
    float3 curveInput = max(color, exp(logMinimum).xxx);
    float3 normalizedLogInput =
        (log(curveInput) - logMinimum) / (logMaximum - logMinimum);

    float3 curveOutput = AgxApplyExtendedToneCurve(
        normalizedLogInput,
        curveInput,
        logMinimum,
        logMaximum - logMinimum,
        settings.post_curve_scale,
        settings.post_curve_power,
        float4(
            settings.curve_scale,
            settings.low_power,
            settings.low_shoulder,
            settings.pivot),
        settings.high_power,
        settings.use_parametric_curve,
        settings.vanilla_bend_blend);

    return pow(max(curveOutput, 0.0001f.xxx), 2.2000000477f);
}

static const float3x3 AGX_MATCH_INSET_MATRIX = float3x3(
    0.8424790502f, 0.0784336030f, 0.0792237446f,
    0.0423282422f, 0.8784686327f, 0.0791661292f,
    0.0423756540f, 0.0784336030f, 0.8791429996f);

static const float3x3 AGX_MATCH_OUTSET_MATRIX = float3x3(
     1.1968790293f, -0.0980208814f, -0.0990297422f,
    -0.0528968535f,  1.1519031525f, -0.0989611745f,
    -0.0529716350f, -0.0980434492f,  1.1510736942f);

float AgxApplyVanillaToneCurveOnly(
    float linear_input,
    AgxToneCurveSettings settings)
{
    const float3 input = linear_input.xxx;
    const float3 inset = mul(AGX_MATCH_INSET_MATRIX, input);
    const float logMinimum = log(max(settings.log_range_scale, 0.000001f) / 1024.0f);
    const float logMaximum = log(max(settings.log_range_scale, 0.000001f) * 90.5096664429f);
    const float3 normalized = (clamp(log(inset), logMinimum.xxx, logMaximum.xxx) - logMinimum)
        / (logMaximum - logMinimum);
    float3 curve;
    if (settings.use_parametric_curve)
    {
        curve = float3(
            AgxParametricToneCurve(
                normalized.r, settings.curve_scale, settings.low_power,
                settings.low_shoulder, settings.pivot, settings.high_power),
            AgxParametricToneCurve(
                normalized.g, settings.curve_scale, settings.low_power,
                settings.low_shoulder, settings.pivot, settings.high_power),
            AgxParametricToneCurve(
                normalized.b, settings.curve_scale, settings.low_power,
                settings.low_shoulder, settings.pivot, settings.high_power));
    }
    else
    {
        curve = float3(
            AgxPolynomialToneCurve(normalized.r),
            AgxPolynomialToneCurve(normalized.g),
            AgxPolynomialToneCurve(normalized.b));
    }

    curve = pow(max(curve * settings.post_curve_scale, 0.0f.xxx), settings.post_curve_power);
    const float luminance = dot(
        curve,
        float3(0.2126729041f, 0.7151522040f, 0.0721750036f));
    curve = max(luminance.xxx + (curve - luminance.xxx) * settings.saturation, 0.0f.xxx);
    const float3 outputColor = pow(
        max(mul(AGX_MATCH_OUTSET_MATRIX, curve), 0.0001f.xxx),
        2.2000000477f);
    return dot(outputColor, float3(0.2126729041f, 0.7151522040f, 0.0721750036f));
}

float3 AgxGetInflectionAndContrastScale(AgxToneCurveSettings settings)
{
    const float safeLogRangeScale = max(settings.log_range_scale, 0.000001f);
    const float logMinimum = log(safeLogRangeScale / 1024.0f);
    const float logMaximum = log(safeLogRangeScale * 90.5096664429f);
    const float logRange = logMaximum - logMinimum;
    const float2 inflection = AgxFindToneCurveInflectionAndSlope(
        settings.use_parametric_curve,
        float4(
            settings.curve_scale,
            settings.low_power,
            settings.low_shoulder,
            settings.pivot));
    const float linearInflectionInput = exp(logMinimum + inflection.x * logRange);
    const float insetLuminance = dot(
        mul(AGX_MATCH_INSET_MATRIX, 1.0f.xxx),
        float3(0.2126729041f, 0.7151522040f, 0.0721750036f));
    const float inflectionInput = linearInflectionInput / insetLuminance;
    // Prism's inflection match uses the unextended vanilla AgX curve; the experimental shoulder is intentionally excluded.
    const float inflectionOutput = AgxApplyVanillaToneCurveOnly(inflectionInput, settings);
    // Use only toe-side samples, including the game's final 2.2 power.
    const float slopeStep = inflectionInput * (1.0f - exp2(-0.015625f));
    const float toeOutputNear = AgxApplyVanillaToneCurveOnly(
        inflectionInput - slopeStep, settings);
    const float toeOutputFar = AgxApplyVanillaToneCurveOnly(
        inflectionInput - 2.0f * slopeStep, settings);
    const float normalSlope = max(
        (3.0f * inflectionOutput - 4.0f * toeOutputNear + toeOutputFar)
            / (2.0f * slopeStep),
        0.000001f);
    const float contrastScale = inflectionInput * normalSlope
        / max(inflectionOutput, 0.000001f);

    return float3(inflectionInput, inflectionOutput, contrastScale);
}

#endif  // THEWITCHER3REMASTERED_TONEMAP_AGX_TONEMAP_HLSLI_