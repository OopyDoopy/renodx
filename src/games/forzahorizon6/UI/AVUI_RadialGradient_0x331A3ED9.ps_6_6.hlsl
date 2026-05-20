#include "UI.hlsli"

Texture2D<float4> t0 : register(t0);

Texture2D<float4> t1 : register(t1);

cbuffer cb0 : register(b0) {
  float2 cbPixelShader_000 : packoffset(c000.x);
  float2 cbPixelShader_008 : packoffset(c000.z);
  float2 cbPixelShader_016 : packoffset(c001.x);
  float cbPixelShader_024 : packoffset(c001.z);
  float cbPixelShader_028 : packoffset(c001.w);
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
  float _19;
  float _20;
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
  float _36;
  float _37;
  float _38;
  float _39;
  float _40;
  float _41;
  float _42;
  float _43;
  float _44;
  bool _45;
  bool _46;
  bool _47;
  float _59;
  float _169;
  float _170;
  float _171;
  float _49;
  float _50;
  float _51;
  float _52;
  float _53;
  float _54;
  float _55;
  float _56;
  float _57;
  float4 _62;
  float4 _69;
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
  bool _86;
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
  float _139;
  float _140;
  float _141;
  float _142;
  float _143;
  float _144;
  float _145;
  float _146;
  float _147;
  float _148;
  float _149;
  float _150;
  float _151;
  float _152;
  float _153;
  float _154;
  float _155;
  float _156;
  float _159;
  float _160;
  float _161;
  float _162;
  float _163;
  float _164;
  float _165;
  float _166;
  float _167;
  float _172;
  float _173;
  float _174;
  _19 = cbPixelShader_008.x - cbPixelShader_000.x;
  _20 = cbPixelShader_008.y - cbPixelShader_000.y;
  _24 = _19 / cbPixelShader_016.x;
  _25 = _20 / cbPixelShader_016.y;
  _26 = TEXCOORD.x - cbPixelShader_000.x;
  _27 = TEXCOORD.y - cbPixelShader_000.y;
  _28 = _26 / cbPixelShader_016.x;
  _29 = _27 / cbPixelShader_016.y;
  _30 = _24 * _24;
  _31 = 1.0f - _30;
  _32 = _25 * _25;
  _33 = _31 - _32;
  _34 = _28 * _24;
  _35 = _29 * _25;
  _36 = _35 + _34;
  _37 = _36 * 2.0f;
  _38 = _28 * _28;
  _39 = _29 * _29;
  _40 = _39 + _38;
  _41 = _37 * _37;
  _42 = _33 * 4.0f;
  _43 = _42 * _40;
  _44 = _41 + _43;
  _45 = (_44 > 0.0f);
  _46 = (_33 != 0.0f);
  _47 = _46 && _45;
  if (_47) {
    _49 = sqrt(_44);
    _50 = _49 - _37;
    _51 = _33 * 2.0f;
    _52 = _50 / _51;
    _53 = -0.0f - _37;
    _54 = _53 - _49;
    _55 = _54 / _51;
    _56 = max(_52, _55);
    _57 = max(_56, 0.0f);
    _59 = _57;
  } else {
    _59 = 1.0f;
  }
  _62 = t0.Sample(s0, float2(_59, 0.0f));
  _69 = t1.Sample(s1, float2(TEXCOORD.z, TEXCOORD.w));
  _73 = _69.w * TEXCOORD_1;
  _74 = _73 * cbPixelShader_024;
  _75 = _74 * _62.w;
  _76 = _75 * _62.x;
  _77 = _75 * _62.y;
  _78 = _75 * _62.z;
  _79 = _75 * _62.w;
  _80 = _79 + 9.999999747378752e-06f;
  _81 = _76 / _80;
  _82 = _77 / _80;
  _83 = _78 / _80;
#if 1
  SV_Target = GenerateUIOutputColor(_81, _82, _83, _79);
#else
  _86 = (cbUIGlobal_020 != 0.0f);
  [branch]
  if (_86) {
#if 1
    LinearizeUIAndEncodePQ(_81, _82, _83, cbUIGlobal_028, cbUIGlobal_000, _169, _170, _171);
#else
    _89 = abs(_81);
    _90 = abs(_82);
    _91 = abs(_83);
    _92 = log2(_89);
    _93 = log2(_90);
    _94 = log2(_91);
    _95 = _92 * cbUIGlobal_028;
    _96 = _93 * cbUIGlobal_028;
    _97 = _94 * cbUIGlobal_028;
    _98 = exp2(_95);
    _99 = exp2(_96);
    _100 = exp2(_97);
    _103 = cbUIGlobal_000 * _98;
    _104 = cbUIGlobal_000 * _99;
    _105 = cbUIGlobal_000 * _100;
    _106 = _103 * 0.627403974533081f;
    _107 = mad(0.3292819857597351f, _104, _106);
    _108 = mad(0.04331360012292862f, _105, _107);
    _109 = _103 * 0.045745600014925f;
    _110 = mad(0.9417769908905029f, _104, _109);
    _111 = mad(0.012477199546992779f, _105, _110);
    _112 = _103 * -0.0012105499627068639f;
    _113 = mad(0.017604099586606026f, _104, _112);
    _114 = mad(0.9836069941520691f, _105, _113);
    _115 = _108 * 9.999999747378752e-05f;
    _116 = _111 * 9.999999747378752e-05f;
    _117 = _114 * 9.999999747378752e-05f;
    _118 = saturate(_115);
    _119 = saturate(_116);
    _120 = saturate(_117);
    _121 = log2(_118);
    _122 = log2(_119);
    _123 = log2(_120);
    _124 = _121 * 0.1593017578125f;
    _125 = _122 * 0.1593017578125f;
    _126 = _123 * 0.1593017578125f;
    _127 = exp2(_124);
    _128 = exp2(_125);
    _129 = exp2(_126);
    _130 = _127 * 18.8515625f;
    _131 = _128 * 18.8515625f;
    _132 = _129 * 18.8515625f;
    _133 = _130 + 0.8359375f;
    _134 = _131 + 0.8359375f;
    _135 = _132 + 0.8359375f;
    _136 = _127 * 18.6875f;
    _137 = _128 * 18.6875f;
    _138 = _129 * 18.6875f;
    _139 = _136 + 1.0f;
    _140 = _137 + 1.0f;
    _141 = _138 + 1.0f;
    _142 = _133 / _139;
    _143 = _134 / _140;
    _144 = _135 / _141;
    _145 = log2(_142);
    _146 = log2(_143);
    _147 = log2(_144);
    _148 = _145 * 78.84375f;
    _149 = _146 * 78.84375f;
    _150 = _147 * 78.84375f;
    _151 = exp2(_148);
    _152 = exp2(_149);
    _153 = exp2(_150);
    _154 = saturate(_151);
    _155 = saturate(_152);
    _156 = saturate(_153);
    _169 = _154;
    _170 = _155;
    _171 = _156;
#endif
  } else {
    _159 = log2(_81);
    _160 = log2(_82);
    _161 = log2(_83);
    _162 = _159 * cbUIGlobal_016;
    _163 = _160 * cbUIGlobal_016;
    _164 = _161 * cbUIGlobal_016;
    _165 = exp2(_162);
    _166 = exp2(_163);
    _167 = exp2(_164);
    _169 = _165;
    _170 = _166;
    _171 = _167;
  }
  _172 = _169 * _79;
  _173 = _170 * _79;
  _174 = _171 * _79;
  SV_Target.x = _172;
  SV_Target.y = _173;
  SV_Target.z = _174;
  SV_Target.w = _79;
#endif
  return SV_Target;
}
