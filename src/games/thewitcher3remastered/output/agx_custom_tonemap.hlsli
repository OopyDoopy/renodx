#ifndef THEWITCHER3REMASTERED_OUTPUT_AGX_CUSTOM_TONEMAP_HLSLI_
#define THEWITCHER3REMASTERED_OUTPUT_AGX_CUSTOM_TONEMAP_HLSLI_

#include "../shared.h"
#include "../tonemap/agx_tonemap.hlsli"

float3 ApplyAnchoredCInfinityShoulder(
    float3 color,
    float3 peak,
    float3 anchor,
    float compression_strength);
float3 ApplyVanillaPlusGrading(float3 color, float anchor);

static const float3x3 AGX_CUSTOM_INSET_MATRIX = float3x3(
    0.8424790502f, 0.0784336030f, 0.0792237446f,
    0.0423282422f, 0.8784686327f, 0.0791661292f,
    0.0423756540f, 0.0784336030f, 0.8791429996f);

static const float3x3 AGX_CUSTOM_OUTSET_MATRIX = float3x3(
    1.1968790293f, -0.0980208814f, -0.0990297422f,
    -0.0528968535f, 1.1519031525f, -0.0989611745f,
    -0.0529716350f, -0.0980434492f, 1.1510736942f);

float3 CustomAgxTonemap(
    float3 linear_color,
    float3 post_curve_scale,
    float saturation,
    float3 post_curve_power,
    float log_range_scale,
    float4 curve_params,
    float high_power,
    bool use_parametric_curve,
    float output_peak) {
  if (RENODX_TONE_MAP_TYPE != 1.f) return linear_color;

  float2 agx_inflection = AgxFindToneCurveInflectionAndSlope(
      use_parametric_curve,
      curve_params);

  float agx_curve_output = AgxEvaluateBoundedToneCurve(
      agx_inflection.x,
      use_parametric_curve,
      curve_params,
      high_power);
  float3 agx_midgray_out = agx_curve_output.xxx * post_curve_scale;
  agx_midgray_out = pow(max(agx_midgray_out, 0.f.xxx), post_curve_power);
  float agx_midgray_luminance = dot(
      agx_midgray_out,
      float3(0.2126729041f, 0.7151522040f, 0.0721750036f));
  agx_midgray_out = agx_midgray_luminance.xxx
      + (agx_midgray_out - agx_midgray_luminance.xxx) * saturation;
  float3 vanilla_midgray_bt709 = mul(
      AGX_CUSTOM_OUTSET_MATRIX,
      max(agx_midgray_out, 0.f.xxx));
  vanilla_midgray_bt709 = pow(
      max(vanilla_midgray_bt709, 0.0001f.xxx),
      2.2000000477f);
  agx_midgray_out = mul(AGX_CUSTOM_INSET_MATRIX, vanilla_midgray_bt709);
  agx_midgray_out = max(agx_midgray_out, 0.000001f.xxx);

  // Exposure and user grading/saturation have already been applied in the
  // first tonemap shader. Keep this final stage responsible for the AgX curve
  // and highlight shoulder only.
  float3 agx_color = mul(AGX_CUSTOM_INSET_MATRIX, linear_color);

  float tone_map_peak = max(
      output_peak,
      max(agx_midgray_out.r, max(agx_midgray_out.g, agx_midgray_out.b)) + 0.0001f);
  agx_color = ApplyAnchoredCInfinityShoulder(
      agx_color,
      tone_map_peak.xxx,
      agx_midgray_out,
      1.5f);
  return mul(AGX_CUSTOM_OUTSET_MATRIX, agx_color);
}

float3 CustomAgxTonemapSDR(float3 linear_color) {
    const float sdr_anchor = 0.18f;
    linear_color = ApplyVanillaPlusGrading(linear_color, sdr_anchor);

    float3 agx_color = mul(AGX_CUSTOM_INSET_MATRIX, linear_color);
    float3 agx_anchor = mul(AGX_CUSTOM_INSET_MATRIX, sdr_anchor.xxx);
    agx_color = ApplyAnchoredCInfinityShoulder(
            agx_color,
            1.f.xxx,
            agx_anchor,
            1.5f);
    return mul(AGX_CUSTOM_OUTSET_MATRIX, agx_color);
}

#endif  // THEWITCHER3REMASTERED_OUTPUT_AGX_CUSTOM_TONEMAP_HLSLI_