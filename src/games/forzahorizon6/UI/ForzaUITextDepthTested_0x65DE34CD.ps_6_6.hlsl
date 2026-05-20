#include "UI.hlsli"

struct DepthTestSettings {
  float DepthTestSettings_000;
  float DepthTestSettings_004;
  float DepthTestSettings_008;
  float DepthTestSettings_012;
  float DepthTestSettings_016;
  float DepthTestSettings_020;
  float DepthTestSettings_024;
  float DepthTestSettings_028;
};

struct PSConstantBufferData {
  float4 PSConstantBufferData_000;
  float4 PSConstantBufferData_016;
};

Texture2D<float4> t1 : register(t1);

cbuffer cb0 : register(b0) {
  PSConstantBufferData PSBuffer_000 : packoffset(c000.x);
};

cbuffer cb2 : register(b2) {
  DepthTestSettings PSBuffer2_000 : packoffset(c000.x);
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
    linear float4 TEXCOORD: TEXCOORD,
    linear float4 TEXCOORD_1: TEXCOORD1,
    linear float4 TEXCOORD_2: TEXCOORD2)
    : SV_Target {
  float4 SV_Target;
  float _19;
  float _20;
  float _21;
  float _22;
  float _23;
  float _24;
  float _25;
  float _26;
  float _30;
  float _31;
  float _32;
  float _33;
  float _35;
  float _36;
  float _37;
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
  uint _53;
  uint _54;
  float4 _56;
  float _58;
  float _59;
  bool _60;
  float _61;
  float _62;
  float _63;
  float _64;
  float _65;
  float _66;
  float _67;
  float _68;
  float _69;
  float _72;
  float _73;
  float _75;
  float _76;
  float _78;
  float _79;
  float _80;
  float _82;
  float _88;
  float _89;
  float _90;
  float _91;
  float _92;
  float _93;
  float _94;
  float _95;
  bool _98;
  float _181;
  float _182;
  float _183;
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
  float _157;
  float _158;
  float _159;
  float _160;
  float _161;
  float _162;
  float _163;
  float _164;
  float _165;
  float _166;
  float _167;
  float _168;
  float _171;
  float _172;
  float _173;
  float _174;
  float _175;
  float _176;
  float _177;
  float _178;
  float _179;
  float _184;
  float _185;
  float _186;
  _19 = PSBuffer2_000.DepthTestSettings_024 * SV_Position.x;
  _20 = PSBuffer2_000.DepthTestSettings_028 * SV_Position.y;
  _21 = _19 / PSBuffer2_000.DepthTestSettings_016;
  _22 = _20 / PSBuffer2_000.DepthTestSettings_020;
  _23 = saturate(_21);
  _24 = saturate(_22);
  _25 = PSBuffer2_000.DepthTestSettings_024 * 0.5f;
  _26 = PSBuffer2_000.DepthTestSettings_028 * 0.5f;
  _30 = _23 - _25;
  _31 = _24 - _26;
  _32 = PSBuffer2_000.DepthTestSettings_000 * _30;
  _33 = PSBuffer2_000.DepthTestSettings_004 * _31;
  _35 = _32 * PSBuffer2_000.DepthTestSettings_012;
  _36 = _33 * PSBuffer2_000.DepthTestSettings_012;
  _37 = dot(float2(_35, _36), float2(_35, _36));
  _39 = PSBuffer2_000.DepthTestSettings_008 * _37;
  _40 = 1.0f - _39;
  _41 = _35 / _40;
  _42 = _36 / _40;
  _43 = 1.0f / PSBuffer2_000.DepthTestSettings_000;
  _44 = 1.0f / PSBuffer2_000.DepthTestSettings_004;
  _45 = _43 * _41;
  _46 = _44 * _42;
  _47 = _45 + _25;
  _48 = _46 + _26;
  _49 = _47 * PSBuffer2_000.DepthTestSettings_016;
  _50 = _48 * PSBuffer2_000.DepthTestSettings_020;
  _51 = _49 + _25;
  _52 = _50 + _26;
  _53 = uint(_51);
  _54 = uint(_52);
  _56 = t1.Load(int3(_53, _54, 0));
  _58 = 1.0f - SV_Position.z;
  _59 = _58 - _56.x;
  _60 = (_59 < 0.0f);
  if (_60) discard;
  _61 = TEXCOORD.x * TEXCOORD.x;
  _62 = TEXCOORD.y - _61;
  _63 = _62 * TEXCOORD.z;
  _64 = ddx_coarse(_63);
  _65 = ddy_coarse(_63);
  _66 = _64 * _64;
  _67 = _65 * _65;
  _68 = _67 + _66;
  _69 = sqrt(_68);
  _72 = PSBuffer_000.PSConstantBufferData_000.x * _69;
  _73 = _63 / _72;
  _75 = PSBuffer_000.PSConstantBufferData_000.y + _73;
  _76 = saturate(_75);
  _78 = log2(_76);
  _79 = _78 * PSBuffer_000.PSConstantBufferData_000.z;
  _80 = exp2(_79);
  _82 = _80 * PSBuffer_000.PSConstantBufferData_000.w;
  _88 = _82 * PSBuffer_000.PSConstantBufferData_016.w;
  _89 = _88 * PSBuffer_000.PSConstantBufferData_016.x;
  _90 = _88 * PSBuffer_000.PSConstantBufferData_016.y;
  _91 = _88 * PSBuffer_000.PSConstantBufferData_016.z;
  _92 = _88 + 9.999999747378752e-06f;
  _93 = _89 / _92;
  _94 = _90 / _92;
  _95 = _91 / _92;
#if 1
  SV_Target = GenerateUIOutputColor(_93, _94, _95, _88);
#else
  _98 = (cbUIGlobal_020 != 0.0f);
  [branch]
  if (_98) {
#if 1
    LinearizeUIAndEncodePQ(_93, _94, _95, cbUIGlobal_028, cbUIGlobal_000, _181, _182, _183);
#else
    _101 = abs(_93);
    _102 = abs(_94);
    _103 = abs(_95);
    _104 = log2(_101);
    _105 = log2(_102);
    _106 = log2(_103);
    _107 = _104 * cbUIGlobal_028;
    _108 = _105 * cbUIGlobal_028;
    _109 = _106 * cbUIGlobal_028;
    _110 = exp2(_107);
    _111 = exp2(_108);
    _112 = exp2(_109);
    _115 = cbUIGlobal_000 * _110;
    _116 = cbUIGlobal_000 * _111;
    _117 = cbUIGlobal_000 * _112;
    _118 = _115 * 0.627403974533081f;
    _119 = mad(0.3292819857597351f, _116, _118);
    _120 = mad(0.04331360012292862f, _117, _119);
    _121 = _115 * 0.045745600014925f;
    _122 = mad(0.9417769908905029f, _116, _121);
    _123 = mad(0.012477199546992779f, _117, _122);
    _124 = _115 * -0.0012105499627068639f;
    _125 = mad(0.017604099586606026f, _116, _124);
    _126 = mad(0.9836069941520691f, _117, _125);
    _127 = _120 * 9.999999747378752e-05f;
    _128 = _123 * 9.999999747378752e-05f;
    _129 = _126 * 9.999999747378752e-05f;
    _130 = saturate(_127);
    _131 = saturate(_128);
    _132 = saturate(_129);
    _133 = log2(_130);
    _134 = log2(_131);
    _135 = log2(_132);
    _136 = _133 * 0.1593017578125f;
    _137 = _134 * 0.1593017578125f;
    _138 = _135 * 0.1593017578125f;
    _139 = exp2(_136);
    _140 = exp2(_137);
    _141 = exp2(_138);
    _142 = _139 * 18.8515625f;
    _143 = _140 * 18.8515625f;
    _144 = _141 * 18.8515625f;
    _145 = _142 + 0.8359375f;
    _146 = _143 + 0.8359375f;
    _147 = _144 + 0.8359375f;
    _148 = _139 * 18.6875f;
    _149 = _140 * 18.6875f;
    _150 = _141 * 18.6875f;
    _151 = _148 + 1.0f;
    _152 = _149 + 1.0f;
    _153 = _150 + 1.0f;
    _154 = _145 / _151;
    _155 = _146 / _152;
    _156 = _147 / _153;
    _157 = log2(_154);
    _158 = log2(_155);
    _159 = log2(_156);
    _160 = _157 * 78.84375f;
    _161 = _158 * 78.84375f;
    _162 = _159 * 78.84375f;
    _163 = exp2(_160);
    _164 = exp2(_161);
    _165 = exp2(_162);
    _166 = saturate(_163);
    _167 = saturate(_164);
    _168 = saturate(_165);
    _181 = _166;
    _182 = _167;
    _183 = _168;
#endif
  } else {
    _171 = log2(_93);
    _172 = log2(_94);
    _173 = log2(_95);
    _174 = _171 * cbUIGlobal_016;
    _175 = _172 * cbUIGlobal_016;
    _176 = _173 * cbUIGlobal_016;
    _177 = exp2(_174);
    _178 = exp2(_175);
    _179 = exp2(_176);
    _181 = _177;
    _182 = _178;
    _183 = _179;
  }
  _184 = _181 * _88;
  _185 = _182 * _88;
  _186 = _183 * _88;
  SV_Target.x = _184;
  SV_Target.y = _185;
  SV_Target.z = _186;
  SV_Target.w = _88;
#endif
  return SV_Target;
}
