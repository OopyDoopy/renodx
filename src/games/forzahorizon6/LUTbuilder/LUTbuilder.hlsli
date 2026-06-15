#include "../shared.h"

#define FORZA_TONEMAP_GENERATOR(T)                                                           \
  T ForzaToneMap(T channel,                                                                  \
                 float peak_ratio,                                                           \
                 float toe_offset,                                                           \
                 float toe_strength,                                                         \
                 float shoulder_start,                                                       \
                 float shoulder_end,                                                         \
                 float shoulder_power,                                                       \
                 float shoulder_scale_log /* -999 disables shoulder */) {                    \
    T normalized = max(0.f, channel / peak_ratio);                                           \
                                                                                             \
    float toe_limit = toe_offset * 2.f;                                                      \
    T toe = normalized * normalized * toe_strength + toe_offset;                             \
    T mapped_normalized = renodx::math::Select(normalized < toe_limit, toe, normalized);     \
                                                                                             \
    if (shoulder_scale_log != -999.f) {                                                      \
      float shoulder_end_plus_one = shoulder_end + 1.f;                                      \
      T shoulder_t = renodx::math::Select(mapped_normalized >= shoulder_end_plus_one,        \
                                          1.f,                                               \
                                          shoulder_end_plus_one - mapped_normalized);        \
      T shoulder = 1.f - exp(shoulder_scale_log + log(shoulder_t) * shoulder_power);         \
      T shoulder_or_clamp = renodx::math::Select(mapped_normalized >= shoulder_end_plus_one, \
                                                 1.f,                                        \
                                                 shoulder);                                  \
      mapped_normalized = renodx::math::Select(mapped_normalized >= shoulder_start,          \
                                               shoulder_or_clamp,                            \
                                               mapped_normalized);                           \
    }                                                                                        \
                                                                                             \
    return mapped_normalized * peak_ratio;                                                   \
  }

FORZA_TONEMAP_GENERATOR(float)
FORZA_TONEMAP_GENERATOR(float3)

#undef FORZA_TONEMAP_GENERATOR

float3 ApplySDRTonemapLUT(float3 color, Texture3D SDR_LUT, SamplerState LUT_Sampler, float lut_strength, float lut_size, float pq_peak) {
  if (lut_strength <= 0.0f) {
    return color;
  }

  float lut_texel_bias = 0.5f / lut_size;
  float lut_texel_scale = 1.0f - (2.0f * lut_texel_bias);

  float3 lut_uv = renodx::color::pq::EncodeSafe(color, pq_peak);
  lut_uv = (lut_uv * lut_texel_scale) + lut_texel_bias;

  float3 sdr_tonemap_lut_color = SDR_LUT.SampleLevel(LUT_Sampler, lut_uv, 0.0f).rgb;

  return lerp(color, sdr_tonemap_lut_color, lut_strength);
}

float3 ApplyAnchoredPowContrast(
    float3 color,
    float anchor_in,
    float anchor_out,
    float contrast) {
  float safe_anchor_in = max(anchor_in, 0.000001f);
  float3 normalized = max(0.0f, color / safe_anchor_in);
  return pow(normalized, contrast) * anchor_out;
}

namespace lutbuilder {

struct TonemapLUTInflection {
  float midgray_in;
  float midgray_out;
  float output_slope;    // linear BT.709 dy / dx at the selected point
  float relative_slope;  // d(log y) / d(log x), suitable for anchored pow contrast
};

float3 SamplePQTonemapLUTLinearBT709(
    Texture3D<float4> lut,
    SamplerState lut_sampler,
    float3 color,
    float lut_size,
    float pq_peak) {
  float lut_texel_bias = 0.5f / lut_size;
  float lut_texel_scale = 1.0f - (2.0f * lut_texel_bias);

  float3 lut_uv = renodx::color::pq::EncodeSafe(color, pq_peak);
  lut_uv = (lut_uv * lut_texel_scale) + lut_texel_bias;

  return lut.SampleLevel(lut_sampler, lut_uv, 0.0f).rgb;
}

float SamplePQTonemapLUTLinearBT709Y(
    Texture3D<float4> lut,
    SamplerState lut_sampler,
    float input_value,
    float lut_size,
    float pq_peak) {
  float3 lut_color = SamplePQTonemapLUTLinearBT709(lut, lut_sampler, input_value.xxx, lut_size, pq_peak);
  return renodx::color::y::from::BT709(lut_color);
}

static const uint INFLECTION_COARSE_SAMPLE_COUNT = 17u;
static const uint INFLECTION_MAX_REFINEMENT_COUNT = 16u;
static const float INFLECTION_EPSILON = 0.000001f;
static const float INFLECTION_MIN_INPUT = 0.0001f;
static const float INFLECTION_MIN_INTERVAL_STOPS = 0.0001f;

TonemapLUTInflection EvaluateTonemapLUTInflectionPoint(
    Texture3D<float4> lut,
    SamplerState lut_sampler,
    float log_input,
    float log_search_min,
    float log_search_max,
    float slope_half_width_stops,
    float lut_size,
    float pq_peak) {
  TonemapLUTInflection result;

  float low_log_input = max(log_search_min, log_input - slope_half_width_stops);
  float high_log_input = min(log_search_max, log_input + slope_half_width_stops);

  float input_value = exp2(log_input);
  float low_input = max(INFLECTION_MIN_INPUT, exp2(low_log_input));
  float high_input = max(low_input + INFLECTION_EPSILON, exp2(high_log_input));

  float low_output = SamplePQTonemapLUTLinearBT709Y(lut, lut_sampler, low_input, lut_size, pq_peak);
  float mid_output = SamplePQTonemapLUTLinearBT709Y(lut, lut_sampler, input_value, lut_size, pq_peak);
  float high_output = SamplePQTonemapLUTLinearBT709Y(lut, lut_sampler, high_input, lut_size, pq_peak);

  float output_slope = (high_output - low_output) / max(high_input - low_input, INFLECTION_EPSILON);
  float relative_slope = (log2(max(high_output, INFLECTION_EPSILON)) - log2(max(low_output, INFLECTION_EPSILON))) /
                         max(log2(high_input) - log2(low_input), INFLECTION_EPSILON);

  result.midgray_in = input_value;
  result.midgray_out = mid_output;
  result.output_slope = max(0.0f, output_slope);
  result.relative_slope = max(0.0f, relative_slope);

  return result;
}

void SelectBetterTonemapLUTInflection(inout TonemapLUTInflection best, TonemapLUTInflection candidate) {
  if (candidate.relative_slope > best.relative_slope) {
    best = candidate;
  }
}

TonemapLUTInflection FindTonemapLUTInflection(
    Texture3D<float4> lut,
    SamplerState lut_sampler,
    float seed_input,
    float lut_size,
    float pq_peak,
    float search_radius_stops,
    float slope_half_width_stops,
    uint refinement_count = 4u) {
  refinement_count = min(refinement_count, INFLECTION_MAX_REFINEMENT_COUNT);

  float search_min = max(INFLECTION_MIN_INPUT, seed_input * exp2(-search_radius_stops));
  float search_max = max(search_min + INFLECTION_EPSILON, seed_input * exp2(search_radius_stops));
  float log_search_min = log2(search_min);
  float log_search_max = log2(search_max);
  float best_log_input = log2(max(seed_input, INFLECTION_MIN_INPUT));

  TonemapLUTInflection best = EvaluateTonemapLUTInflectionPoint(
      lut,
      lut_sampler,
      best_log_input,
      log_search_min,
      log_search_max,
      slope_half_width_stops,
      lut_size,
      pq_peak);

  float coarse_step = (log_search_max - log_search_min) / float(INFLECTION_COARSE_SAMPLE_COUNT - 1u);

  [unroll]
  for (uint sample_index = 0u; sample_index < INFLECTION_COARSE_SAMPLE_COUNT; sample_index++) {
    float sample_log_input = log_search_min + (coarse_step * float(sample_index));

    TonemapLUTInflection candidate = EvaluateTonemapLUTInflectionPoint(
        lut,
        lut_sampler,
        sample_log_input,
        log_search_min,
        log_search_max,
        slope_half_width_stops,
        lut_size,
        pq_peak);

    if (candidate.relative_slope > best.relative_slope) {
      best = candidate;
      best_log_input = sample_log_input;
    }
  }

  float interval_min = max(log_search_min, best_log_input - coarse_step);
  float interval_max = min(log_search_max, best_log_input + coarse_step);

  [loop]
  for (uint refinement_index = 0u; refinement_index < INFLECTION_MAX_REFINEMENT_COUNT; refinement_index++) {
    if (refinement_index >= refinement_count) {
      break;
    }

    float interval_width = interval_max - interval_min;
    if (interval_width <= INFLECTION_MIN_INTERVAL_STOPS) {
      break;
    }

    float center_log_input = (interval_min + interval_max) * 0.5f;
    float quarter_width = interval_width * 0.25f;
    float left_log_input = center_log_input - quarter_width;
    float right_log_input = center_log_input + quarter_width;

    TonemapLUTInflection left = EvaluateTonemapLUTInflectionPoint(
        lut, lut_sampler, left_log_input, log_search_min, log_search_max, slope_half_width_stops, lut_size, pq_peak);
    TonemapLUTInflection center = EvaluateTonemapLUTInflectionPoint(
        lut, lut_sampler, center_log_input, log_search_min, log_search_max, slope_half_width_stops, lut_size, pq_peak);
    TonemapLUTInflection right = EvaluateTonemapLUTInflectionPoint(
        lut, lut_sampler, right_log_input, log_search_min, log_search_max, slope_half_width_stops, lut_size, pq_peak);

    SelectBetterTonemapLUTInflection(best, left);
    SelectBetterTonemapLUTInflection(best, center);
    SelectBetterTonemapLUTInflection(best, right);

    if (center.relative_slope >= left.relative_slope && center.relative_slope >= right.relative_slope) {
      interval_min = left_log_input;
      interval_max = right_log_input;
    } else if (left.relative_slope > right.relative_slope) {
      interval_max = center_log_input;
    } else {
      interval_min = center_log_input;
    }
  }

  return best;
}

}  // namespace lutbuilder