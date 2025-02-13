#include "./shared.h"

// ---- Created with 3Dmigoto v1.4.1 on Wed Feb 12 21:22:02 2025

cbuffer _Globals : register(b0)
{
  float pMinToneMapMult : packoffset(c0);
  float pMaxToneMapMult : packoffset(c0.y);
  float pMiddleGray : packoffset(c0.z);
  float pBloomScale : packoffset(c0.w);
  float4 pToneMapValues1 : packoffset(c1);
  float4 pToneMapValues2 : packoffset(c2);
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
SamplerState pBloomS_s : register(s1);
SamplerState pAdaptedLumS_s : register(s2);
Texture2D<float4> pImage : register(t0);
Texture2D<float4> pBloom : register(t1);
Texture2D<float4> pAdaptedLum : register(t2);


// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_Position0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = pAdaptedLum.Sample(pAdaptedLumS_s, float2(0.5,0.5)).xyzw;
  r0.x = 0.00100000005 + r0.x;
  r0.x = pMiddleGray / r0.x;
  r0.x = max(pMinToneMapMult, r0.x);
  r0.x = min(pMaxToneMapMult, r0.x);
  r0.yz = gViewport.zw * v1.xy;
  r1.xyzw = pBloom.Sample(pBloomS_s, r0.yz).xyzw;
  r0.yzw = pBloomScale * r1.xyz;
  r1.xyzw = pImage.Sample(pImageS_s, v1.xy).xyzw;

  // r0.xyz = r1.xyz * r0.xxx + r0.yzw; //original
  r0.xyz = (r1.xyz) * (r0.xxx) + (r0.yzw * float3(CUSTOM_BLOOM_STRENGTH, CUSTOM_BLOOM_STRENGTH, CUSTOM_BLOOM_STRENGTH));

  float3 untonemapped = r0.rgb;

  r0.xyz = max(float3(0,0,0), r0.xyz);
  r0.xyz = min(float3(10,10,10), r0.xyz);
  r1.xyz = r0.xyz * float3(0.753000021,0.753000021,0.753000021) + float3(0.0299999993,0.0299999993,0.0299999993);
  r2.xyz = float3(0.300000012,0.300000012,0.300000012) * r0.xyz;
  r0.xyz = r0.xyz * float3(0.729000032,0.729000032,0.729000032) + float3(0.589999974,0.589999974,0.589999974);
  r0.xyz = r2.xyz * r0.xyz + float3(0.140000001,0.140000001,0.140000001);
  r1.xyz = r2.xyz * r1.xyz;
  r0.xyz = r1.xyz / r0.xyz;
  r0.xyz = log2(r0.xyz);
  r0.xyz = float3(0.666666687,0.666666687,0.666666687) * r0.xyz;
  r0.xyz = exp2(r0.xyz);
  r0.w = 0.300000012 * pToneMapValues2.z;
  r1.xy = pToneMapValues2.zz * float2(0.753000021,0.729000032) + float2(0.0299999993,0.589999974);
  r1.x = r1.x * r0.w;
  r0.w = r0.w * r1.y + 0.140000001;
  r0.w = r1.x / r0.w;
  r0.w = log2(r0.w);
  r0.w = 0.666666687 * r0.w;
  r0.w = exp2(r0.w);

  //r0.xyzw = min(float4(1,1,1,1), r0.xyzw);
  r0.w = min(1, r0.w);

  r0.w = 1 / r0.w;
  r0.xyz = r0.xyz * r0.www;
  o0.w = dot(r0.xyz, float3(0.298999995,0.587000012,0.114));
  o0.xyz = r0.xyz;

  if (RENODX_TONE_MAP_TYPE != 0.f) {
    o0.rgb = renodx::tonemap::UpgradeToneMap(
                      untonemapped,
                      renodx::tonemap::renodrt::NeutralSDR(o0.rgb),
                      o0.rgb,
                      CUSTOM_TONEMAPPING_STRENGTH);
  }
  return;
}