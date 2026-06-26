struct PostProcessFocusStruct {
  float _focusRatio;
  float _focusSceneDepthFade;
  float _focusBackgroundSaturation;
  float _focus3DBlend;
  float _focusCharacterMaterialMask;
  float _focusColorBrightness;
  uint _focusColor;
  float _focusColorRemap;
  float _maskRatio;
  float _maskNoiseIntensity;
  float _maskBlurThickness;
  float _maskBlurPower;
  uint _maskNoiseTexture;
  float _playerFocusRadius;
  float _playerFocusCenterRadius;
  float _playerFocusPower;
  float3 _playerFocusPositionOffset;
  float _targetFocusRadius;
  float _targetFocusCenterRadius;
  float _targetFocusPower;
  float3 _targetFocusPositionOffset;
  float _connectPlayerTargetDistance;
  float _connectPlayerTargetPower;
  float _worldFocusRadius;
  float _worldFocusCenterRadius;
  float _worldFocusPower;
  float3 _worldFocusPosition;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t69, space36);

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

ConstantBuffer<PostProcessFocusStruct> BindlessParameters_PostProcessFocus[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _40 = _time.x * 0.05000000074505806f;
  int _43 = WaveReadLaneFirst(_materialIndex);
  int _51 = WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_43 < (uint)170000), _43, 0)) + 0u))]._maskNoiseTexture);
  float4 _58 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_51 < (uint)65000), _51, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_40 + (TEXCOORD.x * 16.0f)), (_40 + (TEXCOORD.y * 16.0f))));
  int _61 = WaveReadLaneFirst(_materialIndex);
  float _73 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  int _75 = WaveReadLaneFirst(_materialIndex);
  float _87 = ((((WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_61 < (uint)170000), _61, 0)) + 0u))]._maskNoiseIntensity) * (_58.z + -0.5f)) + 1.0f) * 50.0f) * _73.x) * WaveReadLaneFirst(BindlessParameters_PostProcessFocus[((int)((uint)(select(((uint)_75 < (uint)170000), _75, 0)) + 0u))]._maskBlurThickness);
  float _325;
  float _326;
  float _327;
  float _341;
  float _546;
  float _547;
  float _548;
  float _641;
  float _642;
  float _643;
  float _697;
  float _698;
  float _699;
  float _718;
  float _719;
  float _720;
  float _750;
  float _751;
  float _752;
  float _766;
  float _767;
  float _768;
  if (_passIndex == 0) {
    int2 _91; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_91.x, _91.y);
    uint _106 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_91.x))))) + 0.5f) * TEXCOORD.x), int((float((int)(int(float((int)(_91.y))))) + 0.5f) * TEXCOORD.y), 0));
    int _108 = _106.x & 255;
    float4 _117 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * TEXCOORD.x), int(_customRenderPassSizeInvSize.y * TEXCOORD.y), 0));
    if ((_108 == _renderPassTargetFocus) | (((_108 == _renderPassSelfPlayer)) || ((_108 == _renderPassTest)))) {
      _325 = 1.0f;
      _326 = _117.x;
      _327 = _117.x;
    } else {
      _325 = 0.0f;
      _326 = 0.0f;
      _327 = 0.0f;
    }
  } else {
    if (_passIndex == 1) {
      float4 _135 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
      float _142 = (pow(_135.x, 0.012683313339948654f));
      float _143 = (pow(_135.y, 0.012683313339948654f));
      float _160 = _87 * (1.0f / max(0.0010000000474974513f, _destTargetSizAndInv.x));
      float _161 = _160 * 1.384615421295166f;
      float4 _163 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_161 + TEXCOORD.x), TEXCOORD.y));
      float _167 = (pow(_163.x, 0.012683313339948654f));
      float4 _177 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _161), TEXCOORD.y));
      float _181 = (pow(_177.x, 0.012683313339948654f));
      float _190 = _160 * 3.230769157409668f;
      float4 _192 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_190 + TEXCOORD.x), TEXCOORD.y));
      float _196 = (pow(_192.x, 0.012683313339948654f));
      float4 _206 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _190), TEXCOORD.y));
      float _210 = (pow(_206.x, 0.012683313339948654f));
      _325 = ((((exp2(log2(max(0.0f, (_181 + -0.8359375f)) / (18.8515625f - (_181 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_167 + -0.8359375f)) / (18.8515625f - (_167 * 18.6875f))) * 6.277394771575928f)) * 3162.162353515625f) + (exp2(log2(max(0.0f, (_142 + -0.8359375f)) / (18.8515625f - (_142 * 18.6875f))) * 6.277394771575928f) * 2270.270263671875f)) + ((exp2(log2(max(0.0f, (_210 + -0.8359375f)) / (18.8515625f - (_210 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_196 + -0.8359375f)) / (18.8515625f - (_196 * 18.6875f))) * 6.277394771575928f)) * 702.7026977539062f));
      _326 = (exp2(log2(max(0.0f, (_143 + -0.8359375f)) / (18.8515625f - (_143 * 18.6875f))) * 6.277394771575928f) * 250000.0f);
      _327 = 0.0f;
    } else {
      if (_passIndex == 2) {
        float4 _232 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
        float _239 = (pow(_232.x, 0.012683313339948654f));
        float _240 = (pow(_232.y, 0.012683313339948654f));
        float _257 = _87 * (1.0f / max(0.0010000000474974513f, _destTargetSizAndInv.y));
        float _258 = _257 * 1.384615421295166f;
        float4 _260 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (_258 + TEXCOORD.y)));
        float _264 = (pow(_260.x, 0.012683313339948654f));
        float4 _274 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (TEXCOORD.y - _258)));
        float _278 = (pow(_274.x, 0.012683313339948654f));
        float _287 = _257 * 3.230769157409668f;
        float4 _289 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (_287 + TEXCOORD.y)));
        float _293 = (pow(_289.x, 0.012683313339948654f));
        float4 _303 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (TEXCOORD.y - _287)));
        float _307 = (pow(_303.x, 0.012683313339948654f));
        _325 = ((((exp2(log2(max(0.0f, (_278 + -0.8359375f)) / (18.8515625f - (_278 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_264 + -0.8359375f)) / (18.8515625f - (_264 * 18.6875f))) * 6.277394771575928f)) * 3162.162353515625f) + (exp2(log2(max(0.0f, (_239 + -0.8359375f)) / (18.8515625f - (_239 * 18.6875f))) * 6.277394771575928f) * 2270.270263671875f)) + ((exp2(log2(max(0.0f, (_307 + -0.8359375f)) / (18.8515625f - (_307 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_293 + -0.8359375f)) / (18.8515625f - (_293 * 18.6875f))) * 6.277394771575928f)) * 702.7026977539062f));
        _326 = (exp2(log2(max(0.0f, (_240 + -0.8359375f)) / (18.8515625f - (_240 * 18.6875f))) * 6.277394771575928f) * 250000.0f);
        _327 = 0.0f;
      } else {
        _325 = 0.0f;
        _326 = 0.0f;
        _327 = 0.0f;
      }
    }
  }
  uint _328 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _335 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_328), 0));
    _341 = (float((uint)((uint)(_335.x & 127))) + 0.5f);
  } else {
    _341 = 1.0f;
  }
  bool _344 = (_localToneMappingParams.w > 0.0f);
  if (_344) {
    float3 output_color = TonemapReplacer(float3(_325, _326, _327));
    _697 = output_color.x;
    _698 = output_color.y;
    _699 = output_color.z;
  } else {
    _697 = _325;
    _698 = _326;
    _699 = _327;
  }
  if (_etcParams.y > 1.0f) {
    float _708 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _709 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _713 = saturate(1.0f - (dot(float2(_708, _709), float2(_708, _709)) * saturate(_etcParams.y + -1.0f)));
    _718 = (_713 * _697);
    _719 = (_713 * _698);
    _720 = (_713 * _699);
  } else {
    _718 = _697;
    _719 = _698;
    _720 = _699;
  }
  if ((_344) && ((_etcParams.z > 0.0f))) {
    _750 = select((_718 <= 0.0031308000907301903f), (_718 * 12.920000076293945f), (((pow(_718, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _751 = select((_719 <= 0.0031308000907301903f), (_719 * 12.920000076293945f), (((pow(_719, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _752 = select((_720 <= 0.0031308000907301903f), (_720 * 12.920000076293945f), (((pow(_720, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _750 = _718;
    _751 = _719;
    _752 = _720;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _757 = float((uint)_328);
    if (!(_757 < _viewDir.w)) {
      if (!(_757 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _766 = _750;
        _767 = _751;
        _768 = _752;
      } else {
        _766 = 0.0f;
        _767 = 0.0f;
        _768 = 0.0f;
      }
    } else {
      _766 = 0.0f;
      _767 = 0.0f;
      _768 = 0.0f;
    }
  } else {
    _766 = _750;
    _767 = _751;
    _768 = _752;
  }
  float _778 = exp2(log2(_766 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _779 = exp2(log2(_767 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _780 = exp2(log2(_768 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_778 * 18.6875f) + 1.0f)) * ((_778 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_779 * 18.6875f) + 1.0f)) * ((_779 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_780 * 18.6875f) + 1.0f)) * ((_780 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _341;
  return SV_Target;
}