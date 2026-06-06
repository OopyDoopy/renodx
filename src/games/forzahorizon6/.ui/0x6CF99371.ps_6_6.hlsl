#include "../shared.h"

Texture2D<float4> t0 : register(t0);

cbuffer cb3 : register(b3) {
  float cbUIGlobal_000 : packoffset(c000.x);
  float cbUIGlobal_004 : packoffset(c000.y);
  float cbUIGlobal_008 : packoffset(c000.z);
  float cbUIGlobal_012 : packoffset(c000.w);
  float cbUIGlobal_016 : packoffset(c001.x);
  float cbUIGlobal_020 : packoffset(c001.y);
  float cbUIGlobal_024 : packoffset(c001.z);
  float cbUIGlobal_028 : packoffset(c001.w);
  float2 cbUIGlobal_032 : packoffset(c002.x);
  float2 cbUIGlobal_040 : packoffset(c002.z);
};

cbuffer cb0 : register(b0) {
  float4 cbPixelShader_000 : packoffset(c000.x);
};

SamplerState s0 : register(s0);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float4 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float4 _11;
  float _18;
  float _19;
  float _20;
  float _21;
  float _121;
  float _122;
  float _123;
  float _28;
  float _29;
  float _30;
  float _52;
  float _53;
  float _54;
  _11 = t0.Sample(s0, float2(TEXCOORD.x, TEXCOORD.y));
  _18 = cbPixelShader_000.w * _11.x;
  _19 = cbPixelShader_000.w * _11.y;
  _20 = cbPixelShader_000.w * _11.z;
  _21 = cbPixelShader_000.w * _11.w;
  [branch]
  if (cbUIGlobal_020 != 0.0f) {
    _28 = cbUIGlobal_000 * _18;
    _29 = cbUIGlobal_000 * _19;
    _30 = cbUIGlobal_000 * _20;
    _52 = exp2(log2(saturate(mad(0.04331360012292862f, _30, mad(0.3292819857597351f, _29, (_28 * 0.627403974533081f))) * 9.999999747378752e-05f)) * 0.1593017578125f);
    _53 = exp2(log2(saturate(mad(0.012477199546992779f, _30, mad(0.9417769908905029f, _29, (_28 * 0.045745600014925f))) * 9.999999747378752e-05f)) * 0.1593017578125f);
    _54 = exp2(log2(saturate(mad(0.9836069941520691f, _30, mad(0.017604099586606026f, _29, (_28 * -0.0012105499627068639f))) * 9.999999747378752e-05f)) * 0.1593017578125f);
    _121 = saturate(exp2(log2(((_52 * 18.8515625f) + 0.8359375f) / ((_52 * 18.6875f) + 1.0f)) * 78.84375f));
    _122 = saturate(exp2(log2(((_53 * 18.8515625f) + 0.8359375f) / ((_53 * 18.6875f) + 1.0f)) * 78.84375f));
    _123 = saturate(exp2(log2(((_54 * 18.8515625f) + 0.8359375f) / ((_54 * 18.6875f) + 1.0f)) * 78.84375f));
  } else {
    _121 = exp2(log2(select((_18 <= 0.0031308000907301903f), (_18 * 12.920000076293945f), ((exp2(log2(abs(_18)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f))) * cbUIGlobal_016);
    _122 = exp2(log2(select((_19 <= 0.0031308000907301903f), (_19 * 12.920000076293945f), ((exp2(log2(abs(_19)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f))) * cbUIGlobal_016);
    _123 = exp2(log2(select((_20 <= 0.0031308000907301903f), (_20 * 12.920000076293945f), ((exp2(log2(abs(_20)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f))) * cbUIGlobal_016);
  }
  SV_Target.x = (_121 * _21);
  SV_Target.y = (_122 * _21);
  SV_Target.z = (_123 * _21);
  SV_Target.w = _21;
  return SV_Target;
}