#include "UI.hlsli"

Texture2D<float4> t0 : register(t0);

cbuffer cb0 : register(b0) {
  float PSConstants_000 : packoffset(c000.x);
  float PSConstants_004 : packoffset(c000.y);
  float PSConstants_008 : packoffset(c000.z);
  float PSConstants_012 : packoffset(c000.w);
  float3 PSConstants_016 : packoffset(c001.x);
  float PSConstants_028 : packoffset(c001.w);
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
    linear float4 COLOR: COLOR,
    linear float4 TEXCOORD_1: TEXCOORD1,
    linear float2 TEXCOORD_2: TEXCOORD2)
    : SV_Target {
  float4 SV_Target;
  float4 _18;
  bool _20;
  float _30;
  float _31;
  float _74;
  float _75;
  float _76;
  float _85;
  float _110;
  float _233;
  float _234;
  float _235;
  float _24;
  float _25;
  float _26;
  float _27;
  float _28;
  float _34;
  float _35;
  float _37;
  float _38;
  float _39;
  float _40;
  bool _41;
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
  bool _55;
  float _56;
  float _57;
  float _58;
  float _59;
  float _60;
  float _61;
  float _62;
  float _63;
  float _64;
  bool _66;
  bool _67;
  float _69;
  float _70;
  float _71;
  float _72;
  bool _77;
  float _79;
  float _80;
  bool _81;
  float _83;
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
  bool _104;
  float _106;
  float _107;
  float _108;
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
  bool _150;
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
  float _188;
  float _189;
  float _190;
  float _191;
  float _192;
  float _193;
  float _194;
  float _195;
  float _196;
  float _197;
  float _198;
  float _199;
  float _200;
  float _201;
  float _202;
  float _203;
  float _204;
  float _205;
  float _206;
  float _207;
  float _208;
  float _209;
  float _210;
  float _211;
  float _212;
  float _213;
  float _214;
  float _215;
  float _216;
  float _217;
  float _218;
  float _219;
  float _220;
  float _223;
  float _224;
  float _225;
  float _226;
  float _227;
  float _228;
  float _229;
  float _230;
  float _231;
  float _236;
  float _237;
  float _238;
  _18 = t0.Sample(s0, float2(TEXCOORD_2.x, TEXCOORD_2.y));
  _20 = (_18.x < 0.8999999761581421f);
  if (_20) {
    _24 = PSConstants_004 * 0.5f;
    _25 = TEXCOORD_1.x + -0.5f;
    _26 = _25 - _24;
    _27 = TEXCOORD_1.w + -1.0f;
    _28 = _27 - PSConstants_004;
    _30 = _26;
    _31 = _28;
  } else {
    _30 = TEXCOORD_1.x;
    _31 = TEXCOORD_1.w;
  }
  _34 = _31 + 1.0f;
  _35 = PSConstants_004 + _34;
  _37 = PSConstants_000 + 1.0f;
  _38 = _37 + PSConstants_004;
  _39 = _35 / _38;
  _40 = floor(_39);
  _41 = (_40 > 1.0f);
  if (_41) {
    _43 = _37 * _40;
    _44 = _34 - _43;
    _45 = _40 + -1.0f;
    _46 = _44 / _45;
    _47 = max(0.0f, _46);
    _48 = _37 + _47;
    _49 = _48 * 0.5f;
    _50 = PSConstants_000 * 0.5f;
    _51 = _30 - _50;
    _52 = _51 + _49;
    _53 = _52 / _48;
    _54 = -0.0f - _53;
    _55 = (_53 >= _54);
    _56 = abs(_53);
    _57 = frac(_56);
    _58 = -0.0f - _57;
    _59 = select(_55, _57, _58);
    _60 = _59 + -0.5f;
    _61 = _60 * _48;
    _62 = abs(_61);
    _63 = _62 - _50;
    _64 = max(_63, 0.0f);
    _74 = _30;
    _75 = _31;
    _76 = _64;
  } else {
    _66 = (_40 == 0.0f);
    _67 = _20 && _66;
    if (_67) {
      _69 = PSConstants_004 * 0.25f;
      _70 = _69 + _30;
      _71 = PSConstants_004 * 0.5f;
      _72 = _71 + _31;
      _74 = _70;
      _75 = _72;
      _76 = 0.0f;
    } else {
      _74 = _30;
      _75 = _31;
      _76 = 0.0f;
    }
  }
  _77 = (_74 < 0.0f);
  if (!(_77)) {
    _79 = _76 * _18.x;
    _80 = _76 - _79;
    _81 = (_74 > _75);
    if (_81) {
      _83 = _74 - _75;
      _85 = _83;
    } else {
      _85 = _80;
    }
  } else {
    _85 = _74;
  }
  _86 = ddx_coarse(_85);
  _87 = ddx_coarse(TEXCOORD_1.z);
  _88 = ddy_coarse(_85);
  _89 = ddy_coarse(TEXCOORD_1.z);
  _90 = _86 * _86;
  _91 = _87 * _87;
  _92 = _91 + _90;
  _93 = _88 * _88;
  _94 = _92 + _93;
  _95 = _89 * _89;
  _96 = _94 + _95;
  _97 = sqrt(_96);
  _98 = _85 * _85;
  _99 = TEXCOORD_1.z * TEXCOORD_1.z;
  _100 = _98 + _99;
  _101 = sqrt(_100);
  _104 = (PSConstants_008 != 0.0f);
  if (!(_104)) {
    _106 = abs(TEXCOORD_1.z);
    _107 = abs(_85);
    _108 = max(_107, _106);
    _110 = _108;
  } else {
    _110 = _101;
  }
  _111 = _110 * 2.0f;
  _112 = 1.0f - _111;
  _113 = _112 / _97;
  _114 = _113 * 0.5f;
  _115 = _114 + 0.5f;
  _116 = saturate(_115);
  _117 = _101 * 2.0f;
  _118 = 2.0f - _117;
  _119 = saturate(_118);
  _120 = _119 * 0.75f;
  _121 = 1.0f - _120;
  _122 = _121 * _116;
  _123 = _122 + _120;
  _124 = 0.5f / _97;
  _125 = saturate(_124);
  _126 = _125 * COLOR.w;
  _127 = _126 * _123;
  _132 = PSConstants_016.x - COLOR.x;
  _133 = PSConstants_016.y - COLOR.y;
  _134 = PSConstants_016.z - COLOR.z;
  _135 = _132 * _18.x;
  _136 = _133 * _18.x;
  _137 = _134 * _18.x;
  _138 = _135 + COLOR.x;
  _139 = _136 + COLOR.y;
  _140 = _137 + COLOR.z;
  _141 = _138 * _127;
  _142 = _139 * _127;
  _143 = _140 * _127;
  _144 = _127 + 9.999999747378752e-06f;
  _145 = _141 / _144;
  _146 = _142 / _144;
  _147 = _143 / _144;
#if 1
  SV_Target = GenerateUIOutputColor(_145, _146, _147, _127);
#else
  _150 = (cbUIGlobal_020 != 0.0f);
  [branch]
  if (_150) {
#if 1
    LinearizeUIAndEncodePQ(_145, _146, _147, cbUIGlobal_028, cbUIGlobal_000, _233, _234, _235);
#else
    _153 = abs(_145);
    _154 = abs(_146);
    _155 = abs(_147);
    _156 = log2(_153);
    _157 = log2(_154);
    _158 = log2(_155);
    _159 = _156 * cbUIGlobal_028;
    _160 = _157 * cbUIGlobal_028;
    _161 = _158 * cbUIGlobal_028;
    _162 = exp2(_159);
    _163 = exp2(_160);
    _164 = exp2(_161);
    _167 = cbUIGlobal_000 * _162;
    _168 = cbUIGlobal_000 * _163;
    _169 = cbUIGlobal_000 * _164;
    _170 = _167 * 0.627403974533081f;
    _171 = mad(0.3292819857597351f, _168, _170);
    _172 = mad(0.04331360012292862f, _169, _171);
    _173 = _167 * 0.045745600014925f;
    _174 = mad(0.9417769908905029f, _168, _173);
    _175 = mad(0.012477199546992779f, _169, _174);
    _176 = _167 * -0.0012105499627068639f;
    _177 = mad(0.017604099586606026f, _168, _176);
    _178 = mad(0.9836069941520691f, _169, _177);
    _179 = _172 * 9.999999747378752e-05f;
    _180 = _175 * 9.999999747378752e-05f;
    _181 = _178 * 9.999999747378752e-05f;
    _182 = saturate(_179);
    _183 = saturate(_180);
    _184 = saturate(_181);
    _185 = log2(_182);
    _186 = log2(_183);
    _187 = log2(_184);
    _188 = _185 * 0.1593017578125f;
    _189 = _186 * 0.1593017578125f;
    _190 = _187 * 0.1593017578125f;
    _191 = exp2(_188);
    _192 = exp2(_189);
    _193 = exp2(_190);
    _194 = _191 * 18.8515625f;
    _195 = _192 * 18.8515625f;
    _196 = _193 * 18.8515625f;
    _197 = _194 + 0.8359375f;
    _198 = _195 + 0.8359375f;
    _199 = _196 + 0.8359375f;
    _200 = _191 * 18.6875f;
    _201 = _192 * 18.6875f;
    _202 = _193 * 18.6875f;
    _203 = _200 + 1.0f;
    _204 = _201 + 1.0f;
    _205 = _202 + 1.0f;
    _206 = _197 / _203;
    _207 = _198 / _204;
    _208 = _199 / _205;
    _209 = log2(_206);
    _210 = log2(_207);
    _211 = log2(_208);
    _212 = _209 * 78.84375f;
    _213 = _210 * 78.84375f;
    _214 = _211 * 78.84375f;
    _215 = exp2(_212);
    _216 = exp2(_213);
    _217 = exp2(_214);
    _218 = saturate(_215);
    _219 = saturate(_216);
    _220 = saturate(_217);
    _233 = _218;
    _234 = _219;
    _235 = _220;
#endif
  } else {
    _223 = log2(_145);
    _224 = log2(_146);
    _225 = log2(_147);
    _226 = _223 * cbUIGlobal_016;
    _227 = _224 * cbUIGlobal_016;
    _228 = _225 * cbUIGlobal_016;
    _229 = exp2(_226);
    _230 = exp2(_227);
    _231 = exp2(_228);
    _233 = _229;
    _234 = _230;
    _235 = _231;
  }
  _236 = _233 * _127;
  _237 = _234 * _127;
  _238 = _235 * _127;
  SV_Target.x = _236;
  SV_Target.y = _237;
  SV_Target.z = _238;
  SV_Target.w = _127;
#endif
  return SV_Target;
}
