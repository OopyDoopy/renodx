#include "../tonemap.hlsli"

struct PostProcessAnamorphic_CDStruct {
  float _anamorphicProgress;
  uint _anamorphicPlayerColor;
  uint _anamorphicBackgroundColor;
  uint _noiseTex;
  uint _milkyWayTexture;
  float _milkyWayRatio;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t33, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t75, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t38, space36);

Texture2D<float4> __3__36__0__0__g_specularAO : register(t63, space36);

Texture2D<uint4> __3__36__0__0__g_gbufferBaseColor : register(t77, space36);

Texture2D<float4> __3__36__0__0__g_gbufferNormal : register(t64, space36);

Texture2D<uint> __3__36__0__0__g_CustomRenderPassValue : register(t65, space36);

Texture2D<float4> __3__36__0__0__g_CustomRenderPassDepth : register(t66, space36);

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
#endif
cbuffer __3__35__0__0__AtmosphereConstantBuffer : register(b24, space35) {
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

#if 0
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

ConstantBuffer<PostProcessAnamorphic_CDStruct> BindlessParameters_PostProcessAnamorphic_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _30[36];
  float _36 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  float4 _39 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _49 = (pow(_39.x, 0.012683313339948654f));
  float _50 = (pow(_39.y, 0.012683313339948654f));
  float _51 = (pow(_39.z, 0.012683313339948654f));
  float _76 = exp2(log2(max(0.0f, (_49 + -0.8359375f)) / (18.8515625f - (_49 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _77 = exp2(log2(max(0.0f, (_50 + -0.8359375f)) / (18.8515625f - (_50 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _78 = exp2(log2(max(0.0f, (_51 + -0.8359375f)) / (18.8515625f - (_51 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _80 = (TEXCOORD.x * 2.0f) + -1.0f;
  float _81 = TEXCOORD.y * 2.0f;
  float _82 = 1.0f - _81;
  float _84 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _86 = max(1.0000000116860974e-07f, _84.x);
  float _122 = mad((_invViewProj[3].z), _86, mad((_invViewProj[3].y), _82, ((_invViewProj[3].x) * _80))) + (_invViewProj[3].w);
  float _126 = 5.0f / _36;
  int _133 = WaveReadLaneFirst(_materialIndex);
  int _141 = WaveReadLaneFirst(BindlessParameters_PostProcessAnamorphic_CD[((int)((uint)(select(((uint)_133 < (uint)170000), _133, 0)) + 0u))]._noiseTex);
  float4 _148 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_141 < (uint)65000), _141, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_126 * TEXCOORD.x), ((_time.x * 0.10000000149011612f) + (_126 * TEXCOORD.y))));
  float _151 = _148.x + -0.20000000298023224f;
  float _152 = _148.y + -0.20000000298023224f;
  float _155 = (_151 * 0.0020000000949949026f) + TEXCOORD.x;
  float _156 = (_152 * 0.004999999888241291f) + TEXCOORD.y;
  int2 _158; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_158.x, _158.y);
  uint _173 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_158.x))))) + 0.5f) * _155), int((float((int)(int(float((int)(_158.y))))) + 0.5f) * _156), 0));
  int _175 = _173.x & 255;
  float _183 = (float((uint)((uint)((uint)((uint)(_173.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
  float _184 = (float((uint)((uint)(((uint)((uint)(_173.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
  float _186 = 1.0f - abs(_183);
  float _187 = abs(_184);
  float _188 = _186 - _187;
  float _199;
  float _200;
  float _269;
  float _809;
  float _818;
  float _819;
  float _820;
  float _923;
  float _924;
  float _925;
  float _948;
  float _1192;
  float _1193;
  float _1194;
  float _1314;
  float _1315;
  float _1316;
  float _1334;
  float _1335;
  float _1336;
  float _1369;
  float _1370;
  float _1371;
  float _1385;
  float _1386;
  float _1387;
  if (!(_188 >= 0.0f)) {
    _199 = (select((_183 >= 0.0f), 1.0f, -1.0f) * (1.0f - _187));
    _200 = (select((_184 >= 0.0f), 1.0f, -1.0f) * _186);
  } else {
    _199 = _183;
    _200 = _184;
  }
  float _202 = rsqrt(dot(float3(_199, _200, _188), float3(_199, _200, _188)));
  float _203 = _202 * _199;
  float _204 = _202 * _200;
  float _205 = _202 * _188;
  float _207 = rsqrt(dot(float3(_203, _204, _205), float3(_203, _204, _205)));
  float _208 = _207 * _203;
  float _209 = _207 * _204;
  float4 _223 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * _155), int(_customRenderPassSizeInvSize.y * _156), 0));
  float _229 = saturate((((_nearFarProj.x / _86) + 0.05000000074505806f) - (_nearFarProj.x / max(1.0000000116860974e-07f, _223.x))) * 50.0f);
  int _230 = WaveReadLaneFirst(_materialIndex);
  float _238 = WaveReadLaneFirst(BindlessParameters_PostProcessAnamorphic_CD[((int)((uint)(select(((uint)_230 < (uint)170000), _230, 0)) + 0u))]._anamorphicProgress);
  float _243 = ((mad((_invViewProj[0].z), _86, mad((_invViewProj[0].y), _82, ((_invViewProj[0].x) * _80))) + (_invViewProj[0].w)) / _122) - _mainPosition.x;
  float _244 = ((mad((_invViewProj[1].z), _86, mad((_invViewProj[1].y), _82, ((_invViewProj[1].x) * _80))) + (_invViewProj[1].w)) / _122) - _mainPosition.y;
  float _245 = ((mad((_invViewProj[2].z), _86, mad((_invViewProj[2].y), _82, ((_invViewProj[2].x) * _80))) + (_invViewProj[2].w)) / _122) - _mainPosition.z;
  float _255 = saturate(sqrt(((_243 * _243) + (_244 * _244)) + (_245 * _245)) / max(0.0010000000474974513f, (_238 * 300.0f)));
  float _256 = 1.0f - _255;
  if (_256 > 0.0f) {
    _269 = ((saturate((_238 * 2.0f) + -1.0f) * _255) + _256);
  } else {
    _269 = (pow(_238, 0.25f));
  }
  int _270 = WaveReadLaneFirst(_materialIndex);
  int _278 = WaveReadLaneFirst(BindlessParameters_PostProcessAnamorphic_CD[((int)((uint)(select(((uint)_270 < (uint)170000), _270, 0)) + 0u))]._anamorphicBackgroundColor);
  float _281 = float((uint)((uint)(((uint)((uint)(_278)) >> 16) & 255)));
  float _284 = float((uint)((uint)(((uint)((uint)(_278)) >> 8) & 255)));
  float _286 = float((uint)((uint)(_278 & 255)));
  float _311 = select(((_281 * 0.003921568859368563f) < 0.040449999272823334f), (_281 * 0.0003035269910469651f), exp2(log2((_281 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
  float _312 = select(((_284 * 0.003921568859368563f) < 0.040449999272823334f), (_284 * 0.0003035269910469651f), exp2(log2((_284 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
  float _313 = select(((_286 * 0.003921568859368563f) < 0.040449999272823334f), (_286 * 0.0003035269910469651f), exp2(log2((_286 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
  float _316 = TEXCOORD.x - (_151 * 0.0010000000474974513f);
  float _317 = TEXCOORD.y - (_152 * 0.0024999999441206455f);
  float4 _320 = __3__36__0__0__g_specularAO.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_316, _317), 0.0f);
  float _327 = ((_earthAxisTilt + 90.0f) - _latitude) * 0.01745329238474369f;
  float _328 = sin(_327);
  float _329 = cos(_327);
  float _333 = (_time.w * 0.2617993950843811f) + -3.1415927410125732f;
  float _334 = sin(_333);
  float _335 = cos(_333);
  float _336 = 1.0f - _335;
  float _337 = _336 * _328;
  float _338 = _336 * _329;
  float _339 = _334 * _328;
  float _340 = _334 * _329;
  float _350 = ((1.0f - TEXCOORD.y) * 2.0f) + -1.0f;
  float _386 = ((_invViewProjRelative[3].w) + (_invViewProjRelative[3].z)) + mad((_invViewProjRelative[3].y), _350, ((_invViewProjRelative[3].x) * _80));
  float _387 = ((mad((_invViewProjRelative[0].y), _350, ((_invViewProjRelative[0].x) * _80)) + (_invViewProjRelative[0].z)) + (_invViewProjRelative[0].w)) / _386;
  float _388 = (((_invViewProjRelative[1].w) + (_invViewProjRelative[1].z)) + mad((_invViewProjRelative[1].y), _350, ((_invViewProjRelative[1].x) * _80))) / _386;
  float _389 = (((_invViewProjRelative[2].w) + (_invViewProjRelative[2].z)) + mad((_invViewProjRelative[2].y), _350, ((_invViewProjRelative[2].x) * _80))) / _386;
  float _391 = rsqrt(dot(float3(_387, _388, _389), float3(_387, _388, _389)));
  float _392 = _391 * _387;
  float _393 = _391 * _388;
  float _394 = _391 * _389;
  float _397 = mad((-0.0f - _339), _394, mad(_340, _393, (_392 * _335)));
  float _401 = mad((_338 * _328), _394, mad(((_337 * _328) + _335), _393, (-0.0f - (_340 * _392))));
  float _404 = mad(((_338 * _329) + _335), _394, mad((_337 * _329), _393, (_392 * _339)));
  float _406 = atan(_404 / _397);
  bool _409 = (_397 < 0.0f);
  bool _410 = (_397 == 0.0f);
  bool _411 = (_404 >= 0.0f);
  bool _412 = (_404 < 0.0f);
  int _425 = WaveReadLaneFirst(_materialIndex);
  int _433 = WaveReadLaneFirst(BindlessParameters_PostProcessAnamorphic_CD[((int)((uint)(select(((uint)_425 < (uint)170000), _425, 0)) + 0u))]._milkyWayTexture);
  float4 _440 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_433 < (uint)65000), _433, 0)) + 0u))].SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(select(((_410) && (_411)), 0.75f, select(((_410) && (_412)), 0.25f, ((select(((_409) && (_412)), (_406 + -3.1415927410125732f), select(((_409) && (_411)), (_406 + 3.1415927410125732f), _406)) * 0.15915493667125702f) + 0.5f))), (acos(_401) * 0.31830987334251404f)), 0.0f);
  float _444 = _440.x + -0.061246078461408615f;
  float _445 = _440.y + -0.08228270709514618f;
  float _446 = _440.z + -0.09989875555038452f;
  float _455 = saturate(1.0f - (sqrt(((_444 * _444) + (_445 * _445)) + (_446 * _446)) * 4.0f));
  float _457 = dot(float3(_440.x, _440.y, _440.z), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f)) * 2.0f;
  float _467 = (((_457 * _311) - _440.x) * _455) + _440.x;
  float _468 = (((_457 * _312) - _440.y) * _455) + _440.y;
  float _469 = (((_457 * _313) - _440.z) * _455) + _440.z;
  float _471 = saturate(_320.w * 1.4285714626312256f);
  float _472 = _471 * _311;
  float _473 = _471 * _312;
  float _474 = _471 * _313;
  float _475 = _320.w * 10.0f;
  float _477 = saturate(_475 + -7.0f);
  float _490 = ((saturate(_311 * 2.0f) - _472) * _477) + _472;
  float _491 = ((saturate(_312 * 2.0f) - _473) * _477) + _473;
  float _492 = ((saturate(_313 * 2.0f) - _474) * _477) + _474;
  float _494 = saturate(_475 + -8.0f);
  float _495 = _494 * _494;
  float _502 = (_495 * (1.0f - _490)) + _490;
  float _503 = ((0.75f - _491) * _495) + _491;
  float _504 = ((0.550000011920929f - _492) * _495) + _492;
  float _506 = saturate(_475 + -9.0f);
  bool _521 = ((_84.x < 1.0000000116860974e-07f)) || ((_84.x == 1.0f));
  float _527 = max(0.0010000000474974513f, _exposure0.x);
  float _537 = float((int)(int(_397 * 2000.0f)));
  float _538 = float((int)(int(_401 * 2000.0f)));
  float _539 = float((int)(int(_404 * 2000.0f)));
  float _552 = frac((sin((_538 * 5.0000002374872565e-05f) + (_537 * 0.008500000461935997f)) * 10000.0f) * (abs(sin((_538 * 0.006500000134110451f) + (_537 * 0.0005000000237487257f))) + 0.10000000149011612f));
  float _564 = frac((sin((_552 * 17.0f) + (_539 * 5.0000002374872565e-05f)) * 10000.0f) * (abs(sin(_552 + (_539 * 0.006500000134110451f))) + 0.10000000149011612f));
  float _571 = float((int)(int(_397 * 1500.0f)));
  float _572 = float((int)(int(_401 * 1500.0f)));
  float _573 = float((int)(int(_404 * 1500.0f)));
  float _586 = frac((sin((_572 * 6.666666740784422e-05f) + (_571 * 0.01133333332836628f)) * 10000.0f) * (abs(sin((_572 * 0.008666666224598885f) + (_571 * 0.0006666666595265269f))) + 0.10000000149011612f));
  float _598 = frac((sin((_586 * 17.0f) + (_573 * 6.666666740784422e-05f)) * 10000.0f) * (abs(sin(_586 + (_573 * 0.008666666224598885f))) + 0.10000000149011612f));
  float _602 = saturate((_564 + -0.699999988079071f) * 3.3333332538604736f) * 1.5f;
  float _606 = (_602 * _467) + _467;
  float _607 = (_602 * _468) + _468;
  float _608 = (_602 * _469) + _469;
  float _612 = saturate((_598 + -0.9800000190734863f) * 50.00004959106445f) * 9.0f;
  int _619 = WaveReadLaneFirst(_materialIndex);
  float _627 = WaveReadLaneFirst(BindlessParameters_PostProcessAnamorphic_CD[((int)((uint)(select(((uint)_619 < (uint)170000), _619, 0)) + 0u))]._milkyWayRatio);
  float _640 = ((saturate((_598 + -0.9994999766349792f) * 1999.906494140625f) * 3.0f) + (saturate((_564 + -0.9990000128746033f) * 1000.0128784179688f) * 0.10000000149011612f)) * 0.5f;
  float _641 = _640 + (_627 * ((_606 * _612) + _606));
  float _642 = _640 + (_627 * ((_607 * _612) + _607));
  float _643 = _640 + (_627 * ((_608 * _612) + _608));
  float _645 = saturate(_84.x * 5.0f);
  float _652 = (((select(_521, 0.0f, ((((_311 * 0.10000000149011612f) - _502) * _506) + _502)) / _527) - _641) * _645) + _641;
  float _653 = (((select(_521, 0.0f, ((((_312 * 0.10000000149011612f) - _503) * _506) + _503)) / _527) - _642) * _645) + _642;
  float _654 = (((select(_521, 0.0f, ((((_313 * 0.10000000149011612f) - _504) * _506) + _504)) / _527) - _643) * _645) + _643;
  float _655 = 2.0f / _36;
  int _670 = WaveReadLaneFirst(_materialIndex);
  int _678 = WaveReadLaneFirst(BindlessParameters_PostProcessAnamorphic_CD[((int)((uint)(select(((uint)_670 < (uint)170000), _670, 0)) + 0u))]._noiseTex);
  float4 _685 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_678 < (uint)65000), _678, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((((_208 * -0.10000000149011612f) - (_148.x * 0.20000000298023224f)) + (_655 * TEXCOORD.x)) + (_time.x * 0.009999999776482582f)), (((_209 * -0.10000000149011612f) - (_148.y * 0.20000000298023224f)) + (_655 * TEXCOORD.y))));
  float _696 = saturate(1.0f - dot(float3(_208, _209, (_207 * _205)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
  float _700 = saturate((_696 * _696) + (_685.w * 0.5f));
  int _701 = WaveReadLaneFirst(_materialIndex);
  int _709 = WaveReadLaneFirst(BindlessParameters_PostProcessAnamorphic_CD[((int)((uint)(select(((uint)_701 < (uint)170000), _701, 0)) + 0u))]._anamorphicPlayerColor);
  float _712 = float((uint)((uint)(((uint)((uint)(_709)) >> 16) & 255)));
  float _715 = float((uint)((uint)(((uint)((uint)(_709)) >> 8) & 255)));
  float _717 = float((uint)((uint)(_709 & 255)));
  float _750 = max(0.0010000000474974513f, _exposure0.x);
  float _751 = (select(((_712 * 0.003921568859368563f) < 0.040449999272823334f), (_712 * 0.0003035269910469651f), exp2(log2((_712 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _700) / _750;
  float _752 = (select(((_715 * 0.003921568859368563f) < 0.040449999272823334f), (_715 * 0.0003035269910469651f), exp2(log2((_715 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _700) / _750;
  float _753 = (select(((_717 * 0.003921568859368563f) < 0.040449999272823334f), (_717 * 0.0003035269910469651f), exp2(log2((_717 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _700) / _750;
  if ((_175 == _renderPassSelfPlayer) || ((!(_175 == _renderPassSelfPlayer)) && (_175 == _renderPassTest))) {
    _923 = (lerp(_652, _751, _229));
    _924 = (lerp(_653, _752, _229));
    _925 = (lerp(_654, _753, _229));
  } else {
    if (_175 == _renderPassAnamorphicMural) {
      _923 = (lerp(_652, _76, _229));
      _924 = (lerp(_653, _77, _229));
      _925 = (lerp(_654, _78, _229));
    } else {
      uint2 _794 = __3__36__0__0__g_stencil.Load(int3((int)(uint(_bufferSizeAndInvSize.x * TEXCOORD.x)), (int)(uint(_bufferSizeAndInvSize.y * TEXCOORD.y)), 0));
      int _796 = _794.x & 127;
      if ((uint)(_796 + -105) < (uint)2) {
        _809 = 0.10000000149011612f;
        float _810 = _809 * _229;
        _818 = ((_810 * _751) + _652);
        _819 = ((_810 * _752) + _653);
        _820 = ((_810 * _753) + _654);
      } else {
        bool _804 = (_796 == 107);
        if ((_804) || ((((_796 == 26)) || (((uint)(_796 + -27) < (uint)2))))) {
          _809 = select(_804, 0.10000000149011612f, 0.014999999664723873f);
          float _810 = _809 * _229;
          _818 = ((_810 * _751) + _652);
          _819 = ((_810 * _752) + _653);
          _820 = ((_810 * _753) + _654);
        } else {
          _818 = _652;
          _819 = _653;
          _820 = _654;
        }
      }
      if ((uint)(_796 + -53) < (uint)15) {
        uint _826 = uint(_bufferSizeAndInvSize.x * _316);
        uint _827 = uint(_bufferSizeAndInvSize.y * _317);
        uint4 _829 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_826), (int)(_827), 0));
        float4 _832 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_826), (int)(_827), 0));
        float _850 = (saturate(_832.x * 1.0009784698486328f) * 2.0f) + -1.0f;
        float _851 = (saturate(_832.y * 1.0009784698486328f) * 2.0f) + -1.0f;
        float _852 = (saturate(_832.z * 1.0009784698486328f) * 2.0f) + -1.0f;
        float _854 = rsqrt(dot(float3(_850, _851, _852), float3(_850, _851, _852)));
        float _855 = _854 * _850;
        float _856 = _854 * _851;
        float _857 = _852 * _854;
        float _860 = (float((uint)((uint)(((uint)((uint)(_829.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
        float _861 = (float((uint)((uint)(_829.w & 255))) * 0.007843137718737125f) + -1.0f;
        float _864 = (_860 + _861) * 0.5f;
        float _865 = (_860 - _861) * 0.5f;
        float _869 = (1.0f - abs(_864)) - abs(_865);
        float _871 = rsqrt(dot(float3(_864, _865, _869), float3(_864, _865, _869)));
        float _872 = _871 * _864;
        float _873 = _871 * _865;
        float _874 = _871 * _869;
        float _876 = select((_857 >= 0.0f), 1.0f, -1.0f);
        float _879 = -0.0f - (1.0f / (_876 + _857));
        float _880 = _856 * _879;
        float _881 = _880 * _855;
        float _882 = _876 * _855;
        float _891 = mad(_874, _855, mad(_873, _881, ((((_882 * _855) * _879) + 1.0f) * _872)));
        float _895 = mad(_874, _856, mad(_873, (_876 + (_880 * _856)), ((_872 * _876) * _881)));
        float _899 = mad(_874, _857, mad(_873, (-0.0f - _856), (-0.0f - (_882 * _872))));
        float _901 = rsqrt(dot(float3(_891, _895, _899), float3(_891, _895, _899)));
        float _915 = (1.0f - saturate(dot(float3((_901 * _891), (_901 * _895), (_901 * _899)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))))) * _229;
        _923 = ((_915 * _751) + _818);
        _924 = ((_915 * _752) + _819);
        _925 = ((_915 * _753) + _820);
      } else {
        _923 = _818;
        _924 = _819;
        _925 = _820;
      }
    }
  }
  float _932 = ((_923 - _76) * _269) + _76;
  float _933 = ((_924 - _77) * _269) + _77;
  float _934 = ((_925 - _78) * _269) + _78;
  uint _935 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _942 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_935), 0));
    _948 = (float((uint)((uint)(_942.x & 127))) + 0.5f);
  } else {
    _948 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_932, _933, _934));
    _1314 = output_color.x;
    _1315 = output_color.y;
    _1316 = output_color.z;
  } else {
    _1314 = _932;
    _1315 = _933;
    _1316 = _934;
  }
  if (_etcParams.y > 1.0f) {
    float _1324 = abs(_80);
    float _1325 = abs(_81 + -1.0f);
    float _1329 = saturate(1.0f - (dot(float2(_1324, _1325), float2(_1324, _1325)) * saturate(_etcParams.y + -1.0f)));
    _1334 = (_1329 * _1314);
    _1335 = (_1329 * _1315);
    _1336 = (_1329 * _1316);
  } else {
    _1334 = _1314;
    _1335 = _1315;
    _1336 = _1316;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _1369 = select((_1334 <= 0.0031308000907301903f), (_1334 * 12.920000076293945f), (((pow(_1334, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1370 = select((_1335 <= 0.0031308000907301903f), (_1335 * 12.920000076293945f), (((pow(_1335, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1371 = select((_1336 <= 0.0031308000907301903f), (_1336 * 12.920000076293945f), (((pow(_1336, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1369 = _1334;
    _1370 = _1335;
    _1371 = _1336;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _1376 = float((uint)_935);
    if (!(_1376 < _viewDir.w)) {
      if (!(_1376 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _1385 = _1369;
        _1386 = _1370;
        _1387 = _1371;
      } else {
        _1385 = 0.0f;
        _1386 = 0.0f;
        _1387 = 0.0f;
      }
    } else {
      _1385 = 0.0f;
      _1386 = 0.0f;
      _1387 = 0.0f;
    }
  } else {
    _1385 = _1369;
    _1386 = _1370;
    _1387 = _1371;
  }
  float _1397 = exp2(log2(_1385 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1398 = exp2(log2(_1386 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1399 = exp2(log2(_1387 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_1397 * 18.6875f) + 1.0f)) * ((_1397 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_1398 * 18.6875f) + 1.0f)) * ((_1398 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_1399 * 18.6875f) + 1.0f)) * ((_1399 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _948;
  return SV_Target;
}

