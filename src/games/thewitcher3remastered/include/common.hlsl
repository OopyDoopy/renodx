#include "../shared.h"
#include "../../../shaders/tonemap/psychov/test30.hlsl"

static const float CONTROL_RESONANT_PSYCHO31_SMOOTH_LIMIT_SHARPNESS = 16.f;

float ControlResonantSmoothUnitLimit(float value) {
  const float sharpness = CONTROL_RESONANT_PSYCHO31_SMOOTH_LIMIT_SHARPNESS;
  const float zero_offset = 1.f - log2(1.f + exp2(sharpness)) / sharpness;
  float near_zero = 0.f;
  if (!(value >= 1e-3f)) {
    float origin_slope = rcp(1.f + exp2(-sharpness));
    near_zero = value * origin_slope
        * (1.f - 0.5f * sharpness * log(2.f) * (1.f - origin_slope) * value)
        / (1.f - zero_offset);
    if (value <= 1e-4f) return near_zero;
  }
  float limited = 1.f - log2(1.f + exp2(sharpness * (1.f - value))) / sharpness;
  if (value >= 1e-3f) return (limited - zero_offset) / (1.f - zero_offset);
  float transition_position = saturate((value - 1e-4f) / 9e-4f);
  float transition = rcp(1.f + exp2((1.f - 2.f * transition_position)
                                   / (transition_position * (1.f - transition_position))));
  return lerp(near_zero, (limited - zero_offset) / (1.f - zero_offset), transition);
}

#include "../tonemap/anchored_grading.hlsli"

// Opt-in live diagnosis; normal builds retain the original signed gamut bridge.
#ifndef WITCHER3_LUT_DIAGNOSTIC
#define WITCHER3_LUT_DIAGNOSTIC 0
#endif

float3 ApplyVanillaPlusGrading(float3 color, float anchor) {
  // `color` and `anchor` are already in the exposure-adjusted linear domain.
  float3 adaptive_state_lms = renodx::color::lms::from::BT709(anchor.xxx);
  float3 color_lms = renodx::color::lms::from::BT709(color);
  float purity_scale = RENODX_TONE_MAP_SATURATION;

  if (RENODX_TONE_MAP_BLOWOUT != 0.f || RENODX_TONE_MAP_HIGHLIGHT_SATURATION != 1.f) {
    float luminance = renodx::color::yf::from::LMS(color_lms);
    float neutral_luminance = renodx::color::yf::from::LMS(adaptive_state_lms);
    float luminance_from_neutral = max(luminance, neutral_luminance) / neutral_luminance;
    float rolloff_position = saturate(log2(luminance_from_neutral) / (2.75f * log2(10.f)));
    float rolloff_position_squared = rolloff_position * rolloff_position;
    float rolloff = rolloff_position_squared * rolloff_position
        * mad(rolloff_position, mad(6.f, rolloff_position, -15.f), 10.f);

    purity_scale *= mad(-RENODX_TONE_MAP_BLOWOUT, rolloff, 1.f);
    float highlight_rolloff = rolloff * rolloff * lerp(1.f, rolloff, 0.5f);
    purity_scale *= mad(
        RENODX_TONE_MAP_HIGHLIGHT_SATURATION - 1.f,
        highlight_rolloff * (2.f / 3.f),
        1.f);
  }

  color_lms = ApplyBT709AdaptiveMBPurity(
      color_lms,
      adaptive_state_lms,
      purity_scale);
  color = renodx::color::bt709::from::LMS(color_lms);

  return ApplyAnchoredTonalGrading(
      color,
      anchor.xxx,
      anchor.xxx,
      RENODX_TONE_MAP_CONTRAST,
      RENODX_TONE_MAP_FLARE,
      RENODX_TONE_MAP_HIGHLIGHT_CONTRAST,
      RENODX_TONE_MAP_SHADOW_CONTRAST,
      RENODX_TONE_MAP_HIGHLIGHTS,
      RENODX_TONE_MAP_SHADOWS);
}

float3 ColorGradeGamutAdaptiveStateLMS() {
  return renodx::color::lms::from::BT709(0.18f.xxx);
}

float3 SanitizeGamutInput(float3 color) {
  return clamp(
      renodx::math::ZeroNaN(color),
      -renodx::math::FLT16_MAX.xxx,
      renodx::math::FLT16_MAX.xxx);
}

void ColorGradePsychoGamutCompress(inout float3 color, inout float compression_scale, float3 adaptive_state_lms) {
  float3 lms = renodx::color::lms::from::BT709(color);
  float yf = renodx::color::yf::from::LMS(lms)
      / renodx::tonemap::psychov::PSYCHO30_D65_WHITE_YF;
  if (yf <= 0.f) {
    color = 0.f;
    compression_scale = 0.f;
    return;
  }

  float3 neutral_lms = renodx::tonemap::psychov::PSYCHO30_D65_WHITE_LMS * yf;
  float3 radial_lms = lms - neutral_lms;
  float3 lower_lms = max(-radial_lms, 0.f)
      / renodx::tonemap::psychov::PSYCHO30_D65_WHITE_LMS;
  float lower_scale = renodx::math::Max(lower_lms);
  compression_scale = 1.f;
  if (lower_scale == 0.f) {
    return;
  }

  float3 normalized_lower = lower_lms / lower_scale;
  normalized_lower *= normalized_lower;
  normalized_lower *= normalized_lower;
  float lower_norm = lower_scale * sqrt(sqrt(sqrt(dot(normalized_lower, normalized_lower))));
  float normalized_demand = lower_norm / yf;
  compression_scale = ControlResonantSmoothUnitLimit(normalized_demand)
      / max(normalized_demand, 1e-6f);
  lms = neutral_lms + radial_lms * compression_scale;
  color = renodx::color::bt709::from::LMS(lms);
}

void ColorGradePsychoGamutDecompress(inout float3 color, float compression_scale, float3 adaptive_state_lms) {
  float3 lms = renodx::color::lms::from::BT709(color);
  float yf = renodx::color::yf::from::LMS(lms)
      / renodx::tonemap::psychov::PSYCHO30_D65_WHITE_YF;
  if (yf <= 0.f || compression_scale <= 0.f) {
    color = 0.f;
    return;
  }

  float3 neutral_lms = renodx::tonemap::psychov::PSYCHO30_D65_WHITE_LMS * yf;
  lms = neutral_lms + (lms - neutral_lms) / compression_scale;
  color = renodx::color::bt709::from::LMS(lms);
}

float3 ColorGradeLUTInput(
    float3 hdr_color,
    out float tonemap_scale,
    out float gamut_compression_scale,
    out float3 gamut_adaptive_state_lms) {
  tonemap_scale = 1.f;
  gamut_compression_scale = 1.f;
  gamut_adaptive_state_lms = ColorGradeGamutAdaptiveStateLMS();

  if (CUSTOM_GRADING_IMPROVEMENTS == 0.f || RENODX_TONE_MAP_TYPE == 0.f) {
    return abs(hdr_color);
  }

  float3 lut_input = max(0, min(hdr_color, renodx::math::FLT_MAX));
  ColorGradePsychoGamutCompress(
      lut_input,
      gamut_compression_scale,
      gamut_adaptive_state_lms);
  tonemap_scale = renodx::tonemap::neutwo::ComputeMaxChannelScale(lut_input);
  return lut_input * tonemap_scale;
}

float3 ColorGradeLUTOutput(
    float3 lut_output,
    float tonemap_scale,
    float gamut_compression_scale,
    float3 gamut_adaptive_state_lms) {
  if (CUSTOM_GRADING_IMPROVEMENTS == 0.f || RENODX_TONE_MAP_TYPE == 0.f) {
    return lut_output;
  }

  lut_output = renodx::math::SafeDivision(lut_output, tonemap_scale, renodx::math::FLT_MAX);
#if WITCHER3_LUT_DIAGNOSTIC == 1
  // Red: invalid compression scale; green: invalid N2 scale; blue: invalid LUT result.
  return float3(!isfinite(gamut_compression_scale), !isfinite(tonemap_scale), !all(isfinite(lut_output)));
#elif WITCHER3_LUT_DIAGNOSTIC == 2
  // Inspect the grade before gamut decompression (magenta marks nonfinite values).
  return all(isfinite(lut_output)) ? lut_output : float3(1.f, 0.f, 1.f);
#endif
  ColorGradePsychoGamutDecompress(
      lut_output,
      gamut_compression_scale,
      gamut_adaptive_state_lms);
#if WITCHER3_LUT_DIAGNOSTIC == 3
  return all(isfinite(lut_output)) ? lut_output : float3(1.f, 0.f, 1.f);
#endif
  return lut_output;
}

float3 CustomTonemapWithPeak(float3 color, float tonemap_peak, bool is_hdr) {
  if (RENODX_TONE_MAP_TYPE == 0.f) {
    return saturate(color);
  }
  if (RENODX_TONE_MAP_TYPE == 1.f) {
    tonemap_peak = is_hdr ? tonemap_peak : 1.f;
    return ApplyAnchoredCInfinityShoulder(
        color,
        tonemap_peak.xxx,
        0.18f.xxx,
        1.5f);
  }
  return color;
}

float3 CustomTonemapSDR(float3 color) {
  return CustomTonemapWithPeak(color, 1.f, false);
}

float3 CustomTonemapHDR(float3 color) {
  float diffuse_white_nits = max(RENODX_DIFFUSE_WHITE_NITS, 0.000001f);
  float peak = RENODX_PEAK_WHITE_NITS / diffuse_white_nits;
  return CustomTonemapWithPeak(color, peak, true);
}

float4 ClampPostProcessing(
  float4 value,
  float clamp_value,
  float3 intensity_weights,
  float response_scale,
  float extension_gain) {
  if (response_scale <= 0.f) {
    value.rgb = 0.f;
    return value;
  }

  float3 source = value.rgb;
  float3 reference = renodx::tonemap::neutwo::PerChannel(source, clamp_value);
  float full_intensity = dot(intensity_weights, source);
  float reference_intensity = dot(intensity_weights, reference);
  float target_intensity = reference_intensity * saturate(response_scale);

  [branch]
  if (response_scale > 1.f && full_intensity > 0.f && reference_intensity > 0.f) {
  float3 extended_reference = renodx::tonemap::neutwo::PerChannel(
    source,
    clamp_value * response_scale);
  float extended_intensity = max(
    reference_intensity,
    dot(intensity_weights, extended_reference));
  float compression_ratio = max(full_intensity / reference_intensity, 1.f);
  float compression_excess = max(compression_ratio - 1.1f, 0.f);
  float extension_weight = compression_excess / (compression_excess + 0.25f);
  extension_weight *= extension_weight;
  target_intensity = min(
    full_intensity,
    reference_intensity
      + (extended_intensity - reference_intensity) * extension_weight * extension_gain);
  }

  value.rgb = renodx::color::correct::Luminance(
    source,
    full_intensity,
    target_intensity);
  return value;
}

float EncodePostProcessingPeak(float peak, float4 position) {
  if (RENODX_TONE_MAP_TYPE < 2.f) return 1.f;
  return all(uint2(position.xy) == 0u) ? peak : 1.f;
}

float EncodePostProcessingPeak(float peak, float4 position, float original_alpha) {
  if (RENODX_TONE_MAP_TYPE < 1.f) return original_alpha;
  return all(uint2(position.xy) == 0u) ? peak : original_alpha;
}

float DecodePostProcessingPeak(float metadata) {
  return RENODX_TONE_MAP_TYPE >= 1.f ? metadata : 0.f;
}

float4 HandleUICompositing(float4 ui_color_linear, float4 scene_color_linear) {
  float3 ui_color_srgb = renodx::color::srgb::EncodeSafe(ui_color_linear.rgb);
  float3 scene_color_srgb = renodx::color::srgb::EncodeSafe(scene_color_linear.rgb);
  float3 composited_srgb = lerp(scene_color_srgb, ui_color_srgb, saturate(ui_color_linear.a));
  return float4(renodx::color::srgb::DecodeSafe(composited_srgb), ui_color_linear.a);
}

float CustomGammaEncode(float color) {
  if (CUSTOM_GRADING_IMPROVEMENTS == 1.f && RENODX_TONE_MAP_TYPE != 0.f) {
     return renodx::color::gamma::EncodeSafe(color);
  }
  color = max(0, color);
  return renodx::color::gamma::Encode(color);
}

float3 CustomColorGrading(float3 ungraded, float3 graded) {
  if (RENODX_TONE_MAP_TYPE == 0.f) return graded;
  return lerp(ungraded, graded, CUSTOM_COLOR_GRADING);
}
