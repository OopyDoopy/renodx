#include "../include/common.hlsl"
#include "../include/pixel_constants.hlsli"

Texture2D<float4> t0 : register(t0);
Texture2D<float4> t1 : register(t1);
SamplerState s0 : register(s0);
SamplerState s1 : register(s1);

float4 main(noperspective float4 SV_Position : SV_Position) : SV_Target {
  float2 atlas_position = float2(int2(CustomPixelConsts_064.xy))
      + CustomPixelConsts_016.xy
          * ((float2(uint2(int2(SV_Position.xy) - int2(CustomPixelConsts_064.zw))) + 0.5f)
             / CustomPixelConsts_048.xy);
  float2 minimum_uv = (CustomPixelConsts_080.xy + 0.5f) / CustomPixelConsts_000.xy;
  float2 maximum_uv = (CustomPixelConsts_080.zw + 0.5f) / CustomPixelConsts_000.xy;
  float2 bloom_uv = clamp(atlas_position / CustomPixelConsts_000.xy, minimum_uv, maximum_uv);

  float3 bloom = t0.SampleLevel(s0, bloom_uv, 0.f).rgb;
  float3 dirt = t1.Sample(s1, CustomPixelConsts_128.xy * SV_Position.xy).rgb * CUSTOM_LENS_DIRT;
  return float4((dirt * CustomPixelConsts_112.rgb + CustomPixelConsts_096.rgb) * bloom, 0.f);
}