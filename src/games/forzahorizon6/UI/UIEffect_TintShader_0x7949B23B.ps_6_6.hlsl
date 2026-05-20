#include "UI.hlsli"

Texture2D<float4> t0 : register(t0);

cbuffer cb0 : register(b0) {
  float4 cbPixelShader_000 : packoffset(c000.x);
  float4 cbPixelShader_016 : packoffset(c001.x);
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
    linear float4 TEXCOORD: TEXCOORD)
    : SV_Target {
  float4 SV_Target;
  float4 _11;
  float _23;
  float _24;
  float _25;
  float _26;
  float _27;
  float _28;
  float _29;
  float _30;
  float _31;
  float _32;
  float _33;
  float _34;
  bool _37;
  float _120;
  float _121;
  float _122;
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
  float _102;
  float _103;
  float _104;
  float _105;
  float _106;
  float _107;
  float _110;
  float _111;
  float _112;
  float _113;
  float _114;
  float _115;
  float _116;
  float _117;
  float _118;
  float _123;
  float _124;
  float _125;
  _11 = t0.Sample(s0, float2(TEXCOORD.x, TEXCOORD.y));
  _23 = cbPixelShader_000.w * cbPixelShader_016.w;
  _24 = _23 * _11.x;
  _25 = _24 * cbPixelShader_016.x;
  _26 = _23 * _11.y;
  _27 = _26 * cbPixelShader_016.y;
  _28 = _23 * _11.z;
  _29 = _28 * cbPixelShader_016.z;
  _30 = _23 * _11.w;
  _31 = _30 + 9.999999747378752e-06f;
  _32 = _25 / _31;
  _33 = _27 / _31;
  _34 = _29 / _31;
#if 1
  SV_Target = GenerateUIOutputColor(_32, _33, _34, _30);
#else
  _37 = (cbUIGlobal_020 != 0.0f);
  [branch]
  if (_37) {
#if 1
    LinearizeUIAndEncodePQ(_32, _33, _34, cbUIGlobal_028, cbUIGlobal_000, _120, _121, _122);
#else
    _40 = abs(_32);
    _41 = abs(_33);
    _42 = abs(_34);
    _43 = log2(_40);
    _44 = log2(_41);
    _45 = log2(_42);
    _46 = _43 * cbUIGlobal_028;
    _47 = _44 * cbUIGlobal_028;
    _48 = _45 * cbUIGlobal_028;
    _49 = exp2(_46);
    _50 = exp2(_47);
    _51 = exp2(_48);
    _54 = cbUIGlobal_000 * _49;
    _55 = cbUIGlobal_000 * _50;
    _56 = cbUIGlobal_000 * _51;
    _57 = _54 * 0.627403974533081f;
    _58 = mad(0.3292819857597351f, _55, _57);
    _59 = mad(0.04331360012292862f, _56, _58);
    _60 = _54 * 0.045745600014925f;
    _61 = mad(0.9417769908905029f, _55, _60);
    _62 = mad(0.012477199546992779f, _56, _61);
    _63 = _54 * -0.0012105499627068639f;
    _64 = mad(0.017604099586606026f, _55, _63);
    _65 = mad(0.9836069941520691f, _56, _64);
    _66 = _59 * 9.999999747378752e-05f;
    _67 = _62 * 9.999999747378752e-05f;
    _68 = _65 * 9.999999747378752e-05f;
    _69 = saturate(_66);
    _70 = saturate(_67);
    _71 = saturate(_68);
    _72 = log2(_69);
    _73 = log2(_70);
    _74 = log2(_71);
    _75 = _72 * 0.1593017578125f;
    _76 = _73 * 0.1593017578125f;
    _77 = _74 * 0.1593017578125f;
    _78 = exp2(_75);
    _79 = exp2(_76);
    _80 = exp2(_77);
    _81 = _78 * 18.8515625f;
    _82 = _79 * 18.8515625f;
    _83 = _80 * 18.8515625f;
    _84 = _81 + 0.8359375f;
    _85 = _82 + 0.8359375f;
    _86 = _83 + 0.8359375f;
    _87 = _78 * 18.6875f;
    _88 = _79 * 18.6875f;
    _89 = _80 * 18.6875f;
    _90 = _87 + 1.0f;
    _91 = _88 + 1.0f;
    _92 = _89 + 1.0f;
    _93 = _84 / _90;
    _94 = _85 / _91;
    _95 = _86 / _92;
    _96 = log2(_93);
    _97 = log2(_94);
    _98 = log2(_95);
    _99 = _96 * 78.84375f;
    _100 = _97 * 78.84375f;
    _101 = _98 * 78.84375f;
    _102 = exp2(_99);
    _103 = exp2(_100);
    _104 = exp2(_101);
    _105 = saturate(_102);
    _106 = saturate(_103);
    _107 = saturate(_104);
    _120 = _105;
    _121 = _106;
    _122 = _107;
#endif
  } else {
    _110 = log2(_32);
    _111 = log2(_33);
    _112 = log2(_34);
    _113 = _110 * cbUIGlobal_016;
    _114 = _111 * cbUIGlobal_016;
    _115 = _112 * cbUIGlobal_016;
    _116 = exp2(_113);
    _117 = exp2(_114);
    _118 = exp2(_115);
    _120 = _116;
    _121 = _117;
    _122 = _118;
  }
  _123 = _120 * _30;
  _124 = _121 * _30;
  _125 = _122 * _30;
  SV_Target.x = _123;
  SV_Target.y = _124;
  SV_Target.z = _125;
  SV_Target.w = _30;
#endif
  return SV_Target;
}
