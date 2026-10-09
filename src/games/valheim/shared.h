#ifndef SRC_VALHEIM_SHARED_H_
#define SRC_VALHEIM_SHARED_H_

#define RENODX_PEAK_WHITE_NITS               shader_injection.peak_white_nits
#define RENODX_DIFFUSE_WHITE_NITS            shader_injection.diffuse_white_nits
#define RENODX_GRAPHICS_WHITE_NITS           shader_injection.graphics_white_nits
#define RENODX_SWAP_CHAIN_OUTPUT_PRESET     shader_injection.swap_chain_output_preset
#define RENODX_SDR_ENCODING                 shader_injection.sdr_encoding
#define RENODX_TONE_MAP_TYPE                 shader_injection.tone_map_type
#define RENODX_TONE_MAP_CURVE                shader_injection.tone_map_curve
#define RENODX_TONE_MAP_MID_GRAY_IN          shader_injection.tone_map_mid_gray_in
#define RENODX_TONE_MAP_MID_GRAY_OUT         shader_injection.tone_map_mid_gray_out
#define RENODX_TONE_MAP_EXPOSURE             shader_injection.tone_map_exposure
#define RENODX_TONE_MAP_HIGHLIGHTS           shader_injection.tone_map_highlights
#define RENODX_TONE_MAP_SHADOWS              shader_injection.tone_map_shadows
#define RENODX_TONE_MAP_CONTRAST             shader_injection.tone_map_contrast
#define RENODX_TONE_MAP_SATURATION           shader_injection.tone_map_saturation
#define RENODX_TONE_MAP_HIGHLIGHT_SATURATION shader_injection.tone_map_highlight_saturation
#define RENODX_TONE_MAP_BLOWOUT              shader_injection.tone_map_blowout
#define RENODX_TONE_MAP_FLARE                shader_injection.tone_map_flare
//#define RENODX_TONE_MAP_WORKING_COLOR_SPACE  shader_injection.tone_map_working_color_space
#define RENODX_TONE_MAP_HUE_PROCESSOR        0.f
#define RENODX_TONE_MAP_HUE_SHIFT            0.f
#define RENODX_TONE_MAP_HUE_CORRECTION       1.f
#define RENODX_TONE_MAP_PER_CHANNEL          0.f
#define CUSTOM_LUT_STRENGTH                  shader_injection.custom_lut_strength
#define CUSTOM_LUT_SCALING                   shader_injection.custom_lut_scaling
#define CUSTOM_LUT_SCALING_TARGET            shader_injection.custom_lut_scaling_target
#define CUSTOM_LUT_TETRAHEDRAL               1.f
#define PRISM_INSET_00                       shader_injection.prism_inset_00
#define PRISM_INSET_01                       shader_injection.prism_inset_01
#define PRISM_INSET_02                       shader_injection.prism_inset_02
#define PRISM_INSET_10                       shader_injection.prism_inset_10
#define PRISM_INSET_11                       shader_injection.prism_inset_11
#define PRISM_INSET_12                       shader_injection.prism_inset_12
#define PRISM_INSET_20                       shader_injection.prism_inset_20
#define PRISM_INSET_21                       shader_injection.prism_inset_21
#define PRISM_INSET_22                       shader_injection.prism_inset_22
#define PRISM_HIGHLIGHT_CONTRAST             shader_injection.prism_highlight_contrast
#define PRISM_SHADOW_CONTRAST                shader_injection.prism_shadow_contrast
#define CUSTOM_FILM_GRAIN_STRENGTH           shader_injection.custom_film_grain
#define CUSTOM_RANDOM                        shader_injection.custom_random
#define CUSTOM_CHROMATIC_ABERRATION          shader_injection.custom_chromatic_aberration
#define CUSTOM_BLOOM                         shader_injection.custom_bloom
#define CUSTOM_SUN_SHAFTS                    shader_injection.custom_sun_shafts
#define CUSTOM_LENS_DIRT                     shader_injection.custom_lens_dirt

// Must be 32bit aligned
// Should be 4x32
struct ShaderInjectData {
  float peak_white_nits;
  float diffuse_white_nits;
  float graphics_white_nits;
  float tone_map_type;
  float tone_map_curve;
  float tone_map_mid_gray_in;
  float tone_map_mid_gray_out;
  float custom_lut_scaling_target;
  float tone_map_exposure;
  float tone_map_highlights;
  float tone_map_shadows;
  float tone_map_contrast;
  float tone_map_saturation;
  float tone_map_highlight_saturation;
  float tone_map_blowout;
  float tone_map_flare;
  float custom_lut_strength;
  float custom_lut_scaling;
  //float tone_map_hue_processor;
  float custom_chromatic_aberration;
  float custom_bloom;
  float custom_sun_shafts;
  float custom_lens_dirt;
  float custom_film_grain;
  float custom_random;
  float prism_inset_00;
  float prism_inset_01;
  float prism_inset_02;
  float prism_inset_10;
  float prism_inset_11;
  float prism_inset_12;
  float prism_inset_20;
  float prism_inset_21;
  float prism_inset_22;
  float prism_highlight_contrast;
  float prism_shadow_contrast;
  float swap_chain_output_preset;
  float sdr_encoding;
};

#ifndef __cplusplus
cbuffer cb13 : register(b13) {
  ShaderInjectData shader_injection : packoffset(c0);
}

#include "../../shaders/renodx.hlsl"

#endif

#endif  // SRC_VALHEIM_SHARED_H_
