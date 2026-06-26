struct PostProcessScreenDamage_CDStruct {
  float _borderRatio;
  float _borderWidth;
  float _borderSmoothness;
  float _borderEdgeNoiseRatio;
  float2 _borderEdgeNoiseOffset;
  float2 _borderEdgeNoiseTile;
  uint _borderColor1;
  uint _borderColor2;
  uint _sceneColorTint;
  uint _borderEdgeNoiseTexture;
  uint _borderInsideDistortionTexture;
  float _borderFlickerSpeed;
  float _borderFlickerIntensity;
  float2 _borderFlickerOpacityMinMax;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t32, space36);

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

ConstantBuffer<PostProcessScreenDamage_CDStruct> BindlessParameters_PostProcessScreenDamage_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float4 _25 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _36 = (pow(_25.x, 0.012683313339948654f));
  float _37 = (pow(_25.y, 0.012683313339948654f));
  float _38 = (pow(_25.z, 0.012683313339948654f));
  float _63 = exp2(log2(max(0.0f, (_36 + -0.8359375f)) / (18.8515625f - (_36 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _64 = exp2(log2(max(0.0f, (_37 + -0.8359375f)) / (18.8515625f - (_37 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _65 = exp2(log2(max(0.0f, (_38 + -0.8359375f)) / (18.8515625f - (_38 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _404;
  float _405;
  float _406;
  float _420;
  float _625;
  float _626;
  float _627;
  float _720;
  float _721;
  float _722;
  float _776;
  float _777;
  float _778;
  float _797;
  float _798;
  float _799;
  float _829;
  float _830;
  float _831;
  float _845;
  float _846;
  float _847;
  if (!(!(_hpPercentage <= 20.0f))) {
    float _71 = 1.0f - (_hpPercentage * 0.009999999776482582f);
    if (((!(_hpPercentage <= 0.0f))) && ((_71 > 0.0f))) {
      float _77 = 0.12999999523162842f - (_hpPercentage * 0.006000000052154064f);
      float _79 = 2.0f - (_hpPercentage * 0.05000000074505806f);
      int _80 = WaveReadLaneFirst(_materialIndex);
      int _93 = WaveReadLaneFirst(_materialIndex);
      float _110 = _time.x * 0.30000001192092896f;
      int _113 = WaveReadLaneFirst(_materialIndex);
      int _121 = WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_113 < (uint)170000), _113, 0)) + 0u))]._borderInsideDistortionTexture);
      float4 _128 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_121 < (uint)65000), _121, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_110 + (TEXCOORD.x * 12.0f)), (_110 + (TEXCOORD.y * 6.0f))));
      float _130 = _128.x * 0.10000000149011612f;
      int _133 = WaveReadLaneFirst(_materialIndex);
      int _141 = WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_133 < (uint)170000), _133, 0)) + 0u))]._borderEdgeNoiseTexture);
      float4 _148 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_141 < (uint)65000), _141, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_93 < (uint)170000), _93, 0)) + 0u))]._borderEdgeNoiseOffset.x) + (WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_80 < (uint)170000), _80, 0)) + 0u))]._borderEdgeNoiseTile.x) * TEXCOORD.x)) + _130), ((WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_93 < (uint)170000), _93, 0)) + 0u))]._borderEdgeNoiseOffset.y) + (WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_80 < (uint)170000), _80, 0)) + 0u))]._borderEdgeNoiseTile.y) * TEXCOORD.y)) + _130)));
      int _150 = WaveReadLaneFirst(_materialIndex);
      float _164 = (_hpPercentage * 0.0020000000949949026f) + 0.36000001430511475f;
      float _167 = max((abs(TEXCOORD.x + -0.5f) - _164), 0.0f);
      float _168 = max((abs(TEXCOORD.y + -0.5f) - _164), 0.0f);
      int _181 = WaveReadLaneFirst(_materialIndex);
      float _190 = WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_181 < (uint)170000), _181, 0)) + 0u))]._borderFlickerOpacityMinMax.x);
      int _195 = WaveReadLaneFirst(_materialIndex);
      int _208 = WaveReadLaneFirst(_materialIndex);
      float _222 = min(max(_71, 0.0f), 1.0f) * saturate((saturate(((((WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_181 < (uint)170000), _181, 0)) + 0u))]._borderFlickerOpacityMinMax.y) - _190) * sin(frac(_time.x * _79) * 3.1415927410125732f)) + _190) * saturate(sqrt((_168 * _168) + (_167 * _167)) / WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_150 < (uint)170000), _150, 0)) + 0u))]._borderSmoothness))) * WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_195 < (uint)170000), _195, 0)) + 0u))]._borderFlickerIntensity)) * 2.0f) - (WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_208 < (uint)170000), _208, 0)) + 0u))]._borderEdgeNoiseRatio) * _148.x));
      int _223 = WaveReadLaneFirst(_materialIndex);
      int _231 = WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_223 < (uint)170000), _223, 0)) + 0u))]._sceneColorTint);
      float _234 = float((uint)((uint)(((uint)((uint)(_231)) >> 16) & 255)));
      float _237 = float((uint)((uint)(((uint)((uint)(_231)) >> 8) & 255)));
      float _239 = float((uint)((uint)(_231 & 255)));
      float _270 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
      int _274 = WaveReadLaneFirst(_materialIndex);
      int _282 = WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_274 < (uint)170000), _274, 0)) + 0u))]._borderColor1);
      float _285 = float((uint)((uint)(((uint)((uint)(_282)) >> 16) & 255)));
      float _288 = float((uint)((uint)(((uint)((uint)(_282)) >> 8) & 255)));
      float _290 = float((uint)((uint)(_282 & 255)));
      float _315 = select(((_285 * 0.003921568859368563f) < 0.040449999272823334f), (_285 * 0.0003035269910469651f), exp2(log2((_285 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
      float _316 = select(((_288 * 0.003921568859368563f) < 0.040449999272823334f), (_288 * 0.0003035269910469651f), exp2(log2((_288 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
      float _317 = select(((_290 * 0.003921568859368563f) < 0.040449999272823334f), (_290 * 0.0003035269910469651f), exp2(log2((_290 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
      int _318 = WaveReadLaneFirst(_materialIndex);
      int _326 = WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_318 < (uint)170000), _318, 0)) + 0u))]._borderColor2);
      float _329 = float((uint)((uint)(((uint)((uint)(_326)) >> 16) & 255)));
      float _332 = float((uint)((uint)(((uint)((uint)(_326)) >> 8) & 255)));
      float _334 = float((uint)((uint)(_326 & 255)));
      float _368 = saturate(sin(frac(_time.x * _79) * 3.1415927410125732f));
      float _381 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
      float _391 = (((_270 * select(((_234 * 0.003921568859368563f) < 0.040449999272823334f), (_234 * 0.0003035269910469651f), exp2(log2((_234 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) - _63) * _77) + _63;
      float _392 = (((_270 * select(((_237 * 0.003921568859368563f) < 0.040449999272823334f), (_237 * 0.0003035269910469651f), exp2(log2((_237 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) - _64) * _77) + _64;
      float _393 = (((_270 * select(((_239 * 0.003921568859368563f) < 0.040449999272823334f), (_239 * 0.0003035269910469651f), exp2(log2((_239 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) - _65) * _77) + _65;
      _404 = ((((_381 * ((_368 * (select(((_329 * 0.003921568859368563f) < 0.040449999272823334f), (_329 * 0.0003035269910469651f), exp2(log2((_329 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _315)) + _315)) - _391) * _222) + _391);
      _405 = ((((_381 * ((_368 * (select(((_332 * 0.003921568859368563f) < 0.040449999272823334f), (_332 * 0.0003035269910469651f), exp2(log2((_332 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _316)) + _316)) - _392) * _222) + _392);
      _406 = ((((_381 * ((_368 * (select(((_334 * 0.003921568859368563f) < 0.040449999272823334f), (_334 * 0.0003035269910469651f), exp2(log2((_334 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _317)) + _317)) - _393) * _222) + _393);
    } else {
      _404 = _63;
      _405 = _64;
      _406 = _65;
    }
  } else {
    _404 = _63;
    _405 = _64;
    _406 = _65;
  }
  uint _407 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _414 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_407), 0));
    _420 = (float((uint)((uint)(_414.x & 127))) + 0.5f);
  } else {
    _420 = _25.w;
  }
  bool _423 = (_localToneMappingParams.w > 0.0f);
  if (_423) {
    float3 output_color = TonemapReplacer(float3(_404, _405, _406));
    _776 = output_color.x;
    _777 = output_color.y;
    _778 = output_color.z;
  } else {
    _776 = _404;
    _777 = _405;
    _778 = _406;
  }
  if (_etcParams.y > 1.0f) {
    float _787 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _788 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _792 = saturate(1.0f - (dot(float2(_787, _788), float2(_787, _788)) * saturate(_etcParams.y + -1.0f)));
    _797 = (_792 * _776);
    _798 = (_792 * _777);
    _799 = (_792 * _778);
  } else {
    _797 = _776;
    _798 = _777;
    _799 = _778;
  }
  if ((_423) && ((_etcParams.z > 0.0f))) {
    _829 = select((_797 <= 0.0031308000907301903f), (_797 * 12.920000076293945f), (((pow(_797, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _830 = select((_798 <= 0.0031308000907301903f), (_798 * 12.920000076293945f), (((pow(_798, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _831 = select((_799 <= 0.0031308000907301903f), (_799 * 12.920000076293945f), (((pow(_799, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _829 = _797;
    _830 = _798;
    _831 = _799;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _836 = float((uint)_407);
    if (!(_836 < _viewDir.w)) {
      if (!(_836 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _845 = _829;
        _846 = _830;
        _847 = _831;
      } else {
        _845 = 0.0f;
        _846 = 0.0f;
        _847 = 0.0f;
      }
    } else {
      _845 = 0.0f;
      _846 = 0.0f;
      _847 = 0.0f;
    }
  } else {
    _845 = _829;
    _846 = _830;
    _847 = _831;
  }
  float _857 = exp2(log2(_845 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _858 = exp2(log2(_846 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _859 = exp2(log2(_847 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_857 * 18.6875f) + 1.0f)) * ((_857 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_858 * 18.6875f) + 1.0f)) * ((_858 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_859 * 18.6875f) + 1.0f)) * ((_859 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _420;
  return SV_Target;
}