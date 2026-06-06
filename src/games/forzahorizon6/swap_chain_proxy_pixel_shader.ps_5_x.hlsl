#include "./shared.h"

Texture2D t0 : register(t0);
SamplerState s0 : register(s0);
float4 main(float4 vpos: SV_POSITION, float2 uv: TEXCOORD0)
    : SV_TARGET {
  //return renodx::draw::SwapChainPass(t0.Sample(s0, uv));
  float4 color = t0.Sample(s0, uv);
  color.xyz = renodx::color::pq::DecodeSafe(color.xyz, 100.f);
  color.xyz = renodx::color::pq::EncodeSafe(color.xyz, RENODX_GRAPHICS_WHITE_NITS);
  return color;
}
