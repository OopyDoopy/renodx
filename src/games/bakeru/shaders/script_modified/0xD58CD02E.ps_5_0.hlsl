#include "..\..\common.hlsl"
// ---- Created with 3Dmigoto v1.4.1 on Sat Mar 29 10:57:23 2025
Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

cbuffer cb2 : register(b2)
{
  float4 cb2[13];
}

cbuffer cb1 : register(b1)
{
  float4 cb1[9];
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
  out float4 o0 : SV_TARGET0)
{
  float4 r0,r1,r2,r3,r4,r5,r6;
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
  r0.w = cmp(0 != cb2[9].x);
  r0.w = r0.w ? v4.w : 1;
  r1.xyzw = cmp(cb2[2].zzzz == float4(1,2,3,4));
  r2.xyzw = cmp(cb2[2].zzzz == float4(5,6,7,8));
  r3.xyzw = cmp(cb2[2].zzyy == float4(9,10,1,2));
  r3.y = r3.y ? v3.w : 1;
  r3.x = r3.x ? v3.z : r3.y;
  r2.w = r2.w ? v3.y : r3.x;
  r2.z = r2.z ? v3.x : r2.w;
  r2.y = r2.y ? v2.w : r2.z;
  r2.x = r2.x ? v2.z : r2.y;
  r1.w = r1.w ? v2.y : r2.x;
  r1.z = r1.z ? v2.x : r1.w;
  r1.y = r1.y ? v1.w : r1.z;
  r1.x = r1.x ? v1.z : r1.y;
  r1.y = cb2[9].z * r1.x;
  r1.zw = float2(-0.5,-0.5) + v1.xy;
  r2.x = dot(r1.zw, r1.zw);
  r2.x = sqrt(r2.x);
  r2.y = r2.x + r2.x;
  r2.w = min(abs(r1.z), abs(r1.w));
  r3.x = max(abs(r1.z), abs(r1.w));
  r3.x = 1 / r3.x;
  r2.w = r3.x * r2.w;
  r3.x = r2.w * r2.w;
  r3.y = r3.x * 0.0208350997 + -0.0851330012;
  r3.y = r3.x * r3.y + 0.180141002;
  r3.y = r3.x * r3.y + -0.330299497;
  r3.x = r3.x * r3.y + 0.999866009;
  r3.y = r3.x * r2.w;
  r4.x = cmp(abs(r1.w) < abs(r1.z));
  r3.y = r3.y * -2 + 1.57079637;
  r3.y = r4.x ? r3.y : 0;
  r2.w = r2.w * r3.x + r3.y;
  r3.x = cmp(r1.w < -r1.w);
  r3.x = r3.x ? -3.141593 : 0;
  r2.w = r3.x + r2.w;
  r3.x = min(r1.z, r1.w);
  r1.z = max(r1.z, r1.w);
  r1.w = cmp(r3.x < -r3.x);
  r1.z = cmp(r1.z >= -r1.z);
  r1.z = r1.z ? r1.w : 0;
  r1.z = r1.z ? -r2.w : r2.w;
  r2.z = 0.159235656 * r1.z;
  r4.xyzw = cmp(cb2[1].yyyy == float4(1,2,3,4));
  r5.xyzw = cmp(cb2[1].yyyy == float4(5,6,7,8));
  r6.xyzw = cmp(cb2[1].yyxx == float4(9,10,1,2));
  r1.z = r6.y ? v3.w : 1;
  r1.z = r6.x ? v3.z : r1.z;
  r1.z = r5.w ? v3.y : r1.z;
  r1.z = r5.z ? v3.x : r1.z;
  r1.z = r5.y ? v2.w : r1.z;
  r1.z = r5.x ? v2.z : r1.z;
  r1.z = r4.w ? v2.y : r1.z;
  r1.z = r4.z ? v2.x : r1.z;
  r1.z = r4.y ? v1.w : r1.z;
  r3.x = r4.x ? v1.z : r1.z;
  r4.xyzw = cmp(cb2[1].xxxx == float4(3,4,5,6));
  r5.xyzw = cmp(cb2[1].xxxx == float4(7,8,9,10));
  r1.z = r5.w ? v3.w : 1;
  r1.z = r5.z ? v3.z : r1.z;
  r1.z = r5.y ? v3.y : r1.z;
  r1.z = r5.x ? v3.x : r1.z;
  r1.z = r4.w ? v2.w : r1.z;
  r1.z = r4.z ? v2.z : r1.z;
  r1.z = r4.y ? v2.y : r1.z;
  r1.z = r4.x ? v2.x : r1.z;
  r1.z = r6.w ? v1.w : r1.z;
  r3.y = r6.z ? v1.z : r1.z;
  r1.zw = cb2[7].zw * r3.xy;
  r4.xyzw = cmp(cb2[11].zzzz == float4(1,2,3,4));
  r5.xyzw = cmp(cb2[11].zzzz == float4(5,6,7,8));
  r3.xy = cmp(cb2[11].zz == float2(9,10));
  r2.w = r3.y ? v3.w : 0;
  r2.w = r3.x ? v3.z : r2.w;
  r2.w = r5.w ? v3.y : r2.w;
  r2.w = r5.z ? v3.x : r2.w;
  r2.w = r5.y ? v2.w : r2.w;
  r2.w = r5.x ? v2.z : r2.w;
  r2.w = r4.w ? v2.y : r2.w;
  r2.w = r4.z ? v2.x : r2.w;
  r2.w = r4.y ? v1.w : r2.w;
  r3.x = r4.x ? v1.z : r2.w;
  r4.xyzw = cmp(cb2[2].yyyy == float4(3,4,5,6));
  r5.xyzw = cmp(cb2[2].yyyy == float4(7,8,9,10));
  r2.w = r5.w ? v3.w : 0;
  r2.w = r5.z ? v3.z : r2.w;
  r2.w = r5.y ? v3.y : r2.w;
  r2.w = r5.x ? v3.x : r2.w;
  r2.w = r4.w ? v2.w : r2.w;
  r2.w = r4.z ? v2.z : r2.w;
  r2.w = r4.y ? v2.y : r2.w;
  r2.w = r4.x ? v2.x : r2.w;
  r2.w = r3.w ? v1.w : r2.w;
  r3.y = r3.z ? v1.z : r2.w;
  r3.xy = cb2[10].yz + r3.xy;
  r3.xy = cb0[15].xx * cb2[11].xy + r3.xy;
  r1.zw = r2.yz * r1.zw + r3.xy;
  r1.z = t1.SampleBias(s1_s, r1.zw, cb0[19].x).x;
  r1.w = cmp(cb2[9].w == 0.000000);
  r1.y = cmp(r1.z >= r1.y);
  r1.y = r1.y ? 1.000000 : 0;
  r2.w = -cb2[9].z * r1.x + 1;
  r3.x = saturate(-cb2[9].w * 0.5 + r2.w);
  r3.y = saturate(cb2[9].w * 0.5 + r2.w);
  r2.w = r2.w + r1.z;
  r1.x = saturate(-cb2[9].z * r1.x + r2.w);
  r2.w = r3.y + -r3.x;
  r1.x = r1.x + -r3.x;
  r2.w = 1 / r2.w;
  r1.x = saturate(r2.w * r1.x);
  r2.w = r1.x * -2 + 3;
  r1.x = r1.x * r1.x;
  r1.x = r2.w * r1.x;
  r1.x = r1.w ? r1.y : r1.x;
  r1.y = -0.5 + r1.z;
  r1.z = cb2[12].x * r1.y;
  r3.xyzw = cmp(cb2[3].xxxx == float4(1,2,3,4));
  r4.xyzw = cmp(cb2[3].xxxx == float4(5,6,7,8));
  r5.xy = cmp(cb2[3].xx == float2(9,10));
  r1.w = r5.y ? v3.w : 0;
  r1.w = r5.x ? v3.z : r1.w;
  r1.w = r4.w ? v3.y : r1.w;
  r1.w = r4.z ? v3.x : r1.w;
  r1.w = r4.y ? v2.w : r1.w;
  r1.w = r4.x ? v2.z : r1.w;
  r1.w = r3.w ? v2.y : r1.w;
  r1.w = r3.z ? v2.x : r1.w;
  r1.w = r3.y ? v1.w : r1.w;
  r1.w = r3.x ? v1.z : r1.w;
  r1.w = cb2[2].w + r1.w;
  r3.xy = cb2[8].wy + -cb2[8].zx;
  r1.w = r1.w * r3.x + cb2[8].z;
  r3.z = cb2[6].w * r2.z;
  r3.x = r2.y * cb2[6].z + r1.w;
  r1.w = 0.0174532924 * cb2[3].y;
  r2.yz = float2(-0.5,-0.5) + r3.xz;
  sincos(r1.w, r3.x, r4.x);
  r4.y = r3.x;
  r3.xz = r4.xy * float2(0.5,0.5) + float2(0.5,0.5);
  r3.xz = r3.xz * float2(2,2) + float2(-1,-1);
  r1.w = dot(r2.yz, r3.xz);
  r1.y = cb2[12].x * r1.y + r1.w;
  r1.y = 0.5 + r1.y;
  r1.w = saturate(r1.y);
  r1.y = 1 + -r1.y;
  r1.y = saturate(cb2[9].y * r1.y);
  r2.y = r1.w * r1.y;
  r2.z = cb2[7].y + -cb2[7].x;
  r1.y = r1.w * r1.y + -cb2[7].x;
  r1.w = 1 / r2.z;
  r1.y = saturate(r1.y * r1.w);
  r1.w = r1.y * -2 + 3;
  r1.y = r1.y * r1.y;
  r2.y = cb2[3].w * r2.y;
r1.y = HDRSaturate(r1.w * r1.y + r2.y);
  r1.x = r1.x * r1.y;
  r1.x = cb2[5].w * r1.x;
  r1.y = r2.x * 2 + -cb2[6].x;
  r1.w = 1 + -cb2[6].x;
  r1.y = saturate(r1.y / r1.w);
  r1.y = r1.y * -2 + r1.z;
  r1.y = saturate(1 + r1.y);
  r1.x = r1.x * r1.y;
  r0.w = r1.x * r0.w;
  r1.xy = cmp(cb2[8].xy == float2(0,0));
  r1.x = r1.y ? r1.x : 0;
  r0.xy = r0.xy / r0.zz;
  r1.y = cmp(cb0[21].w == 1.000000);
  if (r1.y != 0) {
    r1.y = t0.SampleBias(s0_s, r0.xy, cb0[19].x).x;
    r1.zw = r0.xy * float2(2,2) + float2(-1,-1);
    r2.xyzw = cb0[78].xyzw * -r1.wwww;
    r2.xyzw = cb0[77].xyzw * r1.zzzz + r2.xyzw;
    r2.xyzw = cb0[79].xyzw * r1.yyyy + r2.xyzw;
    r2.xyzw = cb0[80].xyzw + r2.xyzw;
    r1.yzw = r2.xyz / r2.www;
    r1.z = cb0[62].z * r1.z;
    r1.y = cb0[61].z * r1.y + r1.z;
    r1.y = cb0[63].z * r1.w + r1.y;
    r1.y = cb0[64].z + r1.y;
    r1.y = abs(r1.y);
  } else {
    r0.x = t0.SampleBias(s0_s, r0.xy, cb0[19].x).x;
    r0.x = cb0[20].z * r0.x + cb0[20].w;
    r1.y = 1 / r0.x;
  }
  r0.x = r1.y + -r0.z;
  r0.x = -cb2[8].x + r0.x;
  r0.y = 1 / r3.y;
  r0.x = saturate(r0.x * r0.y);
  r0.y = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r0.y * r0.x;
  r0.x = min(1, r0.x);
  r0.x = r1.x ? 1 : r0.x;
  r0.x = r0.w * r0.x;
  r0.y = cmp(0 < cb1[8].x);
  r0.z = cmp(cb1[8].x < 0);
  r0.w = 1 + cb1[8].x;
  r0.z = r0.z ? r0.w : 1;
  r0.y = saturate(r0.y ? cb1[8].x : r0.z);
  r0.z = cmp(r0.y != 1.000000);
  r0.w = cmp(0 != cb2[10].x);
  r0.z = r0.w ? r0.z : 0;
  r0.y = r0.z ? r0.y : 1;
  r0.x = r0.x * r0.y + -cb2[11].w;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  o0.xyzw = float4(0,0,0,0);
  return;
}