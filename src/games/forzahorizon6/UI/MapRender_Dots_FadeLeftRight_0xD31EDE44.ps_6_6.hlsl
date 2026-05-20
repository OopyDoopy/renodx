#include "UI.hlsli"

cbuffer cb0 : register(b0) {
  float PSConstants_000 : packoffset(c000.x);
  float PSConstants_004 : packoffset(c000.y);
  float PSConstants_008 : packoffset(c000.z);
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
    linear float4 COLOR: COLOR,
    linear float4 TEXCOORD: TEXCOORD)
    : SV_Target {
  float4 SV_Target;
  float _14;
  float _15;
  float _16;
  float _17;
  float _18;
  float _20;
  float _21;
  float _22;
  float _23;
  bool _24;
  float _56;
  float _57;
  float _58;
  float _65;
  float _90;
  float _200;
  float _201;
  float _202;
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
  bool _39;
  float _40;
  float _41;
  float _42;
  float _43;
  float _44;
  float _45;
  float _46;
  float _47;
  float _48;
  bool _50;
  float _52;
  float _53;
  float _54;
  bool _59;
  bool _61;
  float _63;
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
  bool _84;
  float _86;
  float _87;
  float _88;
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
  bool _117;
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
  float _169;
  float _170;
  float _171;
  float _172;
  float _173;
  float _174;
  float _175;
  float _176;
  float _177;
  float _178;
  float _179;
  float _180;
  float _181;
  float _182;
  float _183;
  float _184;
  float _185;
  float _186;
  float _187;
  float _190;
  float _191;
  float _192;
  float _193;
  float _194;
  float _195;
  float _196;
  float _197;
  float _198;
  float _203;
  float _204;
  float _205;
  _14 = PSConstants_004 * 0.5f;
  _15 = TEXCOORD.x + -0.5f;
  _16 = _15 - _14;
  _17 = TEXCOORD.w + -1.0f;
  _18 = _17 - PSConstants_004;
  _20 = PSConstants_000 + 1.0f;
  _21 = _20 + PSConstants_004;
  _22 = TEXCOORD.w / _21;
  _23 = floor(_22);
  _24 = (_23 > 1.0f);
  if (_24) {
    _26 = _18 + 1.0f;
    _27 = _20 * _23;
    _28 = _26 - _27;
    _29 = _23 + -1.0f;
    _30 = _28 / _29;
    _31 = max(0.0f, _30);
    _32 = _20 + _31;
    _33 = _32 * 0.5f;
    _34 = PSConstants_000 * 0.5f;
    _35 = _16 - _34;
    _36 = _35 + _33;
    _37 = _36 / _32;
    _38 = -0.0f - _37;
    _39 = (_37 >= _38);
    _40 = abs(_37);
    _41 = frac(_40);
    _42 = -0.0f - _41;
    _43 = select(_39, _41, _42);
    _44 = _43 + -0.5f;
    _45 = _44 * _32;
    _46 = abs(_45);
    _47 = _46 - _34;
    _48 = max(_47, 0.0f);
    _56 = _16;
    _57 = _18;
    _58 = _48;
  } else {
    _50 = (_23 == 0.0f);
    if (_50) {
      _52 = PSConstants_004 * 0.25f;
      _53 = _16 + _52;
      _54 = _14 + _18;
      _56 = _53;
      _57 = _54;
      _58 = 0.0f;
    } else {
      _56 = _16;
      _57 = _18;
      _58 = 0.0f;
    }
  }
  _59 = (_56 < 0.0f);
  if (!(_59)) {
    _61 = (_56 > _57);
    if (_61) {
      _63 = _56 - _57;
      _65 = _63;
    } else {
      _65 = _58;
    }
  } else {
    _65 = _56;
  }
  _66 = ddx_coarse(_65);
  _67 = ddx_coarse(TEXCOORD.z);
  _68 = ddy_coarse(_65);
  _69 = ddy_coarse(TEXCOORD.z);
  _70 = _66 * _66;
  _71 = _67 * _67;
  _72 = _71 + _70;
  _73 = _68 * _68;
  _74 = _72 + _73;
  _75 = _69 * _69;
  _76 = _74 + _75;
  _77 = sqrt(_76);
  _78 = _65 * _65;
  _79 = TEXCOORD.z * TEXCOORD.z;
  _80 = _78 + _79;
  _81 = sqrt(_80);
  _84 = (PSConstants_008 != 0.0f);
  if (!(_84)) {
    _86 = abs(TEXCOORD.z);
    _87 = abs(_65);
    _88 = max(_87, _86);
    _90 = _88;
  } else {
    _90 = _81;
  }
  _91 = _90 * 2.0f;
  _92 = 1.0f - _91;
  _93 = _92 / _77;
  _94 = _93 * 0.5f;
  _95 = _94 + 0.5f;
  _96 = saturate(_95);
  _97 = _81 * 2.0f;
  _98 = 2.0f - _97;
  _99 = saturate(_98);
  _100 = _99 * 0.75f;
  _101 = 1.0f - _100;
  _102 = _101 * _96;
  _103 = _102 + _100;
  _104 = 0.5f / _77;
  _105 = saturate(_104);
  _106 = _105 * COLOR.w;
  _107 = _106 * _103;
  _108 = _107 * COLOR.x;
  _109 = _107 * COLOR.y;
  _110 = _107 * COLOR.z;
  _111 = _107 + 9.999999747378752e-06f;
  _112 = _108 / _111;
  _113 = _109 / _111;
  _114 = _110 / _111;
#if 1
  SV_Target = GenerateUIOutputColor(_112, _113, _114, _107);
#else
  _117 = (cbUIGlobal_020 != 0.0f);
  [branch]
  if (_117) {
#if 1
    LinearizeUIAndEncodePQ(_112, _113, _114, cbUIGlobal_028, cbUIGlobal_000, _200, _201, _202);
#else
    _120 = abs(_112);
    _121 = abs(_113);
    _122 = abs(_114);
    _123 = log2(_120);
    _124 = log2(_121);
    _125 = log2(_122);
    _126 = _123 * cbUIGlobal_028;
    _127 = _124 * cbUIGlobal_028;
    _128 = _125 * cbUIGlobal_028;
    _129 = exp2(_126);
    _130 = exp2(_127);
    _131 = exp2(_128);
    _134 = cbUIGlobal_000 * _129;
    _135 = cbUIGlobal_000 * _130;
    _136 = cbUIGlobal_000 * _131;
    _137 = _134 * 0.627403974533081f;
    _138 = mad(0.3292819857597351f, _135, _137);
    _139 = mad(0.04331360012292862f, _136, _138);
    _140 = _134 * 0.045745600014925f;
    _141 = mad(0.9417769908905029f, _135, _140);
    _142 = mad(0.012477199546992779f, _136, _141);
    _143 = _134 * -0.0012105499627068639f;
    _144 = mad(0.017604099586606026f, _135, _143);
    _145 = mad(0.9836069941520691f, _136, _144);
    _146 = _139 * 9.999999747378752e-05f;
    _147 = _142 * 9.999999747378752e-05f;
    _148 = _145 * 9.999999747378752e-05f;
    _149 = saturate(_146);
    _150 = saturate(_147);
    _151 = saturate(_148);
    _152 = log2(_149);
    _153 = log2(_150);
    _154 = log2(_151);
    _155 = _152 * 0.1593017578125f;
    _156 = _153 * 0.1593017578125f;
    _157 = _154 * 0.1593017578125f;
    _158 = exp2(_155);
    _159 = exp2(_156);
    _160 = exp2(_157);
    _161 = _158 * 18.8515625f;
    _162 = _159 * 18.8515625f;
    _163 = _160 * 18.8515625f;
    _164 = _161 + 0.8359375f;
    _165 = _162 + 0.8359375f;
    _166 = _163 + 0.8359375f;
    _167 = _158 * 18.6875f;
    _168 = _159 * 18.6875f;
    _169 = _160 * 18.6875f;
    _170 = _167 + 1.0f;
    _171 = _168 + 1.0f;
    _172 = _169 + 1.0f;
    _173 = _164 / _170;
    _174 = _165 / _171;
    _175 = _166 / _172;
    _176 = log2(_173);
    _177 = log2(_174);
    _178 = log2(_175);
    _179 = _176 * 78.84375f;
    _180 = _177 * 78.84375f;
    _181 = _178 * 78.84375f;
    _182 = exp2(_179);
    _183 = exp2(_180);
    _184 = exp2(_181);
    _185 = saturate(_182);
    _186 = saturate(_183);
    _187 = saturate(_184);
    _200 = _185;
    _201 = _186;
    _202 = _187;
#endif
  } else {
    _190 = log2(_112);
    _191 = log2(_113);
    _192 = log2(_114);
    _193 = _190 * cbUIGlobal_016;
    _194 = _191 * cbUIGlobal_016;
    _195 = _192 * cbUIGlobal_016;
    _196 = exp2(_193);
    _197 = exp2(_194);
    _198 = exp2(_195);
    _200 = _196;
    _201 = _197;
    _202 = _198;
  }
  _203 = _200 * _107;
  _204 = _201 * _107;
  _205 = _202 * _107;
  SV_Target.x = _203;
  SV_Target.y = _204;
  SV_Target.z = _205;
  SV_Target.w = _107;
#endif
  return SV_Target;
}
