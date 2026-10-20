#include "../shared.h"

#include "../tonemap/anchored_grading.hlsli"
#include "../tonemap/psychov_tonemap.hlsli"

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

float3 SanitizeGamutInput(float3 color, float3x3 gamut_xyz) {
  const float3 luminance_weights = gamut_xyz[1];
  const float y = dot(color, luminance_weights);

  [branch]
  if (y >= 0.f) {
    return color;
  }

  const float3 positive = max(color, 0.f);
  const float positive_y = dot(positive, luminance_weights);
  const float scale = positive_y / (positive_y - y);

  return mad(color - positive, scale, positive);
}

float3 SanitizeGamutInputBT709(float3 color) {
  return SanitizeGamutInput(color, renodx::color::BT709_TO_XYZ_MAT);
}

float3 SanitizeGamutInputBT2020(float3 color) {
  return SanitizeGamutInput(color, renodx::color::BT2020_TO_XYZ_MAT);
}

float3 ColorGradeGamutAdaptiveStateLMS() {
  return renodx::color::lms::from::BT709(0.18f.xxx);
}

float3 ColorGradeLUTInput(
    float3 hdr_color,
    out float tonemap_scale,
    out float gamut_compression_scale) {
  tonemap_scale = 1.f;
  gamut_compression_scale = 1.f;

  if (CUSTOM_GRADING_IMPROVEMENTS == 0.f || RENODX_TONE_MAP_TYPE == 0.f) {
    return abs(hdr_color);
  }

  if (RENODX_TONE_MAP_TYPE == WITCHER_TONE_MAP_PSYCHOV_CUSTOM31) {
    // Reversible luminance-axis proxy retains signed BT.2020 colours in BT.709 coordinates.
    // Negative-luminance ringing has no reversible nonnegative LUT proxy.
    // Keep its inverse at identity instead of magnifying the LUT's black tint.
    if (!(renodx::color::y::from::BT709(hdr_color) > 0.f)) return 0.f;
    gamut_compression_scale = max(renodx::color::correct::ComputeGamutCompressionScale(hdr_color), 1e-6f);
    float3 proxy = max(renodx::color::correct::GamutCompress(
        hdr_color, renodx::color::y::from::BT709(hdr_color), gamut_compression_scale), 0.f);
    tonemap_scale = renodx::tonemap::neutwo::ComputeMaxChannelScale(proxy);
    return proxy * tonemap_scale;
  }

  float3 lut_input = SanitizeGamutInputBT709(hdr_color);

  float3 adaptive_state_lms = ColorGradeGamutAdaptiveStateLMS();
  gamut_compression_scale = renodx::color::gamut::ComputeGamutCompressionScaleBT709AdaptiveD65(
      lut_input,
      adaptive_state_lms,
      1.f);
  lut_input = renodx::color::gamut::GamutCompressBT709AdaptiveD65(
      lut_input,
      adaptive_state_lms,
      gamut_compression_scale);
  tonemap_scale = renodx::tonemap::neutwo::ComputeMaxChannelScale(lut_input);
  return lut_input * tonemap_scale;
}

float3 ColorGradeLUTOutput(
    float3 lut_output,
    float tonemap_scale,
    float gamut_compression_scale) {
  if (CUSTOM_GRADING_IMPROVEMENTS == 0.f || RENODX_TONE_MAP_TYPE == 0.f) {
    return lut_output;
  }

  if (RENODX_TONE_MAP_TYPE == WITCHER_TONE_MAP_PSYCHOV_CUSTOM31) {
    lut_output /= max(tonemap_scale, 1e-6f);
    // Near-zero luminance with opposing signed channels makes the inverse
    // ill-conditioned. Fade only that chroma recovery, preserving graded Y.
    // BT.2020 colours are well above this scale and retain the exact inverse.
    const float inverse_scale = lerp(
        1.f, rcp(gamut_compression_scale),
        smoothstep(0.f, 0.05f, gamut_compression_scale));
    return lerp(renodx::color::y::from::BT709(lut_output).xxx, lut_output, inverse_scale);
  }

  lut_output = renodx::math::SafeDivision(lut_output, tonemap_scale, renodx::math::FLT_MAX);
  if (gamut_compression_scale > 0.f) {
    lut_output = renodx::color::gamut::GamutDecompressBT709AdaptiveD65(
        lut_output,
        ColorGradeGamutAdaptiveStateLMS(),
        gamut_compression_scale);
  }
  return lut_output;
}

float3 CustomTonemapWithPeak(float3 color, float tonemap_peak, bool is_hdr) {
  if (RENODX_TONE_MAP_TYPE == 0.f) {
    return saturate(color);
  }
  if (RENODX_TONE_MAP_TYPE == WITCHER_TONE_MAP_PSYCHOV_CUSTOM31) {
    return WitcherToneMapPsychoVCustom31(color, is_hdr);
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
  if (RENODX_TONE_MAP_TYPE == 0.f || CUSTOM_BLOOM_BEFORE_TONEMAP != 0.f) return 1.f;
  return all(uint2(position.xy) == 0u) ? peak : 1.f;
}

float EncodePostProcessingPeak(float peak, float4 position, float original_alpha) {
  if (RENODX_TONE_MAP_TYPE == 0.f || CUSTOM_BLOOM_BEFORE_TONEMAP != 0.f) return original_alpha;
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
  return exp2(log2(color) * 0.4545454680919647f);
}

// Reconstructed scene-linear BT.709, including signed wide-gamut channels.
// Select pink/red changes added by grading, then rotate hue at fixed Oklab C/L.
// Restoring linear Y scales L and C equally; this is not chroma suppression.
float3 ShiftSceneGradeHue(float3 ungraded, float3 graded) {
  [branch]
  if (RENODX_TONE_MAP_TYPE == 0.f
      || shader_injection.scene_grade_hue_shift <= 0.f) return graded;

  const float source_y = renodx::color::y::from::BT709(ungraded);
  const float graded_y = renodx::color::y::from::BT709(graded);
  if (!(source_y > 1e-6f && graded_y > 1e-6f)) return graded;
  const float3 source_lab = renodx::color::oklab::from::BT709(ungraded / source_y);
  const float3 graded_lab = renodx::color::oklab::from::BT709(graded / graded_y);
  if (any(isnan(source_lab)) || any(isinf(source_lab))
      || any(isnan(graded_lab)) || any(isinf(graded_lab))) return graded;

  const float chroma = length(graded_lab.yz);
  // Pink through warm red: full from -35 to 35 degrees, fading to zero
  // at -65 and 65. Include peach/coral highlights without selecting yellow.
  const float hue_alignment = graded_lab.y / max(chroma, 1e-6f);
  const float hue_weight = smoothstep(0.4226182617f, 0.8191520443f, hue_alignment)
      * smoothstep(0.01f, 0.05f, chroma / max(graded_lab.x, 1e-6f));
  // Project the grade delta toward pink (-30 degrees): combined red gain
  // and yellow loss count more than red gain alone.
  // An unchanged colour or scalar exposure change has no selected grade delta.
  const float amount = saturate(shader_injection.scene_grade_hue_shift)
      * hue_weight * smoothstep(0.01f, 0.08f,
          dot(graded_lab.yz - source_lab.yz, float2(0.8660254038f, -0.5f)))
      * smoothstep(1e-6f, 1e-5f, min(source_y, graded_y));
  if (amount == 0.f) return graded;

  // At most 30 degrees per stage, never past the warm-yellow target at 90.
  const float angle = amount * min(0.5235987756f,
      max(0.f, 1.5707963268f - atan2(graded_lab.z, graded_lab.y)));
  if (angle == 0.f) return graded;
  float sin_angle, cos_angle;
  sincos(angle, sin_angle, cos_angle);
  float3 rotated = renodx::color::bt709::from::OkLab(float3(
      graded_lab.x,
      graded_lab.y * cos_angle - graded_lab.z * sin_angle,
      graded_lab.y * sin_angle + graded_lab.z * cos_angle));
  const float rotated_y = renodx::color::y::from::BT709(rotated);
  if (!(rotated_y > 1e-6f && rotated_y <= renodx::math::FLT_MAX)
      || any(isnan(rotated)) || any(isinf(rotated))) return graded;
  // No channel clamp or new gamut boundary: PsychoV owns display gamut mapping.
  return rotated * (graded_y / rotated_y);
}

float3 ApplySceneGrading(float3 ungraded, float3 graded, float strength) {
  return lerp(ungraded, ShiftSceneGradeHue(ungraded, graded),
              RENODX_TONE_MAP_TYPE == 0.f ? 1.f : strength);
}

float3 CustomColorGrading(float3 ungraded, float3 graded) {
  if (RENODX_TONE_MAP_TYPE == 0.f) return graded;
  return ApplySceneGrading(ungraded, graded, CUSTOM_COLOR_GRADING);
}
