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