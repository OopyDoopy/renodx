#include "./lutsampling.hlsl"

Texture2D<float4> t0 : register(t0);
Texture2D<float4> t1 : register(t1);
Texture2D<float4> t3 : register(t3);

SamplerState s0 : register(s0);
SamplerState s1 : register(s1);
SamplerState s3 : register(s3);

float4 main(
    noperspective float4 SV_Position : SV_Position,
    linear float2 TEXCOORD : TEXCOORD) : SV_Target {
  float2 sample_coords = clamp(TEXCOORD, CustomPixelConsts_000.xy, CustomPixelConsts_000.zw);
  float4 source = t0.Sample(s0, sample_coords);

  float tonemap_scale;
  float gamut_compression_scale;
  float3 gamut_adaptive_state_lms;
  float3 lut_input = ColorGradeLUTInput(
      source.rgb,
      tonemap_scale,
      gamut_compression_scale,
      gamut_adaptive_state_lms);

  float3 first_lut_sample = LUTSampling(lut_input, lut_input, t1, s1);
  float3 second_lut_sample = LUTSampling(first_lut_sample, lut_input, t3, s3);
  float3 graded_sdr = VanillaOutput3(first_lut_sample, second_lut_sample, lut_input);
  float3 graded_hdr = ColorGradeLUTOutput(
      graded_sdr,
      tonemap_scale,
      gamut_compression_scale,
      gamut_adaptive_state_lms);

    return float4(lerp(source.rgb, graded_hdr, CUSTOM_LUT_STRENGTH), source.a);
}