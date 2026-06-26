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
  float _400;
  float _401;
  float _485;
  float _492;
  float _512;
  float _515;
  float _516;
  float _543;
  float _546;
  float _547;
  float _548;
  float _549;
  float _550;
  float _551;
  float _575;
  float _780;
  float _781;
  float _782;
  float _875;
  float _876;
  float _877;
  float _931;
  float _932;
  float _933;
  float _952;
  float _953;
  float _954;
  float _984;
  float _985;
  float _986;
  float _1000;
  float _1001;
  float _1002;
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
  float _110 = (pow(_100.x, 0.012683313339948654f));
  float _111 = (pow(_100.y, 0.012683313339948654f));
  float _112 = (pow(_100.z, 0.012683313339948654f));
  float _134 = exp2(log2(max(0.0f, (_110 + -0.8359375f)) / (18.8515625f - (_110 * 18.6875f))) * 6.277394771575928f);
  float _135 = exp2(log2(max(0.0f, (_111 + -0.8359375f)) / (18.8515625f - (_111 * 18.6875f))) * 6.277394771575928f);
  float _136 = exp2(log2(max(0.0f, (_112 + -0.8359375f)) / (18.8515625f - (_112 * 18.6875f))) * 6.277394771575928f);
  float _137 = _134 * 10000.0f;
  float _138 = _135 * 10000.0f;
  float _139 = _136 * 10000.0f;
  int _140 = WaveReadLaneFirst(_materialIndex);
  float _148 = WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_140 < (uint)170000), _140, 0)) + 0u))]._edgeBlurRatio);
  int _149 = WaveReadLaneFirst(_materialIndex);
  if (((_148 > 0.0f)) && ((WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_149 < (uint)170000), _149, 0)) + 0u))]._edgeBlurShiftValue) > 0.0f))) {
    float4 _164 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_96, _97));
    float _175 = (pow(_164.x, 0.012683313339948654f));
    float _176 = (pow(_164.y, 0.012683313339948654f));
    float _177 = (pow(_164.z, 0.012683313339948654f));
    int _203 = WaveReadLaneFirst(_materialIndex);
    float _212 = WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_203 < (uint)170000), _203, 0)) + 0u))]._edgeBlurBrightness) * (1.0f - _164.w);
    int _232 = WaveReadLaneFirst(_materialIndex);
    float _252 = (WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_232 < (uint)170000), _232, 0)) + 0u))]._targetFocusPositionOffset.x) + _targetFocusPosition.x) - _viewPos.x;
    float _253 = (WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_232 < (uint)170000), _232, 0)) + 0u))]._targetFocusPositionOffset.y) + _targetFocusPosition.y) - _viewPos.y;
    float _254 = (WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_232 < (uint)170000), _232, 0)) + 0u))]._targetFocusPositionOffset.z) + _targetFocusPosition.z) - _viewPos.z;
    float _256 = rsqrt(dot(float3(_252, _253, _254), float3(_252, _253, _254)));
    float _257 = _252 * _256;
    float _259 = _254 * _256;
    float _261 = (TEXCOORD.x * 2.0f) + -1.0f;
    float _264 = ((1.0f - TEXCOORD.y) * 2.0f) + -1.0f;
    float _300 = ((_invViewProjRelative[3].w) + (_invViewProjRelative[3].z)) + mad((_invViewProjRelative[3].y), _264, ((_invViewProjRelative[3].x) * _261));
    float _301 = ((mad((_invViewProjRelative[0].y), _264, ((_invViewProjRelative[0].x) * _261)) + (_invViewProjRelative[0].z)) + (_invViewProjRelative[0].w)) / _300;
    float _302 = (((_invViewProjRelative[1].w) + (_invViewProjRelative[1].z)) + mad((_invViewProjRelative[1].y), _264, ((_invViewProjRelative[1].x) * _261))) / _300;
    float _303 = (((_invViewProjRelative[2].w) + (_invViewProjRelative[2].z)) + mad((_invViewProjRelative[2].y), _264, ((_invViewProjRelative[2].x) * _261))) / _300;
    float _305 = rsqrt(dot(float3(_301, _302, _303), float3(_301, _302, _303)));
    float _306 = _305 * _301;
    float _307 = _305 * _302;
    float _308 = _305 * _303;
    float _309 = -0.0f - _257;
    float _311 = acos(dot(float3(0.0f, 1.0f, 0.0f), float3(_257, (_253 * _256), _259)));
    float _312 = sin(_311);
    float _313 = cos(_311);
    float _314 = 1.0f - _313;
    float _315 = _314 * _259;
    float _316 = _314 * _309;
    float _317 = _312 * _259;
    float _318 = _312 * _309;
    float _327 = mad((_316 * _259), _308, mad(_318, _307, (((_315 * _259) + _313) * _306)));
    float _331 = mad(_317, _308, mad(_313, _307, (-0.0f - (_306 * _318))));
    float _335 = mad(((_316 * _309) + _313), _308, mad((-0.0f - _317), _307, ((_306 * _309) * _315)));
    float _337 = rsqrt(dot(float3(_327, _331, _335), float3(_327, _331, _335)));
    float _338 = _337 * _327;
    float _340 = _337 * _335;
    float _342 = atan(_340 / _338);
    bool _343 = (_338 < 0.0f);
    bool _344 = (_338 == 0.0f);
    bool _345 = (_340 >= 0.0f);
    bool _346 = (_340 < 0.0f);
    float _347 = acos(_337 * _331);
    int _348 = WaveReadLaneFirst(_materialIndex);
    int _362 = WaveReadLaneFirst(_materialIndex);
    if (WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_362 < (uint)170000), _362, 0)) + 0u))]._useTargetFocusDir) > 0.0010000000474974513f) {
      int _386 = WaveReadLaneFirst(_materialIndex);
      _400 = (WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_386 < (uint)170000), _386, 0)) + 0u))]._edgeBlurNoiseScale.x) * select(((_344) && (_345)), 0.75f, select(((_344) && (_346)), 0.25f, ((select(((_343) && (_346)), (_342 + -3.1415927410125732f), select(((_343) && (_345)), (_342 + 3.1415927410125732f), _342)) * 0.15915493667125702f) + 0.5f))));
      _401 = ((_347 * 0.31830987334251404f) * WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_386 < (uint)170000), _386, 0)) + 0u))]._edgeBlurNoiseScale.y));
    } else {
      _400 = ((_96 * _28) * WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_348 < (uint)170000), _348, 0)) + 0u))]._edgeBlurNoiseScale.x));
      _401 = (WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_348 < (uint)170000), _348, 0)) + 0u))]._edgeBlurNoiseScale.y) * _97);
    }
    int _404 = WaveReadLaneFirst(_materialIndex);
    int _419 = WaveReadLaneFirst(_materialIndex);
    int _427 = WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_419 < (uint)170000), _419, 0)) + 0u))]._edgeBlurNoiseTex);
    float4 _434 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_427 < (uint)65000), _427, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_404 < (uint)170000), _404, 0)) + 0u))]._edgeBlurNoiseSpeed.x) * _time.x) + _400), ((WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_404 < (uint)170000), _404, 0)) + 0u))]._edgeBlurNoiseSpeed.y) * _time.x) + _401)));
    float _439 = (_434.x * 2.0f) + -0.9960784316062927f;
    float _440 = (_434.y * 2.0f) + -0.9960784316062927f;
    int _445 = WaveReadLaneFirst(_materialIndex);
    float _453 = WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_445 < (uint)170000), _445, 0)) + 0u))]._targetFocusCenterMask);
    int _454 = WaveReadLaneFirst(_materialIndex);
    float _463 = WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_454 < (uint)170000), _454, 0)) + 0u))]._targetFocusCenterMaskEdgeThickness) * _453;
    int _464 = WaveReadLaneFirst(_materialIndex);
    float _472 = WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_464 < (uint)170000), _464, 0)) + 0u))]._targetFocusCenterMaskPower);
    if (!(_453 < 0.0010000000474974513f)) {
      _485 = saturate((((1.0f - _453) + _463) - abs((_347 * 0.6366197466850281f) + -1.0f)) / max(0.0010000000474974513f, _463));
    } else {
      _485 = 1.0f;
    }
    bool _486 = (_472 < 0.0010000000474974513f);
    if (!_486) {
      _492 = (pow(_485, _472));
    } else {
      _492 = 1.0f;
    }
    int _494 = WaveReadLaneFirst(_materialIndex);
    if (WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_494 < (uint)170000), _494, 0)) + 0u))]._debugMode) == 1) {
      if (!_486) {
        _512 = (pow(_485, _472));
      } else {
        _512 = 1.0f;
      }
      _515 = (_512 * _485);
      _516 = floor(1.0f - _485);
    } else {
      _515 = _137;
      _516 = _138;
    }
    int _517 = WaveReadLaneFirst(_materialIndex);
    if (WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_517 < (uint)170000), _517, 0)) + 0u))]._edgeBlurNoiseDissolve) > 0.0010000000474974513f) {
      int _528 = WaveReadLaneFirst(_materialIndex);
      _543 = saturate(((sqrt(saturate(1.0f - dot(float2(_439, _440), float2(_439, _440)))) - (WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_528 < (uint)170000), _528, 0)) + 0u))]._edgeBlurNoiseDissolve) * 0.75f)) * 2.0f) + -0.5f);
    } else {
      _543 = 1.0f;
    }
    _546 = _515;
    _547 = _516;
    _548 = (((_212 * _134) + exp2(log2(max(0.0f, (_175 + -0.8359375f)) / (18.8515625f - (_175 * 18.6875f))) * 6.277394771575928f)) * 10000.0f);
    _549 = (((_212 * _135) + exp2(log2(max(0.0f, (_176 + -0.8359375f)) / (18.8515625f - (_176 * 18.6875f))) * 6.277394771575928f)) * 10000.0f);
    _550 = (((_212 * _136) + exp2(log2(max(0.0f, (_177 + -0.8359375f)) / (18.8515625f - (_177 * 18.6875f))) * 6.277394771575928f)) * 10000.0f);
    _551 = ((_492 * saturate((1.0f - abs((_164.w * 2.0f) + -1.0f)) * 4.0f)) * _543);
  } else {
    _546 = _137;
    _547 = _138;
    _548 = _137;
    _549 = _138;
    _550 = _139;
    _551 = 0.0f;
  }
  float _552 = _551 * _148;
  float _559 = (_552 * (_548 - _546)) + _546;
  float _560 = (_552 * (_549 - _547)) + _547;
  float _561 = (_552 * (_550 - _139)) + _139;
  uint _562 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _569 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_562), 0));
    _575 = (float((uint)((uint)(_569.x & 127))) + 0.5f);
  } else {
    _575 = 1.0f;
  }
  bool _578 = (_localToneMappingParams.w > 0.0f);
  if (_578) {
    float3 output_color = TonemapReplacer(float3(_559, _560, _561));
    _931 = output_color.x;
    _932 = output_color.y;
    _933 = output_color.z;
  } else {
    _931 = _559;
    _932 = _560;
    _933 = _561;
  }
  if (_etcParams.y > 1.0f) {
    float _942 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _943 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _947 = saturate(1.0f - (dot(float2(_942, _943), float2(_942, _943)) * saturate(_etcParams.y + -1.0f)));
    _952 = (_947 * _931);
    _953 = (_947 * _932);
    _954 = (_947 * _933);
  } else {
    _952 = _931;
    _953 = _932;
    _954 = _933;
  }
  if ((_578) && ((_etcParams.z > 0.0f))) {
    _984 = select((_952 <= 0.0031308000907301903f), (_952 * 12.920000076293945f), (((pow(_952, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _985 = select((_953 <= 0.0031308000907301903f), (_953 * 12.920000076293945f), (((pow(_953, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _986 = select((_954 <= 0.0031308000907301903f), (_954 * 12.920000076293945f), (((pow(_954, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _984 = _952;
    _985 = _953;
    _986 = _954;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _991 = float((uint)_562);
    if (!(_991 < _viewDir.w)) {
      if (!(_991 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _1000 = _984;
        _1001 = _985;
        _1002 = _986;
      } else {
        _1000 = 0.0f;
        _1001 = 0.0f;
        _1002 = 0.0f;
      }
    } else {
      _1000 = 0.0f;
      _1001 = 0.0f;
      _1002 = 0.0f;
    }
  } else {
    _1000 = _984;
    _1001 = _985;
    _1002 = _986;
  }
  float _1012 = exp2(log2(_1000 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1013 = exp2(log2(_1001 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1014 = exp2(log2(_1002 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_1012 * 18.6875f) + 1.0f)) * ((_1012 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_1013 * 18.6875f) + 1.0f)) * ((_1013 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_1014 * 18.6875f) + 1.0f)) * ((_1014 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _575;
  return SV_Target;
}