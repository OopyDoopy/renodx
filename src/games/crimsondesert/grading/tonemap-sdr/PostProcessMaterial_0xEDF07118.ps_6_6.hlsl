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

Texture2D<float> __3__36__0__0__g_depth : register(t40, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t33, space36);

Texture2D<uint> __3__36__0__0__g_CustomRenderPassValue : register(t79, space36);

Texture2D<float4> __3__36__0__0__g_CustomRenderPassDepth : register(t80, space36);

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

ConstantBuffer<PostProcessEdgeBlur_CDStruct> BindlessParameters_PostProcessEdgeBlur_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  int _34 = WaveReadLaneFirst(_materialIndex);
  int _48 = WaveReadLaneFirst(_materialIndex);
  float _206;
  float _207;
  float _1751;
  float _1752;
  float _1753;
  float _1754;
  float _1768;
  float _1973;
  float _1974;
  float _1975;
  float _2068;
  float _2069;
  float _2070;
  float _2124;
  float _2125;
  float _2126;
  float _2145;
  float _2146;
  float _2147;
  float _2177;
  float _2178;
  float _2179;
  float _2193;
  float _2194;
  float _2195;
  if (WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_48 < (uint)170000), _48, 0)) + 0u))]._useTargetFocusDir) > 0.0010000000474974513f) {
    int _63 = WaveReadLaneFirst(_materialIndex);
    float _83 = (WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_63 < (uint)170000), _63, 0)) + 0u))]._targetFocusPositionOffset.x) + _targetFocusPosition.x) - _viewPos.x;
    float _84 = (WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_63 < (uint)170000), _63, 0)) + 0u))]._targetFocusPositionOffset.y) + _targetFocusPosition.y) - _viewPos.y;
    float _85 = (WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_63 < (uint)170000), _63, 0)) + 0u))]._targetFocusPositionOffset.z) + _targetFocusPosition.z) - _viewPos.z;
    float _87 = rsqrt(dot(float3(_83, _84, _85), float3(_83, _84, _85)));
    float _88 = _83 * _87;
    float _90 = _85 * _87;
    float _92 = (TEXCOORD.x * 2.0f) + -1.0f;
    float _95 = ((1.0f - TEXCOORD.y) * 2.0f) + -1.0f;
    float _131 = ((_invViewProjRelative[3].w) + (_invViewProjRelative[3].z)) + mad((_invViewProjRelative[3].y), _95, ((_invViewProjRelative[3].x) * _92));
    float _132 = ((mad((_invViewProjRelative[0].y), _95, ((_invViewProjRelative[0].x) * _92)) + (_invViewProjRelative[0].z)) + (_invViewProjRelative[0].w)) / _131;
    float _133 = (((_invViewProjRelative[1].w) + (_invViewProjRelative[1].z)) + mad((_invViewProjRelative[1].y), _95, ((_invViewProjRelative[1].x) * _92))) / _131;
    float _134 = (((_invViewProjRelative[2].w) + (_invViewProjRelative[2].z)) + mad((_invViewProjRelative[2].y), _95, ((_invViewProjRelative[2].x) * _92))) / _131;
    float _136 = rsqrt(dot(float3(_132, _133, _134), float3(_132, _133, _134)));
    float _137 = _136 * _132;
    float _138 = _136 * _133;
    float _139 = _136 * _134;
    float _140 = -0.0f - _88;
    float _142 = acos(dot(float3(0.0f, 1.0f, 0.0f), float3(_88, (_84 * _87), _90)));
    float _143 = sin(_142);
    float _144 = cos(_142);
    float _145 = 1.0f - _144;
    float _146 = _145 * _90;
    float _147 = _145 * _140;
    float _148 = _143 * _90;
    float _149 = _143 * _140;
    float _158 = mad((_147 * _90), _139, mad(_149, _138, (((_146 * _90) + _144) * _137)));
    float _162 = mad(_148, _139, mad(_144, _138, (-0.0f - (_137 * _149))));
    float _166 = mad(((_147 * _140) + _144), _139, mad((-0.0f - _148), _138, ((_137 * _140) * _146)));
    float _168 = rsqrt(dot(float3(_158, _162, _166), float3(_158, _162, _166)));
    float _169 = _168 * _158;
    float _171 = _168 * _166;
    float _173 = atan(_171 / _169);
    bool _176 = (_169 < 0.0f);
    bool _177 = (_169 == 0.0f);
    bool _178 = (_171 >= 0.0f);
    bool _179 = (_171 < 0.0f);
    int _192 = WaveReadLaneFirst(_materialIndex);
    _206 = (select(((_177) && (_178)), 0.75f, select(((_177) && (_179)), 0.25f, ((select(((_176) && (_179)), (_173 + -3.1415927410125732f), select(((_176) && (_178)), (_173 + 3.1415927410125732f), _173)) * 0.15915493667125702f) + 0.5f))) * WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_192 < (uint)170000), _192, 0)) + 0u))]._edgeBlurNoiseScale.x));
    _207 = ((acos(_168 * _162) * 0.31830987334251404f) * WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_192 < (uint)170000), _192, 0)) + 0u))]._edgeBlurNoiseScale.y));
  } else {
    _206 = (((_screenSizeAndInvSize.x / _screenSizeAndInvSize.y) * TEXCOORD.x) * WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_34 < (uint)170000), _34, 0)) + 0u))]._edgeBlurNoiseScale.x));
    _207 = (WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_34 < (uint)170000), _34, 0)) + 0u))]._edgeBlurNoiseScale.y) * TEXCOORD.y);
  }
  int _210 = WaveReadLaneFirst(_materialIndex);
  int _225 = WaveReadLaneFirst(_materialIndex);
  int _233 = WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_225 < (uint)170000), _225, 0)) + 0u))]._edgeBlurNoiseTex);
  float4 _240 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_233 < (uint)65000), _233, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_210 < (uint)170000), _210, 0)) + 0u))]._edgeBlurNoiseSpeed.x) * _time.x) + _206), ((WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_210 < (uint)170000), _210, 0)) + 0u))]._edgeBlurNoiseSpeed.y) * _time.x) + _207)));
  int _245 = WaveReadLaneFirst(_materialIndex);
  float _254 = WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_245 < (uint)170000), _245, 0)) + 0u))]._edgeBlurNoiseOffset) + -0.9960784316062927f;
  int _257 = WaveReadLaneFirst(_materialIndex);
  float _265 = WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_257 < (uint)170000), _257, 0)) + 0u))]._edgeBlurShiftValue);
  int _266 = WaveReadLaneFirst(_materialIndex);
  float _274 = WaveReadLaneFirst(BindlessParameters_PostProcessEdgeBlur_CD[((int)((uint)(select(((uint)_266 < (uint)170000), _266, 0)) + 0u))]._edgeBlurNoiseIntensity);
  float _279 = ((_274 * (_254 + (_240.x * 2.0f))) + 1.0f) * _265;
  float _280 = ((_274 * (_254 + (_240.y * 2.0f))) + 1.0f) * _265;
  if (_passIndex == 0) {
    int2 _284; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_284.x, _284.y);
    uint _299 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_284.x))))) + 0.5f) * TEXCOORD.x), int((float((int)(int(float((int)(_284.y))))) + 0.5f) * TEXCOORD.y), 0));
    float4 _310 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * TEXCOORD.x), int(_customRenderPassSizeInvSize.y * TEXCOORD.y), 0));
    float _314 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    float4 _325 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    float _335 = (pow(_325.x, 0.012683313339948654f));
    float _336 = (pow(_325.y, 0.012683313339948654f));
    float _337 = (pow(_325.z, 0.012683313339948654f));
    _1751 = (exp2(log2(max(0.0f, (_335 + -0.8359375f)) / (18.8515625f - (_335 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
    _1752 = (exp2(log2(max(0.0f, (_336 + -0.8359375f)) / (18.8515625f - (_336 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
    _1753 = (exp2(log2(max(0.0f, (_337 + -0.8359375f)) / (18.8515625f - (_337 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
    _1754 = select((((((_nearFarProj.x / max(1.0000000116860974e-07f, _310.x)) - (_nearFarProj.x / max(1.0000000116860974e-07f, _314.x))) < 0.10000000149011612f)) && (((_299.x & 255) == _renderPassTargetFocus))), 1.0f, 0.0f);
  } else {
    if (_passIndex == 1) {
      float4 _375 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
      float _386 = (pow(_375.x, 0.012683313339948654f));
      float _387 = (pow(_375.y, 0.012683313339948654f));
      float _388 = (pow(_375.z, 0.012683313339948654f));
      float _413 = _279 * _screenSizeAndInvSize.z;
      float _414 = _413 * 1.384615421295166f;
      float4 _416 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_414 + TEXCOORD.x), TEXCOORD.y));
      float _427 = (pow(_416.x, 0.012683313339948654f));
      float _428 = (pow(_416.y, 0.012683313339948654f));
      float _429 = (pow(_416.z, 0.012683313339948654f));
      float4 _455 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _414), TEXCOORD.y));
      float _466 = (pow(_455.x, 0.012683313339948654f));
      float _467 = (pow(_455.y, 0.012683313339948654f));
      float _468 = (pow(_455.z, 0.012683313339948654f));
      float _493 = _413 * 3.230769157409668f;
      float4 _495 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_493 + TEXCOORD.x), TEXCOORD.y));
      float _506 = (pow(_495.x, 0.012683313339948654f));
      float _507 = (pow(_495.y, 0.012683313339948654f));
      float _508 = (pow(_495.z, 0.012683313339948654f));
      float4 _534 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _493), TEXCOORD.y));
      float _545 = (pow(_534.x, 0.012683313339948654f));
      float _546 = (pow(_534.y, 0.012683313339948654f));
      float _547 = (pow(_534.z, 0.012683313339948654f));
      _1751 = ((((exp2(log2(max(0.0f, (_466 + -0.8359375f)) / (18.8515625f - (_466 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_427 + -0.8359375f)) / (18.8515625f - (_427 * 18.6875f))) * 6.277394771575928f)) * 3162.162353515625f) + (exp2(log2(max(0.0f, (_386 + -0.8359375f)) / (18.8515625f - (_386 * 18.6875f))) * 6.277394771575928f) * 2270.270263671875f)) + ((exp2(log2(max(0.0f, (_545 + -0.8359375f)) / (18.8515625f - (_545 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_506 + -0.8359375f)) / (18.8515625f - (_506 * 18.6875f))) * 6.277394771575928f)) * 702.7026977539062f));
      _1752 = ((((exp2(log2(max(0.0f, (_467 + -0.8359375f)) / (18.8515625f - (_467 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_428 + -0.8359375f)) / (18.8515625f - (_428 * 18.6875f))) * 6.277394771575928f)) * 3162.162353515625f) + (exp2(log2(max(0.0f, (_387 + -0.8359375f)) / (18.8515625f - (_387 * 18.6875f))) * 6.277394771575928f) * 2270.270263671875f)) + ((exp2(log2(max(0.0f, (_546 + -0.8359375f)) / (18.8515625f - (_546 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_507 + -0.8359375f)) / (18.8515625f - (_507 * 18.6875f))) * 6.277394771575928f)) * 702.7026977539062f));
      _1753 = ((((exp2(log2(max(0.0f, (_468 + -0.8359375f)) / (18.8515625f - (_468 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_429 + -0.8359375f)) / (18.8515625f - (_429 * 18.6875f))) * 6.277394771575928f)) * 3162.162353515625f) + (exp2(log2(max(0.0f, (_388 + -0.8359375f)) / (18.8515625f - (_388 * 18.6875f))) * 6.277394771575928f) * 2270.270263671875f)) + ((exp2(log2(max(0.0f, (_547 + -0.8359375f)) / (18.8515625f - (_547 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_508 + -0.8359375f)) / (18.8515625f - (_508 * 18.6875f))) * 6.277394771575928f)) * 702.7026977539062f));
      _1754 = ((((_455.w + _416.w) * 0.31621623039245605f) + (_375.w * 0.227027028799057f)) + ((_534.w + _495.w) * 0.07027027010917664f));
    } else {
      if (_passIndex == 2) {
        float4 _605 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
        float _616 = (pow(_605.x, 0.012683313339948654f));
        float _617 = (pow(_605.y, 0.012683313339948654f));
        float _618 = (pow(_605.z, 0.012683313339948654f));
        float _643 = _280 * _screenSizeAndInvSize.w;
        float _644 = _643 * 1.384615421295166f;
        float4 _646 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (_644 + TEXCOORD.y)));
        float _657 = (pow(_646.x, 0.012683313339948654f));
        float _658 = (pow(_646.y, 0.012683313339948654f));
        float _659 = (pow(_646.z, 0.012683313339948654f));
        float4 _685 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (TEXCOORD.y - _644)));
        float _696 = (pow(_685.x, 0.012683313339948654f));
        float _697 = (pow(_685.y, 0.012683313339948654f));
        float _698 = (pow(_685.z, 0.012683313339948654f));
        float _723 = _643 * 3.230769157409668f;
        float4 _725 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (_723 + TEXCOORD.y)));
        float _736 = (pow(_725.x, 0.012683313339948654f));
        float _737 = (pow(_725.y, 0.012683313339948654f));
        float _738 = (pow(_725.z, 0.012683313339948654f));
        float4 _764 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (TEXCOORD.y - _723)));
        float _775 = (pow(_764.x, 0.012683313339948654f));
        float _776 = (pow(_764.y, 0.012683313339948654f));
        float _777 = (pow(_764.z, 0.012683313339948654f));
        _1751 = ((((exp2(log2(max(0.0f, (_696 + -0.8359375f)) / (18.8515625f - (_696 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_657 + -0.8359375f)) / (18.8515625f - (_657 * 18.6875f))) * 6.277394771575928f)) * 3162.162353515625f) + (exp2(log2(max(0.0f, (_616 + -0.8359375f)) / (18.8515625f - (_616 * 18.6875f))) * 6.277394771575928f) * 2270.270263671875f)) + ((exp2(log2(max(0.0f, (_775 + -0.8359375f)) / (18.8515625f - (_775 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_736 + -0.8359375f)) / (18.8515625f - (_736 * 18.6875f))) * 6.277394771575928f)) * 702.7026977539062f));
        _1752 = ((((exp2(log2(max(0.0f, (_697 + -0.8359375f)) / (18.8515625f - (_697 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_658 + -0.8359375f)) / (18.8515625f - (_658 * 18.6875f))) * 6.277394771575928f)) * 3162.162353515625f) + (exp2(log2(max(0.0f, (_617 + -0.8359375f)) / (18.8515625f - (_617 * 18.6875f))) * 6.277394771575928f) * 2270.270263671875f)) + ((exp2(log2(max(0.0f, (_776 + -0.8359375f)) / (18.8515625f - (_776 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_737 + -0.8359375f)) / (18.8515625f - (_737 * 18.6875f))) * 6.277394771575928f)) * 702.7026977539062f));
        _1753 = ((((exp2(log2(max(0.0f, (_698 + -0.8359375f)) / (18.8515625f - (_698 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_659 + -0.8359375f)) / (18.8515625f - (_659 * 18.6875f))) * 6.277394771575928f)) * 3162.162353515625f) + (exp2(log2(max(0.0f, (_618 + -0.8359375f)) / (18.8515625f - (_618 * 18.6875f))) * 6.277394771575928f) * 2270.270263671875f)) + ((exp2(log2(max(0.0f, (_777 + -0.8359375f)) / (18.8515625f - (_777 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_738 + -0.8359375f)) / (18.8515625f - (_738 * 18.6875f))) * 6.277394771575928f)) * 702.7026977539062f));
        _1754 = ((((_685.w + _646.w) * 0.31621623039245605f) + (_605.w * 0.227027028799057f)) + ((_764.w + _725.w) * 0.07027027010917664f));
      } else {
        if (_passIndex == 3) {
          float4 _835 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
          float _846 = (pow(_835.x, 0.012683313339948654f));
          float _847 = (pow(_835.y, 0.012683313339948654f));
          float _848 = (pow(_835.z, 0.012683313339948654f));
          float _873 = _279 * _screenSizeAndInvSize.z;
          float _874 = _873 * 2.769230842590332f;
          float4 _876 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_874 + TEXCOORD.x), TEXCOORD.y));
          float _887 = (pow(_876.x, 0.012683313339948654f));
          float _888 = (pow(_876.y, 0.012683313339948654f));
          float _889 = (pow(_876.z, 0.012683313339948654f));
          float4 _915 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _874), TEXCOORD.y));
          float _926 = (pow(_915.x, 0.012683313339948654f));
          float _927 = (pow(_915.y, 0.012683313339948654f));
          float _928 = (pow(_915.z, 0.012683313339948654f));
          float _953 = _873 * 6.461538314819336f;
          float4 _955 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_953 + TEXCOORD.x), TEXCOORD.y));
          float _966 = (pow(_955.x, 0.012683313339948654f));
          float _967 = (pow(_955.y, 0.012683313339948654f));
          float _968 = (pow(_955.z, 0.012683313339948654f));
          float4 _994 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _953), TEXCOORD.y));
          float _1005 = (pow(_994.x, 0.012683313339948654f));
          float _1006 = (pow(_994.y, 0.012683313339948654f));
          float _1007 = (pow(_994.z, 0.012683313339948654f));
          _1751 = ((((exp2(log2(max(0.0f, (_926 + -0.8359375f)) / (18.8515625f - (_926 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_887 + -0.8359375f)) / (18.8515625f - (_887 * 18.6875f))) * 6.277394771575928f)) * 3162.162353515625f) + (exp2(log2(max(0.0f, (_846 + -0.8359375f)) / (18.8515625f - (_846 * 18.6875f))) * 6.277394771575928f) * 2270.270263671875f)) + ((exp2(log2(max(0.0f, (_1005 + -0.8359375f)) / (18.8515625f - (_1005 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_966 + -0.8359375f)) / (18.8515625f - (_966 * 18.6875f))) * 6.277394771575928f)) * 702.7026977539062f));
          _1752 = ((((exp2(log2(max(0.0f, (_927 + -0.8359375f)) / (18.8515625f - (_927 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_888 + -0.8359375f)) / (18.8515625f - (_888 * 18.6875f))) * 6.277394771575928f)) * 3162.162353515625f) + (exp2(log2(max(0.0f, (_847 + -0.8359375f)) / (18.8515625f - (_847 * 18.6875f))) * 6.277394771575928f) * 2270.270263671875f)) + ((exp2(log2(max(0.0f, (_1006 + -0.8359375f)) / (18.8515625f - (_1006 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_967 + -0.8359375f)) / (18.8515625f - (_967 * 18.6875f))) * 6.277394771575928f)) * 702.7026977539062f));
          _1753 = ((((exp2(log2(max(0.0f, (_928 + -0.8359375f)) / (18.8515625f - (_928 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_889 + -0.8359375f)) / (18.8515625f - (_889 * 18.6875f))) * 6.277394771575928f)) * 3162.162353515625f) + (exp2(log2(max(0.0f, (_848 + -0.8359375f)) / (18.8515625f - (_848 * 18.6875f))) * 6.277394771575928f) * 2270.270263671875f)) + ((exp2(log2(max(0.0f, (_1007 + -0.8359375f)) / (18.8515625f - (_1007 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_968 + -0.8359375f)) / (18.8515625f - (_968 * 18.6875f))) * 6.277394771575928f)) * 702.7026977539062f));
          _1754 = ((((_915.w + _876.w) * 0.31621623039245605f) + (_835.w * 0.227027028799057f)) + ((_994.w + _955.w) * 0.07027027010917664f));
        } else {
          if (_passIndex == 4) {
            float4 _1065 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
            float _1076 = (pow(_1065.x, 0.012683313339948654f));
            float _1077 = (pow(_1065.y, 0.012683313339948654f));
            float _1078 = (pow(_1065.z, 0.012683313339948654f));
            float _1103 = _280 * _screenSizeAndInvSize.w;
            float _1104 = _1103 * 2.769230842590332f;
            float4 _1106 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (_1104 + TEXCOORD.y)));
            float _1117 = (pow(_1106.x, 0.012683313339948654f));
            float _1118 = (pow(_1106.y, 0.012683313339948654f));
            float _1119 = (pow(_1106.z, 0.012683313339948654f));
            float4 _1145 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (TEXCOORD.y - _1104)));
            float _1156 = (pow(_1145.x, 0.012683313339948654f));
            float _1157 = (pow(_1145.y, 0.012683313339948654f));
            float _1158 = (pow(_1145.z, 0.012683313339948654f));
            float _1183 = _1103 * 6.461538314819336f;
            float4 _1185 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (_1183 + TEXCOORD.y)));
            float _1196 = (pow(_1185.x, 0.012683313339948654f));
            float _1197 = (pow(_1185.y, 0.012683313339948654f));
            float _1198 = (pow(_1185.z, 0.012683313339948654f));
            float4 _1224 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (TEXCOORD.y - _1183)));
            float _1235 = (pow(_1224.x, 0.012683313339948654f));
            float _1236 = (pow(_1224.y, 0.012683313339948654f));
            float _1237 = (pow(_1224.z, 0.012683313339948654f));
            _1751 = ((((exp2(log2(max(0.0f, (_1156 + -0.8359375f)) / (18.8515625f - (_1156 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_1117 + -0.8359375f)) / (18.8515625f - (_1117 * 18.6875f))) * 6.277394771575928f)) * 3162.162353515625f) + (exp2(log2(max(0.0f, (_1076 + -0.8359375f)) / (18.8515625f - (_1076 * 18.6875f))) * 6.277394771575928f) * 2270.270263671875f)) + ((exp2(log2(max(0.0f, (_1235 + -0.8359375f)) / (18.8515625f - (_1235 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_1196 + -0.8359375f)) / (18.8515625f - (_1196 * 18.6875f))) * 6.277394771575928f)) * 702.7026977539062f));
            _1752 = ((((exp2(log2(max(0.0f, (_1157 + -0.8359375f)) / (18.8515625f - (_1157 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_1118 + -0.8359375f)) / (18.8515625f - (_1118 * 18.6875f))) * 6.277394771575928f)) * 3162.162353515625f) + (exp2(log2(max(0.0f, (_1077 + -0.8359375f)) / (18.8515625f - (_1077 * 18.6875f))) * 6.277394771575928f) * 2270.270263671875f)) + ((exp2(log2(max(0.0f, (_1236 + -0.8359375f)) / (18.8515625f - (_1236 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_1197 + -0.8359375f)) / (18.8515625f - (_1197 * 18.6875f))) * 6.277394771575928f)) * 702.7026977539062f));
            _1753 = ((((exp2(log2(max(0.0f, (_1158 + -0.8359375f)) / (18.8515625f - (_1158 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_1119 + -0.8359375f)) / (18.8515625f - (_1119 * 18.6875f))) * 6.277394771575928f)) * 3162.162353515625f) + (exp2(log2(max(0.0f, (_1078 + -0.8359375f)) / (18.8515625f - (_1078 * 18.6875f))) * 6.277394771575928f) * 2270.270263671875f)) + ((exp2(log2(max(0.0f, (_1237 + -0.8359375f)) / (18.8515625f - (_1237 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_1198 + -0.8359375f)) / (18.8515625f - (_1198 * 18.6875f))) * 6.277394771575928f)) * 702.7026977539062f));
            _1754 = ((((_1145.w + _1106.w) * 0.31621623039245605f) + (_1065.w * 0.227027028799057f)) + ((_1224.w + _1185.w) * 0.07027027010917664f));
          } else {
            if (_passIndex == 5) {
              float4 _1295 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
              float _1306 = (pow(_1295.x, 0.012683313339948654f));
              float _1307 = (pow(_1295.y, 0.012683313339948654f));
              float _1308 = (pow(_1295.z, 0.012683313339948654f));
              float _1333 = _279 * _screenSizeAndInvSize.z;
              float _1334 = _1333 * 5.538461685180664f;
              float4 _1336 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_1334 + TEXCOORD.x), TEXCOORD.y));
              float _1347 = (pow(_1336.x, 0.012683313339948654f));
              float _1348 = (pow(_1336.y, 0.012683313339948654f));
              float _1349 = (pow(_1336.z, 0.012683313339948654f));
              float4 _1375 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _1334), TEXCOORD.y));
              float _1386 = (pow(_1375.x, 0.012683313339948654f));
              float _1387 = (pow(_1375.y, 0.012683313339948654f));
              float _1388 = (pow(_1375.z, 0.012683313339948654f));
              float _1413 = _1333 * 12.923076629638672f;
              float4 _1415 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_1413 + TEXCOORD.x), TEXCOORD.y));
              float _1426 = (pow(_1415.x, 0.012683313339948654f));
              float _1427 = (pow(_1415.y, 0.012683313339948654f));
              float _1428 = (pow(_1415.z, 0.012683313339948654f));
              float4 _1454 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _1413), TEXCOORD.y));
              float _1465 = (pow(_1454.x, 0.012683313339948654f));
              float _1466 = (pow(_1454.y, 0.012683313339948654f));
              float _1467 = (pow(_1454.z, 0.012683313339948654f));
              _1751 = ((((exp2(log2(max(0.0f, (_1386 + -0.8359375f)) / (18.8515625f - (_1386 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_1347 + -0.8359375f)) / (18.8515625f - (_1347 * 18.6875f))) * 6.277394771575928f)) * 3162.162353515625f) + (exp2(log2(max(0.0f, (_1306 + -0.8359375f)) / (18.8515625f - (_1306 * 18.6875f))) * 6.277394771575928f) * 2270.270263671875f)) + ((exp2(log2(max(0.0f, (_1465 + -0.8359375f)) / (18.8515625f - (_1465 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_1426 + -0.8359375f)) / (18.8515625f - (_1426 * 18.6875f))) * 6.277394771575928f)) * 702.7026977539062f));
              _1752 = ((((exp2(log2(max(0.0f, (_1387 + -0.8359375f)) / (18.8515625f - (_1387 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_1348 + -0.8359375f)) / (18.8515625f - (_1348 * 18.6875f))) * 6.277394771575928f)) * 3162.162353515625f) + (exp2(log2(max(0.0f, (_1307 + -0.8359375f)) / (18.8515625f - (_1307 * 18.6875f))) * 6.277394771575928f) * 2270.270263671875f)) + ((exp2(log2(max(0.0f, (_1466 + -0.8359375f)) / (18.8515625f - (_1466 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_1427 + -0.8359375f)) / (18.8515625f - (_1427 * 18.6875f))) * 6.277394771575928f)) * 702.7026977539062f));
              _1753 = ((((exp2(log2(max(0.0f, (_1388 + -0.8359375f)) / (18.8515625f - (_1388 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_1349 + -0.8359375f)) / (18.8515625f - (_1349 * 18.6875f))) * 6.277394771575928f)) * 3162.162353515625f) + (exp2(log2(max(0.0f, (_1308 + -0.8359375f)) / (18.8515625f - (_1308 * 18.6875f))) * 6.277394771575928f) * 2270.270263671875f)) + ((exp2(log2(max(0.0f, (_1467 + -0.8359375f)) / (18.8515625f - (_1467 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_1428 + -0.8359375f)) / (18.8515625f - (_1428 * 18.6875f))) * 6.277394771575928f)) * 702.7026977539062f));
              _1754 = ((((_1375.w + _1336.w) * 0.31621623039245605f) + (_1295.w * 0.227027028799057f)) + ((_1454.w + _1415.w) * 0.07027027010917664f));
            } else {
              if (_passIndex == 6) {
                float4 _1525 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
                float _1536 = (pow(_1525.x, 0.012683313339948654f));
                float _1537 = (pow(_1525.y, 0.012683313339948654f));
                float _1538 = (pow(_1525.z, 0.012683313339948654f));
                float _1563 = _280 * _screenSizeAndInvSize.w;
                float _1564 = _1563 * 5.538461685180664f;
                float4 _1566 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (_1564 + TEXCOORD.y)));
                float _1577 = (pow(_1566.x, 0.012683313339948654f));
                float _1578 = (pow(_1566.y, 0.012683313339948654f));
                float _1579 = (pow(_1566.z, 0.012683313339948654f));
                float4 _1605 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (TEXCOORD.y - _1564)));
                float _1616 = (pow(_1605.x, 0.012683313339948654f));
                float _1617 = (pow(_1605.y, 0.012683313339948654f));
                float _1618 = (pow(_1605.z, 0.012683313339948654f));
                float _1643 = _1563 * 12.923076629638672f;
                float4 _1645 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (_1643 + TEXCOORD.y)));
                float _1656 = (pow(_1645.x, 0.012683313339948654f));
                float _1657 = (pow(_1645.y, 0.012683313339948654f));
                float _1658 = (pow(_1645.z, 0.012683313339948654f));
                float4 _1684 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (TEXCOORD.y - _1643)));
                float _1695 = (pow(_1684.x, 0.012683313339948654f));
                float _1696 = (pow(_1684.y, 0.012683313339948654f));
                float _1697 = (pow(_1684.z, 0.012683313339948654f));
                _1751 = ((((exp2(log2(max(0.0f, (_1616 + -0.8359375f)) / (18.8515625f - (_1616 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_1577 + -0.8359375f)) / (18.8515625f - (_1577 * 18.6875f))) * 6.277394771575928f)) * 3162.162353515625f) + (exp2(log2(max(0.0f, (_1536 + -0.8359375f)) / (18.8515625f - (_1536 * 18.6875f))) * 6.277394771575928f) * 2270.270263671875f)) + ((exp2(log2(max(0.0f, (_1695 + -0.8359375f)) / (18.8515625f - (_1695 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_1656 + -0.8359375f)) / (18.8515625f - (_1656 * 18.6875f))) * 6.277394771575928f)) * 702.7026977539062f));
                _1752 = ((((exp2(log2(max(0.0f, (_1617 + -0.8359375f)) / (18.8515625f - (_1617 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_1578 + -0.8359375f)) / (18.8515625f - (_1578 * 18.6875f))) * 6.277394771575928f)) * 3162.162353515625f) + (exp2(log2(max(0.0f, (_1537 + -0.8359375f)) / (18.8515625f - (_1537 * 18.6875f))) * 6.277394771575928f) * 2270.270263671875f)) + ((exp2(log2(max(0.0f, (_1696 + -0.8359375f)) / (18.8515625f - (_1696 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_1657 + -0.8359375f)) / (18.8515625f - (_1657 * 18.6875f))) * 6.277394771575928f)) * 702.7026977539062f));
                _1753 = ((((exp2(log2(max(0.0f, (_1618 + -0.8359375f)) / (18.8515625f - (_1618 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_1579 + -0.8359375f)) / (18.8515625f - (_1579 * 18.6875f))) * 6.277394771575928f)) * 3162.162353515625f) + (exp2(log2(max(0.0f, (_1538 + -0.8359375f)) / (18.8515625f - (_1538 * 18.6875f))) * 6.277394771575928f) * 2270.270263671875f)) + ((exp2(log2(max(0.0f, (_1697 + -0.8359375f)) / (18.8515625f - (_1697 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_1658 + -0.8359375f)) / (18.8515625f - (_1658 * 18.6875f))) * 6.277394771575928f)) * 702.7026977539062f));
                _1754 = ((((_1605.w + _1566.w) * 0.31621623039245605f) + (_1525.w * 0.227027028799057f)) + ((_1684.w + _1645.w) * 0.07027027010917664f));
              } else {
                _1751 = 0.0f;
                _1752 = 0.0f;
                _1753 = 0.0f;
                _1754 = 0.0f;
              }
            }
          }
        }
      }
    }
  }
  uint _1755 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _1762 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_1755), 0));
    _1768 = (float((uint)((uint)(_1762.x & 127))) + 0.5f);
  } else {
    _1768 = _1754;
  }
  bool _1771 = (_localToneMappingParams.w > 0.0f);
  if (_1771) {
    float3 output_color = TonemapReplacer(float3(_1751, _1752, _1753));
    _2124 = output_color.x;
    _2125 = output_color.y;
    _2126 = output_color.z;
  } else {
    _2124 = _1751;
    _2125 = _1752;
    _2126 = _1753;
  }
  if (_etcParams.y > 1.0f) {
    float _2135 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _2136 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _2140 = saturate(1.0f - (dot(float2(_2135, _2136), float2(_2135, _2136)) * saturate(_etcParams.y + -1.0f)));
    _2145 = (_2140 * _2124);
    _2146 = (_2140 * _2125);
    _2147 = (_2140 * _2126);
  } else {
    _2145 = _2124;
    _2146 = _2125;
    _2147 = _2126;
  }
  if ((_1771) && ((_etcParams.z > 0.0f))) {
    _2177 = select((_2145 <= 0.0031308000907301903f), (_2145 * 12.920000076293945f), (((pow(_2145, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _2178 = select((_2146 <= 0.0031308000907301903f), (_2146 * 12.920000076293945f), (((pow(_2146, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _2179 = select((_2147 <= 0.0031308000907301903f), (_2147 * 12.920000076293945f), (((pow(_2147, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _2177 = _2145;
    _2178 = _2146;
    _2179 = _2147;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _2184 = float((uint)_1755);
    if (!(_2184 < _viewDir.w)) {
      if (!(_2184 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _2193 = _2177;
        _2194 = _2178;
        _2195 = _2179;
      } else {
        _2193 = 0.0f;
        _2194 = 0.0f;
        _2195 = 0.0f;
      }
    } else {
      _2193 = 0.0f;
      _2194 = 0.0f;
      _2195 = 0.0f;
    }
  } else {
    _2193 = _2177;
    _2194 = _2178;
    _2195 = _2179;
  }
  float _2205 = exp2(log2(_2193 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _2206 = exp2(log2(_2194 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _2207 = exp2(log2(_2195 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_2205 * 18.6875f) + 1.0f)) * ((_2205 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_2206 * 18.6875f) + 1.0f)) * ((_2206 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_2207 * 18.6875f) + 1.0f)) * ((_2207 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _1768;
  return SV_Target;
}