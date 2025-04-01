#include "..\..\common.hlsl"
// ---- Created with 3Dmigoto v1.4.1 on Sat Mar 29 10:57:22 2025
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
  r0.w = cmp(0 != cb2[9].z);
  r0.w = r0.w ? v4.w : 1;
  r1.xyzw = cmp(cb2[1].yyyy == float4(1,2,3,4));
  r2.xyzw = cmp(cb2[1].yyyy == float4(5,6,7,8));
  r3.xyzw = cmp(cb2[1].yyxx == float4(9,10,1,2));
  r3.y = r3.y ? v3.w : 0;
  r3.x = r3.x ? v3.z : r3.y;
  r2.w = r2.w ? v3.y : r3.x;
  r2.z = r2.z ? v3.x : r2.w;
  r2.y = r2.y ? v2.w : r2.z;
  r2.x = r2.x ? v2.z : r2.y;
  r1.w = r1.w ? v2.y : r2.x;
  r1.z = r1.z ? v2.x : r1.w;
  r1.y = r1.y ? v1.w : r1.z;
  r1.x = r1.x ? v1.z : r1.y;
  r1.x = cb2[9].w + r1.x;
  r1.yz = float2(-0.5,-0.5) + v1.xy;
  r1.w = dot(r1.yz, r1.yz);
  r1.w = sqrt(r1.w);
  r2.y = r1.w + r1.w;
  r1.w = min(abs(r1.y), abs(r1.z));
  r2.x = max(abs(r1.y), abs(r1.z));
  r2.x = 1 / r2.x;
  r1.w = r2.x * r1.w;
  r2.x = r1.w * r1.w;
  r2.w = r2.x * 0.0208350997 + -0.0851330012;
  r2.w = r2.x * r2.w + 0.180141002;
  r2.w = r2.x * r2.w + -0.330299497;
  r2.x = r2.x * r2.w + 0.999866009;
  r2.w = r2.x * r1.w;
  r3.x = cmp(abs(r1.z) < abs(r1.y));
  r2.w = r2.w * -2 + 1.57079637;
  r2.w = r3.x ? r2.w : 0;
  r1.w = r1.w * r2.x + r2.w;
  r2.x = cmp(r1.z < -r1.z);
  r2.x = r2.x ? -3.141593 : 0;
  r1.w = r2.x + r1.w;
  r2.x = min(r1.y, r1.z);
  r1.y = max(r1.y, r1.z);
  r1.z = cmp(r2.x < -r2.x);
  r1.y = cmp(r1.y >= -r1.y);
  r1.y = r1.y ? r1.z : 0;
  r1.y = r1.y ? -r1.w : r1.w;
  r2.z = 0.159235656 * r1.y;
  r4.xyzw = cmp(cb2[0].wwww == float4(1,2,3,4));
  r5.xyzw = cmp(cb2[0].wwww == float4(5,6,7,8));
  r6.xyzw = cmp(cb2[0].wwzz == float4(9,10,1,2));
  r1.y = r6.y ? v3.w : 1;
  r1.y = r6.x ? v3.z : r1.y;
  r1.y = r5.w ? v3.y : r1.y;
  r1.y = r5.z ? v3.x : r1.y;
  r1.y = r5.y ? v2.w : r1.y;
  r1.y = r5.x ? v2.z : r1.y;
  r1.y = r4.w ? v2.y : r1.y;
  r1.y = r4.z ? v2.x : r1.y;
  r1.y = r4.y ? v1.w : r1.y;
  r3.x = r4.x ? v1.z : r1.y;
  r4.xyzw = cmp(cb2[0].zzzz == float4(3,4,5,6));
  r5.xyzw = cmp(cb2[0].zzzz == float4(7,8,9,10));
  r1.y = r5.w ? v3.w : 1;
  r1.y = r5.z ? v3.z : r1.y;
  r1.y = r5.y ? v3.y : r1.y;
  r1.y = r5.x ? v3.x : r1.y;
  r1.y = r4.w ? v2.w : r1.y;
  r1.y = r4.z ? v2.z : r1.y;
  r1.y = r4.y ? v2.y : r1.y;
  r1.y = r4.x ? v2.x : r1.y;
  r1.y = r6.w ? v1.w : r1.y;
  r3.y = r6.z ? v1.z : r1.y;
  r1.yz = cb2[8].xy * r3.xy;
  r4.xyzw = cmp(cb2[11].zzzz == float4(1,2,3,4));
  r5.xyzw = cmp(cb2[11].zzzz == float4(5,6,7,8));
  r2.xw = cmp(cb2[11].zz == float2(9,10));
  r1.w = r2.w ? v3.w : 0;
  r1.w = r2.x ? v3.z : r1.w;
  r1.w = r5.w ? v3.y : r1.w;
  r1.w = r5.z ? v3.x : r1.w;
  r1.w = r5.y ? v2.w : r1.w;
  r1.w = r5.x ? v2.z : r1.w;
  r1.w = r4.w ? v2.y : r1.w;
  r1.w = r4.z ? v2.x : r1.w;
  r1.w = r4.y ? v1.w : r1.w;
  r3.x = r4.x ? v1.z : r1.w;
  r4.xyzw = cmp(cb2[1].xxxx == float4(3,4,5,6));
  r5.xyzw = cmp(cb2[1].xxxx == float4(7,8,9,10));
  r1.w = r5.w ? v3.w : 0;
  r1.w = r5.z ? v3.z : r1.w;
  r1.w = r5.y ? v3.y : r1.w;
  r1.w = r5.x ? v3.x : r1.w;
  r1.w = r4.w ? v2.w : r1.w;
  r1.w = r4.z ? v2.z : r1.w;
  r1.w = r4.y ? v2.y : r1.w;
  r1.w = r4.x ? v2.x : r1.w;
  r1.w = r3.w ? v1.w : r1.w;
  r3.y = r3.z ? v1.z : r1.w;
  r2.xw = cb2[10].zw + r3.xy;
  r2.xw = cb0[15].xx * cb2[11].xy + r2.xw;
  r1.yz = r2.yz * r1.yz + r2.xw;
  r1.y = t1.SampleBias(s1_s, r1.yz, cb0[19].x).x;
  r1.z = cmp(cb2[10].x == 0.000000);
  r1.w = cmp(r1.y >= r1.x);
  r1.w = r1.w ? 1.000000 : 0;
  r2.x = 1 + -r1.x;
  r2.w = saturate(-cb2[10].x * 0.5 + r2.x);
  r3.x = saturate(cb2[10].x * 0.5 + r2.x);
  r2.x = r2.x + r1.y;
  r1.x = saturate(r2.x + -r1.x);
  r2.x = r3.x + -r2.w;
  r1.x = r1.x + -r2.w;
  r2.x = 1 / r2.x;
  r1.x = saturate(r2.x * r1.x);
  r2.x = r1.x * -2 + 3;
  r1.x = r1.x * r1.x;
  r1.x = r2.x * r1.x;
  r1.x = r1.z ? r1.w : r1.x;
  r1.y = -0.5 + r1.y;
  r3.xyzw = cmp(cb2[3].yyyy == float4(1,2,3,4));
  r4.xyzw = cmp(cb2[3].yyyy == float4(5,6,7,8));
  r5.xyz = cmp(cb2[3].yyx == float3(9,10,0));
  r1.z = r5.y ? v3.w : 0;
  r1.z = r5.x ? v3.z : r1.z;
  r1.z = r4.w ? v3.y : r1.z;
  r1.z = r4.z ? v3.x : r1.z;
  r1.z = r4.y ? v2.w : r1.z;
  r1.z = r4.x ? v2.z : r1.z;
  r1.z = r3.w ? v2.y : r1.z;
  r1.z = r3.z ? v2.x : r1.z;
  r1.z = r3.y ? v1.w : r1.z;
  r1.z = r3.x ? v1.z : r1.z;
  r1.z = cb2[2].z + r1.z;
  r1.w = cb2[9].y + -cb2[9].x;
  r1.z = r1.z * r1.w + cb2[9].x;
  r2.z = cb2[7].z * r2.z;
  r2.x = r2.y * cb2[7].y + r1.z;
  r1.z = 0.0174532924 * cb2[3].z;
  r2.xz = float2(-0.5,-0.5) + r2.xz;
  sincos(r1.z, r3.x, r4.x);
  r4.y = r3.x;
  r1.zw = r4.xy * float2(0.5,0.5) + float2(0.5,0.5);
  r1.zw = r1.zw * float2(2,2) + float2(-1,-1);
  r1.z = dot(r2.xz, r1.zw);
  r1.z = cb2[12].x * r1.y + r1.z;
  r1.z = 0.5 + r1.z;
  r2.xzw = cmp(cb2[2].yxw == float3(0,0,0));
  r3.xy = cmp(r1.zz >= cb2[1].zw);
  r3.xy = r3.xy ? float2(1,1) : 0;
  r3.zw = float2(1,1) + -cb2[1].zw;
  r4.xy = saturate(-cb2[2].yw * float2(0.5,0.5) + r3.zw);
  r4.zw = saturate(cb2[2].yw * float2(0.5,0.5) + r3.zw);
  r3.zw = r3.zw + r1.zz;
  r3.zw = saturate(-cb2[1].zw + r3.zw);
  r4.zw = r4.zw + -r4.xy;
  r3.zw = r3.zw + -r4.xy;
  r4.xy = float2(1,1) / r4.zw;
  r3.zw = saturate(r4.xy * r3.zw);
  r4.xy = r3.zw * float2(-2,-2) + float2(3,3);
  r3.zw = r3.zw * r3.zw;
  r3.zw = r4.xy * r3.zw;
  r2.xw = r2.xw ? r3.xy : r3.zw;
  r3.xy = float2(1,1) + -cb2[12].yz;
  r1.z = 1 + -r1.z;
  r1.w = cmp(r1.z >= r3.x);
  r1.w = r1.w ? 1.000000 : 0;
  r3.z = 1 + -r3.x;
  r3.w = saturate(-cb2[2].x * 0.5 + r3.z);
  r4.x = saturate(cb2[2].x * 0.5 + r3.z);
  r3.z = r3.z + r1.z;
  r3.x = saturate(r3.z + -r3.x);
  r3.z = r4.x + -r3.w;
  r3.x = r3.x + -r3.w;
  r3.z = 1 / r3.z;
  r3.x = saturate(r3.x * r3.z);
  r3.z = r3.x * -2 + 3;
  r3.x = r3.x * r3.x;
  r3.x = r3.z * r3.x;
  r1.w = r2.z ? r1.w : r3.x;
  r2.z = 1 + -cb2[0].y;
  r3.x = cmp(cb2[0].x == 0.000000);
  r3.z = cmp(r1.z >= r2.z);
  r3.z = r3.z ? 1.000000 : 0;
  r3.w = 1 + -r2.z;
  r4.x = saturate(-cb2[0].x * 0.5 + r3.w);
  r4.y = saturate(cb2[0].x * 0.5 + r3.w);
  r1.z = r3.w + r1.z;
  r1.z = saturate(r1.z + -r2.z);
  r2.z = r4.y + -r4.x;
  r1.z = r1.z + -r4.x;
  r2.z = 1 / r2.z;
  r1.z = saturate(r2.z * r1.z);
  r2.z = r1.z * -2 + 3;
  r1.z = r1.z * r1.z;
  r1.z = r2.z * r1.z;
  r1.z = r3.x ? r3.z : r1.z;
  r1.zw = min(float2(1,1), r1.zw);
  r1.z = r2.w * r1.z;
  r1.z = cb2[4].x * r1.z;
r1.z = HDRSaturate(r2.x * r1.w + r1.z);
  r1.x = r1.x * r1.z;
  r1.x = cb2[6].w * r1.x;
  r1.z = min(1, r2.y);
  r1.y = cb2[12].x * r1.y + -r1.z;
  r1.y = 1 + r1.y;
  r1.z = cmp(r1.y >= cb2[12].z);
  r1.z = r1.z ? 1.000000 : 0;
  r1.w = saturate(-cb2[3].x * 0.5 + r3.y);
  r2.x = saturate(cb2[3].x * 0.5 + r3.y);
  r1.y = r1.y + r3.y;
  r1.y = saturate(-cb2[12].z + r1.y);
  r2.x = r2.x + -r1.w;
  r1.y = r1.y + -r1.w;
  r1.w = 1 / r2.x;
  r1.y = saturate(r1.y * r1.w);
  r1.w = r1.y * -2 + 3;
  r1.y = r1.y * r1.y;
  r1.y = r1.w * r1.y;
  r1.y = r5.z ? r1.z : r1.y;
  r1.y = min(1, r1.y);
  r1.x = r1.x * r1.y;
  r0.w = r1.x * r0.w;
  r1.xy = cmp(cb2[8].zw == float2(0,0));
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
  r0.y = cb2[8].w + -cb2[8].z;
  r0.x = -cb2[8].z + r0.x;
  r0.y = 1 / r0.y;
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
  r0.w = cmp(0 != cb2[10].y);
  r0.z = r0.w ? r0.z : 0;
  r0.y = r0.z ? r0.y : 1;
  r0.x = r0.x * r0.y + -cb2[11].w;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  o0.xyzw = float4(0,0,0,0);
  return;
}