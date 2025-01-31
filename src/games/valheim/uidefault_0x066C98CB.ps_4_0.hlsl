#include "./shared.h"

// ---- Created with 3Dmigoto v1.4.1 on Wed Jan 29 15:53:28 2025
Texture2D<float4> t0 : register(t0);

SamplerState s0_s : register(s0);

cbuffer cb0 : register(b0)
{
  float4 cb0[4];
}




// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 255 * v1.w;
  r0.x = round(r0.x);
  r0.w = 0.00392156886 * r0.x;
  r1.xyzw = t0.Sample(s0_s, v2.xy).xyzw;
  r1.xyzw = cb0[3].xyzw + r1.xyzw;
  r0.xyz = v1.xyz;
  r0.xyzw = r1.xyzw * r0.xyzw;
  o0.xyz = r0.xyz * r0.www;
  o0.w = r0.w;

  //o0.rgb = renodx::color::correct::GammaSafe(o0.rgb, true, 2.2f);
  o0.rgb = renodx::color::correct::GammaSafe(o0.rgb);
  o0.rgb *= RENODX_GRAPHICS_WHITE_NITS / 80.f;
  // o0.rgb = renodx::color::correct::GammaSafe(o0.rgb, true);
  return;
}