#include "./common.hlsl"
#include "./prism/prism.hlsl"

float3x3 InvertMatrix(float3x3 source_matrix) {
  const float determinant = dot(
      source_matrix[0],
      cross(source_matrix[1], source_matrix[2]));
  const float determinant_rcp = rcp(
      abs(determinant) > renodx::math::FLT_MIN ? determinant : 1.f);

  return transpose(float3x3(
      cross(source_matrix[1], source_matrix[2]) * determinant_rcp,
      cross(source_matrix[2], source_matrix[0]) * determinant_rcp,
      cross(source_matrix[0], source_matrix[1]) * determinant_rcp));
}

// Apply Prism in the proven linear BT.709 scene domain. The stable anchor and
// tangent-derived power exponent are supplied by the live curve calibration in
// tonemap.frag, following Metro Exodus's extended-curve construction.
float3 ApplyPrismToneMap(
    float3 untonemapped_bt709,
    float peak_value,
    float diffuse_white_nits,
    float curve_anchor_in,
    float curve_anchor_out,
    float curve_power_contrast) {
  const float3x3 prism_inset_matrix =
      renodx::tonemap::prism::MatrixFromRows(
          float4(
              shader_injection.prism_inset_00,
              shader_injection.prism_inset_01,
              shader_injection.prism_inset_02,
              0.f),
          float4(
              shader_injection.prism_inset_10,
              shader_injection.prism_inset_11,
              shader_injection.prism_inset_12,
              0.f),
          float4(
              shader_injection.prism_inset_20,
              shader_injection.prism_inset_21,
              shader_injection.prism_inset_22,
              0.f));
  const float3x3 prism_outset_matrix = InvertMatrix(prism_inset_matrix);

  const float3x3 bt709_to_lms_matrix = float3x3(
      0.289605767f, 0.697246671f, 0.0763712823f,
      0.0901837572f, 0.707349002f, 0.112203151f,
      0.0155287404f, 0.0536093079f, 0.509797812f);
  const float3x3 lms_to_bt709_matrix = float3x3(
      4.9676199f, -4.92237949f, 0.339199185f,
      -0.619682908f, 2.05175066f, -0.358743995f,
      -0.0861520022f, -0.0658193827f, 1.98895442f);
  const float3x3 prism_working_to_lms_matrix =
      mul(bt709_to_lms_matrix, prism_outset_matrix);
  const float3x3 prism_lms_to_working_matrix =
      mul(prism_inset_matrix, lms_to_bt709_matrix);
  const float3 prism_yf_weights = mul(
      float3(0.231212795f, 0.727417529f, 0.0917715654f),
      prism_outset_matrix);
  const float3 prism_yf_neutral_axis = 1.f.xxx;
  const float prism_yf_neutral_axis_yf_rcp = rcp(max(
      dot(prism_yf_neutral_axis, prism_yf_weights),
      renodx::math::FLT_MIN));

    float prism_anchor_in = curve_anchor_in;
    float prism_anchor_out = curve_anchor_out;
    float prism_contrast = curve_power_contrast;

    // ToneMapCurve 0 follows the live game's toe power law and extends it from
    // the toe transition. ToneMapCurve 1 exposes manual Prism anchors.
  if (RENODX_TONE_MAP_CURVE != 0.f) {
        prism_anchor_in = RENODX_TONE_MAP_MID_GRAY_IN;
        prism_anchor_out = RENODX_TONE_MAP_MID_GRAY_OUT;
    prism_contrast = RENODX_TONE_MAP_CONTRAST;
    } else {
        prism_contrast *= RENODX_TONE_MAP_CONTRAST;
  }

  const float safe_peak = max(peak_value, 0.0002f);
    const float safe_anchor_in = max(
            prism_anchor_in,
            renodx::math::FLT_MIN);
    const float safe_anchor_out = min(
            max(prism_anchor_out, renodx::math::FLT_MIN),
      safe_peak * 0.9999f);

  const renodx::tonemap::prism::Config prism_config =
      renodx::tonemap::prism::config::CreateResolved(
                    max(safe_peak, safe_anchor_out + 0.0001f).xxx,
          max(diffuse_white_nits, 1.f),
          safe_anchor_in.xxx,
          safe_anchor_out.xxx,
          prism_inset_matrix,
          prism_outset_matrix,
          prism_yf_weights,
          prism_yf_neutral_axis,
          prism_yf_neutral_axis_yf_rcp,
          prism_working_to_lms_matrix,
          prism_lms_to_working_matrix,
          1.5f,
          renodx::tonemap::prism::CONTRAST_FUNCTION_ANCHORED,
          RENODX_TONE_MAP_HIGHLIGHTS,
          RENODX_TONE_MAP_SHADOWS,
          max(prism_contrast, 0.f),
          RENODX_TONE_MAP_SATURATION,
          RENODX_TONE_MAP_HIGHLIGHT_SATURATION,
          RENODX_TONE_MAP_BLOWOUT,
          RENODX_TONE_MAP_FLARE,
          1.f,
          1.f,
          renodx::tonemap::prism::CHROMA_SPACE_PRISM,
          renodx::tonemap::prism::CHROMA_SPACE_PRISM,
          renodx::tonemap::prism::CHROMA_SPACE_PRISM);

  return renodx::tonemap::prism::BT709(
      untonemapped_bt709 * RENODX_TONE_MAP_EXPOSURE,
      prism_config);
}

float3 ApplySceneGradeLUT(
    float3 input_color,
    float3 graded_color,
    float3 lut_black,
    float3 lut_mid) {
  lut_black = saturate(lut_black);
  lut_mid = saturate(lut_mid);

  if (SCENE_GRADE_LUT_SCALING > 0.f) {
    const float3 input_gamma =
        renodx::color::gamma::EncodeSafe(input_color, 2.2f);
    const float3 graded_gamma =
        renodx::color::gamma::EncodeSafe(graded_color, 2.2f);
    const float3 lut_black_gamma =
        renodx::color::gamma::EncodeSafe(lut_black, 2.2f);
    const float3 lut_mid_gamma =
        renodx::color::gamma::EncodeSafe(lut_mid, 2.2f);

    const bool per_channel_scaling =
        SCENE_GRADE_LUT_SCALING_TARGET != 0.f;

    const float black_min =
        renodx::math::Min(lut_black_gamma);

    if (black_min > 0.0001f) {
      // Original shared shadow fade.
      const float mid_gray_gamma = max(
          0.f,
          max(lut_mid_gamma.x,
              max(lut_mid_gamma.y, lut_mid_gamma.z)));

      const float neutral_gamma = max(
          0.f,
          max(input_gamma.x,
              max(input_gamma.y, input_gamma.z)));

      const float shadow_t = renodx::math::Select(
          mid_gray_gamma > 0.f,
          saturate(
              (mid_gray_gamma - neutral_gamma)
              / mid_gray_gamma),
          0.f);

      // Per-channel fade, but critically the removable floor
      // is still limited to the common minimum black floor.
      const float3 per_channel_shadow_t = saturate(
          renodx::math::DivideSafe(
              max(0.f.xxx, lut_mid_gamma - input_gamma),
              lut_mid_gamma,
              0.f.xxx));

      const float3 floor_remove = renodx::math::Select(
          per_channel_scaling,
          black_min * per_channel_shadow_t,
          black_min * shadow_t);

      const float3 unclamped_gamma =
          max(0.f.xxx, graded_gamma - floor_remove);

      const float3 channel_scale = saturate(
          renodx::math::DivideSafe(
              unclamped_gamma,
              graded_gamma,
              1.f.xxx));

      graded_color = renodx::color::gamma::DecodeSafe(
          graded_gamma * lerp(
              1.f.xxx,
              channel_scale,
              saturate(SCENE_GRADE_LUT_SCALING)),
          2.2f);
    }
  }

  return lerp(
      input_color,
      graded_color,
      saturate(SCENE_GRADE_LUT_STRENGTH));
}