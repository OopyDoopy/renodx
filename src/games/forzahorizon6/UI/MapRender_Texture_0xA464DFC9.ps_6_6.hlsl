#include "UI.hlsli"

Texture2D<float4> t0 : register(t0);

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
    linear float4 COLOR: COLOR,
    linear float2 TEXCOORD: TEXCOORD)
    : SV_Target {
  float4 SV_Target;
  float4 _13;
  float _18;
  float _19;
  float _20;
  float _21;
  float _22;
  float _23;
  float _24;
  float _25;
  float _26;
  float _27;
  float _28;
  bool _31;
  float _114;
  float _115;
  float _116;
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
  float _45;
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
  float _101;
  float _104;
  float _105;
  float _106;
  float _107;
  float _108;
  float _109;
  float _110;
  float _111;
  float _112;
  float _117;
  float _118;
  float _119;
  _13 = t0.Sample(s0, float2(TEXCOORD.x, TEXCOORD.y));
  _18 = COLOR.w * COLOR.x;
  _19 = _18 * _13.x;
  _20 = COLOR.w * COLOR.y;
  _21 = _20 * _13.y;
  _22 = COLOR.w * COLOR.z;
  _23 = _22 * _13.z;
  _24 = _13.w * COLOR.w;
  _25 = _24 + 9.999999747378752e-06f;
  _26 = _19 / _25;
  _27 = _21 / _25;
  _28 = _23 / _25;
#if 1
  SV_Target = GenerateUIOutputColor(_26, _27, _28, _24);
#else
  _31 = (cbUIGlobal_020 != 0.0f);
  [branch]
  if (_31) {
#if 1
    LinearizeUIAndEncodePQ(_26, _27, _28, cbUIGlobal_028, cbUIGlobal_000, _114, _115, _116);
#else
    _34 = abs(_26);
    _35 = abs(_27);
    _36 = abs(_28);
    _37 = log2(_34);
    _38 = log2(_35);
    _39 = log2(_36);
    _40 = _37 * cbUIGlobal_028;
    _41 = _38 * cbUIGlobal_028;
    _42 = _39 * cbUIGlobal_028;
    _43 = exp2(_40);
    _44 = exp2(_41);
    _45 = exp2(_42);
    _48 = cbUIGlobal_000 * _43;
    _49 = cbUIGlobal_000 * _44;
    _50 = cbUIGlobal_000 * _45;
    _51 = _48 * 0.627403974533081f;
    _52 = mad(0.3292819857597351f, _49, _51);
    _53 = mad(0.04331360012292862f, _50, _52);
    _54 = _48 * 0.045745600014925f;
    _55 = mad(0.9417769908905029f, _49, _54);
    _56 = mad(0.012477199546992779f, _50, _55);
    _57 = _48 * -0.0012105499627068639f;
    _58 = mad(0.017604099586606026f, _49, _57);
    _59 = mad(0.9836069941520691f, _50, _58);
    _60 = _53 * 9.999999747378752e-05f;
    _61 = _56 * 9.999999747378752e-05f;
    _62 = _59 * 9.999999747378752e-05f;
    _63 = saturate(_60);
    _64 = saturate(_61);
    _65 = saturate(_62);
    _66 = log2(_63);
    _67 = log2(_64);
    _68 = log2(_65);
    _69 = _66 * 0.1593017578125f;
    _70 = _67 * 0.1593017578125f;
    _71 = _68 * 0.1593017578125f;
    _72 = exp2(_69);
    _73 = exp2(_70);
    _74 = exp2(_71);
    _75 = _72 * 18.8515625f;
    _76 = _73 * 18.8515625f;
    _77 = _74 * 18.8515625f;
    _78 = _75 + 0.8359375f;
    _79 = _76 + 0.8359375f;
    _80 = _77 + 0.8359375f;
    _81 = _72 * 18.6875f;
    _82 = _73 * 18.6875f;
    _83 = _74 * 18.6875f;
    _84 = _81 + 1.0f;
    _85 = _82 + 1.0f;
    _86 = _83 + 1.0f;
    _87 = _78 / _84;
    _88 = _79 / _85;
    _89 = _80 / _86;
    _90 = log2(_87);
    _91 = log2(_88);
    _92 = log2(_89);
    _93 = _90 * 78.84375f;
    _94 = _91 * 78.84375f;
    _95 = _92 * 78.84375f;
    _96 = exp2(_93);
    _97 = exp2(_94);
    _98 = exp2(_95);
    _99 = saturate(_96);
    _100 = saturate(_97);
    _101 = saturate(_98);
    _114 = _99;
    _115 = _100;
    _116 = _101;
#endif
  } else {
    _104 = log2(_26);
    _105 = log2(_27);
    _106 = log2(_28);
    _107 = _104 * cbUIGlobal_016;
    _108 = _105 * cbUIGlobal_016;
    _109 = _106 * cbUIGlobal_016;
    _110 = exp2(_107);
    _111 = exp2(_108);
    _112 = exp2(_109);
    _114 = _110;
    _115 = _111;
    _116 = _112;
  }
  _117 = _114 * _24;
  _118 = _115 * _24;
  _119 = _116 * _24;
  SV_Target.x = _117;
  SV_Target.y = _118;
  SV_Target.z = _119;
  SV_Target.w = _24;
#endif
  return SV_Target;
}
