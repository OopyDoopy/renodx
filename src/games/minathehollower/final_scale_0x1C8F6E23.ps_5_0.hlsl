// ---- Created with 3Dmigoto v1.4.1 on Mon Jun  1 02:11:09 2026

#include "shared.h"

cbuffer g_cbuffer_1 : register(b1)
{
  float4 g_gamma : packoffset(c0);
}

#define LCD_GRID_V2_HELPERS_ONLY 1
#include "lcd-grid-v2.hlsl"
#define CRT_ROYALE_HELPERS_ONLY 1
#include "crt-royale.hlsl"

SamplerState g_tex_sampler_s : register(s0);
Texture2D<float4> g_tex_view : register(t0);


// 3Dmigoto declarations
#define cmp -

float3 SampleBaseColor(float2 coords, float2 textureSize) {
  float2 derivX = ddx_coarse(coords * textureSize);
  float2 derivY = ddy_coarse(coords * textureSize);
  float2 footprint = abs(derivX) + abs(derivY);
  float4 texelBounds = floor(coords.xyxy * textureSize.xyxy + 0.5f.xxxx);
  float2 quantized = coords * textureSize - texelBounds.zw;
  quantized /= max(footprint, 1e-6f.xx);
  quantized += texelBounds.xy;
  quantized = clamp(quantized, texelBounds.xy + float2(-0.5f, -0.5f), texelBounds.zw + float2(0.5f, 0.5f));
  float2 sampleUv = quantized / textureSize;
  return g_tex_view.Sample(g_tex_sampler_s, sampleUv).xyz;
}

void main(
  float4 v0 : SV_Position0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  float4 r0;
  float4 fDest;

  r0.xy = v1.xy * float2(1, -1) + float2(0, 1);
  float2 coords = r0.xy;

  g_tex_view.GetDimensions(0, fDest.x, fDest.y, fDest.z);
  float2 prescaled_texture_size = fDest.xy;
  float2 logical_source_size = float2(256.0f, 144.0f);
  float2 output_texel_size = float2(abs(ddx(coords.x)), abs(ddy(coords.y)));

  float3 filtered_color;
  if (MINA_FILTER_MODE == 0.f) {
    filtered_color = SampleBaseColor(coords, prescaled_texture_size);
  } else if (MINA_FILTER_MODE == 1.f) {
    LCDGridV2Settings lcd_settings = GetLCDGridV2Settings();

    lcd_settings.redSubpixelColor = float3(shader_injection.lcd_red_r, shader_injection.lcd_red_g, shader_injection.lcd_red_b);
    lcd_settings.greenSubpixelColor = float3(shader_injection.lcd_green_r, shader_injection.lcd_green_g, shader_injection.lcd_green_b);
    lcd_settings.blueSubpixelColor = float3(shader_injection.lcd_blue_r, shader_injection.lcd_blue_g, shader_injection.lcd_blue_b);
    lcd_settings.gain = shader_injection.lcd_gain;
    lcd_settings.gamma = shader_injection.lcd_gamma;
    lcd_settings.blacklevel = shader_injection.lcd_blacklevel;
    lcd_settings.ambient = shader_injection.lcd_ambient;
    lcd_settings.BGR = shader_injection.lcd_bgr;

    filtered_color = ApplyLCDGridV2Prescaled(g_tex_view, coords, output_texel_size, prescaled_texture_size, logical_source_size, lcd_settings);
  } else {
    CRTRoyaleSettings royale_settings = GetCRTRoyaleSettings();

    royale_settings.crtGamma = shader_injection.crt_gamma;
    royale_settings.lcdGamma = shader_injection.lcd_gamma_crt;
    royale_settings.levelsContrast = shader_injection.levels_contrast;
    royale_settings.levelsAutodim = shader_injection.levels_autodim;
    royale_settings.halationWeight = shader_injection.halation_weight;
    royale_settings.diffusionWeight = shader_injection.diffusion_weight;
    royale_settings.bloomUnderestimateLevels = shader_injection.bloom_underestimate_levels;
    royale_settings.bloomExcess = shader_injection.bloom_excess;
    royale_settings.beamMinSigma = shader_injection.beam_min_sigma;
    royale_settings.beamMaxSigma = shader_injection.beam_max_sigma;
    royale_settings.beamMinShape = shader_injection.beam_min_shape;
    royale_settings.beamMaxShape = shader_injection.beam_max_shape;
    royale_settings.beamSpotPower = shader_injection.beam_spot_power;
    royale_settings.beamShapePower = shader_injection.beam_shape_power;
    royale_settings.beamHorizSigma = shader_injection.beam_horiz_sigma;
    royale_settings.scanlineStrength = shader_injection.scanline_strength;
    royale_settings.convergenceR = float2(shader_injection.convergence_r_x, shader_injection.convergence_r_y);
    royale_settings.convergenceG = float2(shader_injection.convergence_g_x, shader_injection.convergence_g_y);
    royale_settings.convergenceB = float2(shader_injection.convergence_b_x, shader_injection.convergence_b_y);
    royale_settings.maskType = shader_injection.mask_type;
    royale_settings.maskTriadSize = shader_injection.mask_triad_size;
    royale_settings.maskStrength = shader_injection.mask_strength;
    royale_settings.maskBrightness = shader_injection.mask_brightness;
    royale_settings.borderSize = shader_injection.border_size;
    royale_settings.borderDarkness = shader_injection.border_darkness;
    royale_settings.curvature = shader_injection.curvature;
    royale_settings.geomMode = shader_injection.geom_mode;

    filtered_color = ApplyCRTRoyalePrescaled(g_tex_view, g_tex_sampler_s, coords, output_texel_size, prescaled_texture_size, logical_source_size, royale_settings);
  }

  r0.xyz = log2(max(filtered_color, 1e-6f.xxx));
  r0.xyz = g_gamma.xxx * r0.xyz;
  o0.xyz = exp2(r0.xyz);
  o0.w = 1;
}
