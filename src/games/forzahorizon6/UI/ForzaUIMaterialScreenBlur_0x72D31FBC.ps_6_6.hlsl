#include "UI.hlsli"

Texture2D<float4> t0 : register(t0);

cbuffer cb0 : register(b0) {
  float cb0_000x : packoffset(c000.x);
  float cb0_000y : packoffset(c000.y);
  float cb0_000z : packoffset(c000.z);
  float cb0_000w : packoffset(c000.w);
  float cb0_001x : packoffset(c001.x);
  float cb0_001y : packoffset(c001.y);
  float cb0_001z : packoffset(c001.z);
  float cb0_001w : packoffset(c001.w);
  float cb0_003x : packoffset(c003.x);
  float cb0_003y : packoffset(c003.y);
  float cb0_003z : packoffset(c003.z);
  float cb0_003w : packoffset(c003.w);
};

SamplerState s0 : register(s0);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) {
  return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value));
}
uint firstbithigh_msb(uint value) {
  return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value));
}

float4 main(
    precise noperspective float4 SV_Position: SV_Position,
    linear float3 TEXCOORD_1: TEXCOORD1,
    linear float4 TEXCOORD_2: TEXCOORD2)
    : SV_Target {
  float4 SV_Target;
  float4 _12;
  float _21;
  float _22;
  float _23;
  float _29;
  float _30;
  float _31;
  float _32;
  float _33;
  float _34;
  float _35;
  float _36;
  float _37;
  float _38;
  float _44;
  float _45;
  float _46;
  float _47;
  float _48;
  float _49;
  float _50;
  float _51;
  float _52;
  float _53;
  float _54;
  bool _57;
  float _140;
  float _141;
  float _142;
  float _60;
  float _61;
  float _62;
  float _63;
  float _64;
  float _65;
  float _66;
  float _67;
  float _68;
  float _69;
  float _70;
  float _71;
  float _74;
  float _75;
  float _76;
  float _77;
  float _78;
  float _79;
  float _80;
  float _81;
  float _82;
  float _83;
  float _84;
  float _85;
  float _86;
  float _87;
  float _88;
  float _89;
  float _90;
  float _91;
  float _92;
  float _93;
  float _94;
  float _95;
  float _96;
  float _97;
  float _98;
  float _99;
  float _100;
  float _101;
  float _102;
  float _103;
  float _104;
  float _105;
  float _106;
  float _107;
  float _108;
  float _109;
  float _110;
  float _111;
  float _112;
  float _113;
  float _114;
  float _115;
  float _116;
  float _117;
  float _118;
  float _119;
  float _120;
  float _121;
  float _122;
  float _123;
  float _124;
  float _125;
  float _126;
  float _127;
  float _130;
  float _131;
  float _132;
  float _133;
  float _134;
  float _135;
  float _136;
  float _137;
  float _138;
  float _143;
  float _144;
  float _145;
  _12 = t0.Sample(s0, float2(TEXCOORD_2.z, TEXCOORD_2.w));
  _21 = cb0_001x * _12.x;
  _22 = cb0_001y * _12.y;
  _23 = cb0_001z * _12.z;
  _29 = cb0_000x - _21;
  _30 = cb0_000y - _22;
  _31 = cb0_000z - _23;
  _32 = _29 * cb0_000w;
  _33 = _30 * cb0_000w;
  _34 = _31 * cb0_000w;
  _35 = _32 + _21;
  _36 = _33 + _22;
  _37 = _34 + _23;
  _38 = cb0_001w * TEXCOORD_1.z;
  _44 = cb0_003x * _38;
  _45 = _44 * _35;
  _46 = cb0_003y * _38;
  _47 = _46 * _36;
  _48 = cb0_003z * _38;
  _49 = _48 * _37;
  _50 = cb0_003w * _38;
  _51 = _50 + 9.999999747378752e-06f;
  _52 = _45 / _51;
  _53 = _47 / _51;
  _54 = _49 / _51;
#if 1
  SV_Target = GenerateUIOutputColor(_52, _53, _54, _50);
#else
  _57 = (cbUIGlobal_020 != 0.0f);
  [branch]
  if (_57) {
#if 1
    LinearizeUIAndEncodePQ(_52, _53, _54, cbUIGlobal_028, cbUIGlobal_000, _140, _141, _142);
#else
    _60 = abs(_52);
    _61 = abs(_53);
    _62 = abs(_54);
    _63 = log2(_60);
    _64 = log2(_61);
    _65 = log2(_62);
    _66 = _63 * cbUIGlobal_028;
    _67 = _64 * cbUIGlobal_028;
    _68 = _65 * cbUIGlobal_028;
    _69 = exp2(_66);
    _70 = exp2(_67);
    _71 = exp2(_68);
    _74 = cbUIGlobal_000 * _69;
    _75 = cbUIGlobal_000 * _70;
    _76 = cbUIGlobal_000 * _71;
    _77 = _74 * 0.627403974533081f;
    _78 = mad(0.3292819857597351f, _75, _77);
    _79 = mad(0.04331360012292862f, _76, _78);
    _80 = _74 * 0.045745600014925f;
    _81 = mad(0.9417769908905029f, _75, _80);
    _82 = mad(0.012477199546992779f, _76, _81);
    _83 = _74 * -0.0012105499627068639f;
    _84 = mad(0.017604099586606026f, _75, _83);
    _85 = mad(0.9836069941520691f, _76, _84);
    _86 = _79 * 9.999999747378752e-05f;
    _87 = _82 * 9.999999747378752e-05f;
    _88 = _85 * 9.999999747378752e-05f;
    _89 = saturate(_86);
    _90 = saturate(_87);
    _91 = saturate(_88);
    _92 = log2(_89);
    _93 = log2(_90);
    _94 = log2(_91);
    _95 = _92 * 0.1593017578125f;
    _96 = _93 * 0.1593017578125f;
    _97 = _94 * 0.1593017578125f;
    _98 = exp2(_95);
    _99 = exp2(_96);
    _100 = exp2(_97);
    _101 = _98 * 18.8515625f;
    _102 = _99 * 18.8515625f;
    _103 = _100 * 18.8515625f;
    _104 = _101 + 0.8359375f;
    _105 = _102 + 0.8359375f;
    _106 = _103 + 0.8359375f;
    _107 = _98 * 18.6875f;
    _108 = _99 * 18.6875f;
    _109 = _100 * 18.6875f;
    _110 = _107 + 1.0f;
    _111 = _108 + 1.0f;
    _112 = _109 + 1.0f;
    _113 = _104 / _110;
    _114 = _105 / _111;
    _115 = _106 / _112;
    _116 = log2(_113);
    _117 = log2(_114);
    _118 = log2(_115);
    _119 = _116 * 78.84375f;
    _120 = _117 * 78.84375f;
    _121 = _118 * 78.84375f;
    _122 = exp2(_119);
    _123 = exp2(_120);
    _124 = exp2(_121);
    _125 = saturate(_122);
    _126 = saturate(_123);
    _127 = saturate(_124);
    _140 = _125;
    _141 = _126;
    _142 = _127;
#endif
  } else {
    _130 = log2(_52);
    _131 = log2(_53);
    _132 = log2(_54);
    _133 = _130 * cbUIGlobal_016;
    _134 = _131 * cbUIGlobal_016;
    _135 = _132 * cbUIGlobal_016;
    _136 = exp2(_133);
    _137 = exp2(_134);
    _138 = exp2(_135);
    _140 = _136;
    _141 = _137;
    _142 = _138;
  }
  _143 = _140 * _50;
  _144 = _141 * _50;
  _145 = _142 * _50;
  SV_Target.x = _143;
  SV_Target.y = _144;
  SV_Target.z = _145;
  SV_Target.w = _50;
#endif
  return SV_Target;
}
