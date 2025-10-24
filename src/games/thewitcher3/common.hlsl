#include "./shared.h"

float3 BT709FromHueMethod(float3 color) {
  if (CUSTOM_SCENE_HUE_METHOD == 0) {  // OKLab
    color = renodx::color::bt709::from::OkLab(color);
  } else if (CUSTOM_SCENE_HUE_METHOD == 1) {  // ICtCp
    color = renodx::color::bt709::from::ICtCp(color);
  } else if (CUSTOM_SCENE_HUE_METHOD == 2) {  // OKLCH
    color = renodx::color::bt709::from::OkLCh(color);
  }
  return color;
}

float3 HueMethodFromBT709(float3 color) {
  if (CUSTOM_SCENE_HUE_METHOD == 0) {  // OKLab
    color = renodx::color::oklab::from::BT709(color);
  } else if (CUSTOM_SCENE_HUE_METHOD == 1) {  // ICtCp
    color = renodx::color::ictcp::from::BT709(color);
  } else if (CUSTOM_SCENE_HUE_METHOD == 2) {  // OKLCH
    color = renodx::color::oklch::from::BT709(color);
  }
  return color;
}

void GamutCompression(inout float3 color, inout float compression_scale) {
  float3 gamma_color = renodx::color::gamma::EncodeSafe(color);
  float grayscale = renodx::color::y::from::BT709(gamma_color.rgb);
  compression_scale = renodx::color::correct::ComputeGamutCompressionScale(gamma_color.rgb, grayscale);
  gamma_color = renodx::color::correct::GamutCompress(gamma_color, grayscale, compression_scale);
  color = renodx::color::gamma::DecodeSafe(gamma_color);
}

void GamutDecompression(inout float3 color, float compression_scale) {
  float3 gamma_color = renodx::color::gamma::EncodeSafe(color);
  gamma_color = renodx::color::correct::GamutDecompress(gamma_color, compression_scale);
  color = renodx::color::gamma::DecodeSafe(gamma_color);
}

float3 HDRBoost(float3 color, float power = 0.20f, float normalization_point = 0.02f) {
  if (power == 0.f) return color;
  // return lerp(color, normalization_point * renodx::math::SafePow(color / normalization_point, 1.f + power), color);

  float compression_scale;
  GamutCompression(color, compression_scale);

  float smoothing = power * 2.f;
  color = max(color, lerp(color, normalization_point * pow(color / normalization_point, 1.f + power), color / ((color / smoothing) + 1)));

  GamutDecompression(color, compression_scale);
  return color;
}

float3 ApplyExposureContrastFlareHighlightsShadowsByLuminance(float3 untonemapped, float y, renodx::color::grade::Config config, float mid_gray = 0.18f) {
  if (config.exposure == 1.f && config.shadows == 1.f && config.highlights == 1.f && config.contrast == 1.f && config.flare == 0.f) {
    return untonemapped;
  }
  float3 color = untonemapped;

  color *= config.exposure;

  const float y_normalized = y / mid_gray;
  const float highlight_mask = 1.f / mid_gray;
  const float shadow_mask = mid_gray;

  // contrast & flare
  float flare = renodx::math::DivideSafe(y_normalized + config.flare, y_normalized, 1.f);
  float exponent = config.contrast * flare;
  const float y_contrasted = pow(y_normalized, exponent);

  // highlights
  float y_highlighted = pow(y_contrasted, config.highlights);
  y_highlighted = lerp(y_contrasted, y_highlighted, saturate(y_contrasted / highlight_mask));

  // shadows
  float y_shadowed = pow(y_highlighted, -1.f * (config.shadows - 2.f));
  y_shadowed = lerp(y_shadowed, y_highlighted, saturate(y_highlighted / shadow_mask));

  const float y_final = y_shadowed * mid_gray;

  color *= (y > 0 ? (y_final / y) : 0);

  return color;
}

float3 ApplySaturationBlowoutHighlightSaturation(float3 tonemapped, float y, renodx::color::grade::Config config) {
  float3 color = tonemapped;
  if (config.saturation != 1.f || config.dechroma != 0.f || config.blowout != 0.f) {
    float3 perceptual_new = HueMethodFromBT709(color);

    if (config.dechroma != 0.f) {
      perceptual_new.yz *= lerp(1.f, 0.f, saturate(pow(y / (10000.f / 100.f), (1.f - config.dechroma))));
    }

    if (config.blowout != 0.f) {
      float percent_max = saturate(y * 100.f / 10000.f);
      // positive = 1 to 0, negative = 1 to 2
      float blowout_strength = 100.f;
      float blowout_change = pow(1.f - percent_max, blowout_strength * abs(config.blowout));
      if (config.blowout < 0) {
        blowout_change = (2.f - blowout_change);
      }

      perceptual_new.yz *= blowout_change;
    }

    perceptual_new.yz *= config.saturation;

    color = BT709FromHueMethod(perceptual_new);

    color = renodx::color::bt709::clamp::AP1(color);
  }
  return color;
}

// float3 ColorPicker(float3 color, float3 sdr_color) {
//   if (RENODX_TONE_MAP_TYPE < 2.f) {
//     return sdr_color;
//   }
//   return color;
// }

// float GetPostProcessingMaxCLL() {
//   return CUSTOM_POST_MAXCLL;
// }

/// Applies Exponential Roll-Off tonemapping using the maximum channel.
/// Used to fit the color into a 0–output_max range for SDR LUT compatibility.
float3 ToneMapMaxCLL(float3 color, float rolloff_start = 0.375f, float output_max = 1.f) {
  if (RENODX_TONE_MAP_TYPE < 2.f) {
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

float3 NeutralSDRYLerp(float3 color) {
  float color_y = renodx::color::y::from::BT709(color);
  color = lerp(color, renodx::tonemap::renodrt::NeutralSDR(color), saturate(color_y));
  return color;
}

float3 PreTonemapSliders(float3 untonemapped) {
  if (RENODX_TONE_MAP_TYPE == 1.f) return untonemapped;
  renodx::color::grade::Config config = renodx::color::grade::config::Create();
  config.exposure = RENODX_TONE_MAP_EXPOSURE;
  config.contrast = RENODX_TONE_MAP_CONTRAST;
  config.flare = RENODX_TONE_MAP_FLARE;
  config.shadows = RENODX_TONE_MAP_SHADOWS;
  config.highlights = RENODX_TONE_MAP_HIGHLIGHTS;

  float y = renodx::color::y::from::BT709(untonemapped);
  float3 outputColor = ApplyExposureContrastFlareHighlightsShadowsByLuminance(untonemapped, y, config);
  outputColor = HDRBoost(outputColor, CUSTOM_INVERSE_TONEMAP);
  return outputColor;
}

float3 PostTonemapSliders(float3 hdr_color) {
  renodx::color::grade::Config config = renodx::color::grade::config::Create();
  config.saturation = RENODX_TONE_MAP_SATURATION;
  config.blowout = RENODX_TONE_MAP_HIGHLIGHT_SATURATION;
  config.dechroma = RENODX_TONE_MAP_BLOWOUT;
  config.blowout = -1.f * (RENODX_TONE_MAP_HIGHLIGHT_SATURATION - 1.f);

  float y = renodx::color::y::from::BT709(hdr_color);
  return ApplySaturationBlowoutHighlightSaturation(hdr_color, y, config);
}

float3 CustomUpgradeToneMap(float3 untonemapped, float3 tonemapped_bt709_ch, float3 tonemapped_bt709_lum, float mid_gray) {
  if (RENODX_TONE_MAP_TYPE == 1.f) return tonemapped_bt709_ch;
  float3 outputColor;

  float mid_gray_scale = mid_gray / 0.18f;
  float3 untonemapped_midgray = untonemapped * mid_gray_scale;

  float3 tonemapped_bt709 = lerp(tonemapped_bt709_ch, tonemapped_bt709_lum, CUSTOM_SCENE_GRADE_SATURATION_CORRECTION);
  tonemapped_bt709 = lerp(untonemapped_midgray, tonemapped_bt709, RENODX_COLOR_GRADE_STRENGTH);

  float untonemapped_midgray_y = renodx::color::y::from::BT709(untonemapped_midgray);
  float untonemapped_y = renodx::color::y::from::BT709(untonemapped);
  float tonemapped_bt709_ch_y = renodx::color::y::from::BT709(tonemapped_bt709_ch);
  float tonemapped_bt709_lum_y = renodx::color::y::from::BT709(tonemapped_bt709_lum);
  float tonemapped_bt709_y = renodx::color::y::from::BT709(tonemapped_bt709);

  if (RENODX_TONE_MAP_TYPE < 2.f) {
    outputColor = tonemapped_bt709;
  }
  else {
    outputColor = lerp(tonemapped_bt709, untonemapped_midgray, saturate(tonemapped_bt709_y));
  }
  outputColor = renodx::color::correct::Chrominance(outputColor, lerp(tonemapped_bt709, tonemapped_bt709_ch, saturate(tonemapped_bt709_y / mid_gray)), 1.f, CUSTOM_SCENE_GRADE_BLOWOUT_RESTORATION);
  if (RENODX_TONE_MAP_TYPE > 1.f) outputColor = renodx::color::correct::Hue(outputColor, tonemapped_bt709_ch, CUSTOM_SCENE_GRADE_HUE_CORRECTION, CUSTOM_SCENE_HUE_METHOD);
  return outputColor;
}

// Smoothly clamp x to 1.0

float ColorGradeSmoothClamp(float x)
{
  const float u = 0.525;

  float q = (2.0 - u - 1.0 / u + x * (2.0 + 2.0 / u - x / u)) / 4.0;

  return (abs(1.0 - x) < u) ? q : saturate(x);
}

// Approximate SDR color grading with an HDR image

float4 ColorGradingSDR(float3 rgbHdr)
{
  if (RENODX_TONE_MAP_TYPE < 2) return float4(rgbHdr, 0.f);
  // Find the maximum component

  // float gMax = max3(rgbHdr);
  float gMax = max(rgbHdr.x, max(rgbHdr.y, rgbHdr.z));
  gMax = max(gMax, 1e-6);

  // Clamp HDR to 0-1 range, and calculate scale for re-expansion

  float gClamped = ColorGradeSmoothClamp(gMax);
  float rScale = gClamped / gMax;

  // Perform standard SDR color grading

  return float4(rgbHdr * rScale, rScale);
}

float3 ColorGradeHDR(float4 rgbGraded) {
  if (RENODX_TONE_MAP_TYPE < 2) return rgbGraded.rgb;
  return rgbGraded.rgb / rgbGraded.w;
}

float3 CustomGradingSDR(float3 ungraded) {
  if (RENODX_TONE_MAP_TYPE < 2.f) {
    return ungraded;
  }
  // return NeutralSDRYLerp(ungraded);
  return ToneMapMaxCLL(ungraded);
  // return renodx::tonemap::ReinhardPiecewise(ungraded);
}

float3 CustomUpgradeGrading(float3 ungraded, float3 ungraded_sdr, float3 graded) {
  if (RENODX_TONE_MAP_TYPE < 2.f) {
    return lerp(ungraded, graded, CUSTOM_LUT_STRENGTH);
  }
  // float3 neutral_sdr = ToneMapMaxCLL(ungraded);
  return renodx::tonemap::UpgradeToneMap(ungraded, ungraded_sdr, graded, CUSTOM_LUT_STRENGTH);
}

float3 applyDice(float3 color, float paperWhite = RENODX_DIFFUSE_WHITE_NITS, float peakWhite = RENODX_PEAK_WHITE_NITS) {
  paperWhite = paperWhite / renodx::color::srgb::REFERENCE_WHITE;
  peakWhite = peakWhite / renodx::color::srgb::REFERENCE_WHITE;
  const float highlightsShoulderStart = paperWhite;
  return renodx::tonemap::dice::BT709(color * paperWhite, peakWhite, highlightsShoulderStart) / paperWhite;
}

renodx::draw::Config SdrConfig() {
  renodx::draw::Config config = renodx::draw::BuildConfig();
  config.peak_white_nits = renodx::color::srgb::REFERENCE_WHITE;
  config.diffuse_white_nits = renodx::color::srgb::REFERENCE_WHITE;
  config.graphics_white_nits = renodx::color::srgb::REFERENCE_WHITE;
  //config.reno_drt_white_clip = 1.f;
  return config;
}

float3 HDRDisplayMap(float3 color, float tonemapper) {
  renodx::draw::Config config = renodx::draw::BuildConfig();  // Pulls config values

  float peak_nits = config.peak_white_nits / renodx::color::bt709::REFERENCE_WHITE;              // Normalizes peak
  float diffuse_white_nits = config.diffuse_white_nits / renodx::color::bt709::REFERENCE_WHITE;  // Normalizes game brightness

  float compression_scale;
  GamutCompression(color, compression_scale);

  // color = renodx::color::bt2020::from::BT709(color);

  float3 outputColor = color;
  if (tonemapper == 2.f) {
    outputColor = renodx::tonemap::HermiteSplinePerChannelRolloff(color, peak_nits / diffuse_white_nits, 100.f);
  }

  GamutDecompression(outputColor, compression_scale);

  // outputColor = renodx::color::bt709::from::BT2020(color);

  return outputColor;
}

float3 CustomTonemap(float3 color) {

  if (RENODX_TONE_MAP_TYPE == 1.f) {
      return saturate(color);
  }

  float3 outputColor = color;
  outputColor = PreTonemapSliders(outputColor);
  outputColor = HDRDisplayMap(outputColor, RENODX_TONE_MAP_TYPE);
  outputColor = PostTonemapSliders(outputColor);
  return outputColor;
}

float GetSunshaftScale() {
  return 1.f;
  //return CUSTOM_SUNSHAFTS_STRENGTH;
}

float GetBloomScale() {
  return CUSTOM_BLOOM;
}

float3 CustomBloomTonemap(float3 color, float exposure = 0.2f) {
  if (RENODX_TONE_MAP_TYPE < 2.f) {
    return color;
  }
  return min(color, CUSTOM_BLOOM);
}

float3 CustomSunshaftsTonemap(float3 color) {
  if (RENODX_TONE_MAP_TYPE < 2.f) {
    return color;
  }
  return min(color, CUSTOM_SUNSHAFTS_STRENGTH);
}

float hdrSaturate(float color) {
  if (RENODX_TONE_MAP_TYPE == 1.f) {
    return saturate(color);
  }
  color = max(color, 0.f);
  // color = min(color, 100.f);
  return color;
}

float3 ClampPostProcessing(float3 value, float clamp_value) {
  float3 outputColor;
  outputColor.x = min(value.x, clamp_value);
  outputColor.y = min(value.y, clamp_value);
  outputColor.z = min(value.z, clamp_value);
  //outputColor = ToneMapMaxCLL(value);
  return outputColor;
}

float4 HandleUICompositing(float4 ui_color_linear, float4 scene_color_linear) {
  float3 ui_color;
  ui_color.rgb = renodx::color::srgb::EncodeSafe(ui_color_linear.rgb);

  float3 scene_color_srgb = renodx::color::srgb::EncodeSafe(scene_color_linear.rgb);

  // Blend in SRGB based on opacity
  float3 composited_color = lerp(scene_color_srgb, ui_color.rgb, saturate(ui_color_linear.a));
  float3 linear_color = renodx::color::srgb::DecodeSafe(composited_color);

  float4 output_color;
  output_color.rgb = linear_color;
  output_color.a = ui_color_linear.a;

  return output_color;
}

float4 HandleUICompositingHDR(float4 ui_color_linear, float4 scene_color_linear) {
  return HandleUICompositing(ui_color_linear * (RENODX_GRAPHICS_WHITE_NITS / RENODX_DIFFUSE_WHITE_NITS), scene_color_linear);
}

float Normalize(float x, float minVal, float maxVal)
{
  return saturate((x - minVal) / (maxVal - minVal));
}

float Rescale(float y, float minVal, float maxVal)
{
  return lerp(minVal, maxVal, y);
}

float s_curve(float value) {
  return 1 / (1 + exp(-value));
}

float s_curve_bloom_intensity(float value) {
  value = Normalize(value, 0.f, 15.f);
  // value = 1 / (1 + exp(-10 * (value - 0.5)));
  value = s_curve(value);
  return Rescale(value, 0.f, 15.f);
}