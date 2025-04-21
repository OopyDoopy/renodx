#include "./shared.h"

// ---- Created with 3Dmigoto v1.4.1 on Mon Mar 31 14:31:35 2025

cbuffer _Globals : register(b0)
{
  float4 Params[2] : packoffset(c0);
}

SamplerState SamplerSource_s : register(s0);
Texture2D<float4> SamplerSourceTexture : register(t0);


// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = SamplerSourceTexture.SampleLevel(SamplerSource_s, v1.xy, 0).xyz;
  r0.w = dot(Params[0].xy, Params[0].xy);
  r0.w = cmp(r0.w != 0.000000);
  if (r0.w != 0) {
    r1.xyzw = v1.xyxy * float4(2,2,2,2) + float4(-1,-1,-1,-1);

    r2.xyzw = saturate(-Params[0].zwzw + abs(r1.zwzw));

    r2.xyzw *= CUSTOM_CHROMATIC_ABERRATION;

    r0.w = dot(r2.zw, r2.zw);
    r0.w = cmp(r0.w != 0.000000);
    if (r0.w != 0) {
      r3.xyzw = cmp(float4(0,0,0,0) < r1.zwzw);
      r4.xyzw = cmp(r1.zwzw < float4(0,0,0,0));
      r3.xyzw = (int4)r4.xyzw + (int4)-r3.xyzw;
      r3.xyzw = (int4)r3.xyzw;
      r2.xyzw = r3.xyzw * r2.xyzw;
      r1.xyzw = -r2.xyzw * Params[0].xxyy + r1.xyzw;
      r1.xyzw = r1.xyzw * float4(0.5,0.5,0.5,0.5) + float4(0.5,0.5,0.5,0.5);
      r2.x = SamplerSourceTexture.SampleLevel(SamplerSource_s, r1.xy, 0).x;
      r2.y = SamplerSourceTexture.SampleLevel(SamplerSource_s, r1.zw, 0).y;
    } else {
      r2.xy = r0.xy;
    }
  } else {
    r2.xy = r0.xy;
  }
  r0.w = cmp(0 < Params[1].z);
  
  // Affects AA
  if (r0.w != 0) {
    r1.x = -Params[1].x;
    r1.yw = float2(0,0);
    r1.xy = v1.xy + r1.xy;
    r3.xyz = SamplerSourceTexture.Sample(SamplerSource_s, r1.xy).xyz;
    r1.z = Params[1].x;
    r1.xy = v1.xy + r1.zw;
    r1.xyz = SamplerSourceTexture.Sample(SamplerSource_s, r1.xy).xyz;
    r4.xz = float2(0,0);
    r4.y = -Params[1].y;
    r4.xy = v1.xy + r4.xy;
    r5.xyz = SamplerSourceTexture.Sample(SamplerSource_s, r4.xy).xyz;
    r4.w = Params[1].y;
    r4.xy = v1.xy + r4.zw;
    r4.xyz = SamplerSourceTexture.Sample(SamplerSource_s, r4.xy).xyz;
    r0.w = dot(r3.xyz, float3(0.212599993,0.715200007,0.0722000003));
    r1.w = dot(r1.xyz, float3(0.212599993,0.715200007,0.0722000003));
    r3.w = dot(r5.xyz, float3(0.212599993,0.715200007,0.0722000003));
    r4.w = dot(r4.xyz, float3(0.212599993,0.715200007,0.0722000003));
    r3.w = max(r4.w, r3.w);
    r1.w = max(r3.w, r1.w);
    r0.w = max(r1.w, r0.w);
    r1.xyz = r3.xyz + r1.xyz;
    r1.xyz = r1.xyz + r5.xyz;
    r1.xyz = r1.xyz + r4.xyz;
    r1.xyz = -r0.xyz * float3(4,4,4) + r1.xyz;
    r0.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
    r0.x = r0.x + -r0.w;
    r0.x = 1 + -abs(r0.x);
    r0.xyw = r1.xyz * r0.xxx;
    r2.w = r0.z;
    r2.xyz = -r0.xyw * Params[1].zzz + r2.xyw;
  } else {
    r2.z = r0.z;
  }

  //o0.xyz = saturate(r2.xyz);
  o0.xyz = r2.xyz;

  o0.w = 1;

  o0.rgb = renodx::draw::RenderIntermediatePass(renodx::color::srgb::DecodeSafe(o0.rgb));
  return;
}