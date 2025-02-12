// ---- Created with 3Dmigoto v1.3.16 on Sat Feb 08 16:59:13 2025

SamplerState s_clamp_tri_s : register(s5);
Texture2D<float4> t_base : register(t0);


// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_Position0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD2,
  out float4 o0 : SV_Target0)
{
  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t_base.Sample(s_clamp_tri_s, v1.xy).xyzw;
  r0.xyzw = v2.zyxw * r0.xyzw;
  o0.xyz = r0.xyz * r0.www;
  o0.w = r0.w;
  return;
}