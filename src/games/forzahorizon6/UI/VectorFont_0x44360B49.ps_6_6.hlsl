#include "UI.hlsli"

struct PSConstantBufferData {
  float4 PSConstantBufferData_000;
  float4 PSConstantBufferData_016;
};

cbuffer cb0 : register(b0) {
  PSConstantBufferData PSBuffer_000 : packoffset(c000.x);
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
    linear float4 TEXCOORD: TEXCOORD)
    : SV_Target {
  float4 SV_Target;
  float _8;
  float _9;
  float _10;
  float _11;
  float _12;
  float _13;
  float _14;
  float _15;
  float _16;
  float _19;
  float _20;
  float _22;
  float _23;
  float _25;
  float _26;
  float _27;
  float _29;
  float _35;
  float _36;
  float _37;
  float _38;
  float _39;
  float _40;
  float _41;
  float _42;
  bool _45;
  float _128;
  float _129;
  float _130;
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
  float _118;
  float _119;
  float _120;
  float _121;
  float _122;
  float _123;
  float _124;
  float _125;
  float _126;
  float _131;
  float _132;
  float _133;
  _8 = TEXCOORD.x * TEXCOORD.x;
  _9 = TEXCOORD.y - _8;
  _10 = _9 * TEXCOORD.z;
  _11 = ddx_coarse(_10);
  _12 = ddy_coarse(_10);
  _13 = _11 * _11;
  _14 = _12 * _12;
  _15 = _14 + _13;
  _16 = sqrt(_15);
  _19 = PSBuffer_000.PSConstantBufferData_000.x * _16;
  _20 = _10 / _19;
  _22 = PSBuffer_000.PSConstantBufferData_000.y + _20;
  _23 = saturate(_22);
  _25 = log2(_23);
  _26 = _25 * PSBuffer_000.PSConstantBufferData_000.z;
  _27 = exp2(_26);
  _29 = _27 * PSBuffer_000.PSConstantBufferData_000.w;
  _35 = _29 * PSBuffer_000.PSConstantBufferData_016.w;
  _36 = _35 * PSBuffer_000.PSConstantBufferData_016.x;
  _37 = _35 * PSBuffer_000.PSConstantBufferData_016.y;
  _38 = _35 * PSBuffer_000.PSConstantBufferData_016.z;
  _39 = _35 + 9.999999747378752e-06f;
  _40 = _36 / _39;
  _41 = _37 / _39;
  _42 = _38 / _39;
#if 1
  SV_Target = GenerateUIOutputColor(_40, _41, _42, _35);
#else
  _45 = (cbUIGlobal_020 != 0.0f);
  [branch]
  if (_45) {
#if 1
    LinearizeUIAndEncodePQ(_40, _41, _42, cbUIGlobal_028, cbUIGlobal_000, _128, _129, _130);
#else
    _48 = abs(_40);
    _49 = abs(_41);
    _50 = abs(_42);
    _51 = log2(_48);
    _52 = log2(_49);
    _53 = log2(_50);
    _54 = _51 * cbUIGlobal_028;
    _55 = _52 * cbUIGlobal_028;
    _56 = _53 * cbUIGlobal_028;
    _57 = exp2(_54);
    _58 = exp2(_55);
    _59 = exp2(_56);
    _62 = cbUIGlobal_000 * _57;
    _63 = cbUIGlobal_000 * _58;
    _64 = cbUIGlobal_000 * _59;
    _65 = _62 * 0.627403974533081f;
    _66 = mad(0.3292819857597351f, _63, _65);
    _67 = mad(0.04331360012292862f, _64, _66);
    _68 = _62 * 0.045745600014925f;
    _69 = mad(0.9417769908905029f, _63, _68);
    _70 = mad(0.012477199546992779f, _64, _69);
    _71 = _62 * -0.0012105499627068639f;
    _72 = mad(0.017604099586606026f, _63, _71);
    _73 = mad(0.9836069941520691f, _64, _72);
    _74 = _67 * 9.999999747378752e-05f;
    _75 = _70 * 9.999999747378752e-05f;
    _76 = _73 * 9.999999747378752e-05f;
    _77 = saturate(_74);
    _78 = saturate(_75);
    _79 = saturate(_76);
    _80 = log2(_77);
    _81 = log2(_78);
    _82 = log2(_79);
    _83 = _80 * 0.1593017578125f;
    _84 = _81 * 0.1593017578125f;
    _85 = _82 * 0.1593017578125f;
    _86 = exp2(_83);
    _87 = exp2(_84);
    _88 = exp2(_85);
    _89 = _86 * 18.8515625f;
    _90 = _87 * 18.8515625f;
    _91 = _88 * 18.8515625f;
    _92 = _89 + 0.8359375f;
    _93 = _90 + 0.8359375f;
    _94 = _91 + 0.8359375f;
    _95 = _86 * 18.6875f;
    _96 = _87 * 18.6875f;
    _97 = _88 * 18.6875f;
    _98 = _95 + 1.0f;
    _99 = _96 + 1.0f;
    _100 = _97 + 1.0f;
    _101 = _92 / _98;
    _102 = _93 / _99;
    _103 = _94 / _100;
    _104 = log2(_101);
    _105 = log2(_102);
    _106 = log2(_103);
    _107 = _104 * 78.84375f;
    _108 = _105 * 78.84375f;
    _109 = _106 * 78.84375f;
    _110 = exp2(_107);
    _111 = exp2(_108);
    _112 = exp2(_109);
    _113 = saturate(_110);
    _114 = saturate(_111);
    _115 = saturate(_112);
    _128 = _113;
    _129 = _114;
    _130 = _115;
#endif
  } else {
    _118 = log2(_40);
    _119 = log2(_41);
    _120 = log2(_42);
    _121 = _118 * cbUIGlobal_016;
    _122 = _119 * cbUIGlobal_016;
    _123 = _120 * cbUIGlobal_016;
    _124 = exp2(_121);
    _125 = exp2(_122);
    _126 = exp2(_123);
    _128 = _124;
    _129 = _125;
    _130 = _126;
  }
  _131 = _128 * _35;
  _132 = _129 * _35;
  _133 = _130 * _35;
  SV_Target.x = _131;
  SV_Target.y = _132;
  SV_Target.z = _133;
  SV_Target.w = _35;
#endif
  return SV_Target;
}
