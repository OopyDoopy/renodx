#include "./LUTbuilder.hlsli"
#include "../common.hlsl"
#include "../prism/prism.hlsl"

cbuffer _22_24 : register(b0, space0) {
  float4 _24_m0[25] : packoffset(c0);
};

Texture3D<float4> _11[20] : register(t0, space0);
Texture3D<float4> SDR_LUT : register(t20, space0);
Texture3D<float4> HDR_LUT : register(t21, space0);
RWTexture3D<float4> SDR_Output : register(u0, space0);
RWTexture3D<float4> HDR_Output : register(u1, space0);
SamplerState LUT_Sampler : register(s0, space0);

static uint3 gl_GlobalInvocationID;

struct SPIRV_Cross_Input {
  uint3 gl_GlobalInvocationID : SV_DispatchThreadID;
  uint gl_LocalInvocationIndex : SV_GroupIndex;
};

#if 0
groupshared float3 vanilla_curve_parameters;

void InitializeVanillaCurveParameters(uint group_index) {
  if (RENODX_TONE_MAP_TYPE == 0.f || CUSTOM_TONE_MAP_CURVE != 1) return;

  if (group_index == 0u) {
    const float vanilla_mid_gray = 0.18f;
    const float vanilla_search_radius_stops = 4.f;
    const float vanilla_slope_half_width_stops = 0.1f;
    const float vanilla_contrast_half_width_stops = 0.25f;
    const float vanilla_log_search_min = log2(vanilla_mid_gray) - vanilla_search_radius_stops;
    const float vanilla_log_search_max = log2(vanilla_mid_gray) + vanilla_search_radius_stops;

    lutbuilder::TonemapLUTInflection sdr_lut_curve = lutbuilder::FindTonemapLUTInflection(
        SDR_LUT,
        LUT_Sampler,
        vanilla_mid_gray,
        _24_m0[20u].y,
        _24_m0[20u].z,
        vanilla_search_radius_stops,
        vanilla_slope_half_width_stops,
        6u);
    lutbuilder::TonemapLUTInflection sdr_lut_contrast = lutbuilder::EvaluateTonemapLUTInflectionPoint(
        SDR_LUT,
        LUT_Sampler,
        log2(sdr_lut_curve.midgray_in),
        vanilla_log_search_min,
        vanilla_log_search_max,
        vanilla_contrast_half_width_stops,
        _24_m0[20u].y,
        _24_m0[20u].z);

    vanilla_curve_parameters = float3(
        sdr_lut_curve.midgray_in,
        sdr_lut_curve.midgray_out,
        sdr_lut_contrast.relative_slope);
  }

  GroupMemoryBarrierWithGroupSync();
}
#endif

float3 ColorGradingLUTs(float3 input_color) {
  float3 working_color = input_color;

  uint lut_count = asuint(_24_m0[20u]).x;
  if (lut_count > 0u) {
    uint max_lut_count = min(lut_count, 20u);

    float lut_size = _24_m0[20u].y;
    float lut_texel_bias = 0.5f / lut_size;
    float lut_texel_scale = 1.0f - (2.0f * lut_texel_bias);

    for (uint lut_index = 0u; lut_index < max_lut_count; lut_index++) {
      float3 lut_uv = renodx::color::pq::EncodeSafe(working_color, _24_m0[20u].z) * lut_texel_scale + lut_texel_bias;
      float3 lut_color = _11[lut_index].SampleLevel(LUT_Sampler, lut_uv, 0.0f).rgb;

      working_color = lerp(working_color, lut_color, _24_m0[lut_index].x);
    }
  }
  return working_color;
}

float3 ImprovedColorGradingLUTs(float3 input_color, float lut_scaling = 1.f) {
  const float black_floor = 0.0001f;

  float3 lut_corrected = ColorGradingLUTs(input_color);

  if (lut_scaling > 0.f) {
    const float3 lut_black = saturate(ColorGradingLUTs(0.f));
    const float3 lut_mid = saturate(ColorGradingLUTs(lut_black));
    const float lut_black_floor = renodx::math::Min(lut_black);

    if (lut_black_floor > black_floor) {
      const float mid_y = max(0.f, renodx::color::yf::from::BT709(lut_mid));
      const float neutral_y = max(0.f, renodx::color::yf::from::BT709(input_color));
      const float shadow_t = mid_y > 0.f
                                 ? saturate((mid_y - neutral_y) / mid_y)
                                 : 0.f;
      const float3 floor_remove = lut_black_floor * shadow_t;
      const float3 unclamped = max(0.f, lut_corrected - floor_remove);

      lut_corrected = lerp(lut_corrected, unclamped, saturate(lut_scaling));
    }
  }
  return lut_corrected;
}

void comp_main() {
  float3 input = gl_GlobalInvocationID / (_24_m0[20u].y - 1.0f);

  float3 color = float3(renodx::color::pq::Decode(input, _24_m0[20u].z));

  float3 working_color = color;

  if (RENODX_TONE_MAP_TYPE != 0.f) {
    float lut_scaling = SCENE_GRADE_LUT_SCALING;
    float3 graded_color = ImprovedColorGradingLUTs(working_color, lut_scaling);
    float grading_peak_nits = renodx::math::Max(ImprovedColorGradingLUTs(100.f, lut_scaling));
    float y_in = renodx::color::yf::from::BT709(working_color);
    float y_out = renodx::tonemap::Neutwo(y_in, grading_peak_nits);
    float3 reference_color = renodx::color::correct::Luminance(working_color, y_in, y_out);
    working_color = renodx::tonemap::UpgradeToneMap(working_color, reference_color, graded_color, SCENE_GRADE_LUT_STRENGTH);
  } else {
    working_color = ColorGradingLUTs(working_color);
  }

  // tint (luminance preserving)
  if (_24_m0[23u].w > 0.1f) {
    float3 channel_scaled_color = working_color * _24_m0[23u].rgb;

    float original_luminance = renodx::color::y::from::BT709(working_color);
    float scaled_luminance = renodx::color::y::from::BT709(channel_scaled_color);

    if (scaled_luminance != 0.f) {
      channel_scaled_color *= original_luminance / scaled_luminance;
    }

    working_color = channel_scaled_color;
  }

  if (RENODX_TONE_MAP_TYPE == 0.f) {
    working_color = lerp(renodx::color::y::from::BT709(working_color), working_color, _24_m0[22u].w);
  }

  if (RENODX_TONE_MAP_TYPE == 1.f) {
    float tone_map_exposure = RENODX_TONE_MAP_EXPOSURE;
    float tone_map_highlights = RENODX_TONE_MAP_HIGHLIGHTS;
    float tone_map_shadows = RENODX_TONE_MAP_SHADOWS;
    float tone_map_contrast = RENODX_TONE_MAP_CONTRAST;
    float tone_map_saturation = RENODX_TONE_MAP_SATURATION;
    float tone_map_highlight_saturation = RENODX_TONE_MAP_HIGHLIGHT_SATURATION;
    float tone_map_highlight_contrast = RENODX_TONE_MAP_HIGHLIGHT_CONTRAST;
    float tone_map_shadow_contrast = RENODX_TONE_MAP_SHADOW_CONTRAST;
    float tone_map_blowout = RENODX_TONE_MAP_BLOWOUT;
    float tone_map_flare = RENODX_TONE_MAP_FLARE;
    float grade_anchor_in = RENODX_TONE_MAP_MID_GRAY_IN;
    float grade_anchor_out = RENODX_TONE_MAP_MID_GRAY_OUT;

    if (CUSTOM_TONE_MAP_CURVE == 0) {
      // Recommended: retain the neutral slider values, with the requested
      // Forza-specific contrast and flare adjustments.
      tone_map_contrast = 1.2f * RENODX_TONE_MAP_CONTRAST;
      tone_map_highlight_contrast = 1.1f;
      tone_map_flare = 0.002f + RENODX_TONE_MAP_FLARE;
      grade_anchor_in = 0.18f;
      grade_anchor_out = 0.15f;
    }
#if 0
    else if (CUSTOM_TONE_MAP_CURVE == 1) {
      // Vanilla+: preserve the vanilla LUT pivot and local slope.
      grade_anchor_in = vanilla_curve_parameters.x;
      grade_anchor_out = vanilla_curve_parameters.y;
      tone_map_contrast = vanilla_curve_parameters.z * RENODX_TONE_MAP_CONTRAST;
    }
#endif

    const float hdr_peak = max(
        RENODX_PEAK_WHITE_NITS / RENODX_DIFFUSE_WHITE_NITS,
        0.0002f);
    const float hdr_anchor_out = min(grade_anchor_out, hdr_peak - 0.0001f);
    const float sdr_anchor_out = min(grade_anchor_out, 0.9999f);

    const float3x3 prism_inset_matrix = renodx::tonemap::prism::MatrixFromRows(
      float4(shader_injection.prism_inset_00, shader_injection.prism_inset_01, shader_injection.prism_inset_02, 0.f),
      float4(shader_injection.prism_inset_10, shader_injection.prism_inset_11, shader_injection.prism_inset_12, 0.f),
      float4(shader_injection.prism_inset_20, shader_injection.prism_inset_21, shader_injection.prism_inset_22, 0.f));
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

    const float3 prism_input = working_color * tone_map_exposure;
    const renodx::tonemap::prism::Config prism_hdr_config =
      renodx::tonemap::prism::config::CreateResolved(
        hdr_peak.xxx,
        RENODX_DIFFUSE_WHITE_NITS,
        grade_anchor_in.xxx,
        hdr_anchor_out.xxx,
        prism_inset_matrix,
        prism_outset_matrix,
        prism_yf_weights,
        prism_yf_neutral_axis,
        prism_yf_neutral_axis_yf_rcp,
        prism_working_to_lms_matrix,
        prism_lms_to_working_matrix,
        1.5f,
        renodx::tonemap::prism::CONTRAST_FUNCTION_ANCHORED,
        tone_map_highlights,
        tone_map_shadows,
        tone_map_contrast,
        tone_map_saturation,
        tone_map_highlight_saturation,
        tone_map_blowout,
        tone_map_flare,
        tone_map_highlight_contrast,
        tone_map_shadow_contrast,
        renodx::tonemap::prism::CHROMA_SPACE_PRISM,
        renodx::tonemap::prism::CHROMA_SPACE_PRISM,
        renodx::tonemap::prism::CHROMA_SPACE_PRISM);

    const renodx::tonemap::prism::Config prism_sdr_config =
      renodx::tonemap::prism::config::CreateResolved(
        1.f.xxx,
        RENODX_DIFFUSE_WHITE_NITS,
        grade_anchor_in.xxx,
        sdr_anchor_out.xxx,
        prism_inset_matrix,
        prism_outset_matrix,
        prism_yf_weights,
        prism_yf_neutral_axis,
        prism_yf_neutral_axis_yf_rcp,
        prism_working_to_lms_matrix,
        prism_lms_to_working_matrix,
        1.5f,
        renodx::tonemap::prism::CONTRAST_FUNCTION_ANCHORED,
        tone_map_highlights,
        tone_map_shadows,
        tone_map_contrast,
        tone_map_saturation,
        tone_map_highlight_saturation,
        tone_map_blowout,
        tone_map_flare,
        tone_map_highlight_contrast,
        tone_map_shadow_contrast,
        renodx::tonemap::prism::CHROMA_SPACE_PRISM,
        renodx::tonemap::prism::CHROMA_SPACE_PRISM,
        renodx::tonemap::prism::CHROMA_SPACE_PRISM);

    float3 working_color_hdr =
        renodx::tonemap::prism::BT709(prism_input, prism_hdr_config);
    float3 working_color_sdr =
        renodx::tonemap::prism::BT709(prism_input, prism_sdr_config);

    working_color_hdr = renodx::color::bt709::from::BT2020(
        renodx::color::gamut::GamutCompressBT2020(
            renodx::color::bt2020::from::BT709(working_color_hdr)
      )
    );
    working_color_sdr = renodx::color::gamut::GamutCompressBT709(working_color_sdr);

    SDR_Output[gl_GlobalInvocationID] = float4(working_color_sdr, 0.0f);
    HDR_Output[gl_GlobalInvocationID] = float4(working_color_hdr, 0.0f);

  } else {
    // SDR/HDR tonemap LUTs
    float3 tonemap_lut_input_color = working_color;
    float3 hdr_display_map_input_color = tonemap_lut_input_color;

    float tonemap_lut_strength = _24_m0[20u].w;
    if (tonemap_lut_strength > 0.0f) {
      float tonemap_lut_size = _24_m0[20u].y;
      float tonemap_lut_texel_bias = 0.5f / tonemap_lut_size;
      float tonemap_lut_texel_scale = 1.0f - (2.0f * tonemap_lut_texel_bias);

      float3 tonemap_lut_uv = renodx::color::pq::EncodeSafe(tonemap_lut_input_color, _24_m0[20u].z);
      tonemap_lut_uv = (tonemap_lut_uv * tonemap_lut_texel_scale) + tonemap_lut_texel_bias;

      float3 sdr_tonemap_lut_color = SDR_LUT.SampleLevel(LUT_Sampler, tonemap_lut_uv, 0.0f).rgb;
      float3 hdr_tonemap_lut_color = HDR_LUT.SampleLevel(LUT_Sampler, tonemap_lut_uv, 0.0f).rgb * _24_m0[21u].x;

      // SDR output
      SDR_Output[gl_GlobalInvocationID] = float4(lerp(tonemap_lut_input_color, sdr_tonemap_lut_color, tonemap_lut_strength), 0.0f);

      hdr_display_map_input_color = lerp(tonemap_lut_input_color, hdr_tonemap_lut_color, tonemap_lut_strength);
    } else {
      SDR_Output[gl_GlobalInvocationID] = float4(tonemap_lut_input_color, 0.0f);
    }
    working_color = hdr_display_map_input_color;

    // display map
    float display_peak_scale = _24_m0[21u].z;
    float toe_offset = _24_m0[24u].x;
    float toe_strength = _24_m0[24u].y;
    float shoulder_start = _24_m0[22u].x;
    float shoulder_end = _24_m0[21u].w;
    float shoulder_power = _24_m0[22u].z;
    float shoulder_scale_log = _24_m0[22u].y;

    working_color = ForzaToneMap(
        working_color,
        display_peak_scale,
        toe_offset,
        toe_strength,
        shoulder_start,
        shoulder_end,
        shoulder_power,
        shoulder_scale_log);

    HDR_Output[gl_GlobalInvocationID] = float4(working_color, 0.0f);
  }
}

[numthreads(8, 8, 8)]
void main(SPIRV_Cross_Input stage_input) {
  gl_GlobalInvocationID = stage_input.gl_GlobalInvocationID;
#if 0
  InitializeVanillaCurveParameters(stage_input.gl_LocalInvocationIndex);
#endif
  comp_main();
}
