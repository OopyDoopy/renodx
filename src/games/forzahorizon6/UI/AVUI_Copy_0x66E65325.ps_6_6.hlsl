#include "UI.hlsli"

Texture2D<float4> t1 : register(t1);

cbuffer cb0 : register(b0) {
  float4 cbPixelShader_000 : packoffset(c000.x);
};

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
    linear float4 TEXCOORD: TEXCOORD,
    linear float TEXCOORD_1: TEXCOORD1)
    : SV_Target {
  float4 SV_Target;
  float4 _11;
  float _18;
  float _19;
  float _20;
  float _21;
  float _22;
  float _23;
  float _24;
  float _25;
  bool _28;
  float _111;
  float _112;
  float _113;
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
  float _101;
  float _102;
  float _103;
  float _104;
  float _105;
  float _106;
  float _107;
  float _108;
  float _109;
  float _114;
  float _115;
  float _116;
  _11 = t1.Sample(s1, float2(TEXCOORD.z, TEXCOORD.w));
  _18 = cbPixelShader_000.w * _11.x;
  _19 = cbPixelShader_000.w * _11.y;
  _20 = cbPixelShader_000.w * _11.z;
  _21 = cbPixelShader_000.w * _11.w;
  _22 = _21 + 9.999999747378752e-06f;
  _23 = _18 / _22;
  _24 = _19 / _22;
  _25 = _20 / _22;
#if 1
  SV_Target = GenerateUIOutputColor(_23, _24, _25, _21);
#else
  _28 = (cbUIGlobal_020 != 0.0f);
  [branch]
  if (_28) {
#if 1
    LinearizeUIAndEncodePQ(_23, _24, _25, cbUIGlobal_028, cbUIGlobal_000, _111, _112, _113);
#else
    _31 = abs(_23);
    _32 = abs(_24);
    _33 = abs(_25);
    _34 = log2(_31);
    _35 = log2(_32);
    _36 = log2(_33);
    _37 = _34 * cbUIGlobal_028;
    _38 = _35 * cbUIGlobal_028;
    _39 = _36 * cbUIGlobal_028;
    _40 = exp2(_37);
    _41 = exp2(_38);
    _42 = exp2(_39);
    _45 = cbUIGlobal_000 * _40;
    _46 = cbUIGlobal_000 * _41;
    _47 = cbUIGlobal_000 * _42;
    _48 = _45 * 0.627403974533081f;
    _49 = mad(0.3292819857597351f, _46, _48);
    _50 = mad(0.04331360012292862f, _47, _49);
    _51 = _45 * 0.045745600014925f;
    _52 = mad(0.9417769908905029f, _46, _51);
    _53 = mad(0.012477199546992779f, _47, _52);
    _54 = _45 * -0.0012105499627068639f;
    _55 = mad(0.017604099586606026f, _46, _54);
    _56 = mad(0.9836069941520691f, _47, _55);
    _57 = _50 * 9.999999747378752e-05f;
    _58 = _53 * 9.999999747378752e-05f;
    _59 = _56 * 9.999999747378752e-05f;
    _60 = saturate(_57);
    _61 = saturate(_58);
    _62 = saturate(_59);
    _63 = log2(_60);
    _64 = log2(_61);
    _65 = log2(_62);
    _66 = _63 * 0.1593017578125f;
    _67 = _64 * 0.1593017578125f;
    _68 = _65 * 0.1593017578125f;
    _69 = exp2(_66);
    _70 = exp2(_67);
    _71 = exp2(_68);
    _72 = _69 * 18.8515625f;
    _73 = _70 * 18.8515625f;
    _74 = _71 * 18.8515625f;
    _75 = _72 + 0.8359375f;
    _76 = _73 + 0.8359375f;
    _77 = _74 + 0.8359375f;
    _78 = _69 * 18.6875f;
    _79 = _70 * 18.6875f;
    _80 = _71 * 18.6875f;
    _81 = _78 + 1.0f;
    _82 = _79 + 1.0f;
    _83 = _80 + 1.0f;
    _84 = _75 / _81;
    _85 = _76 / _82;
    _86 = _77 / _83;
    _87 = log2(_84);
    _88 = log2(_85);
    _89 = log2(_86);
    _90 = _87 * 78.84375f;
    _91 = _88 * 78.84375f;
    _92 = _89 * 78.84375f;
    _93 = exp2(_90);
    _94 = exp2(_91);
    _95 = exp2(_92);
    _96 = saturate(_93);
    _97 = saturate(_94);
    _98 = saturate(_95);
    _111 = _96;
    _112 = _97;
    _113 = _98;
#endif
  } else {
    _101 = log2(_23);
    _102 = log2(_24);
    _103 = log2(_25);
    _104 = _101 * cbUIGlobal_016;
    _105 = _102 * cbUIGlobal_016;
    _106 = _103 * cbUIGlobal_016;
    _107 = exp2(_104);
    _108 = exp2(_105);
    _109 = exp2(_106);
    _111 = _107;
    _112 = _108;
    _113 = _109;
  }
  _114 = _111 * _21;
  _115 = _112 * _21;
  _116 = _113 * _21;
  SV_Target.x = _114;
  SV_Target.y = _115;
  SV_Target.z = _116;
  SV_Target.w = _21;
#endif
  return SV_Target;
}
