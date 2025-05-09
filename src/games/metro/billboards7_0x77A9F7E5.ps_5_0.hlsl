// ---- Created with 3Dmigoto v1.3.16 on Fri May 09 13:51:30 2025

cbuffer cb_main_matrices1 : register(b1)
{
  row_major float3x4 m_V : packoffset(c0);
  row_major float3x4 m_iV : packoffset(c3);
  row_major float4x4 m_P : packoffset(c6);
  row_major float4x4 m_iP : packoffset(c10);
  row_major float4x4 m_VP : packoffset(c14);
  row_major float4x4 m_iVP : packoffset(c18);
}

cbuffer cb_screen : register(b2)
{
  float4 rtdim : packoffset(c0);
  float4 depth_xform : packoffset(c1);
  float4 envmap_color : packoffset(c2);
  float4 sph_r[3] : packoffset(c3);
  float4 sph_g[3] : packoffset(c6);
  float4 sph_b[3] : packoffset(c9);
}

cbuffer cb_misc_1 : register(b4)
{
  float4 eye_position : packoffset(c0);
  float4 timers : packoffset(c1);
  float4 clipplanes[6] : packoffset(c2);
}

SamplerState s_wrap_tri_s : register(s2);
SamplerState s_clamp_none_s : register(s7);
Texture2D<float4> t_base : register(t0);
Texture2D<float> t_zbuffer : register(t1);


// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_Position0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = float2(0.0199999996,-0.0309999995) * timers.xx;
  r1.xyz = v2.xyz;
  r1.w = 1;
  r2.x = dot(m_iV._m00_m01_m02_m03, r1.xyzw);
  r2.y = dot(m_iV._m20_m21_m22_m23, r1.xyzw);
  r0.xyzw = r2.xyxy * float4(0.275000006,0.275000006,0.234999999,0.234999999) + r0.xxyy;
  r0.x = t_base.Sample(s_wrap_tri_s, r0.xy).w;
  r0.y = t_base.Sample(s_wrap_tri_s, r0.zw).w;
  r0.x = r0.x + -r0.y;
  r0.x = 0.100000001 + abs(r0.x);
  r0.yz = t_base.Sample(s_wrap_tri_s, v1.xy).yw;
  r0.x = r0.y * r0.x;
  r0.x = v1.w * r0.x;
  r0.y = saturate(-1 + v2.z);
  r0.x = r0.x * r0.y;
  o0.xyz = float3(0.400000006,0.400000006,0.400000006) * r0.xxx;
  r0.xy = rtdim.xy * v0.xy;
  r0.x = t_zbuffer.Sample(s_clamp_none_s, r0.xy).x;
  r0.x = depth_xform.x * r0.x + depth_xform.y;
  r0.x = 1 / r0.x;
  r0.x = -v2.z + r0.x;
  r0.x = saturate(r0.x + r0.x);
  r0.x = saturate(v2.w * r0.x);
  o0.w = r0.z * r0.x;

  o0.w = saturate(o0.w);
  return;
}