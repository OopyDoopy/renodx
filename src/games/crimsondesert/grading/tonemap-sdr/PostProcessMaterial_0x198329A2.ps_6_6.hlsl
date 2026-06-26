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
  float _365;
  float _366;
  float _367;
  float _412;
  float _520;
  float _521;
  float _522;
  float _543;
  float _544;
  float _545;
  float _1048;
  float _1049;
  float _1050;
  float _1051;
  float _1052;
  float _1070;
  float _1071;
  float _1072;
  float _1073;
  float _1074;
  float _1075;
  float _1076;
  float _1077;
  float _1078;
  float _1143;
  float _1348;
  float _1349;
  float _1350;
  float _1443;
  float _1444;
  float _1445;
  float _1499;
  float _1500;
  float _1501;
  float _1520;
  float _1521;
  float _1522;
  float _1552;
  float _1553;
  float _1554;
  float _1568;
  float _1569;
  float _1570;
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
  int _228 = WaveReadLaneFirst(_materialIndex);
  float _237 = ((((1.0f - TEXCOORD.x) * TEXCOORD.x) * TEXCOORD.y) * (1.0f - TEXCOORD.y)) * WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_228 < (uint)170000), _228, 0)) + 0u))]._centerMaskWidth);
  float _248 = _237 * 25.0f;
  float _251 = TEXCOORD.x + -0.5f;
  float _252 = TEXCOORD.y + -0.5f;
  float _253 = abs(_251);
  float _254 = abs(_252);
  float _258 = min(_253, _254) / max(max(_253, _254), 9.99999993922529e-09f);
  float _259 = _258 * _258;
  float _266 = ((_259 * _258) * (((0.15931421518325806f - (_259 * 0.046496473252773285f)) * _259) + -0.32762277126312256f)) + _258;
  float _269 = select((_254 > _253), (1.5707963705062866f - _266), _266);
  float _272 = select((_251 < 0.0f), (3.1415927410125732f - _269), _269);
  float _279 = sqrt((_252 * _252) + (_251 * _251));
  float _280 = select((_252 < 0.0f), (-0.0f - _272), _272) * 0.9549295902252197f;
  int _283 = WaveReadLaneFirst(_materialIndex);
  int _291 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_283 < (uint)170000), _283, 0)) + 0u))]._noiseTex);
  float4 _298 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_291 < (uint)65000), _291, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_217, (_216 + (_time.x * 0.05000000074505806f))));
  int _303 = WaveReadLaneFirst(_materialIndex);
  int _311 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_303 < (uint)170000), _303, 0)) + 0u))]._noiseTex);
  float4 _318 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_311 < (uint)65000), _311, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_216 + (_time.x * 0.15000000596046448f)), _215));
  float _321 = _318.x + _298.x;
  float _322 = _318.y + _298.y;
  float _324 = abs(dot(float3(_215, _216, _217), float3(0.0f, 1.0f, 0.0f)));
  float _326 = abs(dot(float3(_215, _216, _217), float3(0.0f, 0.0f, 1.0f)));
  float _327 = _321 * _324;
  float _328 = _322 * _324;
  float _333 = (_327 * _326) + (_321 - _327);
  int _339 = WaveReadLaneFirst(_materialIndex);
  float _347 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_339 < (uint)170000), _339, 0)) + 0u))]._sceneColorDistortionIntensity);
  float4 _350 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_110, _111));
  if (_347 > 9.999999747378752e-05f) {
    float4 _360 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(((_347 * ((_333 * 2.0f) + -0.9960784316062927f)) + _110), ((_347 * ((((_328 * _326) + (_322 - _328)) * 2.0f) + -0.9960784316062927f)) + _111)));
    _365 = _360.x;
    _366 = _360.y;
    _367 = _360.z;
  } else {
    _365 = _350.x;
    _366 = _350.y;
    _367 = _350.z;
  }
  float _384 = frac(frac(dot(float2(float((int)(int((_bufferSizeAndInvSize.x + -1.0f) * saturate(_110)))), float((int)(int((_bufferSizeAndInvSize.y + -1.0f) * saturate(_111))))), float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f);
  int _390 = WaveReadLaneFirst(_materialIndex);
  float _398 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_390 < (uint)170000), _390, 0)) + 0u))]._fireIntensity);
  if (_398 > 9.999999747378752e-05f) {
    float _402 = _398 * ((((_333 + -0.4000000059604645f) * 6.6666669845581055f) + -1.0f) * 0.20000000298023224f);
    float4 _409 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(((_402 * (_384 + -0.5f)) + _110), ((_402 * (0.5f - _384)) + _111)));
    _412 = _409.x;
  } else {
    _412 = _219.x;
  }
  float _418 = ((dot(float3(_365, _366, _367), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f)) - _219.y) * saturate(_248 * _248)) + _219.y;
  float _429 = _time.x * 0.125f;
  int _431 = WaveReadLaneFirst(_materialIndex);
  int _439 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_431 < (uint)170000), _431, 0)) + 0u))]._distortionTex);
  float4 _446 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_439 < (uint)65000), _439, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_280, (_279 + _429)));
  float _449 = _446.x * 0.20000000298023224f;
  float _450 = _446.y * 0.20000000298023224f;
  int _454 = WaveReadLaneFirst(_materialIndex);
  int _462 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_454 < (uint)170000), _454, 0)) + 0u))]._marbleCrackTex);
  float4 _469 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_462 < (uint)65000), _462, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_449 + _280), ((_279 - (_time.x * 0.25f)) + _449)));
  int _474 = WaveReadLaneFirst(_materialIndex);
  int _482 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_474 < (uint)170000), _474, 0)) + 0u))]._marbleCrackTex);
  float4 _489 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_482 < (uint)65000), _482, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_450 + _280), ((_279 - _429) + _450)));
  int _494 = WaveReadLaneFirst(_materialIndex);
  float _502 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_494 < (uint)170000), _494, 0)) + 0u))]._auraIntensity);
  float _505 = saturate((_219.w + -0.10000000149011612f) * 1.1111111640930176f);
  float _511 = ((_505 * _505) * (1.0f - saturate(exp2(log2(_237 * 15.0f) * 0.07000000029802322f)))) * (3.0f - (_505 * 2.0f));
  if (_502 > 9.999999747378752e-05f) {
    float _515 = _511 * (_502 * _38);
    _520 = (_515 * 0.3185468018054962f);
    _521 = (_515 * 0.033104754984378815f);
    _522 = (_515 * 0.010022826492786407f);
  } else {
    _520 = 0.0f;
    _521 = 0.0f;
    _522 = 0.0f;
  }
  int _523 = WaveReadLaneFirst(_materialIndex);
  float _531 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_523 < (uint)170000), _523, 0)) + 0u))]._bloodLineIntensity);
  float _535 = saturate(saturate((_489.y * 1.2000000476837158f) + _469.x) - (_237 * 14.0f)) * _511;
  if (_531 > 9.999999747378752e-05f) {
    float _539 = _535 * (_531 * _38);
    _543 = (_539 * 2.5371556282043457f);
    _544 = (_539 * 0.4479884207248688f);
    _545 = 0.0f;
  } else {
    _543 = _535;
    _544 = _535;
    _545 = _535;
  }
  uint _551 = uint(_bufferSizeAndInvSize.x * _110);
  uint _552 = uint(_bufferSizeAndInvSize.y * _111);
  uint4 _554 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_551), (int)(_552), 0));
  float4 _557 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_551), (int)(_552), 0));
  float _575 = (saturate(_557.x * 1.0009784698486328f) * 2.0f) + -1.0f;
  float _576 = (saturate(_557.y * 1.0009784698486328f) * 2.0f) + -1.0f;
  float _577 = (saturate(_557.z * 1.0009784698486328f) * 2.0f) + -1.0f;
  float _579 = rsqrt(dot(float3(_575, _576, _577), float3(_575, _576, _577)));
  float _580 = _579 * _575;
  float _581 = _579 * _576;
  float _582 = _577 * _579;
  float _585 = (float((uint)((uint)(((uint)((uint)(_554.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
  float _586 = (float((uint)((uint)(_554.w & 255))) * 0.007843137718737125f) + -1.0f;
  float _589 = (_585 + _586) * 0.5f;
  float _590 = (_585 - _586) * 0.5f;
  float _594 = (1.0f - abs(_589)) - abs(_590);
  float _596 = rsqrt(dot(float3(_589, _590, _594), float3(_589, _590, _594)));
  float _597 = _596 * _589;
  float _598 = _596 * _590;
  float _599 = _596 * _594;
  float _601 = select((_582 >= 0.0f), 1.0f, -1.0f);
  float _604 = -0.0f - (1.0f / (_601 + _582));
  float _605 = _581 * _604;
  float _606 = _605 * _580;
  float _607 = _601 * _580;
  float _616 = mad(_599, _580, mad(_598, _606, ((((_607 * _580) * _604) + 1.0f) * _597)));
  float _620 = mad(_599, _581, mad(_598, (_601 + (_605 * _581)), ((_597 * _601) * _606)));
  float _624 = mad(_599, _582, mad(_598, (-0.0f - _581), (-0.0f - (_607 * _597))));
  float _626 = rsqrt(dot(float3(_616, _620, _624), float3(_616, _620, _624)));
  int _629 = WaveReadLaneFirst(_materialIndex);
  int _637 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_629 < (uint)170000), _629, 0)) + 0u))]._noiseTex);
  float _643 = _time.x * -0.009999999776482582f;
  float _644 = (_157 * 0.019999999552965164f) + _643;
  float _645 = (_159 * 0.019999999552965164f) + _643;
  float4 _650 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_637 < (uint)65000), _637, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_644, _645));
  float _652 = (_158 * 0.019999999552965164f) + _643;
  float4 _655 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_637 < (uint)65000), _637, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_645, _652));
  float4 _659 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_637 < (uint)65000), _637, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_652, _644));
  float _661 = abs(_626 * _620);
  float _662 = abs(_626 * _624);
  float _665 = (_661 * (_650.x - _655.x)) + _655.x;
  int _670 = WaveReadLaneFirst(_materialIndex);
  int _678 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_670 < (uint)170000), _670, 0)) + 0u))]._noiseTex2);
  float _686 = (saturate(lerp(_665, _659.x, _662)) * 0.30000001192092896f) + (_time.x * 0.10000000149011612f);
  float _687 = _686 + (_157 * 0.10000000149011612f);
  float _688 = _686 + (_159 * 0.10000000149011612f);
  float4 _693 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_678 < (uint)65000), _678, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_687, _688));
  float _695 = _686 + (_158 * 0.10000000149011612f);
  float4 _698 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_678 < (uint)65000), _678, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_688, _695));
  float4 _702 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_678 < (uint)65000), _678, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_695, _687));
  float _706 = ((_693.w - _698.w) * _661) + _698.w;
  float _710 = saturate(lerp(_706, _702.w, _662));
  float _711 = _710 * 3.0f;
  float _720 = _157 - _mainPosition.x;
  float _721 = _158 - _mainPosition.y;
  float _722 = _159 - _mainPosition.z;
  float _731 = 1.0f - saturate(sqrt(((_720 * _720) + (_721 * _721)) + (_722 * _722)) * 0.0020000000949949026f);
  float _734 = (_731 * _731) * (exp2(log2(saturate(_711)) * 5.400000095367432f) * _38);
  int _737 = WaveReadLaneFirst(_materialIndex);
  float _750 = _mainPosition.x - _157;
  float _751 = _mainPosition.y - _158;
  float _752 = _mainPosition.z - _159;
  int _761 = WaveReadLaneFirst(_materialIndex);
  int _774 = WaveReadLaneFirst(_materialIndex);
  float _787 = _mainPosition.x - _157;
  float _788 = _mainPosition.y - _158;
  float _789 = _mainPosition.z - _159;
  int _797 = WaveReadLaneFirst(_materialIndex);
  int _808 = WaveReadLaneFirst(_materialIndex);
  float _820 = saturate((WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_808 < (uint)170000), _808, 0)) + 0u))]._sphereMaskEndRatio) * (((saturate(((1.0f - ((1.0f / max(9.999999747378752e-06f, WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_737 < (uint)170000), _737, 0)) + 0u))]._scanRadius))) * sqrt(dot(float3(_750, _751, _752), float3(_750, _751, _752))))) * 2.500000238418579f) - _711) + -1.0f) * WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_761 < (uint)170000), _761, 0)) + 0u))]._sphereMaskRatio)) + 1.0f)) * saturate((WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_797 < (uint)170000), _797, 0)) + 0u))]._sphereMaskEndNoiseIntensity) * _710) - ((1.0f - ((1.0f / max(9.999999747378752e-06f, WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_774 < (uint)170000), _774, 0)) + 0u))]._scanRadiusEnd))) * sqrt(dot(float3(_787, _788, _789), float3(_787, _788, _789))))) * 1.4285714626312256f)));
  if ((uint)((_207.x & 127) + -53) < (uint)15) {
    float _829 = _219.w * 0.5f;
    int _832 = WaveReadLaneFirst(_materialIndex);
    int _840 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_832 < (uint)170000), _832, 0)) + 0u))]._noiseTex);
    float4 _847 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_840 < (uint)65000), _840, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_829 + ((TEXCOORD.x * 2.0f) * _39)), (_829 + (((_time.x * 0.20000000298023224f) + TEXCOORD.y) * 2.0f))));
    float _849 = _847.x + -0.20000000298023224f;
    int2 _852; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_852.x, _852.y);
    uint _867 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_852.x))))) + 0.5f) * _110), int((float((int)(int(float((int)(_852.y))))) + 0.5f) * _111), 0));
    float _873 = _849 * 0.01874999888241291f;
    uint _881 = uint(_bufferSizeAndInvSize.x * (_873 + _110));
    uint _882 = uint(_bufferSizeAndInvSize.y * (_873 + _111));
    uint4 _884 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_881), (int)(_882), 0));
    float4 _887 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_881), (int)(_882), 0));
    float _905 = (saturate(_887.x * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _906 = (saturate(_887.y * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _907 = (saturate(_887.z * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _909 = rsqrt(dot(float3(_905, _906, _907), float3(_905, _906, _907)));
    float _910 = _909 * _905;
    float _911 = _909 * _906;
    float _912 = _907 * _909;
    float _915 = (float((uint)((uint)(((uint)((uint)(_884.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
    float _916 = (float((uint)((uint)(_884.w & 255))) * 0.007843137718737125f) + -1.0f;
    float _919 = (_915 + _916) * 0.5f;
    float _920 = (_915 - _916) * 0.5f;
    float _924 = (1.0f - abs(_919)) - abs(_920);
    float _926 = rsqrt(dot(float3(_919, _920, _924), float3(_919, _920, _924)));
    float _927 = _926 * _919;
    float _928 = _926 * _920;
    float _929 = _926 * _924;
    float _931 = select((_912 >= 0.0f), 1.0f, -1.0f);
    float _934 = -0.0f - (1.0f / (_931 + _912));
    float _935 = _911 * _934;
    float _936 = _935 * _910;
    float _937 = _931 * _910;
    float _946 = mad(_929, _910, mad(_928, _936, ((((_937 * _910) * _934) + 1.0f) * _927)));
    float _950 = mad(_929, _911, mad(_928, (_931 + (_935 * _911)), ((_927 * _931) * _936)));
    float _954 = mad(_929, _912, mad(_928, (-0.0f - _911), (-0.0f - (_937 * _927))));
    float _956 = rsqrt(dot(float3(_946, _950, _954), float3(_946, _950, _954)));
    float _957 = _956 * _946;
    float _958 = _956 * _950;
    float _959 = _956 * _954;
    float _964 = _mainPosition.x - _157;
    float _965 = _mainPosition.y - _158;
    float _966 = _mainPosition.z - _159;
    float _971 = saturate(5.000000476837158f - (sqrt(dot(float3(_964, _965, _966), float3(_964, _965, _966))) * 0.1250000149011612f));
    if ((_867.x & 255) == _renderPassEnemy) {
      int _982 = WaveReadLaneFirst(_materialIndex);
      int _990 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_982 < (uint)170000), _982, 0)) + 0u))]._enemyMaskColor);
      float _993 = float((uint)((uint)(((uint)((uint)(_990)) >> 16) & 255)));
      float _996 = float((uint)((uint)(((uint)((uint)(_990)) >> 8) & 255)));
      float _998 = float((uint)((uint)(_990 & 255)));
      float _1045 = exp2(log2(saturate(_333 * 0.5f)) * 2.4000000953674316f) * (((((_849 * 3.25f) + 1.2999999523162842f) * _38) * _971) * exp2(log2(abs(dot(float3(_957, _958, _959), float3(_viewDir.x, _viewDir.y, _viewDir.z)))) * 5.0f));
      _1048 = (((select(((_993 * 0.003921568859368563f) < 0.040449999272823334f), (_993 * 0.0003035269910469651f), exp2(log2((_993 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) + -1.0f) * _971) + 1.0f);
      _1049 = (((select(((_996 * 0.003921568859368563f) < 0.040449999272823334f), (_996 * 0.0003035269910469651f), exp2(log2((_996 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) + -1.0f) * _971) + 1.0f);
      _1050 = (((select(((_998 * 0.003921568859368563f) < 0.040449999272823334f), (_998 * 0.0003035269910469651f), exp2(log2((_998 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) + -1.0f) * _971) + 1.0f);
      _1051 = _1045;
      _1052 = (_1045 * 0.15000000596046448f);
    } else {
      _1048 = 1.0f;
      _1049 = 1.0f;
      _1050 = 1.0f;
      _1051 = 0.0f;
      _1052 = 0.0f;
    }
    float _1064 = ((_849 * 1.25f) * exp2(log2(1.0f - abs(dot(float3(_957, _958, _959), float3(_viewDir.x, _viewDir.y, _viewDir.z)))) * 5.0f)) * _38;
    _1070 = 0.0f;
    _1071 = 0.0f;
    _1072 = 0.0f;
    _1073 = 0.0f;
    _1074 = _1048;
    _1075 = _1049;
    _1076 = _1050;
    _1077 = (_1051 + (_1064 * 0.3185468018054962f));
    _1078 = (_1052 + (_1064 * 0.033104754984378815f));
  } else {
    _1070 = (_412 * 0.2632734179496765f);
    _1071 = (_412 * 0.05087609216570854f);
    _1072 = (_734 * 0.07323896884918213f);
    _1073 = (_734 * 0.003935939632356167f);
    _1074 = 1.0f;
    _1075 = 1.0f;
    _1076 = 1.0f;
    _1077 = 0.0f;
    _1078 = 0.0f;
  }
  int _1079 = WaveReadLaneFirst(_materialIndex);
  float _1087 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_1079 < (uint)170000), _1079, 0)) + 0u))]._fogIntensity);
  float _1107 = saturate(saturate(exp2(log2(_237 * 20.0f) * 0.5f)));
  float _1127 = ((((((_520 - _365) + _543) + _1072) + _1077) + ((((_1087 * (((lerp(_365, _418, 0.5f)) * 0.800000011920929f) - _1070)) + _1070) * saturate(_1074 + 0.20000000298023224f)) * _1107)) * _820) + _365;
  float _1128 = ((((((_521 - _366) + _544) + _1073) + _1078) + ((((_1087 * (((lerp(_366, _418, 0.5f)) * 0.800000011920929f) - _1071)) + _1071) * saturate(_1075 + 0.20000000298023224f)) * _1107)) * _820) + _366;
  float _1129 = ((((_522 - _367) + _545) + (((((lerp(_367, _418, 0.5f)) * 0.800000011920929f) * _1087) * saturate(_1076 + 0.20000000298023224f)) * _1107)) * _820) + _367;
  uint _1130 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _1137 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_1130), 0));
    _1143 = (float((uint)((uint)(_1137.x & 127))) + 0.5f);
  } else {
    _1143 = 0.0f;
  }
  bool _1146 = (_localToneMappingParams.w > 0.0f);
  if (_1146) {
    float3 output_color = TonemapReplacer(float3(_1127, _1128, _1129));
    _1499 = output_color.x;
    _1500 = output_color.y;
    _1501 = output_color.z;
  } else {
    _1499 = _1127;
    _1500 = _1128;
    _1501 = _1129;
  }
  if (_etcParams.y > 1.0f) {
    float _1510 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _1511 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _1515 = saturate(1.0f - (dot(float2(_1510, _1511), float2(_1510, _1511)) * saturate(_etcParams.y + -1.0f)));
    _1520 = (_1515 * _1499);
    _1521 = (_1515 * _1500);
    _1522 = (_1515 * _1501);
  } else {
    _1520 = _1499;
    _1521 = _1500;
    _1522 = _1501;
  }
  if ((_1146) && ((_etcParams.z > 0.0f))) {
    _1552 = select((_1520 <= 0.0031308000907301903f), (_1520 * 12.920000076293945f), (((pow(_1520, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1553 = select((_1521 <= 0.0031308000907301903f), (_1521 * 12.920000076293945f), (((pow(_1521, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1554 = select((_1522 <= 0.0031308000907301903f), (_1522 * 12.920000076293945f), (((pow(_1522, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1552 = _1520;
    _1553 = _1521;
    _1554 = _1522;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _1559 = float((uint)_1130);
    if (!(_1559 < _viewDir.w)) {
      if (!(_1559 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _1568 = _1552;
        _1569 = _1553;
        _1570 = _1554;
      } else {
        _1568 = 0.0f;
        _1569 = 0.0f;
        _1570 = 0.0f;
      }
    } else {
      _1568 = 0.0f;
      _1569 = 0.0f;
      _1570 = 0.0f;
    }
  } else {
    _1568 = _1552;
    _1569 = _1553;
    _1570 = _1554;
  }
  SV_Target.x = _1568;
  SV_Target.y = _1569;
  SV_Target.z = _1570;
  SV_Target.w = _1143;
  return SV_Target;
}