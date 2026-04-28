#define USE_GASMASK
#define USE_LOW
#include "./tonemap.hlsli"

#if 0
Texture2D<min16float4> t0 : register(t0);

Texture2D<min16float4> t1 : register(t1);

Texture3D<min16float4> t2 : register(t2);

Texture2D<float4> t3 : register(t3);

Texture2D<min16float4> t4 : register(t4);

Texture2D<float4> t5 : register(t5);

Texture2D<float4> t6 : register(t6);

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
  float _17;
  float _18;
  float4 _19;
  float4 _21;
  float _27;
  float _28;
  float _29;
  float _31;
  float _36;
  float _37;
  float _41;
  float _46;
  float _56;
  float _57;
  half _64;
  float _86;
  float _87;
  float _92;
  float _100;
  float _120;
  half _123;
  float _127;
  float _128;
  float _129;
  float _130;
  float _131;
  float _132;
  float _139;
  float _141;
  float _151;
  float _157;
  float _167;
  float _168;
  float _169;
  float _170;
  float _171;
  float _172;
  float _238;
  float _245;
  float _246;
  float _248;
  float _260;
  float _268;
  float _287;
  float _292;
  float _294;
  float _301;
  float _305;
  float _306;
  float _307;
  float _310;
  float _321;
  float _322;
  float _323;
  float _324;
  float _344;
  float _345;
  float _346;
  float _378;
  float _379;
  float _380;
  float _381;
  float _393;
  float _406;
  float _407;
  float _408;
  float _419;
  float _432;
  float _433;
  float _434;
  _17 = cb_misc_048.x * SV_Position.x;
  _18 = cb_misc_048.y * SV_Position.y;
  _19 = t5.Sample(s5, float2(_17, _18));
  _21 = t6.Sample(s5, float2(_17, _18));
  _27 = (_21.x * 0.2800000011920929f) + -0.14000000059604645f;
  _28 = _21.y * 0.2800000011920929f;
  _29 = _28 + -0.14000000059604645f;
  _31 = (_21.z * 6.720000267028809f) + -3.3600001335144043f;
  _36 = saturate(cb_instance_016.x * 40.0f);
  _37 = _36 * _19.w;
  _41 = saturate(((-0.0f - _27) - _29) + _37);
  _46 = saturate(-0.0f - ((_31 * cb_instance_016.y) * _36));
  _56 = (((_46 * (_31 - _27)) + _27) * _41) + _17;
  _57 = (((_46 * ((-3.2200000286102295f - _28) + (_21.w * 6.720000267028809f))) + _29) * _41) + _18;
  min16float4 _58 = t1.SampleLevel(s6, float2(_56, _57), 0.0f);
  _64 = 1.0h / ((half)(1.0h - (half)(dot(half3((half)(_58.x), (half)(_58.y), (half)(_58.z)), half3(0.29907227h, 0.58691406h, 0.11401367h)))));
  _86 = _56 - cb_misc_000.x;
  _87 = _57 - cb_misc_000.y;
  min16float4 _88 = t4.Sample(s6, float2(_86, _87));
  _92 = cb_misc_000.y + _57;
  min16float4 _93 = t4.Sample(s6, float2(_86, _92));
  _100 = cb_misc_000.x + _56;
  min16float4 _101 = t4.Sample(s6, float2(_100, _92));
  min16float4 _108 = t4.Sample(s6, float2(_100, _87));
  _120 = exp2(cb_misc_336.y);
  _123 = half((_120 * 0.0416666679084301f) * ((((((float4)(t3.Sample(s5, float2(_56, (((cb_misc_016.x / cb_misc_016.y) * (_57 + -0.5f)) + 0.5f))))).w) * 20.0f) * cb_instance_016.x) + 1.0f));
  _127 = float(_123 * ((half)(((half)(((half)((half)(_93.x) + (half)(_88.x))) + (half)(_101.x))) + (half)(_108.x))));
  _128 = float(_123 * ((half)(((half)(((half)((half)(_93.y) + (half)(_88.y))) + (half)(_101.y))) + (half)(_108.y))));
  _129 = float(_123 * ((half)(((half)(((half)((half)(_93.z) + (half)(_88.z))) + (half)(_101.z))) + (half)(_108.z))));
  _130 = _127 + float(min(((half)(_64 * (half)(_58.x))), 16384.0h));
  _131 = _128 + float(min(((half)(_64 * (half)(_58.y))), 16384.0h));
  _132 = _129 + float(min(((half)(_64 * (half)(_58.z))), 16384.0h));
  _139 = cb_misc_320.x - _17;
  _141 = (cb_misc_000.w / cb_misc_000.z) * (cb_misc_320.y - _18);
  _151 = saturate((sqrt((_141 * _141) + (_139 * _139)) - (cb_misc_320.z * 0.949999988079071f)) / (cb_misc_320.z * 0.09999996423721313f));
  _157 = ((_151 * _151) * (3.0f - (_151 * 2.0f))) * cb_misc_320.w;
  _167 = (((_127 / _120) - _130) * _157) + _130;
  _168 = (((_128 / _120) - _131) * _157) + _131;
  _169 = (((_129 / _120) - _132) * _157) + _132;

  if (RENODX_TONE_MAP_TYPE != 0) {
    float3 untonemapped = float3(_167, _168, _169);
    SV_Target = RenoDX(untonemapped, float2(_17, _18), _157, 1.f);
    return SV_Target;
  } 

  _170 = _167 * 1.4142135381698608f;
  _171 = _168 * 1.4142135381698608f;
  _172 = _169 * 1.4142135381698608f;
  _238 = saturate((cb_instance_016.y * _21.w) * _36);
  _245 = (_21.x * 0.14000000059604645f) + -0.5699999928474426f;
  _246 = (_21.y * 0.14000000059604645f) + -0.5699999928474426f;
  _248 = rsqrt(dot(float3(_245, _246, 1.0f), float3(_245, _246, 1.0f)));
  _260 = (dot(float3((-0.0f - cb_misc_272.x), (-0.0f - cb_misc_272.y), (-0.0f - cb_misc_272.z)), float3((_248 * _245), (_248 * _246), _248)) * 0.5f) + 1.0f;
  _268 = saturate(cb_misc_288.x);
  _287 = (saturate((_37 * 2.0f) + (_238 * (_21.w - _37))) * _37) * (min(_268, (dot(float3(_268, saturate(cb_misc_288.y), saturate(cb_misc_288.z)), float3(0.5f, 0.5f, 0.5f)) * 0.30000001192092896f)) + 0.10000000149011612f);
  _292 = ((_19.w * _19.w) * _37) * _287;
  _294 = 1.0f - (_37 * _37);
  _301 = _287 * ((saturate(max((_260 * _260), 0.25f)) * 0.4999999701976776f) + 0.4000000059604645f);
  _305 = (_301 * ((((((_21.z * 0.14000000059604645f) + -0.07000000029802322f) * _21.w) * _238) + (_37 * _19.x)) + _292)) + (_294 * max((((((((((_167 * 3830.7001953125f) + 6801.15234375f) * _170) + 1079.54736328125f) * _170) + 1.1614649295806885f) * _170) + -4.139374868827872e-05f) / ((((((((_167 * 1390.7225341796875f) + 4132.06640625f) * _170) + 2881.652099609375f) * _170) + 128.35911560058594f) * _170) + 1.0f)), 0.0f));
  _306 = (_301 * ((((((_21.w * 0.14000000059604645f) + -0.07000000029802322f) * _21.w) * _238) + (_37 * _19.y)) + _292)) + (_294 * max((((((((((_168 * 3830.7001953125f) + 6801.15234375f) * _171) + 1079.54736328125f) * _171) + 1.1614649295806885f) * _171) + -4.139374868827872e-05f) / ((((((((_168 * 1390.7225341796875f) + 4132.06640625f) * _171) + 2881.652099609375f) * _171) + 128.35911560058594f) * _171) + 1.0f)), 0.0f));
  _307 = (_301 * ((((_21.z * _21.w) * _238) + (_37 * _19.z)) + _292)) + (_294 * max((((((((((_169 * 3830.7001953125f) + 6801.15234375f) * _172) + 1079.54736328125f) * _172) + 1.1614649295806885f) * _172) + -4.139374868827872e-05f) / ((((((((_169 * 1390.7225341796875f) + 4132.06640625f) * _172) + 2881.652099609375f) * _172) + 128.35911560058594f) * _172) + 1.0f)), 0.0f));
  _310 = max(max(max(_305, _306), _307), 9.999999974752427e-07f);
  _321 = select((abs(1.0f - _310) < 0.5249999761581421f), ((((5.809524059295654f - (_310 * 1.9047620296478271f)) * _310) + -0.42976200580596924f) * 0.25f), saturate(_310)) / _310;
  _322 = _305 * _321;
  _323 = _306 * _321;
  _324 = _307 * _321;
  min16float4 _325 = t2.Sample(s6, float3(_324, _323, _322));
  _344 = saturate((_322 + -1.0f) + (float(_325.z) * 2.0f)) / _321;
  _345 = saturate((_323 + -1.0f) + (float(_325.y) * 2.0f)) / _321;
  _346 = saturate((_324 + -1.0f) + (float(_325.x) * 2.0f)) / _321;
  _378 = ((((_157 + 0.5f) + cb_misc_704.x) * 0.008331298828125f) + 0.008331298828125f) * (frac(sin(dot(float2((cb_misc_576.w + _17), (cb_misc_576.w + _18)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.546875f) + -0.5f);
  _379 = _378 + sqrt(max(0.0f, ((cb_misc_272.w * (2.700000047683716f - _344)) + _344)));
  _380 = sqrt(max(0.0f, ((cb_misc_272.w * (2.700000047683716f - _345)) + _345))) + _378;
  _381 = sqrt(max(0.0f, ((cb_misc_272.w * (2.700000047683716f - _346)) + _346))) + _378;
  min16float4 _385 = t0.SampleLevel(s6, float2(_17, _18), 0.0f);
  _393 = float(_385.w);
  _406 = exp2(log2(((_379 * _379) * _393) + float(_385.x)) * 2.200000047683716f);
  _407 = exp2(log2(((_380 * _380) * _393) + float(_385.y)) * 2.200000047683716f);
  _408 = exp2(log2(((_381 * _381) * _393) + float(_385.z)) * 2.200000047683716f);
  _419 = cb_misc_704.y * 9.999999747378752e-05f;
  _432 = exp2(log2(abs(_419 * mad(0.04331360012292862f, _408, mad(0.3292819857597351f, _407, (_406 * 0.627403974533081f))))) * 0.1593017578125f);
  _433 = exp2(log2(abs(_419 * mad(0.011361200362443924f, _408, mad(0.9195399880409241f, _407, (_406 * 0.06909699738025665f))))) * 0.1593017578125f);
  _434 = exp2(log2(abs(_419 * mad(0.8955950140953064f, _408, mad(0.08801320195198059f, _407, (_406 * 0.01639159955084324f))))) * 0.1593017578125f);
  SV_Target.x = exp2(log2(((_432 * 18.8515625f) + 0.8359375f) / ((_432 * 18.6875f) + 1.0f)) * 78.84375f);
  SV_Target.y = exp2(log2(((_433 * 18.8515625f) + 0.8359375f) / ((_433 * 18.6875f) + 1.0f)) * 78.84375f);
  SV_Target.z = exp2(log2(((_434 * 18.8515625f) + 0.8359375f) / ((_434 * 18.6875f) + 1.0f)) * 78.84375f);
  SV_Target.w = 1.0f;
  return SV_Target;
}