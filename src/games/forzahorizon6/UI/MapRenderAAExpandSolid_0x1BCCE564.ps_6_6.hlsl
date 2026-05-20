#include "UI.hlsli"

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
  float _7;
  float _8;
  float _9;
  float _10;
  float _11;
  float _12;
  float _13;
  bool _16;
  float _99;
  float _100;
  float _101;
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
  float _29;
  float _30;
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
  float _89;
  float _90;
  float _91;
  float _92;
  float _93;
  float _94;
  float _95;
  float _96;
  float _97;
  float _102;
  float _103;
  float _104;
  _7 = COLOR.w * COLOR.x;
  _8 = COLOR.w * COLOR.y;
  _9 = COLOR.w * COLOR.z;
  _10 = COLOR.w + 9.999999747378752e-06f;
  _11 = _7 / _10;
  _12 = _8 / _10;
  _13 = _9 / _10;
#if 1
  SV_Target = GenerateUIOutputColor(_11, _12, _13, COLOR.w);
#else
  _16 = (cbUIGlobal_020 != 0.0f);
  [branch]
  if (_16) {
#if 1
    LinearizeUIAndEncodePQ(_11, _12, _13, cbUIGlobal_028, cbUIGlobal_000, _99, _100, _101);
#else
    _19 = abs(_11);
    _20 = abs(_12);
    _21 = abs(_13);
    _22 = log2(_19);
    _23 = log2(_20);
    _24 = log2(_21);
    _25 = _22 * cbUIGlobal_028;
    _26 = _23 * cbUIGlobal_028;
    _27 = _24 * cbUIGlobal_028;
    _28 = exp2(_25);
    _29 = exp2(_26);
    _30 = exp2(_27);
    _33 = cbUIGlobal_000 * _28;
    _34 = cbUIGlobal_000 * _29;
    _35 = cbUIGlobal_000 * _30;
    _36 = _33 * 0.627403974533081f;
    _37 = mad(0.3292819857597351f, _34, _36);
    _38 = mad(0.04331360012292862f, _35, _37);
    _39 = _33 * 0.045745600014925f;
    _40 = mad(0.9417769908905029f, _34, _39);
    _41 = mad(0.012477199546992779f, _35, _40);
    _42 = _33 * -0.0012105499627068639f;
    _43 = mad(0.017604099586606026f, _34, _42);
    _44 = mad(0.9836069941520691f, _35, _43);
    _45 = _38 * 9.999999747378752e-05f;
    _46 = _41 * 9.999999747378752e-05f;
    _47 = _44 * 9.999999747378752e-05f;
    _48 = saturate(_45);
    _49 = saturate(_46);
    _50 = saturate(_47);
    _51 = log2(_48);
    _52 = log2(_49);
    _53 = log2(_50);
    _54 = _51 * 0.1593017578125f;
    _55 = _52 * 0.1593017578125f;
    _56 = _53 * 0.1593017578125f;
    _57 = exp2(_54);
    _58 = exp2(_55);
    _59 = exp2(_56);
    _60 = _57 * 18.8515625f;
    _61 = _58 * 18.8515625f;
    _62 = _59 * 18.8515625f;
    _63 = _60 + 0.8359375f;
    _64 = _61 + 0.8359375f;
    _65 = _62 + 0.8359375f;
    _66 = _57 * 18.6875f;
    _67 = _58 * 18.6875f;
    _68 = _59 * 18.6875f;
    _69 = _66 + 1.0f;
    _70 = _67 + 1.0f;
    _71 = _68 + 1.0f;
    _72 = _63 / _69;
    _73 = _64 / _70;
    _74 = _65 / _71;
    _75 = log2(_72);
    _76 = log2(_73);
    _77 = log2(_74);
    _78 = _75 * 78.84375f;
    _79 = _76 * 78.84375f;
    _80 = _77 * 78.84375f;
    _81 = exp2(_78);
    _82 = exp2(_79);
    _83 = exp2(_80);
    _84 = saturate(_81);
    _85 = saturate(_82);
    _86 = saturate(_83);
    _99 = _84;
    _100 = _85;
    _101 = _86;
#endif
  } else {
    _89 = log2(_11);
    _90 = log2(_12);
    _91 = log2(_13);
    _92 = _89 * cbUIGlobal_016;
    _93 = _90 * cbUIGlobal_016;
    _94 = _91 * cbUIGlobal_016;
    _95 = exp2(_92);
    _96 = exp2(_93);
    _97 = exp2(_94);
    _99 = _95;
    _100 = _96;
    _101 = _97;
  }
  _102 = _99 * COLOR.w;
  _103 = _100 * COLOR.w;
  _104 = _101 * COLOR.w;
  SV_Target.x = _102;
  SV_Target.y = _103;
  SV_Target.z = _104;
  SV_Target.w = COLOR.w;
#endif
  return SV_Target;
}
