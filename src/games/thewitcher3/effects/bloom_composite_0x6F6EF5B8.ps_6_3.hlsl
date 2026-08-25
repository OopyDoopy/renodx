#include "../shared.h"

Texture2D<float4> t0 : register(t0);
Texture2D<float4> t1 : register(t1);

cbuffer cb3 : register(b3) {
  float4 CustomPixelConsts_000 : packoffset(c0);
  float4 CustomPixelConsts_016 : packoffset(c1);
  float4 CustomPixelConsts_032 : packoffset(c2);
  float4 CustomPixelConsts_048 : packoffset(c3);
  float4 CustomPixelConsts_064 : packoffset(c4);
  float4 CustomPixelConsts_080 : packoffset(c5);
  float4 CustomPixelConsts_096 : packoffset(c6);
  float4 CustomPixelConsts_112 : packoffset(c7);
  float4 CustomPixelConsts_128 : packoffset(c8);
  float4 CustomPixelConsts_144 : packoffset(c9);
  float4 CustomPixelConsts_160 : packoffset(c10);
  float4 CustomPixelConsts_176 : packoffset(c11);
  float4 CustomPixelConsts_192 : packoffset(c12);
  float4 CustomPixelConsts_208 : packoffset(c13);
  float4 CustomPixelConsts_224 : packoffset(c14);
  float4 CustomPixelConsts_240 : packoffset(c15);
  float4 CustomPixelConsts_256 : packoffset(c16);
  float4 CustomPixelConsts_272 : packoffset(c17);
  float4 CustomPixelConsts_288 : packoffset(c18);
  float4 CustomPixelConsts_304 : packoffset(c19);
  float4 CustomPixelConsts_320 : packoffset(c20);
  float4 CustomPixelConsts_336[4] : packoffset(c21);
};

SamplerState s0 : register(s0);
SamplerState s1 : register(s1);

float4 main(
    noperspective float4 SV_Position : SV_Position,
    linear float2 TEXCOORD : TEXCOORD,
    linear float2 TEXCOORD_1 : TEXCOORD1,
    linear float2 TEXCOORD_2 : TEXCOORD2) : SV_Target {
  float4 bloom_sample = t0.Sample(s0, TEXCOORD);
  float4 scene_sample = t1.Sample(s1, TEXCOORD_1);

  float bloom_scale = mad(
      saturate(
          exp2(dot(scene_sample.rgb, float3(0.3f, 0.59f, 0.11f)) * -3.f)
          * CustomPixelConsts_032.w),
      CustomPixelConsts_048.x,
      1.f - CustomPixelConsts_048.x);
  float3 bloom = CustomPixelConsts_032.rgb * bloom_sample.rgb * bloom_scale;
  bloom = renodx::math::Select(RENODX_TONE_MAP_TYPE < 2.f, saturate(bloom), bloom);

  return float4(1.f - (1.f - bloom) * (1.f - scene_sample.rgb), 1.f);
}