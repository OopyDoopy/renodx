#define USE_NVG_DUAL
#define USE_SHIFTED_LUT
#include "./tonemap.hlsli"

#if 0
Texture2D<float2> t0 : register(t0);

Texture2D<min16float4> t1 : register(t1);

Texture2D<min16float4> t2 : register(t2);

Texture3D<min16float4> t3 : register(t3);

Texture2D<float4> t4 : register(t4);

Texture2D<min16float4> t5 : register(t5);

Texture2D<float4> t6 : register(t6);

Texture2D<float4> t7 : register(t7);

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
  float _18;
  float _19;
  float4 _22;
  float _28;
  float _29;
  float _30;
  float _32;
  float _37;
  float _42;
  float _47;
  float _57;
  float _58;
  float _64;
  float2 _70;
  float _73;
  float _700;
  half _701;
  half _702;
  half _703;
  float _81;
  float _82;
  float _86;
  float _87;
  float _91;
  float _92;
  float _94;
  float _111;
  float _118;
  float _119;
  float _120;
  float _130;
  float _147;
  float _167;
  float _184;
  float _204;
  float _221;
  float _241;
  float _258;
  float _278;
  float _295;
  float _315;
  float _332;
  float _351;
  float _368;
  float _388;
  float _405;
  float _425;
  float _442;
  float _462;
  float _479;
  float _499;
  float _516;
  float _536;
  float _553;
  float _573;
  float _590;
  half _608;
  float _614;
  float _644;
  float _648;
  half _650;
  float _654;
  float _655;
  float _656;
  float _657;
  float _662;
  float _667;
  half _676;
  half _689;
  float _722;
  float _723;
  float _728;
  float _736;
  float _758;
  half _761;
  float _765;
  float _766;
  float _767;
  float _768;
  float _769;
  float _770;
  float _777;
  float _779;
  float _789;
  float _795;
  float _805;
  float _806;
  float _807;
  float4 _864;
  float4 _869;
  float _881;
  float _882;
  float _886;
  float _893;
  float _894;
  float _896;
  float _908;
  float _916;
  float _935;
  float _940;
  float _942;
  float _949;
  float _953;
  float _954;
  float _955;
  float _972;
  float _973;
  float _974;
  float _1007;
  float _1008;
  float _1009;
  float _1010;
  float _1022;
  float _1029;
  float _1030;
  float _1031;
  float _1053;
  float _1054;
  float _1055;
  float _1066;
  float _1079;
  float _1080;
  float _1081;
  _18 = cb_misc_048.x * SV_Position.x;
  _19 = cb_misc_048.y * SV_Position.y;
  _22 = t7.Sample(s5, float2(_18, _19));
  _28 = (_22.x * 0.2800000011920929f) + -0.14000000059604645f;
  _29 = _22.y * 0.2800000011920929f;
  _30 = _29 + -0.14000000059604645f;
  _32 = (_22.z * 6.720000267028809f) + -3.3600001335144043f;
  _37 = saturate(cb_instance_016.x * 40.0f);
  _42 = saturate(((-0.0f - _28) - _30) + (_37 * (((float4)(t6.Sample(s5, float2(_18, _19)))).w)));
  _47 = saturate(-0.0f - ((_32 * cb_instance_016.y) * _37));
  _57 = (((_47 * (_32 - _28)) + _28) * _42) + _18;
  _58 = (((_47 * ((-3.2200000286102295f - _29) + (_22.w * 6.720000267028809f))) + _30) * _42) + _19;
  min16float4 _59 = t2.Sample(s6, float2(_57, _58));
  _64 = float(_59.w);
  _70 = t0.Sample(s6, float2((cb_misc_032.x * _57), (cb_misc_032.y * _58)));
  _73 = dot(float2(_70.x, _70.y), float2(_70.x, _70.y));
  [branch]
  if (_73 > 0.0002500000118743628f) {
    _81 = SV_Position.y * 0.00023148147738538682f;
    _82 = (SV_Position.x * 0.00023148147738538682f) + 0.25f;
    _86 = frac(dot(float2((_82 * _82), (_81 * _81)), float2(3571.0f, 3571.0f)));
    _87 = _86 * _86;
    _91 = cb_instance_016.w * (1.0f / ((sqrt(_73) * 4.0f) + 1.0f));
    _92 = frac(dot(float2(_87, _87), float2(3571.0f, 3571.0f))) * 0.2857142984867096f;
    _94 = _91 * (_92 + -1.1428571939468384f);
    min16float4 _101 = t2.SampleLevel(s6, float2(saturate((_94 * _70.x) + _57), saturate((_94 * _70.y) + _58)), 0.0f);
    _111 = 1.0f / ((max((_64 - float(_101.w)), 0.0f) * 3.0f) + 1.0f);
    _118 = float(_59.x);
    _119 = float(_59.y);
    _120 = float(_59.z);
    _130 = _91 * (_92 + -1.0f);
    min16float4 _137 = t2.SampleLevel(s6, float2(saturate((_130 * _70.x) + _57), saturate((_130 * _70.y) + _58)), 0.0f);
    _147 = 1.0f / ((max((_64 - float(_137.w)), 0.0f) * 3.0f) + 1.0f);
    _167 = _91 * (_92 + -0.8571429252624512f);
    min16float4 _174 = t2.SampleLevel(s6, float2(saturate((_167 * _70.x) + _57), saturate((_167 * _70.y) + _58)), 0.0f);
    _184 = 1.0f / ((max((_64 - float(_174.w)), 0.0f) * 3.0f) + 1.0f);
    _204 = _91 * (_92 + -0.7142857313156128f);
    min16float4 _211 = t2.SampleLevel(s6, float2(saturate((_204 * _70.x) + _57), saturate((_204 * _70.y) + _58)), 0.0f);
    _221 = 1.0f / ((max((_64 - float(_211.w)), 0.0f) * 3.0f) + 1.0f);
    _241 = _91 * (_92 + -0.5714285969734192f);
    min16float4 _248 = t2.SampleLevel(s6, float2(saturate((_241 * _70.x) + _57), saturate((_241 * _70.y) + _58)), 0.0f);
    _258 = 1.0f / ((max((_64 - float(_248.w)), 0.0f) * 3.0f) + 1.0f);
    _278 = _91 * (_92 + -0.4285714626312256f);
    min16float4 _285 = t2.SampleLevel(s6, float2(saturate((_278 * _70.x) + _57), saturate((_278 * _70.y) + _58)), 0.0f);
    _295 = 1.0f / ((max((_64 - float(_285.w)), 0.0f) * 3.0f) + 1.0f);
    _315 = _91 * (_92 + -0.2857142984867096f);
    min16float4 _322 = t2.SampleLevel(s6, float2(saturate((_315 * _70.x) + _57), saturate((_315 * _70.y) + _58)), 0.0f);
    _332 = 1.0f / ((max((_64 - float(_322.w)), 0.0f) * 3.0f) + 1.0f);
    _351 = _92 * _91;
    min16float4 _358 = t2.SampleLevel(s6, float2(saturate((_351 * _70.x) + _57), saturate((_351 * _70.y) + _58)), 0.0f);
    _368 = 1.0f / ((max((_64 - float(_358.w)), 0.0f) * 3.0f) + 1.0f);
    _388 = _91 * (_92 + 0.1428571492433548f);
    min16float4 _395 = t2.SampleLevel(s6, float2(saturate((_388 * _70.x) + _57), saturate((_388 * _70.y) + _58)), 0.0f);
    _405 = 1.0f / ((max((_64 - float(_395.w)), 0.0f) * 3.0f) + 1.0f);
    _425 = _91 * (_92 + 0.2857142984867096f);
    min16float4 _432 = t2.SampleLevel(s6, float2(saturate((_425 * _70.x) + _57), saturate((_425 * _70.y) + _58)), 0.0f);
    _442 = 1.0f / ((max((_64 - float(_432.w)), 0.0f) * 3.0f) + 1.0f);
    _462 = _91 * (_92 + 0.4285714626312256f);
    min16float4 _469 = t2.SampleLevel(s6, float2(saturate((_462 * _70.x) + _57), saturate((_462 * _70.y) + _58)), 0.0f);
    _479 = 1.0f / ((max((_64 - float(_469.w)), 0.0f) * 3.0f) + 1.0f);
    _499 = _91 * (_92 + 0.5714285969734192f);
    min16float4 _506 = t2.SampleLevel(s6, float2(saturate((_499 * _70.x) + _57), saturate((_499 * _70.y) + _58)), 0.0f);
    _516 = 1.0f / ((max((_64 - float(_506.w)), 0.0f) * 3.0f) + 1.0f);
    _536 = _91 * (_92 + 0.7142857313156128f);
    min16float4 _543 = t2.SampleLevel(s6, float2(saturate((_536 * _70.x) + _57), saturate((_536 * _70.y) + _58)), 0.0f);
    _553 = 1.0f / ((max((_64 - float(_543.w)), 0.0f) * 3.0f) + 1.0f);
    _573 = _91 * (_92 + 0.8571429252624512f);
    min16float4 _580 = t2.SampleLevel(s6, float2(saturate((_573 * _70.x) + _57), saturate((_573 * _70.y) + _58)), 0.0f);
    _590 = 1.0f / ((max((_64 - float(_580.w)), 0.0f) * 3.0f) + 1.0f);
    _608 = half(_590 + float(half(_553 + float(half(_516 + float(half(_479 + float(half(_442 + float(half(_405 + float(half(_368 + float(half(_332 + float(half(_295 + float(half(_258 + float(half(_221 + float(half(_184 + float(half(_147 + float(half(_111 + 1.0f)))))))))))))))))))))))))));
    _614 = saturate((_73 + -0.0002500000118743628f) * 3999.999755859375f);
    _700 = 0.0f;
    _701 = (half)(half((_614 * (float((half)(half((float(_580.x) * _590) + float(half((float(_543.x) * _553) + float(half((float(_506.x) * _516) + float(half((float(_469.x) * _479) + float(half((float(_432.x) * _442) + float(half((float(_395.x) * _405) + float(half((float(_358.x) * _368) + float(half((float(_322.x) * _332) + float(half((float(_285.x) * _295) + float(half((float(_248.x) * _258) + float(half((float(_211.x) * _221) + float(half((float(_174.x) * _184) + float(half((float(_137.x) * _147) + float(half((float(_101.x) * _111) + _118)))))))))))))))))))))))))))) / _608) - _118)) + _118));
    _702 = (half)(half((_614 * (float((half)(half((float(_580.y) * _590) + float(half((float(_543.y) * _553) + float(half((float(_506.y) * _516) + float(half((float(_469.y) * _479) + float(half((float(_432.y) * _442) + float(half((float(_395.y) * _405) + float(half((float(_358.y) * _368) + float(half((float(_322.y) * _332) + float(half((float(_285.y) * _295) + float(half((float(_248.y) * _258) + float(half((float(_211.y) * _221) + float(half((float(_174.y) * _184) + float(half((float(_137.y) * _147) + float(half((float(_101.y) * _111) + _119)))))))))))))))))))))))))))) / _608) - _119)) + _119));
    _703 = (half)(half(((float((half)(half((float(_580.z) * _590) + float(half((float(_543.z) * _553) + float(half((float(_506.z) * _516) + float(half((float(_469.z) * _479) + float(half((float(_432.z) * _442) + float(half((float(_395.z) * _405) + float(half((float(_358.z) * _368) + float(half((float(_322.z) * _332) + float(half((float(_285.z) * _295) + float(half((float(_248.z) * _258) + float(half((float(_211.z) * _221) + float(half((float(_174.z) * _184) + float(half((float(_137.z) * _147) + float(half((float(_101.z) * _111) + _120)))))))))))))))))))))))))))) / _608) - _120) * _614) + _120));
  } else {
    _644 = abs((1.0f - saturate((cb_misc_256.z * _64) - cb_misc_256.y)) - saturate((cb_misc_256.w * _64) - cb_misc_256.x));
    _648 = 0.5f - (saturate(_73 * 3999.999755859375f) * 0.5f);
    _650 = half(_644 + -0.5f);
    _654 = _648 * cb_misc_000.x;
    _655 = _648 * cb_misc_000.y;
    _656 = _57 - _654;
    _657 = _58 - _655;
    min16float4 _658 = t2.SampleLevel(s6, float2(_656, _657), 0.0f);
    _662 = _654 + _57;
    min16float4 _663 = t2.SampleLevel(s6, float2(_662, _657), 0.0f);
    _667 = _655 + _58;
    min16float4 _668 = t2.SampleLevel(s6, float2(_656, _667), 0.0f);
    min16float4 _672 = t2.SampleLevel(s6, float2(_662, _667), 0.0f);
    _676 = 1.0h - _650;
    _689 = _650 * 0.25h;
    _700 = _644;
    _701 = (half)(max(((half)(((half)(((half)(((half)(((half)((half)(_663.x) + (half)(_658.x))) + (half)(_668.x))) + (half)(_672.x))) * _689)) + ((half)(_676 * (half)(_59.x))))), 0.0h));
    _702 = (half)(max(((half)(((half)(((half)(((half)(((half)((half)(_663.y) + (half)(_658.y))) + (half)(_668.y))) + (half)(_672.y))) * _689)) + ((half)(_676 * (half)(_59.y))))), 0.0h));
    _703 = (half)(max(((half)(((half)(((half)(((half)(((half)((half)(_663.z) + (half)(_658.z))) + (half)(_668.z))) + (half)(_672.z))) * _689)) + ((half)(_676 * (half)(_59.z))))), 0.0h));
  }
  if (RENODX_TONE_MAP_TYPE != 0) {
    float3 input_color = float3(_701, _702, _703);
    SV_Target = RenoDX(input_color, float2(_18, _19), _700);
    return SV_Target;
  }

  _722 = _57 - cb_misc_000.x;
  _723 = _58 - cb_misc_000.y;
  min16float4 _724 = t5.Sample(s6, float2(_722, _723));
  _728 = cb_misc_000.y + _58;
  min16float4 _729 = t5.Sample(s6, float2(_722, _728));
  _736 = cb_misc_000.x + _57;
  min16float4 _737 = t5.Sample(s6, float2(_736, _728));
  min16float4 _744 = t5.Sample(s6, float2(_736, _723));
  _758 = exp2(cb_misc_336.y);
  _761 = half((_758 * 0.0416666679084301f) * ((((((float4)(t4.Sample(s5, float2(_57, (((cb_misc_016.x / cb_misc_016.y) * (_58 + -0.5f)) + 0.5f))))).w) * 20.0f) * cb_instance_016.x) + 1.0f));
  _765 = float(_761 * ((half)(((half)(((half)((half)(_729.x) + (half)(_724.x))) + (half)(_737.x))) + (half)(_744.x))));
  _766 = float(_761 * ((half)(((half)(((half)((half)(_729.y) + (half)(_724.y))) + (half)(_737.y))) + (half)(_744.y))));
  _767 = float(_761 * ((half)(((half)(((half)((half)(_729.z) + (half)(_724.z))) + (half)(_737.z))) + (half)(_744.z))));
  _768 = _765 + float(min(_701, 16384.0h));
  _769 = _766 + float(min(_702, 16384.0h));
  _770 = _767 + float(min(_703, 16384.0h));
  _777 = cb_misc_320.x - _18;
  _779 = (cb_misc_000.w / cb_misc_000.z) * (cb_misc_320.y - _19);
  _789 = saturate((sqrt((_779 * _779) + (_777 * _777)) - (cb_misc_320.z * 0.949999988079071f)) / (cb_misc_320.z * 0.09999996423721313f));
  _795 = ((_789 * _789) * (3.0f - (_789 * 2.0f))) * cb_misc_320.w;
  _805 = (((_765 / _758) - _768) * _795) + _768;
  _806 = (((_766 / _758) - _769) * _795) + _769;
  _807 = (((_767 / _758) - _770) * _795) + _770;
  _864 = t6.Sample(s5, float2(_18, _19));
  _869 = t7.Sample(s5, float2(_18, _19));
  _881 = saturate(cb_instance_016.x * 40.0f);
  _882 = _881 * _864.w;
  _886 = saturate((cb_instance_016.y * _869.w) * _881);
  _893 = (_869.x * 0.14000000059604645f) + -0.5699999928474426f;
  _894 = (_869.y * 0.14000000059604645f) + -0.5699999928474426f;
  _896 = rsqrt(dot(float3(_893, _894, 1.0f), float3(_893, _894, 1.0f)));
  _908 = (dot(float3((-0.0f - cb_misc_272.x), (-0.0f - cb_misc_272.y), (-0.0f - cb_misc_272.z)), float3((_896 * _893), (_896 * _894), _896)) * 0.5f) + 1.0f;
  _916 = saturate(cb_misc_288.x);
  _935 = (saturate((_882 * 2.0f) + (_886 * (_869.w - _882))) * _882) * (min(_916, (dot(float3(_916, saturate(cb_misc_288.y), saturate(cb_misc_288.z)), float3(0.5f, 0.5f, 0.5f)) * 0.30000001192092896f)) + 0.10000000149011612f);
  _940 = ((_864.w * _864.w) * _882) * _935;
  _942 = 1.0f - (_882 * _882);
  _949 = _935 * ((saturate(max((_908 * _908), 0.25f)) * 0.4999999701976776f) + 0.4000000059604645f);
  _953 = (_949 * ((((((_869.z * 0.14000000059604645f) + -0.07000000029802322f) * _869.w) * _886) + (_882 * _864.x)) + _940)) + (_942 * saturate(((((((((_805 * 8.468000411987305f) + 1.0f) * _805) + -0.002956999931484461f) * _805) + 0.00010040000051958486f) * _805) + -1.2739999988298223e-07f) / ((((((((_805 * 8.360400199890137f) + 1.822700023651123f) * _805) + 0.21889999508857727f) * _805) + -0.0021170000545680523f) * _805) + 3.673000173876062e-05f)));
  _954 = (_949 * ((((((_869.w * 0.14000000059604645f) + -0.07000000029802322f) * _869.w) * _886) + (_882 * _864.y)) + _940)) + (_942 * saturate(((((((((_806 * 8.468000411987305f) + 1.0f) * _806) + -0.002956999931484461f) * _806) + 0.00010040000051958486f) * _806) + -1.2739999988298223e-07f) / ((((((((_806 * 8.360400199890137f) + 1.822700023651123f) * _806) + 0.21889999508857727f) * _806) + -0.0021170000545680523f) * _806) + 3.673000173876062e-05f)));
  _955 = (_949 * ((((_869.z * _869.w) * _886) + (_882 * _864.z)) + _940)) + (_942 * saturate(((((((((_807 * 8.468000411987305f) + 1.0f) * _807) + -0.002956999931484461f) * _807) + 0.00010040000051958486f) * _807) + -1.2739999988298223e-07f) / ((((((((_807 * 8.360400199890137f) + 1.822700023651123f) * _807) + 0.21889999508857727f) * _807) + -0.0021170000545680523f) * _807) + 3.673000173876062e-05f)));
  min16float4 _956 = t3.Sample(s6, float3(_955, _954, _953));
  _972 = saturate((_953 + -1.0f) + (float(_956.z) * 2.0f));
  _973 = saturate((_954 + -1.0f) + (float(_956.y) * 2.0f));
  _974 = saturate((_955 + -1.0f) + (float(_956.x) * 2.0f));
  _1007 = (((((((_795 * 2.0f) + _700) * 0.5f) + 0.5f) + cb_misc_704.x) * 0.008331298828125f) + 0.008331298828125f) * (frac(sin(dot(float2((cb_misc_576.w + _18), (cb_misc_576.w + _19)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.546875f) + -0.5f);
  _1008 = _1007 + sqrt(max(0.0f, ((cb_misc_272.w * (1.0f - _972)) + _972)));
  _1009 = sqrt(max(0.0f, ((cb_misc_272.w * (1.0f - _973)) + _973))) + _1007;
  _1010 = sqrt(max(0.0f, ((cb_misc_272.w * (1.0f - _974)) + _974))) + _1007;
  min16float4 _1014 = t1.SampleLevel(s6, float2(_18, _19), 0.0f);
  _1022 = float(_1014.w);
  _1029 = max(6.103519990574569e-05f, (((_1008 * _1008) * _1022) + float(_1014.x)));
  _1030 = max(6.103519990574569e-05f, (((_1009 * _1009) * _1022) + float(_1014.y)));
  _1031 = max(6.103519990574569e-05f, (((_1010 * _1010) * _1022) + float(_1014.z)));
  _1053 = select((_1029 > 0.040449999272823334f), exp2(log2((_1029 * 0.9478672742843628f) + 0.05213269963860512f) * 2.4000000953674316f), (_1029 * 0.07739938050508499f));
  _1054 = select((_1030 > 0.040449999272823334f), exp2(log2((_1030 * 0.9478672742843628f) + 0.05213269963860512f) * 2.4000000953674316f), (_1030 * 0.07739938050508499f));
  _1055 = select((_1031 > 0.040449999272823334f), exp2(log2((_1031 * 0.9478672742843628f) + 0.05213269963860512f) * 2.4000000953674316f), (_1031 * 0.07739938050508499f));
  _1066 = cb_misc_704.y * 9.999999747378752e-05f;
  _1079 = exp2(log2(abs(_1066 * mad(0.04331360012292862f, _1055, mad(0.3292819857597351f, _1054, (_1053 * 0.627403974533081f))))) * 0.1593017578125f);
  _1080 = exp2(log2(abs(_1066 * mad(0.011361200362443924f, _1055, mad(0.9195399880409241f, _1054, (_1053 * 0.06909699738025665f))))) * 0.1593017578125f);
  _1081 = exp2(log2(abs(_1066 * mad(0.8955950140953064f, _1055, mad(0.08801320195198059f, _1054, (_1053 * 0.01639159955084324f))))) * 0.1593017578125f);
  SV_Target.x = exp2(log2(((_1079 * 18.8515625f) + 0.8359375f) / ((_1079 * 18.6875f) + 1.0f)) * 78.84375f);
  SV_Target.y = exp2(log2(((_1080 * 18.8515625f) + 0.8359375f) / ((_1080 * 18.6875f) + 1.0f)) * 78.84375f);
  SV_Target.z = exp2(log2(((_1081 * 18.8515625f) + 0.8359375f) / ((_1081 * 18.6875f) + 1.0f)) * 78.84375f);
  SV_Target.w = 1.0f;
  return SV_Target;
}