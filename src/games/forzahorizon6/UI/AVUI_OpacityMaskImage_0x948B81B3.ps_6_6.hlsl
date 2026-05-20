#include "UI.hlsli"

Texture2D<float4> t0 : register(t0);

Texture2D<float4> t1 : register(t1);

cbuffer cb0 : register(b0) {
  float2 cbPixelShader_000 : packoffset(c000.x);
  float cbPixelShader_008 : packoffset(c000.z);
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
  float4 _20;
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
  bool _39;
  float _122;
  float _123;
  float _124;
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
  float _108;
  float _109;
  float _112;
  float _113;
  float _114;
  float _115;
  float _116;
  float _117;
  float _118;
  float _119;
  float _120;
  float _125;
  float _126;
  float _127;
  _16 = t0.Sample(s0, float2(TEXCOORD.x, TEXCOORD.y));
  _20 = t1.Sample(s1, float2(TEXCOORD.z, TEXCOORD.w));
  _27 = _16.w * TEXCOORD_1;
  _28 = cbPixelShader_008 * _27;
  _29 = _28 * _20.x;
  _30 = _28 * _20.y;
  _31 = _28 * _20.z;
  _32 = _28 * _20.w;
  _33 = _32 + 9.999999747378752e-06f;
  _34 = _29 / _33;
  _35 = _30 / _33;
  _36 = _31 / _33;
#if 1
  SV_Target = GenerateUIOutputColor(_34, _35, _36, _32);
#else
  _39 = (cbUIGlobal_020 != 0.0f);
  [branch]
  if (_39) {
#if 1
    LinearizeUIAndEncodePQ(_34, _35, _36, cbUIGlobal_028, cbUIGlobal_000, _122, _123, _124);
#else
    _42 = abs(_34);
    _43 = abs(_35);
    _44 = abs(_36);
    _45 = log2(_42);
    _46 = log2(_43);
    _47 = log2(_44);
    _48 = _45 * cbUIGlobal_028;
    _49 = _46 * cbUIGlobal_028;
    _50 = _47 * cbUIGlobal_028;
    _51 = exp2(_48);
    _52 = exp2(_49);
    _53 = exp2(_50);
    _56 = cbUIGlobal_000 * _51;
    _57 = cbUIGlobal_000 * _52;
    _58 = cbUIGlobal_000 * _53;
    _59 = _56 * 0.627403974533081f;
    _60 = mad(0.3292819857597351f, _57, _59);
    _61 = mad(0.04331360012292862f, _58, _60);
    _62 = _56 * 0.045745600014925f;
    _63 = mad(0.9417769908905029f, _57, _62);
    _64 = mad(0.012477199546992779f, _58, _63);
    _65 = _56 * -0.0012105499627068639f;
    _66 = mad(0.017604099586606026f, _57, _65);
    _67 = mad(0.9836069941520691f, _58, _66);
    _68 = _61 * 9.999999747378752e-05f;
    _69 = _64 * 9.999999747378752e-05f;
    _70 = _67 * 9.999999747378752e-05f;
    _71 = saturate(_68);
    _72 = saturate(_69);
    _73 = saturate(_70);
    _74 = log2(_71);
    _75 = log2(_72);
    _76 = log2(_73);
    _77 = _74 * 0.1593017578125f;
    _78 = _75 * 0.1593017578125f;
    _79 = _76 * 0.1593017578125f;
    _80 = exp2(_77);
    _81 = exp2(_78);
    _82 = exp2(_79);
    _83 = _80 * 18.8515625f;
    _84 = _81 * 18.8515625f;
    _85 = _82 * 18.8515625f;
    _86 = _83 + 0.8359375f;
    _87 = _84 + 0.8359375f;
    _88 = _85 + 0.8359375f;
    _89 = _80 * 18.6875f;
    _90 = _81 * 18.6875f;
    _91 = _82 * 18.6875f;
    _92 = _89 + 1.0f;
    _93 = _90 + 1.0f;
    _94 = _91 + 1.0f;
    _95 = _86 / _92;
    _96 = _87 / _93;
    _97 = _88 / _94;
    _98 = log2(_95);
    _99 = log2(_96);
    _100 = log2(_97);
    _101 = _98 * 78.84375f;
    _102 = _99 * 78.84375f;
    _103 = _100 * 78.84375f;
    _104 = exp2(_101);
    _105 = exp2(_102);
    _106 = exp2(_103);
    _107 = saturate(_104);
    _108 = saturate(_105);
    _109 = saturate(_106);
    _122 = _107;
    _123 = _108;
    _124 = _109;
#endif
  } else {
    _112 = log2(_34);
    _113 = log2(_35);
    _114 = log2(_36);
    _115 = _112 * cbUIGlobal_016;
    _116 = _113 * cbUIGlobal_016;
    _117 = _114 * cbUIGlobal_016;
    _118 = exp2(_115);
    _119 = exp2(_116);
    _120 = exp2(_117);
    _122 = _118;
    _123 = _119;
    _124 = _120;
  }
  _125 = _122 * _32;
  _126 = _123 * _32;
  _127 = _124 * _32;
  SV_Target.x = _125;
  SV_Target.y = _126;
  SV_Target.z = _127;
  SV_Target.w = _32;
#endif
  return SV_Target;
}
