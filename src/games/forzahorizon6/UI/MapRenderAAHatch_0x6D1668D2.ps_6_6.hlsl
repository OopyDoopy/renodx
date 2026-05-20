#include "UI.hlsli"

cbuffer cb0 : register(b0) {
  float2 PSConstants_000 : packoffset(c000.x);
  float PSConstants_008 : packoffset(c000.z);
  float PSConstants_012 : packoffset(c000.w);
};

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) {
  return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value));
}
uint firstbithigh_msb(uint value) {
  return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value));
}

float4 main(
    precise noperspective float4 SV_Position: SV_Position,
    linear float4 COLOR: COLOR,
    linear float4 TEXCOORD: TEXCOORD)
    : SV_Target {
  float4 SV_Target;
  float _13;
  float _15;
  float _16;
  float _18;
  float _19;
  float _20;
  float _21;
  float _22;
  float _23;
  float _24;
  float _26;
  float _27;
  float _28;
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
  float _39;
  float _40;
  float _41;
  float _42;
  float _43;
  bool _46;
  float _129;
  float _130;
  float _131;
  float _49;
  float _50;
  float _51;
  float _52;
  float _53;
  float _54;
  float _55;
  float _56;
  float _57;
  float _58;
  float _59;
  float _60;
  float _63;
  float _64;
  float _65;
  float _66;
  float _67;
  float _68;
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
  float _119;
  float _120;
  float _121;
  float _122;
  float _123;
  float _124;
  float _125;
  float _126;
  float _127;
  float _132;
  float _133;
  float _134;
  _13 = PSConstants_000.x * TEXCOORD.x;
  _15 = PSConstants_000.y * TEXCOORD.z;
  _16 = _15 + _13;
  _18 = _16 / PSConstants_008;
  _19 = floor(_18);
  _20 = _18 - _19;
  _21 = _20 * 2.0f;
  _22 = _21 + -1.0f;
  _23 = abs(_22);
  _24 = 1.0f - _23;
  _26 = _24 / PSConstants_012;
  _27 = ddx_coarse(_26);
  _28 = ddy_coarse(_26);
  _29 = _27 * _27;
  _30 = _28 * _28;
  _31 = _30 + _29;
  _32 = sqrt(_31);
  _33 = 1.0f - _26;
  _34 = _33 / _32;
  _35 = saturate(_34);
  _36 = _35 * COLOR.w;
  _37 = _36 * COLOR.x;
  _38 = _36 * COLOR.y;
  _39 = _36 * COLOR.z;
  _40 = _36 + 9.999999747378752e-06f;
  _41 = _37 / _40;
  _42 = _38 / _40;
  _43 = _39 / _40;
#if 1
  SV_Target = GenerateUIOutputColor(_41, _42, _43, _36);
#else
  _46 = (cbUIGlobal_020 != 0.0f);
  [branch]
  if (_46) {
#if 1
    LinearizeUIAndEncodePQ(_41, _42, _43, cbUIGlobal_028, cbUIGlobal_000, _129, _130, _131);
#else
    _49 = abs(_41);
    _50 = abs(_42);
    _51 = abs(_43);
    _52 = log2(_49);
    _53 = log2(_50);
    _54 = log2(_51);
    _55 = _52 * cbUIGlobal_028;
    _56 = _53 * cbUIGlobal_028;
    _57 = _54 * cbUIGlobal_028;
    _58 = exp2(_55);
    _59 = exp2(_56);
    _60 = exp2(_57);
    _63 = cbUIGlobal_000 * _58;
    _64 = cbUIGlobal_000 * _59;
    _65 = cbUIGlobal_000 * _60;
    _66 = _63 * 0.627403974533081f;
    _67 = mad(0.3292819857597351f, _64, _66);
    _68 = mad(0.04331360012292862f, _65, _67);
    _69 = _63 * 0.045745600014925f;
    _70 = mad(0.9417769908905029f, _64, _69);
    _71 = mad(0.012477199546992779f, _65, _70);
    _72 = _63 * -0.0012105499627068639f;
    _73 = mad(0.017604099586606026f, _64, _72);
    _74 = mad(0.9836069941520691f, _65, _73);
    _75 = _68 * 9.999999747378752e-05f;
    _76 = _71 * 9.999999747378752e-05f;
    _77 = _74 * 9.999999747378752e-05f;
    _78 = saturate(_75);
    _79 = saturate(_76);
    _80 = saturate(_77);
    _81 = log2(_78);
    _82 = log2(_79);
    _83 = log2(_80);
    _84 = _81 * 0.1593017578125f;
    _85 = _82 * 0.1593017578125f;
    _86 = _83 * 0.1593017578125f;
    _87 = exp2(_84);
    _88 = exp2(_85);
    _89 = exp2(_86);
    _90 = _87 * 18.8515625f;
    _91 = _88 * 18.8515625f;
    _92 = _89 * 18.8515625f;
    _93 = _90 + 0.8359375f;
    _94 = _91 + 0.8359375f;
    _95 = _92 + 0.8359375f;
    _96 = _87 * 18.6875f;
    _97 = _88 * 18.6875f;
    _98 = _89 * 18.6875f;
    _99 = _96 + 1.0f;
    _100 = _97 + 1.0f;
    _101 = _98 + 1.0f;
    _102 = _93 / _99;
    _103 = _94 / _100;
    _104 = _95 / _101;
    _105 = log2(_102);
    _106 = log2(_103);
    _107 = log2(_104);
    _108 = _105 * 78.84375f;
    _109 = _106 * 78.84375f;
    _110 = _107 * 78.84375f;
    _111 = exp2(_108);
    _112 = exp2(_109);
    _113 = exp2(_110);
    _114 = saturate(_111);
    _115 = saturate(_112);
    _116 = saturate(_113);
    _129 = _114;
    _130 = _115;
    _131 = _116;
#endif
  } else {
    _119 = log2(_41);
    _120 = log2(_42);
    _121 = log2(_43);
    _122 = _119 * cbUIGlobal_016;
    _123 = _120 * cbUIGlobal_016;
    _124 = _121 * cbUIGlobal_016;
    _125 = exp2(_122);
    _126 = exp2(_123);
    _127 = exp2(_124);
    _129 = _125;
    _130 = _126;
    _131 = _127;
  }
  _132 = _129 * _36;
  _133 = _130 * _36;
  _134 = _131 * _36;
  SV_Target.x = _132;
  SV_Target.y = _133;
  SV_Target.z = _134;
  SV_Target.w = _36;
#endif
  return SV_Target;
}
