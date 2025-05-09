#include "./shared.h"

float3 CustomTonemap(float3 untonemapped, float3 tonemapped_bt709) {
  untonemapped = renodx::color::srgb::DecodeSafe(untonemapped);
  tonemapped_bt709 = renodx::color::srgb::DecodeSafe(tonemapped_bt709);
  float3 outputColor;
    if (RENODX_TONE_MAP_TYPE == 0.f) {
      outputColor = saturate(tonemapped_bt709);
    } else {
      outputColor = renodx::draw::ToneMapPass(untonemapped, tonemapped_bt709);
    }
    return renodx::color::srgb::EncodeSafe(outputColor);
}

float3 CustomPostProcessing(float3 color, float2 coords) {
  float3 outputColor = renodx::color::srgb::DecodeSafe(color);
  outputColor = renodx::effects::ApplyFilmGrain(outputColor, coords, CUSTOM_RANDOM, CUSTOM_FILM_GRAIN_STRENGTH * 0.03f);

  return renodx::color::srgb::EncodeSafe(outputColor);
}

float3 CustomIntermediatePass(float3 color) {
  return renodx::draw::RenderIntermediatePass(renodx::color::srgb::DecodeSafe(color));
}