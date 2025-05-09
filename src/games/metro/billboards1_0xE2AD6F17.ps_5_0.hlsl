// ---- Created with 3Dmigoto v1.3.16 on Fri May 09 11:06:41 2025

cbuffer cb_surface : register(b5)
{
  float4 fade_params : packoffset(c0);
  float4 surf_params : packoffset(c1);
  float4 surf_color : packoffset(c2) = {1,1,1,1};
  float4 surf_scale : packoffset(c3) = {1,1,1,1};
}

SamplerState s_wrap_tri_s : register(s2);
Texture2D<float4> t_base : register(t0);


// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_Position0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD7,
  out float4 o0 : SV_Target0,
  out float4 o1 : SV_Target1,
  out float4 o2 : SV_Target2)
{
  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t_base.Sample(s_wrap_tri_s, v1.xy).xyzw;
  r0.w = r0.w * v4.w + -0.5;
  r0.xyz = v4.xyz * r0.xyz;
  o2.xyz = r0.xyz;
  r0.x = cmp(r0.w < 0);
  if (r0.x != 0) discard;
  r0.x = dot(v3.xyz, v3.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = v3.xyz * r0.xxx;
  r1.xyz = r0.xyz * float3(0.0250000004,0.0250000004,0.0250000004) + v2.xyz;
  o1.xyz = r0.xyz;
  o0.z = surf_scale.w * r1.z;
  o0.xy = r1.xy;
  o0.w = v2.w;
  o1.w = 0.5;
  o2.w = 0.00392156886;
  o0.w = saturate(o0.w);
  return;
}