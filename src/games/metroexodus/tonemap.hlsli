#include "./shared.h"
#include "./psycho_test17_custom.hlsl"
#include "./common.hlsl"

#ifdef USE_LOW
Texture2D<min16float4> t0 : register(t0);

Texture2D<min16float4> t1 : register(t1);

Texture3D<min16float4> t2 : register(t2);

Texture2D<float4> t3 : register(t3);

Texture2D<min16float4> t4 : register(t4);

Texture2D<float4> t5 : register(t5);

Texture2D<float4> t6 : register(t6);
#else

Texture2D<float2> t0 : register(t0);

Texture2D<min16float4> t1 : register(t1);

Texture2D<min16float4> t2 : register(t2);

Texture3D<min16float4> t3 : register(t3);

Texture2D<float4> t4 : register(t4);

Texture2D<float> t5 : register(t5);

Texture2D<min16float4> t6 : register(t6);

Texture2D<float4> t7 : register(t7);

Texture2D<float4> t8 : register(t8);
#endif

cbuffer cb1 : register(b1) {
  float4 cb_instance_000 : packoffset(c000.x);
  float4 cb_instance_016 : packoffset(c001.x);
};

cbuffer cb8 : register(b8) {
  float4 cb_misc_000 : packoffset(c000.x);
  float4 cb_misc_016 : packoffset(c001.x);
  float4 cb_misc_032 : packoffset(c002.x);
  float4 cb_misc_048 : packoffset(c003.x);
  float4 cb_misc_064 : packoffset(c004.x);
  float4 cb_misc_080 : packoffset(c005.x);
  row_major float4x4 cb_misc_096 : packoffset(c006.x);
  float4 cb_misc_160 : packoffset(c010.x);
  float4 cb_misc_176 : packoffset(c011.x);
  float4 cb_misc_192 : packoffset(c012.x);
  float4 cb_misc_208 : packoffset(c013.x);
  float4 cb_misc_224 : packoffset(c014.x);
  float4 cb_misc_240 : packoffset(c015.x);
  float4 cb_misc_256 : packoffset(c016.x);
  float4 cb_misc_272 : packoffset(c017.x);
  float4 cb_misc_288 : packoffset(c018.x);
  float4 cb_misc_304 : packoffset(c019.x);
  float4 cb_misc_320 : packoffset(c020.x);
  float4 cb_misc_336 : packoffset(c021.x);
  float4 cb_misc_352 : packoffset(c022.x);
  float4 cb_misc_368 : packoffset(c023.x);
  float4 cb_misc_384 : packoffset(c024.x);
  float4 cb_misc_400 : packoffset(c025.x);
  float4 cb_misc_416 : packoffset(c026.x);
  float4 cb_misc_432 : packoffset(c027.x);
  row_major float4x4 cb_misc_448 : packoffset(c028.x);
  int4 cb_misc_512 : packoffset(c032.x);
  float4 cb_misc_528 : packoffset(c033.x);
  float4 cb_misc_544 : packoffset(c034.x);
  float4 cb_misc_560 : packoffset(c035.x);
  float4 cb_misc_576 : packoffset(c036.x);
  float4 cb_misc_592 : packoffset(c037.x);
  row_major float3x4 cb_misc_608 : packoffset(c038.x);
  row_major float3x4 cb_misc_656 : packoffset(c041.x);
  float4 cb_misc_704 : packoffset(c044.x);
  float4 cb_misc_720 : packoffset(c045.x);
  float4 cb_misc_736 : packoffset(c046.x);
  float4 cb_misc_752 : packoffset(c047.x);
  float4 cb_misc_768 : packoffset(c048.x);
  float4 cb_misc_784[4] : packoffset(c049.x);
};

SamplerState s5 : register(s5);

SamplerState s6 : register(s6);

#define APPLY_METRO_SDR_TOE_ADJUSTED(T)                                                                                                              \
  T MetroSDRToeAdjusted(T x) {                                                                                                                       \
    T num = (((8.468000411987305f * x + 1.0f) * x - 0.002956999931484461f) * x + 0.00010040000051958486f) * x;                                       \
    T den = (((8.360400199890137f * x + 1.822700023651123f) * x + 0.21889999508857727f) * x - 0.0021170000545680523f) * x + 0.00003673000173876062f; \
    return saturate(num / den);                                                                                                                      \
  }

APPLY_METRO_SDR_TOE_ADJUSTED(float)
APPLY_METRO_SDR_TOE_ADJUSTED(float3)

#undef APPLY_METRO_SDR_TOE_ADJUSTED

#define APPLY_METRO_SDR_TOE_ADJUSTED_LINEAR(T)                      \
  T MetroSDRToeAdjustedLinear(T x) {                                \
    return renodx::color::srgb::DecodeSafe(MetroSDRToeAdjusted(x)); \
  }

APPLY_METRO_SDR_TOE_ADJUSTED_LINEAR(float)
APPLY_METRO_SDR_TOE_ADJUSTED_LINEAR(float3)

#undef APPLY_METRO_SDR_TOE_ADJUSTED_LINEAR

#define APPLY_METRO_SDR_TOE_ADJUSTED_LINEAR_EXTENDED(T) \
  T MetroSDRToeAdjustedLinearExtended(T x) {            \
    static const float x0 = 0.1225084847f;              \
    static const float y0 = 0.1687209879f;              \
    static const float m = 1.879975882f;                \
    T y_curve = MetroSDRToeAdjustedLinear(x);           \
    T y_line = mad(x - x0, m, y0);                      \
    return lerp(y_curve, y_line, step(x0, x));          \
  }

APPLY_METRO_SDR_TOE_ADJUSTED_LINEAR_EXTENDED(float)
APPLY_METRO_SDR_TOE_ADJUSTED_LINEAR_EXTENDED(float3)

#undef APPLY_METRO_SDR_TOE_ADJUSTED_LINEAR_EXTENDED

float3 VanillaHDRTonemap(float3 untonemapped) {
  // Extra exposure
  float3 untonemapped_scaled = untonemapped * 1.4142135381698608f;

  // Custom curve, no peak target, different from SDR which is also custom
  float3 tonemapped_bt709 = (((((((((untonemapped * 3830.7001953125f) + 6801.15234375f) * untonemapped_scaled) + 1079.54736328125f) * untonemapped_scaled) + 1.1614649295806885f) * untonemapped_scaled) + -4.139374868827872e-05f) / ((((((((untonemapped * 1390.7225341796875f) + 4132.06640625f) * untonemapped_scaled) + 2881.652099609375f) * untonemapped_scaled) + 128.35911560058594f) * untonemapped_scaled) + 1.0f));
  return tonemapped_bt709;
}

float ComputeReinhardSmoothClampScale(float3 untonemapped, float rolloff_start = 0.375f, float output_max = 1.f, float white_clip = 100.f) {
  float peak = renodx::math::Max(untonemapped);
  float mapped_peak = renodx::tonemap::ReinhardPiecewiseExtended(peak, white_clip, output_max, rolloff_start);
  float scale = renodx::math::DivideSafe(mapped_peak, peak, 1.f);

  return scale;
}

float ComputeNeutwoSmoothClampScale(float3 untonemapped, float output_max = 1.f, float white_clip = 100.f) {
  float peak = renodx::math::Max(untonemapped);
  float mapped_peak = renodx::tonemap::Neutwo(peak, output_max, white_clip);
  float scale = renodx::math::DivideSafe(mapped_peak, peak, 1.f);

  return scale;
}

float3 VanillaLUTSample(float3 color) {
  #ifdef USE_LOW
  float4 lut_sampled = t2.Sample(s6, color.zyx);
  #else
  float4 lut_sampled = t3.Sample(s6, color.zyx);
  #endif
  float3 lut_corrected = (color + -1.0f) + (lut_sampled.zyx * 2.0f);
  return lut_corrected;
}

float3 ImprovedLUTSample(float3 color, float mid_gray) {
#ifdef USE_LOW
  Texture3D<min16float4> lut_texture = t2;
#else
  Texture3D<min16float4> lut_texture = t3;
#endif
  float4 lut_sampled = lut_texture.Sample(s6, color.zyx);
  float3 lut_corrected = (color + -1.0f) + (lut_sampled.zyx * 2.0f);

  if (CUSTOM_LUT_SCALING != 0.f) {

    float lutBlackGamma = renodx::color::srgb::Encode(0.f);
    float3 lutBlack = VanillaLUTSample(lutBlackGamma);

    float lutMidGamma = renodx::color::srgb::Encode(mid_gray);
    float3 lutMid = VanillaLUTSample(lutMidGamma);

    float3 lutWhite = 1.f;

    float3 unclamped_gamma = renodx::lut::Unclamp(
        lut_corrected,
        lutBlack,
        lutMid,
        lutWhite,
        color.xyz);
    float3 unclamped_linear = renodx::color::srgb::DecodeSafe(unclamped_gamma);
    float3 recolored = renodx::lut::RecolorUnclamped(renodx::color::srgb::DecodeSafe(lut_corrected), unclamped_linear, CUSTOM_LUT_SCALING);
    lut_corrected = renodx::color::srgb::EncodeSafe(recolored);
  }

  return lut_corrected;
}

float3 ApplyGasMask(float3 tonemapped_srgb, float2 uv) {
  #ifndef USE_LOW
  float4 _905 = t7.Sample(s5, uv);
  float4 _910 = t8.Sample(s5, uv);
  #else
  float4 _905 = t5.Sample(s5, uv);
  float4 _910 = t6.Sample(s5, uv);
  #endif
  float _922 = saturate(cb_instance_016.x * 40.0f);
  float _923 = _922 * _905.w;
  float _927 = saturate((cb_instance_016.y * _910.w) * _922);
  float _934 = (_910.x * 0.14000000059604645f) + -0.5699999928474426f;
  float _935 = (_910.y * 0.14000000059604645f) + -0.5699999928474426f;
  float _937 = rsqrt(dot(float3(_934, _935, 1.0f), float3(_934, _935, 1.0f)));
  float _949 = (dot(float3((-0.0f - cb_misc_272.x), (-0.0f - cb_misc_272.y), (-0.0f - cb_misc_272.z)), float3((_937 * _934), (_937 * _935), _937)) * 0.5f) + 1.0f;
  float _957 = saturate(cb_misc_288.x);
  float _976 = (saturate((_923 * 2.0f) + (_927 * (_910.w - _923))) * _923) * (min(_957, (dot(float3(_957, saturate(cb_misc_288.y), saturate(cb_misc_288.z)), float3(0.5f, 0.5f, 0.5f)) * 0.30000001192092896f)) + 0.10000000149011612f);
  float _981 = ((_905.w * _905.w) * _923) * _976;
  float _983 = 1.0f - (_923 * _923);
  float _990 = _976 * ((saturate(max((_949 * _949), 0.25f)) * 0.4999999701976776f) + 0.4000000059604645f);
  float _994 = (_990 * ((((((_910.z * 0.14000000059604645f) + -0.07000000029802322f) * _910.w) * _927) + (_923 * _905.x)) + _981)) + (_983 * tonemapped_srgb.x);
  float _995 = (_990 * ((((((_910.w * 0.14000000059604645f) + -0.07000000029802322f) * _910.w) * _927) + (_923 * _905.y)) + _981)) + (_983 * tonemapped_srgb.y);
  float _996 = (_990 * ((((_910.z * _910.w) * _927) + (_923 * _905.z)) + _981)) + (_983 * tonemapped_srgb.z);
  return float3(_994, _995, _996);
}

float4 RenoDX(float3 untonemapped, float2 uv, float ui_blend1, float ui_blend2 = 1.f) {
  float3 untonemapped_linear = untonemapped;

  const float3 lms_white = renodx::color::lms::from::BT709(1.f);

  const float mid_gray = 0.1225084847f;
  const float mid_gray_adjusted = MetroSDRToeAdjustedLinearExtended(mid_gray);
  const float mid_gray_scale = mid_gray_adjusted / mid_gray;

  float calculated_peak = RENODX_PEAK_WHITE_NITS / RENODX_DIFFUSE_WHITE_NITS;
  if (RENODX_GAMMA_CORRECTION != 0) {
    calculated_peak = renodx::math::Select(RENODX_GAMMA_CORRECTION == 1, renodx::color::correct::Gamma(calculated_peak, true), GammaCorrectionByLuminosity(calculated_peak, true).x);
  }

  float3 tonemapped_linear = untonemapped_linear;
  if (RENODX_TONE_MAP_TYPE == 1) {
    tonemapped_linear = MetroSDRToeAdjustedLinearExtended(untonemapped_linear);
  } else {
    
    float3 untonemapped_linear_adjusted = untonemapped_linear * mid_gray_scale;
    float3 untonemapped_linear_adjusted_lms = renodx::color::lms::from::BT709(untonemapped_linear_adjusted);
    float3 untonemapped_linear_contrasted_lms = renodx::tonemap::NakaRushton(untonemapped_linear_adjusted_lms / lms_white, 100.f / lms_white, mid_gray_adjusted, mid_gray_adjusted, 1.48f) * lms_white;
    float3 untonemapped_linear_contrasted = renodx::color::bt709::from::LMS(untonemapped_linear_contrasted_lms);

    tonemapped_linear = untonemapped_linear_contrasted;
  }

#ifdef USE_GASMASK
  float3 tonemapped_srgb = renodx::color::srgb::EncodeSafe(tonemapped_linear);
  float3 gas_mask_applied = ApplyGasMask(tonemapped_srgb, uv);
  tonemapped_linear = renodx::color::srgb::DecodeSafe(gas_mask_applied);
#endif

  float scale = ComputeReinhardSmoothClampScale(tonemapped_linear, mid_gray_adjusted, 1.f);
  tonemapped_linear *= scale;

  float mid_gray_lut_adjusted = renodx::color::srgb::Decode(ImprovedLUTSample(renodx::color::srgb::Encode(mid_gray_adjusted), mid_gray_adjusted).x);

  float3 lut_input = renodx::color::srgb::EncodeSafe(tonemapped_linear);
  float3 lut_output = ImprovedLUTSample(lut_input, mid_gray_lut_adjusted);
  lut_output = renodx::color::srgb::DecodeSafe(lut_output);
  lut_output = renodx::math::SafeDivision(lut_output, scale, 1.f);
  //lut_output = lerp(tonemapped_linear, lut_output, CUSTOM_COLOR_GRADE);

  float3 display_mapped_bt709 = lut_output;
  if (RENODX_TONE_MAP_TYPE == 1) {
    lut_output = renodx::tonemap::psycho::ApplyGradingLMS(lut_output, calculated_peak, mid_gray_lut_adjusted, mid_gray_lut_adjusted);
    float3 unmapped_bt2020 = renodx::color::bt2020::from::BT709(lut_output);
    float3 mapped_bt2020 = renodx::tonemap::neutwo::PerChannel(unmapped_bt2020, calculated_peak);
    display_mapped_bt709 = renodx::color::bt709::from::BT2020(mapped_bt2020);
  } 
  else if (RENODX_TONE_MAP_TYPE == 2) {
    display_mapped_bt709 = renodx::tonemap::psycho::psychotm_test17_customized(
        lut_output,
        calculated_peak,
        RENODX_TONE_MAP_EXPOSURE,
        RENODX_TONE_MAP_HIGHLIGHTS,
        RENODX_TONE_MAP_SHADOWS,
        RENODX_TONE_MAP_CONTRAST,
        RENODX_TONE_MAP_SATURATION,
        RENODX_TONE_MAP_BLOWOUT,
        100.f,
        0.1f,
        1.f,
        1,
        RENODX_TONE_MAP_CONE_RESPONSE,
        mid_gray_lut_adjusted,
        mid_gray_lut_adjusted
          );
  }

  display_mapped_bt709 = CustomPostProcessing(display_mapped_bt709, uv);

  if (RENODX_GAMMA_CORRECTION != 0) {
    display_mapped_bt709 = renodx::math::Select(RENODX_GAMMA_CORRECTION == 1, renodx::color::correct::GammaSafe(display_mapped_bt709), GammaCorrectionByLuminosity(display_mapped_bt709));
  }

  display_mapped_bt709 *= (RENODX_DIFFUSE_WHITE_NITS / RENODX_GRAPHICS_WHITE_NITS);

#ifdef USE_LOW
  float4 ui_color_gamma = t0.SampleLevel(s6, uv, 0.0f);
  #else
  float4 ui_color_gamma = t1.SampleLevel(s6, uv, 0.0f);
  #endif
  if (RENODX_GAMMA_CORRECTION_UI == 1) {
    float3 ui_color_linear = renodx::color::srgb::DecodeSafe(ui_color_gamma.xyz);
    ui_color_linear.xyz = renodx::color::correct::GammaSafe(ui_color_linear);
    ui_color_gamma.xyz = renodx::color::srgb::EncodeSafe(ui_color_linear);
  }

  // apply Neutwo under UI
  // float y_in = renodx::color::y::from::BT709(display_mapped_bt709);
  // const float peak = 1.f;  // UI white
  // float y_tonemapped = lerp(y_in, renodx::tonemap::Neutwo(y_in, peak), saturate(y_in));

  // float y_out = lerp(y_in, y_tonemapped, ui_color_gamma.a);

  // display_mapped_bt709 = renodx::color::correct::Luminance(display_mapped_bt709, y_in, y_out);
  
  float3 scene_color_linear = max(0, renodx::color::bt2020::from::BT709(display_mapped_bt709));
  ui_color_gamma.xyz = renodx::color::bt2020::from::BT709(ui_color_gamma.xyz);

  float3 scene_color_gamma = renodx::color::srgb::EncodeSafe(scene_color_linear);

  // UI sampling and blending
  float _937;
  #ifdef USE_LOW 
    _937 = ((((ui_blend1 + 0.5f) + cb_misc_704.x) * 0.008331298828125f) + 0.008331298828125f) * (frac(sin(dot(float2((cb_misc_576.w + uv.x), (cb_misc_576.w + uv.y)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.546875f) + -0.5f);
  #else
    _937 = (((((((ui_blend1 * 2.0f) + ui_blend2) * 0.5f) + 0.5f) + cb_misc_704.x) * 0.008331298828125f) + 0.008331298828125f) * (frac(sin(dot(float2((cb_misc_576.w + uv.x), (cb_misc_576.w + uv.y)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.546875f) + -0.5f);
  #endif
    scene_color_gamma = _937 + renodx::math::SqrtSafe(((cb_misc_272.w * (2.700000047683716f - scene_color_gamma)) + scene_color_gamma));
    //scene_color_gamma = _937 + renodx::color::srgb::EncodeSafe(scene_color_gamma);

  float3 composited_color_gamma = max(renodx::color::bt2020::from::BT709(6.103519990574569e-05f).x, (((scene_color_gamma * scene_color_gamma) * ui_color_gamma.a) + ui_color_gamma.xyz));

  float3 composited_color_linear = renodx::color::srgb::DecodeSafe(composited_color_gamma);

  composited_color_linear *= RENODX_GRAPHICS_WHITE_NITS;

  if (CUSTOM_CLAMP_TYPE == 0) {
    composited_color_linear = min(composited_color_linear, RENODX_PEAK_WHITE_NITS);
  } else {
    float max_channel = max(max(max(composited_color_linear.r, composited_color_linear.g), composited_color_linear.b), RENODX_PEAK_WHITE_NITS);
    composited_color_linear *= renodx::math::DivideSafe(RENODX_PEAK_WHITE_NITS, max_channel, 1.f);  // Clamp UI or Videos
  }

  float3 pq_color = renodx::color::pq::EncodeSafe(composited_color_linear, 1.f);
  // float3 pq_color = renodx::color::pq::EncodeSafe(renodx::color::bt2020::from::BT709(lut_output), 100.f);
  float4 output_color = float4(pq_color, 1.f);
  return output_color;
}