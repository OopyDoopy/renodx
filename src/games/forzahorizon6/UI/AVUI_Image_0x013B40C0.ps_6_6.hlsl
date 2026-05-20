#include "UI.hlsli"

Texture2D<float4> t0 : register(t0);

Texture2D<float4> t1 : register(t1);

cbuffer cb0 : register(b0) {
  float2 cbPixelShader_000 : packoffset(c000.x);
  float cbPixelShader_008 : packoffset(c000.z);
  float cbPixelShader_012 : packoffset(c000.w);
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
  float _13;
  float _14;
  float _15;
  float _16;
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
  float4 _32;
  float _37;
  float _38;
  float _39;
  float _40;
  float _41;
  float _42;
  float _43;
  float _44;
  bool _45;
  float _57;
  float _151;
  float _152;
  float _153;
  float4 _49;
  float _54;
  float _55;
  float _58;
  float _59;
  float _60;
  float _61;
  float _62;
  float _63;
  float _64;
  float _65;
  bool _68;
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
  float _116;
  float _117;
  float _118;
  float _119;
  float _120;
  float _121;
  float _122;
  float _123;
  float _124;
  float _125;
  float _126;
  float _127;
  float _128;
  float _129;
  float _130;
  float _131;
  float _132;
  float _133;
  float _134;
  float _135;
  float _136;
  float _137;
  float _138;
  float _141;
  float _142;
  float _143;
  float _144;
  float _145;
  float _146;
  float _147;
  float _148;
  float _149;
  float _154;
  float _155;
  float _156;
  _13 = floor(TEXCOORD.x);
  _14 = floor(TEXCOORD.y);
  _15 = TEXCOORD.x - _13;
  _16 = TEXCOORD.y - _14;
  _20 = 1.0f - cbPixelShader_000.x;
  _21 = 1.0f - cbPixelShader_000.y;
  _22 = _20 * 0.5f;
  _23 = _21 * 0.5f;
  _24 = _15 - _22;
  _25 = _16 - _23;
  _26 = _24 / cbPixelShader_000.x;
  _27 = _25 / cbPixelShader_000.y;
  _28 = _26 + _13;
  _29 = _27 + _14;
  _32 = t0.Sample(s0, float2(_28, _29));
  _37 = saturate(_26);
  _38 = saturate(_27);
  _39 = _37 - _26;
  _40 = _38 - _27;
  _41 = _39 * _39;
  _42 = _40 * _40;
  _43 = _42 + _41;
  _44 = sqrt(_43);
  _45 = (_44 > 9.999999747378752e-06f);
  if (!(_45)) {
    _49 = t1.Sample(s1, float2(TEXCOORD.z, TEXCOORD.w));
    _54 = TEXCOORD_1 * _49.w;
    _55 = _54 * cbPixelShader_008;
    _57 = _55;
  } else {
    _57 = 0.0f;
  }
  _58 = _57 * _32.x;
  _59 = _57 * _32.y;
  _60 = _57 * _32.z;
  _61 = _57 * _32.w;
  _62 = _61 + 9.999999747378752e-06f;
  _63 = _58 / _62;
  _64 = _59 / _62;
  _65 = _60 / _62;
#if 1
  SV_Target = GenerateUIOutputColor(_63, _64, _65, _61);
#else
  _68 = (cbUIGlobal_020 != 0.0f);
  [branch]
  if (_68) {
#if 1
    LinearizeUIAndEncodePQ(_63, _64, _65, cbUIGlobal_028, cbUIGlobal_000, _151, _152, _153);
#else
    _71 = abs(_63);
    _72 = abs(_64);
    _73 = abs(_65);
    _74 = log2(_71);
    _75 = log2(_72);
    _76 = log2(_73);
    _77 = _74 * cbUIGlobal_028;
    _78 = _75 * cbUIGlobal_028;
    _79 = _76 * cbUIGlobal_028;
    _80 = exp2(_77);
    _81 = exp2(_78);
    _82 = exp2(_79);
    _85 = cbUIGlobal_000 * _80;
    _86 = cbUIGlobal_000 * _81;
    _87 = cbUIGlobal_000 * _82;
    _88 = _85 * 0.627403974533081f;
    _89 = mad(0.3292819857597351f, _86, _88);
    _90 = mad(0.04331360012292862f, _87, _89);
    _91 = _85 * 0.045745600014925f;
    _92 = mad(0.9417769908905029f, _86, _91);
    _93 = mad(0.012477199546992779f, _87, _92);
    _94 = _85 * -0.0012105499627068639f;
    _95 = mad(0.017604099586606026f, _86, _94);
    _96 = mad(0.9836069941520691f, _87, _95);
    _97 = _90 * 9.999999747378752e-05f;
    _98 = _93 * 9.999999747378752e-05f;
    _99 = _96 * 9.999999747378752e-05f;
    _100 = saturate(_97);
    _101 = saturate(_98);
    _102 = saturate(_99);
    _103 = log2(_100);
    _104 = log2(_101);
    _105 = log2(_102);
    _106 = _103 * 0.1593017578125f;
    _107 = _104 * 0.1593017578125f;
    _108 = _105 * 0.1593017578125f;
    _109 = exp2(_106);
    _110 = exp2(_107);
    _111 = exp2(_108);
    _112 = _109 * 18.8515625f;
    _113 = _110 * 18.8515625f;
    _114 = _111 * 18.8515625f;
    _115 = _112 + 0.8359375f;
    _116 = _113 + 0.8359375f;
    _117 = _114 + 0.8359375f;
    _118 = _109 * 18.6875f;
    _119 = _110 * 18.6875f;
    _120 = _111 * 18.6875f;
    _121 = _118 + 1.0f;
    _122 = _119 + 1.0f;
    _123 = _120 + 1.0f;
    _124 = _115 / _121;
    _125 = _116 / _122;
    _126 = _117 / _123;
    _127 = log2(_124);
    _128 = log2(_125);
    _129 = log2(_126);
    _130 = _127 * 78.84375f;
    _131 = _128 * 78.84375f;
    _132 = _129 * 78.84375f;
    _133 = exp2(_130);
    _134 = exp2(_131);
    _135 = exp2(_132);
    _136 = saturate(_133);
    _137 = saturate(_134);
    _138 = saturate(_135);
    _151 = _136;
    _152 = _137;
    _153 = _138;
#endif
  } else {
    _141 = log2(_63);
    _142 = log2(_64);
    _143 = log2(_65);
    _144 = _141 * cbUIGlobal_016;
    _145 = _142 * cbUIGlobal_016;
    _146 = _143 * cbUIGlobal_016;
    _147 = exp2(_144);
    _148 = exp2(_145);
    _149 = exp2(_146);
    _151 = _147;
    _152 = _148;
    _153 = _149;
  }
  _154 = _151 * _61;
  _155 = _152 * _61;
  _156 = _153 * _61;
  SV_Target.x = _154;
  SV_Target.y = _155;
  SV_Target.z = _156;
  SV_Target.w = _61;
#endif
  return SV_Target;
}
