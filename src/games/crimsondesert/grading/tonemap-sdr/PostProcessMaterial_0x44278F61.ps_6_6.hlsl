struct PostProcessRematchLoading_CDStruct {
  float _loadingRatio;
  float _loadingRadius;
  uint _loadingEdgeColor;
  uint _loadingInnerColor;
  uint _noiseTex;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t32, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t40, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t33, space36);

Texture2D<uint4> __3__36__0__0__g_gbufferBaseColor : register(t77, space36);

Texture2D<float4> __3__36__0__0__g_gbufferNormal : register(t78, space36);

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

ConstantBuffer<PostProcessRematchLoading_CDStruct> BindlessParameters_PostProcessRematchLoading_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float4 _30 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _35 = (TEXCOORD.x * 2.0f) + -1.0f;
  float _36 = TEXCOORD.y * 2.0f;
  float _37 = 1.0f - _36;
  float _39 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _41 = max(1.0000000116860974e-07f, _39.x);
  float _77 = mad((_invViewProj[3].z), _41, mad((_invViewProj[3].y), _37, ((_invViewProj[3].x) * _35))) + (_invViewProj[3].w);
  int _81 = WaveReadLaneFirst(_materialIndex);
  float _89 = WaveReadLaneFirst(BindlessParameters_PostProcessRematchLoading_CD[((int)((uint)(select(((uint)_81 < (uint)170000), _81, 0)) + 0u))]._loadingRatio);
  int _90 = WaveReadLaneFirst(_materialIndex);
  float _102 = 0.20000000298023224f / _destTargetSizAndInv.z;
  float _103 = 0.20000000298023224f / _destTargetSizAndInv.w;
  float _105 = _103 * TEXCOORD.y;
  float _106 = floor(_105);
  float _107 = _106 * 0.5f;
  float _111 = frac(abs(_107));
  float _114 = select((_107 >= (-0.0f - _107)), _111, (-0.0f - _111)) + (_102 * TEXCOORD.x);
  float _122 = frac(_114) + -0.5f;
  float _123 = frac(_105) + -0.5f;
  float _130 = saturate((sqrt((_123 * _123) + (_122 * _122)) + -0.30000001192092896f) * 49.99997329711914f);
  float _135 = 1.0f - ((_130 * _130) * (3.0f - (_130 * 2.0f)));
  uint _145 = uint(_bufferSizeAndInvSize.x * ((floor(_114) + 0.5f) / _102));
  uint _146 = uint(_bufferSizeAndInvSize.y * ((_106 + 0.5f) / _103));
  uint4 _148 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_145), (int)(_146), 0));
  float4 _151 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_145), (int)(_146), 0));
  float _169 = (saturate(_151.x * 1.0009784698486328f) * 2.0f) + -1.0f;
  float _170 = (saturate(_151.y * 1.0009784698486328f) * 2.0f) + -1.0f;
  float _171 = (saturate(_151.z * 1.0009784698486328f) * 2.0f) + -1.0f;
  float _173 = rsqrt(dot(float3(_169, _170, _171), float3(_169, _170, _171)));
  float _174 = _173 * _169;
  float _175 = _173 * _170;
  float _176 = _171 * _173;
  float _179 = (float((uint)((uint)(((uint)((uint)(_148.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
  float _180 = (float((uint)((uint)(_148.w & 255))) * 0.007843137718737125f) + -1.0f;
  float _183 = (_179 + _180) * 0.5f;
  float _184 = (_179 - _180) * 0.5f;
  float _188 = (1.0f - abs(_183)) - abs(_184);
  float _190 = rsqrt(dot(float3(_183, _184, _188), float3(_183, _184, _188)));
  float _191 = _190 * _183;
  float _192 = _190 * _184;
  float _193 = _190 * _188;
  float _195 = select((_176 >= 0.0f), 1.0f, -1.0f);
  float _198 = -0.0f - (1.0f / (_195 + _176));
  float _199 = _175 * _198;
  float _200 = _199 * _174;
  float _201 = _195 * _174;
  float _210 = mad(_193, _174, mad(_192, _200, ((((_201 * _174) * _198) + 1.0f) * _191)));
  float _214 = mad(_193, _175, mad(_192, (_195 + (_199 * _175)), ((_191 * _195) * _200)));
  float _218 = mad(_193, _176, mad(_192, (-0.0f - _175), (-0.0f - (_201 * _191))));
  float _220 = rsqrt(dot(float3(_210, _214, _218), float3(_210, _214, _218)));
  float _235 = saturate(exp2(log2(select((((_39.x < 1.0000000116860974e-07f)) || ((_39.x == 1.0f))), 1.0f, (1.0f - abs(dot(float3((_220 * _210), (_220 * _214), (_220 * _218)), float3(_viewDir.x, _viewDir.y, _viewDir.z)))))) * 4.0f) * 2.0f);
  float _241 = ((1.0f - TEXCOORD.y) * 2.0f) + -1.0f;
  float _277 = ((_invViewProjRelative[3].w) + (_invViewProjRelative[3].z)) + mad((_invViewProjRelative[3].y), _241, ((_invViewProjRelative[3].x) * _35));
  float _278 = ((mad((_invViewProjRelative[0].y), _241, ((_invViewProjRelative[0].x) * _35)) + (_invViewProjRelative[0].z)) + (_invViewProjRelative[0].w)) / _277;
  float _279 = (((_invViewProjRelative[1].w) + (_invViewProjRelative[1].z)) + mad((_invViewProjRelative[1].y), _241, ((_invViewProjRelative[1].x) * _35))) / _277;
  float _280 = (((_invViewProjRelative[2].w) + (_invViewProjRelative[2].z)) + mad((_invViewProjRelative[2].y), _241, ((_invViewProjRelative[2].x) * _35))) / _277;
  float _282 = rsqrt(dot(float3(_278, _279, _280), float3(_278, _279, _280)));
  float _283 = _282 * _278;
  float _285 = _282 * _280;
  float _287 = atan(_285 / _283);
  bool _290 = (_283 < 0.0f);
  bool _291 = (_283 == 0.0f);
  bool _292 = (_285 >= 0.0f);
  bool _293 = (_285 < 0.0f);
  int _307 = WaveReadLaneFirst(_materialIndex);
  int _315 = WaveReadLaneFirst(BindlessParameters_PostProcessRematchLoading_CD[((int)((uint)(select(((uint)_307 < (uint)170000), _307, 0)) + 0u))]._noiseTex);
  float4 _322 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_315 < (uint)65000), _315, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(select(((_291) && (_292)), 7.5f, select(((_291) && (_293)), 2.5f, ((select(((_290) && (_293)), (_287 + -3.1415927410125732f), select(((_290) && (_292)), (_287 + 3.1415927410125732f), _287)) * 1.5915493965148926f) + 5.0f))), ((acos(_282 * _279) * 0.9549295902252197f) - (_time.x * 0.05000000074505806f))));
  float _328 = (_322.x * 2.0f) + -0.9960784316062927f;
  float _329 = (_322.y * 2.0f) + -0.9960784316062927f;
  float _341 = ((mad((_invViewProj[0].z), _41, mad((_invViewProj[0].y), _37, ((_invViewProj[0].x) * _35))) + (_invViewProj[0].w)) / _77) - _mainPosition.x;
  float _342 = ((mad((_invViewProj[1].z), _41, mad((_invViewProj[1].y), _37, ((_invViewProj[1].x) * _35))) + (_invViewProj[1].w)) / _77) - _mainPosition.y;
  float _343 = ((mad((_invViewProj[2].z), _41, mad((_invViewProj[2].y), _37, ((_invViewProj[2].x) * _35))) + (_invViewProj[2].w)) / _77) - _mainPosition.z;
  float _352 = min(max(sqrt(((_341 * _341) + (_342 * _342)) + (_343 * _343)), 1.0f), 10.0f) * saturate(_89 * 5.0f);
  float _356 = (_352 * _328) + _341;
  float _357 = (_352 * _329) + _342;
  float _358 = (_352 * (sqrt(saturate(1.0f - dot(float2(_328, _329), float2(_328, _329)))) + -0.5f)) + _343;
  float _364 = sqrt(((_356 * _356) + (_357 * _357)) + (_358 * _358));
  float _371 = saturate((1.0f - saturate(_364 / max(0.0010000000474974513f, (WaveReadLaneFirst(BindlessParameters_PostProcessRematchLoading_CD[((int)((uint)(select(((uint)_90 < (uint)170000), _90, 0)) + 0u))]._loadingRadius) * _89)))) * 2.0f);
  float _377 = (saturate((_89 * 10.0f) + -9.0f) * (1.0f - _371)) + _371;
  float _383 = frac((_364 * 0.029999999329447746f) - (_time.x * 0.800000011920929f));
  float _386 = saturate((1.0f - _383) * 5.0f);
  int _395 = WaveReadLaneFirst(_materialIndex);
  int _403 = WaveReadLaneFirst(BindlessParameters_PostProcessRematchLoading_CD[((int)((uint)(select(((uint)_395 < (uint)170000), _395, 0)) + 0u))]._loadingInnerColor);
  float _406 = float((uint)((uint)(((uint)((uint)(_403)) >> 16) & 255)));
  float _409 = float((uint)((uint)(((uint)((uint)(_403)) >> 8) & 255)));
  float _411 = float((uint)((uint)(_403 & 255)));
  float _436 = select(((_406 * 0.003921568859368563f) < 0.040449999272823334f), (_406 * 0.0003035269910469651f), exp2(log2((_406 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
  float _437 = select(((_409 * 0.003921568859368563f) < 0.040449999272823334f), (_409 * 0.0003035269910469651f), exp2(log2((_409 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
  float _438 = select(((_411 * 0.003921568859368563f) < 0.040449999272823334f), (_411 * 0.0003035269910469651f), exp2(log2((_411 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
  float _441 = (pow(_386, 4.0f));
  float _445 = (1.0f - _436) * _322.x;
  float _446 = (1.0f - _437) * _322.y;
  float _447 = (1.0f - _438) * _322.z;
  float _459 = max(0.0010000000474974513f, _exposure0.x);
  float _558;
  float _559;
  float _560;
  float _599;
  float _804;
  float _805;
  float _806;
  float _899;
  float _900;
  float _901;
  float _955;
  float _956;
  float _957;
  float _973;
  float _974;
  float _975;
  float _1005;
  float _1006;
  float _1007;
  float _1021;
  float _1022;
  float _1023;
  if (((_377 > 0.0f)) && ((_377 < 1.0f))) {
    int _474 = WaveReadLaneFirst(_materialIndex);
    int _482 = WaveReadLaneFirst(BindlessParameters_PostProcessRematchLoading_CD[((int)((uint)(select(((uint)_474 < (uint)170000), _474, 0)) + 0u))]._loadingEdgeColor);
    float _485 = float((uint)((uint)(((uint)((uint)(_482)) >> 16) & 255)));
    float _488 = float((uint)((uint)(((uint)((uint)(_482)) >> 8) & 255)));
    float _490 = float((uint)((uint)(_482 & 255)));
    float _515 = select(((_485 * 0.003921568859368563f) < 0.040449999272823334f), (_485 * 0.0003035269910469651f), exp2(log2((_485 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _516 = select(((_488 * 0.003921568859368563f) < 0.040449999272823334f), (_488 * 0.0003035269910469651f), exp2(log2((_488 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _517 = select(((_490 * 0.003921568859368563f) < 0.040449999272823334f), (_490 * 0.0003035269910469651f), exp2(log2((_490 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _524 = _515 * 10.0f;
    float _525 = _516 * 10.0f;
    float _526 = _517 * 10.0f;
    float _537 = (_322.x * _322.y) * _322.z;
    float _543 = max(0.0010000000474974513f, _exposure0.x);
    float _553 = saturate((1.0f - abs((_377 * 2.0f) + -1.0f)) * 4.0f) * _135;
    _558 = (_553 * (((((((1.0f - _515) * _322.x) - _524) * _235) + _524) * _537) / _543));
    _559 = (_553 * (((((((1.0f - _516) * _322.y) - _525) * _235) + _525) * _537) / _543));
    _560 = (_553 * (((((((1.0f - _517) * _322.z) - _526) * _235) + _526) * _537) / _543));
  } else {
    _558 = _30.x;
    _559 = _30.y;
    _560 = _30.z;
  }
  float _563 = ((1.0f - _377) * _89) + _377;
  float _564 = (((((((_89 * _89) * _89) * _135) * _235) * _377) * exp2(log2((_383 * 1.25f) * _386) * 9.0f)) * (1.0f - saturate(_364 * 0.0010000000474974513f))) + 0.0010000000474974513f;
  float _583 = (((_558 - _30.x) + (((((lerp(_445, _436, _441)) / _459) * _564) - _558) * _563)) * _377) + _30.x;
  float _584 = (((_559 - _30.y) + (((((lerp(_446, _437, _441)) / _459) * _564) - _559) * _563)) * _377) + _30.y;
  float _585 = (((_560 - _30.z) + (((((lerp(_447, _438, _441)) / _459) * _564) - _560) * _563)) * _377) + _30.z;
  uint _586 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _593 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_586), 0));
    _599 = (float((uint)((uint)(_593.x & 127))) + 0.5f);
  } else {
    _599 = 1.0f;
  }
  bool _602 = (_localToneMappingParams.w > 0.0f);
  if (_602) {
    float3 output_color = TonemapReplacer(float3(_583, _584, _585));
    _955 = output_color.x;
    _956 = output_color.y;
    _957 = output_color.z;
  } else {
    _955 = _583;
    _956 = _584;
    _957 = _585;
  }
  if (_etcParams.y > 1.0f) {
    float _963 = abs(_35);
    float _964 = abs(_36 + -1.0f);
    float _968 = saturate(1.0f - (dot(float2(_963, _964), float2(_963, _964)) * saturate(_etcParams.y + -1.0f)));
    _973 = (_968 * _955);
    _974 = (_968 * _956);
    _975 = (_968 * _957);
  } else {
    _973 = _955;
    _974 = _956;
    _975 = _957;
  }
  if ((_602) && ((_etcParams.z > 0.0f))) {
    _1005 = select((_973 <= 0.0031308000907301903f), (_973 * 12.920000076293945f), (((pow(_973, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1006 = select((_974 <= 0.0031308000907301903f), (_974 * 12.920000076293945f), (((pow(_974, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1007 = select((_975 <= 0.0031308000907301903f), (_975 * 12.920000076293945f), (((pow(_975, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1005 = _973;
    _1006 = _974;
    _1007 = _975;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _1012 = float((uint)_586);
    if (!(_1012 < _viewDir.w)) {
      if (!(_1012 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _1021 = _1005;
        _1022 = _1006;
        _1023 = _1007;
      } else {
        _1021 = 0.0f;
        _1022 = 0.0f;
        _1023 = 0.0f;
      }
    } else {
      _1021 = 0.0f;
      _1022 = 0.0f;
      _1023 = 0.0f;
    }
  } else {
    _1021 = _1005;
    _1022 = _1006;
    _1023 = _1007;
  }
  SV_Target.x = _1021;
  SV_Target.y = _1022;
  SV_Target.z = _1023;
  SV_Target.w = _599;
  return SV_Target;
}