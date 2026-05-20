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
  float _15;
  bool _21;
  float _104;
  float _105;
  float _106;
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
  float _35;
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
  float _87;
  float _88;
  float _89;
  float _90;
  float _91;
  float _94;
  float _95;
  float _96;
  float _97;
  float _98;
  float _99;
  float _100;
  float _101;
  float _102;
  float _107;
  float _108;
  float _109;
  _11 = t1.Sample(s1, float2(TEXCOORD.z, TEXCOORD.w));
  _15 = cbPixelShader_000.w * _11.w;
#if 1
  SV_Target = GenerateUIOutputColor(cbPixelShader_000.x, cbPixelShader_000.y, cbPixelShader_000.z, _15);
#else
  _21 = (cbUIGlobal_020 != 0.0f);
  [branch]
  if (_21) {
#if 1
    LinearizeUIAndEncodePQ(cbPixelShader_000.x, cbPixelShader_000.y, cbPixelShader_000.z, cbUIGlobal_028, cbUIGlobal_000, _104, _105, _106);
#else
    _24 = abs(cbPixelShader_000.x);
    _25 = abs(cbPixelShader_000.y);
    _26 = abs(cbPixelShader_000.z);
    _27 = log2(_24);
    _28 = log2(_25);
    _29 = log2(_26);
    _30 = _27 * cbUIGlobal_028;
    _31 = _28 * cbUIGlobal_028;
    _32 = _29 * cbUIGlobal_028;
    _33 = exp2(_30);
    _34 = exp2(_31);
    _35 = exp2(_32);
    _38 = cbUIGlobal_000 * _33;
    _39 = cbUIGlobal_000 * _34;
    _40 = cbUIGlobal_000 * _35;
    _41 = _38 * 0.627403974533081f;
    _42 = mad(0.3292819857597351f, _39, _41);
    _43 = mad(0.04331360012292862f, _40, _42);
    _44 = _38 * 0.045745600014925f;
    _45 = mad(0.9417769908905029f, _39, _44);
    _46 = mad(0.012477199546992779f, _40, _45);
    _47 = _38 * -0.0012105499627068639f;
    _48 = mad(0.017604099586606026f, _39, _47);
    _49 = mad(0.9836069941520691f, _40, _48);
    _50 = _43 * 9.999999747378752e-05f;
    _51 = _46 * 9.999999747378752e-05f;
    _52 = _49 * 9.999999747378752e-05f;
    _53 = saturate(_50);
    _54 = saturate(_51);
    _55 = saturate(_52);
    _56 = log2(_53);
    _57 = log2(_54);
    _58 = log2(_55);
    _59 = _56 * 0.1593017578125f;
    _60 = _57 * 0.1593017578125f;
    _61 = _58 * 0.1593017578125f;
    _62 = exp2(_59);
    _63 = exp2(_60);
    _64 = exp2(_61);
    _65 = _62 * 18.8515625f;
    _66 = _63 * 18.8515625f;
    _67 = _64 * 18.8515625f;
    _68 = _65 + 0.8359375f;
    _69 = _66 + 0.8359375f;
    _70 = _67 + 0.8359375f;
    _71 = _62 * 18.6875f;
    _72 = _63 * 18.6875f;
    _73 = _64 * 18.6875f;
    _74 = _71 + 1.0f;
    _75 = _72 + 1.0f;
    _76 = _73 + 1.0f;
    _77 = _68 / _74;
    _78 = _69 / _75;
    _79 = _70 / _76;
    _80 = log2(_77);
    _81 = log2(_78);
    _82 = log2(_79);
    _83 = _80 * 78.84375f;
    _84 = _81 * 78.84375f;
    _85 = _82 * 78.84375f;
    _86 = exp2(_83);
    _87 = exp2(_84);
    _88 = exp2(_85);
    _89 = saturate(_86);
    _90 = saturate(_87);
    _91 = saturate(_88);
    _104 = _89;
    _105 = _90;
    _106 = _91;
#endif
  } else {
    _94 = log2(cbPixelShader_000.x);
    _95 = log2(cbPixelShader_000.y);
    _96 = log2(cbPixelShader_000.z);
    _97 = _94 * cbUIGlobal_016;
    _98 = _95 * cbUIGlobal_016;
    _99 = _96 * cbUIGlobal_016;
    _100 = exp2(_97);
    _101 = exp2(_98);
    _102 = exp2(_99);
    _104 = _100;
    _105 = _101;
    _106 = _102;
  }
  _107 = _104 * _15;
  _108 = _105 * _15;
  _109 = _106 * _15;
  SV_Target.x = _107;
  SV_Target.y = _108;
  SV_Target.z = _109;
  SV_Target.w = _15;
#endif
  return SV_Target;
}
