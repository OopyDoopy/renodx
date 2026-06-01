#ifndef SRC_MINATHEHOLLOWER_SHARED_H_
#define SRC_MINATHEHOLLOWER_SHARED_H_

#define MINA_FILTER_NONE         0
#define MINA_FILTER_LCD_GRID_V2  1
#define MINA_FILTER_CRT_ROYALE   2
#define MINA_FILTER_MODE         shader_injection.filter_mode

// Must be 32bit aligned
// Multiple of 4x32 = 128 bytes (8 float4 registers)
struct ShaderInjectData {
  float filter_mode;
  
  // LCD Grid V2 Settings
  float lcd_gain;
  float lcd_gamma;
  float lcd_blacklevel;
  float lcd_ambient;
  float lcd_bgr;
  float lcd_red_r;
  float lcd_red_g;
  float lcd_red_b;
  float lcd_green_r;
  float lcd_green_g;
  float lcd_green_b;
  float lcd_blue_r;
  float lcd_blue_g;
  float lcd_blue_b;
  float _pad0;
  
  // CRT Royale Settings
  float crt_gamma;
  float lcd_gamma_crt;
  float levels_contrast;
  float levels_autodim;
  float halation_weight;
  float diffusion_weight;
  float bloom_underestimate_levels;
  float bloom_excess;
  float beam_min_sigma;
  float beam_max_sigma;
  float beam_min_shape;
  float beam_max_shape;
  float beam_spot_power;
  float beam_shape_power;
  float beam_horiz_sigma;
  float scanline_strength;
  float convergence_r_x;
  float convergence_r_y;
  float convergence_g_x;
  float convergence_g_y;
  float convergence_b_x;
  float convergence_b_y;
  float mask_type;
  float mask_triad_size;
  float mask_strength;
  float mask_brightness;
  float border_size;
  float border_darkness;
  float curvature;
  float geom_mode;
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

#endif  // SRC_MINATHEHOLLOWER_SHARED_H_
