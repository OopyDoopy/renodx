#ifndef SRC_TRACKMANIA_SHARED_H_
#define SRC_TRACKMANIA_SHARED_H_

#define RENODX_PEAK_WHITE_NITS     shader_injection.peak_white_nits
#define RENODX_DIFFUSE_WHITE_NITS  shader_injection.diffuse_white_nits
#define RENODX_GRAPHICS_WHITE_NITS shader_injection.graphics_white_nits
#define RENODX_TONE_MAP_TYPE       shader_injection.tone_map_type
#define RENODX_GAMMA_CORRECTION    shader_injection.gamma_correction

#define SCENE_GRADE_COLOR_GRADE_STRENGTH     shader_injection.scene_grade_color_grade_strength
#define SCENE_GRADE_COLOR_GRADE_STRENGTH_TWO shader_injection.scene_grade_color_grade_strength_two

#define RENODX_TONE_MAP_EXPOSURE             shader_injection.tone_map_exposure
#define RENODX_TONE_MAP_HIGHLIGHTS           shader_injection.tone_map_highlights
#define RENODX_TONE_MAP_SHADOWS              shader_injection.tone_map_shadows
#define RENODX_TONE_MAP_CONTRAST             shader_injection.tone_map_contrast
#define RENODX_TONE_MAP_SATURATION           shader_injection.tone_map_saturation
#define RENODX_TONE_MAP_HIGHLIGHT_SATURATION shader_injection.tone_map_highlight_saturation
#define RENODX_TONE_MAP_BLOWOUT              shader_injection.tone_map_blowout
#define RENODX_TONE_MAP_FLARE                shader_injection.tone_map_flare

#define CUSTOM_BLOOM                 shader_injection.custom_bloom
#define CUSTOM_ANAMORPHIC_LENS_FLARE shader_injection.custom_anamorphic_lens_flare

#define RENODX_SWAP_CHAIN_OUTPUT_PRESET renodx::draw::SWAP_CHAIN_OUTPUT_PRESET_HDR10
#define RENODX_SWAP_CHAIN_DECODING      renodx::draw::ENCODING_SRGB
#define RENODX_INTERMEDIATE_ENCODING    renodx::draw::ENCODING_SRGB

// Must be 32bit aligned
// Should be 4x32
struct ShaderInjectData {
  float peak_white_nits;
  float diffuse_white_nits;
  float graphics_white_nits;
  float tone_map_type;
  float gamma_correction;

  float scene_grade_color_grade_strength;
  float scene_grade_color_grade_strength_two;

  float tone_map_exposure;
  float tone_map_highlights;
  float tone_map_shadows;
  float tone_map_contrast;
  float tone_map_saturation;
  float tone_map_highlight_saturation;
  float tone_map_blowout;
  float tone_map_flare;

  float custom_bloom;
  float custom_anamorphic_lens_flare;
};

#ifndef __cplusplus
cbuffer cb11 : register(b11) {
  ShaderInjectData shader_injection : packoffset(c0);
}

#include "../../shaders/renodx.hlsl"

#endif

#endif  // SRC_TRACKMANIA_SHARED_H_
