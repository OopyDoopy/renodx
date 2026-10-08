#ifndef SRC_THEWITCHER3REMASTERED_FINAL_SDR_PASS_HLSLI_
#define SRC_THEWITCHER3REMASTERED_FINAL_SDR_PASS_HLSLI_

#include "../include/common.hlsl"
#include "./lilium_rcas.hlsl"

float3 TheWitcher3RemasteredCompositeFinalSDRUI(
    float3 scene_color_bt709,
    float3 ui_color_bt709,
    float ui_alpha) {
  if (ui_alpha <= 0.f) return scene_color_bt709;

  // Scene tonemapping already ran in the final grading shader. Gamut-fit both
  // layers and preserve the game's UI alpha composite here.
  float3 sanitized_ui_color = SanitizeGamutInput(ui_color_bt709);
  float3 ui_color = renodx::color::gamut::GamutCompressBT709(sanitized_ui_color);
  return HandleUICompositing(
      float4(ui_color, ui_alpha),
      float4(scene_color_bt709, 1.f)).rgb;
}

    float3 TheWitcher3RemasteredApplyFinalSDRSceneEffects(
        float3 scene_color_linear,
        float2 texcoord,
        Texture2D<float4> scene_texture,
        SamplerState scene_sampler) {
      scene_color_linear = ApplyRCAS(scene_color_linear, texcoord, scene_texture, scene_sampler);
      return renodx::effects::ApplyFilmGrain(
      scene_color_linear,
      texcoord,
      CUSTOM_RANDOM,
      CUSTOM_FILM_GRAIN_STRENGTH * 0.03f);
    }

float3 TheWitcher3RemasteredEncodeFinalSDR(float3 output_color_bt709) {
  float3 display_linear = saturate(output_color_bt709);
  if (CUSTOM_SDR_OUTPUT_ENCODING == 0.f) {
    return renodx::color::srgb::EncodeSafe(display_linear);
  }
  float output_gamma = CUSTOM_SDR_OUTPUT_ENCODING == 2.f ? 2.4f : 2.2f;
  return renodx::color::gamma::EncodeSafe(display_linear, output_gamma);
}

#endif  // SRC_THEWITCHER3REMASTERED_FINAL_SDR_PASS_HLSLI_