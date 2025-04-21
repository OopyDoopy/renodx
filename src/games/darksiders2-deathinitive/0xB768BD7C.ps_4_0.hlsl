// ---- Created with 3Dmigoto v1.4.1 on Thu Feb 13 01:32:06 2025

cbuffer _Globals : register(b0)
{
  float pElapsedTime : packoffset(c0);
}

SamplerState pAdaptedLumS_s : register(s0);
SamplerState pCurrentLumS_s : register(s1);
Texture2D<float4> pAdaptedLum : register(t0);
Texture2D<float4> pCurrentLum : register(t1);


// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_Position0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = pCurrentLum.Sample(pCurrentLumS_s, float2(0.5,0.5)).xyzw;
  r1.xyzw = pAdaptedLum.Sample(pAdaptedLumS_s, float2(0.5,0.5)).xyzw;
  r0.x = -r1.x + r0.x;
  r0.x = r0.x * pElapsedTime + r1.x;
  r0.x = max(0, r0.x);
  o0.xyz = min(float3(10,10,10), r0.xxx);
  o0.w = 1;
  return;
}