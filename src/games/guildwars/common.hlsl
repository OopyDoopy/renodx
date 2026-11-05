#include "./shared.h"
#include "./lms_gamut_compression.hlsli"

float3 IntermediatePass(float3 color) {
  if (RENODX_TONE_MAP_TYPE == 0.f) color = saturate(color);
  color *= RENODX_DIFFUSE_WHITE_NITS / RENODX_GRAPHICS_WHITE_NITS;
  return renodx::color::srgb::EncodeSafe(color);
}

float3 InvertIntermediatePass(float3 color) {
  if (RENODX_PEAK_WHITE_NITS <= 0.f || RENODX_DIFFUSE_WHITE_NITS <= 0.f || RENODX_GRAPHICS_WHITE_NITS <= 0.f) return color;
  color = renodx::color::srgb::DecodeSafe(color);
  return color * (RENODX_GRAPHICS_WHITE_NITS / RENODX_DIFFUSE_WHITE_NITS);
}

float3 FinalPass(float3 color) {
  color = renodx::color::srgb::DecodeSafe(color);
  if (RENODX_SWAP_CHAIN_OUTPUT_PRESET == 0.f) {
    color = saturate(CompressLMSRadialBT709(color));
    if (RENODX_SDR_ENCODING == 0.f) return renodx::color::srgb::EncodeSafe(color);
    if (RENODX_SDR_ENCODING == 1.f) return saturate(renodx::color::gamma::EncodeSafe(color, 2.2f));
    return saturate(renodx::color::gamma::EncodeSafe(color, 2.4f));
  }
  color = renodx::color::bt2020::from::BT709(color);
  color = CompressLMSRadialBT2020(color);
  color *= RENODX_GRAPHICS_WHITE_NITS;
  return renodx::color::pq::EncodeSafe(min(color, RENODX_PEAK_WHITE_NITS), 1.f);
}
