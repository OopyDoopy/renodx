// ---- Created with 3Dmigoto v1.3.16 on Fri May 09 12:31:53 2025

cbuffer cb_surface : register(b5)
{
  float4 fade_params : packoffset(c0);
  float4 surf_params : packoffset(c1);
  float4 surf_color : packoffset(c2) = {1,1,1,1};
  float4 surf_scale : packoffset(c3) = {1,1,1,1};
}

SamplerState s_wrap_aniso_s : register(s1);
SamplerState s_wrap_tri_s : register(s2);
Texture2D<float4> t_base : register(t0);
Texture2D<float4> t_bump : register(t1);


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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t_base.Sample(s_wrap_tri_s, v1.xy).xyzw;
  r0.w = v4.w + r0.w;
  r0.xyz = v4.xyz * r0.xyz;
  r0.w = r0.w * 0.5 + -0.5;
  r0.w = cmp(r0.w < 0);
  if (r0.w != 0) discard;
  r1.xyz = ddy_coarse(v2.zxy);
  r2.xyz = v3.yzx * r1.xyz;
  r1.xyz = r1.zxy * v3.zxy + -r2.xyz;
  r2.xyz = ddx_coarse(v2.yzx);
  r3.xyz = v3.zxy * r2.xyz;
  r2.xyz = v3.yzx * r2.yzx + -r3.xyz;
  r3.xy = ddy_coarse(v1.xy);
  r3.xzw = r3.xxx * r2.xyz;
  r2.xyz = r3.yyy * r2.xyz;
  r4.xy = ddx_coarse(v1.xy);
  r3.xyz = r1.xyz * r4.xxx + r3.xzw;
  r1.xyz = r1.xyz * r4.yyy + r2.xyz;
  r0.w = dot(r3.xyz, r3.xyz);
  r1.w = dot(r1.xyz, r1.xyz);
  r0.w = max(r1.w, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r2.xyz = r3.xyz * r0.www;
  r3.x = dot(r2.xyz, v2.xyz);
  r3.y = dot(r1.xyz, v2.xyz);
  r3.z = dot(v3.xyz, v2.xyz);
  r0.w = dot(-r3.xyz, -r3.xyz);
  r0.w = rsqrt(r0.w);
  r3.xy = -r3.xy * r0.ww;
  r0.w = t_bump.Sample(s_wrap_aniso_s, v1.xy).w;
  r0.w = r0.w * 0.00999999978 + -0.00499999989;
  r3.xy = r0.ww * r3.xy + v1.xy;
  r3.zw = float2(-0.00048828125,-0.00048828125) + r3.xy;
  r0.w = t_bump.Sample(s_wrap_aniso_s, r3.xw).w;
  r3.zw = t_bump.Sample(s_wrap_aniso_s, r3.zy).yw;
  r4.xyzw = float4(0.00048828125,0,0,0.00048828125) + r3.xyxy;
  r1.w = t_bump.Sample(s_wrap_aniso_s, r4.zw).w;
  r2.w = t_bump.Sample(s_wrap_aniso_s, r4.xy).w;
  r2.w = r3.w + -r2.w;
  r0.w = -r1.w + r0.w;
  r1.xyz = r1.xyz * r0.www;
  r1.xyz = r2.xyz * r2.www + r1.xyz;
  r1.xyz = v3.xyz * surf_params.zzz + r1.xyz;
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r1.xyz * r0.www;
  r2.xyz = r1.xyz * r3.www;
  o1.xyz = r1.xyz;
  r1.xyz = r2.xyz * float3(0.0500000007,0.0500000007,0.0500000007) + v2.xyz;
  o0.z = surf_scale.w * r1.z;
  o0.xy = r1.xy;
  o0.w = v2.w;
  r0.w = t_bump.SampleBias(s_wrap_aniso_s, r3.xy, 3).y;
  r1.x = t_base.Sample(s_wrap_aniso_s, r3.xy).w;
  o1.w = r0.w;
  r0.w = 1 + -v4.w;
  r1.yz = -v4.ww * float2(0.00999999978,0.00999999978) + float2(0.00999999978,0.0149999997);
  r1.w = -r1.y * 0.5 + r0.w;
  r0.w = r1.y * 0.5 + r0.w;
  r0.w = r1.x + -r0.w;
  r0.w = v4.w * r0.w;
  r0.w = saturate(50 * r0.w);
  r1.y = r1.x + -r1.w;
  r1.y = v4.w * r1.y;
  r1.y = saturate(3200 * r1.y);
  r0.w = r1.y + -r0.w;
  r0.w = max(0, r0.w);
  r1.yw = float2(-0.5,-0.75) + v4.ww;
  r2.xy = -r1.yw * float2(2,2) + float2(1,1);
  r1.w = -r1.z * 0.5 + r2.x;
  r1.z = r1.z * 0.5 + r2.x;
  r1.zw = r1.xx + -r1.zw;
  r1.z = v4.w * r1.z;
  r1.z = saturate(25 * r1.z);
  r2.x = 50 * v4.w;
  r1.w = saturate(r2.x * r1.w);
  r1.z = r1.w + -r1.z;
  r0.w = r1.z * 0.333333343 + r0.w;
  r1.z = -r1.y * 0.0199999996 + 0.0199999996;
  r1.w = -r1.z * 0.5 + r2.y;
  r1.z = r1.z * 0.5 + r2.y;
  r1.z = r1.x + -r1.z;
  r1.x = r1.x + -r1.w;
  r1.z = r1.y * r1.z;
  r1.y = 20 * r1.y;
  r1.x = saturate(r1.x * r1.y);
  r1.y = saturate(10 * r1.z);
  r1.x = r1.x + -r1.y;
  r0.w = r1.x * 0.25 + r0.w;
  r1.xyz = r0.xyz * r0.www;
  o2.w = r0.w * r3.z + r3.z;
  o2.xyz = r1.xyz * float3(0.5,0.5,0.5) + r0.xyz;

  o0.w = saturate(o0.w);
  return;
}