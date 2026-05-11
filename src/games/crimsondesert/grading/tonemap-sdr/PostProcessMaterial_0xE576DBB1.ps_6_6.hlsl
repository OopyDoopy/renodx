#include "../tonemap.hlsli"

struct PostProcessHousingStruct {
  float _ratio;
  float3 _pivotPosition;
  float4 _rectMinMax;
};


Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t37, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t29, space36);

cbuffer __3__35__0__0__SceneConstantBuffer : register(b16, space35) {
  uint4 __3__35__0__0__SceneConstantBuffer_raw[172];
};

#if 0 // Provided by tonemap.hlsli
cbuffer __3__35__0__0__ExposureConstantBuffer : register(b31, space35) {
  float4 _exposure0 : packoffset(c000.x);
  float4 _exposure1 : packoffset(c001.x);
  float4 _exposure2 : packoffset(c002.x);
  float4 _exposure3 : packoffset(c003.x);
  float4 _exposure4 : packoffset(c004.x);
};
#endif

#if 0 // Provided by tonemap.hlsli
cbuffer __3__1__0__0__GlobalPushConstants : register(b0, space1) {
  float4 _postProcessParams : packoffset(c000.x);
  float4 _postProcessParams1 : packoffset(c001.x);
  float4 _toneMapParams0 : packoffset(c002.x);
  float4 _toneMapParams1 : packoffset(c003.x);
  float4 _colorGradingParams : packoffset(c004.x);
  float4 _colorCorrectionParams : packoffset(c005.x);
  float4 _localToneMappingParams : packoffset(c006.x);
  float4 _etcParams : packoffset(c007.x);
  float4 _userImageAdjust : packoffset(c008.x);
  float4 _slopeParams : packoffset(c009.x);
  float4 _offsetParams : packoffset(c010.x);
  float4 _powerParams : packoffset(c011.x);
  int _colorBlindParam : packoffset(c012.x);
  int _nightToneParm : packoffset(c012.y);
  int2 _padding : packoffset(c012.z);
};
#endif

cbuffer __3__1__0__0__PostProcessMaterialIndex : register(b2, space1) {
  int _materialIndex : packoffset(c000.x);
  int _passIndex : packoffset(c000.y);
};

struct BindlessParameters_PostProcessHousing {
  PostProcessHousingStruct BindlessParameters_PostProcessHousing;
};

typedef BindlessParameters_PostProcessHousing BindlessParameters_PostProcessHousing_t;
ConstantBuffer<BindlessParameters_PostProcessHousing_t> BindlessParameters_PostProcessHousing[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float4 _25;
  float _34;
  float _35;
  float _36;
  float _37;
  float _65;
  float _66;
  float _67;
  float _68;
  float _70;
  float _71;
  float _73;
  int _74;
  float _84;
  float _86;
  int _87;
  float _98;
  float _99;
  float _100;
  float _101;
  float _133;
  float _134;
  float _135;
  float _149;
  float _354;
  float _355;
  float _356;
  float _449;
  float _450;
  float _451;
  float _571;
  float _572;
  float _573;
  float _591;
  float _592;
  float _593;
  float _626;
  float _627;
  float _628;
  float _642;
  float _643;
  float _644;
  bool _128;
  uint _136;
  float _158;
  float _207;
  float _208;
  float _209;
  float _211;
  float _218;
  float _219;
  float _220;
  float _239;
  float _240;
  float _241;
  float _242;
  float _243;
  float _244;
  float _245;
  float _246;
  float _247;
  float _293;
  float _294;
  float _295;
  float _296;
  float _297;
  float _298;
  float _299;
  float _316;
  float _317;
  float _318;
  float _319;
  float _325;
  float _328;
  float _335;
  float _336;
  float _337;
  float _366;
  float _391;
  float _392;
  float _393;
  float _412;
  float _413;
  float _414;
  float _420;
  float _424;
  float _425;
  float _426;
  float _427;
  float _432;
  float _457;
  float _461;
  float _462;
  float _463;
  float _464;
  int _505;
  float _560;
  float _581;
  float _582;
  float _586;
  float _633;
  float _18[36];
  _25 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _34 = (TEXCOORD.x * 2.0f) + -1.0f;
  _35 = TEXCOORD.y * 2.0f;
  _36 = 1.0f - _35;
  _37 = max(1.0000000116860974e-07f, ((__3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y))).x));
  _65 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].w), _37, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].w), _36, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].w) * _34))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].w);
  _66 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].x), _37, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].x), _36, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].x) * _34))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].x)) / _65;
  _67 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].z), _37, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].z), _36, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].z) * _34))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].z)) / _65;
  _68 = abs(_66);
  _70 = frac(abs(_68));
  _71 = abs(_67);
  _73 = frac(abs(_71));
  _74 = WaveReadLaneFirst(_materialIndex);
  _84 = WaveReadLaneFirst(BindlessParameters_PostProcessHousing[((int)((uint)(select(((uint)_74 < (uint)170000), _74, 0)) + 0u))].BindlessParameters_PostProcessHousing._pivotPosition.x);
  _86 = WaveReadLaneFirst(BindlessParameters_PostProcessHousing[((int)((uint)(select(((uint)_74 < (uint)170000), _74, 0)) + 0u))].BindlessParameters_PostProcessHousing._pivotPosition.z);
  _87 = WaveReadLaneFirst(_materialIndex);
  _98 = WaveReadLaneFirst(BindlessParameters_PostProcessHousing[((int)((uint)(select(((uint)_87 < (uint)170000), _87, 0)) + 0u))].BindlessParameters_PostProcessHousing._rectMinMax.x);
  _99 = WaveReadLaneFirst(BindlessParameters_PostProcessHousing[((int)((uint)(select(((uint)_87 < (uint)170000), _87, 0)) + 0u))].BindlessParameters_PostProcessHousing._rectMinMax.y);
  _100 = WaveReadLaneFirst(BindlessParameters_PostProcessHousing[((int)((uint)(select(((uint)_87 < (uint)170000), _87, 0)) + 0u))].BindlessParameters_PostProcessHousing._rectMinMax.z);
  _101 = WaveReadLaneFirst(BindlessParameters_PostProcessHousing[((int)((uint)(select(((uint)_87 < (uint)170000), _87, 0)) + 0u))].BindlessParameters_PostProcessHousing._rectMinMax.w);
  if (((_66 > (_98 + _84)) && (_67 > (_99 + _86))) && (_66 < (_100 + _84))) {
    _128 = (_67 < (_101 + _86)) && ((abs(1.0f - select((_71 >= (-0.0f - _71)), _73, (-0.0f - _73))) < 0.03125f) || (abs(1.0f - select((_68 >= (-0.0f - _68)), _70, (-0.0f - _70))) < 0.03125f));
    _133 = select(_128, 256.0f, _25.x);
    _134 = select(_128, 256.0f, _25.y);
    _135 = select(_128, 256.0f, _25.z);
  } else {
    _133 = _25.x;
    _134 = _25.y;
    _135 = _25.z;
  }
  _136 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _149 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _136, 0)))).x) & 127))) + 0.5f);
  } else {
    _149 = _postProcessParams.x;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_133, _134, _135));
    _571 = output_color.x;
    _572 = output_color.y;
    _573 = output_color.z;
  } else {
    _571 = _133;
    _572 = _134;
    _573 = _135;
  }
  if (_etcParams.y > 1.0f) {
    _581 = abs(_34);
    _582 = abs(_35 + -1.0f);
    _586 = saturate(1.0f - (dot(float2(_581, _582), float2(_581, _582)) * saturate(_etcParams.y + -1.0f)));
    _591 = (_586 * _571);
    _592 = (_586 * _572);
    _593 = (_586 * _573);
  } else {
    _591 = _571;
    _592 = _572;
    _593 = _573;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _626 = select((_591 <= 0.0031308000907301903f), (_591 * 12.920000076293945f), (((pow(_591, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _627 = select((_592 <= 0.0031308000907301903f), (_592 * 12.920000076293945f), (((pow(_592, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _628 = select((_593 <= 0.0031308000907301903f), (_593 * 12.920000076293945f), (((pow(_593, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _626 = _591;
    _627 = _592;
    _628 = _593;
  }
  if (!(_etcParams.y < 1.0f)) {
    _633 = float((uint)_136);
    if (!(_633 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_633 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _642 = _626;
        _643 = _627;
        _644 = _628;
      } else {
        _642 = 0.0f;
        _643 = 0.0f;
        _644 = 0.0f;
      }
    } else {
      _642 = 0.0f;
      _643 = 0.0f;
      _644 = 0.0f;
    }
  } else {
    _642 = _626;
    _643 = _627;
    _644 = _628;
  }
  SV_Target.x = _642;
  SV_Target.y = _643;
  SV_Target.z = _644;
  SV_Target.w = _149;
  return SV_Target;
}