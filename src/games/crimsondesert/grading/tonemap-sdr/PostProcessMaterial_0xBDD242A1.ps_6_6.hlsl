struct PostProcessBerserk_CDStruct {
  float _scanRadius;
  float _fishEyeIntensity;
  float _bloodLineIntensity;
  float _auraIntensity;
  float _centerMaskWidth;
  float _fireIntensity;
  float _sphereMaskRatio;
  float _fogIntensity;
  float _scanRadiusEnd;
  float _ringMaskRadius;
  float _ringMaskIntensity;
  float _radialBlurIntensity;
  uint _noiseTex;
  uint _noiseTex2;
  uint _distortionTex;
  uint _marbleCrackTex;
  float _sphereMaskEndRatio;
  float _sphereMaskEndNoiseIntensity;
  float _sceneColorDistortionIntensity;
  float _characterMaskIntensity;
  uint _enemyGradientTex;
  uint _enemyMaskColor;
  float _flashRatio;
  uint _paperTex;
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

ConstantBuffer<PostProcessBerserk_CDStruct> BindlessParameters_PostProcessBerserk_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _38 = 1.0f / max(9.999999747378752e-05f, _exposure0.x);
  float _39 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  int _40 = WaveReadLaneFirst(_materialIndex);
  float _48 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_40 < (uint)170000), _40, 0)) + 0u))]._fishEyeIntensity);
  float _69;
  float _106;
  float _107;
  float _110;
  float _111;
  float _455;
  float _456;
  float _457;
  float _517;
  float _625;
  float _626;
  float _627;
  float _648;
  float _649;
  float _650;
  float _1153;
  float _1154;
  float _1155;
  float _1156;
  float _1157;
  float _1175;
  float _1176;
  float _1177;
  float _1178;
  float _1179;
  float _1180;
  float _1181;
  float _1182;
  float _1183;
  float _1248;
  float _1453;
  float _1454;
  float _1455;
  float _1548;
  float _1549;
  float _1550;
  float _1604;
  float _1605;
  float _1606;
  float _1625;
  float _1626;
  float _1627;
  float _1657;
  float _1658;
  float _1659;
  float _1673;
  float _1674;
  float _1675;
  if (!(!(abs(_48) >= 0.0010000000474974513f))) {
    float _54 = (_srcTargetSizeAndInv.x * TEXCOORD.x) / _srcTargetSizeAndInv.x;
    float _55 = (_srcTargetSizeAndInv.y * TEXCOORD.y) / _srcTargetSizeAndInv.x;
    float _56 = 0.5f / _39;
    float _57 = _54 + -0.5f;
    float _58 = _55 - _56;
    float _59 = dot(float2(_57, _58), float2(_57, _58));
    float _60 = sqrt(_59);
    bool _61 = (_48 > 0.0f);
    if (_61) {
      _69 = sqrt(dot(float2(0.5f, _56), float2(0.5f, _56)));
    } else {
      if (!(_39 < 1.0f)) {
        _69 = _56;
      } else {
        _69 = 0.5f;
      }
    }
    if (_61) {
      float _71 = rsqrt(_59);
      float _73 = tan(_60 * _48);
      float _81 = tan(_69 * _48);
      _106 = (((((_69 * _57) * _71) * _73) / _81) + 0.5f);
      _107 = (((((_69 * _58) * _71) * _73) / _81) + _56);
    } else {
      if (_48 < 0.0f) {
        float _89 = rsqrt(_59);
        float _90 = _48 * -10.0f;
        float _92 = atan(_60 * _90);
        float _100 = atan(_69 * _90);
        _106 = (((((_69 * _57) * _89) * _92) / _100) + 0.5f);
        _107 = (((((_69 * _58) * _89) * _92) / _100) + _56);
      } else {
        _106 = _54;
        _107 = _55;
      }
    }
    _110 = _106;
    _111 = (_107 * _39);
  } else {
    _110 = TEXCOORD.x;
    _111 = TEXCOORD.y;
  }
  float _113 = (_110 * 2.0f) + -1.0f;
  float _115 = 1.0f - (_111 * 2.0f);
  float _118 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_110, _111));
  float _120 = max(1.0000000116860974e-07f, _118.x);
  float _156 = mad((_invViewProj[3].z), _120, mad((_invViewProj[3].y), _115, ((_invViewProj[3].x) * _113))) + (_invViewProj[3].w);
  float _157 = (mad((_invViewProj[0].z), _120, mad((_invViewProj[0].y), _115, ((_invViewProj[0].x) * _113))) + (_invViewProj[0].w)) / _156;
  float _158 = (mad((_invViewProj[1].z), _120, mad((_invViewProj[1].y), _115, ((_invViewProj[1].x) * _113))) + (_invViewProj[1].w)) / _156;
  float _159 = (mad((_invViewProj[2].z), _120, mad((_invViewProj[2].y), _115, ((_invViewProj[2].x) * _113))) + (_invViewProj[2].w)) / _156;
  float _195 = mad((_invViewProjRelative[3].z), _120, mad((_invViewProjRelative[3].y), _115, ((_invViewProjRelative[3].x) * _113))) + (_invViewProjRelative[3].w);
  uint2 _207 = __3__36__0__0__g_stencil.Load(int3((int)(uint(_bufferSizeAndInvSize.x * _110)), (int)(uint(_bufferSizeAndInvSize.y * _111)), 0));
  float _210 = -0.0f - ((mad((_invViewProjRelative[0].z), _120, mad((_invViewProjRelative[0].y), _115, ((_invViewProjRelative[0].x) * _113))) + (_invViewProjRelative[0].w)) / _195);
  float _211 = -0.0f - ((mad((_invViewProjRelative[1].z), _120, mad((_invViewProjRelative[1].y), _115, ((_invViewProjRelative[1].x) * _113))) + (_invViewProjRelative[1].w)) / _195);
  float _212 = -0.0f - ((mad((_invViewProjRelative[2].z), _120, mad((_invViewProjRelative[2].y), _115, ((_invViewProjRelative[2].x) * _113))) + (_invViewProjRelative[2].w)) / _195);
  float _214 = rsqrt(dot(float3(_210, _211, _212), float3(_210, _211, _212)));
  float _215 = _214 * _210;
  float _216 = _214 * _211;
  float _217 = _214 * _212;
  float4 _219 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_110, _111));
  float _227 = (pow(_219.x, 0.012683313339948654f));
  float _228 = (pow(_219.y, 0.012683313339948654f));
  float _246 = exp2(log2(max(0.0f, (_228 + -0.8359375f)) / (18.8515625f - (_228 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  int _252 = WaveReadLaneFirst(_materialIndex);
  float _261 = ((((1.0f - TEXCOORD.x) * TEXCOORD.x) * TEXCOORD.y) * (1.0f - TEXCOORD.y)) * WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_252 < (uint)170000), _252, 0)) + 0u))]._centerMaskWidth);
  float _272 = _261 * 25.0f;
  float _275 = TEXCOORD.x + -0.5f;
  float _276 = TEXCOORD.y + -0.5f;
  float _277 = abs(_275);
  float _278 = abs(_276);
  float _282 = min(_277, _278) / max(max(_277, _278), 9.99999993922529e-09f);
  float _283 = _282 * _282;
  float _290 = ((_283 * _282) * (((0.15931421518325806f - (_283 * 0.046496473252773285f)) * _283) + -0.32762277126312256f)) + _282;
  float _293 = select((_278 > _277), (1.5707963705062866f - _290), _290);
  float _296 = select((_275 < 0.0f), (3.1415927410125732f - _293), _293);
  float _303 = sqrt((_276 * _276) + (_275 * _275));
  float _304 = select((_276 < 0.0f), (-0.0f - _296), _296) * 0.9549295902252197f;
  int _307 = WaveReadLaneFirst(_materialIndex);
  int _315 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_307 < (uint)170000), _307, 0)) + 0u))]._noiseTex);
  float4 _322 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_315 < (uint)65000), _315, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_217, (_216 + (_time.x * 0.05000000074505806f))));
  int _327 = WaveReadLaneFirst(_materialIndex);
  int _335 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_327 < (uint)170000), _327, 0)) + 0u))]._noiseTex);
  float4 _342 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_335 < (uint)65000), _335, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_216 + (_time.x * 0.15000000596046448f)), _215));
  float _345 = _342.x + _322.x;
  float _346 = _342.y + _322.y;
  float _348 = abs(dot(float3(_215, _216, _217), float3(0.0f, 1.0f, 0.0f)));
  float _350 = abs(dot(float3(_215, _216, _217), float3(0.0f, 0.0f, 1.0f)));
  float _351 = _345 * _348;
  float _352 = _346 * _348;
  float _357 = (_351 * _350) + (_345 - _351);
  int _363 = WaveReadLaneFirst(_materialIndex);
  float _371 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_363 < (uint)170000), _363, 0)) + 0u))]._sceneColorDistortionIntensity);
  float4 _374 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_110, _111));
  float _384 = (pow(_374.x, 0.012683313339948654f));
  float _385 = (pow(_374.y, 0.012683313339948654f));
  float _386 = (pow(_374.z, 0.012683313339948654f));
  if (_371 > 9.999999747378752e-05f) {
    float4 _417 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(((_371 * ((_357 * 2.0f) + -0.9960784316062927f)) + _110), ((_371 * ((((_352 * _350) + (_346 - _352)) * 2.0f) + -0.9960784316062927f)) + _111)));
    float _427 = (pow(_417.x, 0.012683313339948654f));
    float _428 = (pow(_417.y, 0.012683313339948654f));
    float _429 = (pow(_417.z, 0.012683313339948654f));
    _455 = exp2(log2(max(0.0f, (_427 + -0.8359375f)) / (18.8515625f - (_427 * 18.6875f))) * 6.277394771575928f);
    _456 = exp2(log2(max(0.0f, (_428 + -0.8359375f)) / (18.8515625f - (_428 * 18.6875f))) * 6.277394771575928f);
    _457 = exp2(log2(max(0.0f, (_429 + -0.8359375f)) / (18.8515625f - (_429 * 18.6875f))) * 6.277394771575928f);
  } else {
    _455 = exp2(log2(max(0.0f, (_384 + -0.8359375f)) / (18.8515625f - (_384 * 18.6875f))) * 6.277394771575928f);
    _456 = exp2(log2(max(0.0f, (_385 + -0.8359375f)) / (18.8515625f - (_385 * 18.6875f))) * 6.277394771575928f);
    _457 = exp2(log2(max(0.0f, (_386 + -0.8359375f)) / (18.8515625f - (_386 * 18.6875f))) * 6.277394771575928f);
  }
  float _458 = _457 * 10000.0f;
  float _459 = _456 * 10000.0f;
  float _460 = _455 * 10000.0f;
  float _477 = frac(frac(dot(float2(float((int)(int((_bufferSizeAndInvSize.x + -1.0f) * saturate(_110)))), float((int)(int((_bufferSizeAndInvSize.y + -1.0f) * saturate(_111))))), float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f);
  int _483 = WaveReadLaneFirst(_materialIndex);
  float _491 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_483 < (uint)170000), _483, 0)) + 0u))]._fireIntensity);
  if (_491 > 9.999999747378752e-05f) {
    float _495 = _491 * ((((_357 + -0.4000000059604645f) * 6.6666669845581055f) + -1.0f) * 0.20000000298023224f);
    float4 _502 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(((_495 * (_477 + -0.5f)) + _110), ((_495 * (0.5f - _477)) + _111)));
    float _506 = (pow(_502.x, 0.012683313339948654f));
    _517 = (exp2(log2(max(0.0f, (_506 + -0.8359375f)) / (18.8515625f - (_506 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
  } else {
    _517 = (exp2(log2(max(0.0f, (_227 + -0.8359375f)) / (18.8515625f - (_227 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
  }
  float _523 = ((dot(float3(_460, _459, _458), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f)) - _246) * saturate(_272 * _272)) + _246;
  float _534 = _time.x * 0.125f;
  int _536 = WaveReadLaneFirst(_materialIndex);
  int _544 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_536 < (uint)170000), _536, 0)) + 0u))]._distortionTex);
  float4 _551 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_544 < (uint)65000), _544, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_304, (_303 + _534)));
  float _554 = _551.x * 0.20000000298023224f;
  float _555 = _551.y * 0.20000000298023224f;
  int _559 = WaveReadLaneFirst(_materialIndex);
  int _567 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_559 < (uint)170000), _559, 0)) + 0u))]._marbleCrackTex);
  float4 _574 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_567 < (uint)65000), _567, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_554 + _304), ((_303 - (_time.x * 0.25f)) + _554)));
  int _579 = WaveReadLaneFirst(_materialIndex);
  int _587 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_579 < (uint)170000), _579, 0)) + 0u))]._marbleCrackTex);
  float4 _594 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_587 < (uint)65000), _587, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_555 + _304), ((_303 - _534) + _555)));
  int _599 = WaveReadLaneFirst(_materialIndex);
  float _607 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_599 < (uint)170000), _599, 0)) + 0u))]._auraIntensity);
  float _610 = saturate((_219.w + -0.10000000149011612f) * 1.1111111640930176f);
  float _616 = ((_610 * _610) * (1.0f - saturate(exp2(log2(_261 * 15.0f) * 0.07000000029802322f)))) * (3.0f - (_610 * 2.0f));
  if (_607 > 9.999999747378752e-05f) {
    float _620 = _616 * (_607 * _38);
    _625 = (_620 * 0.3185468018054962f);
    _626 = (_620 * 0.033104754984378815f);
    _627 = (_620 * 0.010022826492786407f);
  } else {
    _625 = 0.0f;
    _626 = 0.0f;
    _627 = 0.0f;
  }
  int _628 = WaveReadLaneFirst(_materialIndex);
  float _636 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_628 < (uint)170000), _628, 0)) + 0u))]._bloodLineIntensity);
  float _640 = saturate(saturate((_594.y * 1.2000000476837158f) + _574.x) - (_261 * 14.0f)) * _616;
  if (_636 > 9.999999747378752e-05f) {
    float _644 = _640 * (_636 * _38);
    _648 = (_644 * 2.5371556282043457f);
    _649 = (_644 * 0.4479884207248688f);
    _650 = 0.0f;
  } else {
    _648 = _640;
    _649 = _640;
    _650 = _640;
  }
  uint _656 = uint(_bufferSizeAndInvSize.x * _110);
  uint _657 = uint(_bufferSizeAndInvSize.y * _111);
  uint4 _659 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_656), (int)(_657), 0));
  float4 _662 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_656), (int)(_657), 0));
  float _680 = (saturate(_662.x * 1.0009784698486328f) * 2.0f) + -1.0f;
  float _681 = (saturate(_662.y * 1.0009784698486328f) * 2.0f) + -1.0f;
  float _682 = (saturate(_662.z * 1.0009784698486328f) * 2.0f) + -1.0f;
  float _684 = rsqrt(dot(float3(_680, _681, _682), float3(_680, _681, _682)));
  float _685 = _684 * _680;
  float _686 = _684 * _681;
  float _687 = _682 * _684;
  float _690 = (float((uint)((uint)(((uint)((uint)(_659.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
  float _691 = (float((uint)((uint)(_659.w & 255))) * 0.007843137718737125f) + -1.0f;
  float _694 = (_690 + _691) * 0.5f;
  float _695 = (_690 - _691) * 0.5f;
  float _699 = (1.0f - abs(_694)) - abs(_695);
  float _701 = rsqrt(dot(float3(_694, _695, _699), float3(_694, _695, _699)));
  float _702 = _701 * _694;
  float _703 = _701 * _695;
  float _704 = _701 * _699;
  float _706 = select((_687 >= 0.0f), 1.0f, -1.0f);
  float _709 = -0.0f - (1.0f / (_706 + _687));
  float _710 = _686 * _709;
  float _711 = _710 * _685;
  float _712 = _706 * _685;
  float _721 = mad(_704, _685, mad(_703, _711, ((((_712 * _685) * _709) + 1.0f) * _702)));
  float _725 = mad(_704, _686, mad(_703, (_706 + (_710 * _686)), ((_702 * _706) * _711)));
  float _729 = mad(_704, _687, mad(_703, (-0.0f - _686), (-0.0f - (_712 * _702))));
  float _731 = rsqrt(dot(float3(_721, _725, _729), float3(_721, _725, _729)));
  int _734 = WaveReadLaneFirst(_materialIndex);
  int _742 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_734 < (uint)170000), _734, 0)) + 0u))]._noiseTex);
  float _748 = _time.x * -0.009999999776482582f;
  float _749 = (_157 * 0.019999999552965164f) + _748;
  float _750 = (_159 * 0.019999999552965164f) + _748;
  float4 _755 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_742 < (uint)65000), _742, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_749, _750));
  float _757 = (_158 * 0.019999999552965164f) + _748;
  float4 _760 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_742 < (uint)65000), _742, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_750, _757));
  float4 _764 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_742 < (uint)65000), _742, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_757, _749));
  float _766 = abs(_731 * _725);
  float _767 = abs(_731 * _729);
  float _770 = (_766 * (_755.x - _760.x)) + _760.x;
  int _775 = WaveReadLaneFirst(_materialIndex);
  int _783 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_775 < (uint)170000), _775, 0)) + 0u))]._noiseTex2);
  float _791 = (saturate(lerp(_770, _764.x, _767)) * 0.30000001192092896f) + (_time.x * 0.10000000149011612f);
  float _792 = _791 + (_157 * 0.10000000149011612f);
  float _793 = _791 + (_159 * 0.10000000149011612f);
  float4 _798 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_783 < (uint)65000), _783, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_792, _793));
  float _800 = _791 + (_158 * 0.10000000149011612f);
  float4 _803 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_783 < (uint)65000), _783, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_793, _800));
  float4 _807 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_783 < (uint)65000), _783, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_800, _792));
  float _811 = ((_798.w - _803.w) * _766) + _803.w;
  float _815 = saturate(lerp(_811, _807.w, _767));
  float _816 = _815 * 3.0f;
  float _825 = _157 - _mainPosition.x;
  float _826 = _158 - _mainPosition.y;
  float _827 = _159 - _mainPosition.z;
  float _836 = 1.0f - saturate(sqrt(((_825 * _825) + (_826 * _826)) + (_827 * _827)) * 0.0020000000949949026f);
  float _839 = (_836 * _836) * (exp2(log2(saturate(_816)) * 5.400000095367432f) * _38);
  int _842 = WaveReadLaneFirst(_materialIndex);
  float _855 = _mainPosition.x - _157;
  float _856 = _mainPosition.y - _158;
  float _857 = _mainPosition.z - _159;
  int _866 = WaveReadLaneFirst(_materialIndex);
  int _879 = WaveReadLaneFirst(_materialIndex);
  float _892 = _mainPosition.x - _157;
  float _893 = _mainPosition.y - _158;
  float _894 = _mainPosition.z - _159;
  int _902 = WaveReadLaneFirst(_materialIndex);
  int _913 = WaveReadLaneFirst(_materialIndex);
  float _925 = saturate((WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_913 < (uint)170000), _913, 0)) + 0u))]._sphereMaskEndRatio) * (((saturate(((1.0f - ((1.0f / max(9.999999747378752e-06f, WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_842 < (uint)170000), _842, 0)) + 0u))]._scanRadius))) * sqrt(dot(float3(_855, _856, _857), float3(_855, _856, _857))))) * 2.500000238418579f) - _816) + -1.0f) * WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_866 < (uint)170000), _866, 0)) + 0u))]._sphereMaskRatio)) + 1.0f)) * saturate((WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_902 < (uint)170000), _902, 0)) + 0u))]._sphereMaskEndNoiseIntensity) * _815) - ((1.0f - ((1.0f / max(9.999999747378752e-06f, WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_879 < (uint)170000), _879, 0)) + 0u))]._scanRadiusEnd))) * sqrt(dot(float3(_892, _893, _894), float3(_892, _893, _894))))) * 1.4285714626312256f)));
  if ((uint)((_207.x & 127) + -53) < (uint)15) {
    float _934 = _219.w * 0.5f;
    int _937 = WaveReadLaneFirst(_materialIndex);
    int _945 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_937 < (uint)170000), _937, 0)) + 0u))]._noiseTex);
    float4 _952 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_945 < (uint)65000), _945, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_934 + ((TEXCOORD.x * 2.0f) * _39)), (_934 + (((_time.x * 0.20000000298023224f) + TEXCOORD.y) * 2.0f))));
    float _954 = _952.x + -0.20000000298023224f;
    int2 _957; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_957.x, _957.y);
    uint _972 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_957.x))))) + 0.5f) * _110), int((float((int)(int(float((int)(_957.y))))) + 0.5f) * _111), 0));
    float _978 = _954 * 0.01874999888241291f;
    uint _986 = uint(_bufferSizeAndInvSize.x * (_978 + _110));
    uint _987 = uint(_bufferSizeAndInvSize.y * (_978 + _111));
    uint4 _989 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_986), (int)(_987), 0));
    float4 _992 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_986), (int)(_987), 0));
    float _1010 = (saturate(_992.x * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _1011 = (saturate(_992.y * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _1012 = (saturate(_992.z * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _1014 = rsqrt(dot(float3(_1010, _1011, _1012), float3(_1010, _1011, _1012)));
    float _1015 = _1014 * _1010;
    float _1016 = _1014 * _1011;
    float _1017 = _1012 * _1014;
    float _1020 = (float((uint)((uint)(((uint)((uint)(_989.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
    float _1021 = (float((uint)((uint)(_989.w & 255))) * 0.007843137718737125f) + -1.0f;
    float _1024 = (_1020 + _1021) * 0.5f;
    float _1025 = (_1020 - _1021) * 0.5f;
    float _1029 = (1.0f - abs(_1024)) - abs(_1025);
    float _1031 = rsqrt(dot(float3(_1024, _1025, _1029), float3(_1024, _1025, _1029)));
    float _1032 = _1031 * _1024;
    float _1033 = _1031 * _1025;
    float _1034 = _1031 * _1029;
    float _1036 = select((_1017 >= 0.0f), 1.0f, -1.0f);
    float _1039 = -0.0f - (1.0f / (_1036 + _1017));
    float _1040 = _1016 * _1039;
    float _1041 = _1040 * _1015;
    float _1042 = _1036 * _1015;
    float _1051 = mad(_1034, _1015, mad(_1033, _1041, ((((_1042 * _1015) * _1039) + 1.0f) * _1032)));
    float _1055 = mad(_1034, _1016, mad(_1033, (_1036 + (_1040 * _1016)), ((_1032 * _1036) * _1041)));
    float _1059 = mad(_1034, _1017, mad(_1033, (-0.0f - _1016), (-0.0f - (_1042 * _1032))));
    float _1061 = rsqrt(dot(float3(_1051, _1055, _1059), float3(_1051, _1055, _1059)));
    float _1062 = _1061 * _1051;
    float _1063 = _1061 * _1055;
    float _1064 = _1061 * _1059;
    float _1069 = _mainPosition.x - _157;
    float _1070 = _mainPosition.y - _158;
    float _1071 = _mainPosition.z - _159;
    float _1076 = saturate(5.000000476837158f - (sqrt(dot(float3(_1069, _1070, _1071), float3(_1069, _1070, _1071))) * 0.1250000149011612f));
    if ((_972.x & 255) == _renderPassEnemy) {
      int _1087 = WaveReadLaneFirst(_materialIndex);
      int _1095 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_1087 < (uint)170000), _1087, 0)) + 0u))]._enemyMaskColor);
      float _1098 = float((uint)((uint)(((uint)((uint)(_1095)) >> 16) & 255)));
      float _1101 = float((uint)((uint)(((uint)((uint)(_1095)) >> 8) & 255)));
      float _1103 = float((uint)((uint)(_1095 & 255)));
      float _1150 = exp2(log2(saturate(_357 * 0.5f)) * 2.4000000953674316f) * (((((_954 * 3.25f) + 1.2999999523162842f) * _38) * _1076) * exp2(log2(abs(dot(float3(_1062, _1063, _1064), float3(_viewDir.x, _viewDir.y, _viewDir.z)))) * 5.0f));
      _1153 = (((select(((_1098 * 0.003921568859368563f) < 0.040449999272823334f), (_1098 * 0.0003035269910469651f), exp2(log2((_1098 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) + -1.0f) * _1076) + 1.0f);
      _1154 = (((select(((_1101 * 0.003921568859368563f) < 0.040449999272823334f), (_1101 * 0.0003035269910469651f), exp2(log2((_1101 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) + -1.0f) * _1076) + 1.0f);
      _1155 = (((select(((_1103 * 0.003921568859368563f) < 0.040449999272823334f), (_1103 * 0.0003035269910469651f), exp2(log2((_1103 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) + -1.0f) * _1076) + 1.0f);
      _1156 = _1150;
      _1157 = (_1150 * 0.15000000596046448f);
    } else {
      _1153 = 1.0f;
      _1154 = 1.0f;
      _1155 = 1.0f;
      _1156 = 0.0f;
      _1157 = 0.0f;
    }
    float _1169 = ((_954 * 1.25f) * exp2(log2(1.0f - abs(dot(float3(_1062, _1063, _1064), float3(_viewDir.x, _viewDir.y, _viewDir.z)))) * 5.0f)) * _38;
    _1175 = 0.0f;
    _1176 = 0.0f;
    _1177 = 0.0f;
    _1178 = 0.0f;
    _1179 = _1153;
    _1180 = _1154;
    _1181 = _1155;
    _1182 = (_1156 + (_1169 * 0.3185468018054962f));
    _1183 = (_1157 + (_1169 * 0.033104754984378815f));
  } else {
    _1175 = (_517 * 0.2632734179496765f);
    _1176 = (_517 * 0.05087609216570854f);
    _1177 = (_839 * 0.07323896884918213f);
    _1178 = (_839 * 0.003935939632356167f);
    _1179 = 1.0f;
    _1180 = 1.0f;
    _1181 = 1.0f;
    _1182 = 0.0f;
    _1183 = 0.0f;
  }
  int _1184 = WaveReadLaneFirst(_materialIndex);
  float _1192 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_1184 < (uint)170000), _1184, 0)) + 0u))]._fogIntensity);
  float _1212 = saturate(saturate(exp2(log2(_261 * 20.0f) * 0.5f)));
  float _1232 = ((((((_625 - _460) + _648) + _1177) + _1182) + ((((_1192 * (((lerp(_460, _523, 0.5f)) * 0.800000011920929f) - _1175)) + _1175) * saturate(_1179 + 0.20000000298023224f)) * _1212)) * _925) + _460;
  float _1233 = ((((((_626 - _459) + _649) + _1178) + _1183) + ((((_1192 * (((lerp(_459, _523, 0.5f)) * 0.800000011920929f) - _1176)) + _1176) * saturate(_1180 + 0.20000000298023224f)) * _1212)) * _925) + _459;
  float _1234 = ((((_627 - _458) + _650) + (((((lerp(_458, _523, 0.5f)) * 0.800000011920929f) * _1192) * saturate(_1181 + 0.20000000298023224f)) * _1212)) * _925) + _458;
  uint _1235 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _1242 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_1235), 0));
    _1248 = (float((uint)((uint)(_1242.x & 127))) + 0.5f);
  } else {
    _1248 = 0.0f;
  }
  bool _1251 = (_localToneMappingParams.w > 0.0f);
  if (_1251) {
    float3 output_color = TonemapReplacer(float3(_1232, _1233, _1234));
    _1604 = output_color.x;
    _1605 = output_color.y;
    _1606 = output_color.z;
  } else {
    _1604 = _1232;
    _1605 = _1233;
    _1606 = _1234;
  }
  if (_etcParams.y > 1.0f) {
    float _1615 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _1616 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _1620 = saturate(1.0f - (dot(float2(_1615, _1616), float2(_1615, _1616)) * saturate(_etcParams.y + -1.0f)));
    _1625 = (_1620 * _1604);
    _1626 = (_1620 * _1605);
    _1627 = (_1620 * _1606);
  } else {
    _1625 = _1604;
    _1626 = _1605;
    _1627 = _1606;
  }
  if ((_1251) && ((_etcParams.z > 0.0f))) {
    _1657 = select((_1625 <= 0.0031308000907301903f), (_1625 * 12.920000076293945f), (((pow(_1625, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1658 = select((_1626 <= 0.0031308000907301903f), (_1626 * 12.920000076293945f), (((pow(_1626, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1659 = select((_1627 <= 0.0031308000907301903f), (_1627 * 12.920000076293945f), (((pow(_1627, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1657 = _1625;
    _1658 = _1626;
    _1659 = _1627;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _1664 = float((uint)_1235);
    if (!(_1664 < _viewDir.w)) {
      if (!(_1664 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _1673 = _1657;
        _1674 = _1658;
        _1675 = _1659;
      } else {
        _1673 = 0.0f;
        _1674 = 0.0f;
        _1675 = 0.0f;
      }
    } else {
      _1673 = 0.0f;
      _1674 = 0.0f;
      _1675 = 0.0f;
    }
  } else {
    _1673 = _1657;
    _1674 = _1658;
    _1675 = _1659;
  }
  float _1685 = exp2(log2(_1673 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1686 = exp2(log2(_1674 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1687 = exp2(log2(_1675 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_1685 * 18.6875f) + 1.0f)) * ((_1685 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_1686 * 18.6875f) + 1.0f)) * ((_1686 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_1687 * 18.6875f) + 1.0f)) * ((_1687 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _1248;
  return SV_Target;
}