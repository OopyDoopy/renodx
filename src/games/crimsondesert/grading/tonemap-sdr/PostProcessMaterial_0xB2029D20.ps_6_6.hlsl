struct PostProcessHousing_CDStruct {
  float _housingPreviewRatio;
  uint _housingValidColor;
  uint _housingInvalidColor;
};


Texture2D<float4> __3__36__0__0__g_sceneColor : register(t32, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t33, space36);

Texture2D<uint> __3__36__0__0__g_CustomRenderPassValue : register(t79, space36);

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
  float4 _25 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  int2 _30; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_30.x, _30.y);
  uint _45 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_30.x))))) + 0.5f) * TEXCOORD.x), int((float((int)(int(float((int)(_30.y))))) + 0.5f) * TEXCOORD.y), 0));
  float _55 = (float((uint)((uint)((uint)((uint)(_45.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
  float _56 = (float((uint)((uint)(((uint)((uint)(_45.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
  float _58 = 1.0f - abs(_55);
  float _59 = abs(_56);
  float _60 = _58 - _59;
  float _71;
  float _72;
  float _108;
  float _236;
  float _439;
  float _440;
  float _441;
  float _534;
  float _535;
  float _536;
  float _590;
  float _591;
  float _592;
  float _611;
  float _612;
  float _613;
  float _643;
  float _644;
  float _645;
  float _659;
  float _660;
  float _661;
  if (!(_60 >= 0.0f)) {
    _71 = (select((_55 >= 0.0f), 1.0f, -1.0f) * (1.0f - _59));
    _72 = (select((_56 >= 0.0f), 1.0f, -1.0f) * _58);
  } else {
    _71 = _55;
    _72 = _56;
  }
  float _74 = rsqrt(dot(float3(_71, _72, _60), float3(_71, _72, _60)));
  float _75 = _74 * _71;
  float _76 = _74 * _72;
  float _77 = _74 * _60;
  float _79 = rsqrt(dot(float3(_75, _76, _77), float3(_75, _76, _77)));
  if ((_45.x & 255) == _renderPassHousing) {
    int _97 = WaveReadLaneFirst(_materialIndex);
    _108 = (WaveReadLaneFirst(BindlessParameters_PostProcessHousing_CD[((int)((uint)(select(((uint)_97 < (uint)170000), _97, 0)) + 0u))]._housingPreviewRatio) * (1.0f - abs(dot(float3((_79 * _75), (_79 * _76), (_79 * _77)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))))));
  } else {
    _108 = 0.0f;
  }
  int _109 = WaveReadLaneFirst(_materialIndex);
  int _117 = WaveReadLaneFirst(BindlessParameters_PostProcessHousing_CD[((int)((uint)(select(((uint)_109 < (uint)170000), _109, 0)) + 0u))]._housingValidColor);
  float _120 = float((uint)((uint)(((uint)((uint)(_117)) >> 16) & 255)));
  float _123 = float((uint)((uint)(((uint)((uint)(_117)) >> 8) & 255)));
  float _125 = float((uint)((uint)(_117 & 255)));
  float _150 = select(((_120 * 0.003921568859368563f) < 0.040449999272823334f), (_120 * 0.0003035269910469651f), exp2(log2((_120 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
  float _151 = select(((_123 * 0.003921568859368563f) < 0.040449999272823334f), (_123 * 0.0003035269910469651f), exp2(log2((_123 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
  float _152 = select(((_125 * 0.003921568859368563f) < 0.040449999272823334f), (_125 * 0.0003035269910469651f), exp2(log2((_125 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
  int _153 = WaveReadLaneFirst(_materialIndex);
  int _161 = WaveReadLaneFirst(BindlessParameters_PostProcessHousing_CD[((int)((uint)(select(((uint)_153 < (uint)170000), _153, 0)) + 0u))]._housingInvalidColor);
  float _164 = float((uint)((uint)(((uint)((uint)(_161)) >> 16) & 255)));
  float _167 = float((uint)((uint)(((uint)((uint)(_161)) >> 8) & 255)));
  float _169 = float((uint)((uint)(_161 & 255)));
  float _210 = max(0.0010000000474974513f, _exposure0.x);
  float _220 = (((((_housingPreviewState * (select(((_164 * 0.003921568859368563f) < 0.040449999272823334f), (_164 * 0.0003035269910469651f), exp2(log2((_164 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _150)) + _150) / _210) - _25.x) * _108) + _25.x;
  float _221 = (((((_housingPreviewState * (select(((_167 * 0.003921568859368563f) < 0.040449999272823334f), (_167 * 0.0003035269910469651f), exp2(log2((_167 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _151)) + _151) / _210) - _25.y) * _108) + _25.y;
  float _222 = (((((_housingPreviewState * (select(((_169 * 0.003921568859368563f) < 0.040449999272823334f), (_169 * 0.0003035269910469651f), exp2(log2((_169 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _152)) + _152) / _210) - _25.z) * _108) + _25.z;
  uint _223 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _230 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_223), 0));
    _236 = (float((uint)((uint)(_230.x & 127))) + 0.5f);
  } else {
    _236 = 1.0f;
  }
  bool _239 = (_localToneMappingParams.w > 0.0f);
  if (_239) {
    float3 output_color = TonemapReplacer(float3(_220, _221, _222));
    _590 = output_color.x;
    _591 = output_color.y;
    _592 = output_color.z;
  } else {
    _590 = _220;
    _591 = _221;
    _592 = _222;
  }
  if (_etcParams.y > 1.0f) {
    float _601 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _602 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _606 = saturate(1.0f - (dot(float2(_601, _602), float2(_601, _602)) * saturate(_etcParams.y + -1.0f)));
    _611 = (_606 * _590);
    _612 = (_606 * _591);
    _613 = (_606 * _592);
  } else {
    _611 = _590;
    _612 = _591;
    _613 = _592;
  }
  if ((_239) && ((_etcParams.z > 0.0f))) {
    _643 = select((_611 <= 0.0031308000907301903f), (_611 * 12.920000076293945f), (((pow(_611, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _644 = select((_612 <= 0.0031308000907301903f), (_612 * 12.920000076293945f), (((pow(_612, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _645 = select((_613 <= 0.0031308000907301903f), (_613 * 12.920000076293945f), (((pow(_613, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _643 = _611;
    _644 = _612;
    _645 = _613;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _650 = float((uint)_223);
    if (!(_650 < _viewDir.w)) {
      if (!(_650 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _659 = _643;
        _660 = _644;
        _661 = _645;
      } else {
        _659 = 0.0f;
        _660 = 0.0f;
        _661 = 0.0f;
      }
    } else {
      _659 = 0.0f;
      _660 = 0.0f;
      _661 = 0.0f;
    }
  } else {
    _659 = _643;
    _660 = _644;
    _661 = _645;
  }
  SV_Target.x = _659;
  SV_Target.y = _660;
  SV_Target.z = _661;
  SV_Target.w = _236;
  return SV_Target;
}