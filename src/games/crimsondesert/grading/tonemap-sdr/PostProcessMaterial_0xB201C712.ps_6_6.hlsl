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
  float _35 = (pow(_25.x, 0.012683313339948654f));
  float _36 = (pow(_25.y, 0.012683313339948654f));
  float _37 = (pow(_25.z, 0.012683313339948654f));
  float _62 = exp2(log2(max(0.0f, (_35 + -0.8359375f)) / (18.8515625f - (_35 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _63 = exp2(log2(max(0.0f, (_36 + -0.8359375f)) / (18.8515625f - (_36 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _64 = exp2(log2(max(0.0f, (_37 + -0.8359375f)) / (18.8515625f - (_37 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  int2 _66; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_66.x, _66.y);
  uint _81 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_66.x))))) + 0.5f) * TEXCOORD.x), int((float((int)(int(float((int)(_66.y))))) + 0.5f) * TEXCOORD.y), 0));
  float _91 = (float((uint)((uint)((uint)((uint)(_81.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
  float _92 = (float((uint)((uint)(((uint)((uint)(_81.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
  float _94 = 1.0f - abs(_91);
  float _95 = abs(_92);
  float _96 = _94 - _95;
  float _107;
  float _108;
  float _144;
  float _272;
  float _475;
  float _476;
  float _477;
  float _570;
  float _571;
  float _572;
  float _626;
  float _627;
  float _628;
  float _647;
  float _648;
  float _649;
  float _679;
  float _680;
  float _681;
  float _695;
  float _696;
  float _697;
  if (!(_96 >= 0.0f)) {
    _107 = (select((_91 >= 0.0f), 1.0f, -1.0f) * (1.0f - _95));
    _108 = (select((_92 >= 0.0f), 1.0f, -1.0f) * _94);
  } else {
    _107 = _91;
    _108 = _92;
  }
  float _110 = rsqrt(dot(float3(_107, _108, _96), float3(_107, _108, _96)));
  float _111 = _110 * _107;
  float _112 = _110 * _108;
  float _113 = _110 * _96;
  float _115 = rsqrt(dot(float3(_111, _112, _113), float3(_111, _112, _113)));
  if ((_81.x & 255) == _renderPassHousing) {
    int _133 = WaveReadLaneFirst(_materialIndex);
    _144 = (WaveReadLaneFirst(BindlessParameters_PostProcessHousing_CD[((int)((uint)(select(((uint)_133 < (uint)170000), _133, 0)) + 0u))]._housingPreviewRatio) * (1.0f - abs(dot(float3((_115 * _111), (_115 * _112), (_115 * _113)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))))));
  } else {
    _144 = 0.0f;
  }
  int _145 = WaveReadLaneFirst(_materialIndex);
  int _153 = WaveReadLaneFirst(BindlessParameters_PostProcessHousing_CD[((int)((uint)(select(((uint)_145 < (uint)170000), _145, 0)) + 0u))]._housingValidColor);
  float _156 = float((uint)((uint)(((uint)((uint)(_153)) >> 16) & 255)));
  float _159 = float((uint)((uint)(((uint)((uint)(_153)) >> 8) & 255)));
  float _161 = float((uint)((uint)(_153 & 255)));
  float _186 = select(((_156 * 0.003921568859368563f) < 0.040449999272823334f), (_156 * 0.0003035269910469651f), exp2(log2((_156 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
  float _187 = select(((_159 * 0.003921568859368563f) < 0.040449999272823334f), (_159 * 0.0003035269910469651f), exp2(log2((_159 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
  float _188 = select(((_161 * 0.003921568859368563f) < 0.040449999272823334f), (_161 * 0.0003035269910469651f), exp2(log2((_161 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
  int _189 = WaveReadLaneFirst(_materialIndex);
  int _197 = WaveReadLaneFirst(BindlessParameters_PostProcessHousing_CD[((int)((uint)(select(((uint)_189 < (uint)170000), _189, 0)) + 0u))]._housingInvalidColor);
  float _200 = float((uint)((uint)(((uint)((uint)(_197)) >> 16) & 255)));
  float _203 = float((uint)((uint)(((uint)((uint)(_197)) >> 8) & 255)));
  float _205 = float((uint)((uint)(_197 & 255)));
  float _246 = max(0.0010000000474974513f, _exposure0.x);
  float _256 = (((((_housingPreviewState * (select(((_200 * 0.003921568859368563f) < 0.040449999272823334f), (_200 * 0.0003035269910469651f), exp2(log2((_200 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _186)) + _186) / _246) - _62) * _144) + _62;
  float _257 = (((((_housingPreviewState * (select(((_203 * 0.003921568859368563f) < 0.040449999272823334f), (_203 * 0.0003035269910469651f), exp2(log2((_203 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _187)) + _187) / _246) - _63) * _144) + _63;
  float _258 = (((((_housingPreviewState * (select(((_205 * 0.003921568859368563f) < 0.040449999272823334f), (_205 * 0.0003035269910469651f), exp2(log2((_205 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _188)) + _188) / _246) - _64) * _144) + _64;
  uint _259 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _266 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_259), 0));
    _272 = (float((uint)((uint)(_266.x & 127))) + 0.5f);
  } else {
    _272 = 1.0f;
  }
  bool _275 = (_localToneMappingParams.w > 0.0f);
  if (_275) {
    float3 output_color = TonemapReplacer(float3(_256, _257, _258));
    _626 = output_color.x;
    _627 = output_color.y;
    _628 = output_color.z;
  } else {
    _626 = _256;
    _627 = _257;
    _628 = _258;
  }
  if (_etcParams.y > 1.0f) {
    float _637 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _638 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _642 = saturate(1.0f - (dot(float2(_637, _638), float2(_637, _638)) * saturate(_etcParams.y + -1.0f)));
    _647 = (_642 * _626);
    _648 = (_642 * _627);
    _649 = (_642 * _628);
  } else {
    _647 = _626;
    _648 = _627;
    _649 = _628;
  }
  if ((_275) && ((_etcParams.z > 0.0f))) {
    _679 = select((_647 <= 0.0031308000907301903f), (_647 * 12.920000076293945f), (((pow(_647, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _680 = select((_648 <= 0.0031308000907301903f), (_648 * 12.920000076293945f), (((pow(_648, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _681 = select((_649 <= 0.0031308000907301903f), (_649 * 12.920000076293945f), (((pow(_649, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _679 = _647;
    _680 = _648;
    _681 = _649;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _686 = float((uint)_259);
    if (!(_686 < _viewDir.w)) {
      if (!(_686 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _695 = _679;
        _696 = _680;
        _697 = _681;
      } else {
        _695 = 0.0f;
        _696 = 0.0f;
        _697 = 0.0f;
      }
    } else {
      _695 = 0.0f;
      _696 = 0.0f;
      _697 = 0.0f;
    }
  } else {
    _695 = _679;
    _696 = _680;
    _697 = _681;
  }
  float _707 = exp2(log2(_695 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _708 = exp2(log2(_696 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _709 = exp2(log2(_697 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_707 * 18.6875f) + 1.0f)) * ((_707 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_708 * 18.6875f) + 1.0f)) * ((_708 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_709 * 18.6875f) + 1.0f)) * ((_709 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _272;
  return SV_Target;
}