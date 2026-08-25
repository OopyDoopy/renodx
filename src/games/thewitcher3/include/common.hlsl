#include "../shared.h"
#include "./psychov25_custom/test25_custom.hlsli"

#define PSYCHO_HUE_METHOD 1
#define PSYCHO_HUE_VALUES float4(1.0f, 2.f, 0.7f, 3.5f)

float3 ApplyVanillaPlusGrading(float3 color, float anchor) {
  color *= RENODX_TONE_MAP_EXPOSURE;

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

  color_lms = renodx::tonemap::psychov::psycho25_ApplyAdaptiveMBPurity(
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
      1.f,
      1.f,
      RENODX_TONE_MAP_HIGHLIGHTS,
      RENODX_TONE_MAP_SHADOWS);
}

float3 ColorGradeGamutAdaptiveStateLMS() {
  return renodx::color::lms::from::BT709(0.18f.xxx);
}

void ColorGradePsychoGamutCompress(inout float3 color, inout float compression_scale, float3 adaptive_state_lms) {
  compression_scale = renodx::color::gamut::ComputeGamutCompressionScaleBT709AdaptiveD65(
      color,
      adaptive_state_lms,
      1.f);
  color = renodx::color::gamut::GamutCompressBT709AdaptiveD65(
      color,
      adaptive_state_lms,
      compression_scale);
}

void ColorGradePsychoGamutDecompress(inout float3 color, float compression_scale, float3 adaptive_state_lms) {
  color = renodx::color::gamut::GamutDecompressBT709AdaptiveD65(
      color,
      adaptive_state_lms,
      compression_scale);
}

float3 ColorGradeLUTInput(
    float3 hdr_color,
    out float tonemap_scale,
    out float gamut_compression_scale,
    out float3 gamut_adaptive_state_lms) {
  tonemap_scale = 1.f;
  gamut_compression_scale = 1.f;
  gamut_adaptive_state_lms = ColorGradeGamutAdaptiveStateLMS();

  if (CUSTOM_GRADING_IMPROVEMENTS == 0.f || RENODX_TONE_MAP_TYPE == 1.f) {
    return abs(hdr_color);
  }

  float3 lut_input = hdr_color;

  // Match the Metro Exodus grading flow: gamut-fit first, then compute the
  // tonemap scale from the gamut-fitted LUT input.
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
  if (CUSTOM_GRADING_IMPROVEMENTS == 0.f || RENODX_TONE_MAP_TYPE == 1.f) return lut_output;

  lut_output = renodx::math::SafeDivision(lut_output, tonemap_scale, renodx::math::FLT_MAX);
  ColorGradePsychoGamutDecompress(
      lut_output,
      gamut_compression_scale,
      gamut_adaptive_state_lms);
  return lut_output;
}

float3 CustomTonemap(float3 color) {
  if (RENODX_TONE_MAP_TYPE == 1.f) {
    return saturate(color);
  }
  if (RENODX_TONE_MAP_TYPE == 3.f) {
    float tonemap_peak = LAST_IS_HDR
                             ? max(RENODX_PEAK_WHITE_NITS / RENODX_DIFFUSE_WHITE_NITS, 0.0002f)
                             : 1.f;
    float3 output_color = ApplyCustomPsychoV25ToneMap(
      color,
        tonemap_peak,
      1.f,
      1.f,
      1.f,
      0.f,
      1.f,
      1.f,
      0.f,
        1.f,
      0.18f.xxx,
      0.18f.xxx,
        0,
        0.f,
        1.5f,
        PSYCHO_HUE_VALUES,
        PSYCHO_HUE_METHOD,
        true,
        LAST_IS_HDR ? 1 : 0
    );
    // Per channel clamp overshoot
      return LAST_IS_HDR
        ? renodx::color::bt709::from::BT2020(
          min(tonemap_peak, renodx::color::bt2020::from::BT709(output_color)))
        : min(tonemap_peak, output_color);
  }
  if (RENODX_TONE_MAP_TYPE == 2.f) {
    float tonemap_peak = LAST_IS_HDR
                             ? RENODX_PEAK_WHITE_NITS / RENODX_DIFFUSE_WHITE_NITS
                             : 1.f;
    return ApplyAnchoredCInfinityShoulder(
        color,
        tonemap_peak.xxx,
        0.18f.xxx,
        1.5f);
  }
  return color;
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

float DecodePostProcessingPeak(float metadata) {
  return RENODX_TONE_MAP_TYPE >= 2.f ? metadata : 0.f;
}

float4 HandleUICompositing(float4 ui_color_linear, float4 scene_color_linear) {
  float3 ui_color_srgb = renodx::color::srgb::EncodeSafe(ui_color_linear.rgb);
  float3 scene_color_srgb = renodx::color::srgb::EncodeSafe(scene_color_linear.rgb);
  float3 composited_srgb = lerp(scene_color_srgb, ui_color_srgb, saturate(ui_color_linear.a));
  return float4(renodx::color::srgb::DecodeSafe(composited_srgb), ui_color_linear.a);
}

float CustomGammaEncode(float color) {
  if (CUSTOM_GRADING_IMPROVEMENTS == 1.f && RENODX_TONE_MAP_TYPE != 1.f) {
     return renodx::color::gamma::EncodeSafe(color);
  }
  color = max(0, color);
  return renodx::color::gamma::Encode(color);
}

float3 CustomColorGrading(float3 ungraded, float3 graded) {
  if (RENODX_TONE_MAP_TYPE == 1.f) return graded;
  return lerp(ungraded, graded, CUSTOM_COLOR_GRADING);
}