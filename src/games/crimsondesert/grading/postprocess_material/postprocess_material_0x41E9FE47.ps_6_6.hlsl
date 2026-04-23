#include "../tonemap.hlsli"

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

Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t44, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t33, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t75, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t38, space36);

Texture2D<uint4> __3__36__0__0__g_gbufferBaseColor : register(t77, space36);

Texture2D<float4> __3__36__0__0__g_gbufferNormal : register(t64, space36);

Texture2D<uint> __3__36__0__0__g_CustomRenderPassValue : register(t65, space36);

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

ConstantBuffer<PostProcessTransitionStruct> BindlessParameters_PostProcessTransition[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

SamplerState __0__4__0__0__g_staticBilinearBlackBorder : register(s4, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _25[36];
  int _28 = WaveReadLaneFirst(_materialIndex);
  float _166;
  float _167;
  float _572;
  float _573;
  float _574;
  float _575;
  float _576;
  float _577;
  float _578;
  bool _623;
  float _682;
  float _697;
  float _698;
  float _699;
  float _821;
  float _822;
  float _823;
  float _917;
  float _918;
  float _919;
  float _1012;
  float _1013;
  float _1014;
  float _1227;
  float _1228;
  float _1229;
  float _1243;
  float _1489;
  float _1490;
  float _1491;
  float _1611;
  float _1612;
  float _1613;
  float _1634;
  float _1635;
  float _1636;
  float _1669;
  float _1670;
  float _1671;
  float _1685;
  float _1686;
  float _1687;
  if (!(WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_28 < (uint)170000), _28, 0)) + 0u))]._scenePolarDistort) >= 0.0010000000474974513f)) {
    int _120 = WaveReadLaneFirst(_materialIndex);
    int _133 = WaveReadLaneFirst(_materialIndex);
    int _141 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_133 < (uint)170000), _133, 0)) + 0u))]._sceneDistortTex);
    float4 _147 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_141 < (uint)65000), _141, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_120 < (uint)170000), _120, 0)) + 0u))]._sceneDistortTexScale.x) * TEXCOORD.x), (WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_120 < (uint)170000), _120, 0)) + 0u))]._sceneDistortTexScale.y) * TEXCOORD.y)));
    int _152 = WaveReadLaneFirst(_materialIndex);
    _166 = (WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_152 < (uint)170000), _152, 0)) + 0u))]._sceneDistortIntensity.x) * (_147.x + -0.5f));
    _167 = (WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_152 < (uint)170000), _152, 0)) + 0u))]._sceneDistortIntensity.y) * (_147.y + -0.5f));
  } else {
    int _40 = WaveReadLaneFirst(_materialIndex);
    float _51 = TEXCOORD.x - WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_40 < (uint)170000), _40, 0)) + 0u))]._scenePolarDistortCenter.x);
    float _52 = TEXCOORD.y - WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_40 < (uint)170000), _40, 0)) + 0u))]._scenePolarDistortCenter.y);
    float _54 = atan(_52 / _51);
    bool _57 = (_51 < 0.0f);
    bool _58 = (_51 == 0.0f);
    bool _59 = (_52 >= 0.0f);
    bool _60 = (_52 < 0.0f);
    float _73 = sqrt((_52 * _52) + (_51 * _51));
    int _74 = WaveReadLaneFirst(_materialIndex);
    int _87 = WaveReadLaneFirst(_materialIndex);
    int _95 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_87 < (uint)170000), _87, 0)) + 0u))]._sceneDistortTex);
    float4 _101 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_95 < (uint)65000), _95, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_74 < (uint)170000), _74, 0)) + 0u))]._sceneDistortTexScale.x) * select(((_58) && (_59)), 0.5f, select(((_58) && (_60)), -0.5f, (select(((_57) && (_60)), (_54 + -3.1415927410125732f), select(((_57) && (_59)), (_54 + 3.1415927410125732f), _54)) * 0.31830987334251404f)))), (WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_74 < (uint)170000), _74, 0)) + 0u))]._sceneDistortTexScale.y) * _73)));
    int _106 = WaveReadLaneFirst(_materialIndex);
    float _116 = saturate(_73) * WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_106 < (uint)170000), _106, 0)) + 0u))]._scenePolarDistort);
    _166 = (_116 * (_101.x + -0.5f));
    _167 = (_116 * (_101.y + -0.5f));
  }
  float _168 = TEXCOORD.x - _166;
  float _169 = TEXCOORD.y - _167;
  int _170 = WaveReadLaneFirst(_materialIndex);
  switch (WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_170 < (uint)170000), _170, 0)) + 0u))]._sceneSampleType)) {
    case 0: {
      float4 _182 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_168, _169));
      float _192 = (pow(_182.x, 0.012683313339948654f));
      float _193 = (pow(_182.y, 0.012683313339948654f));
      float _194 = (pow(_182.z, 0.012683313339948654f));
      float _223 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_168, _169));
      uint _230 = uint(_bufferSizeAndInvSize.x * _168);
      uint _231 = uint(_bufferSizeAndInvSize.y * _169);
      uint4 _233 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_230), (int)(_231), 0));
      float4 _236 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_230), (int)(_231), 0));
      float _254 = (saturate(_236.x * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _255 = (saturate(_236.y * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _256 = (saturate(_236.z * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _258 = rsqrt(dot(float3(_254, _255, _256), float3(_254, _255, _256)));
      float _259 = _258 * _254;
      float _260 = _258 * _255;
      float _261 = _256 * _258;
      float _264 = (float((uint)((uint)(((uint)((uint)(_233.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
      float _265 = (float((uint)((uint)(_233.w & 255))) * 0.007843137718737125f) + -1.0f;
      float _268 = (_264 + _265) * 0.5f;
      float _269 = (_264 - _265) * 0.5f;
      float _273 = (1.0f - abs(_268)) - abs(_269);
      float _275 = rsqrt(dot(float3(_268, _269, _273), float3(_268, _269, _273)));
      float _276 = _275 * _268;
      float _277 = _275 * _269;
      float _278 = _275 * _273;
      float _280 = select((_261 >= 0.0f), 1.0f, -1.0f);
      float _283 = -0.0f - (1.0f / (_280 + _261));
      float _284 = _260 * _283;
      float _285 = _284 * _259;
      float _286 = _280 * _259;
      float _295 = mad(_278, _259, mad(_277, _285, ((((_286 * _259) * _283) + 1.0f) * _276)));
      float _299 = mad(_278, _260, mad(_277, (_280 + (_284 * _260)), ((_276 * _280) * _285)));
      float _303 = mad(_278, _261, mad(_277, (-0.0f - _260), (-0.0f - (_286 * _276))));
      float _305 = rsqrt(dot(float3(_295, _299, _303), float3(_295, _299, _303)));
      _572 = (exp2(log2(max(0.0f, (_192 + -0.8359375f)) / (18.8515625f - (_192 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
      _573 = (exp2(log2(max(0.0f, (_193 + -0.8359375f)) / (18.8515625f - (_193 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
      _574 = (exp2(log2(max(0.0f, (_194 + -0.8359375f)) / (18.8515625f - (_194 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
      _575 = _223.x;
      _576 = (_305 * _295);
      _577 = (_305 * _299);
      _578 = (_305 * _303);
      break;
    }
    case 1: {
      float4 _312 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_168, _169));
      float _322 = (pow(_312.x, 0.012683313339948654f));
      float _323 = (pow(_312.y, 0.012683313339948654f));
      float _324 = (pow(_312.z, 0.012683313339948654f));
      float _354 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearWrap, float2(_168, _169));
      uint _361 = uint(_bufferSizeAndInvSize.x * _168);
      uint _362 = uint(_bufferSizeAndInvSize.y * _169);
      uint4 _364 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_361), (int)(_362), 0));
      float4 _367 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_361), (int)(_362), 0));
      float _385 = (saturate(_367.x * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _386 = (saturate(_367.y * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _387 = (saturate(_367.z * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _389 = rsqrt(dot(float3(_385, _386, _387), float3(_385, _386, _387)));
      float _390 = _389 * _385;
      float _391 = _389 * _386;
      float _392 = _387 * _389;
      float _395 = (float((uint)((uint)(((uint)((uint)(_364.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
      float _396 = (float((uint)((uint)(_364.w & 255))) * 0.007843137718737125f) + -1.0f;
      float _399 = (_395 + _396) * 0.5f;
      float _400 = (_395 - _396) * 0.5f;
      float _404 = (1.0f - abs(_399)) - abs(_400);
      float _406 = rsqrt(dot(float3(_399, _400, _404), float3(_399, _400, _404)));
      float _407 = _406 * _399;
      float _408 = _406 * _400;
      float _409 = _406 * _404;
      float _411 = select((_392 >= 0.0f), 1.0f, -1.0f);
      float _414 = -0.0f - (1.0f / (_411 + _392));
      float _415 = _391 * _414;
      float _416 = _415 * _390;
      float _417 = _411 * _390;
      float _426 = mad(_409, _390, mad(_408, _416, ((((_417 * _390) * _414) + 1.0f) * _407)));
      float _430 = mad(_409, _391, mad(_408, (_411 + (_415 * _391)), ((_407 * _411) * _416)));
      float _434 = mad(_409, _392, mad(_408, (-0.0f - _391), (-0.0f - (_417 * _407))));
      float _436 = rsqrt(dot(float3(_426, _430, _434), float3(_426, _430, _434)));
      _572 = (exp2(log2(max(0.0f, (_322 + -0.8359375f)) / (18.8515625f - (_322 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
      _573 = (exp2(log2(max(0.0f, (_323 + -0.8359375f)) / (18.8515625f - (_323 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
      _574 = (exp2(log2(max(0.0f, (_324 + -0.8359375f)) / (18.8515625f - (_324 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
      _575 = _354.x;
      _576 = (_436 * _426);
      _577 = (_436 * _430);
      _578 = (_436 * _434);
      break;
    }
    case 2: {
      float4 _443 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_168, _169));
      float _453 = (pow(_443.x, 0.012683313339948654f));
      float _454 = (pow(_443.y, 0.012683313339948654f));
      float _455 = (pow(_443.z, 0.012683313339948654f));
      float _485 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearBlackBorder, float2(_168, _169));
      uint _492 = uint(_bufferSizeAndInvSize.x * _168);
      uint _493 = uint(_bufferSizeAndInvSize.y * _169);
      uint4 _495 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_492), (int)(_493), 0));
      float4 _498 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_492), (int)(_493), 0));
      float _516 = (saturate(_498.x * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _517 = (saturate(_498.y * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _518 = (saturate(_498.z * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _520 = rsqrt(dot(float3(_516, _517, _518), float3(_516, _517, _518)));
      float _521 = _520 * _516;
      float _522 = _520 * _517;
      float _523 = _518 * _520;
      float _526 = (float((uint)((uint)(((uint)((uint)(_495.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
      float _527 = (float((uint)((uint)(_495.w & 255))) * 0.007843137718737125f) + -1.0f;
      float _530 = (_526 + _527) * 0.5f;
      float _531 = (_526 - _527) * 0.5f;
      float _535 = (1.0f - abs(_530)) - abs(_531);
      float _537 = rsqrt(dot(float3(_530, _531, _535), float3(_530, _531, _535)));
      float _538 = _537 * _530;
      float _539 = _537 * _531;
      float _540 = _537 * _535;
      float _542 = select((_523 >= 0.0f), 1.0f, -1.0f);
      float _545 = -0.0f - (1.0f / (_542 + _523));
      float _546 = _522 * _545;
      float _547 = _546 * _521;
      float _548 = _542 * _521;
      float _557 = mad(_540, _521, mad(_539, _547, ((((_548 * _521) * _545) + 1.0f) * _538)));
      float _561 = mad(_540, _522, mad(_539, (_542 + (_546 * _522)), ((_538 * _542) * _547)));
      float _565 = mad(_540, _523, mad(_539, (-0.0f - _522), (-0.0f - (_548 * _538))));
      float _567 = rsqrt(dot(float3(_557, _561, _565), float3(_557, _561, _565)));
      _572 = (exp2(log2(max(0.0f, (_453 + -0.8359375f)) / (18.8515625f - (_453 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
      _573 = (exp2(log2(max(0.0f, (_454 + -0.8359375f)) / (18.8515625f - (_454 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
      _574 = (exp2(log2(max(0.0f, (_455 + -0.8359375f)) / (18.8515625f - (_455 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
      _575 = _485.x;
      _576 = (_567 * _557);
      _577 = (_567 * _561);
      _578 = (_567 * _565);
      break;
    }
    default: {
      _572 = 0.0f;
      _573 = 0.0f;
      _574 = 0.0f;
      _575 = 0.0f;
      _576 = 0.0f;
      _577 = 0.0f;
      _578 = 0.0f;
      break;
    }
  }
  int2 _580; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_580.x, _580.y);
  uint _595 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_580.x))))) + 0.5f) * _168), int((float((int)(int(float((int)(_580.y))))) + 0.5f) * _169), 0));
  int _597 = _595.x & 255;
  bool _600 = ((_575 < 1.0000000116860974e-07f)) || ((_575 == 1.0f));
  int _601 = WaveReadLaneFirst(_materialIndex);
  float _609 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_601 < (uint)170000), _601, 0)) + 0u))]._impactFrame);
  if (!(!(_609 >= 0.0010000000474974513f))) {
    if (!(_597 == _renderPassSelfPlayer)) {
      if (!(_597 == _renderPassTest)) {
        _623 = (_597 == _renderPassTargetFocus);
      } else {
        _623 = true;
      }
    } else {
      _623 = true;
    }
    float _625 = select(_600, 1.0f, select(_623, 0.0f, 1.0f));
    int _626 = WaveReadLaneFirst(_materialIndex);
    float _637 = select((WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_626 < (uint)170000), _626, 0)) + 0u))]._impactFrameInverse) > 0.0010000000474974513f), (1.0f - _625), _625);
    int _638 = WaveReadLaneFirst(_materialIndex);
    float _646 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_638 < (uint)170000), _638, 0)) + 0u))]._impactFrameFresnel);
    float _647 = abs(_646);
    if (!((_600) || ((!(_647 > 0.0f))))) {
      float _662 = abs(1.0f - saturate(dot(float3(_576, _577, _578), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z)))));
      int _668 = WaveReadLaneFirst(_materialIndex);
      _682 = ((saturate(WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_668 < (uint)170000), _668, 0)) + 0u))]._impactFrameFresnelIntensity) * exp2(log2(select((_646 < 0.0f), (1.0f - _662), _662)) * _647)) + 0.0020000000949949026f) * _637);
    } else {
      _682 = _637;
    }
    float _686 = _682 / max(0.0010000000474974513f, _exposure0.x);
    _697 = (lerp(_572, _686, _609));
    _698 = (lerp(_573, _686, _609));
    _699 = (lerp(_574, _686, _609));
  } else {
    _697 = _572;
    _698 = _573;
    _699 = _574;
  }
  int _700 = WaveReadLaneFirst(_materialIndex);
  float _708 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_700 < (uint)170000), _700, 0)) + 0u))]._topVignetteRatio);
  int _709 = WaveReadLaneFirst(_materialIndex);
  float _717 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_709 < (uint)170000), _709, 0)) + 0u))]._sideVignetteRatio);
  int _718 = WaveReadLaneFirst(_materialIndex);
  float _726 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_718 < (uint)170000), _718, 0)) + 0u))]._bottomVignetteRatio);
  if (!(!(_717 >= 0.0010000000474974513f))) {
    float _729 = TEXCOORD.x + -0.5f;
    float _730 = TEXCOORD.y + -0.5f;
    int _735 = WaveReadLaneFirst(_materialIndex);
    int _749 = WaveReadLaneFirst(_materialIndex);
    int _763 = WaveReadLaneFirst(_materialIndex);
    int _771 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_763 < (uint)170000), _763, 0)) + 0u))]._sideVignetteColor);
    float _774 = float((uint)((uint)(((uint)((uint)(_771)) >> 16) & 255)));
    float _777 = float((uint)((uint)(((uint)((uint)(_771)) >> 8) & 255)));
    float _779 = float((uint)((uint)(_771 & 255)));
    float _809 = max(0.0010000000474974513f, _exposure0.x);
    float _813 = saturate(exp2(log2(abs(0.5f - TEXCOORD.x)) * WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_749 < (uint)170000), _749, 0)) + 0u))]._sideVignettePower)) * (sqrt((_730 * _730) + (_729 * _729)) / max(0.0010000000474974513f, (1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_735 < (uint)170000), _735, 0)) + 0u))]._sideVignetteRadius))))) * _717;
    _821 = (((select(((_774 * 0.003921568859368563f) < 0.040449999272823334f), (_774 * 0.0003035269910469651f), exp2(log2((_774 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _809) * _813) + _697);
    _822 = (((select(((_777 * 0.003921568859368563f) < 0.040449999272823334f), (_777 * 0.0003035269910469651f), exp2(log2((_777 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _809) * _813) + _698);
    _823 = (((select(((_779 * 0.003921568859368563f) < 0.040449999272823334f), (_779 * 0.0003035269910469651f), exp2(log2((_779 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _809) * _813) + _699);
  } else {
    _821 = _697;
    _822 = _698;
    _823 = _699;
  }
  if (!(!(_708 >= 0.0010000000474974513f))) {
    float _826 = TEXCOORD.x + -0.5f;
    float _827 = TEXCOORD.y + -0.5f;
    int _832 = WaveReadLaneFirst(_materialIndex);
    int _845 = WaveReadLaneFirst(_materialIndex);
    int _859 = WaveReadLaneFirst(_materialIndex);
    int _867 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_859 < (uint)170000), _859, 0)) + 0u))]._topVignetteColor);
    float _870 = float((uint)((uint)(((uint)((uint)(_867)) >> 16) & 255)));
    float _873 = float((uint)((uint)(((uint)((uint)(_867)) >> 8) & 255)));
    float _875 = float((uint)((uint)(_867 & 255)));
    float _905 = max(0.0010000000474974513f, _exposure0.x);
    float _909 = saturate(exp2(log2(1.0f - TEXCOORD.y) * WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_845 < (uint)170000), _845, 0)) + 0u))]._topVignettePower)) * (sqrt((_827 * _827) + (_826 * _826)) / max(0.0010000000474974513f, (1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_832 < (uint)170000), _832, 0)) + 0u))]._topVignetteRadius))))) * _708;
    _917 = (((select(((_870 * 0.003921568859368563f) < 0.040449999272823334f), (_870 * 0.0003035269910469651f), exp2(log2((_870 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _905) * _909) + _821);
    _918 = (((select(((_873 * 0.003921568859368563f) < 0.040449999272823334f), (_873 * 0.0003035269910469651f), exp2(log2((_873 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _905) * _909) + _822);
    _919 = (((select(((_875 * 0.003921568859368563f) < 0.040449999272823334f), (_875 * 0.0003035269910469651f), exp2(log2((_875 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _905) * _909) + _823);
  } else {
    _917 = _821;
    _918 = _822;
    _919 = _823;
  }
  if (!(!(_726 >= 0.0010000000474974513f))) {
    float _922 = TEXCOORD.x + -0.5f;
    float _923 = TEXCOORD.y + -0.5f;
    int _928 = WaveReadLaneFirst(_materialIndex);
    int _940 = WaveReadLaneFirst(_materialIndex);
    int _954 = WaveReadLaneFirst(_materialIndex);
    int _962 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_954 < (uint)170000), _954, 0)) + 0u))]._bottomVignetteColor);
    float _965 = float((uint)((uint)(((uint)((uint)(_962)) >> 16) & 255)));
    float _968 = float((uint)((uint)(((uint)((uint)(_962)) >> 8) & 255)));
    float _970 = float((uint)((uint)(_962 & 255)));
    float _1000 = max(0.0010000000474974513f, _exposure0.x);
    float _1004 = saturate(exp2(log2(TEXCOORD.y) * WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_940 < (uint)170000), _940, 0)) + 0u))]._bottomVignettePower)) * (sqrt((_923 * _923) + (_922 * _922)) / max(0.0010000000474974513f, (1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_928 < (uint)170000), _928, 0)) + 0u))]._bottomVignetteRadius))))) * _726;
    _1012 = (((select(((_965 * 0.003921568859368563f) < 0.040449999272823334f), (_965 * 0.0003035269910469651f), exp2(log2((_965 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _1000) * _1004) + _917);
    _1013 = (((select(((_968 * 0.003921568859368563f) < 0.040449999272823334f), (_968 * 0.0003035269910469651f), exp2(log2((_968 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _1000) * _1004) + _918);
    _1014 = (((select(((_970 * 0.003921568859368563f) < 0.040449999272823334f), (_970 * 0.0003035269910469651f), exp2(log2((_970 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _1000) * _1004) + _919);
  } else {
    _1012 = _917;
    _1013 = _918;
    _1014 = _919;
  }
  int _1015 = WaveReadLaneFirst(_materialIndex);
  float _1023 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_1015 < (uint)170000), _1015, 0)) + 0u))]._chapterTransition);
  if (((_1023 >= 0.0010000000474974513f)) && ((_1023 < 1.0f))) {
    float _1028 = _1023 * 2.0f;
    bool _1029 = (_1028 > 1.0f);
    float _1031 = select(_1029, (_1028 + -1.0f), _1028);
    int _1032 = WaveReadLaneFirst(_materialIndex);
    int _1040 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_1032 < (uint)170000), _1032, 0)) + 0u))]._chapterTransitionNoiseTex);
    float4 _1047 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1040 < (uint)65000), _1040, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
    float _1049 = _1047.x * 0.20000000298023224f;
    float4 _1052 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    float _1062 = (pow(_1052.x, 0.012683313339948654f));
    float _1063 = (pow(_1052.y, 0.012683313339948654f));
    float _1064 = (pow(_1052.z, 0.012683313339948654f));
    float _1089 = exp2(log2(max(0.0f, (_1062 + -0.8359375f)) / (18.8515625f - (_1062 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    float _1090 = exp2(log2(max(0.0f, (_1063 + -0.8359375f)) / (18.8515625f - (_1063 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    float _1091 = exp2(log2(max(0.0f, (_1064 + -0.8359375f)) / (18.8515625f - (_1064 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    int _1092 = WaveReadLaneFirst(_materialIndex);
    float _1103 = (_1031 + -0.5f) * 1.5f;
    float _1105 = _1049 + (TEXCOORD.x - _1103);
    float _1110 = select((_1031 >= 0.8999999761581421f), ((_1031 + -0.8999999761581421f) * 10.0f), 0.0f);
    if (!(WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_1092 < (uint)170000), _1092, 0)) + 0u))]._chapterTransitionUseDivide) == 0.0f)) {
      float _1115 = TEXCOORD.y + 0.44999998807907104f;
      float _1116 = TEXCOORD.y + -0.44999998807907104f;
      int _1125 = WaveReadLaneFirst(_materialIndex);
      int _1133 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_1125 < (uint)170000), _1125, 0)) + 0u))]._chapterTransitionTex);
      float4 _1139 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1133 < (uint)65000), _1133, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(_1105, _1115));
      int _1142 = WaveReadLaneFirst(_materialIndex);
      int _1150 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_1142 < (uint)170000), _1142, 0)) + 0u))]._chapterTransitionTex);
      float4 _1156 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1150 < (uint)65000), _1150, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2((((1.0f - TEXCOORD.x) - _1103) + _1049), _1116));
      float _1160 = saturate((_1156.x * select((((_1116 < 0.0f)) || ((_1116 > 1.0f))), 0.0f, 1.0f)) + (_1139.x * select((((_1115 < 0.0f)) || ((_1115 > 1.0f))), 0.0f, 1.0f)));
      float _1163 = ((1.0f - _1160) * _1110) + _1160;
      if (_1029) {
        _1227 = ((_1163 * (_1012 - _1089)) + _1089);
        _1228 = ((_1163 * (_1013 - _1090)) + _1090);
        _1229 = ((_1163 * (_1014 - _1091)) + _1091);
      } else {
        _1227 = ((_1163 * (_1089 - _1012)) + _1012);
        _1228 = ((_1163 * (_1090 - _1013)) + _1013);
        _1229 = ((_1163 * (_1091 - _1014)) + _1014);
      }
    } else {
      int _1187 = WaveReadLaneFirst(_materialIndex);
      int _1195 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_1187 < (uint)170000), _1187, 0)) + 0u))]._chapterTransitionTex);
      float4 _1201 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1195 < (uint)65000), _1195, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(_1105, ((TEXCOORD.y * 0.949999988079071f) + 0.02500000037252903f)));
      float _1205 = ((1.0f - _1201.x) * _1110) + _1201.x;
      if (_1029) {
        _1227 = ((_1205 * (_1012 - _1089)) + _1089);
        _1228 = ((_1205 * (_1013 - _1090)) + _1090);
        _1229 = ((_1205 * (_1014 - _1091)) + _1091);
      } else {
        _1227 = ((_1205 * (_1089 - _1012)) + _1012);
        _1228 = ((_1205 * (_1090 - _1013)) + _1013);
        _1229 = ((_1205 * (_1091 - _1014)) + _1014);
      }
    }
  } else {
    _1227 = _1012;
    _1228 = _1013;
    _1229 = _1014;
  }
  uint _1230 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _1237 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_1230), 0));
    _1243 = (float((uint)((uint)(_1237.x & 127))) + 0.5f);
  } else {
    _1243 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_1227, _1228, _1229));
    _1611 = output_color.x;
    _1612 = output_color.y;
    _1613 = output_color.z;
  } else {
    _1611 = _1227;
    _1612 = _1228;
    _1613 = _1229;
  }
  if (_etcParams.y > 1.0f) {
    float _1624 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _1625 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _1629 = saturate(1.0f - (dot(float2(_1624, _1625), float2(_1624, _1625)) * saturate(_etcParams.y + -1.0f)));
    _1634 = (_1629 * _1611);
    _1635 = (_1629 * _1612);
    _1636 = (_1629 * _1613);
  } else {
    _1634 = _1611;
    _1635 = _1612;
    _1636 = _1613;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _1669 = select((_1634 <= 0.0031308000907301903f), (_1634 * 12.920000076293945f), (((pow(_1634, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1670 = select((_1635 <= 0.0031308000907301903f), (_1635 * 12.920000076293945f), (((pow(_1635, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1671 = select((_1636 <= 0.0031308000907301903f), (_1636 * 12.920000076293945f), (((pow(_1636, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1669 = _1634;
    _1670 = _1635;
    _1671 = _1636;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _1676 = float((uint)_1230);
    if (!(_1676 < _viewDir.w)) {
      if (!(_1676 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _1685 = _1669;
        _1686 = _1670;
        _1687 = _1671;
      } else {
        _1685 = 0.0f;
        _1686 = 0.0f;
        _1687 = 0.0f;
      }
    } else {
      _1685 = 0.0f;
      _1686 = 0.0f;
      _1687 = 0.0f;
    }
  } else {
    _1685 = _1669;
    _1686 = _1670;
    _1687 = _1671;
  }
  float _1697 = exp2(log2(_1685 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1698 = exp2(log2(_1686 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1699 = exp2(log2(_1687 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_1697 * 18.6875f) + 1.0f)) * ((_1697 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_1698 * 18.6875f) + 1.0f)) * ((_1698 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_1699 * 18.6875f) + 1.0f)) * ((_1699 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _1243;
  return SV_Target;
}

