#include "../include/common.hlsl"
#include "../include/pixel_constants.hlsli"

Texture2D<float4> t0 : register(t0);
Texture2D<float4> t1 : register(t1);

cbuffer cb12 : register(b12) {
  float cb12_000x : packoffset(c000.x);
  float cb12_000y : packoffset(c000.y);
  float cb12_000z : packoffset(c000.z);
  float cb12_021x : packoffset(c021.x);
  float cb12_021y : packoffset(c021.y);
  float cb12_022x : packoffset(c022.x);
  float cb12_022y : packoffset(c022.y);
  float cb12_073z : packoffset(c073.z);
  float cb12_073w : packoffset(c073.w);
  float cb12_211x : packoffset(c211.x);
  float cb12_211y : packoffset(c211.y);
  float cb12_211z : packoffset(c211.z);
  float cb12_211w : packoffset(c211.w);
  float cb12_212x : packoffset(c212.x);
  float cb12_212y : packoffset(c212.y);
  float cb12_212z : packoffset(c212.z);
  float cb12_212w : packoffset(c212.w);
  float cb12_213x : packoffset(c213.x);
  float cb12_213y : packoffset(c213.y);
  float cb12_213z : packoffset(c213.z);
  float cb12_213w : packoffset(c213.w);
  float cb12_214x : packoffset(c214.x);
  float cb12_214y : packoffset(c214.y);
  float cb12_214z : packoffset(c214.z);
  float cb12_214w : packoffset(c214.w);
  float cb12_271x : packoffset(c271.x);
};

SamplerState s0 : register(s0);

float4 main(noperspective float4 SV_Position : SV_Position) : SV_Target {
  float2 pixel = float2(int2(SV_Position.xy));
  float depth = t1.Load(int3(uint2(cb12_271x * pixel), 0)).x;
  if (depth >= SV_Position.z) discard;

  float reconstructed_depth = clamp(
      1.f / (((cb12_022x * depth + cb12_022y) * cb12_021x) + cb12_021y),
      -3.4028234663852886e+38f,
      3.4028234663852886e+38f);
  float radius = saturate(
      sqrt(saturate((reconstructed_depth - CustomPixelConsts_000.x) * CustomPixelConsts_000.w))
      * CustomPixelConsts_000.z);

  float far_depth = clamp(
      1.f / (cb12_021y + cb12_021x),
      -3.4028234663852886e+38f,
      3.4028234663852886e+38f)
      * 0.9990000128746033f;
  if (reconstructed_depth >= far_depth) {
    float projection_w = mad(cb12_213w, depth, mad(cb12_212w, pixel.y, cb12_211w * pixel.x)) + cb12_214w;
    float3 projected_position = float3(
        mad(cb12_213x, depth, mad(cb12_212x, pixel.y, cb12_211x * pixel.x)) + cb12_214x,
        mad(cb12_213y, depth, mad(cb12_212y, pixel.y, cb12_211y * pixel.x)) + cb12_214y,
        mad(cb12_213z, depth, mad(cb12_212z, pixel.y, cb12_211z * pixel.x)) + cb12_214z)
        / projection_w
        - float3(cb12_000x, cb12_000y, cb12_000z);
    radius *= saturate(
        1.f
        - ((projected_position.z * rsqrt(dot(projected_position, projected_position)) - CustomPixelConsts_032.x)
           * CustomPixelConsts_032.y));
  } else {
    radius *= CUSTOM_DEPTH_BLUR;
  }
  if (radius <= 0.009999999776482582f) discard;

  float2 center_uv = float2(cb12_073z * SV_Position.x, cb12_073w * SV_Position.y) * cb12_271x;
  float2 radius_uv = float2(cb12_073z, cb12_073w) * radius * cb12_271x;
  float4 center = t0.SampleLevel(s0, center_uv, 0.f);
  float4 inner_n1 = t0.SampleLevel(s0, center_uv + radius_uv * float2(-0.5f, -1.5f), 0.f);
  float4 inner_n2 = t0.SampleLevel(s0, center_uv + radius_uv * float2(1.5f, -0.5f), 0.f);
  float4 inner_p1 = t0.SampleLevel(s0, center_uv + radius_uv * float2(0.5f, 1.5f), 0.f);
  float4 inner_p2 = t0.SampleLevel(s0, center_uv + radius_uv * float2(-1.5f, 0.5f), 0.f);
  float4 outer_n1 = t0.SampleLevel(s0, center_uv + radius_uv * float2(-2.f, -1.f), 0.f);
  float4 outer_n2 = t0.SampleLevel(s0, center_uv + radius_uv * float2(1.f, -2.f), 0.f);
  float4 outer_p1 = t0.SampleLevel(s0, center_uv + radius_uv * float2(2.f, 1.f), 0.f);
  float4 outer_p2 = t0.SampleLevel(s0, center_uv + radius_uv * float2(-1.f, 2.f), 0.f);

  float weighted_alpha = outer_n1.a + center.a + outer_n2.a + outer_p1.a + outer_p2.a
      + (inner_n2.a + inner_n1.a + inner_p1.a + inner_p2.a) * 4.f;
  float3 weighted_rgb = outer_n1.rgb + center.rgb + outer_n2.rgb + outer_p1.rgb + outer_p2.rgb
      + (inner_n2.rgb + inner_n1.rgb + inner_p1.rgb + inner_p2.rgb) * 4.f;
  float3 output_color = weighted_rgb
      / max(0.0010000000474974513f, weighted_alpha)
      * 0.0416666679084301f;
    float output_alpha = saturate(weighted_alpha * 25.f);
    if (RENODX_TONE_MAP_TYPE >= 2.f && all(uint2(SV_Position.xy) == 0u)) {
        // Alpha is additively blended into the scene; zero preserves its peak marker.
        output_alpha = 0.f;
    }
    return float4(output_color, output_alpha);
}