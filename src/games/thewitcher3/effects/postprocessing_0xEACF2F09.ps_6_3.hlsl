#include "../include/common.hlsl"
#include "../include/pixel_constants.hlsli"

Texture2D<float4> t1 : register(t1);

float4 main(noperspective float4 SV_Position : SV_Position) : SV_Target {
  uint2 local_pixel = uint2(int2(SV_Position.xy) - int2(CustomPixelConsts_160.zw));
  int2 minimum_pixel = int2(CustomPixelConsts_192.xy);
  int2 maximum_pixel = int2(CustomPixelConsts_192.zw);
  int2 direction = int2(CustomPixelConsts_176.xy);
  int2 source_origin = int2(CustomPixelConsts_160.xy);

  float3 tap_n4 = t1.Load(int3(clamp(uint2(direction * -4 + local_pixel + source_origin), minimum_pixel, maximum_pixel), 0)).rgb;
  float3 tap_n3 = t1.Load(int3(clamp(uint2(direction * -3 + local_pixel + source_origin), minimum_pixel, maximum_pixel), 0)).rgb;
  float3 tap_n2 = t1.Load(int3(clamp(uint2(direction * -2 + local_pixel + source_origin), minimum_pixel, maximum_pixel), 0)).rgb;
  float3 tap_n1 = t1.Load(int3(clamp(uint2(-direction + local_pixel + source_origin), minimum_pixel, maximum_pixel), 0)).rgb;
  float3 tap_0 = t1.Load(int3(clamp(uint2(local_pixel + source_origin), minimum_pixel, maximum_pixel), 0)).rgb;
  float3 tap_p1 = t1.Load(int3(clamp(uint2(direction + local_pixel + source_origin), minimum_pixel, maximum_pixel), 0)).rgb;
  float3 tap_p2 = t1.Load(int3(clamp(uint2((direction << 1) + local_pixel + source_origin), minimum_pixel, maximum_pixel), 0)).rgb;
  float3 tap_p3 = t1.Load(int3(clamp(uint2(direction * 3 + local_pixel + source_origin), minimum_pixel, maximum_pixel), 0)).rgb;
  float3 tap_p4 = t1.Load(int3(clamp(uint2((direction << 2) + local_pixel + source_origin), minimum_pixel, maximum_pixel), 0)).rgb;

  float3 color = (tap_p1 + tap_n1) * 0.1790439933538437f
      + tap_0 * 0.20236000418663025f
      + (tap_p2 + tap_n2) * 0.12400899827480316f
      + (tap_p3 + tap_n3) * 0.06723400205373764f
      + (tap_p4 + tap_n4) * 0.02853200025856495f;
  float strength = RENODX_TONE_MAP_TYPE >= 2.f ? 1.f : CUSTOM_BLOOM;
  return float4(color * strength, 0.f);
}