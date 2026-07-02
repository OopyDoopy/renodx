#include "./psychov_custom.hlsl"

#define LMS_WHITE renodx::color::lms::from::BT709(float3(1.f, 1.f, 1.f))

float GetGammaCorrectionValue() {
  if (RENODX_GAMMA_CORRECTION == renodx::draw::GAMMA_CORRECTION_GAMMA_2_4) return 2.4f;
  return 2.2f;
}

float3 EncodeLMS(float3 color) {
  float3 lms_color = renodx::color::lms::from::BT709(color) / LMS_WHITE;

  if (RENODX_GAMMA_CORRECTION == renodx::draw::GAMMA_CORRECTION_GAMMA_2_2) {
    lms_color = renodx::color::gamma::EncodeSafe(lms_color, 2.2f);
  } else if (RENODX_GAMMA_CORRECTION == renodx::draw::GAMMA_CORRECTION_GAMMA_2_4) {
    lms_color = renodx::color::gamma::EncodeSafe(lms_color, 2.4f);
  } else {
    lms_color = renodx::color::srgb::EncodeSafe(lms_color);
  }

  return renodx::color::bt709::from::LMS(lms_color * LMS_WHITE);
}

float3 DecodeLMS(float3 color) {
  float3 lms_color = renodx::color::lms::from::BT709(color) / LMS_WHITE;

  if (RENODX_GAMMA_CORRECTION == renodx::draw::GAMMA_CORRECTION_GAMMA_2_2) {
    lms_color = renodx::color::gamma::DecodeSafe(lms_color, 2.2f);
  } else if (RENODX_GAMMA_CORRECTION == renodx::draw::GAMMA_CORRECTION_GAMMA_2_4) {
    lms_color = renodx::color::gamma::DecodeSafe(lms_color, 2.4f);
  } else {
    lms_color = renodx::color::srgb::DecodeSafe(lms_color);
  }

  return renodx::color::bt709::from::LMS(lms_color * LMS_WHITE);
}

float3 GammaCorrectionLMS(float3 color, bool invert = false) {
  if (RENODX_GAMMA_CORRECTION == 0.f) return color;
  float3 lms_color = renodx::color::lms::from::BT709(color) / LMS_WHITE;
  lms_color = renodx::color::correct::GammaSafe(lms_color, invert, GetGammaCorrectionValue());
  return renodx::color::bt709::from::LMS(lms_color * LMS_WHITE);
}

float3 IntermediatePass(float3 color) {
  color = GammaCorrectionLMS(color);
  color *= RENODX_DIFFUSE_WHITE_NITS / RENODX_GRAPHICS_WHITE_NITS;
  color = EncodeLMS(color);
  return color;
}

float3 InvertIntermediatePass(float3 color) {
  color = DecodeLMS(color);
  color *= RENODX_GRAPHICS_WHITE_NITS / RENODX_DIFFUSE_WHITE_NITS;
  color = GammaCorrectionLMS(color, true);
  return color;
}

float3 FinalPass(float3 color) {
  color = DecodeLMS(color);
  color = renodx::color::bt2020::from::BT709(color);
  color *= RENODX_GRAPHICS_WHITE_NITS;
  color = min(color, RENODX_PEAK_WHITE_NITS);
  color = renodx::color::pq::EncodeSafe(color, 1.f);
  return color;
}

float HDRBoost(float color, float power = 0.20f, float normalization_point = 0.02f) {
  const float smoothing = power * 2.f;

  float boosted = max(color, lerp(color, normalization_point * pow(color / normalization_point, 1.f + power), renodx::tonemap::Reinhard(color, smoothing)));
  return boosted;
}

float3 HDRBoostLMS(float3 color, float power = 0.20f, float normalization_point = 0.04f) {
  if (power == 0.f) return color;

  float3 lms_color = max(0.f, renodx::color::lms::from::BT709(color) / LMS_WHITE);
  lms_color = float3(
      HDRBoost(lms_color.r, power, normalization_point),
      HDRBoost(lms_color.g, power, normalization_point),
      HDRBoost(lms_color.b, power, normalization_point));

  return renodx::color::bt709::from::LMS(lms_color * LMS_WHITE);
}

float3 CustomTonemap(float3 color) {
  if (RENODX_TONE_MAP_TYPE == 0.f) return saturate(color);
  renodx::tonemap::psycho::config::Config config = renodx::tonemap::psycho::config::BuildConfig();

  if (RENODX_GAMMA_CORRECTION != 0.f) {
    config.peak_value = GammaCorrectionLMS(config.peak_value, true);
  }

  float3 outputColor = color;
  if (RENODX_TONE_MAP_TYPE == 1.f) {
    outputColor = HDRBoostLMS(outputColor, CUSTOM_HDR_BOOST);
    outputColor = renodx::tonemap::psycho::psychotm_customized(outputColor, config);
  }

  return outputColor;
}
