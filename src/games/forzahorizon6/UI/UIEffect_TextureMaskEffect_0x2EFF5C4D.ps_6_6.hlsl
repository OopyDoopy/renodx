#include "UI.hlsli"

Texture2D<float4> t0 : register(t0);

Texture2D<float4> t1 : register(t1);

cbuffer cb0 : register(b0) {
  float cb0_000w : packoffset(c000.w);
  float cb0_001x : packoffset(c001.x);
  float cb0_001y : packoffset(c001.y);
  float cb0_001z : packoffset(c001.z);
  float cb0_001w : packoffset(c001.w);
  float cb0_002x : packoffset(c002.x);
  float cb0_003x : packoffset(c003.x);
  float cb0_004x : packoffset(c004.x);
  float cb0_005x : packoffset(c005.x);
  float cb0_006x : packoffset(c006.x);
};

SamplerState s0 : register(s0);

SamplerState s1 : register(s1);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) {
  return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value));
}
uint firstbithigh_msb(uint value) {
  return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value));
}

float4 main(
    precise noperspective float4 SV_Position: SV_Position,
    linear float4 TEXCOORD: TEXCOORD)
    : SV_Target {
  float4 SV_Target;
  float4 _13;
  float4 _20;
  float _24;
  float _27;
  float _30;
  float _31;
  float _32;
  float _35;
  float _36;
  float _39;
  float _40;
  float _41;
  float _42;
  float _43;
  float _48;
  float _49;
  float _50;
  float _53;
  float _54;
  float _55;
  float _56;
  float _58;
  float _59;
  float _60;
  float _61;
  float _62;
  float _63;
  bool _66;
  float _149;
  float _150;
  float _151;
  float _69;
  float _70;
  float _71;
  float _72;
  float _73;
  float _74;
  float _75;
  float _76;
  float _77;
  float _78;
  float _79;
  float _80;
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
  float _128;
  float _129;
  float _130;
  float _131;
  float _132;
  float _133;
  float _134;
  float _135;
  float _136;
  float _139;
  float _140;
  float _141;
  float _142;
  float _143;
  float _144;
  float _145;
  float _146;
  float _147;
  float _152;
  float _153;
  float _154;
  _13 = t0.Sample(s0, float2(TEXCOORD.x, TEXCOORD.y));
  _20 = t1.Sample(s1, float2(TEXCOORD.x, TEXCOORD.y));
  _24 = _20.x - cb0_002x;
  _27 = _24 - cb0_006x;
  _30 = cb0_003x - cb0_002x;
  _31 = _27 / _30;
  _32 = saturate(_31);
  _35 = _20.x - cb0_006x;
  _36 = _35 - cb0_004x;
  _39 = cb0_005x - cb0_004x;
  _40 = _36 / _39;
  _41 = saturate(_40);
  _42 = 1.0f - _41;
  _43 = min(_32, _42);
  _48 = cb0_001x * _13.x;
  _49 = cb0_001y * _13.y;
  _50 = cb0_001z * _13.z;
  _53 = _48 * cb0_000w;
  _54 = _49 * cb0_000w;
  _55 = _50 * cb0_000w;
  _56 = _43 * _13.w;
  _58 = _56 * cb0_001w;
  _59 = _58 * cb0_000w;
  _60 = _59 + 9.999999747378752e-06f;
  _61 = _53 / _60;
  _62 = _54 / _60;
  _63 = _55 / _60;
#if 1
  SV_Target = GenerateUIOutputColor(_61, _62, _63, _59);
#else
  _66 = (cbUIGlobal_020 != 0.0f);
  [branch]
  if (_66) {
#if 1
    LinearizeUIAndEncodePQ(_61, _62, _63, cbUIGlobal_028, cbUIGlobal_000, _149, _150, _151);
#else
    _69 = abs(_61);
    _70 = abs(_62);
    _71 = abs(_63);
    _72 = log2(_69);
    _73 = log2(_70);
    _74 = log2(_71);
    _75 = _72 * cbUIGlobal_028;
    _76 = _73 * cbUIGlobal_028;
    _77 = _74 * cbUIGlobal_028;
    _78 = exp2(_75);
    _79 = exp2(_76);
    _80 = exp2(_77);
    _83 = cbUIGlobal_000 * _78;
    _84 = cbUIGlobal_000 * _79;
    _85 = cbUIGlobal_000 * _80;
    _86 = _83 * 0.627403974533081f;
    _87 = mad(0.3292819857597351f, _84, _86);
    _88 = mad(0.04331360012292862f, _85, _87);
    _89 = _83 * 0.045745600014925f;
    _90 = mad(0.9417769908905029f, _84, _89);
    _91 = mad(0.012477199546992779f, _85, _90);
    _92 = _83 * -0.0012105499627068639f;
    _93 = mad(0.017604099586606026f, _84, _92);
    _94 = mad(0.9836069941520691f, _85, _93);
    _95 = _88 * 9.999999747378752e-05f;
    _96 = _91 * 9.999999747378752e-05f;
    _97 = _94 * 9.999999747378752e-05f;
    _98 = saturate(_95);
    _99 = saturate(_96);
    _100 = saturate(_97);
    _101 = log2(_98);
    _102 = log2(_99);
    _103 = log2(_100);
    _104 = _101 * 0.1593017578125f;
    _105 = _102 * 0.1593017578125f;
    _106 = _103 * 0.1593017578125f;
    _107 = exp2(_104);
    _108 = exp2(_105);
    _109 = exp2(_106);
    _110 = _107 * 18.8515625f;
    _111 = _108 * 18.8515625f;
    _112 = _109 * 18.8515625f;
    _113 = _110 + 0.8359375f;
    _114 = _111 + 0.8359375f;
    _115 = _112 + 0.8359375f;
    _116 = _107 * 18.6875f;
    _117 = _108 * 18.6875f;
    _118 = _109 * 18.6875f;
    _119 = _116 + 1.0f;
    _120 = _117 + 1.0f;
    _121 = _118 + 1.0f;
    _122 = _113 / _119;
    _123 = _114 / _120;
    _124 = _115 / _121;
    _125 = log2(_122);
    _126 = log2(_123);
    _127 = log2(_124);
    _128 = _125 * 78.84375f;
    _129 = _126 * 78.84375f;
    _130 = _127 * 78.84375f;
    _131 = exp2(_128);
    _132 = exp2(_129);
    _133 = exp2(_130);
    _134 = saturate(_131);
    _135 = saturate(_132);
    _136 = saturate(_133);
    _149 = _134;
    _150 = _135;
    _151 = _136;
#endif
  } else {
    _139 = log2(_61);
    _140 = log2(_62);
    _141 = log2(_63);
    _142 = _139 * cbUIGlobal_016;
    _143 = _140 * cbUIGlobal_016;
    _144 = _141 * cbUIGlobal_016;
    _145 = exp2(_142);
    _146 = exp2(_143);
    _147 = exp2(_144);
    _149 = _145;
    _150 = _146;
    _151 = _147;
  }
  _152 = _149 * _59;
  _153 = _150 * _59;
  _154 = _151 * _59;
  SV_Target.x = _152;
  SV_Target.y = _153;
  SV_Target.z = _154;
  SV_Target.w = _59;
#endif
  return SV_Target;
}
