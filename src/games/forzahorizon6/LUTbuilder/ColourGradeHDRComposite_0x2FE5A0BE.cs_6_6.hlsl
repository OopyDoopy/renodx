#include "./LUTbuilder.hlsli"
#include "../common.hlsl"

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
};

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
    float3 mid_gray = renodx::math::Min(ColorGradingLUTs(0.0f));
    float3 lut_black = renodx::math::Min(ColorGradingLUTs(0.0f));
    float3 lut_mid = renodx::math::Min(ColorGradingLUTs(mid_gray));

    if (renodx::math::Min(lut_black) > black_floor) {
      float3 unscaled_lut = lut_corrected;

      float3 lut_corrected_lms = renodx::color::lms::from::BT709(lut_corrected) / LMS_WHITE_BT709;
      float3 reference_lms = renodx::color::lms::from::BT709(input_color) / LMS_WHITE_BT709;
      float3 lut_black_lms = renodx::color::lms::from::BT709(lut_black) / LMS_WHITE_BT709;
      float3 lut_mid_lms = renodx::color::lms::from::BT709(lut_mid) / LMS_WHITE_BT709;

      lut_corrected_lms = renodx::color::srgb::EncodeSafe(lut_corrected_lms);
      reference_lms = renodx::color::srgb::EncodeSafe(reference_lms);
      lut_black = renodx::color::srgb::EncodeSafe(lut_black_lms);
      lut_mid = renodx::color::srgb::EncodeSafe(lut_mid_lms);

      float3 shadow_length = lut_mid_lms;
      float3 shadow_stop = reference_lms;
      float3 shadow_t = max(0.0f, shadow_length - shadow_stop) / shadow_length;
      float3 floor_remove = lut_black_lms * shadow_t;
      float3 unclamped_lms = max(0.0f, lut_corrected_lms - floor_remove);

      float3 unclamped_linear = renodx::color::srgb::DecodeSafe(unclamped_lms);
      float3 unclamped_linear_bt709 = renodx::color::bt709::from::LMS(unclamped_linear * LMS_WHITE_BT709);

      lut_corrected = renodx::lut::RecolorUnclamped(lut_corrected, unclamped_linear_bt709, 1.f);
      lut_corrected = lerp(unscaled_lut, unclamped_linear_bt709, saturate(lut_scaling));
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
  // SDR Tonemap LUT
  // working_color = ApplySDRTonemapLUT(working_color, SDR_LUT, LUT_Sampler, _24_m0[20u].w, _24_m0[20u].y, _24_m0[20u].z);

  lutbuilder::TonemapLUTInflection sdr_lut_curve = lutbuilder::FindTonemapLUTInflection(
      SDR_LUT,
      LUT_Sampler,
      0.18f,
      _24_m0[20u].y,
      _24_m0[20u].z,
      0.1f, 100u);
  //working_color = ApplyAnchoredPowContrast(working_color, sdr_lut_curve.midgray_in, sdr_lut_curve.midgray_out, sdr_lut_curve.output_slope);
  float y_in = renodx::color::yf::from::BT709(working_color);
  float y_out = ApplyAnchoredPowContrast(y_in, sdr_lut_curve.midgray_in, sdr_lut_curve.midgray_out, sdr_lut_curve.output_slope).x;
  float3 working_color_luminance = renodx::color::correct::Luminance(working_color, y_in, y_out);

  float3 working_color_lms_shifted = renodx::color::lms::from::BT709(working_color) / LMS_WHITE_BT709;
  working_color_lms_shifted = ApplyAnchoredPowContrast(working_color_lms_shifted, sdr_lut_curve.midgray_in, sdr_lut_curve.midgray_out, sdr_lut_curve.output_slope);
  working_color_lms_shifted = renodx::color::bt709::from::LMS(working_color_lms_shifted * LMS_WHITE_BT709);

  working_color = renodx::color::correct::Chrominance(working_color_luminance, working_color_lms_shifted, 1.f, 0.f, 0);

  //working_color = working_color_lms_shifted;

  renodx::draw::Config config = renodx::draw::BuildConfig();
  //config.tone_map_saturation = _24_m0[22u].w;
  working_color = renodx::tonemap::psycho::ApplyGrading(working_color, 1.f, 0.18, 0.18, 0, config);

  // float display_peak_scale = renodx::color::correct::GammaSafe(_24_m0[21u].z, true);
  float3 display_peak_scale = RENODX_PEAK_WHITE_NITS / RENODX_DIFFUSE_WHITE_NITS;
  if (RENODX_GAMMA_CORRECTION != 0.f) {
    display_peak_scale = GammaCorrectionLMS(display_peak_scale, true);
  }
  float display_peak_scale_sdr = 1.f;

  //HDR
  float3 hue_and_purity_reference_hdr = renodx::tonemap::ReinhardPiecewise(renodx::color::lms::from::BT709(working_color) / LMS_WHITE_BT709, display_peak_scale, sdr_lut_curve.midgray_out) * LMS_WHITE_BT709;
  hue_and_purity_reference_hdr = renodx::color::bt709::from::LMS(hue_and_purity_reference_hdr);

  float3 working_color_hdr = renodx::color::correct::Luminance(hue_and_purity_reference_hdr, working_color);

  working_color_hdr = renodx::color::bt2020::from::BT709(working_color_hdr);
  working_color_hdr = renodx::tonemap::neutwo::MaxChannel(working_color_hdr, renodx::math::Max(display_peak_scale));
  working_color_hdr = renodx::color::bt709::from::BT2020(working_color_hdr);

  if (RENODX_GAMMA_CORRECTION != 0.f) {
    working_color_hdr = GammaCorrectionLMS(working_color_hdr);
  }

  //SDR 
  float3 hue_and_purity_reference_sdr = renodx::tonemap::ReinhardPiecewise(renodx::color::lms::from::BT709(working_color) / LMS_WHITE_BT709, display_peak_scale_sdr, sdr_lut_curve.midgray_out) * LMS_WHITE_BT709;
  hue_and_purity_reference_sdr = renodx::color::bt709::from::LMS(hue_and_purity_reference_sdr);

  float3 working_color_sdr = renodx::color::correct::Luminance(hue_and_purity_reference_sdr, working_color);

  working_color_sdr = renodx::tonemap::neutwo::MaxChannel(working_color_sdr, display_peak_scale_sdr);

  SDR_Output[gl_GlobalInvocationID] = float4(working_color_sdr, 0.0f);
  HDR_Output[gl_GlobalInvocationID] = float4(working_color_hdr, 0.0f);
  } else if (RENODX_TONE_MAP_TYPE == 2.f) {

  const float tone_map_exposure = RENODX_TONE_MAP_EXPOSURE;
  const float tone_map_highlights = 1.1f * RENODX_TONE_MAP_HIGHLIGHTS;
  const float tone_map_shadows = 0.70f * RENODX_TONE_MAP_SHADOWS;
  const float tone_map_contrast = RENODX_TONE_MAP_CONTRAST;
  const float tone_map_adaptation_contrast = 1.f;
  const float tone_map_saturation = RENODX_TONE_MAP_SATURATION;
  const float tone_map_blowout = RENODX_TONE_MAP_BLOWOUT;
  const float tone_map_flare = RENODX_TONE_MAP_FLARE;
  const float tone_map_cone_response = 1.0f;
  const int grading_mode = 0;      // 0 = lms, 1 = Yf
  const int white_curve_mode = 0;  // 0 = n2, 1 = naka rushton
  const float mid_gray_in = 0.18f;
  const float mid_gray_out = 0.18f;

  float3 display_peak_scale = RENODX_PEAK_WHITE_NITS / RENODX_DIFFUSE_WHITE_NITS;
  if (RENODX_GAMMA_CORRECTION != 0.f) {
    display_peak_scale = GammaCorrectionLMS(display_peak_scale, true);
  }

  float3 working_color_hdr = renodx::tonemap::psycho::psychotm_test17_customized(
      working_color,
      display_peak_scale,
      tone_map_exposure,
      tone_map_highlights,
      tone_map_shadows,
      tone_map_contrast,
      tone_map_saturation,
      tone_map_blowout,
      tone_map_flare,
      100.f,
      1.f,
      tone_map_adaptation_contrast,
      grading_mode,
      white_curve_mode,
      tone_map_cone_response,
      mid_gray_in,
      mid_gray_out);

  if (RENODX_GAMMA_CORRECTION != 0.f) {
    working_color_hdr = GammaCorrectionLMS(working_color_hdr);
  }

  float3 working_color_sdr = renodx::tonemap::psycho::psychotm_test17_customized(
      working_color,
      1.f,
      tone_map_exposure,
      tone_map_highlights,
      tone_map_shadows,
      tone_map_contrast,
      tone_map_saturation,
      tone_map_blowout,
      tone_map_flare,
      100.f,
      1.f,
      tone_map_adaptation_contrast,
      grading_mode,
      white_curve_mode,
      tone_map_cone_response,
      mid_gray_in,
      mid_gray_out,
      1.f,
      0);
  
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
  comp_main();
}
