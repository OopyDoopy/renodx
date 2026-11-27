#include "../shared.h"

Texture2DArray<float4> t0 : register(t0);

Texture2DArray<float4> t1 : register(t1);

cbuffer cb3 : register(b3) {
  float4 CustomPixelConsts_000 : packoffset(c000.x);
  float4 CustomPixelConsts_016 : packoffset(c001.x);
  float4 CustomPixelConsts_032 : packoffset(c002.x);
  float4 CustomPixelConsts_048 : packoffset(c003.x);
  float4 CustomPixelConsts_064 : packoffset(c004.x);
  float4 CustomPixelConsts_080 : packoffset(c005.x);
  float4 CustomPixelConsts_096 : packoffset(c006.x);
  float4 CustomPixelConsts_112 : packoffset(c007.x);
  float4 CustomPixelConsts_128 : packoffset(c008.x);
  float4 CustomPixelConsts_144 : packoffset(c009.x);
  float4 CustomPixelConsts_160 : packoffset(c010.x);
  float4 CustomPixelConsts_176 : packoffset(c011.x);
  float4 CustomPixelConsts_192 : packoffset(c012.x);
  float4 CustomPixelConsts_208 : packoffset(c013.x);
  float4 CustomPixelConsts_224 : packoffset(c014.x);
  float4 CustomPixelConsts_240 : packoffset(c015.x);
  float4 CustomPixelConsts_256 : packoffset(c016.x);
  float4 CustomPixelConsts_272 : packoffset(c017.x);
  float4 CustomPixelConsts_288 : packoffset(c018.x);
  float4 CustomPixelConsts_304 : packoffset(c019.x);
  float4 CustomPixelConsts_320 : packoffset(c020.x);
  row_major float4x4 CustomPixelConsts_336 : packoffset(c021.x);
};

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position
) : SV_Target {
  float4 SV_Target;
  uint _7;
  uint _11;
  uint _13;
  uint _15;
  float _22;
  float _26;
  float _27;
  float _28;
  float _31;
  float _32;
  float _37;
  float _40;
  float _44;
  float _45;
  float _46;
  float _47;
  float _49;
  float _50;
  float _51;
  float _52;
  float _53;
  float _54;
  float _55;
  int _95;
  float _96;
  float _97;
  float _130;
  float _131;
  float _63;
  float _64;
  float _77;
  float _78;
  float _87;
  float _89;
  uint _99;
  float _101;
  float _102;
  uint _109;
  uint _110;
  float4 _116;
  float _132;
  float _135;
  float _157;
  _7 = uint(SV_Position.x);
  _11 = uint(CustomPixelConsts_000.y);
  _13 = uint(CustomPixelConsts_000.z);
  _15 = (_13 << 1) + _11;
  _22 = float((uint)_13);
  _26 = float((uint)_11);
  _27 = ((float((uint)(_7 % _15)) + 0.5f) - _22) / _26;
  _28 = ((0.5f - _22) + float((uint)((int)(uint(SV_Position.y)) % _15))) / _26;
  _31 = (_27 * 2.0f) + -1.0f;
  _32 = (_28 * 2.0f) + -1.0f;
  _37 = dot(float2(_31, _32), float2(_31, _32));
  _40 = select((((int)(_7 / _15)) != 0), 1.0f, -1.0f);
  _44 = _37 + 1.0f;
  _45 = (((_27 * 4.0f) + -2.0f) * _40) / _44;
  _46 = ((2.0f - (_28 * 4.0f)) * _40) / _44;
  _47 = ((_37 + -1.0f) * _40) / _44;
  _49 = rsqrt(dot(float3(_45, _46, _47), float3(_45, _46, _47)));
  _50 = _49 * _45;
  _51 = _49 * _46;
  _52 = _49 * _47;
  _53 = abs(_50);
  _54 = abs(_51);
  _55 = abs(_52);
  if (_53 > max(_54, _55)) {
    _63 = (_52 / _53) * 0.5f;
    _64 = ((_51 / _53) * 0.5f) + 0.5f;
    if (!(_50 < 0.0f)) {
      _95 = 1;
      _96 = (0.5f - _63);
      _97 = _64;
    } else {
      _95 = 0;
      _96 = (_63 + 0.5f);
      _97 = _64;
    }
  } else {
    if (!(_54 < max(_53, _55))) {
      _77 = (_52 / _54) * 0.5f;
      _78 = 0.5f - ((_50 / _54) * 0.5f);
      if (_51 > 0.0f) {
        _95 = 3;
        _96 = _78;
        _97 = (_77 + 0.5f);
      } else {
        _95 = 2;
        _96 = _78;
        _97 = (0.5f - _77);
      }
    } else {
      _87 = (_50 / _55) * 0.5f;
      _89 = ((_51 / _55) * 0.5f) + 0.5f;
      if (_52 > 0.0f) {
        _95 = 5;
        _96 = (_87 + 0.5f);
        _97 = _89;
      } else {
        _95 = 4;
        _96 = (0.5f - _87);
        _97 = _89;
      }
    }
  }
  _99 = uint(CustomPixelConsts_000.x);
  _101 = float((uint)(_99 + (uint)(-1)));
  _102 = float((uint)_99);
  _109 = uint(min(max((_96 * _102), 0.0f), _101));
  _110 = uint(min(max((_97 * _102), 0.0f), _101));
  _116 = t1.Load(int4(_109, _110, _95, 0));
  if ((_110 & 1) == 0) {
    _130 = _116.y;
    _131 = (((float4)(t1.Load(int4(_109, ((int)(_110 + 1u)), _95, 0)))).y);
  } else {
    _130 = (((float4)(t1.Load(int4(_109, ((int)(_110 + (uint)(-1))), _95, 0)))).y);
    _131 = _116.y;
  }
  _132 = _131 + -0.5f;
  _135 = _130 + -0.5f;
  _157 = select(((((float4)(t0.Load(int4(_109, _110, _95, 0)))).x) >= 1.0f), 0.0f, 1.0f);
  if (CUSTOM_VIDEO != 0.f) {
    float3 ycbcr = float3(
        _116.x,
        _135 + (128.f / 255.f),
        _132 + (128.f / 255.f));
    float3 video_color = saturate(renodx::color::bt709::from::YCbCr(ycbcr));
    SV_Target = float4(video_color * _157, 1.0f);
    return SV_Target;
  }
  SV_Target.x = (exp2(log2(abs(saturate((_132 * 1.4019999504089355f) + _116.x))) * 2.200000047683716f) * _157);
  SV_Target.y = (exp2(log2(abs(saturate((_116.x - (_135 * 0.3440000116825104f)) - (_132 * 0.7139999866485596f)))) * 2.200000047683716f) * _157);
  SV_Target.z = (exp2(log2(abs(saturate((_135 * 1.7719999551773071f) + _116.x))) * 2.200000047683716f) * _157);
  SV_Target.w = 1.0f;
  return SV_Target;
}