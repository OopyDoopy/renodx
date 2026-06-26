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
  float _50 = (pow(_40.x, 0.012683313339948654f));
  float _51 = (pow(_40.y, 0.012683313339948654f));
  float _52 = (pow(_40.z, 0.012683313339948654f));
  float _77 = exp2(log2(max(0.0f, (_50 + -0.8359375f)) / (18.8515625f - (_50 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _78 = exp2(log2(max(0.0f, (_51 + -0.8359375f)) / (18.8515625f - (_51 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _79 = exp2(log2(max(0.0f, (_52 + -0.8359375f)) / (18.8515625f - (_52 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _81 = (TEXCOORD.x * 2.0f) + -1.0f;
  float _82 = TEXCOORD.y * 2.0f;
  float _83 = 1.0f - _82;
  float _85 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _87 = max(1.0000000116860974e-07f, _85.x);
  float _123 = mad((_invViewProj[3].z), _87, mad((_invViewProj[3].y), _83, ((_invViewProj[3].x) * _81))) + (_invViewProj[3].w);
  float _127 = 5.0f / _37;
  int _134 = WaveReadLaneFirst(_materialIndex);
  int _142 = WaveReadLaneFirst(BindlessParameters_PostProcessAnamorphic_CD[((int)((uint)(select(((uint)_134 < (uint)170000), _134, 0)) + 0u))]._noiseTex);
  float4 _149 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_142 < (uint)65000), _142, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_127 * TEXCOORD.x), ((_time.x * 0.10000000149011612f) + (_127 * TEXCOORD.y))));
  float _152 = _149.x + -0.20000000298023224f;
  float _153 = _149.y + -0.20000000298023224f;
  float _156 = (_152 * 0.0020000000949949026f) + TEXCOORD.x;
  float _157 = (_153 * 0.004999999888241291f) + TEXCOORD.y;
  int2 _159; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_159.x, _159.y);
  uint _174 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_159.x))))) + 0.5f) * _156), int((float((int)(int(float((int)(_159.y))))) + 0.5f) * _157), 0));
  int _176 = _174.x & 255;
  float _184 = (float((uint)((uint)((uint)((uint)(_174.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
  float _185 = (float((uint)((uint)(((uint)((uint)(_174.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
  float _187 = 1.0f - abs(_184);
  float _188 = abs(_185);
  float _189 = _187 - _188;
  float _200;
  float _201;
  float _270;
  float _810;
  float _819;
  float _820;
  float _821;
  float _924;
  float _925;
  float _926;
  float _949;
  float _1152;
  float _1153;
  float _1154;
  float _1247;
  float _1248;
  float _1249;
  float _1303;
  float _1304;
  float _1305;
  float _1321;
  float _1322;
  float _1323;
  float _1353;
  float _1354;
  float _1355;
  float _1369;
  float _1370;
  float _1371;
  if (!(_189 >= 0.0f)) {
    _200 = (select((_184 >= 0.0f), 1.0f, -1.0f) * (1.0f - _188));
    _201 = (select((_185 >= 0.0f), 1.0f, -1.0f) * _187);
  } else {
    _200 = _184;
    _201 = _185;
  }
  float _203 = rsqrt(dot(float3(_200, _201, _189), float3(_200, _201, _189)));
  float _204 = _203 * _200;
  float _205 = _203 * _201;
  float _206 = _203 * _189;
  float _208 = rsqrt(dot(float3(_204, _205, _206), float3(_204, _205, _206)));
  float _209 = _208 * _204;
  float _210 = _208 * _205;
  float4 _224 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * _156), int(_customRenderPassSizeInvSize.y * _157), 0));
  float _230 = saturate((((_nearFarProj.x / _87) + 0.05000000074505806f) - (_nearFarProj.x / max(1.0000000116860974e-07f, _224.x))) * 50.0f);
  int _231 = WaveReadLaneFirst(_materialIndex);
  float _239 = WaveReadLaneFirst(BindlessParameters_PostProcessAnamorphic_CD[((int)((uint)(select(((uint)_231 < (uint)170000), _231, 0)) + 0u))]._anamorphicProgress);
  float _244 = ((mad((_invViewProj[0].z), _87, mad((_invViewProj[0].y), _83, ((_invViewProj[0].x) * _81))) + (_invViewProj[0].w)) / _123) - _mainPosition.x;
  float _245 = ((mad((_invViewProj[1].z), _87, mad((_invViewProj[1].y), _83, ((_invViewProj[1].x) * _81))) + (_invViewProj[1].w)) / _123) - _mainPosition.y;
  float _246 = ((mad((_invViewProj[2].z), _87, mad((_invViewProj[2].y), _83, ((_invViewProj[2].x) * _81))) + (_invViewProj[2].w)) / _123) - _mainPosition.z;
  float _256 = saturate(sqrt(((_244 * _244) + (_245 * _245)) + (_246 * _246)) / max(0.0010000000474974513f, (_239 * 300.0f)));
  float _257 = 1.0f - _256;
  if (_257 > 0.0f) {
    _270 = ((saturate((_239 * 2.0f) + -1.0f) * _256) + _257);
  } else {
    _270 = (pow(_239, 0.25f));
  }
  int _271 = WaveReadLaneFirst(_materialIndex);
  int _279 = WaveReadLaneFirst(BindlessParameters_PostProcessAnamorphic_CD[((int)((uint)(select(((uint)_271 < (uint)170000), _271, 0)) + 0u))]._anamorphicBackgroundColor);
  float _282 = float((uint)((uint)(((uint)((uint)(_279)) >> 16) & 255)));
  float _285 = float((uint)((uint)(((uint)((uint)(_279)) >> 8) & 255)));
  float _287 = float((uint)((uint)(_279 & 255)));
  float _312 = select(((_282 * 0.003921568859368563f) < 0.040449999272823334f), (_282 * 0.0003035269910469651f), exp2(log2((_282 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
  float _313 = select(((_285 * 0.003921568859368563f) < 0.040449999272823334f), (_285 * 0.0003035269910469651f), exp2(log2((_285 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
  float _314 = select(((_287 * 0.003921568859368563f) < 0.040449999272823334f), (_287 * 0.0003035269910469651f), exp2(log2((_287 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
  float _317 = TEXCOORD.x - (_152 * 0.0010000000474974513f);
  float _318 = TEXCOORD.y - (_153 * 0.0024999999441206455f);
  float4 _321 = __3__36__0__0__g_specularAO.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_317, _318), 0.0f);
  float _328 = ((_earthAxisTilt + 90.0f) - _latitude) * 0.01745329238474369f;
  float _329 = sin(_328);
  float _330 = cos(_328);
  float _334 = (_time.w * 0.2617993950843811f) + -3.1415927410125732f;
  float _335 = sin(_334);
  float _336 = cos(_334);
  float _337 = 1.0f - _336;
  float _338 = _337 * _329;
  float _339 = _337 * _330;
  float _340 = _335 * _329;
  float _341 = _335 * _330;
  float _351 = ((1.0f - TEXCOORD.y) * 2.0f) + -1.0f;
  float _387 = ((_invViewProjRelative[3].w) + (_invViewProjRelative[3].z)) + mad((_invViewProjRelative[3].y), _351, ((_invViewProjRelative[3].x) * _81));
  float _388 = ((mad((_invViewProjRelative[0].y), _351, ((_invViewProjRelative[0].x) * _81)) + (_invViewProjRelative[0].z)) + (_invViewProjRelative[0].w)) / _387;
  float _389 = (((_invViewProjRelative[1].w) + (_invViewProjRelative[1].z)) + mad((_invViewProjRelative[1].y), _351, ((_invViewProjRelative[1].x) * _81))) / _387;
  float _390 = (((_invViewProjRelative[2].w) + (_invViewProjRelative[2].z)) + mad((_invViewProjRelative[2].y), _351, ((_invViewProjRelative[2].x) * _81))) / _387;
  float _392 = rsqrt(dot(float3(_388, _389, _390), float3(_388, _389, _390)));
  float _393 = _392 * _388;
  float _394 = _392 * _389;
  float _395 = _392 * _390;
  float _398 = mad((-0.0f - _340), _395, mad(_341, _394, (_393 * _336)));
  float _402 = mad((_339 * _329), _395, mad(((_338 * _329) + _336), _394, (-0.0f - (_341 * _393))));
  float _405 = mad(((_339 * _330) + _336), _395, mad((_338 * _330), _394, (_393 * _340)));
  float _407 = atan(_405 / _398);
  bool _410 = (_398 < 0.0f);
  bool _411 = (_398 == 0.0f);
  bool _412 = (_405 >= 0.0f);
  bool _413 = (_405 < 0.0f);
  int _426 = WaveReadLaneFirst(_materialIndex);
  int _434 = WaveReadLaneFirst(BindlessParameters_PostProcessAnamorphic_CD[((int)((uint)(select(((uint)_426 < (uint)170000), _426, 0)) + 0u))]._milkyWayTexture);
  float4 _441 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_434 < (uint)65000), _434, 0)) + 0u))].SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(select(((_411) && (_412)), 0.75f, select(((_411) && (_413)), 0.25f, ((select(((_410) && (_413)), (_407 + -3.1415927410125732f), select(((_410) && (_412)), (_407 + 3.1415927410125732f), _407)) * 0.15915493667125702f) + 0.5f))), (acos(_402) * 0.31830987334251404f)), 0.0f);
  float _445 = _441.x + -0.061246078461408615f;
  float _446 = _441.y + -0.08228270709514618f;
  float _447 = _441.z + -0.09989875555038452f;
  float _456 = saturate(1.0f - (sqrt(((_445 * _445) + (_446 * _446)) + (_447 * _447)) * 4.0f));
  float _458 = dot(float3(_441.x, _441.y, _441.z), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f)) * 2.0f;
  float _468 = (((_458 * _312) - _441.x) * _456) + _441.x;
  float _469 = (((_458 * _313) - _441.y) * _456) + _441.y;
  float _470 = (((_458 * _314) - _441.z) * _456) + _441.z;
  float _472 = saturate(_321.w * 1.4285714626312256f);
  float _473 = _472 * _312;
  float _474 = _472 * _313;
  float _475 = _472 * _314;
  float _476 = _321.w * 10.0f;
  float _478 = saturate(_476 + -7.0f);
  float _491 = ((saturate(_312 * 2.0f) - _473) * _478) + _473;
  float _492 = ((saturate(_313 * 2.0f) - _474) * _478) + _474;
  float _493 = ((saturate(_314 * 2.0f) - _475) * _478) + _475;
  float _495 = saturate(_476 + -8.0f);
  float _496 = _495 * _495;
  float _503 = (_496 * (1.0f - _491)) + _491;
  float _504 = ((0.75f - _492) * _496) + _492;
  float _505 = ((0.550000011920929f - _493) * _496) + _493;
  float _507 = saturate(_476 + -9.0f);
  bool _522 = ((_85.x < 1.0000000116860974e-07f)) || ((_85.x == 1.0f));
  float _528 = max(0.0010000000474974513f, _exposure0.x);
  float _538 = float((int)(int(_398 * 2000.0f)));
  float _539 = float((int)(int(_402 * 2000.0f)));
  float _540 = float((int)(int(_405 * 2000.0f)));
  float _553 = frac((sin((_539 * 5.0000002374872565e-05f) + (_538 * 0.008500000461935997f)) * 10000.0f) * (abs(sin((_539 * 0.006500000134110451f) + (_538 * 0.0005000000237487257f))) + 0.10000000149011612f));
  float _565 = frac((sin((_553 * 17.0f) + (_540 * 5.0000002374872565e-05f)) * 10000.0f) * (abs(sin(_553 + (_540 * 0.006500000134110451f))) + 0.10000000149011612f));
  float _572 = float((int)(int(_398 * 1500.0f)));
  float _573 = float((int)(int(_402 * 1500.0f)));
  float _574 = float((int)(int(_405 * 1500.0f)));
  float _587 = frac((sin((_573 * 6.666666740784422e-05f) + (_572 * 0.01133333332836628f)) * 10000.0f) * (abs(sin((_573 * 0.008666666224598885f) + (_572 * 0.0006666666595265269f))) + 0.10000000149011612f));
  float _599 = frac((sin((_587 * 17.0f) + (_574 * 6.666666740784422e-05f)) * 10000.0f) * (abs(sin(_587 + (_574 * 0.008666666224598885f))) + 0.10000000149011612f));
  float _603 = saturate((_565 + -0.699999988079071f) * 3.3333332538604736f) * 1.5f;
  float _607 = (_603 * _468) + _468;
  float _608 = (_603 * _469) + _469;
  float _609 = (_603 * _470) + _470;
  float _613 = saturate((_599 + -0.9800000190734863f) * 50.00004959106445f) * 9.0f;
  int _620 = WaveReadLaneFirst(_materialIndex);
  float _628 = WaveReadLaneFirst(BindlessParameters_PostProcessAnamorphic_CD[((int)((uint)(select(((uint)_620 < (uint)170000), _620, 0)) + 0u))]._milkyWayRatio);
  float _641 = ((saturate((_599 + -0.9994999766349792f) * 1999.906494140625f) * 3.0f) + (saturate((_565 + -0.9990000128746033f) * 1000.0128784179688f) * 0.10000000149011612f)) * 0.5f;
  float _642 = _641 + (_628 * ((_607 * _613) + _607));
  float _643 = _641 + (_628 * ((_608 * _613) + _608));
  float _644 = _641 + (_628 * ((_609 * _613) + _609));
  float _646 = saturate(_85.x * 5.0f);
  float _653 = (((select(_522, 0.0f, ((((_312 * 0.10000000149011612f) - _503) * _507) + _503)) / _528) - _642) * _646) + _642;
  float _654 = (((select(_522, 0.0f, ((((_313 * 0.10000000149011612f) - _504) * _507) + _504)) / _528) - _643) * _646) + _643;
  float _655 = (((select(_522, 0.0f, ((((_314 * 0.10000000149011612f) - _505) * _507) + _505)) / _528) - _644) * _646) + _644;
  float _656 = 2.0f / _37;
  int _671 = WaveReadLaneFirst(_materialIndex);
  int _679 = WaveReadLaneFirst(BindlessParameters_PostProcessAnamorphic_CD[((int)((uint)(select(((uint)_671 < (uint)170000), _671, 0)) + 0u))]._noiseTex);
  float4 _686 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_679 < (uint)65000), _679, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((((_209 * -0.10000000149011612f) - (_149.x * 0.20000000298023224f)) + (_656 * TEXCOORD.x)) + (_time.x * 0.009999999776482582f)), (((_210 * -0.10000000149011612f) - (_149.y * 0.20000000298023224f)) + (_656 * TEXCOORD.y))));
  float _697 = saturate(1.0f - dot(float3(_209, _210, (_208 * _206)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
  float _701 = saturate((_697 * _697) + (_686.w * 0.5f));
  int _702 = WaveReadLaneFirst(_materialIndex);
  int _710 = WaveReadLaneFirst(BindlessParameters_PostProcessAnamorphic_CD[((int)((uint)(select(((uint)_702 < (uint)170000), _702, 0)) + 0u))]._anamorphicPlayerColor);
  float _713 = float((uint)((uint)(((uint)((uint)(_710)) >> 16) & 255)));
  float _716 = float((uint)((uint)(((uint)((uint)(_710)) >> 8) & 255)));
  float _718 = float((uint)((uint)(_710 & 255)));
  float _751 = max(0.0010000000474974513f, _exposure0.x);
  float _752 = (select(((_713 * 0.003921568859368563f) < 0.040449999272823334f), (_713 * 0.0003035269910469651f), exp2(log2((_713 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _701) / _751;
  float _753 = (select(((_716 * 0.003921568859368563f) < 0.040449999272823334f), (_716 * 0.0003035269910469651f), exp2(log2((_716 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _701) / _751;
  float _754 = (select(((_718 * 0.003921568859368563f) < 0.040449999272823334f), (_718 * 0.0003035269910469651f), exp2(log2((_718 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _701) / _751;
  if ((_176 == _renderPassSelfPlayer) || ((!(_176 == _renderPassSelfPlayer)) && (_176 == _renderPassTest))) {
    _924 = (lerp(_653, _752, _230));
    _925 = (lerp(_654, _753, _230));
    _926 = (lerp(_655, _754, _230));
  } else {
    if (_176 == _renderPassAnamorphicMural) {
      _924 = (lerp(_653, _77, _230));
      _925 = (lerp(_654, _78, _230));
      _926 = (lerp(_655, _79, _230));
    } else {
      uint2 _795 = __3__36__0__0__g_stencil.Load(int3((int)(uint(_bufferSizeAndInvSize.x * TEXCOORD.x)), (int)(uint(_bufferSizeAndInvSize.y * TEXCOORD.y)), 0));
      int _797 = _795.x & 127;
      if ((uint)(_797 + -105) < (uint)2) {
        _810 = 0.10000000149011612f;
        float _811 = _810 * _230;
        _819 = ((_811 * _752) + _653);
        _820 = ((_811 * _753) + _654);
        _821 = ((_811 * _754) + _655);
      } else {
        bool _805 = (_797 == 107);
        if ((_805) || ((((_797 == 26)) || (((uint)(_797 + -27) < (uint)2))))) {
          _810 = select(_805, 0.10000000149011612f, 0.014999999664723873f);
          float _811 = _810 * _230;
          _819 = ((_811 * _752) + _653);
          _820 = ((_811 * _753) + _654);
          _821 = ((_811 * _754) + _655);
        } else {
          _819 = _653;
          _820 = _654;
          _821 = _655;
        }
      }
      if ((uint)(_797 + -53) < (uint)15) {
        uint _827 = uint(_bufferSizeAndInvSize.x * _317);
        uint _828 = uint(_bufferSizeAndInvSize.y * _318);
        uint4 _830 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_827), (int)(_828), 0));
        float4 _833 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_827), (int)(_828), 0));
        float _851 = (saturate(_833.x * 1.0009784698486328f) * 2.0f) + -1.0f;
        float _852 = (saturate(_833.y * 1.0009784698486328f) * 2.0f) + -1.0f;
        float _853 = (saturate(_833.z * 1.0009784698486328f) * 2.0f) + -1.0f;
        float _855 = rsqrt(dot(float3(_851, _852, _853), float3(_851, _852, _853)));
        float _856 = _855 * _851;
        float _857 = _855 * _852;
        float _858 = _853 * _855;
        float _861 = (float((uint)((uint)(((uint)((uint)(_830.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
        float _862 = (float((uint)((uint)(_830.w & 255))) * 0.007843137718737125f) + -1.0f;
        float _865 = (_861 + _862) * 0.5f;
        float _866 = (_861 - _862) * 0.5f;
        float _870 = (1.0f - abs(_865)) - abs(_866);
        float _872 = rsqrt(dot(float3(_865, _866, _870), float3(_865, _866, _870)));
        float _873 = _872 * _865;
        float _874 = _872 * _866;
        float _875 = _872 * _870;
        float _877 = select((_858 >= 0.0f), 1.0f, -1.0f);
        float _880 = -0.0f - (1.0f / (_877 + _858));
        float _881 = _857 * _880;
        float _882 = _881 * _856;
        float _883 = _877 * _856;
        float _892 = mad(_875, _856, mad(_874, _882, ((((_883 * _856) * _880) + 1.0f) * _873)));
        float _896 = mad(_875, _857, mad(_874, (_877 + (_881 * _857)), ((_873 * _877) * _882)));
        float _900 = mad(_875, _858, mad(_874, (-0.0f - _857), (-0.0f - (_883 * _873))));
        float _902 = rsqrt(dot(float3(_892, _896, _900), float3(_892, _896, _900)));
        float _916 = (1.0f - saturate(dot(float3((_902 * _892), (_902 * _896), (_902 * _900)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))))) * _230;
        _924 = ((_916 * _752) + _819);
        _925 = ((_916 * _753) + _820);
        _926 = ((_916 * _754) + _821);
      } else {
        _924 = _819;
        _925 = _820;
        _926 = _821;
      }
    }
  }
  float _933 = ((_924 - _77) * _270) + _77;
  float _934 = ((_925 - _78) * _270) + _78;
  float _935 = ((_926 - _79) * _270) + _79;
  uint _936 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _943 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_936), 0));
    _949 = (float((uint)((uint)(_943.x & 127))) + 0.5f);
  } else {
    _949 = 1.0f;
  }
  bool _952 = (_localToneMappingParams.w > 0.0f);
  if (_952) {
    float3 output_color = TonemapReplacer(float3(_933, _934, _935));
    _1303 = output_color.x;
    _1304 = output_color.y;
    _1305 = output_color.z;
  } else {
    _1303 = _933;
    _1304 = _934;
    _1305 = _935;
  }
  if (_etcParams.y > 1.0f) {
    float _1311 = abs(_81);
    float _1312 = abs(_82 + -1.0f);
    float _1316 = saturate(1.0f - (dot(float2(_1311, _1312), float2(_1311, _1312)) * saturate(_etcParams.y + -1.0f)));
    _1321 = (_1316 * _1303);
    _1322 = (_1316 * _1304);
    _1323 = (_1316 * _1305);
  } else {
    _1321 = _1303;
    _1322 = _1304;
    _1323 = _1305;
  }
  if ((_952) && ((_etcParams.z > 0.0f))) {
    _1353 = select((_1321 <= 0.0031308000907301903f), (_1321 * 12.920000076293945f), (((pow(_1321, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1354 = select((_1322 <= 0.0031308000907301903f), (_1322 * 12.920000076293945f), (((pow(_1322, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1355 = select((_1323 <= 0.0031308000907301903f), (_1323 * 12.920000076293945f), (((pow(_1323, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1353 = _1321;
    _1354 = _1322;
    _1355 = _1323;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _1360 = float((uint)_936);
    if (!(_1360 < _viewDir.w)) {
      if (!(_1360 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _1369 = _1353;
        _1370 = _1354;
        _1371 = _1355;
      } else {
        _1369 = 0.0f;
        _1370 = 0.0f;
        _1371 = 0.0f;
      }
    } else {
      _1369 = 0.0f;
      _1370 = 0.0f;
      _1371 = 0.0f;
    }
  } else {
    _1369 = _1353;
    _1370 = _1354;
    _1371 = _1355;
  }
  float _1381 = exp2(log2(_1369 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1382 = exp2(log2(_1370 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1383 = exp2(log2(_1371 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_1381 * 18.6875f) + 1.0f)) * ((_1381 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_1382 * 18.6875f) + 1.0f)) * ((_1382 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_1383 * 18.6875f) + 1.0f)) * ((_1383 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _949;
  return SV_Target;
}