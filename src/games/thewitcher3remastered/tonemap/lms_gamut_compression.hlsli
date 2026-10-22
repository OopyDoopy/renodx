#ifndef LMS_GAMUT_COMPRESSION_HLSLI_
#define LMS_GAMUT_COMPRESSION_HLSLI_

#include "../../../shaders/color/rgb.hlsl"

static const float GAMUT_LIMIT_SHARPNESS = 16.f;

static const float3x3 LMS_TO_BT709_MAT = mul(
    renodx::color::XYZ_TO_BT709_MAT,
    renodx::color::STOCKMAN_SHARP_LMS_TO_XYZ_MAT);

static const float3x3 LMS_TO_BT2020_MAT = mul(
    renodx::color::XYZ_TO_BT2020_MAT,
    renodx::color::STOCKMAN_SHARP_LMS_TO_XYZ_MAT);

static const float3 D65_WHITE_LMS =
  renodx::color::lms::from::WhiteD65();

static const float D65_WHITE_YF = dot(
  renodx::color::STOCKMAN_SHARP_LMS_TO_XFYFZF_MAT[1],
  D65_WHITE_LMS);

float GamutSmoothUnitLimit(float demand) {
  const float sharpness = GAMUT_LIMIT_SHARPNESS;
  const float zero_offset = 1.f - log2(1.f + exp2(sharpness)) / sharpness;
  float near_zero = 0.f;

  // Use the local expansion near zero to avoid cancellation in the softplus.
  if (!(demand >= 1e-3f)) {
    const float origin_slope = rcp(1.f + exp2(-sharpness));
    near_zero = demand * origin_slope
        * (1.f - 0.5f * sharpness * log(2.f) * (1.f - origin_slope) * demand)
        / (1.f - zero_offset);
    if (demand <= 1e-4f) return near_zero;
  }

  const float limited = 1.f
      - log2(1.f + exp2(sharpness * (1.f - demand))) / sharpness;
  const float mapped_demand = (limited - zero_offset) / (1.f - zero_offset);
  if (demand >= 1e-3f) return mapped_demand;

  const float transition_position = (demand - 1e-4f) / 9e-4f;
  const float transition = rcp(
      1.f + exp2((1.f - 2.f * transition_position)
                 / (transition_position * (1.f - transition_position))));
  return lerp(near_zero, mapped_demand, transition);
}

// Match Control Resonant: preserve positive normalized Yf while moving the
// Stockman-Sharpe LMS residual toward D65 neutral as cone demand approaches 0.
float3 CompressLMSRadial(float3 lms) {
  const float yf = renodx::color::yf::from::LMS(lms)
      / D65_WHITE_YF;
  if (yf <= 0.f) return 0.f;

  const float3 neutral_lms = D65_WHITE_LMS * yf;
  const float3 radial_lms = lms - neutral_lms;

  // Normalize each cone against its D65 neutral component, then combine the
  // active lower-bound demands with the same L8 norm used by Control Resonant.
  const float3 lower_lms = max(-radial_lms, 0.f.xxx)
      / D65_WHITE_LMS;
  const float lower_scale = renodx::math::Max(lower_lms);
  if (lower_scale == 0.f) return lms;

  float3 normalized_lower = lower_lms / lower_scale;
  normalized_lower *= normalized_lower;
  normalized_lower *= normalized_lower;

  const float lower_norm = lower_scale
      * sqrt(sqrt(sqrt(dot(normalized_lower, normalized_lower))));
  const float normalized_demand = lower_norm / yf;

  const float mapped_demand = GamutSmoothUnitLimit(normalized_demand);

  return neutral_lms + radial_lms * (mapped_demand / normalized_demand);
}

float3 CompressLMSRadialBT709(float3 color_bt709) {
  const float3 lms = CompressLMSRadial(renodx::color::lms::from::BT709(color_bt709));
  return mul(LMS_TO_BT709_MAT, lms);
}

float3 CompressLMSRadialBT2020(float3 color_bt2020) {
  const float3 lms = CompressLMSRadial(renodx::color::lms::from::BT2020(color_bt2020));
  return mul(LMS_TO_BT2020_MAT, lms);
}

#endif  // LMS_GAMUT_COMPRESSION_HLSLI