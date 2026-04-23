#include "../tonemap.hlsli"

struct PostProcessHousing_CDStruct {
  float _housingPreviewRatio;
  uint _housingValidColor;
  uint _housingInvalidColor;
};


Texture2D<float4> __3__36__0__0__g_sceneColor : register(t33, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t38, space36);

Texture2D<uint> __3__36__0__0__g_CustomRenderPassValue : register(t65, space36);

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

ConstantBuffer<PostProcessHousing_CDStruct> BindlessParameters_PostProcessHousing_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _19[36];
  float4 _24 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  int2 _29; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_29.x, _29.y);
  uint _44 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_29.x))))) + 0.5f) * TEXCOORD.x), int((float((int)(int(float((int)(_29.y))))) + 0.5f) * TEXCOORD.y), 0));
  float _54 = (float((uint)((uint)((uint)((uint)(_44.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
  float _55 = (float((uint)((uint)(((uint)((uint)(_44.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
  float _57 = 1.0f - abs(_54);
  float _58 = abs(_55);
  float _59 = _57 - _58;
  float _70;
  float _71;
  float _107;
  float _235;
  float _479;
  float _480;
  float _481;
  float _601;
  float _602;
  float _603;
  float _624;
  float _625;
  float _626;
  float _659;
  float _660;
  float _661;
  float _675;
  float _676;
  float _677;
  if (!(_59 >= 0.0f)) {
    _70 = (select((_54 >= 0.0f), 1.0f, -1.0f) * (1.0f - _58));
    _71 = (select((_55 >= 0.0f), 1.0f, -1.0f) * _57);
  } else {
    _70 = _54;
    _71 = _55;
  }
  float _73 = rsqrt(dot(float3(_70, _71, _59), float3(_70, _71, _59)));
  float _74 = _73 * _70;
  float _75 = _73 * _71;
  float _76 = _73 * _59;
  float _78 = rsqrt(dot(float3(_74, _75, _76), float3(_74, _75, _76)));
  if ((_44.x & 255) == _renderPassHousing) {
    int _96 = WaveReadLaneFirst(_materialIndex);
    _107 = (WaveReadLaneFirst(BindlessParameters_PostProcessHousing_CD[((int)((uint)(select(((uint)_96 < (uint)170000), _96, 0)) + 0u))]._housingPreviewRatio) * (1.0f - abs(dot(float3((_78 * _74), (_78 * _75), (_78 * _76)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))))));
  } else {
    _107 = 0.0f;
  }
  int _108 = WaveReadLaneFirst(_materialIndex);
  int _116 = WaveReadLaneFirst(BindlessParameters_PostProcessHousing_CD[((int)((uint)(select(((uint)_108 < (uint)170000), _108, 0)) + 0u))]._housingValidColor);
  float _119 = float((uint)((uint)(((uint)((uint)(_116)) >> 16) & 255)));
  float _122 = float((uint)((uint)(((uint)((uint)(_116)) >> 8) & 255)));
  float _124 = float((uint)((uint)(_116 & 255)));
  float _149 = select(((_119 * 0.003921568859368563f) < 0.040449999272823334f), (_119 * 0.0003035269910469651f), exp2(log2((_119 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
  float _150 = select(((_122 * 0.003921568859368563f) < 0.040449999272823334f), (_122 * 0.0003035269910469651f), exp2(log2((_122 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
  float _151 = select(((_124 * 0.003921568859368563f) < 0.040449999272823334f), (_124 * 0.0003035269910469651f), exp2(log2((_124 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
  int _152 = WaveReadLaneFirst(_materialIndex);
  int _160 = WaveReadLaneFirst(BindlessParameters_PostProcessHousing_CD[((int)((uint)(select(((uint)_152 < (uint)170000), _152, 0)) + 0u))]._housingInvalidColor);
  float _163 = float((uint)((uint)(((uint)((uint)(_160)) >> 16) & 255)));
  float _166 = float((uint)((uint)(((uint)((uint)(_160)) >> 8) & 255)));
  float _168 = float((uint)((uint)(_160 & 255)));
  float _209 = max(0.0010000000474974513f, _exposure0.x);
  float _219 = (((((_housingPreviewState * (select(((_163 * 0.003921568859368563f) < 0.040449999272823334f), (_163 * 0.0003035269910469651f), exp2(log2((_163 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _149)) + _149) / _209) - _24.x) * _107) + _24.x;
  float _220 = (((((_housingPreviewState * (select(((_166 * 0.003921568859368563f) < 0.040449999272823334f), (_166 * 0.0003035269910469651f), exp2(log2((_166 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _150)) + _150) / _209) - _24.y) * _107) + _24.y;
  float _221 = (((((_housingPreviewState * (select(((_168 * 0.003921568859368563f) < 0.040449999272823334f), (_168 * 0.0003035269910469651f), exp2(log2((_168 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _151)) + _151) / _209) - _24.z) * _107) + _24.z;
  uint _222 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _229 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_222), 0));
    _235 = (float((uint)((uint)(_229.x & 127))) + 0.5f);
  } else {
    _235 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_219, _220, _221));
    _601 = output_color.x;
    _602 = output_color.y;
    _603 = output_color.z;
  } else {
    _601 = _219;
    _602 = _220;
    _603 = _221;
  }
  if (_etcParams.y > 1.0f) {
    float _614 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _615 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _619 = saturate(1.0f - (dot(float2(_614, _615), float2(_614, _615)) * saturate(_etcParams.y + -1.0f)));
    _624 = (_619 * _601);
    _625 = (_619 * _602);
    _626 = (_619 * _603);
  } else {
    _624 = _601;
    _625 = _602;
    _626 = _603;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _659 = select((_624 <= 0.0031308000907301903f), (_624 * 12.920000076293945f), (((pow(_624, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _660 = select((_625 <= 0.0031308000907301903f), (_625 * 12.920000076293945f), (((pow(_625, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _661 = select((_626 <= 0.0031308000907301903f), (_626 * 12.920000076293945f), (((pow(_626, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _659 = _624;
    _660 = _625;
    _661 = _626;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _666 = float((uint)_222);
    if (!(_666 < _viewDir.w)) {
      if (!(_666 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _675 = _659;
        _676 = _660;
        _677 = _661;
      } else {
        _675 = 0.0f;
        _676 = 0.0f;
        _677 = 0.0f;
      }
    } else {
      _675 = 0.0f;
      _676 = 0.0f;
      _677 = 0.0f;
    }
  } else {
    _675 = _659;
    _676 = _660;
    _677 = _661;
  }
  SV_Target.x = _675;
  SV_Target.y = _676;
  SV_Target.z = _677;
  SV_Target.w = _235;
  return SV_Target;
}

