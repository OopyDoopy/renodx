struct PostProcessEdgeBlur_CDStruct {
  float _edgeBlurRatio;
  float _edgeBlurShiftValue;
  float _edgeBlurBrightness;
  float _fishEyeMaxPower;
  uint _edgeBlurNoiseTex;
  float _edgeBlurNoiseIntensity;
  float _edgeBlurNoiseOffset;
  float2 _edgeBlurNoiseScale;
  float2 _edgeBlurNoiseSpeed;
  float _edgeBlurNoiseDissolve;
  float _useTargetFocusDir;
  float3 _targetFocusPositionOffset;
  uint _debugMode;
  float _targetFocusCenterMask;
  float _targetFocusCenterMaskEdgeThickness;
  float _targetFocusCenterMaskPower;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t69, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t32, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t33, space36);

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

ConstantBuffer<PostProcessEdgeBlur_CDStruct> BindlessParameters_PostProcessEdgeBlur_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _28 = _screenSizeAndInvSize.x / _screenSizeAndInvSize.y;
  int _29 = WaveReadLaneFirst(_materialIndex);
  float _37 = WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_29 < (uint)170000), _29, 0)) + 0u))]._fishEyeMaxPower);
  float _92;
  float _93;
  float _96;
  float _97;
  float _328;
  float _329;
  float _413;
  float _420;
  float _440;
  float _443;
  float _444;
  float _471;
  float _474;
  float _475;
  float _476;
  float _477;
  float _478;
  float _479;
  float _503;
  float _708;
  float _709;
  float _710;
  float _803;
  float _804;
  float _805;
  float _859;
  float _860;
  float _861;
  float _880;
  float _881;
  float _882;
  float _912;
  float _913;
  float _914;
  float _928;
  float _929;
  float _930;
  if (((_37 > 0.0010000000474974513f)) || ((_37 < -0.0010000000474974513f))) {
    float _48 = 0.5f / _28;
    float _51 = ((_destTargetSizAndInv.x * TEXCOORD.x) / _destTargetSizAndInv.x) + -0.5f;
    float _52 = ((_destTargetSizAndInv.y * TEXCOORD.y) / _destTargetSizAndInv.x) - _48;
    float _53 = dot(float2(_51, _52), float2(_51, _52));
    float _54 = sqrt(_53);
    if (_37 > 0.0f) {
      float _58 = sqrt(dot(float2(0.5f, _48), float2(0.5f, _48)));
      float _63 = tan(_54 * _37) * (rsqrt(_53) * _58);
      float _67 = tan(_58 * _37);
      _92 = (((_63 * _51) / _67) + 0.5f);
      _93 = (((_63 * _52) / _67) + _48);
    } else {
      if (_37 < 0.0f) {
        float _76 = select((_28 < 1.0f), 0.5f, _48);
        float _78 = _37 * -10.0f;
        float _82 = atan(_54 * _78) * (rsqrt(_53) * _76);
        float _86 = atan(_76 * _78);
        _92 = (((_82 * _51) / _86) + 0.5f);
        _93 = (((_82 * _52) / _86) + _48);
      } else {
        _92 = 0.0f;
        _93 = 0.0f;
      }
    }
    _96 = _92;
    _97 = (_93 * _28);
  } else {
    _96 = TEXCOORD.x;
    _97 = TEXCOORD.y;
  }
  float4 _100 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_96, _97));
  int _104 = WaveReadLaneFirst(_materialIndex);
  float _112 = WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_104 < (uint)170000), _104, 0)) + 0u))]._edgeBlurRatio);
  int _113 = WaveReadLaneFirst(_materialIndex);
  if (((_112 > 0.0f)) && ((WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_113 < (uint)170000), _113, 0)) + 0u))]._edgeBlurShiftValue) > 0.0f))) {
    float4 _128 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_96, _97));
    int _134 = WaveReadLaneFirst(_materialIndex);
    float _143 = WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_134 < (uint)170000), _134, 0)) + 0u))]._edgeBlurBrightness) * (1.0f - _128.w);
    int _160 = WaveReadLaneFirst(_materialIndex);
    float _180 = (WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_160 < (uint)170000), _160, 0)) + 0u))]._targetFocusPositionOffset.x) + _targetFocusPosition.x) - _viewPos.x;
    float _181 = (WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_160 < (uint)170000), _160, 0)) + 0u))]._targetFocusPositionOffset.y) + _targetFocusPosition.y) - _viewPos.y;
    float _182 = (WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_160 < (uint)170000), _160, 0)) + 0u))]._targetFocusPositionOffset.z) + _targetFocusPosition.z) - _viewPos.z;
    float _184 = rsqrt(dot(float3(_180, _181, _182), float3(_180, _181, _182)));
    float _185 = _180 * _184;
    float _187 = _182 * _184;
    float _189 = (TEXCOORD.x * 2.0f) + -1.0f;
    float _192 = ((1.0f - TEXCOORD.y) * 2.0f) + -1.0f;
    float _228 = ((_invViewProjRelative[3].w) + (_invViewProjRelative[3].z)) + mad((_invViewProjRelative[3].y), _192, ((_invViewProjRelative[3].x) * _189));
    float _229 = ((mad((_invViewProjRelative[0].y), _192, ((_invViewProjRelative[0].x) * _189)) + (_invViewProjRelative[0].z)) + (_invViewProjRelative[0].w)) / _228;
    float _230 = (((_invViewProjRelative[1].w) + (_invViewProjRelative[1].z)) + mad((_invViewProjRelative[1].y), _192, ((_invViewProjRelative[1].x) * _189))) / _228;
    float _231 = (((_invViewProjRelative[2].w) + (_invViewProjRelative[2].z)) + mad((_invViewProjRelative[2].y), _192, ((_invViewProjRelative[2].x) * _189))) / _228;
    float _233 = rsqrt(dot(float3(_229, _230, _231), float3(_229, _230, _231)));
    float _234 = _233 * _229;
    float _235 = _233 * _230;
    float _236 = _233 * _231;
    float _237 = -0.0f - _185;
    float _239 = acos(dot(float3(0.0f, 1.0f, 0.0f), float3(_185, (_181 * _184), _187)));
    float _240 = sin(_239);
    float _241 = cos(_239);
    float _242 = 1.0f - _241;
    float _243 = _242 * _187;
    float _244 = _242 * _237;
    float _245 = _240 * _187;
    float _246 = _240 * _237;
    float _255 = mad((_244 * _187), _236, mad(_246, _235, (((_243 * _187) + _241) * _234)));
    float _259 = mad(_245, _236, mad(_241, _235, (-0.0f - (_234 * _246))));
    float _263 = mad(((_244 * _237) + _241), _236, mad((-0.0f - _245), _235, ((_234 * _237) * _243)));
    float _265 = rsqrt(dot(float3(_255, _259, _263), float3(_255, _259, _263)));
    float _266 = _265 * _255;
    float _268 = _265 * _263;
    float _270 = atan(_268 / _266);
    bool _271 = (_266 < 0.0f);
    bool _272 = (_266 == 0.0f);
    bool _273 = (_268 >= 0.0f);
    bool _274 = (_268 < 0.0f);
    float _275 = acos(_265 * _259);
    int _276 = WaveReadLaneFirst(_materialIndex);
    int _290 = WaveReadLaneFirst(_materialIndex);
    if (WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_290 < (uint)170000), _290, 0)) + 0u))]._useTargetFocusDir) > 0.0010000000474974513f) {
      int _314 = WaveReadLaneFirst(_materialIndex);
      _328 = (WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_314 < (uint)170000), _314, 0)) + 0u))]._edgeBlurNoiseScale.x) * select(((_272) && (_273)), 0.75f, select(((_272) && (_274)), 0.25f, ((select(((_271) && (_274)), (_270 + -3.1415927410125732f), select(((_271) && (_273)), (_270 + 3.1415927410125732f), _270)) * 0.15915493667125702f) + 0.5f))));
      _329 = ((_275 * 0.31830987334251404f) * WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_314 < (uint)170000), _314, 0)) + 0u))]._edgeBlurNoiseScale.y));
    } else {
      _328 = ((_96 * _28) * WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_276 < (uint)170000), _276, 0)) + 0u))]._edgeBlurNoiseScale.x));
      _329 = (WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_276 < (uint)170000), _276, 0)) + 0u))]._edgeBlurNoiseScale.y) * _97);
    }
    int _332 = WaveReadLaneFirst(_materialIndex);
    int _347 = WaveReadLaneFirst(_materialIndex);
    int _355 = WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_347 < (uint)170000), _347, 0)) + 0u))]._edgeBlurNoiseTex);
    float4 _362 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_355 < (uint)65000), _355, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_332 < (uint)170000), _332, 0)) + 0u))]._edgeBlurNoiseSpeed.x) * _time.x) + _328), ((WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_332 < (uint)170000), _332, 0)) + 0u))]._edgeBlurNoiseSpeed.y) * _time.x) + _329)));
    float _367 = (_362.x * 2.0f) + -0.9960784316062927f;
    float _368 = (_362.y * 2.0f) + -0.9960784316062927f;
    int _373 = WaveReadLaneFirst(_materialIndex);
    float _381 = WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_373 < (uint)170000), _373, 0)) + 0u))]._targetFocusCenterMask);
    int _382 = WaveReadLaneFirst(_materialIndex);
    float _391 = WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_382 < (uint)170000), _382, 0)) + 0u))]._targetFocusCenterMaskEdgeThickness) * _381;
    int _392 = WaveReadLaneFirst(_materialIndex);
    float _400 = WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_392 < (uint)170000), _392, 0)) + 0u))]._targetFocusCenterMaskPower);
    if (!(_381 < 0.0010000000474974513f)) {
      _413 = saturate((((1.0f - _381) + _391) - abs((_275 * 0.6366197466850281f) + -1.0f)) / max(0.0010000000474974513f, _391));
    } else {
      _413 = 1.0f;
    }
    bool _414 = (_400 < 0.0010000000474974513f);
    if (!_414) {
      _420 = (pow(_413, _400));
    } else {
      _420 = 1.0f;
    }
    int _422 = WaveReadLaneFirst(_materialIndex);
    if (WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_422 < (uint)170000), _422, 0)) + 0u))]._debugMode) == 1) {
      if (!_414) {
        _440 = (pow(_413, _400));
      } else {
        _440 = 1.0f;
      }
      _443 = (_440 * _413);
      _444 = floor(1.0f - _413);
    } else {
      _443 = _100.x;
      _444 = _100.y;
    }
    int _445 = WaveReadLaneFirst(_materialIndex);
    if (WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_445 < (uint)170000), _445, 0)) + 0u))]._edgeBlurNoiseDissolve) > 0.0010000000474974513f) {
      int _456 = WaveReadLaneFirst(_materialIndex);
      _471 = saturate(((sqrt(saturate(1.0f - dot(float2(_367, _368), float2(_367, _368)))) - (WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_456 < (uint)170000), _456, 0)) + 0u))]._edgeBlurNoiseDissolve) * 0.75f)) * 2.0f) + -0.5f);
    } else {
      _471 = 1.0f;
    }
    _474 = _443;
    _475 = _444;
    _476 = ((_143 * _100.x) + _128.x);
    _477 = ((_143 * _100.y) + _128.y);
    _478 = ((_143 * _100.z) + _128.z);
    _479 = ((_420 * saturate((1.0f - abs((_128.w * 2.0f) + -1.0f)) * 4.0f)) * _471);
  } else {
    _474 = _100.x;
    _475 = _100.y;
    _476 = _100.x;
    _477 = _100.y;
    _478 = _100.z;
    _479 = 0.0f;
  }
  float _480 = _479 * _112;
  float _487 = (_480 * (_476 - _474)) + _474;
  float _488 = (_480 * (_477 - _475)) + _475;
  float _489 = (_480 * (_478 - _100.z)) + _100.z;
  uint _490 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _497 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_490), 0));
    _503 = (float((uint)((uint)(_497.x & 127))) + 0.5f);
  } else {
    _503 = 1.0f;
  }
  bool _506 = (_localToneMappingParams.w > 0.0f);
  if (_506) {
    float3 output_color = TonemapReplacer(float3(_487, _488, _489));
    _859 = output_color.x;
    _860 = output_color.y;
    _861 = output_color.z;
  } else {
    _859 = _487;
    _860 = _488;
    _861 = _489;
  }
  if (_etcParams.y > 1.0f) {
    float _870 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _871 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _875 = saturate(1.0f - (dot(float2(_870, _871), float2(_870, _871)) * saturate(_etcParams.y + -1.0f)));
    _880 = (_875 * _859);
    _881 = (_875 * _860);
    _882 = (_875 * _861);
  } else {
    _880 = _859;
    _881 = _860;
    _882 = _861;
  }
  if ((_506) && ((_etcParams.z > 0.0f))) {
    _912 = select((_880 <= 0.0031308000907301903f), (_880 * 12.920000076293945f), (((pow(_880, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _913 = select((_881 <= 0.0031308000907301903f), (_881 * 12.920000076293945f), (((pow(_881, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _914 = select((_882 <= 0.0031308000907301903f), (_882 * 12.920000076293945f), (((pow(_882, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _912 = _880;
    _913 = _881;
    _914 = _882;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _919 = float((uint)_490);
    if (!(_919 < _viewDir.w)) {
      if (!(_919 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _928 = _912;
        _929 = _913;
        _930 = _914;
      } else {
        _928 = 0.0f;
        _929 = 0.0f;
        _930 = 0.0f;
      }
    } else {
      _928 = 0.0f;
      _929 = 0.0f;
      _930 = 0.0f;
    }
  } else {
    _928 = _912;
    _929 = _913;
    _930 = _914;
  }
  SV_Target.x = _928;
  SV_Target.y = _929;
  SV_Target.z = _930;
  SV_Target.w = _503;
  return SV_Target;
}