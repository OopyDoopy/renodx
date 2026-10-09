#include "./shared.h"
#include "./prism/prism.hlsl"

float3 LutDecode(float3 color) {
    color = renodx::color::pq::Decode(color, 100.f);
    color = renodx::color::bt709::from::BT2020(color);
    return color;
}

float3 LutEncode(float3 color) {
    color = renodx::color::bt2020::from::BT709(color);
    color = renodx::color::pq::EncodeSafe(color, 100.f);
    return color;
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

float3x3 InvertMatrix(float3x3 input_matrix) {
  const float determinant = dot(
      input_matrix[0],
      cross(input_matrix[1], input_matrix[2]));
  const float determinant_rcp = rcp(
      abs(determinant) > renodx::math::FLT_MIN ? determinant : 1.f);

  return transpose(float3x3(
      cross(input_matrix[1], input_matrix[2]) * determinant_rcp,
      cross(input_matrix[2], input_matrix[0]) * determinant_rcp,
      cross(input_matrix[0], input_matrix[1]) * determinant_rcp));
}

float3 ApplyPrismToneMapWithConfig(
    float3 untonemapped_bt709,
    float peak_value,
    float diffuse_white_nits) {
  const float3x3 inset_matrix = renodx::tonemap::prism::MatrixFromRows(
            float4(PRISM_INSET_00, PRISM_INSET_01, PRISM_INSET_02, 0.f),
            float4(PRISM_INSET_10, PRISM_INSET_11, PRISM_INSET_12, 0.f),
            float4(PRISM_INSET_20, PRISM_INSET_21, PRISM_INSET_22, 0.f));
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
  float prism_highlight_contrast = PRISM_HIGHLIGHT_CONTRAST;
  float prism_shadow_contrast = PRISM_SHADOW_CONTRAST;

  if (recommended_curve) {
    // Scale controls are normalized around their neutral UI values.
    prism_exposure = RENODX_TONE_MAP_EXPOSURE;
    prism_highlights = RENODX_TONE_MAP_HIGHLIGHTS;
    prism_shadows = RENODX_TONE_MAP_SHADOWS;
    prism_saturation = RENODX_TONE_MAP_SATURATION;
    prism_highlight_saturation = RENODX_TONE_MAP_HIGHLIGHT_SATURATION;
    prism_contrast = 1.6f * RENODX_TONE_MAP_CONTRAST;

    // Flare is additive and the UI's neutral value is zero. Blowout's
    // 0.0001 value is only the parser's safety floor, not a grading value.
    prism_flare = 0.015f + RENODX_TONE_MAP_FLARE;

    // Anchors are absolute luminance values, not scale controls.
    prism_mid_gray_in = 0.18f;
    prism_mid_gray_out = 0.10f;
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
          prism_highlight_contrast,
          prism_shadow_contrast,
          renodx::tonemap::prism::CHROMA_SPACE_PRISM,
          renodx::tonemap::prism::CHROMA_SPACE_PRISM,
          renodx::tonemap::prism::CHROMA_SPACE_PRISM);

  return renodx::tonemap::prism::BT709(
      untonemapped_bt709 * prism_exposure,
      prism_config);
}

float3 ApplyPrismToneMap(float3 untonemapped_bt709) {
    float peak_value = RENODX_PEAK_WHITE_NITS
            / max(RENODX_DIFFUSE_WHITE_NITS, 0.000001f);
    float diffuse_white_nits = RENODX_DIFFUSE_WHITE_NITS;
    if (RENODX_SWAP_CHAIN_OUTPUT_PRESET == 0.f) {
        peak_value = 1.f;
        diffuse_white_nits = 1.f;
    }

    return ApplyPrismToneMapWithConfig(
            untonemapped_bt709,
            peak_value,
            diffuse_white_nits);
}

float3 IntermediatePass(float3 color) {
    if (RENODX_SWAP_CHAIN_OUTPUT_PRESET == 0.f) {
        return color;
    }

  return color * (
      RENODX_DIFFUSE_WHITE_NITS
      / max(RENODX_GRAPHICS_WHITE_NITS, 0.000001f));
}

float3 FinalPass(float3 color) {
  color = SanitizeGamutInputBT709(color);
  if (RENODX_SWAP_CHAIN_OUTPUT_PRESET == 0.f) {
    color = renodx::color::gamut::GamutCompressBT709(color);
        if (RENODX_SDR_ENCODING == 0.f) {
            return renodx::color::srgb::EncodeSafe(color);
        }
        if (RENODX_SDR_ENCODING == 1.f) {
            return renodx::color::gamma::EncodeSafe(color, 2.2f);
        }
        return renodx::color::gamma::EncodeSafe(color, 2.4f);
    }

    color *= RENODX_GRAPHICS_WHITE_NITS;
    color = renodx::color::bt2020::from::BT709(color);
    color = renodx::color::gamut::GamutCompressBT2020(color);
    color = min(color, RENODX_PEAK_WHITE_NITS.xxx);
    return renodx::color::pq::EncodeSafe(color, 1.f);
}

float3 ApplySceneGradeLUT(
    float3 input_color,
    float3 graded_color,
    float3 lut_black,
    float3 lut_mid) {
  lut_black = saturate(lut_black);
  lut_mid = saturate(lut_mid);

  if (CUSTOM_LUT_SCALING > 0.f) {
    const float lut_black_floor = CUSTOM_LUT_SCALING_TARGET != 0.f
        ? renodx::math::Max(lut_black)
        : renodx::math::Min(lut_black);

    if (lut_black_floor > 0.0001f) {
      const float mid_y = max(0.f, renodx::color::y::from::BT709(lut_mid));
      const float neutral_y = max(0.f, renodx::color::y::from::BT709(input_color));
      const float shadow_t = mid_y > 0.f
          ? saturate((mid_y - neutral_y) / mid_y)
          : 0.f;
      const float3 floor_remove = lut_black_floor * shadow_t;
      const float3 unclamped = max(0.f, graded_color - floor_remove);
      graded_color = lerp(
          graded_color,
          unclamped,
          saturate(CUSTOM_LUT_SCALING));
    }
  }

  return lerp(
      input_color,
      graded_color,
      saturate(CUSTOM_LUT_STRENGTH));
}
