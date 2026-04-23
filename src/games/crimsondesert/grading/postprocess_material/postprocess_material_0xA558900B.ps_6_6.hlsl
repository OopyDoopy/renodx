#include "../tonemap.hlsli"

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

ConstantBuffer<PostProcessBerserk_CDStruct> BindlessParameters_PostProcessBerserk_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _26[36];
  float _37 = 1.0f / max(9.999999747378752e-05f, _exposure0.x);
  float _38 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  int _39 = WaveReadLaneFirst(_materialIndex);
  float _47 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_39 < (uint)170000), _39, 0)) + 0u))]._fishEyeIntensity);
  float _68;
  float _105;
  float _106;
  float _109;
  float _110;
  float _454;
  float _455;
  float _456;
  float _516;
  float _624;
  float _625;
  float _626;
  float _647;
  float _648;
  float _649;
  float _1152;
  float _1153;
  float _1154;
  float _1155;
  float _1156;
  float _1174;
  float _1175;
  float _1176;
  float _1177;
  float _1178;
  float _1179;
  float _1180;
  float _1181;
  float _1182;
  float _1247;
  float _1493;
  float _1494;
  float _1495;
  float _1615;
  float _1616;
  float _1617;
  float _1638;
  float _1639;
  float _1640;
  float _1673;
  float _1674;
  float _1675;
  float _1689;
  float _1690;
  float _1691;
  if (!(!(abs(_47) >= 0.0010000000474974513f))) {
    float _53 = (_srcTargetSizeAndInv.x * TEXCOORD.x) / _srcTargetSizeAndInv.x;
    float _54 = (_srcTargetSizeAndInv.y * TEXCOORD.y) / _srcTargetSizeAndInv.x;
    float _55 = 0.5f / _38;
    float _56 = _53 + -0.5f;
    float _57 = _54 - _55;
    float _58 = dot(float2(_56, _57), float2(_56, _57));
    float _59 = sqrt(_58);
    bool _60 = (_47 > 0.0f);
    if (_60) {
      _68 = sqrt(dot(float2(0.5f, _55), float2(0.5f, _55)));
    } else {
      if (!(_38 < 1.0f)) {
        _68 = _55;
      } else {
        _68 = 0.5f;
      }
    }
    if (_60) {
      float _70 = rsqrt(_58);
      float _72 = tan(_59 * _47);
      float _80 = tan(_68 * _47);
      _105 = (((((_68 * _56) * _70) * _72) / _80) + 0.5f);
      _106 = (((((_68 * _57) * _70) * _72) / _80) + _55);
    } else {
      if (_47 < 0.0f) {
        float _88 = rsqrt(_58);
        float _89 = _47 * -10.0f;
        float _91 = atan(_59 * _89);
        float _99 = atan(_68 * _89);
        _105 = (((((_68 * _56) * _88) * _91) / _99) + 0.5f);
        _106 = (((((_68 * _57) * _88) * _91) / _99) + _55);
      } else {
        _105 = _53;
        _106 = _54;
      }
    }
    _109 = _105;
    _110 = (_106 * _38);
  } else {
    _109 = TEXCOORD.x;
    _110 = TEXCOORD.y;
  }
  float _112 = (_109 * 2.0f) + -1.0f;
  float _114 = 1.0f - (_110 * 2.0f);
  float _117 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_109, _110));
  float _119 = max(1.0000000116860974e-07f, _117.x);
  float _155 = mad((_invViewProj[3].z), _119, mad((_invViewProj[3].y), _114, ((_invViewProj[3].x) * _112))) + (_invViewProj[3].w);
  float _156 = (mad((_invViewProj[0].z), _119, mad((_invViewProj[0].y), _114, ((_invViewProj[0].x) * _112))) + (_invViewProj[0].w)) / _155;
  float _157 = (mad((_invViewProj[1].z), _119, mad((_invViewProj[1].y), _114, ((_invViewProj[1].x) * _112))) + (_invViewProj[1].w)) / _155;
  float _158 = (mad((_invViewProj[2].z), _119, mad((_invViewProj[2].y), _114, ((_invViewProj[2].x) * _112))) + (_invViewProj[2].w)) / _155;
  float _194 = mad((_invViewProjRelative[3].z), _119, mad((_invViewProjRelative[3].y), _114, ((_invViewProjRelative[3].x) * _112))) + (_invViewProjRelative[3].w);
  uint2 _206 = __3__36__0__0__g_stencil.Load(int3((int)(uint(_bufferSizeAndInvSize.x * _109)), (int)(uint(_bufferSizeAndInvSize.y * _110)), 0));
  float _209 = -0.0f - ((mad((_invViewProjRelative[0].z), _119, mad((_invViewProjRelative[0].y), _114, ((_invViewProjRelative[0].x) * _112))) + (_invViewProjRelative[0].w)) / _194);
  float _210 = -0.0f - ((mad((_invViewProjRelative[1].z), _119, mad((_invViewProjRelative[1].y), _114, ((_invViewProjRelative[1].x) * _112))) + (_invViewProjRelative[1].w)) / _194);
  float _211 = -0.0f - ((mad((_invViewProjRelative[2].z), _119, mad((_invViewProjRelative[2].y), _114, ((_invViewProjRelative[2].x) * _112))) + (_invViewProjRelative[2].w)) / _194);
  float _213 = rsqrt(dot(float3(_209, _210, _211), float3(_209, _210, _211)));
  float _214 = _213 * _209;
  float _215 = _213 * _210;
  float _216 = _213 * _211;
  float4 _218 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_109, _110));
  float _226 = (pow(_218.x, 0.012683313339948654f));
  float _227 = (pow(_218.y, 0.012683313339948654f));
  float _245 = exp2(log2(max(0.0f, (_227 + -0.8359375f)) / (18.8515625f - (_227 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  int _251 = WaveReadLaneFirst(_materialIndex);
  float _260 = ((((1.0f - TEXCOORD.x) * TEXCOORD.x) * TEXCOORD.y) * (1.0f - TEXCOORD.y)) * WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_251 < (uint)170000), _251, 0)) + 0u))]._centerMaskWidth);
  float _271 = _260 * 25.0f;
  float _274 = TEXCOORD.x + -0.5f;
  float _275 = TEXCOORD.y + -0.5f;
  float _276 = abs(_274);
  float _277 = abs(_275);
  float _281 = min(_276, _277) / max(max(_276, _277), 9.99999993922529e-09f);
  float _282 = _281 * _281;
  float _289 = ((_282 * _281) * (((0.15931421518325806f - (_282 * 0.046496473252773285f)) * _282) + -0.32762277126312256f)) + _281;
  float _292 = select((_277 > _276), (1.5707963705062866f - _289), _289);
  float _295 = select((_274 < 0.0f), (3.1415927410125732f - _292), _292);
  float _302 = sqrt((_275 * _275) + (_274 * _274));
  float _303 = select((_275 < 0.0f), (-0.0f - _295), _295) * 0.9549295902252197f;
  int _306 = WaveReadLaneFirst(_materialIndex);
  int _314 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_306 < (uint)170000), _306, 0)) + 0u))]._noiseTex);
  float4 _321 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_314 < (uint)65000), _314, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_216, (_215 + (_time.x * 0.05000000074505806f))));
  int _326 = WaveReadLaneFirst(_materialIndex);
  int _334 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_326 < (uint)170000), _326, 0)) + 0u))]._noiseTex);
  float4 _341 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_334 < (uint)65000), _334, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_215 + (_time.x * 0.15000000596046448f)), _214));
  float _344 = _341.x + _321.x;
  float _345 = _341.y + _321.y;
  float _347 = abs(dot(float3(_214, _215, _216), float3(0.0f, 1.0f, 0.0f)));
  float _349 = abs(dot(float3(_214, _215, _216), float3(0.0f, 0.0f, 1.0f)));
  float _350 = _344 * _347;
  float _351 = _345 * _347;
  float _356 = (_350 * _349) + (_344 - _350);
  int _362 = WaveReadLaneFirst(_materialIndex);
  float _370 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_362 < (uint)170000), _362, 0)) + 0u))]._sceneColorDistortionIntensity);
  float4 _373 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_109, _110));
  float _383 = (pow(_373.x, 0.012683313339948654f));
  float _384 = (pow(_373.y, 0.012683313339948654f));
  float _385 = (pow(_373.z, 0.012683313339948654f));
  if (_370 > 9.999999747378752e-05f) {
    float4 _416 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(((_370 * ((_356 * 2.0f) + -0.9960784316062927f)) + _109), ((_370 * ((((_351 * _349) + (_345 - _351)) * 2.0f) + -0.9960784316062927f)) + _110)));
    float _426 = (pow(_416.x, 0.012683313339948654f));
    float _427 = (pow(_416.y, 0.012683313339948654f));
    float _428 = (pow(_416.z, 0.012683313339948654f));
    _454 = exp2(log2(max(0.0f, (_426 + -0.8359375f)) / (18.8515625f - (_426 * 18.6875f))) * 6.277394771575928f);
    _455 = exp2(log2(max(0.0f, (_427 + -0.8359375f)) / (18.8515625f - (_427 * 18.6875f))) * 6.277394771575928f);
    _456 = exp2(log2(max(0.0f, (_428 + -0.8359375f)) / (18.8515625f - (_428 * 18.6875f))) * 6.277394771575928f);
  } else {
    _454 = exp2(log2(max(0.0f, (_383 + -0.8359375f)) / (18.8515625f - (_383 * 18.6875f))) * 6.277394771575928f);
    _455 = exp2(log2(max(0.0f, (_384 + -0.8359375f)) / (18.8515625f - (_384 * 18.6875f))) * 6.277394771575928f);
    _456 = exp2(log2(max(0.0f, (_385 + -0.8359375f)) / (18.8515625f - (_385 * 18.6875f))) * 6.277394771575928f);
  }
  float _457 = _456 * 10000.0f;
  float _458 = _455 * 10000.0f;
  float _459 = _454 * 10000.0f;
  float _476 = frac(frac(dot(float2(float((int)(int((_bufferSizeAndInvSize.x + -1.0f) * saturate(_109)))), float((int)(int((_bufferSizeAndInvSize.y + -1.0f) * saturate(_110))))), float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f);
  int _482 = WaveReadLaneFirst(_materialIndex);
  float _490 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_482 < (uint)170000), _482, 0)) + 0u))]._fireIntensity);
  if (_490 > 9.999999747378752e-05f) {
    float _494 = _490 * ((((_356 + -0.4000000059604645f) * 6.6666669845581055f) + -1.0f) * 0.20000000298023224f);
    float4 _501 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(((_494 * (_476 + -0.5f)) + _109), ((_494 * (0.5f - _476)) + _110)));
    float _505 = (pow(_501.x, 0.012683313339948654f));
    _516 = (exp2(log2(max(0.0f, (_505 + -0.8359375f)) / (18.8515625f - (_505 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
  } else {
    _516 = (exp2(log2(max(0.0f, (_226 + -0.8359375f)) / (18.8515625f - (_226 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
  }
  float _522 = ((dot(float3(_459, _458, _457), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f)) - _245) * saturate(_271 * _271)) + _245;
  float _533 = _time.x * 0.125f;
  int _535 = WaveReadLaneFirst(_materialIndex);
  int _543 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_535 < (uint)170000), _535, 0)) + 0u))]._distortionTex);
  float4 _550 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_543 < (uint)65000), _543, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_303, (_302 + _533)));
  float _553 = _550.x * 0.20000000298023224f;
  float _554 = _550.y * 0.20000000298023224f;
  int _558 = WaveReadLaneFirst(_materialIndex);
  int _566 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_558 < (uint)170000), _558, 0)) + 0u))]._marbleCrackTex);
  float4 _573 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_566 < (uint)65000), _566, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_553 + _303), ((_302 - (_time.x * 0.25f)) + _553)));
  int _578 = WaveReadLaneFirst(_materialIndex);
  int _586 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_578 < (uint)170000), _578, 0)) + 0u))]._marbleCrackTex);
  float4 _593 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_586 < (uint)65000), _586, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_554 + _303), ((_302 - _533) + _554)));
  int _598 = WaveReadLaneFirst(_materialIndex);
  float _606 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_598 < (uint)170000), _598, 0)) + 0u))]._auraIntensity);
  float _609 = saturate((_218.w + -0.10000000149011612f) * 1.1111111640930176f);
  float _615 = ((_609 * _609) * (1.0f - saturate(exp2(log2(_260 * 15.0f) * 0.07000000029802322f)))) * (3.0f - (_609 * 2.0f));
  if (_606 > 9.999999747378752e-05f) {
    float _619 = _615 * (_606 * _37);
    _624 = (_619 * 0.3185468018054962f);
    _625 = (_619 * 0.033104754984378815f);
    _626 = (_619 * 0.010022826492786407f);
  } else {
    _624 = 0.0f;
    _625 = 0.0f;
    _626 = 0.0f;
  }
  int _627 = WaveReadLaneFirst(_materialIndex);
  float _635 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_627 < (uint)170000), _627, 0)) + 0u))]._bloodLineIntensity);
  float _639 = saturate(saturate((_593.y * 1.2000000476837158f) + _573.x) - (_260 * 14.0f)) * _615;
  if (_635 > 9.999999747378752e-05f) {
    float _643 = _639 * (_635 * _37);
    _647 = (_643 * 2.5371556282043457f);
    _648 = (_643 * 0.4479884207248688f);
    _649 = 0.0f;
  } else {
    _647 = _639;
    _648 = _639;
    _649 = _639;
  }
  uint _655 = uint(_bufferSizeAndInvSize.x * _109);
  uint _656 = uint(_bufferSizeAndInvSize.y * _110);
  uint4 _658 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_655), (int)(_656), 0));
  float4 _661 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_655), (int)(_656), 0));
  float _679 = (saturate(_661.x * 1.0009784698486328f) * 2.0f) + -1.0f;
  float _680 = (saturate(_661.y * 1.0009784698486328f) * 2.0f) + -1.0f;
  float _681 = (saturate(_661.z * 1.0009784698486328f) * 2.0f) + -1.0f;
  float _683 = rsqrt(dot(float3(_679, _680, _681), float3(_679, _680, _681)));
  float _684 = _683 * _679;
  float _685 = _683 * _680;
  float _686 = _681 * _683;
  float _689 = (float((uint)((uint)(((uint)((uint)(_658.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
  float _690 = (float((uint)((uint)(_658.w & 255))) * 0.007843137718737125f) + -1.0f;
  float _693 = (_689 + _690) * 0.5f;
  float _694 = (_689 - _690) * 0.5f;
  float _698 = (1.0f - abs(_693)) - abs(_694);
  float _700 = rsqrt(dot(float3(_693, _694, _698), float3(_693, _694, _698)));
  float _701 = _700 * _693;
  float _702 = _700 * _694;
  float _703 = _700 * _698;
  float _705 = select((_686 >= 0.0f), 1.0f, -1.0f);
  float _708 = -0.0f - (1.0f / (_705 + _686));
  float _709 = _685 * _708;
  float _710 = _709 * _684;
  float _711 = _705 * _684;
  float _720 = mad(_703, _684, mad(_702, _710, ((((_711 * _684) * _708) + 1.0f) * _701)));
  float _724 = mad(_703, _685, mad(_702, (_705 + (_709 * _685)), ((_701 * _705) * _710)));
  float _728 = mad(_703, _686, mad(_702, (-0.0f - _685), (-0.0f - (_711 * _701))));
  float _730 = rsqrt(dot(float3(_720, _724, _728), float3(_720, _724, _728)));
  int _733 = WaveReadLaneFirst(_materialIndex);
  int _741 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_733 < (uint)170000), _733, 0)) + 0u))]._noiseTex);
  float _747 = _time.x * -0.009999999776482582f;
  float _748 = (_156 * 0.019999999552965164f) + _747;
  float _749 = (_158 * 0.019999999552965164f) + _747;
  float4 _754 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_741 < (uint)65000), _741, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_748, _749));
  float _756 = (_157 * 0.019999999552965164f) + _747;
  float4 _759 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_741 < (uint)65000), _741, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_749, _756));
  float4 _763 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_741 < (uint)65000), _741, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_756, _748));
  float _765 = abs(_730 * _724);
  float _766 = abs(_730 * _728);
  float _769 = (_765 * (_754.x - _759.x)) + _759.x;
  int _774 = WaveReadLaneFirst(_materialIndex);
  int _782 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_774 < (uint)170000), _774, 0)) + 0u))]._noiseTex2);
  float _790 = (saturate(lerp(_769, _763.x, _766)) * 0.30000001192092896f) + (_time.x * 0.10000000149011612f);
  float _791 = _790 + (_156 * 0.10000000149011612f);
  float _792 = _790 + (_158 * 0.10000000149011612f);
  float4 _797 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_782 < (uint)65000), _782, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_791, _792));
  float _799 = _790 + (_157 * 0.10000000149011612f);
  float4 _802 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_782 < (uint)65000), _782, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_792, _799));
  float4 _806 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_782 < (uint)65000), _782, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_799, _791));
  float _810 = ((_797.w - _802.w) * _765) + _802.w;
  float _814 = saturate(lerp(_810, _806.w, _766));
  float _815 = _814 * 3.0f;
  float _824 = _156 - _mainPosition.x;
  float _825 = _157 - _mainPosition.y;
  float _826 = _158 - _mainPosition.z;
  float _835 = 1.0f - saturate(sqrt(((_824 * _824) + (_825 * _825)) + (_826 * _826)) * 0.0020000000949949026f);
  float _838 = (_835 * _835) * (exp2(log2(saturate(_815)) * 5.400000095367432f) * _37);
  int _841 = WaveReadLaneFirst(_materialIndex);
  float _854 = _mainPosition.x - _156;
  float _855 = _mainPosition.y - _157;
  float _856 = _mainPosition.z - _158;
  int _865 = WaveReadLaneFirst(_materialIndex);
  int _878 = WaveReadLaneFirst(_materialIndex);
  float _891 = _mainPosition.x - _156;
  float _892 = _mainPosition.y - _157;
  float _893 = _mainPosition.z - _158;
  int _901 = WaveReadLaneFirst(_materialIndex);
  int _912 = WaveReadLaneFirst(_materialIndex);
  float _924 = saturate((WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_912 < (uint)170000), _912, 0)) + 0u))]._sphereMaskEndRatio) * (((saturate(((1.0f - ((1.0f / max(9.999999747378752e-06f, WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_841 < (uint)170000), _841, 0)) + 0u))]._scanRadius))) * sqrt(dot(float3(_854, _855, _856), float3(_854, _855, _856))))) * 2.500000238418579f) - _815) + -1.0f) * WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_865 < (uint)170000), _865, 0)) + 0u))]._sphereMaskRatio)) + 1.0f)) * saturate((WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_901 < (uint)170000), _901, 0)) + 0u))]._sphereMaskEndNoiseIntensity) * _814) - ((1.0f - ((1.0f / max(9.999999747378752e-06f, WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_878 < (uint)170000), _878, 0)) + 0u))]._scanRadiusEnd))) * sqrt(dot(float3(_891, _892, _893), float3(_891, _892, _893))))) * 1.4285714626312256f)));
  if ((uint)((_206.x & 127) + -53) < (uint)15) {
    float _933 = _218.w * 0.5f;
    int _936 = WaveReadLaneFirst(_materialIndex);
    int _944 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_936 < (uint)170000), _936, 0)) + 0u))]._noiseTex);
    float4 _951 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_944 < (uint)65000), _944, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_933 + ((TEXCOORD.x * 2.0f) * _38)), (_933 + (((_time.x * 0.20000000298023224f) + TEXCOORD.y) * 2.0f))));
    float _953 = _951.x + -0.20000000298023224f;
    int2 _956; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_956.x, _956.y);
    uint _971 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_956.x))))) + 0.5f) * _109), int((float((int)(int(float((int)(_956.y))))) + 0.5f) * _110), 0));
    float _977 = _953 * 0.01874999888241291f;
    uint _985 = uint(_bufferSizeAndInvSize.x * (_977 + _109));
    uint _986 = uint(_bufferSizeAndInvSize.y * (_977 + _110));
    uint4 _988 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_985), (int)(_986), 0));
    float4 _991 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_985), (int)(_986), 0));
    float _1009 = (saturate(_991.x * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _1010 = (saturate(_991.y * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _1011 = (saturate(_991.z * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _1013 = rsqrt(dot(float3(_1009, _1010, _1011), float3(_1009, _1010, _1011)));
    float _1014 = _1013 * _1009;
    float _1015 = _1013 * _1010;
    float _1016 = _1011 * _1013;
    float _1019 = (float((uint)((uint)(((uint)((uint)(_988.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
    float _1020 = (float((uint)((uint)(_988.w & 255))) * 0.007843137718737125f) + -1.0f;
    float _1023 = (_1019 + _1020) * 0.5f;
    float _1024 = (_1019 - _1020) * 0.5f;
    float _1028 = (1.0f - abs(_1023)) - abs(_1024);
    float _1030 = rsqrt(dot(float3(_1023, _1024, _1028), float3(_1023, _1024, _1028)));
    float _1031 = _1030 * _1023;
    float _1032 = _1030 * _1024;
    float _1033 = _1030 * _1028;
    float _1035 = select((_1016 >= 0.0f), 1.0f, -1.0f);
    float _1038 = -0.0f - (1.0f / (_1035 + _1016));
    float _1039 = _1015 * _1038;
    float _1040 = _1039 * _1014;
    float _1041 = _1035 * _1014;
    float _1050 = mad(_1033, _1014, mad(_1032, _1040, ((((_1041 * _1014) * _1038) + 1.0f) * _1031)));
    float _1054 = mad(_1033, _1015, mad(_1032, (_1035 + (_1039 * _1015)), ((_1031 * _1035) * _1040)));
    float _1058 = mad(_1033, _1016, mad(_1032, (-0.0f - _1015), (-0.0f - (_1041 * _1031))));
    float _1060 = rsqrt(dot(float3(_1050, _1054, _1058), float3(_1050, _1054, _1058)));
    float _1061 = _1060 * _1050;
    float _1062 = _1060 * _1054;
    float _1063 = _1060 * _1058;
    float _1068 = _mainPosition.x - _156;
    float _1069 = _mainPosition.y - _157;
    float _1070 = _mainPosition.z - _158;
    float _1075 = saturate(5.000000476837158f - (sqrt(dot(float3(_1068, _1069, _1070), float3(_1068, _1069, _1070))) * 0.1250000149011612f));
    if ((_971.x & 255) == _renderPassEnemy) {
      int _1086 = WaveReadLaneFirst(_materialIndex);
      int _1094 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_1086 < (uint)170000), _1086, 0)) + 0u))]._enemyMaskColor);
      float _1097 = float((uint)((uint)(((uint)((uint)(_1094)) >> 16) & 255)));
      float _1100 = float((uint)((uint)(((uint)((uint)(_1094)) >> 8) & 255)));
      float _1102 = float((uint)((uint)(_1094 & 255)));
      float _1149 = exp2(log2(saturate(_356 * 0.5f)) * 2.4000000953674316f) * (((((_953 * 3.25f) + 1.2999999523162842f) * _37) * _1075) * exp2(log2(abs(dot(float3(_1061, _1062, _1063), float3(_viewDir.x, _viewDir.y, _viewDir.z)))) * 5.0f));
      _1152 = (((select(((_1097 * 0.003921568859368563f) < 0.040449999272823334f), (_1097 * 0.0003035269910469651f), exp2(log2((_1097 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) + -1.0f) * _1075) + 1.0f);
      _1153 = (((select(((_1100 * 0.003921568859368563f) < 0.040449999272823334f), (_1100 * 0.0003035269910469651f), exp2(log2((_1100 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) + -1.0f) * _1075) + 1.0f);
      _1154 = (((select(((_1102 * 0.003921568859368563f) < 0.040449999272823334f), (_1102 * 0.0003035269910469651f), exp2(log2((_1102 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) + -1.0f) * _1075) + 1.0f);
      _1155 = _1149;
      _1156 = (_1149 * 0.15000000596046448f);
    } else {
      _1152 = 1.0f;
      _1153 = 1.0f;
      _1154 = 1.0f;
      _1155 = 0.0f;
      _1156 = 0.0f;
    }
    float _1168 = ((_953 * 1.25f) * exp2(log2(1.0f - abs(dot(float3(_1061, _1062, _1063), float3(_viewDir.x, _viewDir.y, _viewDir.z)))) * 5.0f)) * _37;
    _1174 = 0.0f;
    _1175 = 0.0f;
    _1176 = 0.0f;
    _1177 = 0.0f;
    _1178 = _1152;
    _1179 = _1153;
    _1180 = _1154;
    _1181 = (_1155 + (_1168 * 0.3185468018054962f));
    _1182 = (_1156 + (_1168 * 0.033104754984378815f));
  } else {
    _1174 = (_516 * 0.2632734179496765f);
    _1175 = (_516 * 0.05087609216570854f);
    _1176 = (_838 * 0.07323896884918213f);
    _1177 = (_838 * 0.003935939632356167f);
    _1178 = 1.0f;
    _1179 = 1.0f;
    _1180 = 1.0f;
    _1181 = 0.0f;
    _1182 = 0.0f;
  }
  int _1183 = WaveReadLaneFirst(_materialIndex);
  float _1191 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_1183 < (uint)170000), _1183, 0)) + 0u))]._fogIntensity);
  float _1211 = saturate(saturate(exp2(log2(_260 * 20.0f) * 0.5f)));
  float _1231 = ((((((_624 - _459) + _647) + _1176) + _1181) + ((((_1191 * (((lerp(_459, _522, 0.5f)) * 0.800000011920929f) - _1174)) + _1174) * saturate(_1178 + 0.20000000298023224f)) * _1211)) * _924) + _459;
  float _1232 = ((((((_625 - _458) + _648) + _1177) + _1182) + ((((_1191 * (((lerp(_458, _522, 0.5f)) * 0.800000011920929f) - _1175)) + _1175) * saturate(_1179 + 0.20000000298023224f)) * _1211)) * _924) + _458;
  float _1233 = ((((_626 - _457) + _649) + (((((lerp(_457, _522, 0.5f)) * 0.800000011920929f) * _1191) * saturate(_1180 + 0.20000000298023224f)) * _1211)) * _924) + _457;
  uint _1234 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _1241 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_1234), 0));
    _1247 = (float((uint)((uint)(_1241.x & 127))) + 0.5f);
  } else {
    _1247 = 0.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_1231, _1232, _1233));
    _1615 = output_color.x;
    _1616 = output_color.y;
    _1617 = output_color.z;
  } else {
    _1615 = _1231;
    _1616 = _1232;
    _1617 = _1233;
  }
  if (_etcParams.y > 1.0f) {
    float _1628 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _1629 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _1633 = saturate(1.0f - (dot(float2(_1628, _1629), float2(_1628, _1629)) * saturate(_etcParams.y + -1.0f)));
    _1638 = (_1633 * _1615);
    _1639 = (_1633 * _1616);
    _1640 = (_1633 * _1617);
  } else {
    _1638 = _1615;
    _1639 = _1616;
    _1640 = _1617;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _1673 = select((_1638 <= 0.0031308000907301903f), (_1638 * 12.920000076293945f), (((pow(_1638, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1674 = select((_1639 <= 0.0031308000907301903f), (_1639 * 12.920000076293945f), (((pow(_1639, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1675 = select((_1640 <= 0.0031308000907301903f), (_1640 * 12.920000076293945f), (((pow(_1640, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1673 = _1638;
    _1674 = _1639;
    _1675 = _1640;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _1680 = float((uint)_1234);
    if (!(_1680 < _viewDir.w)) {
      if (!(_1680 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _1689 = _1673;
        _1690 = _1674;
        _1691 = _1675;
      } else {
        _1689 = 0.0f;
        _1690 = 0.0f;
        _1691 = 0.0f;
      }
    } else {
      _1689 = 0.0f;
      _1690 = 0.0f;
      _1691 = 0.0f;
    }
  } else {
    _1689 = _1673;
    _1690 = _1674;
    _1691 = _1675;
  }
  float _1701 = exp2(log2(_1689 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1702 = exp2(log2(_1690 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1703 = exp2(log2(_1691 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_1701 * 18.6875f) + 1.0f)) * ((_1701 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_1702 * 18.6875f) + 1.0f)) * ((_1702 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_1703 * 18.6875f) + 1.0f)) * ((_1703 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _1247;
  return SV_Target;
}

