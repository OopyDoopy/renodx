struct PostProcessAnamorphic_CDStruct {
  float _anamorphicProgress;
  uint _anamorphicPlayerColor;
  uint _anamorphicBackgroundColor;
  uint _noiseTex;
  uint _milkyWayTexture;
  float _milkyWayRatio;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t32, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t40, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t33, space36);

Texture2D<float4> __3__36__0__0__g_specularAO : register(t76, space36);

Texture2D<uint4> __3__36__0__0__g_gbufferBaseColor : register(t77, space36);

Texture2D<float4> __3__36__0__0__g_gbufferNormal : register(t78, space36);

Texture2D<uint> __3__36__0__0__g_CustomRenderPassValue : register(t79, space36);

Texture2D<float4> __3__36__0__0__g_CustomRenderPassDepth : register(t80, space36);

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

cbuffer __3__35__0__0__AtmosphereConstantBuffer : register(b25, space35) {
  float _sunLightIntensity : packoffset(c000.x);
  float _sunLightPreset : packoffset(c000.y);
  float _sunSizeAngle : packoffset(c000.z);
  float _sunSizeAngleCosine : packoffset(c000.w);
  float _sunDirY : packoffset(c001.x);
  float _moonLightIntensity : packoffset(c001.y);
  float _moonLightPreset : packoffset(c001.z);
  float _moonSizeAngle : packoffset(c001.w);
  float _moonSizeAngleCosine : packoffset(c002.x);
  float _moonDirY : packoffset(c002.y);
  float _earthAxisTilt : packoffset(c002.z);
  float _latitude : packoffset(c002.w);
  float _earthRadius : packoffset(c003.x);
  float _atmosphereThickness : packoffset(c003.y);
  float _rayleighScaledHeight : packoffset(c003.z);
  uint _rayleighScatteringColor : packoffset(c003.w);
  float _mieScaledHeight : packoffset(c004.x);
  float _mieAerosolDensity : packoffset(c004.y);
  float _mieAerosolAbsorption : packoffset(c004.z);
  float _miePhaseConst : packoffset(c004.w);
  float _ozoneRatio : packoffset(c005.x);
  float _directionalLightLuminanceScale : packoffset(c005.y);
  float _distanceScale : packoffset(c005.z);
  float _heightFogDensity : packoffset(c005.w);
  float _heightFogBaseline : packoffset(c006.x);
  float _heightFogFalloff : packoffset(c006.y);
  float _heightFogScale : packoffset(c006.z);
  float _cloudBaseDensity : packoffset(c006.w);
  float _cloudBaseContrast : packoffset(c007.x);
  float _cloudBaseScale : packoffset(c007.y);
  float _cloudAlpha : packoffset(c007.z);
  float _cloudScrollMultiplier : packoffset(c007.w);
  float _cloudScatteringCoefficient : packoffset(c008.x);
  float _cloudPhaseConstFront : packoffset(c008.y);
  float _cloudPhaseConstBack : packoffset(c008.z);
  float _cloudAltitude : packoffset(c008.w);
  float _cloudThickness : packoffset(c009.x);
  float _cloudVisibleRange : packoffset(c009.y);
  float _cloudNear : packoffset(c009.z);
  float _cloudFadeRange : packoffset(c009.w);
  float _cloudDetailRatio : packoffset(c010.x);
  float _cloudDetailScale : packoffset(c010.y);
  float _cloudMultiRatio : packoffset(c010.z);
  float _cloudBeerPowderRatio : packoffset(c010.w);
  float _cloudCirrusAltitude : packoffset(c011.x);
  float _cloudCirrusDensity : packoffset(c011.y);
  float _cloudCirrusScale : packoffset(c011.z);
  float _cloudCirrusWeightR : packoffset(c011.w);
  float _cloudCirrusWeightG : packoffset(c012.x);
  float _cloudCirrusWeightB : packoffset(c012.y);
  float _cloudFlow : packoffset(c012.z);
  float _cloudSeed : packoffset(c012.w);
  float4 _volumeFogScatterColor : packoffset(c013.x);
  float4 _mieScatterColor : packoffset(c014.x);
};

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

ConstantBuffer<PostProcessAnamorphic_CDStruct> BindlessParameters_PostProcessAnamorphic_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _37 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  float4 _40 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _45 = (TEXCOORD.x * 2.0f) + -1.0f;
  float _46 = TEXCOORD.y * 2.0f;
  float _47 = 1.0f - _46;
  float _49 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _51 = max(1.0000000116860974e-07f, _49.x);
  float _87 = mad((_invViewProj[3].z), _51, mad((_invViewProj[3].y), _47, ((_invViewProj[3].x) * _45))) + (_invViewProj[3].w);
  float _91 = 5.0f / _37;
  int _98 = WaveReadLaneFirst(_materialIndex);
  int _106 = WaveReadLaneFirst(BindlessParameters_PostProcessAnamorphic_CD[((int)((uint)(select(((uint)_98 < (uint)170000), _98, 0)) + 0u))]._noiseTex);
  float4 _113 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_106 < (uint)65000), _106, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_91 * TEXCOORD.x), ((_time.x * 0.10000000149011612f) + (_91 * TEXCOORD.y))));
  float _116 = _113.x + -0.20000000298023224f;
  float _117 = _113.y + -0.20000000298023224f;
  float _120 = (_116 * 0.0020000000949949026f) + TEXCOORD.x;
  float _121 = (_117 * 0.004999999888241291f) + TEXCOORD.y;
  int2 _123; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_123.x, _123.y);
  uint _138 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_123.x))))) + 0.5f) * _120), int((float((int)(int(float((int)(_123.y))))) + 0.5f) * _121), 0));
  int _140 = _138.x & 255;
  float _148 = (float((uint)((uint)((uint)((uint)(_138.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
  float _149 = (float((uint)((uint)(((uint)((uint)(_138.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
  float _151 = 1.0f - abs(_148);
  float _152 = abs(_149);
  float _153 = _151 - _152;
  float _164;
  float _165;
  float _234;
  float _774;
  float _783;
  float _784;
  float _785;
  float _888;
  float _889;
  float _890;
  float _913;
  float _1116;
  float _1117;
  float _1118;
  float _1211;
  float _1212;
  float _1213;
  float _1267;
  float _1268;
  float _1269;
  float _1285;
  float _1286;
  float _1287;
  float _1317;
  float _1318;
  float _1319;
  float _1333;
  float _1334;
  float _1335;
  if (!(_153 >= 0.0f)) {
    _164 = (select((_148 >= 0.0f), 1.0f, -1.0f) * (1.0f - _152));
    _165 = (select((_149 >= 0.0f), 1.0f, -1.0f) * _151);
  } else {
    _164 = _148;
    _165 = _149;
  }
  float _167 = rsqrt(dot(float3(_164, _165, _153), float3(_164, _165, _153)));
  float _168 = _167 * _164;
  float _169 = _167 * _165;
  float _170 = _167 * _153;
  float _172 = rsqrt(dot(float3(_168, _169, _170), float3(_168, _169, _170)));
  float _173 = _172 * _168;
  float _174 = _172 * _169;
  float4 _188 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * _120), int(_customRenderPassSizeInvSize.y * _121), 0));
  float _194 = saturate((((_nearFarProj.x / _51) + 0.05000000074505806f) - (_nearFarProj.x / max(1.0000000116860974e-07f, _188.x))) * 50.0f);
  int _195 = WaveReadLaneFirst(_materialIndex);
  float _203 = WaveReadLaneFirst(BindlessParameters_PostProcessAnamorphic_CD[((int)((uint)(select(((uint)_195 < (uint)170000), _195, 0)) + 0u))]._anamorphicProgress);
  float _208 = ((mad((_invViewProj[0].z), _51, mad((_invViewProj[0].y), _47, ((_invViewProj[0].x) * _45))) + (_invViewProj[0].w)) / _87) - _mainPosition.x;
  float _209 = ((mad((_invViewProj[1].z), _51, mad((_invViewProj[1].y), _47, ((_invViewProj[1].x) * _45))) + (_invViewProj[1].w)) / _87) - _mainPosition.y;
  float _210 = ((mad((_invViewProj[2].z), _51, mad((_invViewProj[2].y), _47, ((_invViewProj[2].x) * _45))) + (_invViewProj[2].w)) / _87) - _mainPosition.z;
  float _220 = saturate(sqrt(((_208 * _208) + (_209 * _209)) + (_210 * _210)) / max(0.0010000000474974513f, (_203 * 300.0f)));
  float _221 = 1.0f - _220;
  if (_221 > 0.0f) {
    _234 = ((saturate((_203 * 2.0f) + -1.0f) * _220) + _221);
  } else {
    _234 = (pow(_203, 0.25f));
  }
  int _235 = WaveReadLaneFirst(_materialIndex);
  int _243 = WaveReadLaneFirst(BindlessParameters_PostProcessAnamorphic_CD[((int)((uint)(select(((uint)_235 < (uint)170000), _235, 0)) + 0u))]._anamorphicBackgroundColor);
  float _246 = float((uint)((uint)(((uint)((uint)(_243)) >> 16) & 255)));
  float _249 = float((uint)((uint)(((uint)((uint)(_243)) >> 8) & 255)));
  float _251 = float((uint)((uint)(_243 & 255)));
  float _276 = select(((_246 * 0.003921568859368563f) < 0.040449999272823334f), (_246 * 0.0003035269910469651f), exp2(log2((_246 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
  float _277 = select(((_249 * 0.003921568859368563f) < 0.040449999272823334f), (_249 * 0.0003035269910469651f), exp2(log2((_249 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
  float _278 = select(((_251 * 0.003921568859368563f) < 0.040449999272823334f), (_251 * 0.0003035269910469651f), exp2(log2((_251 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
  float _281 = TEXCOORD.x - (_116 * 0.0010000000474974513f);
  float _282 = TEXCOORD.y - (_117 * 0.0024999999441206455f);
  float4 _285 = __3__36__0__0__g_specularAO.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_281, _282), 0.0f);
  float _292 = ((_earthAxisTilt + 90.0f) - _latitude) * 0.01745329238474369f;
  float _293 = sin(_292);
  float _294 = cos(_292);
  float _298 = (_time.w * 0.2617993950843811f) + -3.1415927410125732f;
  float _299 = sin(_298);
  float _300 = cos(_298);
  float _301 = 1.0f - _300;
  float _302 = _301 * _293;
  float _303 = _301 * _294;
  float _304 = _299 * _293;
  float _305 = _299 * _294;
  float _315 = ((1.0f - TEXCOORD.y) * 2.0f) + -1.0f;
  float _351 = ((_invViewProjRelative[3].w) + (_invViewProjRelative[3].z)) + mad((_invViewProjRelative[3].y), _315, ((_invViewProjRelative[3].x) * _45));
  float _352 = ((mad((_invViewProjRelative[0].y), _315, ((_invViewProjRelative[0].x) * _45)) + (_invViewProjRelative[0].z)) + (_invViewProjRelative[0].w)) / _351;
  float _353 = (((_invViewProjRelative[1].w) + (_invViewProjRelative[1].z)) + mad((_invViewProjRelative[1].y), _315, ((_invViewProjRelative[1].x) * _45))) / _351;
  float _354 = (((_invViewProjRelative[2].w) + (_invViewProjRelative[2].z)) + mad((_invViewProjRelative[2].y), _315, ((_invViewProjRelative[2].x) * _45))) / _351;
  float _356 = rsqrt(dot(float3(_352, _353, _354), float3(_352, _353, _354)));
  float _357 = _356 * _352;
  float _358 = _356 * _353;
  float _359 = _356 * _354;
  float _362 = mad((-0.0f - _304), _359, mad(_305, _358, (_357 * _300)));
  float _366 = mad((_303 * _293), _359, mad(((_302 * _293) + _300), _358, (-0.0f - (_305 * _357))));
  float _369 = mad(((_303 * _294) + _300), _359, mad((_302 * _294), _358, (_357 * _304)));
  float _371 = atan(_369 / _362);
  bool _374 = (_362 < 0.0f);
  bool _375 = (_362 == 0.0f);
  bool _376 = (_369 >= 0.0f);
  bool _377 = (_369 < 0.0f);
  int _390 = WaveReadLaneFirst(_materialIndex);
  int _398 = WaveReadLaneFirst(BindlessParameters_PostProcessAnamorphic_CD[((int)((uint)(select(((uint)_390 < (uint)170000), _390, 0)) + 0u))]._milkyWayTexture);
  float4 _405 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_398 < (uint)65000), _398, 0)) + 0u))].SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(select(((_375) && (_376)), 0.75f, select(((_375) && (_377)), 0.25f, ((select(((_374) && (_377)), (_371 + -3.1415927410125732f), select(((_374) && (_376)), (_371 + 3.1415927410125732f), _371)) * 0.15915493667125702f) + 0.5f))), (acos(_366) * 0.31830987334251404f)), 0.0f);
  float _409 = _405.x + -0.061246078461408615f;
  float _410 = _405.y + -0.08228270709514618f;
  float _411 = _405.z + -0.09989875555038452f;
  float _420 = saturate(1.0f - (sqrt(((_409 * _409) + (_410 * _410)) + (_411 * _411)) * 4.0f));
  float _422 = dot(float3(_405.x, _405.y, _405.z), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f)) * 2.0f;
  float _432 = (((_422 * _276) - _405.x) * _420) + _405.x;
  float _433 = (((_422 * _277) - _405.y) * _420) + _405.y;
  float _434 = (((_422 * _278) - _405.z) * _420) + _405.z;
  float _436 = saturate(_285.w * 1.4285714626312256f);
  float _437 = _436 * _276;
  float _438 = _436 * _277;
  float _439 = _436 * _278;
  float _440 = _285.w * 10.0f;
  float _442 = saturate(_440 + -7.0f);
  float _455 = ((saturate(_276 * 2.0f) - _437) * _442) + _437;
  float _456 = ((saturate(_277 * 2.0f) - _438) * _442) + _438;
  float _457 = ((saturate(_278 * 2.0f) - _439) * _442) + _439;
  float _459 = saturate(_440 + -8.0f);
  float _460 = _459 * _459;
  float _467 = (_460 * (1.0f - _455)) + _455;
  float _468 = ((0.75f - _456) * _460) + _456;
  float _469 = ((0.550000011920929f - _457) * _460) + _457;
  float _471 = saturate(_440 + -9.0f);
  bool _486 = ((_49.x < 1.0000000116860974e-07f)) || ((_49.x == 1.0f));
  float _492 = max(0.0010000000474974513f, _exposure0.x);
  float _502 = float((int)(int(_362 * 2000.0f)));
  float _503 = float((int)(int(_366 * 2000.0f)));
  float _504 = float((int)(int(_369 * 2000.0f)));
  float _517 = frac((sin((_503 * 5.0000002374872565e-05f) + (_502 * 0.008500000461935997f)) * 10000.0f) * (abs(sin((_503 * 0.006500000134110451f) + (_502 * 0.0005000000237487257f))) + 0.10000000149011612f));
  float _529 = frac((sin((_517 * 17.0f) + (_504 * 5.0000002374872565e-05f)) * 10000.0f) * (abs(sin(_517 + (_504 * 0.006500000134110451f))) + 0.10000000149011612f));
  float _536 = float((int)(int(_362 * 1500.0f)));
  float _537 = float((int)(int(_366 * 1500.0f)));
  float _538 = float((int)(int(_369 * 1500.0f)));
  float _551 = frac((sin((_537 * 6.666666740784422e-05f) + (_536 * 0.01133333332836628f)) * 10000.0f) * (abs(sin((_537 * 0.008666666224598885f) + (_536 * 0.0006666666595265269f))) + 0.10000000149011612f));
  float _563 = frac((sin((_551 * 17.0f) + (_538 * 6.666666740784422e-05f)) * 10000.0f) * (abs(sin(_551 + (_538 * 0.008666666224598885f))) + 0.10000000149011612f));
  float _567 = saturate((_529 + -0.699999988079071f) * 3.3333332538604736f) * 1.5f;
  float _571 = (_567 * _432) + _432;
  float _572 = (_567 * _433) + _433;
  float _573 = (_567 * _434) + _434;
  float _577 = saturate((_563 + -0.9800000190734863f) * 50.00004959106445f) * 9.0f;
  int _584 = WaveReadLaneFirst(_materialIndex);
  float _592 = WaveReadLaneFirst(BindlessParameters_PostProcessAnamorphic_CD[((int)((uint)(select(((uint)_584 < (uint)170000), _584, 0)) + 0u))]._milkyWayRatio);
  float _605 = ((saturate((_563 + -0.9994999766349792f) * 1999.906494140625f) * 3.0f) + (saturate((_529 + -0.9990000128746033f) * 1000.0128784179688f) * 0.10000000149011612f)) * 0.5f;
  float _606 = _605 + (_592 * ((_571 * _577) + _571));
  float _607 = _605 + (_592 * ((_572 * _577) + _572));
  float _608 = _605 + (_592 * ((_573 * _577) + _573));
  float _610 = saturate(_49.x * 5.0f);
  float _617 = (((select(_486, 0.0f, ((((_276 * 0.10000000149011612f) - _467) * _471) + _467)) / _492) - _606) * _610) + _606;
  float _618 = (((select(_486, 0.0f, ((((_277 * 0.10000000149011612f) - _468) * _471) + _468)) / _492) - _607) * _610) + _607;
  float _619 = (((select(_486, 0.0f, ((((_278 * 0.10000000149011612f) - _469) * _471) + _469)) / _492) - _608) * _610) + _608;
  float _620 = 2.0f / _37;
  int _635 = WaveReadLaneFirst(_materialIndex);
  int _643 = WaveReadLaneFirst(BindlessParameters_PostProcessAnamorphic_CD[((int)((uint)(select(((uint)_635 < (uint)170000), _635, 0)) + 0u))]._noiseTex);
  float4 _650 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_643 < (uint)65000), _643, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((((_173 * -0.10000000149011612f) - (_113.x * 0.20000000298023224f)) + (_620 * TEXCOORD.x)) + (_time.x * 0.009999999776482582f)), (((_174 * -0.10000000149011612f) - (_113.y * 0.20000000298023224f)) + (_620 * TEXCOORD.y))));
  float _661 = saturate(1.0f - dot(float3(_173, _174, (_172 * _170)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
  float _665 = saturate((_661 * _661) + (_650.w * 0.5f));
  int _666 = WaveReadLaneFirst(_materialIndex);
  int _674 = WaveReadLaneFirst(BindlessParameters_PostProcessAnamorphic_CD[((int)((uint)(select(((uint)_666 < (uint)170000), _666, 0)) + 0u))]._anamorphicPlayerColor);
  float _677 = float((uint)((uint)(((uint)((uint)(_674)) >> 16) & 255)));
  float _680 = float((uint)((uint)(((uint)((uint)(_674)) >> 8) & 255)));
  float _682 = float((uint)((uint)(_674 & 255)));
  float _715 = max(0.0010000000474974513f, _exposure0.x);
  float _716 = (select(((_677 * 0.003921568859368563f) < 0.040449999272823334f), (_677 * 0.0003035269910469651f), exp2(log2((_677 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _665) / _715;
  float _717 = (select(((_680 * 0.003921568859368563f) < 0.040449999272823334f), (_680 * 0.0003035269910469651f), exp2(log2((_680 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _665) / _715;
  float _718 = (select(((_682 * 0.003921568859368563f) < 0.040449999272823334f), (_682 * 0.0003035269910469651f), exp2(log2((_682 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _665) / _715;
  if ((_140 == _renderPassSelfPlayer) || ((!(_140 == _renderPassSelfPlayer)) && (_140 == _renderPassTest))) {
    _888 = (lerp(_617, _716, _194));
    _889 = (lerp(_618, _717, _194));
    _890 = (lerp(_619, _718, _194));
  } else {
    if (_140 == _renderPassAnamorphicMural) {
      _888 = (lerp(_617, _40.x, _194));
      _889 = (lerp(_618, _40.y, _194));
      _890 = (lerp(_619, _40.z, _194));
    } else {
      uint2 _759 = __3__36__0__0__g_stencil.Load(int3((int)(uint(_bufferSizeAndInvSize.x * TEXCOORD.x)), (int)(uint(_bufferSizeAndInvSize.y * TEXCOORD.y)), 0));
      int _761 = _759.x & 127;
      if ((uint)(_761 + -105) < (uint)2) {
        _774 = 0.10000000149011612f;
        float _775 = _774 * _194;
        _783 = ((_775 * _716) + _617);
        _784 = ((_775 * _717) + _618);
        _785 = ((_775 * _718) + _619);
      } else {
        bool _769 = (_761 == 107);
        if ((_769) || ((((_761 == 26)) || (((uint)(_761 + -27) < (uint)2))))) {
          _774 = select(_769, 0.10000000149011612f, 0.014999999664723873f);
          float _775 = _774 * _194;
          _783 = ((_775 * _716) + _617);
          _784 = ((_775 * _717) + _618);
          _785 = ((_775 * _718) + _619);
        } else {
          _783 = _617;
          _784 = _618;
          _785 = _619;
        }
      }
      if ((uint)(_761 + -53) < (uint)15) {
        uint _791 = uint(_bufferSizeAndInvSize.x * _281);
        uint _792 = uint(_bufferSizeAndInvSize.y * _282);
        uint4 _794 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_791), (int)(_792), 0));
        float4 _797 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_791), (int)(_792), 0));
        float _815 = (saturate(_797.x * 1.0009784698486328f) * 2.0f) + -1.0f;
        float _816 = (saturate(_797.y * 1.0009784698486328f) * 2.0f) + -1.0f;
        float _817 = (saturate(_797.z * 1.0009784698486328f) * 2.0f) + -1.0f;
        float _819 = rsqrt(dot(float3(_815, _816, _817), float3(_815, _816, _817)));
        float _820 = _819 * _815;
        float _821 = _819 * _816;
        float _822 = _817 * _819;
        float _825 = (float((uint)((uint)(((uint)((uint)(_794.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
        float _826 = (float((uint)((uint)(_794.w & 255))) * 0.007843137718737125f) + -1.0f;
        float _829 = (_825 + _826) * 0.5f;
        float _830 = (_825 - _826) * 0.5f;
        float _834 = (1.0f - abs(_829)) - abs(_830);
        float _836 = rsqrt(dot(float3(_829, _830, _834), float3(_829, _830, _834)));
        float _837 = _836 * _829;
        float _838 = _836 * _830;
        float _839 = _836 * _834;
        float _841 = select((_822 >= 0.0f), 1.0f, -1.0f);
        float _844 = -0.0f - (1.0f / (_841 + _822));
        float _845 = _821 * _844;
        float _846 = _845 * _820;
        float _847 = _841 * _820;
        float _856 = mad(_839, _820, mad(_838, _846, ((((_847 * _820) * _844) + 1.0f) * _837)));
        float _860 = mad(_839, _821, mad(_838, (_841 + (_845 * _821)), ((_837 * _841) * _846)));
        float _864 = mad(_839, _822, mad(_838, (-0.0f - _821), (-0.0f - (_847 * _837))));
        float _866 = rsqrt(dot(float3(_856, _860, _864), float3(_856, _860, _864)));
        float _880 = (1.0f - saturate(dot(float3((_866 * _856), (_866 * _860), (_866 * _864)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))))) * _194;
        _888 = ((_880 * _716) + _783);
        _889 = ((_880 * _717) + _784);
        _890 = ((_880 * _718) + _785);
      } else {
        _888 = _783;
        _889 = _784;
        _890 = _785;
      }
    }
  }
  float _897 = ((_888 - _40.x) * _234) + _40.x;
  float _898 = ((_889 - _40.y) * _234) + _40.y;
  float _899 = ((_890 - _40.z) * _234) + _40.z;
  uint _900 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _907 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_900), 0));
    _913 = (float((uint)((uint)(_907.x & 127))) + 0.5f);
  } else {
    _913 = 1.0f;
  }
  bool _916 = (_localToneMappingParams.w > 0.0f);
  if (_916) {
    float3 output_color = TonemapReplacer(float3(_897, _898, _899));
    _1267 = output_color.x;
    _1268 = output_color.y;
    _1269 = output_color.z;
  } else {
    _1267 = _897;
    _1268 = _898;
    _1269 = _899;
  }
  if (_etcParams.y > 1.0f) {
    float _1275 = abs(_45);
    float _1276 = abs(_46 + -1.0f);
    float _1280 = saturate(1.0f - (dot(float2(_1275, _1276), float2(_1275, _1276)) * saturate(_etcParams.y + -1.0f)));
    _1285 = (_1280 * _1267);
    _1286 = (_1280 * _1268);
    _1287 = (_1280 * _1269);
  } else {
    _1285 = _1267;
    _1286 = _1268;
    _1287 = _1269;
  }
  if ((_916) && ((_etcParams.z > 0.0f))) {
    _1317 = select((_1285 <= 0.0031308000907301903f), (_1285 * 12.920000076293945f), (((pow(_1285, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1318 = select((_1286 <= 0.0031308000907301903f), (_1286 * 12.920000076293945f), (((pow(_1286, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1319 = select((_1287 <= 0.0031308000907301903f), (_1287 * 12.920000076293945f), (((pow(_1287, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1317 = _1285;
    _1318 = _1286;
    _1319 = _1287;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _1324 = float((uint)_900);
    if (!(_1324 < _viewDir.w)) {
      if (!(_1324 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _1333 = _1317;
        _1334 = _1318;
        _1335 = _1319;
      } else {
        _1333 = 0.0f;
        _1334 = 0.0f;
        _1335 = 0.0f;
      }
    } else {
      _1333 = 0.0f;
      _1334 = 0.0f;
      _1335 = 0.0f;
    }
  } else {
    _1333 = _1317;
    _1334 = _1318;
    _1335 = _1319;
  }
  SV_Target.x = _1333;
  SV_Target.y = _1334;
  SV_Target.z = _1335;
  SV_Target.w = _913;
  return SV_Target;
}