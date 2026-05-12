#include "../tonemap.hlsli"

struct PostProcessMirrorStruct {
  float _ratio;
};


Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

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

struct BindlessParameters_PostProcessMirror {
  PostProcessMirrorStruct BindlessParameters_PostProcessMirror;
};

typedef BindlessParameters_PostProcessMirror BindlessParameters_PostProcessMirror_t;
ConstantBuffer<BindlessParameters_PostProcessMirror_t> BindlessParameters_PostProcessMirror[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  int _20;
  float _28;
  float4 _34;
  uint _38;
  float _52;
  float _257;
  float _258;
  float _259;
  float _352;
  float _353;
  float _354;
  float _474;
  float _475;
  float _476;
  float _497;
  float _498;
  float _499;
  float _532;
  float _533;
  float _534;
  float _548;
  float _549;
  float _550;
  float _61;
  float _110;
  float _111;
  float _112;
  float _114;
  float _121;
  float _122;
  float _123;
  float _142;
  float _143;
  float _144;
  float _145;
  float _146;
  float _147;
  float _148;
  float _149;
  float _150;
  float _196;
  float _197;
  float _198;
  float _199;
  float _200;
  float _201;
  float _202;
  float _219;
  float _220;
  float _221;
  float _222;
  float _228;
  float _231;
  float _238;
  float _239;
  float _240;
  float _269;
  float _294;
  float _295;
  float _296;
  float _315;
  float _316;
  float _317;
  float _323;
  float _327;
  float _328;
  float _329;
  float _330;
  float _335;
  float _360;
  float _364;
  float _365;
  float _366;
  float _367;
  int _408;
  float _463;
  float _487;
  float _488;
  float _492;
  float _539;
  float _15[36];
  _20 = WaveReadLaneFirst(_materialIndex);
  _28 = WaveReadLaneFirst(BindlessParameters_PostProcessMirror[((int)((uint)(select(((uint)_20 < (uint)170000), _20, 0)) + 0u))].BindlessParameters_PostProcessMirror._ratio);
  _34 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(select((_28 > 0.5f), (1.0f - TEXCOORD.x), TEXCOORD.x), TEXCOORD.y));
  _38 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _52 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _38, 0)))).x) & 127))) + 0.5f);
  } else {
    _52 = _postProcessParams.x;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_34.x, _34.y, _34.z));
    _474 = output_color.x;
    _475 = output_color.y;
    _476 = output_color.z;
  } else {
    _474 = _34.x;
    _475 = _34.y;
    _476 = _34.z;
  }
  if (_etcParams.y > 1.0f) {
    _487 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _488 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _492 = saturate(1.0f - (dot(float2(_487, _488), float2(_487, _488)) * saturate(_etcParams.y + -1.0f)));
    _497 = (_492 * _474);
    _498 = (_492 * _475);
    _499 = (_492 * _476);
  } else {
    _497 = _474;
    _498 = _475;
    _499 = _476;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _532 = select((_497 <= 0.0031308000907301903f), (_497 * 12.920000076293945f), (((pow(_497, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _533 = select((_498 <= 0.0031308000907301903f), (_498 * 12.920000076293945f), (((pow(_498, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _534 = select((_499 <= 0.0031308000907301903f), (_499 * 12.920000076293945f), (((pow(_499, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _532 = _497;
    _533 = _498;
    _534 = _499;
  }
  if (!(_etcParams.y < 1.0f)) {
    _539 = float((uint)_38);
    if (!(_539 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_539 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _548 = _532;
        _549 = _533;
        _550 = _534;
      } else {
        _548 = 0.0f;
        _549 = 0.0f;
        _550 = 0.0f;
      }
    } else {
      _548 = 0.0f;
      _549 = 0.0f;
      _550 = 0.0f;
    }
  } else {
    _548 = _532;
    _549 = _533;
    _550 = _534;
  }
  SV_Target.x = _548;
  SV_Target.y = _549;
  SV_Target.z = _550;
  SV_Target.w = _52;
  return SV_Target;
}