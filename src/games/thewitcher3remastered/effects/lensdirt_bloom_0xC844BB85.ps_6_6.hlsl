#include "../shared.h"

Texture2D<float4> t0 : register(t0);
Texture2D<float4> t1 : register(t1);
SamplerState s0 : register(s0);
SamplerState s1 : register(s1);

cbuffer cb3 : register(b3) {
  float4 CustomPixelConsts_000 : packoffset(c000.x);
  float4 CustomPixelConsts_016 : packoffset(c001.x);
  float4 CustomPixelConsts_048 : packoffset(c003.x);
  float4 CustomPixelConsts_064 : packoffset(c004.x);
  float4 CustomPixelConsts_080 : packoffset(c005.x);
  float4 CustomPixelConsts_096 : packoffset(c006.x);
  float4 CustomPixelConsts_112 : packoffset(c007.x);
  float4 CustomPixelConsts_128 : packoffset(c008.x);
};

float4 main(noperspective float4 SV_Position : SV_Position) : SV_Target {
  float2 local_pixel = SV_Position.xy - CustomPixelConsts_064.zw;
  float2 atlas_position = CustomPixelConsts_064.xy
      + CustomPixelConsts_016.xy
          * ((local_pixel + 0.5f) / CustomPixelConsts_048.xy);
  float2 minimum_uv = (CustomPixelConsts_080.xy + 0.5f) / CustomPixelConsts_000.xy;
  float2 maximum_uv = (CustomPixelConsts_080.zw + 0.5f) / CustomPixelConsts_000.xy;
  float2 bloom_uv = clamp(
      atlas_position / CustomPixelConsts_000.xy,
      minimum_uv,
      maximum_uv);

  float3 bloom = t0.SampleLevel(s0, bloom_uv, 0.f).rgb;
  float3 dirt = t1.Sample(
      s1,
      CustomPixelConsts_128.xy * SV_Position.xy).rgb
      * CUSTOM_LENS_DIRT;
  float3 dirt_modulation = dirt * CustomPixelConsts_112.rgb
      + CustomPixelConsts_096.rgb;
  return float4(dirt_modulation * bloom, 0.f);
}
