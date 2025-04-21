#include "./shared.h"

// ---- Created with 3Dmigoto v1.4.1 on Wed Feb 12 20:35:46 2025

cbuffer _Globals : register(b0)
{
  float4 ViewportDimensions : packoffset(c0);
  float pAlpha : packoffset(c1);
}

SamplerState pRenderTargetS_s : register(s0);
SamplerState pDistortTextureS_s : register(s1);
Texture2D<float4> pRenderTarget : register(t0);
Texture2D<float4> pDistortTexture : register(t1);

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

  r0.xyzw = pDistortTexture.Sample(pDistortTextureS_s, v1.xy).xyzw;
  r0.z = dot(r0.xy, r0.xy);
  r0.z = sqrt(r0.z);
  r1.xy = r0.xy * ViewportDimensions.zw + v1.xy;
  r0.xy = ViewportDimensions.zw * r0.xy;
  r0.zw = r0.zz * ViewportDimensions.zw + r1.xy;
  r1.xyzw = pDistortTexture.Sample(pDistortTextureS_s, r0.zw).xyzw;

  r0.z = saturate(1000000 * r1.x);
  //r0.z = 1000000 * r1.x;

  r0.w = r0.z * -2 + 3;
  r0.z = r0.z * r0.z;
  r0.z = r0.w * r0.z;
  r0.xy = r0.zz * r0.xy + v1.xy;
  r0.xyzw = pRenderTarget.Sample(pRenderTargetS_s, r0.xy).xyzw;
  o0.xyz = r0.xyz;
  o0.w = pAlpha;

  o0.rgb = renodx::color::srgb::DecodeSafe(o0.rgb);
  o0.rgb = renodx::draw::RenderIntermediatePass(o0.rgb);
  return;
}