#include "..\..\common.hlsl"
// ---- Created with 3Dmigoto v1.4.1 on Sat Mar 29 10:57:20 2025
Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

cbuffer cb2 : register(b2)
{
  float4 cb2[15];
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
  float3 v7 : INTERP6,
  out float4 o0 : SV_TARGET0)
{
  float4 r0,r1,r2,r3,r4,r5,r6,r7;
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
  r1.xyzw = cmp(cb2[3].wwww == float4(1,2,3,4));
  r2.xyzw = cmp(cb2[3].wwww == float4(5,6,7,8));
  r3.xyzw = cmp(cb2[3].wwyy == float4(9,10,1,2));
  r0.w = r3.y ? v3.w : 1;
  r0.w = r3.x ? v3.z : r0.w;
  r0.w = r2.w ? v3.y : r0.w;
  r0.w = r2.z ? v3.x : r0.w;
  r0.w = r2.y ? v2.w : r0.w;
  r0.w = r2.x ? v2.z : r0.w;
  r0.w = r1.w ? v2.y : r0.w;
  r0.w = r1.z ? v2.x : r0.w;
  r0.w = r1.y ? v1.w : r0.w;
  r0.w = r1.x ? v1.z : r0.w;
  r1.x = cb2[14].w * cb0[15].x;
  r1.x = cmp(r1.x == 0.000000);
  r1.y = cmp(cb2[6].y >= cb2[6].z);
  r1.y = r1.y ? 1.000000 : 0;
  r2.xy = cb2[6].zy;
  r2.zw = float2(-1,0.666666687);
  r4.xy = cb2[6].yz;
  r4.zw = float2(0,-0.333333343);
  r4.xyzw = r4.xyzw + -r2.xyzw;
  r2.xyzw = r1.yyyy * r4.xyzw + r2.xyzw;
  r1.y = cmp(cb2[6].x >= r2.x);
  r1.y = r1.y ? 1.000000 : 0;
  r4.xyz = r2.xyw;
  r4.w = cb2[6].x;
  r2.xyw = r4.wyx;
  r2.xyzw = r2.xyzw + -r4.xyzw;
  r2.xyzw = r1.yyyy * r2.xyzw + r4.xyzw;
  r1.y = min(r2.w, r2.y);
  r1.y = r2.x + -r1.y;
  r1.z = r2.w + -r2.y;
  r1.w = r1.y * 6 + 1.00000001e-10;
  r1.z = r1.z / r1.w;
  r1.z = r2.z + r1.z;
  r1.w = 1.00000001e-10 + r2.x;
  r1.y = r1.y / r1.w;
  r1.z = cb0[15].x * cb2[14].w + abs(r1.z);
  r1.z = frac(r1.z);
  r2.xyz = float3(1,0.666666687,0.333333343) + r1.zzz;
  r2.xyz = frac(r2.xyz);
  r2.xyz = r2.xyz * float3(6,6,6) + float3(-3,-3,-3);
  r2.xyz = saturate(float3(-1,-1,-1) + abs(r2.xyz));
  r2.xyz = float3(-1,-1,-1) + r2.xyz;
  r1.yzw = r1.yyy * r2.xyz + float3(1,1,1);
  r2.x = dot(r1.yzw, float3(0.298999995,0.587000012,0.114));
  r2.y = dot(cb2[6].xyz, float3(0.298999995,0.587000012,0.114));
  r2.x = r2.x / r2.y;
  r1.yzw = r1.yzw / r2.xxx;
  r1.xyz = r1.xxx ? cb2[6].xyz : r1.yzw;
  r2.xy = float2(-0.5,-0.5) + v1.xy;
  r1.w = dot(r2.xy, r2.xy);
  r1.w = sqrt(r1.w);
  r4.y = r1.w + r1.w;
  r1.w = min(abs(r2.x), abs(r2.y));
  r2.z = max(abs(r2.x), abs(r2.y));
  r2.z = 1 / r2.z;
  r1.w = r2.z * r1.w;
  r2.z = r1.w * r1.w;
  r2.w = r2.z * 0.0208350997 + -0.0851330012;
  r2.w = r2.z * r2.w + 0.180141002;
  r2.w = r2.z * r2.w + -0.330299497;
  r2.z = r2.z * r2.w + 0.999866009;
  r2.w = r2.z * r1.w;
  r3.x = cmp(abs(r2.y) < abs(r2.x));
  r2.w = r2.w * -2 + 1.57079637;
  r2.w = r3.x ? r2.w : 0;
  r1.w = r1.w * r2.z + r2.w;
  r2.z = cmp(r2.y < -r2.y);
  r2.z = r2.z ? -3.141593 : 0;
  r1.w = r2.z + r1.w;
  r2.z = min(r2.x, r2.y);
  r2.x = max(r2.x, r2.y);
  r2.y = cmp(r2.z < -r2.z);
  r2.x = cmp(r2.x >= -r2.x);
  r2.x = r2.x ? r2.y : 0;
  r1.w = r2.x ? -r1.w : r1.w;
  r4.z = 0.159235656 * r1.w;
  r2.xyzw = cmp(cb2[0].wwww == float4(1,2,3,4));
  r5.xyzw = cmp(cb2[0].wwww == float4(5,6,7,8));
  r6.xyzw = cmp(cb2[0].wwzz == float4(9,10,1,2));
  r1.w = r6.y ? v3.w : 1;
  r1.w = r6.x ? v3.z : r1.w;
  r1.w = r5.w ? v3.y : r1.w;
  r1.w = r5.z ? v3.x : r1.w;
  r1.w = r5.y ? v2.w : r1.w;
  r1.w = r5.x ? v2.z : r1.w;
  r1.w = r2.w ? v2.y : r1.w;
  r1.w = r2.z ? v2.x : r1.w;
  r1.w = r2.y ? v1.w : r1.w;
  r2.x = r2.x ? v1.z : r1.w;
  r5.xyzw = cmp(cb2[0].zzzz == float4(3,4,5,6));
  r7.xyzw = cmp(cb2[0].zzzz == float4(7,8,9,10));
  r1.w = r7.w ? v3.w : 1;
  r1.w = r7.z ? v3.z : r1.w;
  r1.w = r7.y ? v3.y : r1.w;
  r1.w = r7.x ? v3.x : r1.w;
  r1.w = r5.w ? v2.w : r1.w;
  r1.w = r5.z ? v2.z : r1.w;
  r1.w = r5.y ? v2.y : r1.w;
  r1.w = r5.x ? v2.x : r1.w;
  r1.w = r6.w ? v1.w : r1.w;
  r2.y = r6.z ? v1.z : r1.w;
  r2.xy = cb2[8].xy * r2.xy;
  r5.xyzw = cmp(cb2[11].zzzz == float4(1,2,3,4));
  r6.xyzw = cmp(cb2[11].zzzz == float4(5,6,7,8));
  r2.zw = cmp(cb2[11].zz == float2(9,10));
  r1.w = r2.w ? v3.w : 0;
  r1.w = r2.z ? v3.z : r1.w;
  r1.w = r6.w ? v3.y : r1.w;
  r1.w = r6.z ? v3.x : r1.w;
  r1.w = r6.y ? v2.w : r1.w;
  r1.w = r6.x ? v2.z : r1.w;
  r1.w = r5.w ? v2.y : r1.w;
  r1.w = r5.z ? v2.x : r1.w;
  r1.w = r5.y ? v1.w : r1.w;
  r3.x = r5.x ? v1.z : r1.w;
  r5.xyzw = cmp(cb2[1].xxxx == float4(1,2,3,4));
  r6.xyzw = cmp(cb2[1].xxxx == float4(5,6,7,8));
  r7.xyzw = cmp(cb2[1].xxyy == float4(9,10,1,2));
  r1.w = r7.y ? v3.w : 0;
  r1.w = r7.x ? v3.z : r1.w;
  r1.w = r6.w ? v3.y : r1.w;
  r1.w = r6.z ? v3.x : r1.w;
  r1.w = r6.y ? v2.w : r1.w;
  r1.w = r6.x ? v2.z : r1.w;
  r1.w = r5.w ? v2.y : r1.w;
  r1.w = r5.z ? v2.x : r1.w;
  r1.w = r5.y ? v1.w : r1.w;
  r3.y = r5.x ? v1.z : r1.w;
  r2.zw = cb2[10].zw + r3.xy;
  r2.zw = cb0[15].xx * cb2[11].xy + r2.zw;
  r3.xy = cb2[14].yz + r2.zw;
  r3.xy = r4.yz * r2.xy + r3.xy;
  r1.w = t1.SampleBias(s1_s, r3.xy, cb0[19].x).x;
  r3.x = cb2[14].x + cb2[9].w;
  r3.y = cmp(r3.x == 0.000000);
  r1.w = cmp(r1.w >= r3.x);
  r1.w = r1.w ? 1.000000 : 0;
  r5.xyz = cb2[13].xyz + -r1.xyz;
  r5.xyz = cb2[13].www * r5.xyz + r1.xyz;
  r6.xyz = -r5.xyz + r1.xyz;
  r5.xyz = r1.www * r6.xyz + r5.xyz;
  r1.xyz = r3.yyy ? r1.xyz : r5.xyz;
  r1.w = cmp(0 != cb2[9].z);
  r5.xyzw = r1.wwww ? v4.xyzw : float4(1,1,1,1);
  r1.xyz = r5.xyz * r1.xyz;
  o0.xyz = r1.xyz * r0.www;
  r1.xyzw = cmp(cb2[1].yyyy == float4(3,4,5,6));
  r6.xyzw = cmp(cb2[1].yyyy == float4(7,8,9,10));
  r0.w = r6.w ? v3.w : 0;
  r0.w = r6.z ? v3.z : r0.w;
  r0.w = r6.y ? v3.y : r0.w;
  r0.w = r6.x ? v3.x : r0.w;
  r0.w = r1.w ? v2.w : r0.w;
  r0.w = r1.z ? v2.z : r0.w;
  r0.w = r1.y ? v2.y : r0.w;
  r0.w = r1.x ? v2.x : r0.w;
  r0.w = r7.w ? v1.w : r0.w;
  r0.w = r7.z ? v1.z : r0.w;
  r0.w = cb2[9].w + r0.w;
  r1.xy = r4.yz * r2.xy + r2.zw;
  r1.x = t1.SampleBias(s1_s, r1.xy, cb0[19].x).x;
  r1.y = cmp(cb2[10].x == 0.000000);
  r1.z = cmp(r1.x >= r0.w);
  r1.z = r1.z ? 1.000000 : 0;
  r1.w = 1 + -r0.w;
  r2.x = saturate(-cb2[10].x * 0.5 + r1.w);
  r2.y = saturate(cb2[10].x * 0.5 + r1.w);
  r1.w = r1.x + r1.w;
  r0.w = saturate(r1.w + -r0.w);
  r1.w = r2.y + -r2.x;
  r0.w = r0.w + -r2.x;
  r1.w = 1 / r1.w;
  r0.w = saturate(r1.w * r0.w);
  r1.w = r0.w * -2 + 3;
  r0.w = r0.w * r0.w;
  r0.w = r1.w * r0.w;
  r0.w = r1.y ? r1.z : r0.w;
  r1.x = -0.5 + r1.x;
  r2.xyzw = cmp(cb2[3].yyyy == float4(3,4,5,6));
  r6.xyzw = cmp(cb2[3].yyyy == float4(7,8,9,10));
  r1.y = r6.w ? v3.w : 0;
  r1.y = r6.z ? v3.z : r1.y;
  r1.y = r6.y ? v3.y : r1.y;
  r1.y = r6.x ? v3.x : r1.y;
  r1.y = r2.w ? v2.w : r1.y;
  r1.y = r2.z ? v2.z : r1.y;
  r1.y = r2.y ? v2.y : r1.y;
  r1.y = r2.x ? v2.x : r1.y;
  r1.y = r3.w ? v1.w : r1.y;
  r1.y = r3.z ? v1.z : r1.y;
  r1.y = cb2[2].z + r1.y;
  r1.z = cb2[9].y + -cb2[9].x;
  r1.y = r1.y * r1.z + cb2[9].x;
  r2.z = cb2[7].z * r4.z;
  r2.x = r4.y * cb2[7].y + r1.y;
  r1.y = 0.0174532924 * cb2[3].z;
  r1.zw = float2(-0.5,-0.5) + r2.xz;
  sincos(r1.y, r2.x, r3.x);
  r3.y = r2.x;
  r2.xy = r3.xy * float2(0.5,0.5) + float2(0.5,0.5);
  r2.xy = r2.xy * float2(2,2) + float2(-1,-1);
  r1.y = dot(r1.zw, r2.xy);
  r1.y = cb2[12].x * r1.x + r1.y;
  r1.y = 0.5 + r1.y;
  r2.xyz = cmp(cb2[2].yxw == float3(0,0,0));
  r1.zw = cmp(r1.yy >= cb2[1].zw);
  r1.zw = r1.zw ? float2(1,1) : 0;
  r3.xy = float2(1,1) + -cb2[1].zw;
  r3.zw = saturate(-cb2[2].yw * float2(0.5,0.5) + r3.xy);
  r4.xz = saturate(cb2[2].yw * float2(0.5,0.5) + r3.xy);
  r3.xy = r3.xy + r1.yy;
  r3.xy = saturate(-cb2[1].zw + r3.xy);
  r4.xz = r4.xz + -r3.zw;
  r3.xy = r3.xy + -r3.zw;
  r3.zw = float2(1,1) / r4.xz;
  r3.xy = saturate(r3.xy * r3.zw);
  r3.zw = r3.xy * float2(-2,-2) + float2(3,3);
  r3.xy = r3.xy * r3.xy;
  r3.xy = r3.zw * r3.xy;
  r1.zw = r2.xz ? r1.zw : r3.xy;
  r2.xz = float2(1,1) + -cb2[12].yz;
  r1.y = 1 + -r1.y;
  r2.w = cmp(r1.y >= r2.x);
  r2.w = r2.w ? 1.000000 : 0;
  r3.x = 1 + -r2.x;
  r3.y = saturate(-cb2[2].x * 0.5 + r3.x);
  r3.z = saturate(cb2[2].x * 0.5 + r3.x);
  r3.x = r3.x + r1.y;
  r2.x = saturate(r3.x + -r2.x);
  r3.x = r3.z + -r3.y;
  r2.x = r2.x + -r3.y;
  r3.x = 1 / r3.x;
  r2.x = saturate(r3.x * r2.x);
  r3.x = r2.x * -2 + 3;
  r2.x = r2.x * r2.x;
  r2.x = r3.x * r2.x;
  r2.x = r2.y ? r2.w : r2.x;
  r2.x = min(1, r2.x);
  r2.y = 1 + -cb2[0].y;
  r2.w = cmp(cb2[0].x == 0.000000);
  r3.x = cmp(r1.y >= r2.y);
  r3.x = r3.x ? 1.000000 : 0;
  r3.y = 1 + -r2.y;
  r3.z = saturate(-cb2[0].x * 0.5 + r3.y);
  r3.w = saturate(cb2[0].x * 0.5 + r3.y);
  r1.y = r3.y + r1.y;
  r1.y = saturate(r1.y + -r2.y);
  r2.y = r3.w + -r3.z;
  r1.y = r1.y + -r3.z;
  r2.y = 1 / r2.y;
  r1.y = saturate(r2.y * r1.y);
  r2.y = r1.y * -2 + 3;
  r1.y = r1.y * r1.y;
  r1.y = r2.y * r1.y;
  r1.y = r2.w ? r3.x : r1.y;
  r1.y = min(1, r1.y);
  r1.y = r1.w * r1.y;
  r1.y = cb2[4].x * r1.y;
r1.y = HDRSaturate(r1.z * r2.x + r1.y);
  r0.w = r1.y * r0.w;
  r0.w = cb2[6].w * r0.w;
  r1.y = min(1, r4.y);
  r1.x = cb2[12].x * r1.x + -r1.y;
  r1.x = 1 + r1.x;
  r1.y = cmp(cb2[3].x == 0.000000);
  r1.z = cmp(r1.x >= cb2[12].z);
  r1.z = r1.z ? 1.000000 : 0;
  r1.w = saturate(-cb2[3].x * 0.5 + r2.z);
  r2.x = saturate(cb2[3].x * 0.5 + r2.z);
  r1.x = r1.x + r2.z;
  r1.x = saturate(-cb2[12].z + r1.x);
  r2.x = r2.x + -r1.w;
  r1.x = r1.x + -r1.w;
  r1.w = 1 / r2.x;
  r1.x = saturate(r1.x * r1.w);
  r1.w = r1.x * -2 + 3;
  r1.x = r1.x * r1.x;
  r1.x = r1.w * r1.x;
  r1.x = r1.y ? r1.z : r1.x;
  r1.x = min(1, r1.x);
  r0.w = r1.x * r0.w;
  r0.w = r5.w * r0.w;
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
  r0.z = r0.x * r0.y;
  r0.x = r0.x * r0.y + -cb2[11].w;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  o0.w = r0.z;
  return;
}