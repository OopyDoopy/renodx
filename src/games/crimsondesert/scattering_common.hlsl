#ifndef MB_BANNERLORD_SCATTERING_COMMON_HLSL_
#define MB_BANNERLORD_SCATTERING_COMMON_HLSL_

#include "psycho_test11.hlsl"

// ============================================================================
// MODE 1 — Rayleigh LMS  (Patry, Ghost of Tsushima, SIGGRAPH 2020)
// ============================================================================
// Hunt-Pointer-Estévez chromatic adaptation transform.
// Rayleigh scattering coefficient per LMS cone fundamental (λ^-4 weighting).
static const float3 RAYLEIGH_LMS = float3(
    0.2390,  // L — long wavelength, least scattered
    0.3210,  // M — medium wavelength
    1.0000   // S — short wavelength, most scattered
);

static const float3x3 RGB_TO_LMS = float3x3(
    0.4122214708, 0.5363325363, 0.0514459929,
    0.2119034982, 0.6806995451, 0.1073969566,
    0.0883024619, 0.2817188376, 0.6299787005
);

static const float3x3 LMS_TO_RGB = float3x3(
     4.0767416621, -3.3077115913,  0.2309699292,
    -1.2684380046,  2.6097574011, -0.3413193965,
    -0.0041960863, -0.7034186147,  1.7076147010
);

// Multi-scatter energy compensation (Bruneton 2008 / Hillaire 2020 approximation).
// Higher-order bounces redistribute energy isotropically and spectrally neutrally.
// The geometric series F_ms = 1 / (1 - <ω₀> * <phase_avg>) uses the MEAN
// scattering albedo across all channels — NOT per-channel — because scattered
// light mixes across all wavelengths after the first bounce.
static const float MULTI_SCATTER_PHASE_AVG = 0.25;

float RayleighMultiScatterFactor(float3 beta) {
    // Mean scattering albedo: average of per-channel β (normalized to strongest)
    float meanOmega0 = dot(beta, float3(0.333, 0.333, 0.334)) / max(beta.z, 0.0001);
    // Geometric series: uniform scalar boost for all channels
    return 1.0 / max(1.0 - meanOmega0 * MULTI_SCATTER_PHASE_AVG, 0.01);
}

float3 ApplyRayleighLMS(float3 color, float opticalDepth) {
    float3 lms = mul(RGB_TO_LMS, color);
    float3 transmittance = exp(-opticalDepth * RAYLEIGH_LMS);
    lms *= transmittance;
    return max(mul(LMS_TO_RGB, lms), 0.0);
}

float3 RayleighInscatterLMS(float3 scatterColor, float phaseValue, float opticalDepth) {
    float3 lms = mul(RGB_TO_LMS, scatterColor);
    float3 beta = RAYLEIGH_LMS;
    float3 extinction = exp(-opticalDepth * beta);
    float3 inscatter = lms * phaseValue * (1.0 - extinction) / max(beta, 0.0001);

    // Multi-scatter compensation: re-inject blue energy lost to higher-order bounces
    inscatter *= RayleighMultiScatterFactor(beta);

    return max(mul(LMS_TO_RGB, inscatter), 0.0);
}

// ============================================================================
// MODE 2 — Psycho LMS  (Stockman-Sharp fundamentals + BT.2020 gamut compress)
// ============================================================================
// Uses Stockman-Sharp LMS cone fundamentals (more modern than HPE) and routes
// through BT.2020 as intermediate gamut. Gamut compression via MacLeod-Boynton
// chromaticity ensures no out-of-gamut negatives after extinction.
//
// Rayleigh β coefficients re-derived for Stockman-Sharp peak wavelengths:
//   L ~565nm → β_L ∝ 565^-4 = 0.0983e-8 (normalized: 0.212)
//   M ~540nm → β_M ∝ 540^-4 = 0.1176e-8 (normalized: 0.254)
//   S ~440nm → β_S ∝ 440^-4 = 0.4630e-8 (normalized: 1.000)
static const float3 RAYLEIGH_STOCKMAN = float3(
    0.2120,  // L — 565nm, least scattered
    0.2540,  // M — 540nm
    1.0000   // S — 440nm, most scattered
);

float3 ApplyPsychoLMS(float3 colorBT709, float opticalDepth) {
    // BT.709 → BT.2020 → Stockman-Sharp LMS
    float3 bt2020 = psycho11_BT2020FromBT709(colorBT709);
    float3 lms = psycho11_LMSFromBT2020(bt2020);

    // Per-channel Rayleigh extinction in Stockman-Sharp LMS
    float3 transmittance = exp(-opticalDepth * RAYLEIGH_STOCKMAN);
    lms *= transmittance;

    // BT.2020 gamut compression (adds white to pull negatives into gamut)
    lms = psycho11_GamutCompressAddWhiteBT2020Bounded(lms);

    // LMS → BT.2020 → BT.709
    float3 bt2020Out = psycho11_BT2020FromLMS(lms);
    return max(psycho11_BT709FromBT2020(bt2020Out), 0.0);
}

float3 PsychoInscatterLMS(float3 scatterColorBT709, float phaseValue, float opticalDepth) {
    float3 bt2020 = psycho11_BT2020FromBT709(scatterColorBT709);
    float3 lms = psycho11_LMSFromBT2020(bt2020);

    float3 beta = RAYLEIGH_STOCKMAN;
    float3 extinction = exp(-opticalDepth * beta);
    float3 inscatter = lms * phaseValue * (1.0 - extinction) / max(beta, 0.0001);

    // Multi-scatter compensation: re-inject blue energy lost to higher-order bounces
    inscatter *= RayleighMultiScatterFactor(beta);

    inscatter = psycho11_GamutCompressAddWhiteBT2020Bounded(inscatter);

    float3 bt2020Out = psycho11_BT2020FromLMS(inscatter);
    return max(psycho11_BT709FromBT2020(bt2020Out), 0.0);
}

#endif  // MB_BANNERLORD_SCATTERING_COMMON_HLSL_
