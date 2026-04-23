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
  float _34 = (pow(_24.x, 0.012683313339948654f));
  float _35 = (pow(_24.y, 0.012683313339948654f));
  float _36 = (pow(_24.z, 0.012683313339948654f));
  float _61 = exp2(log2(max(0.0f, (_34 + -0.8359375f)) / (18.8515625f - (_34 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _62 = exp2(log2(max(0.0f, (_35 + -0.8359375f)) / (18.8515625f - (_35 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _63 = exp2(log2(max(0.0f, (_36 + -0.8359375f)) / (18.8515625f - (_36 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  int2 _65; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_65.x, _65.y);
  uint _80 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_65.x))))) + 0.5f) * TEXCOORD.x), int((float((int)(int(float((int)(_65.y))))) + 0.5f) * TEXCOORD.y), 0));
  float _90 = (float((uint)((uint)((uint)((uint)(_80.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
  float _91 = (float((uint)((uint)(((uint)((uint)(_80.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
  float _93 = 1.0f - abs(_90);
  float _94 = abs(_91);
  float _95 = _93 - _94;
  float _106;
  float _107;
  float _143;
  float _271;
  float _515;
  float _516;
  float _517;
  float _637;
  float _638;
  float _639;
  float _660;
  float _661;
  float _662;
  float _695;
  float _696;
  float _697;
  float _711;
  float _712;
  float _713;
  if (!(_95 >= 0.0f)) {
    _106 = (select((_90 >= 0.0f), 1.0f, -1.0f) * (1.0f - _94));
    _107 = (select((_91 >= 0.0f), 1.0f, -1.0f) * _93);
  } else {
    _106 = _90;
    _107 = _91;
  }
  float _109 = rsqrt(dot(float3(_106, _107, _95), float3(_106, _107, _95)));
  float _110 = _109 * _106;
  float _111 = _109 * _107;
  float _112 = _109 * _95;
  float _114 = rsqrt(dot(float3(_110, _111, _112), float3(_110, _111, _112)));
  if ((_80.x & 255) == _renderPassHousing) {
    int _132 = WaveReadLaneFirst(_materialIndex);
    _143 = (WaveReadLaneFirst(BindlessParameters_PostProcessHousing_CD[((int)((uint)(select(((uint)_132 < (uint)170000), _132, 0)) + 0u))]._housingPreviewRatio) * (1.0f - abs(dot(float3((_114 * _110), (_114 * _111), (_114 * _112)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))))));
  } else {
    _143 = 0.0f;
  }
  int _144 = WaveReadLaneFirst(_materialIndex);
  int _152 = WaveReadLaneFirst(BindlessParameters_PostProcessHousing_CD[((int)((uint)(select(((uint)_144 < (uint)170000), _144, 0)) + 0u))]._housingValidColor);
  float _155 = float((uint)((uint)(((uint)((uint)(_152)) >> 16) & 255)));
  float _158 = float((uint)((uint)(((uint)((uint)(_152)) >> 8) & 255)));
  float _160 = float((uint)((uint)(_152 & 255)));
  float _185 = select(((_155 * 0.003921568859368563f) < 0.040449999272823334f), (_155 * 0.0003035269910469651f), exp2(log2((_155 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
  float _186 = select(((_158 * 0.003921568859368563f) < 0.040449999272823334f), (_158 * 0.0003035269910469651f), exp2(log2((_158 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
  float _187 = select(((_160 * 0.003921568859368563f) < 0.040449999272823334f), (_160 * 0.0003035269910469651f), exp2(log2((_160 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
  int _188 = WaveReadLaneFirst(_materialIndex);
  int _196 = WaveReadLaneFirst(BindlessParameters_PostProcessHousing_CD[((int)((uint)(select(((uint)_188 < (uint)170000), _188, 0)) + 0u))]._housingInvalidColor);
  float _199 = float((uint)((uint)(((uint)((uint)(_196)) >> 16) & 255)));
  float _202 = float((uint)((uint)(((uint)((uint)(_196)) >> 8) & 255)));
  float _204 = float((uint)((uint)(_196 & 255)));
  float _245 = max(0.0010000000474974513f, _exposure0.x);
  float _255 = (((((_housingPreviewState * (select(((_199 * 0.003921568859368563f) < 0.040449999272823334f), (_199 * 0.0003035269910469651f), exp2(log2((_199 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _185)) + _185) / _245) - _61) * _143) + _61;
  float _256 = (((((_housingPreviewState * (select(((_202 * 0.003921568859368563f) < 0.040449999272823334f), (_202 * 0.0003035269910469651f), exp2(log2((_202 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _186)) + _186) / _245) - _62) * _143) + _62;
  float _257 = (((((_housingPreviewState * (select(((_204 * 0.003921568859368563f) < 0.040449999272823334f), (_204 * 0.0003035269910469651f), exp2(log2((_204 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _187)) + _187) / _245) - _63) * _143) + _63;
  uint _258 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _265 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_258), 0));
    _271 = (float((uint)((uint)(_265.x & 127))) + 0.5f);
  } else {
    _271 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_255, _256, _257));
    _637 = output_color.x;
    _638 = output_color.y;
    _639 = output_color.z;
  } else {
    _637 = _255;
    _638 = _256;
    _639 = _257;
  }
  if (_etcParams.y > 1.0f) {
    float _650 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _651 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _655 = saturate(1.0f - (dot(float2(_650, _651), float2(_650, _651)) * saturate(_etcParams.y + -1.0f)));
    _660 = (_655 * _637);
    _661 = (_655 * _638);
    _662 = (_655 * _639);
  } else {
    _660 = _637;
    _661 = _638;
    _662 = _639;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _695 = select((_660 <= 0.0031308000907301903f), (_660 * 12.920000076293945f), (((pow(_660, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _696 = select((_661 <= 0.0031308000907301903f), (_661 * 12.920000076293945f), (((pow(_661, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _697 = select((_662 <= 0.0031308000907301903f), (_662 * 12.920000076293945f), (((pow(_662, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _695 = _660;
    _696 = _661;
    _697 = _662;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _702 = float((uint)_258);
    if (!(_702 < _viewDir.w)) {
      if (!(_702 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _711 = _695;
        _712 = _696;
        _713 = _697;
      } else {
        _711 = 0.0f;
        _712 = 0.0f;
        _713 = 0.0f;
      }
    } else {
      _711 = 0.0f;
      _712 = 0.0f;
      _713 = 0.0f;
    }
  } else {
    _711 = _695;
    _712 = _696;
    _713 = _697;
  }
  float _723 = exp2(log2(_711 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _724 = exp2(log2(_712 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _725 = exp2(log2(_713 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_723 * 18.6875f) + 1.0f)) * ((_723 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_724 * 18.6875f) + 1.0f)) * ((_724 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_725 * 18.6875f) + 1.0f)) * ((_725 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _271;
  return SV_Target;
}

