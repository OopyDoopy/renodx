#include "../include/pixel_constants.hlsli"

Texture2D<float4> t0 : register(t0);
Texture2D<float4> t1 : register(t1);
Texture2D<float4> t2 : register(t2);
Texture2D<uint2> t4 : register(t4);

cbuffer cb12 : register(b12) {
  float cb12_021x : packoffset(c021.x);
  float cb12_021y : packoffset(c021.y);
  float cb12_022x : packoffset(c022.x);
  float cb12_022y : packoffset(c022.y);
  float cb12_023x : packoffset(c023.x);
  float cb12_023y : packoffset(c023.y);
  float cb12_023z : packoffset(c023.z);
  float cb12_023w : packoffset(c023.w);
  float cb12_073z : packoffset(c073.z);
  float cb12_073w : packoffset(c073.w);
  float cb12_271x : packoffset(c271.x);
  float cb12_271y : packoffset(c271.y);
};

SamplerState s0 : register(s0);

float4 main(noperspective float4 SV_Position : SV_Position) : SV_Target {
  int2 pixel = int2(SV_Position.xy);
  int2 depth_pixel = int2(min(
      cb12_271x * SV_Position.xy,
      float2(cb12_023x, cb12_023y) - 1.f));
  float depth = t2.Load(int3(depth_pixel, 0)).x;

  float2 screen_position = float2(
      cb12_271x * 2.f * cb12_023z * SV_Position.x - 1.f,
      -(cb12_271x * 2.f * cb12_023w * SV_Position.y - 1.f));
  float view_depth = cb12_022x * depth + cb12_022y;
  float projection_w = max(
      dot(float3(screen_position, view_depth), CustomPixelConsts_336[3].xyz)
          + CustomPixelConsts_336[3].w,
      0.25f);
  float2 previous_position = float2(
      dot(float3(screen_position, view_depth), CustomPixelConsts_336[0].xyz)
          + CustomPixelConsts_336[0].w,
      dot(float3(screen_position, view_depth), CustomPixelConsts_336[1].xyz)
          + CustomPixelConsts_336[1].w)
      / projection_w;

  float2 motion = float2(
      cb12_023x
          * (cb12_023z * SV_Position.x * cb12_271x - 0.5f - previous_position.x * 0.5f),
      cb12_023y
          * (cb12_023w * SV_Position.y * cb12_271x - 0.5f + previous_position.y * 0.5f))
      * cb12_271y;
  float reconstructed_depth = clamp(
      rcp(view_depth * cb12_021x + cb12_021y),
      -3.4028234663852886e+38f,
      3.4028234663852886e+38f);
  uint2 stencil = t4.Load(int3(depth_pixel, 0));
  float depth_scale = (stencil.y & 2u) != 0u
      ? CustomPixelConsts_016.y
          + saturate(CustomPixelConsts_016.z * reconstructed_depth + CustomPixelConsts_016.w)
              * CustomPixelConsts_016.x
      : 1.f;
  float blur_amount = depth_scale
      * saturate(
          (CustomPixelConsts_000.y
           + saturate(CustomPixelConsts_000.z * reconstructed_depth + CustomPixelConsts_000.w)
               * CustomPixelConsts_000.x)
          * length(motion)
          * CustomPixelConsts_032.x);

  float2 blur_uv = float2(
      cb12_073z * min(float(pixel.x), cb12_271y * cb12_023x - 2.f),
      cb12_073w * min(float(pixel.y), cb12_271y * cb12_023y - 2.f))
      * cb12_271x;
  float4 blurred = t1.SampleLevel(s0, blur_uv, 1.f);
  float4 source = t0.Load(int3(pixel, 0));

  float4 output_color = float4(lerp(source.rgb, blurred.rgb, blur_amount), 1.f);
    // Motion blur normally discards alpha. Preserve only the reserved peak marker texel.
    if (all(pixel == 0)) {
    output_color.a = source.a;
  }
  return output_color;
}