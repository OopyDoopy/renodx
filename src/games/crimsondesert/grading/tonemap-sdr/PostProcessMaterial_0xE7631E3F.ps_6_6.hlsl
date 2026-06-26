struct PostProcessLensFlareForGimmick_CDStruct {
  uint _lensDirtTexture;
  uint _lensColorTableTexture;
  uint _noiseTex;
  uint _noiseTex2;
  float _lensflareRatio;
  float _sunFlareScale;
  float _sunFlareIntensity;
  float _sunFlareAnimSpeed;
  float _sunFlareWeightThreshold;
  float _sunFlareWeightIntensity;
  float _lensDirtIntensity;
  float _lensDirtThreshold;
  float _chromaticShiftValue;
  float _useFishUV;
  float _fishEyeIntensity;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t69, space36);

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

cbuffer __3__1__0__0__PostProcessSizeConstant : register(b1, space1) {
  float4 _srcTargetSizeAndInv : packoffset(c000.x);
  float4 _destTargetSizAndInv : packoffset(c001.x);
};

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

ConstantBuffer<PostProcessLensFlareForGimmick_CDStruct> BindlessParameters_PostProcessLensFlareForGimmick_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float4 _28 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  int _30 = WaveReadLaneFirst(_materialIndex);
  float _39 = TEXCOORD.x + -0.5f;
  float _40 = TEXCOORD.y + -0.5f;
  float _48 = rsqrt(dot(float2(_39, _40), float2(_39, _40))) * (sqrt((_40 * _40) + (_39 * _39)) * WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_30 < (uint)170000), _30, 0)) + 0u))]._chromaticShiftValue));
  float _49 = _48 * _39;
  float _51 = _48 * _40;
  float4 _57 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _49), (TEXCOORD.y - _51)));
  float4 _59 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float4 _61 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_49 + TEXCOORD.x), (_51 + TEXCOORD.y)));
  float4 _65 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
  float _72 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  int _73 = WaveReadLaneFirst(_materialIndex);
  float _81 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_73 < (uint)170000), _73, 0)) + 0u))]._fishEyeIntensity);
  float _87 = (_srcTargetSizeAndInv.x * TEXCOORD.x) / _srcTargetSizeAndInv.x;
  float _88 = (_srcTargetSizeAndInv.y * TEXCOORD.y) / _srcTargetSizeAndInv.x;
  float _89 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  float _90 = 0.5f / _89;
  float _91 = _87 + -0.5f;
  float _92 = _88 - _90;
  float _93 = dot(float2(_91, _92), float2(_91, _92));
  float _94 = sqrt(_93);
  bool _95 = (_81 > 0.0f);
  float _103;
  float _140;
  float _141;
  float _670;
  float _671;
  float _672;
  float _686;
  float _891;
  float _892;
  float _893;
  float _986;
  float _987;
  float _988;
  float _1042;
  float _1043;
  float _1044;
  float _1063;
  float _1064;
  float _1065;
  float _1095;
  float _1096;
  float _1097;
  float _1111;
  float _1112;
  float _1113;
  if (_95) {
    _103 = sqrt(dot(float2(0.5f, _90), float2(0.5f, _90)));
  } else {
    if (!(_89 < 1.0f)) {
      _103 = _90;
    } else {
      _103 = 0.5f;
    }
  }
  if (_95) {
    float _105 = rsqrt(_93);
    float _107 = tan(_94 * _81);
    float _115 = tan(_103 * _81);
    _140 = (((((_103 * _91) * _105) * _107) / _115) + 0.5f);
    _141 = (((((_103 * _92) * _105) * _107) / _115) + _90);
  } else {
    if (_81 < 0.0f) {
      float _123 = rsqrt(_93);
      float _124 = _81 * -10.0f;
      float _126 = atan(_94 * _124);
      float _134 = atan(_103 * _124);
      _140 = (((((_103 * _91) * _123) * _126) / _134) + 0.5f);
      _141 = (((((_103 * _92) * _123) * _126) / _134) + _90);
    } else {
      _140 = _87;
      _141 = _88;
    }
  }
  int _143 = WaveReadLaneFirst(_materialIndex);
  bool _152 = (WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_143 < (uint)170000), _143, 0)) + 0u))]._useFishUV) == 1.0f);
  float _155 = select(_152, _140, TEXCOORD.x) + -0.5f;
  float _156 = select(_152, (_141 * _89), TEXCOORD.y) + -0.5f;
  float _157 = _155 * _72;
  float _197 = mad((_viewProj[3].z), _questGuideWorldPosition.z, mad((_viewProj[3].y), _questGuideWorldPosition.y, ((_viewProj[3].x) * _questGuideWorldPosition.x))) + (_viewProj[3].w);
  float _200 = (mad((_viewProj[2].z), _questGuideWorldPosition.z, mad((_viewProj[2].y), _questGuideWorldPosition.y, ((_viewProj[2].x) * _questGuideWorldPosition.x))) + (_viewProj[2].w)) / _197;
  float _201 = ((mad((_viewProj[1].z), _questGuideWorldPosition.z, mad((_viewProj[1].y), _questGuideWorldPosition.y, ((_viewProj[1].x) * _questGuideWorldPosition.x))) + (_viewProj[1].w)) / _197) * -0.5f;
  float _203 = (_72 * 0.5f) * ((mad((_viewProj[0].z), _questGuideWorldPosition.z, mad((_viewProj[0].y), _questGuideWorldPosition.y, ((_viewProj[0].x) * _questGuideWorldPosition.x))) + (_viewProj[0].w)) / _197);
  if ((!(abs(_questGuideWorldPosition.x) <= 9.999999747378752e-06f)) || ((!(!(abs(_questGuideWorldPosition.x) <= 9.999999747378752e-06f))) && (!(abs(_questGuideWorldPosition.y) <= 9.999999747378752e-06f)))) {
    if (!(((_201 >= 1.0499999523162842f)) || ((((_201 <= -1.5f)) || ((((_203 >= 1.600000023841858f)) || ((((_203 <= -1.600000023841858f)) || ((((_200 < 0.0f)) || ((_203 <= -1.5f)))))))))))) {
      float _237 = _157 - _203;
      float _238 = _156 - _201;
      float _240 = atan(_237 / _238);
      bool _243 = (_238 < 0.0f);
      bool _244 = (_238 == 0.0f);
      bool _245 = (_237 >= 0.0f);
      bool _246 = (_237 < 0.0f);
      bool _249 = (_246) && (_243);
      float _250 = select(_249, (_240 + -3.1415927410125732f), select(((_245) && (_243)), (_240 + 3.1415927410125732f), _240));
      bool _251 = (_246) && (_244);
      bool _253 = (_245) && (_244);
      float _254 = select(_253, 1.5707963705062866f, select(_251, -1.5707963705062866f, _250));
      float _258 = sqrt((_238 * _238) + (_237 * _237));
      int _275 = WaveReadLaneFirst(_materialIndex);
      int _285 = WaveReadLaneFirst(_materialIndex);
      float _299 = _203 - _157;
      float _300 = _201 - _156;
      int _305 = WaveReadLaneFirst(_materialIndex);
      float _316 = max((0.019999999552965164f / (WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_305 < (uint)170000), _305, 0)) + 0u))]._sunFlareScale) * sqrt((_300 * _300) + (_299 * _299)))), 0.0f);
      float _317 = _316 * _316;
      int _328 = WaveReadLaneFirst(_materialIndex);
      float _337 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_328 < (uint)170000), _328, 0)) + 0u))]._sunFlareAnimSpeed) * _time.x;
      int _339 = WaveReadLaneFirst(_materialIndex);
      int _347 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_339 < (uint)170000), _339, 0)) + 0u))]._noiseTex);
      float4 _354 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_347 < (uint)65000), _347, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((sin((_254 * 2.0f) + _203) * 4.0f) - cos((_254 * 3.0f) + _201)) + _337), _337));
      float _362 = 1.0f / exp2((_258 * 1.4426950216293335f) * ((frac(_354.x) * 0.6600000262260437f) + 0.33000001311302185f));
      float _365 = frac((_362 * 20.0f) + 1.0031249523162842f);
      float _372 = exp2(log2(1.0f - abs((_362 * 2.0f) + -1.0f)) * 0.30000001192092896f);
      float _409 = sin(select(_253, 6.2831854820251465f, select(_251, -6.2831854820251465f, (_250 * 4.0f))));
      float _410 = _409 * _237;
      float _411 = _409 * _238;
      float _430 = exp2(log2(((saturate(_362 + -0.8999999761581421f) * 3.0f) + exp2(log2(1.0f - saturate(sqrt((_410 * _410) + (_411 * _411)))) * 8.0f)) * _362) * 12.949999809265137f) * (_362 * 0.4999999701976776f);
      int _434 = WaveReadLaneFirst(_materialIndex);
      int _442 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_434 < (uint)170000), _434, 0)) + 0u))]._noiseTex);
      float _446 = exp2(log2(_258 * 16.0f) * 0.5f);
      float _450 = atan(_238 / _237);
      bool _453 = (_237 == 0.0f);
      bool _454 = (_238 >= 0.0f);
      float4 _471 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_442 < (uint)65000), _442, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(select(((_453) && (_454)), 2.356194496154785f, select(((_453) && (_243)), -2.356194496154785f, (select(_249, (_450 + -3.1415927410125732f), select(((_246) && (_454)), (_450 + 3.1415927410125732f), _450)) * 1.5f))), ((_time.x * 0.20000000298023224f) - _446)));
      float _478 = atan((-0.0f - _238) / (-0.0f - _237));
      bool _481 = (_237 > -0.0f);
      bool _482 = (_237 == -0.0f);
      bool _483 = (_238 <= -0.0f);
      bool _484 = (_238 > -0.0f);
      float4 _499 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_442 < (uint)65000), _442, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(select(((_482) && (_483)), 2.356194496154785f, select(((_482) && (_484)), -2.356194496154785f, (select(((_481) && (_484)), (_478 + -3.1415927410125732f), select(((_481) && (_483)), (_478 + 3.1415927410125732f), _478)) * 1.5f))), ((_time.x * 0.20000000298023224f) - (_446 * 0.5f))));
      float _524 = exp2(log2(min(max((1.0f - (_258 * 2.0f)), 0.0f), 1.0f)) * 5.199999809265137f);
      float _535 = exp2(log2(min(max((1.100000023841858f - (_258 * 4.0f)), 0.0f), 1.0f)) * 4.199999809265137f) * 0.10000000149011612f;
      float _550 = (((pow(_258, 0.10000000149011612f)) * 0.10000000149011612f) + 0.800000011920929f) + (sin(_354.x * 8.0f) * 0.20000000298023224f);
      float _560 = (exp2(log2(saturate(1.0f - (WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_275 < (uint)170000), _275, 0)) + 0u))]._sunFlareWeightIntensity) * sqrt((_155 * _155) + (_156 * _156))))) * WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_285 < (uint)170000), _285, 0)) + 0u))]._sunFlareWeightThreshold)) * 150.0f) * _exposure2.x;
      int _564 = WaveReadLaneFirst(_materialIndex);
      int _572 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_564 < (uint)170000), _564, 0)) + 0u))]._lensDirtTexture);
      float4 _579 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_572 < (uint)65000), _572, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
      int _583 = WaveReadLaneFirst(_materialIndex);
      float _591 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_583 < (uint)170000), _583, 0)) + 0u))]._lensDirtThreshold);
      int _604 = WaveReadLaneFirst(_materialIndex);
      float _612 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_604 < (uint)170000), _604, 0)) + 0u))]._lensDirtIntensity);
      float _634 = ((_viewDir.y + _viewDir.x) * 33.60000228881836f) + (TEXCOORD.x * 0.10000000149011612f);
      float _638 = frac(sin(floor(_634)) * 43758.546875f);
      int _649 = WaveReadLaneFirst(_materialIndex);
      float _659 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_649 < (uint)170000), _649, 0)) + 0u))]._lensflareRatio) * (((((frac(_634) * (frac(sin(ceil(_634)) * 43758.546875f) - _638)) + _638) * 0.6499999761581421f) + 0.3499999940395355f) * _28.w);
      _670 = (((_659 * (((((((_535 + (_524 * exp2(log2(saturate(max(_471.x, _499.x))) * 4.0f))) * 5.599999904632568f) + (_430 * (((min(max((abs((frac(_365 + 1.0f) * 6.0f) + -3.0f) + -1.0f), 0.0f), 1.0f) + -1.0f) * _372) + 1.0f))) * _550) + _317) * _560) + _57.x)) * saturate((_612 * (saturate(pow(_579.x, _591)) + -1.0f)) + 1.0f)) + _65.x);
      _671 = (((_659 * (((((((_535 + (_524 * exp2(log2(saturate(max(_471.y, _499.y))) * 4.0f))) * 5.599999904632568f) + (_430 * (((min(max((abs((frac(_365 + 0.6666666865348816f) * 6.0f) + -3.0f) + -1.0f), 0.0f), 1.0f) + -1.0f) * _372) + 1.0f))) * _550) + _317) * _560) + _59.y)) * saturate((_612 * (saturate(pow(_579.y, _591)) + -1.0f)) + 1.0f)) + _65.y);
      _672 = (((_659 * (((((((_535 + (_524 * exp2(log2(saturate(max(_471.z, _499.z))) * 4.0f))) * 7.0f) + (_430 * (((min(max((abs((frac(_365 + 0.3333333432674408f) * 6.0f) + -3.0f) + -1.0f), 0.0f), 1.0f) + -1.0f) * _372) + 1.0f))) * _550) + _317) * _560) + _61.z)) * saturate((_612 * (saturate(pow(_579.z, _591)) + -1.0f)) + 1.0f)) + _65.z);
    } else {
      _670 = _65.x;
      _671 = _65.y;
      _672 = _65.z;
    }
  } else {
    if (!(((_201 >= 1.0499999523162842f)) || ((((_201 <= -1.5f)) || ((((_203 >= 1.600000023841858f)) || ((((_203 <= -1.600000023841858f)) || ((((_203 <= -1.5f)) || ((((_200 < 0.0f)) || ((abs(_questGuideWorldPosition.z) <= 9.999999747378752e-06f)))))))))))))) {
      float _237 = _157 - _203;
      float _238 = _156 - _201;
      float _240 = atan(_237 / _238);
      bool _243 = (_238 < 0.0f);
      bool _244 = (_238 == 0.0f);
      bool _245 = (_237 >= 0.0f);
      bool _246 = (_237 < 0.0f);
      bool _249 = (_246) && (_243);
      float _250 = select(_249, (_240 + -3.1415927410125732f), select(((_245) && (_243)), (_240 + 3.1415927410125732f), _240));
      bool _251 = (_246) && (_244);
      bool _253 = (_245) && (_244);
      float _254 = select(_253, 1.5707963705062866f, select(_251, -1.5707963705062866f, _250));
      float _258 = sqrt((_238 * _238) + (_237 * _237));
      int _275 = WaveReadLaneFirst(_materialIndex);
      int _285 = WaveReadLaneFirst(_materialIndex);
      float _299 = _203 - _157;
      float _300 = _201 - _156;
      int _305 = WaveReadLaneFirst(_materialIndex);
      float _316 = max((0.019999999552965164f / (WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_305 < (uint)170000), _305, 0)) + 0u))]._sunFlareScale) * sqrt((_300 * _300) + (_299 * _299)))), 0.0f);
      float _317 = _316 * _316;
      int _328 = WaveReadLaneFirst(_materialIndex);
      float _337 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_328 < (uint)170000), _328, 0)) + 0u))]._sunFlareAnimSpeed) * _time.x;
      int _339 = WaveReadLaneFirst(_materialIndex);
      int _347 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_339 < (uint)170000), _339, 0)) + 0u))]._noiseTex);
      float4 _354 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_347 < (uint)65000), _347, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((sin((_254 * 2.0f) + _203) * 4.0f) - cos((_254 * 3.0f) + _201)) + _337), _337));
      float _362 = 1.0f / exp2((_258 * 1.4426950216293335f) * ((frac(_354.x) * 0.6600000262260437f) + 0.33000001311302185f));
      float _365 = frac((_362 * 20.0f) + 1.0031249523162842f);
      float _372 = exp2(log2(1.0f - abs((_362 * 2.0f) + -1.0f)) * 0.30000001192092896f);
      float _409 = sin(select(_253, 6.2831854820251465f, select(_251, -6.2831854820251465f, (_250 * 4.0f))));
      float _410 = _409 * _237;
      float _411 = _409 * _238;
      float _430 = exp2(log2(((saturate(_362 + -0.8999999761581421f) * 3.0f) + exp2(log2(1.0f - saturate(sqrt((_410 * _410) + (_411 * _411)))) * 8.0f)) * _362) * 12.949999809265137f) * (_362 * 0.4999999701976776f);
      int _434 = WaveReadLaneFirst(_materialIndex);
      int _442 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_434 < (uint)170000), _434, 0)) + 0u))]._noiseTex);
      float _446 = exp2(log2(_258 * 16.0f) * 0.5f);
      float _450 = atan(_238 / _237);
      bool _453 = (_237 == 0.0f);
      bool _454 = (_238 >= 0.0f);
      float4 _471 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_442 < (uint)65000), _442, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(select(((_453) && (_454)), 2.356194496154785f, select(((_453) && (_243)), -2.356194496154785f, (select(_249, (_450 + -3.1415927410125732f), select(((_246) && (_454)), (_450 + 3.1415927410125732f), _450)) * 1.5f))), ((_time.x * 0.20000000298023224f) - _446)));
      float _478 = atan((-0.0f - _238) / (-0.0f - _237));
      bool _481 = (_237 > -0.0f);
      bool _482 = (_237 == -0.0f);
      bool _483 = (_238 <= -0.0f);
      bool _484 = (_238 > -0.0f);
      float4 _499 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_442 < (uint)65000), _442, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(select(((_482) && (_483)), 2.356194496154785f, select(((_482) && (_484)), -2.356194496154785f, (select(((_481) && (_484)), (_478 + -3.1415927410125732f), select(((_481) && (_483)), (_478 + 3.1415927410125732f), _478)) * 1.5f))), ((_time.x * 0.20000000298023224f) - (_446 * 0.5f))));
      float _524 = exp2(log2(min(max((1.0f - (_258 * 2.0f)), 0.0f), 1.0f)) * 5.199999809265137f);
      float _535 = exp2(log2(min(max((1.100000023841858f - (_258 * 4.0f)), 0.0f), 1.0f)) * 4.199999809265137f) * 0.10000000149011612f;
      float _550 = (((pow(_258, 0.10000000149011612f)) * 0.10000000149011612f) + 0.800000011920929f) + (sin(_354.x * 8.0f) * 0.20000000298023224f);
      float _560 = (exp2(log2(saturate(1.0f - (WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_275 < (uint)170000), _275, 0)) + 0u))]._sunFlareWeightIntensity) * sqrt((_155 * _155) + (_156 * _156))))) * WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_285 < (uint)170000), _285, 0)) + 0u))]._sunFlareWeightThreshold)) * 150.0f) * _exposure2.x;
      int _564 = WaveReadLaneFirst(_materialIndex);
      int _572 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_564 < (uint)170000), _564, 0)) + 0u))]._lensDirtTexture);
      float4 _579 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_572 < (uint)65000), _572, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
      int _583 = WaveReadLaneFirst(_materialIndex);
      float _591 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_583 < (uint)170000), _583, 0)) + 0u))]._lensDirtThreshold);
      int _604 = WaveReadLaneFirst(_materialIndex);
      float _612 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_604 < (uint)170000), _604, 0)) + 0u))]._lensDirtIntensity);
      float _634 = ((_viewDir.y + _viewDir.x) * 33.60000228881836f) + (TEXCOORD.x * 0.10000000149011612f);
      float _638 = frac(sin(floor(_634)) * 43758.546875f);
      int _649 = WaveReadLaneFirst(_materialIndex);
      float _659 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_649 < (uint)170000), _649, 0)) + 0u))]._lensflareRatio) * (((((frac(_634) * (frac(sin(ceil(_634)) * 43758.546875f) - _638)) + _638) * 0.6499999761581421f) + 0.3499999940395355f) * _28.w);
      _670 = (((_659 * (((((((_535 + (_524 * exp2(log2(saturate(max(_471.x, _499.x))) * 4.0f))) * 5.599999904632568f) + (_430 * (((min(max((abs((frac(_365 + 1.0f) * 6.0f) + -3.0f) + -1.0f), 0.0f), 1.0f) + -1.0f) * _372) + 1.0f))) * _550) + _317) * _560) + _57.x)) * saturate((_612 * (saturate(pow(_579.x, _591)) + -1.0f)) + 1.0f)) + _65.x);
      _671 = (((_659 * (((((((_535 + (_524 * exp2(log2(saturate(max(_471.y, _499.y))) * 4.0f))) * 5.599999904632568f) + (_430 * (((min(max((abs((frac(_365 + 0.6666666865348816f) * 6.0f) + -3.0f) + -1.0f), 0.0f), 1.0f) + -1.0f) * _372) + 1.0f))) * _550) + _317) * _560) + _59.y)) * saturate((_612 * (saturate(pow(_579.y, _591)) + -1.0f)) + 1.0f)) + _65.y);
      _672 = (((_659 * (((((((_535 + (_524 * exp2(log2(saturate(max(_471.z, _499.z))) * 4.0f))) * 7.0f) + (_430 * (((min(max((abs((frac(_365 + 0.3333333432674408f) * 6.0f) + -3.0f) + -1.0f), 0.0f), 1.0f) + -1.0f) * _372) + 1.0f))) * _550) + _317) * _560) + _61.z)) * saturate((_612 * (saturate(pow(_579.z, _591)) + -1.0f)) + 1.0f)) + _65.z);
    } else {
      _670 = _65.x;
      _671 = _65.y;
      _672 = _65.z;
    }
  }
  uint _673 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _680 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_673), 0));
    _686 = (float((uint)((uint)(_680.x & 127))) + 0.5f);
  } else {
    _686 = 1.0f;
  }
  bool _689 = (_localToneMappingParams.w > 0.0f);
  if (_689) {
    float3 output_color = TonemapReplacer(float3(_670, _671, _672));
    _1042 = output_color.x;
    _1043 = output_color.y;
    _1044 = output_color.z;
  } else {
    _1042 = _670;
    _1043 = _671;
    _1044 = _672;
  }
  if (_etcParams.y > 1.0f) {
    float _1053 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _1054 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _1058 = saturate(1.0f - (dot(float2(_1053, _1054), float2(_1053, _1054)) * saturate(_etcParams.y + -1.0f)));
    _1063 = (_1058 * _1042);
    _1064 = (_1058 * _1043);
    _1065 = (_1058 * _1044);
  } else {
    _1063 = _1042;
    _1064 = _1043;
    _1065 = _1044;
  }
  if ((_689) && ((_etcParams.z > 0.0f))) {
    _1095 = select((_1063 <= 0.0031308000907301903f), (_1063 * 12.920000076293945f), (((pow(_1063, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1096 = select((_1064 <= 0.0031308000907301903f), (_1064 * 12.920000076293945f), (((pow(_1064, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1097 = select((_1065 <= 0.0031308000907301903f), (_1065 * 12.920000076293945f), (((pow(_1065, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1095 = _1063;
    _1096 = _1064;
    _1097 = _1065;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _1102 = float((uint)_673);
    if (!(_1102 < _viewDir.w)) {
      if (!(_1102 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _1111 = _1095;
        _1112 = _1096;
        _1113 = _1097;
      } else {
        _1111 = 0.0f;
        _1112 = 0.0f;
        _1113 = 0.0f;
      }
    } else {
      _1111 = 0.0f;
      _1112 = 0.0f;
      _1113 = 0.0f;
    }
  } else {
    _1111 = _1095;
    _1112 = _1096;
    _1113 = _1097;
  }
  SV_Target.x = _1111;
  SV_Target.y = _1112;
  SV_Target.z = _1113;
  SV_Target.w = _686;
  return SV_Target;
}