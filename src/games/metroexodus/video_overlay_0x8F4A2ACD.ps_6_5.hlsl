#include "./shared.h"

Texture2D<min16float4> t0 : register(t0);

SamplerState s5 : register(s5);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD,
  linear float4 TEXCOORD_1 : TEXCOORD1,
  linear float4 TEXCOORD_2 : TEXCOORD2
) : SV_Target {
  float4 SV_Target;
  float _21;
  float _25;
  float _26;
  float _27;
  float _49;
  float _50;
  float _51;
  float _73;
  float _74;
  float _75;
  min16float4 _9 = t0.Sample(s5, float2(TEXCOORD.x, TEXCOORD.y));
  _21 = float(_9.w) * TEXCOORD_2.w;
  _25 = max(6.103519990574569e-05f, ((float(_9.x) * TEXCOORD_2.z) * _21));
  _26 = max(6.103519990574569e-05f, ((float(_9.y) * TEXCOORD_2.y) * _21));
  _27 = max(6.103519990574569e-05f, ((float(_9.z) * TEXCOORD_2.x) * _21));
  if (CUSTOM_VIDEO != 0 && RENODX_TONE_MAP_TYPE != 0) {
    float3 color = float3(_25, _26, _27);
    float3 linear_color = renodx::color::srgb::Decode(color);
    float3 pq_color = renodx::color::pq::Encode(renodx::color::bt2020::from::BT709(linear_color), RENODX_GRAPHICS_WHITE_NITS);
    return float4(pq_color, _21);
  }
  _49 = select((_25 > 0.040449999272823334f), exp2(log2((_25 * 0.9478672742843628f) + 0.05213269963860512f) * 2.4000000953674316f), (_25 * 0.07739938050508499f));
  _50 = select((_26 > 0.040449999272823334f), exp2(log2((_26 * 0.9478672742843628f) + 0.05213269963860512f) * 2.4000000953674316f), (_26 * 0.07739938050508499f));
  _51 = select((_27 > 0.040449999272823334f), exp2(log2((_27 * 0.9478672742843628f) + 0.05213269963860512f) * 2.4000000953674316f), (_27 * 0.07739938050508499f));
  _73 = exp2(log2(abs(mad(0.04331360012292862f, _51, mad(0.3292819857597351f, _50, (_49 * 0.627403974533081f))) * 0.02500000037252903f)) * 0.1593017578125f);
  _74 = exp2(log2(abs(mad(0.011361200362443924f, _51, mad(0.9195399880409241f, _50, (_49 * 0.06909699738025665f))) * 0.02500000037252903f)) * 0.1593017578125f);
  _75 = exp2(log2(abs(mad(0.8955950140953064f, _51, mad(0.08801320195198059f, _50, (_49 * 0.01639159955084324f))) * 0.02500000037252903f)) * 0.1593017578125f);
  SV_Target.x = exp2(log2(((_73 * 18.8515625f) + 0.8359375f) / ((_73 * 18.6875f) + 1.0f)) * 78.84375f);
  SV_Target.y = exp2(log2(((_74 * 18.8515625f) + 0.8359375f) / ((_74 * 18.6875f) + 1.0f)) * 78.84375f);
  SV_Target.z = exp2(log2(((_75 * 18.8515625f) + 0.8359375f) / ((_75 * 18.6875f) + 1.0f)) * 78.84375f);
  SV_Target.w = _21;
  return SV_Target;
}