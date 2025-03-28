#include "./shared.h"

float3 CustomTonemap(float3 untonemapped, float3 tonemapped_bt709) {
  float3 outputColor;
    if (RENODX_TONE_MAP_TYPE == 0.f) {
      outputColor = renodx::color::srgb::DecodeSafe(tonemapped_bt709);
    } else {
      outputColor = renodx::draw::ToneMapPass(
          renodx::color::srgb::DecodeSafe(untonemapped),
          renodx::color::srgb::DecodeSafe(tonemapped_bt709));
    }
//   if (RENODX_TONE_MAP_TYPE == 0.f) {
//         outputColor = untonemapped;
//       } else {
//         outputColor = renodx::draw::ToneMapPass(untonemapped, tonemapped_bt709);
//       }
  return renodx::draw::RenderIntermediatePass(outputColor);
}