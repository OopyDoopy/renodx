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

float GetLUTYBT709(float3 color) {
  return max(0.f, renodx::color::yf::from::BT709(color));
}

float GetLUTYLMS(float3 color_lms) {
  return max(0.f, renodx::color::yf::from::BT709(renodx::color::bt709::from::LMS(color_lms * LMS_WHITE)));
}

float3 EncodeLUTGammaCorrected(float3 color) {
  return renodx::color::srgb::EncodeSafe(renodx::color::gamma::DecodeSafe(color));
}

float3 DecodeLUTGammaCorrected(float3 color) {
  return renodx::color::gamma::EncodeSafe(renodx::color::srgb::DecodeSafe(color));
}

float3 Unclamp(float3 color, float3 black, float3 mid, float3 neutral, bool use_lms) {
  const float black_floor = min(black.r, min(black.g, black.b));
  const float mid_y = use_lms ? GetLUTYLMS(mid) : GetLUTYBT709(mid);
  const float neutral_y = use_lms ? GetLUTYLMS(neutral) : GetLUTYBT709(neutral);
  const float t = mid_y > 0.f ? saturate((mid_y - neutral_y) / mid_y) : 0.f;
  const float3 floor_remove = float3(black_floor, black_floor, black_floor) * t;

  return max(0.f, color - floor_remove);
}