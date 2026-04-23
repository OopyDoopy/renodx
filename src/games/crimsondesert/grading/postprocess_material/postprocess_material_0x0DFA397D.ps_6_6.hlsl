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
  float _364;
  float _365;
  float _366;
  float _411;
  float _519;
  float _520;
  float _521;
  float _542;
  float _543;
  float _544;
  float _1047;
  float _1048;
  float _1049;
  float _1050;
  float _1051;
  float _1069;
  float _1070;
  float _1071;
  float _1072;
  float _1073;
  float _1074;
  float _1075;
  float _1076;
  float _1077;
  float _1142;
  float _1388;
  float _1389;
  float _1390;
  float _1510;
  float _1511;
  float _1512;
  float _1533;
  float _1534;
  float _1535;
  float _1568;
  float _1569;
  float _1570;
  float _1584;
  float _1585;
  float _1586;
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
  int _227 = WaveReadLaneFirst(_materialIndex);
  float _236 = ((((1.0f - TEXCOORD.x) * TEXCOORD.x) * TEXCOORD.y) * (1.0f - TEXCOORD.y)) * WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_227 < (uint)170000), _227, 0)) + 0u))]._centerMaskWidth);
  float _247 = _236 * 25.0f;
  float _250 = TEXCOORD.x + -0.5f;
  float _251 = TEXCOORD.y + -0.5f;
  float _252 = abs(_250);
  float _253 = abs(_251);
  float _257 = min(_252, _253) / max(max(_252, _253), 9.99999993922529e-09f);
  float _258 = _257 * _257;
  float _265 = ((_258 * _257) * (((0.15931421518325806f - (_258 * 0.046496473252773285f)) * _258) + -0.32762277126312256f)) + _257;
  float _268 = select((_253 > _252), (1.5707963705062866f - _265), _265);
  float _271 = select((_250 < 0.0f), (3.1415927410125732f - _268), _268);
  float _278 = sqrt((_251 * _251) + (_250 * _250));
  float _279 = select((_251 < 0.0f), (-0.0f - _271), _271) * 0.9549295902252197f;
  int _282 = WaveReadLaneFirst(_materialIndex);
  int _290 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_282 < (uint)170000), _282, 0)) + 0u))]._noiseTex);
  float4 _297 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_290 < (uint)65000), _290, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_216, (_215 + (_time.x * 0.05000000074505806f))));
  int _302 = WaveReadLaneFirst(_materialIndex);
  int _310 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_302 < (uint)170000), _302, 0)) + 0u))]._noiseTex);
  float4 _317 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_310 < (uint)65000), _310, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_215 + (_time.x * 0.15000000596046448f)), _214));
  float _320 = _317.x + _297.x;
  float _321 = _317.y + _297.y;
  float _323 = abs(dot(float3(_214, _215, _216), float3(0.0f, 1.0f, 0.0f)));
  float _325 = abs(dot(float3(_214, _215, _216), float3(0.0f, 0.0f, 1.0f)));
  float _326 = _320 * _323;
  float _327 = _321 * _323;
  float _332 = (_326 * _325) + (_320 - _326);
  int _338 = WaveReadLaneFirst(_materialIndex);
  float _346 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_338 < (uint)170000), _338, 0)) + 0u))]._sceneColorDistortionIntensity);
  float4 _349 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_109, _110));
  if (_346 > 9.999999747378752e-05f) {
    float4 _359 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(((_346 * ((_332 * 2.0f) + -0.9960784316062927f)) + _109), ((_346 * ((((_327 * _325) + (_321 - _327)) * 2.0f) + -0.9960784316062927f)) + _110)));
    _364 = _359.x;
    _365 = _359.y;
    _366 = _359.z;
  } else {
    _364 = _349.x;
    _365 = _349.y;
    _366 = _349.z;
  }
  float _383 = frac(frac(dot(float2(float((int)(int((_bufferSizeAndInvSize.x + -1.0f) * saturate(_109)))), float((int)(int((_bufferSizeAndInvSize.y + -1.0f) * saturate(_110))))), float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f);
  int _389 = WaveReadLaneFirst(_materialIndex);
  float _397 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_389 < (uint)170000), _389, 0)) + 0u))]._fireIntensity);
  if (_397 > 9.999999747378752e-05f) {
    float _401 = _397 * ((((_332 + -0.4000000059604645f) * 6.6666669845581055f) + -1.0f) * 0.20000000298023224f);
    float4 _408 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(((_401 * (_383 + -0.5f)) + _109), ((_401 * (0.5f - _383)) + _110)));
    _411 = _408.x;
  } else {
    _411 = _218.x;
  }
  float _417 = ((dot(float3(_364, _365, _366), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f)) - _218.y) * saturate(_247 * _247)) + _218.y;
  float _428 = _time.x * 0.125f;
  int _430 = WaveReadLaneFirst(_materialIndex);
  int _438 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_430 < (uint)170000), _430, 0)) + 0u))]._distortionTex);
  float4 _445 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_438 < (uint)65000), _438, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_279, (_278 + _428)));
  float _448 = _445.x * 0.20000000298023224f;
  float _449 = _445.y * 0.20000000298023224f;
  int _453 = WaveReadLaneFirst(_materialIndex);
  int _461 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_453 < (uint)170000), _453, 0)) + 0u))]._marbleCrackTex);
  float4 _468 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_461 < (uint)65000), _461, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_448 + _279), ((_278 - (_time.x * 0.25f)) + _448)));
  int _473 = WaveReadLaneFirst(_materialIndex);
  int _481 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_473 < (uint)170000), _473, 0)) + 0u))]._marbleCrackTex);
  float4 _488 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_481 < (uint)65000), _481, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_449 + _279), ((_278 - _428) + _449)));
  int _493 = WaveReadLaneFirst(_materialIndex);
  float _501 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_493 < (uint)170000), _493, 0)) + 0u))]._auraIntensity);
  float _504 = saturate((_218.w + -0.10000000149011612f) * 1.1111111640930176f);
  float _510 = ((_504 * _504) * (1.0f - saturate(exp2(log2(_236 * 15.0f) * 0.07000000029802322f)))) * (3.0f - (_504 * 2.0f));
  if (_501 > 9.999999747378752e-05f) {
    float _514 = _510 * (_501 * _37);
    _519 = (_514 * 0.3185468018054962f);
    _520 = (_514 * 0.033104754984378815f);
    _521 = (_514 * 0.010022826492786407f);
  } else {
    _519 = 0.0f;
    _520 = 0.0f;
    _521 = 0.0f;
  }
  int _522 = WaveReadLaneFirst(_materialIndex);
  float _530 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_522 < (uint)170000), _522, 0)) + 0u))]._bloodLineIntensity);
  float _534 = saturate(saturate((_488.y * 1.2000000476837158f) + _468.x) - (_236 * 14.0f)) * _510;
  if (_530 > 9.999999747378752e-05f) {
    float _538 = _534 * (_530 * _37);
    _542 = (_538 * 2.5371556282043457f);
    _543 = (_538 * 0.4479884207248688f);
    _544 = 0.0f;
  } else {
    _542 = _534;
    _543 = _534;
    _544 = _534;
  }
  uint _550 = uint(_bufferSizeAndInvSize.x * _109);
  uint _551 = uint(_bufferSizeAndInvSize.y * _110);
  uint4 _553 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_550), (int)(_551), 0));
  float4 _556 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_550), (int)(_551), 0));
  float _574 = (saturate(_556.x * 1.0009784698486328f) * 2.0f) + -1.0f;
  float _575 = (saturate(_556.y * 1.0009784698486328f) * 2.0f) + -1.0f;
  float _576 = (saturate(_556.z * 1.0009784698486328f) * 2.0f) + -1.0f;
  float _578 = rsqrt(dot(float3(_574, _575, _576), float3(_574, _575, _576)));
  float _579 = _578 * _574;
  float _580 = _578 * _575;
  float _581 = _576 * _578;
  float _584 = (float((uint)((uint)(((uint)((uint)(_553.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
  float _585 = (float((uint)((uint)(_553.w & 255))) * 0.007843137718737125f) + -1.0f;
  float _588 = (_584 + _585) * 0.5f;
  float _589 = (_584 - _585) * 0.5f;
  float _593 = (1.0f - abs(_588)) - abs(_589);
  float _595 = rsqrt(dot(float3(_588, _589, _593), float3(_588, _589, _593)));
  float _596 = _595 * _588;
  float _597 = _595 * _589;
  float _598 = _595 * _593;
  float _600 = select((_581 >= 0.0f), 1.0f, -1.0f);
  float _603 = -0.0f - (1.0f / (_600 + _581));
  float _604 = _580 * _603;
  float _605 = _604 * _579;
  float _606 = _600 * _579;
  float _615 = mad(_598, _579, mad(_597, _605, ((((_606 * _579) * _603) + 1.0f) * _596)));
  float _619 = mad(_598, _580, mad(_597, (_600 + (_604 * _580)), ((_596 * _600) * _605)));
  float _623 = mad(_598, _581, mad(_597, (-0.0f - _580), (-0.0f - (_606 * _596))));
  float _625 = rsqrt(dot(float3(_615, _619, _623), float3(_615, _619, _623)));
  int _628 = WaveReadLaneFirst(_materialIndex);
  int _636 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_628 < (uint)170000), _628, 0)) + 0u))]._noiseTex);
  float _642 = _time.x * -0.009999999776482582f;
  float _643 = (_156 * 0.019999999552965164f) + _642;
  float _644 = (_158 * 0.019999999552965164f) + _642;
  float4 _649 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_636 < (uint)65000), _636, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_643, _644));
  float _651 = (_157 * 0.019999999552965164f) + _642;
  float4 _654 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_636 < (uint)65000), _636, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_644, _651));
  float4 _658 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_636 < (uint)65000), _636, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_651, _643));
  float _660 = abs(_625 * _619);
  float _661 = abs(_625 * _623);
  float _664 = (_660 * (_649.x - _654.x)) + _654.x;
  int _669 = WaveReadLaneFirst(_materialIndex);
  int _677 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_669 < (uint)170000), _669, 0)) + 0u))]._noiseTex2);
  float _685 = (saturate(lerp(_664, _658.x, _661)) * 0.30000001192092896f) + (_time.x * 0.10000000149011612f);
  float _686 = _685 + (_156 * 0.10000000149011612f);
  float _687 = _685 + (_158 * 0.10000000149011612f);
  float4 _692 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_677 < (uint)65000), _677, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_686, _687));
  float _694 = _685 + (_157 * 0.10000000149011612f);
  float4 _697 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_677 < (uint)65000), _677, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_687, _694));
  float4 _701 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_677 < (uint)65000), _677, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_694, _686));
  float _705 = ((_692.w - _697.w) * _660) + _697.w;
  float _709 = saturate(lerp(_705, _701.w, _661));
  float _710 = _709 * 3.0f;
  float _719 = _156 - _mainPosition.x;
  float _720 = _157 - _mainPosition.y;
  float _721 = _158 - _mainPosition.z;
  float _730 = 1.0f - saturate(sqrt(((_719 * _719) + (_720 * _720)) + (_721 * _721)) * 0.0020000000949949026f);
  float _733 = (_730 * _730) * (exp2(log2(saturate(_710)) * 5.400000095367432f) * _37);
  int _736 = WaveReadLaneFirst(_materialIndex);
  float _749 = _mainPosition.x - _156;
  float _750 = _mainPosition.y - _157;
  float _751 = _mainPosition.z - _158;
  int _760 = WaveReadLaneFirst(_materialIndex);
  int _773 = WaveReadLaneFirst(_materialIndex);
  float _786 = _mainPosition.x - _156;
  float _787 = _mainPosition.y - _157;
  float _788 = _mainPosition.z - _158;
  int _796 = WaveReadLaneFirst(_materialIndex);
  int _807 = WaveReadLaneFirst(_materialIndex);
  float _819 = saturate((WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_807 < (uint)170000), _807, 0)) + 0u))]._sphereMaskEndRatio) * (((saturate(((1.0f - ((1.0f / max(9.999999747378752e-06f, WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_736 < (uint)170000), _736, 0)) + 0u))]._scanRadius))) * sqrt(dot(float3(_749, _750, _751), float3(_749, _750, _751))))) * 2.500000238418579f) - _710) + -1.0f) * WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_760 < (uint)170000), _760, 0)) + 0u))]._sphereMaskRatio)) + 1.0f)) * saturate((WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_796 < (uint)170000), _796, 0)) + 0u))]._sphereMaskEndNoiseIntensity) * _709) - ((1.0f - ((1.0f / max(9.999999747378752e-06f, WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_773 < (uint)170000), _773, 0)) + 0u))]._scanRadiusEnd))) * sqrt(dot(float3(_786, _787, _788), float3(_786, _787, _788))))) * 1.4285714626312256f)));
  if ((uint)((_206.x & 127) + -53) < (uint)15) {
    float _828 = _218.w * 0.5f;
    int _831 = WaveReadLaneFirst(_materialIndex);
    int _839 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_831 < (uint)170000), _831, 0)) + 0u))]._noiseTex);
    float4 _846 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_839 < (uint)65000), _839, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_828 + ((TEXCOORD.x * 2.0f) * _38)), (_828 + (((_time.x * 0.20000000298023224f) + TEXCOORD.y) * 2.0f))));
    float _848 = _846.x + -0.20000000298023224f;
    int2 _851; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_851.x, _851.y);
    uint _866 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_851.x))))) + 0.5f) * _109), int((float((int)(int(float((int)(_851.y))))) + 0.5f) * _110), 0));
    float _872 = _848 * 0.01874999888241291f;
    uint _880 = uint(_bufferSizeAndInvSize.x * (_872 + _109));
    uint _881 = uint(_bufferSizeAndInvSize.y * (_872 + _110));
    uint4 _883 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_880), (int)(_881), 0));
    float4 _886 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_880), (int)(_881), 0));
    float _904 = (saturate(_886.x * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _905 = (saturate(_886.y * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _906 = (saturate(_886.z * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _908 = rsqrt(dot(float3(_904, _905, _906), float3(_904, _905, _906)));
    float _909 = _908 * _904;
    float _910 = _908 * _905;
    float _911 = _906 * _908;
    float _914 = (float((uint)((uint)(((uint)((uint)(_883.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
    float _915 = (float((uint)((uint)(_883.w & 255))) * 0.007843137718737125f) + -1.0f;
    float _918 = (_914 + _915) * 0.5f;
    float _919 = (_914 - _915) * 0.5f;
    float _923 = (1.0f - abs(_918)) - abs(_919);
    float _925 = rsqrt(dot(float3(_918, _919, _923), float3(_918, _919, _923)));
    float _926 = _925 * _918;
    float _927 = _925 * _919;
    float _928 = _925 * _923;
    float _930 = select((_911 >= 0.0f), 1.0f, -1.0f);
    float _933 = -0.0f - (1.0f / (_930 + _911));
    float _934 = _910 * _933;
    float _935 = _934 * _909;
    float _936 = _930 * _909;
    float _945 = mad(_928, _909, mad(_927, _935, ((((_936 * _909) * _933) + 1.0f) * _926)));
    float _949 = mad(_928, _910, mad(_927, (_930 + (_934 * _910)), ((_926 * _930) * _935)));
    float _953 = mad(_928, _911, mad(_927, (-0.0f - _910), (-0.0f - (_936 * _926))));
    float _955 = rsqrt(dot(float3(_945, _949, _953), float3(_945, _949, _953)));
    float _956 = _955 * _945;
    float _957 = _955 * _949;
    float _958 = _955 * _953;
    float _963 = _mainPosition.x - _156;
    float _964 = _mainPosition.y - _157;
    float _965 = _mainPosition.z - _158;
    float _970 = saturate(5.000000476837158f - (sqrt(dot(float3(_963, _964, _965), float3(_963, _964, _965))) * 0.1250000149011612f));
    if ((_866.x & 255) == _renderPassEnemy) {
      int _981 = WaveReadLaneFirst(_materialIndex);
      int _989 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_981 < (uint)170000), _981, 0)) + 0u))]._enemyMaskColor);
      float _992 = float((uint)((uint)(((uint)((uint)(_989)) >> 16) & 255)));
      float _995 = float((uint)((uint)(((uint)((uint)(_989)) >> 8) & 255)));
      float _997 = float((uint)((uint)(_989 & 255)));
      float _1044 = exp2(log2(saturate(_332 * 0.5f)) * 2.4000000953674316f) * (((((_848 * 3.25f) + 1.2999999523162842f) * _37) * _970) * exp2(log2(abs(dot(float3(_956, _957, _958), float3(_viewDir.x, _viewDir.y, _viewDir.z)))) * 5.0f));
      _1047 = (((select(((_992 * 0.003921568859368563f) < 0.040449999272823334f), (_992 * 0.0003035269910469651f), exp2(log2((_992 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) + -1.0f) * _970) + 1.0f);
      _1048 = (((select(((_995 * 0.003921568859368563f) < 0.040449999272823334f), (_995 * 0.0003035269910469651f), exp2(log2((_995 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) + -1.0f) * _970) + 1.0f);
      _1049 = (((select(((_997 * 0.003921568859368563f) < 0.040449999272823334f), (_997 * 0.0003035269910469651f), exp2(log2((_997 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) + -1.0f) * _970) + 1.0f);
      _1050 = _1044;
      _1051 = (_1044 * 0.15000000596046448f);
    } else {
      _1047 = 1.0f;
      _1048 = 1.0f;
      _1049 = 1.0f;
      _1050 = 0.0f;
      _1051 = 0.0f;
    }
    float _1063 = ((_848 * 1.25f) * exp2(log2(1.0f - abs(dot(float3(_956, _957, _958), float3(_viewDir.x, _viewDir.y, _viewDir.z)))) * 5.0f)) * _37;
    _1069 = 0.0f;
    _1070 = 0.0f;
    _1071 = 0.0f;
    _1072 = 0.0f;
    _1073 = _1047;
    _1074 = _1048;
    _1075 = _1049;
    _1076 = (_1050 + (_1063 * 0.3185468018054962f));
    _1077 = (_1051 + (_1063 * 0.033104754984378815f));
  } else {
    _1069 = (_411 * 0.2632734179496765f);
    _1070 = (_411 * 0.05087609216570854f);
    _1071 = (_733 * 0.07323896884918213f);
    _1072 = (_733 * 0.003935939632356167f);
    _1073 = 1.0f;
    _1074 = 1.0f;
    _1075 = 1.0f;
    _1076 = 0.0f;
    _1077 = 0.0f;
  }
  int _1078 = WaveReadLaneFirst(_materialIndex);
  float _1086 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_1078 < (uint)170000), _1078, 0)) + 0u))]._fogIntensity);
  float _1106 = saturate(saturate(exp2(log2(_236 * 20.0f) * 0.5f)));
  float _1126 = ((((((_519 - _364) + _542) + _1071) + _1076) + ((((_1086 * (((lerp(_364, _417, 0.5f)) * 0.800000011920929f) - _1069)) + _1069) * saturate(_1073 + 0.20000000298023224f)) * _1106)) * _819) + _364;
  float _1127 = ((((((_520 - _365) + _543) + _1072) + _1077) + ((((_1086 * (((lerp(_365, _417, 0.5f)) * 0.800000011920929f) - _1070)) + _1070) * saturate(_1074 + 0.20000000298023224f)) * _1106)) * _819) + _365;
  float _1128 = ((((_521 - _366) + _544) + (((((lerp(_366, _417, 0.5f)) * 0.800000011920929f) * _1086) * saturate(_1075 + 0.20000000298023224f)) * _1106)) * _819) + _366;
  uint _1129 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _1136 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_1129), 0));
    _1142 = (float((uint)((uint)(_1136.x & 127))) + 0.5f);
  } else {
    _1142 = 0.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_1126, _1127, _1128));
    _1510 = output_color.x;
    _1511 = output_color.y;
    _1512 = output_color.z;
  } else {
    _1510 = _1126;
    _1511 = _1127;
    _1512 = _1128;
  }
  if (_etcParams.y > 1.0f) {
    float _1523 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _1524 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _1528 = saturate(1.0f - (dot(float2(_1523, _1524), float2(_1523, _1524)) * saturate(_etcParams.y + -1.0f)));
    _1533 = (_1528 * _1510);
    _1534 = (_1528 * _1511);
    _1535 = (_1528 * _1512);
  } else {
    _1533 = _1510;
    _1534 = _1511;
    _1535 = _1512;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _1568 = select((_1533 <= 0.0031308000907301903f), (_1533 * 12.920000076293945f), (((pow(_1533, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1569 = select((_1534 <= 0.0031308000907301903f), (_1534 * 12.920000076293945f), (((pow(_1534, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1570 = select((_1535 <= 0.0031308000907301903f), (_1535 * 12.920000076293945f), (((pow(_1535, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1568 = _1533;
    _1569 = _1534;
    _1570 = _1535;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _1575 = float((uint)_1129);
    if (!(_1575 < _viewDir.w)) {
      if (!(_1575 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _1584 = _1568;
        _1585 = _1569;
        _1586 = _1570;
      } else {
        _1584 = 0.0f;
        _1585 = 0.0f;
        _1586 = 0.0f;
      }
    } else {
      _1584 = 0.0f;
      _1585 = 0.0f;
      _1586 = 0.0f;
    }
  } else {
    _1584 = _1568;
    _1585 = _1569;
    _1586 = _1570;
  }
  SV_Target.x = _1584;
  SV_Target.y = _1585;
  SV_Target.z = _1586;
  SV_Target.w = _1142;
  return SV_Target;
}

