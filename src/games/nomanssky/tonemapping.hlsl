#include "./uncharted2extended.hlsli"
#include "./common.hlsl"

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
  if (RENODX_TONE_MAP_TYPE < 2) {
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
  return renodx::tonemap::UpgradeToneMap(untonemapped, sdr_color, sdr_color_graded, CUSTOM_COLOR_GRADING);
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

float NR(float x, float sigma, float n) {
  float ax = abs(x);
  float xn = pow(max(ax, 0.0f), n);
  float sn = pow(max(sigma, 1e-6f), n);
  float r = xn / (xn + sn);
  return (x < 0.0f) ? -r : r;
}

float NR_inv(float r, float sigma, float n) {
  float ar = abs(r);
  float rc = min(ar, 1.0f - 1e-6f);
  float denom = max(1.0f - rc, 1e-6f);
  float x = sigma * pow(rc / denom, 1.0f / n);
  return (r < 0.0f) ? -x : x;
}

// CVVDP-style chroma plateau, but with a cone-domain Naka-Rushton stage.
// The NR semi-saturation is anchored to CastleCSF achromatic sensitivity
// at the adapting background (heuristic tie between detectability and cone gain).
float3 CastleDechroma_CVVDPStyle_NakaRushton(
    float3 rgb_lin,
    float Lbkg_nits = 100.f,
    float diffuse_white = 100.f,
    float nr_n = 1.00f,
    float nr_response_at_thr = 0.18f) {
  // --------------------------------------------------------------------------
  // 1) Convert stimulus + background to LMS and apply cone-domain NR
  // --------------------------------------------------------------------------
  float3x3 XYZ_TO_LMS_2006 = float3x3(
      0.185082982238733f, 0.584081279463687f, -0.0240722415044404f,
      -0.134433056469973f, 0.405752392775348f, 0.0358252602217631f,
      0.000789456671966863f, -0.000912281325916184f, 0.0198490812339463f);

  float3x3 XYZ_TO_LMS_PROPOSED_2023 = float3x3(
      0.185083290265044, 0.584080232530060, -0.0240724126371618,
      -0.134432464433222, 0.405751419882862, 0.0358251078084051,
      0.000789395399878065, -0.000912213029667692, 0.0198489810108856);

  XYZ_TO_LMS_2006 = XYZ_TO_LMS_PROPOSED_2023;

  const float3x3 LMS_TO_XYZ_2006 = renodx::math::Invert3x3(XYZ_TO_LMS_2006);
  const float3x3 BT709_TO_XYZ = renodx::color::BT709_TO_XYZ_MAT;
  const float3x3 XYZ_TO_BT709 = renodx::color::XYZ_TO_BT709_MAT;
  float3x3 BT709_TO_LMS = mul(XYZ_TO_LMS_2006, BT709_TO_XYZ);

  float3 stim_nits = rgb_lin * diffuse_white;
  float3 lms_stim = mul(BT709_TO_LMS, stim_nits);

  float3 lms_bg = mul(BT709_TO_LMS, float3(1, 1, 1) * Lbkg_nits);

  // CastleCSF sensitivity at background (achromatic) -> contrast threshold proxy.
  const float rho = 1.0f;
  const float omega = 0.0f;
  const float ecc = 0.0f;
  const float vis_field = 0.0f;
  const float area = 3.14159265358979323846f;
  float S_ach = renodx::color::castlecsf::Eq27_29_MechSens(rho, omega, ecc, vis_field, area, Lbkg_nits).x;
  float c_thr = 1.0f / max(S_ach, 1e-6f);

  float r_target = clamp(nr_response_at_thr, 1e-3f, 0.999f);
  float sigma_scale = pow((1.0f - r_target) / r_target, 1.0f / max(nr_n, 1e-3f));
  float x_ref = 1.0f + c_thr;

  // Contrast-domain NR: normalize by background LMS so neutral stays neutral.
  float sigma_rel = max(x_ref * sigma_scale, 1e-6f);
  float3 lms_rel = lms_stim / max(abs(lms_bg), float3(1e-6f, 1e-6f, 1e-6f));

  float3 lms_rel_nr = float3(
      NR(lms_rel.x, sigma_rel, nr_n),
      NR(lms_rel.y, sigma_rel, nr_n),
      NR(lms_rel.z, sigma_rel, nr_n));
  float bg_rel_nr = NR(1.0f, sigma_rel, nr_n);

  float3 lms_stim_nr = lms_rel_nr * lms_bg;
  float3 lms_bg_nr = bg_rel_nr.xxx * lms_bg;

  // Test output
  float luminance_in = renodx::color::y::from::BT709(rgb_lin);
  float3 testout = mul(XYZ_TO_BT709, mul(LMS_TO_XYZ_2006, lms_stim_nr)) / diffuse_white;
  float luminance_out = renodx::color::y::from::BT709(testout);
  return testout * luminance_in / luminance_out;
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

    if (config.dechroma != 0.f) {
      // color = CastleDechroma_CVVDPStyle_NakaRushton(color, 100.f, lerp(1.f, 10000.f, pow(config.dechroma, 6.66f)));
      color = CastleDechroma_CVVDPStyle_NakaRushton(color, lerp(1.f, 10000.f, saturate(1.f - pow(config.dechroma, 0.0144f))));
    }

    float3 perceptual_new = renodx::color::oklab::from::BT709(color);

    // if (config.dechroma != 0.f) {
    //   perceptual_new.yz *= lerp(1.f, 0.f, saturate(pow(y / (10000.f / 100.f), (1.f - config.dechroma))));
    //   // perceptual_new.yz *= lerp(1.f, 0.f, saturate(pow(exp2(y) / (10000.f / 100.f), (1.f - config.dechroma))));
    // }

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
  float3 outputColor = untonemapped;
  // if (CUSTOM_SCENE_GRADE_PER_CHANNEL_BLOWOUT > 0.f) {
  //   float calculated_peak = CUSTOM_SCENE_GRADE_PER_CHANNEL_BLOWOUT + (max_value - 1.f);
  //   calculated_peak = max(calculated_peak, 1.f);

  //   // float compression_scale;
  //   // GamutCompression(untonemapped, compression_scale);
  //   untonemapped = max(0, renodx::color::bt2020::from::BT709(untonemapped));

  //   // float3 graded_color = renodx::tonemap::HermiteSplinePerChannelRolloff(untonemapped, calculated_peak, 100.f);
  //   // float3 graded_color = renodx::tonemap::ReinhardPiecewise(untonemapped, calculated_peak, 0.5f + ((mid_gray / 0.18f) - 1.f));
  //   float3 graded_color = renodx::tonemap::ReinhardPiecewise(untonemapped, calculated_peak, mid_gray);
  //   // float3 graded_color = renodx::tonemap::ReinhardScalableExtended(untonemapped, 11.2f, calculated_peak, 0.f, mid_gray, mid_gray);
  //   //  float3 graded_color = renodx::tonemap::dice::BT709(untonemapped, calculated_peak);
  //   // float3 graded_color = renodx::tonemap::HermiteSplinePerChannelRolloff(untonemapped, calculated_peak, 100.f);
  //   float3 color = renodx::color::correct::Chrominance(untonemapped, graded_color, 1.f, 0.f, 0);
  //   color = renodx::color::correct::Hue(color, graded_color, CUSTOM_SCENE_GRADE_HUE_SHIFT, 0);

  //   // GamutDecompression(color, compression_scale);
  //   color = renodx::color::bt709::from::BT2020(color);
  //   outputColor = color;
  // }
  if (CUSTOM_SCENE_GRADE_HUE_CLIP > 0.f) {
    float3 hue_clipped_color = renodx::tonemap::ExponentialRollOff(outputColor, 0.75f, 1.0f);
    outputColor = renodx::color::correct::Hue(outputColor, hue_clipped_color, CUSTOM_SCENE_GRADE_HUE_CLIP, 0);
  }
  return outputColor;
}

float3 DisplayMap(float3 color) {
  renodx::draw::Config config = renodx::draw::BuildConfig();  // Pulls config values
  color = max(0, renodx::color::bt2020::from::BT709(color));
  float tonemap_peak;
  if (LAST_IS_HDR) {
    float peak_nits = config.peak_white_nits / renodx::color::srgb::REFERENCE_WHITE;              // Normalizes peak
    float diffuse_white_nits = config.diffuse_white_nits / renodx::color::srgb::REFERENCE_WHITE;  // Normalizes game brightness
                                                                                                  // float peak_nits = config.peak_white_nits / 80.f;
    // float diffuse_white_nits = config.diffuse_white_nits / 80.f;

    // float compression_scale;
    // GamutCompression(color, compression_scale);

    tonemap_peak = peak_nits / diffuse_white_nits;
  }
  else {
    tonemap_peak = 1.f;
  }
  

  float3 outputColor = color;
  if (RENODX_TONE_MAP_TYPE == 2) {
    outputColor = renodx::tonemap::neutwo::MaxChannel(outputColor, tonemap_peak);
  }

  // GamutDecompression(outputColor, compression_scale);

  outputColor = renodx::color::bt709::from::BT2020(outputColor);

  return outputColor;
}

float3 PreTonemapSliders(float3 untonemapped) {
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
  if (RENODX_TONE_MAP_TYPE == 0) return CustomIntermediate(untonemapped);  // Want SDR in HDR to work with brightness sliders
  else if (RENODX_TONE_MAP_TYPE == 1) return untonemapped; // Want Vanilla HDR to use its own scaling
  untonemapped = PreTonemapSliders(untonemapped);
  untonemapped = PostTonemapSliders(untonemapped);
  float3 tonemapped = DisplayMap(untonemapped);
  tonemapped = renodx::effects::ApplyFilmGrain(tonemapped, uv, CUSTOM_RANDOM, CUSTOM_FILM_GRAIN_STRENGTH * 0.03f);
  tonemapped = CustomIntermediate(tonemapped);
  return tonemapped;
}