#ifndef SRC_GAMES_UE_EXTENDED_COMMON_HLSLI_
#define SRC_GAMES_UE_EXTENDED_COMMON_HLSLI_

#include "./shared.h"

#define RENODX_BT709_LMS_WHITE renodx::color::lms::from::BT709(1.f.xxx)

// Previous BT.2020-reference formation.
// static const float3x3 PRISM_INSET = {
//   0.523063634f, 0.362007069f, 0.114929299f,
//   0.197722978f, 0.607804915f, 0.194472105f,
//   0.116206573f, 0.235762465f, 0.648030952f};
// static const float3x3 PRISM_INSET_TO_XYZ = {
//   0.719127657f, 0.114816254f, 0.116512015f,
//   -0.022700442f, 1.296282244f, -0.273581802f,
//   -0.203282192f, -0.300774507f, 1.593114466f};
// static const float3x3 PRISM_OUTSET = {
//   2.414298492f, -1.409940139f, -0.004358361f,
//   -0.785918220f, 2.351514051f, -0.565595830f,
//   -0.210755467f, -0.519184550f, 1.729940034f};

// BT.2020-reference formation, D65 white; outset is the inverse of inset.
static const float3x3 PRISM_INSET = {
  0.549737516f, 0.371638297f, 0.078624190f,
  0.139220197f, 0.719788111f, 0.140991690f,
  0.089362351f, 0.175562933f, 0.735074705f
};
static const float3x3 PRISM_INSET_TO_XYZ = {
  0.700666760f, 0.098003586f, 0.151785581f,
  0.166907707f, 0.931377814f, -0.098285521f,
  -0.161373328f, -0.074164267f, 1.324595363f
};
static const float3x3 PRISM_OUTSET = {
  2.094701286f, -1.077278804f, -0.017422490f,
  -0.372709243f, 1.649163258f, -0.276454015f,
  -0.165634190f, -0.262917185f, 1.428551392f
};

float3 PrismInsetToBT709(float3 color) {
  return mul(renodx::color::XYZ_TO_BT709_MAT, mul(PRISM_INSET_TO_XYZ, color));
}

float3 SanitizeGamutInput(float3 color, float3x3 gamut_xyz) {
  const float3 luminance_weights = gamut_xyz[1];
  const float y = dot(color, luminance_weights);
  [branch]
  if (y >= 0.f) return color;

  const float3 positive = max(color, 0.f);
  const float positive_y = dot(positive, luminance_weights);
  const float scale = positive_y / (positive_y - y);
  return mad(color - positive, scale, positive);
}

float3 SanitizeGamutInputBT709(float3 color) {
  return SanitizeGamutInput(color, renodx::color::BT709_TO_XYZ_MAT);
}

float3 SanitizeGamutInputBT2020(float3 color) {
  return SanitizeGamutInput(color, renodx::color::BT2020_TO_XYZ_MAT);
}

// Pumbo's "accurate blue correct"
float3 ApplyBlueCorrectionPrePumbo(float3 untonemapped_ap1, float blue_correction) {
  if (FORCE_BLUE_CORRECT == 1.f) {
    blue_correction = 0.6f;
  }

  float R = lerp(1.0, 0.9387864139, blue_correction);
  float G = lerp(1.0, 0.8308209395, blue_correction);

  // Forward blue correction
  float corrected_r = lerp(untonemapped_ap1.b, untonemapped_ap1.r, R);
  float corrected_g = lerp(untonemapped_ap1.b, untonemapped_ap1.g, G);

  return float3(corrected_r, corrected_g, untonemapped_ap1.b);
}

float3 ApplyBlueCorrectionPostPumbo(float3 tonemapped_ap1, float blue_correction) {
  if (FORCE_BLUE_CORRECT == 1.f) {
    blue_correction = 0.6f;
  }

  float R = lerp(1.0, 0.9387864139, blue_correction);
  float G = lerp(1.0, 0.8308209395, blue_correction);

  float InvR = rcp(R);
  float InvG = rcp(G);

  float corrected_r = lerp(tonemapped_ap1.b, tonemapped_ap1.r, InvR);
  float corrected_g = lerp(tonemapped_ap1.b, tonemapped_ap1.g, InvG);

  return float3(corrected_r, corrected_g, tonemapped_ap1.b);
}

///

float3 ApplyBlueCorrectionPre(float3 untonemapped_ap1, float blue_correction) {
  return (ApplyBlueCorrectionPrePumbo(untonemapped_ap1, blue_correction));

#if 0
  if (FORCE_BLUE_CORRECT == 1.f) {
    blue_correction = 0.6f;
  }

  float r = untonemapped_ap1.r, g = untonemapped_ap1.g, b = untonemapped_ap1.b;

  float corrected_r = ((mad(0.061360642313957214f, b, mad(-4.540197551250458e-09f, g, (r * 0.9386394023895264f))) - r) * blue_correction) + r;
  float corrected_g = ((mad(0.169205904006958f, b, mad(0.8307942152023315f, g, (r * 6.775371730327606e-08f))) - g) * blue_correction) + g;
  float corrected_b = (mad(-2.3283064365386963e-10f, g, (r * -9.313225746154785e-10f)) * blue_correction) + b;

  return float3(corrected_r, corrected_g, corrected_b);
#endif
}

float3 ApplyBlueCorrectionPost(float3 tonemapped_ap1, float blue_correction) {
  return (ApplyBlueCorrectionPostPumbo(tonemapped_ap1, blue_correction));

#if 0
  if (FORCE_BLUE_CORRECT == 1.f) {
    blue_correction = 0.6f;
  }

  float r = tonemapped_ap1.r, g = tonemapped_ap1.g, b = tonemapped_ap1.b;

  float corrected_r = ((mad(-0.06537103652954102f, b, mad(1.451815478503704e-06f, g, (r * 1.065374732017517f))) - r) * blue_correction) + r;
  float corrected_g = ((mad(-0.20366770029067993f, b, mad(1.2036634683609009f, g, (r * -2.57161445915699e-07f))) - g) * blue_correction) + g;
  float corrected_b = ((mad(0.9999996423721313f, b, mad(2.0954757928848267e-08f, g, (r * 1.862645149230957e-08f))) - b) * blue_correction) + b;

  return float3(corrected_r, corrected_g, corrected_b);
#endif
}

float3 BlueCorrectedAP1FromBT709(float3 color_bt709, float blue_correction) {
  return ApplyBlueCorrectionPre(
      renodx::color::ap1::from::BT709(color_bt709),
      blue_correction);
}

float3 BT709FromBlueCorrectedAP1(float3 color_ap1, float blue_correction) {
  return renodx::color::bt709::from::AP1(
      ApplyBlueCorrectionPost(color_ap1, blue_correction));
}

float3 BlueCorrectedAP1FromLMS(float3 color_lms, float blue_correction) {
  return ApplyBlueCorrectionPre(
      renodx::color::ap1::from::LMS(color_lms),
      blue_correction);
}

float3 LMSFromBlueCorrectedAP1(float3 color_ap1, float blue_correction) {
  return renodx::color::lms::from::AP1(
      ApplyBlueCorrectionPost(color_ap1, blue_correction));
}

// input: BT.709 linear
// output: BT.709 linear
float3 ApplyGammaCorrectionAP1(float3 color_bt709, bool inverse, float blue_correction) {
  float3 color_blue_corrected_ap1 = BlueCorrectedAP1FromBT709(color_bt709, blue_correction);
  return BT709FromBlueCorrectedAP1(
      renodx::color::correct::GammaSafe(color_blue_corrected_ap1, inverse),
      blue_correction);
}

// input: BT.709 linear
// output: BT.709 linear
float3 ApplyGammaCorrection(float3 color_bt709, bool inverse = false, float blue_correction = 0.6f) {
  if (RENODX_GAMMA_CORRECTION == 0.f) return color_bt709;

  if (RENODX_GAMMA_CORRECTION_WORKING_SPACE == 0.f || RENODX_TONE_MAP_TYPE == 0.f) {
    return renodx::color::correct::GammaSafe(color_bt709, inverse);
  }

  if (RENODX_TONE_MAP_SCALING == RENODX_TONE_MAP_SCALING_PRISM) {
    return PrismInsetToBT709(renodx::color::correct::GammaSafe(mul(PRISM_INSET, color_bt709), inverse));
  }
  return ApplyGammaCorrectionAP1(color_bt709, inverse, blue_correction);
}

// input: sRGB-encoded BT.709; output: BT.709 linear before EOTF emulation
float3 InverseGammaCorrectionFromSrgb(float3 color_srgb, float blue_correction = 0.f) {
  return ApplyGammaCorrection(renodx::color::srgb::DecodeSafe(color_srgb), true, blue_correction);
}

#endif  // SRC_GAMES_UE_EXTENDED_COMMON_HLSLI_

