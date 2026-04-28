#define USE_LOW
#include "./tonemap.hlsli"

#if 0
Texture2D<min16float4> t0 : register(t0);

Texture2D<min16float4> t1 : register(t1);

Texture3D<min16float4> t2 : register(t2);

Texture2D<float4> t3 : register(t3);

Texture2D<min16float4> t4 : register(t4);

cbuffer cb1 : register(b1) {
  float4 cb_instance_000 : packoffset(c000.x);
  float4 cb_instance_016 : packoffset(c001.x);
};

cbuffer cb8 : register(b8) {
  float4 cb_misc_000 : packoffset(c000.x);
  float4 cb_misc_016 : packoffset(c001.x);
  float4 cb_misc_032 : packoffset(c002.x);
  float4 cb_misc_048 : packoffset(c003.x);
  float4 cb_misc_064 : packoffset(c004.x);
  float4 cb_misc_080 : packoffset(c005.x);
  row_major float4x4 cb_misc_096 : packoffset(c006.x);
  float4 cb_misc_160 : packoffset(c010.x);
  float4 cb_misc_176 : packoffset(c011.x);
  float4 cb_misc_192 : packoffset(c012.x);
  float4 cb_misc_208 : packoffset(c013.x);
  float4 cb_misc_224 : packoffset(c014.x);
  float4 cb_misc_240 : packoffset(c015.x);
  float4 cb_misc_256 : packoffset(c016.x);
  float4 cb_misc_272 : packoffset(c017.x);
  float4 cb_misc_288 : packoffset(c018.x);
  float4 cb_misc_304 : packoffset(c019.x);
  float4 cb_misc_320 : packoffset(c020.x);
  float4 cb_misc_336 : packoffset(c021.x);
  float4 cb_misc_352 : packoffset(c022.x);
  float4 cb_misc_368 : packoffset(c023.x);
  float4 cb_misc_384 : packoffset(c024.x);
  float4 cb_misc_400 : packoffset(c025.x);
  float4 cb_misc_416 : packoffset(c026.x);
  float4 cb_misc_432 : packoffset(c027.x);
  row_major float4x4 cb_misc_448 : packoffset(c028.x);
  int4 cb_misc_512 : packoffset(c032.x);
  float4 cb_misc_528 : packoffset(c033.x);
  float4 cb_misc_544 : packoffset(c034.x);
  float4 cb_misc_560 : packoffset(c035.x);
  float4 cb_misc_576 : packoffset(c036.x);
  float4 cb_misc_592 : packoffset(c037.x);
  row_major float3x4 cb_misc_608 : packoffset(c038.x);
  row_major float3x4 cb_misc_656 : packoffset(c041.x);
  float4 cb_misc_704 : packoffset(c044.x);
  float4 cb_misc_720 : packoffset(c045.x);
  float4 cb_misc_736 : packoffset(c046.x);
  float4 cb_misc_752 : packoffset(c047.x);
  float4 cb_misc_768 : packoffset(c048.x);
  float4 cb_misc_784[4] : packoffset(c049.x);
};

SamplerState s5 : register(s5);

SamplerState s6 : register(s6);
#endif

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float3 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _15;
  float _16;
  half _23;
  float _45;
  float _46;
  float _51;
  float _59;
  float _81;
  half _84;
  float _88;
  float _89;
  float _90;
  float _91;
  float _92;
  float _93;
  float _100;
  float _102;
  float _112;
  float _118;
  float _128;
  float _129;
  float _130;
  float _131;
  float _132;
  float _133;
  float _185;
  float _186;
  float _187;
  float _190;
  float _201;
  float _202;
  float _203;
  float _204;
  float _224;
  float _225;
  float _226;
  float _259;
  float _260;
  float _261;
  float _262;
  float _274;
  float _287;
  float _288;
  float _289;
  float _300;
  float _313;
  float _314;
  float _315;
  _15 = cb_misc_048.x * SV_Position.x;
  _16 = cb_misc_048.y * SV_Position.y;
  min16float4 _17 = t1.SampleLevel(s6, float2(_15, _16), 0.0f);
  _23 = 1.0h / ((half)(1.0h - (half)(dot(half3((half)(_17.x), (half)(_17.y), (half)(_17.z)), half3(0.29907227h, 0.58691406h, 0.11401367h)))));
  _45 = _15 - cb_misc_000.x;
  _46 = _16 - cb_misc_000.y;
  min16float4 _47 = t4.Sample(s6, float2(_45, _46));
  _51 = cb_misc_000.y + _16;
  min16float4 _52 = t4.Sample(s6, float2(_45, _51));
  _59 = cb_misc_000.x + _15;
  min16float4 _60 = t4.Sample(s6, float2(_59, _51));
  min16float4 _67 = t4.Sample(s6, float2(_59, _46));
  _81 = exp2(cb_misc_336.y);
  _84 = half((_81 * 0.0416666679084301f) * ((((((float4)(t3.Sample(s5, float2(_15, (((cb_misc_016.x / cb_misc_016.y) * (_16 + -0.5f)) + 0.5f))))).w) * 20.0f) * cb_instance_016.x) + 1.0f));
  _88 = float(_84 * ((half)(((half)(((half)((half)(_52.x) + (half)(_47.x))) + (half)(_60.x))) + (half)(_67.x))));
  _89 = float(_84 * ((half)(((half)(((half)((half)(_52.y) + (half)(_47.y))) + (half)(_60.y))) + (half)(_67.y))));
  _90 = float(_84 * ((half)(((half)(((half)((half)(_52.z) + (half)(_47.z))) + (half)(_60.z))) + (half)(_67.z))));
  _91 = _88 + float(min(((half)(_23 * (half)(_17.x))), 16384.0h));
  _92 = _89 + float(min(((half)(_23 * (half)(_17.y))), 16384.0h));
  _93 = _90 + float(min(((half)(_23 * (half)(_17.z))), 16384.0h));
  _100 = cb_misc_320.x - _15;
  _102 = (cb_misc_000.w / cb_misc_000.z) * (cb_misc_320.y - _16);
  _112 = saturate((sqrt((_102 * _102) + (_100 * _100)) - (cb_misc_320.z * 0.949999988079071f)) / (cb_misc_320.z * 0.09999996423721313f));
  _118 = ((_112 * _112) * (3.0f - (_112 * 2.0f))) * cb_misc_320.w;
  _128 = (((_88 / _81) - _91) * _118) + _91;
  _129 = (((_89 / _81) - _92) * _118) + _92;
  _130 = (((_90 / _81) - _93) * _118) + _93;

  if (RENODX_TONE_MAP_TYPE != 0) {
    float3 untonemapped = float3(_128, _129, _130);
    SV_Target = RenoDX(untonemapped, float2(_15, _16), _118);
    return SV_Target;
  }

  _131 = _128 * 1.4142135381698608f;
  _132 = _129 * 1.4142135381698608f;
  _133 = _130 * 1.4142135381698608f;
  _185 = max((((((((((_128 * 3830.7001953125f) + 6801.15234375f) * _131) + 1079.54736328125f) * _131) + 1.1614649295806885f) * _131) + -4.139374868827872e-05f) / ((((((((_128 * 1390.7225341796875f) + 4132.06640625f) * _131) + 2881.652099609375f) * _131) + 128.35911560058594f) * _131) + 1.0f)), 0.0f);
  _186 = max((((((((((_129 * 3830.7001953125f) + 6801.15234375f) * _132) + 1079.54736328125f) * _132) + 1.1614649295806885f) * _132) + -4.139374868827872e-05f) / ((((((((_129 * 1390.7225341796875f) + 4132.06640625f) * _132) + 2881.652099609375f) * _132) + 128.35911560058594f) * _132) + 1.0f)), 0.0f);
  _187 = max((((((((((_130 * 3830.7001953125f) + 6801.15234375f) * _133) + 1079.54736328125f) * _133) + 1.1614649295806885f) * _133) + -4.139374868827872e-05f) / ((((((((_130 * 1390.7225341796875f) + 4132.06640625f) * _133) + 2881.652099609375f) * _133) + 128.35911560058594f) * _133) + 1.0f)), 0.0f);
  _190 = max(max(max(_185, _186), _187), 9.999999974752427e-07f);
  _201 = select((abs(1.0f - _190) < 0.5249999761581421f), ((((5.809524059295654f - (_190 * 1.9047620296478271f)) * _190) + -0.42976200580596924f) * 0.25f), saturate(_190)) / _190;
  _202 = _201 * _185;
  _203 = _201 * _186;
  _204 = _201 * _187;
  min16float4 _205 = t2.Sample(s6, float3(_204, _203, _202));
  _224 = saturate((_202 + -1.0f) + (float(_205.z) * 2.0f)) / _201;
  _225 = saturate((_203 + -1.0f) + (float(_205.y) * 2.0f)) / _201;
  _226 = saturate((_204 + -1.0f) + (float(_205.x) * 2.0f)) / _201;
  // UI blend, simplified
  _259 = ((((_118 + 0.5f) + cb_misc_704.x) * 0.008331298828125f) + 0.008331298828125f) * (frac(sin(dot(float2((cb_misc_576.w + _15), (cb_misc_576.w + _16)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.546875f) + -0.5f);
  _260 = _259 + sqrt(max(0.0f, ((cb_misc_272.w * (2.700000047683716f - _224)) + _224)));
  _261 = sqrt(max(0.0f, ((cb_misc_272.w * (2.700000047683716f - _225)) + _225))) + _259;
  _262 = sqrt(max(0.0f, ((cb_misc_272.w * (2.700000047683716f - _226)) + _226))) + _259;
  min16float4 _266 = t0.SampleLevel(s6, float2(_15, _16), 0.0f);
  _274 = float(_266.w);
  _287 = exp2(log2(((_260 * _260) * _274) + float(_266.x)) * 2.200000047683716f);
  _288 = exp2(log2(((_261 * _261) * _274) + float(_266.y)) * 2.200000047683716f);
  _289 = exp2(log2(((_262 * _262) * _274) + float(_266.z)) * 2.200000047683716f);
  _300 = cb_misc_704.y * 9.999999747378752e-05f;
  _313 = exp2(log2(abs(_300 * mad(0.04331360012292862f, _289, mad(0.3292819857597351f, _288, (_287 * 0.627403974533081f))))) * 0.1593017578125f);
  _314 = exp2(log2(abs(_300 * mad(0.011361200362443924f, _289, mad(0.9195399880409241f, _288, (_287 * 0.06909699738025665f))))) * 0.1593017578125f);
  _315 = exp2(log2(abs(_300 * mad(0.8955950140953064f, _289, mad(0.08801320195198059f, _288, (_287 * 0.01639159955084324f))))) * 0.1593017578125f);
  SV_Target.x = exp2(log2(((_313 * 18.8515625f) + 0.8359375f) / ((_313 * 18.6875f) + 1.0f)) * 78.84375f);
  SV_Target.y = exp2(log2(((_314 * 18.8515625f) + 0.8359375f) / ((_314 * 18.6875f) + 1.0f)) * 78.84375f);
  SV_Target.z = exp2(log2(((_315 * 18.8515625f) + 0.8359375f) / ((_315 * 18.6875f) + 1.0f)) * 78.84375f);
  SV_Target.w = 1.0f;
  return SV_Target;
}