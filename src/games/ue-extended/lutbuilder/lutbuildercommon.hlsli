#include "../common.hlsli"

#ifndef INCLUDE_LUTBUILDER_COMMON
#define INCLUDE_LUTBUILDER_COMMON

#include "./etcfunctions.hlsli"
#include "../cinfinityrolloff.hlsli"

// A QoL macro to quickly swap displaymappers used in one place
// Can be used for branching for debugging and etc.
#define SELECT_DISPLAYMAP(T)                                                           \
  T SelectDisplaymap(T color, T peak, T shoulder, float compression_strength = 1.5f) { \
    return CInfinityRollOff(color, peak, shoulder, compression_strength);              \
  }
SELECT_DISPLAYMAP(float)
SELECT_DISPLAYMAP(float3)
#undef SELECT_DISPLAYMAP

float3 ComputeCInfinityTransition(float3 position) {
  position = saturate(position);
  return 1.f / (1.f + exp2((1.f - 2.f * position) / (position * (1.f - position))));
}

// Monotonic and C-infinity continuous anchored tonal grading.
float3 ApplyAnchoredTonalGrading(
    float3 color,
    float3 anchor_in = 0.18f,
    float3 anchor_out = 0.18f,
    float contrast = 1.f,
    float flare = 0.f,
    float highlight_contrast = 1.f,
    float shadow_contrast = 1.f,
    float highlights = 1.f,
    float shadows = 1.f) {
  [branch]
  if (contrast == 1.f
      && flare == 0.f
      && highlight_contrast == 1.f
      && shadow_contrast == 1.f
      && highlights == 1.f
      && shadows == 1.f
      && all(anchor_in == anchor_out)) {
    return color;
  }

  float3 ax = abs(color);
  float3 normalized = ax / anchor_in;
  float3 contrasted_normalized = normalized;

  // Power contrast and shadow flare with bounded highlights.
  [branch]
  if (contrast != 1.f || flare > 0.f) {
    float3 exponent = contrast;

    [branch]
    if (flare > 0.f) {
      float3 shadow_distance = saturate(1.f - normalized);
      float3 flat_shadow_weight = exp2(-normalized / shadow_distance);
      exponent *= mad(flat_shadow_weight, flare / (normalized + flare), 1.f);
    }

    float3 input_stops = log2(normalized);
    float3 highlight_stops = max(input_stops, 0.f);
    float3 output_highlight_stops = highlight_stops;

    [branch]
    if (contrast != 1.f) {
      float3 contrast_displacement = (contrast - 1.f) * highlight_stops;
      float3 displacement_magnitude = abs(contrast_displacement);
      float3 safe_displacement_magnitude = max(displacement_magnitude, 1e-6f);
      output_highlight_stops += contrast_displacement / mad(safe_displacement_magnitude, exp2(-1.f / safe_displacement_magnitude), 1.f);
    }

    contrasted_normalized = exp2(mad(exponent, min(input_stops, 0.f), output_highlight_stops));
  }

  // Broad highlight contrast.
  [branch]
  if (highlight_contrast != 1.f) {
    float3 highlight_distance = max(contrasted_normalized - 1.f, 0.f);
    float3 highlight_distance_squared = highlight_distance * highlight_distance;
    float3 safe_highlight_distance_squared = max(highlight_distance_squared, 1e-6f);
    float3 flat_highlight_distance = (1.f + highlight_distance_squared) * exp2(-1.f / safe_highlight_distance_squared);
    contrasted_normalized += highlight_distance * (pow(1.f + flat_highlight_distance, 0.5f * (highlight_contrast - 1.f)) - 1.f);
  }

  // Broad shadow contrast.
  [branch]
  if (shadow_contrast != 1.f) {
    float3 shadow_distance = saturate(1.f - contrasted_normalized);
    float3 shadow_distance_squared = shadow_distance * shadow_distance;
    float3 safe_shadow_distance_squared = max(shadow_distance_squared, 1e-6f);
    float3 flat_shadow_distance = shadow_distance_squared * shadow_distance * exp2(1.f - 1.f / safe_shadow_distance_squared);
    contrasted_normalized *= pow(1.f + flat_shadow_distance, shadow_contrast - 1.f);
  }

  // Mirror offsets about the anchor: start at one stop and reach full strength at eight stops.
  [branch]
  if (highlights != 1.f || shadows != 1.f) {
    float3 tonal_stops = log2(contrasted_normalized);
    float3 tonal_displacement = 0.f;

    [branch]
    if (highlights != 1.f) {
      float highlight_adjustment = highlights - 1.f;
      float highlight_displacement = highlight_adjustment * mad(1.5f, abs(highlight_adjustment), 0.5f);
      float3 highlight_weight = ComputeCInfinityTransition((tonal_stops - 1.f) * 0.125f);
      tonal_displacement = mad(highlight_displacement, highlight_weight, tonal_displacement);
    }

    [branch]
    if (shadows != 1.f) {
      float shadow_adjustment = shadows - 1.f;
      float shadow_displacement = shadow_adjustment * mad(1.5f, abs(shadow_adjustment), 0.5f);
      float3 shadow_weight = ComputeCInfinityTransition((-1.f - tonal_stops) * 0.125f);
      tonal_displacement = mad(shadow_displacement, shadow_weight, tonal_displacement);
    }

    contrasted_normalized *= exp2(tonal_displacement);
  }

  return renodx::math::CopySign(contrasted_normalized * anchor_out, color);
}

// Apply the tonal controls independently to each channel around the tracked per-channel anchor.
float3 ApplyPerChannelTonalGrading(
    float3 color,
    float3 anchor,
    renodx::color::grade::Config config) {
  return ApplyAnchoredTonalGrading(
      color,
      anchor,
      anchor,
      config.contrast,
      config.flare,
      RENODX_TONE_MAP_HIGHLIGHT_CONTRAST,
      RENODX_TONE_MAP_SHADOW_CONTRAST,
      config.highlights,
      config.shadows);
}

// Apply saturation and highlight-dechroma controls per channel around the equal-channel neutral axis.
float3 ApplyPerChannelSaturation(float3 color, float3 peak, renodx::color::grade::Config config) {
  float3 nonnegative_color = max(color, 0.f);
  float3 saturation_scale = config.saturation;
  if (config.dechroma != 0.f) {
    saturation_scale *= lerp(
        1.f,
        0.f,
        saturate(pow(nonnegative_color / 100.f, 1.f - config.dechroma)));
  }
  saturation_scale *= lerp(
      1.f,
      1.f - config.blowout,
      pow(smoothstep(0.f, max(1.f, peak), nonnegative_color), 0.375f));

  float neutral = (color.r + color.g + color.b) / 3.f;
  return neutral.xxx + (color - neutral.xxx) * saturation_scale;
}

// Prism's inset white is (1, 1, 1); normalize its rounded XYZ Y weights.
float3 ApplyPrismYChromaScale(float3 color, float chroma_scale) {
  const float3 y_weights = PRISM_INSET_TO_XYZ[1];
  const float3 neutral = (dot(color, y_weights) / dot(1.f.xxx, y_weights)).xxx;
  const float3 direction = color - neutral;
  if (chroma_scale > 1.f && all(neutral >= 0.f.xxx)) {
    float boundary = 1e30f;
    [unroll]
    for (int i = 0; i < 3; ++i) {
      if (direction[i] < 0.f) boundary = min(boundary, neutral[i] / -direction[i]);
    }
    if (boundary < 1e29f) {
      const float headroom = max(boundary - 1.f, 0.f);
      chroma_scale = 1.f + (headroom > 0.f ? renodx::tonemap::Neutwo(chroma_scale - 1.f, headroom) : 0.f);
    }
  }
  return mad(direction, chroma_scale, neutral);
}

renodx::color::grade::Config CreateColorGradingConfig() {
  renodx::color::grade::Config cg_config = renodx::color::grade::config::Create();
  cg_config.exposure = RENODX_TONE_MAP_EXPOSURE;
  cg_config.highlights = RENODX_TONE_MAP_HIGHLIGHTS;
  cg_config.shadows = RENODX_TONE_MAP_SHADOWS;
  cg_config.contrast = RENODX_TONE_MAP_CONTRAST;
  cg_config.flare = RENODX_TONE_MAP_FLARE;
  cg_config.saturation = RENODX_TONE_MAP_SATURATION;
  cg_config.dechroma = RENODX_TONE_MAP_BLOWOUT;
  // cg_config.hue_correction_strength = 0.f;
  cg_config.blowout = -1.f * (RENODX_TONE_MAP_HIGHLIGHT_SATURATION - 1.f);

  return cg_config;
}

// Apply RenoDX grading after the game's LUT/grade and retain its tracked mid-gray anchor.
float3 ApplyPostLUTColorGrading(
    float3 color_bt709,
    float3 mid_gray_bt709,
    float peak_ratio,
    float blue_correction) {
  renodx::color::grade::Config cg_config = CreateColorGradingConfig();
  cg_config.exposure = 1.f;
  if (RENODX_TONE_MAP_SCALING == RENODX_TONE_MAP_SCALING_PRISM) {
    float3 color_prism = mul(PRISM_INSET, color_bt709);
    float3 anchor_prism = mul(PRISM_INSET, mid_gray_bt709);
    color_prism = ApplyPerChannelTonalGrading(color_prism, anchor_prism, cg_config);
    return mul(PRISM_OUTSET, color_prism);
  }
  float3 color_ap1 = BlueCorrectedAP1FromBT709(color_bt709, blue_correction);
  float3 anchor_ap1 = BlueCorrectedAP1FromBT709(mid_gray_bt709, blue_correction);
  color_ap1 = ApplyPerChannelTonalGrading(color_ap1, anchor_ap1, cg_config);
  float3 peak_ap1 = BlueCorrectedAP1FromBT709(peak_ratio.xxx, blue_correction);
  return BT709FromBlueCorrectedAP1(
      ApplyPerChannelSaturation(color_ap1, peak_ap1, cg_config),
      blue_correction);
}

float3 GammaCorrectHuePreserving(float3 incorrect_color) {
  float3 result = renodx::color::correct::GammaSafe(incorrect_color);
  result = renodx::color::correct::Hue(result, incorrect_color);

  return result;
}

// input: BT.709 sRGB encoded
// output: BT.709 sRGB encoded
float3 ScaleScene(float3 color) {
  if (RENODX_DIFFUSE_WHITE_NITS != RENODX_GRAPHICS_WHITE_NITS) {
    color = renodx::color::gamma::DecodeSafe(color);
    color *= (RENODX_DIFFUSE_WHITE_NITS / RENODX_GRAPHICS_WHITE_NITS);
    color = renodx::color::gamma::EncodeSafe(color);
  }
  return color;
}

// CUSTOM: Emulate BT.709 presentation hue clipping for warm AP1-tonemapped colors.
float3 ApplyHueClipEmulationBT709(float3 color, float strength, float clip_point, float shoulder_anchor) {
  float3 custom_bent = color;
  const float custom_source_y = renodx::color::y::from::BT709(color);
  if (strength > 0.f && custom_source_y > 0.f) {
    const float3 custom_magnitude = abs(color);
    float reference_peak = max(clip_point, 0.01f);
    float reference_anchor = clamp(shoulder_anchor, 0.f, reference_peak - 1e-6f);
    float3 custom_reference = CInfinityRollOff(
        custom_magnitude, reference_peak.xxx, reference_anchor.xxx, 1.5f);
    const float custom_reference_min = renodx::math::Min(custom_reference);
    const float custom_reference_range = renodx::math::Max(custom_reference) - custom_reference_min;
    float3 custom_transferred = color;
    if (custom_reference_range > 0.f) {
      custom_transferred = renodx::math::Rescale(
          custom_reference - custom_reference_min,
          0.f,
          custom_reference_range,
          renodx::math::Min(custom_magnitude),
          renodx::math::Max(custom_magnitude));
      custom_transferred = renodx::math::CopySign(custom_transferred, color);
    }
    custom_bent = lerp(color, custom_transferred, saturate(strength));
    const float custom_bent_y = renodx::color::y::from::BT709(custom_bent);
    if (custom_bent_y > 0.f) {
      float luminance_weight = smoothstep(0.25f, 0.75f, custom_bent_y / custom_source_y);
      custom_bent *= custom_source_y / max(custom_bent_y, custom_source_y * 0.25f);
      float3 displacement = custom_bent - color;
      float displacement_size = renodx::math::Max(abs(displacement));
      float displacement_limit = 0.25f * renodx::math::Max(custom_magnitude);
      float limit_weight = displacement_limit / max(displacement_limit + displacement_size, 1e-6f);
      custom_bent = color + displacement * (luminance_weight * limit_weight);
    } else {
      custom_bent = color;
    }
  }
  return custom_bent;
}

// input: BT.709 linear
// output: BT.709 linear
// input: BT.709 linear
// output: BT.709 linear
float3 DisplayMapAP1(float3 color_bt709, float3 mid_gray_bt709, float peak_ratio, float blue_correction) {
  float3 color_blue_corrected_ap1 = BlueCorrectedAP1FromBT709(color_bt709, blue_correction);
  float3 anchor_blue_corrected_ap1 = BlueCorrectedAP1FromBT709(mid_gray_bt709, blue_correction);
  float3 displaymapped_blue_corrected_ap1 = SelectDisplaymap(
      max(0.f, color_blue_corrected_ap1),
      peak_ratio,
      max(0.f, anchor_blue_corrected_ap1),
      1.5f);
  return BT709FromBlueCorrectedAP1(displaymapped_blue_corrected_ap1, blue_correction);
}

// input: BT.709 linear
// output: BT.709 linear
float3 DisplayMapByScaling(float3 color_bt709, float3 mid_gray_bt709, float peak_ratio, float blue_correction, float tone_curve_amount) {
  float3 display_mapped_bt709;
  if (RENODX_TONE_MAP_SCALING == RENODX_TONE_MAP_SCALING_PRISM) {
    float3 color_prism = mul(PRISM_INSET, color_bt709);
    float3 anchor_prism = mul(PRISM_INSET, mid_gray_bt709);
    float3 shoulder_prism = SelectDisplaymap(max(0.f, color_prism), peak_ratio.xxx, max(0.f, anchor_prism), 1.5f);
    float3 mapped_bt709 = mul(PRISM_OUTSET, shoulder_prism);
    return lerp(color_bt709, mapped_bt709, saturate(tone_curve_amount));
  } else {
    display_mapped_bt709 = DisplayMapAP1(color_bt709, mid_gray_bt709, peak_ratio, blue_correction);
  }
  display_mapped_bt709 = lerp(color_bt709, display_mapped_bt709, saturate(tone_curve_amount));
  // Clamp per channel on game color to avoid max channel clamp of swapchainpass
  float3 display_mapped_bt2020 = renodx::color::bt2020::from::BT709(display_mapped_bt709);
  display_mapped_bt2020 = min(display_mapped_bt2020, peak_ratio);
  return renodx::color::bt709::from::BT2020(display_mapped_bt2020);
}

// Prism's first-face cube-ray compressor, followed by Y-preserving chroma.
float3 CompressPrismDisplayGamut(float3 color_bt709, float peak, float rolloff, float anchor_out) {
  // Keep negative channels when their combined BT.709 luminance is valid.
  color_bt709 = SanitizeGamutInputBT709(renodx::math::ZeroNaN(color_bt709));
  const float3x3 to_p3 = mul(renodx::color::BT709_TO_DISPLAYP3_MAT, PRISM_OUTSET);
  const float3x3 from_p3 = mul(PRISM_INSET, renodx::color::DISPLAYP3_TO_BT709_MAT);
  const float3 y_weights = PRISM_INSET_TO_XYZ[1];
  float3 color = mul(PRISM_INSET, color_bt709);
  float3 target = mul(to_p3, color);
  const float y = dot(color, y_weights);
  const float visible_y = max(dot(mul(from_p3, clamp(target, 0.f, peak)), y_weights), 0.f);
  const float floor_y = 0.85f * visible_y;
  const float width = 0.15f * visible_y;
  float recovered_y = max(y, floor_y);
  if (width > 0.f) {
    const float overlap = max(width - abs(y - floor_y), 0.f) / width;
    recovered_y += 0.25f * width * overlap * overlap;
  }
  const float3 neutral = (recovered_y / dot(y_weights, 1.f.xxx)).xxx;
  const float3 origin = mul(to_p3, neutral);
  float demand = 0.f;
  if (all(origin >= 0.f) && all(origin <= peak)) {
    const float3 delta = target - origin;
    [unroll]
    for (int i = 0; i < 3; ++i) {
      if (delta[i] == 0.f) continue;
      const float room = delta[i] < 0.f ? origin[i] : peak - origin[i];
      if (room == 0.f) {
        color = neutral;
        demand = 0.f;
        break;
      }
      demand = max(demand, abs(delta[i]) / room);
    }
  }
  if (demand > 0.f) {
    const float sharpness = 16.f;
    const float zero_offset = 1.f - log2(1.f + exp2(sharpness)) / sharpness;
    float origin_slope = rcp(1.f + exp2(-sharpness));
    float near_zero = demand * origin_slope
                      * (1.f - 0.5f * sharpness * log(2.f) * (1.f - origin_slope) * demand)
                      / (1.f - zero_offset);
    float mapped_demand = near_zero;
    if (demand > 1e-4f) {
      // Stable softplus form avoids overflow for extreme out-of-gamut colors.
      float x = sharpness * (1.f - demand);
      float limited = 1.f - (max(x, 0.f) + log2(1.f + exp2(-abs(x)))) / sharpness;
      float smooth_demand = (limited - zero_offset) / (1.f - zero_offset);
      if (demand >= 1e-3f) {
        mapped_demand = smooth_demand;
      } else {
        float position = (demand - 1e-4f) / 9e-4f;
        float transition = rcp(1.f + exp2((1.f - 2.f * position) / (position * (1.f - position))));
        mapped_demand = lerp(near_zero, smooth_demand, transition);
      }
    }
    color = lerp(neutral, color, mapped_demand / demand);
  }
  const float weight = rolloff * rolloff * mad(0.5f, rolloff, 0.5f);
  const float highlight_scale = mad(RENODX_TONE_MAP_HIGHLIGHT_SATURATION - 1.f, weight * (2.f / 3.f), 1.f);
  const float availability = lerp(1.f, rcp(1.f + peak / max(anchor_out, 1e-9f)),
                                  saturate(RENODX_TONE_MAP_BLOWOUT * rolloff));
  const float amount = RENODX_TONE_MAP_SATURATION * highlight_scale * availability;
  if (abs(amount - 1.f) > 1e-5f) color = ApplyPrismYChromaScale(color, amount);
  return renodx::math::ZeroNaN(mul(renodx::color::DISPLAYP3_TO_BT709_MAT, clamp(mul(to_p3, color), 0.f, peak)));
}

// input: BT.709 linear
// output: PQ-encoded BT.2020 or sRGB-encoded BT.709
float4 GenerateOutput(
    float3 final_color,
    float3 shoulder_anchor_bt709,
    inout float4 SV_Target,
    uint device,
    float blue_correction,
    float peak_ratio,
    float tone_curve_amount,
    float prism_highlight_rolloff,
    bool srgb_only = false) {
  const float prism_anchor = mul(PRISM_INSET, shoulder_anchor_bt709).x;
  if (RENODX_TONE_MAP_TYPE != 0.f && RENODX_GAMMA_CORRECTION != 0.f) {
    peak_ratio = ApplyGammaCorrection(peak_ratio.xxx, true, blue_correction).x;
  }
  // Dont displaymap SDR.
  [branch]
  if (RENODX_TONE_MAP_TYPE == 0.f) {
    final_color = saturate(final_color);
  } else {
    // Empirical default strengths at peak/game ratios 1, 2, 4, 7, and 10.
    float hue_peak_ratio = peak_ratio;
    float default_hue_strength = 0.1f
                                 + 0.075f * saturate(hue_peak_ratio - 1.f)
                                 + 0.075f * saturate((hue_peak_ratio - 2.f) / 2.f)
                                 + 0.13f * saturate((hue_peak_ratio - 4.f) / 3.f)
                                 + 0.32f * saturate((hue_peak_ratio - 7.f) / 3.f);
    float hue_slider = saturate(RENODX_TONE_MAP_HUE_CORRECTION);
    float hue_strength = lerp(
        default_hue_strength * saturate(hue_slider * 2.f),
        0.7f,
        saturate(hue_slider * 2.f - 1.f));
    final_color = ApplyHueClipEmulationBT709(
        final_color, hue_strength,
        RENODX_TONE_MAP_HUE_CORRECTION_PEAK == 0.f ? peak_ratio : RENODX_TONE_MAP_HUE_CORRECTION_PEAK,
        renodx::math::Max(abs(shoulder_anchor_bt709)));
    final_color = DisplayMapByScaling(final_color, shoulder_anchor_bt709, peak_ratio, blue_correction, tone_curve_amount);
  }

  float3 encoded_color;

  [branch]
  if (PROCESSING_PATH == 0.f) {
    if (srgb_only) {
      if (RENODX_TONE_MAP_TYPE != 0.f && RENODX_TONE_MAP_SCALING == RENODX_TONE_MAP_SCALING_PRISM) {
        // sRGB encoding here is an HDR intermediate, not an SDR peak limit.
        final_color = CompressPrismDisplayGamut(final_color, peak_ratio, prism_highlight_rolloff, prism_anchor);
      }
      if (RENODX_TONE_MAP_TYPE != 0.f && shader_injection.clamp_output_gamut_bt709 != 0.f) {
        final_color = max(final_color, 0.f);
      }
      encoded_color = renodx::color::srgb::EncodeSafe(final_color);
    } else {
      final_color = ApplyGammaCorrection(final_color, false, blue_correction);
      if (RENODX_TONE_MAP_TYPE != 0.f && RENODX_TONE_MAP_SCALING == RENODX_TONE_MAP_SCALING_PRISM) {
        final_color = CompressPrismDisplayGamut(final_color, RENODX_PEAK_WHITE_NITS / RENODX_DIFFUSE_WHITE_NITS,
                                                prism_highlight_rolloff, ApplyGammaCorrection(prism_anchor.xxx, false, blue_correction).x);
      }
      if (RENODX_TONE_MAP_TYPE != 0.f && shader_injection.clamp_output_gamut_bt709 != 0.f) {
        final_color = max(final_color, 0.f);
      }
      float3 bt2020_color = renodx::color::bt2020::from::BT709(final_color);
      encoded_color = renodx::color::pq::EncodeSafe(bt2020_color, RENODX_DIFFUSE_WHITE_NITS);
    }
  } else {
    if (RENODX_TONE_MAP_TYPE != 0.f && RENODX_TONE_MAP_SCALING == RENODX_TONE_MAP_SCALING_PRISM) {
      // Preserve headroom above game white through the sRGB proxy.
      final_color = CompressPrismDisplayGamut(final_color, peak_ratio, prism_highlight_rolloff, prism_anchor);
    }
    if (RENODX_TONE_MAP_TYPE != 0.f && shader_injection.clamp_output_gamut_bt709 != 0.f) {
      final_color = max(final_color, 0.f);
    }
    float3 srgb_color = renodx::color::srgb::EncodeSafe(final_color);
    encoded_color = ScaleScene(srgb_color);
  }

  return SV_Target = float4(encoded_color / 1.05f, 0.f);
}

#endif  // INCLUDE_LUTBUILDER_COMMON

