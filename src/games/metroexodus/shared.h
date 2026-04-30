#ifndef SRC_METROEXODUS_SHARED_H_
#define SRC_METROEXODUS_SHARED_H_

#define RENODX_TONE_MAP_TYPE                   shader_injection.tone_map_type
#define CUSTOM_TONE_MAP_CURVE                  shader_injection.tone_map_curve
#define RENODX_PEAK_WHITE_NITS                 shader_injection.peak_white_nits
#define RENODX_DIFFUSE_WHITE_NITS              shader_injection.diffuse_white_nits
#define RENODX_GRAPHICS_WHITE_NITS             shader_injection.graphics_white_nits
#define RENODX_GAMMA_CORRECTION                shader_injection.gamma_correction
#define RENODX_GAMMA_CORRECTION_UI             shader_injection.gamma_correction_ui
#define CUSTOM_CLAMP_TYPE                      0.f
//#define TONEMAP_UNDER_UI                       shader_injection.tonemap_under_ui

// #define SCENE_GRADE_SCALING                    shader_injection.scene_grade_scaling
// #define SCENE_GRADE_SATURATION_CORRECTION      shader_injection.scene_grade_saturation_correction
// #define SCENE_GRADE_HUE_SHIFT                  shader_injection.scene_grade_hue_shift

#define RENODX_TONE_MAP_EXPOSURE               shader_injection.tone_map_exposure
#define RENODX_TONE_MAP_HIGHLIGHTS             shader_injection.tone_map_highlights
#define RENODX_TONE_MAP_SHADOWS                shader_injection.tone_map_shadows
#define RENODX_TONE_MAP_CONTRAST               shader_injection.tone_map_contrast
#define RENODX_TONE_MAP_SATURATION             shader_injection.tone_map_saturation
#define RENODX_TONE_MAP_BLOWOUT                shader_injection.tone_map_blowout
#define RENODX_TONE_MAP_CONE_RESPONSE          shader_injection.tone_map_cone_response
#define CUSTOM_LUT_SCALING                     shader_injection.custom_lut_scaling
//#define CUSTOM_LUT_SCALING_BRIGHTNESS          shader_injection.custom_lut_scaling_brightness
#define CUSTOM_LUT_RECOLOR                     shader_injection.custom_lut_recolor

#define CUSTOM_COLOR_GRADE                     1.f // Hard code since LUTs are used for fade to black

#define CUSTOM_FILM_GRAIN_STRENGTH             shader_injection.custom_film_grain
#define CUSTOM_RANDOM                          shader_injection.custom_random
#define CUSTOM_VIDEO                           shader_injection.custom_video

//#define TONEMAP_UNDER_UI                      shader_injection.tonemap_under_ui

// Must be 32bit aligned
// Should be 4x32
struct ShaderInjectData {
  float peak_white_nits;
  float diffuse_white_nits;
  float graphics_white_nits;
  float tone_map_type;
  float gamma_correction;
  float gamma_correction_ui;
  //float custom_clamp_type;
  //float tonemap_under_ui;

  // float scene_grade_scaling;
  // float scene_grade_saturation_correction;
  // float scene_grade_hue_shift;

  float tone_map_exposure;
  float tone_map_highlights;
  float tone_map_shadows;
  float tone_map_contrast;
  float tone_map_saturation;
  float tone_map_cone_response;
  float tone_map_blowout;
  float custom_lut_scaling;
  //float custom_lut_scaling_brightness;
  float custom_lut_recolor;
  //float custom_color_grade;

  //float custom_film_grain_type;
  float custom_film_grain;
  float custom_random;
  float custom_video;
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

#endif  // SRC_METROEXODUS_SHARED_H_
