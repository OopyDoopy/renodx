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

float3 EncodeLUTInput(float3 color) {
  if (UPGRADE_LUT_ENCODE == 1.f) {
    return renodx::color::srgb::Encode(color);
  }

  return sqrt(color);
}

float GetLUTY(float3 color_lms) {
  return max(0.f, renodx::color::yf::from::BT709(renodx::color::bt709::from::LMS(color_lms * LMS_WHITE)));
}

float3 EncodeLUTGammaCorrectedLMS(float3 color_lms) {
  return renodx::color::srgb::EncodeSafe(renodx::color::gamma::DecodeSafe(color_lms, GetGammaCorrectionValue()));
}

float3 DecodeLUTGammaCorrectedLMS(float3 color_lms) {
  return renodx::color::gamma::EncodeSafe(renodx::color::srgb::DecodeSafe(color_lms), GetGammaCorrectionValue());
}

float3 UnclampLUT(float3 color_lms, float3 black_lms, float3 mid_lms, float3 neutral_lms) {
  const float black_floor = min(black_lms.r, min(black_lms.g, black_lms.b));
  const float mid_y = GetLUTY(mid_lms);
  const float neutral_y = GetLUTY(neutral_lms);
  const float t = mid_y > 0.f ? saturate((mid_y - neutral_y) / mid_y) : 0.f;
  const float3 floor_remove = float3(black_floor, black_floor, black_floor) * t;

  return max(0.f, color_lms - floor_remove);
}

float3 ApplyLUTScaling(float3 lut_corrected, float3 lut_black, float3 lut_mid, float3 lut_white, float3 neutral_gamma, float mid_gray = 0.18f) {
  const float black_floor = 0.0001f;

  if (CUSTOM_LUT_SCALING == 0.f || mid_gray <= black_floor) return lut_corrected;

  const float lut_white_y = renodx::color::y::from::BT709(renodx::color::srgb::DecodeSafe(saturate(lut_white)));
  if (lut_white_y < mid_gray) return lut_corrected;

  const float3 lut_corrected_original = lut_corrected;

  float3 lut_corrected_lms = renodx::color::lms::from::BT709(lut_corrected) / LMS_WHITE;
  float3 lut_black_lms = renodx::color::lms::from::BT709(lut_black) / LMS_WHITE;
  float3 lut_mid_lms = renodx::color::lms::from::BT709(lut_mid) / LMS_WHITE;
  float3 neutral_lms = renodx::color::lms::from::BT709(neutral_gamma) / LMS_WHITE;

  float3 unclamped_lms = lut_corrected_lms;
  if (RENODX_GAMMA_CORRECTION != 0.f) {
    lut_black_lms = EncodeLUTGammaCorrectedLMS(lut_black_lms);
    lut_mid_lms = EncodeLUTGammaCorrectedLMS(lut_mid_lms);
    lut_corrected_lms = EncodeLUTGammaCorrectedLMS(lut_corrected_lms);
    neutral_lms = EncodeLUTGammaCorrectedLMS(neutral_lms);
    unclamped_lms = DecodeLUTGammaCorrectedLMS(UnclampLUT(lut_corrected_lms, lut_black_lms, lut_mid_lms, neutral_lms));
  } else {
    unclamped_lms = UnclampLUT(lut_corrected_lms, lut_black_lms, lut_mid_lms, neutral_lms);
  }

  const float3 unclamped_gamma = renodx::color::bt709::from::LMS(unclamped_lms * LMS_WHITE);
  return lerp(lut_corrected_original, unclamped_gamma, saturate(CUSTOM_LUT_SCALING));
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
