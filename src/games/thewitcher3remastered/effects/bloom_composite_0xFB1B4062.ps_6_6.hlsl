#include "../shared.h"

Texture2D<float4> t0 : register(t0);
Texture2D<float4> t1 : register(t1);
SamplerState s0 : register(s0);
SamplerState s1 : register(s1);

cbuffer cb3 : register(b3) {
  float4 CustomPixelConsts_032 : packoffset(c002.x);
  float4 CustomPixelConsts_048 : packoffset(c003.x);
};

float4 main(
    noperspective float4 SV_Position : SV_Position,
    linear float2 TEXCOORD : TEXCOORD,
    linear float2 TEXCOORD_1 : TEXCOORD1) : SV_Target {
  float3 bloom_sample = t0.Sample(s0, TEXCOORD).rgb;
  float4 scene_sample = t1.Sample(s1, TEXCOORD_1);
  float scene_luminance = dot(
      scene_sample.rgb,
      float3(0.3f, 0.59f, 0.11f));
  float bloom_scale = lerp(
      1.f,
      saturate(exp2(scene_luminance * -3.f) * CustomPixelConsts_032.w),
      CustomPixelConsts_048.x);
  float3 bloom = CustomPixelConsts_032.rgb * bloom_sample * bloom_scale;

  // Restore the game's bounded bloom for Vanilla, while allowing the bloom
  // contribution to extend above SDR range for HDR tonemappers.
  if (RENODX_TONE_MAP_TYPE == 0.f) {
    bloom = saturate(bloom);
  } else {
    bloom = max(bloom, 0.f);
  }

  return float4(1.f - (1.f - bloom) * (1.f - scene_sample.rgb), scene_sample.a);
}
