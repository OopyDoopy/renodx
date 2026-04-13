// A combo of "Volumetric Aurora Borealis with Polar Reflection" by gerardo-lcdf 
// from Godot & KnighTec's work on W3 Blitz-FX. TY to both

#ifndef SRC_CRIMSONDESERT_SKY_ATMOSPHERIC_AURORA_COMMON_HLSLI_
#define SRC_CRIMSONDESERT_SKY_ATMOSPHERIC_AURORA_COMMON_HLSLI_

// ============================================================================
// Triangle wave noise (nimitz)
// ----------------------------------------------------------------------------
// To help produce the curtain wavy effect
// ============================================================================

float AuroraTri(float x) {
  return clamp(abs(frac(x) - 0.5f), 0.01f, 0.49f);
}

float2 AuroraTri2(float2 p) {
  return float2(AuroraTri(p.x) + AuroraTri(p.y), AuroraTri(p.y + AuroraTri(p.x)));
}

float2x2 AuroraMM2(float a) {
  float c = cos(a), s = sin(a);
  return float2x2(c, s, -s, c);
}

static const float2x2 AURORA_M2 = float2x2(0.95534f, 0.29552f, -0.29552f, 0.95534f);

// ============================================================================
// triNoise2D — layered triangle noise with rotation
// ============================================================================

float AuroraTriNoise2D(float2 p, float spd, float gameTime) {
  float z = 1.8f;
  float z2 = 2.5f;
  float rz = 0.f;
  p = mul(AuroraMM2(p.x * 0.06f), p);
  float2 bp = p;

  [unroll]
  for (int i = 0; i < 4; i++) {
    float2 dg = AuroraTri2(bp * 1.85f) * 0.75f;
    dg = mul(AuroraMM2(gameTime * spd), dg);
    p -= dg / z2;
    bp *= 1.3f;
    z2 *= 0.45f;
    z *= 0.42f;
    p *= mad(rz - 1.f, 0.02f, 1.21f);
    rz += AuroraTri(p.x + AuroraTri(p.y)) * z;
    p = mul(AURORA_M2 * -1.f, p);
  }

  return clamp(1.f / pow(rz * 29.f, 1.3f), 0.f, 0.55f);
}

// ============================================================================
// Gating helpers
// ============================================================================

// Smoothstep fade on sun elevation, full night at sunDirY <= -0.15
float ComputeNightGate(float sunDirY) {
  return 1.f - smoothstep(-0.15f, 0.f, sunDirY);
}

// Simply transmittance for the night only SkyMaterial shader
// as we lack extinction LUT
float ChapmanTransmittance(float altitude, float cosViewZenith,
                           float rayleighScaleHeight, float earthRadius) {
  float H = max(rayleighScaleHeight, 1.f);
  return exp(-5.8e-6f * H * exp(-altitude / H) / max(cosViewZenith, 0.01f));
}

float AuroraHash21(float2 n) {
  return frac(sin(dot(n, float2(12.9898f, 4.1414f))) * 43758.5453f);
}

float AuroraHashInt(uint n) {
  return frac((float)n * 0.6180339887f);
}

// Returns visibility factor [0,1] based on whether aurora should appear
// chance: probability of aurora appearing (0,1)
// Uses realTime in seconds for session based variation
// Includes smooth transition at session boundaries to prevent popping
float AuroraNightVisibility(float realTime, float chance) {
  // Night is roughly 8PM-3AM = 7 in-game hours = 35 real minutes
  // 1 in game minute = 5 rl seconds
  // Double to 70 min (4200 sec) to ensure consistency across full day/night cycle
  const float sessionDuration = 4200.f;
  const float transitionTime = 60.f; // 1 minute fade at session boundaries
  
  float sessionProgress = realTime / sessionDuration;
  uint sessionIndex = (uint)sessionProgress;
  float sessionFrac = frac(sessionProgress);
  
  float rollCurrent = AuroraHashInt(sessionIndex);
  float rollNext = AuroraHashInt(sessionIndex + 1u);
  
  float visibleCurrent = renodx::math::Select(rollCurrent < chance, 1.f, 0.f);
  float visibleNext = renodx::math::Select(rollNext < chance, 1.f, 0.f);
  
  float transitionFrac = transitionTime / sessionDuration;
  float transitionStart = 1.f - transitionFrac;
  
  if (sessionFrac > transitionStart) {
    float t = (sessionFrac - transitionStart) / transitionFrac;
    t = smoothstep(0.f, 1.f, t);
    return lerp(visibleCurrent, visibleNext, t);
  }
  
  return visibleCurrent;
}

// ============================================================================
// Aurora volumetric raymarch
// ----------------------------------------------------------------------------
// Steps through horizontal planes at increasing heights along the view ray,
// samples triNoise2d at each hit for curtain patterns
//
//   viewDir     — normalised view direction (Y up)
//   gameTime    — _time.x 
//   frameNumber — _frameNumber.x
//   pixelCoord  — SV_DispatchThreadID.xy
// ============================================================================

float3 ComputeAurora(float3 viewDir, float gameTime, float realTime, uint frameNumber,
                     uint2 pixelCoord) {
  float3 rd = viewDir;

  float horizonFade = smoothstep(-0.05f, 0.15f, rd.y);
  if (horizonFade <= 0.f) return 0.f;

  // --- Per night visibility (user configurable chance with smooth transitions) ---
  float visibilityFade = AuroraNightVisibility(realTime, AURORA_CHANCE / 100.f);
  if (visibilityFade <= 0.f) return 0.f;

  // --- Per session randomisation with smooth transitions ---
  const float sessionDuration = 4200.f;
  const float transitionTime = 60.f; // 1 minute transition
  
  float sessionProgress = realTime / sessionDuration;
  uint sessionIndex = (uint)sessionProgress;
  float sessionFrac = frac(sessionProgress);
  
  float transitionFrac = transitionTime / sessionDuration;
  float transitionStart = 1.f - transitionFrac;
  float transitionBlend = 0.f;
  if (sessionFrac > transitionStart) {
    transitionBlend = smoothstep(0.f, 1.f, (sessionFrac - transitionStart) / transitionFrac);
  }
  
  // Get current and next session palettes (12 palettes total)
  // Uses pity system to avoid 3 identical palettes in a row
  uint paletteIndexCurrent, paletteIndexNext;
  {
    uint raw = (uint)(AuroraHashInt(sessionIndex + 12345u) * 12.f);
    raw = min(raw, 11u);
    uint prev1 = (uint)(AuroraHashInt(sessionIndex - 1u + 12345u) * 12.f);
    prev1 = min(prev1, 11u);
    uint prev2 = (uint)(AuroraHashInt(sessionIndex - 2u + 12345u) * 12.f);
    prev2 = min(prev2, 11u);
    if (raw == prev1 && raw == prev2) raw = (raw + 1u) % 12u;
    paletteIndexCurrent = raw;
  }
  {
    uint raw = (uint)(AuroraHashInt(sessionIndex + 1u + 12345u) * 12.f);
    raw = min(raw, 11u);
    uint prev1 = (uint)(AuroraHashInt(sessionIndex + 12345u) * 12.f);
    prev1 = min(prev1, 11u);
    uint prev2 = (uint)(AuroraHashInt(sessionIndex - 1u + 12345u) * 12.f);
    prev2 = min(prev2, 11u);
    if (raw == prev1 && raw == prev2) raw = (raw + 1u) % 12u;
    paletteIndexNext = raw;
  }
  
  float brightnessCurrent = 0.3f + AuroraHashInt(sessionIndex + 23456u) * 0.7f;
  float brightnessNext = 0.3f + AuroraHashInt(sessionIndex + 1u + 23456u) * 0.7f;
  float brightnessVar = lerp(brightnessCurrent, brightnessNext, transitionBlend);
  
  float sparsityLowCurrent = 0.01f + AuroraHashInt(sessionIndex + 34567u) * 0.03f;
  float sparsityLowNext = 0.01f + AuroraHashInt(sessionIndex + 1u + 34567u) * 0.03f;
  float sparsityLow = lerp(sparsityLowCurrent, sparsityLowNext, transitionBlend);
  
  float sparsityHighCurrent = 0.25f + AuroraHashInt(sessionIndex + 45678u) * 0.15f;
  float sparsityHighNext = 0.25f + AuroraHashInt(sessionIndex + 1u + 45678u) * 0.15f;
  float sparsityHigh = lerp(sparsityHighCurrent, sparsityHighNext, transitionBlend);
  
  float verticalCurrent = 0.7f + AuroraHashInt(sessionIndex + 56789u) * 0.3f;
  float verticalNext = 0.7f + AuroraHashInt(sessionIndex + 1u + 56789u) * 0.3f;
  float verticalScale = lerp(verticalCurrent, verticalNext, transitionBlend);
  
  float animSpeedCurrent = 0.12f + AuroraHashInt(sessionIndex + 67890u) * 0.12f;
  float animSpeedNext = 0.12f + AuroraHashInt(sessionIndex + 1u + 67890u) * 0.12f;
  float animSpeed = lerp(animSpeedCurrent, animSpeedNext, transitionBlend);

  // --- Palette colors lookup ---
  // Multi hue combinations with saturated colours
  // Each palette has bottom color (lower aurora) and top color (upper aurora)
  float3 paletteBottoms[12] = {
    float3(0.1f, 1.0f, 0.2f),   // 0: Green (classic) - vivid green
    float3(0.1f, 0.4f, 1.0f),   // 1: Blue - deep blue
    float3(1.0f, 0.1f, 0.5f),   // 2: Pink/Magenta - hot pink
    float3(0.0f, 1.0f, 0.9f),   // 3: Cyan - electric cyan
    float3(0.2f, 1.0f, 0.3f),   // 4: Watermelon - bright green bottom
    float3(0.4f, 1.0f, 0.2f),   // 5: Green-Yellow - lime green
    float3(0.0f, 0.9f, 1.0f),   // 6: Cyan-Purple - bright cyan
    float3(1.0f, 0.4f, 0.0f),   // 7: Fire - deep orange
    float3(0.0f, 1.0f, 0.4f),   // 8: Emerald-Violet - deep emerald
    float3(0.3f, 0.0f, 1.0f),   // 9: Violet-Blue - deep violet
    float3(1.0f, 0.0f, 0.3f),   // 10: Crimson-Gold - deep crimson
    float3(0.0f, 0.8f, 0.6f)    // 11: Teal-Rose - deep teal
  };
  float3 paletteTops[12] = {
    float3(0.0f, 0.4f, 0.1f),   // 0: Green - forest green top
    float3(0.5f, 0.1f, 1.0f),   // 1: Blue - vivid purple top
    float3(0.5f, 0.0f, 0.2f),   // 2: Pink - deep magenta top
    float3(0.1f, 0.3f, 0.8f),   // 3: Cyan - royal blue top
    float3(1.0f, 0.1f, 0.4f),   // 4: Watermelon - vivid pink/red top
    float3(1.0f, 0.9f, 0.0f),   // 5: Green-Yellow - golden yellow top
    float3(0.8f, 0.0f, 1.0f),   // 6: Cyan-Purple - vivid purple top
    float3(1.0f, 1.0f, 0.2f),   // 7: Fire - bright yellow top
    float3(0.7f, 0.0f, 1.0f),   // 8: Emerald-Violet - vivid violet top
    float3(1.0f, 0.0f, 0.6f),   // 9: Violet-Blue - hot magenta top
    float3(1.0f, 0.85f, 0.0f),  // 10: Crimson-Gold - rich gold top
    float3(1.0f, 0.3f, 0.5f)    // 11: Teal-Rose - rose pink top
  };
  
  float3 colorBottom = lerp(paletteBottoms[paletteIndexCurrent], paletteBottoms[paletteIndexNext], transitionBlend);
  float3 colorTop = lerp(paletteTops[paletteIndexCurrent], paletteTops[paletteIndexNext], transitionBlend);

  float shimmer = gameTime * 0.003f;
  colorBottom *= 0.85f + 0.15f * float3(
    mad(sin(shimmer * 1.1f), 0.5f, 0.5f),
    mad(sin(mad(shimmer, 0.9f, 2.f)), 0.5f, 0.5f),
    mad(sin(mad(shimmer, 1.3f, 4.f)), 0.5f, 0.5f)
  );

  float driftSpeed = 0.003f + AuroraHashInt(sessionIndex + 78901u) * 0.002f;
  float2 drift = float2(sin(gameTime * driftSpeed), cos(gameTime * driftSpeed * 0.7f)) * 0.08f;
  
  float pulseSpeed = 0.02f + AuroraHashInt(sessionIndex + 89012u) * 0.015f;
  float pulse = 0.92f + 0.08f * sin(gameTime * pulseSpeed);
  
  float waveSpeed = 0.04f + AuroraHashInt(sessionIndex + 90123u) * 0.02f;

  // --- Volumetric raymarch ---
  float4 col = 0.f;
  float4 avgCol = 0.f;
  float rdUp = max(rd.y, 0.001f);

  [unroll]
  for (int i = 0; i < 40; i++) {
    float fi = (float)i;

    float of = 0.006f * AuroraHash21(float2(pixelCoord) + float2(fi, frameNumber & 255u))
             * smoothstep(0.f, 15.f, fi);

    float verticalWave = sin(gameTime * waveSpeed + fi * 0.08f) * 0.015f;
    
    float planeHeight = mad(pow(fi, 1.4f), 0.002f * verticalScale, 0.8f + verticalWave);
    float2 p = (rd.xz / rdUp) * planeHeight * 0.2f;
    
    p += drift * (1.f + fi * 0.005f);

    float rzt = AuroraTriNoise2D(p, animSpeed, gameTime);

    rzt = smoothstep(sparsityLow, sparsityHigh, rzt);
    rzt *= pulse;

    float3 colorVar = mad(sin(1.f - float3(2.15f, -0.5f, 1.2f) + fi * 0.043f), 0.5f, 0.5f);
    float4 col2 = float4(lerp(colorBottom, colorTop, colorVar) * rzt, rzt);

    avgCol = lerp(avgCol, col2, 0.5f);
    col += avgCol * exp2(mad(fi, -0.065f, -2.5f)) * smoothstep(0.f, 5.f, fi);
  }

  return col.rgb * horizonFade * (AURORA_BRIGHTNESS / 100.f) * brightnessVar * visibilityFade;
}

// --- AE compensated aurora dampening ---
// Inverse of the moon compensation in moon_common.hlsli.
// Aurora was tuned at ae_dynamism_high = 0.5 (slider 25). Users running the
// default 0.8 (slider 40) or higher get blown out by the brighter AE letting
// more aurora energy through, so we modulate

float AuroraBrightnessDampening(float aeDynamismHigh) {
  const float tuningBaseline = 0.5f;
  float ratio = min(tuningBaseline / max(aeDynamismHigh, 0.2f), 1.f);
  return ratio * ratio;
}

#endif  // SRC_CRIMSONDESERT_SKY_ATMOSPHERIC_AURORA_COMMON_HLSLI_
