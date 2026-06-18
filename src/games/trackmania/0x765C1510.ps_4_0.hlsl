#include "./shared.h"

// ---- Created with 3Dmigoto v1.4.1 on Thu Jun 11 17:16:05 2026

SamplerState MySamp_s : register(s0);
Texture2D<float4> MyTexture : register(t0);


// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  o0.xyzw = MyTexture.Sample(MySamp_s, v1.xy).xyzw;
  return;
}