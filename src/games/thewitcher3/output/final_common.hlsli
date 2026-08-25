#include "../include/common.hlsl"
#include "./lilium_rcas.hlsl"
#include "../include/pixel_constants.hlsli"

float3 ApplyFinalSceneEffects(
    float3 linear_scene,
    float2 texcoord,
    Texture2D<float4> scene_texture,
    SamplerState scene_sampler,
    bool render_intermediate) {
  linear_scene = ApplyRCAS(linear_scene, texcoord, scene_texture, scene_sampler);
  linear_scene = renodx::effects::ApplyFilmGrain(
      linear_scene,
      texcoord,
      CUSTOM_RANDOM,
      CUSTOM_FILM_GRAIN_STRENGTH * 0.03f);
  if (render_intermediate) {
    linear_scene = renodx::draw::RenderIntermediatePass(linear_scene);
  }
  return linear_scene;
}

bool IsFinalOverlayPixel(int2 pixel) {
  int2 overlay_origin = int2(CustomPixelConsts_048.xy);
  int2 overlay_end = int2(CustomPixelConsts_048.xy + CustomPixelConsts_048.zw);
  return CustomPixelConsts_016.z > 0.5f
      && all(pixel >= overlay_origin)
      && all(pixel < overlay_end);
}

float4 LoadFinalOverlay(
    int2 pixel,
    Texture2D<float4> overlay_texture,
    SamplerState overlay_sampler,
    float gamma) {
  float2 overlay_uv = (float2(pixel) - CustomPixelConsts_048.xy) / CustomPixelConsts_048.zw;
  float4 overlay = overlay_texture.SampleLevel(overlay_sampler, overlay_uv, 0.f);
  return float4(exp2(log2(overlay.rgb) * gamma), 1.f);
}