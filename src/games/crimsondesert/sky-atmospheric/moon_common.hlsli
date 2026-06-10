#ifndef SRC_CRIMSONDESERT_SKY_ATMOSPHERIC_MOON_COMMON_HLSLI_
#define SRC_CRIMSONDESERT_SKY_ATMOSPHERIC_MOON_COMMON_HLSLI_

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

// RenoDX: >>> [Patch: FantasyMoonPhases] [Version: 1.10-family]
// Description: Adds an art-directed phase treatment for the visible moon disk. The game provides sun/moon directions for physical shading, but those vectors can collapse to an always-full moon for lighting; this block maps the Moon Eclipse Phase slider from 0 = no crescent to 200 = full eclipse by sweeping a curved overlapping-disc shadow across the moon. It softens the curved terminator, adds restrained violet earthshine on the shadowed side, and turns the final 180..200 range into a fantasy eclipse silhouette with a blood-copper lunar tint, pearly rim, faint chromosphere color, and brief edge beads.
float3 RenoDXApplyFantasyMoonPhase(
    float3 sunDir,
    float3 moonDir,
    float2 moonLocal,
    float rawNdotL,
    float viewNdot,
    float litLight,
    float fullReferenceLight,
    float phaseDramaPercent) {
  float coverage = saturate(max(phaseDramaPercent, 0.0f) * 0.005f);
  if (coverage <= 0.0f) return float3(litLight, litLight, litLight);

  float phaseStrength = smoothstep(0.0f, 0.22f, coverage);
  float shapeStrength = smoothstep(0.0f, 1.0f, coverage);
  float eclipsePhase = smoothstep(0.72f, 1.0f, coverage);
  float silhouettePhase = smoothstep(0.90f, 1.0f, coverage);
  float crescentPhase = 1.0f - saturate(abs((coverage * 2.0f) - 1.0f));
  float linearDarkPhase = saturate(coverage / 0.80f);
  float earlyDarkPhase = sqrt(linearDarkPhase);
  float blackShadowPhase = smoothstep(0.55f, 0.80f, coverage);
  float moonExposure = lerp(1.0f, 0.22f, earlyDarkPhase) * lerp(1.0f, 0.10f, eclipsePhase);
  float glowExposure = lerp(1.0f, 0.50f, earlyDarkPhase) * lerp(1.0f, 0.22f, eclipsePhase);
  float boost = 1.0f + (crescentPhase * 0.02f);
  float phaseFull = saturate(0.5f + (0.5f * dot(-moonDir, sunDir)));
  float displayPhaseFull = lerp(phaseFull, 1.0f - coverage, phaseStrength);
  float newMoonPhase = 1.0f - displayPhaseFull;

  float litSideFeather = lerp(0.006f, 0.014f, crescentPhase) + (eclipsePhase * 0.010f);
  float earlyDarkSideFeather = lerp(0.120f, 0.220f, crescentPhase);
  float lateDarkSideFeather = lerp(0.080f, 0.185f, crescentPhase);
  float darkSideFeather = lerp(earlyDarkSideFeather, lateDarkSideFeather, blackShadowPhase) + (eclipsePhase * 0.055f);
  float shadowLead = lerp(0.018f, 0.115f, crescentPhase) * phaseStrength * (1.0f - (eclipsePhase * 0.35f));
  float shadowTravel = pow(coverage, 0.62f);
  float shadowCenterX = lerp(-2.12f, 0.0f, shadowTravel);
  float shadowRadius = lerp(0.92f, 1.12f, shapeStrength);
  float artPhaseDistance = length(float2(moonLocal.x - shadowCenterX, moonLocal.y * 0.96f)) - shadowRadius;
  float phaseNdotL = artPhaseDistance - shadowLead;
  float penumbraT = saturate((phaseNdotL + darkSideFeather) / (darkSideFeather + litSideFeather));
  float artLitMask = smoothstep(0.0f, 1.0f, penumbraT);
  float litMask = artLitMask;
  float shadowMask = 1.0f - litMask;
  float terminatorDistance = abs(phaseNdotL);
  float terminatorBand = (1.0f - smoothstep(litSideFeather, darkSideFeather * 0.82f, terminatorDistance)) * smoothstep(0.06f, 0.42f, viewNdot);

  float3 silverTint = lerp(float3(0.90f, 0.96f, 1.14f), float3(1.08f, 1.04f, 0.94f), crescentPhase * 0.40f);
  float3 shadowTint = lerp(float3(0.070f, 0.085f, 0.180f), float3(0.014f, 0.020f, 0.060f), earlyDarkPhase);
  shadowTint = lerp(shadowTint, float3(0.018f, 0.024f, 0.075f), blackShadowPhase);
  shadowTint = lerp(shadowTint, float3(0.035f, 0.050f, 0.140f), eclipsePhase);
  float3 terminatorTint = lerp(float3(0.72f, 0.86f, 1.26f), float3(1.26f, 0.62f, 0.28f), saturate(crescentPhase + (newMoonPhase * 0.35f)));

  float rim = pow(saturate(1.0f - viewNdot), 3.2f) * smoothstep(-0.08f, 0.24f, phaseNdotL);
  float earthshineLevel = lerp(0.0260f, 0.0022f, earlyDarkPhase);
  float earthshine = shadowMask * pow(max(viewNdot, 0.0f), 0.42f) * lerp(earthshineLevel, 0.0012f, eclipsePhase) * lerp(0.72f, 0.18f, coverage);
  float terminatorGlow = terminatorBand * lerp(0.014f, 0.045f, crescentPhase) * lerp(boost, 0.18f, eclipsePhase);
  float crescentBoost = lerp(0.98f, 1.0f, crescentPhase) * lerp(boost, 0.40f, eclipsePhase);

  float phaseLitLight = fullReferenceLight * lerp(0.78f, 1.08f, pow(max(viewNdot, 0.0f), 0.35f));
  float3 litRgb = phaseLitLight * litMask * silverTint * crescentBoost * moonExposure;
  float shadowDepth = saturate((-phaseNdotL) / max(darkSideFeather * 4.0f, 0.001f));
  float earlyShadowFill = shadowMask * phaseLitLight * moonExposure * lerp(0.22f, 0.075f, shadowDepth) * (1.0f - blackShadowPhase);
  float3 shadowRgb = (fullReferenceLight * earthshine * shadowTint * boost * moonExposure) + (earlyShadowFill * float3(0.45f, 0.50f, 0.78f));
  float3 terminatorRgb = fullReferenceLight * terminatorGlow * terminatorTint * glowExposure;
  float3 rimRgb = fullReferenceLight * rim * 0.018f * float3(0.74f, 0.88f, 1.20f) * boost * glowExposure;
  float3 fantasyRgb = max(litRgb, shadowRgb) + terminatorRgb + rimRgb;

  float diskRadius = saturate(length(moonLocal));
  float bloodMoonCore = (1.0f - smoothstep(0.18f, 0.95f, diskRadius)) * silhouettePhase;
  float bloodMoonVignette = (1.0f - smoothstep(0.62f, 1.0f, diskRadius)) * silhouettePhase;
  float eclipseInnerRim = pow(diskRadius, 9.0f) * silhouettePhase;
  float eclipseChromosphere = pow(diskRadius, 22.0f) * silhouettePhase;
  float beadPhase = smoothstep(0.90f, 0.945f, coverage) * (1.0f - smoothstep(0.965f, 1.0f, coverage));
  float2 beadDeltaA = moonLocal - float2(0.94f, 0.12f);
  float2 beadDeltaB = moonLocal - float2(0.90f, -0.28f);
  float beadA = exp2(-110.0f * dot(beadDeltaA, beadDeltaA));
  float beadB = exp2(-150.0f * dot(beadDeltaB, beadDeltaB)) * 0.55f;
  float eclipseBeads = (beadA + beadB) * beadPhase;
  float3 eclipseSilhouetteRgb =
      (fullReferenceLight * 0.0010f * float3(0.16f, 0.055f, 0.075f)) +
      (fullReferenceLight * bloodMoonCore * 0.010f * float3(0.52f, 0.070f, 0.045f)) +
      (fullReferenceLight * bloodMoonVignette * 0.004f * float3(0.68f, 0.130f, 0.110f)) +
      (fullReferenceLight * eclipseInnerRim * 0.036f * float3(0.92f, 0.64f, 1.04f)) +
      (fullReferenceLight * eclipseChromosphere * 0.012f * float3(1.10f, 0.16f, 0.24f)) +
      (fullReferenceLight * eclipseBeads * 0.18f * float3(1.20f, 0.92f, 0.56f));
  fantasyRgb = lerp(fantasyRgb, eclipseSilhouetteRgb, silhouettePhase);

  return lerp(float3(litLight, litLight, litLight), fantasyRgb, phaseStrength);
}
// RenoDX: <<< [Patch: FantasyMoonPhases]

#endif  // SRC_CRIMSONDESERT_SKY_ATMOSPHERIC_MOON_COMMON_HLSLI_
