#include "./shared.h"

#define LMS_WHITE renodx::color::lms::from::BT709(1.0f)

float3 CustomPostProcessing(float3 color, float2 uv) {
  //color = ApplyRCAS(color, uv, t1, s1);
  color = renodx::effects::ApplyFilmGrain(color, uv, CUSTOM_RANDOM, CUSTOM_FILM_GRAIN_STRENGTH * 0.03f);
  return color;
}

// Linear in, linear out
float3 GammaCorrectionLMSPerChannel(float3 color, bool pow_to_srgb = false, float gamma = 2.2f) {
  float3 lms_color = renodx::color::lms::from::BT709(color) / LMS_WHITE;
  float3 gamma_corrected_lms_color = renodx::color::correct::GammaSafe(lms_color, pow_to_srgb, gamma);
  float3 color_out = renodx::color::bt709::from::LMS(gamma_corrected_lms_color * LMS_WHITE);
  return color_out;
}

float3 GammaCorrectionByLuminosity(float3 color, bool pow_to_srgb = false, float gamma = 2.2f) {
  float lumin_in = renodx::color::yf::from::BT709(color);
  float lumin_out = renodx::color::correct::GammaSafe(lumin_in, pow_to_srgb, gamma);
  float3 color_out = renodx::color::correct::Luminance(color, lumin_in, lumin_out);
  return color_out;
}

float3 ProcessGammaCorrection(float3 color, bool pow_to_srgb = false, float gamma = 2.2f) {
  if (RENODX_GAMMA_CORRECTION == 1) {
    if (RENODX_TONE_MAP_TYPE == 2) {
      return GammaCorrectionLMSPerChannel(color, pow_to_srgb, gamma);
    }
    else {
      return renodx::color::correct::GammaSafe(color, pow_to_srgb, gamma);
    }
  } 
  return color;
}

float3 Unclamp(float3 original_gamma, float3 black_gamma, float3 mid_gray_gamma, float3 neutral_gamma) {
  const float3 added_gamma = black_gamma;

  // Remove from 0 to mid-gray
  const float3 shadow_length = mid_gray_gamma;
  const float3 shadow_stop = neutral_gamma;
  const float3 t = max(0, shadow_length - shadow_stop) / shadow_length;
  //const float3 curved = renodx::math::SafePow(t, lerp(1.0f, 10.0f, CUSTOM_LUT_SCALING_BRIGHTNESS));
  const float3 floor_remove = added_gamma * t;

  const float3 unclamped_gamma = max(0, original_gamma - floor_remove);
  return unclamped_gamma;
}