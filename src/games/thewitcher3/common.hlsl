#include "./shared.h"

float3 ColorPicker(float3 color, float3 sdr_color) {
  if (RENODX_TONE_MAP_TYPE == 0.f) {
    return sdr_color;
  }
  return color;
}

float GetPostProcessingMaxCLL() {
  return CUSTOM_POST_MAXCLL;
}

/// Applies Exponential Roll-Off tonemapping using the maximum channel.
/// Used to fit the color into a 0–output_max range for SDR LUT compatibility.
float3 ToneMapMaxCLL(float3 color, float rolloff_start = 0.375f, float output_max = GetPostProcessingMaxCLL()) {
  if (RENODX_TONE_MAP_TYPE == 0.f) {
    return color;
  }
  color = min(color, 100.f);
  float peak = max(color.r, max(color.g, color.b));
  peak = min(peak, 100.f);
  float log_peak = log2(peak);

  // Apply exponential shoulder in log space
  float log_mapped = renodx::tonemap::ExponentialRollOff(log_peak, log2(rolloff_start), log2(output_max));
  float scale = exp2(log_mapped - log_peak);  // How much to compress all channels

  return min(output_max, color * scale);
}

// float3 CustomUpgradeToneMap(float3 untonemapped, float3 tonemapped_bt709) {
//   if (RENODX_TONE_MAP_TYPE == 0.f) {
//     return tonemapped_bt709;
//   }
//   return renodx::tonemap::UpgradeToneMap(untonemapped, ToneMapMaxCLL(untonemapped), tonemapped_bt709, RENODX_COLOR_GRADE_STRENGTH);
// }

float3 CustomUpgradeGrading(float3 ungraded, float3 ungraded_sdr, float3 graded) {
  if (RENODX_TONE_MAP_TYPE == 0.f) {
    return lerp(ungraded, graded, CUSTOM_LUT_STRENGTH);
  }
  //float3 neutral_sdr = ToneMapMaxCLL(ungraded);
  return renodx::draw::UpgradeToneMapByLuminance(ungraded, ungraded_sdr, graded, CUSTOM_LUT_STRENGTH);
}

float3 CustomTonemap(float3 color) {
  // renodx::draw::Config config = renodx::draw::BuildConfig();
  // config.reno_drt_tone_map_method = renodx::draw::TONE_MAP_TYPE_UNTONEMAPPED;
  if (RENODX_TONE_MAP_TYPE == 0.f) {
    return color;
  }
  return renodx::draw::ToneMapPass(color);
}

float3 applyDice(float3 color, float paperWhite = RENODX_DIFFUSE_WHITE_NITS, float peakWhite = RENODX_PEAK_WHITE_NITS) {
  paperWhite = paperWhite / renodx::color::srgb::REFERENCE_WHITE;
  peakWhite = peakWhite / renodx::color::srgb::REFERENCE_WHITE;
  const float highlightsShoulderStart = paperWhite;
  return renodx::tonemap::dice::BT709(color * paperWhite, peakWhite, highlightsShoulderStart) / paperWhite;
}

// float3 CustomDisplayMap(float3 color) {
//   if (RENODX_TONE_MAP_TYPE == 0.f || RENODX_TONE_MAP_TYPE == 1.f) {
//     return color;
//   }
//   if (RENODX_TONE_MAP_TYPE == 2.f) {
//     return applyDice(color);
//   }
//   return color;
// }

float GetSunshaftScale() {
  return CUSTOM_SUNSHAFTS_STRENGTH;
}

float GetBloomScale() {
  return CUSTOM_BLOOM;
}

// float3 CustomColorTemp(float3 color) {
//   if (RENODX_TONE_MAP_TYPE == 0.f) {
//     return color;
//   }
//   if (RENODX_SWAP_CHAIN_CUSTOM_COLOR_SPACE == renodx::draw::COLOR_SPACE_CUSTOM_BT709D93) {
//     color = renodx::color::convert::ColorSpaces(color, RENODX_SWAP_CHAIN_DECODING_COLOR_SPACE, renodx::color::convert::COLOR_SPACE_BT709);
//     color = renodx::color::bt709::from::BT709D93(color);
//     RENODX_SWAP_CHAIN_DECODING_COLOR_SPACE = renodx::color::convert::COLOR_SPACE_BT709;
//   } else if (RENODX_SWAP_CHAIN_CUSTOM_COLOR_SPACE == renodx::draw::COLOR_SPACE_CUSTOM_NTSCU) {
//     color = renodx::color::convert::ColorSpaces(color, RENODX_SWAP_CHAIN_DECODING_COLOR_SPACE, renodx::color::convert::COLOR_SPACE_BT709);
//     color = renodx::color::bt709::from::BT601NTSCU(color);
//     RENODX_SWAP_CHAIN_DECODING_COLOR_SPACE = renodx::color::convert::COLOR_SPACE_BT709;
//   } else if (RENODX_SWAP_CHAIN_CUSTOM_COLOR_SPACE == renodx::draw::COLOR_SPACE_CUSTOM_NTSCJ) {
//     color = renodx::color::convert::ColorSpaces(color, RENODX_SWAP_CHAIN_DECODING_COLOR_SPACE, renodx::color::convert::COLOR_SPACE_BT709);
//     color = renodx::color::bt709::from::ARIBTRB9(color);
//     RENODX_SWAP_CHAIN_DECODING_COLOR_SPACE = renodx::color::convert::COLOR_SPACE_BT709;
//   }
//   return color;
// }

float3 CustomBloomTonemap(float3 color, float exposure = 0.2f) {
  if (RENODX_TONE_MAP_TYPE == 0.f) {
    return color;
  }
  // return ToneMapMaxCLL(color, 0.2f, GetPostProcessingMaxCLL());
  return ToneMapMaxCLL(color, exposure, GetPostProcessingMaxCLL());
}