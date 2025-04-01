#include "..\..\common.hlsl"
// ---- Created with 3Dmigoto v1.4.1 on Sat Mar 29 10:57:24 2025
Texture2D<float4> t5 : register(t5);

Texture2D<float4> t4 : register(t4);

Texture2D<float4> t3 : register(t3);

Texture2D<float4> t2 : register(t2);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s5_s : register(s5);

SamplerState s4_s : register(s4);

SamplerState s3_s : register(s3);

SamplerState s2_s : register(s2);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

cbuffer cb3 : register(b3)
{
  float4 cb3[1];
}

cbuffer cb2 : register(b2)
{
  float4 cb2[52];
}

cbuffer cb1 : register(b1)
{
  float4 cb1[32];
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
  float3 v2 : TEXCOORD0,
  float w2 : TEXCOORD12,
  float4 v3 : TEXCOORD1,
  float4 v4 : TEXCOORD2,
  float4 v5 : TEXCOORD3,
  float4 v6 : TEXCOORD4,
  float4 v7 : TEXCOORD5,
  float4 v8 : TEXCOORD6,
  float4 v9 : TEXCOORD7,
  float4 v10 : TEXCOORD8,
  float4 v11 : TEXCOORD9,
  float4 v12 : TEXCOORD10,
  float3 v13 : TEXCOORD11,
  out float4 o0 : SV_Target0,
  out uint o1 : SV_Target1,
  out float oDepthLE : SV_DepthLessEqual)
{
  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v0.xy / cb3[0].xx;
  r0.xyzw = t5.SampleBias(s5_s, r0.xy, cb0[19].x).xyzw;
  r0.x = r0.x + r0.y;
  r0.x = r0.x + r0.z;
  r0.x = r0.x * 0.333333343 + r0.w;
  r0.x = 0.5 * r0.x;
  r0.y = cb2[51].x * cb1[8].x;
  r0.y = cmp(r0.y >= 0);
  r0.x = r0.y ? abs(r0.x) : -abs(r0.x);
  r0.x = cb2[51].x * cb1[8].x + -r0.x;
  r0.x = -0.00999999978 + r0.x;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.xyzw = t3.SampleBias(s0_s, v3.xy, cb0[19].x).xyzw;
  r1.x = r0.w * cb2[6].w + -cb2[7].x;
  r0.xyzw = cb2[6].xyzw * r0.xyzw;
  r1.x = cmp(r1.x < 0);
  if (r1.x != 0) discard;
  r1.xyz = v7.yzx * v6.zxy;
  r1.xyz = v6.yzx * v7.zxy + -r1.xyz;
  r1.xyz = v7.www * r1.xyz;
  r2.xyz = t4.SampleBias(s1_s, v3.xy, cb0[19].x).xyw;
  r2.x = r2.z * r2.x;
  r2.xy = r2.xy * float2(2,2) + float2(-1,-1);
  r3.xy = cb2[17].ww * r2.xy;
  r1.w = dot(r2.xy, r2.xy);
  r1.w = min(1, r1.w);
  r1.w = 1 + -r1.w;
  r1.w = sqrt(r1.w);
  r3.z = max(1.00000002e-16, r1.w);
  r1.xyz = r3.yyy * r1.xyz;
  r1.xyz = r3.xxx * v7.xyz + r1.xyz;
  r1.xyz = r3.zzz * v6.xyz + r1.xyz;
  r1.w = dot(r1.xyz, r1.xyz);
  r1.w = rsqrt(r1.w);
  r1.xyz = r1.xyz * r1.www;
  r2.x = r1.y * r1.y;
  r2.x = r1.x * r1.x + -r2.x;
  r4.xyzw = r1.xyzz * r1.yzzx;
  r5.x = dot(cb1[28].xyzw, r4.xyzw);
  r5.y = dot(cb1[29].xyzw, r4.xyzw);
  r5.z = dot(cb1[30].xyzw, r4.xyzw);
  r2.xyz = cb1[31].xyz * r2.xxx + r5.xyz;
  r1.w = 1;
  r4.x = dot(cb1[25].xyzw, r1.xyzw);
  r4.y = dot(cb1[26].xyzw, r1.xyzw);
  r4.z = dot(cb1[27].xyzw, r1.xyzw);
  r1.xyz = r4.xyz + r2.xyz;
  r1.xyz = max(float3(0,0,0), r1.xyz);
  r0.xyz = v1.xyz * r0.xyz;
  r2.xyz = r0.xyz * r1.xyz + cb2[18].xyz;
  r0.xyz = r0.xyz * r1.xyz + -r2.xyz;
  r1.x = dot(r1.xyz, float3(0.298999995,0.587000012,0.114));
  r1.x = min(1, r1.x);
  r0.xyz = r1.xxx * r0.xyz + r2.xyz;
  r1.x = dot(r3.xyz, r3.xyz);
  r1.x = rsqrt(r1.x);
  r1.xyz = r3.xyz * r1.xxx;
  r2.x = dot(v12.xyz, r1.xyz);
  r2.y = dot(v13.xyz, r1.xyz);
  r1.xy = r2.xy * float2(0.5,0.5) + float2(0.5,0.5);
  r1.xyz = t0.Sample(s3_s, r1.xy).xyz;
  r1.xyz = cb2[17].xyz * r1.xyz;
  r1.w = t1.Sample(s4_s, v3.xy).w;
r0.xyz = HDRSaturate(r1.xyz * r1.www + r0.xyz);
  r0.xyz = cb2[23].xyz + r0.xyz;
  r0.xyz = -cb0[56].xyz + r0.xyz;
  o0.xyz = v3.zzz * r0.xyz + cb0[56].xyz;
  r0.x = cmp(cb2[0].x == 1.000000);
  o0.w = r0.x ? r0.w : 1;
  r0.x = cmp(0.200000003 < v6.y);
  r0.x = r0.x ? cb2[51].z : 1;
  r0.yz = cmp(asint(cb2[51].ww) == int2(1,2));
  r0.x = r0.y ? 0 : r0.x;
  o1.x = r0.z ? 1 : r0.x;
  r0.xy = v3.xy * cb2[11].xy + cb2[11].zw;
  r0.xy = cb2[12].xx * r0.xy;
  r0.x = t2.Sample(s2_s, r0.xy).x;
  r0.y = cb0[20].z * v0.z + cb0[20].w;
  r0.y = 1 / r0.y;
  r0.x = r0.x * cb2[12].y + r0.y;
  r0.y = cb0[20].z * r0.x;
  r0.x = -cb0[20].w * r0.x + 1;
  oDepthLE = r0.x / r0.y;
  return;
}