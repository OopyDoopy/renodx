#include "../include/common.hlsl"
#include "../include/pixel_constants.hlsli"

Texture2D<float4> t0 : register(t0);
Texture2D<float4> t1 : register(t1);

cbuffer cb12 : register(b12) {
  float cb12_022x : packoffset(c022.x);
  float cb12_022y : packoffset(c022.y);
  float cb12_073x : packoffset(c073.x);
  float cb12_073y : packoffset(c073.y);
  float cb12_270x : packoffset(c270.x);
  float cb12_270y : packoffset(c270.y);
  float cb12_271x : packoffset(c271.x);
};

float4 main(noperspective float4 SV_Position : SV_Position) : SV_Target {
  int2 pixel = int2(SV_Position.xy);
  float inverse_scale = 1.f / cb12_271x;
  float scaled_height = cb12_073y * inverse_scale;
  float2 pixel_float = float2(pixel);

  uint2 mask_pixel = uint2(
      ((cb12_270x * inverse_scale) + pixel_float.x) * cb12_271x,
      (pixel_float.y - (cb12_270y * inverse_scale)) * cb12_271x);
  float mask_depth = t1.Load(int3(mask_pixel, 0)).x;
  float4 source = t0.Load(int3(pixel, 0));

  float dynamic_peak = DecodePostProcessingPeak(t0.Load(int3(0, 0, 0)).a);
  if (dynamic_peak > 0.f) {
    source = ClampPostProcessing(
        source,
        dynamic_peak,
        renodx::color::BT709_TO_XYZ_MAT[1].rgb,
          CUSTOM_SUNSHAFTS_STRENGTH,
          1.f);
  }

  float2 sun_delta = float2(
      ((inverse_scale * CustomPixelConsts_032.x) * cb12_073x) - pixel_float.x,
      (scaled_height * CustomPixelConsts_032.y) - pixel_float.y);
  float mask = saturate(
      select(((cb12_022x * mask_depth) + cb12_022y) >= 1.f, 1.f, 0.f)
      + float(length(sun_delta) / scaled_height < 0.05000000074505806f));

  float strength = RENODX_TONE_MAP_TYPE >= 2.f ? 1.f : CUSTOM_SUNSHAFTS_STRENGTH;
  return float4(mask * source.rgb * strength, 1.f);
}