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
  float _103;
  float _104;
  float _521;
  float _522;
  float _523;
  float _537;
  float _742;
  float _743;
  float _744;
  float _837;
  float _838;
  float _839;
  float _893;
  float _894;
  float _895;
  float _914;
  float _915;
  float _916;
  float _946;
  float _947;
  float _948;
  float _962;
  float _963;
  float _964;
  if (_45 == _renderPassInteraction) {
    int _61 = WaveReadLaneFirst(_materialIndex);
    int _69 = WaveReadLaneFirst(BindlessParameters_PostProcessInteraction_CD[((int)((uint)(select(((uint)_61 < (uint)170000), _61, 0)) + 0u))]._lineTex);
    float4 _76 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_69 < (uint)65000), _69, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((TEXCOORD.x * 50.0f), (TEXCOORD.y * 50.0f)));
    float _80 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    float4 _94 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * TEXCOORD.x), int(_customRenderPassSizeInvSize.y * TEXCOORD.y), 0));
    _103 = _76.x;
    _104 = saturate(ceil(((_nearFarProj.x / max(1.0000000116860974e-07f, _80.x)) + 0.05000000074505806f) - (_nearFarProj.x / max(1.0000000116860974e-07f, _94.x))));
  } else {
    _103 = 0.0f;
    _104 = 0.0f;
  }
  if (_45 == _renderPassInteraction) {
    int _120 = int(_customRenderPassSizeInvSize.y * TEXCOORD.y);
    float4 _122 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * (TEXCOORD.x - (0.10000000149011612f / _srcTargetSizeAndInv.x))), _120, 0));
    float _124 = 2.200000047683716f / _srcTargetSizeAndInv.x;
    float _125 = TEXCOORD.x - _124;
    float4 _128 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_125 * _customRenderPassSizeInvSize.x), _120, 0));
    float _131 = (_125 * 2.0f) + -1.0f;
    float _133 = 1.0f - (TEXCOORD.y * 2.0f);
    float _134 = max(1.0000000116860974e-07f, _128.x);
    float _170 = mad((_invViewProj[3].z), _134, mad((_invViewProj[3].y), _133, ((_invViewProj[3].x) * _131))) + (_invViewProj[3].w);
    float _174 = _124 + TEXCOORD.x;
    float4 _177 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_174 * _customRenderPassSizeInvSize.x), _120, 0));
    float _180 = (_174 * 2.0f) + -1.0f;
    float _181 = max(1.0000000116860974e-07f, _177.x);
    float _197 = mad((_invViewProj[3].z), _181, mad((_invViewProj[3].y), _133, ((_invViewProj[3].x) * _180))) + (_invViewProj[3].w);
    float _201 = 2.200000047683716f / _srcTargetSizeAndInv.y;
    float _202 = TEXCOORD.y - _201;
    int _205 = int(_customRenderPassSizeInvSize.x * TEXCOORD.x);
    float4 _207 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(_205, int(_202 * _customRenderPassSizeInvSize.y), 0));
    float _210 = (TEXCOORD.x * 2.0f) + -1.0f;
    float _212 = 1.0f - (_202 * 2.0f);
    float _213 = max(1.0000000116860974e-07f, _207.x);
    float _214 = (_invViewProj[0].x) * _210;
    float _218 = (_invViewProj[1].x) * _210;
    float _222 = (_invViewProj[2].x) * _210;
    float _226 = (_invViewProj[3].x) * _210;
    float _229 = mad((_invViewProj[3].z), _213, mad((_invViewProj[3].y), _212, _226)) + (_invViewProj[3].w);
    float _233 = _201 + TEXCOORD.y;
    float4 _236 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(_205, int(_233 * _customRenderPassSizeInvSize.y), 0));
    float _239 = 1.0f - (_233 * 2.0f);
    float _240 = max(1.0000000116860974e-07f, _236.x);
    float _252 = mad((_invViewProj[3].z), _240, mad((_invViewProj[3].y), _239, _226)) + (_invViewProj[3].w);
    float _256 = ((mad((_invViewProj[0].z), _240, mad((_invViewProj[0].y), _239, _214)) + (_invViewProj[0].w)) / _252) - ((mad((_invViewProj[0].z), _213, mad((_invViewProj[0].y), _212, _214)) + (_invViewProj[0].w)) / _229);
    float _257 = ((mad((_invViewProj[1].z), _240, mad((_invViewProj[1].y), _239, _218)) + (_invViewProj[1].w)) / _252) - ((mad((_invViewProj[1].z), _213, mad((_invViewProj[1].y), _212, _218)) + (_invViewProj[1].w)) / _229);
    float _258 = ((mad((_invViewProj[2].z), _240, mad((_invViewProj[2].y), _239, _222)) + (_invViewProj[2].w)) / _252) - ((mad((_invViewProj[2].z), _213, mad((_invViewProj[2].y), _212, _222)) + (_invViewProj[2].w)) / _229);
    float _259 = ((mad((_invViewProj[0].z), _181, mad((_invViewProj[0].y), _133, ((_invViewProj[0].x) * _180))) + (_invViewProj[0].w)) / _197) - ((mad((_invViewProj[0].z), _134, mad((_invViewProj[0].y), _133, ((_invViewProj[0].x) * _131))) + (_invViewProj[0].w)) / _170);
    float _260 = ((mad((_invViewProj[1].z), _181, mad((_invViewProj[1].y), _133, ((_invViewProj[1].x) * _180))) + (_invViewProj[1].w)) / _197) - ((mad((_invViewProj[1].z), _134, mad((_invViewProj[1].y), _133, ((_invViewProj[1].x) * _131))) + (_invViewProj[1].w)) / _170);
    float _261 = ((mad((_invViewProj[2].z), _181, mad((_invViewProj[2].y), _133, ((_invViewProj[2].x) * _180))) + (_invViewProj[2].w)) / _197) - ((mad((_invViewProj[2].z), _134, mad((_invViewProj[2].y), _133, ((_invViewProj[2].x) * _131))) + (_invViewProj[2].w)) / _170);
    float _264 = (_258 * _260) - (_257 * _261);
    float _267 = (_256 * _261) - (_258 * _259);
    float _270 = (_257 * _259) - (_256 * _260);
    float _272 = rsqrt(dot(float3(_264, _267, _270), float3(_264, _267, _270)));
    float _273 = _264 * _272;
    float _274 = _267 * _272;
    float _275 = _270 * _272;
    float _284 = saturate(dot(float3(_273, _274, _275), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
    float _300 = frac(_time.x * 0.4000000059604645f);
    float _304 = abs((1.9989999532699585f - _284) - (_300 * 2.5f));
    float _307 = saturate(1.0f - (_304 * 5.0f));
    float _315 = saturate((saturate(((2.0f - _284) * _103) + exp2(log2(1.0f - _284) * 4.0f)) * _122.x) * (_307 - (_307 * _300)));
    float _316 = _315 * _104;
    float _322 = _122.x * 50.0f;
    float _324 = saturate(_322 * _322);
    float _330 = saturate(1.0f - (_304 * 1.25f)) * _324;
    float _331 = _330 * 0.0020000000949949026f;
    float _332 = _331 * _48.x;
    float _333 = _331 * _48.y;
    float _334 = _331 * _48.z;
    float _339 = (_exposure2.x * 5000.0f) * (lerp(_316, _315, 2.0f));
    float _340 = (_324 - (_324 * _104)) * _exposure2.x;
    float _341 = _340 * 2.0f;
    float _349 = (_340 * 8.0f) * saturate(exp2(log2(1.0f - abs(dot(float3(_273, _274, _275), float3(_viewDir.x, _viewDir.y, _viewDir.z)))) * 2.5f));
    _521 = (((((_339 + _48.x) - (_330 * _48.x)) + _332) + _349) + ((1.0f - _332) * _341));
    _522 = (((((_339 + _48.y) - (_330 * _48.y)) + _333) + _349) + ((1.0f - _333) * _341));
    _523 = (((((_48.z - (_330 * _48.z)) + _339) + _334) + _349) + ((1.0f - _334) * _341));
  } else {
    if (_45 == _renderPassDetectObjective) {
      uint _375 = uint(_bufferSizeAndInvSize.x * TEXCOORD.x);
      uint _376 = uint(_bufferSizeAndInvSize.y * TEXCOORD.y);
      uint4 _378 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_375), (int)(_376), 0));
      float4 _381 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_375), (int)(_376), 0));
      float _399 = (saturate(_381.x * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _400 = (saturate(_381.y * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _401 = (saturate(_381.z * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _403 = rsqrt(dot(float3(_399, _400, _401), float3(_399, _400, _401)));
      float _404 = _403 * _399;
      float _405 = _403 * _400;
      float _406 = _401 * _403;
      float _409 = (float((uint)((uint)(((uint)((uint)(_378.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
      float _410 = (float((uint)((uint)(_378.w & 255))) * 0.007843137718737125f) + -1.0f;
      float _413 = (_409 + _410) * 0.5f;
      float _414 = (_409 - _410) * 0.5f;
      float _418 = (1.0f - abs(_413)) - abs(_414);
      float _420 = rsqrt(dot(float3(_413, _414, _418), float3(_413, _414, _418)));
      float _421 = _420 * _413;
      float _422 = _420 * _414;
      float _423 = _420 * _418;
      float _425 = select((_406 >= 0.0f), 1.0f, -1.0f);
      float _428 = -0.0f - (1.0f / (_425 + _406));
      float _429 = _405 * _428;
      float _430 = _429 * _404;
      float _431 = _425 * _404;
      float _440 = mad(_423, _404, mad(_422, _430, ((((_431 * _404) * _428) + 1.0f) * _421)));
      float _444 = mad(_423, _405, mad(_422, (_425 + (_429 * _405)), ((_421 * _425) * _430)));
      float _448 = mad(_423, _406, mad(_422, (-0.0f - _405), (-0.0f - (_431 * _421))));
      float _450 = rsqrt(dot(float3(_440, _444, _448), float3(_440, _444, _448)));
      float _451 = _450 * _440;
      float _452 = _450 * _444;
      float _453 = _450 * _448;
      float _462 = saturate(dot(float3(_451, _452, _453), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
      float _479 = _time.x - _interactionTime;
      float _486 = abs((1.9989999532699585f - _462) - ((pow(_479, 0.5f)) * 2.25f));
      float _489 = saturate(1.0f - (_486 * 40.0f));
      float _505 = (saturate(exp2(log2(1.0f - abs(dot(float3(_451, _452, _453), float3(_viewDir.x, _viewDir.y, _viewDir.z)))) * 0.800000011920929f)) * _104) * saturate(1.0f - (_486 * 3.3333332538604736f));
      float _506 = _exposure2.x * 25.0f;
      float _513 = _506 * saturate((saturate(((2.0f - _462) * _103) + exp2(log2(1.0f - _462) * 4.0f)) * _104) * (_489 - ((_479 * 0.8999999761581421f) * _489)));
      _521 = ((_513 + _48.x) + ((_506 - _48.x) * _505));
      _522 = ((_513 + _48.y) + ((_506 - _48.y) * _505));
      _523 = ((_513 + _48.z) + ((_506 - _48.z) * _505));
    } else {
      _521 = _48.x;
      _522 = _48.y;
      _523 = _48.z;
    }
  }
  uint _524 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _531 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_524), 0));
    _537 = (float((uint)((uint)(_531.x & 127))) + 0.5f);
  } else {
    _537 = 1.0f;
  }
  bool _540 = (_localToneMappingParams.w > 0.0f);
  if (_540) {
    float3 output_color = TonemapReplacer(float3(_521, _522, _523));
    _893 = output_color.x;
    _894 = output_color.y;
    _895 = output_color.z;
  } else {
    _893 = _521;
    _894 = _522;
    _895 = _523;
  }
  if (_etcParams.y > 1.0f) {
    float _904 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _905 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _909 = saturate(1.0f - (dot(float2(_904, _905), float2(_904, _905)) * saturate(_etcParams.y + -1.0f)));
    _914 = (_909 * _893);
    _915 = (_909 * _894);
    _916 = (_909 * _895);
  } else {
    _914 = _893;
    _915 = _894;
    _916 = _895;
  }
  if ((_540) && ((_etcParams.z > 0.0f))) {
    _946 = select((_914 <= 0.0031308000907301903f), (_914 * 12.920000076293945f), (((pow(_914, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _947 = select((_915 <= 0.0031308000907301903f), (_915 * 12.920000076293945f), (((pow(_915, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _948 = select((_916 <= 0.0031308000907301903f), (_916 * 12.920000076293945f), (((pow(_916, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _946 = _914;
    _947 = _915;
    _948 = _916;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _953 = float((uint)_524);
    if (!(_953 < _viewDir.w)) {
      if (!(_953 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _962 = _946;
        _963 = _947;
        _964 = _948;
      } else {
        _962 = 0.0f;
        _963 = 0.0f;
        _964 = 0.0f;
      }
    } else {
      _962 = 0.0f;
      _963 = 0.0f;
      _964 = 0.0f;
    }
  } else {
    _962 = _946;
    _963 = _947;
    _964 = _948;
  }
  SV_Target.x = _962;
  SV_Target.y = _963;
  SV_Target.z = _964;
  SV_Target.w = _537;
  return SV_Target;
}