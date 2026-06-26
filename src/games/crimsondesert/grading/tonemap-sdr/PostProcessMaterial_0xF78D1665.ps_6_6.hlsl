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
  float _573;
  float _574;
  float _575;
  float _576;
  float _577;
  float _578;
  float _579;
  bool _624;
  float _683;
  float _698;
  float _699;
  float _700;
  float _822;
  float _823;
  float _824;
  float _918;
  float _919;
  float _920;
  float _1013;
  float _1014;
  float _1015;
  float _1228;
  float _1229;
  float _1230;
  float _1244;
  float _1449;
  float _1450;
  float _1451;
  float _1544;
  float _1545;
  float _1546;
  float _1600;
  float _1601;
  float _1602;
  float _1621;
  float _1622;
  float _1623;
  float _1653;
  float _1654;
  float _1655;
  float _1669;
  float _1670;
  float _1671;
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
      float _193 = (pow(_183.x, 0.012683313339948654f));
      float _194 = (pow(_183.y, 0.012683313339948654f));
      float _195 = (pow(_183.z, 0.012683313339948654f));
      float _224 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_169, _170));
      uint _231 = uint(_bufferSizeAndInvSize.x * _169);
      uint _232 = uint(_bufferSizeAndInvSize.y * _170);
      uint4 _234 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_231), (int)(_232), 0));
      float4 _237 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_231), (int)(_232), 0));
      float _255 = (saturate(_237.x * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _256 = (saturate(_237.y * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _257 = (saturate(_237.z * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _259 = rsqrt(dot(float3(_255, _256, _257), float3(_255, _256, _257)));
      float _260 = _259 * _255;
      float _261 = _259 * _256;
      float _262 = _257 * _259;
      float _265 = (float((uint)((uint)(((uint)((uint)(_234.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
      float _266 = (float((uint)((uint)(_234.w & 255))) * 0.007843137718737125f) + -1.0f;
      float _269 = (_265 + _266) * 0.5f;
      float _270 = (_265 - _266) * 0.5f;
      float _274 = (1.0f - abs(_269)) - abs(_270);
      float _276 = rsqrt(dot(float3(_269, _270, _274), float3(_269, _270, _274)));
      float _277 = _276 * _269;
      float _278 = _276 * _270;
      float _279 = _276 * _274;
      float _281 = select((_262 >= 0.0f), 1.0f, -1.0f);
      float _284 = -0.0f - (1.0f / (_281 + _262));
      float _285 = _261 * _284;
      float _286 = _285 * _260;
      float _287 = _281 * _260;
      float _296 = mad(_279, _260, mad(_278, _286, ((((_287 * _260) * _284) + 1.0f) * _277)));
      float _300 = mad(_279, _261, mad(_278, (_281 + (_285 * _261)), ((_277 * _281) * _286)));
      float _304 = mad(_279, _262, mad(_278, (-0.0f - _261), (-0.0f - (_287 * _277))));
      float _306 = rsqrt(dot(float3(_296, _300, _304), float3(_296, _300, _304)));
      _573 = (exp2(log2(max(0.0f, (_193 + -0.8359375f)) / (18.8515625f - (_193 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
      _574 = (exp2(log2(max(0.0f, (_194 + -0.8359375f)) / (18.8515625f - (_194 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
      _575 = (exp2(log2(max(0.0f, (_195 + -0.8359375f)) / (18.8515625f - (_195 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
      _576 = _224.x;
      _577 = (_306 * _296);
      _578 = (_306 * _300);
      _579 = (_306 * _304);
      break;
    }
    case 1: {
      float4 _313 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_169, _170));
      float _323 = (pow(_313.x, 0.012683313339948654f));
      float _324 = (pow(_313.y, 0.012683313339948654f));
      float _325 = (pow(_313.z, 0.012683313339948654f));
      float _355 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearWrap, float2(_169, _170));
      uint _362 = uint(_bufferSizeAndInvSize.x * _169);
      uint _363 = uint(_bufferSizeAndInvSize.y * _170);
      uint4 _365 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_362), (int)(_363), 0));
      float4 _368 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_362), (int)(_363), 0));
      float _386 = (saturate(_368.x * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _387 = (saturate(_368.y * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _388 = (saturate(_368.z * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _390 = rsqrt(dot(float3(_386, _387, _388), float3(_386, _387, _388)));
      float _391 = _390 * _386;
      float _392 = _390 * _387;
      float _393 = _388 * _390;
      float _396 = (float((uint)((uint)(((uint)((uint)(_365.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
      float _397 = (float((uint)((uint)(_365.w & 255))) * 0.007843137718737125f) + -1.0f;
      float _400 = (_396 + _397) * 0.5f;
      float _401 = (_396 - _397) * 0.5f;
      float _405 = (1.0f - abs(_400)) - abs(_401);
      float _407 = rsqrt(dot(float3(_400, _401, _405), float3(_400, _401, _405)));
      float _408 = _407 * _400;
      float _409 = _407 * _401;
      float _410 = _407 * _405;
      float _412 = select((_393 >= 0.0f), 1.0f, -1.0f);
      float _415 = -0.0f - (1.0f / (_412 + _393));
      float _416 = _392 * _415;
      float _417 = _416 * _391;
      float _418 = _412 * _391;
      float _427 = mad(_410, _391, mad(_409, _417, ((((_418 * _391) * _415) + 1.0f) * _408)));
      float _431 = mad(_410, _392, mad(_409, (_412 + (_416 * _392)), ((_408 * _412) * _417)));
      float _435 = mad(_410, _393, mad(_409, (-0.0f - _392), (-0.0f - (_418 * _408))));
      float _437 = rsqrt(dot(float3(_427, _431, _435), float3(_427, _431, _435)));
      _573 = (exp2(log2(max(0.0f, (_323 + -0.8359375f)) / (18.8515625f - (_323 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
      _574 = (exp2(log2(max(0.0f, (_324 + -0.8359375f)) / (18.8515625f - (_324 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
      _575 = (exp2(log2(max(0.0f, (_325 + -0.8359375f)) / (18.8515625f - (_325 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
      _576 = _355.x;
      _577 = (_437 * _427);
      _578 = (_437 * _431);
      _579 = (_437 * _435);
      break;
    }
    case 2: {
      float4 _444 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_169, _170));
      float _454 = (pow(_444.x, 0.012683313339948654f));
      float _455 = (pow(_444.y, 0.012683313339948654f));
      float _456 = (pow(_444.z, 0.012683313339948654f));
      float _486 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearBlackBorder, float2(_169, _170));
      uint _493 = uint(_bufferSizeAndInvSize.x * _169);
      uint _494 = uint(_bufferSizeAndInvSize.y * _170);
      uint4 _496 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_493), (int)(_494), 0));
      float4 _499 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_493), (int)(_494), 0));
      float _517 = (saturate(_499.x * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _518 = (saturate(_499.y * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _519 = (saturate(_499.z * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _521 = rsqrt(dot(float3(_517, _518, _519), float3(_517, _518, _519)));
      float _522 = _521 * _517;
      float _523 = _521 * _518;
      float _524 = _519 * _521;
      float _527 = (float((uint)((uint)(((uint)((uint)(_496.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
      float _528 = (float((uint)((uint)(_496.w & 255))) * 0.007843137718737125f) + -1.0f;
      float _531 = (_527 + _528) * 0.5f;
      float _532 = (_527 - _528) * 0.5f;
      float _536 = (1.0f - abs(_531)) - abs(_532);
      float _538 = rsqrt(dot(float3(_531, _532, _536), float3(_531, _532, _536)));
      float _539 = _538 * _531;
      float _540 = _538 * _532;
      float _541 = _538 * _536;
      float _543 = select((_524 >= 0.0f), 1.0f, -1.0f);
      float _546 = -0.0f - (1.0f / (_543 + _524));
      float _547 = _523 * _546;
      float _548 = _547 * _522;
      float _549 = _543 * _522;
      float _558 = mad(_541, _522, mad(_540, _548, ((((_549 * _522) * _546) + 1.0f) * _539)));
      float _562 = mad(_541, _523, mad(_540, (_543 + (_547 * _523)), ((_539 * _543) * _548)));
      float _566 = mad(_541, _524, mad(_540, (-0.0f - _523), (-0.0f - (_549 * _539))));
      float _568 = rsqrt(dot(float3(_558, _562, _566), float3(_558, _562, _566)));
      _573 = (exp2(log2(max(0.0f, (_454 + -0.8359375f)) / (18.8515625f - (_454 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
      _574 = (exp2(log2(max(0.0f, (_455 + -0.8359375f)) / (18.8515625f - (_455 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
      _575 = (exp2(log2(max(0.0f, (_456 + -0.8359375f)) / (18.8515625f - (_456 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
      _576 = _486.x;
      _577 = (_568 * _558);
      _578 = (_568 * _562);
      _579 = (_568 * _566);
      break;
    }
    default: {
      _573 = 0.0f;
      _574 = 0.0f;
      _575 = 0.0f;
      _576 = 0.0f;
      _577 = 0.0f;
      _578 = 0.0f;
      _579 = 0.0f;
      break;
    }
  }
  int2 _581; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_581.x, _581.y);
  uint _596 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_581.x))))) + 0.5f) * _169), int((float((int)(int(float((int)(_581.y))))) + 0.5f) * _170), 0));
  int _598 = _596.x & 255;
  bool _601 = ((_576 < 1.0000000116860974e-07f)) || ((_576 == 1.0f));
  int _602 = WaveReadLaneFirst(_materialIndex);
  float _610 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_602 < (uint)170000), _602, 0)) + 0u))]._impactFrame);
  if (!(!(_610 >= 0.0010000000474974513f))) {
    if (!(_598 == _renderPassSelfPlayer)) {
      if (!(_598 == _renderPassTest)) {
        _624 = (_598 == _renderPassTargetFocus);
      } else {
        _624 = true;
      }
    } else {
      _624 = true;
    }
    float _626 = select(_601, 1.0f, select(_624, 0.0f, 1.0f));
    int _627 = WaveReadLaneFirst(_materialIndex);
    float _638 = select((WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_627 < (uint)170000), _627, 0)) + 0u))]._impactFrameInverse) > 0.0010000000474974513f), (1.0f - _626), _626);
    int _639 = WaveReadLaneFirst(_materialIndex);
    float _647 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_639 < (uint)170000), _639, 0)) + 0u))]._impactFrameFresnel);
    float _648 = abs(_647);
    if (!((_601) || ((!(_648 > 0.0f))))) {
      float _663 = abs(1.0f - saturate(dot(float3(_577, _578, _579), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z)))));
      int _669 = WaveReadLaneFirst(_materialIndex);
      _683 = ((saturate(WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_669 < (uint)170000), _669, 0)) + 0u))]._impactFrameFresnelIntensity) * exp2(log2(select((_647 < 0.0f), (1.0f - _663), _663)) * _648)) + 0.0020000000949949026f) * _638);
    } else {
      _683 = _638;
    }
    float _687 = _683 / max(0.0010000000474974513f, _exposure0.x);
    _698 = (lerp(_573, _687, _610));
    _699 = (lerp(_574, _687, _610));
    _700 = (lerp(_575, _687, _610));
  } else {
    _698 = _573;
    _699 = _574;
    _700 = _575;
  }
  int _701 = WaveReadLaneFirst(_materialIndex);
  float _709 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_701 < (uint)170000), _701, 0)) + 0u))]._topVignetteRatio);
  int _710 = WaveReadLaneFirst(_materialIndex);
  float _718 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_710 < (uint)170000), _710, 0)) + 0u))]._sideVignetteRatio);
  int _719 = WaveReadLaneFirst(_materialIndex);
  float _727 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_719 < (uint)170000), _719, 0)) + 0u))]._bottomVignetteRatio);
  if (!(!(_718 >= 0.0010000000474974513f))) {
    float _730 = TEXCOORD.x + -0.5f;
    float _731 = TEXCOORD.y + -0.5f;
    int _736 = WaveReadLaneFirst(_materialIndex);
    int _750 = WaveReadLaneFirst(_materialIndex);
    int _764 = WaveReadLaneFirst(_materialIndex);
    int _772 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_764 < (uint)170000), _764, 0)) + 0u))]._sideVignetteColor);
    float _775 = float((uint)((uint)(((uint)((uint)(_772)) >> 16) & 255)));
    float _778 = float((uint)((uint)(((uint)((uint)(_772)) >> 8) & 255)));
    float _780 = float((uint)((uint)(_772 & 255)));
    float _810 = max(0.0010000000474974513f, _exposure0.x);
    float _814 = saturate(exp2(log2(abs(0.5f - TEXCOORD.x)) * WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_750 < (uint)170000), _750, 0)) + 0u))]._sideVignettePower)) * (sqrt((_731 * _731) + (_730 * _730)) / max(0.0010000000474974513f, (1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_736 < (uint)170000), _736, 0)) + 0u))]._sideVignetteRadius))))) * _718;
    _822 = (((select(((_775 * 0.003921568859368563f) < 0.040449999272823334f), (_775 * 0.0003035269910469651f), exp2(log2((_775 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _810) * _814) + _698);
    _823 = (((select(((_778 * 0.003921568859368563f) < 0.040449999272823334f), (_778 * 0.0003035269910469651f), exp2(log2((_778 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _810) * _814) + _699);
    _824 = (((select(((_780 * 0.003921568859368563f) < 0.040449999272823334f), (_780 * 0.0003035269910469651f), exp2(log2((_780 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _810) * _814) + _700);
  } else {
    _822 = _698;
    _823 = _699;
    _824 = _700;
  }
  if (!(!(_709 >= 0.0010000000474974513f))) {
    float _827 = TEXCOORD.x + -0.5f;
    float _828 = TEXCOORD.y + -0.5f;
    int _833 = WaveReadLaneFirst(_materialIndex);
    int _846 = WaveReadLaneFirst(_materialIndex);
    int _860 = WaveReadLaneFirst(_materialIndex);
    int _868 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_860 < (uint)170000), _860, 0)) + 0u))]._topVignetteColor);
    float _871 = float((uint)((uint)(((uint)((uint)(_868)) >> 16) & 255)));
    float _874 = float((uint)((uint)(((uint)((uint)(_868)) >> 8) & 255)));
    float _876 = float((uint)((uint)(_868 & 255)));
    float _906 = max(0.0010000000474974513f, _exposure0.x);
    float _910 = saturate(exp2(log2(1.0f - TEXCOORD.y) * WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_846 < (uint)170000), _846, 0)) + 0u))]._topVignettePower)) * (sqrt((_828 * _828) + (_827 * _827)) / max(0.0010000000474974513f, (1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_833 < (uint)170000), _833, 0)) + 0u))]._topVignetteRadius))))) * _709;
    _918 = (((select(((_871 * 0.003921568859368563f) < 0.040449999272823334f), (_871 * 0.0003035269910469651f), exp2(log2((_871 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _906) * _910) + _822);
    _919 = (((select(((_874 * 0.003921568859368563f) < 0.040449999272823334f), (_874 * 0.0003035269910469651f), exp2(log2((_874 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _906) * _910) + _823);
    _920 = (((select(((_876 * 0.003921568859368563f) < 0.040449999272823334f), (_876 * 0.0003035269910469651f), exp2(log2((_876 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _906) * _910) + _824);
  } else {
    _918 = _822;
    _919 = _823;
    _920 = _824;
  }
  if (!(!(_727 >= 0.0010000000474974513f))) {
    float _923 = TEXCOORD.x + -0.5f;
    float _924 = TEXCOORD.y + -0.5f;
    int _929 = WaveReadLaneFirst(_materialIndex);
    int _941 = WaveReadLaneFirst(_materialIndex);
    int _955 = WaveReadLaneFirst(_materialIndex);
    int _963 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_955 < (uint)170000), _955, 0)) + 0u))]._bottomVignetteColor);
    float _966 = float((uint)((uint)(((uint)((uint)(_963)) >> 16) & 255)));
    float _969 = float((uint)((uint)(((uint)((uint)(_963)) >> 8) & 255)));
    float _971 = float((uint)((uint)(_963 & 255)));
    float _1001 = max(0.0010000000474974513f, _exposure0.x);
    float _1005 = saturate(exp2(log2(TEXCOORD.y) * WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_941 < (uint)170000), _941, 0)) + 0u))]._bottomVignettePower)) * (sqrt((_924 * _924) + (_923 * _923)) / max(0.0010000000474974513f, (1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_929 < (uint)170000), _929, 0)) + 0u))]._bottomVignetteRadius))))) * _727;
    _1013 = (((select(((_966 * 0.003921568859368563f) < 0.040449999272823334f), (_966 * 0.0003035269910469651f), exp2(log2((_966 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _1001) * _1005) + _918);
    _1014 = (((select(((_969 * 0.003921568859368563f) < 0.040449999272823334f), (_969 * 0.0003035269910469651f), exp2(log2((_969 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _1001) * _1005) + _919);
    _1015 = (((select(((_971 * 0.003921568859368563f) < 0.040449999272823334f), (_971 * 0.0003035269910469651f), exp2(log2((_971 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _1001) * _1005) + _920);
  } else {
    _1013 = _918;
    _1014 = _919;
    _1015 = _920;
  }
  int _1016 = WaveReadLaneFirst(_materialIndex);
  float _1024 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_1016 < (uint)170000), _1016, 0)) + 0u))]._chapterTransition);
  if (((_1024 >= 0.0010000000474974513f)) && ((_1024 < 1.0f))) {
    float _1029 = _1024 * 2.0f;
    bool _1030 = (_1029 > 1.0f);
    float _1032 = select(_1030, (_1029 + -1.0f), _1029);
    int _1033 = WaveReadLaneFirst(_materialIndex);
    int _1041 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_1033 < (uint)170000), _1033, 0)) + 0u))]._chapterTransitionNoiseTex);
    float4 _1048 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1041 < (uint)65000), _1041, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
    float _1050 = _1048.x * 0.20000000298023224f;
    float4 _1053 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    float _1063 = (pow(_1053.x, 0.012683313339948654f));
    float _1064 = (pow(_1053.y, 0.012683313339948654f));
    float _1065 = (pow(_1053.z, 0.012683313339948654f));
    float _1090 = exp2(log2(max(0.0f, (_1063 + -0.8359375f)) / (18.8515625f - (_1063 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    float _1091 = exp2(log2(max(0.0f, (_1064 + -0.8359375f)) / (18.8515625f - (_1064 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    float _1092 = exp2(log2(max(0.0f, (_1065 + -0.8359375f)) / (18.8515625f - (_1065 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    int _1093 = WaveReadLaneFirst(_materialIndex);
    float _1104 = (_1032 + -0.5f) * 1.5f;
    float _1106 = _1050 + (TEXCOORD.x - _1104);
    float _1111 = select((_1032 >= 0.8999999761581421f), ((_1032 + -0.8999999761581421f) * 10.0f), 0.0f);
    if (!(WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_1093 < (uint)170000), _1093, 0)) + 0u))]._chapterTransitionUseDivide) == 0.0f)) {
      float _1116 = TEXCOORD.y + 0.44999998807907104f;
      float _1117 = TEXCOORD.y + -0.44999998807907104f;
      int _1126 = WaveReadLaneFirst(_materialIndex);
      int _1134 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_1126 < (uint)170000), _1126, 0)) + 0u))]._chapterTransitionTex);
      float4 _1140 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1134 < (uint)65000), _1134, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(_1106, _1116));
      int _1143 = WaveReadLaneFirst(_materialIndex);
      int _1151 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_1143 < (uint)170000), _1143, 0)) + 0u))]._chapterTransitionTex);
      float4 _1157 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1151 < (uint)65000), _1151, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2((((1.0f - TEXCOORD.x) - _1104) + _1050), _1117));
      float _1161 = saturate((_1157.x * select((((_1117 < 0.0f)) || ((_1117 > 1.0f))), 0.0f, 1.0f)) + (_1140.x * select((((_1116 < 0.0f)) || ((_1116 > 1.0f))), 0.0f, 1.0f)));
      float _1164 = ((1.0f - _1161) * _1111) + _1161;
      if (_1030) {
        _1228 = ((_1164 * (_1013 - _1090)) + _1090);
        _1229 = ((_1164 * (_1014 - _1091)) + _1091);
        _1230 = ((_1164 * (_1015 - _1092)) + _1092);
      } else {
        _1228 = ((_1164 * (_1090 - _1013)) + _1013);
        _1229 = ((_1164 * (_1091 - _1014)) + _1014);
        _1230 = ((_1164 * (_1092 - _1015)) + _1015);
      }
    } else {
      int _1188 = WaveReadLaneFirst(_materialIndex);
      int _1196 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition[((int)((uint)(select(((uint)_1188 < (uint)170000), _1188, 0)) + 0u))]._chapterTransitionTex);
      float4 _1202 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1196 < (uint)65000), _1196, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(_1106, ((TEXCOORD.y * 0.949999988079071f) + 0.02500000037252903f)));
      float _1206 = ((1.0f - _1202.x) * _1111) + _1202.x;
      if (_1030) {
        _1228 = ((_1206 * (_1013 - _1090)) + _1090);
        _1229 = ((_1206 * (_1014 - _1091)) + _1091);
        _1230 = ((_1206 * (_1015 - _1092)) + _1092);
      } else {
        _1228 = ((_1206 * (_1090 - _1013)) + _1013);
        _1229 = ((_1206 * (_1091 - _1014)) + _1014);
        _1230 = ((_1206 * (_1092 - _1015)) + _1015);
      }
    }
  } else {
    _1228 = _1013;
    _1229 = _1014;
    _1230 = _1015;
  }
  uint _1231 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _1238 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_1231), 0));
    _1244 = (float((uint)((uint)(_1238.x & 127))) + 0.5f);
  } else {
    _1244 = 1.0f;
  }
  bool _1247 = (_localToneMappingParams.w > 0.0f);
  if (_1247) {
    float3 output_color = TonemapReplacer(float3(_1228, _1229, _1230));
    _1600 = output_color.x;
    _1601 = output_color.y;
    _1602 = output_color.z;
  } else {
    _1600 = _1228;
    _1601 = _1229;
    _1602 = _1230;
  }
  if (_etcParams.y > 1.0f) {
    float _1611 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _1612 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _1616 = saturate(1.0f - (dot(float2(_1611, _1612), float2(_1611, _1612)) * saturate(_etcParams.y + -1.0f)));
    _1621 = (_1616 * _1600);
    _1622 = (_1616 * _1601);
    _1623 = (_1616 * _1602);
  } else {
    _1621 = _1600;
    _1622 = _1601;
    _1623 = _1602;
  }
  if ((_1247) && ((_etcParams.z > 0.0f))) {
    _1653 = select((_1621 <= 0.0031308000907301903f), (_1621 * 12.920000076293945f), (((pow(_1621, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1654 = select((_1622 <= 0.0031308000907301903f), (_1622 * 12.920000076293945f), (((pow(_1622, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1655 = select((_1623 <= 0.0031308000907301903f), (_1623 * 12.920000076293945f), (((pow(_1623, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1653 = _1621;
    _1654 = _1622;
    _1655 = _1623;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _1660 = float((uint)_1231);
    if (!(_1660 < _viewDir.w)) {
      if (!(_1660 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _1669 = _1653;
        _1670 = _1654;
        _1671 = _1655;
      } else {
        _1669 = 0.0f;
        _1670 = 0.0f;
        _1671 = 0.0f;
      }
    } else {
      _1669 = 0.0f;
      _1670 = 0.0f;
      _1671 = 0.0f;
    }
  } else {
    _1669 = _1653;
    _1670 = _1654;
    _1671 = _1655;
  }
  float _1681 = exp2(log2(_1669 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1682 = exp2(log2(_1670 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1683 = exp2(log2(_1671 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_1681 * 18.6875f) + 1.0f)) * ((_1681 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_1682 * 18.6875f) + 1.0f)) * ((_1682 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_1683 * 18.6875f) + 1.0f)) * ((_1683 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _1244;
  return SV_Target;
}