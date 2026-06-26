struct PostProcessInteraction_CDStruct {
  uint _lineTex;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t32, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t40, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t33, space36);

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

ConstantBuffer<PostProcessInteraction_CDStruct> BindlessParameters_PostProcessInteraction_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  int2 _28; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_28.x, _28.y);
  uint _43 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_28.x))))) + 0.5f) * TEXCOORD.x), int((float((int)(int(float((int)(_28.y))))) + 0.5f) * TEXCOORD.y), 0));
  int _45 = _43.x & 255;
  float4 _48 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
  float _58 = (pow(_48.x, 0.012683313339948654f));
  float _59 = (pow(_48.y, 0.012683313339948654f));
  float _60 = (pow(_48.z, 0.012683313339948654f));
  float _82 = exp2(log2(max(0.0f, (_58 + -0.8359375f)) / (18.8515625f - (_58 * 18.6875f))) * 6.277394771575928f);
  float _83 = exp2(log2(max(0.0f, (_59 + -0.8359375f)) / (18.8515625f - (_59 * 18.6875f))) * 6.277394771575928f);
  float _84 = exp2(log2(max(0.0f, (_60 + -0.8359375f)) / (18.8515625f - (_60 * 18.6875f))) * 6.277394771575928f);
  float _85 = _82 * 10000.0f;
  float _86 = _83 * 10000.0f;
  float _87 = _84 * 10000.0f;
  float _139;
  float _140;
  float _558;
  float _559;
  float _560;
  float _574;
  float _779;
  float _780;
  float _781;
  float _874;
  float _875;
  float _876;
  float _930;
  float _931;
  float _932;
  float _951;
  float _952;
  float _953;
  float _983;
  float _984;
  float _985;
  float _999;
  float _1000;
  float _1001;
  if (_45 == _renderPassInteraction) {
    int _97 = WaveReadLaneFirst(_materialIndex);
    int _105 = WaveReadLaneFirst(BindlessParameters_PostProcessInteraction_CD[((int)((uint)(select(((uint)_97 < (uint)170000), _97, 0)) + 0u))]._lineTex);
    float4 _112 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_105 < (uint)65000), _105, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((TEXCOORD.x * 50.0f), (TEXCOORD.y * 50.0f)));
    float _116 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    float4 _130 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * TEXCOORD.x), int(_customRenderPassSizeInvSize.y * TEXCOORD.y), 0));
    _139 = _112.x;
    _140 = saturate(ceil(((_nearFarProj.x / max(1.0000000116860974e-07f, _116.x)) + 0.05000000074505806f) - (_nearFarProj.x / max(1.0000000116860974e-07f, _130.x))));
  } else {
    _139 = 0.0f;
    _140 = 0.0f;
  }
  if (_45 == _renderPassInteraction) {
    int _156 = int(_customRenderPassSizeInvSize.y * TEXCOORD.y);
    float4 _158 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * (TEXCOORD.x - (0.10000000149011612f / _srcTargetSizeAndInv.x))), _156, 0));
    float _160 = 2.200000047683716f / _srcTargetSizeAndInv.x;
    float _161 = TEXCOORD.x - _160;
    float4 _164 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_161 * _customRenderPassSizeInvSize.x), _156, 0));
    float _167 = (_161 * 2.0f) + -1.0f;
    float _169 = 1.0f - (TEXCOORD.y * 2.0f);
    float _170 = max(1.0000000116860974e-07f, _164.x);
    float _206 = mad((_invViewProj[3].z), _170, mad((_invViewProj[3].y), _169, ((_invViewProj[3].x) * _167))) + (_invViewProj[3].w);
    float _210 = _160 + TEXCOORD.x;
    float4 _213 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_210 * _customRenderPassSizeInvSize.x), _156, 0));
    float _216 = (_210 * 2.0f) + -1.0f;
    float _217 = max(1.0000000116860974e-07f, _213.x);
    float _233 = mad((_invViewProj[3].z), _217, mad((_invViewProj[3].y), _169, ((_invViewProj[3].x) * _216))) + (_invViewProj[3].w);
    float _237 = 2.200000047683716f / _srcTargetSizeAndInv.y;
    float _238 = TEXCOORD.y - _237;
    int _241 = int(_customRenderPassSizeInvSize.x * TEXCOORD.x);
    float4 _243 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(_241, int(_238 * _customRenderPassSizeInvSize.y), 0));
    float _246 = (TEXCOORD.x * 2.0f) + -1.0f;
    float _248 = 1.0f - (_238 * 2.0f);
    float _249 = max(1.0000000116860974e-07f, _243.x);
    float _250 = (_invViewProj[0].x) * _246;
    float _254 = (_invViewProj[1].x) * _246;
    float _258 = (_invViewProj[2].x) * _246;
    float _262 = (_invViewProj[3].x) * _246;
    float _265 = mad((_invViewProj[3].z), _249, mad((_invViewProj[3].y), _248, _262)) + (_invViewProj[3].w);
    float _269 = _237 + TEXCOORD.y;
    float4 _272 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(_241, int(_269 * _customRenderPassSizeInvSize.y), 0));
    float _275 = 1.0f - (_269 * 2.0f);
    float _276 = max(1.0000000116860974e-07f, _272.x);
    float _288 = mad((_invViewProj[3].z), _276, mad((_invViewProj[3].y), _275, _262)) + (_invViewProj[3].w);
    float _292 = ((mad((_invViewProj[0].z), _276, mad((_invViewProj[0].y), _275, _250)) + (_invViewProj[0].w)) / _288) - ((mad((_invViewProj[0].z), _249, mad((_invViewProj[0].y), _248, _250)) + (_invViewProj[0].w)) / _265);
    float _293 = ((mad((_invViewProj[1].z), _276, mad((_invViewProj[1].y), _275, _254)) + (_invViewProj[1].w)) / _288) - ((mad((_invViewProj[1].z), _249, mad((_invViewProj[1].y), _248, _254)) + (_invViewProj[1].w)) / _265);
    float _294 = ((mad((_invViewProj[2].z), _276, mad((_invViewProj[2].y), _275, _258)) + (_invViewProj[2].w)) / _288) - ((mad((_invViewProj[2].z), _249, mad((_invViewProj[2].y), _248, _258)) + (_invViewProj[2].w)) / _265);
    float _295 = ((mad((_invViewProj[0].z), _217, mad((_invViewProj[0].y), _169, ((_invViewProj[0].x) * _216))) + (_invViewProj[0].w)) / _233) - ((mad((_invViewProj[0].z), _170, mad((_invViewProj[0].y), _169, ((_invViewProj[0].x) * _167))) + (_invViewProj[0].w)) / _206);
    float _296 = ((mad((_invViewProj[1].z), _217, mad((_invViewProj[1].y), _169, ((_invViewProj[1].x) * _216))) + (_invViewProj[1].w)) / _233) - ((mad((_invViewProj[1].z), _170, mad((_invViewProj[1].y), _169, ((_invViewProj[1].x) * _167))) + (_invViewProj[1].w)) / _206);
    float _297 = ((mad((_invViewProj[2].z), _217, mad((_invViewProj[2].y), _169, ((_invViewProj[2].x) * _216))) + (_invViewProj[2].w)) / _233) - ((mad((_invViewProj[2].z), _170, mad((_invViewProj[2].y), _169, ((_invViewProj[2].x) * _167))) + (_invViewProj[2].w)) / _206);
    float _300 = (_294 * _296) - (_293 * _297);
    float _303 = (_292 * _297) - (_294 * _295);
    float _306 = (_293 * _295) - (_292 * _296);
    float _308 = rsqrt(dot(float3(_300, _303, _306), float3(_300, _303, _306)));
    float _309 = _300 * _308;
    float _310 = _303 * _308;
    float _311 = _306 * _308;
    float _320 = saturate(dot(float3(_309, _310, _311), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
    float _336 = frac(_time.x * 0.4000000059604645f);
    float _340 = abs((1.9989999532699585f - _320) - (_336 * 2.5f));
    float _343 = saturate(1.0f - (_340 * 5.0f));
    float _351 = saturate((saturate(((2.0f - _320) * _139) + exp2(log2(1.0f - _320) * 4.0f)) * _158.x) * (_343 - (_343 * _336)));
    float _352 = _351 * _140;
    float _358 = _158.x * 50.0f;
    float _360 = saturate(_358 * _358);
    float _366 = saturate(1.0f - (_340 * 1.25f)) * _360;
    float _367 = _366 * 20.0f;
    float _375 = (_exposure2.x * 5000.0f) * (lerp(_352, _351, 2.0f));
    float _376 = (_360 - (_360 * _140)) * _exposure2.x;
    float _377 = _376 * 2.0f;
    float _385 = (_376 * 8.0f) * saturate(exp2(log2(1.0f - abs(dot(float3(_309, _310, _311), float3(_viewDir.x, _viewDir.y, _viewDir.z)))) * 2.5f));
    float _386 = _367 + 10000.0f;
    _558 = ((((_375 - (_366 * _85)) + _385) + (_386 * _82)) + ((1.0f - (_367 * _82)) * _377));
    _559 = ((((_375 - (_366 * _86)) + _385) + (_386 * _83)) + ((1.0f - (_367 * _83)) * _377));
    _560 = ((((_375 - (_366 * _87)) + _385) + (_386 * _84)) + ((1.0f - (_367 * _84)) * _377));
  } else {
    if (_45 == _renderPassDetectObjective) {
      uint _412 = uint(_bufferSizeAndInvSize.x * TEXCOORD.x);
      uint _413 = uint(_bufferSizeAndInvSize.y * TEXCOORD.y);
      uint4 _415 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_412), (int)(_413), 0));
      float4 _418 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_412), (int)(_413), 0));
      float _436 = (saturate(_418.x * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _437 = (saturate(_418.y * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _438 = (saturate(_418.z * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _440 = rsqrt(dot(float3(_436, _437, _438), float3(_436, _437, _438)));
      float _441 = _440 * _436;
      float _442 = _440 * _437;
      float _443 = _438 * _440;
      float _446 = (float((uint)((uint)(((uint)((uint)(_415.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
      float _447 = (float((uint)((uint)(_415.w & 255))) * 0.007843137718737125f) + -1.0f;
      float _450 = (_446 + _447) * 0.5f;
      float _451 = (_446 - _447) * 0.5f;
      float _455 = (1.0f - abs(_450)) - abs(_451);
      float _457 = rsqrt(dot(float3(_450, _451, _455), float3(_450, _451, _455)));
      float _458 = _457 * _450;
      float _459 = _457 * _451;
      float _460 = _457 * _455;
      float _462 = select((_443 >= 0.0f), 1.0f, -1.0f);
      float _465 = -0.0f - (1.0f / (_462 + _443));
      float _466 = _442 * _465;
      float _467 = _466 * _441;
      float _468 = _462 * _441;
      float _477 = mad(_460, _441, mad(_459, _467, ((((_468 * _441) * _465) + 1.0f) * _458)));
      float _481 = mad(_460, _442, mad(_459, (_462 + (_466 * _442)), ((_458 * _462) * _467)));
      float _485 = mad(_460, _443, mad(_459, (-0.0f - _442), (-0.0f - (_468 * _458))));
      float _487 = rsqrt(dot(float3(_477, _481, _485), float3(_477, _481, _485)));
      float _488 = _487 * _477;
      float _489 = _487 * _481;
      float _490 = _487 * _485;
      float _499 = saturate(dot(float3(_488, _489, _490), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
      float _516 = _time.x - _interactionTime;
      float _523 = abs((1.9989999532699585f - _499) - ((pow(_516, 0.5f)) * 2.25f));
      float _526 = saturate(1.0f - (_523 * 40.0f));
      float _542 = (saturate(exp2(log2(1.0f - abs(dot(float3(_488, _489, _490), float3(_viewDir.x, _viewDir.y, _viewDir.z)))) * 0.800000011920929f)) * _140) * saturate(1.0f - (_523 * 3.3333332538604736f));
      float _543 = _exposure2.x * 25.0f;
      float _550 = _543 * saturate((saturate(((2.0f - _499) * _139) + exp2(log2(1.0f - _499) * 4.0f)) * _140) * (_526 - ((_516 * 0.8999999761581421f) * _526)));
      _558 = ((_550 + _85) + ((_543 - _85) * _542));
      _559 = ((_550 + _86) + ((_543 - _86) * _542));
      _560 = ((_550 + _87) + ((_543 - _87) * _542));
    } else {
      _558 = _85;
      _559 = _86;
      _560 = _87;
    }
  }
  uint _561 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _568 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_561), 0));
    _574 = (float((uint)((uint)(_568.x & 127))) + 0.5f);
  } else {
    _574 = 1.0f;
  }
  bool _577 = (_localToneMappingParams.w > 0.0f);
  if (_577) {
    float3 output_color = TonemapReplacer(float3(_558, _559, _560));
    _930 = output_color.x;
    _931 = output_color.y;
    _932 = output_color.z;
  } else {
    _930 = _558;
    _931 = _559;
    _932 = _560;
  }
  if (_etcParams.y > 1.0f) {
    float _941 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _942 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _946 = saturate(1.0f - (dot(float2(_941, _942), float2(_941, _942)) * saturate(_etcParams.y + -1.0f)));
    _951 = (_946 * _930);
    _952 = (_946 * _931);
    _953 = (_946 * _932);
  } else {
    _951 = _930;
    _952 = _931;
    _953 = _932;
  }
  if ((_577) && ((_etcParams.z > 0.0f))) {
    _983 = select((_951 <= 0.0031308000907301903f), (_951 * 12.920000076293945f), (((pow(_951, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _984 = select((_952 <= 0.0031308000907301903f), (_952 * 12.920000076293945f), (((pow(_952, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _985 = select((_953 <= 0.0031308000907301903f), (_953 * 12.920000076293945f), (((pow(_953, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _983 = _951;
    _984 = _952;
    _985 = _953;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _990 = float((uint)_561);
    if (!(_990 < _viewDir.w)) {
      if (!(_990 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _999 = _983;
        _1000 = _984;
        _1001 = _985;
      } else {
        _999 = 0.0f;
        _1000 = 0.0f;
        _1001 = 0.0f;
      }
    } else {
      _999 = 0.0f;
      _1000 = 0.0f;
      _1001 = 0.0f;
    }
  } else {
    _999 = _983;
    _1000 = _984;
    _1001 = _985;
  }
  float _1011 = exp2(log2(_999 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1012 = exp2(log2(_1000 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1013 = exp2(log2(_1001 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_1011 * 18.6875f) + 1.0f)) * ((_1011 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_1012 * 18.6875f) + 1.0f)) * ((_1012 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_1013 * 18.6875f) + 1.0f)) * ((_1013 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _574;
  return SV_Target;
}