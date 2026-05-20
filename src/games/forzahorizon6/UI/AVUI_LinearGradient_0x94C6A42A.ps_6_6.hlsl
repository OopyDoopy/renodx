#include "UI.hlsli"

Texture2D<float4> t0 : register(t0);

Texture2D<float4> t1 : register(t1);

cbuffer cb0 : register(b0) {
  float cbPixelShader_000 : packoffset(c000.x);
  float3 cbPixelShader_004 : packoffset(c000.y);
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
    linear float4 TEXCOORD: TEXCOORD,
    linear float TEXCOORD_1: TEXCOORD1)
    : SV_Target {
  float4 SV_Target;
  float4 _16;
  float4 _23;
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
  bool _40;
  float _123;
  float _124;
  float _125;
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
  float _108;
  float _109;
  float _110;
  float _113;
  float _114;
  float _115;
  float _116;
  float _117;
  float _118;
  float _119;
  float _120;
  float _121;
  float _126;
  float _127;
  float _128;
  _16 = t0.Sample(s0, float2(TEXCOORD.x, TEXCOORD.y));
  _23 = t1.Sample(s1, float2(TEXCOORD.z, TEXCOORD.w));
  _27 = _16.w * TEXCOORD_1;
  _28 = _27 * _23.w;
  _29 = _28 * cbPixelShader_000;
  _30 = _29 * _16.x;
  _31 = _29 * _16.y;
  _32 = _29 * _16.z;
  _33 = _29 * _16.w;
  _34 = _33 + 9.999999747378752e-06f;
  _35 = _30 / _34;
  _36 = _31 / _34;
  _37 = _32 / _34;
#if 1
  SV_Target = GenerateUIOutputColor(_35, _36, _37, _33);
#else
  _40 = (cbUIGlobal_020 != 0.0f);
  [branch]
  if (_40) {
#if 1
    LinearizeUIAndEncodePQ(_35, _36, _37, cbUIGlobal_028, cbUIGlobal_000, _123, _124, _125);
#else
    _43 = abs(_35);
    _44 = abs(_36);
    _45 = abs(_37);
    _46 = log2(_43);
    _47 = log2(_44);
    _48 = log2(_45);
    _49 = _46 * cbUIGlobal_028;
    _50 = _47 * cbUIGlobal_028;
    _51 = _48 * cbUIGlobal_028;
    _52 = exp2(_49);
    _53 = exp2(_50);
    _54 = exp2(_51);
    _57 = cbUIGlobal_000 * _52;
    _58 = cbUIGlobal_000 * _53;
    _59 = cbUIGlobal_000 * _54;
    _60 = _57 * 0.627403974533081f;
    _61 = mad(0.3292819857597351f, _58, _60);
    _62 = mad(0.04331360012292862f, _59, _61);
    _63 = _57 * 0.045745600014925f;
    _64 = mad(0.9417769908905029f, _58, _63);
    _65 = mad(0.012477199546992779f, _59, _64);
    _66 = _57 * -0.0012105499627068639f;
    _67 = mad(0.017604099586606026f, _58, _66);
    _68 = mad(0.9836069941520691f, _59, _67);
    _69 = _62 * 9.999999747378752e-05f;
    _70 = _65 * 9.999999747378752e-05f;
    _71 = _68 * 9.999999747378752e-05f;
    _72 = saturate(_69);
    _73 = saturate(_70);
    _74 = saturate(_71);
    _75 = log2(_72);
    _76 = log2(_73);
    _77 = log2(_74);
    _78 = _75 * 0.1593017578125f;
    _79 = _76 * 0.1593017578125f;
    _80 = _77 * 0.1593017578125f;
    _81 = exp2(_78);
    _82 = exp2(_79);
    _83 = exp2(_80);
    _84 = _81 * 18.8515625f;
    _85 = _82 * 18.8515625f;
    _86 = _83 * 18.8515625f;
    _87 = _84 + 0.8359375f;
    _88 = _85 + 0.8359375f;
    _89 = _86 + 0.8359375f;
    _90 = _81 * 18.6875f;
    _91 = _82 * 18.6875f;
    _92 = _83 * 18.6875f;
    _93 = _90 + 1.0f;
    _94 = _91 + 1.0f;
    _95 = _92 + 1.0f;
    _96 = _87 / _93;
    _97 = _88 / _94;
    _98 = _89 / _95;
    _99 = log2(_96);
    _100 = log2(_97);
    _101 = log2(_98);
    _102 = _99 * 78.84375f;
    _103 = _100 * 78.84375f;
    _104 = _101 * 78.84375f;
    _105 = exp2(_102);
    _106 = exp2(_103);
    _107 = exp2(_104);
    _108 = saturate(_105);
    _109 = saturate(_106);
    _110 = saturate(_107);
    _123 = _108;
    _124 = _109;
    _125 = _110;
#endif
  } else {
    _113 = log2(_35);
    _114 = log2(_36);
    _115 = log2(_37);
    _116 = _113 * cbUIGlobal_016;
    _117 = _114 * cbUIGlobal_016;
    _118 = _115 * cbUIGlobal_016;
    _119 = exp2(_116);
    _120 = exp2(_117);
    _121 = exp2(_118);
    _123 = _119;
    _124 = _120;
    _125 = _121;
  }
  _126 = _123 * _33;
  _127 = _124 * _33;
  _128 = _125 * _33;
  SV_Target.x = _126;
  SV_Target.y = _127;
  SV_Target.z = _128;
  SV_Target.w = _33;
#endif
  return SV_Target;
}
