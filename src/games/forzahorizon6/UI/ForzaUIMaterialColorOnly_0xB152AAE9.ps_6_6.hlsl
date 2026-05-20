#include "UI.hlsli"

cbuffer cb0 : register(b0) {
  float4 PSConstants_000 : packoffset(c000.x);
  float4 PSConstants_016 : packoffset(c001.x);
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
    linear float3 TEXCOORD_1: TEXCOORD1,
    linear float4 TEXCOORD_2: TEXCOORD2)
    : SV_Target {
  float4 SV_Target;
  float _11;
  float _12;
  float _13;
  float _14;
  float _20;
  float _21;
  float _22;
  float _23;
  float _24;
  float _25;
  float _26;
  float _27;
  bool _30;
  float _113;
  float _114;
  float _115;
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
  float _44;
  float _47;
  float _48;
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
  float _103;
  float _104;
  float _105;
  float _106;
  float _107;
  float _108;
  float _109;
  float _110;
  float _111;
  float _116;
  float _117;
  float _118;
  _11 = PSConstants_000.w * TEXCOORD_1.z;
  _12 = _11 * PSConstants_000.x;
  _13 = _11 * PSConstants_000.y;
  _14 = _11 * PSConstants_000.z;
  _20 = _12 * PSConstants_016.x;
  _21 = _13 * PSConstants_016.y;
  _22 = _14 * PSConstants_016.z;
  _23 = _11 * PSConstants_016.w;
  _24 = _23 + 9.999999747378752e-06f;
  _25 = _20 / _24;
  _26 = _21 / _24;
  _27 = _22 / _24;
#if 1
  SV_Target = GenerateUIOutputColor(_25, _26, _27, _23);
#else
  _30 = (cbUIGlobal_020 != 0.0f);
  [branch]
  if (_30) {
#if 1
    LinearizeUIAndEncodePQ(_25, _26, _27, cbUIGlobal_028, cbUIGlobal_000, _113, _114, _115);
#else
    _33 = abs(_25);
    _34 = abs(_26);
    _35 = abs(_27);
    _36 = log2(_33);
    _37 = log2(_34);
    _38 = log2(_35);
    _39 = _36 * cbUIGlobal_028;
    _40 = _37 * cbUIGlobal_028;
    _41 = _38 * cbUIGlobal_028;
    _42 = exp2(_39);
    _43 = exp2(_40);
    _44 = exp2(_41);
    _47 = cbUIGlobal_000 * _42;
    _48 = cbUIGlobal_000 * _43;
    _49 = cbUIGlobal_000 * _44;
    _50 = _47 * 0.627403974533081f;
    _51 = mad(0.3292819857597351f, _48, _50);
    _52 = mad(0.04331360012292862f, _49, _51);
    _53 = _47 * 0.045745600014925f;
    _54 = mad(0.9417769908905029f, _48, _53);
    _55 = mad(0.012477199546992779f, _49, _54);
    _56 = _47 * -0.0012105499627068639f;
    _57 = mad(0.017604099586606026f, _48, _56);
    _58 = mad(0.9836069941520691f, _49, _57);
    _59 = _52 * 9.999999747378752e-05f;
    _60 = _55 * 9.999999747378752e-05f;
    _61 = _58 * 9.999999747378752e-05f;
    _62 = saturate(_59);
    _63 = saturate(_60);
    _64 = saturate(_61);
    _65 = log2(_62);
    _66 = log2(_63);
    _67 = log2(_64);
    _68 = _65 * 0.1593017578125f;
    _69 = _66 * 0.1593017578125f;
    _70 = _67 * 0.1593017578125f;
    _71 = exp2(_68);
    _72 = exp2(_69);
    _73 = exp2(_70);
    _74 = _71 * 18.8515625f;
    _75 = _72 * 18.8515625f;
    _76 = _73 * 18.8515625f;
    _77 = _74 + 0.8359375f;
    _78 = _75 + 0.8359375f;
    _79 = _76 + 0.8359375f;
    _80 = _71 * 18.6875f;
    _81 = _72 * 18.6875f;
    _82 = _73 * 18.6875f;
    _83 = _80 + 1.0f;
    _84 = _81 + 1.0f;
    _85 = _82 + 1.0f;
    _86 = _77 / _83;
    _87 = _78 / _84;
    _88 = _79 / _85;
    _89 = log2(_86);
    _90 = log2(_87);
    _91 = log2(_88);
    _92 = _89 * 78.84375f;
    _93 = _90 * 78.84375f;
    _94 = _91 * 78.84375f;
    _95 = exp2(_92);
    _96 = exp2(_93);
    _97 = exp2(_94);
    _98 = saturate(_95);
    _99 = saturate(_96);
    _100 = saturate(_97);
    _113 = _98;
    _114 = _99;
    _115 = _100;
#endif
  } else {
    _103 = log2(_25);
    _104 = log2(_26);
    _105 = log2(_27);
    _106 = _103 * cbUIGlobal_016;
    _107 = _104 * cbUIGlobal_016;
    _108 = _105 * cbUIGlobal_016;
    _109 = exp2(_106);
    _110 = exp2(_107);
    _111 = exp2(_108);
    _113 = _109;
    _114 = _110;
    _115 = _111;
  }
  _116 = _113 * _23;
  _117 = _114 * _23;
  _118 = _115 * _23;
  SV_Target.x = _116;
  SV_Target.y = _117;
  SV_Target.z = _118;
  SV_Target.w = _23;
#endif
  return SV_Target;
}
