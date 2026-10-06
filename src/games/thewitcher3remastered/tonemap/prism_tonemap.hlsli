#ifndef THEWITCHER3REMASTERED_TONEMAP_PRISM_TONEMAP_HLSLI_
#define THEWITCHER3REMASTERED_TONEMAP_PRISM_TONEMAP_HLSLI_

#include "../shared.h"
#include "../prism/prism.hlsl"
#include "./agx_tonemap.hlsli"

float3x3 InvertPrismInset(float3x3 matrix) {
  float determinant = dot(matrix[0], cross(matrix[1], matrix[2]));
  float determinant_rcp = rcp(
      abs(determinant) > renodx::math::FLT_MIN ? determinant : 1.f);
  return transpose(float3x3(
      cross(matrix[1], matrix[2]) * determinant_rcp,
      cross(matrix[2], matrix[0]) * determinant_rcp,
      cross(matrix[0], matrix[1]) * determinant_rcp));
}

renodx::tonemap::prism::Config CreatePrismConfig(
    float peak,
    float diffuse_white_nits,
    float anchor_in = 0.18f,
    float anchor_out = 0.18f,
    float contrast_scale = 1.f) {
  const float3 safe_anchor_in = max(anchor_in, renodx::math::FLT_MIN).xxx;
  const float3 safe_anchor_out = min(
      max(anchor_out, renodx::math::FLT_MIN).xxx,
      max(peak - 0.0001f, renodx::math::FLT_MIN).xxx);
  const float3x3 inset_matrix = renodx::tonemap::prism::MatrixFromRows(
      float4(PRISM_INSET_00, PRISM_INSET_01, PRISM_INSET_02, 0.f),
      float4(PRISM_INSET_10, PRISM_INSET_11, PRISM_INSET_12, 0.f),
      float4(PRISM_INSET_20, PRISM_INSET_21, PRISM_INSET_22, 0.f));
  const float3x3 outset_matrix = InvertPrismInset(inset_matrix);
  const float3x3 bt709_to_lms = float3x3(
      0.289605767f, 0.697246671f, 0.0763712823f,
      0.0901837572f, 0.707349002f, 0.112203151f,
      0.0155287404f, 0.0536093079f, 0.509797812f);
  const float3x3 lms_to_bt709 = float3x3(
      4.9676199f, -4.92237949f, 0.339199185f,
      -0.619682908f, 2.05175066f, -0.358743995f,
      -0.0861520022f, -0.0658193827f, 1.98895442f);
  const float3x3 working_to_lms = mul(bt709_to_lms, outset_matrix);
  const float3x3 lms_to_working = mul(inset_matrix, lms_to_bt709);
  const float3 yf_weights = float3(
      shader_injection.prism_yf_weight_0,
      shader_injection.prism_yf_weight_1,
      shader_injection.prism_yf_weight_2);
  const float3 yf_neutral_axis = float3(
      shader_injection.prism_yf_neutral_axis_0,
      shader_injection.prism_yf_neutral_axis_1,
      shader_injection.prism_yf_neutral_axis_2);
  const renodx::tonemap::prism::Config config =
      renodx::tonemap::prism::config::CreateResolved(
          peak.xxx,
          diffuse_white_nits,
          safe_anchor_in,
          safe_anchor_out,
          inset_matrix,
          outset_matrix,
          yf_weights,
          yf_neutral_axis,
          shader_injection.prism_yf_neutral_reciprocal,
          working_to_lms,
          lms_to_working,
          2.0f,
          renodx::tonemap::prism::CONTRAST_FUNCTION_ANCHORED,
          RENODX_TONE_MAP_HIGHLIGHTS,
          RENODX_TONE_MAP_SHADOWS,
          RENODX_TONE_MAP_CONTRAST * contrast_scale,
          RENODX_TONE_MAP_SATURATION,
          RENODX_TONE_MAP_HIGHLIGHT_SATURATION,
          RENODX_TONE_MAP_BLOWOUT,
          RENODX_TONE_MAP_FLARE,
          RENODX_TONE_MAP_HIGHLIGHT_CONTRAST,
          RENODX_TONE_MAP_SHADOW_CONTRAST,
          renodx::tonemap::prism::CHROMA_SPACE_PRISM,
          renodx::tonemap::prism::CHROMA_SPACE_PRISM,
          renodx::tonemap::prism::CHROMA_SPACE_PRISM);

  return config;
}

float3 ApplyPrismGrading(
    float3 scene_bt709,
    float peak,
    float diffuse_white_nits,
    float anchor_in,
    float anchor_out,
    float contrast_scale = 1.f) {
  const renodx::tonemap::prism::Config config =
      CreatePrismConfig(peak, diffuse_white_nits, anchor_in, anchor_out, contrast_scale);
  float3 color = mul(config.inset_matrix, scene_bt709);
  color = renodx::tonemap::prism::ApplyGrading(color, config);
  return mul(config.outset_matrix, color);
}

float3 ApplyPrismGradingForCurrentOutput(
    float3 scene_bt709,
    AgxToneCurveSettings agx_curve,
    bool agx_curve_available,
    float anchor_in,
    float anchor_out,
    float contrast_scale = 1.f) {
  const float diffuse_white_nits = LAST_IS_HDR
      ? max(RENODX_DIFFUSE_WHITE_NITS, 0.000001f)
      : 100.f;
  const float peak = LAST_IS_HDR
      ? max(RENODX_PEAK_WHITE_NITS / diffuse_white_nits, 0.1801f)
      : 1.f;
  const float safe_anchor_in = max(anchor_in, renodx::math::FLT_MIN);
  const float safe_anchor_out = LAST_IS_HDR
      ? min(max(anchor_out, renodx::math::FLT_MIN), peak - 0.0001f)
      : max(anchor_out, renodx::math::FLT_MIN);
  const renodx::tonemap::prism::Config config =
      CreatePrismConfig(
          peak,
          diffuse_white_nits,
          safe_anchor_in,
          safe_anchor_out,
          contrast_scale);
  float3 color = mul(config.inset_matrix, scene_bt709);
  if (agx_curve_available) {
    if (agx_curve.use_parametric_curve && PRISM_BLACK_FLOOR < 1.0f) {
      const float a = agx_curve.pivot * agx_curve.curve_scale;
      const float p = agx_curve.low_power;
      const float target = 0.0001f / diffuse_white_nits;
      if (a > 0.5f && p > 0.0f
          && all(agx_curve.post_curve_scale > 0.0f)
          && all(agx_curve.post_curve_power > 0.0f)
          && target >= pow(0.0001f, 2.2000000477f)) {
        const float3 target_curve = pow(target.xxx,
            rcp(2.2000000477f * agx_curve.post_curve_power)) / agx_curve.post_curve_scale;
        // A minimum-channel target permits the largest of the per-channel curve limits.
        const float y = max(target_curve.r, max(target_curve.g, target_curve.b));
        const float d = 0.5f - y;
        if (d > 0.0f && d < a) {
          const float original_norm = a / pow(pow(2.0f * a, p) - 1.0f, rcp(p));
          const float solved_norm = a / pow(pow(a / d, p) - 1.0f, rcp(p));
          const float minimum_low_shoulder = min(
              agx_curve.low_shoulder, 1.0f - solved_norm / original_norm);
          agx_curve.low_shoulder = lerp(
              minimum_low_shoulder, agx_curve.low_shoulder, saturate(PRISM_BLACK_FLOOR));
        }
      }
    }
    color = AgxApplyExtendedToneCurveOnly(color, agx_curve);
  }
  color = renodx::tonemap::prism::ApplyChromaGrading(color, config);
  color = renodx::tonemap::prism::ApplyAnchoredTonalGrading(
      color,
      config.anchor_in,
      config.anchor_out,
      config.contrast,
      config.flare,
      config.highlight_contrast,
      config.shadow_contrast,
      config.highlights,
      config.shadows);
  return mul(config.outset_matrix, color);
}

float3 ApplyPrismShoulder(
    float3 scene_bt709,
    float peak,
    float diffuse_white_nits) {
  const renodx::tonemap::prism::Config config =
      CreatePrismConfig(peak, diffuse_white_nits);
  float3 color = mul(config.inset_matrix, scene_bt709);
  color = renodx::tonemap::prism::ApplyShoulder(color, config);
  return mul(config.outset_matrix, color);
}

float3 ApplyPrismShoulderHDR(float3 scene_bt709) {
  float diffuse_white_nits = max(RENODX_DIFFUSE_WHITE_NITS, 0.000001f);
  float peak = max(RENODX_PEAK_WHITE_NITS / diffuse_white_nits, 0.1801f);
  return ApplyPrismShoulder(scene_bt709, peak, diffuse_white_nits);
}

float3 ApplyPrismShoulderSDR(float3 scene_bt709) {
  return ApplyPrismShoulder(scene_bt709, 1.f, 100.f);
}

#endif  // THEWITCHER3REMASTERED_TONEMAP_PRISM_TONEMAP_HLSLI_