#include "UI.hlsli"

Texture2D<float4> t0 : register(t0);

Texture2D<float4> t1 : register(t1);

cbuffer cb0 : register(b0) {
  float4 PSConstants_000 : packoffset(c000.x);
  float4 PSConstants_016 : packoffset(c001.x);
  float4 PSConstants_032 : packoffset(c002.x);
  float2 PSConstants_048 : packoffset(c003.x);
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
    linear float3 TEXCOORD_1: TEXCOORD1,
    linear float4 TEXCOORD_2: TEXCOORD2)
    : SV_Target {
  float4 SV_Target;
  float4 _15;
  float4 _21;
  float _26;
  float _27;
  float _28;
  float _33;
  float _34;
  float _35;
  float _41;
  float _42;
  float _43;
  float _44;
  float _45;
  float _46;
  float _47;
  float _48;
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
  bool _82;
  float _165;
  float _166;
  float _167;
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
  float _155;
  float _156;
  float _157;
  float _158;
  float _159;
  float _160;
  float _161;
  float _162;
  float _163;
  float _168;
  float _169;
  float _170;
  _15 = t0.Sample(s0, float2(TEXCOORD_2.z, TEXCOORD_2.w));
  _21 = t1.Sample(s0, float2(TEXCOORD_2.x, TEXCOORD_2.y));
  _26 = _21.x * TEXCOORD_1.z;
  _27 = _21.y * TEXCOORD_1.z;
  _28 = _21.z * TEXCOORD_1.z;
  _33 = _26 * PSConstants_000.x;
  _34 = _27 * PSConstants_000.y;
  _35 = _28 * PSConstants_000.z;
  _41 = PSConstants_016.x * _15.x;
  _42 = PSConstants_016.y * _15.y;
  _43 = PSConstants_016.z * _15.z;
  _44 = PSConstants_016.w * _21.w;
  _45 = _44 * TEXCOORD_1.z;
  _46 = _41 * _45;
  _47 = _42 * _45;
  _48 = _43 * _45;
  _50 = _33 - _46;
  _51 = _34 - _47;
  _52 = _35 - _48;
  _53 = _21.w - _44;
  _54 = _50 * PSConstants_000.w;
  _55 = _51 * PSConstants_000.w;
  _56 = _52 * PSConstants_000.w;
  _57 = PSConstants_000.w * TEXCOORD_1.z;
  _58 = _57 * _53;
  _59 = _54 + _46;
  _60 = _55 + _47;
  _61 = _56 + _48;
  _62 = _58 + _45;
  _68 = PSConstants_032.x * PSConstants_032.x;
  _69 = _68 * _59;
  _70 = PSConstants_032.y * PSConstants_032.y;
  _71 = _70 * _60;
  _72 = PSConstants_032.z * PSConstants_032.z;
  _73 = _72 * _61;
  _74 = PSConstants_032.w * PSConstants_032.w;
  _75 = _74 * _62;
  _76 = _75 + 9.999999747378752e-06f;
  _77 = _69 / _76;
  _78 = _71 / _76;
  _79 = _73 / _76;
#if 1
  SV_Target = GenerateUIOutputColor(_77, _78, _79, _75);
#else
  _82 = (cbUIGlobal_020 != 0.0f);
  [branch]
  if (_82) {
#if 1
    LinearizeUIAndEncodePQ(_77, _78, _79, cbUIGlobal_028, cbUIGlobal_000, _165, _166, _167);
#else
    _85 = abs(_77);
    _86 = abs(_78);
    _87 = abs(_79);
    _88 = log2(_85);
    _89 = log2(_86);
    _90 = log2(_87);
    _91 = _88 * cbUIGlobal_028;
    _92 = _89 * cbUIGlobal_028;
    _93 = _90 * cbUIGlobal_028;
    _94 = exp2(_91);
    _95 = exp2(_92);
    _96 = exp2(_93);
    _99 = cbUIGlobal_000 * _94;
    _100 = cbUIGlobal_000 * _95;
    _101 = cbUIGlobal_000 * _96;
    _102 = _99 * 0.627403974533081f;
    _103 = mad(0.3292819857597351f, _100, _102);
    _104 = mad(0.04331360012292862f, _101, _103);
    _105 = _99 * 0.045745600014925f;
    _106 = mad(0.9417769908905029f, _100, _105);
    _107 = mad(0.012477199546992779f, _101, _106);
    _108 = _99 * -0.0012105499627068639f;
    _109 = mad(0.017604099586606026f, _100, _108);
    _110 = mad(0.9836069941520691f, _101, _109);
    _111 = _104 * 9.999999747378752e-05f;
    _112 = _107 * 9.999999747378752e-05f;
    _113 = _110 * 9.999999747378752e-05f;
    _114 = saturate(_111);
    _115 = saturate(_112);
    _116 = saturate(_113);
    _117 = log2(_114);
    _118 = log2(_115);
    _119 = log2(_116);
    _120 = _117 * 0.1593017578125f;
    _121 = _118 * 0.1593017578125f;
    _122 = _119 * 0.1593017578125f;
    _123 = exp2(_120);
    _124 = exp2(_121);
    _125 = exp2(_122);
    _126 = _123 * 18.8515625f;
    _127 = _124 * 18.8515625f;
    _128 = _125 * 18.8515625f;
    _129 = _126 + 0.8359375f;
    _130 = _127 + 0.8359375f;
    _131 = _128 + 0.8359375f;
    _132 = _123 * 18.6875f;
    _133 = _124 * 18.6875f;
    _134 = _125 * 18.6875f;
    _135 = _132 + 1.0f;
    _136 = _133 + 1.0f;
    _137 = _134 + 1.0f;
    _138 = _129 / _135;
    _139 = _130 / _136;
    _140 = _131 / _137;
    _141 = log2(_138);
    _142 = log2(_139);
    _143 = log2(_140);
    _144 = _141 * 78.84375f;
    _145 = _142 * 78.84375f;
    _146 = _143 * 78.84375f;
    _147 = exp2(_144);
    _148 = exp2(_145);
    _149 = exp2(_146);
    _150 = saturate(_147);
    _151 = saturate(_148);
    _152 = saturate(_149);
    _165 = _150;
    _166 = _151;
    _167 = _152;
#endif
  } else {
    _155 = log2(_77);
    _156 = log2(_78);
    _157 = log2(_79);
    _158 = _155 * cbUIGlobal_016;
    _159 = _156 * cbUIGlobal_016;
    _160 = _157 * cbUIGlobal_016;
    _161 = exp2(_158);
    _162 = exp2(_159);
    _163 = exp2(_160);
    _165 = _161;
    _166 = _162;
    _167 = _163;
  }
  _168 = _165 * _75;
  _169 = _166 * _75;
  _170 = _167 * _75;
  SV_Target.x = _168;
  SV_Target.y = _169;
  SV_Target.z = _170;
  SV_Target.w = _75;
#endif
  return SV_Target;
}
