struct PostProcessAbyssEnter_CDStruct {
  float _scanRadius;
  float _startFade;
  uint _noiseTex;
  uint _noiseTex2;
  uint _effectType;
  float _ppAbyssEnterRatio;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float> __3__36__0__0__g_depth : register(t40, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t33, space36);

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

ConstantBuffer<PostProcessAbyssEnter_CDStruct> BindlessParameters_PostProcessAbyssEnter_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _30 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
  float _33 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _36 = (TEXCOORD.x * 2.0f) + -1.0f;
  float _37 = TEXCOORD.y * 2.0f;
  float _38 = 1.0f - _37;
  int2 _40; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_40.x, _40.y);
  uint _55 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_40.x))))) + 0.5f) * TEXCOORD.x), int((float((int)(int(float((int)(_40.y))))) + 0.5f) * TEXCOORD.y), 0));
  int _57 = _55.x & 255;
  float _69;
  float _234;
  float _235;
  float _236;
  float _283;
  float _284;
  float _285;
  float _478;
  float _479;
  float _480;
  float _481;
  float _495;
  float _700;
  float _701;
  float _702;
  float _795;
  float _796;
  float _797;
  float _851;
  float _852;
  float _853;
  float _869;
  float _870;
  float _871;
  float _901;
  float _902;
  float _903;
  float _917;
  float _918;
  float _919;
  if ((_57 == _renderPassSelfPlayer) | (((_57 == 70)) || ((_57 == _renderPassTest)))) {
    _69 = 1.0f;
  } else {
    _69 = 0.0f;
  }
  int _70 = WaveReadLaneFirst(_materialIndex);
  if (WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnter_CD[((int)((uint)(select(((uint)_70 < (uint)170000), _70, 0)) + 0u))]._effectType) == 0) {
    float _84 = 1.0f / _srcTargetSizeAndInv.x;
    float _85 = 1.0f / _srcTargetSizeAndInv.y;
    float4 _88 = __3__36__0__0__g_CustomRenderPassDepth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    float _90 = _84 * 2.0f;
    float4 _92 = __3__36__0__0__g_CustomRenderPassDepth.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _90), TEXCOORD.y));
    float _94 = TEXCOORD.x - _84;
    float4 _95 = __3__36__0__0__g_CustomRenderPassDepth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_94, TEXCOORD.y));
    float _97 = _84 + TEXCOORD.x;
    float4 _98 = __3__36__0__0__g_CustomRenderPassDepth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_97, TEXCOORD.y));
    float4 _101 = __3__36__0__0__g_CustomRenderPassDepth.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_90 + TEXCOORD.x), TEXCOORD.y));
    float _103 = _85 * 2.0f;
    float4 _105 = __3__36__0__0__g_CustomRenderPassDepth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (TEXCOORD.y - _103)));
    float _107 = TEXCOORD.y - _85;
    float4 _108 = __3__36__0__0__g_CustomRenderPassDepth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, _107));
    float _110 = _85 + TEXCOORD.y;
    float4 _111 = __3__36__0__0__g_CustomRenderPassDepth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, _110));
    float4 _114 = __3__36__0__0__g_CustomRenderPassDepth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (_103 + TEXCOORD.y)));
    float _140 = max(1.0000000116860974e-07f, _88.x);
    float _161 = (_invViewProjRelative[0].x) * _36;
    float _165 = (_invViewProjRelative[1].x) * _36;
    float _169 = (_invViewProjRelative[2].x) * _36;
    float _173 = (_invViewProjRelative[3].x) * _36;
    float _176 = mad((_invViewProjRelative[3].z), _140, mad((_invViewProjRelative[3].y), _38, _173)) + (_invViewProjRelative[3].w);
    float _177 = (mad((_invViewProjRelative[0].z), _140, mad((_invViewProjRelative[0].y), _38, _161)) + (_invViewProjRelative[0].w)) / _176;
    float _178 = (mad((_invViewProjRelative[1].z), _140, mad((_invViewProjRelative[1].y), _38, _165)) + (_invViewProjRelative[1].w)) / _176;
    float _179 = (mad((_invViewProjRelative[2].z), _140, mad((_invViewProjRelative[2].y), _38, _169)) + (_invViewProjRelative[2].w)) / _176;
    if (abs(((_95.x * _92.x) / ((_92.x * 2.0f) - _95.x)) - _88.x) < abs(((_101.x * _98.x) / ((_101.x * 2.0f) - _98.x)) - _88.x)) {
      float _183 = (_94 * 2.0f) + -1.0f;
      float _184 = max(1.0000000116860974e-07f, _95.x);
      float _200 = mad((_invViewProjRelative[3].z), _184, mad((_invViewProjRelative[3].y), _38, ((_invViewProjRelative[3].x) * _183))) + (_invViewProjRelative[3].w);
      _234 = (_177 - ((mad((_invViewProjRelative[0].z), _184, mad((_invViewProjRelative[0].y), _38, ((_invViewProjRelative[0].x) * _183))) + (_invViewProjRelative[0].w)) / _200));
      _235 = (_178 - ((mad((_invViewProjRelative[1].z), _184, mad((_invViewProjRelative[1].y), _38, ((_invViewProjRelative[1].x) * _183))) + (_invViewProjRelative[1].w)) / _200));
      _236 = (_179 - ((mad((_invViewProjRelative[2].z), _184, mad((_invViewProjRelative[2].y), _38, ((_invViewProjRelative[2].x) * _183))) + (_invViewProjRelative[2].w)) / _200));
    } else {
      float _209 = (_97 * 2.0f) + -1.0f;
      float _210 = max(1.0000000116860974e-07f, _98.x);
      float _226 = mad((_invViewProjRelative[3].z), _210, mad((_invViewProjRelative[3].y), _38, ((_invViewProjRelative[3].x) * _209))) + (_invViewProjRelative[3].w);
      _234 = (((mad((_invViewProjRelative[0].z), _210, mad((_invViewProjRelative[0].y), _38, ((_invViewProjRelative[0].x) * _209))) + (_invViewProjRelative[0].w)) / _226) - _177);
      _235 = (((mad((_invViewProjRelative[1].z), _210, mad((_invViewProjRelative[1].y), _38, ((_invViewProjRelative[1].x) * _209))) + (_invViewProjRelative[1].w)) / _226) - _178);
      _236 = (((mad((_invViewProjRelative[2].z), _210, mad((_invViewProjRelative[2].y), _38, ((_invViewProjRelative[2].x) * _209))) + (_invViewProjRelative[2].w)) / _226) - _179);
    }
    if (abs(((_108.x * _105.x) / ((_105.x * 2.0f) - _108.x)) - _88.x) < abs(((_114.x * _111.x) / ((_114.x * 2.0f) - _111.x)) - _88.x)) {
      float _240 = 1.0f - (_107 * 2.0f);
      float _241 = max(1.0000000116860974e-07f, _108.x);
      float _253 = mad((_invViewProjRelative[3].z), _241, mad((_invViewProjRelative[3].y), _240, _173)) + (_invViewProjRelative[3].w);
      _283 = (_177 - ((mad((_invViewProjRelative[0].z), _241, mad((_invViewProjRelative[0].y), _240, _161)) + (_invViewProjRelative[0].w)) / _253));
      _284 = (_178 - ((mad((_invViewProjRelative[1].z), _241, mad((_invViewProjRelative[1].y), _240, _165)) + (_invViewProjRelative[1].w)) / _253));
      _285 = (_179 - ((mad((_invViewProjRelative[2].z), _241, mad((_invViewProjRelative[2].y), _240, _169)) + (_invViewProjRelative[2].w)) / _253));
    } else {
      float _262 = 1.0f - (_110 * 2.0f);
      float _263 = max(1.0000000116860974e-07f, _111.x);
      float _275 = mad((_invViewProjRelative[3].z), _263, mad((_invViewProjRelative[3].y), _262, _173)) + (_invViewProjRelative[3].w);
      _283 = (((mad((_invViewProjRelative[0].z), _263, mad((_invViewProjRelative[0].y), _262, _161)) + (_invViewProjRelative[0].w)) / _275) - _177);
      _284 = (((mad((_invViewProjRelative[1].z), _263, mad((_invViewProjRelative[1].y), _262, _165)) + (_invViewProjRelative[1].w)) / _275) - _178);
      _285 = (((mad((_invViewProjRelative[2].z), _263, mad((_invViewProjRelative[2].y), _262, _169)) + (_invViewProjRelative[2].w)) / _275) - _179);
    }
    float _288 = (_285 * _235) - (_284 * _236);
    float _291 = (_283 * _236) - (_285 * _234);
    float _294 = (_284 * _234) - (_283 * _235);
    float _296 = rsqrt(dot(float3(_288, _291, _294), float3(_288, _291, _294)));
    float _318 = exp2(log2(1.0f - abs(dot(float3((_288 * _296), (_291 * _296), (_296 * _294)), float3(_viewDir.x, _viewDir.y, _viewDir.z)))) * 2.5f);
    int _322 = WaveReadLaneFirst(_materialIndex);
    float _331 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnter_CD[((int)((uint)(select(((uint)_322 < (uint)170000), _322, 0)) + 0u))]._startFade) * _69;
    _478 = (saturate(_318 * 0.44999998807907104f) + _331);
    _479 = (saturate(_318 * 0.6499999761581421f) + _331);
    _480 = (saturate(_318 * 0.949999988079071f) + _331);
    _481 = _69;
  } else {
    int _339 = WaveReadLaneFirst(_materialIndex);
    if (WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnter_CD[((int)((uint)(select(((uint)_339 < (uint)170000), _339, 0)) + 0u))]._effectType) == 1) {
      float _350 = max(1.0000000116860974e-07f, _33.x);
      float _386 = mad((_invViewProjRelative[3].z), _350, mad((_invViewProjRelative[3].y), _38, ((_invViewProjRelative[3].x) * _36))) + (_invViewProjRelative[3].w);
      float _387 = (mad((_invViewProjRelative[0].z), _350, mad((_invViewProjRelative[0].y), _38, ((_invViewProjRelative[0].x) * _36))) + (_invViewProjRelative[0].w)) / _386;
      float _390 = -0.0f - _387;
      float _391 = -0.0f - ((mad((_invViewProjRelative[1].z), _350, mad((_invViewProjRelative[1].y), _38, ((_invViewProjRelative[1].x) * _36))) + (_invViewProjRelative[1].w)) / _386);
      float _392 = -0.0f - ((mad((_invViewProjRelative[2].z), _350, mad((_invViewProjRelative[2].y), _38, ((_invViewProjRelative[2].x) * _36))) + (_invViewProjRelative[2].w)) / _386);
      float _394 = rsqrt(dot(float3(_390, _391, _392), float3(_390, _391, _392)));
      float _395 = _394 * _391;
      float _396 = _394 * _392;
      int _397 = WaveReadLaneFirst(_materialIndex);
      int _405 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnter_CD[((int)((uint)(select(((uint)_397 < (uint)170000), _397, 0)) + 0u))]._noiseTex);
      float _407 = (_387 * -2.0f) * _394;
      float _409 = _396 * 2.0f;
      float _414 = _time.x * 0.10000000149011612f;
      float4 _421 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_405 < (uint)65000), _405, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_414 + _407), (_414 + _409)));
      float _428 = _time.x * 0.10000000149011612f;
      float _430 = _428 + (_395 * 2.0f);
      float4 _431 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_405 < (uint)65000), _405, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_428 + _409), _430));
      float4 _437 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_405 < (uint)65000), _405, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_430, (_428 + _407)));
      float _442 = abs(_395);
      float _443 = abs(_396);
      float _452 = (_442 * (_421.x - _431.x)) + _431.x;
      float _453 = (_442 * (_421.y - _431.y)) + _431.y;
      float _454 = (_442 * (_421.z - _431.z)) + _431.z;
      float _455 = (_442 * (_421.w - _431.w)) + _431.w;
      float _472 = _69 * _30;
      _478 = (saturate(lerp(_452, _437.x, _443)) * _472);
      _479 = (saturate(lerp(_453, _437.y, _443)) * _472);
      _480 = (saturate(lerp(_454, _437.z, _443)) * _472);
      _481 = (saturate(lerp(_455, _437.w, _443)) * _30);
    } else {
      _478 = 0.0f;
      _479 = 0.0f;
      _480 = 0.0f;
      _481 = 0.0f;
    }
  }
  uint _482 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _489 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_482), 0));
    _495 = (float((uint)((uint)(_489.x & 127))) + 0.5f);
  } else {
    _495 = _481;
  }
  bool _498 = (_localToneMappingParams.w > 0.0f);
  if (_498) {
    float3 output_color = TonemapReplacer(float3(_478, _479, _480));
    _851 = output_color.x;
    _852 = output_color.y;
    _853 = output_color.z;
  } else {
    _851 = _478;
    _852 = _479;
    _853 = _480;
  }
  if (_etcParams.y > 1.0f) {
    float _859 = abs(_36);
    float _860 = abs(_37 + -1.0f);
    float _864 = saturate(1.0f - (dot(float2(_859, _860), float2(_859, _860)) * saturate(_etcParams.y + -1.0f)));
    _869 = (_864 * _851);
    _870 = (_864 * _852);
    _871 = (_864 * _853);
  } else {
    _869 = _851;
    _870 = _852;
    _871 = _853;
  }
  if ((_498) && ((_etcParams.z > 0.0f))) {
    _901 = select((_869 <= 0.0031308000907301903f), (_869 * 12.920000076293945f), (((pow(_869, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _902 = select((_870 <= 0.0031308000907301903f), (_870 * 12.920000076293945f), (((pow(_870, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _903 = select((_871 <= 0.0031308000907301903f), (_871 * 12.920000076293945f), (((pow(_871, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _901 = _869;
    _902 = _870;
    _903 = _871;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _908 = float((uint)_482);
    if (!(_908 < _viewDir.w)) {
      if (!(_908 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _917 = _901;
        _918 = _902;
        _919 = _903;
      } else {
        _917 = 0.0f;
        _918 = 0.0f;
        _919 = 0.0f;
      }
    } else {
      _917 = 0.0f;
      _918 = 0.0f;
      _919 = 0.0f;
    }
  } else {
    _917 = _901;
    _918 = _902;
    _919 = _903;
  }
  SV_Target.x = _917;
  SV_Target.y = _918;
  SV_Target.z = _919;
  SV_Target.w = _495;
  return SV_Target;
}