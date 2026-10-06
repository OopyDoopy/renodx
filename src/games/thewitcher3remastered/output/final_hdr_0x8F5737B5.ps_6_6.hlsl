// Reconstructed from 0x8F5737B5.ps_6_6.ll
//
// Pixel shader model: ps_6_6
//
// Notes:
// - Resource bindings and cbuffer byte layouts are preserved.
// - The original symbol names for CustomPixelConsts members were not present in
//   the DXIL, so the cbuffer is intentionally kept as float4 arrays.
// - Meaningful aliases are created in main() and the repeated compiler-expanded
//   math has been restored to helper functions.
// - SharedPixelConsts is 5456 bytes = 341 float4 registers. This shader only
//   reads register 221.w.
//
// High-level pass:
//   1. Read two color inputs.
//   2. Optional color-vision-deficiency correction.
//   3. Power-domain conversion and alpha composite.
//   4. Optional third-texture region composite.
//   5. Hable or log-domain tone processing.
//   6. BT.709 -> BT.2020 conversion + configurable 3x3 grade.
//   7. Optional luminance-dependent highlight gain.
//   8. PQ encode to SV_Target0.
//   9. Write the earlier composite to SV_Target1.

Texture2D<float4> gTexture0 : register(t0);
Texture2D<float4> gTexture1 : register(t1);
Texture2D<float4> gTexture2 : register(t2);

SamplerState gSampler : register(s1);

cbuffer CustomPixelConsts : register(b3)
{
    float4 gCustom[25]; // 400 bytes
};

cbuffer SharedPixelConsts : register(b12)
{
    float4 gShared[341]; // 5456 bytes
};

struct PSInput
{
    float4 position : SV_Position;
    float2 texcoord : TEXCOORD0;
};

struct PSOutput
{
    float4 target0 : SV_Target0;
    float4 target1 : SV_Target1;
};

#include "../shared.h"
#include "./final_hdr_pass.hlsli"
#include "./lilium_rcas.hlsl"

// -----------------------------------------------------------------------------
// Utility helpers
// -----------------------------------------------------------------------------

float SignedPow(float x, float p)
{
    if (x == 0.0f)
        return 0.0f;

    return (x > 0.0f ? 1.0f : -1.0f) * pow(abs(x), p);
}

float3 Pow3(float3 x, float p)
{
    return float3(pow(x.x, p), pow(x.y, p), pow(x.z, p));
}

// -----------------------------------------------------------------------------
// Accessibility / color-vision-deficiency correction
// -----------------------------------------------------------------------------

static const float3x3 CVD_RGB_TO_LMS =
{
    17.8824005127f, 43.5161018372f,  4.1193499565f,
     3.4556500912f, 27.1553993225f,  3.8671400547f,
     0.0299565997f,  0.1843090057f,  1.4670900106f
};

static const float3x3 CVD_LMS_TO_RGB =
{
     0.0809444487f, -0.1305044144f,  0.1167210639f,
    -0.0102485335f,  0.0540193282f, -0.1136147082f,
    -0.0003652969f, -0.0041216146f,  0.6935114264f
};

float3 ApplyColorVisionCorrection(float3 rgb, float4 params)
{
    const uint  deficiencyMode = (uint)params.x;
    const float postContrast   = params.y;
    const float postOffset     = params.z;
    const float strength       = params.w;

    if (strength <= 0.0f)
        return rgb;

    // Pre-adjustment visible in the DXIL.
    float3 adjusted =
        (rgb - 0.5f) * (1.0f + 0.1120000035f * strength)
        + (0.5f - 0.0750000030f * strength);

    float3 lms = mul(CVD_RGB_TO_LMS, adjusted);

    // Simulated dichromacy.
    if (deficiencyMode == 0u)
    {
        // Protan-like path: replace L.
        lms.x = 2.0234398842f * lms.y
              - 2.5281000137f * lms.z;
    }
    else if (deficiencyMode == 1u)
    {
        // Deutan-like path: replace M.
        lms.y = 0.4942069948f * lms.x
              + 1.2482700348f * lms.z;
    }
    else if (deficiencyMode == 2u)
    {
        // Tritan-like path: replace S.
        lms.z = 0.8011090159f * lms.y
              - 0.3959130049f * lms.x;
    }

    float3 simulatedRGB = mul(CVD_LMS_TO_RGB, lms);
    float3 error = adjusted - simulatedRGB;

    // This is the exact redistribution present in the compiled shader.
    float3 corrected;
    // Red is left at the adjusted source value. The simulated color error is
    // redistributed into green and blue (the classic daltonization pattern).
    corrected.r = adjusted.r;
    corrected.g = adjusted.g + error.g + 0.7f * error.r;
    corrected.b = adjusted.b + error.b + 0.7f * error.r;

    corrected = saturate(corrected);

    float3 mixed = lerp(adjusted, corrected, strength);

    // Final contrast / offset stage.
    mixed = (mixed - 0.5f) * (1.0f + postContrast)
          + (postOffset + 0.5f + 0.0799999982f * strength);

    return mixed;
}


// -----------------------------------------------------------------------------
// Hable / Uncharted 2 style tone curve
// -----------------------------------------------------------------------------

float HableRaw(float x, float A, float B, float C, float D, float E, float F)
{
    return ((x * (A * x + C * B) + D * E)
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

    float white = max(HableRaw(whitePoint, A, B, C, D, E, F), 0.0f);

    float3 mapped;
    mapped.x = max(HableRaw(color.x, A, B, C, D, E, F), 0.0f);
    mapped.y = max(HableRaw(color.y, A, B, C, D, E, F), 0.0f);
    mapped.z = max(HableRaw(color.z, A, B, C, D, E, F), 0.0f);

    mapped *= outputScale;
    mapped /= white;

    return mapped;
}


// -----------------------------------------------------------------------------
// Alternate log-domain tone path
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

float PolynomialToneCurve(float x)
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

float ParametricToneCurve(
    float x,
    float scale,
    float lowPower,
    float lowShoulder,
    float pivot,
    float highPower)
{
    float highBase = (1.0f - pivot) * scale;
    float highA = SignedPow(2.0f * highBase, highPower) - 1.0f;
    float highB = SignedPow(highBase, -highPower) * highA;
    float highNorm = SignedPow(highB, -1.0f / highPower);

    float lowBase = pivot * scale;
    float lowA = SignedPow(2.0f * lowBase, lowPower) - 1.0f;
    float lowB = SignedPow(lowBase, -lowPower) * lowA;
    float lowNorm = SignedPow(lowB, -1.0f / lowPower);
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
    float saturationAmount,
    float3 postCurvePower,
    float logRangeScale,
    float4 curveParams,
    float highPower,
    bool useParametricCurve)
{
    float3 inset = mul(LOG_INSET_MATRIX, color);

    float logMin = log(logRangeScale * (1.0f / 1024.0f));
    float logMax = log(logRangeScale * 90.5096664429f);

    float3 logColor = log(inset);
    logColor = clamp(logColor, logMin.xxx, logMax.xxx);

    float3 x = (logColor - logMin) / (logMax - logMin);
    float3 curved;
    if (useParametricCurve)
    {
        curved = float3(
            ParametricToneCurve(x.r, curveParams.x, curveParams.y, curveParams.z, curveParams.w, highPower),
            ParametricToneCurve(x.g, curveParams.x, curveParams.y, curveParams.z, curveParams.w, highPower),
            ParametricToneCurve(x.b, curveParams.x, curveParams.y, curveParams.z, curveParams.w, highPower));
    }
    else
    {
        curved = float3(
            PolynomialToneCurve(x.r),
            PolynomialToneCurve(x.g),
            PolynomialToneCurve(x.b));
    }

    curved *= postCurveScale;

    curved.x = pow(curved.x, postCurvePower.x);
    curved.y = pow(curved.y, postCurvePower.y);
    curved.z = pow(curved.z, postCurvePower.z);

    const float3 luminanceWeights =
        float3(0.2126729041f, 0.7151522040f, 0.0721750036f);

    float luminance = dot(curved, luminanceWeights);

    curved = luminance.xxx
           + (curved - luminance.xxx) * saturationAmount;

    curved = max(curved, 0.0f);

    float3 outColor = mul(LOG_OUTSET_MATRIX, curved);

    // The compiled shader clamps before the fixed 2.2 power.
    outColor = max(outColor, 0.0000999999975f);
    outColor = Pow3(outColor, 2.2000000477f);

    return outColor;
}


// -----------------------------------------------------------------------------
// BT.709 -> BT.2020 and configurable matrix grade
// -----------------------------------------------------------------------------

float3 ApplyColorMatrixGrade(
    float3 color709,
    float3 row0,
    float3 row1,
    float3 row2,
    float blendAmount)
{
    float3 color2020 = renodx::color::bt2020::from::BT709(color709);

    // Vanilla+ uses the game color transform only; bypass the optional
    // cbuffer-driven final 3x3 grade in this path.
    if (RENODX_TONE_MAP_TYPE != 0.0f)
        return color2020;

    float3 graded;
    graded.x = dot(row0, color2020);
    graded.y = dot(row1, color2020);
    graded.z = dot(row2, color2020);

    graded = saturate(graded);

    return lerp(color2020, graded, blendAmount);
}


// -----------------------------------------------------------------------------
// Luminance-dependent gain curve
// -----------------------------------------------------------------------------

float ComputeAdaptiveGainWeight(
    float normalizedAmount,
    float exponent,
    float anchorValue,
    float maxValue)
{
    float anchorPow = pow(anchorValue, exponent);

    float k =
        (maxValue - anchorPow)
        / ((1.0f - anchorPow) * maxValue);

    float oneMinusK = 1.0f - k;

    float xPow = pow(normalizedAmount, exponent);

    return xPow / (oneMinusK + xPow * k);
}


// -----------------------------------------------------------------------------
// ST.2084 / PQ encoding
// -----------------------------------------------------------------------------

float3 PQEncode(float3 linearNitsScaled)
{
    // The source multiplies by 1e-4 immediately before the ST.2084 curve,
    // therefore its input here is in a 0..10000-relative scale.
    const float m1 = 0.1593017578125f; // 2610 / 16384
    const float m2 = 78.84375f;        // 2523 / 32
    const float c1 = 0.8359375f;       // 3424 / 4096
    const float c2 = 18.8515625f;      // 2413 / 128
    const float c3 = 18.6875f;         // 2392 / 128

    float3 x = linearNitsScaled * 0.0001f;
    float3 xm1 = Pow3(x, m1);

    float3 pq =
        Pow3((c1.xxx + c2 * xm1) / (1.0f.xxx + c3 * xm1), m2);

    return saturate(pq);
}


// -----------------------------------------------------------------------------
// Main
// -----------------------------------------------------------------------------

PSOutput ps_main(PSInput input)
{
    PSOutput output;

    // -------------------------------------------------------------------------
    // CustomPixelConsts aliases.
    // Names are inferred from use because the original member annotations are
    // absent from the DXIL.
    // -------------------------------------------------------------------------

    const float4 C0  = gCustom[0];
    const float4 C1  = gCustom[1];
    const float4 C2  = gCustom[2];
    const float4 C3  = gCustom[3];
    const float4 C4  = gCustom[4];
    const float4 C5  = gCustom[5];
    const float4 C6  = gCustom[6];
    const float4 C7  = gCustom[7];
    const float4 C8  = gCustom[8];
    const float4 C9  = gCustom[9];
    const float4 C10 = gCustom[10];
    const float4 C11 = gCustom[11];
    const float4 C12 = gCustom[12];
    const float4 C13 = gCustom[13];
    const float4 C14 = gCustom[14];
    const float4 C15 = gCustom[15];
    const float4 C16 = gCustom[16];
    const float4 C17 = gCustom[17];

    const bool useParametricToneCurve = gShared[221].w > 0.0f;

    // C0:
    //   x = final linear output scale
    //   z = BT.2020 color-matrix blend
    //   w = final linear clamp / peak
    //
    // C1:
    //   xy = integer-load viewport origin
    //   z  = optional region-texture amount / enable
    //
    // C2:
    //   x = input power
    //   z = secondary-output power
    //   w = adaptive-gain threshold
    //
    // C3:
    //   xy = optional region origin
    //   zw = optional region size
    //
    // C4/C5/C6.xyz = configurable 3x3 grade matrix rows
    //
    // C7:
    //   x = adaptive-gain enable
    //   y = region-texture scale
    //   z = adaptive-gain reference level
    //   w = tone-map mode (0 = Hable, 1 = log-domain)
    //
    // C17 = accessibility/CVD parameters.

    int2 loadPixel =
        int2(input.position.xy - C1.xy);

    float4 loadColor = gTexture1.Load(int3(loadPixel, 0));
    float4 sampledColor = gTexture0.SampleLevel(gSampler, input.texcoord, 0.0f);

    // Optional accessibility correction is applied independently to both color
    // sources and leaves alpha untouched.
    if (C17.w > 0.0f)
    {
        loadColor.rgb    = ApplyColorVisionCorrection(loadColor.rgb, C17);
        sampledColor.rgb = ApplyColorVisionCorrection(sampledColor.rgb, C17);
    }

    // Power-domain conversion.
    // The upgraded grading pass can encode out-of-BT.709 channels as signed
    // gamma values. Decode those with the matching signed transfer function.
    float3 loadLinear = float3(
        SignedPow(loadColor.r, C2.x),
        SignedPow(loadColor.g, C2.x),
        SignedPow(loadColor.b, C2.x));
    float3 sampledLinear = float3(
        SignedPow(sampledColor.r, C2.x),
        SignedPow(sampledColor.g, C2.x),
        SignedPow(sampledColor.b, C2.x));

    // Original alpha composite written to SV_Target1 later.
    float3 earlyComposite =
        sampledLinear + (loadLinear - sampledLinear) * loadColor.a;

    float earlyAlpha =
        sampledColor.a
        + (loadColor.a - sampledColor.a) * loadColor.a;

    float4 secondaryOutput = float4(
        SignedPow(earlyComposite.r, C2.z),
        SignedPow(earlyComposite.g, C2.z),
        SignedPow(earlyComposite.b, C2.z),
        pow(earlyAlpha, C2.z));

    // Sharpen the scene source for the final color path without changing the
    // separate secondary output above.
    sampledLinear = ApplyRCAS(
        sampledLinear,
        input.texcoord,
        gTexture0,
        gSampler);

    // The sampled source is dimmed underneath the loaded source as its alpha
    // increases. Exact coefficient from the DXIL.
    float underlayDim =
        1.0f - 0.6699999571f * saturate(loadColor.a * 2.0f);

    float3 baseColor = sampledLinear * underlayDim;

    // -------------------------------------------------------------------------
    // Optional third texture inside a screen-space rectangle.
    // -------------------------------------------------------------------------

    float brightnessMetric;
    bool shouldCompositeLoadColor;
    float3 workingColor;

    bool regionEnabled = C1.z > 0.0f;

    float2 pixel = float2(loadPixel);

    bool insideRegion =
           pixel.x >= C3.x
        && pixel.y >= C3.y
        && pixel.x <  C3.x + C3.z
        && pixel.y <  C3.y + C3.w;

    if (regionEnabled && insideRegion)
    {
        float2 regionUV =
            (pixel - C3.xy) / C3.zw;

        float3 regionColor =
            gTexture2.SampleLevel(gSampler, regionUV, 0.0f).rgb * C7.y;

        brightnessMetric =
            abs(dot(regionColor, float3(
                0.2125999928f,
                0.7152000070f,
                0.0722000003f)));

        uint toneMode = (uint)C7.w;

        float3 toneMappedRegion;

        if (toneMode == 0u)
        {
            toneMappedRegion = ApplyHableNormalized(
                regionColor,
                C13.x, C13.y, C13.z,
                C14.x, C14.y, C14.z,
                0.7599999905f);
        }
        else if (toneMode == 1u)
        {
            toneMappedRegion = ApplyLogDomainToneMap(
                regionColor,
                C13.xyz,
                C13.w,
                C14.xyz,
                C14.w,
                C15,
                C16.x,
                useParametricToneCurve);
        }
        else
        {
            // The original DXIL leaves this path undefined. A pass-through
            // fallback is used here only to keep the decompile deterministic.
            toneMappedRegion = regionColor;
        }

        // Exact ordering from the compiled shader:
        // scale -> input power -> blend against the dimmed underlay.
        toneMappedRegion *= C1.z;
        toneMappedRegion = Pow3(toneMappedRegion, C2.x);

        workingColor =
            lerp(baseColor, toneMappedRegion, C1.z);

        shouldCompositeLoadColor = false;
    }
    else
    {
        brightnessMetric = sampledColor.a;
        workingColor = baseColor;
        shouldCompositeLoadColor = true;
    }

    // -------------------------------------------------------------------------
    // Convert to BT.2020 and apply the configurable 3x3 grade.
    // -------------------------------------------------------------------------

    float3 gradeRow0 = C4.xyz;
    float3 gradeRow1 = C5.xyz;
    float3 gradeRow2 = C6.xyz;

    float3 gradedWorking =
        ApplyColorMatrixGrade(
            workingColor,
            gradeRow0,
            gradeRow1,
            gradeRow2,
            C0.z);

    float3 gradedLoad =
        ApplyColorMatrixGrade(
            loadLinear,
            gradeRow0,
            gradeRow1,
            gradeRow2,
            C0.z);

    // -------------------------------------------------------------------------
    // Optional luminance-dependent highlight gain.
    // -------------------------------------------------------------------------

    // Inverse tone mapping is an optional Vanilla-only highlight expansion.
    if (RENODX_TONE_MAP_TYPE == 0.0f
        && CUSTOM_INVERSE_TONE_MAP > 0.0f
        && C7.x > 0.0f
        && brightnessMetric > C2.w)
    {
        float normalizedAmount =
            saturate(
                (brightnessMetric - C2.w)
                / (C7.z - C2.w));

        uint toneMode = (uint)C7.w;

        float toneReference = 1.0f;

        if (toneMode == 0u)
        {
            float3 referenceColor = C7.z.xxx;

            float3 mappedReference = ApplyHableNormalized(
                referenceColor,
                C9.x, C9.y, C9.z,
                C10.x, C10.y, C10.z,
                1.0f);

            toneReference = mappedReference.x;
        }
        else if (toneMode == 1u)
        {
            float3 mappedReference = ApplyLogDomainToneMap(
                C7.z.xxx,
                C9.xyz,
                C9.w,
                C10.xyz,
                C10.w,
                C11,
                C12.x,
                useParametricToneCurve);

            toneReference =
                (mappedReference.x
               + mappedReference.y
               + mappedReference.z) * (1.0f / 3.0f);
        }

        float requiredGain =
            C0.w / (toneReference * C0.x);

        float gainWeight = ComputeAdaptiveGainWeight(
            normalizedAmount,
            C8.x,
            C8.z,
            C8.w);

        float gain =
            1.0f + gainWeight * (requiredGain - 1.0f);

        gradedWorking *= gain;
    }

    // Film grain is generated in linear BT.709 and applied after scene grading,
    // but before the final output pass's tone mapping and UI composition.
    float3 gradedWorkingBt709 = renodx::color::bt709::from::BT2020(gradedWorking);
    gradedWorkingBt709 = renodx::effects::ApplyFilmGrain(
        gradedWorkingBt709,
        input.texcoord,
        CUSTOM_RANDOM,
        CUSTOM_FILM_GRAIN_STRENGTH * 0.03f);
    gradedWorking = renodx::color::bt2020::from::BT709(gradedWorkingBt709);

    // If the region texture did not replace the normal composite, blend the
    // loaded source over the graded working color using its alpha.
    float3 finalLinear2020 = gradedWorking;
    float finalAlpha = 1.0f;

    if (shouldCompositeLoadColor)
    {
        if (RENODX_TONE_MAP_TYPE == 0.0f)
        {
            finalLinear2020 =
                lerp(gradedWorking, gradedLoad, loadColor.a);
        }

        // Exact alpha expression in the DXIL:
        // 1 + a * (a - 1)
        finalAlpha =
            1.0f + loadColor.a * (loadColor.a - 1.0f);
    }

    // -------------------------------------------------------------------------
    // Non-Vanilla output uses RenoDX game/UI whites and the legacy gamma-space
    // UI composite. Keep the original constants and encoding for Vanilla.
    // -------------------------------------------------------------------------

    if (RENODX_TONE_MAP_TYPE != 0.0f)
    {
        output.target0 = TheWitcher3RemasteredFinalHDRPass(
            gradedWorking,
            gradedLoad,
            loadColor.a,
            shouldCompositeLoadColor,
            finalAlpha,
            C13.xyz,
            C13.w,
            C14.xyz,
            C14.w,
            C15,
            C16.x,
            useParametricToneCurve);
    }
    else
    {
        float3 gamutCompressedFinal =
            renodx::color::gamut::GamutCompressBT2020(finalLinear2020);
        float3 scaled =
            min(gamutCompressedFinal * C0.x, C0.w.xxx);

        output.target0 =
            float4(PQEncode(scaled), finalAlpha);
    }

    output.target1 =
        secondaryOutput;

    return output;
}

// Compatibility entry point.
// The DXIL names the original entry function "ps_main", but some shader
// replacement/injection compile paths invoke DXC with the default entry point
// "main". Keeping both makes the file usable in either case.
PSOutput main(PSInput input)
{
    return ps_main(input);
}

