#include "UI.hlsli"

Texture2D<float4> t0 : register(t0);

cbuffer cb0 : register(b0) {
  float cb0_000w : packoffset(c000.w);
  float cb0_001x : packoffset(c001.x);
  float cb0_001y : packoffset(c001.y);
  float cb0_001z : packoffset(c001.z);
  float cb0_001w : packoffset(c001.w);
  float cb0_002x : packoffset(c002.x);
  float cb0_003x : packoffset(c003.x);
  float cb0_004x : packoffset(c004.x);
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
  float _16;
  uint2 _18;
  float _20;
  float _22;
  float4 _25;
  bool _30;
  float _34;
  float _152;
  float _153;
  float _154;
  float _159;
  int _160;
  float _35;
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
  float _53;
  float _54;
  float _55;
  float _56;
  float _59;
  float _60;
  float _61;
  float _62;
  float _63;
  float _64;
  float _65;
  float _66;
  bool _69;
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
  float _139;
  float _142;
  float _143;
  float _144;
  float _145;
  float _146;
  float _147;
  float _148;
  float _149;
  float _150;
  float _155;
  float _156;
  float _157;
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
  float4 _177;
  float _179;
  float _180;
  float _181;
  int _182;
  bool _183;
  _11 = int(cb0_002x);
  _16 = cb0_004x * cb0_003x;
  t0.GetDimensions(_18.x, _18.y);
  _20 = float((int)((int)(_18.x)));
  _22 = float((int)((int)(_18.y)));
  _25 = t0.Sample(s0, float2(TEXCOORD.x, TEXCOORD.y));
  _30 = ((int)_11 > (int)0);
  if (_30) {
    _159 = 0.0f;
    _160 = 0;
    while (true) {
      _161 = float((int)(_160));
      _162 = _161 * 6.283185005187988f;
      _163 = float((int)(_11));
      _164 = _162 / _163;
      _165 = cos(_164);
      _166 = _165 / _20;
      _167 = sin(_164);
      _168 = _167 / _22;
      _169 = _166 * _16;
      _170 = _168 * _16;
      _171 = _169 + TEXCOORD.x;
      _172 = _170 + TEXCOORD.y;
      _173 = saturate(_171);
      _174 = saturate(_172);
      _177 = t0.Sample(s0, float2(_173, _174));
      _179 = _177.w * 2.0f;
      _180 = _179 + -1.0f;
      _181 = max(_159, _180);
      _182 = _160 + 1;
      _183 = (_182 == _11);
      if (_183) {
        break;
      } else {
        _159 = _181;
        _160 = _182;
      }
      break;
    }
    _34 = _181;
  } else {
    _34 = 0.0f;
  }
  _35 = saturate(_34);
  _41 = cb0_001w * _35;
  _42 = _41 * cb0_001x;
  _43 = _41 * cb0_001y;
  _44 = _41 * cb0_001z;
  _45 = _25.x - _42;
  _46 = _25.y - _43;
  _47 = _25.z - _44;
  _48 = _25.w - _41;
  _49 = _45 * _25.w;
  _50 = _46 * _25.w;
  _51 = _47 * _25.w;
  _52 = _48 * _25.w;
  _53 = _49 + _42;
  _54 = _50 + _43;
  _55 = _51 + _44;
  _56 = _52 + _41;
  _59 = _53 * cb0_000w;
  _60 = _54 * cb0_000w;
  _61 = _55 * cb0_000w;
  _62 = _56 * cb0_000w;
  _63 = _62 + 9.999999747378752e-06f;
  _64 = _59 / _63;
  _65 = _60 / _63;
  _66 = _61 / _63;
#if 1
  SV_Target = GenerateUIOutputColor(_64, _65, _66, _62);
#else
  _69 = (cbUIGlobal_020 != 0.0f);
  [branch]
  if (_69) {
#if 1
    LinearizeUIAndEncodePQ(_64, _65, _66, cbUIGlobal_028, cbUIGlobal_000, _152, _153, _154);
#else
    _72 = abs(_64);
    _73 = abs(_65);
    _74 = abs(_66);
    _75 = log2(_72);
    _76 = log2(_73);
    _77 = log2(_74);
    _78 = _75 * cbUIGlobal_028;
    _79 = _76 * cbUIGlobal_028;
    _80 = _77 * cbUIGlobal_028;
    _81 = exp2(_78);
    _82 = exp2(_79);
    _83 = exp2(_80);
    _86 = cbUIGlobal_000 * _81;
    _87 = cbUIGlobal_000 * _82;
    _88 = cbUIGlobal_000 * _83;
    _89 = _86 * 0.627403974533081f;
    _90 = mad(0.3292819857597351f, _87, _89);
    _91 = mad(0.04331360012292862f, _88, _90);
    _92 = _86 * 0.045745600014925f;
    _93 = mad(0.9417769908905029f, _87, _92);
    _94 = mad(0.012477199546992779f, _88, _93);
    _95 = _86 * -0.0012105499627068639f;
    _96 = mad(0.017604099586606026f, _87, _95);
    _97 = mad(0.9836069941520691f, _88, _96);
    _98 = _91 * 9.999999747378752e-05f;
    _99 = _94 * 9.999999747378752e-05f;
    _100 = _97 * 9.999999747378752e-05f;
    _101 = saturate(_98);
    _102 = saturate(_99);
    _103 = saturate(_100);
    _104 = log2(_101);
    _105 = log2(_102);
    _106 = log2(_103);
    _107 = _104 * 0.1593017578125f;
    _108 = _105 * 0.1593017578125f;
    _109 = _106 * 0.1593017578125f;
    _110 = exp2(_107);
    _111 = exp2(_108);
    _112 = exp2(_109);
    _113 = _110 * 18.8515625f;
    _114 = _111 * 18.8515625f;
    _115 = _112 * 18.8515625f;
    _116 = _113 + 0.8359375f;
    _117 = _114 + 0.8359375f;
    _118 = _115 + 0.8359375f;
    _119 = _110 * 18.6875f;
    _120 = _111 * 18.6875f;
    _121 = _112 * 18.6875f;
    _122 = _119 + 1.0f;
    _123 = _120 + 1.0f;
    _124 = _121 + 1.0f;
    _125 = _116 / _122;
    _126 = _117 / _123;
    _127 = _118 / _124;
    _128 = log2(_125);
    _129 = log2(_126);
    _130 = log2(_127);
    _131 = _128 * 78.84375f;
    _132 = _129 * 78.84375f;
    _133 = _130 * 78.84375f;
    _134 = exp2(_131);
    _135 = exp2(_132);
    _136 = exp2(_133);
    _137 = saturate(_134);
    _138 = saturate(_135);
    _139 = saturate(_136);
    _152 = _137;
    _153 = _138;
    _154 = _139;
#endif
  } else {
    _142 = log2(_64);
    _143 = log2(_65);
    _144 = log2(_66);
    _145 = _142 * cbUIGlobal_016;
    _146 = _143 * cbUIGlobal_016;
    _147 = _144 * cbUIGlobal_016;
    _148 = exp2(_145);
    _149 = exp2(_146);
    _150 = exp2(_147);
    _152 = _148;
    _153 = _149;
    _154 = _150;
  }
  _155 = _152 * _62;
  _156 = _153 * _62;
  _157 = _154 * _62;
  SV_Target.x = _155;
  SV_Target.y = _156;
  SV_Target.z = _157;
  SV_Target.w = _62;
#endif
  return SV_Target;
}
