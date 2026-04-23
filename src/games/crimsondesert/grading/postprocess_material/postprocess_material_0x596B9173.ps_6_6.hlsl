#include "../tonemap.hlsli"

struct PostProcessGhost_CDStruct {
  float _ghostFXRatio;
  uint _ghostNoiseTex;
  float _ghostNoiseIntensity;
  float _ghostFXColorInnerBrightness;
  uint _ghostFXColor1;
  uint _ghostFXColor2;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t33, space36);

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

ConstantBuffer<PostProcessGhost_CDStruct> BindlessParameters_PostProcessGhost_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _24[36];
  float4 _33 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _43 = (pow(_33.x, 0.012683313339948654f));
  float _44 = (pow(_33.y, 0.012683313339948654f));
  float _45 = (pow(_33.z, 0.012683313339948654f));
  float _70 = exp2(log2(max(0.0f, (_43 + -0.8359375f)) / (18.8515625f - (_43 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _71 = exp2(log2(max(0.0f, (_44 + -0.8359375f)) / (18.8515625f - (_44 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _72 = exp2(log2(max(0.0f, (_45 + -0.8359375f)) / (18.8515625f - (_45 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  int _73 = WaveReadLaneFirst(_materialIndex);
  float _177;
  float _178;
  float _419;
  float _420;
  float _421;
  float _422;
  float _423;
  float _424;
  float _425;
  float _446;
  float _447;
  float _448;
  float _462;
  float _708;
  float _709;
  float _710;
  float _830;
  float _831;
  float _832;
  float _853;
  float _854;
  float _855;
  float _888;
  float _889;
  float _890;
  float _904;
  float _905;
  float _906;
  if (!(!(WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_73 < (uint)170000), _73, 0)) + 0u))]._ghostFXRatio) >= 0.0010000000474974513f))) {
    float _85 = 4.0f / (_srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y);
    int _92 = WaveReadLaneFirst(_materialIndex);
    int _100 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_92 < (uint)170000), _92, 0)) + 0u))]._ghostNoiseTex);
    float4 _107 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_100 < (uint)65000), _100, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((TEXCOORD.x * 3.0f) * _85), ((_time.x * 0.30000001192092896f) + (_85 * TEXCOORD.y))));
    int _111 = WaveReadLaneFirst(_materialIndex);
    int _120 = WaveReadLaneFirst(_materialIndex);
    float _130 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_120 < (uint)170000), _120, 0)) + 0u))]._ghostNoiseIntensity) * (WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_111 < (uint)170000), _111, 0)) + 0u))]._ghostFXRatio) * _107.y);
    float _133 = (_130 * 0.009999999776482582f) + TEXCOORD.x;
    float _134 = (_130 * 0.05000000074505806f) + TEXCOORD.y;
    int2 _136; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_136.x, _136.y);
    uint _151 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_136.x))))) + 0.5f) * _133), int((float((int)(int(float((int)(_136.y))))) + 0.5f) * _134), 0));
    float _161 = (float((uint)((uint)((uint)((uint)(_151.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
    float _162 = (float((uint)((uint)(((uint)((uint)(_151.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
    float _164 = 1.0f - abs(_161);
    float _165 = abs(_162);
    float _166 = _164 - _165;
    if (!(_166 >= 0.0f)) {
      _177 = (select((_161 >= 0.0f), 1.0f, -1.0f) * (1.0f - _165));
      _178 = (select((_162 >= 0.0f), 1.0f, -1.0f) * _164);
    } else {
      _177 = _161;
      _178 = _162;
    }
    float _180 = rsqrt(dot(float3(_177, _178, _166), float3(_177, _178, _166)));
    float _181 = _180 * _177;
    float _182 = _180 * _178;
    float _183 = _180 * _166;
    float _185 = rsqrt(dot(float3(_181, _182, _183), float3(_181, _182, _183)));
    float _186 = _185 * _181;
    float _187 = _185 * _182;
    float _188 = _185 * _183;
    if ((_151.x & 255) == _renderPassNPCGhost) {
      uint _198 = uint(_bufferSizeAndInvSize.x * _133);
      uint _199 = uint(_bufferSizeAndInvSize.y * _134);
      uint4 _201 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_198), (int)(_199), 0));
      float4 _204 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_198), (int)(_199), 0));
      float _222 = (saturate(_204.x * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _223 = (saturate(_204.y * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _224 = (saturate(_204.z * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _226 = rsqrt(dot(float3(_222, _223, _224), float3(_222, _223, _224)));
      float _227 = _226 * _222;
      float _228 = _226 * _223;
      float _229 = _224 * _226;
      float _232 = (float((uint)((uint)(((uint)((uint)(_201.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
      float _233 = (float((uint)((uint)(_201.w & 255))) * 0.007843137718737125f) + -1.0f;
      float _236 = (_232 + _233) * 0.5f;
      float _237 = (_232 - _233) * 0.5f;
      float _241 = (1.0f - abs(_236)) - abs(_237);
      float _243 = rsqrt(dot(float3(_236, _237, _241), float3(_236, _237, _241)));
      float _244 = _243 * _236;
      float _245 = _243 * _237;
      float _246 = _243 * _241;
      float _248 = select((_229 >= 0.0f), 1.0f, -1.0f);
      float _251 = -0.0f - (1.0f / (_248 + _229));
      float _252 = _228 * _251;
      float _253 = _252 * _227;
      float _254 = _248 * _227;
      float _263 = mad(_246, _227, mad(_245, _253, ((((_254 * _227) * _251) + 1.0f) * _244)));
      float _267 = mad(_246, _228, mad(_245, (_248 + (_252 * _228)), ((_244 * _248) * _253)));
      float _271 = mad(_246, _229, mad(_245, (-0.0f - _228), (-0.0f - (_254 * _244))));
      float _273 = rsqrt(dot(float3(_263, _267, _271), float3(_263, _267, _271)));
      float _295 = saturate(1.0f - dot(float3(((((_273 * _263) - _186) * 0.20000000298023224f) + _186), ((((_273 * _267) - _187) * 0.20000000298023224f) + _187), ((((_273 * _271) - _188) * 0.20000000298023224f) + _188)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
      float _296 = _295 * 2.0f;
      float _299 = 1.0f - saturate(_296 * _295);
      int _300 = WaveReadLaneFirst(_materialIndex);
      float _309 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_300 < (uint)170000), _300, 0)) + 0u))]._ghostFXRatio) * _299;
      int _310 = WaveReadLaneFirst(_materialIndex);
      float _318 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_310 < (uint)170000), _310, 0)) + 0u))]._ghostFXColorInnerBrightness);
      float _328 = (((_318 * _70) - _70) * _309) + _70;
      float _329 = (((_318 * _71) - _71) * _309) + _71;
      float _330 = (((_318 * _72) - _72) * _309) + _72;
      float _332 = _295 * _299;
      float _338 = saturate(_107.x * 40.0f) * saturate((_332 * _332) * 30.0f);
      int _339 = WaveReadLaneFirst(_materialIndex);
      int _347 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_339 < (uint)170000), _339, 0)) + 0u))]._ghostFXColor1);
      float _356 = float((uint)((uint)(((uint)((uint)(_347)) >> 16) & 255))) * 0.003921568859368563f;
      float _357 = float((uint)((uint)(((uint)((uint)(_347)) >> 8) & 255))) * 0.003921568859368563f;
      float _358 = float((uint)((uint)(_347 & 255))) * 0.003921568859368563f;
      float _370 = max(0.0010000000474974513f, _exposure0.x);
      int _374 = WaveReadLaneFirst(_materialIndex);
      int _382 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_374 < (uint)170000), _374, 0)) + 0u))]._ghostFXColor2);
      float _396 = max(0.0010000000474974513f, _exposure0.x);
      float _397 = (float((uint)((uint)(((uint)((uint)(_382)) >> 16) & 255))) * 0.003921568859368563f) / _396;
      float _398 = (float((uint)((uint)(((uint)((uint)(_382)) >> 8) & 255))) * 0.003921568859368563f) / _396;
      float _399 = (float((uint)((uint)(_382 & 255))) * 0.003921568859368563f) / _396;
      float _406 = ((_328 - _397) * 0.10000000149011612f) + _397;
      float _407 = ((_329 - _398) * 0.10000000149011612f) + _398;
      float _408 = ((_330 - _399) * 0.10000000149011612f) + _399;
      _419 = _328;
      _420 = _329;
      _421 = _330;
      _422 = saturate(_296);
      _423 = (((((lerp(_356, _107.x, 0.10000000149011612f)) / _370) - _406) * _338) + _406);
      _424 = (((((lerp(_357, _107.y, 0.10000000149011612f)) / _370) - _407) * _338) + _407);
      _425 = (((((lerp(_358, _107.z, 0.10000000149011612f)) / _370) - _408) * _338) + _408);
    } else {
      _419 = _70;
      _420 = _71;
      _421 = _72;
      _422 = 0.0f;
      _423 = _70;
      _424 = _71;
      _425 = _72;
    }
    int _426 = WaveReadLaneFirst(_materialIndex);
    float _435 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_426 < (uint)170000), _426, 0)) + 0u))]._ghostFXRatio) * _422;
    _446 = ((_435 * (_423 - _419)) + _419);
    _447 = ((_435 * (_424 - _420)) + _420);
    _448 = ((_435 * (_425 - _421)) + _421);
  } else {
    _446 = _70;
    _447 = _71;
    _448 = _72;
  }
  uint _449 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _456 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_449), 0));
    _462 = (float((uint)((uint)(_456.x & 127))) + 0.5f);
  } else {
    _462 = 0.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_446, _447, _448));
    _830 = output_color.x;
    _831 = output_color.y;
    _832 = output_color.z;
  } else {
    _830 = _446;
    _831 = _447;
    _832 = _448;
  }
  if (_etcParams.y > 1.0f) {
    float _843 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _844 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _848 = saturate(1.0f - (dot(float2(_843, _844), float2(_843, _844)) * saturate(_etcParams.y + -1.0f)));
    _853 = (_848 * _830);
    _854 = (_848 * _831);
    _855 = (_848 * _832);
  } else {
    _853 = _830;
    _854 = _831;
    _855 = _832;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _888 = select((_853 <= 0.0031308000907301903f), (_853 * 12.920000076293945f), (((pow(_853, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _889 = select((_854 <= 0.0031308000907301903f), (_854 * 12.920000076293945f), (((pow(_854, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _890 = select((_855 <= 0.0031308000907301903f), (_855 * 12.920000076293945f), (((pow(_855, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _888 = _853;
    _889 = _854;
    _890 = _855;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _895 = float((uint)_449);
    if (!(_895 < _viewDir.w)) {
      if (!(_895 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _904 = _888;
        _905 = _889;
        _906 = _890;
      } else {
        _904 = 0.0f;
        _905 = 0.0f;
        _906 = 0.0f;
      }
    } else {
      _904 = 0.0f;
      _905 = 0.0f;
      _906 = 0.0f;
    }
  } else {
    _904 = _888;
    _905 = _889;
    _906 = _890;
  }
  float _916 = exp2(log2(_904 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _917 = exp2(log2(_905 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _918 = exp2(log2(_906 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_916 * 18.6875f) + 1.0f)) * ((_916 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_917 * 18.6875f) + 1.0f)) * ((_917 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_918 * 18.6875f) + 1.0f)) * ((_918 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _462;
  return SV_Target;
}

