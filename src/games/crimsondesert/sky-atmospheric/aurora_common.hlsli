// A combo of "Volumetric Aurora Borealis with Polar Reflection" by gerardo-lcdf
// from Godot & KnighTec's work on W3 Blitz-FX. TY to both
//
// v2: Fixed top splotches (removed avgCol running average) and horizontal
//     gaps (removed fracLayer oscillation). Added analytical height envelope
//     to control vertical extent without artifacts.

#ifndef SRC_CRIMSONDESERT_SKY_ATMOSPHERIC_AURORA_COMMON_HLSLI_
#define SRC_CRIMSONDESERT_SKY_ATMOSPHERIC_AURORA_COMMON_HLSLI_

static const float AURORA_TIME_SCALE = 0.0035f; // For global motion amount
static const int   AURORA_STEP_COUNT = 50;

float ComputeNightGate(float sunDirY) {
  return 1.f - smoothstep(-0.15f, 0.f, sunDirY);
}

// Simple transmittance for night only SkyMaterial since it has no extinction LUT
float ChapmanTransmittance(float altitude, float cosViewZenith,
                           float rayleighScaleHeight, float earthRadius) {
  float H = max(rayleighScaleHeight, 1.f);
  return exp(-5.8e-6f * H * exp(-altitude / H) / max(cosViewZenith, 0.01f));
}

float AuroraHash21(float2 n) {
  return frac(sin(dot(n, float2(12.9898f, 4.1414f))) * 43758.5453f);
}

// ============================================================================
// Improved per pixel hash seeded by _ssaoRandomDirection[16]
// ============================================================================

float2 AuroraImprovedHash(uint2 pixelCoord, float frameJitter, float4 ssaoDirections[16]) {
  uint idx = (pixelCoord.x & 3u) + (pixelCoord.y & 3u) * 4u;
  float2 tileSeed = ssaoDirections[idx].xy;

  uint h = pixelCoord.x + pixelCoord.y * 8191u;
  h = (h ^ 61u) ^ (h >> 16u);
  h = h + (h << 3u);
  h = h ^ (h >> 4u);
  h = h * 0x27d4eb2du;
  h = h ^ (h >> 15u);
  float2 perPixel = float2(float(h & 0xFFFFu), float((h >> 16u) & 0xFFFFu)) * (1.f / 65535.f);

  return frac(perPixel + tileSeed * 0.5f + frameJitter);
}

float AuroraHashInt(uint n) {
  return frac((float)n * 0.6180339887f);
}

// ============================================================================
// Night seed session system
//
// Use AURORA_NIGHT_SEED for each night and re rolls
// The CPU detects transitions by tracking SceneShadowTiledNight
// ============================================================================

uint AuroraNightSessionIndex(float nightSeed) {
  return (uint)(nightSeed * 65535.f);
}

float AuroraNightVisibility(float nightSeed, float chance) {
  uint sessionIndex = AuroraNightSessionIndex(nightSeed);
  float roll = AuroraHashInt(sessionIndex);
  return renodx::math::Select(roll < chance, 1.f, 0.f);
}

// --- AE compensated aurora dampening ---
// Inverse of moon compensation. Aurora tuned at ae_dynamism_high = 0.5 (slider 25).
// Stops nukes at higher AE values
float AuroraBrightnessDampening(float aeDynamismHigh) {
  static const float tuningBaseline = 0.5f;
  float ratio = min(renodx::math::DivideSafe(tuningBaseline, aeDynamismHigh, 1.f), 1.f);
  return ratio * ratio;
}

// ============================================================================
// Gradient noise (Perlin style) — Inigo Quilez
// ============================================================================

float2 AuroraGradientHash(float2 p) {
  p = float2(dot(p, float2(127.1f, 311.7f)), dot(p, float2(269.5f, 183.3f)));
  return mad(frac(sin(p) * 43758.5453123f), 2.f, -1.f);
}

float AuroraGradientNoise(float2 p) {
  float2 i = floor(p);
  float2 f = frac(p);
  float2 u = f * f * f * mad(f, mad(f, 6.f, -15.f), 10.f);

  float2 ga = AuroraGradientHash(i);
  float2 gb = AuroraGradientHash(i + float2(1.f, 0.f));
  float2 gc = AuroraGradientHash(i + float2(0.f, 1.f));
  float2 gd = AuroraGradientHash(i + float2(1.f, 1.f));

  float va = dot(ga, f);
  float vb = dot(gb, f - float2(1.f, 0.f));
  float vc = dot(gc, f - float2(0.f, 1.f));
  float vd = dot(gd, f - float2(1.f, 1.f));

  return va + u.x * (vb - va) + u.y * (vc - va) + u.x * u.y * (va - vb - vc + vd);
}

float AuroraFBM(float2 p, int octaves) {
  float value = 0.f;
  float amplitude = 0.5f;
  float frequency = 1.f;

  [unroll]
  for (int i = 0; i < octaves; i++) {
    value += amplitude * AuroraGradientNoise(p * frequency);
    amplitude *= 0.5f;
    frequency *= 2.f;
  }
  return value;
}

// ============================================================================
// Difference Clouds — Miskatonic Studios technique
// ============================================================================

float AuroraDifferenceClouds(float2 p, float gameTime, float animSpeed) {
  float2 uv1 = p * 1.2f + float2(gameTime * animSpeed * 0.3f, gameTime * animSpeed * 0.1f);
  float noise1 = AuroraFBM(uv1, 3);

  float2 uv2 = p * 0.8f - float2(gameTime * animSpeed * 0.2f, gameTime * animSpeed * 0.35f);
  static const float angle = 0.4f;
  static const float2x2 rot = float2x2(cos(angle), sin(angle), -sin(angle), cos(angle));
  uv2 = mul(rot, uv2);
  float noise2 = AuroraFBM(uv2, 3);

  return 1.f - pow(saturate(abs(noise1 - noise2) * 2.5f), 0.4f);
}

// ============================================================================
// Triangle wave noise (nimitz) — internal shimmer
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
    p = mul(-AURORA_M2, p);
  }
  return clamp(renodx::math::DivideSafe(1.f, pow(rz * 29.f, 1.3f)), 0.f, 0.55f);
}

// ============================================================================
// Hybrid aurora noise — Mode 0=Triangle, 1=Difference, 2=Blend
// ============================================================================

float AuroraTriangleNoise(float2 p, float animSpeed, float gameTime, float sharpness) {
  float shimmer = AuroraTriNoise2D(p, animSpeed, gameTime);
  return smoothstep(lerp(0.01f, 0.15f, sharpness), lerp(0.55f, 0.45f, sharpness), shimmer);
}

float AuroraDifferenceNoise(float2 p, float animSpeed, float gameTime, float sharpness) {
  float curtains = AuroraDifferenceClouds(p, gameTime, animSpeed);
  return smoothstep(lerp(0.05f, 0.25f, sharpness), lerp(0.85f, 0.6f, sharpness), curtains);
}

float AuroraBlendedNoise(float2 p, float animSpeed, float gameTime, float sharpness, float blend) {
  float curtains = AuroraDifferenceClouds(p, gameTime, animSpeed);
  float shimmer = AuroraTriNoise2D(p * 1.5f, animSpeed * 0.7f, gameTime);

  float curtainWeight = lerp(0.2f, 1.0f, blend);
  float shimmerBase = lerp(0.7f, 0.4f, blend);
  float combined = lerp(shimmer, curtains * mad(shimmer, 1.f - shimmerBase, shimmerBase), curtainWeight);

  return smoothstep(
    lerp(0.02f, 0.2f, sharpness * mad(blend, 0.5f, 0.5f)),
    lerp(0.8f, 0.55f, sharpness),
    combined);
}

float AuroraHybridNoise(float2 p, float animSpeed, float gameTime, float sharpness, float blend, float mode) {
  if (mode < 0.5f) return AuroraTriangleNoise(p, animSpeed, gameTime, sharpness);
  if (mode < 1.5f) return AuroraDifferenceNoise(p, animSpeed, gameTime, sharpness);
  return AuroraBlendedNoise(p, animSpeed, gameTime, sharpness, blend);
}

// ============================================================================
// 1D Perlin noise — arc shape waviness
// ============================================================================

float AuroraHash1D(float p) {
  float3 p3 = frac(float3(p, p, p) * 0.1031f);
  p3 += dot(p3, p3.yzx + 19.19f);
  return frac((p3.x + p3.y) * p3.z);
}

float AuroraPerlin1D(float p) {
  float pi = floor(p);
  float pf = p - pi;
  float w = pf * pf * pf * (pf * (6.f * pf - 15.f) + 10.f);
  float sign0 = renodx::math::Select(((uint)(AuroraHash1D(pi) * 10000.f) & 1) == 0, 1.f, -1.f);
  float sign1 = renodx::math::Select(((uint)(AuroraHash1D(pi + 1.f) * 10000.f) & 1) == 0, 1.f, -1.f);
  float g0 = sign0 * pf;
  float g1 = sign1 * (pf - 1.f);
  return lerp(g0, g1, w) * 2.f;
}

// ============================================================================
// Glow & Footprint — curtain shape and density
// ============================================================================

float AuroraGlow(float dist, float radius, float intensity) {
  return pow(renodx::math::DivideSafe(radius, dist, 0.f), intensity);
}

float2 AuroraFootprint(float3 position, float gameTime, float animSpeed) {
  static const float auroraStart = 0.8f;
  static const float auroraHeight = 0.15f;
  float h = saturate((position.y - auroraStart) / auroraHeight);
  float arcCenter = mad(5.5f, cos(0.005f * position.z), 0.3f * h);
  arcCenter += 0.02f * AuroraPerlin1D(mad(gameTime, animSpeed * 2.f, 0.1f * position.z));
  return float2(position.x - arcCenter, h);
}

float AuroraSDF(float3 position, float gameTime, float animSpeed) {
  float2 footprint = AuroraFootprint(position, gameTime, animSpeed);
  return abs(footprint.x) - lerp(0.8f, 0.3f, footprint.y);
}

float AuroraGlowDensity(float3 position, float gameTime, float animSpeed, float noiseValue) {
  float2 footprint = AuroraFootprint(position, gameTime, animSpeed);
  float3 a = float3(noiseValue, mad(footprint.y, 0.008f, 0.5f), noiseValue);
  float speed = gameTime * animSpeed;
  a.y += 0.015f * AuroraPerlin1D(mad(position.z, 0.042f, speed));
  a.y += 0.015f * AuroraPerlin1D(mad(position.z, 0.042f, -2.f * speed));
  return AuroraGlow(length(a), 0.7f, 10.f) * saturate(cos(0.13f * footprint.x));
}

// ============================================================================
// Aurora volumetric raymarch
// ============================================================================
//
// v2 changes from original:
//   1. Removed avgCol running average — was accumulating stale bright values
//      at high step indices, causing disconnected splotches at the top.
//   2. Removed fracLayer oscillation — was creating periodic weight dips
//      that produced horizontal gap banding.
//   3. Added smooth height envelope that multiplies the layer weight to
//      give clean vertical falloff without the splotch/gap artifacts.
//
// Everything else is identical to the original working code.

float3 ComputeAurora(float3 viewDir, float realTime, float nightGate, uint frameNumber,
                     uint2 pixelCoord, float4 ssaoDirections[16]) {

  // So the code doesnt run during day time
  if (nightGate <= 0.f) return 0.f;

  float3 rd = viewDir;

  float horizonFade = smoothstep(-0.05f, 0.15f, rd.y);
  if (horizonFade <= 0.f) return 0.f;

  float visibilityFade = AuroraNightVisibility(AURORA_NIGHT_SEED, AURORA_CHANCE / 100.f);
  if (visibilityFade <= 0.f) return 0.f;

  uint sessionIndex = AuroraNightSessionIndex(AURORA_NIGHT_SEED);
  float animTime = realTime * AURORA_TIME_SCALE;

  // --- Palette selection with pity system ---
  uint paletteIndex;
  {
    uint raw = min((uint)(AuroraHashInt(sessionIndex + 12345u) * 12.f), 11u);
    uint prev1 = min((uint)(AuroraHashInt((sessionIndex > 0u ? sessionIndex - 1u : 0u) + 12345u) * 12.f), 11u);
    uint prev2 = min((uint)(AuroraHashInt((sessionIndex > 1u ? sessionIndex - 2u : 0u) + 12345u) * 12.f), 11u);
    paletteIndex = renodx::math::Select(
      raw == prev1 && raw == prev2 && sessionIndex > 1u,
      (raw + 1u) % 12u, raw);
  }

  float brightnessVar = mad(AuroraHashInt(sessionIndex + 23456u), 0.7f, 0.3f);

  // --- Preset selection with pity system ---
  uint presetIndex;
  {
    uint raw = min((uint)(AuroraHashInt(sessionIndex + 34567u) * 10.f), 9u);
    uint prev1 = min((uint)(AuroraHashInt((sessionIndex > 0u ? sessionIndex - 1u : 0u) + 34567u) * 10.f), 9u);
    uint prev2 = min((uint)(AuroraHashInt((sessionIndex > 1u ? sessionIndex - 2u : 0u) + 34567u) * 10.f), 9u);
    presetIndex = renodx::math::Select(
      raw == prev1 && raw == prev2 && sessionIndex > 1u,
      (raw + 1u) % 10u, raw);
  }

  // --- Presets: [mode, blend, sharpness, speed, sparsityLow, sparsityHigh, verticalScale, animSpeed, driftSpeed, pulseSpeed, waveSpeed] ---
  static const float presets[10][11] = {
    {2.f, 100.f, 100.f, 50.f, 0.f, 100.f, 300.f, 100.f, 100.f, 100.f, 100.f},
    {2.f, 100.f, 100.f, 75.f, 0.f, 100.f, 250.f, 100.f, 100.f, 100.f, 100.f},
    {2.f, 100.f, 100.f, 75.f, 0.f, 100.f, 100.f, 50.f, 100.f, 100.f, 100.f},
    {2.f, 100.f, 100.f, 75.f, 0.f, 100.f, 200.f, 65.f, 100.f, 100.f, 100.f},
    {2.f, 100.f, 50.f, 60.f, 10.f, 100.f, 150.f, 35.f, 100.f, 100.f, 100.f},
    {0.f, 100.f, 0.f, 60.f, 0.f, 100.f, 250.f, 50.f, 100.f, 100.f, 100.f},
    {0.f, 100.f, 0.f, 75.f, 0.f, 75.f, 300.f, 40.f, 100.f, 100.f, 100.f},
    {0.f, 100.f, 5.f, 100.f, 0.f, 75.f, 150.f, 50.f, 100.f, 100.f, 100.f},
    {0.f, 100.f, 5.f, 100.f, 0.f, 75.f, 200.f, 35.f, 100.f, 100.f, 100.f},
    {0.f, 100.f, 5.f, 100.f, 0.f, 75.f, 150.f, 35.f, 100.f, 100.f, 100.f}
  };

  float presetMode = presets[presetIndex][0];
  float presetBlend = presets[presetIndex][1];
  float presetSharpness = presets[presetIndex][2];
  float presetSpeed = presets[presetIndex][3];
  float presetSparsityLow = presets[presetIndex][4];
  float presetSparsityHigh = presets[presetIndex][5];
  float presetVerticalScale = presets[presetIndex][6];
  float presetAnimSpeed = presets[presetIndex][7];
  float presetDriftSpeed = presets[presetIndex][8];
  float presetPulseSpeed = presets[presetIndex][9];
  float presetWaveSpeed = presets[presetIndex][10];

  float sparsityLow = presetSparsityLow / 100.f;
  float sparsityHigh = presetSparsityHigh / 100.f;
  float auroraBlend = presetBlend / 100.f;
  float auroraSharpness = presetSharpness / 100.f;
  float verticalScale = mad(presetVerticalScale / 100.f, 1.5f, 0.5f);
  float animSpeed = mad(presetAnimSpeed / 100.f, 1.0f, 0.2f) * lerp(0.1f, 3.0f, presetSpeed / 100.f);
  float driftSpeedPct = presetDriftSpeed / 100.f;
  float pulseSpeedPct = presetPulseSpeed / 100.f;
  float waveSpeedPct = presetWaveSpeed / 100.f;

  // --- Palettes ---
  static const float3 paletteBottoms[12] = {
    float3(0.1f, 1.0f, 0.2f), float3(0.1f, 0.5f, 1.0f), float3(1.0f, 0.2f, 0.5f),
    float3(0.0f, 1.0f, 0.8f), float3(0.2f, 1.0f, 0.3f), float3(0.3f, 1.0f, 0.1f),
    float3(0.0f, 0.9f, 1.0f), float3(1.0f, 0.5f, 0.0f), float3(0.0f, 1.0f, 0.5f),
    float3(0.4f, 0.1f, 1.0f), float3(1.0f, 0.1f, 0.2f), float3(0.0f, 0.9f, 0.7f)
  };
  static const float3 paletteLowerMids[12] = {
    float3(0.0f, 0.8f, 0.4f), float3(0.3f, 0.3f, 1.0f), float3(0.9f, 0.1f, 0.6f),
    float3(0.1f, 0.7f, 1.0f), float3(0.6f, 0.9f, 0.2f), float3(0.6f, 1.0f, 0.0f),
    float3(0.2f, 0.5f, 1.0f), float3(1.0f, 0.7f, 0.0f), float3(0.2f, 0.8f, 0.6f),
    float3(0.6f, 0.0f, 1.0f), float3(1.0f, 0.4f, 0.1f), float3(0.3f, 0.7f, 0.7f)
  };
  static const float3 paletteUpperMids[12] = {
    float3(0.2f, 0.5f, 0.3f), float3(0.5f, 0.1f, 0.9f), float3(0.7f, 0.0f, 0.5f),
    float3(0.3f, 0.4f, 0.9f), float3(0.9f, 0.5f, 0.2f), float3(0.9f, 0.9f, 0.0f),
    float3(0.6f, 0.2f, 0.9f), float3(1.0f, 0.9f, 0.2f), float3(0.5f, 0.4f, 0.9f),
    float3(0.9f, 0.0f, 0.7f), float3(1.0f, 0.7f, 0.0f), float3(0.8f, 0.3f, 0.5f)
  };
  static const float3 paletteTops[12] = {
    float3(0.1f, 0.2f, 0.1f), float3(0.4f, 0.0f, 0.5f), float3(0.3f, 0.0f, 0.2f),
    float3(0.1f, 0.1f, 0.4f), float3(0.8f, 0.1f, 0.2f), float3(1.0f, 0.6f, 0.0f),
    float3(0.5f, 0.0f, 0.6f), float3(1.0f, 1.0f, 0.5f), float3(0.4f, 0.0f, 0.6f),
    float3(0.6f, 0.0f, 0.3f), float3(1.0f, 0.85f, 0.3f), float3(0.9f, 0.2f, 0.4f)
  };

  float3 colorBottom = paletteBottoms[paletteIndex];
  float3 colorLowerMid = paletteLowerMids[paletteIndex];
  float3 colorUpperMid = paletteUpperMids[paletteIndex];
  float3 colorTop = paletteTops[paletteIndex];

  float shimmer = animTime * 0.003f;
  colorBottom *= 0.85f + 0.15f * float3(
    mad(sin(shimmer * 1.1f), 0.5f, 0.5f),
    mad(sin(mad(shimmer, 0.9f, 2.f)), 0.5f, 0.5f),
    mad(sin(mad(shimmer, 1.3f, 4.f)), 0.5f, 0.5f));

  float2 drift = float2(sin(animTime * mad(driftSpeedPct, 0.02f, 0.005f)),
                        cos(animTime * mad(driftSpeedPct, 0.02f, 0.005f) * 0.7f)) * 0.15f;
  float pulse = mad(sin(animTime * mad(pulseSpeedPct, 0.04f, 0.01f)), 0.08f, 0.92f);
  float waveSpeed = mad(waveSpeedPct, 0.06f, 0.02f);

  // --- Raymarch ---
  float3 col = 0.f;
  float rdUp = max(rd.y, 0.001f);

  float frameJitter = CUSTOM_RANDOM;
  float2 pixelHash = AuroraImprovedHash(pixelCoord, frameJitter, ssaoDirections);
  float temporalLayerOffset = (frameJitter - 0.5f) * 1.5f;

  uint vh = pixelCoord.x * 3u + pixelCoord.y * 7919u;
  vh = vh ^ (vh >> 13u);
  vh = vh * 0x45d9f3bu;
  vh = vh ^ (vh >> 16u);
  float verticalNoise = frac(float(vh & 0xFFFFu) * (1.f / 65535.f) + frameJitter * 3.f) - 0.5f;

  [loop]
  for (int i = 0; i < AURORA_STEP_COUNT; i++) {
    float fi = (float)i + temporalLayerOffset;

    float layerJitter = (pixelHash.x - 0.5f) * 0.5f * smoothstep(0.f, 6.f, fi);
    layerJitter += verticalNoise * 0.3f * smoothstep(0.f, 15.f, fi);

    float t = saturate(fi / (float)(AURORA_STEP_COUNT - 1));
    float stepCurve = t * t * (3.f - 2.f * t);
    float planeHeight = 0.8f + sin(mad(fi, 0.06f, animTime * waveSpeed)) * 0.012f
                      + mad(stepCurve, 0.25f * verticalScale, layerJitter * 0.02f);
    float2 p = (rd.xz / rdUp) * planeHeight * 0.2f;

    p += (pixelHash - 0.5f) * 0.015f;
    p.y += verticalNoise * 0.02f * t;
    p += drift * mad(fi, 0.005f, 1.f);

    float rzt = AuroraHybridNoise(p, animSpeed, animTime, auroraSharpness, auroraBlend, presetMode);

    float3 samplePos = float3(p.x * 50.f, planeHeight, p.y * 50.f);
    rzt *= lerp(0.7f, 1.3f, saturate(AuroraGlowDensity(samplePos, animTime, animSpeed, rzt) * 2.f));
    rzt = smoothstep(sparsityLow, sparsityHigh, rzt) * pulse;

    float sparkle = smoothstep(mad(pixelHash.y, 0.06f, 0.92f), 1.0f,
                               AuroraHash21(p * 50.f + float2(frameJitter * 100.f, fi))) * rzt * 2.0f;

    float heightBlend = saturate(mad(sin(-1.15f + fi * 0.043f), 0.5f, 0.5f));
    float3 c01 = lerp(colorBottom, colorLowerMid, saturate(heightBlend * 3.f));
    float3 c12 = lerp(colorLowerMid, colorUpperMid, saturate((heightBlend - 0.333f) * 3.f));
    float3 c23 = lerp(colorUpperMid, colorTop, saturate((heightBlend - 0.666f) * 3.f));
    float3 layerColor = renodx::math::Select(heightBlend < 0.333f, c01,
                        renodx::math::Select(heightBlend < 0.666f, c12, c23));

    float3 layerEmission = layerColor * rzt + sparkle * lerp(1.f, colorLowerMid, 0.3f);
    
    float layerWeight = smoothstep(0.f, 8.f, fi) * exp2(mad(fi, -0.05f, -2.2f));

    col += layerEmission * layerWeight;
  }

  return col * horizonFade * nightGate * (AURORA_BRIGHTNESS / 100.f) * brightnessVar * visibilityFade;
}

#endif  // SRC_CRIMSONDESERT_SKY_ATMOSPHERIC_AURORA_COMMON_HLSLI_