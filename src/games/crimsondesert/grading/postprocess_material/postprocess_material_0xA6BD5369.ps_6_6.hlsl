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


Texture2D<float4> __3__36__0__0__g_sceneColor : register(t33, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t38, space36);

cbuffer __3__35__0__0__SceneConstantBuffer : register(b14, space35) {
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

#if 0
cbuffer __3__35__0__0__ExposureConstantBuffer : register(b29, space35) {
  float4 _exposure0 : packoffset(c000.x);
  float4 _exposure1 : packoffset(c001.x);
  float4 _exposure2 : packoffset(c002.x);
  float4 _exposure3 : packoffset(c003.x);
  float4 _exposure4 : packoffset(c004.x);
};

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
  int3 _padding : packoffset(c012.y);
};
#endif

cbuffer __3__1__0__0__PostProcessMaterialIndex : register(b2, space1) {
  int _materialIndex : packoffset(c000.x);
  int _passIndex : packoffset(c000.y);
};

ConstantBuffer<PostProcessTransition_CDStruct> BindlessParameters_PostProcessTransition_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _16[36];
  int _19 = WaveReadLaneFirst(_materialIndex);
  float _37;
  float _38;
  float _39;
  float _53;
  float _299;
  float _300;
  float _301;
  float _421;
  float _422;
  float _423;
  float _444;
  float _445;
  float _446;
  float _479;
  float _480;
  float _481;
  float _495;
  float _496;
  float _497;
  if (WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_19 < (uint)170000), _19, 0)) + 0u))]._chapterTransition) > 0.0f) {
    float4 _32 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
    _37 = _32.x;
    _38 = _32.y;
    _39 = _32.z;
  } else {
    _37 = 0.0f;
    _38 = 0.0f;
    _39 = 0.0f;
  }
  uint _40 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _47 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_40), 0));
    _53 = (float((uint)((uint)(_47.x & 127))) + 0.5f);
  } else {
    _53 = 0.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_37, _38, _39));
    _421 = output_color.x;
    _422 = output_color.y;
    _423 = output_color.z;
  } else {
    _421 = _37;
    _422 = _38;
    _423 = _39;
  }
  if (_etcParams.y > 1.0f) {
    float _434 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _435 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _439 = saturate(1.0f - (dot(float2(_434, _435), float2(_434, _435)) * saturate(_etcParams.y + -1.0f)));
    _444 = (_439 * _421);
    _445 = (_439 * _422);
    _446 = (_439 * _423);
  } else {
    _444 = _421;
    _445 = _422;
    _446 = _423;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _479 = select((_444 <= 0.0031308000907301903f), (_444 * 12.920000076293945f), (((pow(_444, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _480 = select((_445 <= 0.0031308000907301903f), (_445 * 12.920000076293945f), (((pow(_445, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _481 = select((_446 <= 0.0031308000907301903f), (_446 * 12.920000076293945f), (((pow(_446, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _479 = _444;
    _480 = _445;
    _481 = _446;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _486 = float((uint)_40);
    if (!(_486 < _viewDir.w)) {
      if (!(_486 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _495 = _479;
        _496 = _480;
        _497 = _481;
      } else {
        _495 = 0.0f;
        _496 = 0.0f;
        _497 = 0.0f;
      }
    } else {
      _495 = 0.0f;
      _496 = 0.0f;
      _497 = 0.0f;
    }
  } else {
    _495 = _479;
    _496 = _480;
    _497 = _481;
  }
  SV_Target.x = _495;
  SV_Target.y = _496;
  SV_Target.z = _497;
  SV_Target.w = _53;
  return SV_Target;
}

