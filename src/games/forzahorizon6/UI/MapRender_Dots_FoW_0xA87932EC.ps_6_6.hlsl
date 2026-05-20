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
  float _111;
  float _227;
  float _228;
  float _229;
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
  bool _100;
  float _102;
  float _103;
  float _104;
  float _105;
  float _107;
  float _108;
  float _109;
  float _112;
  float _113;
  float _114;
  float _115;
  float _116;
  float _117;
  float _118;
  float _119;
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
  bool _144;
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
  float _217;
  float _218;
  float _219;
  float _220;
  float _221;
  float _222;
  float _223;
  float _224;
  float _225;
  float _230;
  float _231;
  float _232;
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
  _100 = (PSConstants_008 != 0.0f);
  if (_100) {
    _102 = _85 * _85;
    _103 = TEXCOORD_1.z * TEXCOORD_1.z;
    _104 = _102 + _103;
    _105 = sqrt(_104);
    _111 = _105;
  } else {
    _107 = abs(TEXCOORD_1.z);
    _108 = abs(_85);
    _109 = max(_108, _107);
    _111 = _109;
  }
  _112 = _111 * 2.0f;
  _113 = 1.0f - _112;
  _114 = _113 / _97;
  _115 = _114 * 0.5f;
  _116 = _115 + 0.5f;
  _117 = saturate(_116);
  _118 = 0.5f / _97;
  _119 = saturate(_118);
  _124 = PSConstants_016.x - COLOR.x;
  _125 = PSConstants_016.y - COLOR.y;
  _126 = PSConstants_016.z - COLOR.z;
  _127 = _124 * _18.x;
  _128 = _125 * _18.x;
  _129 = _126 * _18.x;
  _130 = _127 + COLOR.x;
  _131 = _128 + COLOR.y;
  _132 = _129 + COLOR.z;
  _133 = _117 * COLOR.w;
  _134 = _133 * _119;
  _135 = _130 * _134;
  _136 = _131 * _134;
  _137 = _132 * _134;
  _138 = _134 + 9.999999747378752e-06f;
  _139 = _135 / _138;
  _140 = _136 / _138;
  _141 = _137 / _138;
#if 1
  SV_Target = GenerateUIOutputColor(_139, _140, _141, _134);
#else
  _144 = (cbUIGlobal_020 != 0.0f);
  [branch]
  if (_144) {
#if 1
    LinearizeUIAndEncodePQ(_139, _140, _141, cbUIGlobal_028, cbUIGlobal_000, _227, _228, _229);
#else
    _147 = abs(_139);
    _148 = abs(_140);
    _149 = abs(_141);
    _150 = log2(_147);
    _151 = log2(_148);
    _152 = log2(_149);
    _153 = _150 * cbUIGlobal_028;
    _154 = _151 * cbUIGlobal_028;
    _155 = _152 * cbUIGlobal_028;
    _156 = exp2(_153);
    _157 = exp2(_154);
    _158 = exp2(_155);
    _161 = cbUIGlobal_000 * _156;
    _162 = cbUIGlobal_000 * _157;
    _163 = cbUIGlobal_000 * _158;
    _164 = _161 * 0.627403974533081f;
    _165 = mad(0.3292819857597351f, _162, _164);
    _166 = mad(0.04331360012292862f, _163, _165);
    _167 = _161 * 0.045745600014925f;
    _168 = mad(0.9417769908905029f, _162, _167);
    _169 = mad(0.012477199546992779f, _163, _168);
    _170 = _161 * -0.0012105499627068639f;
    _171 = mad(0.017604099586606026f, _162, _170);
    _172 = mad(0.9836069941520691f, _163, _171);
    _173 = _166 * 9.999999747378752e-05f;
    _174 = _169 * 9.999999747378752e-05f;
    _175 = _172 * 9.999999747378752e-05f;
    _176 = saturate(_173);
    _177 = saturate(_174);
    _178 = saturate(_175);
    _179 = log2(_176);
    _180 = log2(_177);
    _181 = log2(_178);
    _182 = _179 * 0.1593017578125f;
    _183 = _180 * 0.1593017578125f;
    _184 = _181 * 0.1593017578125f;
    _185 = exp2(_182);
    _186 = exp2(_183);
    _187 = exp2(_184);
    _188 = _185 * 18.8515625f;
    _189 = _186 * 18.8515625f;
    _190 = _187 * 18.8515625f;
    _191 = _188 + 0.8359375f;
    _192 = _189 + 0.8359375f;
    _193 = _190 + 0.8359375f;
    _194 = _185 * 18.6875f;
    _195 = _186 * 18.6875f;
    _196 = _187 * 18.6875f;
    _197 = _194 + 1.0f;
    _198 = _195 + 1.0f;
    _199 = _196 + 1.0f;
    _200 = _191 / _197;
    _201 = _192 / _198;
    _202 = _193 / _199;
    _203 = log2(_200);
    _204 = log2(_201);
    _205 = log2(_202);
    _206 = _203 * 78.84375f;
    _207 = _204 * 78.84375f;
    _208 = _205 * 78.84375f;
    _209 = exp2(_206);
    _210 = exp2(_207);
    _211 = exp2(_208);
    _212 = saturate(_209);
    _213 = saturate(_210);
    _214 = saturate(_211);
    _227 = _212;
    _228 = _213;
    _229 = _214;
#endif
  } else {
    _217 = log2(_139);
    _218 = log2(_140);
    _219 = log2(_141);
    _220 = _217 * cbUIGlobal_016;
    _221 = _218 * cbUIGlobal_016;
    _222 = _219 * cbUIGlobal_016;
    _223 = exp2(_220);
    _224 = exp2(_221);
    _225 = exp2(_222);
    _227 = _223;
    _228 = _224;
    _229 = _225;
  }
  _230 = _227 * _134;
  _231 = _228 * _134;
  _232 = _229 * _134;
  SV_Target.x = _230;
  SV_Target.y = _231;
  SV_Target.z = _232;
  SV_Target.w = _134;
#endif
  return SV_Target;
}
