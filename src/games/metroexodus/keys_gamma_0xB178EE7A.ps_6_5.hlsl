#include "./shared.h"

Texture2D<min16float4> t0 : register(t0);

SamplerState s5 : register(s5);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD,
  linear float4 TEXCOORD_1 : TEXCOORD1,
  linear float4 TEXCOORD_2 : TEXCOORD2
) : SV_Target {
  float4 SV_Target;
  float _21;
  float _31;
  float _32;
  float _33;
  float _55;
  float _56;
  float _57;
  min16float4 _9 = t0.Sample(s5, float2(TEXCOORD.x, TEXCOORD.y));
  _21 = float(_9.w) * TEXCOORD_2.w;
  _31 = exp2(log2((float(_9.x) * TEXCOORD_2.z) * _21) * 2.200000047683716f);
  _32 = exp2(log2((float(_9.y) * TEXCOORD_2.y) * _21) * 2.200000047683716f);
  _33 = exp2(log2((float(_9.z) * TEXCOORD_2.x) * _21) * 2.200000047683716f);

  if (CUSTOM_VIDEO != 0 && RENODX_TONE_MAP_TYPE != 0) {
    float3 color = float3(_31, _32, _33);
    float3 linear_color = renodx::color::srgb::Decode(color);
    linear_color = saturate(linear_color);
    float3 pq_color = renodx::color::pq::Encode(renodx::color::bt2020::from::BT709(linear_color), RENODX_GRAPHICS_WHITE_NITS);
    return float4(pq_color, saturate(_21));
  }

  _55 = exp2(log2(abs(mad(0.04331360012292862f, _33, mad(0.3292819857597351f, _32, (_31 * 0.627403974533081f))) * 0.02500000037252903f)) * 0.1593017578125f);
  _56 = exp2(log2(abs(mad(0.011361200362443924f, _33, mad(0.9195399880409241f, _32, (_31 * 0.06909699738025665f))) * 0.02500000037252903f)) * 0.1593017578125f);
  _57 = exp2(log2(abs(mad(0.8955950140953064f, _33, mad(0.08801320195198059f, _32, (_31 * 0.01639159955084324f))) * 0.02500000037252903f)) * 0.1593017578125f);
  SV_Target.x = exp2(log2(((_55 * 18.8515625f) + 0.8359375f) / ((_55 * 18.6875f) + 1.0f)) * 78.84375f);
  SV_Target.y = exp2(log2(((_56 * 18.8515625f) + 0.8359375f) / ((_56 * 18.6875f) + 1.0f)) * 78.84375f);
  SV_Target.z = exp2(log2(((_57 * 18.8515625f) + 0.8359375f) / ((_57 * 18.6875f) + 1.0f)) * 78.84375f);
  SV_Target.w = _21;
  return SV_Target;
}