#define USE_GASMASK
#include "./tonemap.hlsli"

#if 0
Texture2D<float2> t0 : register(t0);

Texture2D<min16float4> t1 : register(t1);

Texture2D<min16float4> t2 : register(t2);

Texture3D<min16float4> t3 : register(t3);

Texture2D<float4> t4 : register(t4);

Texture2D<float> t5 : register(t5);

Texture2D<min16float4> t6 : register(t6);

Texture2D<float4> t7 : register(t7);

Texture2D<float4> t8 : register(t8);

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
  float _19;
  float _20;
  float4 _21;
  float4 _23;
  float _29;
  float _30;
  float _31;
  float _33;
  float _38;
  float _39;
  float _43;
  float _48;
  float _58;
  float _59;
  float _63;
  float _64;
  float2 _71;
  float _74;
  float _495;
  half _496;
  half _497;
  half _498;
  float _82;
  float _83;
  float _87;
  float _88;
  float _92;
  float _93;
  float _95;
  float _100;
  float _101;
  float _114;
  float _121;
  float _122;
  float _123;
  float _133;
  float _138;
  float _139;
  float _152;
  float _172;
  float _177;
  float _178;
  float _191;
  float _211;
  float _216;
  float _217;
  float _230;
  float _249;
  float _254;
  float _255;
  float _268;
  float _288;
  float _293;
  float _294;
  float _307;
  float _327;
  float _332;
  float _333;
  float _346;
  float _366;
  float _371;
  float _372;
  float _385;
  half _403;
  float _409;
  float _439;
  float _443;
  half _445;
  float _449;
  float _450;
  float _451;
  float _452;
  float _457;
  float _462;
  half _471;
  half _484;
  half _501;
  float _523;
  float _524;
  float _529;
  float _537;
  float _557;
  half _560;
  float _564;
  float _565;
  float _566;
  float _567;
  float _568;
  float _569;
  float _576;
  float _578;
  float _588;
  float _594;
  float _604;
  float _605;
  float _606;
  float _609;
  float _610;
  float _611;
  float _677;
  float _684;
  float _685;
  float _687;
  float _699;
  float _707;
  float _726;
  float _731;
  float _733;
  float _740;
  float _744;
  float _745;
  float _746;
  float _749;
  float _760;
  float _761;
  float _762;
  float _763;
  float _783;
  float _784;
  float _785;
  float _818;
  float _819;
  float _820;
  float _821;
  float _833;
  float _846;
  float _847;
  float _848;
  float _859;
  float _872;
  float _873;
  float _874;
  _19 = cb_misc_048.x * SV_Position.x;
  _20 = cb_misc_048.y * SV_Position.y;
  _21 = t7.Sample(s5, float2(_19, _20));
  _23 = t8.Sample(s5, float2(_19, _20));
  _29 = (_23.x * 0.2800000011920929f) + -0.14000000059604645f;
  _30 = _23.y * 0.2800000011920929f;
  _31 = _30 + -0.14000000059604645f;
  _33 = (_23.z * 6.720000267028809f) + -3.3600001335144043f;
  _38 = saturate(cb_instance_016.x * 40.0f);
  _39 = _38 * _21.w;
  _43 = saturate(((-0.0f - _29) - _31) + _39);
  _48 = saturate(-0.0f - ((_33 * cb_instance_016.y) * _38));
  _58 = (((_48 * (_33 - _29)) + _29) * _43) + _19;
  _59 = (((_48 * ((-3.2200000286102295f - _30) + (_23.w * 6.720000267028809f))) + _31) * _43) + _20;
  _63 = _58 * cb_misc_032.x;
  _64 = _59 * cb_misc_032.y;
  min16float4 _67 = t2.SampleLevel(s6, float2(_58, _59), 0.0f);
  _71 = t0.Sample(s6, float2(_63, _64));
  _74 = dot(float2(_71.x, _71.y), float2(_71.x, _71.y));
  [branch]
  if (_74 > 0.0002500000118743628f) {
    _82 = SV_Position.y * 0.00023148147738538682f;
    _83 = (SV_Position.x * 0.00023148147738538682f) + 0.25f;
    _87 = frac(dot(float2((_83 * _83), (_82 * _82)), float2(3571.0f, 3571.0f)));
    _88 = _87 * _87;
    _92 = cb_instance_016.w * (1.0f / ((sqrt(_74) * 4.0f) + 1.0f));
    _93 = frac(dot(float2(_88, _88), float2(3571.0f, 3571.0f))) * 0.5f;
    _95 = _92 * (_93 + -1.25f);
    _100 = saturate((_95 * _71.x) + _58);
    _101 = saturate((_95 * _71.y) + _59);
    min16float4 _106 = t2.SampleLevel(s6, float2(_100, _101), 0.0f);
    _114 = 1.0f / ((max((((t5.SampleLevel(s6, float2(_63, _64), 0.0f)).x) - ((t5.SampleLevel(s6, float2((cb_misc_032.x * _100), (cb_misc_032.y * _101)), 0.0f)).x)), 0.0f) * 3.0f) + 1.0f);
    _121 = float(_67.x);
    _122 = float(_67.y);
    _123 = float(_67.z);
    _133 = _92 * (_93 + -1.0f);
    _138 = saturate((_133 * _71.x) + _58);
    _139 = saturate((_133 * _71.y) + _59);
    min16float4 _144 = t2.SampleLevel(s6, float2(_138, _139), 0.0f);
    _152 = 1.0f / ((max((((t5.SampleLevel(s6, float2(_63, _64), 0.0f)).x) - ((t5.SampleLevel(s6, float2((cb_misc_032.x * _138), (cb_misc_032.y * _139)), 0.0f)).x)), 0.0f) * 3.0f) + 1.0f);
    _172 = _92 * (_93 + -0.75f);
    _177 = saturate((_172 * _71.x) + _58);
    _178 = saturate((_172 * _71.y) + _59);
    min16float4 _183 = t2.SampleLevel(s6, float2(_177, _178), 0.0f);
    _191 = 1.0f / ((max((((t5.SampleLevel(s6, float2(_63, _64), 0.0f)).x) - ((t5.SampleLevel(s6, float2((cb_misc_032.x * _177), (cb_misc_032.y * _178)), 0.0f)).x)), 0.0f) * 3.0f) + 1.0f);
    _211 = _92 * (_93 + -0.5f);
    _216 = saturate((_211 * _71.x) + _58);
    _217 = saturate((_211 * _71.y) + _59);
    min16float4 _222 = t2.SampleLevel(s6, float2(_216, _217), 0.0f);
    _230 = 1.0f / ((max((((t5.SampleLevel(s6, float2(_63, _64), 0.0f)).x) - ((t5.SampleLevel(s6, float2((cb_misc_032.x * _216), (cb_misc_032.y * _217)), 0.0f)).x)), 0.0f) * 3.0f) + 1.0f);
    _249 = _93 * _92;
    _254 = saturate((_249 * _71.x) + _58);
    _255 = saturate((_249 * _71.y) + _59);
    min16float4 _260 = t2.SampleLevel(s6, float2(_254, _255), 0.0f);
    _268 = 1.0f / ((max((((t5.SampleLevel(s6, float2(_63, _64), 0.0f)).x) - ((t5.SampleLevel(s6, float2((cb_misc_032.x * _254), (cb_misc_032.y * _255)), 0.0f)).x)), 0.0f) * 3.0f) + 1.0f);
    _288 = _92 * (_93 + 0.25f);
    _293 = saturate((_288 * _71.x) + _58);
    _294 = saturate((_288 * _71.y) + _59);
    min16float4 _299 = t2.SampleLevel(s6, float2(_293, _294), 0.0f);
    _307 = 1.0f / ((max((((t5.SampleLevel(s6, float2(_63, _64), 0.0f)).x) - ((t5.SampleLevel(s6, float2((cb_misc_032.x * _293), (cb_misc_032.y * _294)), 0.0f)).x)), 0.0f) * 3.0f) + 1.0f);
    _327 = _92 * (_93 + 0.5f);
    _332 = saturate((_327 * _71.x) + _58);
    _333 = saturate((_327 * _71.y) + _59);
    min16float4 _338 = t2.SampleLevel(s6, float2(_332, _333), 0.0f);
    _346 = 1.0f / ((max((((t5.SampleLevel(s6, float2(_63, _64), 0.0f)).x) - ((t5.SampleLevel(s6, float2((cb_misc_032.x * _332), (cb_misc_032.y * _333)), 0.0f)).x)), 0.0f) * 3.0f) + 1.0f);
    _366 = _92 * (_93 + 0.75f);
    _371 = saturate((_366 * _71.x) + _58);
    _372 = saturate((_366 * _71.y) + _59);
    min16float4 _377 = t2.SampleLevel(s6, float2(_371, _372), 0.0f);
    _385 = 1.0f / ((max((((t5.SampleLevel(s6, float2(_63, _64), 0.0f)).x) - ((t5.SampleLevel(s6, float2((cb_misc_032.x * _371), (cb_misc_032.y * _372)), 0.0f)).x)), 0.0f) * 3.0f) + 1.0f);
    _403 = half(_385 + float(half(_346 + float(half(_307 + float(half(_268 + float(half(_230 + float(half(_191 + float(half(_152 + float(half(_114 + 1.0f)))))))))))))));
    _409 = saturate((_74 + -0.0002500000118743628f) * 3999.999755859375f);
    _495 = 0.0f;
    _496 = (half)(half((_409 * (float((half)(half((float(_377.x) * _385) + float(half((float(_338.x) * _346) + float(half((float(_299.x) * _307) + float(half((float(_260.x) * _268) + float(half((float(_222.x) * _230) + float(half((float(_183.x) * _191) + float(half((float(_144.x) * _152) + float(half((float(_106.x) * _114) + _121)))))))))))))))) / _403) - _121)) + _121));
    _497 = (half)(half((_409 * (float((half)(half((float(_377.y) * _385) + float(half((float(_338.y) * _346) + float(half((float(_299.y) * _307) + float(half((float(_260.y) * _268) + float(half((float(_222.y) * _230) + float(half((float(_183.y) * _191) + float(half((float(_144.y) * _152) + float(half((float(_106.y) * _114) + _122)))))))))))))))) / _403) - _122)) + _122));
    _498 = (half)(half(((float((half)(half((float(_377.z) * _385) + float(half((float(_338.z) * _346) + float(half((float(_299.z) * _307) + float(half((float(_260.z) * _268) + float(half((float(_222.z) * _230) + float(half((float(_183.z) * _191) + float(half((float(_144.z) * _152) + float(half((float(_106.z) * _114) + _123)))))))))))))))) / _403) - _123) * _409) + _123));
  } else {
    _439 = abs((1.0f - saturate((cb_misc_256.z * ((t5.SampleLevel(s6, float2(_63, _64), 0.0f)).x)) - cb_misc_256.y)) - saturate((cb_misc_256.w * ((t5.SampleLevel(s6, float2(_63, _64), 0.0f)).x)) - cb_misc_256.x));
    _443 = 0.5f - (saturate(_74 * 3999.999755859375f) * 0.5f);
    _445 = half(_439 + -0.5f);
    _449 = _443 * cb_misc_000.x;
    _450 = _443 * cb_misc_000.y;
    _451 = _58 - _449;
    _452 = _59 - _450;
    min16float4 _453 = t2.SampleLevel(s6, float2(_451, _452), 0.0f);
    _457 = _449 + _58;
    min16float4 _458 = t2.SampleLevel(s6, float2(_457, _452), 0.0f);
    _462 = _450 + _59;
    min16float4 _463 = t2.SampleLevel(s6, float2(_451, _462), 0.0f);
    min16float4 _467 = t2.SampleLevel(s6, float2(_457, _462), 0.0f);
    _471 = 1.0h - _445;
    _484 = _445 * 0.25h;
    _495 = _439;
    _496 = (half)(max(((half)(((half)(((half)(((half)(((half)((half)(_458.x) + (half)(_453.x))) + (half)(_463.x))) + (half)(_467.x))) * _484)) + ((half)(_471 * (half)(_67.x))))), 0.0h));
    _497 = (half)(max(((half)(((half)(((half)(((half)(((half)((half)(_458.y) + (half)(_453.y))) + (half)(_463.y))) + (half)(_467.y))) * _484)) + ((half)(_471 * (half)(_67.y))))), 0.0h));
    _498 = (half)(max(((half)(((half)(((half)(((half)(((half)((half)(_458.z) + (half)(_453.z))) + (half)(_463.z))) + (half)(_467.z))) * _484)) + ((half)(_471 * (half)(_67.z))))), 0.0h));
  }
  _501 = 1.0h / ((half)(1.0h - (half)(dot(half3(_496, _497, _498), half3(0.29907227h, 0.58691406h, 0.11401367h)))));
  _523 = _58 - cb_misc_000.x;
  _524 = _59 - cb_misc_000.y;
  min16float4 _525 = t6.Sample(s6, float2(_523, _524));
  _529 = cb_misc_000.y + _59;
  min16float4 _530 = t6.Sample(s6, float2(_523, _529));
  _537 = cb_misc_000.x + _58;
  min16float4 _538 = t6.Sample(s6, float2(_537, _529));
  min16float4 _545 = t6.Sample(s6, float2(_537, _524));
  _557 = exp2(cb_misc_336.y);
  _560 = half((_557 * 0.0416666679084301f) * ((((((float4)(t4.Sample(s5, float2(_58, (((cb_misc_016.x / cb_misc_016.y) * (_59 + -0.5f)) + 0.5f))))).w) * 20.0f) * cb_instance_016.x) + 1.0f));
  _564 = float(_560 * ((half)(((half)(((half)((half)(_530.x) + (half)(_525.x))) + (half)(_538.x))) + (half)(_545.x))));
  _565 = float(_560 * ((half)(((half)(((half)((half)(_530.y) + (half)(_525.y))) + (half)(_538.y))) + (half)(_545.y))));
  _566 = float(_560 * ((half)(((half)(((half)((half)(_530.z) + (half)(_525.z))) + (half)(_538.z))) + (half)(_545.z))));
  _567 = _564 + float(min(((half)(_501 * _496)), 16384.0h));
  _568 = _565 + float(min(((half)(_501 * _497)), 16384.0h));
  _569 = _566 + float(min(((half)(_501 * _498)), 16384.0h));
  _576 = cb_misc_320.x - _19;
  _578 = (cb_misc_000.w / cb_misc_000.z) * (cb_misc_320.y - _20);
  _588 = saturate((sqrt((_578 * _578) + (_576 * _576)) - (cb_misc_320.z * 0.949999988079071f)) / (cb_misc_320.z * 0.09999996423721313f));
  _594 = ((_588 * _588) * (3.0f - (_588 * 2.0f))) * cb_misc_320.w;
  _604 = (((_564 / _557) - _567) * _594) + _567;
  _605 = (((_565 / _557) - _568) * _594) + _568;
  _606 = (((_566 / _557) - _569) * _594) + _569;

  if (RENODX_TONE_MAP_TYPE != 0) {
    float3 untonemapped = float3(_604, _605, _606);
    SV_Target = RenoDX(untonemapped, float2(_19, _20), _594, _495);
    return SV_Target;
  }

  _609 = _604 * 1.4142135381698608f;
  _610 = _605 * 1.4142135381698608f;
  _611 = _606 * 1.4142135381698608f;
  _677 = saturate((cb_instance_016.y * _23.w) * _38);
  _684 = (_23.x * 0.14000000059604645f) + -0.5699999928474426f;
  _685 = (_23.y * 0.14000000059604645f) + -0.5699999928474426f;
  _687 = rsqrt(dot(float3(_684, _685, 1.0f), float3(_684, _685, 1.0f)));
  _699 = (dot(float3((-0.0f - cb_misc_272.x), (-0.0f - cb_misc_272.y), (-0.0f - cb_misc_272.z)), float3((_687 * _684), (_687 * _685), _687)) * 0.5f) + 1.0f;
  _707 = saturate(cb_misc_288.x);
  _726 = (saturate((_39 * 2.0f) + (_677 * (_23.w - _39))) * _39) * (min(_707, (dot(float3(_707, saturate(cb_misc_288.y), saturate(cb_misc_288.z)), float3(0.5f, 0.5f, 0.5f)) * 0.30000001192092896f)) + 0.10000000149011612f);
  _731 = ((_21.w * _21.w) * _39) * _726;
  _733 = 1.0f - (_39 * _39);
  _740 = _726 * ((saturate(max((_699 * _699), 0.25f)) * 0.4999999701976776f) + 0.4000000059604645f);
  _744 = (_740 * ((((((_23.z * 0.14000000059604645f) + -0.07000000029802322f) * _23.w) * _677) + (_39 * _21.x)) + _731)) + (_733 * max((((((((((_604 * 3830.7001953125f) + 6801.15234375f) * _609) + 1079.54736328125f) * _609) + 1.1614649295806885f) * _609) + -4.139374868827872e-05f) / ((((((((_604 * 1390.7225341796875f) + 4132.06640625f) * _609) + 2881.652099609375f) * _609) + 128.35911560058594f) * _609) + 1.0f)), 0.0f));
  _745 = (_740 * ((((((_23.w * 0.14000000059604645f) + -0.07000000029802322f) * _23.w) * _677) + (_39 * _21.y)) + _731)) + (_733 * max((((((((((_605 * 3830.7001953125f) + 6801.15234375f) * _610) + 1079.54736328125f) * _610) + 1.1614649295806885f) * _610) + -4.139374868827872e-05f) / ((((((((_605 * 1390.7225341796875f) + 4132.06640625f) * _610) + 2881.652099609375f) * _610) + 128.35911560058594f) * _610) + 1.0f)), 0.0f));
  _746 = (_740 * ((((_23.z * _23.w) * _677) + (_39 * _21.z)) + _731)) + (_733 * max((((((((((_606 * 3830.7001953125f) + 6801.15234375f) * _611) + 1079.54736328125f) * _611) + 1.1614649295806885f) * _611) + -4.139374868827872e-05f) / ((((((((_606 * 1390.7225341796875f) + 4132.06640625f) * _611) + 2881.652099609375f) * _611) + 128.35911560058594f) * _611) + 1.0f)), 0.0f));
  _749 = max(max(max(_744, _745), _746), 9.999999974752427e-07f);
  _760 = select((abs(1.0f - _749) < 0.5249999761581421f), ((((5.809524059295654f - (_749 * 1.9047620296478271f)) * _749) + -0.42976200580596924f) * 0.25f), saturate(_749)) / _749;
  _761 = _744 * _760;
  _762 = _745 * _760;
  _763 = _746 * _760;
  min16float4 _764 = t3.Sample(s6, float3(_763, _762, _761));
  _783 = saturate((_761 + -1.0f) + (float(_764.z) * 2.0f)) / _760;
  _784 = saturate((_762 + -1.0f) + (float(_764.y) * 2.0f)) / _760;
  _785 = saturate((_763 + -1.0f) + (float(_764.x) * 2.0f)) / _760;
  //UI Blending
  _818 = (((((((_594 * 2.0f) + _495) * 0.5f) + 0.5f) + cb_misc_704.x) * 0.008331298828125f) + 0.008331298828125f) * (frac(sin(dot(float2((cb_misc_576.w + _19), (cb_misc_576.w + _20)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.546875f) + -0.5f);
  _819 = _818 + sqrt(max(0.0f, ((cb_misc_272.w * (2.700000047683716f - _783)) + _783)));
  _820 = sqrt(max(0.0f, ((cb_misc_272.w * (2.700000047683716f - _784)) + _784))) + _818;
  _821 = sqrt(max(0.0f, ((cb_misc_272.w * (2.700000047683716f - _785)) + _785))) + _818;
  min16float4 _825 = t1.SampleLevel(s6, float2(_19, _20), 0.0f);
  _833 = float(_825.w);
  _846 = exp2(log2(((_819 * _819) * _833) + float(_825.x)) * 2.200000047683716f);
  _847 = exp2(log2(((_820 * _820) * _833) + float(_825.y)) * 2.200000047683716f);
  _848 = exp2(log2(((_821 * _821) * _833) + float(_825.z)) * 2.200000047683716f);
  _859 = cb_misc_704.y * 9.999999747378752e-05f;
  _872 = exp2(log2(abs(_859 * mad(0.04331360012292862f, _848, mad(0.3292819857597351f, _847, (_846 * 0.627403974533081f))))) * 0.1593017578125f);
  _873 = exp2(log2(abs(_859 * mad(0.011361200362443924f, _848, mad(0.9195399880409241f, _847, (_846 * 0.06909699738025665f))))) * 0.1593017578125f);
  _874 = exp2(log2(abs(_859 * mad(0.8955950140953064f, _848, mad(0.08801320195198059f, _847, (_846 * 0.01639159955084324f))))) * 0.1593017578125f);
  SV_Target.x = exp2(log2(((_872 * 18.8515625f) + 0.8359375f) / ((_872 * 18.6875f) + 1.0f)) * 78.84375f);
  SV_Target.y = exp2(log2(((_873 * 18.8515625f) + 0.8359375f) / ((_873 * 18.6875f) + 1.0f)) * 78.84375f);
  SV_Target.z = exp2(log2(((_874 * 18.8515625f) + 0.8359375f) / ((_874 * 18.6875f) + 1.0f)) * 78.84375f);
  SV_Target.w = 1.0f;
  return SV_Target;
}