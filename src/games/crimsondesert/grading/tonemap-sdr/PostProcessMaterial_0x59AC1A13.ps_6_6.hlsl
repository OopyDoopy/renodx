Texture2D<float4> __3__36__0__0__g_sceneColor : register(t32, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t40, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t33, space36);

Texture2D<uint> __3__36__0__0__g_CustomRenderPassValue : register(t79, space36);

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

#if 0 // Provided by tonemap.hlsli
cbuffer __3__35__0__0__ColorBlindConstantBuffer : register(b46, space35) {
  float4 _colorBlind0 : packoffset(c000.x);
  float4 _colorBlind1 : packoffset(c001.x);
  float4 _colorBlind2 : packoffset(c002.x);
};
#endif

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float4 _21 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _37 = float((int)(int((_bufferSizeAndInvSize.x + -1.0f) * saturate(TEXCOORD.x))));
  float _38 = float((int)(int((_bufferSizeAndInvSize.y + -1.0f) * saturate(TEXCOORD.y))));
  int2 _40; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_40.x, _40.y);
  uint _55 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_40.x))))) + 0.5f) * _37), int((float((int)(int(float((int)(_40.y))))) + 0.5f) * _38), 0));
  float _83;
  float _84;
  float _85;
  float _99;
  float _304;
  float _305;
  float _306;
  float _399;
  float _400;
  float _401;
  float _455;
  float _456;
  float _457;
  float _476;
  float _477;
  float _478;
  float _508;
  float _509;
  float _510;
  float _524;
  float _525;
  float _526;
  if (!((_55.x & 255) == 0)) {
    float4 _69 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_37 * _customRenderPassSizeInvSize.x), int(_38 * _customRenderPassSizeInvSize.y), 0));
    float _74 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    float _81 = saturate(ceil((0.10000000149011612f - (_nearFarProj.x / max(1.0000000116860974e-07f, _69.x))) + (_nearFarProj.x / max(1.0000000116860974e-07f, _74.x))));
    _83 = _81;
    _84 = _81;
    _85 = _81;
  } else {
    _83 = _21.x;
    _84 = _21.y;
    _85 = _21.z;
  }
  uint _86 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _93 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_86), 0));
    _99 = (float((uint)((uint)(_93.x & 127))) + 0.5f);
  } else {
    _99 = 1.0f;
  }
  bool _102 = (_localToneMappingParams.w > 0.0f);
  if (_102) {
    float3 output_color = TonemapReplacer(float3(_83, _84, _85));
    _455 = output_color.x;
    _456 = output_color.y;
    _457 = output_color.z;
  } else {
    _455 = _83;
    _456 = _84;
    _457 = _85;
  }
  if (_etcParams.y > 1.0f) {
    float _466 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _467 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _471 = saturate(1.0f - (dot(float2(_466, _467), float2(_466, _467)) * saturate(_etcParams.y + -1.0f)));
    _476 = (_471 * _455);
    _477 = (_471 * _456);
    _478 = (_471 * _457);
  } else {
    _476 = _455;
    _477 = _456;
    _478 = _457;
  }
  if ((_102) && ((_etcParams.z > 0.0f))) {
    _508 = select((_476 <= 0.0031308000907301903f), (_476 * 12.920000076293945f), (((pow(_476, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _509 = select((_477 <= 0.0031308000907301903f), (_477 * 12.920000076293945f), (((pow(_477, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _510 = select((_478 <= 0.0031308000907301903f), (_478 * 12.920000076293945f), (((pow(_478, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _508 = _476;
    _509 = _477;
    _510 = _478;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _515 = float((uint)_86);
    if (!(_515 < _viewDir.w)) {
      if (!(_515 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _524 = _508;
        _525 = _509;
        _526 = _510;
      } else {
        _524 = 0.0f;
        _525 = 0.0f;
        _526 = 0.0f;
      }
    } else {
      _524 = 0.0f;
      _525 = 0.0f;
      _526 = 0.0f;
    }
  } else {
    _524 = _508;
    _525 = _509;
    _526 = _510;
  }
  SV_Target.x = _524;
  SV_Target.y = _525;
  SV_Target.z = _526;
  SV_Target.w = _99;
  return SV_Target;
}