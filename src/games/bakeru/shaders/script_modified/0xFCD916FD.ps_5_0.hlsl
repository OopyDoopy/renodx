#include "..\..\common.hlsl"
// ---- Created with 3Dmigoto v1.4.1 on Sat Mar 29 10:57:24 2025
Texture2D<float4> t4 : register(t4);

Texture2D<float4> t3 : register(t3);

Texture2D<float4> t2 : register(t2);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s3_s : register(s3);

SamplerState s2_s : register(s2);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

cbuffer cb2 : register(b2)
{
  float4 cb2[7];
}

cbuffer cb1 : register(b1)
{
  float4 cb1[52];
}

cbuffer cb0 : register(b0)
{
  float4 cb0[57];
}




// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : TEXCOORD0,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float2 v5 : TEXCOORD3,
  float w5 : TEXCOORD12,
  float4 v6 : TEXCOORD4,
  float4 v7 : TEXCOORD5,
  float4 v8 : TEXCOORD6,
  float4 v9 : TEXCOORD7,
  float4 v10 : TEXCOORD8,
  float4 v11 : TEXCOORD9,
  float4 v12 : TEXCOORD10,
  float3 v13 : TEXCOORD11,
  out float4 o0 : SV_Target0,
  out uint o1 : SV_Target1)
{
  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t4.SampleBias(s1_s, v3.xy, cb0[19].x).xyzw;
  r1.x = r0.w * cb1[6].w + -cb1[7].x;
  r0.xyzw = cb1[6].xyzw * r0.xyzw;
  r1.x = cmp(r1.x < 0);
  if (r1.x != 0) discard;
  r1.xyzw = t3.SampleBias(s0_s, v5.xy, cb0[19].x).xyzw;
  r1.xyz = float3(-0.5,-0.5,-0.5) + r1.xyz;
  r1.w = max(9.99999975e-05, r1.w);
  r1.x = dot(v6.xyz, r1.xyz);
  r1.x = 0.5 + r1.x;
  r2.xyz = t2.SampleBias(s0_s, v5.xy, cb0[19].x).xyz;
  r1.xyz = r2.xyz * r1.xxx;
  r1.xyz = r1.xyz / r1.www;
  r0.xyz = v1.xyz * r0.xyz;
  r2.xyz = r0.xyz * r1.xyz + cb1[18].xyz;
  r0.xyz = r0.xyz * r1.xyz + -r2.xyz;
  r1.x = saturate(dot(r1.xyz, float3(0.298999995,0.587000012,0.114)));
r0.xyz = HDRSaturate(r1.xxx * r0.xyz + r2.xyz);
  r1.xyz = t0.Sample(s2_s, v9.xy).xyz;
  r1.xyz = cb1[14].xyz * r1.xyz;
  r2.xyz = t0.Sample(s2_s, v9.zw).xyz;
  r0.xyz = r1.xyz * r2.xyz + r0.xyz;
  r1.xyz = cb2[2].xyz + v2.xyz;
  r1.zw = cb2[4].xy * r1.zz;
  r1.xz = cb2[3].xy * r1.xx + r1.zw;
  r1.xy = cb2[5].xy * r1.yy + r1.xz;
  r1.xy = cb2[6].xy + r1.xy;
  r1.xyzw = t1.Sample(s3_s, r1.xy).xyzw;
  r2.xyz = float3(1,1,1) + -cb2[1].xyz;
  r1.xyz = r2.xyz * r1.xyz;
  r1.w = cb2[1].w * r1.w;
  r1.xyz = -r1.xyz * r1.www + float3(1,1,1);
  r0.xyz = r0.xyz * r1.xyz + cb1[23].xyz;
  r0.xyz = -cb0[56].xyz + r0.xyz;
  o0.xyz = v3.zzz * r0.xyz + cb0[56].xyz;
  r0.x = cmp(cb1[0].x == 1.000000);
  o0.w = r0.x ? r0.w : 1;
  r0.x = cmp(0.200000003 < v6.y);
  r0.x = r0.x ? cb1[51].z : 1;
  r0.yz = cmp(asint(cb1[51].ww) == int2(1,2));
  r0.x = r0.y ? 0 : r0.x;
  o1.x = r0.z ? 1 : r0.x;
  return;
}