#ifndef SRC_CRIMSONDESERT_SHARED_H_
#define SRC_CRIMSONDESERT_SHARED_H_

#define RENODX_TONE_MAP_TYPE                   shader_injection.tone_map_type
#define RENODX_PEAK_WHITE_NITS                 shader_injection.peak_white_nits
#define RENODX_DIFFUSE_WHITE_NITS              shader_injection.diffuse_white_nits
#define RENODX_GRAPHICS_WHITE_NITS             shader_injection.graphics_white_nits
#define RENODX_GAMMA_CORRECTION               0 // shader_injection.gamma_correction

#define RENODX_TONE_MAP_HUE_RESTORE            shader_injection.tone_map_hue_restore
#define RENODX_TONE_MAP_BLOWOUT                shader_injection.tone_map_blowout
#define RENODX_COLOR_GRADE_STRENGTH            shader_injection.color_grade_strength

#define RENODX_TONE_MAP_EXPOSURE               shader_injection.tone_map_exposure
#define RENODX_TONE_MAP_HIGHLIGHTS             shader_injection.tone_map_highlights
#define RENODX_TONE_MAP_SHADOWS                shader_injection.tone_map_shadows
#define RENODX_TONE_MAP_CONTRAST               shader_injection.tone_map_contrast
#define RENODX_TONE_MAP_SATURATION             shader_injection.tone_map_saturation
#define RENODX_TONE_MAP_ADAPTATION_CONTRAST    shader_injection.tone_map_adaptation_contrast

#define CUSTOM_FILM_GRAIN_TYPE                shader_injection.custom_film_grain_type
#define CUSTOM_FILM_GRAIN_STRENGTH             shader_injection.custom_film_grain
#define CUSTOM_RANDOM                          shader_injection.custom_random
#define CUSTOM_CHROMATIC_ABERRATION              shader_injection.custom_chromatic_aberration
#define CUSTOM_SHARPENING                        shader_injection.custom_sharpening

//#define TONEMAP_UNDER_UI                      shader_injection.tonemap_under_ui

// Must be 32bit aligned
// Should be 4x32
struct ShaderInjectData {
  float peak_white_nits;
  float diffuse_white_nits;
  float graphics_white_nits;
  float tone_map_type;

  float tone_map_hue_restore;
  float tone_map_blowout;
  float color_grade_strength;

  float tone_map_exposure;
  float tone_map_highlights;
  float tone_map_shadows;
  float tone_map_contrast;
  float tone_map_saturation;
  float tone_map_adaptation_contrast;

  float custom_film_grain_type;
  float custom_film_grain;
  float custom_random;
  float custom_chromatic_aberration;
  float custom_sharpening;
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

#endif  // SRC_CRIMSONDESERT_SHARED_H_
