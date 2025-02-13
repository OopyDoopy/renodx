// ---- Created with 3Dmigoto v1.4.1 on Thu Feb 13 01:17:56 2025

cbuffer _Globals : register(b0)
{
  float pMinToneMapMult : packoffset(c0);
  float pMaxToneMapMult : packoffset(c0.y);
  float pMiddleGray : packoffset(c0.z);
  float pBrightPassThreshold : packoffset(c0.w);
}

cbuffer cbPsPerFrame : register(b4)
{
  float4 gViewport : packoffset(c0);
  float4 gTime : packoffset(c1);
  float3 gCameraPos : packoffset(c2);
  float4x4 gView : packoffset(c3);
  float4x4 gProj : packoffset(c7);
  float4x4 gInvProj : packoffset(c11);
  float4x4 gViewProj : packoffset(c15);
  float4x4 gInvViewProj : packoffset(c19);
  float4 gDepthRange : packoffset(c23);
  bool gDoSSAO : packoffset(c24);
}

SamplerState pImageS_s : register(s0);
SamplerState pAdaptedLumS_s : register(s1);
Texture2D<float4> pImage : register(t0);
Texture2D<float4> pAdaptedLum : register(t1);


// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_Position0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = pAdaptedLum.Sample(pAdaptedLumS_s, float2(0.5,0.5)).xyzw;
  r0.x = 0.00100000005 + r0.x;
  r0.x = pMiddleGray / r0.x;
  r0.x = max(pMinToneMapMult, r0.x);
  r0.x = min(pMaxToneMapMult, r0.x);
  r0.yz = gViewport.zw * v1.xy;
  r1.xyzw = pImage.Sample(pImageS_s, r0.yz).xyzw;
  r0.xyz = r1.xyz * r0.xxx;

  o0.w = saturate(r1.w);
  //o0.w = r1.w;

  r0.w = max(r0.y, r0.z);
  r0.w = max(r0.x, r0.w);
  r0.w = max(0.00100000005, r0.w);
  r1.x = -pBrightPassThreshold + r0.w;
  r1.x = max(0, r1.x);
  r0.w = r1.x / r0.w;

  //o0.xyz = saturate(r0.xyz * r0.www);
  o0.xyz = r0.xyz * r0.www;
  o0.rgb = o0.rgb * 5;
  return;
}