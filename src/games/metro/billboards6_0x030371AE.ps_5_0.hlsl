// ---- Created with 3Dmigoto v1.3.16 on Fri May 09 13:43:59 2025

cbuffer cb_screen : register(b2)
{
  float4 rtdim : packoffset(c0);
  float4 depth_xform : packoffset(c1);
  float4 envmap_color : packoffset(c2);
  float4 sph_r[3] : packoffset(c3);
  float4 sph_g[3] : packoffset(c6);
  float4 sph_b[3] : packoffset(c9);
}

SamplerState s_wrap_tri_s : register(s2);
SamplerState s_clamp_bi_s : register(s6);
Texture2D<float4> t_base : register(t0);
TextureCube<float4> t_envmap : register(t1);
Texture2D<float4> t_rgbnoise : register(t2);


// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_Position0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = float2(2.5,2.5) * v1.xy;
  r0.x = t_rgbnoise.Sample(s_wrap_tri_s, r0.xy).y;
  r0.x = r0.x * 0.100000001 + 0.449999988;
  r0.yzw = t_envmap.Sample(s_clamp_bi_s, v2.xyz).xyz;
  r1.xyz = r0.yzw * r0.xxx;
  r1.xyz = r1.xyz + r1.xyz;
  r0.x = r0.y + r0.z;
  r0.x = r0.x + r0.w;
  r0.x = 0.333000004 * r0.x;
  r2.xyzw = t_base.Sample(s_wrap_tri_s, v1.xy).xyzw;
  r2.xy = r2.xy * float2(2,2) + float2(-1,-1);
  r1.w = abs(r2.x) + abs(r2.y);
  r1.w = min(1, r1.w);
  r1.w = 0.5 + r1.w;
  r2.x = saturate(-v2.w * 1.20000005 + 1.10000002);
  r0.x = r2.x * r1.w + r0.x;
  r1.xyz = r0.yzw * r0.xxx + r1.xyz;
  r0.yzw = saturate(float3(8,8,8) * r0.yzw);
  r1.xyz = r1.xyz + r0.xxx;
  r0.yzw = r0.yzw * float3(0.25,0.25,0.25) + r1.xyz;
  r0.yzw = v1.zzz + r0.yzw;
  r0.yzw = r2.xxx * float3(0.25,0.25,0.25) + r0.yzw;
  r0.x = r0.x * r0.y;
  r0.yzw = saturate(r0.yzw);
  o0.xyz = envmap_color.xyz * r0.yzw;
  r0.x = saturate(r0.x * r2.z);
  r0.x = v1.z * r0.x;
  o0.w = saturate(r0.x * r2.w);

  o0.w = saturate(o0.w);
  return;
}