#include "..\..\common.hlsl"
// ---- Created with 3Dmigoto v1.4.1 on Sat Mar 29 10:57:21 2025
Texture2D<float4> t13 : register(t13);

Texture2D<float4> t12 : register(t12);

Texture2D<float4> t11 : register(t11);

Texture2D<float4> t10 : register(t10);

Texture2D<float4> t9 : register(t9);

Texture2D<float4> t8 : register(t8);

Texture2D<float4> t7 : register(t7);

Texture2D<float4> t6 : register(t6);

Texture2D<float4> t5 : register(t5);

Texture2D<float4> t4 : register(t4);

Texture2D<float4> t3 : register(t3);

Texture2D<float4> t2 : register(t2);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s12_s : register(s12);

SamplerState s11_s : register(s11);

SamplerState s10_s : register(s10);

SamplerState s9_s : register(s9);

SamplerState s8_s : register(s8);

SamplerState s7_s : register(s7);

SamplerState s6_s : register(s6);

SamplerState s5_s : register(s5);

SamplerState s4_s : register(s4);

SamplerState s3_s : register(s3);

SamplerState s2_s : register(s2);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

cbuffer cb1 : register(b1)
{
  float4 cb1[37];
}

cbuffer cb0 : register(b0)
{
  float4 cb0[57];
}




// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float2 v3 : TEXCOORD2,
  float w3 : TEXCOORD7,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD5,
  float3 v7 : TEXCOORD6,
  float4 v8 : COLOR0,
  float4 v9 : TEXCOORD9,
  float4 v10 : TEXCOORD10,
  float4 v11 : TEXCOORD11,
  float4 v12 : TEXCOORD12,
  out float4 o0 : SV_Target0,
  out uint o1 : SV_Target1)
{
  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = t11.SampleBias(s6_s, v10.xy, cb0[19].x).xyw;
  r0.x = r0.z * r0.x;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r0.z = dot(r0.xy, r0.xy);
  r1.xz = cb1[26].xx * r0.xy;
  r0.x = min(1, r0.z);
  r0.x = 1 + -r0.x;
  r0.x = sqrt(r0.x);
  r1.y = max(1.00000002e-16, r0.x);
  r0.xyz = v8.yyy * r1.xyz;
  r1.xyz = t9.SampleBias(s2_s, v9.xy, cb0[19].x).xyw;
  r1.x = r1.z * r1.x;
  r1.xy = r1.xy * float2(2,2) + float2(-1,-1);
  r0.w = dot(r1.xy, r1.xy);
  r1.xz = cb1[16].xx * r1.xy;
  r0.w = min(1, r0.w);
  r0.w = 1 + -r0.w;
  r0.w = sqrt(r0.w);
  r1.y = max(1.00000002e-16, r0.w);
  r0.xyz = r1.xyz * v8.xxx + r0.xyz;
  r1.xyz = t13.SampleBias(s10_s, v11.xy, cb0[19].x).xyw;
  r1.x = r1.z * r1.x;
  r1.xy = r1.xy * float2(2,2) + float2(-1,-1);
  r0.w = dot(r1.xy, r1.xy);
  r1.xz = cb1[34].xx * r1.xy;
  r0.w = min(1, r0.w);
  r0.w = 1 + -r0.w;
  r0.w = sqrt(r0.w);
  r1.y = max(1.00000002e-16, r0.w);
  r0.xyz = r1.xyz * v8.zzz + r0.xyz;
  r1.x = dot(v6.xzy, r0.xyz);
  r1.y = dot(v7.xzy, r0.xyz);
  r1.xy = r1.xy * float2(0.5,0.5) + float2(0.5,0.5);
  r2.xyz = t2.Sample(s7_s, r1.xy).xyz;
  r2.xyz = cb1[28].xyz * r2.xyz;
  r2.xyz = v8.yyy * r2.xyz;
  r3.xyz = t0.Sample(s3_s, r1.xy).xyz;
  r1.xyz = t4.Sample(s11_s, r1.xy).xyz;
  r1.xyz = cb1[36].xyz * r1.xyz;
  r3.xyz = cb1[18].xyz * r3.xyz;
  r2.xyz = r3.xyz * v8.xxx + r2.xyz;
  r1.xyz = r1.xyz * v8.zzz + r2.xyz;
  r0.w = t1.Sample(s4_s, v9.xy).w;
  r0.w = r0.w * v8.x + 1;
  r1.w = t3.Sample(s8_s, v10.xy).w;
  r0.w = r1.w * v8.y + r0.w;
  r1.w = t5.Sample(s12_s, v11.xy).w;
  r0.w = r1.w * v8.z + r0.w;
  r1.xyz = r1.xyz * r0.www;
  r2.xyzw = t7.SampleBias(s0_s, v3.xy, cb0[19].x).xyzw;
  r2.xyz = float3(-0.5,-0.5,-0.5) + r2.xyz;
  r0.w = max(9.99999975e-05, r2.w);
  r0.x = dot(r0.xyz, r2.xyz);
  r0.x = 0.5 + r0.x;
  r2.xyz = t6.SampleBias(s0_s, v3.xy, cb0[19].x).xyz;
  r0.xyz = r2.xyz * r0.xxx;
  r0.xyz = r0.xyz / r0.www;
  r2.xyz = t10.SampleBias(s5_s, v10.xy, cb0[19].x).xyz;
  r2.xyz = cb1[23].xyz * r2.xyz;
  r2.xyz = v8.yyy * r2.xyz;
  r3.xyzw = t8.SampleBias(s1_s, v9.xy, cb0[19].x).xyzw;
  r3.xyzw = cb1[13].xyzw * r3.xyzw;
  r2.xyz = r3.xyz * v8.xxx + r2.xyz;
  r3.xyz = t12.SampleBias(s9_s, v11.xy, cb0[19].x).xyz;
  r3.xyz = cb1[31].xyz * r3.xyz;
  r2.xyz = r3.xyz * v8.zzz + r2.xyz;
r0.xyz = HDRSaturate(r2.xyz * r0.xyz + r1.xyz);
  r0.xyz = cb1[6].xyz + r0.xyz;
  r0.xyz = -cb0[56].xyz + r0.xyz;
  o0.xyz = v2.zzz * r0.xyz + cb0[56].xyz;
  r0.x = cmp(cb1[0].x == 1.000000);
  o0.w = r0.x ? r3.w : 1;
  r0.x = cmp(0.200000003 >= v4.y);
  o1.x = r0.x ? 0.000000 : 0;
  return;
}