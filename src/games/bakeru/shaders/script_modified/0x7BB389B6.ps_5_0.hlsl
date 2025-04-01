#include "..\..\common.hlsl"
// ---- Created with 3Dmigoto v1.4.1 on Sat Mar 29 10:57:20 2025
Texture2D<float4> t5 : register(t5);

Texture2D<float4> t4 : register(t4);

Texture2D<float4> t3 : register(t3);

Texture2D<float4> t2 : register(t2);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s4_s : register(s4);

SamplerState s3_s : register(s3);

SamplerState s2_s : register(s2);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

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
  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = v7.yzx * v6.zxy;
  r0.xyz = v6.yzx * v7.zxy + -r0.xyz;
  r0.xyz = v7.www * r0.xyz;
  r1.xyz = t5.SampleBias(s2_s, v3.xy, cb0[19].x).xyw;
  r1.x = r1.z * r1.x;
  r1.xy = r1.xy * float2(2,2) + float2(-1,-1);
  r2.xy = cb1[17].ww * r1.xy;
  r0.w = dot(r1.xy, r1.xy);
  r0.w = min(1, r0.w);
  r0.w = 1 + -r0.w;
  r0.w = sqrt(r0.w);
  r2.z = max(1.00000002e-16, r0.w);
  r0.xyz = r2.yyy * r0.xyz;
  r0.xyz = r2.xxx * v7.xyz + r0.xyz;
  r0.xyz = r2.zzz * v6.xyz + r0.xyz;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r1.xyzw = t3.SampleBias(s0_s, v5.xy, cb0[19].x).xyzw;
  r1.xyz = float3(-0.5,-0.5,-0.5) + r1.xyz;
  r0.w = max(9.99999975e-05, r1.w);
  r0.x = dot(r0.xyz, r1.xyz);
  r0.x = 0.5 + r0.x;
  r1.xyz = t2.SampleBias(s0_s, v5.xy, cb0[19].x).xyz;
  r0.xyz = r1.xyz * r0.xxx;
  r0.xyz = r0.xyz / r0.www;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r2.xyz * r0.www;
  r2.x = dot(v12.xyz, r1.xyz);
  r2.y = dot(v13.xyz, r1.xyz);
  r1.xy = r2.xy * float2(0.5,0.5) + float2(0.5,0.5);
  r1.xyz = t0.Sample(s3_s, r1.xy).xyz;
  r1.xyz = cb1[17].xyz * r1.xyz;
  r0.w = t1.Sample(s4_s, v3.xy).w;
  r1.xyz = r1.xyz * r0.www;
  r2.xyz = cb1[24].xyz * w5.xzz;
  r3.xyzw = t4.SampleBias(s1_s, v3.xy, cb0[19].x).xyzw;
  r3.xyzw = cb1[6].xyzw * r3.xyzw;
  r2.xyz = r3.xyz * v1.xyz + r2.xyz;
r0.xyz = HDRSaturate(r2.xyz * r0.xyz + r1.xyz);
  r0.xyz = cb1[23].xyz + r0.xyz;
  r0.xyz = -cb0[56].xyz + r0.xyz;
  o0.xyz = v3.zzz * r0.xyz + cb0[56].xyz;
  r0.x = cmp(cb1[0].x == 1.000000);
  o0.w = r0.x ? r3.w : 1;
  r0.x = cmp(0.200000003 < v6.y);
  r0.x = r0.x ? cb1[51].z : 1;
  r0.yz = cmp(asint(cb1[51].ww) == int2(1,2));
  r0.x = r0.y ? 0 : r0.x;
  o1.x = r0.z ? 1 : r0.x;
  return;
}