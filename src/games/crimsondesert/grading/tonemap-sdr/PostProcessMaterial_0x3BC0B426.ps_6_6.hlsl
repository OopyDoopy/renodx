Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t69, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t33, space36);

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
  float4 _17 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  uint _21 = uint(SV_Position.y);
  float _35;
  float _240;
  float _241;
  float _242;
  float _335;
  float _336;
  float _337;
  float _391;
  float _392;
  float _393;
  float _412;
  float _413;
  float _414;
  float _444;
  float _445;
  float _446;
  float _460;
  float _461;
  float _462;
  if (_etcParams.y == 1.0f) {
    uint2 _29 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_21), 0));
    _35 = (float((uint)((uint)(_29.x & 127))) + 0.5f);
  } else {
    _35 = 1.0f;
  }
  bool _38 = (_localToneMappingParams.w > 0.0f);
  if (_38) {
    float3 output_color = TonemapReplacer(float3(_17.x, _17.y, _17.z));
    _391 = output_color.x;
    _392 = output_color.y;
    _393 = output_color.z;
  } else {
    _391 = _17.x;
    _392 = _17.y;
    _393 = _17.z;
  }
  if (_etcParams.y > 1.0f) {
    float _402 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _403 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _407 = saturate(1.0f - (dot(float2(_402, _403), float2(_402, _403)) * saturate(_etcParams.y + -1.0f)));
    _412 = (_407 * _391);
    _413 = (_407 * _392);
    _414 = (_407 * _393);
  } else {
    _412 = _391;
    _413 = _392;
    _414 = _393;
  }
  if ((_38) && ((_etcParams.z > 0.0f))) {
    _444 = select((_412 <= 0.0031308000907301903f), (_412 * 12.920000076293945f), (((pow(_412, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _445 = select((_413 <= 0.0031308000907301903f), (_413 * 12.920000076293945f), (((pow(_413, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _446 = select((_414 <= 0.0031308000907301903f), (_414 * 12.920000076293945f), (((pow(_414, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _444 = _412;
    _445 = _413;
    _446 = _414;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _451 = float((uint)_21);
    if (!(_451 < _viewDir.w)) {
      if (!(_451 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _460 = _444;
        _461 = _445;
        _462 = _446;
      } else {
        _460 = 0.0f;
        _461 = 0.0f;
        _462 = 0.0f;
      }
    } else {
      _460 = 0.0f;
      _461 = 0.0f;
      _462 = 0.0f;
    }
  } else {
    _460 = _444;
    _461 = _445;
    _462 = _446;
  }
  SV_Target.x = _460;
  SV_Target.y = _461;
  SV_Target.z = _462;
  SV_Target.w = _35;
  return SV_Target;
}