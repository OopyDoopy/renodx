#include "..\..\common.hlsl"
// ---- Created with 3Dmigoto v1.4.1 on Sat Mar 29 10:57:22 2025
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

SamplerComparisonState s12_s : register(s12);

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

cbuffer cb3 : register(b3)
{
  float4 cb3[30];
}

cbuffer cb2 : register(b2)
{
  float4 cb2[37];
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
  float3 v1 : TEXCOORD0,
  float w1 : TEXCOORD7,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
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

  r0.xyz = t9.SampleBias(s5_s, v10.xy, cb0[19].x).xyw;
  r0.x = r0.z * r0.x;
  r0.xy = r0.xy * float2(2,2) + float2(-1,-1);
  r0.z = dot(r0.xy, r0.xy);
  r1.xz = cb2[26].xx * r0.xy;
  r0.x = min(1, r0.z);
  r0.x = 1 + -r0.x;
  r0.x = sqrt(r0.x);
  r1.y = max(1.00000002e-16, r0.x);
  r0.xyz = v8.yyy * r1.xyz;
  r1.xyz = t7.SampleBias(s1_s, v9.xy, cb0[19].x).xyw;
  r1.x = r1.z * r1.x;
  r1.xy = r1.xy * float2(2,2) + float2(-1,-1);
  r0.w = dot(r1.xy, r1.xy);
  r1.xz = cb2[16].xx * r1.xy;
  r0.w = min(1, r0.w);
  r0.w = 1 + -r0.w;
  r0.w = sqrt(r0.w);
  r1.y = max(1.00000002e-16, r0.w);
  r0.xyz = r1.xyz * v8.xxx + r0.xyz;
  r1.xyz = t11.SampleBias(s9_s, v11.xy, cb0[19].x).xyw;
  r1.x = r1.z * r1.x;
  r1.xy = r1.xy * float2(2,2) + float2(-1,-1);
  r0.w = dot(r1.xy, r1.xy);
  r1.xz = cb2[34].xx * r1.xy;
  r0.w = min(1, r0.w);
  r0.w = 1 + -r0.w;
  r0.w = sqrt(r0.w);
  r1.y = max(1.00000002e-16, r0.w);
  r0.xyz = r1.xyz * v8.zzz + r0.xyz;
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
  r1.xyz = r2.xyz + r1.xyz;
  r1.xyz = max(float3(0,0,0), r1.xyz);
  r2.xyz = -cb3[20].xyz + v1.xyz;
  r2.x = dot(r2.xyz, r2.xyz);
  r3.xyz = -cb3[21].xyz + v1.xyz;
  r2.y = dot(r3.xyz, r3.xyz);
  r3.xyz = -cb3[22].xyz + v1.xyz;
  r2.z = dot(r3.xyz, r3.xyz);
  r3.xyz = -cb3[23].xyz + v1.xyz;
  r2.w = dot(r3.xyz, r3.xyz);
  r2.xyzw = cmp(r2.xyzw < cb3[24].xyzw);
  r3.xyz = r2.xyz ? float3(-1,-1,-1) : float3(-0,-0,-0);
  r2.xyzw = r2.xyzw ? float4(1,1,1,1) : 0;
  r3.xyz = r2.yzw + r3.xyz;
  r2.yzw = max(float3(0,0,0), r3.xyz);
  r0.w = dot(r2.xyzw, float4(4,3,2,1));
  r0.w = 4 + -r0.w;
  r0.w = (uint)r0.w;
  r0.w = (uint)r0.w << 2;
  r2.xyz = cb3[r0.w+1].xyz * v1.yyy;
  r2.xyz = cb3[r0.w+0].xyz * v1.xxx + r2.xyz;
  r2.xyz = cb3[r0.w+2].xyz * v1.zzz + r2.xyz;
  r2.xyz = cb3[r0.w+3].xyz + r2.xyz;
  r0.w = cmp(0 >= r2.z);
  r1.w = cmp(r2.z >= 1);
  r2.x = t12.SampleCmpLevelZero(s12_s, r2.xy, r2.z).x;
  r0.w = (int)r0.w | (int)r1.w;
  r1.w = 1 + -cb3[29].x;
  r1.w = r2.x * cb3[29].x + r1.w;
  r0.w = r0.w ? 1 : r1.w;
  r1.w = 1 + -r0.w;
  r2.xyz = -cb0[16].xyz + v1.xyz;
  r2.x = dot(r2.xyz, r2.xyz);
  r2.x = saturate(r2.x * cb3[29].z + cb3[29].w);
  r0.w = r2.x * r1.w + r0.w;
  r2.xyz = cb1[11].zzz * cb0[6].xyz;
  r2.xyz = r2.xyz * r0.www;
  r0.w = dot(r0.xyz, cb0[5].xyz);
  r0.w = max(0, r0.w);
  r2.xyz = r0.www * r2.xyz;
  r1.xyz = r2.xyz * cb2[5].yyy + r1.xyz;
  r2.x = dot(v6.xzy, r0.xyz);
  r2.y = dot(v7.xzy, r0.xyz);
  r0.xy = r2.xy * float2(0.5,0.5) + float2(0.5,0.5);
  r2.xyz = t2.Sample(s6_s, r0.xy).xyz;
  r2.xyz = cb2[28].xyz * r2.xyz;
  r2.xyz = v8.yyy * r2.xyz;
  r3.xyz = t0.Sample(s2_s, r0.xy).xyz;
  r0.xyz = t4.Sample(s10_s, r0.xy).xyz;
  r0.xyz = cb2[36].xyz * r0.xyz;
  r3.xyz = cb2[18].xyz * r3.xyz;
  r2.xyz = r3.xyz * v8.xxx + r2.xyz;
  r0.xyz = r0.xyz * v8.zzz + r2.xyz;
  r0.w = t1.Sample(s3_s, v9.xy).w;
  r0.w = r0.w * v8.x + 1;
  r1.w = t3.Sample(s7_s, v10.xy).w;
  r0.w = r1.w * v8.y + r0.w;
  r1.w = t5.Sample(s11_s, v11.xy).w;
  r0.w = r1.w * v8.z + r0.w;
  r0.xyz = r0.xyz * r0.www;
  r2.xyz = t8.SampleBias(s4_s, v10.xy, cb0[19].x).xyz;
  r2.xyz = cb2[23].xyz * r2.xyz;
  r2.xyz = v8.yyy * r2.xyz;
  r3.xyzw = t6.SampleBias(s0_s, v9.xy, cb0[19].x).xyzw;
  r3.xyzw = cb2[13].xyzw * r3.xyzw;
  r2.xyz = r3.xyz * v8.xxx + r2.xyz;
  r3.xyz = t10.SampleBias(s8_s, v11.xy, cb0[19].x).xyz;
  r3.xyz = cb2[31].xyz * r3.xyz;
  r2.xyz = r3.xyz * v8.zzz + r2.xyz;
r0.xyz = HDRSaturate(r2.xyz * r1.xyz + r0.xyz);
  r0.xyz = cb2[6].xyz + r0.xyz;
  r0.xyz = -cb0[56].xyz + r0.xyz;
  o0.xyz = v2.zzz * r0.xyz + cb0[56].xyz;
  r0.x = cmp(cb2[0].x == 1.000000);
  o0.w = r0.x ? r3.w : 1;
  r0.x = cmp(0.200000003 >= v4.y);
  o1.x = r0.x ? 0.000000 : 0;
  return;
}