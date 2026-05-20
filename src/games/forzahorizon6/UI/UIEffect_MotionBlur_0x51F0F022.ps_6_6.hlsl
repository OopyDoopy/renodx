#include "UI.hlsli"

Texture2D<float4> t0 : register(t0);

cbuffer cb0 : register(b0) {
  float4 cbPixelShader_000 : packoffset(c000.x);
  float4 cbPixelShader_016 : packoffset(c001.x);
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
    linear float4 TEXCOORD: TEXCOORD)
    : SV_Target {
  float4 SV_Target;
  int _11;
  bool _12;
  float _18;
  float _23;
  float _24;
  float _25;
  float _26;
  float _127;
  float _128;
  float _129;
  float _134;
  float _135;
  float _136;
  float _137;
  int _138;
  int _14;
  float _15;
  float _16;
  bool _19;
  float _27;
  float _28;
  float _29;
  float _30;
  float _31;
  float _34;
  float _35;
  float _36;
  float _37;
  float _38;
  float _39;
  float _40;
  float _41;
  bool _44;
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
  float _117;
  float _118;
  float _119;
  float _120;
  float _121;
  float _122;
  float _123;
  float _124;
  float _125;
  float _130;
  float _131;
  float _132;
  float _142;
  float _143;
  float _144;
  float _145;
  float _146;
  float _147;
  float _148;
  float4 _151;
  float _156;
  float _157;
  float _158;
  float _159;
  int _160;
  bool _161;
  _11 = int(cbPixelShader_016.w);
  _12 = ((int)_11 > (int)1);
  if (_12) {
    _14 = _11 + -1;
    _15 = float((int)(_14));
    _16 = 2.0f / _15;
    _18 = _16;
  } else {
    _18 = 1.0f;
  }
  _19 = ((int)_11 > (int)0);
  if (_19) {
    _134 = 0.0f;
    _135 = 0.0f;
    _136 = 0.0f;
    _137 = 0.0f;
    _138 = 0;
    while (true) {
      _142 = float((int)(_138));
      _143 = _142 * _18;
      _144 = _143 + -1.0f;
      _145 = _144 * cbPixelShader_016.x;
      _146 = _144 * cbPixelShader_016.y;
      _147 = _145 + TEXCOORD.x;
      _148 = _146 + TEXCOORD.y;
      _151 = t0.Sample(s0, float2(_147, _148));
      _156 = _151.x + _134;
      _157 = _151.y + _135;
      _158 = _151.z + _136;
      _159 = _151.w + _137;
      _160 = _138 + 1;
      _161 = (_160 == _11);
      if (_161) {
        break;
      } else {
        _134 = _156;
        _135 = _157;
        _136 = _158;
        _137 = _159;
        _138 = _160;
      }
      break;
    }
    _23 = _156;
    _24 = _157;
    _25 = _158;
    _26 = _159;
  } else {
    _23 = 0.0f;
    _24 = 0.0f;
    _25 = 0.0f;
    _26 = 0.0f;
  }
  _27 = float((int)(_11));
  _28 = _23 / _27;
  _29 = _24 / _27;
  _30 = _25 / _27;
  _31 = _26 / _27;
  _34 = cbPixelShader_016.z * _28;
  _35 = cbPixelShader_016.z * _29;
  _36 = cbPixelShader_016.z * _30;
  _37 = cbPixelShader_016.z * _31;
  _38 = _37 + 9.999999747378752e-06f;
  _39 = _34 / _38;
  _40 = _35 / _38;
  _41 = _36 / _38;
#if 1
  SV_Target = GenerateUIOutputColor(_39, _40, _41, _37);
#else
  _44 = (cbUIGlobal_020 != 0.0f);
  [branch]
  if (_44) {
#if 1
    LinearizeUIAndEncodePQ(_39, _40, _41, cbUIGlobal_028, cbUIGlobal_000, _127, _128, _129);
#else
    _47 = abs(_39);
    _48 = abs(_40);
    _49 = abs(_41);
    _50 = log2(_47);
    _51 = log2(_48);
    _52 = log2(_49);
    _53 = _50 * cbUIGlobal_028;
    _54 = _51 * cbUIGlobal_028;
    _55 = _52 * cbUIGlobal_028;
    _56 = exp2(_53);
    _57 = exp2(_54);
    _58 = exp2(_55);
    _61 = cbUIGlobal_000 * _56;
    _62 = cbUIGlobal_000 * _57;
    _63 = cbUIGlobal_000 * _58;
    _64 = _61 * 0.627403974533081f;
    _65 = mad(0.3292819857597351f, _62, _64);
    _66 = mad(0.04331360012292862f, _63, _65);
    _67 = _61 * 0.045745600014925f;
    _68 = mad(0.9417769908905029f, _62, _67);
    _69 = mad(0.012477199546992779f, _63, _68);
    _70 = _61 * -0.0012105499627068639f;
    _71 = mad(0.017604099586606026f, _62, _70);
    _72 = mad(0.9836069941520691f, _63, _71);
    _73 = _66 * 9.999999747378752e-05f;
    _74 = _69 * 9.999999747378752e-05f;
    _75 = _72 * 9.999999747378752e-05f;
    _76 = saturate(_73);
    _77 = saturate(_74);
    _78 = saturate(_75);
    _79 = log2(_76);
    _80 = log2(_77);
    _81 = log2(_78);
    _82 = _79 * 0.1593017578125f;
    _83 = _80 * 0.1593017578125f;
    _84 = _81 * 0.1593017578125f;
    _85 = exp2(_82);
    _86 = exp2(_83);
    _87 = exp2(_84);
    _88 = _85 * 18.8515625f;
    _89 = _86 * 18.8515625f;
    _90 = _87 * 18.8515625f;
    _91 = _88 + 0.8359375f;
    _92 = _89 + 0.8359375f;
    _93 = _90 + 0.8359375f;
    _94 = _85 * 18.6875f;
    _95 = _86 * 18.6875f;
    _96 = _87 * 18.6875f;
    _97 = _94 + 1.0f;
    _98 = _95 + 1.0f;
    _99 = _96 + 1.0f;
    _100 = _91 / _97;
    _101 = _92 / _98;
    _102 = _93 / _99;
    _103 = log2(_100);
    _104 = log2(_101);
    _105 = log2(_102);
    _106 = _103 * 78.84375f;
    _107 = _104 * 78.84375f;
    _108 = _105 * 78.84375f;
    _109 = exp2(_106);
    _110 = exp2(_107);
    _111 = exp2(_108);
    _112 = saturate(_109);
    _113 = saturate(_110);
    _114 = saturate(_111);
    _127 = _112;
    _128 = _113;
    _129 = _114;
#endif
  } else {
    _117 = log2(_39);
    _118 = log2(_40);
    _119 = log2(_41);
    _120 = _117 * cbUIGlobal_016;
    _121 = _118 * cbUIGlobal_016;
    _122 = _119 * cbUIGlobal_016;
    _123 = exp2(_120);
    _124 = exp2(_121);
    _125 = exp2(_122);
    _127 = _123;
    _128 = _124;
    _129 = _125;
  }
  _130 = _127 * _37;
  _131 = _128 * _37;
  _132 = _129 * _37;
  SV_Target.x = _130;
  SV_Target.y = _131;
  SV_Target.z = _132;
  SV_Target.w = _37;
#endif
  return SV_Target;
}
