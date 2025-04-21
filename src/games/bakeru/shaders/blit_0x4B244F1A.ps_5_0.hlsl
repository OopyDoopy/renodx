// ---- Created with 3Dmigoto v1.4.1 on Fri Mar 28 14:16:51 2025
Texture2D<float4> t0 : register(t0);

SamplerState s0_s : register(s0);

cbuffer cb0 : register(b0)
{
  float4 cb0[128];
}




// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = 255 * v1.w;
  r0.x = round(r0.x);
  r0.w = 0.00392156886 * r0.x;
  r1.xyzw = t0.Sample(s0_s, v2.xy).xyzw;



  r0.xyz = v1.xyz;

  float3 untonemapped = r0.rgb;

  r2.xyzw = r1.xyzw * r0.xyzw;
  r0.xyz = -r0.xyz * r1.xyz + cb0[126].xyz;
  r0.xyz = cb0[127].xxx * r0.xyz + r2.xyz;
  o0.xyz = r0.xyz * r2.www;
  o0.w = r2.w;

  //o0.rgb = untonemapped;
  return;
}