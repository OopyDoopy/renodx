#include "../tonemap.hlsli"

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

Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t44, space36);

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

cbuffer __3__1__0__0__PostProcessSizeConstant : register(b1, space1) {
  float4 _srcTargetSizeAndInv : packoffset(c000.x);
  float4 _destTargetSizAndInv : packoffset(c001.x);
};

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

ConstantBuffer<PostProcessLensFlareForGimmick_CDStruct> BindlessParameters_PostProcessLensFlareForGimmick_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _22[36];
  float4 _27 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  int _29 = WaveReadLaneFirst(_materialIndex);
  float _38 = TEXCOORD.x + -0.5f;
  float _39 = TEXCOORD.y + -0.5f;
  float _47 = rsqrt(dot(float2(_38, _39), float2(_38, _39))) * (sqrt((_39 * _39) + (_38 * _38)) * WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_29 < (uint)170000), _29, 0)) + 0u))]._chromaticShiftValue));
  float _48 = _47 * _38;
  float _50 = _47 * _39;
  float4 _56 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _48), (TEXCOORD.y - _50)));
  float4 _58 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float4 _60 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_48 + TEXCOORD.x), (_50 + TEXCOORD.y)));
  float4 _64 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
  float _71 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  int _72 = WaveReadLaneFirst(_materialIndex);
  float _80 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_72 < (uint)170000), _72, 0)) + 0u))]._fishEyeIntensity);
  float _86 = (_srcTargetSizeAndInv.x * TEXCOORD.x) / _srcTargetSizeAndInv.x;
  float _87 = (_srcTargetSizeAndInv.y * TEXCOORD.y) / _srcTargetSizeAndInv.x;
  float _88 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  float _89 = 0.5f / _88;
  float _90 = _86 + -0.5f;
  float _91 = _87 - _89;
  float _92 = dot(float2(_90, _91), float2(_90, _91));
  float _93 = sqrt(_92);
  bool _94 = (_80 > 0.0f);
  float _102;
  float _139;
  float _140;
  float _669;
  float _670;
  float _671;
  float _685;
  float _931;
  float _932;
  float _933;
  float _1053;
  float _1054;
  float _1055;
  float _1076;
  float _1077;
  float _1078;
  float _1111;
  float _1112;
  float _1113;
  float _1127;
  float _1128;
  float _1129;
  if (_94) {
    _102 = sqrt(dot(float2(0.5f, _89), float2(0.5f, _89)));
  } else {
    if (!(_88 < 1.0f)) {
      _102 = _89;
    } else {
      _102 = 0.5f;
    }
  }
  if (_94) {
    float _104 = rsqrt(_92);
    float _106 = tan(_93 * _80);
    float _114 = tan(_102 * _80);
    _139 = (((((_102 * _90) * _104) * _106) / _114) + 0.5f);
    _140 = (((((_102 * _91) * _104) * _106) / _114) + _89);
  } else {
    if (_80 < 0.0f) {
      float _122 = rsqrt(_92);
      float _123 = _80 * -10.0f;
      float _125 = atan(_93 * _123);
      float _133 = atan(_102 * _123);
      _139 = (((((_102 * _90) * _122) * _125) / _133) + 0.5f);
      _140 = (((((_102 * _91) * _122) * _125) / _133) + _89);
    } else {
      _139 = _86;
      _140 = _87;
    }
  }
  int _142 = WaveReadLaneFirst(_materialIndex);
  bool _151 = (WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_142 < (uint)170000), _142, 0)) + 0u))]._useFishUV) == 1.0f);
  float _154 = select(_151, _139, TEXCOORD.x) + -0.5f;
  float _155 = select(_151, (_140 * _88), TEXCOORD.y) + -0.5f;
  float _156 = _154 * _71;
  float _196 = mad((_viewProj[3].z), _questGuideWorldPosition.z, mad((_viewProj[3].y), _questGuideWorldPosition.y, ((_viewProj[3].x) * _questGuideWorldPosition.x))) + (_viewProj[3].w);
  float _199 = (mad((_viewProj[2].z), _questGuideWorldPosition.z, mad((_viewProj[2].y), _questGuideWorldPosition.y, ((_viewProj[2].x) * _questGuideWorldPosition.x))) + (_viewProj[2].w)) / _196;
  float _200 = ((mad((_viewProj[1].z), _questGuideWorldPosition.z, mad((_viewProj[1].y), _questGuideWorldPosition.y, ((_viewProj[1].x) * _questGuideWorldPosition.x))) + (_viewProj[1].w)) / _196) * -0.5f;
  float _202 = (_71 * 0.5f) * ((mad((_viewProj[0].z), _questGuideWorldPosition.z, mad((_viewProj[0].y), _questGuideWorldPosition.y, ((_viewProj[0].x) * _questGuideWorldPosition.x))) + (_viewProj[0].w)) / _196);
  if ((!(abs(_questGuideWorldPosition.x) <= 9.999999747378752e-06f)) || ((!(!(abs(_questGuideWorldPosition.x) <= 9.999999747378752e-06f))) && (!(abs(_questGuideWorldPosition.y) <= 9.999999747378752e-06f)))) {
    if (!(((_200 >= 1.0499999523162842f)) || ((((_200 <= -1.5f)) || ((((_202 >= 1.600000023841858f)) || ((((_202 <= -1.600000023841858f)) || ((((_199 < 0.0f)) || ((_202 <= -1.5f)))))))))))) {
      float _236 = _156 - _202;
      float _237 = _155 - _200;
      float _239 = atan(_236 / _237);
      bool _242 = (_237 < 0.0f);
      bool _243 = (_237 == 0.0f);
      bool _244 = (_236 >= 0.0f);
      bool _245 = (_236 < 0.0f);
      bool _248 = (_245) && (_242);
      float _249 = select(_248, (_239 + -3.1415927410125732f), select(((_244) && (_242)), (_239 + 3.1415927410125732f), _239));
      bool _250 = (_245) && (_243);
      bool _252 = (_244) && (_243);
      float _253 = select(_252, 1.5707963705062866f, select(_250, -1.5707963705062866f, _249));
      float _257 = sqrt((_237 * _237) + (_236 * _236));
      int _274 = WaveReadLaneFirst(_materialIndex);
      int _284 = WaveReadLaneFirst(_materialIndex);
      float _298 = _202 - _156;
      float _299 = _200 - _155;
      int _304 = WaveReadLaneFirst(_materialIndex);
      float _315 = max((0.019999999552965164f / (WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_304 < (uint)170000), _304, 0)) + 0u))]._sunFlareScale) * sqrt((_299 * _299) + (_298 * _298)))), 0.0f);
      float _316 = _315 * _315;
      int _327 = WaveReadLaneFirst(_materialIndex);
      float _336 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_327 < (uint)170000), _327, 0)) + 0u))]._sunFlareAnimSpeed) * _time.x;
      int _338 = WaveReadLaneFirst(_materialIndex);
      int _346 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_338 < (uint)170000), _338, 0)) + 0u))]._noiseTex);
      float4 _353 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_346 < (uint)65000), _346, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((sin((_253 * 2.0f) + _202) * 4.0f) - cos((_253 * 3.0f) + _200)) + _336), _336));
      float _361 = 1.0f / exp2((_257 * 1.4426950216293335f) * ((frac(_353.x) * 0.6600000262260437f) + 0.33000001311302185f));
      float _364 = frac((_361 * 20.0f) + 1.0031249523162842f);
      float _371 = exp2(log2(1.0f - abs((_361 * 2.0f) + -1.0f)) * 0.30000001192092896f);
      float _408 = sin(select(_252, 6.2831854820251465f, select(_250, -6.2831854820251465f, (_249 * 4.0f))));
      float _409 = _408 * _236;
      float _410 = _408 * _237;
      float _429 = exp2(log2(((saturate(_361 + -0.8999999761581421f) * 3.0f) + exp2(log2(1.0f - saturate(sqrt((_409 * _409) + (_410 * _410)))) * 8.0f)) * _361) * 12.949999809265137f) * (_361 * 0.4999999701976776f);
      int _433 = WaveReadLaneFirst(_materialIndex);
      int _441 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_433 < (uint)170000), _433, 0)) + 0u))]._noiseTex);
      float _445 = exp2(log2(_257 * 16.0f) * 0.5f);
      float _449 = atan(_237 / _236);
      bool _452 = (_236 == 0.0f);
      bool _453 = (_237 >= 0.0f);
      float4 _470 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_441 < (uint)65000), _441, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(select(((_452) && (_453)), 2.356194496154785f, select(((_452) && (_242)), -2.356194496154785f, (select(_248, (_449 + -3.1415927410125732f), select(((_245) && (_453)), (_449 + 3.1415927410125732f), _449)) * 1.5f))), ((_time.x * 0.20000000298023224f) - _445)));
      float _477 = atan((-0.0f - _237) / (-0.0f - _236));
      bool _480 = (_236 > -0.0f);
      bool _481 = (_236 == -0.0f);
      bool _482 = (_237 <= -0.0f);
      bool _483 = (_237 > -0.0f);
      float4 _498 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_441 < (uint)65000), _441, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(select(((_481) && (_482)), 2.356194496154785f, select(((_481) && (_483)), -2.356194496154785f, (select(((_480) && (_483)), (_477 + -3.1415927410125732f), select(((_480) && (_482)), (_477 + 3.1415927410125732f), _477)) * 1.5f))), ((_time.x * 0.20000000298023224f) - (_445 * 0.5f))));
      float _523 = exp2(log2(min(max((1.0f - (_257 * 2.0f)), 0.0f), 1.0f)) * 5.199999809265137f);
      float _534 = exp2(log2(min(max((1.100000023841858f - (_257 * 4.0f)), 0.0f), 1.0f)) * 4.199999809265137f) * 0.10000000149011612f;
      float _549 = (((pow(_257, 0.10000000149011612f)) * 0.10000000149011612f) + 0.800000011920929f) + (sin(_353.x * 8.0f) * 0.20000000298023224f);
      float _559 = (exp2(log2(saturate(1.0f - (WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_274 < (uint)170000), _274, 0)) + 0u))]._sunFlareWeightIntensity) * sqrt((_154 * _154) + (_155 * _155))))) * WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_284 < (uint)170000), _284, 0)) + 0u))]._sunFlareWeightThreshold)) * 150.0f) * _exposure2.x;
      int _563 = WaveReadLaneFirst(_materialIndex);
      int _571 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_563 < (uint)170000), _563, 0)) + 0u))]._lensDirtTexture);
      float4 _578 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_571 < (uint)65000), _571, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
      int _582 = WaveReadLaneFirst(_materialIndex);
      float _590 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_582 < (uint)170000), _582, 0)) + 0u))]._lensDirtThreshold);
      int _603 = WaveReadLaneFirst(_materialIndex);
      float _611 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_603 < (uint)170000), _603, 0)) + 0u))]._lensDirtIntensity);
      float _633 = ((_viewDir.y + _viewDir.x) * 33.60000228881836f) + (TEXCOORD.x * 0.10000000149011612f);
      float _637 = frac(sin(floor(_633)) * 43758.546875f);
      int _648 = WaveReadLaneFirst(_materialIndex);
      float _658 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_648 < (uint)170000), _648, 0)) + 0u))]._lensflareRatio) * (((((frac(_633) * (frac(sin(ceil(_633)) * 43758.546875f) - _637)) + _637) * 0.6499999761581421f) + 0.3499999940395355f) * _27.w);
      _669 = (((_658 * (((((((_534 + (_523 * exp2(log2(saturate(max(_470.x, _498.x))) * 4.0f))) * 5.599999904632568f) + (_429 * (((min(max((abs((frac(_364 + 1.0f) * 6.0f) + -3.0f) + -1.0f), 0.0f), 1.0f) + -1.0f) * _371) + 1.0f))) * _549) + _316) * _559) + _56.x)) * saturate((_611 * (saturate(pow(_578.x, _590)) + -1.0f)) + 1.0f)) + _64.x);
      _670 = (((_658 * (((((((_534 + (_523 * exp2(log2(saturate(max(_470.y, _498.y))) * 4.0f))) * 5.599999904632568f) + (_429 * (((min(max((abs((frac(_364 + 0.6666666865348816f) * 6.0f) + -3.0f) + -1.0f), 0.0f), 1.0f) + -1.0f) * _371) + 1.0f))) * _549) + _316) * _559) + _58.y)) * saturate((_611 * (saturate(pow(_578.y, _590)) + -1.0f)) + 1.0f)) + _64.y);
      _671 = (((_658 * (((((((_534 + (_523 * exp2(log2(saturate(max(_470.z, _498.z))) * 4.0f))) * 7.0f) + (_429 * (((min(max((abs((frac(_364 + 0.3333333432674408f) * 6.0f) + -3.0f) + -1.0f), 0.0f), 1.0f) + -1.0f) * _371) + 1.0f))) * _549) + _316) * _559) + _60.z)) * saturate((_611 * (saturate(pow(_578.z, _590)) + -1.0f)) + 1.0f)) + _64.z);
    } else {
      _669 = _64.x;
      _670 = _64.y;
      _671 = _64.z;
    }
  } else {
    if (!(((_200 >= 1.0499999523162842f)) || ((((_200 <= -1.5f)) || ((((_202 >= 1.600000023841858f)) || ((((_202 <= -1.600000023841858f)) || ((((_202 <= -1.5f)) || ((((_199 < 0.0f)) || ((abs(_questGuideWorldPosition.z) <= 9.999999747378752e-06f)))))))))))))) {
      float _236 = _156 - _202;
      float _237 = _155 - _200;
      float _239 = atan(_236 / _237);
      bool _242 = (_237 < 0.0f);
      bool _243 = (_237 == 0.0f);
      bool _244 = (_236 >= 0.0f);
      bool _245 = (_236 < 0.0f);
      bool _248 = (_245) && (_242);
      float _249 = select(_248, (_239 + -3.1415927410125732f), select(((_244) && (_242)), (_239 + 3.1415927410125732f), _239));
      bool _250 = (_245) && (_243);
      bool _252 = (_244) && (_243);
      float _253 = select(_252, 1.5707963705062866f, select(_250, -1.5707963705062866f, _249));
      float _257 = sqrt((_237 * _237) + (_236 * _236));
      int _274 = WaveReadLaneFirst(_materialIndex);
      int _284 = WaveReadLaneFirst(_materialIndex);
      float _298 = _202 - _156;
      float _299 = _200 - _155;
      int _304 = WaveReadLaneFirst(_materialIndex);
      float _315 = max((0.019999999552965164f / (WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_304 < (uint)170000), _304, 0)) + 0u))]._sunFlareScale) * sqrt((_299 * _299) + (_298 * _298)))), 0.0f);
      float _316 = _315 * _315;
      int _327 = WaveReadLaneFirst(_materialIndex);
      float _336 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_327 < (uint)170000), _327, 0)) + 0u))]._sunFlareAnimSpeed) * _time.x;
      int _338 = WaveReadLaneFirst(_materialIndex);
      int _346 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_338 < (uint)170000), _338, 0)) + 0u))]._noiseTex);
      float4 _353 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_346 < (uint)65000), _346, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((sin((_253 * 2.0f) + _202) * 4.0f) - cos((_253 * 3.0f) + _200)) + _336), _336));
      float _361 = 1.0f / exp2((_257 * 1.4426950216293335f) * ((frac(_353.x) * 0.6600000262260437f) + 0.33000001311302185f));
      float _364 = frac((_361 * 20.0f) + 1.0031249523162842f);
      float _371 = exp2(log2(1.0f - abs((_361 * 2.0f) + -1.0f)) * 0.30000001192092896f);
      float _408 = sin(select(_252, 6.2831854820251465f, select(_250, -6.2831854820251465f, (_249 * 4.0f))));
      float _409 = _408 * _236;
      float _410 = _408 * _237;
      float _429 = exp2(log2(((saturate(_361 + -0.8999999761581421f) * 3.0f) + exp2(log2(1.0f - saturate(sqrt((_409 * _409) + (_410 * _410)))) * 8.0f)) * _361) * 12.949999809265137f) * (_361 * 0.4999999701976776f);
      int _433 = WaveReadLaneFirst(_materialIndex);
      int _441 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_433 < (uint)170000), _433, 0)) + 0u))]._noiseTex);
      float _445 = exp2(log2(_257 * 16.0f) * 0.5f);
      float _449 = atan(_237 / _236);
      bool _452 = (_236 == 0.0f);
      bool _453 = (_237 >= 0.0f);
      float4 _470 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_441 < (uint)65000), _441, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(select(((_452) && (_453)), 2.356194496154785f, select(((_452) && (_242)), -2.356194496154785f, (select(_248, (_449 + -3.1415927410125732f), select(((_245) && (_453)), (_449 + 3.1415927410125732f), _449)) * 1.5f))), ((_time.x * 0.20000000298023224f) - _445)));
      float _477 = atan((-0.0f - _237) / (-0.0f - _236));
      bool _480 = (_236 > -0.0f);
      bool _481 = (_236 == -0.0f);
      bool _482 = (_237 <= -0.0f);
      bool _483 = (_237 > -0.0f);
      float4 _498 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_441 < (uint)65000), _441, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(select(((_481) && (_482)), 2.356194496154785f, select(((_481) && (_483)), -2.356194496154785f, (select(((_480) && (_483)), (_477 + -3.1415927410125732f), select(((_480) && (_482)), (_477 + 3.1415927410125732f), _477)) * 1.5f))), ((_time.x * 0.20000000298023224f) - (_445 * 0.5f))));
      float _523 = exp2(log2(min(max((1.0f - (_257 * 2.0f)), 0.0f), 1.0f)) * 5.199999809265137f);
      float _534 = exp2(log2(min(max((1.100000023841858f - (_257 * 4.0f)), 0.0f), 1.0f)) * 4.199999809265137f) * 0.10000000149011612f;
      float _549 = (((pow(_257, 0.10000000149011612f)) * 0.10000000149011612f) + 0.800000011920929f) + (sin(_353.x * 8.0f) * 0.20000000298023224f);
      float _559 = (exp2(log2(saturate(1.0f - (WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_274 < (uint)170000), _274, 0)) + 0u))]._sunFlareWeightIntensity) * sqrt((_154 * _154) + (_155 * _155))))) * WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_284 < (uint)170000), _284, 0)) + 0u))]._sunFlareWeightThreshold)) * 150.0f) * _exposure2.x;
      int _563 = WaveReadLaneFirst(_materialIndex);
      int _571 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_563 < (uint)170000), _563, 0)) + 0u))]._lensDirtTexture);
      float4 _578 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_571 < (uint)65000), _571, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
      int _582 = WaveReadLaneFirst(_materialIndex);
      float _590 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_582 < (uint)170000), _582, 0)) + 0u))]._lensDirtThreshold);
      int _603 = WaveReadLaneFirst(_materialIndex);
      float _611 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_603 < (uint)170000), _603, 0)) + 0u))]._lensDirtIntensity);
      float _633 = ((_viewDir.y + _viewDir.x) * 33.60000228881836f) + (TEXCOORD.x * 0.10000000149011612f);
      float _637 = frac(sin(floor(_633)) * 43758.546875f);
      int _648 = WaveReadLaneFirst(_materialIndex);
      float _658 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_648 < (uint)170000), _648, 0)) + 0u))]._lensflareRatio) * (((((frac(_633) * (frac(sin(ceil(_633)) * 43758.546875f) - _637)) + _637) * 0.6499999761581421f) + 0.3499999940395355f) * _27.w);
      _669 = (((_658 * (((((((_534 + (_523 * exp2(log2(saturate(max(_470.x, _498.x))) * 4.0f))) * 5.599999904632568f) + (_429 * (((min(max((abs((frac(_364 + 1.0f) * 6.0f) + -3.0f) + -1.0f), 0.0f), 1.0f) + -1.0f) * _371) + 1.0f))) * _549) + _316) * _559) + _56.x)) * saturate((_611 * (saturate(pow(_578.x, _590)) + -1.0f)) + 1.0f)) + _64.x);
      _670 = (((_658 * (((((((_534 + (_523 * exp2(log2(saturate(max(_470.y, _498.y))) * 4.0f))) * 5.599999904632568f) + (_429 * (((min(max((abs((frac(_364 + 0.6666666865348816f) * 6.0f) + -3.0f) + -1.0f), 0.0f), 1.0f) + -1.0f) * _371) + 1.0f))) * _549) + _316) * _559) + _58.y)) * saturate((_611 * (saturate(pow(_578.y, _590)) + -1.0f)) + 1.0f)) + _64.y);
      _671 = (((_658 * (((((((_534 + (_523 * exp2(log2(saturate(max(_470.z, _498.z))) * 4.0f))) * 7.0f) + (_429 * (((min(max((abs((frac(_364 + 0.3333333432674408f) * 6.0f) + -3.0f) + -1.0f), 0.0f), 1.0f) + -1.0f) * _371) + 1.0f))) * _549) + _316) * _559) + _60.z)) * saturate((_611 * (saturate(pow(_578.z, _590)) + -1.0f)) + 1.0f)) + _64.z);
    } else {
      _669 = _64.x;
      _670 = _64.y;
      _671 = _64.z;
    }
  }
  uint _672 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _679 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_672), 0));
    _685 = (float((uint)((uint)(_679.x & 127))) + 0.5f);
  } else {
    _685 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_669, _670, _671));
    _1053 = output_color.x;
    _1054 = output_color.y;
    _1055 = output_color.z;
  } else {
    _1053 = _669;
    _1054 = _670;
    _1055 = _671;
  }
  if (_etcParams.y > 1.0f) {
    float _1066 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _1067 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _1071 = saturate(1.0f - (dot(float2(_1066, _1067), float2(_1066, _1067)) * saturate(_etcParams.y + -1.0f)));
    _1076 = (_1071 * _1053);
    _1077 = (_1071 * _1054);
    _1078 = (_1071 * _1055);
  } else {
    _1076 = _1053;
    _1077 = _1054;
    _1078 = _1055;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _1111 = select((_1076 <= 0.0031308000907301903f), (_1076 * 12.920000076293945f), (((pow(_1076, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1112 = select((_1077 <= 0.0031308000907301903f), (_1077 * 12.920000076293945f), (((pow(_1077, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1113 = select((_1078 <= 0.0031308000907301903f), (_1078 * 12.920000076293945f), (((pow(_1078, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1111 = _1076;
    _1112 = _1077;
    _1113 = _1078;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _1118 = float((uint)_672);
    if (!(_1118 < _viewDir.w)) {
      if (!(_1118 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _1127 = _1111;
        _1128 = _1112;
        _1129 = _1113;
      } else {
        _1127 = 0.0f;
        _1128 = 0.0f;
        _1129 = 0.0f;
      }
    } else {
      _1127 = 0.0f;
      _1128 = 0.0f;
      _1129 = 0.0f;
    }
  } else {
    _1127 = _1111;
    _1128 = _1112;
    _1129 = _1113;
  }
  SV_Target.x = _1127;
  SV_Target.y = _1128;
  SV_Target.z = _1129;
  SV_Target.w = _685;
  return SV_Target;
}

