#include "./shared.h"

Texture2D<min16float4> t0 : register(t0);

SamplerState s5 : register(s5);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  nointerpolation uint SV_SampleIndex : SV_SampleIndex,
  linear float2 TEXCOORD : TEXCOORD,
  linear float4 TEXCOORD_1 : TEXCOORD1
) : SV_Target {
  float4 SV_Target;
  float _22;
  float _23;
  float _24;
  float _30;
  float _36;
  float _53;
  float _54;
  float _55;
  float _56;
  float _59;
  float _69;
  float _76;
  float _84;
  float _94;
  float _95;
  float _96;
  float _118;
  float _119;
  float _120;
  _22 = saturate((0.001953125f / max(max(abs(ddx_coarse(TEXCOORD.x)), abs(ddy_coarse(TEXCOORD.x))), max(abs(ddx_coarse(TEXCOORD.y)), abs(ddy_coarse(TEXCOORD.y))))) + -1.0f);
  _23 = TEXCOORD.x + -0.0009765625f;
  _24 = TEXCOORD.y + -0.0009765625f;
  min16float4 _25 = t0.SampleBias(s5, float2(_23, _24), -0.5f, int2(0, 0));
  _30 = TEXCOORD.x + 0.0009765625f;
  min16float4 _31 = t0.SampleBias(s5, float2(_30, _24), -0.5f, int2(0, 0));
  _36 = TEXCOORD.y + 0.0009765625f;
  min16float4 _37 = t0.SampleBias(s5, float2(_23, _36), -0.5f, int2(0, 0));
  min16float4 _42 = t0.SampleBias(s5, float2(_30, _36), -0.5f, int2(0, 0));
  _53 = abs(((float(_31.x) + float(_25.x)) + float(_37.x)) + float(_42.x));
  _54 = abs(((float(_31.y) + float(_25.y)) + float(_37.y)) + float(_42.y));
  _55 = _53 * 0.25f;
  _56 = _54 * 0.25f;
  _59 = saturate((_54 * 0.3125000298023224f) + -0.1250000149011612f);
  _69 = saturate((_53 * 0.3125000298023224f) + -0.1250000149011612f);
  _76 = ((((_69 * _69) * (3.0f - (_69 * 2.0f))) - _55) * _22) + _55;
  _84 = ((((((((_59 * _59) * (3.0f - (_59 * 2.0f))) - _56) * _22) + _56) - _76) * dot(float3(TEXCOORD_1.z, TEXCOORD_1.y, TEXCOORD_1.x), float3(0.29899999499320984f, 0.5870000123977661f, 0.11400000005960464f))) + _76) * TEXCOORD_1.w;
  _94 = exp2(log2((_76 * TEXCOORD_1.z) * _84) * 2.200000047683716f);
  _95 = exp2(log2((_76 * TEXCOORD_1.y) * _84) * 2.200000047683716f);
  _96 = exp2(log2((_76 * TEXCOORD_1.x) * _84) * 2.200000047683716f);

  if (RENODX_TONE_MAP_TYPE != 0) {
    float3 subtitles = float3(_94, _95, _96);
    float3 subtitles_linear = renodx::color::srgb::DecodeSafe(subtitles);
    subtitles_linear = saturate(subtitles_linear);
    float3 pq_color = renodx::color::pq::Encode(renodx::color::bt2020::from::BT709(subtitles_linear), RENODX_GRAPHICS_WHITE_NITS);
    SV_Target = float4(pq_color, _84);
    return SV_Target;
  }

  _118 = exp2(log2(abs(mad(0.04331360012292862f, _96, mad(0.3292819857597351f, _95, (_94 * 0.627403974533081f))) * 0.02500000037252903f)) * 0.1593017578125f);
  _119 = exp2(log2(abs(mad(0.011361200362443924f, _96, mad(0.9195399880409241f, _95, (_94 * 0.06909699738025665f))) * 0.02500000037252903f)) * 0.1593017578125f);
  _120 = exp2(log2(abs(mad(0.8955950140953064f, _96, mad(0.08801320195198059f, _95, (_94 * 0.01639159955084324f))) * 0.02500000037252903f)) * 0.1593017578125f);
  SV_Target.x = exp2(log2(((_118 * 18.8515625f) + 0.8359375f) / ((_118 * 18.6875f) + 1.0f)) * 78.84375f);
  SV_Target.y = exp2(log2(((_119 * 18.8515625f) + 0.8359375f) / ((_119 * 18.6875f) + 1.0f)) * 78.84375f);
  SV_Target.z = exp2(log2(((_120 * 18.8515625f) + 0.8359375f) / ((_120 * 18.6875f) + 1.0f)) * 78.84375f);
  SV_Target.w = _84;
  return SV_Target;
}