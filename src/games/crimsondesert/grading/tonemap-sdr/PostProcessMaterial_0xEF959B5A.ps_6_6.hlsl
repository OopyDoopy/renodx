struct PostProcessGhost_CDStruct {
  float _ghostFXRatio;
  uint _ghostNoiseTex;
  float _ghostNoiseIntensity;
  float _ghostFXColorInnerBrightness;
  uint _ghostFXColor1;
  uint _ghostFXColor2;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t32, space36);

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

ConstantBuffer<PostProcessGhost_CDStruct> BindlessParameters_PostProcessGhost_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float4 _34 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _44 = (pow(_34.x, 0.012683313339948654f));
  float _45 = (pow(_34.y, 0.012683313339948654f));
  float _46 = (pow(_34.z, 0.012683313339948654f));
  float _71 = exp2(log2(max(0.0f, (_44 + -0.8359375f)) / (18.8515625f - (_44 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _72 = exp2(log2(max(0.0f, (_45 + -0.8359375f)) / (18.8515625f - (_45 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _73 = exp2(log2(max(0.0f, (_46 + -0.8359375f)) / (18.8515625f - (_46 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  int _74 = WaveReadLaneFirst(_materialIndex);
  float _178;
  float _179;
  float _420;
  float _421;
  float _422;
  float _423;
  float _424;
  float _425;
  float _426;
  float _447;
  float _448;
  float _449;
  float _463;
  float _668;
  float _669;
  float _670;
  float _763;
  float _764;
  float _765;
  float _819;
  float _820;
  float _821;
  float _840;
  float _841;
  float _842;
  float _872;
  float _873;
  float _874;
  float _888;
  float _889;
  float _890;
  if (!(!(WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_74 < (uint)170000), _74, 0)) + 0u))]._ghostFXRatio) >= 0.0010000000474974513f))) {
    float _86 = 4.0f / (_srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y);
    int _93 = WaveReadLaneFirst(_materialIndex);
    int _101 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_93 < (uint)170000), _93, 0)) + 0u))]._ghostNoiseTex);
    float4 _108 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_101 < (uint)65000), _101, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((TEXCOORD.x * 3.0f) * _86), ((_time.x * 0.30000001192092896f) + (_86 * TEXCOORD.y))));
    int _112 = WaveReadLaneFirst(_materialIndex);
    int _121 = WaveReadLaneFirst(_materialIndex);
    float _131 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_121 < (uint)170000), _121, 0)) + 0u))]._ghostNoiseIntensity) * (WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_112 < (uint)170000), _112, 0)) + 0u))]._ghostFXRatio) * _108.y);
    float _134 = (_131 * 0.009999999776482582f) + TEXCOORD.x;
    float _135 = (_131 * 0.05000000074505806f) + TEXCOORD.y;
    int2 _137; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_137.x, _137.y);
    uint _152 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_137.x))))) + 0.5f) * _134), int((float((int)(int(float((int)(_137.y))))) + 0.5f) * _135), 0));
    float _162 = (float((uint)((uint)((uint)((uint)(_152.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
    float _163 = (float((uint)((uint)(((uint)((uint)(_152.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
    float _165 = 1.0f - abs(_162);
    float _166 = abs(_163);
    float _167 = _165 - _166;
    if (!(_167 >= 0.0f)) {
      _178 = (select((_162 >= 0.0f), 1.0f, -1.0f) * (1.0f - _166));
      _179 = (select((_163 >= 0.0f), 1.0f, -1.0f) * _165);
    } else {
      _178 = _162;
      _179 = _163;
    }
    float _181 = rsqrt(dot(float3(_178, _179, _167), float3(_178, _179, _167)));
    float _182 = _181 * _178;
    float _183 = _181 * _179;
    float _184 = _181 * _167;
    float _186 = rsqrt(dot(float3(_182, _183, _184), float3(_182, _183, _184)));
    float _187 = _186 * _182;
    float _188 = _186 * _183;
    float _189 = _186 * _184;
    if ((_152.x & 255) == _renderPassNPCGhost) {
      uint _199 = uint(_bufferSizeAndInvSize.x * _134);
      uint _200 = uint(_bufferSizeAndInvSize.y * _135);
      uint4 _202 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_199), (int)(_200), 0));
      float4 _205 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_199), (int)(_200), 0));
      float _223 = (saturate(_205.x * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _224 = (saturate(_205.y * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _225 = (saturate(_205.z * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _227 = rsqrt(dot(float3(_223, _224, _225), float3(_223, _224, _225)));
      float _228 = _227 * _223;
      float _229 = _227 * _224;
      float _230 = _225 * _227;
      float _233 = (float((uint)((uint)(((uint)((uint)(_202.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
      float _234 = (float((uint)((uint)(_202.w & 255))) * 0.007843137718737125f) + -1.0f;
      float _237 = (_233 + _234) * 0.5f;
      float _238 = (_233 - _234) * 0.5f;
      float _242 = (1.0f - abs(_237)) - abs(_238);
      float _244 = rsqrt(dot(float3(_237, _238, _242), float3(_237, _238, _242)));
      float _245 = _244 * _237;
      float _246 = _244 * _238;
      float _247 = _244 * _242;
      float _249 = select((_230 >= 0.0f), 1.0f, -1.0f);
      float _252 = -0.0f - (1.0f / (_249 + _230));
      float _253 = _229 * _252;
      float _254 = _253 * _228;
      float _255 = _249 * _228;
      float _264 = mad(_247, _228, mad(_246, _254, ((((_255 * _228) * _252) + 1.0f) * _245)));
      float _268 = mad(_247, _229, mad(_246, (_249 + (_253 * _229)), ((_245 * _249) * _254)));
      float _272 = mad(_247, _230, mad(_246, (-0.0f - _229), (-0.0f - (_255 * _245))));
      float _274 = rsqrt(dot(float3(_264, _268, _272), float3(_264, _268, _272)));
      float _296 = saturate(1.0f - dot(float3(((((_274 * _264) - _187) * 0.20000000298023224f) + _187), ((((_274 * _268) - _188) * 0.20000000298023224f) + _188), ((((_274 * _272) - _189) * 0.20000000298023224f) + _189)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
      float _297 = _296 * 2.0f;
      float _300 = 1.0f - saturate(_297 * _296);
      int _301 = WaveReadLaneFirst(_materialIndex);
      float _310 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_301 < (uint)170000), _301, 0)) + 0u))]._ghostFXRatio) * _300;
      int _311 = WaveReadLaneFirst(_materialIndex);
      float _319 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_311 < (uint)170000), _311, 0)) + 0u))]._ghostFXColorInnerBrightness);
      float _329 = (((_319 * _71) - _71) * _310) + _71;
      float _330 = (((_319 * _72) - _72) * _310) + _72;
      float _331 = (((_319 * _73) - _73) * _310) + _73;
      float _333 = _296 * _300;
      float _339 = saturate(_108.x * 40.0f) * saturate((_333 * _333) * 30.0f);
      int _340 = WaveReadLaneFirst(_materialIndex);
      int _348 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_340 < (uint)170000), _340, 0)) + 0u))]._ghostFXColor1);
      float _357 = float((uint)((uint)(((uint)((uint)(_348)) >> 16) & 255))) * 0.003921568859368563f;
      float _358 = float((uint)((uint)(((uint)((uint)(_348)) >> 8) & 255))) * 0.003921568859368563f;
      float _359 = float((uint)((uint)(_348 & 255))) * 0.003921568859368563f;
      float _371 = max(0.0010000000474974513f, _exposure0.x);
      int _375 = WaveReadLaneFirst(_materialIndex);
      int _383 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_375 < (uint)170000), _375, 0)) + 0u))]._ghostFXColor2);
      float _397 = max(0.0010000000474974513f, _exposure0.x);
      float _398 = (float((uint)((uint)(((uint)((uint)(_383)) >> 16) & 255))) * 0.003921568859368563f) / _397;
      float _399 = (float((uint)((uint)(((uint)((uint)(_383)) >> 8) & 255))) * 0.003921568859368563f) / _397;
      float _400 = (float((uint)((uint)(_383 & 255))) * 0.003921568859368563f) / _397;
      float _407 = ((_329 - _398) * 0.10000000149011612f) + _398;
      float _408 = ((_330 - _399) * 0.10000000149011612f) + _399;
      float _409 = ((_331 - _400) * 0.10000000149011612f) + _400;
      _420 = _329;
      _421 = _330;
      _422 = _331;
      _423 = saturate(_297);
      _424 = (((((lerp(_357, _108.x, 0.10000000149011612f)) / _371) - _407) * _339) + _407);
      _425 = (((((lerp(_358, _108.y, 0.10000000149011612f)) / _371) - _408) * _339) + _408);
      _426 = (((((lerp(_359, _108.z, 0.10000000149011612f)) / _371) - _409) * _339) + _409);
    } else {
      _420 = _71;
      _421 = _72;
      _422 = _73;
      _423 = 0.0f;
      _424 = _71;
      _425 = _72;
      _426 = _73;
    }
    int _427 = WaveReadLaneFirst(_materialIndex);
    float _436 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_427 < (uint)170000), _427, 0)) + 0u))]._ghostFXRatio) * _423;
    _447 = ((_436 * (_424 - _420)) + _420);
    _448 = ((_436 * (_425 - _421)) + _421);
    _449 = ((_436 * (_426 - _422)) + _422);
  } else {
    _447 = _71;
    _448 = _72;
    _449 = _73;
  }
  uint _450 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _457 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_450), 0));
    _463 = (float((uint)((uint)(_457.x & 127))) + 0.5f);
  } else {
    _463 = 0.0f;
  }
  bool _466 = (_localToneMappingParams.w > 0.0f);
  if (_466) {
    float3 output_color = TonemapReplacer(float3(_447, _448, _449));
    _819 = output_color.x;
    _820 = output_color.y;
    _821 = output_color.z;
  } else {
    _819 = _447;
    _820 = _448;
    _821 = _449;
  }
  if (_etcParams.y > 1.0f) {
    float _830 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _831 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _835 = saturate(1.0f - (dot(float2(_830, _831), float2(_830, _831)) * saturate(_etcParams.y + -1.0f)));
    _840 = (_835 * _819);
    _841 = (_835 * _820);
    _842 = (_835 * _821);
  } else {
    _840 = _819;
    _841 = _820;
    _842 = _821;
  }
  if ((_466) && ((_etcParams.z > 0.0f))) {
    _872 = select((_840 <= 0.0031308000907301903f), (_840 * 12.920000076293945f), (((pow(_840, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _873 = select((_841 <= 0.0031308000907301903f), (_841 * 12.920000076293945f), (((pow(_841, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _874 = select((_842 <= 0.0031308000907301903f), (_842 * 12.920000076293945f), (((pow(_842, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _872 = _840;
    _873 = _841;
    _874 = _842;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _879 = float((uint)_450);
    if (!(_879 < _viewDir.w)) {
      if (!(_879 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _888 = _872;
        _889 = _873;
        _890 = _874;
      } else {
        _888 = 0.0f;
        _889 = 0.0f;
        _890 = 0.0f;
      }
    } else {
      _888 = 0.0f;
      _889 = 0.0f;
      _890 = 0.0f;
    }
  } else {
    _888 = _872;
    _889 = _873;
    _890 = _874;
  }
  float _900 = exp2(log2(_888 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _901 = exp2(log2(_889 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _902 = exp2(log2(_890 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_900 * 18.6875f) + 1.0f)) * ((_900 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_901 * 18.6875f) + 1.0f)) * ((_901 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_902 * 18.6875f) + 1.0f)) * ((_902 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _463;
  return SV_Target;
}