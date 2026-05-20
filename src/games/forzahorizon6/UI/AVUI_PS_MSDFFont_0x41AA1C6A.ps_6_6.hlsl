#include "UI.hlsli"

Texture2D<float4> t0 : register(t0);

cbuffer cb0 : register(b0) {
  float4 PSConstants_000 : packoffset(c000.x);
  float4 PSConstants_016 : packoffset(c001.x);
  float2 PSConstants_032 : packoffset(c002.x);
  float2 PSConstants_040 : packoffset(c002.z);
  int PSConstants_048 : packoffset(c003.x);
  float PSConstants_052 : packoffset(c003.y);
  float PSConstants_056 : packoffset(c003.z);
  float PSConstants_060 : packoffset(c003.w);
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
    linear float4 TEXCOORD: TEXCOORD,
    linear float TEXCOORD_1: TEXCOORD1)
    : SV_Target {
  float4 SV_Target;
  float _12;
  float _13;
  float4 _20;
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
  bool _47;
  float _130;
  float _131;
  float _132;
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
  float _115;
  float _116;
  float _117;
  float _120;
  float _121;
  float _122;
  float _123;
  float _124;
  float _125;
  float _126;
  float _127;
  float _128;
  float _133;
  float _134;
  float _135;
  _12 = PSConstants_032.x / PSConstants_032.y;
  _13 = _12 * 0.10499999672174454f;
  _20 = t0.Sample(s0, float2(TEXCOORD.z, TEXCOORD.w));
  _24 = max(_20.x, _20.y);
  _25 = min(_24, _20.z);
  _26 = min(_20.x, _20.y);
  _27 = max(_26, _25);
  _28 = _13 + 0.5199999809265137f;
  _29 = 0.5199999809265137f - _13;
  _30 = _28 - _29;
  _31 = _27 - _29;
  _32 = _31 / _30;
  _33 = saturate(_32);
  _34 = _33 * 2.0f;
  _35 = 3.0f - _34;
  _36 = _33 * _33;
  _37 = _36 * _35;
  _38 = _37 * PSConstants_000.x;
  _39 = _37 * PSConstants_000.y;
  _40 = _37 * PSConstants_000.z;
  _41 = _37 + 9.999999747378752e-06f;
  _42 = _38 / _41;
  _43 = _39 / _41;
  _44 = _40 / _41;
#if 1
  SV_Target = GenerateUIOutputColor(_42, _43, _44, _37);
#else
  _47 = (cbUIGlobal_020 != 0.0f);
  [branch]
  if (_47) {
#if 1
    LinearizeUIAndEncodePQ(_42, _43, _44, cbUIGlobal_028, cbUIGlobal_000, _130, _131, _132);
#else
    _50 = abs(_42);
    _51 = abs(_43);
    _52 = abs(_44);
    _53 = log2(_50);
    _54 = log2(_51);
    _55 = log2(_52);
    _56 = _53 * cbUIGlobal_028;
    _57 = _54 * cbUIGlobal_028;
    _58 = _55 * cbUIGlobal_028;
    _59 = exp2(_56);
    _60 = exp2(_57);
    _61 = exp2(_58);
    _64 = cbUIGlobal_000 * _59;
    _65 = cbUIGlobal_000 * _60;
    _66 = cbUIGlobal_000 * _61;
    _67 = _64 * 0.627403974533081f;
    _68 = mad(0.3292819857597351f, _65, _67);
    _69 = mad(0.04331360012292862f, _66, _68);
    _70 = _64 * 0.045745600014925f;
    _71 = mad(0.9417769908905029f, _65, _70);
    _72 = mad(0.012477199546992779f, _66, _71);
    _73 = _64 * -0.0012105499627068639f;
    _74 = mad(0.017604099586606026f, _65, _73);
    _75 = mad(0.9836069941520691f, _66, _74);
    _76 = _69 * 9.999999747378752e-05f;
    _77 = _72 * 9.999999747378752e-05f;
    _78 = _75 * 9.999999747378752e-05f;
    _79 = saturate(_76);
    _80 = saturate(_77);
    _81 = saturate(_78);
    _82 = log2(_79);
    _83 = log2(_80);
    _84 = log2(_81);
    _85 = _82 * 0.1593017578125f;
    _86 = _83 * 0.1593017578125f;
    _87 = _84 * 0.1593017578125f;
    _88 = exp2(_85);
    _89 = exp2(_86);
    _90 = exp2(_87);
    _91 = _88 * 18.8515625f;
    _92 = _89 * 18.8515625f;
    _93 = _90 * 18.8515625f;
    _94 = _91 + 0.8359375f;
    _95 = _92 + 0.8359375f;
    _96 = _93 + 0.8359375f;
    _97 = _88 * 18.6875f;
    _98 = _89 * 18.6875f;
    _99 = _90 * 18.6875f;
    _100 = _97 + 1.0f;
    _101 = _98 + 1.0f;
    _102 = _99 + 1.0f;
    _103 = _94 / _100;
    _104 = _95 / _101;
    _105 = _96 / _102;
    _106 = log2(_103);
    _107 = log2(_104);
    _108 = log2(_105);
    _109 = _106 * 78.84375f;
    _110 = _107 * 78.84375f;
    _111 = _108 * 78.84375f;
    _112 = exp2(_109);
    _113 = exp2(_110);
    _114 = exp2(_111);
    _115 = saturate(_112);
    _116 = saturate(_113);
    _117 = saturate(_114);
    _130 = _115;
    _131 = _116;
    _132 = _117;
#endif
  } else {
    _120 = log2(_42);
    _121 = log2(_43);
    _122 = log2(_44);
    _123 = _120 * cbUIGlobal_016;
    _124 = _121 * cbUIGlobal_016;
    _125 = _122 * cbUIGlobal_016;
    _126 = exp2(_123);
    _127 = exp2(_124);
    _128 = exp2(_125);
    _130 = _126;
    _131 = _127;
    _132 = _128;
  }
  _133 = _130 * _37;
  _134 = _131 * _37;
  _135 = _132 * _37;
  SV_Target.x = _133;
  SV_Target.y = _134;
  SV_Target.z = _135;
  SV_Target.w = _37;
#endif
  return SV_Target;
}
