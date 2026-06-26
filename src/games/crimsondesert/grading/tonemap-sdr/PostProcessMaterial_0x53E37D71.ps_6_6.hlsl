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
  float _75 = (pow(_65.x, 0.012683313339948654f));
  float _76 = (pow(_65.y, 0.012683313339948654f));
  float _77 = (pow(_65.z, 0.012683313339948654f));
  float _102 = exp2(log2(max(0.0f, (_75 + -0.8359375f)) / (18.8515625f - (_75 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _103 = exp2(log2(max(0.0f, (_76 + -0.8359375f)) / (18.8515625f - (_76 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _104 = exp2(log2(max(0.0f, (_77 + -0.8359375f)) / (18.8515625f - (_77 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _108 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  int _109 = WaveReadLaneFirst(_materialIndex);
  float _117 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_109 < (uint)170000), _109, 0)) + 0u))]._fishEyeIntensity);
  float _123 = (_srcTargetSizeAndInv.x * TEXCOORD.x) / _srcTargetSizeAndInv.x;
  float _124 = (_srcTargetSizeAndInv.y * TEXCOORD.y) / _srcTargetSizeAndInv.x;
  float _125 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  float _126 = 0.5f / _125;
  float _127 = _123 + -0.5f;
  float _128 = _124 - _126;
  float _129 = dot(float2(_127, _128), float2(_127, _128));
  float _130 = sqrt(_129);
  bool _131 = (_117 > 0.0f);
  float _139;
  float _176;
  float _177;
  float _706;
  float _707;
  float _708;
  float _722;
  float _927;
  float _928;
  float _929;
  float _1022;
  float _1023;
  float _1024;
  float _1078;
  float _1079;
  float _1080;
  float _1099;
  float _1100;
  float _1101;
  float _1131;
  float _1132;
  float _1133;
  float _1147;
  float _1148;
  float _1149;
  if (_131) {
    _139 = sqrt(dot(float2(0.5f, _126), float2(0.5f, _126)));
  } else {
    if (!(_125 < 1.0f)) {
      _139 = _126;
    } else {
      _139 = 0.5f;
    }
  }
  if (_131) {
    float _141 = rsqrt(_129);
    float _143 = tan(_130 * _117);
    float _151 = tan(_139 * _117);
    _176 = (((((_139 * _127) * _141) * _143) / _151) + 0.5f);
    _177 = (((((_139 * _128) * _141) * _143) / _151) + _126);
  } else {
    if (_117 < 0.0f) {
      float _159 = rsqrt(_129);
      float _160 = _117 * -10.0f;
      float _162 = atan(_130 * _160);
      float _170 = atan(_139 * _160);
      _176 = (((((_139 * _127) * _159) * _162) / _170) + 0.5f);
      _177 = (((((_139 * _128) * _159) * _162) / _170) + _126);
    } else {
      _176 = _123;
      _177 = _124;
    }
  }
  int _179 = WaveReadLaneFirst(_materialIndex);
  bool _188 = (WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_179 < (uint)170000), _179, 0)) + 0u))]._useFishUV) == 1.0f);
  float _191 = select(_188, _176, TEXCOORD.x) + -0.5f;
  float _192 = select(_188, (_177 * _125), TEXCOORD.y) + -0.5f;
  float _193 = _191 * _108;
  float _233 = mad((_viewProj[3].z), _questGuideWorldPosition.z, mad((_viewProj[3].y), _questGuideWorldPosition.y, ((_viewProj[3].x) * _questGuideWorldPosition.x))) + (_viewProj[3].w);
  float _236 = (mad((_viewProj[2].z), _questGuideWorldPosition.z, mad((_viewProj[2].y), _questGuideWorldPosition.y, ((_viewProj[2].x) * _questGuideWorldPosition.x))) + (_viewProj[2].w)) / _233;
  float _237 = ((mad((_viewProj[1].z), _questGuideWorldPosition.z, mad((_viewProj[1].y), _questGuideWorldPosition.y, ((_viewProj[1].x) * _questGuideWorldPosition.x))) + (_viewProj[1].w)) / _233) * -0.5f;
  float _239 = (_108 * 0.5f) * ((mad((_viewProj[0].z), _questGuideWorldPosition.z, mad((_viewProj[0].y), _questGuideWorldPosition.y, ((_viewProj[0].x) * _questGuideWorldPosition.x))) + (_viewProj[0].w)) / _233);
  if ((!(abs(_questGuideWorldPosition.x) <= 9.999999747378752e-06f)) || ((!(!(abs(_questGuideWorldPosition.x) <= 9.999999747378752e-06f))) && (!(abs(_questGuideWorldPosition.y) <= 9.999999747378752e-06f)))) {
    if (!(((_237 >= 1.0499999523162842f)) || ((((_237 <= -1.5f)) || ((((_239 >= 1.600000023841858f)) || ((((_239 <= -1.600000023841858f)) || ((((_236 < 0.0f)) || ((_239 <= -1.5f)))))))))))) {
      float _273 = _193 - _239;
      float _274 = _192 - _237;
      float _276 = atan(_273 / _274);
      bool _279 = (_274 < 0.0f);
      bool _280 = (_274 == 0.0f);
      bool _281 = (_273 >= 0.0f);
      bool _282 = (_273 < 0.0f);
      bool _285 = (_282) && (_279);
      float _286 = select(_285, (_276 + -3.1415927410125732f), select(((_281) && (_279)), (_276 + 3.1415927410125732f), _276));
      bool _287 = (_282) && (_280);
      bool _289 = (_281) && (_280);
      float _290 = select(_289, 1.5707963705062866f, select(_287, -1.5707963705062866f, _286));
      float _294 = sqrt((_274 * _274) + (_273 * _273));
      int _311 = WaveReadLaneFirst(_materialIndex);
      int _321 = WaveReadLaneFirst(_materialIndex);
      float _335 = _239 - _193;
      float _336 = _237 - _192;
      int _341 = WaveReadLaneFirst(_materialIndex);
      float _352 = max((0.019999999552965164f / (WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_341 < (uint)170000), _341, 0)) + 0u))]._sunFlareScale) * sqrt((_336 * _336) + (_335 * _335)))), 0.0f);
      float _353 = _352 * _352;
      int _364 = WaveReadLaneFirst(_materialIndex);
      float _373 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_364 < (uint)170000), _364, 0)) + 0u))]._sunFlareAnimSpeed) * _time.x;
      int _375 = WaveReadLaneFirst(_materialIndex);
      int _383 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_375 < (uint)170000), _375, 0)) + 0u))]._noiseTex);
      float4 _390 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_383 < (uint)65000), _383, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((sin((_290 * 2.0f) + _239) * 4.0f) - cos((_290 * 3.0f) + _237)) + _373), _373));
      float _398 = 1.0f / exp2((_294 * 1.4426950216293335f) * ((frac(_390.x) * 0.6600000262260437f) + 0.33000001311302185f));
      float _401 = frac((_398 * 20.0f) + 1.0031249523162842f);
      float _408 = exp2(log2(1.0f - abs((_398 * 2.0f) + -1.0f)) * 0.30000001192092896f);
      float _445 = sin(select(_289, 6.2831854820251465f, select(_287, -6.2831854820251465f, (_286 * 4.0f))));
      float _446 = _445 * _273;
      float _447 = _445 * _274;
      float _466 = exp2(log2(((saturate(_398 + -0.8999999761581421f) * 3.0f) + exp2(log2(1.0f - saturate(sqrt((_446 * _446) + (_447 * _447)))) * 8.0f)) * _398) * 12.949999809265137f) * (_398 * 0.4999999701976776f);
      int _470 = WaveReadLaneFirst(_materialIndex);
      int _478 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_470 < (uint)170000), _470, 0)) + 0u))]._noiseTex);
      float _482 = exp2(log2(_294 * 16.0f) * 0.5f);
      float _486 = atan(_274 / _273);
      bool _489 = (_273 == 0.0f);
      bool _490 = (_274 >= 0.0f);
      float4 _507 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_478 < (uint)65000), _478, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(select(((_489) && (_490)), 2.356194496154785f, select(((_489) && (_279)), -2.356194496154785f, (select(_285, (_486 + -3.1415927410125732f), select(((_282) && (_490)), (_486 + 3.1415927410125732f), _486)) * 1.5f))), ((_time.x * 0.20000000298023224f) - _482)));
      float _514 = atan((-0.0f - _274) / (-0.0f - _273));
      bool _517 = (_273 > -0.0f);
      bool _518 = (_273 == -0.0f);
      bool _519 = (_274 <= -0.0f);
      bool _520 = (_274 > -0.0f);
      float4 _535 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_478 < (uint)65000), _478, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(select(((_518) && (_519)), 2.356194496154785f, select(((_518) && (_520)), -2.356194496154785f, (select(((_517) && (_520)), (_514 + -3.1415927410125732f), select(((_517) && (_519)), (_514 + 3.1415927410125732f), _514)) * 1.5f))), ((_time.x * 0.20000000298023224f) - (_482 * 0.5f))));
      float _560 = exp2(log2(min(max((1.0f - (_294 * 2.0f)), 0.0f), 1.0f)) * 5.199999809265137f);
      float _571 = exp2(log2(min(max((1.100000023841858f - (_294 * 4.0f)), 0.0f), 1.0f)) * 4.199999809265137f) * 0.10000000149011612f;
      float _586 = (((pow(_294, 0.10000000149011612f)) * 0.10000000149011612f) + 0.800000011920929f) + (sin(_390.x * 8.0f) * 0.20000000298023224f);
      float _596 = (exp2(log2(saturate(1.0f - (WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_311 < (uint)170000), _311, 0)) + 0u))]._sunFlareWeightIntensity) * sqrt((_191 * _191) + (_192 * _192))))) * WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_321 < (uint)170000), _321, 0)) + 0u))]._sunFlareWeightThreshold)) * 150.0f) * _exposure2.x;
      int _600 = WaveReadLaneFirst(_materialIndex);
      int _608 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_600 < (uint)170000), _600, 0)) + 0u))]._lensDirtTexture);
      float4 _615 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_608 < (uint)65000), _608, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
      int _619 = WaveReadLaneFirst(_materialIndex);
      float _627 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_619 < (uint)170000), _619, 0)) + 0u))]._lensDirtThreshold);
      int _640 = WaveReadLaneFirst(_materialIndex);
      float _648 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_640 < (uint)170000), _640, 0)) + 0u))]._lensDirtIntensity);
      float _670 = ((_viewDir.y + _viewDir.x) * 33.60000228881836f) + (TEXCOORD.x * 0.10000000149011612f);
      float _674 = frac(sin(floor(_670)) * 43758.546875f);
      int _685 = WaveReadLaneFirst(_materialIndex);
      float _695 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_685 < (uint)170000), _685, 0)) + 0u))]._lensflareRatio) * (((((frac(_670) * (frac(sin(ceil(_670)) * 43758.546875f) - _674)) + _674) * 0.6499999761581421f) + 0.3499999940395355f) * _28.w);
      _706 = (((_695 * (((((((_571 + (_560 * exp2(log2(saturate(max(_507.x, _535.x))) * 4.0f))) * 5.599999904632568f) + (_466 * (((min(max((abs((frac(_401 + 1.0f) * 6.0f) + -3.0f) + -1.0f), 0.0f), 1.0f) + -1.0f) * _408) + 1.0f))) * _586) + _353) * _596) + _57.x)) * saturate((_648 * (saturate(pow(_615.x, _627)) + -1.0f)) + 1.0f)) + _102);
      _707 = (((_695 * (((((((_571 + (_560 * exp2(log2(saturate(max(_507.y, _535.y))) * 4.0f))) * 5.599999904632568f) + (_466 * (((min(max((abs((frac(_401 + 0.6666666865348816f) * 6.0f) + -3.0f) + -1.0f), 0.0f), 1.0f) + -1.0f) * _408) + 1.0f))) * _586) + _353) * _596) + _59.y)) * saturate((_648 * (saturate(pow(_615.y, _627)) + -1.0f)) + 1.0f)) + _103);
      _708 = (((_695 * (((((((_571 + (_560 * exp2(log2(saturate(max(_507.z, _535.z))) * 4.0f))) * 7.0f) + (_466 * (((min(max((abs((frac(_401 + 0.3333333432674408f) * 6.0f) + -3.0f) + -1.0f), 0.0f), 1.0f) + -1.0f) * _408) + 1.0f))) * _586) + _353) * _596) + _61.z)) * saturate((_648 * (saturate(pow(_615.z, _627)) + -1.0f)) + 1.0f)) + _104);
    } else {
      _706 = _102;
      _707 = _103;
      _708 = _104;
    }
  } else {
    if (!(((_237 >= 1.0499999523162842f)) || ((((_237 <= -1.5f)) || ((((_239 >= 1.600000023841858f)) || ((((_239 <= -1.600000023841858f)) || ((((_239 <= -1.5f)) || ((((_236 < 0.0f)) || ((abs(_questGuideWorldPosition.z) <= 9.999999747378752e-06f)))))))))))))) {
      float _273 = _193 - _239;
      float _274 = _192 - _237;
      float _276 = atan(_273 / _274);
      bool _279 = (_274 < 0.0f);
      bool _280 = (_274 == 0.0f);
      bool _281 = (_273 >= 0.0f);
      bool _282 = (_273 < 0.0f);
      bool _285 = (_282) && (_279);
      float _286 = select(_285, (_276 + -3.1415927410125732f), select(((_281) && (_279)), (_276 + 3.1415927410125732f), _276));
      bool _287 = (_282) && (_280);
      bool _289 = (_281) && (_280);
      float _290 = select(_289, 1.5707963705062866f, select(_287, -1.5707963705062866f, _286));
      float _294 = sqrt((_274 * _274) + (_273 * _273));
      int _311 = WaveReadLaneFirst(_materialIndex);
      int _321 = WaveReadLaneFirst(_materialIndex);
      float _335 = _239 - _193;
      float _336 = _237 - _192;
      int _341 = WaveReadLaneFirst(_materialIndex);
      float _352 = max((0.019999999552965164f / (WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_341 < (uint)170000), _341, 0)) + 0u))]._sunFlareScale) * sqrt((_336 * _336) + (_335 * _335)))), 0.0f);
      float _353 = _352 * _352;
      int _364 = WaveReadLaneFirst(_materialIndex);
      float _373 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_364 < (uint)170000), _364, 0)) + 0u))]._sunFlareAnimSpeed) * _time.x;
      int _375 = WaveReadLaneFirst(_materialIndex);
      int _383 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_375 < (uint)170000), _375, 0)) + 0u))]._noiseTex);
      float4 _390 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_383 < (uint)65000), _383, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((sin((_290 * 2.0f) + _239) * 4.0f) - cos((_290 * 3.0f) + _237)) + _373), _373));
      float _398 = 1.0f / exp2((_294 * 1.4426950216293335f) * ((frac(_390.x) * 0.6600000262260437f) + 0.33000001311302185f));
      float _401 = frac((_398 * 20.0f) + 1.0031249523162842f);
      float _408 = exp2(log2(1.0f - abs((_398 * 2.0f) + -1.0f)) * 0.30000001192092896f);
      float _445 = sin(select(_289, 6.2831854820251465f, select(_287, -6.2831854820251465f, (_286 * 4.0f))));
      float _446 = _445 * _273;
      float _447 = _445 * _274;
      float _466 = exp2(log2(((saturate(_398 + -0.8999999761581421f) * 3.0f) + exp2(log2(1.0f - saturate(sqrt((_446 * _446) + (_447 * _447)))) * 8.0f)) * _398) * 12.949999809265137f) * (_398 * 0.4999999701976776f);
      int _470 = WaveReadLaneFirst(_materialIndex);
      int _478 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_470 < (uint)170000), _470, 0)) + 0u))]._noiseTex);
      float _482 = exp2(log2(_294 * 16.0f) * 0.5f);
      float _486 = atan(_274 / _273);
      bool _489 = (_273 == 0.0f);
      bool _490 = (_274 >= 0.0f);
      float4 _507 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_478 < (uint)65000), _478, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(select(((_489) && (_490)), 2.356194496154785f, select(((_489) && (_279)), -2.356194496154785f, (select(_285, (_486 + -3.1415927410125732f), select(((_282) && (_490)), (_486 + 3.1415927410125732f), _486)) * 1.5f))), ((_time.x * 0.20000000298023224f) - _482)));
      float _514 = atan((-0.0f - _274) / (-0.0f - _273));
      bool _517 = (_273 > -0.0f);
      bool _518 = (_273 == -0.0f);
      bool _519 = (_274 <= -0.0f);
      bool _520 = (_274 > -0.0f);
      float4 _535 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_478 < (uint)65000), _478, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(select(((_518) && (_519)), 2.356194496154785f, select(((_518) && (_520)), -2.356194496154785f, (select(((_517) && (_520)), (_514 + -3.1415927410125732f), select(((_517) && (_519)), (_514 + 3.1415927410125732f), _514)) * 1.5f))), ((_time.x * 0.20000000298023224f) - (_482 * 0.5f))));
      float _560 = exp2(log2(min(max((1.0f - (_294 * 2.0f)), 0.0f), 1.0f)) * 5.199999809265137f);
      float _571 = exp2(log2(min(max((1.100000023841858f - (_294 * 4.0f)), 0.0f), 1.0f)) * 4.199999809265137f) * 0.10000000149011612f;
      float _586 = (((pow(_294, 0.10000000149011612f)) * 0.10000000149011612f) + 0.800000011920929f) + (sin(_390.x * 8.0f) * 0.20000000298023224f);
      float _596 = (exp2(log2(saturate(1.0f - (WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_311 < (uint)170000), _311, 0)) + 0u))]._sunFlareWeightIntensity) * sqrt((_191 * _191) + (_192 * _192))))) * WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_321 < (uint)170000), _321, 0)) + 0u))]._sunFlareWeightThreshold)) * 150.0f) * _exposure2.x;
      int _600 = WaveReadLaneFirst(_materialIndex);
      int _608 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_600 < (uint)170000), _600, 0)) + 0u))]._lensDirtTexture);
      float4 _615 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_608 < (uint)65000), _608, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
      int _619 = WaveReadLaneFirst(_materialIndex);
      float _627 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_619 < (uint)170000), _619, 0)) + 0u))]._lensDirtThreshold);
      int _640 = WaveReadLaneFirst(_materialIndex);
      float _648 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_640 < (uint)170000), _640, 0)) + 0u))]._lensDirtIntensity);
      float _670 = ((_viewDir.y + _viewDir.x) * 33.60000228881836f) + (TEXCOORD.x * 0.10000000149011612f);
      float _674 = frac(sin(floor(_670)) * 43758.546875f);
      int _685 = WaveReadLaneFirst(_materialIndex);
      float _695 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_685 < (uint)170000), _685, 0)) + 0u))]._lensflareRatio) * (((((frac(_670) * (frac(sin(ceil(_670)) * 43758.546875f) - _674)) + _674) * 0.6499999761581421f) + 0.3499999940395355f) * _28.w);
      _706 = (((_695 * (((((((_571 + (_560 * exp2(log2(saturate(max(_507.x, _535.x))) * 4.0f))) * 5.599999904632568f) + (_466 * (((min(max((abs((frac(_401 + 1.0f) * 6.0f) + -3.0f) + -1.0f), 0.0f), 1.0f) + -1.0f) * _408) + 1.0f))) * _586) + _353) * _596) + _57.x)) * saturate((_648 * (saturate(pow(_615.x, _627)) + -1.0f)) + 1.0f)) + _102);
      _707 = (((_695 * (((((((_571 + (_560 * exp2(log2(saturate(max(_507.y, _535.y))) * 4.0f))) * 5.599999904632568f) + (_466 * (((min(max((abs((frac(_401 + 0.6666666865348816f) * 6.0f) + -3.0f) + -1.0f), 0.0f), 1.0f) + -1.0f) * _408) + 1.0f))) * _586) + _353) * _596) + _59.y)) * saturate((_648 * (saturate(pow(_615.y, _627)) + -1.0f)) + 1.0f)) + _103);
      _708 = (((_695 * (((((((_571 + (_560 * exp2(log2(saturate(max(_507.z, _535.z))) * 4.0f))) * 7.0f) + (_466 * (((min(max((abs((frac(_401 + 0.3333333432674408f) * 6.0f) + -3.0f) + -1.0f), 0.0f), 1.0f) + -1.0f) * _408) + 1.0f))) * _586) + _353) * _596) + _61.z)) * saturate((_648 * (saturate(pow(_615.z, _627)) + -1.0f)) + 1.0f)) + _104);
    } else {
      _706 = _102;
      _707 = _103;
      _708 = _104;
    }
  }
  uint _709 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _716 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_709), 0));
    _722 = (float((uint)((uint)(_716.x & 127))) + 0.5f);
  } else {
    _722 = 1.0f;
  }
  bool _725 = (_localToneMappingParams.w > 0.0f);
  if (_725) {
    float3 output_color = TonemapReplacer(float3(_706, _707, _708));
    _1078 = output_color.x;
    _1079 = output_color.y;
    _1080 = output_color.z;
  } else {
    _1078 = _706;
    _1079 = _707;
    _1080 = _708;
  }
  if (_etcParams.y > 1.0f) {
    float _1089 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _1090 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _1094 = saturate(1.0f - (dot(float2(_1089, _1090), float2(_1089, _1090)) * saturate(_etcParams.y + -1.0f)));
    _1099 = (_1094 * _1078);
    _1100 = (_1094 * _1079);
    _1101 = (_1094 * _1080);
  } else {
    _1099 = _1078;
    _1100 = _1079;
    _1101 = _1080;
  }
  if ((_725) && ((_etcParams.z > 0.0f))) {
    _1131 = select((_1099 <= 0.0031308000907301903f), (_1099 * 12.920000076293945f), (((pow(_1099, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1132 = select((_1100 <= 0.0031308000907301903f), (_1100 * 12.920000076293945f), (((pow(_1100, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1133 = select((_1101 <= 0.0031308000907301903f), (_1101 * 12.920000076293945f), (((pow(_1101, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1131 = _1099;
    _1132 = _1100;
    _1133 = _1101;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _1138 = float((uint)_709);
    if (!(_1138 < _viewDir.w)) {
      if (!(_1138 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _1147 = _1131;
        _1148 = _1132;
        _1149 = _1133;
      } else {
        _1147 = 0.0f;
        _1148 = 0.0f;
        _1149 = 0.0f;
      }
    } else {
      _1147 = 0.0f;
      _1148 = 0.0f;
      _1149 = 0.0f;
    }
  } else {
    _1147 = _1131;
    _1148 = _1132;
    _1149 = _1133;
  }
  float _1159 = exp2(log2(_1147 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1160 = exp2(log2(_1148 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1161 = exp2(log2(_1149 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_1159 * 18.6875f) + 1.0f)) * ((_1159 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_1160 * 18.6875f) + 1.0f)) * ((_1160 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_1161 * 18.6875f) + 1.0f)) * ((_1161 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _722;
  return SV_Target;
}