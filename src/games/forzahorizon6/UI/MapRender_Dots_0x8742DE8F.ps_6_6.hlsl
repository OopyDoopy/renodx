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
  float _91;
  float _194;
  float _195;
  float _196;
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
  bool _80;
  float _82;
  float _83;
  float _84;
  float _85;
  float _87;
  float _88;
  float _89;
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
  bool _111;
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
  float _184;
  float _185;
  float _186;
  float _187;
  float _188;
  float _189;
  float _190;
  float _191;
  float _192;
  float _197;
  float _198;
  float _199;
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
  _80 = (PSConstants_008 != 0.0f);
  if (_80) {
    _82 = _65 * _65;
    _83 = TEXCOORD.z * TEXCOORD.z;
    _84 = _82 + _83;
    _85 = sqrt(_84);
    _91 = _85;
  } else {
    _87 = abs(TEXCOORD.z);
    _88 = abs(_65);
    _89 = max(_88, _87);
    _91 = _89;
  }
  _92 = _91 * 2.0f;
  _93 = 1.0f - _92;
  _94 = _93 / _77;
  _95 = _94 * 0.5f;
  _96 = _95 + 0.5f;
  _97 = saturate(_96);
  _98 = 0.5f / _77;
  _99 = saturate(_98);
  _100 = _97 * COLOR.w;
  _101 = _100 * _99;
  _102 = _101 * COLOR.x;
  _103 = _101 * COLOR.y;
  _104 = _101 * COLOR.z;
  _105 = _101 + 9.999999747378752e-06f;
  _106 = _102 / _105;
  _107 = _103 / _105;
  _108 = _104 / _105;
#if 1
  SV_Target = GenerateUIOutputColor(_106, _107, _108, _101);
#else
  _111 = (cbUIGlobal_020 != 0.0f);
  [branch]
  if (_111) {
#if 1
    LinearizeUIAndEncodePQ(_106, _107, _108, cbUIGlobal_028, cbUIGlobal_000, _194, _195, _196);
#else
    _114 = abs(_106);
    _115 = abs(_107);
    _116 = abs(_108);
    _117 = log2(_114);
    _118 = log2(_115);
    _119 = log2(_116);
    _120 = _117 * cbUIGlobal_028;
    _121 = _118 * cbUIGlobal_028;
    _122 = _119 * cbUIGlobal_028;
    _123 = exp2(_120);
    _124 = exp2(_121);
    _125 = exp2(_122);
    _128 = cbUIGlobal_000 * _123;
    _129 = cbUIGlobal_000 * _124;
    _130 = cbUIGlobal_000 * _125;
    _131 = _128 * 0.627403974533081f;
    _132 = mad(0.3292819857597351f, _129, _131);
    _133 = mad(0.04331360012292862f, _130, _132);
    _134 = _128 * 0.045745600014925f;
    _135 = mad(0.9417769908905029f, _129, _134);
    _136 = mad(0.012477199546992779f, _130, _135);
    _137 = _128 * -0.0012105499627068639f;
    _138 = mad(0.017604099586606026f, _129, _137);
    _139 = mad(0.9836069941520691f, _130, _138);
    _140 = _133 * 9.999999747378752e-05f;
    _141 = _136 * 9.999999747378752e-05f;
    _142 = _139 * 9.999999747378752e-05f;
    _143 = saturate(_140);
    _144 = saturate(_141);
    _145 = saturate(_142);
    _146 = log2(_143);
    _147 = log2(_144);
    _148 = log2(_145);
    _149 = _146 * 0.1593017578125f;
    _150 = _147 * 0.1593017578125f;
    _151 = _148 * 0.1593017578125f;
    _152 = exp2(_149);
    _153 = exp2(_150);
    _154 = exp2(_151);
    _155 = _152 * 18.8515625f;
    _156 = _153 * 18.8515625f;
    _157 = _154 * 18.8515625f;
    _158 = _155 + 0.8359375f;
    _159 = _156 + 0.8359375f;
    _160 = _157 + 0.8359375f;
    _161 = _152 * 18.6875f;
    _162 = _153 * 18.6875f;
    _163 = _154 * 18.6875f;
    _164 = _161 + 1.0f;
    _165 = _162 + 1.0f;
    _166 = _163 + 1.0f;
    _167 = _158 / _164;
    _168 = _159 / _165;
    _169 = _160 / _166;
    _170 = log2(_167);
    _171 = log2(_168);
    _172 = log2(_169);
    _173 = _170 * 78.84375f;
    _174 = _171 * 78.84375f;
    _175 = _172 * 78.84375f;
    _176 = exp2(_173);
    _177 = exp2(_174);
    _178 = exp2(_175);
    _179 = saturate(_176);
    _180 = saturate(_177);
    _181 = saturate(_178);
    _194 = _179;
    _195 = _180;
    _196 = _181;
#endif
  } else {
    _184 = log2(_106);
    _185 = log2(_107);
    _186 = log2(_108);
    _187 = _184 * cbUIGlobal_016;
    _188 = _185 * cbUIGlobal_016;
    _189 = _186 * cbUIGlobal_016;
    _190 = exp2(_187);
    _191 = exp2(_188);
    _192 = exp2(_189);
    _194 = _190;
    _195 = _191;
    _196 = _192;
  }
  _197 = _194 * _101;
  _198 = _195 * _101;
  _199 = _196 * _101;
  SV_Target.x = _197;
  SV_Target.y = _198;
  SV_Target.z = _199;
  SV_Target.w = _101;
#endif
  return SV_Target;
}
