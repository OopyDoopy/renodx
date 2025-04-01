#include "..\..\common.hlsl"
// ---- Created with 3Dmigoto v1.4.1 on Sat Mar 29 10:57:23 2025
Texture2D<float4> t6 : register(t6);

Texture2D<float4> t5 : register(t5);

Texture2D<float4> t4 : register(t4);

Texture2D<float4> t3 : register(t3);

Texture2D<float4> t2 : register(t2);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s6_s : register(s6);

SamplerComparisonState s5_s : register(s5);

SamplerState s4_s : register(s4);

SamplerState s3_s : register(s3);

SamplerState s2_s : register(s2);

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

  r0.xyz = t5.SampleBias(s4_s, v4.xy, cb0[19].x).xyw;
  r0.x = r0.z * r0.x;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r0.z = dot(r0.xy, r0.xy);
  r1.xz = cb2[38].ww * r0.xy;
  r0.x = min(1, r0.z);
  r0.x = 1 + -r0.x;
  r0.x = sqrt(r0.x);
  r1.y = max(1.00000002e-16, r0.x);
  r0.x = r1.y * r1.y;
  r0.x = r1.x * r1.x + -r0.x;
  r2.xyzw = r1.xyzz * r1.yzzx;
  r3.x = dot(cb1[28].xyzw, r2.xyzw);
  r3.y = dot(cb1[29].xyzw, r2.xyzw);
  r3.z = dot(cb1[30].xyzw, r2.xyzw);
  r0.xyz = cb1[31].xyz * r0.xxx + r3.xyz;
  r1.w = 1;
  r2.x = dot(cb1[25].xyzw, r1.xyzw);
  r2.y = dot(cb1[26].xyzw, r1.xyzw);
  r2.z = dot(cb1[27].xyzw, r1.xyzw);
  r0.xyz = r2.xyz + r0.xyz;
  r2.xyz = cb3[1].xyz * v2.yyy;
  r2.xyz = cb3[0].xyz * v2.xxx + r2.xyz;
  r2.xyz = cb3[2].xyz * v2.zzz + r2.xyz;
  r2.xyz = cb3[3].xyz + r2.xyz;
  r0.w = cmp(0 >= r2.z);
  r1.w = cmp(r2.z >= 1);
  r2.x = t6.SampleCmpLevelZero(s5_s, r2.xy, r2.z).x;
  r0.w = (int)r0.w | (int)r1.w;
  r1.w = 1 + -cb3[29].x;
  r1.w = r2.x * cb3[29].x + r1.w;
  r0.w = r0.w ? 1 : r1.w;
  r1.w = 1 + -r0.w;
  r2.xyz = -cb0[16].xyz + v2.xyz;
  r2.x = dot(r2.xyz, r2.xyz);
  r2.x = saturate(r2.x * cb3[29].z + cb3[29].w);
  r0.w = r2.x * r1.w + r0.w;
  r2.xyz = cb1[11].zzz * cb0[6].xyz;
  r2.xyz = r2.xyz * r0.www;
  r0.w = dot(r1.xyz, cb0[5].xyz);
  r0.xyzw = max(float4(0,0,0,0), r0.xyzw);
  r2.xyz = r0.www * r2.xyz;
  r2.xyz = cb2[22].zzz * r2.xyz;
  r0.w = asint(cb0[8].x) & asint(cb1[10].x);
  r0.w = (int)r0.w & 255;
  r2.xyz = r0.www ? r2.xyz : float3(0,0,0);
  r2.xyz = r2.xyz + r0.xyz;
  r0.x = dot(r0.xyz, float3(0.298999995,0.587000012,0.114));
  r0.x = min(1, r0.x);
  r3.xyzw = t4.SampleBias(s1_s, v4.xy, cb0[19].x).xyzw;
  r0.yzw = cb2[27].xyz * r3.xyz;
  r1.w = cb2[6].w * r3.w;
  r0.yzw = v1.xyz * r0.yzw;
  r3.xyz = r0.yzw * r2.xyz;
  r3.xyz = cb2[39].xyz * r3.xyz;
  r0.yzw = r0.yzw * r2.xyz + -r3.xyz;
  r0.xyz = r0.xxx * r0.yzw + r3.xyz;
  r2.x = dot(v12.xzy, r1.xyz);
  r2.y = dot(v13.xzy, r1.xyz);
  r1.xy = r2.xy * float2(0.5,0.5) + float2(0.5,0.5);
  r1.xyz = t0.Sample(s2_s, r1.xy).xyz;
  r1.xyz = cb2[38].xyz * r1.xyz;
  r2.xy = t1.Sample(s3_s, v4.xy).zw;
r0.xyz = HDRSaturate(r1.xyz * r2.yyy + r0.xyz);
  r1.xyz = t2.Sample(s0_s, v9.xy).xyz;
  r1.xyz = cb2[14].xyz * r1.xyz;
  r2.yzw = t2.Sample(s0_s, v9.zw).xyz;
  r1.xyz = r2.yzw * r1.xyz;
  r0.xyz = r1.xyz * r2.xxx + r0.xyz;
  r1.xyz = cb4[2].xyz + v2.xyz;
  r2.xy = cb4[4].xy * r1.zz;
  r1.xz = cb4[3].xy * r1.xx + r2.xy;
  r1.xy = cb4[5].xy * r1.yy + r1.xz;
  r1.xy = cb4[6].xy + r1.xy;
  r2.xyzw = t3.Sample(s6_s, r1.xy).xyzw;
  r1.xyz = float3(1,1,1) + -cb4[1].xyz;
  r1.xyz = r2.xyz * r1.xyz;
  r0.w = cb4[1].w * r2.w;
  r1.xyz = -r1.xyz * r0.www + float3(1,1,1);
  r0.xyz = r0.xyz * r1.xyz + cb2[23].xyz;
  r0.xyz = -cb0[56].xyz + r0.xyz;
  o0.xyz = v3.zzz * r0.xyz + cb0[56].xyz;
  r0.x = cmp(cb2[0].x == 1.000000);
  o0.w = r0.x ? r1.w : 1;
  r0.x = cmp(0.200000003 < v6.y);
  r0.x = r0.x ? cb2[51].z : 1;
  r0.yz = cmp(asint(cb2[51].ww) == int2(1,2));
  r0.x = r0.y ? 0 : r0.x;
  o1.x = r0.z ? 1 : r0.x;
  return;
}