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
  //mid_gray_gamma = renodx::color::srgb::EncodeSafe(ProcessGammaCorrection(renodx::color::srgb::DecodeSafe(mid_gray_gamma), false));
  //black_gamma = renodx::color::srgb::EncodeSafe(ProcessGammaCorrection(renodx::color::srgb::DecodeSafe(black_gamma), false));
  //neutral_gamma = renodx::color::srgb::EncodeSafe(ProcessGammaCorrection(renodx::color::srgb::DecodeSafe(neutral_gamma), false));

  const float3 added_gamma = black_gamma;

  // Remove from 0 to mid-gray
  const float3 shadow_length = mid_gray_gamma;
  const float3 shadow_stop = neutral_gamma;
  const float3 t = max(0, shadow_length - shadow_stop) / shadow_length;
  //const float3 curved = renodx::math::SafePow(t, lerp(1.0f, 10.0f, CUSTOM_LUT_SCALING_BRIGHTNESS));
  float3 floor_remove = added_gamma * t;

  // floor_remove = renodx::color::srgb::EncodeSafe(ProcessGammaCorrection(renodx::color::srgb::DecodeSafe(floor_remove)));

  const float3 unclamped_gamma = max(0, original_gamma - floor_remove);
  return unclamped_gamma;
}

float ComputeReinhardSmoothClampScale(float3 untonemapped, float rolloff_start = 0.375f, float output_max = 1.f, float white_clip = 100.f) {
  float peak = renodx::math::Max(untonemapped);
  float mapped_peak = renodx::tonemap::ReinhardPiecewiseExtended(peak, white_clip, output_max, rolloff_start);
  float scale = renodx::math::DivideSafe(mapped_peak, peak, 1.f);

  return scale;
}

// Per-channel variant of UpgradeToneMap (no luminance coupling).
float3 UpgradeToneMapPerChannel(
    float3 color_untonemapped,
    float3 color_tonemapped,
    float3 color_tonemapped_graded,
    float post_process_strength = 1.f,
    float auto_correction = 0.f) {
  float3 ratio = float3(1.f, 1.f, 1.f);

  if (color_untonemapped.r < color_tonemapped.r) {
    ratio.r = renodx::math::DivideSafe(color_untonemapped.r, color_tonemapped.r, 1.f);
  } else {
    float delta = max(0.f, color_untonemapped.r - color_tonemapped.r);
    float value = color_tonemapped_graded.r + delta;
    ratio.r = color_tonemapped_graded.r > 0.f
                  ? renodx::math::DivideSafe(value, color_tonemapped_graded.r, 0.f)
                  : 0.f;
  }

  if (color_untonemapped.g < color_tonemapped.g) {
    ratio.g = renodx::math::DivideSafe(color_untonemapped.g, color_tonemapped.g, 1.f);
  } else {
    float delta = max(0.f, color_untonemapped.g - color_tonemapped.g);
    float value = color_tonemapped_graded.g + delta;
    ratio.g = color_tonemapped_graded.g > 0.f
                  ? renodx::math::DivideSafe(value, color_tonemapped_graded.g, 0.f)
                  : 0.f;
  }

  if (color_untonemapped.b < color_tonemapped.b) {
    ratio.b = renodx::math::DivideSafe(color_untonemapped.b, color_tonemapped.b, 1.f);
  } else {
    float delta = max(0.f, color_untonemapped.b - color_tonemapped.b);
    float value = color_tonemapped_graded.b + delta;
    ratio.b = color_tonemapped_graded.b > 0.f
                  ? renodx::math::DivideSafe(value, color_tonemapped_graded.b, 0.f)
                  : 0.f;
  }

  float3 auto_correct_ratio = lerp(float3(1.f, 1.f, 1.f), ratio, saturate(color_untonemapped));
  ratio = lerp(ratio, auto_correct_ratio, auto_correction);

  float3 color_scaled = color_tonemapped_graded * ratio;
  return lerp(color_untonemapped, color_scaled, post_process_strength);
}