// A combo of "Volumetric Aurora Borealis with Polar Reflection" by gerardo-lcdf 
// from Godot & KnighTec's work on W3 Blitz-FX. TY to both

#ifndef AURORA_COMMON_HLSLI
#define AURORA_COMMON_HLSLI

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

// ============================================================================
// Aurora volumetric raymarch
// ----------------------------------------------------------------------------
// Steps through horizontal planes at increasing heights along the view ray,
// samples triNoise2d at each hit for curtain patterns
//
// Set up 4 aurora colour palettes set to 'frameNumber'. Should give us about
// 9ish hrs for changes. Not sure of a better dynamic way to do this atm
//
// Colour palettes are the following
//
//   green   — O 557.7nm
//   blue    — N2+ 427.8nm
//   pink    — O 630nm
//   cyan    — mixed
//
//   viewDir     — normalised view direction (Y up)
//   gameTime    — _time.x 
//   frameNumber — _frameNumber.x
//   pixelCoord  — SV_DispatchThreadID.xy
// ============================================================================

float3 ComputeAurora(float3 viewDir, float gameTime, uint frameNumber,
                     uint2 pixelCoord) {
  float3 rd = viewDir;

  float horizonFade = smoothstep(-0.05f, 0.15f, rd.y);
  if (horizonFade <= 0.f) return 0.f;

  // --- Palette cycling ---
  float frameLow = (float)(frameNumber & 0xFFFFFu);
  float pa = frac(frameLow * 0.0000005f) * renodx::math::PI * 2.f;

  float w0 = pow(max(0.f, cos(pa)), 8.f);
  float w1 = pow(max(0.f, cos(pa - renodx::math::PI * 0.5f)), 8.f);
  float w2 = pow(max(0.f, cos(pa - renodx::math::PI)), 8.f);
  float w3 = pow(max(0.f, cos(pa - renodx::math::PI * 1.5f)), 8.f);
  float wSum = w0 + w1 + w2 + w3 + 0.001f;

  float3 colorBottom = (float3(0.1f, 0.9f, 0.2f) * w0 + float3(0.1f, 0.3f, 0.9f) * w1
                      + float3(0.8f, 0.1f, 0.4f) * w2 + float3(0.05f, 0.8f, 0.7f) * w3) / wSum;
  float3 colorTop    = (float3(0.05f, 0.3f, 0.1f) * w0 + float3(0.4f, 0.1f, 0.7f) * w1
                      + float3(0.4f, 0.05f, 0.2f) * w2 + float3(0.1f, 0.2f, 0.6f) * w3) / wSum;

  // Subtle hue shimmer on top of the base palette
  float shimmer = gameTime * 0.003f;
  colorBottom *= 0.85f + 0.15f * float3(
    mad(sin(shimmer * 1.1f), 0.5f, 0.5f),
    mad(sin(mad(shimmer, 0.9f, 2.f)), 0.5f, 0.5f),
    mad(sin(mad(shimmer, 1.3f, 4.f)), 0.5f, 0.5f)
  );

  // --- Volumetric raymarch ---
  float4 col = 0.f;
  float4 avgCol = 0.f;
  float rdUp = max(rd.y, 0.001f);

  [unroll]
  for (int i = 0; i < 40; i++) {
    float fi = (float)i;

    // Per step jitter for temporal stability
    float of = 0.006f * AuroraHash21(float2(pixelCoord) + float2(fi, frameNumber & 255u))
             * smoothstep(0.f, 15.f, fi);

    float planeHeight = mad(pow(fi, 1.4f), 0.002f, 0.8f);
    float2 p = (rd.xz / rdUp) * planeHeight * 0.2f;

    float rzt = AuroraTriNoise2D(p, 0.18f, gameTime);

    // Sparsity: push weaker values to zero so aurora doesn't fill the whole sky
    rzt = smoothstep(0.02f, 0.32f, rzt);

    float3 colorVar = mad(sin(1.f - float3(2.15f, -0.5f, 1.2f) + fi * 0.043f), 0.5f, 0.5f);
    float4 col2 = float4(lerp(colorBottom, colorTop, colorVar) * rzt, rzt);

    avgCol = lerp(avgCol, col2, 0.5f);
    col += avgCol * exp2(mad(fi, -0.065f, -2.5f)) * smoothstep(0.f, 5.f, fi);
  }

  return col.rgb * horizonFade * 2.f;
}

// --- AE compensated aurora dampening ---
// Inverse of the moon compensation in moon_common.hlsli.
// Aurora was tuned at ae_dynamism_high = 0.5 (slider 25). Users running the
// default 0.8 (slider 40) or higher get blown out by the brighter AE letting
// more aurora energy through. So we modulate

float AuroraBrightnessDampening(float aeDynamismHigh) {
  const float tuningBaseline = 0.5f;
  float ratio = min(tuningBaseline / max(aeDynamismHigh, 0.2f), 1.f);
  return ratio * ratio;
}

#endif  // AURORA_COMMON_HLSLI
