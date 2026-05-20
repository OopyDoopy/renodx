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
  float4 _12;
  float _16;
  float _17;
  bool _23;
  float _106;
  float _107;
  float _108;
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
  float _92;
  float _93;
  float _96;
  float _97;
  float _98;
  float _99;
  float _100;
  float _101;
  float _102;
  float _103;
  float _104;
  float _109;
  float _110;
  float _111;
  _12 = t1.Sample(s1, float2(TEXCOORD.z, TEXCOORD.w));
  _16 = _12.w * TEXCOORD_1;
  _17 = _16 * cbPixelShader_000.w;
#if 1
  SV_Target = GenerateUIOutputColor(cbPixelShader_000.x, cbPixelShader_000.y, cbPixelShader_000.z, _17);
#else
  _23 = (cbUIGlobal_020 != 0.0f);
  [branch]
  if (_23) {
#if 1
    LinearizeUIAndEncodePQ(cbPixelShader_000.x, cbPixelShader_000.y, cbPixelShader_000.z, cbUIGlobal_028, cbUIGlobal_000, _106, _107, _108);
#else
    _26 = abs(cbPixelShader_000.x);
    _27 = abs(cbPixelShader_000.y);
    _28 = abs(cbPixelShader_000.z);
    _29 = log2(_26);
    _30 = log2(_27);
    _31 = log2(_28);
    _32 = _29 * cbUIGlobal_028;
    _33 = _30 * cbUIGlobal_028;
    _34 = _31 * cbUIGlobal_028;
    _35 = exp2(_32);
    _36 = exp2(_33);
    _37 = exp2(_34);
    _40 = cbUIGlobal_000 * _35;
    _41 = cbUIGlobal_000 * _36;
    _42 = cbUIGlobal_000 * _37;
    _43 = _40 * 0.627403974533081f;
    _44 = mad(0.3292819857597351f, _41, _43);
    _45 = mad(0.04331360012292862f, _42, _44);
    _46 = _40 * 0.045745600014925f;
    _47 = mad(0.9417769908905029f, _41, _46);
    _48 = mad(0.012477199546992779f, _42, _47);
    _49 = _40 * -0.0012105499627068639f;
    _50 = mad(0.017604099586606026f, _41, _49);
    _51 = mad(0.9836069941520691f, _42, _50);
    _52 = _45 * 9.999999747378752e-05f;
    _53 = _48 * 9.999999747378752e-05f;
    _54 = _51 * 9.999999747378752e-05f;
    _55 = saturate(_52);
    _56 = saturate(_53);
    _57 = saturate(_54);
    _58 = log2(_55);
    _59 = log2(_56);
    _60 = log2(_57);
    _61 = _58 * 0.1593017578125f;
    _62 = _59 * 0.1593017578125f;
    _63 = _60 * 0.1593017578125f;
    _64 = exp2(_61);
    _65 = exp2(_62);
    _66 = exp2(_63);
    _67 = _64 * 18.8515625f;
    _68 = _65 * 18.8515625f;
    _69 = _66 * 18.8515625f;
    _70 = _67 + 0.8359375f;
    _71 = _68 + 0.8359375f;
    _72 = _69 + 0.8359375f;
    _73 = _64 * 18.6875f;
    _74 = _65 * 18.6875f;
    _75 = _66 * 18.6875f;
    _76 = _73 + 1.0f;
    _77 = _74 + 1.0f;
    _78 = _75 + 1.0f;
    _79 = _70 / _76;
    _80 = _71 / _77;
    _81 = _72 / _78;
    _82 = log2(_79);
    _83 = log2(_80);
    _84 = log2(_81);
    _85 = _82 * 78.84375f;
    _86 = _83 * 78.84375f;
    _87 = _84 * 78.84375f;
    _88 = exp2(_85);
    _89 = exp2(_86);
    _90 = exp2(_87);
    _91 = saturate(_88);
    _92 = saturate(_89);
    _93 = saturate(_90);
    _106 = _91;
    _107 = _92;
    _108 = _93;
#endif
  } else {
    _96 = log2(cbPixelShader_000.x);
    _97 = log2(cbPixelShader_000.y);
    _98 = log2(cbPixelShader_000.z);
    _99 = _96 * cbUIGlobal_016;
    _100 = _97 * cbUIGlobal_016;
    _101 = _98 * cbUIGlobal_016;
    _102 = exp2(_99);
    _103 = exp2(_100);
    _104 = exp2(_101);
    _106 = _102;
    _107 = _103;
    _108 = _104;
  }
  _109 = _106 * _17;
  _110 = _107 * _17;
  _111 = _108 * _17;
  SV_Target.x = _109;
  SV_Target.y = _110;
  SV_Target.z = _111;
  SV_Target.w = _17;
#endif
  return SV_Target;
}
