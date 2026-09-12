#ifndef SRC_NOMANSSKY_SHARED_H_
#define SRC_NOMANSSKY_SHARED_H_

/*
  No Man's Sky uses Vulkan push constants for shader injection. Keep the
  original game push-constant offset selectable because different pipelines
  can reserve different amounts of space before RenoDX data.
*/
#ifdef USE_SETTINGS_PUSHCONSTANTS
#define PUSH_CONSTANTS_OFFSET 16
#endif

#ifdef USE_AUX_PUSHCONSTANTS
#define PUSH_CONSTANTS_OFFSET 128
#endif

#ifndef PUSH_CONSTANTS_OFFSET
#define PUSH_CONSTANTS_OFFSET 0
#endif

// Must be 32-bit aligned. The C++ and shader definitions must remain identical.
struct ShaderInjectData {
  float peak_white_nits;
  float diffuse_white_nits;
  float graphics_white_nits;
  float tone_map_type;

  float tone_map_curve;
  float tone_map_exposure;
  float tone_map_highlights;
  float tone_map_shadows;

  float tone_map_contrast;
  float tone_map_saturation;
  float tone_map_highlight_saturation;
  float tone_map_blowout;

  float tone_map_flare;
  float tone_map_mid_gray_in;
  float tone_map_mid_gray_out;
  float custom_film_grain;

  float custom_random;

  float last_is_hdr;
  float prism_inset_00;
  float prism_inset_01;
  float prism_inset_02;

  float prism_inset_10;
  float prism_inset_11;
  float prism_inset_12;
  float prism_inset_20;

  float prism_inset_21;
  float prism_inset_22;
  float scene_grade_lut_strength;
  float scene_grade_lut_scaling;
  float scene_grade_lut_scaling_target;
  float sdr_encoding;
  float padding0;
  float padding1;
  float padding2;
};

#define RENODX_PEAK_WHITE_NITS                       shader_injection.peak_white_nits
#define RENODX_DIFFUSE_WHITE_NITS                    shader_injection.diffuse_white_nits
#define RENODX_GRAPHICS_WHITE_NITS                   shader_injection.graphics_white_nits
#define RENODX_TONE_MAP_TYPE                         shader_injection.tone_map_type
#define RENODX_TONE_MAP_CURVE                        shader_injection.tone_map_curve
#define RENODX_TONE_MAP_EXPOSURE                     shader_injection.tone_map_exposure
#define RENODX_TONE_MAP_HIGHLIGHTS                   shader_injection.tone_map_highlights
#define RENODX_TONE_MAP_SHADOWS                      shader_injection.tone_map_shadows
#define RENODX_TONE_MAP_CONTRAST                     shader_injection.tone_map_contrast
#define RENODX_TONE_MAP_SATURATION                   shader_injection.tone_map_saturation
#define RENODX_TONE_MAP_HIGHLIGHT_SATURATION         shader_injection.tone_map_highlight_saturation
#define RENODX_TONE_MAP_BLOWOUT                      shader_injection.tone_map_blowout
#define RENODX_TONE_MAP_FLARE                        shader_injection.tone_map_flare
#define RENODX_TONE_MAP_MID_GRAY_IN                  shader_injection.tone_map_mid_gray_in
#define RENODX_TONE_MAP_MID_GRAY_OUT                 shader_injection.tone_map_mid_gray_out

#define SCENE_GRADE_LUT_STRENGTH                     shader_injection.scene_grade_lut_strength
#define SCENE_GRADE_LUT_SCALING                      shader_injection.scene_grade_lut_scaling
#define SCENE_GRADE_LUT_SCALING_TARGET               shader_injection.scene_grade_lut_scaling_target
#define RENODX_SDR_ENCODING                           shader_injection.sdr_encoding

#define CUSTOM_FILM_GRAIN_STRENGTH                   shader_injection.custom_film_grain
#define CUSTOM_RANDOM                                shader_injection.custom_random
#define LAST_IS_HDR                                  shader_injection.last_is_hdr

#define RENODX_RENO_DRT_WHITE_CLIP                    100.f
#define RENODX_RENO_DRT_TONE_MAP_METHOD               renodx::tonemap::renodrt::config::tone_map_method::HERMITE_SPLINE
#define RENODX_RENO_DRT_NEUTRAL_SDR_CLAMP_PEAK        -1.0f
#define RENODX_RENO_DRT_NEUTRAL_SDR_CLAMP_COLOR_SPACE -1.0f
#define RENODX_RENO_DRT_NEUTRAL_SDR_TONE_MAP_METHOD   renodx::tonemap::renodrt::config::tone_map_method::HERMITE_SPLINE

#define RENODX_INTERMEDIATE_ENCODING                 renodx::draw::ENCODING_NONE
#define RENODX_SWAP_CHAIN_DECODING                   renodx::draw::ENCODING_NONE
#define RENODX_SWAP_CHAIN_GAMMA_CORRECTION           renodx::draw::GAMMA_CORRECTION_NONE
#define RENODX_GAMMA_CORRECTION                      renodx::draw::GAMMA_CORRECTION_NONE

#ifndef __cplusplus
#ifdef __SLANG__
/*
  The Vulkan adjustment is applied by the shader injector. This declaration
  keeps the injected data at the same byte offset for every Slang shader.
*/
struct PushData
{
    [[vk::offset(PUSH_CONSTANTS_OFFSET)]]
    ShaderInjectData shader_injection;
};

[[vk::push_constant]]
PushData gPush;
#define shader_injection gPush.shader_injection
#else
#if ((__SHADER_TARGET_MAJOR == 5 && __SHADER_TARGET_MINOR >= 1) || __SHADER_TARGET_MAJOR >= 6)
cbuffer injected_buffer : register(b13, space50) {
#elif (__SHADER_TARGET_MAJOR < 5) || ((__SHADER_TARGET_MAJOR == 5) && (__SHADER_TARGET_MINOR < 1))
cbuffer injected_buffer : register(b13) {
#endif
  ShaderInjectData shader_injection : packoffset(c0);
}
#endif

#include "../../shaders/renodx.hlsl"

#endif

#endif  // SRC_NOMANSSKY_SHARED_H_
