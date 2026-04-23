#include "../tonemap.hlsli"

struct PostProcessChromaticAberrationStruct {
  float _ratio;
  float _shiftValue;
  float2 _shiftPosition;
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

cbuffer GlobalMaterialGlobalParameter_Common : register(b50, space98) {
  float3 _mainPosition : packoffset(c000.x);
  float3 _mainPositionPrev : packoffset(c001.x);
  float3 _targetFocusPosition : packoffset(c002.x);
  float _hpPercentage : packoffset(c002.w);
  uint _skinnedMeshNoiseTexture : packoffset(c003.x);
  float _highLightForVision : packoffset(c003.y);
  float _highLightForVisionRemoteCatch : packoffset(c003.z);
  float _characterHighlight : packoffset(c003.w);
  uint _specialModeType : packoffset(c004.x);
  float _visionRadius : packoffset(c004.y);
  float _interactionTime : packoffset(c004.z);
  float3 _questGuideWorldPosition : packoffset(c005.x);
  float3 _detectModeUp : packoffset(c006.x);
  float3 _detectModeLook : packoffset(c007.x);
  float3 _detectModePosition : packoffset(c008.x);
  float2 _detectModeLightProfileOffset : packoffset(c009.x);
  uint _detectModeLightProfileIndex : packoffset(c009.z);
  float _detectModeAngle : packoffset(c009.w);
  float _detectModeRadius : packoffset(c010.x);
  uint _useHatMode : packoffset(c010.y);
  uint4 _oreVeinBitMask : packoffset(c011.x);
  uint _oreVeinDissolveIndex : packoffset(c012.x);
  float _oreVeinDissolveRatio : packoffset(c012.y);
  float _hideStateRatio : packoffset(c012.z);
  float3 _hazardAlertPosition : packoffset(c013.x);
  float _wantedRegionRatio : packoffset(c013.w);
  float _wantedRegionOpacity : packoffset(c014.x);
  float _wantedRegionRadius : packoffset(c014.y);
  float3 _wantedRegionPosition : packoffset(c015.x);
  float _elementActivateDuration : packoffset(c015.w);
  float _temperatureWarning : packoffset(c016.x);
  float _electrocutionWarning : packoffset(c016.y);
  float _fleeCount : packoffset(c016.z);
  float _followLearning : packoffset(c016.w);
  float4 _enemyAlert1 : packoffset(c017.x);
  float4 _enemyAlert2 : packoffset(c018.x);
  float _pullingEffectAttractionOffRadius : packoffset(c019.x);
  float _pullingEffectPushFromCharacter : packoffset(c019.y);
  float _pullingEffectPushScale : packoffset(c019.z);
  float _pullingEffectAttractionScale : packoffset(c019.w);
  float _pullingEffectExternalScale : packoffset(c020.x);
  float _pullingEffectVectorFieldScale : packoffset(c020.y);
  float _pullingEffectHeightOffset : packoffset(c020.z);
  float _housingPreviewState : packoffset(c020.w);
  float _customEffectOpacity : packoffset(c021.x);
  uint _renderPassInteraction : packoffset(c021.y);
  uint _renderPassSelfPlayer : packoffset(c021.z);
  uint _renderPassEnemy : packoffset(c021.w);
  uint _renderPassTargetFocus : packoffset(c022.x);
  uint _renderPassLearning : packoffset(c022.y);
  uint _renderPassTest : packoffset(c022.z);
  uint _enableChromaticAberration : packoffset(c022.w);
  uint _renderPassDetectObjective : packoffset(c023.x);
  uint _renderPassDetectItem : packoffset(c023.y);
  uint _renderPassDetectGimmick : packoffset(c023.z);
  uint _renderPassDetectRemoteCatch : packoffset(c023.w);
  uint _renderPassDetectPickedRemoteCatch : packoffset(c024.x);
  uint _renderPassDetectLift : packoffset(c024.y);
  uint _renderPassKnowledgeNPC : packoffset(c024.z);
  uint _renderPassKnowledgeGain : packoffset(c024.w);
  uint _renderPassAnamorphicMural : packoffset(c025.x);
  uint _renderPassMemoryBackground : packoffset(c025.y);
  uint _renderPassMemory : packoffset(c025.z);
  uint _renderPassEnemyBoss : packoffset(c025.w);
  uint _renderPassAimHighlight : packoffset(c026.x);
  float4 _aimHighlightPosition : packoffset(c027.x);
  uint _renderPassNPCGhost : packoffset(c028.x);
  uint _renderPassHousing : packoffset(c028.y);
};

ConstantBuffer<PostProcessChromaticAberrationStruct> BindlessParameters_PostProcessChromaticAberration[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _17[36];
  int _22 = WaveReadLaneFirst(_materialIndex);
  float _33 = TEXCOORD.x - WaveReadLaneFirst(BindlessParameters_PostProcessChromaticAberration[((int)((uint)(select(((uint)_22 < (uint)170000), _22, 0)) + 0u))]._shiftPosition.x);
  float _34 = TEXCOORD.y - WaveReadLaneFirst(BindlessParameters_PostProcessChromaticAberration[((int)((uint)(select(((uint)_22 < (uint)170000), _22, 0)) + 0u))]._shiftPosition.y);
  int _44 = WaveReadLaneFirst(_materialIndex);
  float _56 = (((sqrt((_34 * _34) + (_33 * _33)) * 0.009999999776482582f) * float((uint)(uint)(_enableChromaticAberration))) * WaveReadLaneFirst(BindlessParameters_PostProcessChromaticAberration[((int)((uint)(select(((uint)_44 < (uint)170000), _44, 0)) + 0u))]._shiftValue)) * rsqrt(dot(float2(_33, _34), float2(_33, _34)));
  float _57 = _56 * _33;
  float _59 = _56 * _34;
  float4 _65 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _57), (TEXCOORD.y - _59)));
  float _69 = (pow(_65.x, 0.012683313339948654f));
  float _77 = exp2(log2(max(0.0f, (_69 + -0.8359375f)) / (18.8515625f - (_69 * 18.6875f))) * 6.277394771575928f);
  float4 _79 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _83 = (pow(_79.y, 0.012683313339948654f));
  float _91 = exp2(log2(max(0.0f, (_83 + -0.8359375f)) / (18.8515625f - (_83 * 18.6875f))) * 6.277394771575928f);
  float4 _93 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_57 + TEXCOORD.x), (_59 + TEXCOORD.y)));
  float _97 = (pow(_93.z, 0.012683313339948654f));
  float _105 = exp2(log2(max(0.0f, (_97 + -0.8359375f)) / (18.8515625f - (_97 * 18.6875f))) * 6.277394771575928f);
  uint _107 = uint(SV_Position.y);
  float _121;
  float _367;
  float _368;
  float _369;
  float _489;
  float _490;
  float _491;
  float _512;
  float _513;
  float _514;
  float _547;
  float _548;
  float _549;
  float _563;
  float _564;
  float _565;
  if (_etcParams.y == 1.0f) {
    uint2 _115 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_107), 0));
    _121 = (float((uint)((uint)(_115.x & 127))) + 0.5f);
  } else {
    _121 = _postProcessParams.x;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_77, _91, _105));
    _489 = output_color.x;
    _490 = output_color.y;
    _491 = output_color.z;
  } else {
    _489 = _77;
    _490 = _91;
    _491 = _105;
  }
  if (_etcParams.y > 1.0f) {
    float _502 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _503 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _507 = saturate(1.0f - (dot(float2(_502, _503), float2(_502, _503)) * saturate(_etcParams.y + -1.0f)));
    _512 = (_507 * _489);
    _513 = (_507 * _490);
    _514 = (_507 * _491);
  } else {
    _512 = _489;
    _513 = _490;
    _514 = _491;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _547 = select((_512 <= 0.0031308000907301903f), (_512 * 12.920000076293945f), (((pow(_512, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _548 = select((_513 <= 0.0031308000907301903f), (_513 * 12.920000076293945f), (((pow(_513, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _549 = select((_514 <= 0.0031308000907301903f), (_514 * 12.920000076293945f), (((pow(_514, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _547 = _512;
    _548 = _513;
    _549 = _514;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _554 = float((uint)_107);
    if (!(_554 < _viewDir.w)) {
      if (!(_554 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _563 = _547;
        _564 = _548;
        _565 = _549;
      } else {
        _563 = 0.0f;
        _564 = 0.0f;
        _565 = 0.0f;
      }
    } else {
      _563 = 0.0f;
      _564 = 0.0f;
      _565 = 0.0f;
    }
  } else {
    _563 = _547;
    _564 = _548;
    _565 = _549;
  }
  float _575 = exp2(log2(_563 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _576 = exp2(log2(_564 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _577 = exp2(log2(_565 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_575 * 18.6875f) + 1.0f)) * ((_575 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_576 * 18.6875f) + 1.0f)) * ((_576 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_577 * 18.6875f) + 1.0f)) * ((_577 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _121;
  return SV_Target;
}

