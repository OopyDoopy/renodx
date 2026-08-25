#include "../include/common.hlsl"
#include "../include/pixel_constants.hlsli"

Texture2D<float4> t0 : register(t0);
SamplerState s0 : register(s0);

float4 main(noperspective float4 SV_Position : SV_Position) : SV_Target {
  float2 source_position = float2(int2(CustomPixelConsts_064.xy))
      + CustomPixelConsts_016.xy
          * ((float2(uint2(int2(SV_Position.xy) - int2(CustomPixelConsts_064.zw))) + 0.5f)
             / CustomPixelConsts_048.xy);

  float2 minimum_uv = (CustomPixelConsts_080.xy + 0.5f) / CustomPixelConsts_000.xy;
  float2 maximum_uv = (CustomPixelConsts_080.zw + 0.5f) / CustomPixelConsts_000.xy;
  float2 inverse_size = rcp(CustomPixelConsts_000.xy);

  float2 upper_left_uv = clamp((source_position - 1.f) * inverse_size, minimum_uv, maximum_uv);
  float2 lower_right_uv = clamp((source_position + 1.f) * inverse_size, minimum_uv, maximum_uv);

  float4 upper_left = t0.SampleLevel(s0, upper_left_uv, 0.f);
  float4 upper_right = t0.SampleLevel(s0, float2(lower_right_uv.x, upper_left_uv.y), 0.f);
  float4 lower_left = t0.SampleLevel(s0, float2(upper_left_uv.x, lower_right_uv.y), 0.f);
  float4 lower_right = t0.SampleLevel(s0, lower_right_uv, 0.f);

  float dynamic_peak = DecodePostProcessingPeak(t0.Load(int3(0, 0, 0)).a);

  if (dynamic_peak > 0.f) {
    static const float bloom_extension_gain = 2.f;
    upper_left = ClampPostProcessing(upper_left, dynamic_peak, CustomPixelConsts_144.rgb, CUSTOM_BLOOM, bloom_extension_gain);
    upper_right = ClampPostProcessing(upper_right, dynamic_peak, CustomPixelConsts_144.rgb, CUSTOM_BLOOM, bloom_extension_gain);
    lower_left = ClampPostProcessing(lower_left, dynamic_peak, CustomPixelConsts_144.rgb, CUSTOM_BLOOM, bloom_extension_gain);
    lower_right = ClampPostProcessing(lower_right, dynamic_peak, CustomPixelConsts_144.rgb, CUSTOM_BLOOM, bloom_extension_gain);
  }
  float3 sample_sum = upper_left.rgb + upper_right.rgb + lower_left.rgb + lower_right.rgb;

  bool has_energy = dot(abs(sample_sum * 0.25f), 1.f.xxx) > 1.0000000116860974e-07f;
  float3 color = select(has_energy, sample_sum * 0.2500000298023224f, 0.f);

  float luminance = dot(CustomPixelConsts_144.rgb, color);
  float excess = max(0.f, luminance - CustomPixelConsts_128.x);
  float bloom_amount = min(
      CustomPixelConsts_112.x,
      saturate(CustomPixelConsts_128.y * excess) * excess);
  float bloom_scale = bloom_amount / max(9.999999747378752e-05f, luminance);

  return float4(color * bloom_scale * CustomPixelConsts_096.x, 0.f);
}