#ifndef SRC_THEWITCHER3_SHARED_H_
#define SRC_THEWITCHER3_SHARED_H_

#define RENODX_TONE_MAP_TYPE                   shader_injection.tone_map_type
#define RENODX_PEAK_WHITE_NITS                 shader_injection.peak_white_nits
#define RENODX_DIFFUSE_WHITE_NITS              shader_injection.diffuse_white_nits
#define RENODX_GRAPHICS_WHITE_NITS             shader_injection.graphics_white_nits
#define RENODX_TONE_MAP_EXPOSURE               shader_injection.tone_map_exposure
#define RENODX_TONE_MAP_HIGHLIGHTS             shader_injection.tone_map_highlights
#define RENODX_TONE_MAP_SHADOWS                shader_injection.tone_map_shadows
#define RENODX_TONE_MAP_CONTRAST               shader_injection.tone_map_contrast
#define RENODX_TONE_MAP_HIGHLIGHT_CONTRAST     shader_injection.tone_map_highlight_contrast
#define RENODX_TONE_MAP_SHADOW_CONTRAST        shader_injection.tone_map_shadow_contrast
#define RENODX_TONE_MAP_SATURATION             shader_injection.tone_map_saturation
#define RENODX_TONE_MAP_HIGHLIGHT_SATURATION   shader_injection.tone_map_highlight_saturation
#define RENODX_TONE_MAP_BLOWOUT                shader_injection.tone_map_blowout
#define RENODX_TONE_MAP_FLARE                  shader_injection.tone_map_flare
//#define RENODX_COLOR_GRADE_STRENGTH            shader_injection.tone_map_color_grade_strength
#define RENODX_INTERMEDIATE_ENCODING           renodx::draw::ENCODING_NONE
#define RENODX_SWAP_CHAIN_DECODING             renodx::draw::ENCODING_NONE
#define RENODX_SWAP_CHAIN_GAMMA_CORRECTION     renodx::draw::GAMMA_CORRECTION_NONE
#define RENODX_GAMMA_CORRECTION                renodx::draw::GAMMA_CORRECTION_NONE
//#define RENODX_SWAP_CHAIN_SCALING_NITS         100.f * RENODX_DIFFUSE_WHITE_NITS / 203.f
#define RENODX_SWAP_CHAIN_DECODING_COLOR_SPACE color::convert::COLOR_SPACE_BT709
#define RENODX_SWAP_CHAIN_CLAMP_COLOR_SPACE    color::convert::COLOR_SPACE_BT2020
#define RENODX_SWAP_CHAIN_ENCODING             renodx::draw::ENCODING_PQ
#define RENODX_SWAP_CHAIN_ENCODING_COLOR_SPACE color::convert::COLOR_SPACE_BT2020
#define RENODX_RENO_DRT_TONE_MAP_METHOD        renodx::tonemap::renodrt::config::tone_map_method::NONE
//#define RENODX_RENO_DRT_WHITE_CLIP             100.f
//#define CUSTOM_SCENE_GRADE_METHOD              shader_injection.scene_grade_method
#define CUSTOM_SCENE_HUE_METHOD                1
#define CUSTOM_FILM_GRAIN_STRENGTH             shader_injection.custom_film_grain
#define CUSTOM_RANDOM                          shader_injection.custom_random
#define CUSTOM_LUT_STRENGTH                    shader_injection.custom_lut_strength
#define CUSTOM_LUT_SCALING                     shader_injection.custom_lut_scaling
#define CUSTOM_GRADING_IMPROVEMENTS             shader_injection.custom_grading_improvements
#define CUSTOM_COLOR_GRADING                   shader_injection.custom_color_grading
//#define CUSTOM_POST_MAXCLL                     shader_injection.custom_post_maxcll
#define CUSTOM_LENS_DIRT                       shader_injection.custom_lens_dirt
#define CUSTOM_SUNSHAFTS_STRENGTH              shader_injection.custom_sunshafts_strength
#define CUSTOM_DEPTH_BLUR                      shader_injection.custom_depth_blur
#define CUSTOM_SHARPENING_TYPE                shader_injection.custom_sharpening_type
#define CUSTOM_SHARPNESS                      shader_injection.custom_sharpness
#define CUSTOM_INVERSE_TONE_MAP                shader_injection.custom_inverse_tone_map
#define CUSTOM_VIDEO                           shader_injection.custom_video

#define CUSTOM_BLOOM                           shader_injection.custom_bloom
#define CUSTOM_VIGNETTE                        shader_injection.custom_vignette
#define CUSTOM_VIGNETTE_BLACK_LEVEL            shader_injection.custom_vignette_black_level
#define CUSTOM_SDR_OUTPUT_ENCODING             shader_injection.custom_sdr_output_encoding
#define LAST_IS_HDR                            shader_injection.last_is_hdr
#define PRISM_INSET_00                         shader_injection.prism_inset_00
#define PRISM_INSET_01                         shader_injection.prism_inset_01
#define PRISM_INSET_02                         shader_injection.prism_inset_02
#define PRISM_INSET_10                         shader_injection.prism_inset_10
#define PRISM_INSET_11                         shader_injection.prism_inset_11
#define PRISM_INSET_12                         shader_injection.prism_inset_12
#define PRISM_INSET_20                         shader_injection.prism_inset_20
#define PRISM_INSET_21                         shader_injection.prism_inset_21
#define PRISM_INSET_22                         shader_injection.prism_inset_22
#define PRISM_BLACK_FLOOR                       shader_injection.prism_black_floor
// #define CUSTOM_BLOOM_ROLLOFF_START                 shader_injection.custom_bloom_rolloff_start
// #define CUSTOM_SUNSHAFT_ROLLOFF_START             shader_injection.custom_sunshaft_rolloff_start
// #define CUSTOM_BLOOM_THRESHOLD                 shader_injection.custom_bloom_threshold
// #define CUSTOM_BLOOM_CURVE                     shader_injection.custom_bloom_curve
//#define CUSTOM_BLOOM_RADIUS                    shader_injection.custom_bloom_radius

// #define CUSTOM_GAMMA_TYPE                      shader_injection.custom_gamma_type
// #define CUSTOM_GAMMA_VALUE                     shader_injection.custom_gamma_value

//#define UTILITY_COMPARISON                    shader_injection.utility_comparison
//#define UTILITY_HUD                            shader_injection.utility_hud

// Must be 32bit aligned
// Should be 4x32
struct ShaderInjectData {
  float peak_white_nits;
  float diffuse_white_nits;
  float graphics_white_nits;
  float tone_map_type;
  float tone_map_exposure;
  float tone_map_highlights;
  float tone_map_shadows;
  float tone_map_contrast;
  float tone_map_highlight_contrast;
  float tone_map_shadow_contrast;
  float tone_map_saturation;
  float tone_map_highlight_saturation;
  float tone_map_blowout;
  float tone_map_flare;
  float custom_film_grain;
  float custom_random;
  float custom_lut_strength;
  float custom_lut_scaling;
  float custom_color_grading;
  float custom_grading_improvements;
  //float custom_post_maxcll;
  float custom_lens_dirt;
  float custom_sunshafts_strength;
  float custom_tone_map_exposure;
  float custom_depth_blur;
  float custom_sharpening_type;
  float custom_sharpness;

  float custom_bloom;
  float custom_vignette;
  float custom_vignette_black_level;

  float agx_vanilla_bend;
  float custom_inverse_tone_map;
  float custom_video;

  //float utility_comparison;
  //float utility_hud;
  bool last_is_hdr;
  float custom_sdr_output_encoding;
  float prism_inset_00;
  float prism_inset_01;
  float prism_inset_02;
  float prism_inset_10;
  float prism_inset_11;
  float prism_inset_12;
  float prism_inset_20;
  float prism_inset_21;
  float prism_inset_22;
  float prism_yf_weight_0;
  float prism_yf_weight_1;
  float prism_yf_weight_2;
  float prism_yf_neutral_axis_0;
  float prism_yf_neutral_axis_1;
  float prism_yf_neutral_axis_2;
  float prism_yf_neutral_reciprocal;
  float prism_black_floor;
  float custom_debug_show_agx_curve_values;
};

#ifndef __cplusplus
#if ((__SHADER_TARGET_MAJOR == 5 && __SHADER_TARGET_MINOR >= 1) || __SHADER_TARGET_MAJOR >= 6)
cbuffer injectedBuffer : register(b13, space50) {
#elif (__SHADER_TARGET_MAJOR < 5) || ((__SHADER_TARGET_MAJOR == 5) && (__SHADER_TARGET_MINOR < 1))
cbuffer injectedBuffer : register(b13) {
#endif
  ShaderInjectData shader_injection : packoffset(c0);
}

#if (__SHADER_TARGET_MAJOR >= 6)
#pragma dxc diagnostic ignored "-Wparentheses-equality"
#endif

#include "../../shaders/renodx.hlsl"
#endif

#endif  // SRC_THEWITCHER3_SHARED_H_
