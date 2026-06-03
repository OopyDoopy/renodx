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
  float4 _20;
  float4 _22;
  float _28;
  float _29;
  float _30;
  float _32;
  float _37;
  float _38;
  float _42;
  float _47;
  float _57;
  float _58;
  float _64;
  float2 _70;
  float _73;
  float _626;
  half _627;
  half _628;
  half _629;
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
  float _314;
  float _331;
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
  half _534;
  float _540;
  float _570;
  float _574;
  half _576;
  float _580;
  float _581;
  float _582;
  float _583;
  float _588;
  float _593;
  half _602;
  half _615;
  float _648;
  float _649;
  float _654;
  float _662;
  float _682;
  half _685;
  float _689;
  float _690;
  float _691;
  float _692;
  float _693;
  float _694;
  float _701;
  float _703;
  float _713;
  float _719;
  float _729;
  float _730;
  float _731;
  float _799;
  float _806;
  float _807;
  float _809;
  float _821;
  float _829;
  float _848;
  float _853;
  float _855;
  float _862;
  float _866;
  float _867;
  float _868;
  float _885;
  float _886;
  float _887;
  float _920;
  float _921;
  float _922;
  float _923;
  float _935;
  float _942;
  float _943;
  float _944;
  float _966;
  float _967;
  float _968;
  float _979;
  float _992;
  float _993;
  float _994;
  _18 = cb_misc_048.x * SV_Position.x;
  _19 = cb_misc_048.y * SV_Position.y;
  _20 = t6.Sample(s5, float2(_18, _19));
  _22 = t7.Sample(s5, float2(_18, _19));
  _28 = (_22.x * 0.2800000011920929f) + -0.14000000059604645f;
  _29 = _22.y * 0.2800000011920929f;
  _30 = _29 + -0.14000000059604645f;
  _32 = (_22.z * 6.720000267028809f) + -3.3600001335144043f;
  _37 = saturate(cb_instance_016.x * 40.0f);
  _38 = _37 * _20.w;
  _42 = saturate(((-0.0f - _28) - _30) + _38);
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
    _92 = frac(dot(float2(_87, _87), float2(3571.0f, 3571.0f))) * 0.3333333432674408f;
    _94 = _91 * (_92 + -1.1666667461395264f);
    min16float4 _101 = t2.SampleLevel(s6, float2(saturate((_94 * _70.x) + _57), saturate((_94 * _70.y) + _58)), 0.0f);
    _111 = 1.0f / ((max((_64 - float(_101.w)), 0.0f) * 3.0f) + 1.0f);
    _118 = float(_59.x);
    _119 = float(_59.y);
    _120 = float(_59.z);
    _130 = _91 * (_92 + -1.0f);
    min16float4 _137 = t2.SampleLevel(s6, float2(saturate((_130 * _70.x) + _57), saturate((_130 * _70.y) + _58)), 0.0f);
    _147 = 1.0f / ((max((_64 - float(_137.w)), 0.0f) * 3.0f) + 1.0f);
    _167 = _91 * (_92 + -0.8333333730697632f);
    min16float4 _174 = t2.SampleLevel(s6, float2(saturate((_167 * _70.x) + _57), saturate((_167 * _70.y) + _58)), 0.0f);
    _184 = 1.0f / ((max((_64 - float(_174.w)), 0.0f) * 3.0f) + 1.0f);
    _204 = _91 * (_92 + -0.6666666865348816f);
    min16float4 _211 = t2.SampleLevel(s6, float2(saturate((_204 * _70.x) + _57), saturate((_204 * _70.y) + _58)), 0.0f);
    _221 = 1.0f / ((max((_64 - float(_211.w)), 0.0f) * 3.0f) + 1.0f);
    _241 = _91 * (_92 + -0.5f);
    min16float4 _248 = t2.SampleLevel(s6, float2(saturate((_241 * _70.x) + _57), saturate((_241 * _70.y) + _58)), 0.0f);
    _258 = 1.0f / ((max((_64 - float(_248.w)), 0.0f) * 3.0f) + 1.0f);
    _278 = _91 * (_92 + -0.3333333432674408f);
    min16float4 _285 = t2.SampleLevel(s6, float2(saturate((_278 * _70.x) + _57), saturate((_278 * _70.y) + _58)), 0.0f);
    _295 = 1.0f / ((max((_64 - float(_285.w)), 0.0f) * 3.0f) + 1.0f);
    _314 = _92 * _91;
    min16float4 _321 = t2.SampleLevel(s6, float2(saturate((_314 * _70.x) + _57), saturate((_314 * _70.y) + _58)), 0.0f);
    _331 = 1.0f / ((max((_64 - float(_321.w)), 0.0f) * 3.0f) + 1.0f);
    _351 = _91 * (_92 + 0.1666666716337204f);
    min16float4 _358 = t2.SampleLevel(s6, float2(saturate((_351 * _70.x) + _57), saturate((_351 * _70.y) + _58)), 0.0f);
    _368 = 1.0f / ((max((_64 - float(_358.w)), 0.0f) * 3.0f) + 1.0f);
    _388 = _91 * (_92 + 0.3333333432674408f);
    min16float4 _395 = t2.SampleLevel(s6, float2(saturate((_388 * _70.x) + _57), saturate((_388 * _70.y) + _58)), 0.0f);
    _405 = 1.0f / ((max((_64 - float(_395.w)), 0.0f) * 3.0f) + 1.0f);
    _425 = _91 * (_92 + 0.5f);
    min16float4 _432 = t2.SampleLevel(s6, float2(saturate((_425 * _70.x) + _57), saturate((_425 * _70.y) + _58)), 0.0f);
    _442 = 1.0f / ((max((_64 - float(_432.w)), 0.0f) * 3.0f) + 1.0f);
    _462 = _91 * (_92 + 0.6666666865348816f);
    min16float4 _469 = t2.SampleLevel(s6, float2(saturate((_462 * _70.x) + _57), saturate((_462 * _70.y) + _58)), 0.0f);
    _479 = 1.0f / ((max((_64 - float(_469.w)), 0.0f) * 3.0f) + 1.0f);
    _499 = _91 * (_92 + 0.8333333730697632f);
    min16float4 _506 = t2.SampleLevel(s6, float2(saturate((_499 * _70.x) + _57), saturate((_499 * _70.y) + _58)), 0.0f);
    _516 = 1.0f / ((max((_64 - float(_506.w)), 0.0f) * 3.0f) + 1.0f);
    _534 = half(_516 + float(half(_479 + float(half(_442 + float(half(_405 + float(half(_368 + float(half(_331 + float(half(_295 + float(half(_258 + float(half(_221 + float(half(_184 + float(half(_147 + float(half(_111 + 1.0f)))))))))))))))))))))));
    _540 = saturate((_73 + -0.0002500000118743628f) * 3999.999755859375f);
    _626 = 0.0f;
    _627 = (half)(half((_540 * (float((half)(half((float(_506.x) * _516) + float(half((float(_469.x) * _479) + float(half((float(_432.x) * _442) + float(half((float(_395.x) * _405) + float(half((float(_358.x) * _368) + float(half((float(_321.x) * _331) + float(half((float(_285.x) * _295) + float(half((float(_248.x) * _258) + float(half((float(_211.x) * _221) + float(half((float(_174.x) * _184) + float(half((float(_137.x) * _147) + float(half((float(_101.x) * _111) + _118)))))))))))))))))))))))) / _534) - _118)) + _118));
    _628 = (half)(half((_540 * (float((half)(half((float(_506.y) * _516) + float(half((float(_469.y) * _479) + float(half((float(_432.y) * _442) + float(half((float(_395.y) * _405) + float(half((float(_358.y) * _368) + float(half((float(_321.y) * _331) + float(half((float(_285.y) * _295) + float(half((float(_248.y) * _258) + float(half((float(_211.y) * _221) + float(half((float(_174.y) * _184) + float(half((float(_137.y) * _147) + float(half((float(_101.y) * _111) + _119)))))))))))))))))))))))) / _534) - _119)) + _119));
    _629 = (half)(half(((float((half)(half((float(_506.z) * _516) + float(half((float(_469.z) * _479) + float(half((float(_432.z) * _442) + float(half((float(_395.z) * _405) + float(half((float(_358.z) * _368) + float(half((float(_321.z) * _331) + float(half((float(_285.z) * _295) + float(half((float(_248.z) * _258) + float(half((float(_211.z) * _221) + float(half((float(_174.z) * _184) + float(half((float(_137.z) * _147) + float(half((float(_101.z) * _111) + _120)))))))))))))))))))))))) / _534) - _120) * _540) + _120));
  } else {
    _570 = abs((1.0f - saturate((cb_misc_256.z * _64) - cb_misc_256.y)) - saturate((cb_misc_256.w * _64) - cb_misc_256.x));
    _574 = 0.5f - (saturate(_73 * 3999.999755859375f) * 0.5f);
    _576 = half(_570 + -0.5f);
    _580 = _574 * cb_misc_000.x;
    _581 = _574 * cb_misc_000.y;
    _582 = _57 - _580;
    _583 = _58 - _581;
    min16float4 _584 = t2.SampleLevel(s6, float2(_582, _583), 0.0f);
    _588 = _580 + _57;
    min16float4 _589 = t2.SampleLevel(s6, float2(_588, _583), 0.0f);
    _593 = _581 + _58;
    min16float4 _594 = t2.SampleLevel(s6, float2(_582, _593), 0.0f);
    min16float4 _598 = t2.SampleLevel(s6, float2(_588, _593), 0.0f);
    _602 = 1.0h - _576;
    _615 = _576 * 0.25h;
    _626 = _570;
    _627 = (half)(max(((half)(((half)(((half)(((half)(((half)((half)(_589.x) + (half)(_584.x))) + (half)(_594.x))) + (half)(_598.x))) * _615)) + ((half)(_602 * (half)(_59.x))))), 0.0h));
    _628 = (half)(max(((half)(((half)(((half)(((half)(((half)((half)(_589.y) + (half)(_584.y))) + (half)(_594.y))) + (half)(_598.y))) * _615)) + ((half)(_602 * (half)(_59.y))))), 0.0h));
    _629 = (half)(max(((half)(((half)(((half)(((half)(((half)((half)(_589.z) + (half)(_584.z))) + (half)(_594.z))) + (half)(_598.z))) * _615)) + ((half)(_602 * (half)(_59.z))))), 0.0h));
  }
  if (RENODX_TONE_MAP_TYPE != 0) {
    float3 input_color = float3(_627, _628, _629);
    SV_Target = RenoDX(input_color, float2(_18, _19), _626);
    return SV_Target;
  }

  _648 = _57 - cb_misc_000.x;
  _649 = _58 - cb_misc_000.y;
  min16float4 _650 = t5.Sample(s6, float2(_648, _649));
  _654 = cb_misc_000.y + _58;
  min16float4 _655 = t5.Sample(s6, float2(_648, _654));
  _662 = cb_misc_000.x + _57;
  min16float4 _663 = t5.Sample(s6, float2(_662, _654));
  min16float4 _670 = t5.Sample(s6, float2(_662, _649));
  _682 = exp2(cb_misc_336.y);
  _685 = half((_682 * 0.0416666679084301f) * ((((((float4)(t4.Sample(s5, float2(_57, (((cb_misc_016.x / cb_misc_016.y) * (_58 + -0.5f)) + 0.5f))))).w) * 20.0f) * cb_instance_016.x) + 1.0f));
  _689 = float(_685 * ((half)(((half)(((half)((half)(_655.x) + (half)(_650.x))) + (half)(_663.x))) + (half)(_670.x))));
  _690 = float(_685 * ((half)(((half)(((half)((half)(_655.y) + (half)(_650.y))) + (half)(_663.y))) + (half)(_670.y))));
  _691 = float(_685 * ((half)(((half)(((half)((half)(_655.z) + (half)(_650.z))) + (half)(_663.z))) + (half)(_670.z))));
  _692 = _689 + float(min(_627, 16384.0h));
  _693 = _690 + float(min(_628, 16384.0h));
  _694 = _691 + float(min(_629, 16384.0h));
  _701 = cb_misc_320.x - _18;
  _703 = (cb_misc_000.w / cb_misc_000.z) * (cb_misc_320.y - _19);
  _713 = saturate((sqrt((_703 * _703) + (_701 * _701)) - (cb_misc_320.z * 0.949999988079071f)) / (cb_misc_320.z * 0.09999996423721313f));
  _719 = ((_713 * _713) * (3.0f - (_713 * 2.0f))) * cb_misc_320.w;
  _729 = (((_689 / _682) - _692) * _719) + _692;
  _730 = (((_690 / _682) - _693) * _719) + _693;
  _731 = (((_691 / _682) - _694) * _719) + _694;
  _799 = saturate((cb_instance_016.y * _22.w) * _37);
  _806 = (_22.x * 0.14000000059604645f) + -0.5699999928474426f;
  _807 = (_22.y * 0.14000000059604645f) + -0.5699999928474426f;
  _809 = rsqrt(dot(float3(_806, _807, 1.0f), float3(_806, _807, 1.0f)));
  _821 = (dot(float3((-0.0f - cb_misc_272.x), (-0.0f - cb_misc_272.y), (-0.0f - cb_misc_272.z)), float3((_809 * _806), (_809 * _807), _809)) * 0.5f) + 1.0f;
  _829 = saturate(cb_misc_288.x);
  _848 = (saturate((_38 * 2.0f) + (_799 * (_22.w - _38))) * _38) * (min(_829, (dot(float3(_829, saturate(cb_misc_288.y), saturate(cb_misc_288.z)), float3(0.5f, 0.5f, 0.5f)) * 0.30000001192092896f)) + 0.10000000149011612f);
  _853 = ((_20.w * _20.w) * _38) * _848;
  _855 = 1.0f - (_38 * _38);
  _862 = _848 * ((saturate(max((_821 * _821), 0.25f)) * 0.4999999701976776f) + 0.4000000059604645f);
  _866 = (_862 * ((((((_22.z * 0.14000000059604645f) + -0.07000000029802322f) * _22.w) * _799) + (_38 * _20.x)) + _853)) + (_855 * saturate(((((((((_729 * 8.468000411987305f) + 1.0f) * _729) + -0.002956999931484461f) * _729) + 0.00010040000051958486f) * _729) + -1.2739999988298223e-07f) / ((((((((_729 * 8.360400199890137f) + 1.822700023651123f) * _729) + 0.21889999508857727f) * _729) + -0.0021170000545680523f) * _729) + 3.673000173876062e-05f)));
  _867 = (_862 * ((((((_22.w * 0.14000000059604645f) + -0.07000000029802322f) * _22.w) * _799) + (_38 * _20.y)) + _853)) + (_855 * saturate(((((((((_730 * 8.468000411987305f) + 1.0f) * _730) + -0.002956999931484461f) * _730) + 0.00010040000051958486f) * _730) + -1.2739999988298223e-07f) / ((((((((_730 * 8.360400199890137f) + 1.822700023651123f) * _730) + 0.21889999508857727f) * _730) + -0.0021170000545680523f) * _730) + 3.673000173876062e-05f)));
  _868 = (_862 * ((((_22.z * _22.w) * _799) + (_38 * _20.z)) + _853)) + (_855 * saturate(((((((((_731 * 8.468000411987305f) + 1.0f) * _731) + -0.002956999931484461f) * _731) + 0.00010040000051958486f) * _731) + -1.2739999988298223e-07f) / ((((((((_731 * 8.360400199890137f) + 1.822700023651123f) * _731) + 0.21889999508857727f) * _731) + -0.0021170000545680523f) * _731) + 3.673000173876062e-05f)));
  min16float4 _869 = t3.Sample(s6, float3(_868, _867, _866));
  _885 = saturate((_866 + -1.0f) + (float(_869.z) * 2.0f));
  _886 = saturate((_867 + -1.0f) + (float(_869.y) * 2.0f));
  _887 = saturate((_868 + -1.0f) + (float(_869.x) * 2.0f));
  _920 = (((((((_719 * 2.0f) + _626) * 0.5f) + 0.5f) + cb_misc_704.x) * 0.008331298828125f) + 0.008331298828125f) * (frac(sin(dot(float2((cb_misc_576.w + _18), (cb_misc_576.w + _19)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.546875f) + -0.5f);
  _921 = _920 + sqrt(max(0.0f, ((cb_misc_272.w * (1.0f - _885)) + _885)));
  _922 = sqrt(max(0.0f, ((cb_misc_272.w * (1.0f - _886)) + _886))) + _920;
  _923 = sqrt(max(0.0f, ((cb_misc_272.w * (1.0f - _887)) + _887))) + _920;
  min16float4 _927 = t1.SampleLevel(s6, float2(_18, _19), 0.0f);
  _935 = float(_927.w);
  _942 = max(6.103519990574569e-05f, (((_921 * _921) * _935) + float(_927.x)));
  _943 = max(6.103519990574569e-05f, (((_922 * _922) * _935) + float(_927.y)));
  _944 = max(6.103519990574569e-05f, (((_923 * _923) * _935) + float(_927.z)));
  _966 = select((_942 > 0.040449999272823334f), exp2(log2((_942 * 0.9478672742843628f) + 0.05213269963860512f) * 2.4000000953674316f), (_942 * 0.07739938050508499f));
  _967 = select((_943 > 0.040449999272823334f), exp2(log2((_943 * 0.9478672742843628f) + 0.05213269963860512f) * 2.4000000953674316f), (_943 * 0.07739938050508499f));
  _968 = select((_944 > 0.040449999272823334f), exp2(log2((_944 * 0.9478672742843628f) + 0.05213269963860512f) * 2.4000000953674316f), (_944 * 0.07739938050508499f));
  _979 = cb_misc_704.y * 9.999999747378752e-05f;
  _992 = exp2(log2(abs(_979 * mad(0.04331360012292862f, _968, mad(0.3292819857597351f, _967, (_966 * 0.627403974533081f))))) * 0.1593017578125f);
  _993 = exp2(log2(abs(_979 * mad(0.011361200362443924f, _968, mad(0.9195399880409241f, _967, (_966 * 0.06909699738025665f))))) * 0.1593017578125f);
  _994 = exp2(log2(abs(_979 * mad(0.8955950140953064f, _968, mad(0.08801320195198059f, _967, (_966 * 0.01639159955084324f))))) * 0.1593017578125f);
  SV_Target.x = exp2(log2(((_992 * 18.8515625f) + 0.8359375f) / ((_992 * 18.6875f) + 1.0f)) * 78.84375f);
  SV_Target.y = exp2(log2(((_993 * 18.8515625f) + 0.8359375f) / ((_993 * 18.6875f) + 1.0f)) * 78.84375f);
  SV_Target.z = exp2(log2(((_994 * 18.8515625f) + 0.8359375f) / ((_994 * 18.6875f) + 1.0f)) * 78.84375f);
  SV_Target.w = 1.0f;
  return SV_Target;
}