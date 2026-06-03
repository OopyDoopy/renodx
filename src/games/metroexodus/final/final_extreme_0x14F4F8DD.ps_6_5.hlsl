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
  float4x4 cb_misc_096 : packoffset(c006.x);
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
  float4x4 cb_misc_448 : packoffset(c028.x);
  int4 cb_misc_512 : packoffset(c032.x);
  float4 cb_misc_528 : packoffset(c033.x);
  float4 cb_misc_544 : packoffset(c034.x);
  float4 cb_misc_560 : packoffset(c035.x);
  float4 cb_misc_576 : packoffset(c036.x);
  float4 cb_misc_592 : packoffset(c037.x);
  float3x4 cb_misc_608 : packoffset(c038.x);
  float3x4 cb_misc_656 : packoffset(c041.x);
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

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float3 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _17 = cb_misc_048.x * SV_Position.x;
  float _18 = cb_misc_048.y * SV_Position.y;
  float _22 = _17 * cb_misc_032.x;
  float _23 = _18 * cb_misc_032.y;
  float _24 = t5.SampleLevel(s6, float2(_22, _23), 0.0f);
  min16float4 _26 = t2.SampleLevel(s6, float2(_17, _18), 0.0f);

  float3 test = _26.xyz;

  float2 _30 = t0.Sample(s6, float2(_22, _23));
  float _33 = dot(float2(_30.x, _30.y), float2(_30.x, _30.y));
  float _692;
  half _693;
  half _694;
  half _695;
  [branch]
  if (_33 > 0.0002500000118743628f) {
    float _41 = SV_Position.y * 0.00023148147738538682f;
    float _42 = (SV_Position.x * 0.00023148147738538682f) + 0.25f;
    float _46 = frac(dot(float2((_42 * _42), (_41 * _41)), float2(3571.0f, 3571.0f)));
    float _47 = _46 * _46;
    float _52 = cb_instance_016.w * (1.0f / ((sqrt(_33) * 4.0f) + 1.0f));
    float _53 = frac(dot(float2(_47, _47), float2(3571.0f, 3571.0f))) * 0.2857142984867096f;
    float _55 = _52 * (_53 + -1.1428571939468384f);
    float _60 = saturate((_55 * _30.x) + _17);
    float _61 = saturate((_55 * _30.y) + _18);
    float _64 = t5.SampleLevel(s6, float2((cb_misc_032.x * _60), (cb_misc_032.y * _61)), 0.0f);
    min16float4 _66 = t2.SampleLevel(s6, float2(_60, _61), 0.0f);
    float _74 = 1.0f / ((max((_24.x - _64.x), 0.0f) * 3.0f) + 1.0f);
    float _81 = float(_26.x);
    float _82 = float(_26.y);
    float _83 = float(_26.z);
    float _93 = _52 * (_53 + -1.0f);
    float _98 = saturate((_93 * _30.x) + _17);
    float _99 = saturate((_93 * _30.y) + _18);
    float _102 = t5.SampleLevel(s6, float2((cb_misc_032.x * _98), (cb_misc_032.y * _99)), 0.0f);
    min16float4 _104 = t2.SampleLevel(s6, float2(_98, _99), 0.0f);
    float _112 = 1.0f / ((max((_24.x - _102.x), 0.0f) * 3.0f) + 1.0f);
    float _132 = _52 * (_53 + -0.8571429252624512f);
    float _137 = saturate((_132 * _30.x) + _17);
    float _138 = saturate((_132 * _30.y) + _18);
    float _141 = t5.SampleLevel(s6, float2((cb_misc_032.x * _137), (cb_misc_032.y * _138)), 0.0f);
    min16float4 _143 = t2.SampleLevel(s6, float2(_137, _138), 0.0f);
    float _151 = 1.0f / ((max((_24.x - _141.x), 0.0f) * 3.0f) + 1.0f);
    float _171 = _52 * (_53 + -0.7142857313156128f);
    float _176 = saturate((_171 * _30.x) + _17);
    float _177 = saturate((_171 * _30.y) + _18);
    float _180 = t5.SampleLevel(s6, float2((cb_misc_032.x * _176), (cb_misc_032.y * _177)), 0.0f);
    min16float4 _182 = t2.SampleLevel(s6, float2(_176, _177), 0.0f);
    float _190 = 1.0f / ((max((_24.x - _180.x), 0.0f) * 3.0f) + 1.0f);
    float _210 = _52 * (_53 + -0.5714285969734192f);
    float _215 = saturate((_210 * _30.x) + _17);
    float _216 = saturate((_210 * _30.y) + _18);
    float _219 = t5.SampleLevel(s6, float2((cb_misc_032.x * _215), (cb_misc_032.y * _216)), 0.0f);
    min16float4 _221 = t2.SampleLevel(s6, float2(_215, _216), 0.0f);
    float _229 = 1.0f / ((max((_24.x - _219.x), 0.0f) * 3.0f) + 1.0f);
    float _249 = _52 * (_53 + -0.4285714626312256f);
    float _254 = saturate((_249 * _30.x) + _17);
    float _255 = saturate((_249 * _30.y) + _18);
    float _258 = t5.SampleLevel(s6, float2((cb_misc_032.x * _254), (cb_misc_032.y * _255)), 0.0f);
    min16float4 _260 = t2.SampleLevel(s6, float2(_254, _255), 0.0f);
    float _268 = 1.0f / ((max((_24.x - _258.x), 0.0f) * 3.0f) + 1.0f);
    float _288 = _52 * (_53 + -0.2857142984867096f);
    float _293 = saturate((_288 * _30.x) + _17);
    float _294 = saturate((_288 * _30.y) + _18);
    float _297 = t5.SampleLevel(s6, float2((cb_misc_032.x * _293), (cb_misc_032.y * _294)), 0.0f);
    min16float4 _299 = t2.SampleLevel(s6, float2(_293, _294), 0.0f);
    float _307 = 1.0f / ((max((_24.x - _297.x), 0.0f) * 3.0f) + 1.0f);
    float _326 = _53 * _52;
    float _331 = saturate((_326 * _30.x) + _17);
    float _332 = saturate((_326 * _30.y) + _18);
    float _335 = t5.SampleLevel(s6, float2((cb_misc_032.x * _331), (cb_misc_032.y * _332)), 0.0f);
    min16float4 _337 = t2.SampleLevel(s6, float2(_331, _332), 0.0f);
    float _345 = 1.0f / ((max((_24.x - _335.x), 0.0f) * 3.0f) + 1.0f);
    float _365 = _52 * (_53 + 0.1428571492433548f);
    float _370 = saturate((_365 * _30.x) + _17);
    float _371 = saturate((_365 * _30.y) + _18);
    float _374 = t5.SampleLevel(s6, float2((cb_misc_032.x * _370), (cb_misc_032.y * _371)), 0.0f);
    min16float4 _376 = t2.SampleLevel(s6, float2(_370, _371), 0.0f);
    float _384 = 1.0f / ((max((_24.x - _374.x), 0.0f) * 3.0f) + 1.0f);
    float _404 = _52 * (_53 + 0.2857142984867096f);
    float _409 = saturate((_404 * _30.x) + _17);
    float _410 = saturate((_404 * _30.y) + _18);
    float _413 = t5.SampleLevel(s6, float2((cb_misc_032.x * _409), (cb_misc_032.y * _410)), 0.0f);
    min16float4 _415 = t2.SampleLevel(s6, float2(_409, _410), 0.0f);
    float _423 = 1.0f / ((max((_24.x - _413.x), 0.0f) * 3.0f) + 1.0f);
    float _443 = _52 * (_53 + 0.4285714626312256f);
    float _448 = saturate((_443 * _30.x) + _17);
    float _449 = saturate((_443 * _30.y) + _18);
    float _452 = t5.SampleLevel(s6, float2((cb_misc_032.x * _448), (cb_misc_032.y * _449)), 0.0f);
    min16float4 _454 = t2.SampleLevel(s6, float2(_448, _449), 0.0f);
    float _462 = 1.0f / ((max((_24.x - _452.x), 0.0f) * 3.0f) + 1.0f);
    float _482 = _52 * (_53 + 0.5714285969734192f);
    float _487 = saturate((_482 * _30.x) + _17);
    float _488 = saturate((_482 * _30.y) + _18);
    float _491 = t5.SampleLevel(s6, float2((cb_misc_032.x * _487), (cb_misc_032.y * _488)), 0.0f);
    min16float4 _493 = t2.SampleLevel(s6, float2(_487, _488), 0.0f);
    float _501 = 1.0f / ((max((_24.x - _491.x), 0.0f) * 3.0f) + 1.0f);
    float _521 = _52 * (_53 + 0.7142857313156128f);
    float _526 = saturate((_521 * _30.x) + _17);
    float _527 = saturate((_521 * _30.y) + _18);
    float _530 = t5.SampleLevel(s6, float2((cb_misc_032.x * _526), (cb_misc_032.y * _527)), 0.0f);
    min16float4 _532 = t2.SampleLevel(s6, float2(_526, _527), 0.0f);
    float _540 = 1.0f / ((max((_24.x - _530.x), 0.0f) * 3.0f) + 1.0f);
    float _560 = _52 * (_53 + 0.8571429252624512f);
    float _565 = saturate((_560 * _30.x) + _17);
    float _566 = saturate((_560 * _30.y) + _18);
    float _572 = t5.SampleLevel(s6, float2((cb_misc_032.x * _565), (cb_misc_032.y * _566)), 0.0f);
    min16float4 _574 = t2.SampleLevel(s6, float2(_565, _566), 0.0f);
    float _582 = 1.0f / ((max((_24.x - _572.x), 0.0f) * 3.0f) + 1.0f);
    float _600 = _582 + _540 + _501 + _462 + _423 + _384 + _345 + _307 + _268 + _229 + _190 + _151 + _112 + _74 + 1.0f;
    float _606 = saturate((_33 + -0.0002500000118743628f) * 3999.999755859375f);
    _692 = 0.0f;
    _693 = half(_81 + _606 * (((float(_574.x) * _582) + (float(_532.x) * _540) + (float(_493.x) * _501) + (float(_454.x) * _462) + (float(_415.x) * _423) + (float(_376.x) * _384) + (float(_337.x) * _345) + (float(_299.x) * _307) + (float(_260.x) * _268) + (float(_221.x) * _229) + (float(_182.x) * _190) + (float(_143.x) * _151) + (float(_104.x) * _112) + (float(_66.x) * _74) + _81) / _600 - _81));
    _694 = half(_82 + _606 * (((float(_574.y) * _582) + (float(_532.y) * _540) + (float(_493.y) * _501) + (float(_454.y) * _462) + (float(_415.y) * _423) + (float(_376.y) * _384) + (float(_337.y) * _345) + (float(_299.y) * _307) + (float(_260.y) * _268) + (float(_221.y) * _229) + (float(_182.y) * _190) + (float(_143.y) * _151) + (float(_104.y) * _112) + (float(_66.y) * _74) + _82) / _600 - _82));
    _695 = half(_83 + _606 * (((float(_574.z) * _582) + (float(_532.z) * _540) + (float(_493.z) * _501) + (float(_454.z) * _462) + (float(_415.z) * _423) + (float(_376.z) * _384) + (float(_337.z) * _345) + (float(_299.z) * _307) + (float(_260.z) * _268) + (float(_221.z) * _229) + (float(_182.z) * _190) + (float(_143.z) * _151) + (float(_104.z) * _112) + (float(_66.z) * _74) + _83) / _600 - _83));
  } else {
    float _636 = abs((1.0f - saturate((cb_misc_256.z * _24.x) - cb_misc_256.y)) - saturate((cb_misc_256.w * _24.x) - cb_misc_256.x));
    float _640 = 0.5f - (saturate(_33 * 3999.999755859375f) * 0.5f);
    half _642 = half(_636 + -0.5f);
    float _646 = _640 * cb_misc_000.x;
    float _647 = _640 * cb_misc_000.y;
    float _648 = _17 - _646;
    float _649 = _18 - _647;
    min16float4 _650 = t2.SampleLevel(s6, float2(_648, _649), 0.0f);
    float _654 = _646 + _17;
    min16float4 _655 = t2.SampleLevel(s6, float2(_654, _649), 0.0f);
    float _659 = _647 + _18;
    min16float4 _660 = t2.SampleLevel(s6, float2(_648, _659), 0.0f);
    min16float4 _664 = t2.SampleLevel(s6, float2(_654, _659), 0.0f);
    half _668 = 1.0h - _642;
    half _681 = _642 * 0.25h;
    _692 = _636;
    _693 = max((((((_655.x + _650.x) + _660.x) + _664.x) * _681) + (_668 * _26.x)), 0.0h);
    _694 = max((((((_655.y + _650.y) + _660.y) + _664.y) * _681) + (_668 * _26.y)), 0.0h);
    _695 = max((((((_655.z + _650.z) + _660.z) + _664.z) * _681) + (_668 * _26.z)), 0.0h);
  }

  if (RENODX_TONE_MAP_TYPE != 0) {
    float3 input_color = float3(_693, _694, _695);
    SV_Target = RenoDX(input_color, float2(_17, _18), _692);
    return SV_Target;
  }

  float _698 = 1.0h / ((half)(1.0h - (half)(dot(half3(_693, _694, _695), half3(0.29907227h, 0.58691406h, 0.11401367h)))));
  float _720 = _17 - cb_misc_000.x;
  float _721 = _18 - cb_misc_000.y;
  min16float4 _722 = t6.Sample(s6, float2(_720, _721));
  float _726 = cb_misc_000.y + _18;
  min16float4 _727 = t6.Sample(s6, float2(_720, _726));
  float _734 = cb_misc_000.x + _17;
  min16float4 _735 = t6.Sample(s6, float2(_734, _726));
  min16float4 _742 = t6.Sample(s6, float2(_734, _721));
  float _756 = exp2(cb_misc_336.y);
  float _759 = half((_756 * 0.0416666679084301f) * ((((((float4)(t4.Sample(s5, float2(_17, (((cb_misc_016.x / cb_misc_016.y) * (_18 + -0.5f)) + 0.5f))))).w) * 20.0f) * cb_instance_016.x) + 1.0f));
  float _763 = float(_759 * ((half)(((half)(((half)((half)(_727.x) + (half)(_722.x))) + (half)(_735.x))) + (half)(_742.x))));
  float _764 = float(_759 * ((half)(((half)(((half)((half)(_727.y) + (half)(_722.y))) + (half)(_735.y))) + (half)(_742.y))));
  float _765 = float(_759 * ((half)(((half)(((half)((half)(_727.z) + (half)(_722.z))) + (half)(_735.z))) + (half)(_742.z))));
  float _766 = _763 + float(min(((half)(_698 * _693)), 16384.0h));
  float _767 = _764 + float(min(((half)(_698 * _694)), 16384.0h));
  float _768 = _765 + float(min(((half)(_698 * _695)), 16384.0h));
  float _775 = cb_misc_320.x - _17;
  float _777 = (cb_misc_000.w / cb_misc_000.z) * (cb_misc_320.y - _18);
  float _787 = saturate((sqrt((_777 * _777) + (_775 * _775)) - (cb_misc_320.z * 0.949999988079071f)) / (cb_misc_320.z * 0.09999996423721313f));
  float _793 = ((_787 * _787) * (3.0f - (_787 * 2.0f))) * cb_misc_320.w;
  float _803 = (((_763 / _756) - _766) * _793) + _766;
  float _804 = (((_764 / _756) - _767) * _793) + _767;
  float _805 = (((_765 / _756) - _768) * _793) + _768;

  // tone mapping
  float _808 = _803 * 1.4142135381698608f;
  float _809 = _804 * 1.4142135381698608f;
  float _810 = _805 * 1.4142135381698608f;
  float _862 = max((((((((((_803 * 3830.7001953125f) + 6801.15234375f) * _808) + 1079.54736328125f) * _808) + 1.1614649295806885f) * _808) + -4.139374868827872e-05f) / ((((((((_803 * 1390.7225341796875f) + 4132.06640625f) * _808) + 2881.652099609375f) * _808) + 128.35911560058594f) * _808) + 1.0f)), 0.0f);
  float _863 = max((((((((((_804 * 3830.7001953125f) + 6801.15234375f) * _809) + 1079.54736328125f) * _809) + 1.1614649295806885f) * _809) + -4.139374868827872e-05f) / ((((((((_804 * 1390.7225341796875f) + 4132.06640625f) * _809) + 2881.652099609375f) * _809) + 128.35911560058594f) * _809) + 1.0f)), 0.0f);
  float _864 = max((((((((((_805 * 3830.7001953125f) + 6801.15234375f) * _810) + 1079.54736328125f) * _810) + 1.1614649295806885f) * _810) + -4.139374868827872e-05f) / ((((((((_805 * 1390.7225341796875f) + 4132.06640625f) * _810) + 2881.652099609375f) * _810) + 128.35911560058594f) * _810) + 1.0f)), 0.0f);
  
  // SuckerPunch max channel tone map and inversion for lut sampling
  float _867 = max(max(max(_862, _863), _864), 9.999999974752427e-07f);
  float _878 = select((abs(1.0f - _867) < 0.5249999761581421f), ((((5.809524059295654f - (_867 * 1.9047620296478271f)) * _867) + -0.42976200580596924f) * 0.25f), saturate(_867)) / _867;
  float _879 = _878 * _862;
  float _880 = _878 * _863;
  float _881 = _878 * _864;
  min16float4 _882 = t3.Sample(s6, float3(_881, _880, _879));
  float _901 = saturate((_879 + -1.0f) + (float(_882.z) * 2.0f)) / _878;
  float _902 = saturate((_880 + -1.0f) + (float(_882.y) * 2.0f)) / _878;
  float _903 = saturate((_881 + -1.0f) + (float(_882.x) * 2.0f)) / _878;

  // UI sampling and blending
  float _937 = (((((((_793 * 2.0f) + _692) * 0.5f) + 0.5f) + cb_misc_704.x) * 0.008331298828125f) + 0.008331298828125f) * (frac(sin(dot(float2((cb_misc_576.w + _17), (cb_misc_576.w + _18)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.546875f) + -0.5f);
  float _938 = _937 + sqrt(max(0.0f, ((cb_misc_272.w * (2.700000047683716f - _901)) + _901)));
  float _939 = sqrt(max(0.0f, ((cb_misc_272.w * (2.700000047683716f - _902)) + _902))) + _937;
  float _940 = sqrt(max(0.0f, ((cb_misc_272.w * (2.700000047683716f - _903)) + _903))) + _937;
  min16float4 _944 = t1.SampleLevel(s6, float2(_17, _18), 0.0f);
  float _952 = float(_944.w);
  float _959 = max(6.103519990574569e-05f, (((_938 * _938) * _952) + float(_944.x)));
  float _960 = max(6.103519990574569e-05f, (((_939 * _939) * _952) + float(_944.y)));
  float _961 = max(6.103519990574569e-05f, (((_940 * _940) * _952) + float(_944.z)));

  // sRGB Decode
  float _983 = select((_959 > 0.040449999272823334f), exp2(log2((_959 * 0.9478672742843628f) + 0.05213269963860512f) * 2.4000000953674316f), (_959 * 0.07739938050508499f));
  float _984 = select((_960 > 0.040449999272823334f), exp2(log2((_960 * 0.9478672742843628f) + 0.05213269963860512f) * 2.4000000953674316f), (_960 * 0.07739938050508499f));
  float _985 = select((_961 > 0.040449999272823334f), exp2(log2((_961 * 0.9478672742843628f) + 0.05213269963860512f) * 2.4000000953674316f), (_961 * 0.07739938050508499f));
  
  // Paper white, BT.709 -> BT.2020, PQ Encode
  float _996 = cb_misc_704.y * 9.999999747378752e-05f;
  float _1009 = exp2(log2(abs(_996 * mad(0.04331360012292862f, _985, mad(0.3292819857597351f, _984, (_983 * 0.627403974533081f))))) * 0.1593017578125f);
  float _1010 = exp2(log2(abs(_996 * mad(0.011361200362443924f, _985, mad(0.9195399880409241f, _984, (_983 * 0.06909699738025665f))))) * 0.1593017578125f);
  float _1011 = exp2(log2(abs(_996 * mad(0.8955950140953064f, _985, mad(0.08801320195198059f, _984, (_983 * 0.01639159955084324f))))) * 0.1593017578125f);
  SV_Target.x = exp2(log2(((_1009 * 18.8515625f) + 0.8359375f) / ((_1009 * 18.6875f) + 1.0f)) * 78.84375f);
  SV_Target.y = exp2(log2(((_1010 * 18.8515625f) + 0.8359375f) / ((_1010 * 18.6875f) + 1.0f)) * 78.84375f);
  SV_Target.z = exp2(log2(((_1011 * 18.8515625f) + 0.8359375f) / ((_1011 * 18.6875f) + 1.0f)) * 78.84375f);
  SV_Target.w = 1.0f;
  return SV_Target;
}

