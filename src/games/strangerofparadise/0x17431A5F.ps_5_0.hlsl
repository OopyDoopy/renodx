// ---- Created with 3Dmigoto v1.4.1 on Thu Feb  6 20:00:28 2025

Texture2D<float4> tTex : register(t0);


// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_Position0,
  float4 v1 : COLOR0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = (int2)v0.xy;
  r0.zw = float2(0,0);
  o0.xyzw = tTex.Load(r0.xyz).xyzw;
  return;
}