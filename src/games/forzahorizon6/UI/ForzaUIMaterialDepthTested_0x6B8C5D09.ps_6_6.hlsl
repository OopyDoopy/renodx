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

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

cbuffer cb0 : register(b0) {
  float4 PSConstants_000 : packoffset(c000.x);
  float4 PSConstants_016 : packoffset(c001.x);
  DepthTestSettings PSConstants_032 : packoffset(c002.x);
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
  float _19;
  float _20;
  float _24;
  float _25;
  float _27;
  float _28;
  float _29;
  float _30;
  float _31;
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
  float _45;
  float _46;
  uint _47;
  uint _48;
  float4 _50;
  float _52;
  float _53;
  bool _54;
  float _60;
  float4 _63;
  float _68;
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
  bool _90;
  float _173;
  float _174;
  float _175;
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
  float _157;
  float _158;
  float _159;
  float _160;
  float _163;
  float _164;
  float _165;
  float _166;
  float _167;
  float _168;
  float _169;
  float _170;
  float _171;
  float _176;
  float _177;
  float _178;
  _19 = PSConstants_032.DepthTestSettings_024 * 0.5f;
  _20 = PSConstants_032.DepthTestSettings_028 * 0.5f;
  _24 = TEXCOORD_2.z - _19;
  _25 = TEXCOORD_2.w - _20;
  _27 = PSConstants_032.DepthTestSettings_012 * PSConstants_032.DepthTestSettings_000;
  _28 = _27 * _24;
  _29 = PSConstants_032.DepthTestSettings_012 * PSConstants_032.DepthTestSettings_004;
  _30 = _29 * _25;
  _31 = dot(float2(_28, _30), float2(_28, _30));
  _33 = PSConstants_032.DepthTestSettings_008 * _31;
  _34 = 1.0f - _33;
  _35 = _28 / _34;
  _36 = _30 / _34;
  _37 = 1.0f / PSConstants_032.DepthTestSettings_000;
  _38 = 1.0f / PSConstants_032.DepthTestSettings_004;
  _39 = _37 * _35;
  _40 = _38 * _36;
  _41 = _39 + _19;
  _42 = _40 + _20;
  _43 = _41 * PSConstants_032.DepthTestSettings_016;
  _44 = _42 * PSConstants_032.DepthTestSettings_020;
  _45 = _43 + _19;
  _46 = _44 + _20;
  _47 = uint(_45);
  _48 = uint(_46);
  _50 = t1.Load(int3(_47, _48, 0));
  _52 = 1.0f - SV_Position.z;
  _53 = _52 - _50.x;
  _54 = (_53 < 0.0f);
  if (_54) discard;
  _60 = PSConstants_000.w * TEXCOORD_1.z;
  _63 = t0.Sample(s0, float2(TEXCOORD_2.x, TEXCOORD_2.y));
  _68 = _63.w * _60;
  _74 = _60 * PSConstants_000.x;
  _75 = _74 * _63.x;
  _76 = _75 * PSConstants_016.x;
  _77 = _60 * PSConstants_000.y;
  _78 = _77 * _63.y;
  _79 = _78 * PSConstants_016.y;
  _80 = _60 * PSConstants_000.z;
  _81 = _80 * _63.z;
  _82 = _81 * PSConstants_016.z;
  _83 = _68 * PSConstants_016.w;
  _84 = _83 + 9.999999747378752e-06f;
  _85 = _76 / _84;
  _86 = _79 / _84;
  _87 = _82 / _84;
#if 1
  SV_Target = GenerateUIOutputColor(_85, _86, _87, _83);
#else
  _90 = (cbUIGlobal_020 != 0.0f);
  [branch]
  if (_90) {
#if 1
    LinearizeUIAndEncodePQ(_85, _86, _87, cbUIGlobal_028, cbUIGlobal_000, _173, _174, _175);
#else
    _93 = abs(_85);
    _94 = abs(_86);
    _95 = abs(_87);
    _96 = log2(_93);
    _97 = log2(_94);
    _98 = log2(_95);
    _99 = _96 * cbUIGlobal_028;
    _100 = _97 * cbUIGlobal_028;
    _101 = _98 * cbUIGlobal_028;
    _102 = exp2(_99);
    _103 = exp2(_100);
    _104 = exp2(_101);
    _107 = cbUIGlobal_000 * _102;
    _108 = cbUIGlobal_000 * _103;
    _109 = cbUIGlobal_000 * _104;
    _110 = _107 * 0.627403974533081f;
    _111 = mad(0.3292819857597351f, _108, _110);
    _112 = mad(0.04331360012292862f, _109, _111);
    _113 = _107 * 0.045745600014925f;
    _114 = mad(0.9417769908905029f, _108, _113);
    _115 = mad(0.012477199546992779f, _109, _114);
    _116 = _107 * -0.0012105499627068639f;
    _117 = mad(0.017604099586606026f, _108, _116);
    _118 = mad(0.9836069941520691f, _109, _117);
    _119 = _112 * 9.999999747378752e-05f;
    _120 = _115 * 9.999999747378752e-05f;
    _121 = _118 * 9.999999747378752e-05f;
    _122 = saturate(_119);
    _123 = saturate(_120);
    _124 = saturate(_121);
    _125 = log2(_122);
    _126 = log2(_123);
    _127 = log2(_124);
    _128 = _125 * 0.1593017578125f;
    _129 = _126 * 0.1593017578125f;
    _130 = _127 * 0.1593017578125f;
    _131 = exp2(_128);
    _132 = exp2(_129);
    _133 = exp2(_130);
    _134 = _131 * 18.8515625f;
    _135 = _132 * 18.8515625f;
    _136 = _133 * 18.8515625f;
    _137 = _134 + 0.8359375f;
    _138 = _135 + 0.8359375f;
    _139 = _136 + 0.8359375f;
    _140 = _131 * 18.6875f;
    _141 = _132 * 18.6875f;
    _142 = _133 * 18.6875f;
    _143 = _140 + 1.0f;
    _144 = _141 + 1.0f;
    _145 = _142 + 1.0f;
    _146 = _137 / _143;
    _147 = _138 / _144;
    _148 = _139 / _145;
    _149 = log2(_146);
    _150 = log2(_147);
    _151 = log2(_148);
    _152 = _149 * 78.84375f;
    _153 = _150 * 78.84375f;
    _154 = _151 * 78.84375f;
    _155 = exp2(_152);
    _156 = exp2(_153);
    _157 = exp2(_154);
    _158 = saturate(_155);
    _159 = saturate(_156);
    _160 = saturate(_157);
    _173 = _158;
    _174 = _159;
    _175 = _160;
#endif
  } else {
    _163 = log2(_85);
    _164 = log2(_86);
    _165 = log2(_87);
    _166 = _163 * cbUIGlobal_016;
    _167 = _164 * cbUIGlobal_016;
    _168 = _165 * cbUIGlobal_016;
    _169 = exp2(_166);
    _170 = exp2(_167);
    _171 = exp2(_168);
    _173 = _169;
    _174 = _170;
    _175 = _171;
  }
  _176 = _173 * _83;
  _177 = _174 * _83;
  _178 = _175 * _83;
  SV_Target.x = _176;
  SV_Target.y = _177;
  SV_Target.z = _178;
  SV_Target.w = _83;
#endif
  return SV_Target;
}
