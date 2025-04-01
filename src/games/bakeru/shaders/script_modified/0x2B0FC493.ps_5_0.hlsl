#include "..\..\common.hlsl"
// ---- Created with 3Dmigoto v1.4.1 on Sat Mar 29 10:57:18 2025
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

  r0.xyzw = t5.SampleBias(s0_s, v3.xy, cb0[19].x).xyzw;
  r1.x = r0.w * cb1[6].w + -cb1[7].x;
  r0.xyzw = cb1[6].xyzw * r0.xyzw;
  r1.x = cmp(r1.x < 0);
  if (r1.x != 0) discard;
  r1.xyz = log2(abs(cb1[21].xyz));
  r1.xyz = float3(0.454545468,0.454545468,0.454545468) * r1.xyz;
  r1.xyz = exp2(r1.xyz);
  r2.xyz = t4.Sample(s3_s, v3.xy).xyz;
  r1.xyz = r2.xyz * r1.xyz;
  r1.w = exp2(cb1[22].x);
  r1.xyz = r1.xyz * r1.www;
  r2.x = cb1[22].y * cb0[11].y;
  r2.y = 0.5;
  r1.w = t3.Sample(s4_s, r2.xy).w;
  r1.xyz = r1.xyz * r1.www;
  r2.xyz = cb2[2].xyz + v2.xyz;
  r2.zw = cb2[4].xy * r2.zz;
  r2.xz = cb2[3].xy * r2.xx + r2.zw;
  r2.xy = cb2[5].xy * r2.yy + r2.xz;
  r2.xy = cb2[6].xy + r2.xy;
  r2.xyzw = t2.Sample(s5_s, r2.xy).xyzw;
  r3.xyz = float3(1,1,1) + -cb2[1].xyz;
  r2.xyz = r3.xyz * r2.xyz;
  r1.w = cb2[1].w * r2.w;
  r2.xyz = -r2.xyz * r1.www + float3(1,1,1);
  r3.xy = v6.xy * float2(0.5,0.5) + float2(0.5,0.5);
  r3.xyz = t0.Sample(s1_s, r3.xy).xyz;
  r3.xyz = cb1[17].xyz * r3.xyz;
  r1.w = t1.Sample(s2_s, v3.xy).w;
  r3.xyz = r3.xyz * r1.www;
r0.xyz = HDRSaturate(r0.xyz * v5.xyz + r3.xyz);
  r0.xyz = r0.xyz * r2.xyz + r1.xyz;
  r0.xyz = cb1[23].xyz + r0.xyz;
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