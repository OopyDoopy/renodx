#ifndef MOON_COMMON_HLSLI
#define MOON_COMMON_HLSLI

// --- Limb darkening ---
// Darkens the moon disc toward the edges

float MoonLimbDarkening(float NdotV_moon, float strength) {
  float raw = pow(max(NdotV_moon, 0.001f), 0.25f);
  float darkened = lerp(0.7f, 1.f, raw);
  return lerp(1.f, darkened, strength);
}

// --- Inner edge glow ---
// Subtle glow on the inside of the disc
// Additive term applied inside the disc before texture multiply.

float MoonInnerGlow(float NdotV_moon, float glowStrength) {
  if (glowStrength <= 0.f) return 0.f;

  float edge = 1.f - NdotV_moon;
  float glow = pow(edge, 3.f);
  return glow * 0.15f * glowStrength;
}

// --- AE compensated moon brightness ---
// When ae_dynamism_high is lowered for darker nights, AE dims the moon.
// Added this to boost the moon to compensate without blowing out the other
// AE settings such as when its neutral or above.

float MoonBrightnessMultiplier(float aeDynamismHigh, float moonBrightness) {
  // Inverse relationship: 0.8 -> 1.25x, 0.5 -> 2x, >=1.0 -> 1x
  float aeCompensation = max(1.f / max(aeDynamismHigh, 0.2f), 1.f);
  return moonBrightness * aeCompensation;
}

#endif  // MOON_COMMON_HLSLI
