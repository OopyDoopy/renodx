#include "../tonemap.hlsli"

struct PostProcessTransition_CDStruct {
  uint _chapterNoiseTex;
  uint _chapterCardTex;
  uint _lensDirtTex;
  float _chapterTransition;
  uint _sceneTintColor;
  uint _chapterCardColor;
  uint _chapterBackgroundColor;
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

struct BindlessParameters_PostProcessTransition_CD {
  PostProcessTransition_CDStruct BindlessParameters_PostProcessTransition_CD;
};

typedef BindlessParameters_PostProcessTransition_CD BindlessParameters_PostProcessTransition_CD_t;
ConstantBuffer<BindlessParameters_PostProcessTransition_CD_t> BindlessParameters_PostProcessTransition_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  int _19;
  float _27;
  float _37;
  float _38;
  float _39;
  float _53;
  float _258;
  float _259;
  float _260;
  float _353;
  float _354;
  float _355;
  float _475;
  float _476;
  float _477;
  float _498;
  float _499;
  float _500;
  float _533;
  float _534;
  float _535;
  float _549;
  float _550;
  float _551;
  float4 _32;
  uint _40;
  float _62;
  float _111;
  float _112;
  float _113;
  float _115;
  float _122;
  float _123;
  float _124;
  float _143;
  float _144;
  float _145;
  float _146;
  float _147;
  float _148;
  float _149;
  float _150;
  float _151;
  float _197;
  float _198;
  float _199;
  float _200;
  float _201;
  float _202;
  float _203;
  float _220;
  float _221;
  float _222;
  float _223;
  float _229;
  float _232;
  float _239;
  float _240;
  float _241;
  float _270;
  float _295;
  float _296;
  float _297;
  float _316;
  float _317;
  float _318;
  float _324;
  float _328;
  float _329;
  float _330;
  float _331;
  float _336;
  float _361;
  float _365;
  float _366;
  float _367;
  float _368;
  int _409;
  float _464;
  float _488;
  float _489;
  float _493;
  float _540;
  float _16[36];
  _19 = WaveReadLaneFirst(_materialIndex);
  _27 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_19 < (uint)170000), _19, 0)) + 0u))].BindlessParameters_PostProcessTransition_CD._chapterTransition);
  if (_27 > 0.0f) {
    _32 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
    _37 = _32.x;
    _38 = _32.y;
    _39 = _32.z;
  } else {
    _37 = 0.0f;
    _38 = 0.0f;
    _39 = 0.0f;
  }
  _40 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _53 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _40, 0)))).x) & 127))) + 0.5f);
  } else {
    _53 = 0.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_37, _38, _39));
    _475 = output_color.x;
    _476 = output_color.y;
    _477 = output_color.z;
  } else {
    _475 = _37;
    _476 = _38;
    _477 = _39;
  }
  if (_etcParams.y > 1.0f) {
    _488 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _489 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _493 = saturate(1.0f - (dot(float2(_488, _489), float2(_488, _489)) * saturate(_etcParams.y + -1.0f)));
    _498 = (_493 * _475);
    _499 = (_493 * _476);
    _500 = (_493 * _477);
  } else {
    _498 = _475;
    _499 = _476;
    _500 = _477;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _533 = select((_498 <= 0.0031308000907301903f), (_498 * 12.920000076293945f), (((pow(_498, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _534 = select((_499 <= 0.0031308000907301903f), (_499 * 12.920000076293945f), (((pow(_499, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _535 = select((_500 <= 0.0031308000907301903f), (_500 * 12.920000076293945f), (((pow(_500, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _533 = _498;
    _534 = _499;
    _535 = _500;
  }
  if (!(_etcParams.y < 1.0f)) {
    _540 = float((uint)_40);
    if (!(_540 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_540 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _549 = _533;
        _550 = _534;
        _551 = _535;
      } else {
        _549 = 0.0f;
        _550 = 0.0f;
        _551 = 0.0f;
      }
    } else {
      _549 = 0.0f;
      _550 = 0.0f;
      _551 = 0.0f;
    }
  } else {
    _549 = _533;
    _550 = _534;
    _551 = _535;
  }
  SV_Target.x = _549;
  SV_Target.y = _550;
  SV_Target.z = _551;
  SV_Target.w = _53;
  return SV_Target;
}