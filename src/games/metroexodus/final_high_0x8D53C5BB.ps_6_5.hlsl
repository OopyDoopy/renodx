#include "./tonemap.hlsli"

#if 0
Texture2D<float2> t0 : register(t0);

Texture2D<min16float4> t1 : register(t1);

Texture2D<min16float4> t2 : register(t2);

Texture3D<min16float4> t3 : register(t3);

Texture2D<float4> t4 : register(t4);

Texture2D<float> t5 : register(t5);

Texture2D<min16float4> t6 : register(t6);

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
  float _22;
  float _23;
  float2 _30;
  float _33;
  float _533;
  half _534;
  half _535;
  half _536;
  float _41;
  float _42;
  float _46;
  float _47;
  float _52;
  float _53;
  float _55;
  float _60;
  float _61;
  float _74;
  float _81;
  float _82;
  float _83;
  float _93;
  float _98;
  float _99;
  float _112;
  float _132;
  float _137;
  float _138;
  float _151;
  float _171;
  float _176;
  float _177;
  float _190;
  float _210;
  float _215;
  float _216;
  float _229;
  float _248;
  float _253;
  float _254;
  float _267;
  float _287;
  float _292;
  float _293;
  float _306;
  float _326;
  float _331;
  float _332;
  float _345;
  float _365;
  float _370;
  float _371;
  float _384;
  float _404;
  float _409;
  float _410;
  float _423;
  half _441;
  float _447;
  float _477;
  float _481;
  half _483;
  float _487;
  float _488;
  float _489;
  float _490;
  float _495;
  float _500;
  half _509;
  half _522;
  half _539;
  float _561;
  float _562;
  float _567;
  float _575;
  float _597;
  half _600;
  float _604;
  float _605;
  float _606;
  float _607;
  float _608;
  float _609;
  float _616;
  float _618;
  float _628;
  float _634;
  float _644;
  float _645;
  float _646;
  float _649;
  float _650;
  float _651;
  float _703;
  float _704;
  float _705;
  float _708;
  float _719;
  float _720;
  float _721;
  float _722;
  float _742;
  float _743;
  float _744;
  float _778;
  float _779;
  float _780;
  float _781;
  float _793;
  float _806;
  float _807;
  float _808;
  float _819;
  float _832;
  float _833;
  float _834;
  _17 = cb_misc_048.x * SV_Position.x;
  _18 = cb_misc_048.y * SV_Position.y;
  _22 = _17 * cb_misc_032.x;
  _23 = _18 * cb_misc_032.y;
  min16float4 _26 = t2.SampleLevel(s6, float2(_17, _18), 0.0f);
  _30 = t0.Sample(s6, float2(_22, _23));
  _33 = dot(float2(_30.x, _30.y), float2(_30.x, _30.y));
  [branch]
  if (_33 > 0.0002500000118743628f) {
    _41 = SV_Position.y * 0.00023148147738538682f;
    _42 = (SV_Position.x * 0.00023148147738538682f) + 0.25f;
    _46 = frac(dot(float2((_42 * _42), (_41 * _41)), float2(3571.0f, 3571.0f)));
    _47 = _46 * _46;
    _52 = cb_instance_016.w * (1.0f / ((sqrt(_33) * 4.0f) + 1.0f));
    _53 = frac(dot(float2(_47, _47), float2(3571.0f, 3571.0f))) * 0.4000000059604645f;
    _55 = _52 * (_53 + -1.2000000476837158f);
    _60 = saturate((_55 * _30.x) + _17);
    _61 = saturate((_55 * _30.y) + _18);
    min16float4 _66 = t2.SampleLevel(s6, float2(_60, _61), 0.0f);
    _74 = 1.0f / ((max((((t5.SampleLevel(s6, float2(_22, _23), 0.0f)).x) - ((t5.SampleLevel(s6, float2((cb_misc_032.x * _60), (cb_misc_032.y * _61)), 0.0f)).x)), 0.0f) * 3.0f) + 1.0f);
    _81 = float(_26.x);
    _82 = float(_26.y);
    _83 = float(_26.z);
    _93 = _52 * (_53 + -1.0f);
    _98 = saturate((_93 * _30.x) + _17);
    _99 = saturate((_93 * _30.y) + _18);
    min16float4 _104 = t2.SampleLevel(s6, float2(_98, _99), 0.0f);
    _112 = 1.0f / ((max((((t5.SampleLevel(s6, float2(_22, _23), 0.0f)).x) - ((t5.SampleLevel(s6, float2((cb_misc_032.x * _98), (cb_misc_032.y * _99)), 0.0f)).x)), 0.0f) * 3.0f) + 1.0f);
    _132 = _52 * (_53 + -0.800000011920929f);
    _137 = saturate((_132 * _30.x) + _17);
    _138 = saturate((_132 * _30.y) + _18);
    min16float4 _143 = t2.SampleLevel(s6, float2(_137, _138), 0.0f);
    _151 = 1.0f / ((max((((t5.SampleLevel(s6, float2(_22, _23), 0.0f)).x) - ((t5.SampleLevel(s6, float2((cb_misc_032.x * _137), (cb_misc_032.y * _138)), 0.0f)).x)), 0.0f) * 3.0f) + 1.0f);
    _171 = _52 * (_53 + -0.6000000238418579f);
    _176 = saturate((_171 * _30.x) + _17);
    _177 = saturate((_171 * _30.y) + _18);
    min16float4 _182 = t2.SampleLevel(s6, float2(_176, _177), 0.0f);
    _190 = 1.0f / ((max((((t5.SampleLevel(s6, float2(_22, _23), 0.0f)).x) - ((t5.SampleLevel(s6, float2((cb_misc_032.x * _176), (cb_misc_032.y * _177)), 0.0f)).x)), 0.0f) * 3.0f) + 1.0f);
    _210 = _52 * (_53 + -0.4000000059604645f);
    _215 = saturate((_210 * _30.x) + _17);
    _216 = saturate((_210 * _30.y) + _18);
    min16float4 _221 = t2.SampleLevel(s6, float2(_215, _216), 0.0f);
    _229 = 1.0f / ((max((((t5.SampleLevel(s6, float2(_22, _23), 0.0f)).x) - ((t5.SampleLevel(s6, float2((cb_misc_032.x * _215), (cb_misc_032.y * _216)), 0.0f)).x)), 0.0f) * 3.0f) + 1.0f);
    _248 = _53 * _52;
    _253 = saturate((_248 * _30.x) + _17);
    _254 = saturate((_248 * _30.y) + _18);
    min16float4 _259 = t2.SampleLevel(s6, float2(_253, _254), 0.0f);
    _267 = 1.0f / ((max((((t5.SampleLevel(s6, float2(_22, _23), 0.0f)).x) - ((t5.SampleLevel(s6, float2((cb_misc_032.x * _253), (cb_misc_032.y * _254)), 0.0f)).x)), 0.0f) * 3.0f) + 1.0f);
    _287 = _52 * (_53 + 0.20000000298023224f);
    _292 = saturate((_287 * _30.x) + _17);
    _293 = saturate((_287 * _30.y) + _18);
    min16float4 _298 = t2.SampleLevel(s6, float2(_292, _293), 0.0f);
    _306 = 1.0f / ((max((((t5.SampleLevel(s6, float2(_22, _23), 0.0f)).x) - ((t5.SampleLevel(s6, float2((cb_misc_032.x * _292), (cb_misc_032.y * _293)), 0.0f)).x)), 0.0f) * 3.0f) + 1.0f);
    _326 = _52 * (_53 + 0.4000000059604645f);
    _331 = saturate((_326 * _30.x) + _17);
    _332 = saturate((_326 * _30.y) + _18);
    min16float4 _337 = t2.SampleLevel(s6, float2(_331, _332), 0.0f);
    _345 = 1.0f / ((max((((t5.SampleLevel(s6, float2(_22, _23), 0.0f)).x) - ((t5.SampleLevel(s6, float2((cb_misc_032.x * _331), (cb_misc_032.y * _332)), 0.0f)).x)), 0.0f) * 3.0f) + 1.0f);
    _365 = _52 * (_53 + 0.6000000238418579f);
    _370 = saturate((_365 * _30.x) + _17);
    _371 = saturate((_365 * _30.y) + _18);
    min16float4 _376 = t2.SampleLevel(s6, float2(_370, _371), 0.0f);
    _384 = 1.0f / ((max((((t5.SampleLevel(s6, float2(_22, _23), 0.0f)).x) - ((t5.SampleLevel(s6, float2((cb_misc_032.x * _370), (cb_misc_032.y * _371)), 0.0f)).x)), 0.0f) * 3.0f) + 1.0f);
    _404 = _52 * (_53 + 0.800000011920929f);
    _409 = saturate((_404 * _30.x) + _17);
    _410 = saturate((_404 * _30.y) + _18);
    min16float4 _415 = t2.SampleLevel(s6, float2(_409, _410), 0.0f);
    _423 = 1.0f / ((max((((t5.SampleLevel(s6, float2(_22, _23), 0.0f)).x) - ((t5.SampleLevel(s6, float2((cb_misc_032.x * _409), (cb_misc_032.y * _410)), 0.0f)).x)), 0.0f) * 3.0f) + 1.0f);
    _441 = half(_423 + float(half(_384 + float(half(_345 + float(half(_306 + float(half(_267 + float(half(_229 + float(half(_190 + float(half(_151 + float(half(_112 + float(half(_74 + 1.0f)))))))))))))))))));
    _447 = saturate((_33 + -0.0002500000118743628f) * 3999.999755859375f);
    _533 = 0.0f;
    _534 = (half)(half((_447 * (float((half)(half((float(_415.x) * _423) + float(half((float(_376.x) * _384) + float(half((float(_337.x) * _345) + float(half((float(_298.x) * _306) + float(half((float(_259.x) * _267) + float(half((float(_221.x) * _229) + float(half((float(_182.x) * _190) + float(half((float(_143.x) * _151) + float(half((float(_104.x) * _112) + float(half((float(_66.x) * _74) + _81)))))))))))))))))))) / _441) - _81)) + _81));
    _535 = (half)(half((_447 * (float((half)(half((float(_415.y) * _423) + float(half((float(_376.y) * _384) + float(half((float(_337.y) * _345) + float(half((float(_298.y) * _306) + float(half((float(_259.y) * _267) + float(half((float(_221.y) * _229) + float(half((float(_182.y) * _190) + float(half((float(_143.y) * _151) + float(half((float(_104.y) * _112) + float(half((float(_66.y) * _74) + _82)))))))))))))))))))) / _441) - _82)) + _82));
    _536 = (half)(half(((float((half)(half((float(_415.z) * _423) + float(half((float(_376.z) * _384) + float(half((float(_337.z) * _345) + float(half((float(_298.z) * _306) + float(half((float(_259.z) * _267) + float(half((float(_221.z) * _229) + float(half((float(_182.z) * _190) + float(half((float(_143.z) * _151) + float(half((float(_104.z) * _112) + float(half((float(_66.z) * _74) + _83)))))))))))))))))))) / _441) - _83) * _447) + _83));
  } else {
    _477 = abs((1.0f - saturate((cb_misc_256.z * ((t5.SampleLevel(s6, float2(_22, _23), 0.0f)).x)) - cb_misc_256.y)) - saturate((cb_misc_256.w * ((t5.SampleLevel(s6, float2(_22, _23), 0.0f)).x)) - cb_misc_256.x));
    _481 = 0.5f - (saturate(_33 * 3999.999755859375f) * 0.5f);
    _483 = half(_477 + -0.5f);
    _487 = _481 * cb_misc_000.x;
    _488 = _481 * cb_misc_000.y;
    _489 = _17 - _487;
    _490 = _18 - _488;
    min16float4 _491 = t2.SampleLevel(s6, float2(_489, _490), 0.0f);
    _495 = _487 + _17;
    min16float4 _496 = t2.SampleLevel(s6, float2(_495, _490), 0.0f);
    _500 = _488 + _18;
    min16float4 _501 = t2.SampleLevel(s6, float2(_489, _500), 0.0f);
    min16float4 _505 = t2.SampleLevel(s6, float2(_495, _500), 0.0f);
    _509 = 1.0h - _483;
    _522 = _483 * 0.25h;
    _533 = _477;
    _534 = (half)(max(((half)(((half)(((half)(((half)(((half)((half)(_496.x) + (half)(_491.x))) + (half)(_501.x))) + (half)(_505.x))) * _522)) + ((half)(_509 * (half)(_26.x))))), 0.0h));
    _535 = (half)(max(((half)(((half)(((half)(((half)(((half)((half)(_496.y) + (half)(_491.y))) + (half)(_501.y))) + (half)(_505.y))) * _522)) + ((half)(_509 * (half)(_26.y))))), 0.0h));
    _536 = (half)(max(((half)(((half)(((half)(((half)(((half)((half)(_496.z) + (half)(_491.z))) + (half)(_501.z))) + (half)(_505.z))) * _522)) + ((half)(_509 * (half)(_26.z))))), 0.0h));
  }

  if (RENODX_TONE_MAP_TYPE != 0) {
    float3 input_color = float3(_534, _535, _536);
    SV_Target = RenoDX(input_color, float2(_17, _18), _533);
    return SV_Target;
  }

  _539 = 1.0h / ((half)(1.0h - (half)(dot(half3(_534, _535, _536), half3(0.29907227h, 0.58691406h, 0.11401367h)))));
  _561 = _17 - cb_misc_000.x;
  _562 = _18 - cb_misc_000.y;
  min16float4 _563 = t6.Sample(s6, float2(_561, _562));
  _567 = cb_misc_000.y + _18;
  min16float4 _568 = t6.Sample(s6, float2(_561, _567));
  _575 = cb_misc_000.x + _17;
  min16float4 _576 = t6.Sample(s6, float2(_575, _567));
  min16float4 _583 = t6.Sample(s6, float2(_575, _562));
  _597 = exp2(cb_misc_336.y);
  _600 = half((_597 * 0.0416666679084301f) * ((((((float4)(t4.Sample(s5, float2(_17, (((cb_misc_016.x / cb_misc_016.y) * (_18 + -0.5f)) + 0.5f))))).w) * 20.0f) * cb_instance_016.x) + 1.0f));
  _604 = float(_600 * ((half)(((half)(((half)((half)(_568.x) + (half)(_563.x))) + (half)(_576.x))) + (half)(_583.x))));
  _605 = float(_600 * ((half)(((half)(((half)((half)(_568.y) + (half)(_563.y))) + (half)(_576.y))) + (half)(_583.y))));
  _606 = float(_600 * ((half)(((half)(((half)((half)(_568.z) + (half)(_563.z))) + (half)(_576.z))) + (half)(_583.z))));
  _607 = _604 + float(min(((half)(_539 * _534)), 16384.0h));
  _608 = _605 + float(min(((half)(_539 * _535)), 16384.0h));
  _609 = _606 + float(min(((half)(_539 * _536)), 16384.0h));
  _616 = cb_misc_320.x - _17;
  _618 = (cb_misc_000.w / cb_misc_000.z) * (cb_misc_320.y - _18);
  _628 = saturate((sqrt((_618 * _618) + (_616 * _616)) - (cb_misc_320.z * 0.949999988079071f)) / (cb_misc_320.z * 0.09999996423721313f));
  _634 = ((_628 * _628) * (3.0f - (_628 * 2.0f))) * cb_misc_320.w;
  _644 = (((_604 / _597) - _607) * _634) + _607;
  _645 = (((_605 / _597) - _608) * _634) + _608;
  _646 = (((_606 / _597) - _609) * _634) + _609;

  _649 = _644 * 1.4142135381698608f;
  _650 = _645 * 1.4142135381698608f;
  _651 = _646 * 1.4142135381698608f;
  _703 = max((((((((((_644 * 3830.7001953125f) + 6801.15234375f) * _649) + 1079.54736328125f) * _649) + 1.1614649295806885f) * _649) + -4.139374868827872e-05f) / ((((((((_644 * 1390.7225341796875f) + 4132.06640625f) * _649) + 2881.652099609375f) * _649) + 128.35911560058594f) * _649) + 1.0f)), 0.0f);
  _704 = max((((((((((_645 * 3830.7001953125f) + 6801.15234375f) * _650) + 1079.54736328125f) * _650) + 1.1614649295806885f) * _650) + -4.139374868827872e-05f) / ((((((((_645 * 1390.7225341796875f) + 4132.06640625f) * _650) + 2881.652099609375f) * _650) + 128.35911560058594f) * _650) + 1.0f)), 0.0f);
  _705 = max((((((((((_646 * 3830.7001953125f) + 6801.15234375f) * _651) + 1079.54736328125f) * _651) + 1.1614649295806885f) * _651) + -4.139374868827872e-05f) / ((((((((_646 * 1390.7225341796875f) + 4132.06640625f) * _651) + 2881.652099609375f) * _651) + 128.35911560058594f) * _651) + 1.0f)), 0.0f);
  _708 = max(max(max(_703, _704), _705), 9.999999974752427e-07f);
  _719 = select((abs(1.0f - _708) < 0.5249999761581421f), ((((5.809524059295654f - (_708 * 1.9047620296478271f)) * _708) + -0.42976200580596924f) * 0.25f), saturate(_708)) / _708;
  _720 = _719 * _703;
  _721 = _719 * _704;
  _722 = _719 * _705;
  min16float4 _723 = t3.Sample(s6, float3(_722, _721, _720));
  _742 = saturate((_720 + -1.0f) + (float(_723.z) * 2.0f)) / _719;
  _743 = saturate((_721 + -1.0f) + (float(_723.y) * 2.0f)) / _719;
  _744 = saturate((_722 + -1.0f) + (float(_723.x) * 2.0f)) / _719;
  // ui blend
  _778 = (((((((_634 * 2.0f) + _533) * 0.5f) + 0.5f) + cb_misc_704.x) * 0.008331298828125f) + 0.008331298828125f) * (frac(sin(dot(float2((cb_misc_576.w + _17), (cb_misc_576.w + _18)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.546875f) + -0.5f);
  _779 = _778 + sqrt(max(0.0f, ((cb_misc_272.w * (2.700000047683716f - _742)) + _742)));
  _780 = sqrt(max(0.0f, ((cb_misc_272.w * (2.700000047683716f - _743)) + _743))) + _778;
  _781 = sqrt(max(0.0f, ((cb_misc_272.w * (2.700000047683716f - _744)) + _744))) + _778;
  min16float4 _785 = t1.SampleLevel(s6, float2(_17, _18), 0.0f);
  _793 = float(_785.w);
  _806 = exp2(log2(((_779 * _779) * _793) + float(_785.x)) * 2.200000047683716f);
  _807 = exp2(log2(((_780 * _780) * _793) + float(_785.y)) * 2.200000047683716f);
  _808 = exp2(log2(((_781 * _781) * _793) + float(_785.z)) * 2.200000047683716f);
  _819 = cb_misc_704.y * 9.999999747378752e-05f;
  _832 = exp2(log2(abs(_819 * mad(0.04331360012292862f, _808, mad(0.3292819857597351f, _807, (_806 * 0.627403974533081f))))) * 0.1593017578125f);
  _833 = exp2(log2(abs(_819 * mad(0.011361200362443924f, _808, mad(0.9195399880409241f, _807, (_806 * 0.06909699738025665f))))) * 0.1593017578125f);
  _834 = exp2(log2(abs(_819 * mad(0.8955950140953064f, _808, mad(0.08801320195198059f, _807, (_806 * 0.01639159955084324f))))) * 0.1593017578125f);
  SV_Target.x = exp2(log2(((_832 * 18.8515625f) + 0.8359375f) / ((_832 * 18.6875f) + 1.0f)) * 78.84375f);
  SV_Target.y = exp2(log2(((_833 * 18.8515625f) + 0.8359375f) / ((_833 * 18.6875f) + 1.0f)) * 78.84375f);
  SV_Target.z = exp2(log2(((_834 * 18.8515625f) + 0.8359375f) / ((_834 * 18.6875f) + 1.0f)) * 78.84375f);
  SV_Target.w = 1.0f;
  return SV_Target;
}