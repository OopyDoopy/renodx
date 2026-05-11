#include "../tonemap.hlsli"

struct TemplatePostProcessStruct {
  float _parameter;
};


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

struct BindlessParameters_TemplatePostProcess {
  TemplatePostProcessStruct BindlessParameters_TemplatePostProcess;
};

typedef BindlessParameters_TemplatePostProcess BindlessParameters_TemplatePostProcess_t;
ConstantBuffer<BindlessParameters_TemplatePostProcess_t> BindlessParameters_TemplatePostProcess[] : register(b0, space100);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  int _16;
  float _24;
  uint _29;
  float _43;
  float _235;
  float _236;
  float _237;
  float _330;
  float _331;
  float _332;
  float _452;
  float _453;
  float _454;
  float _475;
  float _476;
  float _477;
  float _510;
  float _511;
  float _512;
  float _526;
  float _527;
  float _528;
  float _52;
  float _88;
  float _89;
  float _90;
  float _92;
  float _99;
  float _100;
  float _101;
  float _120;
  float _121;
  float _122;
  float _123;
  float _124;
  float _125;
  float _126;
  float _127;
  float _128;
  float _174;
  float _175;
  float _176;
  float _177;
  float _178;
  float _179;
  float _180;
  float _197;
  float _198;
  float _199;
  float _200;
  float _206;
  float _209;
  float _216;
  float _217;
  float _218;
  float _247;
  float _272;
  float _273;
  float _274;
  float _293;
  float _294;
  float _295;
  float _301;
  float _305;
  float _306;
  float _307;
  float _308;
  float _313;
  float _338;
  float _342;
  float _343;
  float _344;
  float _345;
  int _386;
  float _441;
  float _465;
  float _466;
  float _470;
  float _517;
  float _13[36];
  _16 = WaveReadLaneFirst(_materialIndex);
  _24 = WaveReadLaneFirst(BindlessParameters_TemplatePostProcess[((int)((uint)(select(((uint)_16 < (uint)170000), _16, 0)) + 0u))].BindlessParameters_TemplatePostProcess._parameter);
  _29 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _43 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _29, 0)))).x) & 127))) + 0.5f);
  } else {
    _43 = select(isnan(_postProcessParams.x), 0.0f, 1.0f);
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_24, _24, _24));
    _452 = output_color.x;
    _453 = output_color.y;
    _454 = output_color.z;
  } else {
    _452 = _24;
    _453 = _24;
    _454 = _24;
  }
  if (_etcParams.y > 1.0f) {
    _465 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _466 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _470 = saturate(1.0f - (dot(float2(_465, _466), float2(_465, _466)) * saturate(_etcParams.y + -1.0f)));
    _475 = (_470 * _452);
    _476 = (_470 * _453);
    _477 = (_470 * _454);
  } else {
    _475 = _452;
    _476 = _453;
    _477 = _454;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _510 = select((_475 <= 0.0031308000907301903f), (_475 * 12.920000076293945f), (((pow(_475, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _511 = select((_476 <= 0.0031308000907301903f), (_476 * 12.920000076293945f), (((pow(_476, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _512 = select((_477 <= 0.0031308000907301903f), (_477 * 12.920000076293945f), (((pow(_477, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _510 = _475;
    _511 = _476;
    _512 = _477;
  }
  if (!(_etcParams.y < 1.0f)) {
    _517 = float((uint)_29);
    if (!(_517 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_517 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _526 = _510;
        _527 = _511;
        _528 = _512;
      } else {
        _526 = 0.0f;
        _527 = 0.0f;
        _528 = 0.0f;
      }
    } else {
      _526 = 0.0f;
      _527 = 0.0f;
      _528 = 0.0f;
    }
  } else {
    _526 = _510;
    _527 = _511;
    _528 = _512;
  }
  SV_Target.x = _526;
  SV_Target.y = _527;
  SV_Target.z = _528;
  SV_Target.w = _43;
  return SV_Target;
}