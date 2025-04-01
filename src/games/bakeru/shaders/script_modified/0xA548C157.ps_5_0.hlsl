#include "..\..\common.hlsl"
// ---- Created with 3Dmigoto v1.4.1 on Sat Mar 29 10:57:21 2025
Texture2D<float4> t3 : register(t3);

Texture2D<float4> t2 : register(t2);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerComparisonState s3_s : register(s3);

SamplerState s2_s : register(s2);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

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
  float4 cb1[12];
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
  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = cb3[1].xyz * v2.yyy;
  r0.xyz = cb3[0].xyz * v2.xxx + r0.xyz;
  r0.xyz = cb3[2].xyz * v2.zzz + r0.xyz;
  r0.xyz = cb3[3].xyz + r0.xyz;
  r0.w = cmp(0 >= r0.z);
  r1.x = cmp(r0.z >= 1);
  r0.x = t3.SampleCmpLevelZero(s3_s, r0.xy, r0.z).x;
  r0.y = (int)r0.w | (int)r1.x;
  r0.z = 1 + -cb3[29].x;
  r0.x = r0.x * cb3[29].x + r0.z;
  r0.x = r0.y ? 1 : r0.x;
  r0.y = 1 + -r0.x;
  r1.xyz = -cb0[16].xyz + v2.xyz;
  r0.z = dot(r1.xyz, r1.xyz);
  r0.z = saturate(r0.z * cb3[29].z + cb3[29].w);
  r0.x = r0.z * r0.y + r0.x;
  r0.yzw = cb1[11].zzz * cb0[6].xyz;
  r0.xyz = r0.yzw * r0.xxx;
  r0.w = dot(v6.xyz, cb0[5].xyz);
  r0.w = max(0, r0.w);
  r0.xyz = r0.www * r0.xyz;
  r0.xyz = cb2[22].zzz * r0.xyz;
  r0.w = asint(cb0[8].x) & asint(cb1[10].x);
  r0.w = (int)r0.w & 255;
  r0.xyz = r0.www ? r0.xyz : float3(0,0,0);
  r0.xyz = v5.xyz + r0.xyz;
  r1.xy = v6.xy * float2(0.5,0.5) + float2(0.5,0.5);
  r1.xyz = t0.Sample(s1_s, r1.xy).xyz;
  r1.xyz = cb2[17].xyz * r1.xyz;
  r0.w = t1.Sample(s2_s, v3.xy).w;
  r1.xyz = r1.xyz * r0.www;
  r2.xyzw = t2.SampleBias(s0_s, v3.xy, cb0[19].x).xyzw;
  r2.xyzw = cb2[6].xyzw * r2.xyzw;
  r2.xyz = v1.xyz * r2.xyz;
r0.xyz = HDRSaturate(r2.xyz * r0.xyz + r1.xyz);
  r0.xyz = cb2[23].xyz + r0.xyz;
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