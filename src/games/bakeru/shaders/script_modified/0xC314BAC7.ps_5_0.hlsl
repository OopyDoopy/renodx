#include "..\..\common.hlsl"
// ---- Created with 3Dmigoto v1.4.1 on Sat Mar 29 10:57:22 2025
Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

cbuffer cb1 : register(b1)
{
  float4 cb1[10];
}

cbuffer cb0 : register(b0)
{
  float4 cb0[81];
}




// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_POSITION0,
  float4 v1 : INTERP0,
  float4 v2 : INTERP1,
  float4 v3 : INTERP2,
  float4 v4 : INTERP3,
  float3 v5 : INTERP4,
  float3 v6 : INTERP5,
  float3 v7 : INTERP6,
  out float4 o0 : SV_TARGET0)
{
  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = cb0[74].xyw * v5.yyy;
  r0.xyz = cb0[73].xyw * v5.xxx + r0.xyz;
  r0.xyz = cb0[75].xyw * v5.zzz + r0.xyz;
  r0.xyz = cb0[76].xyw + r0.xyz;
  r1.xz = float2(0.5,0.5) * r0.xz;
  r0.x = cb0[17].x * r0.y;
  r1.w = 0.5 * r0.x;
  r0.xy = r1.xw + r1.zz;
  r1.xyzw = cmp(cb1[0].yyyy == float4(1,2,3,4));
  r2.xyzw = cmp(cb1[0].yyyy == float4(5,6,7,8));
  r3.xyzw = cmp(cb1[0].yyxx == float4(9,10,1,2));
  r0.w = r3.y ? v3.w : 0;
  r0.w = r3.x ? v3.z : r0.w;
  r0.w = r2.w ? v3.y : r0.w;
  r0.w = r2.z ? v3.x : r0.w;
  r0.w = r2.y ? v2.w : r0.w;
  r0.w = r2.x ? v2.z : r0.w;
  r0.w = r1.w ? v2.y : r0.w;
  r0.w = r1.z ? v2.x : r0.w;
  r0.w = r1.y ? v1.w : r0.w;
  r0.w = r1.x ? v1.z : r0.w;
  r0.w = cb1[4].x + r0.w;
  r1.x = cb1[9].y + r0.w;
  r0.yz = r0.xy / r0.zz;
  r1.y = cb0[18].x / cb0[18].y;
  r0.x = -r0.y * r1.y + 1;
  r1.yz = cb0[15].xx * cb1[8].xy + cb1[2].zw;
  r1.yz = r0.xz * cb1[2].xy + r1.yz;
  r0.x = t1.SampleBias(s1_s, r1.yz, cb0[19].x).x;
  r1.y = cb1[8].z * 0.5 + 0.5;
  r1.xz = float2(1,1) + -r1.xy;
  r1.w = -r1.z + r0.x;
  r1.y = r1.y + -r1.z;
  r1.y = saturate(r1.w / r1.y);
  r1.z = 1 + -r1.x;
r1.x = HDRSaturate(r1.y * r1.z + r1.x);
  r2.xyzw = cb1[7].xyzw + -cb1[5].xyzw;
  r2.xyzw = cb1[7].wwww * r2.xyzw + cb1[5].xyzw;
  r4.xyzw = cb1[5].xyzw + -r2.xyzw;
  r1.xyzw = r1.xxxx * r4.xyzw + r2.xyzw;
  r2.x = cmp(0 != cb1[8].w);
  r2.xyzw = r2.xxxx ? v4.xyzw : float4(1,1,1,1);
  r2.xyzw = cb1[6].xyzw * r2.xyzw;
  r1.xyzw = r2.xyzw * r1.xyzw;
  r0.w = 1 + -r0.w;
  r2.x = cb1[3].x * 0.5 + 0.5;
  r2.y = 1 + -r2.x;
  r2.z = -r2.y + r0.x;
  r2.x = r2.x + -r2.y;
  r2.x = saturate(r2.z / r2.x);
  r2.y = 1 + -r0.w;
r0.w = HDRSaturate(r2.x * r2.y + r0.w);
  r2.x = cmp(cb0[21].w == 1.000000);
  if (r2.x != 0) {
    r2.x = t0.SampleBias(s0_s, r0.yz, cb0[19].x).x;
    r2.yz = r0.yz * float2(2,2) + float2(-1,-1);
    r4.xyzw = cb0[78].xyzw * -r2.zzzz;
    r4.xyzw = cb0[77].xyzw * r2.yyyy + r4.xyzw;
    r2.xyzw = cb0[79].xyzw * r2.xxxx + r4.xyzw;
    r2.xyzw = cb0[80].xyzw + r2.xyzw;
    r2.xyz = r2.xyz / r2.www;
    r2.y = cb0[62].z * r2.y;
    r2.x = cb0[61].z * r2.x + r2.y;
    r2.x = cb0[63].z * r2.z + r2.x;
    r2.x = cb0[64].z + r2.x;
    r2.x = abs(r2.x);
  } else {
    r0.y = t0.SampleBias(s0_s, r0.yz, cb0[19].x).x;
    r0.y = cb0[20].z * r0.y + cb0[20].w;
    r2.x = 1 / r0.y;
  }
  r4.xyzw = cmp(cb1[0].xxxx == float4(3,4,5,6));
  r5.xyzw = cmp(cb1[0].xxxx == float4(7,8,9,10));
  r0.y = r5.w ? v3.w : 0;
  r0.y = r5.z ? v3.z : r0.y;
  r0.y = r5.y ? v3.y : r0.y;
  r0.y = r5.x ? v3.x : r0.y;
  r0.y = r4.w ? v2.w : r0.y;
  r0.y = r4.z ? v2.z : r0.y;
  r0.y = r4.y ? v2.y : r0.y;
  r0.y = r4.x ? v2.x : r0.y;
  r0.y = r3.w ? v1.w : r0.y;
  r0.y = r3.z ? v1.z : r0.y;
  r0.y = cb1[3].y + r0.y;
  r0.y = r2.x * 0.0199999996 + r0.y;
  r0.x = -0.5 + r0.x;
  r0.x = r0.x * cb1[3].w + r0.y;
  r0.x = -cb1[9].x + r0.x;
  r0.y = -cb1[9].x + cb1[3].z;
  r0.x = saturate(r0.x / r0.y);
  r0.x = r0.w * r0.x;
  o0.w = r1.w * r0.x;
  o0.xyz = r1.xyz;
  return;
}