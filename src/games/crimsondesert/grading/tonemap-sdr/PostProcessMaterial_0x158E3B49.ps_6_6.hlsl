struct PostProcessTransitionStruct {
  uint _sceneSampleType;
  uint _sceneDistortTex;
  float2 _sceneDistortTexScale;
  float2 _sceneDistortIntensity;
  float _scenePolarDistort;
  float2 _scenePolarDistortCenter;
  float _topVignetteRatio;
  float _topVignetteRadius;
  float _topVignettePower;
  uint _topVignetteColor;
  float _sideVignetteRatio;
  float _sideVignetteRadius;
  float _sideVignettePower;
  uint _sideVignetteColor;
  float _bottomVignetteRatio;
  float _bottomVignetteRadius;
  float _bottomVignettePower;
  uint _bottomVignetteColor;
  float _impactFrame;
  float _impactFrameFresnel;
  float _impactFrameFresnelIntensity;
  float _impactFrameInverse;
  uint _chapterTransitionTex;
  uint _chapterTransitionNoiseTex;
  float _chapterTransition;
  float _chapterTransitionUseDivide;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t69, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t32, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t40, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t33, space36);

Texture2D<uint4> __3__36__0__0__g_gbufferBaseColor : register(t77, space36);

Texture2D<float4> __3__36__0__0__g_gbufferNormal : register(t78, space36);

Texture2D<uint> __3__36__0__0__g_CustomRenderPassValue : register(t79, space36);

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

ConstantBuffer<PostProcessTransitionStruct> BindlessParameters_PostProcessTransition[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

SamplerState __0__4__0__0__g_staticBilinearBlackBorder : register(s4, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  int _29 = WaveReadLaneFirst(_materialIndex);
  float _167;
  float _168;
  float _465;
  float _466;
  float _467;
  float _468;
  float _469;
  float _470;
  float _471;
  bool _516;
  float _575;
  float _590;
  float _591;
  float _592;
  float _714;
  float _715;
  float _716;
  float _810;
  float _811;
  float _812;
  float _905;
  float _906;
  float _907;
  float _1084;
  float _1085;
  float _1086;
  float _1100;
  float _1305;
  float _1306;
  float _1307;
  float _1400;
  float _1401;
  float _1402;
  float _1456;
  float _1457;
  float _1458;
  float _1477;
  float _1478;
  float _1479;
  float _1509;
  float _1510;
  float _1511;
  float _1525;
  float _1526;
  float _1527;
  if (!(WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_29 < (uint)170000), _29, 0)) + 0u))]._scenePolarDistort) >= 0.0010000000474974513f)) {
    int _121 = WaveReadLaneFirst(_materialIndex);
    int _134 = WaveReadLaneFirst(_materialIndex);
    int _142 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_134 < (uint)170000), _134, 0)) + 0u))]._sceneDistortTex);
    float4 _148 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_142 < (uint)65000), _142, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_121 < (uint)170000), _121, 0)) + 0u))]._sceneDistortTexScale.x) * TEXCOORD.x), (WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_121 < (uint)170000), _121, 0)) + 0u))]._sceneDistortTexScale.y) * TEXCOORD.y)));
    int _153 = WaveReadLaneFirst(_materialIndex);
    _167 = (WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_153 < (uint)170000), _153, 0)) + 0u))]._sceneDistortIntensity.x) * (_148.x + -0.5f));
    _168 = (WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_153 < (uint)170000), _153, 0)) + 0u))]._sceneDistortIntensity.y) * (_148.y + -0.5f));
  } else {
    int _41 = WaveReadLaneFirst(_materialIndex);
    float _52 = TEXCOORD.x - WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_41 < (uint)170000), _41, 0)) + 0u))]._scenePolarDistortCenter.x);
    float _53 = TEXCOORD.y - WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_41 < (uint)170000), _41, 0)) + 0u))]._scenePolarDistortCenter.y);
    float _55 = atan(_53 / _52);
    bool _58 = (_52 < 0.0f);
    bool _59 = (_52 == 0.0f);
    bool _60 = (_53 >= 0.0f);
    bool _61 = (_53 < 0.0f);
    float _74 = sqrt((_53 * _53) + (_52 * _52));
    int _75 = WaveReadLaneFirst(_materialIndex);
    int _88 = WaveReadLaneFirst(_materialIndex);
    int _96 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_88 < (uint)170000), _88, 0)) + 0u))]._sceneDistortTex);
    float4 _102 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_96 < (uint)65000), _96, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_75 < (uint)170000), _75, 0)) + 0u))]._sceneDistortTexScale.x) * select(((_59) && (_60)), 0.5f, select(((_59) && (_61)), -0.5f, (select(((_58) && (_61)), (_55 + -3.1415927410125732f), select(((_58) && (_60)), (_55 + 3.1415927410125732f), _55)) * 0.31830987334251404f)))), (WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_75 < (uint)170000), _75, 0)) + 0u))]._sceneDistortTexScale.y) * _74)));
    int _107 = WaveReadLaneFirst(_materialIndex);
    float _117 = saturate(_74) * WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_107 < (uint)170000), _107, 0)) + 0u))]._scenePolarDistort);
    _167 = (_117 * (_102.x + -0.5f));
    _168 = (_117 * (_102.y + -0.5f));
  }
  float _169 = TEXCOORD.x - _167;
  float _170 = TEXCOORD.y - _168;
  int _171 = WaveReadLaneFirst(_materialIndex);
  switch (WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_171 < (uint)170000), _171, 0)) + 0u))]._sceneSampleType)) {
    case 0: {
      float4 _183 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_169, _170));
      float _188 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_169, _170));
      uint _195 = uint(_bufferSizeAndInvSize.x * _169);
      uint _196 = uint(_bufferSizeAndInvSize.y * _170);
      uint4 _198 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_195), (int)(_196), 0));
      float4 _201 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_195), (int)(_196), 0));
      float _219 = (saturate(_201.x * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _220 = (saturate(_201.y * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _221 = (saturate(_201.z * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _223 = rsqrt(dot(float3(_219, _220, _221), float3(_219, _220, _221)));
      float _224 = _223 * _219;
      float _225 = _223 * _220;
      float _226 = _221 * _223;
      float _229 = (float((uint)((uint)(((uint)((uint)(_198.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
      float _230 = (float((uint)((uint)(_198.w & 255))) * 0.007843137718737125f) + -1.0f;
      float _233 = (_229 + _230) * 0.5f;
      float _234 = (_229 - _230) * 0.5f;
      float _238 = (1.0f - abs(_233)) - abs(_234);
      float _240 = rsqrt(dot(float3(_233, _234, _238), float3(_233, _234, _238)));
      float _241 = _240 * _233;
      float _242 = _240 * _234;
      float _243 = _240 * _238;
      float _245 = select((_226 >= 0.0f), 1.0f, -1.0f);
      float _248 = -0.0f - (1.0f / (_245 + _226));
      float _249 = _225 * _248;
      float _250 = _249 * _224;
      float _251 = _245 * _224;
      float _260 = mad(_243, _224, mad(_242, _250, ((((_251 * _224) * _248) + 1.0f) * _241)));
      float _264 = mad(_243, _225, mad(_242, (_245 + (_249 * _225)), ((_241 * _245) * _250)));
      float _268 = mad(_243, _226, mad(_242, (-0.0f - _225), (-0.0f - (_251 * _241))));
      float _270 = rsqrt(dot(float3(_260, _264, _268), float3(_260, _264, _268)));
      _465 = _183.x;
      _466 = _183.y;
      _467 = _183.z;
      _468 = _188.x;
      _469 = (_270 * _260);
      _470 = (_270 * _264);
      _471 = (_270 * _268);
      break;
    }
    case 1: {
      float4 _277 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_169, _170));
      float _283 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearWrap, float2(_169, _170));
      uint _290 = uint(_bufferSizeAndInvSize.x * _169);
      uint _291 = uint(_bufferSizeAndInvSize.y * _170);
      uint4 _293 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_290), (int)(_291), 0));
      float4 _296 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_290), (int)(_291), 0));
      float _314 = (saturate(_296.x * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _315 = (saturate(_296.y * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _316 = (saturate(_296.z * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _318 = rsqrt(dot(float3(_314, _315, _316), float3(_314, _315, _316)));
      float _319 = _318 * _314;
      float _320 = _318 * _315;
      float _321 = _316 * _318;
      float _324 = (float((uint)((uint)(((uint)((uint)(_293.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
      float _325 = (float((uint)((uint)(_293.w & 255))) * 0.007843137718737125f) + -1.0f;
      float _328 = (_324 + _325) * 0.5f;
      float _329 = (_324 - _325) * 0.5f;
      float _333 = (1.0f - abs(_328)) - abs(_329);
      float _335 = rsqrt(dot(float3(_328, _329, _333), float3(_328, _329, _333)));
      float _336 = _335 * _328;
      float _337 = _335 * _329;
      float _338 = _335 * _333;
      float _340 = select((_321 >= 0.0f), 1.0f, -1.0f);
      float _343 = -0.0f - (1.0f / (_340 + _321));
      float _344 = _320 * _343;
      float _345 = _344 * _319;
      float _346 = _340 * _319;
      float _355 = mad(_338, _319, mad(_337, _345, ((((_346 * _319) * _343) + 1.0f) * _336)));
      float _359 = mad(_338, _320, mad(_337, (_340 + (_344 * _320)), ((_336 * _340) * _345)));
      float _363 = mad(_338, _321, mad(_337, (-0.0f - _320), (-0.0f - (_346 * _336))));
      float _365 = rsqrt(dot(float3(_355, _359, _363), float3(_355, _359, _363)));
      _465 = _277.x;
      _466 = _277.y;
      _467 = _277.z;
      _468 = _283.x;
      _469 = (_365 * _355);
      _470 = (_365 * _359);
      _471 = (_365 * _363);
      break;
    }
    case 2: {
      float4 _372 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_169, _170));
      float _378 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearBlackBorder, float2(_169, _170));
      uint _385 = uint(_bufferSizeAndInvSize.x * _169);
      uint _386 = uint(_bufferSizeAndInvSize.y * _170);
      uint4 _388 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_385), (int)(_386), 0));
      float4 _391 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_385), (int)(_386), 0));
      float _409 = (saturate(_391.x * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _410 = (saturate(_391.y * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _411 = (saturate(_391.z * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _413 = rsqrt(dot(float3(_409, _410, _411), float3(_409, _410, _411)));
      float _414 = _413 * _409;
      float _415 = _413 * _410;
      float _416 = _411 * _413;
      float _419 = (float((uint)((uint)(((uint)((uint)(_388.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
      float _420 = (float((uint)((uint)(_388.w & 255))) * 0.007843137718737125f) + -1.0f;
      float _423 = (_419 + _420) * 0.5f;
      float _424 = (_419 - _420) * 0.5f;
      float _428 = (1.0f - abs(_423)) - abs(_424);
      float _430 = rsqrt(dot(float3(_423, _424, _428), float3(_423, _424, _428)));
      float _431 = _430 * _423;
      float _432 = _430 * _424;
      float _433 = _430 * _428;
      float _435 = select((_416 >= 0.0f), 1.0f, -1.0f);
      float _438 = -0.0f - (1.0f / (_435 + _416));
      float _439 = _415 * _438;
      float _440 = _439 * _414;
      float _441 = _435 * _414;
      float _450 = mad(_433, _414, mad(_432, _440, ((((_441 * _414) * _438) + 1.0f) * _431)));
      float _454 = mad(_433, _415, mad(_432, (_435 + (_439 * _415)), ((_431 * _435) * _440)));
      float _458 = mad(_433, _416, mad(_432, (-0.0f - _415), (-0.0f - (_441 * _431))));
      float _460 = rsqrt(dot(float3(_450, _454, _458), float3(_450, _454, _458)));
      _465 = _372.x;
      _466 = _372.y;
      _467 = _372.z;
      _468 = _378.x;
      _469 = (_460 * _450);
      _470 = (_460 * _454);
      _471 = (_460 * _458);
      break;
    }
    default: {
      _465 = 0.0f;
      _466 = 0.0f;
      _467 = 0.0f;
      _468 = 0.0f;
      _469 = 0.0f;
      _470 = 0.0f;
      _471 = 0.0f;
      break;
    }
  }
  int2 _473; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_473.x, _473.y);
  uint _488 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_473.x))))) + 0.5f) * _169), int((float((int)(int(float((int)(_473.y))))) + 0.5f) * _170), 0));
  int _490 = _488.x & 255;
  bool _493 = ((_468 < 1.0000000116860974e-07f)) || ((_468 == 1.0f));
  int _494 = WaveReadLaneFirst(_materialIndex);
  float _502 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_494 < (uint)170000), _494, 0)) + 0u))]._impactFrame);
  if (!(!(_502 >= 0.0010000000474974513f))) {
    if (!(_490 == _renderPassSelfPlayer)) {
      if (!(_490 == _renderPassTest)) {
        _516 = (_490 == _renderPassTargetFocus);
      } else {
        _516 = true;
      }
    } else {
      _516 = true;
    }
    float _518 = select(_493, 1.0f, select(_516, 0.0f, 1.0f));
    int _519 = WaveReadLaneFirst(_materialIndex);
    float _530 = select((WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_519 < (uint)170000), _519, 0)) + 0u))]._impactFrameInverse) > 0.0010000000474974513f), (1.0f - _518), _518);
    int _531 = WaveReadLaneFirst(_materialIndex);
    float _539 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_531 < (uint)170000), _531, 0)) + 0u))]._impactFrameFresnel);
    float _540 = abs(_539);
    if (!((_493) || ((!(_540 > 0.0f))))) {
      float _555 = abs(1.0f - saturate(dot(float3(_469, _470, _471), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z)))));
      int _561 = WaveReadLaneFirst(_materialIndex);
      _575 = ((saturate(WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_561 < (uint)170000), _561, 0)) + 0u))]._impactFrameFresnelIntensity) * exp2(log2(select((_539 < 0.0f), (1.0f - _555), _555)) * _540)) + 0.0020000000949949026f) * _530);
    } else {
      _575 = _530;
    }
    float _579 = _575 / max(0.0010000000474974513f, _exposure0.x);
    _590 = (lerp(_465, _579, _502));
    _591 = (lerp(_466, _579, _502));
    _592 = (lerp(_467, _579, _502));
  } else {
    _590 = _465;
    _591 = _466;
    _592 = _467;
  }
  int _593 = WaveReadLaneFirst(_materialIndex);
  float _601 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_593 < (uint)170000), _593, 0)) + 0u))]._topVignetteRatio);
  int _602 = WaveReadLaneFirst(_materialIndex);
  float _610 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_602 < (uint)170000), _602, 0)) + 0u))]._sideVignetteRatio);
  int _611 = WaveReadLaneFirst(_materialIndex);
  float _619 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_611 < (uint)170000), _611, 0)) + 0u))]._bottomVignetteRatio);
  if (!(!(_610 >= 0.0010000000474974513f))) {
    float _622 = TEXCOORD.x + -0.5f;
    float _623 = TEXCOORD.y + -0.5f;
    int _628 = WaveReadLaneFirst(_materialIndex);
    int _642 = WaveReadLaneFirst(_materialIndex);
    int _656 = WaveReadLaneFirst(_materialIndex);
    int _664 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_656 < (uint)170000), _656, 0)) + 0u))]._sideVignetteColor);
    float _667 = float((uint)((uint)(((uint)((uint)(_664)) >> 16) & 255)));
    float _670 = float((uint)((uint)(((uint)((uint)(_664)) >> 8) & 255)));
    float _672 = float((uint)((uint)(_664 & 255)));
    float _702 = max(0.0010000000474974513f, _exposure0.x);
    float _706 = saturate(exp2(log2(abs(0.5f - TEXCOORD.x)) * WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_642 < (uint)170000), _642, 0)) + 0u))]._sideVignettePower)) * (sqrt((_623 * _623) + (_622 * _622)) / max(0.0010000000474974513f, (1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_628 < (uint)170000), _628, 0)) + 0u))]._sideVignetteRadius))))) * _610;
    _714 = (((select(((_667 * 0.003921568859368563f) < 0.040449999272823334f), (_667 * 0.0003035269910469651f), exp2(log2((_667 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _702) * _706) + _590);
    _715 = (((select(((_670 * 0.003921568859368563f) < 0.040449999272823334f), (_670 * 0.0003035269910469651f), exp2(log2((_670 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _702) * _706) + _591);
    _716 = (((select(((_672 * 0.003921568859368563f) < 0.040449999272823334f), (_672 * 0.0003035269910469651f), exp2(log2((_672 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _702) * _706) + _592);
  } else {
    _714 = _590;
    _715 = _591;
    _716 = _592;
  }
  if (!(!(_601 >= 0.0010000000474974513f))) {
    float _719 = TEXCOORD.x + -0.5f;
    float _720 = TEXCOORD.y + -0.5f;
    int _725 = WaveReadLaneFirst(_materialIndex);
    int _738 = WaveReadLaneFirst(_materialIndex);
    int _752 = WaveReadLaneFirst(_materialIndex);
    int _760 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_752 < (uint)170000), _752, 0)) + 0u))]._topVignetteColor);
    float _763 = float((uint)((uint)(((uint)((uint)(_760)) >> 16) & 255)));
    float _766 = float((uint)((uint)(((uint)((uint)(_760)) >> 8) & 255)));
    float _768 = float((uint)((uint)(_760 & 255)));
    float _798 = max(0.0010000000474974513f, _exposure0.x);
    float _802 = saturate(exp2(log2(1.0f - TEXCOORD.y) * WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_738 < (uint)170000), _738, 0)) + 0u))]._topVignettePower)) * (sqrt((_720 * _720) + (_719 * _719)) / max(0.0010000000474974513f, (1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_725 < (uint)170000), _725, 0)) + 0u))]._topVignetteRadius))))) * _601;
    _810 = (((select(((_763 * 0.003921568859368563f) < 0.040449999272823334f), (_763 * 0.0003035269910469651f), exp2(log2((_763 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _798) * _802) + _714);
    _811 = (((select(((_766 * 0.003921568859368563f) < 0.040449999272823334f), (_766 * 0.0003035269910469651f), exp2(log2((_766 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _798) * _802) + _715);
    _812 = (((select(((_768 * 0.003921568859368563f) < 0.040449999272823334f), (_768 * 0.0003035269910469651f), exp2(log2((_768 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _798) * _802) + _716);
  } else {
    _810 = _714;
    _811 = _715;
    _812 = _716;
  }
  if (!(!(_619 >= 0.0010000000474974513f))) {
    float _815 = TEXCOORD.x + -0.5f;
    float _816 = TEXCOORD.y + -0.5f;
    int _821 = WaveReadLaneFirst(_materialIndex);
    int _833 = WaveReadLaneFirst(_materialIndex);
    int _847 = WaveReadLaneFirst(_materialIndex);
    int _855 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_847 < (uint)170000), _847, 0)) + 0u))]._bottomVignetteColor);
    float _858 = float((uint)((uint)(((uint)((uint)(_855)) >> 16) & 255)));
    float _861 = float((uint)((uint)(((uint)((uint)(_855)) >> 8) & 255)));
    float _863 = float((uint)((uint)(_855 & 255)));
    float _893 = max(0.0010000000474974513f, _exposure0.x);
    float _897 = saturate(exp2(log2(TEXCOORD.y) * WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_833 < (uint)170000), _833, 0)) + 0u))]._bottomVignettePower)) * (sqrt((_816 * _816) + (_815 * _815)) / max(0.0010000000474974513f, (1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_821 < (uint)170000), _821, 0)) + 0u))]._bottomVignetteRadius))))) * _619;
    _905 = (((select(((_858 * 0.003921568859368563f) < 0.040449999272823334f), (_858 * 0.0003035269910469651f), exp2(log2((_858 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _893) * _897) + _810);
    _906 = (((select(((_861 * 0.003921568859368563f) < 0.040449999272823334f), (_861 * 0.0003035269910469651f), exp2(log2((_861 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _893) * _897) + _811);
    _907 = (((select(((_863 * 0.003921568859368563f) < 0.040449999272823334f), (_863 * 0.0003035269910469651f), exp2(log2((_863 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _893) * _897) + _812);
  } else {
    _905 = _810;
    _906 = _811;
    _907 = _812;
  }
  int _908 = WaveReadLaneFirst(_materialIndex);
  float _916 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_908 < (uint)170000), _908, 0)) + 0u))]._chapterTransition);
  if (((_916 >= 0.0010000000474974513f)) && ((_916 < 1.0f))) {
    float _921 = _916 * 2.0f;
    bool _922 = (_921 > 1.0f);
    float _924 = select(_922, (_921 + -1.0f), _921);
    int _925 = WaveReadLaneFirst(_materialIndex);
    int _933 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_925 < (uint)170000), _925, 0)) + 0u))]._chapterTransitionNoiseTex);
    float4 _940 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_933 < (uint)65000), _933, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
    float _942 = _940.x * 0.20000000298023224f;
    float4 _945 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    int _949 = WaveReadLaneFirst(_materialIndex);
    float _960 = (_924 + -0.5f) * 1.5f;
    float _962 = _942 + (TEXCOORD.x - _960);
    float _967 = select((_924 >= 0.8999999761581421f), ((_924 + -0.8999999761581421f) * 10.0f), 0.0f);
    if (!(WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_949 < (uint)170000), _949, 0)) + 0u))]._chapterTransitionUseDivide) == 0.0f)) {
      float _972 = TEXCOORD.y + 0.44999998807907104f;
      float _973 = TEXCOORD.y + -0.44999998807907104f;
      int _982 = WaveReadLaneFirst(_materialIndex);
      int _990 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_982 < (uint)170000), _982, 0)) + 0u))]._chapterTransitionTex);
      float4 _996 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_990 < (uint)65000), _990, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(_962, _972));
      int _999 = WaveReadLaneFirst(_materialIndex);
      int _1007 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_999 < (uint)170000), _999, 0)) + 0u))]._chapterTransitionTex);
      float4 _1013 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1007 < (uint)65000), _1007, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2((((1.0f - TEXCOORD.x) - _960) + _942), _973));
      float _1017 = saturate((_1013.x * select((((_973 < 0.0f)) || ((_973 > 1.0f))), 0.0f, 1.0f)) + (_996.x * select((((_972 < 0.0f)) || ((_972 > 1.0f))), 0.0f, 1.0f)));
      float _1020 = ((1.0f - _1017) * _967) + _1017;
      if (_922) {
        _1084 = ((_1020 * (_905 - _945.x)) + _945.x);
        _1085 = ((_1020 * (_906 - _945.y)) + _945.y);
        _1086 = ((_1020 * (_907 - _945.z)) + _945.z);
      } else {
        _1084 = ((_1020 * (_945.x - _905)) + _905);
        _1085 = ((_1020 * (_945.y - _906)) + _906);
        _1086 = ((_1020 * (_945.z - _907)) + _907);
      }
    } else {
      int _1044 = WaveReadLaneFirst(_materialIndex);
      int _1052 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_1044 < (uint)170000), _1044, 0)) + 0u))]._chapterTransitionTex);
      float4 _1058 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1052 < (uint)65000), _1052, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(_962, ((TEXCOORD.y * 0.949999988079071f) + 0.02500000037252903f)));
      float _1062 = ((1.0f - _1058.x) * _967) + _1058.x;
      if (_922) {
        _1084 = ((_1062 * (_905 - _945.x)) + _945.x);
        _1085 = ((_1062 * (_906 - _945.y)) + _945.y);
        _1086 = ((_1062 * (_907 - _945.z)) + _945.z);
      } else {
        _1084 = ((_1062 * (_945.x - _905)) + _905);
        _1085 = ((_1062 * (_945.y - _906)) + _906);
        _1086 = ((_1062 * (_945.z - _907)) + _907);
      }
    }
  } else {
    _1084 = _905;
    _1085 = _906;
    _1086 = _907;
  }
  uint _1087 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _1094 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_1087), 0));
    _1100 = (float((uint)((uint)(_1094.x & 127))) + 0.5f);
  } else {
    _1100 = 1.0f;
  }
  bool _1103 = (_localToneMappingParams.w > 0.0f);
  if (_1103) {
    float3 output_color = TonemapReplacer(float3(_1084, _1085, _1086));
    _1456 = output_color.x;
    _1457 = output_color.y;
    _1458 = output_color.z;
  } else {
    _1456 = _1084;
    _1457 = _1085;
    _1458 = _1086;
  }
  if (_etcParams.y > 1.0f) {
    float _1467 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _1468 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _1472 = saturate(1.0f - (dot(float2(_1467, _1468), float2(_1467, _1468)) * saturate(_etcParams.y + -1.0f)));
    _1477 = (_1472 * _1456);
    _1478 = (_1472 * _1457);
    _1479 = (_1472 * _1458);
  } else {
    _1477 = _1456;
    _1478 = _1457;
    _1479 = _1458;
  }
  if ((_1103) && ((_etcParams.z > 0.0f))) {
    _1509 = select((_1477 <= 0.0031308000907301903f), (_1477 * 12.920000076293945f), (((pow(_1477, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1510 = select((_1478 <= 0.0031308000907301903f), (_1478 * 12.920000076293945f), (((pow(_1478, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1511 = select((_1479 <= 0.0031308000907301903f), (_1479 * 12.920000076293945f), (((pow(_1479, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1509 = _1477;
    _1510 = _1478;
    _1511 = _1479;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _1516 = float((uint)_1087);
    if (!(_1516 < _viewDir.w)) {
      if (!(_1516 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _1525 = _1509;
        _1526 = _1510;
        _1527 = _1511;
      } else {
        _1525 = 0.0f;
        _1526 = 0.0f;
        _1527 = 0.0f;
      }
    } else {
      _1525 = 0.0f;
      _1526 = 0.0f;
      _1527 = 0.0f;
    }
  } else {
    _1525 = _1509;
    _1526 = _1510;
    _1527 = _1511;
  }
  SV_Target.x = _1525;
  SV_Target.y = _1526;
  SV_Target.z = _1527;
  SV_Target.w = _1100;
  return SV_Target;
}