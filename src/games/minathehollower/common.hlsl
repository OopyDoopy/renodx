#include "./shared.h"

#define LMS_WHITE renodx::color::lms::from::BT709(float3(1, 1, 1))

float HDRBoost(float color, float power, float3 normalization_point) {
  if (power == 0) return color;
  const float smoothing = power * 2.f;
  float boosted = max(color, lerp(color, normalization_point * pow(color / normalization_point, 1.f + power), renodx::tonemap::Reinhard(color, smoothing)));
  return boosted;
}

float3 HDRBoost(float3 color, float power, float3 normalization_point) {
  return float3(
      HDRBoost(color.r, power, normalization_point),
      HDRBoost(color.g, power, normalization_point),
      HDRBoost(color.b, power, normalization_point)
  );
}

float3 ApplyGradingLMS(float3 color) {
    float3 lms_color = renodx::color::lms::from::BT709(color);

    lms_color = HDRBoost(lms_color / LMS_WHITE, RENODX_TONE_MAP_HDR_BOOST, 0.04f / LMS_WHITE) * LMS_WHITE;

    if (RENODX_TONE_MAP_SATURATION != 1.f) {
      float3 mb = renodx::color::macleod_boynton::from::LMS(lms_color);
      float2 mb_white = renodx::color::macleod_boynton::from::LMS(1.f.xxx).xy;
      float2 mb_scaled = lerp(mb_white, mb.xy, RENODX_TONE_MAP_SATURATION);
      lms_color = renodx::color::lms::from::MacLeodBoynton(float3(mb_scaled, mb.z));
    }

    float calculated_peak = renodx::color::correct::GammaSafe((RENODX_PEAK_WHITE_NITS / RENODX_GAME_BRIGHTNESS), true);
    float3 lms_peak = renodx::color::lms::from::BT709(calculated_peak);
    float3 lms_clip = max(renodx::color::lms::from::BT709(100.f), lms_peak);

    lms_color = renodx::tonemap::neutwo::PerChannel(lms_color / LMS_WHITE, lms_peak / LMS_WHITE, lms_clip / LMS_WHITE) * LMS_WHITE;

    lms_color = renodx::color::gamut::GamutCompressLMSBoundBT2020(lms_color);

    float3 bt709_color = renodx::color::bt709::from::LMS(lms_color);
    bt709_color = renodx::color::correct::GammaSafe(bt709_color);
    return bt709_color;
}