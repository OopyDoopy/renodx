#ifndef SRC_CRIMSONDESERT_SKY_ATMOSPHERIC_SKY_DAWN_DUSK_COMMON_HLSLI_
#define SRC_CRIMSONDESERT_SKY_ATMOSPHERIC_SKY_DAWN_DUSK_COMMON_HLSLI_

#include "../shared.h"

float DawnDuskFactor(float sunElevation) {
  if (DAWN_DUSK_IMPROVEMENTS == 0.f) return 0.f;

  float rise = smoothstep(-0.17f, 0.0f, sunElevation);
  float fall = 1.f - smoothstep(0.087f, 0.26f, sunElevation);
  return rise * fall;
}

// --- Night sky attenuation ---
// The game's vanilla scattering produces bright skies too early (3am-4:30am)
// and stays too bright after sunset. This attenuates inscatter energy when
// the sun is below a threshold to keep the sky darker at night.
//
// Gated behind NIGHT_SKY_ATTENUATION flag.
//
// Sun elevation zones (radians):
//   < 0.0 rad (< 0°)     = night, 10% brightness
//   0.0 to 0.17 rad      = twilight transition, 10% to 100%
//   > 0.17 rad (> +10°)  = daytime, no attenuation
//
// Returns a multiplier for inscatter energy

float NightSkyAttenuation(float sunElevation) {
  if (NIGHT_SKY_ATTENUATION == 0.f) return 1.f;
  
  // Night zone: sun below 0° (horizon) — hardcoded to 10% brightness
  float nightMin = 0.10f;
  
  // Twilight zone: sun between 0° and +10° — hardcoded to 10% brightness
  float twilightMin = 0.10f;
  
  // Blend from night to twilight as sun rises from 0° to +0.087 (~5°)
  float nightToTwilight = smoothstep(0.0f, 0.087f, sunElevation);
  float currentMin = lerp(nightMin, twilightMin, nightToTwilight);
  
  // Blend from twilight to full brightness as sun rises from +0.087 to +0.17 (~10°)
  float twilightToDay = smoothstep(0.087f, 0.17f, sunElevation);
  
  return lerp(currentMin, 1.f, twilightToDay);
}

float MiePhaseBoostedG(float baseG, float dawnDuskFactor) {
  if (dawnDuskFactor == 0.f) return baseG;

  float boostStrength = 0.45f;
  float maxG = 0.98f;
  float boostedG = lerp(baseG, maxG, dawnDuskFactor * boostStrength);
  return min(boostedG, maxG);
}

// Base game's scattering on the east and west looks very similar.
// This adds hue differences at the horizon for better distinction.
// Hues are picked from the spectral Rayleigh we added.
float3 InscatterColorBias(float viewSunDot, float dawnDuskFactor,
                          float3 extinctionRGB) {
  if (dawnDuskFactor == 0.f) return 1.f;

  float t = mad(viewSunDot, 0.5f, 0.5f);
  float3 warm = float3(1.044f, 1.000f, 0.965f);
  float3 cool = float3(0.958f, 1.000f, 1.035f);
  float3 tint = lerp(cool, warm, t);
  float strength = 0.15f;
  return lerp(1.f, tint, dawnDuskFactor * strength);
}

// Adds directional bias into the L1 SH band along the sun direction,
// scaled by L0 so it tracks overall sky brightness. Taken from CP2077.
void SHDirectionalBias(float3 sunDir, float dawnDuskFactor, float3 L0,
                       out float3 biasR, out float3 biasG, out float3 biasB) {
  if (dawnDuskFactor == 0.f) {
    biasR = 0.f; biasG = 0.f; biasB = 0.f;
    return;
  }

  float shScale = 0.3253f;

  float elevBlend = saturate(sunDir.y * 4.f);
  float warmR = lerp(1.15f, 1.05f, elevBlend);
  float warmG = lerp(1.02f, 1.00f, elevBlend);
  float warmB = lerp(0.85f, 0.95f, elevBlend);

  float biasStrength = 0.35f;
  float magR = L0.x * biasStrength * dawnDuskFactor * warmR * shScale;
  float magG = L0.y * biasStrength * dawnDuskFactor * warmG * shScale;
  float magB = L0.z * biasStrength * dawnDuskFactor * warmB * shScale;

  biasR = sunDir * magR;
  biasG = sunDir * magG;
  biasB = sunDir * magB;
}

// Restores directional contrast to ambient since the sky probe is low res
// and inscatter gets heavily averaged at mip 4. Not a big deal with direct
// sun/moon lighting but during dawn/dusk it creates flat GI.
float3 DawnDuskAmbientBoost(float3 ambientRGB, float3 surfaceNormal,
                            float3 sunDir, float dawnDuskFactor,
                            float3 shL0) {
  if (dawnDuskFactor == 0.f) return ambientRGB;

  float nDotSun = dot(surfaceNormal, sunDir);
  float sunFacing = mad(nDotSun, 0.5f, 0.5f);

  float3 warm = float3(1.06f, 1.00f, 0.94f);
  float3 cool = float3(0.94f, 1.00f, 1.06f);
  float3 tint = lerp(cool, warm, sunFacing);

  float directionalMul = lerp(0.7f, 1.3f, sunFacing);

  float boostStrength = 2.0f;
  float3 directionalAmbient = ambientRGB * directionalMul * tint;
  float3 boosted = lerp(ambientRGB, directionalAmbient, dawnDuskFactor * boostStrength);

  // Use luminance of L0 as a neutral reference so the floor doesnt inherit
  // the sky colour bias (tent interiors were becoming way too red otherwise)
  float shL0Lum = renodx::color::y::from::BT709(shL0);
  float floorFraction = 0.15f;
  float3 floorRGB = shL0Lum * floorFraction * dawnDuskFactor;

  boosted = max(boosted, floorRGB);

  return boosted;
}

#endif  // SRC_CRIMSONDESERT_SKY_ATMOSPHERIC_SKY_DAWN_DUSK_COMMON_HLSLI_