#include "../shared.h"

Texture2D<float4> t0 : register(t0);

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

SamplerState s0 : register(s0);

float4 main(
    noperspective float4 SV_Position : SV_Position) : SV_Target {
  float4 SV_Target = 0.f;
  float _22 = float((int)(int(CustomPixelConsts_048.x)));
  float _23 = float((int)(int(CustomPixelConsts_048.y)));
  float _24 = _22 + 0.5f;
  float _25 = _23 + 0.5f;
  float _35 = (_22 - 0.5f) + CustomPixelConsts_032.x;
  float _37 = (_23 - 0.5f) + CustomPixelConsts_032.y;
  float _38 = float((int)(int(SV_Position.x - float((int)(int(CustomPixelConsts_048.z))))));
  float _39 = float((int)(int(SV_Position.y - float((int)(int(CustomPixelConsts_048.w))))));
  float _40 = _24 + _38;
  float _41 = _25 + _39;
  float _42 = _40 / CustomPixelConsts_000.x;
  float _43 = _41 / CustomPixelConsts_000.y;
  float _50 = (_37 - _25) / CustomPixelConsts_000.y;
  float _53 = (CustomPixelConsts_064.x * ((_35 - _24) / CustomPixelConsts_000.x)) + (_24 / CustomPixelConsts_000.x);
  float _54 = (CustomPixelConsts_064.y * _50) + (_25 / CustomPixelConsts_000.y);
  float _55 = _53 - _42;
  float _56 = _54 - _43;
  float _64 = rsqrt(dot(float2(_55, _56), float2(_55, _56)));
  float shaft_radius = CustomPixelConsts_080.x * _50;
  float _66 = shaft_radius * _64;
  float _70 = _64 * _56;
  float _71 = CustomPixelConsts_000.x / CustomPixelConsts_000.y;
  float _72 = (_64 * _55) * _71;
  float _76 = sqrt((_72 * _72) + (_70 * _70));
  float _77 = (_66 * _55) / _76;
  float _78 = (_66 * _56) / _76;
  float _79 = _77 * 0.05f;
  float _80 = _78 * 0.05f;
  bool _87 = int(CustomPixelConsts_064.z) == 0;
  float _96;
  float _97;
  float _98;
  float _834;
  float _835;
  float _836;
  float _888;
  float _893;
  float _894;
  float _895;
  if (!_87) {
    float _89 = _77 * 0.0025f;
    float _90 = _78 * 0.0025f;
    _96 = _89;
    _97 = _90;
    _98 = sqrt((_90 * _90) + (_89 * _89));
  } else {
    _96 = _79;
    _97 = _80;
    _98 = sqrt((_80 * _80) + (_79 * _79));
  }
  int _119 = min(
      min(
          int((sqrt((_55 * _55) + (_56 * _56)) / _98) + 1.f),
          int((select(_96 > 0.f, _35 - _40, _38)
                   / (CustomPixelConsts_000.x * abs(_96)))
              + 1.f)),
      int((select(_97 > 0.f, _37 - _41, _39)
               / (CustomPixelConsts_000.y * abs(_97)))
          + 1.f));
  float _121 = _43 - _54;
  float _122 = _71 * (_42 - _53);
  float _128 = saturate(sqrt((_122 * _122) + (_121 * _121)) / shaft_radius);

  [branch]
  if (_128 < 1.f) {
    float _132 = _119 > 0 ? 1.f : 0.f;
    float _136 = _119 > 1 ? 1.f : 0.f;
    float _137 = _96 + _42;
    float _138 = _97 + _43;
    float _140 = _119 > 2 ? 1.f : 0.f;
    float _143 = (_96 * 2.f) + _42;
    float _144 = (_97 * 2.f) + _43;
    float _146 = _119 > 3 ? 1.f : 0.f;
    float _149 = (_96 * 3.f) + _42;
    float _150 = (_97 * 3.f) + _43;
    float _152 = _119 > 4 ? 1.f : 0.f;
    float _155 = (_96 * 4.f) + _42;
    float _156 = (_97 * 4.f) + _43;
    float _158 = _119 > 5 ? 1.f : 0.f;
    float _161 = (_96 * 5.f) + _42;
    float _162 = (_97 * 5.f) + _43;
    float _164 = _119 > 6 ? 1.f : 0.f;
    float _167 = (_96 * 6.f) + _42;
    float _168 = (_97 * 6.f) + _43;
    float _170 = _119 > 7 ? 1.f : 0.f;
    float _173 = (_96 * 7.f) + _42;
    float _174 = (_97 * 7.f) + _43;
    float _176 = _119 > 8 ? 1.f : 0.f;
    float _179 = (_96 * 8.f) + _42;
    float _180 = (_97 * 8.f) + _43;
    float _182 = _119 > 9 ? 1.f : 0.f;
    float _185 = (_96 * 9.f) + _42;
    float _186 = (_97 * 9.f) + _43;
    float _188 = _119 > 10 ? 1.f : 0.f;
    float _191 = (_96 * 10.f) + _42;
    float _192 = (_97 * 10.f) + _43;
    float _194 = _119 > 11 ? 1.f : 0.f;
    float _197 = (_96 * 11.f) + _42;
    float _198 = (_97 * 11.f) + _43;
    float _200 = _119 > 12 ? 1.f : 0.f;
    float _203 = (_96 * 12.f) + _42;
    float _204 = (_97 * 12.f) + _43;
    float _206 = _119 > 13 ? 1.f : 0.f;
    float _209 = (_96 * 13.f) + _42;
    float _210 = (_97 * 13.f) + _43;
    float _212 = _119 > 14 ? 1.f : 0.f;
    float _215 = (_96 * 14.f) + _42;
    float _216 = (_97 * 14.f) + _43;
    float _218 = _119 > 15 ? 1.f : 0.f;
    float _221 = (_96 * 15.f) + _42;
    float _222 = (_97 * 15.f) + _43;
    float _224 = _119 > 16 ? 1.f : 0.f;
    float _227 = (_96 * 16.f) + _42;
    float _228 = (_97 * 16.f) + _43;
    float _230 = _119 > 17 ? 1.f : 0.f;
    float _233 = (_96 * 17.f) + _42;
    float _234 = (_97 * 17.f) + _43;
    float _236 = _119 > 18 ? 1.f : 0.f;
    float _239 = (_96 * 18.f) + _42;
    float _240 = (_97 * 18.f) + _43;
    float _242 = _119 > 19 ? 1.f : 0.f;
    float _245 = (_96 * 19.f) + _42;
    float _246 = (_97 * 19.f) + _43;

    [branch]
    if (!_87) {
      float4 _248 = t0.SampleLevel(s0, float2(_42, _43), 0.f);
      float4 _255 = t0.SampleLevel(s0, float2(_137, _138), 0.f);
      float4 _265 = t0.SampleLevel(s0, float2(_143, _144), 0.f);
      float4 _275 = t0.SampleLevel(s0, float2(_149, _150), 0.f);
      float4 _285 = t0.SampleLevel(s0, float2(_155, _156), 0.f);
      float4 _295 = t0.SampleLevel(s0, float2(_161, _162), 0.f);
      float4 _305 = t0.SampleLevel(s0, float2(_167, _168), 0.f);
      float4 _315 = t0.SampleLevel(s0, float2(_173, _174), 0.f);
      float4 _325 = t0.SampleLevel(s0, float2(_179, _180), 0.f);
      float4 _335 = t0.SampleLevel(s0, float2(_185, _186), 0.f);
      float4 _345 = t0.SampleLevel(s0, float2(_191, _192), 0.f);
      float4 _355 = t0.SampleLevel(s0, float2(_197, _198), 0.f);
      float4 _365 = t0.SampleLevel(s0, float2(_203, _204), 0.f);
      float4 _375 = t0.SampleLevel(s0, float2(_209, _210), 0.f);
      float4 _385 = t0.SampleLevel(s0, float2(_215, _216), 0.f);
      float4 _395 = t0.SampleLevel(s0, float2(_221, _222), 0.f);
      float4 _405 = t0.SampleLevel(s0, float2(_227, _228), 0.f);
      float4 _415 = t0.SampleLevel(s0, float2(_233, _234), 0.f);
      float4 _425 = t0.SampleLevel(s0, float2(_239, _240), 0.f);
      float4 _435 = t0.SampleLevel(s0, float2(_245, _246), 0.f);
        float3 raw_sunshafts =
          float3(_248.x, _248.y, _248.z) * _132
          + float3(_255.x, _255.y, _255.z) * _136
          + float3(_265.x, _265.y, _265.z) * _140
          + float3(_275.x, _275.y, _275.z) * _146
          + float3(_285.x, _285.y, _285.z) * _152
          + float3(_295.x, _295.y, _295.z) * _158
          + float3(_305.x, _305.y, _305.z) * _164
          + float3(_315.x, _315.y, _315.z) * _170
          + float3(_325.x, _325.y, _325.z) * _176
          + float3(_335.x, _335.y, _335.z) * _182
          + float3(_345.x, _345.y, _345.z) * _188
          + float3(_355.x, _355.y, _355.z) * _194
          + float3(_365.x, _365.y, _365.z) * _200
          + float3(_375.x, _375.y, _375.z) * _206
          + float3(_385.x, _385.y, _385.z) * _212
          + float3(_395.x, _395.y, _395.z) * _218
          + float3(_405.x, _405.y, _405.z) * _224
          + float3(_415.x, _415.y, _415.z) * _230
          + float3(_425.x, _425.y, _425.z) * _236
          + float3(_435.x, _435.y, _435.z) * _242;
        _834 = raw_sunshafts.x * CustomPixelConsts_096.x;
        _835 = raw_sunshafts.y * CustomPixelConsts_096.y;
        _836 = raw_sunshafts.z * CustomPixelConsts_096.z;
    } else {
      float4 _453 = t0.SampleLevel(s0, float2(_42, _43), 0.f);
      float _457 = dot(float3(_453.x, _453.y, _453.z), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
      float _461 = max(0.f, _457 - CustomPixelConsts_112.x);
      float _468 = (saturate(CustomPixelConsts_112.y * _461) * _461) / max(0.0001f, _457) * _132;
      float4 _472 = t0.SampleLevel(s0, float2(_137, _138), 0.f);
      float _476 = dot(float3(_472.x, _472.y, _472.z), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
      float _478 = max(0.f, _476 - CustomPixelConsts_112.x);
      float _484 = (saturate(_478 * CustomPixelConsts_112.y) * _478) / max(0.0001f, _476) * _136;
      float4 _491 = t0.SampleLevel(s0, float2(_143, _144), 0.f);
      float _495 = dot(float3(_491.x, _491.y, _491.z), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
      float _497 = max(0.f, _495 - CustomPixelConsts_112.x);
      float _503 = (saturate(_497 * CustomPixelConsts_112.y) * _497) / max(0.0001f, _495) * _140;
      float4 _510 = t0.SampleLevel(s0, float2(_149, _150), 0.f);
      float _514 = dot(float3(_510.x, _510.y, _510.z), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
      float _516 = max(0.f, _514 - CustomPixelConsts_112.x);
      float _522 = (saturate(_516 * CustomPixelConsts_112.y) * _516) / max(0.0001f, _514) * _146;
      float4 _529 = t0.SampleLevel(s0, float2(_155, _156), 0.f);
      float _533 = dot(float3(_529.x, _529.y, _529.z), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
      float _535 = max(0.f, _533 - CustomPixelConsts_112.x);
      float _541 = (saturate(_535 * CustomPixelConsts_112.y) * _535) / max(0.0001f, _533) * _152;
      float4 _548 = t0.SampleLevel(s0, float2(_161, _162), 0.f);
      float _552 = dot(float3(_548.x, _548.y, _548.z), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
      float _554 = max(0.f, _552 - CustomPixelConsts_112.x);
      float _560 = (saturate(_554 * CustomPixelConsts_112.y) * _554) / max(0.0001f, _552) * _158;
      float4 _567 = t0.SampleLevel(s0, float2(_167, _168), 0.f);
      float _571 = dot(float3(_567.x, _567.y, _567.z), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
      float _573 = max(0.f, _571 - CustomPixelConsts_112.x);
      float _579 = (saturate(_573 * CustomPixelConsts_112.y) * _573) / max(0.0001f, _571) * _164;
      float4 _586 = t0.SampleLevel(s0, float2(_173, _174), 0.f);
      float _590 = dot(float3(_586.x, _586.y, _586.z), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
      float _592 = max(0.f, _590 - CustomPixelConsts_112.x);
      float _598 = (saturate(_592 * CustomPixelConsts_112.y) * _592) / max(0.0001f, _590) * _170;
      float4 _605 = t0.SampleLevel(s0, float2(_179, _180), 0.f);
      float _609 = dot(float3(_605.x, _605.y, _605.z), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
      float _611 = max(0.f, _609 - CustomPixelConsts_112.x);
      float _617 = (saturate(_611 * CustomPixelConsts_112.y) * _611) / max(0.0001f, _609) * _176;
      float4 _624 = t0.SampleLevel(s0, float2(_185, _186), 0.f);
      float _628 = dot(float3(_624.x, _624.y, _624.z), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
      float _630 = max(0.f, _628 - CustomPixelConsts_112.x);
      float _636 = (saturate(_630 * CustomPixelConsts_112.y) * _630) / max(0.0001f, _628) * _182;
      float4 _643 = t0.SampleLevel(s0, float2(_191, _192), 0.f);
      float _647 = dot(float3(_643.x, _643.y, _643.z), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
      float _649 = max(0.f, _647 - CustomPixelConsts_112.x);
      float _655 = (saturate(_649 * CustomPixelConsts_112.y) * _649) / max(0.0001f, _647) * _188;
      float4 _662 = t0.SampleLevel(s0, float2(_197, _198), 0.f);
      float _666 = dot(float3(_662.x, _662.y, _662.z), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
      float _668 = max(0.f, _666 - CustomPixelConsts_112.x);
      float _674 = (saturate(_668 * CustomPixelConsts_112.y) * _668) / max(0.0001f, _666) * _194;
      float4 _681 = t0.SampleLevel(s0, float2(_203, _204), 0.f);
      float _685 = dot(float3(_681.x, _681.y, _681.z), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
      float _687 = max(0.f, _685 - CustomPixelConsts_112.x);
      float _693 = (saturate(_687 * CustomPixelConsts_112.y) * _687) / max(0.0001f, _685) * _200;
      float4 _700 = t0.SampleLevel(s0, float2(_209, _210), 0.f);
      float _704 = dot(float3(_700.x, _700.y, _700.z), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
      float _706 = max(0.f, _704 - CustomPixelConsts_112.x);
      float _712 = (saturate(_706 * CustomPixelConsts_112.y) * _706) / max(0.0001f, _704) * _206;
      float4 _719 = t0.SampleLevel(s0, float2(_215, _216), 0.f);
      float _723 = dot(float3(_719.x, _719.y, _719.z), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
      float _725 = max(0.f, _723 - CustomPixelConsts_112.x);
      float _731 = (saturate(_725 * CustomPixelConsts_112.y) * _725) / max(0.0001f, _723) * _212;
      float4 _738 = t0.SampleLevel(s0, float2(_221, _222), 0.f);
      float _742 = dot(float3(_738.x, _738.y, _738.z), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
      float _744 = max(0.f, _742 - CustomPixelConsts_112.x);
      float _750 = (saturate(_744 * CustomPixelConsts_112.y) * _744) / max(0.0001f, _742) * _218;
      float4 _757 = t0.SampleLevel(s0, float2(_227, _228), 0.f);
      float _761 = dot(float3(_757.x, _757.y, _757.z), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
      float _763 = max(0.f, _761 - CustomPixelConsts_112.x);
      float _769 = (saturate(_763 * CustomPixelConsts_112.y) * _763) / max(0.0001f, _761) * _224;
      float4 _776 = t0.SampleLevel(s0, float2(_233, _234), 0.f);
      float _780 = dot(float3(_776.x, _776.y, _776.z), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
      float _782 = max(0.f, _780 - CustomPixelConsts_112.x);
      float _788 = (saturate(_782 * CustomPixelConsts_112.y) * _782) / max(0.0001f, _780) * _230;
      float4 _795 = t0.SampleLevel(s0, float2(_239, _240), 0.f);
      float _799 = dot(float3(_795.x, _795.y, _795.z), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
      float _801 = max(0.f, _799 - CustomPixelConsts_112.x);
      float _807 = (saturate(_801 * CustomPixelConsts_112.y) * _801) / max(0.0001f, _799) * _236;
      float4 _814 = t0.SampleLevel(s0, float2(_245, _246), 0.f);
      float _818 = dot(float3(_814.x, _814.y, _814.z), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
      float _820 = max(0.f, _818 - CustomPixelConsts_112.x);
      float _826 = (saturate(_820 * CustomPixelConsts_112.y) * _820) / max(0.0001f, _818) * _242;
        float3 weighted_sunshafts =
          float3(_453.x, _453.y, _453.z) * _468
          + float3(_472.x, _472.y, _472.z) * _484
          + float3(_491.x, _491.y, _491.z) * _503
          + float3(_510.x, _510.y, _510.z) * _522
          + float3(_529.x, _529.y, _529.z) * _541
          + float3(_548.x, _548.y, _548.z) * _560
          + float3(_567.x, _567.y, _567.z) * _579
          + float3(_586.x, _586.y, _586.z) * _598
          + float3(_605.x, _605.y, _605.z) * _617
          + float3(_624.x, _624.y, _624.z) * _636
          + float3(_643.x, _643.y, _643.z) * _655
          + float3(_662.x, _662.y, _662.z) * _674
          + float3(_681.x, _681.y, _681.z) * _693
          + float3(_700.x, _700.y, _700.z) * _712
          + float3(_719.x, _719.y, _719.z) * _731
          + float3(_738.x, _738.y, _738.z) * _750
          + float3(_757.x, _757.y, _757.z) * _769
          + float3(_776.x, _776.y, _776.z) * _788
          + float3(_795.x, _795.y, _795.z) * _807
          + float3(_814.x, _814.y, _814.z) * _826;
        _834 = weighted_sunshafts.x * CustomPixelConsts_096.x;
        _835 = weighted_sunshafts.y * CustomPixelConsts_096.y;
        _836 = weighted_sunshafts.z * CustomPixelConsts_096.z;
    }

    float _837 = _834 * 0.05f;
    float _838 = _835 * 0.05f;
    float _839 = _836 * 0.05f;
    if (!_87) {
      if (CustomPixelConsts_128.x > 0.f) {
        float _854 = max(0.01f, CustomPixelConsts_128.y) * -1.4426950216293335f;
        float _855 = exp2(_854);
        _888 = ((exp2(exp2(log2(max(saturate(_128), 1.0e-6f)) * max(0.01f, CustomPixelConsts_128.z)) * _854) - _855) / (1.f - _855));
      } else {
        float _868 = saturate((_128 - CustomPixelConsts_016.z) / max(0.0001f, 1.f - CustomPixelConsts_016.z));
        float _876 = ((((_868 * _868) * (3.f - (_868 * 2.f))) - _868) * CustomPixelConsts_016.w) + _868;
        _888 = (exp2(log2(1.f - _876) * CustomPixelConsts_080.y) / (((_876 * _876) * CustomPixelConsts_080.z) + 1.f));
      }
      _893 = _888 * _837;
      _894 = _888 * _838;
      _895 = _888 * _839;
    } else {
      _893 = _837;
      _894 = _838;
      _895 = _839;
    }
  } else {
    _893 = 0.f;
    _894 = 0.f;
    _895 = 0.f;
  }
  SV_Target.x = _893;
  SV_Target.y = _894;
  SV_Target.z = _895;
  SV_Target.w = 1.f;
  SV_Target.rgb *= CUSTOM_SUNSHAFTS_STRENGTH;
  return SV_Target;
}
