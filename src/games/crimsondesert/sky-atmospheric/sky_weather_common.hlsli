#ifndef SRC_CRIMSONDESERT_SKY_ATMOSPHERIC_SKY_WEATHER_COMMON_HLSLI_
#define SRC_CRIMSONDESERT_SKY_ATMOSPHERIC_SKY_WEATHER_COMMON_HLSLI_

// ============================================================================
// Dawn/Dusk Weather Variation System
//
// Randomises dawn/dusk colour grading each day cycle using a seed that re-rolls
// on the night→day transition (falling edge of SceneShadowTiledNight).
//
// Colour manipulation is done by scaling individual L, M, S cone channels
// in Stockman-Sharp LMS space.
// ============================================================================

#include "../shared.h"

// ============================================================================
// Hash utilities (same pattern as aurora)
// ============================================================================

float WeatherHashInt(uint n) {
  return frac((float)n * 0.6180339887f);
}

uint WeatherSessionIndex(float seed) {
  return (uint)(seed * 65535.f);
}

// ============================================================================
// Preset table
// ============================================================================
//
// Each row: { L scale, M scale, S scale, cloud reddening strength }

static const float WEATHER_PRESETS[][4] = {
  { 1.000f, 1.000f, 1.000f, 1.00f },  //  0: Default (moderate cloud reddening)
  { 1.000f, 1.000f, 1.000f, 0.00f },  //  1: Vanilla (no cloud reddening)
  { 1.000f, 1.000f, 1.000f, 2.00f },  //  2: Strong cloud reddening, neutral LMS
  { 1.000f, 1.000f, 1.000f, 0.50f },  //  3: Subtle cloud reddening
  { 0.850f, 0.850f, 1.000f, 0.00f },  //  4: Cool desaturated (no reddening)
  { 0.900f, 0.850f, 0.850f, 0.20f },  //  5: Warm desaturated, hint of reddening
  { 0.900f, 0.850f, 1.000f, 0.00f },  //  6: Cool warm split (no reddening)
  { 1.000f, 1.000f, 1.150f, 1.00f },  //  7: Blue boost + moderate reddening
  { 0.970f, 1.000f, 1.150f, 2.40f },  //  8: Blue boost + strong reddening
  { 1.030f, 1.000f, 1.150f, 2.00f },  //  9: Warm blue boost + strong reddening
};

static const uint WEATHER_PRESET_COUNT = 10;

// ============================================================================
// Weather state
// ============================================================================

struct DawnDuskWeather {
  float L; 
  float M;  
  float S;  
  float cloudReddening;  
};

// Returns the active weather parameters for this dawn/dusk cycle.
// When CUSTOM_WEATHER_EDITING is off, returns identity (1,1,1).
// Otherwise hashes the dawn seed to pick a randomised preset.
DawnDuskWeather GetDawnDuskWeather() {
  DawnDuskWeather w;

  if (CUSTOM_WEATHER_EDITING == 0.f) {
    w.L = 1.f;
    w.M = 1.f;
    w.S = 1.f;
    w.cloudReddening = 0.f;
    return w;
  }

  // --- Randomised preset selection ---
  float seed = DAWN_DUSK_WEATHER_SEED;
  uint sessionIndex = WeatherSessionIndex(seed);

  // Pity system: no 3 consecutive identical presets
  uint raw = min((uint)(WeatherHashInt(sessionIndex + 56789u) * (float)WEATHER_PRESET_COUNT),
                 WEATHER_PRESET_COUNT - 1u);
  uint prev1 = min((uint)(WeatherHashInt(renodx::math::Select(sessionIndex > 0u, sessionIndex - 1u, 0u) + 56789u) * (float)WEATHER_PRESET_COUNT),
                   WEATHER_PRESET_COUNT - 1u);
  uint prev2 = min((uint)(WeatherHashInt(renodx::math::Select(sessionIndex > 1u, sessionIndex - 2u, 0u) + 56789u) * (float)WEATHER_PRESET_COUNT),
                   WEATHER_PRESET_COUNT - 1u);
  uint presetIndex = renodx::math::Select(
    raw == prev1 && raw == prev2 && sessionIndex > 1u,
    (raw + 1u) % WEATHER_PRESET_COUNT,
    raw);

  // --- Blend between previous and current preset ---
  // DAWN_DUSK_WEATHER_BLEND ramps 0→1 over ~5s after a seed re-roll.
  // At 1.0 (steady state), we use the current preset fully.
  // During the transition, we crossfade from the previous preset.
  float blend = saturate(DAWN_DUSK_WEATHER_BLEND);

  if (blend >= 1.f) {
    // Steady state: use current preset directly
    w.L = WEATHER_PRESETS[presetIndex][0];
    w.M = WEATHER_PRESETS[presetIndex][1];
    w.S = WEATHER_PRESETS[presetIndex][2];
    w.cloudReddening = WEATHER_PRESETS[presetIndex][3];
  } else {
    // Transitioning: look up previous preset and lerp
    uint prevSessionIndex = renodx::math::Select(sessionIndex > 0u, sessionIndex - 1u, 0u);
    uint prevRaw = min((uint)(WeatherHashInt(prevSessionIndex + 56789u) * (float)WEATHER_PRESET_COUNT),
                       WEATHER_PRESET_COUNT - 1u);
    uint prevPrev1 = min((uint)(WeatherHashInt(renodx::math::Select(prevSessionIndex > 0u, prevSessionIndex - 1u, 0u) + 56789u) * (float)WEATHER_PRESET_COUNT),
                         WEATHER_PRESET_COUNT - 1u);
    uint prevPrev2 = min((uint)(WeatherHashInt(renodx::math::Select(prevSessionIndex > 1u, prevSessionIndex - 2u, 0u) + 56789u) * (float)WEATHER_PRESET_COUNT),
                         WEATHER_PRESET_COUNT - 1u);
    uint prevPresetIndex = renodx::math::Select(
      prevRaw == prevPrev1 && prevRaw == prevPrev2 && prevSessionIndex > 1u,
      (prevRaw + 1u) % WEATHER_PRESET_COUNT,
      prevRaw);

    w.L = lerp(WEATHER_PRESETS[prevPresetIndex][0], WEATHER_PRESETS[presetIndex][0], blend);
    w.M = lerp(WEATHER_PRESETS[prevPresetIndex][1], WEATHER_PRESETS[presetIndex][1], blend);
    w.S = lerp(WEATHER_PRESETS[prevPresetIndex][2], WEATHER_PRESETS[presetIndex][2], blend);
    w.cloudReddening = lerp(WEATHER_PRESETS[prevPresetIndex][3], WEATHER_PRESETS[presetIndex][3], blend);
  }

  return w;
}

// ============================================================================
// Core LMS colour correction
// ============================================================================
//
// Scales individual L, M, S cone channels on a BT.709 linear colour.
// dawnDuskFactor interpolates between identity (1,1,1) and the weather
// scales so the effect ramps smoothly with the dawn/dusk window.

float3 WeatherColorCorrect(float3 bt709, DawnDuskWeather weather, float dawnDuskFactor) {
  if (dawnDuskFactor == 0.f) return bt709;
  if (weather.L == 1.f && weather.M == 1.f && weather.S == 1.f) return bt709;

  float3 lms = renodx::color::lms::from::BT709(bt709);

  // Interpolate scales toward identity based on dawnDuskFactor
  float3 scales = lerp(1.f, float3(weather.L, weather.M, weather.S), dawnDuskFactor);
  lms *= scales;

  float3 result = renodx::color::bt709::from::LMS(lms);
  return max(result, 0.f);
}

// ============================================================================
// Public colour manipulation functions
// ============================================================================

// --- Inscatter colour bias (internal) ---
// isProbe: true for the offscreen sky probe that feeds GI cubemap.
// Probe path is attenuated to avoid oversaturating indirect lighting.
float3 WeatherInscatterBiasInternal(float viewSunDot, float dawnDuskFactor, bool isProbe) {
  if (dawnDuskFactor == 0.f) return 1.f;

  // --- Directional warm/cool tint (always active) ---
  // Base game scattering on east and west looks very similar; this adds
  // hue differences at the horizon. Hues picked from spectral Rayleigh.
  float t = mad(viewSunDot, 0.5f, 0.5f);
  float3 warm = float3(1.044f, 1.000f, 0.965f);
  float3 cool = float3(0.958f, 1.000f, 1.035f);
  float3 baseTint = lerp(cool, warm, t);
  float baseStrength = 0.15f;
  float3 result = lerp(1.f, baseTint, dawnDuskFactor * baseStrength);

  // --- Weather LMS correction ---
  DawnDuskWeather weather = GetDawnDuskWeather();
  if (weather.L != 1.f || weather.M != 1.f || weather.S != 1.f) {
    // Full strength for visible sky, attenuated for probe that feeds GI
    float atten = renodx::math::Select(isProbe, 0.25f, 1.0f);
    result = WeatherColorCorrect(result, weather, dawnDuskFactor * t * atten);
  }

  return result;
}

// Full strength for visible sky dome shaders
float3 WeatherInscatterBias(float viewSunDot, float dawnDuskFactor) {
  return WeatherInscatterBiasInternal(viewSunDot, dawnDuskFactor, false);
}

// Attenuated for the offscreen sky probe that feeds GI
float3 WeatherInscatterBiasProbe(float viewSunDot, float dawnDuskFactor) {
  return WeatherInscatterBiasInternal(viewSunDot, dawnDuskFactor, true);
}

// --- SH warm coefficients ---
// Returns warm R/G/B multipliers for the L1 SH directional bias.
// Attenuated because SH feeds GI for the entire scene.
float3 WeatherSHWarmth(float elevBlend) {
  float warmR = lerp(1.15f, 1.05f, elevBlend);
  float warmG = lerp(1.02f, 1.00f, elevBlend);
  float warmB = lerp(0.85f, 0.95f, elevBlend);
  float3 warmth = float3(warmR, warmG, warmB);

  DawnDuskWeather weather = GetDawnDuskWeather();
  if (weather.L != 1.f || weather.M != 1.f || weather.S != 1.f) {
    float giAtten = 0.25f;
    float lowElevFactor = (1.f - elevBlend) * giAtten;
    warmth = WeatherColorCorrect(warmth, weather, lowElevFactor);
  }

  return warmth;
}

// --- Ambient warm tint ---
// Returns the warm float3 for DawnDuskAmbientBoost sun-facing surfaces.
// Attenuated because this directly tints GI on every surface.
float3 WeatherAmbientWarmth() {
  float3 warmth = float3(1.06f, 1.00f, 0.94f);

  DawnDuskWeather weather = GetDawnDuskWeather();
  if (weather.L != 1.f || weather.M != 1.f || weather.S != 1.f) {
    float giAtten = 0.25f;
    warmth = WeatherColorCorrect(warmth, weather, giAtten);
  }

  return warmth;
}

// --- Direct sunlight colour correction ---
// Applies the LMS weather correction to the direct sunlight colour.
// Uses reduced strength compared to inscatter because the direct light
// value is high energy and gets multiplied into every surface BRDF.
// Full strength LMS shift on direct light oversaturates the scene.
float3 WeatherDirectLightCorrection(float3 lightRGB, float dawnDuskFactor) {
  if (dawnDuskFactor == 0.f) return lightRGB;

  DawnDuskWeather weather = GetDawnDuskWeather();
  if (weather.L == 1.f && weather.M == 1.f && weather.S == 1.f) return lightRGB;

  // Attenuate the LMS deviation for direct light so surfaces don't deepfry.
  // The sky inscatter can take the full shift because it's a low energy
  // tint multiplier. Direct light is high energy and feeds into BRDF,
  // so the same shift gets amplified across every surface.
  float directLightAtten = 0.10f;

  float3 lms = renodx::color::lms::from::BT709(lightRGB);
  float3 fullScales = float3(weather.L, weather.M, weather.S);
  float3 scales = lerp(1.f, fullScales, dawnDuskFactor * directLightAtten);
  lms *= scales;

  float3 result = renodx::color::bt709::from::LMS(lms);
  return max(result, 0.f);
}

// ============================================================================
// Cloud Reddening — per-step transmittance modifier for dawn/dusk
// ============================================================================
//
// Physical motivation: sunlight traversing long atmospheric paths at low sun
// angles loses green and blue wavelengths to Rayleigh scattering (λ⁻⁴) before
// it reaches clouds. The game's Bruneton-style ray march computes extinction
// uniformly across cloud and clear-air regions, so clouds at sunset receive
// the same spectral balance as clear sky. This function adds the missing
// spectral filtering by returning a factor < 1.0 to multiply the green and
// blue transmittance channels at ray march steps where cloud density is high.
//
// The factor is 1.0 (identity) when:
//   - CUSTOM_WEATHER_EDITING is off
//   - cloudOpticalDepth is zero (clear air)
//   - dawnDuskFactor is zero (sun is high or deep below horizon)
//
// The existing DawnDuskWeather M/S fields modulate reddening strength so the
// LMS sliders control cloud warmth without new settings. The probe shader
// gets attenuated reddening (0.25×) to avoid oversaturating GI.

float CloudReddeningFactor(float cloudOpticalDepth, float dawnDuskFactor, bool isProbe) {
  // Identity early-outs. These are in the helper function so if-branches
  // are fine here — only the inline *= application in the decompiled
  // shaders must be branchless.
  if (CUSTOM_WEATHER_EDITING == 0.f) return 1.f;
  if (cloudOpticalDepth <= 0.f) return 1.f;
  if (dawnDuskFactor == 0.f) return 1.f;

  // Read cloud reddening strength from the weather preset (or slider override).
  // 0 = off, 1 = default, 2+ = strong. Comes from the preset table's 4th column.
  DawnDuskWeather weather = GetDawnDuskWeather();
  if (weather.cloudReddening <= 0.f) return 1.f;

  // --- Saturating extinction curve ---
  // Linear scaling would make thick cumulus opaque to G/B (black instead
  // of deep red). saturate() with a tuned coefficient gives:
  //   thin cirrus/edges → proportional subtle reddening
  //   medium clouds     → strong reddening (sunset sweet spot)
  //   thick cumulonimbus → plateaus at max reddening, doesn't go black
  //
  // The coefficient is tuned for the cloud optical depth values seen in
  // the shader (_cloudScatteringCoefficient / _distanceScale × cloudDensitySum).
  float curve = saturate(cloudOpticalDepth * 1.8f);

  // --- Weather M/S modulation ---
  // Lower M (green cone) = more green extinction = more orange clouds.
  // Lower S (blue cone)  = more blue extinction  = redder clouds.
  // At default (M=1, S=1) the weather multiplier is 1.0 (no change).
  // The M/S deviation is averaged into a single strength multiplier
  // because we return one scalar applied to both G and B channels.
  float weatherStrength = 1.f;
  if (weather.M != 1.f || weather.S != 1.f) {
    // Deviation from 1.0: lower M/S → higher strength → more reddening.
    // Average the two deviations so both cones contribute.
    float mDev = 1.f - weather.M;  // positive when M < 1 (more orange)
    float sDev = 1.f - weather.S;  // positive when S < 1 (more red)
    float avgDev = (mDev + sDev) * 0.5f;
    // Scale: preset deviations are ~0.03-0.15, map to ~6-30% extra strength
    weatherStrength = mad(avgDev, 2.f, 1.f);
  }

  // --- Combine: curve × dawnDuskFactor × weather × probe attenuation × preset strength ---
  float probeAtten = renodx::math::Select(isProbe, 0.25f, 1.f);
  float strength = curve * dawnDuskFactor * weatherStrength * probeAtten * weather.cloudReddening;

  // Base reddening amount: how much to attenuate G/B at full strength.
  // 0.35 means at peak (thick cloud, peak dawn/dusk, default weather,
  // cloudReddening=1.0), G/B transmittance is multiplied by 0.65.
  float maxAttenuation = 0.35f;
  float factor = 1.f - saturate(strength * maxAttenuation);

  return factor;
}

#endif  // SRC_CRIMSONDESERT_SKY_ATMOSPHERIC_SKY_WEATHER_COMMON_HLSLI_
