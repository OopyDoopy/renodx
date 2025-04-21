// ---- Created with 3Dmigoto v1.4.1 on Mon Mar 31 15:37:05 2025

cbuffer _Globals : register(b0)
{
  float4 kBlurControl : packoffset(c0);
  float4 kInvWidthHeight : packoffset(c1);
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

  r0.xyz = SamplerSourceTexture.Sample(SamplerSource_s, v1.xy).xyz;
  r0.w = dot(r0.xyz, float3(0.298999995,0.587000012,0.114));
  r0.w = r0.w * r0.w;
  r0.w = kBlurControl.y * r0.w;
  r0.w = sqrt(r0.w);
  r0.w = saturate(kBlurControl.x * r0.w);
  r1.x = 1 + -r0.w;
  o0.w = kBlurControl.z * r1.x + r0.w;
  r1.xyz = cmp(r0.xyz >= kBlurControl.www);
  r1.xyz = r1.xyz ? float3(1,1,1) : 0;
  o0.xyz = r1.xyz * r0.xyz;
  return;
}