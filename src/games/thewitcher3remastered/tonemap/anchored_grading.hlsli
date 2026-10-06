#ifndef THEWITCHER3REMASTERED_TONEMAP_ANCHORED_GRADING_HLSLI_
#define THEWITCHER3REMASTERED_TONEMAP_ANCHORED_GRADING_HLSLI_

float3 ApplyBT709AdaptiveMBPurity(
    float3 lms_input,
    float3 adaptive_neutral_lms,
    float purity_scale) {
  if (abs(purity_scale - 1.f) <= 1e-5f) return lms_input;

  float3 relative_weighted = renodx::math::DivideSafe(
      renodx::color::macleod_boynton::WeighLMS(lms_input),
      adaptive_neutral_lms,
      0.f.xxx);
  float3 mb = renodx::color::macleod_boynton::from::WeightedLMS(relative_weighted);
  float3 neutral_mb = renodx::color::macleod_boynton::from::LMS(1.f.xxx);
  float2 mb_scaled_xy = lerp(neutral_mb.xy, mb.xy, purity_scale);
  float3 relative_weighted_out =
      renodx::color::macleod_boynton::WeightedLMSFromMacleodBoynton(
          float3(mb_scaled_xy, mb.z));
  return renodx::color::macleod_boynton::UnweighLMS(
      relative_weighted_out * max(adaptive_neutral_lms, 1e-6f.xxx));
}

float3 ComputeCInfinityTransition(float3 position) {
  position = saturate(position);
  return 1.f / (1.f + exp2((1.f - 2.f * position) / (position * (1.f - position))));
}

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
  if (contrast == 1.f
      && flare == 0.f
      && highlight_contrast == 1.f
      && shadow_contrast == 1.f
      && highlights == 1.f
      && shadows == 1.f
      && all(anchor_in == anchor_out)) {
    return color;
  }

  float3 normalized = abs(color) / anchor_in;
  float3 contrasted_normalized = normalized;

  if (contrast != 1.f || flare > 0.f) {
    float3 exponent = contrast;
    if (flare > 0.f) {
      float3 shadow_distance = saturate(1.f - normalized);
      float3 flat_shadow_weight = exp2(-normalized / shadow_distance);
      exponent *= mad(flat_shadow_weight, flare / (normalized + flare), 1.f);
    }

    float3 input_stops = log2(normalized);
    float3 highlight_stops = max(input_stops, 0.f);
    float3 output_highlight_stops = highlight_stops;
    if (contrast != 1.f) {
      float3 contrast_displacement = (contrast - 1.f) * highlight_stops;
      float3 displacement_magnitude = abs(contrast_displacement);
      output_highlight_stops += contrast_displacement
          / mad(displacement_magnitude, exp2(-1.f / displacement_magnitude), 1.f);
    }
    contrasted_normalized = exp2(mad(exponent, min(input_stops, 0.f), output_highlight_stops));
  }

  if (highlight_contrast != 1.f) {
    float3 highlight_distance = max(contrasted_normalized - 1.f, 0.f);
    float3 highlight_distance_squared = highlight_distance * highlight_distance;
    float3 flat_highlight_distance = (1.f + highlight_distance_squared)
        * exp2(-1.f / highlight_distance_squared);
    contrasted_normalized += highlight_distance
        * (pow(1.f + flat_highlight_distance, 0.5f * (highlight_contrast - 1.f)) - 1.f);
  }

  if (shadow_contrast != 1.f) {
    float3 shadow_distance = saturate(1.f - contrasted_normalized);
    float3 shadow_distance_squared = shadow_distance * shadow_distance;
    float3 flat_shadow_distance = shadow_distance_squared * shadow_distance
        * exp2(1.f - 1.f / shadow_distance_squared);
    contrasted_normalized *= pow(1.f + flat_shadow_distance, shadow_contrast - 1.f);
  }

  if (highlights != 1.f || shadows != 1.f) {
    static const float tonal_offset_start_stops = 1.f;
    static const float tonal_offset_end_stops = 8.f;
    static const float tonal_offset_inverse_range_stops =
        1.f / (tonal_offset_end_stops - tonal_offset_start_stops);
    float3 tonal_stops = log2(contrasted_normalized);
    float3 tonal_displacement = 0.f;

    if (highlights != 1.f) {
      float highlight_adjustment = highlights - 1.f;
      float highlight_displacement = highlight_adjustment
          * mad(1.5f, abs(highlight_adjustment), 0.5f);
      float3 highlight_weight = ComputeCInfinityTransition(
          (tonal_stops - tonal_offset_start_stops) * tonal_offset_inverse_range_stops);
      tonal_displacement = mad(highlight_displacement, highlight_weight, tonal_displacement);
    }

    if (shadows != 1.f) {
      float shadow_adjustment = shadows - 1.f;
      float shadow_displacement = shadow_adjustment
          * mad(1.5f, abs(shadow_adjustment), 0.5f);
      float3 shadow_weight = ComputeCInfinityTransition(
          (-tonal_offset_start_stops - tonal_stops) * tonal_offset_inverse_range_stops);
      tonal_displacement = mad(shadow_displacement, shadow_weight, tonal_displacement);
    }
    contrasted_normalized *= exp2(tonal_displacement);
  }

  return renodx::math::CopySign(contrasted_normalized * anchor_out, color);
}

#define APPLYANCHORED_CINFINITY_SHOULDER_GENERATOR(T) \
  T ApplyAnchoredCInfinityShoulder(T color, T peak, T anchor, float compression_strength) { \
    T shoulder_range = peak - anchor; \
    T distance_from_anchor = max(color - anchor, (T)0.f); \
    T flat_weight = exp2(-shoulder_range / (compression_strength * distance_from_anchor)); \
    T response_denominator = mad(distance_from_anchor, flat_weight, shoulder_range); \
    return mad(shoulder_range, distance_from_anchor / response_denominator, color - distance_from_anchor); \
  }

APPLYANCHORED_CINFINITY_SHOULDER_GENERATOR(float)
APPLYANCHORED_CINFINITY_SHOULDER_GENERATOR(float3)
#undef APPLYANCHORED_CINFINITY_SHOULDER_GENERATOR

#endif  // THEWITCHER3REMASTERED_TONEMAP_ANCHORED_GRADING_HLSLI_