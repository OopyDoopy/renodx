#include "../tonemap.hlsli"

struct PostProcessAbyssEnterGlid_CDStruct {
  float _startYPos;
  float _endYPos;
  float _cubeScale;
  float _cameraSpeed;
  float _cameraSinIntensity;
  float3 _screenFadeColor;
  float _screenFadeRatio;
  float3 _fogColor;
  float3 _ambientColor;
  float3 _globalColor;
  float3 _lightColor;
  float3 _centerGlowColor;
  float _centerGlowRadius;
  float _stardustIntensity;
  float _particleIntensity;
  float _particleEmissionWidth;
  float _anamorphicIntensity;
  float _anamorphicWidth;
  float _largeHalo;
  float _largeHaloIntensity;
  float _middleHaloIntensity;
  float _blubIntensity;
  float _streakGlowIntensity;
  float _centerpoint;
  float _tunnelTotal;
  float _cameraFov;
  float _cubeDistance;
  uint _screenWarpTex;
  float _screenWarpRatio;
};


Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t36, space36);

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

struct BindlessParameters_PostProcessAbyssEnterGlid_CD {
  PostProcessAbyssEnterGlid_CDStruct BindlessParameters_PostProcessAbyssEnterGlid_CD;
};

typedef BindlessParameters_PostProcessAbyssEnterGlid_CD BindlessParameters_PostProcessAbyssEnterGlid_CD_t;
ConstantBuffer<BindlessParameters_PostProcessAbyssEnterGlid_CD_t> BindlessParameters_PostProcessAbyssEnterGlid_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

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
  int _29;
  float _37;
  float4 _47;
  float _58;
  float _59;
  float _60;
  float4 _90;
  float _100;
  float _101;
  float _102;
  float _133;
  float _134;
  float _135;
  float _136;
  float _143;
  float _144;
  float _145;
  uint _146;
  float _160;
  float _365;
  float _366;
  float _367;
  float _460;
  float _461;
  float _462;
  float _582;
  float _583;
  float _584;
  float _605;
  float _606;
  float _607;
  float _640;
  float _641;
  float _642;
  float _656;
  float _657;
  float _658;
  float _169;
  float _218;
  float _219;
  float _220;
  float _222;
  float _229;
  float _230;
  float _231;
  float _250;
  float _251;
  float _252;
  float _253;
  float _254;
  float _255;
  float _256;
  float _257;
  float _258;
  float _304;
  float _305;
  float _306;
  float _307;
  float _308;
  float _309;
  float _310;
  float _327;
  float _328;
  float _329;
  float _330;
  float _336;
  float _339;
  float _346;
  float _347;
  float _348;
  float _377;
  float _402;
  float _403;
  float _404;
  float _423;
  float _424;
  float _425;
  float _431;
  float _435;
  float _436;
  float _437;
  float _438;
  float _443;
  float _468;
  float _472;
  float _473;
  float _474;
  float _475;
  int _516;
  float _571;
  float _595;
  float _596;
  float _600;
  float _647;
  float _668;
  float _669;
  float _670;
  float _17[36];
  _20 = WaveReadLaneFirst(_materialIndex);
  _28 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterGlid_CD[((int)((uint)(select(((uint)_20 < (uint)170000), _20, 0)) + 0u))].BindlessParameters_PostProcessAbyssEnterGlid_CD._startYPos);
  _29 = WaveReadLaneFirst(_materialIndex);
  _37 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterGlid_CD[((int)((uint)(select(((uint)_29 < (uint)170000), _29, 0)) + 0u))].BindlessParameters_PostProcessAbyssEnterGlid_CD._endYPos);
  _47 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
  _58 = (pow(_47.x, 0.012683313339948654f));
  _59 = (pow(_47.y, 0.012683313339948654f));
  _60 = (pow(_47.z, 0.012683313339948654f));
  _90 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _100 = (pow(_90.x, 0.012683313339948654f));
  _101 = (pow(_90.y, 0.012683313339948654f));
  _102 = (pow(_90.z, 0.012683313339948654f));
  _133 = 10000.0f - (saturate(exp2(log2(1.0f - saturate((asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].y) - _37) / (_28 - _37))) * 2.200000047683716f) * 7.0f) * 9950.0f);
  _134 = _133 * exp2(log2(max(0.0f, (_100 + -0.8359375f)) / (18.8515625f - (_100 * 18.6875f))) * 6.277394771575928f);
  _135 = _133 * exp2(log2(max(0.0f, (_101 + -0.8359375f)) / (18.8515625f - (_101 * 18.6875f))) * 6.277394771575928f);
  _136 = _133 * exp2(log2(max(0.0f, (_102 + -0.8359375f)) / (18.8515625f - (_102 * 18.6875f))) * 6.277394771575928f);
  _143 = (((exp2(log2(max(0.0f, (_58 + -0.8359375f)) / (18.8515625f - (_58 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _134) * _47.w) + _134;
  _144 = (((exp2(log2(max(0.0f, (_59 + -0.8359375f)) / (18.8515625f - (_59 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _135) * _47.w) + _135;
  _145 = (((exp2(log2(max(0.0f, (_60 + -0.8359375f)) / (18.8515625f - (_60 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _136) * _47.w) + _136;
  _146 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _160 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _146, 0)))).x) & 127))) + 0.5f);
  } else {
    _160 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_143, _144, _145));
    _582 = output_color.x;
    _583 = output_color.y;
    _584 = output_color.z;
  } else {
    _582 = _143;
    _583 = _144;
    _584 = _145;
  }
  if (_etcParams.y > 1.0f) {
    _595 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _596 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _600 = saturate(1.0f - (dot(float2(_595, _596), float2(_595, _596)) * saturate(_etcParams.y + -1.0f)));
    _605 = (_600 * _582);
    _606 = (_600 * _583);
    _607 = (_600 * _584);
  } else {
    _605 = _582;
    _606 = _583;
    _607 = _584;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _640 = select((_605 <= 0.0031308000907301903f), (_605 * 12.920000076293945f), (((pow(_605, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _641 = select((_606 <= 0.0031308000907301903f), (_606 * 12.920000076293945f), (((pow(_606, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _642 = select((_607 <= 0.0031308000907301903f), (_607 * 12.920000076293945f), (((pow(_607, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _640 = _605;
    _641 = _606;
    _642 = _607;
  }
  if (!(_etcParams.y < 1.0f)) {
    _647 = float((uint)_146);
    if (!(_647 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_647 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _656 = _640;
        _657 = _641;
        _658 = _642;
      } else {
        _656 = 0.0f;
        _657 = 0.0f;
        _658 = 0.0f;
      }
    } else {
      _656 = 0.0f;
      _657 = 0.0f;
      _658 = 0.0f;
    }
  } else {
    _656 = _640;
    _657 = _641;
    _658 = _642;
  }
  _668 = exp2(log2(_656 * 9.999999747378752e-05f) * 0.1593017578125f);
  _669 = exp2(log2(_657 * 9.999999747378752e-05f) * 0.1593017578125f);
  _670 = exp2(log2(_658 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_668 * 18.6875f) + 1.0f)) * ((_668 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_669 * 18.6875f) + 1.0f)) * ((_669 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_670 * 18.6875f) + 1.0f)) * ((_670 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _160;
  return SV_Target;
}