// ---- Created with 3Dmigoto v1.3.16 on Fri May 09 12:08:03 2025

cbuffer cb_surface : register(b5)
{
  float4 fade_params : packoffset(c0);
  float4 surf_params : packoffset(c1);
  float4 surf_color : packoffset(c2) = {1,1,1,1};
  float4 surf_scale : packoffset(c3) = {1,1,1,1};
}

SamplerState s_wrap_aniso_s : register(s1);
Texture2D<float4> t_base : register(t0);
Texture2D<float4> t_bump : register(t1);
Texture2D<float4> t_detail : register(t2);


// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_Position0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD4,
  uint v5 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0,
  out float4 o1 : SV_Target1,
  out float4 o2 : SV_Target2)
{
  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = ddy_coarse(v2.zxy);
  r1.xyz = v3.yzx * r0.xyz;
  r0.xyz = r0.zxy * v3.zxy + -r1.xyz;
  r1.xyz = ddx_coarse(v2.yzx);
  r2.xyz = v3.zxy * r1.xyz;
  r1.xyz = v3.yzx * r1.yzx + -r2.xyz;
  r2.xy = ddy_coarse(v1.xy);
  r2.xzw = r2.xxx * r1.xyz;
  r1.xyz = r2.yyy * r1.xyz;
  r3.xy = ddx_coarse(v1.xy);
  r2.xyz = r0.xyz * r3.xxx + r2.xzw;
  r0.xyz = r0.xyz * r3.yyy + r1.xyz;
  r0.w = dot(r2.xyz, r2.xyz);
  r1.x = dot(r0.xyz, r0.xyz);
  r0.w = max(r1.x, r0.w);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r0.xyz = r0.xyz * r0.www;
  r2.x = dot(r1.xyz, v2.xyz);
  r2.y = dot(r0.xyz, v2.xyz);
  r2.z = dot(v3.xyz, v2.xyz);
  r0.w = dot(-r2.xyz, -r2.xyz);
  r0.w = rsqrt(r0.w);
  r2.xy = -r2.xy * r0.ww;
  r0.w = t_bump.Sample(s_wrap_aniso_s, v1.xy).w;
  r0.w = r0.w * 0.00999999978 + -0.00499999989;
  r2.xy = r0.ww * r2.xy;
  r0.w = saturate(v1.z);
  r2.xy = r0.ww * r2.xy + v1.xy;
  r3.xyzw = t_base.Sample(s_wrap_aniso_s, r2.xy).xyzw;
  r0.w = v1.w * r3.w + -0.5;
  r0.w = cmp(r0.w < 0);
  if (r0.w != 0) discard;
  r2.zw = float2(-0.00048828125,-0.00048828125) + r2.xy;
  r0.w = t_bump.Sample(s_wrap_aniso_s, r2.xw).w;
  r4.xyz = t_bump.Sample(s_wrap_aniso_s, r2.zy).xyw;
  r5.xyzw = float4(0.00048828125,0,0,0.00048828125) + r2.xyxy;
  r1.w = t_bump.Sample(s_wrap_aniso_s, r5.zw).w;
  r2.z = t_bump.Sample(s_wrap_aniso_s, r5.xy).w;
  r2.z = r4.z + -r2.z;
  r0.w = -r1.w + r0.w;
  r0.xyz = r0.xyz * r0.www;
  r0.xyz = r1.xyz * r2.zzz + r0.xyz;
  r0.xyz = v3.xyz * surf_params.zzz + r0.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.xyz = v5.xxx ? r0.xyz : -r0.xyz;
  r1.xyz = r0.xyz * r4.zzz;
  o1.xyz = r0.xyz;
  r0.xyz = r1.xyz * float3(0.0500000007,0.0500000007,0.0500000007) + v2.xyz;
  o0.z = surf_scale.w * r0.z;
  o0.xy = r0.xy;
  o0.w = v2.w;
  r0.x = t_bump.SampleBias(s_wrap_aniso_s, r2.xy, 3).y;
  r0.yz = surf_params.xy * r2.xy;
  r0.yzw = t_detail.Sample(s_wrap_aniso_s, r0.yz).xyz;
  o1.w = r0.x;
  r0.x = r4.x * 2 + -1;
  r1.x = max(0, r0.x);
  r1.y = 1 + -abs(r0.x);
  r1.z = max(0, -r0.x);
  r0.x = dot(r0.yzw, r1.xyz);
  r0.x = -0.5 + r0.x;
  r0.x = v1.z * r0.x + 0.5;
  o2.w = dot(r4.yy, r0.xx);
  r0.xyz = r3.xyz * r0.xxx;
  r0.xyz = surf_color.xyz * r0.xyz;
  o2.xyz = r0.xyz + r0.xyz;
  
  o0.w = saturate(o0.w);
  return;
}