#include "./shared.h"

// ---- Created with 3Dmigoto v1.4.1 on Wed Jun 17 23:43:52 2026

cbuffer PS_CONSTANTS : register(b0)
{
  float4x4 scissorMat : packoffset(c0);
  float4 scissorExt : packoffset(c4);
  float4 scissorScale : packoffset(c5);
  float4x4 paintMat : packoffset(c6);
  float4 extent : packoffset(c10);
  float4 radius : packoffset(c11);
  float4 feather : packoffset(c12);
  float4 innerCol : packoffset(c13);
  float4 outerCol : packoffset(c14);
  float4 strokeMult : packoffset(c15);
  int texType : packoffset(c16);
  int type : packoffset(c16.y);
}

SamplerState g_sampler_s : register(s0);
Texture2D<float4> g_texture : register(t0);

void main(
  float4 v0 : SV_Position0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD1,
  out float4 o0 : SV_TARGET0)
{
  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = scissorMat._m01_m11 * w1.yy;
  r0.xy = scissorMat._m00_m10 * w1.xx + r0.xy;
  r0.xy = scissorMat._m02_m12 + r0.xy;
  r0.xy = -scissorExt.xy + abs(r0.xy);
  r0.xy = saturate(-r0.xy * scissorScale.xy + float2(0.5,0.5));
  r0.x = r0.x * r0.y;
  r0.y = v1.x * 2 + -1;
  r0.y = 1 + -abs(r0.y);
  r0.y = strokeMult.x * r0.y;
  r0.y = min(1, r0.y);
  r0.z = min(1, v1.y);
  r0.y = r0.y * r0.z;
  if (type == 0) {
    r0.zw = paintMat._m01_m11 * w1.yy;
    r0.zw = paintMat._m00_m10 * w1.xx + r0.zw;
    r0.zw = paintMat._m02_m12 + r0.zw;
    r1.xy = -radius.xx + extent.xy;
    r0.zw = -r1.xy + abs(r0.zw);
    r1.x = max(r0.z, r0.w);
    r1.x = min(0, r1.x);
    r0.zw = max(float2(0,0), r0.zw);
    r0.z = dot(r0.zw, r0.zw);
    r0.z = sqrt(r0.z);
    r0.z = r1.x + r0.z;
    r0.z = -radius.x + r0.z;
    r0.z = feather.x * 0.5 + r0.z;
    r0.z = saturate(r0.z / feather.x);
    r1.xyzw = outerCol.xyzw + -innerCol.xyzw;
    r1.xyzw = r0.zzzz * r1.xyzw + innerCol.xyzw;
    r2.xyz = r1.xyz / r1.www;
    r2.xyz = log2(r2.xyz);
    r2.xyz = float3(2.20000005,2.20000005,2.20000005) * r2.xyz;
    r2.xyz = exp2(r2.xyz);
    r1.xyz = r2.xyz * r1.www;
    r0.z = r0.y * r0.x;
    o0.xyzw = r1.xyzw * r0.zzzz;
    //o0.xyz = saturate(o0.xyz);
  } else {
    if (type == 1) {
      r0.zw = paintMat._m01_m11 * w1.yy;
      r0.zw = paintMat._m00_m10 * w1.xx + r0.zw;
      r0.zw = paintMat._m02_m12 + r0.zw;
      r0.zw = r0.zw / extent.xy;
      r1.xyzw = g_texture.Sample(g_sampler_s, r0.zw).xyzw;
      r2.xyz = log2(r1.xyz);
      r2.xyz = float3(2.20000005,2.20000005,2.20000005) * r2.xyz;
      r2.xyz = exp2(r2.xyz);
      bool2 texTypeMatches = texType == int2(1,2);
      r3.xyz = r2.xyz * r1.www;
      r1.xyz = texTypeMatches.x ? r3.xyz : r2.xyz;
      r1.yzw = texTypeMatches.y ? r1.xxx : r1.yzw;
      r1.xyzw = innerCol.xyzw * r1.xyzw;
      r0.z = r0.y * r0.x;
      o0.xyzw = r1.xyzw * r0.zzzz;
    } else {
      if (type == 2) {
        o0.xyzw = float4(1,1,1,1);
      } else {
        r1.xyzw = g_texture.Sample(g_sampler_s, v1.xy).xyzw;
        r2.xyz = log2(r1.xyz);
        r2.xyz = float3(2.20000005,2.20000005,2.20000005) * r2.xyz;
        r2.xyz = exp2(r2.xyz);
        bool2 texTypeMatches = texType == int2(1,2);
        r3.xyz = r2.xyz * r1.www;
        r1.xyz = texTypeMatches.x ? r3.xyz : r2.xyz;
        r1.yzw = texTypeMatches.y ? r1.xxx : r1.yzw;
        r1.xyzw = r1.xyzw * r0.xxxx;
        o0.xyzw = innerCol.xyzw * r1.xyzw;
      }
    }
  }
  o0.xyz = saturate(o0.xyz);
  if (r0.y < strokeMult.y) discard;
  return;
}