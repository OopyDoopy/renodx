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
    filtered_color = ApplyLCDGridV2Prescaled(g_tex_view, coords, output_texel_size, prescaled_texture_size, logical_source_size, lcd_settings);
  } else {
    CRTRoyaleSettings royale_settings = GetCRTRoyaleSettings();
    filtered_color = ApplyCRTRoyalePrescaled(g_tex_view, g_tex_sampler_s, coords, output_texel_size, prescaled_texture_size, logical_source_size, royale_settings);
  }

  r0.xyz = log2(max(filtered_color, 1e-6f.xxx));
  r0.xyz = g_gamma.xxx * r0.xyz;
  o0.xyz = exp2(r0.xyz);
  o0.w = 1;
}
