#ifndef SRC_THEWITCHER3REMASTERED_FINAL_HDR_PASS_HLSLI_
#define SRC_THEWITCHER3REMASTERED_FINAL_HDR_PASS_HLSLI_

#include "../tonemap/prism_tonemap.hlsli"
#include "./agx_custom_tonemap.hlsli"

float3 TheWitcher3RemasteredMapFinalHDRScene(
  float3 scene_color_bt2020,
  float3 agx_post_curve_scale,
  float agx_saturation,
  float3 agx_post_curve_power,
  float agx_log_range_scale,
  float4 agx_curve_params,
  float agx_high_power,
  bool use_parametric_agx_curve) {
  const float reference_white_nits = 100.f;
  float3 scene_linear_bt2020 = scene_color_bt2020;
  if (RENODX_TONE_MAP_TYPE == 1.f) {
    // The AgX inset/outset matrices and tone curve operate in linear BT.709.
    float3 scene_linear_bt709 = renodx::color::bt709::from::BT2020(scene_linear_bt2020);
    float diffuse_white_nits = max(RENODX_DIFFUSE_WHITE_NITS, 0.000001f);
    float output_peak = RENODX_PEAK_WHITE_NITS / diffuse_white_nits;
    scene_linear_bt709 = CustomAgxTonemap(
      scene_linear_bt709,
      agx_post_curve_scale,
      agx_saturation,
      agx_post_curve_power,
      agx_log_range_scale,
      agx_curve_params,
      agx_high_power,
      use_parametric_agx_curve,
      output_peak);
    scene_linear_bt2020 = renodx::color::bt2020::from::BT709(scene_linear_bt709);
  } else if (RENODX_TONE_MAP_TYPE == 2.f) {
    float3 scene_linear_bt709 = renodx::color::bt709::from::BT2020(scene_linear_bt2020);
    scene_linear_bt709 = ApplyPrismShoulderHDR(scene_linear_bt709);
    scene_linear_bt2020 = renodx::color::bt2020::from::BT709(scene_linear_bt709);
  }
  return scene_linear_bt2020 * (RENODX_DIFFUSE_WHITE_NITS / reference_white_nits);
}

float3 TheWitcher3RemasteredCompositeFinalHDRUI(
    float3 scene_color_reference_white,
    float3 ui_color_bt2020,
    float ui_alpha,
    bool composite_ui) {
  if (!composite_ui || ui_alpha <= 0.f) return scene_color_reference_white;

  float3 ui_color = ui_color_bt2020
      * (RENODX_GRAPHICS_WHITE_NITS / 100.f);
  return HandleUICompositing(
      float4(ui_color, ui_alpha),
      float4(scene_color_reference_white, 1.f)).rgb;
}

float4 TheWitcher3RemasteredEncodeFinalHDR(
    float3 output_color_reference_white,
    float output_alpha) {
  float peak_scale = RENODX_PEAK_WHITE_NITS / 100.f;
  float3 sanitized_output = SanitizeGamutInputBT2020(output_color_reference_white);
  float3 gamut_compressed = renodx::color::gamut::GamutCompressBT2020(sanitized_output);
  float3 clamped_color = min(max(gamut_compressed, 0.f), peak_scale.xxx);
  return float4(renodx::color::pq::Encode(clamped_color, 100.f), output_alpha);
}

float4 TheWitcher3RemasteredFinalHDRPass(
    float3 scene_color_bt2020,
    float3 ui_color_bt2020,
    float ui_alpha,
    bool composite_ui,
    float output_alpha,
    float3 agx_post_curve_scale,
    float agx_saturation,
    float3 agx_post_curve_power,
    float agx_log_range_scale,
    float4 agx_curve_params,
    float agx_high_power,
    bool use_parametric_agx_curve) {
  float3 scene_color_reference_white =
      TheWitcher3RemasteredMapFinalHDRScene(
          scene_color_bt2020,
          agx_post_curve_scale,
          agx_saturation,
          agx_post_curve_power,
          agx_log_range_scale,
          agx_curve_params,
          agx_high_power,
          use_parametric_agx_curve);
  float3 output_color_reference_white = TheWitcher3RemasteredCompositeFinalHDRUI(
      scene_color_reference_white,
      ui_color_bt2020,
      ui_alpha,
      composite_ui);

  return TheWitcher3RemasteredEncodeFinalHDR(
      output_color_reference_white,
      output_alpha);
}

#endif  // SRC_THEWITCHER3REMASTERED_FINAL_HDR_PASS_HLSLI_
