#include "..\..\common.hlsl"
// ---- Created with 3Dmigoto v1.4.1 on Sat Mar 29 10:57:23 2025
Texture2D<float4> t3 : register(t3);

Texture2D<float4> t2 : register(t2);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s3_s : register(s3);

SamplerComparisonState s2_s : register(s2);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

cbuffer cb4 : register(b4)
{
  float4 cb4[7];
}

cbuffer cb3 : register(b3)
{
  float4 cb3[30];
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
  out uint o1 : SV_Target1)
{
  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = v7.yzx * v6.zxy;
  r0.xyz = v6.yzx * v7.zxy + -r0.xyz;
  r0.xyz = v7.www * r0.xyz;
  r1.xyz = t2.SampleBias(s1_s, v3.xy, cb0[19].x).xyw;
  r1.x = r1.z * r1.x;
  r1.xy = r1.xy * float2(2,2) + float2(-1,-1);
  r1.zw = cb2[17].ww * r1.xy;
  r0.w = dot(r1.xy, r1.xy);
  r0.w = min(1, r0.w);
  r0.w = 1 + -r0.w;
  r0.w = sqrt(r0.w);
  r0.w = max(1.00000002e-16, r0.w);
  r0.xyz = r1.www * r0.xyz;
  r0.xyz = r1.zzz * v7.xyz + r0.xyz;
  r0.xyz = r0.www * v6.xyz + r0.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.x = r0.y * r0.y;
  r1.x = r0.x * r0.x + -r1.x;
  r2.xyzw = r0.xyzz * r0.yzzx;
  r3.x = dot(cb1[28].xyzw, r2.xyzw);
  r3.y = dot(cb1[29].xyzw, r2.xyzw);
  r3.z = dot(cb1[30].xyzw, r2.xyzw);
  r1.xyz = cb1[31].xyz * r1.xxx + r3.xyz;
  r0.w = 1;
  r2.x = dot(cb1[25].xyzw, r0.xyzw);
  r2.y = dot(cb1[26].xyzw, r0.xyzw);
  r2.z = dot(cb1[27].xyzw, r0.xyzw);
  r0.x = dot(r0.xyz, cb0[5].xyz);
  r0.yzw = r2.xyz + r1.xyz;
  r0.xyzw = max(float4(0,0,0,0), r0.xyzw);
  r1.xyz = cb3[1].xyz * v2.yyy;
  r1.xyz = cb3[0].xyz * v2.xxx + r1.xyz;
  r1.xyz = cb3[2].xyz * v2.zzz + r1.xyz;
  r1.xyz = cb3[3].xyz + r1.xyz;
  r1.w = cmp(0 >= r1.z);
  r2.x = cmp(r1.z >= 1);
  r1.x = t3.SampleCmpLevelZero(s2_s, r1.xy, r1.z).x;
  r1.y = (int)r1.w | (int)r2.x;
  r1.z = 1 + -cb3[29].x;
  r1.x = r1.x * cb3[29].x + r1.z;
  r1.x = r1.y ? 1 : r1.x;
  r1.y = 1 + -r1.x;
  r2.xyz = -cb0[16].xyz + v2.xyz;
  r1.z = dot(r2.xyz, r2.xyz);
  r1.z = saturate(r1.z * cb3[29].z + cb3[29].w);
  r1.x = r1.z * r1.y + r1.x;
  r1.yzw = cb1[11].zzz * cb0[6].xyz;
  r1.xyz = r1.yzw * r1.xxx;
  r1.xyz = r1.xyz * r0.xxx;
  r1.xyz = cb2[22].zzz * r1.xyz;
  r0.x = asint(cb0[8].x) & asint(cb1[10].x);
  r0.x = (int)r0.x & 255;
  r1.xyz = r0.xxx ? r1.xyz : float3(0,0,0);
  r1.xyz = r1.xyz + r0.yzw;
  r0.x = dot(r0.yzw, float3(0.298999995,0.587000012,0.114));
  r0.x = min(1, r0.x);
  r2.xyzw = t1.SampleBias(s0_s, v3.xy, cb0[19].x).xyzw;
  r2.xyzw = cb2[6].xyzw * r2.xyzw;
  r0.yzw = v1.xyz * r2.xyz;
  r2.xyz = r0.yzw * r1.xyz + cb2[18].xyz;
  r0.yzw = r0.yzw * r1.xyz + -r2.xyz;
r0.xyz = HDRSaturate(r0.xxx * r0.yzw + r2.xyz);
  r1.xyz = cb4[2].xyz + v2.xyz;
  r1.zw = cb4[4].xy * r1.zz;
  r1.xz = cb4[3].xy * r1.xx + r1.zw;
  r1.xy = cb4[5].xy * r1.yy + r1.xz;
  r1.xy = cb4[6].xy + r1.xy;
  r1.xyzw = t0.Sample(s3_s, r1.xy).xyzw;
  r2.xyz = float3(1,1,1) + -cb4[1].xyz;
  r1.xyz = r2.xyz * r1.xyz;
  r0.w = cb4[1].w * r1.w;
  r1.xyz = -r1.xyz * r0.www + float3(1,1,1);
  r0.xyz = r0.xyz * r1.xyz + cb2[23].xyz;
  r0.xyz = -cb0[56].xyz + r0.xyz;
  o0.xyz = v3.zzz * r0.xyz + cb0[56].xyz;
  r0.x = cmp(cb2[0].x == 1.000000);
  o0.w = r0.x ? r2.w : 1;
  r0.x = cmp(0.200000003 < v6.y);
  r0.x = r0.x ? cb2[51].z : 1;
  r0.yz = cmp(asint(cb2[51].ww) == int2(1,2));
  r0.x = r0.y ? 0 : r0.x;
  o1.x = r0.z ? 1 : r0.x;
  return;
}