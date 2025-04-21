// ---- Created with 3Dmigoto v1.4.1 on Mon Mar 31 15:37:05 2025

cbuffer _Globals : register(b0)
{
  float4 kThreshold : packoffset(c0);
}

SamplerState SamplerSource_s : register(s0);
Texture2D<float4> SamplerSourceTexture : register(t0);


// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = SamplerSourceTexture.Sample(SamplerSource_s, v1.xy).xyzw;
  r1.x = dot(r0.xyz, float3(0.298999995,0.587000012,0.114));

  r1.x = saturate(r1.x * kThreshold.x + -kThreshold.y);
  //r1.x = r1.x * kThreshold.x + -kThreshold.y;

  o0.xyz = r1.xxx * r0.xyz;
  o0.w = r0.w;
  return;
}