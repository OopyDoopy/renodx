#include "./shared.h"

#define LMS_WHITE_BT709  renodx::color::lms::from::BT709(1.0f)
#define LMS_WHITE_BT2020 renodx::color::lms::from::BT2020(1.0f)

float3 ApplyPostProcessing(float3 color, float2 uv) {
  return renodx::effects::ApplyFilmGrain(color, uv, CUSTOM_RANDOM, CUSTOM_FILM_GRAIN_STRENGTH * 0.03f);
}

float3 GammaCorrectionLMS(float3 color_bt709, bool inverse = false) {
  float3 color_lms = renodx::color::lms::from::BT709(color_bt709) / LMS_WHITE_BT709;
  color_lms = renodx::color::correct::GammaSafe(color_lms, inverse);
  return renodx::color::bt709::from::LMS(color_lms * LMS_WHITE_BT709);
}

float3 HDREncodePQ(float3 linear_bt709) {
  float3 linear_bt2020 = renodx::color::bt2020::from::BT709(linear_bt709);
  //linear_bt2020 = min((RENODX_PEAK_WHITE_NITS / RENODX_DIFFUSE_WHITE_NITS), linear_bt2020);
  float3 pq_bt2020 = renodx::color::pq::EncodeSafe(linear_bt2020, RENODX_DIFFUSE_WHITE_NITS);
  return pq_bt2020;
}

float3 HDREncodeSRGB(float3 linear_bt709) {
  linear_bt709 *= RENODX_DIFFUSE_WHITE_NITS;
  linear_bt709 = min(RENODX_PEAK_WHITE_NITS / RENODX_DIFFUSE_WHITE_NITS, linear_bt709);
  float3 srgb_bt709 = renodx::color::srgb::EncodeSafe(linear_bt709);
  return srgb_bt709;
}