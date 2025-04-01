#include "..\..\common.hlsl"
// ---- Created with 3Dmigoto v1.4.1 on Sat Mar 29 10:57:18 2025
Texture2D<float4> t8 : register(t8);

Texture2D<float4> t7 : register(t7);

Texture2D<float4> t6 : register(t6);

Texture2D<float4> t5 : register(t5);

Texture2D<float4> t4 : register(t4);

Texture2D<float4> t3 : register(t3);

Texture2D<float4> t2 : register(t2);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s8_s : register(s8);

SamplerComparisonState s7_s : register(s7);

SamplerState s6_s : register(s6);

SamplerState s5_s : register(s5);

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
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = t0.Sample(s2_s, v8.xy).w;
  r0.y = r0.x * cb2[6].w + -cb2[7].x;
  r0.x = cb2[6].w * r0.x;
  r0.y = cmp(r0.y < 0);
  if (r0.y != 0) discard;
  r0.yzw = v7.yzx * v6.zxy;
  r0.yzw = v6.yzx * v7.zxy + -r0.yzw;
  r0.yzw = v7.www * r0.yzw;
  r1.xyz = t7.SampleBias(s1_s, v3.xy, cb0[19].x).xyw;
  r1.x = r1.z * r1.x;
  r1.xy = r1.xy * float2(2,2) + float2(-1,-1);
  r2.xy = cb2[17].ww * r1.xy;
  r1.x = dot(r1.xy, r1.xy);
  r1.x = min(1, r1.x);
  r1.x = 1 + -r1.x;
  r1.x = sqrt(r1.x);
  r2.z = max(1.00000002e-16, r1.x);
  r0.yzw = r2.yyy * r0.yzw;
  r0.yzw = r2.xxx * v7.xyz + r0.yzw;
  r0.yzw = r2.zzz * v6.xyz + r0.yzw;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.x = rsqrt(r1.x);
  r1.xyz = r1.xxx * r0.yzw;
  r0.y = r1.y * r1.y;
  r0.y = r1.x * r1.x + -r0.y;
  r3.xyzw = r1.xyzz * r1.yzzx;
  r4.x = dot(cb1[28].xyzw, r3.xyzw);
  r4.y = dot(cb1[29].xyzw, r3.xyzw);
  r4.z = dot(cb1[30].xyzw, r3.xyzw);
  r0.yzw = cb1[31].xyz * r0.yyy + r4.xyz;
  r1.w = 1;
  r3.x = dot(cb1[25].xyzw, r1.xyzw);
  r3.y = dot(cb1[26].xyzw, r1.xyzw);
  r3.z = dot(cb1[27].xyzw, r1.xyzw);
  r1.x = dot(r1.xyz, cb0[5].xyz);
  r1.x = max(0, r1.x);
  r0.yzw = r3.xyz + r0.yzw;
  r0.yzw = max(float3(0,0,0), r0.yzw);
  r1.yzw = cb3[1].xyz * v2.yyy;
  r1.yzw = cb3[0].xyz * v2.xxx + r1.yzw;
  r1.yzw = cb3[2].xyz * v2.zzz + r1.yzw;
  r1.yzw = cb3[3].xyz + r1.yzw;
  r2.w = cmp(0 >= r1.w);
  r3.x = cmp(r1.w >= 1);
  r1.y = t8.SampleCmpLevelZero(s7_s, r1.yz, r1.w).x;
  r1.z = (int)r2.w | (int)r3.x;
  r1.w = 1 + -cb3[29].x;
  r1.y = r1.y * cb3[29].x + r1.w;
  r1.y = r1.z ? 1 : r1.y;
  r1.z = 1 + -r1.y;
  r3.xyz = -cb0[16].xyz + v2.xyz;
  r1.w = dot(r3.xyz, r3.xyz);
  r1.w = saturate(r1.w * cb3[29].z + cb3[29].w);
  r1.y = r1.w * r1.z + r1.y;
  r3.xyz = cb1[11].zzz * cb0[6].xyz;
  r1.yzw = r3.xyz * r1.yyy;
  r1.xyz = r1.xxx * r1.yzw;
  r1.xyz = cb2[22].zzz * r1.xyz;
  r1.w = asint(cb0[8].x) & asint(cb1[10].x);
  r1.w = (int)r1.w & 255;
  r1.xyz = r1.www ? r1.xyz : float3(0,0,0);
  r0.yzw = r1.xyz + r0.yzw;
  r1.xyz = t6.SampleBias(s0_s, v3.xy, cb0[19].x).xyz;
  r1.xyz = cb2[6].xyz * r1.xyz;
  r1.xyz = v1.xyz * r1.xyz;
  r1.xyz = r1.xyz * r0.xxx;
  r1.w = dot(r2.xyz, r2.xyz);
  r1.w = rsqrt(r1.w);
  r2.xyz = r2.xyz * r1.www;
  r3.x = dot(v12.xyz, r2.xyz);
  r3.y = dot(v13.xyz, r2.xyz);
  r2.xy = r3.xy * float2(0.5,0.5) + float2(0.5,0.5);
  r2.xyz = t1.Sample(s3_s, r2.xy).xyz;
  r2.xyz = cb2[17].xyz * r2.xyz;
  r1.w = t2.Sample(s4_s, v3.xy).w;
  r2.xyz = r2.xyz * r1.www;
r0.yzw = HDRSaturate(r1.xyz * r0.yzw + r2.xyz);
  r1.xyz = log2(abs(cb2[21].xyz));
  r1.xyz = float3(0.454545468,0.454545468,0.454545468) * r1.xyz;
  r1.xyz = exp2(r1.xyz);
  r2.xyz = t5.Sample(s5_s, v3.xy).xyz;
  r1.xyz = r2.xyz * r1.xyz;
  r1.w = exp2(cb2[22].x);
  r1.xyz = r1.xyz * r1.www;
  r2.x = cb2[22].y * cb0[11].y;
  r2.y = 0.5;
  r1.w = t4.Sample(s6_s, r2.xy).w;
  r1.xyz = r1.xyz * r1.www;
  r2.xyz = cb4[2].xyz + v2.xyz;
  r2.zw = cb4[4].xy * r2.zz;
  r2.xz = cb4[3].xy * r2.xx + r2.zw;
  r2.xy = cb4[5].xy * r2.yy + r2.xz;
  r2.xy = cb4[6].xy + r2.xy;
  r2.xyzw = t3.Sample(s8_s, r2.xy).xyzw;
  r3.xyz = float3(1,1,1) + -cb4[1].xyz;
  r2.xyz = r3.xyz * r2.xyz;
  r1.w = cb4[1].w * r2.w;
  r2.xyz = -r2.xyz * r1.www + float3(1,1,1);
  r0.yzw = r0.yzw * r2.xyz + r1.xyz;
  r0.yzw = cb2[23].xyz + r0.yzw;
  r0.yzw = -cb0[56].xyz + r0.yzw;
  o0.xyz = v3.zzz * r0.yzw + cb0[56].xyz;
  r0.y = cmp(cb2[0].x == 1.000000);
  o0.w = r0.y ? r0.x : 1;
  r0.x = cmp(0.200000003 < v6.y);
  r0.x = r0.x ? cb2[51].z : 1;
  r0.yz = cmp(asint(cb2[51].ww) == int2(1,2));
  r0.x = r0.y ? 0 : r0.x;
  o1.x = r0.z ? 1 : r0.x;
  return;
}