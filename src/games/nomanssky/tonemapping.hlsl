#include "./uncharted2extended.hlsli"

float3 ToneMapMaxCLL(float3 color, float rolloff_start = 0.375f, float output_max = 1.f) {
  color = min(color, 100.f);
  float peak = max(color.r, max(color.g, color.b));
  peak = min(peak, 100.f);
  float log_peak = log2(peak);

  // Apply exponential shoulder in log space
  float log_mapped = renodx::tonemap::ExponentialRollOff(log_peak, log2(rolloff_start), log2(output_max));
  float scale = exp2(log_mapped - log_peak);  // How much to compress all channels

  return min(output_max, color * scale);
}

float3 VanillaUncharted2Tonemap(float3 x) {
//   float3 _552 = x * 0.2199999988079071044921875;
//   float3 _535 = ((fma(x, _552 + float3(0.0300000011920928955078125), float3(0.00200000009499490261077880859375)) / fma(x, _552 + float3(0.300000011920928955078125), float3(0.060000002384185791015625))) - float3(0.0333333313465118408203125)) * float3(2.492836475372314453125);
//   return _535;
  return renodx::tonemap::uncharted2::BT709(x, 1.f);
}

float3 Uncharted2Extended(float3 untonemapped) {
  if (RENODX_TONE_MAP_TYPE == 0.f) {
    return VanillaUncharted2Tonemap(untonemapped);
  }

  float A = 0.22f, B = 0.30f, C = 0.10f, D = 0.20f, E = 0.01f, F = 0.30f;
  const float W = 1.f;

  float coeffs[6] = { A, B, C, D, E, F };
  float white_precompute = 1.0f / renodx::tonemap::ApplyCurve(W, A, B, C, D, E, F);
  Uncharted2::Config::Uncharted2ExtendedConfig uc2_config = Uncharted2::Config::CreateUncharted2ExtendedConfig(coeffs, white_precompute);

  float3 outputColor = Uncharted2::ApplyExtended(untonemapped, uc2_config);

  return outputColor;
}

// Matches the Uncharted2 parameters used in 0x5DA105E2.frag.slang
float3 Uncharted2Extended_5DA105E2(float3 untonemapped) {
  float3 x = untonemapped;

  float A = 0.22f, B = 0.30f, C = 0.10f, D = 0.20f, E = 0.01f, F = 0.30f;
  const float W = 1.f;

  float coeffs[6] = { A, B, C, D, E, F };
  float white_precompute = 1.11718451976776123046875f;
  Uncharted2::Config::Uncharted2ExtendedConfig uc2_config = Uncharted2::Config::CreateUncharted2ExtendedConfig(coeffs, white_precompute);

  float3 outputColor = Uncharted2::ApplyExtended(x, uc2_config);
  return outputColor;
}

float3 CustomGradingSDRTonemap(float3 color) {
  float3 hdr_color = Uncharted2Extended(color);
  return ToneMapMaxCLL(hdr_color);
}

float3 CustomUpgradeGrading(float3 untonemapped, float3 sdr_color, float3 sdr_color_graded) {
  return renodx::tonemap::UpgradeToneMap(untonemapped, sdr_color, sdr_color_graded);
}

float3 HDRBoost(float3 color, float power = 0.20f, int mode = 0, float normalization_point = 0.02f) {
  if (power == 0.f) return color;
  // return lerp(color, normalization_point * renodx::math::SafePow(color / normalization_point, 1.f + power), color);

  // float compression_scale;
  // GamutCompression(color, compression_scale);

  color = max(0, renodx::color::bt2020::from::BT709(color));

  float smoothing = power * 2.f;

  if (mode == 0) {  // Per Channel
    color = max(color, lerp(color, normalization_point * pow(color / normalization_point, 1.f + power), color / ((color / smoothing) + 1)));
  } 
  else if (mode == 1) {  // By Luminance
    float y_in = renodx::color::y::from::BT709(color);
    float y_out = max(y_in, lerp(y_in, normalization_point * pow(y_in / normalization_point, 1.f + power), y_in / ((y_in / smoothing) + 1)));
    color = renodx::color::correct::Luminance(color, y_in, y_out);
  }

  // GamutDecompression(color, compression_scale);
  color = renodx::color::bt709::from::BT2020(color);
  return color;
}

float3 ApplyExposureContrastFlareHighlightsShadowsByLuminance(float3 untonemapped, float y, renodx::color::grade::Config config, float mid_gray = 0.18f) {
  if (config.exposure == 1.f && config.shadows == 1.f && config.highlights == 1.f && config.contrast == 1.f && config.flare == 0.f) {
    return untonemapped;
  }
  float3 color = untonemapped;

  color *= config.exposure;

  // contrast & flare
  const float y_normalized = y / mid_gray;
  float flare = renodx::math::DivideSafe(y_normalized + config.flare, y_normalized, 1.f);
  float exponent = config.contrast * flare;
  const float y_contrasted = pow(y_normalized, exponent) * mid_gray;

  // highlights
  float y_highlighted = renodx::color::grade::Highlights(y_contrasted, config.highlights, mid_gray);

  // shadows
  float y_shadowed = renodx::color::grade::Shadows(y_highlighted, config.shadows, mid_gray);
  y_shadowed = max(0, y_shadowed);  // clamp to prevent artifacts

  const float y_final = y_shadowed;

  color = renodx::color::correct::Luminance(color, y, y_final);

  return color;
}

float3 ApplySaturationBlowoutHighlightSaturation(float3 tonemapped, float y, renodx::color::grade::Config config) {
  float3 color = tonemapped;
  if (config.saturation != 1.f || config.dechroma != 0.f || config.blowout != 0.f) {
    float3 perceptual_new = renodx::color::oklab::from::BT709(color);

    if (config.dechroma != 0.f) {
      perceptual_new.yz *= lerp(1.f, 0.f, saturate(pow(y / (10000.f / 100.f), (1.f - config.dechroma))));
      // perceptual_new.yz *= lerp(1.f, 0.f, saturate(pow(exp2(y) / (10000.f / 100.f), (1.f - config.dechroma))));
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

    color = renodx::color::bt709::from::OkLab(perceptual_new);

    color = renodx::color::bt709::clamp::AP1(color);
  }
  return color;
}

float3 ApplyPerChannelBlowoutHueShift(float3 untonemapped, float mid_gray = 0.18f, float max_value = 1.f) {
  if (CUSTOM_SCENE_GRADE_PER_CHANNEL_BLOWOUT > 0.f) {
    float calculated_peak = CUSTOM_SCENE_GRADE_PER_CHANNEL_BLOWOUT + (max_value - 1.f);
    calculated_peak = max(calculated_peak, 1.f);

    // float compression_scale;
    // GamutCompression(untonemapped, compression_scale);
    untonemapped = max(0, renodx::color::bt2020::from::BT709(untonemapped));

    // float3 graded_color = renodx::tonemap::HermiteSplinePerChannelRolloff(untonemapped, calculated_peak, 100.f);
    // float3 graded_color = renodx::tonemap::ReinhardPiecewise(untonemapped, calculated_peak, 0.5f + ((mid_gray / 0.18f) - 1.f));
    float3 graded_color = renodx::tonemap::ReinhardPiecewise(untonemapped, calculated_peak, mid_gray);
    // float3 graded_color = renodx::tonemap::ReinhardScalableExtended(untonemapped, 11.2f, calculated_peak, 0.f, mid_gray, mid_gray);
    //  float3 graded_color = renodx::tonemap::dice::BT709(untonemapped, calculated_peak);
    // float3 graded_color = renodx::tonemap::HermiteSplinePerChannelRolloff(untonemapped, calculated_peak, 100.f);
    float3 color = renodx::color::correct::Chrominance(untonemapped, graded_color, 1.f, 0.f, 0);
    color = renodx::color::correct::Hue(color, graded_color, CUSTOM_SCENE_GRADE_HUE_SHIFT, 0);

    // GamutDecompression(color, compression_scale);
    color = renodx::color::bt709::from::BT2020(color);
    return color;
  }
  return untonemapped;
}

float3 DisplayMap(float3 color) {
  renodx::draw::Config config = renodx::draw::BuildConfig();  // Pulls config values

  float peak_nits = config.peak_white_nits / renodx::color::srgb::REFERENCE_WHITE;              // Normalizes peak
  float diffuse_white_nits = config.diffuse_white_nits / renodx::color::srgb::REFERENCE_WHITE;  // Normalizes game brightness
                                                                                                // float peak_nits = config.peak_white_nits / 80.f;
  // float diffuse_white_nits = config.diffuse_white_nits / 80.f;

  // float compression_scale;
  // GamutCompression(color, compression_scale);

  color = max(0, renodx::color::bt2020::from::BT709(color));
  float tonemap_peak = peak_nits / diffuse_white_nits;

  float3 outputColor = color;
  if (RENODX_TONE_MAP_TYPE == 1) {
    outputColor = renodx::tonemap::neutwo::MaxChannel(outputColor, tonemap_peak);
  }

  // GamutDecompression(outputColor, compression_scale);

  outputColor = renodx::color::bt709::from::BT2020(outputColor);

  return outputColor;
}

float3 PreTonemapSliders(float3 untonemapped) {
  if (RENODX_TONE_MAP_TYPE == 0.f) return untonemapped;
  renodx::color::grade::Config config = renodx::color::grade::config::Create();
  config.exposure = RENODX_TONE_MAP_EXPOSURE;
  config.contrast = RENODX_TONE_MAP_CONTRAST;
  config.flare = RENODX_TONE_MAP_FLARE;
  config.shadows = RENODX_TONE_MAP_SHADOWS;
  config.highlights = RENODX_TONE_MAP_HIGHLIGHTS;

  float y = renodx::color::y::from::BT709(untonemapped);
  float3 outputColor = ApplyExposureContrastFlareHighlightsShadowsByLuminance(untonemapped, y, config);
  outputColor = HDRBoost(outputColor, CUSTOM_HDR_BOOST, 1, 0.04f);
  // if (RENODX_TONE_MAP_TYPE < 2.f) return outputColor;
  outputColor = ApplyPerChannelBlowoutHueShift(outputColor, 0.5f);
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

float3 CustomTonemap(float3 untonemapped, float2 uv) {
  untonemapped = PreTonemapSliders(untonemapped);
  untonemapped = PostTonemapSliders(untonemapped);
  float3 tonemapped = DisplayMap(untonemapped);
  tonemapped = renodx::effects::ApplyFilmGrain(tonemapped, uv, CUSTOM_RANDOM, CUSTOM_FILM_GRAIN_STRENGTH * 0.03f);
  return tonemapped;
}