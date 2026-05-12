#include "../tonemap.hlsli"

struct PostProcessHousingStruct {
  float _ratio;
  float3 _pivotPosition;
  float4 _rectMinMax;
};


Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t37, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t29, space36);

#if 0 // Provided by tonemap.hlsli
cbuffer __3__35__0__0__SceneConstantBuffer : register(b16, space35) {
  uint4 __3__35__0__0__SceneConstantBuffer_raw[172];
};
#endif

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
  float _35;
  float _36;
  float _37;
  float _62;
  float _63;
  float _64;
  float _70;
  float _71;
  float _72;
  float _73;
  float _101;
  float _102;
  float _103;
  float _104;
  float _106;
  float _107;
  float _109;
  int _110;
  float _120;
  float _122;
  int _123;
  float _134;
  float _135;
  float _136;
  float _137;
  float _169;
  float _170;
  float _171;
  float _185;
  float _390;
  float _391;
  float _392;
  float _485;
  float _486;
  float _487;
  float _607;
  float _608;
  float _609;
  float _627;
  float _628;
  float _629;
  float _662;
  float _663;
  float _664;
  float _678;
  float _679;
  float _680;
  bool _164;
  uint _172;
  float _194;
  float _243;
  float _244;
  float _245;
  float _247;
  float _254;
  float _255;
  float _256;
  float _275;
  float _276;
  float _277;
  float _278;
  float _279;
  float _280;
  float _281;
  float _282;
  float _283;
  float _329;
  float _330;
  float _331;
  float _332;
  float _333;
  float _334;
  float _335;
  float _352;
  float _353;
  float _354;
  float _355;
  float _361;
  float _364;
  float _371;
  float _372;
  float _373;
  float _402;
  float _427;
  float _428;
  float _429;
  float _448;
  float _449;
  float _450;
  float _456;
  float _460;
  float _461;
  float _462;
  float _463;
  float _468;
  float _493;
  float _497;
  float _498;
  float _499;
  float _500;
  int _541;
  float _596;
  float _617;
  float _618;
  float _622;
  float _669;
  float _690;
  float _691;
  float _692;
  float _18[36];
  _25 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _35 = (pow(_25.x, 0.012683313339948654f));
  _36 = (pow(_25.y, 0.012683313339948654f));
  _37 = (pow(_25.z, 0.012683313339948654f));
  _62 = exp2(log2(max(0.0f, (_35 + -0.8359375f)) / (18.8515625f - (_35 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _63 = exp2(log2(max(0.0f, (_36 + -0.8359375f)) / (18.8515625f - (_36 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _64 = exp2(log2(max(0.0f, (_37 + -0.8359375f)) / (18.8515625f - (_37 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _70 = (TEXCOORD.x * 2.0f) + -1.0f;
  _71 = TEXCOORD.y * 2.0f;
  _72 = 1.0f - _71;
  _73 = max(1.0000000116860974e-07f, ((__3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y))).x));
  _101 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].w), _73, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].w), _72, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].w) * _70))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].w);
  _102 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].x), _73, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].x), _72, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].x) * _70))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].x)) / _101;
  _103 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].z), _73, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].z), _72, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].z) * _70))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].z)) / _101;
  _104 = abs(_102);
  _106 = frac(abs(_104));
  _107 = abs(_103);
  _109 = frac(abs(_107));
  _110 = WaveReadLaneFirst(_materialIndex);
  _120 = WaveReadLaneFirst(BindlessParameters_PostProcessHousing[((int)((uint)(select(((uint)_110 < (uint)170000), _110, 0)) + 0u))].BindlessParameters_PostProcessHousing._pivotPosition.x);
  _122 = WaveReadLaneFirst(BindlessParameters_PostProcessHousing[((int)((uint)(select(((uint)_110 < (uint)170000), _110, 0)) + 0u))].BindlessParameters_PostProcessHousing._pivotPosition.z);
  _123 = WaveReadLaneFirst(_materialIndex);
  _134 = WaveReadLaneFirst(BindlessParameters_PostProcessHousing[((int)((uint)(select(((uint)_123 < (uint)170000), _123, 0)) + 0u))].BindlessParameters_PostProcessHousing._rectMinMax.x);
  _135 = WaveReadLaneFirst(BindlessParameters_PostProcessHousing[((int)((uint)(select(((uint)_123 < (uint)170000), _123, 0)) + 0u))].BindlessParameters_PostProcessHousing._rectMinMax.y);
  _136 = WaveReadLaneFirst(BindlessParameters_PostProcessHousing[((int)((uint)(select(((uint)_123 < (uint)170000), _123, 0)) + 0u))].BindlessParameters_PostProcessHousing._rectMinMax.z);
  _137 = WaveReadLaneFirst(BindlessParameters_PostProcessHousing[((int)((uint)(select(((uint)_123 < (uint)170000), _123, 0)) + 0u))].BindlessParameters_PostProcessHousing._rectMinMax.w);
  if (((_102 > (_134 + _120)) && (_103 > (_135 + _122))) && (_102 < (_136 + _120))) {
    _164 = (_103 < (_137 + _122)) && ((abs(1.0f - select((_107 >= (-0.0f - _107)), _109, (-0.0f - _109))) < 0.03125f) || (abs(1.0f - select((_104 >= (-0.0f - _104)), _106, (-0.0f - _106))) < 0.03125f));
    _169 = select(_164, 256.0f, _62);
    _170 = select(_164, 256.0f, _63);
    _171 = select(_164, 256.0f, _64);
  } else {
    _169 = _62;
    _170 = _63;
    _171 = _64;
  }
  _172 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _185 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _172, 0)))).x) & 127))) + 0.5f);
  } else {
    _185 = _postProcessParams.x;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_169, _170, _171));
    _607 = output_color.x;
    _608 = output_color.y;
    _609 = output_color.z;
  } else {
    _607 = _169;
    _608 = _170;
    _609 = _171;
  }
  if (_etcParams.y > 1.0f) {
    _617 = abs(_70);
    _618 = abs(_71 + -1.0f);
    _622 = saturate(1.0f - (dot(float2(_617, _618), float2(_617, _618)) * saturate(_etcParams.y + -1.0f)));
    _627 = (_622 * _607);
    _628 = (_622 * _608);
    _629 = (_622 * _609);
  } else {
    _627 = _607;
    _628 = _608;
    _629 = _609;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _662 = select((_627 <= 0.0031308000907301903f), (_627 * 12.920000076293945f), (((pow(_627, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _663 = select((_628 <= 0.0031308000907301903f), (_628 * 12.920000076293945f), (((pow(_628, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _664 = select((_629 <= 0.0031308000907301903f), (_629 * 12.920000076293945f), (((pow(_629, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _662 = _627;
    _663 = _628;
    _664 = _629;
  }
  if (!(_etcParams.y < 1.0f)) {
    _669 = float((uint)_172);
    if (!(_669 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_669 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _678 = _662;
        _679 = _663;
        _680 = _664;
      } else {
        _678 = 0.0f;
        _679 = 0.0f;
        _680 = 0.0f;
      }
    } else {
      _678 = 0.0f;
      _679 = 0.0f;
      _680 = 0.0f;
    }
  } else {
    _678 = _662;
    _679 = _663;
    _680 = _664;
  }
  _690 = exp2(log2(_678 * 9.999999747378752e-05f) * 0.1593017578125f);
  _691 = exp2(log2(_679 * 9.999999747378752e-05f) * 0.1593017578125f);
  _692 = exp2(log2(_680 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_690 * 18.6875f) + 1.0f)) * ((_690 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_691 * 18.6875f) + 1.0f)) * ((_691 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_692 * 18.6875f) + 1.0f)) * ((_692 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _185;
  return SV_Target;
}