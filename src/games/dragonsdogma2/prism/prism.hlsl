#ifndef RENODX_MOD_PRISM_HLSL_
#define RENODX_MOD_PRISM_HLSL_

#include "../../../shaders/color.hlsl"
#include "../../../shaders/color/macleod_boynton.hlsl"
#include "../../../shaders/math.hlsl"

// Prism tone mapping. This file is intended to live directly in a RenoDX mod folder.
// Public entry points accept and return linear BT.709.
//
// Primary authoring resolves the gamut hull, white point, primary controls,
// matrices, and Yf basis before shader execution. The shader consumes the
// resulting matrices and derived coefficients.

namespace renodx {
namespace tonemap {
namespace prism {

static const int CHROMA_SPACE_PRISM = 0;
static const int CHROMA_SPACE_MACLEOD_BOYNTON = 1;
static const int CONTRAST_FUNCTION_ANCHORED = 0;
static const int CONTRAST_FUNCTION_POW = 1;

float3x3 MatrixFromRows(float4 row0, float4 row1, float4 row2) {
  return float3x3(
      row0.x, row0.y, row0.z,
      row1.x, row1.y, row1.z,
      row2.x, row2.y, row2.z);
}

struct Config {
  // Display and tonal reference values.
  float3 tone_map_peak;
  float diffuse_white_nits;
  float3 anchor_in;
  float3 anchor_out;

  // Resolved working-basis data.
  float3x3 inset_matrix;
  float3x3 outset_matrix;

  // Precomputed by the CPU Prism solver or passed via helper function.
  float3 yf_weights;
  float3 yf_neutral_axis;
  float yf_neutral_axis_yf_rcp;
  float3x3 working_to_lms_matrix;
  float3x3 lms_to_working_matrix;

  // Tone-map shoulder configuration.
  float tone_map_compression_strength;
  int contrast_function;

  // Grading controls.
  float highlights;
  float shadows;
  float contrast;
  float saturation;
  float highlight_saturation;
  float dechroma;
  float flare;
  float highlight_contrast;
  float shadow_contrast;

  // Working-space selectors.
  int saturation_space;
  int highlight_saturation_space;
  int blowout_space;
};

namespace config {

// Construction path for CPU-resolved Prism primary data.
Config CreateResolved(
    float3 tone_map_peak,
    float diffuse_white_nits,
    float3 anchor_in,
    float3 anchor_out,
    float3x3 inset_matrix,
    float3x3 outset_matrix,
    float3 yf_weights,
    float3 yf_neutral_axis,
    float yf_neutral_axis_yf_rcp,
    float3x3 working_to_lms_matrix,
    float3x3 lms_to_working_matrix,
    float tone_map_compression_strength = 1.5f,
    int contrast_function = CONTRAST_FUNCTION_ANCHORED,
    float highlights = 1.f,
    float shadows = 1.f,
    float contrast = 1.f,
    float saturation = 1.f,
    float highlight_saturation = 1.f,
    float dechroma = 0.f,
    float flare = 0.f,
    float highlight_contrast = 1.f,
    float shadow_contrast = 1.f,
    int saturation_space = CHROMA_SPACE_PRISM,
    int highlight_saturation_space = CHROMA_SPACE_PRISM,
    int blowout_space = CHROMA_SPACE_PRISM) {
  const Config config = {
      tone_map_peak,
      diffuse_white_nits,
      anchor_in,
      anchor_out,
      inset_matrix,
      outset_matrix,
      yf_weights,
      yf_neutral_axis,
      yf_neutral_axis_yf_rcp,
      working_to_lms_matrix,
      lms_to_working_matrix,
      tone_map_compression_strength,
      contrast_function,
      highlights,
      shadows,
      contrast,
      saturation,
      highlight_saturation,
      dechroma,
      flare,
      highlight_contrast,
      shadow_contrast,
      saturation_space,
      highlight_saturation_space,
      blowout_space
  };
  return config;
}

}  // namespace config

float ComputeCInfinityTransition(float position) {
  position = saturate(position);
  return 1.f / (1.f + exp2((1.f - 2.f * position) / (position * (1.f - position))));
}

float3 ComputeCInfinityTransition(float3 position) {
  position = saturate(position);
  return 1.f / (1.f + exp2((1.f - 2.f * position) / (position * (1.f - position))));
}

// Yf of a color already expressed in the configured inset Prism basis.
float Yf(float3 color, Config config) {
  return dot(color, config.yf_weights);
}

// Returns the point on the resolved Prism-space neutral axis with the
// requested Yf. The CPU solver precomputes both the axis and its Yf
// normalization for the selected authoring white.
float3 YfNeutral(float yf, Config config) {
  return config.yf_neutral_axis
         * (yf * config.yf_neutral_axis_yf_rcp);
}

// Scales the residual orthogonal to the Yf functional.
// dot(result, yf_weights) == dot(color, yf_weights), apart from FP error.
float3 ApplyYfChromaScale(float3 color, float chroma_scale, Config config) {
  const float yf = Yf(color, config);
  const float3 neutral = YfNeutral(yf, config);
  return mad(color - neutral, chroma_scale, neutral);
}

// Monotonic and C-infinity continuous anchored tonal grading.
//
// IMPORTANT:
// This function operates in the inset Prism basis.
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
      output_highlight_stops +=
          contrast_displacement
          / mad(displacement_magnitude, exp2(-1.f / displacement_magnitude), 1.f);
    }

    contrasted_normalized =
        exp2(mad(exponent, min(input_stops, 0.f), output_highlight_stops));
  }

  // Broad highlight contrast.
  [branch]
  if (highlight_contrast != 1.f) {
    float3 highlight_distance = max(contrasted_normalized - 1.f, 0.f);
    float3 highlight_distance_squared = highlight_distance * highlight_distance;
    float3 flat_highlight_distance =
        (1.f + highlight_distance_squared)
        * exp2(-1.f / highlight_distance_squared);

    contrasted_normalized +=
        highlight_distance
        * (pow(1.f + flat_highlight_distance, 0.5f * (highlight_contrast - 1.f)) - 1.f);
  }

  // Broad shadow contrast.
  [branch]
  if (shadow_contrast != 1.f) {
    float3 shadow_distance = saturate(1.f - contrasted_normalized);
    float3 shadow_distance_squared = shadow_distance * shadow_distance;
    float3 flat_shadow_distance =
        shadow_distance_squared
        * shadow_distance
        * exp2(1.f - 1.f / shadow_distance_squared);

    contrasted_normalized *=
        pow(1.f + flat_shadow_distance, shadow_contrast - 1.f);
  }

  // Mirror offsets about the anchor:
  // start at one stop and reach full strength at eight stops.
  [branch]
  if (highlights != 1.f || shadows != 1.f) {
    float3 tonal_stops = log2(contrasted_normalized);
    float3 tonal_displacement = 0.f;

    [branch]
    if (highlights != 1.f) {
      float highlight_adjustment = highlights - 1.f;
      float highlight_displacement =
          highlight_adjustment * mad(1.5f, abs(highlight_adjustment), 0.5f);
      float3 highlight_weight =
          ComputeCInfinityTransition((tonal_stops - 1.f) * 0.125f);
      tonal_displacement =
          mad(highlight_displacement, highlight_weight, tonal_displacement);
    }

    [branch]
    if (shadows != 1.f) {
      float shadow_adjustment = shadows - 1.f;
      float shadow_displacement =
          shadow_adjustment * mad(1.5f, abs(shadow_adjustment), 0.5f);
      float3 shadow_weight =
          ComputeCInfinityTransition((-1.f - tonal_stops) * 0.125f);
      tonal_displacement =
          mad(shadow_displacement, shadow_weight, tonal_displacement);
    }

    contrasted_normalized *= exp2(tonal_displacement);
  }

  return renodx::math::CopySign(contrasted_normalized * anchor_out, color);
}

float3 ApplyAnchoredPowContrast(
    float3 color,
    float3 anchor_in,
    float3 anchor_out,
    float contrast) {
  float3 normalized = max(0.f, color / max(anchor_in, renodx::math::FLT_MIN));
  return pow(normalized, contrast) * anchor_out;
}

/// Identity through anchor to every derivative; then approaches peak
/// monotonically and concave down. Requires anchor < peak and compression_strength >= 1.
#define APPLYANCHORED_CINFINITY_SHOULDER_GENERATOR(T)                                                      \
  T ApplyAnchoredCInfinityShoulder(T color, T peak, T anchor, float compression_strength) {                \
    T shoulder_range = peak - anchor;                                                                      \
    T distance_from_anchor = max(color - anchor, (T)0.f);                                                  \
    T flat_weight = exp2(-shoulder_range / (compression_strength * distance_from_anchor));                 \
    T response_denominator = mad(distance_from_anchor, flat_weight, shoulder_range);                       \
    return mad(shoulder_range, distance_from_anchor / response_denominator, color - distance_from_anchor); \
  }

APPLYANCHORED_CINFINITY_SHOULDER_GENERATOR(float)
APPLYANCHORED_CINFINITY_SHOULDER_GENERATOR(float3)
#undef APPLYANCHORED_CINFINITY_SHOULDER_GENERATOR

// Pre-tonal chroma grading ----------------------------------------------------
//
// Chroma shaping happens before contrast / flare / highlights /
// shadows. anchor_in is therefore the adaptation/purity pivot for this stage.
// anchor_out supplies the mapped tonal pivot and C-infinity shoulder anchor.
//
// The three controls can independently use either:
//   CHROMA_SPACE_PRISM              : live Prism-primary/Yf neutral-axis scaling
//   CHROMA_SPACE_MACLEOD_BOYNTON    : adaptive Stockman-Sharpe LMS -> MB scaling
//
// The MB saturation path uses adaptive-relative purity.
// The MB blowout path uses separate per-cone bleaching availability.

float3 WorkingToLMS(float3 color, Config config) {
  return mul(config.working_to_lms_matrix, color);
}

float3 LMSToWorking(float3 lms, Config config) {
  return mul(config.lms_to_working_matrix, lms);
}

// Express the post-tonal peak in the pre-tonal anchor domain while preserving
// the configured peak / anchor_out ratio. This keeps blowout behavior stable
// when anchor_in and anchor_out differ.
float3 GetPreTonalPeak(Config config) {
  const float3 peak_over_output_anchor =
      renodx::math::DivideSafe(
          config.tone_map_peak,
          config.anchor_out,
          1.f.xxx);
  return config.anchor_in * peak_over_output_anchor;
}

float3 ToAdaptiveRelativeWeightedLMS(
    float3 lms_input,
    float3 adaptive_neutral_lms) {
  return renodx::math::DivideSafe(
      renodx::color::macleod_boynton::WeighLMS(lms_input),
      adaptive_neutral_lms,
      0.f.xxx);
}

float3 FromAdaptiveRelativeWeightedLMS(
    float3 lms_weighted_relative,
    float3 adaptive_neutral_lms) {
  return lms_weighted_relative * max(adaptive_neutral_lms, 1e-6f.xxx);
}

// Adaptive-relative MacLeod-Boynton purity scaling: normalize around the
// current adaptive LMS neutral, scale MB chromaticity away from its neutral,
// then restore the adaptive state and unweight LMS.
float3 ApplyMacLeodBoyntonPurity(
    float3 color,
    float purity_scale,
    Config config) {
  if (abs(purity_scale - 1.f) <= 1e-5f) return color;

  const float3 lms_input = WorkingToLMS(color, config);
  const float3 adaptive_neutral_lms =
      WorkingToLMS(config.anchor_in, config);

  const float3 relative_weighted =
      ToAdaptiveRelativeWeightedLMS(
          lms_input,
          adaptive_neutral_lms);

  float3 mb =
      renodx::color::macleod_boynton::from::WeightedLMS(
          relative_weighted);

  const float3 mb_neutral =
      renodx::color::macleod_boynton::from::LMS(1.f.xxx);

  mb.xy = lerp(mb_neutral.xy, mb.xy, purity_scale);

  const float3 relative_weighted_out =
      renodx::color::macleod_boynton::WeightedLMSFromMacleodBoynton(mb);

  const float3 lms_out =
      renodx::color::macleod_boynton::UnweighLMS(
          FromAdaptiveRelativeWeightedLMS(
              relative_weighted_out,
              adaptive_neutral_lms));

  return LMSToWorking(lms_out, config);
}

float3 ApplyChromaScale(
    float3 color,
    float chroma_scale,
    int chroma_space,
    Config config) {
  if (abs(chroma_scale - 1.f) <= 1e-5f) return color;

  [branch]
  if (chroma_space == CHROMA_SPACE_MACLEOD_BOYNTON) {
    return ApplyMacLeodBoyntonPurity(color, chroma_scale, config);
  }

  return ApplyYfChromaScale(color, chroma_scale, config);
}

// Highlight-saturation rolloff, evaluated before tonal grading. The selector
// uses Yf/log-luminance; the selected chroma basis
// determines how the resulting purity scale is applied.
float ComputeHighlightSaturationScale(
    float3 color,
    Config config) {
  if (config.highlight_saturation == 1.f) return 1.f;

  const float luminance = max(0.f, Yf(color, config));
  const float neutral_luminance =
      max(Yf(config.anchor_in, config), 0.000001f);

  const float highlight_saturation_peak_nits = 10000.f;
  const float luminance_from_neutral =
      max(luminance, neutral_luminance) / neutral_luminance;

  const float peak_from_neutral =
      highlight_saturation_peak_nits
      / (neutral_luminance
         * max(config.diffuse_white_nits, 0.000001f));

  const float rolloff_position =
      saturate(
          log2(luminance_from_neutral)
          / log2(max(peak_from_neutral, 1.00001f)));

  const float rolloff =
      rolloff_position * rolloff_position * rolloff_position
      * (rolloff_position
         * (rolloff_position * 6.f - 15.f)
         + 10.f);

  return 1.f - rolloff * (1.f - config.highlight_saturation);
}

// Prism-primary blowout: apply the scalar availability law, then neutralize
// in the live Prism/Yf basis.
float3 ApplyPrismBlowout(float3 color, Config config) {
  if (config.dechroma == 0.f) return color;

  const float adaptive_yf =
      max(Yf(config.anchor_in, config), 0.000001f);
  const float peak_yf =
      max(Yf(GetPreTonalPeak(config), config), 0.000001f);

  const float full_bleach_availability =
      1.f / (1.f + (peak_yf / adaptive_yf));
  const float availability =
      lerp(1.f, full_bleach_availability, config.dechroma);

  return ApplyYfChromaScale(color, availability, config);
}

// MacLeod-Boynton/LMS blowout: use per-cone bleaching availability and pull
// the cone response toward the adaptive neutral at equal total cone
// energy. Per-cone availability can vary across L, M, and S for vector
// anchors and peaks.
float3 ApplyMacLeodBoyntonBlowout(float3 color, Config config) {
  if (config.dechroma == 0.f) return color;

  float3 lms = WorkingToLMS(color, config);
  const float3 adaptive_neutral_lms =
      max(WorkingToLMS(config.anchor_in, config), 1e-6f.xxx);
  const float3 peak_lms =
      max(WorkingToLMS(GetPreTonalPeak(config), config), 0.f.xxx);

  float3 availability =
      1.f.xxx / (1.f.xxx + (peak_lms / adaptive_neutral_lms));
  availability = lerp(1.f.xxx, availability, config.dechroma);

  const float input_energy = lms.x + lms.y + lms.z;
  const float white_energy =
      adaptive_neutral_lms.x
      + adaptive_neutral_lms.y
      + adaptive_neutral_lms.z;

  const float3 white_at_energy =
      adaptive_neutral_lms
      * renodx::math::DivideSafe(input_energy, white_energy, 0.f);

  const float3 delta = (lms - white_at_energy) * availability;
  lms = max(0.f.xxx, white_at_energy + delta);

  return LMSToWorking(lms, config);
}

float3 ApplyChromaGrading(float3 color, Config config) {
  // Compute the highlight selector from the untouched pre-chroma signal.
  // This matters for MB mode because MB purity scaling uses LMS-relative
  // chromaticity around the adaptive neutral.
  const float highlight_scale =
      ComputeHighlightSaturationScale(color, config);

  // 1) Global saturation / purity.
  color = ApplyChromaScale(
      color,
      config.saturation,
      config.saturation_space,
      config);

  // 2) Highlight saturation, using a 10,000-nit smootherstep selector and an
  // independently selectable chroma basis.
  if (config.highlight_saturation != 1.f) {
    color = ApplyChromaScale(
        color,
        highlight_scale,
        config.highlight_saturation_space,
        config);
  }

  // 3) Blowout / bleaching.
  if (config.dechroma != 0.f) {
    [branch]
    if (config.blowout_space == CHROMA_SPACE_MACLEOD_BOYNTON) {
      color = ApplyMacLeodBoyntonBlowout(color, config);
    } else {
      color = ApplyPrismBlowout(color, config);
    }
  }

  return color;
}

// Applies pre-tonal chroma grading, anchored tonal grading, and the asymptotic
// C-infinity shoulder to a color ALREADY in the configured Prism basis.
float3 Apply(float3 color, Config config) {
  // Chroma shaping is evaluated in the scene/input domain.
  color = ApplyChromaGrading(color, config);

  if (config.contrast_function == CONTRAST_FUNCTION_POW) {
    // Power contrast is the direct anchored curve; flare and split controls
    // belong to the expanded anchored grading function below.
    color = ApplyAnchoredPowContrast(
        color,
        config.anchor_in,
        config.anchor_out,
        config.contrast);
  } else {
    color = ApplyAnchoredTonalGrading(
        color,
        config.anchor_in,
        config.anchor_out,
        config.contrast,
        config.flare,
        config.highlight_contrast,
        config.shadow_contrast,
        config.highlights,
        config.shadows);
  }

  color = ApplyAnchoredCInfinityShoulder(
      color,
      config.tone_map_peak,
      config.anchor_out,
      config.tone_map_compression_strength);

  return color;
}

// Public BT.709 -> Prism basis -> grade -> tone map -> BT.709 path.
//
// Matrices follow RenoDX's convention:
//   working = mul(inset_matrix, bt709);
//   bt709   = mul(outset_matrix, working);
//
// Output gamut handling is controlled by the caller.
float3 BT709(float3 bt709, Config config) {
  float3 color = mul(config.inset_matrix, bt709);
  color = Apply(color, config);
  return mul(config.outset_matrix, color);
}


// RenoDX cbuffer wiring example:
//
// const float3x3 prism_inset = MatrixFromRows(
//     shader_injection.prism_inset_0,
//     shader_injection.prism_inset_1,
//     shader_injection.prism_inset_2);
// const float3x3 prism_outset = MatrixFromRows(
//     shader_injection.prism_outset_0,
//     shader_injection.prism_outset_1,
//     shader_injection.prism_outset_2);
// const float3x3 prism_to_lms = MatrixFromRows(
//     shader_injection.prism_to_lms_0,
//     shader_injection.prism_to_lms_1,
//     shader_injection.prism_to_lms_2);
// const float3x3 lms_to_prism = MatrixFromRows(
//     shader_injection.prism_from_lms_0,
//     shader_injection.prism_from_lms_1,
//     shader_injection.prism_from_lms_2);
//
// Config prism_config = config::CreateResolved(
//     peak,
//     diffuse_white_nits,
//     anchor_in,
//     anchor_out,
//     prism_inset,
//     prism_outset,
//     shader_injection.prism_yf_weights.xyz,
//     shader_injection.prism_yf_neutral_axis.xyz,
//     shader_injection.prism_yf_weights.w,
//     prism_to_lms,
//     lms_to_prism,
//     compression_strength,
//     contrast_function,
//     highlights,
//     shadows,
//     contrast,
//     saturation,
//     highlight_saturation,
//     blowout,
//     flare,
//     highlight_contrast,
//     shadow_contrast,
//     saturation_space,
//     highlight_saturation_space,
//     blowout_space);
//
// color = BT709(color, prism_config);

}  // namespace prism
}  // namespace tonemap
}  // namespace renodx

#endif  // RENODX_MOD_PRISM_HLSL_
