#include "../include/common.hlsl"

struct ShaderCommonEnvProbeParams {
  float ShaderCommonEnvProbeParams_000;
  float3 ShaderCommonEnvProbeParams_004;
  float3 ShaderCommonEnvProbeParams_016;
  row_major float4x4 ShaderCommonEnvProbeParams_028;
  float4 ShaderCommonEnvProbeParams_092;
  row_major float4x4 ShaderCommonEnvProbeParams_108;
  int ShaderCommonEnvProbeParams_172;
};

struct ShaderCullingEnvProbeParams {
  row_major float4x3 ShaderCullingEnvProbeParams_000;
  float3 ShaderCullingEnvProbeParams_048;
  int ShaderCullingEnvProbeParams_060;
};

struct ShaderWorldTear {
  float4 ShaderWorldTear_000;
  float4 ShaderWorldTear_016;
  float ShaderWorldTear_032;
  float ShaderWorldTear_036;
  float ShaderWorldTear_040;
  float ShaderWorldTear_044;
};

struct ShaderWorldTearArray {
  int ShaderWorldTearArray_000;
  float ShaderWorldTearArray_004;
  float ShaderWorldTearArray_008;
  float ShaderWorldTearArray_012;
  ShaderWorldTear ShaderWorldTearArray_016[10];
};

struct ShaderWorldTearConstants {
  int4 ShaderWorldTearConstants_000[16];
};

Texture2D<float4> t0 : register(t0);
Texture2D<float4> t1 : register(t1);
Texture2D<float4> t2 : register(t2);

cbuffer cb3 : register(b3) {
  float4 CustomPixelConsts_000 : packoffset(c000.x);
  float4 CustomPixelConsts_016 : packoffset(c001.x);
  float4 CustomPixelConsts_032 : packoffset(c002.x);
  float4 CustomPixelConsts_048 : packoffset(c003.x);
  float4 CustomPixelConsts_064 : packoffset(c004.x);
  float4 CustomPixelConsts_080 : packoffset(c005.x);
  float4 CustomPixelConsts_096 : packoffset(c006.x);
  float4 CustomPixelConsts_112 : packoffset(c007.x);
  float4 CustomPixelConsts_128 : packoffset(c008.x);
  float4 CustomPixelConsts_144 : packoffset(c009.x);
  float4 CustomPixelConsts_160 : packoffset(c010.x);
  float4 CustomPixelConsts_176 : packoffset(c011.x);
  float4 CustomPixelConsts_192 : packoffset(c012.x);
  float4 CustomPixelConsts_208 : packoffset(c013.x);
  float4 CustomPixelConsts_224 : packoffset(c014.x);
  float4 CustomPixelConsts_240 : packoffset(c015.x);
  float4 CustomPixelConsts_256 : packoffset(c016.x);
  float4 CustomPixelConsts_272 : packoffset(c017.x);
  float4 CustomPixelConsts_288 : packoffset(c018.x);
  float4 CustomPixelConsts_304 : packoffset(c019.x);
  float4 CustomPixelConsts_320 : packoffset(c020.x);
  row_major float4x4 CustomPixelConsts_336 : packoffset(c021.x);
};

cbuffer cb12 : register(b12) {
  float cb12_022x : packoffset(c022.x);
  float cb12_022y : packoffset(c022.y);
  float cb12_287x : packoffset(c287.x);
  uint cb12_padding : packoffset(c340.w);
};

SamplerState s0 : register(s0);

float4 main(noperspective float4 SV_Position : SV_Position) : SV_Target {
  float2 pixel = SV_Position.xy;
  float2 source_position = CustomPixelConsts_016.xy
      * ((pixel - CustomPixelConsts_064.zw + 0.5f) / CustomPixelConsts_048.xy)
      + CustomPixelConsts_064.xy;
  float2 minimum_uv = (CustomPixelConsts_080.xy + 0.5f) / CustomPixelConsts_000.xy;
  float2 maximum_uv = (CustomPixelConsts_080.zw + 0.5f) / CustomPixelConsts_000.xy;
  float2 upper_left_uv = clamp(
      (source_position - 1.f) / CustomPixelConsts_000.xy,
      minimum_uv,
      maximum_uv);
  float2 lower_right_uv = clamp(
      (source_position + 1.f) / CustomPixelConsts_000.xy,
      minimum_uv,
      maximum_uv);

  float4 upper_left = t0.SampleLevel(s0, upper_left_uv, 0.f);
  float4 upper_right = t0.SampleLevel(
      s0,
      float2(lower_right_uv.x, upper_left_uv.y),
      0.f);
  float4 lower_left = t0.SampleLevel(
      s0,
      float2(upper_left_uv.x, lower_right_uv.y),
      0.f);
  float4 lower_right = t0.SampleLevel(s0, lower_right_uv, 0.f);

  float bloom_peak = DecodePostProcessingPeak(t0.Load(int3(0, 0, 0)).a);
  if (bloom_peak > 0.f) {
    static const float bloom_extension_gain = 2.f;
    upper_left = ClampPostProcessing(
        upper_left,
        bloom_peak,
        CustomPixelConsts_144.rgb,
        CUSTOM_BLOOM,
        bloom_extension_gain);
    upper_right = ClampPostProcessing(
        upper_right,
        bloom_peak,
        CustomPixelConsts_144.rgb,
        CUSTOM_BLOOM,
        bloom_extension_gain);
    lower_left = ClampPostProcessing(
        lower_left,
        bloom_peak,
        CustomPixelConsts_144.rgb,
        CUSTOM_BLOOM,
        bloom_extension_gain);
    lower_right = ClampPostProcessing(
        lower_right,
        bloom_peak,
        CustomPixelConsts_144.rgb,
        CUSTOM_BLOOM,
        bloom_extension_gain);
  }

  float3 average = (upper_left.rgb + upper_right.rgb + lower_left.rgb + lower_right.rgb) * 0.25f;
  bool has_energy = dot(abs(average), 1.f.xxx) > 1.0000000116860974e-7f;
  average = has_energy ? average : 0.f.xxx;

  float luminance = dot(
      average,
      float3(
          CustomPixelConsts_144.x,
          CustomPixelConsts_144.y,
          CustomPixelConsts_144.z));
  float normalization =
      (pow(max(luminance / CustomPixelConsts_096.y, 1.0e-6f), CustomPixelConsts_096.z)
       * CustomPixelConsts_096.y)
      / max(luminance, 1.0e-6f)
      * CustomPixelConsts_096.w;
  float3 prefiltered_bloom = average * normalization;

  float mask_depth = t1.Load(int3(
      uint2(cb12_287x * source_position),
      0)).x;
  float3 masked_bloom = prefiltered_bloom;
  if (cb12_022x * mask_depth + cb12_022y >= 1.f) {
    if (CustomPixelConsts_112.z > 0.f) {
      float target_luminance = dot(
          masked_bloom,
          float3(CustomPixelConsts_144.x, CustomPixelConsts_144.y, CustomPixelConsts_144.z));
      masked_bloom *= min(1.f, CustomPixelConsts_112.z / max(target_luminance, 1.0e-6f));
    }
  } else if (CustomPixelConsts_112.w > 0.f) {
    float target_luminance = dot(
        masked_bloom,
        float3(CustomPixelConsts_144.x, CustomPixelConsts_144.y, CustomPixelConsts_144.z));
    masked_bloom *= min(1.f, CustomPixelConsts_112.w / max(target_luminance, 1.0e-6f));
  }

  if (CustomPixelConsts_112.y > 0.f) {
    float4 depth_gather = t2.GatherRed(
        s0,
        source_position / CustomPixelConsts_000.xy);
    bool has_depth_edge = any(depth_gather < 0.001f);
    if (has_depth_edge) {
      float target_luminance = dot(
          masked_bloom,
          float3(CustomPixelConsts_144.x, CustomPixelConsts_144.y, CustomPixelConsts_144.z));
      masked_bloom *= min(1.f, CustomPixelConsts_112.y / max(target_luminance, 1.0e-6f));
    }
  }

  float output_luminance = dot(
      masked_bloom,
      float3(CustomPixelConsts_144.x, CustomPixelConsts_144.y, CustomPixelConsts_144.z));
  float excess = max(0.f, output_luminance - CustomPixelConsts_128.x);
  float bloom_amount = min(
      CustomPixelConsts_112.x,
      saturate(CustomPixelConsts_128.y * excess) * excess);
  float bloom_scale = bloom_amount
      / max(1.0e-4f, output_luminance)
      * CustomPixelConsts_096.x;
  float3 bloom_source = masked_bloom * bloom_scale;

  // Apply Bloom at the bright-pass source, before the bloom pyramid is blurred
  // and composited back over the scene.
  bloom_source *= bloom_peak > 0.f ? 1.f : CUSTOM_BLOOM;
  return float4(bloom_source, 0.f);
}
