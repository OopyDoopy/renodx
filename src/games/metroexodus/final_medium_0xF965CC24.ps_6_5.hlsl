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
  float _455;
  half _456;
  half _457;
  half _458;
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
  float _209;
  float _214;
  float _215;
  float _228;
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
  half _363;
  float _369;
  float _399;
  float _403;
  half _405;
  float _409;
  float _410;
  float _411;
  float _412;
  float _417;
  float _422;
  half _431;
  half _444;
  half _461;
  float _483;
  float _484;
  float _489;
  float _497;
  float _519;
  half _522;
  float _526;
  float _527;
  float _528;
  float _529;
  float _530;
  float _531;
  float _538;
  float _540;
  float _550;
  float _556;
  float _566;
  float _567;
  float _568;
  float _571;
  float _572;
  float _573;
  float _625;
  float _626;
  float _627;
  float _630;
  float _641;
  float _642;
  float _643;
  float _644;
  float _664;
  float _665;
  float _666;
  float _700;
  float _701;
  float _702;
  float _703;
  float _715;
  float _728;
  float _729;
  float _730;
  float _741;
  float _754;
  float _755;
  float _756;
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
    _53 = frac(dot(float2(_47, _47), float2(3571.0f, 3571.0f))) * 0.5f;
    _55 = _52 * (_53 + -1.25f);
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
    _132 = _52 * (_53 + -0.75f);
    _137 = saturate((_132 * _30.x) + _17);
    _138 = saturate((_132 * _30.y) + _18);
    min16float4 _143 = t2.SampleLevel(s6, float2(_137, _138), 0.0f);
    _151 = 1.0f / ((max((((t5.SampleLevel(s6, float2(_22, _23), 0.0f)).x) - ((t5.SampleLevel(s6, float2((cb_misc_032.x * _137), (cb_misc_032.y * _138)), 0.0f)).x)), 0.0f) * 3.0f) + 1.0f);
    _171 = _52 * (_53 + -0.5f);
    _176 = saturate((_171 * _30.x) + _17);
    _177 = saturate((_171 * _30.y) + _18);
    min16float4 _182 = t2.SampleLevel(s6, float2(_176, _177), 0.0f);
    _190 = 1.0f / ((max((((t5.SampleLevel(s6, float2(_22, _23), 0.0f)).x) - ((t5.SampleLevel(s6, float2((cb_misc_032.x * _176), (cb_misc_032.y * _177)), 0.0f)).x)), 0.0f) * 3.0f) + 1.0f);
    _209 = _53 * _52;
    _214 = saturate((_209 * _30.x) + _17);
    _215 = saturate((_209 * _30.y) + _18);
    min16float4 _220 = t2.SampleLevel(s6, float2(_214, _215), 0.0f);
    _228 = 1.0f / ((max((((t5.SampleLevel(s6, float2(_22, _23), 0.0f)).x) - ((t5.SampleLevel(s6, float2((cb_misc_032.x * _214), (cb_misc_032.y * _215)), 0.0f)).x)), 0.0f) * 3.0f) + 1.0f);
    _248 = _52 * (_53 + 0.25f);
    _253 = saturate((_248 * _30.x) + _17);
    _254 = saturate((_248 * _30.y) + _18);
    min16float4 _259 = t2.SampleLevel(s6, float2(_253, _254), 0.0f);
    _267 = 1.0f / ((max((((t5.SampleLevel(s6, float2(_22, _23), 0.0f)).x) - ((t5.SampleLevel(s6, float2((cb_misc_032.x * _253), (cb_misc_032.y * _254)), 0.0f)).x)), 0.0f) * 3.0f) + 1.0f);
    _287 = _52 * (_53 + 0.5f);
    _292 = saturate((_287 * _30.x) + _17);
    _293 = saturate((_287 * _30.y) + _18);
    min16float4 _298 = t2.SampleLevel(s6, float2(_292, _293), 0.0f);
    _306 = 1.0f / ((max((((t5.SampleLevel(s6, float2(_22, _23), 0.0f)).x) - ((t5.SampleLevel(s6, float2((cb_misc_032.x * _292), (cb_misc_032.y * _293)), 0.0f)).x)), 0.0f) * 3.0f) + 1.0f);
    _326 = _52 * (_53 + 0.75f);
    _331 = saturate((_326 * _30.x) + _17);
    _332 = saturate((_326 * _30.y) + _18);
    min16float4 _337 = t2.SampleLevel(s6, float2(_331, _332), 0.0f);
    _345 = 1.0f / ((max((((t5.SampleLevel(s6, float2(_22, _23), 0.0f)).x) - ((t5.SampleLevel(s6, float2((cb_misc_032.x * _331), (cb_misc_032.y * _332)), 0.0f)).x)), 0.0f) * 3.0f) + 1.0f);
    _363 = half(_345 + float(half(_306 + float(half(_267 + float(half(_228 + float(half(_190 + float(half(_151 + float(half(_112 + float(half(_74 + 1.0f)))))))))))))));
    _369 = saturate((_33 + -0.0002500000118743628f) * 3999.999755859375f);
    _455 = 0.0f;
    _456 = (half)(half((_369 * (float((half)(half((float(_337.x) * _345) + float(half((float(_298.x) * _306) + float(half((float(_259.x) * _267) + float(half((float(_220.x) * _228) + float(half((float(_182.x) * _190) + float(half((float(_143.x) * _151) + float(half((float(_104.x) * _112) + float(half((float(_66.x) * _74) + _81)))))))))))))))) / _363) - _81)) + _81));
    _457 = (half)(half((_369 * (float((half)(half((float(_337.y) * _345) + float(half((float(_298.y) * _306) + float(half((float(_259.y) * _267) + float(half((float(_220.y) * _228) + float(half((float(_182.y) * _190) + float(half((float(_143.y) * _151) + float(half((float(_104.y) * _112) + float(half((float(_66.y) * _74) + _82)))))))))))))))) / _363) - _82)) + _82));
    _458 = (half)(half(((float((half)(half((float(_337.z) * _345) + float(half((float(_298.z) * _306) + float(half((float(_259.z) * _267) + float(half((float(_220.z) * _228) + float(half((float(_182.z) * _190) + float(half((float(_143.z) * _151) + float(half((float(_104.z) * _112) + float(half((float(_66.z) * _74) + _83)))))))))))))))) / _363) - _83) * _369) + _83));
  } else {
    _399 = abs((1.0f - saturate((cb_misc_256.z * ((t5.SampleLevel(s6, float2(_22, _23), 0.0f)).x)) - cb_misc_256.y)) - saturate((cb_misc_256.w * ((t5.SampleLevel(s6, float2(_22, _23), 0.0f)).x)) - cb_misc_256.x));
    _403 = 0.5f - (saturate(_33 * 3999.999755859375f) * 0.5f);
    _405 = half(_399 + -0.5f);
    _409 = _403 * cb_misc_000.x;
    _410 = _403 * cb_misc_000.y;
    _411 = _17 - _409;
    _412 = _18 - _410;
    min16float4 _413 = t2.SampleLevel(s6, float2(_411, _412), 0.0f);
    _417 = _409 + _17;
    min16float4 _418 = t2.SampleLevel(s6, float2(_417, _412), 0.0f);
    _422 = _410 + _18;
    min16float4 _423 = t2.SampleLevel(s6, float2(_411, _422), 0.0f);
    min16float4 _427 = t2.SampleLevel(s6, float2(_417, _422), 0.0f);
    _431 = 1.0h - _405;
    _444 = _405 * 0.25h;
    _455 = _399;
    _456 = (half)(max(((half)(((half)(((half)(((half)(((half)((half)(_418.x) + (half)(_413.x))) + (half)(_423.x))) + (half)(_427.x))) * _444)) + ((half)(_431 * (half)(_26.x))))), 0.0h));
    _457 = (half)(max(((half)(((half)(((half)(((half)(((half)((half)(_418.y) + (half)(_413.y))) + (half)(_423.y))) + (half)(_427.y))) * _444)) + ((half)(_431 * (half)(_26.y))))), 0.0h));
    _458 = (half)(max(((half)(((half)(((half)(((half)(((half)((half)(_418.z) + (half)(_413.z))) + (half)(_423.z))) + (half)(_427.z))) * _444)) + ((half)(_431 * (half)(_26.z))))), 0.0h));
  }
  _461 = 1.0h / ((half)(1.0h - (half)(dot(half3(_456, _457, _458), half3(0.29907227h, 0.58691406h, 0.11401367h)))));
  _483 = _17 - cb_misc_000.x;
  _484 = _18 - cb_misc_000.y;
  min16float4 _485 = t6.Sample(s6, float2(_483, _484));
  _489 = cb_misc_000.y + _18;
  min16float4 _490 = t6.Sample(s6, float2(_483, _489));
  _497 = cb_misc_000.x + _17;
  min16float4 _498 = t6.Sample(s6, float2(_497, _489));
  min16float4 _505 = t6.Sample(s6, float2(_497, _484));
  _519 = exp2(cb_misc_336.y);
  _522 = half((_519 * 0.0416666679084301f) * ((((((float4)(t4.Sample(s5, float2(_17, (((cb_misc_016.x / cb_misc_016.y) * (_18 + -0.5f)) + 0.5f))))).w) * 20.0f) * cb_instance_016.x) + 1.0f));
  _526 = float(_522 * ((half)(((half)(((half)((half)(_490.x) + (half)(_485.x))) + (half)(_498.x))) + (half)(_505.x))));
  _527 = float(_522 * ((half)(((half)(((half)((half)(_490.y) + (half)(_485.y))) + (half)(_498.y))) + (half)(_505.y))));
  _528 = float(_522 * ((half)(((half)(((half)((half)(_490.z) + (half)(_485.z))) + (half)(_498.z))) + (half)(_505.z))));
  _529 = _526 + float(min(((half)(_461 * _456)), 16384.0h));
  _530 = _527 + float(min(((half)(_461 * _457)), 16384.0h));
  _531 = _528 + float(min(((half)(_461 * _458)), 16384.0h));
  _538 = cb_misc_320.x - _17;
  _540 = (cb_misc_000.w / cb_misc_000.z) * (cb_misc_320.y - _18);
  _550 = saturate((sqrt((_540 * _540) + (_538 * _538)) - (cb_misc_320.z * 0.949999988079071f)) / (cb_misc_320.z * 0.09999996423721313f));
  _556 = ((_550 * _550) * (3.0f - (_550 * 2.0f))) * cb_misc_320.w;
  _566 = (((_526 / _519) - _529) * _556) + _529;
  _567 = (((_527 / _519) - _530) * _556) + _530;
  _568 = (((_528 / _519) - _531) * _556) + _531;

  if (RENODX_TONE_MAP_TYPE != 0) {
    float3 untonemapped = float3(_566, _567, _568);
    SV_Target = RenoDX(untonemapped, float2(_17, _18), _556, _455);
    return SV_Target;
  }
  
  _571 = _566 * 1.4142135381698608f;
  _572 = _567 * 1.4142135381698608f;
  _573 = _568 * 1.4142135381698608f;
  _625 = max((((((((((_566 * 3830.7001953125f) + 6801.15234375f) * _571) + 1079.54736328125f) * _571) + 1.1614649295806885f) * _571) + -4.139374868827872e-05f) / ((((((((_566 * 1390.7225341796875f) + 4132.06640625f) * _571) + 2881.652099609375f) * _571) + 128.35911560058594f) * _571) + 1.0f)), 0.0f);
  _626 = max((((((((((_567 * 3830.7001953125f) + 6801.15234375f) * _572) + 1079.54736328125f) * _572) + 1.1614649295806885f) * _572) + -4.139374868827872e-05f) / ((((((((_567 * 1390.7225341796875f) + 4132.06640625f) * _572) + 2881.652099609375f) * _572) + 128.35911560058594f) * _572) + 1.0f)), 0.0f);
  _627 = max((((((((((_568 * 3830.7001953125f) + 6801.15234375f) * _573) + 1079.54736328125f) * _573) + 1.1614649295806885f) * _573) + -4.139374868827872e-05f) / ((((((((_568 * 1390.7225341796875f) + 4132.06640625f) * _573) + 2881.652099609375f) * _573) + 128.35911560058594f) * _573) + 1.0f)), 0.0f);
  _630 = max(max(max(_625, _626), _627), 9.999999974752427e-07f);
  _641 = select((abs(1.0f - _630) < 0.5249999761581421f), ((((5.809524059295654f - (_630 * 1.9047620296478271f)) * _630) + -0.42976200580596924f) * 0.25f), saturate(_630)) / _630;
  _642 = _641 * _625;
  _643 = _641 * _626;
  _644 = _641 * _627;
  min16float4 _645 = t3.Sample(s6, float3(_644, _643, _642));
  _664 = saturate((_642 + -1.0f) + (float(_645.z) * 2.0f)) / _641;
  _665 = saturate((_643 + -1.0f) + (float(_645.y) * 2.0f)) / _641;
  _666 = saturate((_644 + -1.0f) + (float(_645.x) * 2.0f)) / _641;
  // UI blend
  _700 = (((((((_556 * 2.0f) + _455) * 0.5f) + 0.5f) + cb_misc_704.x) * 0.008331298828125f) + 0.008331298828125f) * (frac(sin(dot(float2((cb_misc_576.w + _17), (cb_misc_576.w + _18)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.546875f) + -0.5f);
  _701 = _700 + sqrt(max(0.0f, ((cb_misc_272.w * (2.700000047683716f - _664)) + _664)));
  _702 = sqrt(max(0.0f, ((cb_misc_272.w * (2.700000047683716f - _665)) + _665))) + _700;
  _703 = sqrt(max(0.0f, ((cb_misc_272.w * (2.700000047683716f - _666)) + _666))) + _700;
  min16float4 _707 = t1.SampleLevel(s6, float2(_17, _18), 0.0f);
  _715 = float(_707.w);
  _728 = exp2(log2(((_701 * _701) * _715) + float(_707.x)) * 2.200000047683716f);
  _729 = exp2(log2(((_702 * _702) * _715) + float(_707.y)) * 2.200000047683716f);
  _730 = exp2(log2(((_703 * _703) * _715) + float(_707.z)) * 2.200000047683716f);
  _741 = cb_misc_704.y * 9.999999747378752e-05f;
  _754 = exp2(log2(abs(_741 * mad(0.04331360012292862f, _730, mad(0.3292819857597351f, _729, (_728 * 0.627403974533081f))))) * 0.1593017578125f);
  _755 = exp2(log2(abs(_741 * mad(0.011361200362443924f, _730, mad(0.9195399880409241f, _729, (_728 * 0.06909699738025665f))))) * 0.1593017578125f);
  _756 = exp2(log2(abs(_741 * mad(0.8955950140953064f, _730, mad(0.08801320195198059f, _729, (_728 * 0.01639159955084324f))))) * 0.1593017578125f);
  SV_Target.x = exp2(log2(((_754 * 18.8515625f) + 0.8359375f) / ((_754 * 18.6875f) + 1.0f)) * 78.84375f);
  SV_Target.y = exp2(log2(((_755 * 18.8515625f) + 0.8359375f) / ((_755 * 18.6875f) + 1.0f)) * 78.84375f);
  SV_Target.z = exp2(log2(((_756 * 18.8515625f) + 0.8359375f) / ((_756 * 18.6875f) + 1.0f)) * 78.84375f);
  SV_Target.w = 1.0f;
  return SV_Target;
}