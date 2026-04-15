#ifndef FOLIAGE_COMMON_HLSLI
#define FOLIAGE_COMMON_HLSLI

#include "../shared.h"
#include "../sky-atmospheric/sky_dawn_dusk_common.hlsli"

// ============================================================================
// Color correction constants
// ============================================================================

static const float FC_HUE_CENTER         = 2.094f;  // 120 deg — green hue gate center
static const float FC_HUE_HALF_WIDTH     = 0.698f;  // 40 deg each side (80-160 deg)
static const float FC_HUE_EDGE           = 0.175f;  // 10 deg smoothstep transition
static const float FC_CHROMA_LOW         = 0.02f;   // OkLab chroma gate low
static const float FC_CHROMA_HIGH        = 0.06f;   // OkLab chroma gate high
static const float FC_GREEN_EXCESS_MIN   = 0.05f;   // green excess below this = no correction
static const float FC_SHADOW_DESAT_SCALE = 0.3f;    // shadow desat relative to sunlit
static const float FC_SHADOW_COOL_SHIFT  = -0.015f; // cool shift on b axis for shadowed foliage
static const float FC_SUN_ELEV_LOW       = 0.05f;   // sun elevation where correction begins
static const float FC_SUN_ELEV_HIGH      = 0.5f;    // sun elevation where correction is full
static const float FC_ATMOS_WARM_THR     = 0.7f;    // G/R ratio below which correction < 30%
static const float FC_GATE_EPSILON       = 0.01f;   // gate threshold for early-out
static const float FC_CHROMA_KNEE        = 0.08f;   // OkLab chroma below which extra desat is zero
static const float FC_CHROMA_FULL        = 0.16f;   // OkLab chroma at which extra desat is maximum
static const float FC_L_KNEE             = 0.45f;   // OkLab L below which no lightness reduction
static const float FC_L_FULL             = 0.75f;   // OkLab L at which lightness reduction is maximum
static const float FC_AO_DIST_NEAR       = 30.f;    // depth below which no boost (close range)
static const float FC_AO_DIST_FAR        = 200.f;   // depth at which boost reaches maximum
static const float FC_AO_DIST_BOOST_MAX  = 0.5f;    // maximum additional AO strength at distance

// ============================================================================
// Foliage AO strength with distance compensation
// ============================================================================

float FoliageAOStrength(float linearDepth) {
  float distBoost = smoothstep(FC_AO_DIST_NEAR, FC_AO_DIST_FAR, linearDepth) * FC_AO_DIST_BOOST_MAX;
  return min(1.f, FOLIAGE_AO_STRENGTH + distBoost);
}

// ============================================================================
// Transmission constants
// ============================================================================

static const float  FT_DISTORTION      = 0.3f;
static const float  FT_POWER           = 2.f;
static const float  FT_AMBIENT         = 0.1f;
static const float3 FT_SUBSURFACE_TINT = float3(0.85f, 1.f, 0.55f);

// ============================================================================
// Colour self gating
// ----------------------------------------------------------------------------
// Returns combined gate factor [0,1]. Near zero for non green foliage
// (desert scrub, dead grass, autumn, snow-dusted pines).
// Uses green excess ratio + OkLab hue angle + OkLab chroma.
// ============================================================================

float FoliageColorGate(float3 baseColor, float3 oklab) {
  float greenExcess = saturate((baseColor.y - max(baseColor.x, baseColor.z))
                               / max(baseColor.y, 1e-5f));
  if (greenExcess < FC_GREEN_EXCESS_MIN) return 0.f;

  float hue    = atan2(oklab.z, oklab.y);
  float chroma = sqrt(oklab.y * oklab.y + oklab.z * oklab.z);

  // Hue gate: smoothstep window 80-160 deg with 10 deg transition
  float hueDist = abs(hue - FC_HUE_CENTER);
  hueDist = min(hueDist, 6.28318530718f - hueDist);
  float hueGate = 1.f - smoothstep(FC_HUE_HALF_WIDTH - FC_HUE_EDGE,
                                    FC_HUE_HALF_WIDTH + FC_HUE_EDGE,
                                    hueDist);

  float chromaGate = smoothstep(FC_CHROMA_LOW, FC_CHROMA_HIGH, chroma);

  return greenExcess * hueGate * chromaGate;
}

// ============================================================================
// Sun elevation factor
// ----------------------------------------------------------------------------
// Maximum at midday and zero at night + reduced during golden hour since
// warm light naturally desaturates green reflectance.
// ============================================================================

float FoliageSunFactor(float sunElevation) {
  if (sunElevation <= 0.f) return 0.f;

  float sunFactor = smoothstep(FC_SUN_ELEV_LOW, FC_SUN_ELEV_HIGH, sunElevation);
  float dawnDusk  = DawnDuskFactor(sunElevation);
  sunFactor *= (1.f - dawnDusk * 0.7f);

  return sunFactor;
}

// ============================================================================
// Atmospheric warmth factor
// ----------------------------------------------------------------------------
// Near 1.0 for neutral midday light, drops for warm low-sun light
// based on green/red transmittance ratio.
// ============================================================================

float FoliageAtmosphericFactor(float3 atmosTransmittance) {
  float gOverR = atmosTransmittance.y / max(atmosTransmittance.x, 1e-5f);
  return smoothstep(FC_ATMOS_WARM_THR, 1.f, gOverR);
}

// ============================================================================
// Dynamic foliage colour correction (OkLab)
// ----------------------------------------------------------------------------
// Self gates based on pixel color, sun elevation, shadow state, and
// atmospheric transmittance. Only affects saturated greens in the
// 80-160 deg hue range — desert, autumn, and snowy foliage pass through.
//
//   baseColor          — unpacked GBuffer albedo
//   sunDir             — _sunDirection.xyz
//   shadowVis          — shadow visibility [0,1]
//   atmosTransmittance — per-pixel RGB transmittance
// ============================================================================

float3 FoliageColorCorrect(float3 baseColor, float3 sunDir,
                           float shadowVis, float3 atmosTransmittance) {
  float3 oklab = renodx::color::oklab::from::BT709(baseColor);

  float colorGate = FoliageColorGate(baseColor, oklab);
  if (colorGate < FC_GATE_EPSILON) return baseColor;

  float sunFactor   = FoliageSunFactor(sunDir.y);
  float atmosFactor = FoliageAtmosphericFactor(atmosTransmittance);
  float strength    = colorGate * sunFactor * atmosFactor * FOLIAGE_CORRECTION_STRENGTH;
  if (strength < FC_GATE_EPSILON) return baseColor;

  // --- Base desaturation (shadow aware) ---
  float sunDesat    = FOLIAGE_DESAT_STRENGTH * strength;
  float shadowDesat = FC_SHADOW_DESAT_SCALE * FOLIAGE_DESAT_STRENGTH * strength;
  float desat       = lerp(shadowDesat, sunDesat, shadowVis);

  // --- Chroma proportional extra desaturation ---
  // Neon grass in direct sunlight gets an additional chroma reduction
  float chroma = sqrt(oklab.y * oklab.y + oklab.z * oklab.z);
  float chromaExcess = smoothstep(FC_CHROMA_KNEE, FC_CHROMA_FULL, chroma);
  float extraDesat   = chromaExcess * FOLIAGE_CHROMA_EXTRA_DESAT * strength * shadowVis;
  desat = saturate(desat + extraDesat);

  oklab.y *= (1.f - desat);
  oklab.z *= (1.f - desat);

  float hueRot = lerp(0.f, FOLIAGE_HUE_SHIFT * sunFactor, shadowVis) * strength;
  float cr = cos(hueRot);
  float sr = sin(hueRot);
  float a  = cr * oklab.y - sr * oklab.z;
  float b  = sr * oklab.y + cr * oklab.z;
  oklab.y  = a;
  oklab.z  = b;

  oklab.z += lerp(FC_SHADOW_COOL_SHIFT * strength, 0.f, shadowVis);

  // --- Lightness reduction (luminance proportional, shadow-aware) ---
  // Bright sunlit foliage gets pulled down more than dark foliage
  float lExcess = smoothstep(FC_L_KNEE, FC_L_FULL, oklab.x);
  float lRedSun    = lExcess * FOLIAGE_L_REDUCTION * strength;
  float lRedShadow = lExcess * FOLIAGE_L_REDUCTION * strength * FC_SHADOW_DESAT_SCALE;
  float lReduction = lerp(lRedShadow, lRedSun, shadowVis);
  oklab.x -= lReduction;

  float3 corrected = renodx::color::bt709::from::OkLab(oklab);
  return max(0.f, corrected);
}

// ============================================================================
// Frostbite style thin translucency
// ----------------------------------------------------------------------------
// View dependent transmission with normal distortion, subsurface colour
// tint (chlorophyll transmits 550-600nm), and wrapped diffuse for
// energy conservation.
//
// Based on Barre Brisebois & Bouchard, GDC 2011
// ============================================================================

struct FoliageTransmissionResult {
  float3 transmission;
  float  diffuseScale;
};

FoliageTransmissionResult FoliageTransmission(
    float3 V, float3 L, float3 N, float NdotL,
    float3 baseColor, float3 shadowColor, float3 lightLum,
    float thickness) {

  FoliageTransmissionResult result;
  result.transmission = 0.f;
  result.diffuseScale = 1.f;

  float3 vLTLight = L + N * FT_DISTORTION;
  float  fLTDot   = pow(saturate(dot(V, -vLTLight)), FT_POWER) * FOLIAGE_TRANSMISSION_STRENGTH;
  float  fLT      = (fLTDot + FT_AMBIENT) * (1.f - thickness);

  float3 transColor = baseColor * FT_SUBSURFACE_TINT;
  result.transmission = fLT * transColor * shadowColor * lightLum;

  // Wrapped diffuse for energy conservation
  float wrap        = 0.25f * (1.f - thickness);
  float wrappedNdotL = max(0.f, (NdotL + wrap) / (1.f + wrap));
  float vanillaNdotL = saturate(NdotL);
  float energyScale  = lerp(1.f, 0.75f, 1.f - thickness);

  if (vanillaNdotL > 0.01f) {
    result.diffuseScale = (wrappedNdotL / vanillaNdotL) * energyScale;
  } else {
    // At the terminator, signal caller to use wrappedNdotL directly
    result.diffuseScale = 0.f;
  }

  return result;
}

// ============================================================================
// Selective Colour Adjustment
// ----------------------------------------------------------------------------
//   Yellows:       Yellow = +1.0  (deepens yellow saturation)
//   Yellow Greens: Black  = +1.0  (darkens yellow-greens)
//   Greens:        Black  = +1.0  (darkens greens)
// ============================================================================

float FoliageSelectiveHue(float3 c) {
  float mx = max(max(c.x, c.y), c.z);
  float mn = min(min(c.x, c.y), c.z);
  float chroma = mx - mn;
  if (chroma < 1e-5f) return 0.f;

  float hue;
  if (c.x >= c.y && c.x >= c.z)
    hue = (c.y - c.z) / chroma;        // between yellow & magenta
  else if (c.y >= c.x && c.y >= c.z)
    hue = 2.f + (c.z - c.x) / chroma;  // between cyan & yellow
  else
    hue = 4.f + (c.x - c.y) / chroma;  // between magenta & cyan

  hue /= 6.f;
  if (hue < 0.f) hue += 1.f;
  return hue;
}

float FoliageSelectiveCurve(float x) {
  return x * x * (3.f - 2.f * x);
}

float FoliageSelectiveAdjust(float scale, float colorvalue, float adjust, float bk) {
  return clamp(
    ((-1.f - adjust) * bk - adjust) * (1.f - colorvalue),
    -colorvalue,
    1.f - colorvalue
  ) * scale;
}

float3 FoliageSelectiveColor(float3 color) {
  color = saturate(color);

  float mn  = min(min(color.x, color.y), color.z);
  float mx  = max(max(color.x, color.y), color.z);
  float mid = color.x + color.y + color.z - mn - mx;
  float scalar     = mx - mn;
  float alt_scalar = (mid - mn) * 0.5f;
  float cmy_scalar = scalar * 0.5f;

  float hue = FoliageSelectiveHue(color);

  float sw_y  = FoliageSelectiveCurve(max(1.f - abs((hue - 2.f / 12.f) * 6.f), 0.f));
  float sw_yg = FoliageSelectiveCurve(max(1.f - abs((hue - 3.f / 12.f) * 6.f), 0.f));
  float sw_g  = FoliageSelectiveCurve(max(1.f - abs((hue - 4.f / 12.f) * 6.f), 0.f));

  float w_y  = sw_y  * cmy_scalar;
  float w_yg = sw_yg * alt_scalar;
  float w_g  = sw_g  * scalar;

  color.z += FoliageSelectiveAdjust(w_y, color.z, FOLIAGE_SC_YELLOW, 0.f);

  color.x += FoliageSelectiveAdjust(w_yg, color.x, 0.f, FOLIAGE_SC_YG_BLACK);
  color.y += FoliageSelectiveAdjust(w_yg, color.y, 0.f, FOLIAGE_SC_YG_BLACK);
  color.z += FoliageSelectiveAdjust(w_yg, color.z, 0.f, FOLIAGE_SC_YG_BLACK);

  color.x += FoliageSelectiveAdjust(w_g, color.x, 0.f, FOLIAGE_SC_GREEN_BLACK);
  color.y += FoliageSelectiveAdjust(w_g, color.y, 0.f, FOLIAGE_SC_GREEN_BLACK);
  color.z += FoliageSelectiveAdjust(w_g, color.z, 0.f, FOLIAGE_SC_GREEN_BLACK);

  return saturate(color);
}

#endif  // FOLIAGE_COMMON_HLSLI
