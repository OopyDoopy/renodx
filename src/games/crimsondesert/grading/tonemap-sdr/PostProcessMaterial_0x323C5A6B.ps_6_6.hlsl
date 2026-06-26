struct PostProcessAbyssCommon_CDStruct {
  float _fogDepth;
  float _chromaticShiftValue;
  uint _noiseTex;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t69, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t32, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t40, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t33, space36);

Texture2D<float4> __3__36__0__0__g_CustomRenderPassDepth : register(t80, space36);

cbuffer __3__35__0__0__SceneConstantBuffer : register(b15, space35) {
  float4 _time;
  float4 _timeNoScale;
  uint4 _frameNumber;
  float4 _screenSizeAndInvSize;
  float4 _bufferSizeAndInvSize;
  float4 _hiZUVScaleAndInvScale;
  float4 _resolutionScale;
  float4 _temporalReprojectionParams;
  float4 _viewPos;
  float4 _viewDir;
  column_major float4x4 _viewProj;
  column_major float4x4 _viewProjNoJitter;
  column_major float4x4 _viewProjRelative;
  column_major float4x4 _viewProjRelativeNoJitter;
  column_major float4x4 _invViewProj;
  column_major float4x4 _invViewProjRelative;
  column_major float4x4 _invViewProjRelativeNoJitter;
  column_major float4x4 _viewProjRelativeOrtho;
  float4 _sunDirection;
  float4 _moonDirection;
  float4 _moonRight;
  float4 _moonUp;
  float4 _ssaoRandomDirection[16];
  column_major float4x4 _view;
  column_major float4x4 _viewRelative;
  column_major float4x4 _viewRelativePrev;
  column_major float4x4 _proj;
  column_major float4x4 _projNoJitter;
  float4 _viewPosPrev;
  column_major float4x4 _viewProjNoJitterPrev;
  column_major float4x4 _viewProjRelativePrev;
  column_major float4x4 _viewProjRelativeNoJitterPrev;
  column_major float4x4 _invViewProjPrev;
  column_major float4x4 _invViewProjRelativePrev;
  column_major float4x4 _projToPrevProj;
  column_major float4x4 _projToPrevProjNoTranslation;
  column_major float4x4 _viewProjectionTexScale;
  float4 _temporalAAJitter;
  float4 _temporalAAJitterParams;
  float4 _frustumPlanes[6];
  float4 _frustumPlanesPrev[6];
  float4 _frustumCornerDirs[4];
  float4 _screenPercentage;
  float4 _nearFarProj;
  float4 _renderingOriginPos;
  float4 _renderingOriginPosPrev;
  float4 _lodMaskRenderRate;
  float4 _terrainNormalParams;
  int4 _hiZMapInfo;
  int4 _hiZMapInfoCurrent;
  float4 _treeParams;
  uint4 _clusterSize;
  uint4 _globalLightParams;
  float4 _bevelParams;
  float4 _variableRateShadingParams;
  float4 _cavityParams;
  float4 _customRenderPassSizeInvSize;
  uint4 _impostorParams;
  float4 _clusterDecalSizeAndInvSize;
  uint4 _globalWindParams;
  float4 _windFluidVolumeParams;
  float4 _windFluidTextureParams;
  float4 _raytracingAccelerationStructureOrigin;
  float4 _debugBaseColor;
  float4 _debugNormal;
  float4 _debugMaterial;
  float4 _debugMultiplier;
  half4 _debugBaseColor16;
  half4 _debugNormal16;
  half4 _debugMaterial16;
  half4 _debugMultiplier16;
  float4 _debugCursorWorldPos;
  uint4 _debugRenderToggle01;
  uint4 _debugTreeShapeVariation;
  float4 _positionBasedDynamicsParameter;
  float _effectiveMetallicForVelvet;
  float _debugCharacterSnowRate;
  uint _systemRandomSeed;
  uint _skinnedMeshDebugFlag;
  float4 _viewPosShifted;
  float4 _viewPosShiftedPrev;
  float4 _viewTileRelativePos;
  float4 _viewTileRelativePosPrev;
  int2 _viewTileIndex;
  int2 _viewTileIndexPrev;
  float4 _worldVolume;
  float3 _diffViewPosAccurate;
  uint _isPhotosensitiveMode_isAllolwBlood;
};

#define RENODX_TONEMAP_EXTERNAL_SCENE_CONSTANT_BUFFER 1
#define RENODX_TONEMAP_SCENE_TIME_W _time.w
#include "../tonemap.hlsli"



#if 0 // Provided by tonemap.hlsli
cbuffer __3__35__0__0__ExposureConstantBuffer : register(b30, space35) {
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
  int _nightToneParm : packoffset(c012.x);
  int3 _padding : packoffset(c012.y);
};
#endif

cbuffer __3__1__0__0__PostProcessMaterialIndex : register(b2, space1) {
  int _materialIndex : packoffset(c000.x);
  int _passIndex : packoffset(c000.y);
};

#if 0 // Provided by tonemap.hlsli
cbuffer __3__35__0__0__ColorBlindConstantBuffer : register(b46, space35) {
  float4 _colorBlind0 : packoffset(c000.x);
  float4 _colorBlind1 : packoffset(c001.x);
  float4 _colorBlind2 : packoffset(c002.x);
};
#endif

ConstantBuffer<PostProcessAbyssCommon_CDStruct> BindlessParameters_PostProcessAbyssCommon_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _21 = (TEXCOORD.x * 2.0f) + -1.0f;
  float _22 = TEXCOORD.y * 2.0f;
  float _23 = 1.0f - _22;
  float _26 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _28 = max(1.0000000116860974e-07f, _26.x);
  float _64 = mad((_invViewProjRelative[3].z), _28, mad((_invViewProjRelative[3].y), _23, ((_invViewProjRelative[3].x) * _21))) + (_invViewProjRelative[3].w);
  float _68 = -0.0f - ((mad((_invViewProjRelative[0].z), _28, mad((_invViewProjRelative[0].y), _23, ((_invViewProjRelative[0].x) * _21))) + (_invViewProjRelative[0].w)) / _64);
  float _69 = -0.0f - ((mad((_invViewProjRelative[1].z), _28, mad((_invViewProjRelative[1].y), _23, ((_invViewProjRelative[1].x) * _21))) + (_invViewProjRelative[1].w)) / _64);
  float _70 = -0.0f - ((mad((_invViewProjRelative[2].z), _28, mad((_invViewProjRelative[2].y), _23, ((_invViewProjRelative[2].x) * _21))) + (_invViewProjRelative[2].w)) / _64);
  float _72 = rsqrt(dot(float3(_68, _69, _70), float3(_68, _69, _70)));
  float _73 = _72 * _68;
  float _74 = _72 * _69;
  float _75 = _72 * _70;
  int _76 = WaveReadLaneFirst(_materialIndex);
  int _84 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssCommon_CD[((int)((uint)(select(((uint)_76 < (uint)170000), _76, 0)) + 0u))]._noiseTex);
  float4 _91 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_84 < (uint)65000), _84, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_75, _73));
  int _98 = WaveReadLaneFirst(_materialIndex);
  int _106 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssCommon_CD[((int)((uint)(select(((uint)_98 < (uint)170000), _98, 0)) + 0u))]._noiseTex);
  float4 _113 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_106 < (uint)65000), _106, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_75, ((_time.x * 0.05000000074505806f) + _74)));
  int _122 = WaveReadLaneFirst(_materialIndex);
  int _130 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssCommon_CD[((int)((uint)(select(((uint)_122 < (uint)170000), _122, 0)) + 0u))]._noiseTex);
  float4 _137 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_130 < (uint)65000), _130, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_75 * 2.0f), ((_74 - (_time.x * 0.10000000149011612f)) * 2.0f)));
  float _140 = _137.x + _113.x;
  float _141 = _137.y + _113.y;
  int _146 = WaveReadLaneFirst(_materialIndex);
  int _154 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssCommon_CD[((int)((uint)(select(((uint)_146 < (uint)170000), _146, 0)) + 0u))]._noiseTex);
  float4 _161 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_154 < (uint)65000), _154, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((_time.x * 0.12999999523162842f) + _74), _73));
  int _170 = WaveReadLaneFirst(_materialIndex);
  int _178 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssCommon_CD[((int)((uint)(select(((uint)_170 < (uint)170000), _170, 0)) + 0u))]._noiseTex);
  float4 _185 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_178 < (uint)65000), _178, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_time.x * 0.10000000149011612f) + _74) * 2.0f), (_73 * 2.0f)));
  float _191 = abs(dot(float3(_73, _74, _75), float3(0.0f, 1.0f, 0.0f)));
  float _193 = abs(dot(float3(_73, _74, _75), float3(0.0f, 0.0f, 1.0f)));
  float _198 = (_191 * (_91.x - _140)) + _140;
  float _199 = (_191 * (_91.y - _141)) + _141;
  float _204 = (((_185.x + _161.x) - _198) * _193) + _198;
  float _205 = (((_185.y + _161.y) - _199) * _193) + _199;
  float _207 = saturate(_26.x * 35.0f);
  int _214 = WaveReadLaneFirst(_materialIndex);
  int _222 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssCommon_CD[((int)((uint)(select(((uint)_214 < (uint)170000), _214, 0)) + 0u))]._noiseTex);
  float4 _229 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_222 < (uint)65000), _222, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((TEXCOORD.x - (_time.x * 0.009999999776482582f)), ((_time.x * 0.10000000149011612f) + TEXCOORD.y)));
  float _236 = ((_229.x - _204) * _207) + _204;
  float4 _246 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(((TEXCOORD.x + -0.0019921569619327784f) + (_236 * 0.004000000189989805f)), ((TEXCOORD.y + -0.0019921569619327784f) + ((lerp(_205, _229.y, _207)) * 0.004000000189989805f))));
  float _253 = (pow(_246.y, 0.012683313339948654f));
  float _254 = (pow(_246.z, 0.012683313339948654f));
  float _283 = float((int)(int((_bufferSizeAndInvSize.x + -1.0f) * saturate(TEXCOORD.x))));
  float _284 = float((int)(int((_bufferSizeAndInvSize.y + -1.0f) * saturate(TEXCOORD.y))));
  float4 _293 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_283 * _customRenderPassSizeInvSize.x), int(_284 * _customRenderPassSizeInvSize.y), 0));
  float _322 = mad((_projToPrevProj[3].z), _293.x, mad((_projToPrevProj[3].y), _23, ((_projToPrevProj[3].x) * _21))) + (_projToPrevProj[3].w);
  float _337 = _236 + -0.4000000059604645f;
  float _341 = min(max(((_337 * 6.6666669845581055f) + -1.0f), -1.0f), 1.0f);
  float _344 = (_337 * 0.020000001415610313f) + -0.003000000026077032f;
  float _354;
  float _355;
  float _356;
  float _357;
  float _358;
  int _359;
  float _426;
  float _631;
  float _632;
  float _633;
  float _726;
  float _727;
  float _728;
  float _782;
  float _783;
  float _784;
  float _800;
  float _801;
  float _802;
  float _832;
  float _833;
  float _834;
  float _848;
  float _849;
  float _850;
  _354 = _344;
  _355 = _344;
  _356 = 0.0f;
  _357 = 0.0f;
  _358 = 0.0f;
  _359 = 1;
  while(true) {
    float _360 = float((int)(_359));
    float4 _369 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - ((_354 * (((((((mad((_projToPrevProj[0].z), _293.x, mad((_projToPrevProj[0].y), _23, ((_projToPrevProj[0].x) * _21))) + (_projToPrevProj[0].w)) / _322) - _21) * 2.5f) + -0.5f) + frac(frac(dot(float2(_283, _284), float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f)) - (_341 * 8.742277657347586e-08f))) * _360)), (TEXCOORD.y - ((_355 * (((((((mad((_projToPrevProj[1].z), _293.x, mad((_projToPrevProj[1].y), _23, ((_projToPrevProj[1].x) * _21))) + (_projToPrevProj[1].w)) / _322) - _23) * 2.5f) + -0.5f) + frac(frac(dot(float2((_283 + 32.665000915527344f), (_284 + 11.8149995803833f)), float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f)) - _341)) * _360))));
    float _376 = (_369.x * 0.125f) + _356;
    float _377 = (_369.y * 0.125f) + _357;
    float _378 = (_369.z * 0.125f) + _358;
    bool __defer_353_847 = false;
    if (!((_359 + 1) == 8)) {
      _354 = (_354 * 0.8999999761581421f);
      _355 = (_355 * 0.8999999761581421f);
      _356 = _376;
      _357 = _377;
      _358 = _378;
      _359 = (_359 + 1);
      continue;
    }
    if (__defer_353_847) {
      float _860 = exp2(log2(_848 * 9.999999747378752e-05f) * 0.1593017578125f);
      float _861 = exp2(log2(_849 * 9.999999747378752e-05f) * 0.1593017578125f);
      float _862 = exp2(log2(_850 * 9.999999747378752e-05f) * 0.1593017578125f);
      SV_Target.x = exp2(log2((1.0f / ((_860 * 18.6875f) + 1.0f)) * ((_860 * 18.8515625f) + 0.8359375f)) * 78.84375f);
      SV_Target.y = exp2(log2((1.0f / ((_861 * 18.6875f) + 1.0f)) * ((_861 * 18.8515625f) + 0.8359375f)) * 78.84375f);
      SV_Target.z = exp2(log2((1.0f / ((_862 * 18.6875f) + 1.0f)) * ((_862 * 18.8515625f) + 0.8359375f)) * 78.84375f);
      SV_Target.w = _426;
    }
    float _391 = (pow(_246.x, 0.012683313339948654f));
    float _403 = dot(float3((exp2(log2(max(0.0f, (_391 + -0.8359375f)) / (18.8515625f - (_391 * 18.6875f))) * 6.277394771575928f) * 10000.0f), (exp2(log2(max(0.0f, (_253 + -0.8359375f)) / (18.8515625f - (_253 * 18.6875f))) * 6.277394771575928f) * 10000.0f), (exp2(log2(max(0.0f, (_254 + -0.8359375f)) / (18.8515625f - (_254 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f)) * 0.30000001192092896f;
    float _410 = ((_403 - _376) * 0.20000000298023224f) + _376;
    float _411 = ((_403 - _377) * 0.20000000298023224f) + _377;
    float _412 = ((_403 - _378) * 0.20000000298023224f) + _378;
    uint _413 = uint(SV_Position.y);
    if (_etcParams.y == 1.0f) {
      uint2 _420 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_413), 0));
      _426 = (float((uint)((uint)(_420.x & 127))) + 0.5f);
    } else {
      _426 = 0.0f;
    }
    bool _429 = (_localToneMappingParams.w > 0.0f);
    if (_429) {
      float3 output_color = TonemapReplacer(float3(_410, _411, _412));
      _782 = output_color.x;
      _783 = output_color.y;
      _784 = output_color.z;
    } else {
      _782 = _410;
      _783 = _411;
      _784 = _412;
    }
    if (_etcParams.y > 1.0f) {
      float _790 = abs(_21);
      float _791 = abs(_22 + -1.0f);
      float _795 = saturate(1.0f - (dot(float2(_790, _791), float2(_790, _791)) * saturate(_etcParams.y + -1.0f)));
      _800 = (_795 * _782);
      _801 = (_795 * _783);
      _802 = (_795 * _784);
    } else {
      _800 = _782;
      _801 = _783;
      _802 = _784;
    }
    if ((_429) && ((_etcParams.z > 0.0f))) {
      _832 = select((_800 <= 0.0031308000907301903f), (_800 * 12.920000076293945f), (((pow(_800, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
      _833 = select((_801 <= 0.0031308000907301903f), (_801 * 12.920000076293945f), (((pow(_801, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
      _834 = select((_802 <= 0.0031308000907301903f), (_802 * 12.920000076293945f), (((pow(_802, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    } else {
      _832 = _800;
      _833 = _801;
      _834 = _802;
    }
    if (!(!(_etcParams.y >= 1.0f))) {
      float _839 = float((uint)_413);
      if (!(_839 < _viewDir.w)) {
        if (!(_839 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
          _848 = _832;
          _849 = _833;
          _850 = _834;
        } else {
          _848 = 0.0f;
          _849 = 0.0f;
          _850 = 0.0f;
        }
      } else {
        _848 = 0.0f;
        _849 = 0.0f;
        _850 = 0.0f;
      }
    } else {
      _848 = _832;
      _849 = _833;
      _850 = _834;
    }
    float _860 = exp2(log2(_848 * 9.999999747378752e-05f) * 0.1593017578125f);
    float _861 = exp2(log2(_849 * 9.999999747378752e-05f) * 0.1593017578125f);
    float _862 = exp2(log2(_850 * 9.999999747378752e-05f) * 0.1593017578125f);
    SV_Target.x = exp2(log2((1.0f / ((_860 * 18.6875f) + 1.0f)) * ((_860 * 18.8515625f) + 0.8359375f)) * 78.84375f);
    SV_Target.y = exp2(log2((1.0f / ((_861 * 18.6875f) + 1.0f)) * ((_861 * 18.8515625f) + 0.8359375f)) * 78.84375f);
    SV_Target.z = exp2(log2((1.0f / ((_862 * 18.6875f) + 1.0f)) * ((_862 * 18.8515625f) + 0.8359375f)) * 78.84375f);
    SV_Target.w = _426;
    break;
  }
  return SV_Target;
}