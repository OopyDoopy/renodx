#include "../tonemap.hlsli"

Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t36, space36);

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

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float4 _16;
  uint _20;
  float _34;
  float _239;
  float _240;
  float _241;
  float _334;
  float _335;
  float _336;
  float _456;
  float _457;
  float _458;
  float _479;
  float _480;
  float _481;
  float _514;
  float _515;
  float _516;
  float _530;
  float _531;
  float _532;
  float _43;
  float _92;
  float _93;
  float _94;
  float _96;
  float _103;
  float _104;
  float _105;
  float _124;
  float _125;
  float _126;
  float _127;
  float _128;
  float _129;
  float _130;
  float _131;
  float _132;
  float _178;
  float _179;
  float _180;
  float _181;
  float _182;
  float _183;
  float _184;
  float _201;
  float _202;
  float _203;
  float _204;
  float _210;
  float _213;
  float _220;
  float _221;
  float _222;
  float _251;
  float _276;
  float _277;
  float _278;
  float _297;
  float _298;
  float _299;
  float _305;
  float _309;
  float _310;
  float _311;
  float _312;
  float _317;
  float _342;
  float _346;
  float _347;
  float _348;
  float _349;
  int _390;
  float _445;
  float _469;
  float _470;
  float _474;
  float _521;
  float _13[36];
  _16 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _20 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _34 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _20, 0)))).x) & 127))) + 0.5f);
  } else {
    _34 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_16.x, _16.y, _16.z));
    _456 = output_color.x;
    _457 = output_color.y;
    _458 = output_color.z;
  } else {
    _456 = _16.x;
    _457 = _16.y;
    _458 = _16.z;
  }
  if (_etcParams.y > 1.0f) {
    _469 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _470 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _474 = saturate(1.0f - (dot(float2(_469, _470), float2(_469, _470)) * saturate(_etcParams.y + -1.0f)));
    _479 = (_474 * _456);
    _480 = (_474 * _457);
    _481 = (_474 * _458);
  } else {
    _479 = _456;
    _480 = _457;
    _481 = _458;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _514 = select((_479 <= 0.0031308000907301903f), (_479 * 12.920000076293945f), (((pow(_479, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _515 = select((_480 <= 0.0031308000907301903f), (_480 * 12.920000076293945f), (((pow(_480, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _516 = select((_481 <= 0.0031308000907301903f), (_481 * 12.920000076293945f), (((pow(_481, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _514 = _479;
    _515 = _480;
    _516 = _481;
  }
  if (!(_etcParams.y < 1.0f)) {
    _521 = float((uint)_20);
    if (!(_521 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_521 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _530 = _514;
        _531 = _515;
        _532 = _516;
      } else {
        _530 = 0.0f;
        _531 = 0.0f;
        _532 = 0.0f;
      }
    } else {
      _530 = 0.0f;
      _531 = 0.0f;
      _532 = 0.0f;
    }
  } else {
    _530 = _514;
    _531 = _515;
    _532 = _516;
  }
  SV_Target.x = _530;
  SV_Target.y = _531;
  SV_Target.z = _532;
  SV_Target.w = _34;
  return SV_Target;
}