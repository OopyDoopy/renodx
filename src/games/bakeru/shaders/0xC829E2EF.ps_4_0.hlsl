// ---- Created with 3Dmigoto v1.4.1 on Fri Mar 28 15:29:43 2025
Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s0_s : register(s0);

cbuffer cb0 : register(b0)
{
  float4 cb0[131];
}




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

  r0.xyzw = t1.SampleBias(s0_s, v1.xy, cb0[19].x).xyzw;
  r1.xyzw = t0.SampleBias(s0_s, v1.xy, cb0[19].x).xyzw;
  r0.xyz = -r1.xyz + r0.xyz;
  o0.xyz = cb0[130].xxx * r0.xyz + r1.xyz;
  o0.w = 1;
  return;
}