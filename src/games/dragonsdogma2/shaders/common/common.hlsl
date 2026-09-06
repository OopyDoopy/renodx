#include "../../shared.h"
#include "../../prism/prism.hlsl"

float3 CustomPostProcessing(float3 color, float2 uv) {
  return renodx::effects::ApplyFilmGrain(
      color,
      uv,
      CUSTOM_RANDOM,
      CUSTOM_FILM_GRAIN_STRENGTH * 0.03f);
}

float3 EncodePrismSDR(float3 color) {
  if (RENODX_SDR_ENCODING == 0.f) {
    return renodx::color::srgb::EncodeSafe(color);
  }
  if (RENODX_SDR_ENCODING == 1.f) {
    return renodx::color::gamma::EncodeSafe(color, 2.2f);
  }
  return renodx::color::gamma::EncodeSafe(color, 2.4f);
}

float3 DecodePrismSDR(float3 color) {
  if (RENODX_SDR_ENCODING == 0.f) {
    return renodx::color::srgb::DecodeSafe(color);
  }
  if (RENODX_SDR_ENCODING == 1.f) {
    return renodx::color::gamma::DecodeSafe(color, 2.2f);
  }
  return renodx::color::gamma::DecodeSafe(color, 2.4f);
}

// Applies the LUT floor correction in the shader's native AP1-linear space.
// lut_mid must be sampled from the LUT chain using the saturated lut_black.
float3 ApplySceneGradeLUT(
    float3 input_color,
    float3 graded_color,
    float3 lut_black,
    float3 lut_mid) {
  lut_black = saturate(lut_black);
  lut_mid = saturate(lut_mid);

  if (SCENE_GRADE_LUT_SCALING > 0.f) {
    const float lut_black_floor = renodx::math::Select(
        SCENE_GRADE_LUT_SCALING_TARGET != 0.f,
        renodx::math::Max(lut_black),
        renodx::math::Min(lut_black));

    if (lut_black_floor > 0.0001f) {
      const float mid_y = max(0.f, renodx::color::yf::from::AP1(lut_mid));
      const float neutral_y = max(0.f, renodx::color::yf::from::AP1(input_color));
      const float shadow_t = renodx::math::Select(
          mid_y > 0.f,
          saturate((mid_y - neutral_y) / mid_y),
          0.f);
      const float3 floor_remove = lut_black_floor * shadow_t;
      const float3 unclamped = max(0.f, graded_color - floor_remove);

      graded_color = lerp(
          graded_color,
          unclamped,
          saturate(SCENE_GRADE_LUT_SCALING));
    }
  }

  return lerp(
      input_color,
      graded_color,
      saturate(SCENE_GRADE_LUT_STRENGTH));
}

float3x3 InvertMatrix(float3x3 matrix) {
  const float determinant = dot(
      matrix[0],
      cross(matrix[1], matrix[2]));
  const float determinant_rcp = rcp(
      abs(determinant) > renodx::math::FLT_MIN ? determinant : 1.f);

  return transpose(float3x3(
      cross(matrix[1], matrix[2]) * determinant_rcp,
      cross(matrix[2], matrix[0]) * determinant_rcp,
      cross(matrix[0], matrix[1]) * determinant_rcp));
}

float3 ApplyPrismToneMap(
    float3 untonemapped_bt709,
    float peak_value,
    float diffuse_white_nits) {
  const float3x3 inset_matrix = renodx::tonemap::prism::MatrixFromRows(
      float4(shader_injection.prism_inset_00, shader_injection.prism_inset_01, shader_injection.prism_inset_02, 0.f),
      float4(shader_injection.prism_inset_10, shader_injection.prism_inset_11, shader_injection.prism_inset_12, 0.f),
      float4(shader_injection.prism_inset_20, shader_injection.prism_inset_21, shader_injection.prism_inset_22, 0.f));
  const float3x3 outset_matrix = InvertMatrix(inset_matrix);
  const float3x3 bt709_to_lms_matrix = float3x3(
      0.289605767f, 0.697246671f, 0.0763712823f,
      0.0901837572f, 0.707349002f, 0.112203151f,
      0.0155287404f, 0.0536093079f, 0.509797812f);
  const float3x3 lms_to_bt709_matrix = float3x3(
      4.9676199f, -4.92237949f, 0.339199185f,
      -0.619682908f, 2.05175066f, -0.358743995f,
      -0.0861520022f, -0.0658193827f, 1.98895442f);
  const float3x3 working_to_lms_matrix = mul(bt709_to_lms_matrix, outset_matrix);
  const float3x3 lms_to_working_matrix = mul(inset_matrix, lms_to_bt709_matrix);
  const float3 yf_weights = mul(
      float3(0.231212795f, 0.727417529f, 0.0917715654f),
      outset_matrix);
  // Prism's resolved white is outset * 1, so inset maps it back to this unit axis.
  const float3 yf_neutral_axis = float3(1.f, 1.f, 1.f);
  const float yf_neutral_axis_yf_rcp = rcp(max(
      dot(yf_neutral_axis, yf_weights),
      renodx::math::FLT_MIN));
  const bool recommended_curve = RENODX_TONE_MAP_CURVE == 0.f;
  float prism_exposure = RENODX_TONE_MAP_EXPOSURE;
  float prism_highlights = RENODX_TONE_MAP_HIGHLIGHTS;
  float prism_shadows = RENODX_TONE_MAP_SHADOWS;
  float prism_saturation = RENODX_TONE_MAP_SATURATION;
  float prism_highlight_saturation = RENODX_TONE_MAP_HIGHLIGHT_SATURATION;
  float prism_blowout = RENODX_TONE_MAP_BLOWOUT;
  float prism_flare = RENODX_TONE_MAP_FLARE;
  float prism_mid_gray_in = RENODX_TONE_MAP_MID_GRAY_IN;
  float prism_mid_gray_out = RENODX_TONE_MAP_MID_GRAY_OUT;
  float prism_contrast = RENODX_TONE_MAP_CONTRAST;

  if (recommended_curve) {
    // Scale controls are normalized around their neutral UI values.
    prism_exposure = 0.35f * RENODX_TONE_MAP_EXPOSURE;
    prism_highlights = RENODX_TONE_MAP_HIGHLIGHTS;
    prism_shadows = RENODX_TONE_MAP_SHADOWS;
    prism_saturation = RENODX_TONE_MAP_SATURATION;
    prism_highlight_saturation = RENODX_TONE_MAP_HIGHLIGHT_SATURATION;
    prism_contrast = 1.2f * RENODX_TONE_MAP_CONTRAST;

    // Flare is additive and the UI's neutral value is zero. Blowout's
    // 0.0001 value is only the parser's safety floor, not a grading value.
    prism_flare = 0.015f + RENODX_TONE_MAP_FLARE;
    prism_blowout = RENODX_TONE_MAP_BLOWOUT;

    // Anchors are absolute luminance values, not scale controls.
    prism_mid_gray_in = 0.18f;
    prism_mid_gray_out = 0.15f;
  }

  const renodx::tonemap::prism::Config prism_config =
      renodx::tonemap::prism::config::CreateResolved(
          peak_value.xxx,
          diffuse_white_nits,
          prism_mid_gray_in.xxx,
          prism_mid_gray_out.xxx,
          inset_matrix,
          outset_matrix,
          yf_weights,
          yf_neutral_axis,
          yf_neutral_axis_yf_rcp,
          working_to_lms_matrix,
          lms_to_working_matrix,
          1.5f,
          renodx::tonemap::prism::CONTRAST_FUNCTION_ANCHORED,
          prism_highlights,
          prism_shadows,
          prism_contrast,
          prism_saturation,
          prism_highlight_saturation,
          prism_blowout,
          prism_flare,
          1.f,
          1.f,
          renodx::tonemap::prism::CHROMA_SPACE_PRISM,
          renodx::tonemap::prism::CHROMA_SPACE_PRISM,
          renodx::tonemap::prism::CHROMA_SPACE_PRISM);

  return renodx::tonemap::prism::BT709(
      untonemapped_bt709 * prism_exposure,
      prism_config);
}

float3 GenerateOptimizedPrismHDR(float3 source_ap1) {
  float3 output_color = ApplyPrismToneMap(
      renodx::color::bt709::from::AP1(source_ap1),
      RENODX_PEAK_WHITE_NITS / RENODX_DIFFUSE_WHITE_NITS,
      RENODX_DIFFUSE_WHITE_NITS);
  output_color = renodx::color::gamut::GamutCompressBT2020(output_color);
  return renodx::color::pq::EncodeSafe(
      renodx::color::bt2020::from::BT709(output_color),
      RENODX_DIFFUSE_WHITE_NITS);
}

float3 GenerateOptimizedPrismSDR(float3 source_ap1) {
  float3 output_color = ApplyPrismToneMap(
      renodx::color::bt709::from::AP1(source_ap1),
      1.f,
      100.f);
  output_color = renodx::color::gamut::GamutCompressBT709(output_color);
  return EncodePrismSDR(output_color);
}

void CustomVignette(inout float vignette) {
  vignette = lerp(1.f, vignette, CUSTOM_VIGNETTE);
}

float3 UpgradeToneMapMaxChannel(
    float3 color_untonemapped,
    float3 color_tonemapped,
    float3 color_tonemapped_graded,
    float post_process_strength = 1.f,
    float auto_correction = 1.f) {
  float ratio = 1.f;

  const float max_untonemapped = renodx::math::Max(color_untonemapped);
  const float max_tonemapped = renodx::math::Max(color_tonemapped);
  const float max_tonemapped_graded = renodx::math::Max(color_tonemapped_graded);

  if (max_untonemapped < max_tonemapped) {
    // If subtracting (user contrast or paperwhite), scale down instead.
    ratio = max_untonemapped / max_tonemapped;
  } else {
    float max_delta = max_untonemapped - max_tonemapped;
    max_delta = max(0, max_delta);  // Cleans up NaN.
    const float max_new = max_tonemapped_graded + max_delta;

    const bool max_valid = max_tonemapped_graded > 0;  // Ignore black and NaN.
    ratio = max_valid ? (max_new / max_tonemapped_graded) : 0;
  }
  const float auto_correct_ratio = lerp(1.f, ratio, saturate(max_untonemapped));
  ratio = lerp(ratio, auto_correct_ratio, auto_correction);

  const float3 color_scaled = color_tonemapped_graded * ratio;
  return lerp(color_untonemapped, color_scaled, post_process_strength);
}
