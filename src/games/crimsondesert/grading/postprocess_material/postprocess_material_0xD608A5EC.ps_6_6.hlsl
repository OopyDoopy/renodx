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
  float _464;
  float _465;
  float _466;
  float _467;
  float _468;
  float _469;
  float _470;
  bool _515;
  float _574;
  float _589;
  float _590;
  float _591;
  float _713;
  float _714;
  float _715;
  float _809;
  float _810;
  float _811;
  float _904;
  float _905;
  float _906;
  float _1083;
  float _1084;
  float _1085;
  float _1099;
  float _1345;
  float _1346;
  float _1347;
  float _1467;
  float _1468;
  float _1469;
  float _1490;
  float _1491;
  float _1492;
  float _1525;
  float _1526;
  float _1527;
  float _1541;
  float _1542;
  float _1543;
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
      float _187 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_168, _169));
      uint _194 = uint(_bufferSizeAndInvSize.x * _168);
      uint _195 = uint(_bufferSizeAndInvSize.y * _169);
      uint4 _197 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_194), (int)(_195), 0));
      float4 _200 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_194), (int)(_195), 0));
      float _218 = (saturate(_200.x * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _219 = (saturate(_200.y * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _220 = (saturate(_200.z * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _222 = rsqrt(dot(float3(_218, _219, _220), float3(_218, _219, _220)));
      float _223 = _222 * _218;
      float _224 = _222 * _219;
      float _225 = _220 * _222;
      float _228 = (float((uint)((uint)(((uint)((uint)(_197.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
      float _229 = (float((uint)((uint)(_197.w & 255))) * 0.007843137718737125f) + -1.0f;
      float _232 = (_228 + _229) * 0.5f;
      float _233 = (_228 - _229) * 0.5f;
      float _237 = (1.0f - abs(_232)) - abs(_233);
      float _239 = rsqrt(dot(float3(_232, _233, _237), float3(_232, _233, _237)));
      float _240 = _239 * _232;
      float _241 = _239 * _233;
      float _242 = _239 * _237;
      float _244 = select((_225 >= 0.0f), 1.0f, -1.0f);
      float _247 = -0.0f - (1.0f / (_244 + _225));
      float _248 = _224 * _247;
      float _249 = _248 * _223;
      float _250 = _244 * _223;
      float _259 = mad(_242, _223, mad(_241, _249, ((((_250 * _223) * _247) + 1.0f) * _240)));
      float _263 = mad(_242, _224, mad(_241, (_244 + (_248 * _224)), ((_240 * _244) * _249)));
      float _267 = mad(_242, _225, mad(_241, (-0.0f - _224), (-0.0f - (_250 * _240))));
      float _269 = rsqrt(dot(float3(_259, _263, _267), float3(_259, _263, _267)));
      _464 = _182.x;
      _465 = _182.y;
      _466 = _182.z;
      _467 = _187.x;
      _468 = (_269 * _259);
      _469 = (_269 * _263);
      _470 = (_269 * _267);
      break;
    }
    case 1: {
      float4 _276 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_168, _169));
      float _282 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearWrap, float2(_168, _169));
      uint _289 = uint(_bufferSizeAndInvSize.x * _168);
      uint _290 = uint(_bufferSizeAndInvSize.y * _169);
      uint4 _292 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_289), (int)(_290), 0));
      float4 _295 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_289), (int)(_290), 0));
      float _313 = (saturate(_295.x * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _314 = (saturate(_295.y * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _315 = (saturate(_295.z * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _317 = rsqrt(dot(float3(_313, _314, _315), float3(_313, _314, _315)));
      float _318 = _317 * _313;
      float _319 = _317 * _314;
      float _320 = _315 * _317;
      float _323 = (float((uint)((uint)(((uint)((uint)(_292.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
      float _324 = (float((uint)((uint)(_292.w & 255))) * 0.007843137718737125f) + -1.0f;
      float _327 = (_323 + _324) * 0.5f;
      float _328 = (_323 - _324) * 0.5f;
      float _332 = (1.0f - abs(_327)) - abs(_328);
      float _334 = rsqrt(dot(float3(_327, _328, _332), float3(_327, _328, _332)));
      float _335 = _334 * _327;
      float _336 = _334 * _328;
      float _337 = _334 * _332;
      float _339 = select((_320 >= 0.0f), 1.0f, -1.0f);
      float _342 = -0.0f - (1.0f / (_339 + _320));
      float _343 = _319 * _342;
      float _344 = _343 * _318;
      float _345 = _339 * _318;
      float _354 = mad(_337, _318, mad(_336, _344, ((((_345 * _318) * _342) + 1.0f) * _335)));
      float _358 = mad(_337, _319, mad(_336, (_339 + (_343 * _319)), ((_335 * _339) * _344)));
      float _362 = mad(_337, _320, mad(_336, (-0.0f - _319), (-0.0f - (_345 * _335))));
      float _364 = rsqrt(dot(float3(_354, _358, _362), float3(_354, _358, _362)));
      _464 = _276.x;
      _465 = _276.y;
      _466 = _276.z;
      _467 = _282.x;
      _468 = (_364 * _354);
      _469 = (_364 * _358);
      _470 = (_364 * _362);
      break;
    }
    case 2: {
      float4 _371 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_168, _169));
      float _377 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearBlackBorder, float2(_168, _169));
      uint _384 = uint(_bufferSizeAndInvSize.x * _168);
      uint _385 = uint(_bufferSizeAndInvSize.y * _169);
      uint4 _387 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_384), (int)(_385), 0));
      float4 _390 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_384), (int)(_385), 0));
      float _408 = (saturate(_390.x * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _409 = (saturate(_390.y * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _410 = (saturate(_390.z * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _412 = rsqrt(dot(float3(_408, _409, _410), float3(_408, _409, _410)));
      float _413 = _412 * _408;
      float _414 = _412 * _409;
      float _415 = _410 * _412;
      float _418 = (float((uint)((uint)(((uint)((uint)(_387.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
      float _419 = (float((uint)((uint)(_387.w & 255))) * 0.007843137718737125f) + -1.0f;
      float _422 = (_418 + _419) * 0.5f;
      float _423 = (_418 - _419) * 0.5f;
      float _427 = (1.0f - abs(_422)) - abs(_423);
      float _429 = rsqrt(dot(float3(_422, _423, _427), float3(_422, _423, _427)));
      float _430 = _429 * _422;
      float _431 = _429 * _423;
      float _432 = _429 * _427;
      float _434 = select((_415 >= 0.0f), 1.0f, -1.0f);
      float _437 = -0.0f - (1.0f / (_434 + _415));
      float _438 = _414 * _437;
      float _439 = _438 * _413;
      float _440 = _434 * _413;
      float _449 = mad(_432, _413, mad(_431, _439, ((((_440 * _413) * _437) + 1.0f) * _430)));
      float _453 = mad(_432, _414, mad(_431, (_434 + (_438 * _414)), ((_430 * _434) * _439)));
      float _457 = mad(_432, _415, mad(_431, (-0.0f - _414), (-0.0f - (_440 * _430))));
      float _459 = rsqrt(dot(float3(_449, _453, _457), float3(_449, _453, _457)));
      _464 = _371.x;
      _465 = _371.y;
      _466 = _371.z;
      _467 = _377.x;
      _468 = (_459 * _449);
      _469 = (_459 * _453);
      _470 = (_459 * _457);
      break;
    }
    default: {
      _464 = 0.0f;
      _465 = 0.0f;
      _466 = 0.0f;
      _467 = 0.0f;
      _468 = 0.0f;
      _469 = 0.0f;
      _470 = 0.0f;
      break;
    }
  }
  int2 _472; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_472.x, _472.y);
  uint _487 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_472.x))))) + 0.5f) * _168), int((float((int)(int(float((int)(_472.y))))) + 0.5f) * _169), 0));
  int _489 = _487.x & 255;
  bool _492 = ((_467 < 1.0000000116860974e-07f)) || ((_467 == 1.0f));
  int _493 = WaveReadLaneFirst(_materialIndex);
  float _501 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_493 < (uint)170000), _493, 0)) + 0u))]._impactFrame);
  if (!(!(_501 >= 0.0010000000474974513f))) {
    if (!(_489 == _renderPassSelfPlayer)) {
      if (!(_489 == _renderPassTest)) {
        _515 = (_489 == _renderPassTargetFocus);
      } else {
        _515 = true;
      }
    } else {
      _515 = true;
    }
    float _517 = select(_492, 1.0f, select(_515, 0.0f, 1.0f));
    int _518 = WaveReadLaneFirst(_materialIndex);
    float _529 = select((WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_518 < (uint)170000), _518, 0)) + 0u))]._impactFrameInverse) > 0.0010000000474974513f), (1.0f - _517), _517);
    int _530 = WaveReadLaneFirst(_materialIndex);
    float _538 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_530 < (uint)170000), _530, 0)) + 0u))]._impactFrameFresnel);
    float _539 = abs(_538);
    if (!((_492) || ((!(_539 > 0.0f))))) {
      float _554 = abs(1.0f - saturate(dot(float3(_468, _469, _470), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z)))));
      int _560 = WaveReadLaneFirst(_materialIndex);
      _574 = ((saturate(WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_560 < (uint)170000), _560, 0)) + 0u))]._impactFrameFresnelIntensity) * exp2(log2(select((_538 < 0.0f), (1.0f - _554), _554)) * _539)) + 0.0020000000949949026f) * _529);
    } else {
      _574 = _529;
    }
    float _578 = _574 / max(0.0010000000474974513f, _exposure0.x);
    _589 = (lerp(_464, _578, _501));
    _590 = (lerp(_465, _578, _501));
    _591 = (lerp(_466, _578, _501));
  } else {
    _589 = _464;
    _590 = _465;
    _591 = _466;
  }
  int _592 = WaveReadLaneFirst(_materialIndex);
  float _600 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_592 < (uint)170000), _592, 0)) + 0u))]._topVignetteRatio);
  int _601 = WaveReadLaneFirst(_materialIndex);
  float _609 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_601 < (uint)170000), _601, 0)) + 0u))]._sideVignetteRatio);
  int _610 = WaveReadLaneFirst(_materialIndex);
  float _618 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_610 < (uint)170000), _610, 0)) + 0u))]._bottomVignetteRatio);
  if (!(!(_609 >= 0.0010000000474974513f))) {
    float _621 = TEXCOORD.x + -0.5f;
    float _622 = TEXCOORD.y + -0.5f;
    int _627 = WaveReadLaneFirst(_materialIndex);
    int _641 = WaveReadLaneFirst(_materialIndex);
    int _655 = WaveReadLaneFirst(_materialIndex);
    int _663 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_655 < (uint)170000), _655, 0)) + 0u))]._sideVignetteColor);
    float _666 = float((uint)((uint)(((uint)((uint)(_663)) >> 16) & 255)));
    float _669 = float((uint)((uint)(((uint)((uint)(_663)) >> 8) & 255)));
    float _671 = float((uint)((uint)(_663 & 255)));
    float _701 = max(0.0010000000474974513f, _exposure0.x);
    float _705 = saturate(exp2(log2(abs(0.5f - TEXCOORD.x)) * WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_641 < (uint)170000), _641, 0)) + 0u))]._sideVignettePower)) * (sqrt((_622 * _622) + (_621 * _621)) / max(0.0010000000474974513f, (1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_627 < (uint)170000), _627, 0)) + 0u))]._sideVignetteRadius))))) * _609;
    _713 = (((select(((_666 * 0.003921568859368563f) < 0.040449999272823334f), (_666 * 0.0003035269910469651f), exp2(log2((_666 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _701) * _705) + _589);
    _714 = (((select(((_669 * 0.003921568859368563f) < 0.040449999272823334f), (_669 * 0.0003035269910469651f), exp2(log2((_669 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _701) * _705) + _590);
    _715 = (((select(((_671 * 0.003921568859368563f) < 0.040449999272823334f), (_671 * 0.0003035269910469651f), exp2(log2((_671 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _701) * _705) + _591);
  } else {
    _713 = _589;
    _714 = _590;
    _715 = _591;
  }
  if (!(!(_600 >= 0.0010000000474974513f))) {
    float _718 = TEXCOORD.x + -0.5f;
    float _719 = TEXCOORD.y + -0.5f;
    int _724 = WaveReadLaneFirst(_materialIndex);
    int _737 = WaveReadLaneFirst(_materialIndex);
    int _751 = WaveReadLaneFirst(_materialIndex);
    int _759 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_751 < (uint)170000), _751, 0)) + 0u))]._topVignetteColor);
    float _762 = float((uint)((uint)(((uint)((uint)(_759)) >> 16) & 255)));
    float _765 = float((uint)((uint)(((uint)((uint)(_759)) >> 8) & 255)));
    float _767 = float((uint)((uint)(_759 & 255)));
    float _797 = max(0.0010000000474974513f, _exposure0.x);
    float _801 = saturate(exp2(log2(1.0f - TEXCOORD.y) * WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_737 < (uint)170000), _737, 0)) + 0u))]._topVignettePower)) * (sqrt((_719 * _719) + (_718 * _718)) / max(0.0010000000474974513f, (1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_724 < (uint)170000), _724, 0)) + 0u))]._topVignetteRadius))))) * _600;
    _809 = (((select(((_762 * 0.003921568859368563f) < 0.040449999272823334f), (_762 * 0.0003035269910469651f), exp2(log2((_762 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _797) * _801) + _713);
    _810 = (((select(((_765 * 0.003921568859368563f) < 0.040449999272823334f), (_765 * 0.0003035269910469651f), exp2(log2((_765 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _797) * _801) + _714);
    _811 = (((select(((_767 * 0.003921568859368563f) < 0.040449999272823334f), (_767 * 0.0003035269910469651f), exp2(log2((_767 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _797) * _801) + _715);
  } else {
    _809 = _713;
    _810 = _714;
    _811 = _715;
  }
  if (!(!(_618 >= 0.0010000000474974513f))) {
    float _814 = TEXCOORD.x + -0.5f;
    float _815 = TEXCOORD.y + -0.5f;
    int _820 = WaveReadLaneFirst(_materialIndex);
    int _832 = WaveReadLaneFirst(_materialIndex);
    int _846 = WaveReadLaneFirst(_materialIndex);
    int _854 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_846 < (uint)170000), _846, 0)) + 0u))]._bottomVignetteColor);
    float _857 = float((uint)((uint)(((uint)((uint)(_854)) >> 16) & 255)));
    float _860 = float((uint)((uint)(((uint)((uint)(_854)) >> 8) & 255)));
    float _862 = float((uint)((uint)(_854 & 255)));
    float _892 = max(0.0010000000474974513f, _exposure0.x);
    float _896 = saturate(exp2(log2(TEXCOORD.y) * WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_832 < (uint)170000), _832, 0)) + 0u))]._bottomVignettePower)) * (sqrt((_815 * _815) + (_814 * _814)) / max(0.0010000000474974513f, (1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_820 < (uint)170000), _820, 0)) + 0u))]._bottomVignetteRadius))))) * _618;
    _904 = (((select(((_857 * 0.003921568859368563f) < 0.040449999272823334f), (_857 * 0.0003035269910469651f), exp2(log2((_857 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _892) * _896) + _809);
    _905 = (((select(((_860 * 0.003921568859368563f) < 0.040449999272823334f), (_860 * 0.0003035269910469651f), exp2(log2((_860 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _892) * _896) + _810);
    _906 = (((select(((_862 * 0.003921568859368563f) < 0.040449999272823334f), (_862 * 0.0003035269910469651f), exp2(log2((_862 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _892) * _896) + _811);
  } else {
    _904 = _809;
    _905 = _810;
    _906 = _811;
  }
  int _907 = WaveReadLaneFirst(_materialIndex);
  float _915 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_907 < (uint)170000), _907, 0)) + 0u))]._chapterTransition);
  if (((_915 >= 0.0010000000474974513f)) && ((_915 < 1.0f))) {
    float _920 = _915 * 2.0f;
    bool _921 = (_920 > 1.0f);
    float _923 = select(_921, (_920 + -1.0f), _920);
    int _924 = WaveReadLaneFirst(_materialIndex);
    int _932 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_924 < (uint)170000), _924, 0)) + 0u))]._chapterTransitionNoiseTex);
    float4 _939 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_932 < (uint)65000), _932, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
    float _941 = _939.x * 0.20000000298023224f;
    float4 _944 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    int _948 = WaveReadLaneFirst(_materialIndex);
    float _959 = (_923 + -0.5f) * 1.5f;
    float _961 = _941 + (TEXCOORD.x - _959);
    float _966 = select((_923 >= 0.8999999761581421f), ((_923 + -0.8999999761581421f) * 10.0f), 0.0f);
    if (!(WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_948 < (uint)170000), _948, 0)) + 0u))]._chapterTransitionUseDivide) == 0.0f)) {
      float _971 = TEXCOORD.y + 0.44999998807907104f;
      float _972 = TEXCOORD.y + -0.44999998807907104f;
      int _981 = WaveReadLaneFirst(_materialIndex);
      int _989 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_981 < (uint)170000), _981, 0)) + 0u))]._chapterTransitionTex);
      float4 _995 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_989 < (uint)65000), _989, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(_961, _971));
      int _998 = WaveReadLaneFirst(_materialIndex);
      int _1006 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_998 < (uint)170000), _998, 0)) + 0u))]._chapterTransitionTex);
      float4 _1012 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1006 < (uint)65000), _1006, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2((((1.0f - TEXCOORD.x) - _959) + _941), _972));
      float _1016 = saturate((_1012.x * select((((_972 < 0.0f)) || ((_972 > 1.0f))), 0.0f, 1.0f)) + (_995.x * select((((_971 < 0.0f)) || ((_971 > 1.0f))), 0.0f, 1.0f)));
      float _1019 = ((1.0f - _1016) * _966) + _1016;
      if (_921) {
        _1083 = ((_1019 * (_904 - _944.x)) + _944.x);
        _1084 = ((_1019 * (_905 - _944.y)) + _944.y);
        _1085 = ((_1019 * (_906 - _944.z)) + _944.z);
      } else {
        _1083 = ((_1019 * (_944.x - _904)) + _904);
        _1084 = ((_1019 * (_944.y - _905)) + _905);
        _1085 = ((_1019 * (_944.z - _906)) + _906);
      }
    } else {
      int _1043 = WaveReadLaneFirst(_materialIndex);
      int _1051 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_1043 < (uint)170000), _1043, 0)) + 0u))]._chapterTransitionTex);
      float4 _1057 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1051 < (uint)65000), _1051, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(_961, ((TEXCOORD.y * 0.949999988079071f) + 0.02500000037252903f)));
      float _1061 = ((1.0f - _1057.x) * _966) + _1057.x;
      if (_921) {
        _1083 = ((_1061 * (_904 - _944.x)) + _944.x);
        _1084 = ((_1061 * (_905 - _944.y)) + _944.y);
        _1085 = ((_1061 * (_906 - _944.z)) + _944.z);
      } else {
        _1083 = ((_1061 * (_944.x - _904)) + _904);
        _1084 = ((_1061 * (_944.y - _905)) + _905);
        _1085 = ((_1061 * (_944.z - _906)) + _906);
      }
    }
  } else {
    _1083 = _904;
    _1084 = _905;
    _1085 = _906;
  }
  uint _1086 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _1093 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_1086), 0));
    _1099 = (float((uint)((uint)(_1093.x & 127))) + 0.5f);
  } else {
    _1099 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_1083, _1084, _1085));
    _1467 = output_color.x;
    _1468 = output_color.y;
    _1469 = output_color.z;
  } else {
    _1467 = _1083;
    _1468 = _1084;
    _1469 = _1085;
  }
  if (_etcParams.y > 1.0f) {
    float _1480 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _1481 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _1485 = saturate(1.0f - (dot(float2(_1480, _1481), float2(_1480, _1481)) * saturate(_etcParams.y + -1.0f)));
    _1490 = (_1485 * _1467);
    _1491 = (_1485 * _1468);
    _1492 = (_1485 * _1469);
  } else {
    _1490 = _1467;
    _1491 = _1468;
    _1492 = _1469;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _1525 = select((_1490 <= 0.0031308000907301903f), (_1490 * 12.920000076293945f), (((pow(_1490, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1526 = select((_1491 <= 0.0031308000907301903f), (_1491 * 12.920000076293945f), (((pow(_1491, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1527 = select((_1492 <= 0.0031308000907301903f), (_1492 * 12.920000076293945f), (((pow(_1492, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1525 = _1490;
    _1526 = _1491;
    _1527 = _1492;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _1532 = float((uint)_1086);
    if (!(_1532 < _viewDir.w)) {
      if (!(_1532 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _1541 = _1525;
        _1542 = _1526;
        _1543 = _1527;
      } else {
        _1541 = 0.0f;
        _1542 = 0.0f;
        _1543 = 0.0f;
      }
    } else {
      _1541 = 0.0f;
      _1542 = 0.0f;
      _1543 = 0.0f;
    }
  } else {
    _1541 = _1525;
    _1542 = _1526;
    _1543 = _1527;
  }
  SV_Target.x = _1541;
  SV_Target.y = _1542;
  SV_Target.z = _1543;
  SV_Target.w = _1099;
  return SV_Target;
}

