#include "../tonemap.hlsli"

struct PostProcessAbyssEnter_CDStruct {
  float _scanRadius;
  float _startFade;
  uint _noiseTex;
  uint _noiseTex2;
  uint _effectType;
  float _ppAbyssEnterRatio;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float> __3__36__0__0__g_depth : register(t75, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t38, space36);

Texture2D<uint> __3__36__0__0__g_CustomRenderPassValue : register(t65, space36);

Texture2D<float4> __3__36__0__0__g_CustomRenderPassDepth : register(t66, space36);

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

ConstantBuffer<PostProcessAbyssEnter_CDStruct> BindlessParameters_PostProcessAbyssEnter_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _23[36];
  float _29 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
  float _32 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _35 = (TEXCOORD.x * 2.0f) + -1.0f;
  float _36 = TEXCOORD.y * 2.0f;
  float _37 = 1.0f - _36;
  int2 _39; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_39.x, _39.y);
  uint _54 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_39.x))))) + 0.5f) * TEXCOORD.x), int((float((int)(int(float((int)(_39.y))))) + 0.5f) * TEXCOORD.y), 0));
  int _56 = _54.x & 255;
  float _68;
  float _233;
  float _234;
  float _235;
  float _282;
  float _283;
  float _284;
  float _477;
  float _478;
  float _479;
  float _480;
  float _494;
  float _740;
  float _741;
  float _742;
  float _862;
  float _863;
  float _864;
  float _882;
  float _883;
  float _884;
  float _917;
  float _918;
  float _919;
  float _933;
  float _934;
  float _935;
  if ((_56 == _renderPassSelfPlayer) | (((_56 == 70)) || ((_56 == _renderPassTest)))) {
    _68 = 1.0f;
  } else {
    _68 = 0.0f;
  }
  int _69 = WaveReadLaneFirst(_materialIndex);
  if (WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnter_CD[((int)((uint)(select(((uint)_69 < (uint)170000), _69, 0)) + 0u))]._effectType) == 0) {
    float _83 = 1.0f / _srcTargetSizeAndInv.x;
    float _84 = 1.0f / _srcTargetSizeAndInv.y;
    float4 _87 = __3__36__0__0__g_CustomRenderPassDepth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    float _89 = _83 * 2.0f;
    float4 _91 = __3__36__0__0__g_CustomRenderPassDepth.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _89), TEXCOORD.y));
    float _93 = TEXCOORD.x - _83;
    float4 _94 = __3__36__0__0__g_CustomRenderPassDepth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_93, TEXCOORD.y));
    float _96 = _83 + TEXCOORD.x;
    float4 _97 = __3__36__0__0__g_CustomRenderPassDepth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_96, TEXCOORD.y));
    float4 _100 = __3__36__0__0__g_CustomRenderPassDepth.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_89 + TEXCOORD.x), TEXCOORD.y));
    float _102 = _84 * 2.0f;
    float4 _104 = __3__36__0__0__g_CustomRenderPassDepth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (TEXCOORD.y - _102)));
    float _106 = TEXCOORD.y - _84;
    float4 _107 = __3__36__0__0__g_CustomRenderPassDepth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, _106));
    float _109 = _84 + TEXCOORD.y;
    float4 _110 = __3__36__0__0__g_CustomRenderPassDepth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, _109));
    float4 _113 = __3__36__0__0__g_CustomRenderPassDepth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (_102 + TEXCOORD.y)));
    float _139 = max(1.0000000116860974e-07f, _87.x);
    float _160 = (_invViewProjRelative[0].x) * _35;
    float _164 = (_invViewProjRelative[1].x) * _35;
    float _168 = (_invViewProjRelative[2].x) * _35;
    float _172 = (_invViewProjRelative[3].x) * _35;
    float _175 = mad((_invViewProjRelative[3].z), _139, mad((_invViewProjRelative[3].y), _37, _172)) + (_invViewProjRelative[3].w);
    float _176 = (mad((_invViewProjRelative[0].z), _139, mad((_invViewProjRelative[0].y), _37, _160)) + (_invViewProjRelative[0].w)) / _175;
    float _177 = (mad((_invViewProjRelative[1].z), _139, mad((_invViewProjRelative[1].y), _37, _164)) + (_invViewProjRelative[1].w)) / _175;
    float _178 = (mad((_invViewProjRelative[2].z), _139, mad((_invViewProjRelative[2].y), _37, _168)) + (_invViewProjRelative[2].w)) / _175;
    if (abs(((_94.x * _91.x) / ((_91.x * 2.0f) - _94.x)) - _87.x) < abs(((_100.x * _97.x) / ((_100.x * 2.0f) - _97.x)) - _87.x)) {
      float _182 = (_93 * 2.0f) + -1.0f;
      float _183 = max(1.0000000116860974e-07f, _94.x);
      float _199 = mad((_invViewProjRelative[3].z), _183, mad((_invViewProjRelative[3].y), _37, ((_invViewProjRelative[3].x) * _182))) + (_invViewProjRelative[3].w);
      _233 = (_176 - ((mad((_invViewProjRelative[0].z), _183, mad((_invViewProjRelative[0].y), _37, ((_invViewProjRelative[0].x) * _182))) + (_invViewProjRelative[0].w)) / _199));
      _234 = (_177 - ((mad((_invViewProjRelative[1].z), _183, mad((_invViewProjRelative[1].y), _37, ((_invViewProjRelative[1].x) * _182))) + (_invViewProjRelative[1].w)) / _199));
      _235 = (_178 - ((mad((_invViewProjRelative[2].z), _183, mad((_invViewProjRelative[2].y), _37, ((_invViewProjRelative[2].x) * _182))) + (_invViewProjRelative[2].w)) / _199));
    } else {
      float _208 = (_96 * 2.0f) + -1.0f;
      float _209 = max(1.0000000116860974e-07f, _97.x);
      float _225 = mad((_invViewProjRelative[3].z), _209, mad((_invViewProjRelative[3].y), _37, ((_invViewProjRelative[3].x) * _208))) + (_invViewProjRelative[3].w);
      _233 = (((mad((_invViewProjRelative[0].z), _209, mad((_invViewProjRelative[0].y), _37, ((_invViewProjRelative[0].x) * _208))) + (_invViewProjRelative[0].w)) / _225) - _176);
      _234 = (((mad((_invViewProjRelative[1].z), _209, mad((_invViewProjRelative[1].y), _37, ((_invViewProjRelative[1].x) * _208))) + (_invViewProjRelative[1].w)) / _225) - _177);
      _235 = (((mad((_invViewProjRelative[2].z), _209, mad((_invViewProjRelative[2].y), _37, ((_invViewProjRelative[2].x) * _208))) + (_invViewProjRelative[2].w)) / _225) - _178);
    }
    if (abs(((_107.x * _104.x) / ((_104.x * 2.0f) - _107.x)) - _87.x) < abs(((_113.x * _110.x) / ((_113.x * 2.0f) - _110.x)) - _87.x)) {
      float _239 = 1.0f - (_106 * 2.0f);
      float _240 = max(1.0000000116860974e-07f, _107.x);
      float _252 = mad((_invViewProjRelative[3].z), _240, mad((_invViewProjRelative[3].y), _239, _172)) + (_invViewProjRelative[3].w);
      _282 = (_176 - ((mad((_invViewProjRelative[0].z), _240, mad((_invViewProjRelative[0].y), _239, _160)) + (_invViewProjRelative[0].w)) / _252));
      _283 = (_177 - ((mad((_invViewProjRelative[1].z), _240, mad((_invViewProjRelative[1].y), _239, _164)) + (_invViewProjRelative[1].w)) / _252));
      _284 = (_178 - ((mad((_invViewProjRelative[2].z), _240, mad((_invViewProjRelative[2].y), _239, _168)) + (_invViewProjRelative[2].w)) / _252));
    } else {
      float _261 = 1.0f - (_109 * 2.0f);
      float _262 = max(1.0000000116860974e-07f, _110.x);
      float _274 = mad((_invViewProjRelative[3].z), _262, mad((_invViewProjRelative[3].y), _261, _172)) + (_invViewProjRelative[3].w);
      _282 = (((mad((_invViewProjRelative[0].z), _262, mad((_invViewProjRelative[0].y), _261, _160)) + (_invViewProjRelative[0].w)) / _274) - _176);
      _283 = (((mad((_invViewProjRelative[1].z), _262, mad((_invViewProjRelative[1].y), _261, _164)) + (_invViewProjRelative[1].w)) / _274) - _177);
      _284 = (((mad((_invViewProjRelative[2].z), _262, mad((_invViewProjRelative[2].y), _261, _168)) + (_invViewProjRelative[2].w)) / _274) - _178);
    }
    float _287 = (_284 * _234) - (_283 * _235);
    float _290 = (_282 * _235) - (_284 * _233);
    float _293 = (_283 * _233) - (_282 * _234);
    float _295 = rsqrt(dot(float3(_287, _290, _293), float3(_287, _290, _293)));
    float _317 = exp2(log2(1.0f - abs(dot(float3((_287 * _295), (_290 * _295), (_295 * _293)), float3(_viewDir.x, _viewDir.y, _viewDir.z)))) * 2.5f);
    int _321 = WaveReadLaneFirst(_materialIndex);
    float _330 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnter_CD[((int)((uint)(select(((uint)_321 < (uint)170000), _321, 0)) + 0u))]._startFade) * _68;
    _477 = (saturate(_317 * 0.44999998807907104f) + _330);
    _478 = (saturate(_317 * 0.6499999761581421f) + _330);
    _479 = (saturate(_317 * 0.949999988079071f) + _330);
    _480 = _68;
  } else {
    int _338 = WaveReadLaneFirst(_materialIndex);
    if (WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnter_CD[((int)((uint)(select(((uint)_338 < (uint)170000), _338, 0)) + 0u))]._effectType) == 1) {
      float _349 = max(1.0000000116860974e-07f, _32.x);
      float _385 = mad((_invViewProjRelative[3].z), _349, mad((_invViewProjRelative[3].y), _37, ((_invViewProjRelative[3].x) * _35))) + (_invViewProjRelative[3].w);
      float _386 = (mad((_invViewProjRelative[0].z), _349, mad((_invViewProjRelative[0].y), _37, ((_invViewProjRelative[0].x) * _35))) + (_invViewProjRelative[0].w)) / _385;
      float _389 = -0.0f - _386;
      float _390 = -0.0f - ((mad((_invViewProjRelative[1].z), _349, mad((_invViewProjRelative[1].y), _37, ((_invViewProjRelative[1].x) * _35))) + (_invViewProjRelative[1].w)) / _385);
      float _391 = -0.0f - ((mad((_invViewProjRelative[2].z), _349, mad((_invViewProjRelative[2].y), _37, ((_invViewProjRelative[2].x) * _35))) + (_invViewProjRelative[2].w)) / _385);
      float _393 = rsqrt(dot(float3(_389, _390, _391), float3(_389, _390, _391)));
      float _394 = _393 * _390;
      float _395 = _393 * _391;
      int _396 = WaveReadLaneFirst(_materialIndex);
      int _404 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnter_CD[((int)((uint)(select(((uint)_396 < (uint)170000), _396, 0)) + 0u))]._noiseTex);
      float _406 = (_386 * -2.0f) * _393;
      float _408 = _395 * 2.0f;
      float _413 = _time.x * 0.10000000149011612f;
      float4 _420 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_404 < (uint)65000), _404, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_413 + _406), (_413 + _408)));
      float _427 = _time.x * 0.10000000149011612f;
      float _429 = _427 + (_394 * 2.0f);
      float4 _430 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_404 < (uint)65000), _404, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_427 + _408), _429));
      float4 _436 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_404 < (uint)65000), _404, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_429, (_427 + _406)));
      float _441 = abs(_394);
      float _442 = abs(_395);
      float _451 = (_441 * (_420.x - _430.x)) + _430.x;
      float _452 = (_441 * (_420.y - _430.y)) + _430.y;
      float _453 = (_441 * (_420.z - _430.z)) + _430.z;
      float _454 = (_441 * (_420.w - _430.w)) + _430.w;
      float _471 = _68 * _29;
      _477 = (saturate(lerp(_451, _436.x, _442)) * _471);
      _478 = (saturate(lerp(_452, _436.y, _442)) * _471);
      _479 = (saturate(lerp(_453, _436.z, _442)) * _471);
      _480 = (saturate(lerp(_454, _436.w, _442)) * _29);
    } else {
      _477 = 0.0f;
      _478 = 0.0f;
      _479 = 0.0f;
      _480 = 0.0f;
    }
  }
  uint _481 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _488 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_481), 0));
    _494 = (float((uint)((uint)(_488.x & 127))) + 0.5f);
  } else {
    _494 = _480;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_477, _478, _479));
    _862 = output_color.x;
    _863 = output_color.y;
    _864 = output_color.z;
  } else {
    _862 = _477;
    _863 = _478;
    _864 = _479;
  }
  if (_etcParams.y > 1.0f) {
    float _872 = abs(_35);
    float _873 = abs(_36 + -1.0f);
    float _877 = saturate(1.0f - (dot(float2(_872, _873), float2(_872, _873)) * saturate(_etcParams.y + -1.0f)));
    _882 = (_877 * _862);
    _883 = (_877 * _863);
    _884 = (_877 * _864);
  } else {
    _882 = _862;
    _883 = _863;
    _884 = _864;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _917 = select((_882 <= 0.0031308000907301903f), (_882 * 12.920000076293945f), (((pow(_882, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _918 = select((_883 <= 0.0031308000907301903f), (_883 * 12.920000076293945f), (((pow(_883, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _919 = select((_884 <= 0.0031308000907301903f), (_884 * 12.920000076293945f), (((pow(_884, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _917 = _882;
    _918 = _883;
    _919 = _884;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _924 = float((uint)_481);
    if (!(_924 < _viewDir.w)) {
      if (!(_924 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _933 = _917;
        _934 = _918;
        _935 = _919;
      } else {
        _933 = 0.0f;
        _934 = 0.0f;
        _935 = 0.0f;
      }
    } else {
      _933 = 0.0f;
      _934 = 0.0f;
      _935 = 0.0f;
    }
  } else {
    _933 = _917;
    _934 = _918;
    _935 = _919;
  }
  float _945 = exp2(log2(_933 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _946 = exp2(log2(_934 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _947 = exp2(log2(_935 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_945 * 18.6875f) + 1.0f)) * ((_945 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_946 * 18.6875f) + 1.0f)) * ((_946 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_947 * 18.6875f) + 1.0f)) * ((_947 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _494;
  return SV_Target;
}

