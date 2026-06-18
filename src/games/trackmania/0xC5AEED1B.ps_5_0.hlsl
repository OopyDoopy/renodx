#include "./shared.h"

// ---- Created with 3Dmigoto v1.4.1 on Thu Jun 11 18:38:40 2026

SamplerState SMapInput_s : register(s0);
Texture2D<float4> TMapInput : register(t0);


// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_Position0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  o0.xyzw = TMapInput.Sample(SMapInput_s, v1.xy).xyzw;
  return;
}