#ifndef SRC_DRAGONSDOGMA2_SHARED_H_
#define SRC_DRAGONSDOGMA2_SHARED_H_

#define VANILLA_LUTBUILDER

#define RENODX_TONE_MAP_TYPE                   shader_injection.tone_map_type
#define RENODX_PEAK_WHITE_NITS                 shader_injection.peak_white_nits
#define RENODX_DIFFUSE_WHITE_NITS              shader_injection.diffuse_white_nits
#define RENODX_GRAPHICS_WHITE_NITS             shader_injection.graphics_white_nits
#define RENODX_TONE_MAP_HUE_CORRECTION        shader_injection.tone_map_hue_correction
#define RENODX_GAMMA_CORRECTION                shader_injection.gamma_correction
#define VANILLA_CURVE_MATCH                    shader_injection.vanilla_curve_match

#define SCENE_GRADE_SATURATION_CORRECTION      shader_injection.scene_grade_saturation_correction
#define SCENE_GRADE_BLOWOUT_RESTORATION        shader_injection.scene_grade_blowout_restoration

#define RENODX_TONE_MAP_EXPOSURE               shader_injection.tone_map_exposure
#define RENODX_TONE_MAP_HIGHLIGHTS             shader_injection.tone_map_highlights
#define RENODX_TONE_MAP_SHADOWS                shader_injection.tone_map_shadows
#define RENODX_TONE_MAP_CONTRAST               shader_injection.tone_map_contrast
#define RENODX_TONE_MAP_SATURATION             shader_injection.tone_map_saturation
#define RENODX_TONE_MAP_BLOWOUT                shader_injection.tone_map_blowout
#define RENODX_TONE_MAP_FLARE                  shader_injection.tone_map_flare
#define RENODX_TONE_MAP_MID_GRAY_IN            shader_injection.tone_map_mid_gray_in
#define RENODX_TONE_MAP_MID_GRAY_OUT           shader_injection.tone_map_mid_gray_out

#define CUSTOM_FILM_GRAIN_TYPE                shader_injection.custom_film_grain_type
#define CUSTOM_FILM_GRAIN_STRENGTH             shader_injection.custom_film_grain
#define CUSTOM_RANDOM                          shader_injection.custom_random
#define CUSTOM_VIGNETTE                        shader_injection.custom_vignette

//#define TONEMAP_UNDER_UI                      shader_injection.tonemap_under_ui

// Must be 32bit aligned
// Should be 4x32
struct ShaderInjectData {
  float peak_white_nits;
  float diffuse_white_nits;
  float graphics_white_nits;
  float tone_map_type;
  float tone_map_hue_correction;
  float gamma_correction;
  float vanilla_curve_match;

  float scene_grade_saturation_correction;
  float scene_grade_blowout_restoration;

  float tone_map_exposure;
  float tone_map_highlights;
  float tone_map_shadows;
  float tone_map_contrast;
  float tone_map_saturation;
  float tone_map_blowout;
  float tone_map_flare;
  float tone_map_mid_gray_in;
  float tone_map_mid_gray_out;

  float custom_film_grain_type;
  float custom_film_grain;
  float custom_random;
  float custom_vignette;
  //float tonemap_under_ui;
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

#endif  // SRC_DRAGONSDOGMA2_SHARED_H_
