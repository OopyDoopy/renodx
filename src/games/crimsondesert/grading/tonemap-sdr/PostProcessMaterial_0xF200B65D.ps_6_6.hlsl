struct PostProcessUber_CDStruct {
  uint _noiseTex;
  float _itemRatio;
  float _borderRatio;
  float _borderWidth;
  float _borderSmoothness;
  float _borderEdgeNoiseRatio;
  float2 _borderEdgeNoiseOffset;
  float2 _borderEdgeNoiseTile;
  uint _borderColor;
  uint _borderEdgeNoiseTexture;
  float _borderFlickerSpeed;
  float _borderFlickerIntensity;
  float2 _borderFlickerOpacityMinMax;
  float _dropItemFakeLightIntensity;
  float _dropItemBlurWidth;
  float _dropItemBlurIntensity;
  float3 _channelBrightness;
  float _contrast;
  float3 _saturation;
  float _fishEyeMaxPower;
  uint _enemyMaskColor;
  uint _objectiveMaskColor;
  float _uiMainMenuEffect;
  float _uiQuickSlotEffect;
  uint _detectColorBase;
  float _detectModeG;
  float _detectModeR;
  float _detectModeB;
  float _detectModeKnowledge;
  float _detectModeInterrupt;
  uint _detectLiftColor;
  float _statusVignetteRatio1;
  float _statusVignetteRadius1;
  float _statusVignettePower1;
  float _statusVignetteChromaticShift1;
  uint _statusVignetteColor1;
  float _statusVignetteRatio2;
  float _statusVignetteRadius2;
  float _statusVignettePower2;
  float _statusVignetteChromaticShift2;
  uint _statusVignetteColor2;
  float _statusVignetteRatio3;
  float _statusVignetteRadius3;
  float _statusVignettePower3;
  float _statusVignetteChromaticShift3;
  uint _statusVignetteColor3;
  uint _temperatureWarningTex;
  uint _electrocutionTex;
  uint _enemyAlertTex;
  uint _wantedRegionColor;
  float _chromaticAberrationRatio;
  float _chromaticAberrationShiftValue;
  float2 _chromaticAberrationShiftPosition;
  float _invertColor;
  uint _followLearningColor;
  uint _followLearningSaturationTone;
  uint _followLearningNoiseTex;
  float _isBloodEffect;
  float _testEffectRatio;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t32, space36);

Texture2D<uint> __3__36__0__0__g_depthOpaque : register(t41, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t33, space36);

Texture2D<uint4> __3__36__0__0__g_gbufferBaseColor : register(t77, space36);

Texture2D<float4> __3__36__0__0__g_gbufferNormal : register(t78, space36);

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

ConstantBuffer<PostProcessUber_CDStruct> BindlessParameters_PostProcessUber_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  int _38 = WaveReadLaneFirst(_materialIndex);
  bool _47 = (WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_38 < (uint)170000), _38, 0)) + 0u))]._itemRatio) >= 0.009999999776482582f);
  bool _51 = (abs(_temperatureWarning) >= 0.009999999776482582f);
  float _140;
  float _141;
  float _144;
  float _145;
  float _218;
  float _219;
  int _299;
  int _374;
  float _375;
  float _376;
  float _377;
  float _378;
  float _379;
  float _380;
  float _1063;
  float _1064;
  float _1065;
  float _1066;
  float _1067;
  float _1093;
  float _1094;
  float _1095;
  float _1096;
  float _1427;
  float _1428;
  float _1429;
  float _1430;
  float _1522;
  float _1523;
  float _1524;
  float _1525;
  float _1540;
  float _1745;
  float _1746;
  float _1747;
  float _1840;
  float _1841;
  float _1842;
  float _1896;
  float _1897;
  float _1898;
  float _1914;
  float _1915;
  float _1916;
  float _1946;
  float _1947;
  float _1948;
  float _1962;
  float _1963;
  float _1964;
  if (!((_47) || (_51))) {
    if (true) discard;
  }
  float _67 = _screenSizeAndInvSize.x / _screenSizeAndInvSize.y;
  float _69 = (TEXCOORD.x * 2.0f) + -1.0f;
  float _70 = TEXCOORD.y * 2.0f;
  float _71 = 1.0f - _70;
  int _72 = WaveReadLaneFirst(_materialIndex);
  float _80 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_72 < (uint)170000), _72, 0)) + 0u))]._fishEyeMaxPower);
  if (((((_80 > 0.0010000000474974513f)) || ((_80 < -0.0010000000474974513f)))) && ((!_47))) {
    float _92 = 0.5f / _67;
    float _99 = (((_destTargetSizAndInv.x * TEXCOORD.x) / _srcTargetSizeAndInv.x) * 4.0f) + -0.5f;
    float _100 = (((_destTargetSizAndInv.y * TEXCOORD.y) / _srcTargetSizeAndInv.x) * 4.0f) - _92;
    float _101 = dot(float2(_99, _100), float2(_99, _100));
    float _102 = sqrt(_101);
    if (_80 > 0.0f) {
      float _106 = sqrt(dot(float2(0.5f, _92), float2(0.5f, _92)));
      float _111 = tan(_102 * _80) * (rsqrt(_101) * _106);
      float _115 = tan(_106 * _80);
      _140 = (((_111 * _99) / _115) + 0.5f);
      _141 = (((_111 * _100) / _115) + _92);
    } else {
      if (_80 < 0.0f) {
        float _124 = select((_67 < 1.0f), 0.5f, _92);
        float _126 = _80 * -10.0f;
        float _130 = atan(_102 * _126) * (rsqrt(_101) * _124);
        float _134 = atan(_124 * _126);
        _140 = (((_130 * _99) / _134) + 0.5f);
        _141 = (((_130 * _100) / _134) + _92);
      } else {
        _140 = 0.0f;
        _141 = 0.0f;
      }
    }
    _144 = _140;
    _145 = (_141 * _67);
  } else {
    _144 = TEXCOORD.x;
    _145 = TEXCOORD.y;
  }
  uint2 _154 = __3__36__0__0__g_stencil.Load(int3((int)(uint(_bufferSizeAndInvSize.x * _144)), (int)(uint(_bufferSizeAndInvSize.y * _145)), 0));
  int _156 = _154.x & 127;
  int _157 = WaveReadLaneFirst(_materialIndex);
  int _165 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_157 < (uint)170000), _157, 0)) + 0u))]._noiseTex);
  if (((((_highLightForVisionRemoteCatch > 0.0f)) || ((_highLightForVision > 0.0f)))) || ((_characterHighlight > 0.0f))) {
    int2 _177; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_177.x, _177.y);
    uint _192 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_177.x))))) + 0.5f) * _144), int((float((int)(int(float((int)(_177.y))))) + 0.5f) * _145), 0));
    int _194 = _192.x & 255;
    float _202 = (float((uint)((uint)((uint)((uint)(_192.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
    float _203 = (float((uint)((uint)(((uint)((uint)(_192.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
    float _205 = 1.0f - abs(_202);
    float _206 = abs(_203);
    float _207 = _205 - _206;
    if (!(_207 >= 0.0f)) {
      _218 = (select((_202 >= 0.0f), 1.0f, -1.0f) * (1.0f - _206));
      _219 = (select((_203 >= 0.0f), 1.0f, -1.0f) * _205);
    } else {
      _218 = _202;
      _219 = _203;
    }
    float _221 = rsqrt(dot(float3(_218, _219, _207), float3(_218, _219, _207)));
    float _222 = _221 * _218;
    float _223 = _221 * _219;
    float _224 = _221 * _207;
    float _226 = rsqrt(dot(float3(_222, _223, _224), float3(_222, _223, _224)));
    float _227 = _226 * _222;
    float _228 = _226 * _223;
    float _229 = _226 * _224;
    float4 _232 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(_144, _145));
    float _242 = (pow(_232.x, 0.012683313339948654f));
    float _243 = (pow(_232.y, 0.012683313339948654f));
    float _244 = (pow(_232.z, 0.012683313339948654f));
    float _269 = exp2(log2(max(0.0f, (_242 + -0.8359375f)) / (18.8515625f - (_242 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    float _270 = exp2(log2(max(0.0f, (_243 + -0.8359375f)) / (18.8515625f - (_243 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    float _271 = exp2(log2(max(0.0f, (_244 + -0.8359375f)) / (18.8515625f - (_244 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    if (_194 == _renderPassDetectObjective) {
      _299 = _renderPassDetectRemoteCatch;
      float4 _308 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * _144), int(_customRenderPassSizeInvSize.y * _145), 0));
      float _310 = max(1.0000000116860974e-07f, _308.x);
      float _346 = mad((_invViewProj[3].z), _310, mad((_invViewProj[3].y), _71, ((_invViewProj[3].x) * _69))) + (_invViewProj[3].w);
      uint _358 = __3__36__0__0__g_depthOpaque.Load(int3((int)(uint(_bufferSizeAndInvSize.x * _144)), (int)(uint(_bufferSizeAndInvSize.y * _145)), 0));
      _374 = _299;
      _375 = ((mad((_invViewProj[0].z), _310, mad((_invViewProj[0].y), _71, ((_invViewProj[0].x) * _69))) + (_invViewProj[0].w)) / _346);
      _376 = ((mad((_invViewProj[1].z), _310, mad((_invViewProj[1].y), _71, ((_invViewProj[1].x) * _69))) + (_invViewProj[1].w)) / _346);
      _377 = ((mad((_invViewProj[2].z), _310, mad((_invViewProj[2].y), _71, ((_invViewProj[2].x) * _69))) + (_invViewProj[2].w)) / _346);
      _378 = _308.x;
      _379 = (float((uint)((uint)(_358.x & 16777215))) * 5.960465188081798e-08f);
      _380 = (1.0f - saturate(dot(float3(_227, _228, _229), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z)))));
    } else {
      bool __branch_chain_277;
      if (_194 == _renderPassDetectRemoteCatch) {
        _299 = _renderPassDetectRemoteCatch;
        __branch_chain_277 = true;
      } else {
        if (((_194 == _renderPassDetectPickedRemoteCatch)) || ((_194 == _renderPassKnowledgeNPC))) {
          _299 = _renderPassDetectRemoteCatch;
          __branch_chain_277 = true;
        } else {
          if (((_194 == _renderPassEnemy)) || ((_194 == _renderPassSelfPlayer))) {
            _299 = _renderPassDetectRemoteCatch;
            __branch_chain_277 = true;
          } else {
            if (_194 == _renderPassTest) {
              _299 = _renderPassDetectRemoteCatch;
              __branch_chain_277 = true;
            } else {
              _374 = _renderPassDetectRemoteCatch;
              _375 = 0.0f;
              _376 = 0.0f;
              _377 = 0.0f;
              _378 = 0.0f;
              _379 = 0.0f;
              _380 = 0.0f;
              __branch_chain_277 = false;
            }
          }
        }
      }
      if (__branch_chain_277) {
        float4 _308 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * _144), int(_customRenderPassSizeInvSize.y * _145), 0));
        float _310 = max(1.0000000116860974e-07f, _308.x);
        float _346 = mad((_invViewProj[3].z), _310, mad((_invViewProj[3].y), _71, ((_invViewProj[3].x) * _69))) + (_invViewProj[3].w);
        uint _358 = __3__36__0__0__g_depthOpaque.Load(int3((int)(uint(_bufferSizeAndInvSize.x * _144)), (int)(uint(_bufferSizeAndInvSize.y * _145)), 0));
        _374 = _299;
        _375 = ((mad((_invViewProj[0].z), _310, mad((_invViewProj[0].y), _71, ((_invViewProj[0].x) * _69))) + (_invViewProj[0].w)) / _346);
        _376 = ((mad((_invViewProj[1].z), _310, mad((_invViewProj[1].y), _71, ((_invViewProj[1].x) * _69))) + (_invViewProj[1].w)) / _346);
        _377 = ((mad((_invViewProj[2].z), _310, mad((_invViewProj[2].y), _71, ((_invViewProj[2].x) * _69))) + (_invViewProj[2].w)) / _346);
        _378 = _308.x;
        _379 = (float((uint)((uint)(_358.x & 16777215))) * 5.960465188081798e-08f);
        _380 = (1.0f - saturate(dot(float3(_227, _228, _229), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z)))));
      }
    }
    bool __defer_373_476 = false;
    if (!(_194 == _374) || ((_194 == _374) && (!(WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)(WaveReadLaneFirst(_materialIndex)) < (uint)170000), (WaveReadLaneFirst(_materialIndex)), 0)) + 0u))]._itemRatio) > 0.0010000000474974513f))) || (((_194 == _374) && (WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)(WaveReadLaneFirst(_materialIndex)) < (uint)170000), (WaveReadLaneFirst(_materialIndex)), 0)) + 0u))]._itemRatio) > 0.0010000000474974513f)) && (((!(_highLightForVision >= 0.0010000000474974513f))) && ((!(_highLightForVisionRemoteCatch >= 0.0010000000474974513f)))))) {
      __defer_373_476 = true;
    } else {
      float _405 = _375 - _mainPosition.x;
      float _406 = _376 - _mainPosition.y;
      float _407 = _377 - _mainPosition.z;
      float _435 = rsqrt(dot(float3(_detectModeLook.x, _detectModeLook.y, _detectModeLook.z), float3(_detectModeLook.x, _detectModeLook.y, _detectModeLook.z)));
      float _436 = _435 * _detectModeLook.x;
      float _437 = _435 * _detectModeLook.y;
      float _438 = _435 * _detectModeLook.z;
      float _439 = _375 - _detectModePosition.x;
      float _440 = _376 - _detectModePosition.y;
      float _441 = _377 - _detectModePosition.z;
      float _442 = dot(float3(_436, _437, _438), float3(_439, _440, _441));
      float _448 = _439 - (_436 * _442);
      float _449 = _440 - (_437 * _442);
      float _450 = _441 - (_438 * _442);
      _1093 = ((((1.0f - saturate((sqrt(((_405 * _405) + (_406 * _406)) + (_407 * _407)) + -30.0f) * 0.05000000074505806f)) * saturate((_380 * _380) * 4.0f)) * (1.0f - saturate(sqrt(((_448 * _448) + (_449 * _449)) + (_450 * _450)) / max(0.0010000000474974513f, (tan(_detectModeAngle * 0.01745329238474369f) * _442))))) * exp2(log2(1.0f - saturate(sqrt(((_439 * _439) + (_440 * _440)) + (_441 * _441)) / _detectModeRadius)) * 10.0f));
      _1094 = _269;
      _1095 = _270;
      _1096 = _271;
    }
    if (__defer_373_476) {
      if (!(_194 == _renderPassDetectObjective) || ((_194 == _renderPassDetectObjective) && (((!(_highLightForVision >= 0.0010000000474974513f))) && ((!(_highLightForVisionRemoteCatch >= 0.0010000000474974513f)))))) {
        if (!(_194 == _renderPassKnowledgeNPC) || ((_194 == _renderPassKnowledgeNPC) && (!(_highLightForVision >= 0.0010000000474974513f)))) {
          bool _967 = (_194 == _renderPassSelfPlayer);
          bool __defer_964_978 = false;
          if ((_967) | (((((_194 == _renderPassTest)) || ((_194 == _renderPassEnemy)))) || ((_194 == _renderPassDetectPickedRemoteCatch)))) {
            __defer_964_978 = true;
          } else {
            _1093 = 0.0f;
            _1094 = _269;
            _1095 = _270;
            _1096 = _271;
          }
          if (__defer_964_978) {
            if (((_characterHighlight > 0.0010000000474974513f)) || ((_highLightForVisionRemoteCatch > 0.0010000000474974513f))) {
              if ((uint)_156 > (uint)10) {
                if ((uint)_156 < (uint)20) {
                  if (_156 == 11) {
                    float _1005 = _380 * 0.02500000037252903f;
                    float4 _1010 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1005 + _144), (_1005 + _145)));
                    float _1020 = (pow(_1010.x, 0.012683313339948654f));
                    float _1021 = (pow(_1010.y, 0.012683313339948654f));
                    float _1022 = (pow(_1010.z, 0.012683313339948654f));
                    float _1044 = exp2(log2(max(0.0f, (_1020 + -0.8359375f)) / (18.8515625f - (_1020 * 18.6875f))) * 6.277394771575928f);
                    float _1045 = exp2(log2(max(0.0f, (_1021 + -0.8359375f)) / (18.8515625f - (_1021 * 18.6875f))) * 6.277394771575928f);
                    float _1046 = exp2(log2(max(0.0f, (_1022 + -0.8359375f)) / (18.8515625f - (_1022 * 18.6875f))) * 6.277394771575928f);
                    float _1047 = _1044 * 10000.0f;
                    float _1048 = _1045 * 10000.0f;
                    float _1049 = _1046 * 10000.0f;
                    if (!_967) {
                      if (!(_194 == _renderPassTest)) {
                        float _1057 = _1045 * 6000.0f;
                        if (_194 == _renderPassEnemy) {
                          _1063 = _1047;
                          _1064 = _1057;
                          _1065 = (_1046 * 6000.0f);
                          _1066 = 10.0f;
                          _1067 = 1.0f;
                        } else {
                          _1063 = (_1044 * 5000.0f);
                          _1064 = _1057;
                          _1065 = _1049;
                          _1066 = 50.0f;
                          _1067 = 30.0f;
                        }
                      } else {
                        _1063 = _1047;
                        _1064 = _1048;
                        _1065 = _1049;
                        _1066 = 10.0f;
                        _1067 = 1.0f;
                      }
                    } else {
                      _1063 = _1047;
                      _1064 = _1048;
                      _1065 = _1049;
                      _1066 = 10.0f;
                      _1067 = 1.0f;
                    }
                    float _1075 = _375 - _mainPosition.x;
                    float _1076 = _376 - _mainPosition.y;
                    float _1077 = _377 - _mainPosition.z;
                    _1093 = (((1.0f - saturate((sqrt(((_1075 * _1075) + (_1076 * _1076)) + (_1077 * _1077)) - _1067) / _1066)) * (1.0f - saturate(ceil(((_nearFarProj.x / max(1.0000000116860974e-07f, _379)) + 0.5f) - (_nearFarProj.x / max(1.0000000116860974e-07f, _378)))))) * max(_highLightForVisionRemoteCatch, _characterHighlight));
                    _1094 = (_1063 * 1.5f);
                    _1095 = (_1064 * 1.5f);
                    _1096 = (_1065 * 1.5f);
                  } else {
                    _1093 = 0.0f;
                    _1094 = _269;
                    _1095 = _270;
                    _1096 = _271;
                  }
                } else {
                  if (!(_156 == 107)) {
                    float _1005 = _380 * 0.02500000037252903f;
                    float4 _1010 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1005 + _144), (_1005 + _145)));
                    float _1020 = (pow(_1010.x, 0.012683313339948654f));
                    float _1021 = (pow(_1010.y, 0.012683313339948654f));
                    float _1022 = (pow(_1010.z, 0.012683313339948654f));
                    float _1044 = exp2(log2(max(0.0f, (_1020 + -0.8359375f)) / (18.8515625f - (_1020 * 18.6875f))) * 6.277394771575928f);
                    float _1045 = exp2(log2(max(0.0f, (_1021 + -0.8359375f)) / (18.8515625f - (_1021 * 18.6875f))) * 6.277394771575928f);
                    float _1046 = exp2(log2(max(0.0f, (_1022 + -0.8359375f)) / (18.8515625f - (_1022 * 18.6875f))) * 6.277394771575928f);
                    float _1047 = _1044 * 10000.0f;
                    float _1048 = _1045 * 10000.0f;
                    float _1049 = _1046 * 10000.0f;
                    if (!_967) {
                      if (!(_194 == _renderPassTest)) {
                        float _1057 = _1045 * 6000.0f;
                        if (_194 == _renderPassEnemy) {
                          _1063 = _1047;
                          _1064 = _1057;
                          _1065 = (_1046 * 6000.0f);
                          _1066 = 10.0f;
                          _1067 = 1.0f;
                        } else {
                          _1063 = (_1044 * 5000.0f);
                          _1064 = _1057;
                          _1065 = _1049;
                          _1066 = 50.0f;
                          _1067 = 30.0f;
                        }
                      } else {
                        _1063 = _1047;
                        _1064 = _1048;
                        _1065 = _1049;
                        _1066 = 10.0f;
                        _1067 = 1.0f;
                      }
                    } else {
                      _1063 = _1047;
                      _1064 = _1048;
                      _1065 = _1049;
                      _1066 = 10.0f;
                      _1067 = 1.0f;
                    }
                    float _1075 = _375 - _mainPosition.x;
                    float _1076 = _376 - _mainPosition.y;
                    float _1077 = _377 - _mainPosition.z;
                    _1093 = (((1.0f - saturate((sqrt(((_1075 * _1075) + (_1076 * _1076)) + (_1077 * _1077)) - _1067) / _1066)) * (1.0f - saturate(ceil(((_nearFarProj.x / max(1.0000000116860974e-07f, _379)) + 0.5f) - (_nearFarProj.x / max(1.0000000116860974e-07f, _378)))))) * max(_highLightForVisionRemoteCatch, _characterHighlight));
                    _1094 = (_1063 * 1.5f);
                    _1095 = (_1064 * 1.5f);
                    _1096 = (_1065 * 1.5f);
                  } else {
                    _1093 = 0.0f;
                    _1094 = _269;
                    _1095 = _270;
                    _1096 = _271;
                  }
                }
              } else {
                float _1005 = _380 * 0.02500000037252903f;
                float4 _1010 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1005 + _144), (_1005 + _145)));
                float _1020 = (pow(_1010.x, 0.012683313339948654f));
                float _1021 = (pow(_1010.y, 0.012683313339948654f));
                float _1022 = (pow(_1010.z, 0.012683313339948654f));
                float _1044 = exp2(log2(max(0.0f, (_1020 + -0.8359375f)) / (18.8515625f - (_1020 * 18.6875f))) * 6.277394771575928f);
                float _1045 = exp2(log2(max(0.0f, (_1021 + -0.8359375f)) / (18.8515625f - (_1021 * 18.6875f))) * 6.277394771575928f);
                float _1046 = exp2(log2(max(0.0f, (_1022 + -0.8359375f)) / (18.8515625f - (_1022 * 18.6875f))) * 6.277394771575928f);
                float _1047 = _1044 * 10000.0f;
                float _1048 = _1045 * 10000.0f;
                float _1049 = _1046 * 10000.0f;
                if (!_967) {
                  if (!(_194 == _renderPassTest)) {
                    float _1057 = _1045 * 6000.0f;
                    if (_194 == _renderPassEnemy) {
                      _1063 = _1047;
                      _1064 = _1057;
                      _1065 = (_1046 * 6000.0f);
                      _1066 = 10.0f;
                      _1067 = 1.0f;
                    } else {
                      _1063 = (_1044 * 5000.0f);
                      _1064 = _1057;
                      _1065 = _1049;
                      _1066 = 50.0f;
                      _1067 = 30.0f;
                    }
                  } else {
                    _1063 = _1047;
                    _1064 = _1048;
                    _1065 = _1049;
                    _1066 = 10.0f;
                    _1067 = 1.0f;
                  }
                } else {
                  _1063 = _1047;
                  _1064 = _1048;
                  _1065 = _1049;
                  _1066 = 10.0f;
                  _1067 = 1.0f;
                }
                float _1075 = _375 - _mainPosition.x;
                float _1076 = _376 - _mainPosition.y;
                float _1077 = _377 - _mainPosition.z;
                _1093 = (((1.0f - saturate((sqrt(((_1075 * _1075) + (_1076 * _1076)) + (_1077 * _1077)) - _1067) / _1066)) * (1.0f - saturate(ceil(((_nearFarProj.x / max(1.0000000116860974e-07f, _379)) + 0.5f) - (_nearFarProj.x / max(1.0000000116860974e-07f, _378)))))) * max(_highLightForVisionRemoteCatch, _characterHighlight));
                _1094 = (_1063 * 1.5f);
                _1095 = (_1064 * 1.5f);
                _1096 = (_1065 * 1.5f);
              }
            } else {
              _1093 = 0.0f;
              _1094 = _269;
              _1095 = _270;
              _1096 = _271;
            }
          }
        } else {
          uint _824 = uint(_bufferSizeAndInvSize.x * _144);
          uint _825 = uint(_bufferSizeAndInvSize.y * _145);
          uint4 _827 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_824), (int)(_825), 0));
          float4 _830 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_824), (int)(_825), 0));
          float _848 = (saturate(_830.x * 1.0009784698486328f) * 2.0f) + -1.0f;
          float _849 = (saturate(_830.y * 1.0009784698486328f) * 2.0f) + -1.0f;
          float _850 = (saturate(_830.z * 1.0009784698486328f) * 2.0f) + -1.0f;
          float _852 = rsqrt(dot(float3(_848, _849, _850), float3(_848, _849, _850)));
          float _853 = _852 * _848;
          float _854 = _852 * _849;
          float _855 = _850 * _852;
          float _858 = (float((uint)((uint)(((uint)((uint)(_827.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
          float _859 = (float((uint)((uint)(_827.w & 255))) * 0.007843137718737125f) + -1.0f;
          float _862 = (_858 + _859) * 0.5f;
          float _863 = (_858 - _859) * 0.5f;
          float _867 = (1.0f - abs(_862)) - abs(_863);
          float _869 = rsqrt(dot(float3(_862, _863, _867), float3(_862, _863, _867)));
          float _870 = _869 * _862;
          float _871 = _869 * _863;
          float _872 = _869 * _867;
          float _874 = select((_855 >= 0.0f), 1.0f, -1.0f);
          float _877 = -0.0f - (1.0f / (_874 + _855));
          float _878 = _854 * _877;
          float _879 = _878 * _853;
          float _880 = _874 * _853;
          float _889 = mad(_872, _853, mad(_871, _879, ((((_880 * _853) * _877) + 1.0f) * _870)));
          float _893 = mad(_872, _854, mad(_871, (_874 + (_878 * _854)), ((_870 * _874) * _879)));
          float _897 = mad(_872, _855, mad(_871, (-0.0f - _854), (-0.0f - (_880 * _870))));
          float _899 = rsqrt(dot(float3(_889, _893, _897), float3(_889, _893, _897)));
          float _914 = 1.0f - dot(float3(((_899 * _889) + -0.10000000149011612f), ((_899 * _893) + -0.10000000149011612f), ((_899 * _897) + -0.10000000149011612f)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z)));
          float _919 = frac((_time.x * 2.0f) + _914);
          float _920 = _919 * _919;
          float _924 = _914 * 10.0f;
          float4 _931 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_165 < (uint)65000), _165, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_924, _924));
          float _933 = _931.x * _931.x;
          float _952 = 6.0f / max(0.0010000000474974513f, _exposure0.x);
          _1093 = ((saturate((_933 * _933) * 4.0f) * saturate((_920 * _920) * 5.0f)) * saturate(ceil(((_nearFarProj.x / max(1.0000000116860974e-07f, _379)) + 0.05000000074505806f) - (_nearFarProj.x / max(1.0000000116860974e-07f, _378)))));
          _1094 = ((_highLightForVision * (_952 - _269)) + _269);
          _1095 = ((_highLightForVision * ((_952 * 0.6444798111915588f) - _270)) + _270);
          _1096 = (_271 - (_highLightForVision * _271));
        }
      } else {
        float _502 = _375 - _mainPosition.x;
        float _503 = _376 - _mainPosition.y;
        float _504 = _377 - _mainPosition.z;
        float _514 = (1.0f - saturate(sqrt(((_502 * _502) + (_503 * _503)) + (_504 * _504)) * 0.125f)) * 0.20000000298023224f;
        float _525 = _502 - ((_viewPos.x - _mainPosition.x) * _514);
        float _526 = _503 - ((_viewPos.y - _mainPosition.y) * _514);
        float _527 = _504 - ((_viewPos.z - _mainPosition.z) * _514);
        float _529 = rsqrt(dot(float3(_525, _526, _527), float3(_525, _526, _527)));
        float _532 = _527 * _529;
        float _536 = select((_532 < 0.0f), (-0.0f - _532), _532) + 1.0f;
        float _537 = (_526 * _529) / _536;
        float _538 = (_525 * _529) / _536;
        float _543 = _time.x + sin(_time.x);
        float4 _555 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_165 < (uint)65000), _165, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((_time.x * 0.10000000149011612f) + (_538 * 2.0f)), ((_543 * 0.10000000149011612f) + (_537 * 2.0f))));
        float4 _567 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_165 < (uint)65000), _165, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((_538 - (_time.x * 0.06000000238418579f)) - (_555.x * 0.05000000074505806f)), ((_537 - (_543 * 0.06000000238418579f)) - (_555.w * 0.05000000074505806f))));
        uint _585 = uint(((((_555.w + -1.0f) + _567.y) * 0.019999999552965164f) + _144) * _bufferSizeAndInvSize.x);
        uint _586 = uint(((((_555.y + -1.0f) + _567.w) * 0.019999999552965164f) + _145) * _bufferSizeAndInvSize.y);
        uint4 _588 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_585), (int)(_586), 0));
        float4 _591 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_585), (int)(_586), 0));
        float _609 = (saturate(_591.x * 1.0009784698486328f) * 2.0f) + -1.0f;
        float _610 = (saturate(_591.y * 1.0009784698486328f) * 2.0f) + -1.0f;
        float _611 = (saturate(_591.z * 1.0009784698486328f) * 2.0f) + -1.0f;
        float _613 = rsqrt(dot(float3(_609, _610, _611), float3(_609, _610, _611)));
        float _614 = _613 * _609;
        float _615 = _613 * _610;
        float _616 = _611 * _613;
        float _619 = (float((uint)((uint)(((uint)((uint)(_588.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
        float _620 = (float((uint)((uint)(_588.w & 255))) * 0.007843137718737125f) + -1.0f;
        float _623 = (_619 + _620) * 0.5f;
        float _624 = (_619 - _620) * 0.5f;
        float _628 = (1.0f - abs(_623)) - abs(_624);
        float _630 = rsqrt(dot(float3(_623, _624, _628), float3(_623, _624, _628)));
        float _631 = _630 * _623;
        float _632 = _630 * _624;
        float _633 = _630 * _628;
        float _635 = select((_616 >= 0.0f), 1.0f, -1.0f);
        float _638 = -0.0f - (1.0f / (_635 + _616));
        float _639 = _615 * _638;
        float _640 = _639 * _614;
        float _641 = _635 * _614;
        float _650 = mad(_633, _614, mad(_632, _640, ((((_641 * _614) * _638) + 1.0f) * _631)));
        float _654 = mad(_633, _615, mad(_632, (_635 + (_639 * _615)), ((_631 * _635) * _640)));
        float _658 = mad(_633, _616, mad(_632, (-0.0f - _615), (-0.0f - (_641 * _631))));
        float _660 = rsqrt(dot(float3(_650, _654, _658), float3(_650, _654, _658)));
        float _670 = 1.0f - abs(dot(float3((_660 * _650), (_660 * _654), (_660 * _658)), float3(_viewDir.x, _viewDir.y, _viewDir.z)));
        float _675 = saturate((_670 * _670) + ((_567.y * _555.y) * _567.z));
        float _689 = 1.0f - dot(float3((((_567.x + -0.5f) * _567.w) + _227), (((_567.y + -0.5f) * _567.w) + _228), (((_567.z + -0.5f) * _567.w) + _229)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z)));
        float _698 = (saturate(_675 * 10.0f) * saturate((_689 * _689) * 3.0f)) + ((_567.x * _567.z) * _567.w);
        int _702 = WaveReadLaneFirst(_materialIndex);
        int _710 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_702 < (uint)170000), _702, 0)) + 0u))]._objectiveMaskColor);
        float _713 = float((uint)((uint)(((uint)((uint)(_710)) >> 16) & 255)));
        float _716 = float((uint)((uint)(((uint)((uint)(_710)) >> 8) & 255)));
        float _718 = float((uint)((uint)(_710 & 255)));
        float _751 = (_567.y * _567.w) * (1.0f / max(0.0010000000474974513f, _exposure0.x));
        float _769 = rsqrt(dot(float3(_detectModeLook.x, _detectModeLook.y, _detectModeLook.z), float3(_detectModeLook.x, _detectModeLook.y, _detectModeLook.z)));
        float _770 = _769 * _detectModeLook.x;
        float _771 = _769 * _detectModeLook.y;
        float _772 = _769 * _detectModeLook.z;
        float _773 = _375 - _detectModePosition.x;
        float _774 = _376 - _detectModePosition.y;
        float _775 = _377 - _detectModePosition.z;
        float _776 = dot(float3(_770, _771, _772), float3(_773, _774, _775));
        float _782 = _773 - (_770 * _776);
        float _783 = _774 - (_771 * _776);
        float _784 = _775 - (_772 * _776);
        float _803 = 1.0f - saturate(sqrt(((_773 * _773) + (_774 * _774)) + (_775 * _775)) / _detectModeRadius);
        _1093 = (((_803 * _803) * ((1.0f - saturate(sqrt(((_782 * _782) + (_783 * _783)) + (_784 * _784)) / max(0.0010000000474974513f, (tan(_detectModeAngle * 0.01745329238474369f) * _776)))) * (((_675 - _698) * saturate(ceil(((_nearFarProj.x / max(1.0000000116860974e-07f, _379)) + 0.05000000074505806f) - (_nearFarProj.x / max(1.0000000116860974e-07f, _378))))) + _698))) * _highLightForVision);
        _1094 = (_751 * select(((_713 * 0.011764707043766975f) < 0.040449999272823334f), (_713 * 0.0009105810313485563f), exp2(log2((_713 * 0.011151381768286228f) + 0.052132703363895416f) * 2.4000000953674316f)));
        _1095 = (_751 * select(((_716 * 0.011764707043766975f) < 0.040449999272823334f), (_716 * 0.0009105810313485563f), exp2(log2((_716 * 0.011151381768286228f) + 0.052132703363895416f) * 2.4000000953674316f)));
        _1096 = (_751 * select(((_718 * 0.011764707043766975f) < 0.040449999272823334f), (_718 * 0.0009105810313485563f), exp2(log2((_718 * 0.011151381768286228f) + 0.052132703363895416f) * 2.4000000953674316f)));
      }
    }
  } else {
    _1093 = 0.0f;
    _1094 = 0.0f;
    _1095 = 0.0f;
    _1096 = 0.0f;
  }
  float _1100 = abs(_temperatureWarning * 0.009999999776482582f);
  if (_51) {
    if (_temperatureWarning > 0.0f) {
      float _1107 = _67 * TEXCOORD.x;
      float4 _1120 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_165 < (uint)65000), _165, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1107 * 4.25f), ((TEXCOORD.y * 3.0f) - (_time.x * 0.15000000596046448f))));
      float4 _1132 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_165 < (uint)65000), _165, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1107 * 2.299999952316284f), (((TEXCOORD.y * 2.0999999046325684f) - (_1120.x * 0.10000000149011612f)) + (_time.x * 0.20000000298023224f))));
      float _1138 = TEXCOORD.x + -0.5f;
      float _1171 = abs((_1138 + ((_1120.y + -0.5f) * 0.009999999776482582f)) + ((_1132.z + -0.5f) * 0.029999999329447746f));
      float _1172 = abs(((TEXCOORD.y + -0.5f) + ((_1120.x + -0.5f) * 0.019999999552965164f)) + ((_1132.y + -0.5f) * 0.029999999329447746f));
      float _1175 = max((_1171 + -0.5f), 0.0f);
      float _1176 = max((_1172 + -0.5f), 0.0f);
      float _1183 = 0.5f - min(max((((1.0f - (saturate(abs(_1138) * 2.0f) * 0.3999999761581421f)) * ((_1100 * 0.05000000447034836f) + 0.10000000149011612f)) * (((((_1120.z * 0.30000001192092896f) + -0.5f) + (_1132.x * 0.699999988079071f)) * 1.100000023841858f) + 1.0f)), ((_1100 * 0.017500001937150955f) + 0.03500000014901161f)), ((_1100 * 0.11000001430511475f) + 0.2200000137090683f));
      float _1186 = max((_1171 - _1183), 0.0f);
      float _1187 = max((_1172 - _1183), 0.0f);
      float _1198 = saturate((TEXCOORD.y + -0.15000000596046448f) * 1.2500001192092896f);
      float _1214 = saturate(_1132.x * _1120.x);
      float _1215 = _1100 * 0.20000000298023224f;
      float _1223 = ((saturate(_1100 * 2.0f) * saturate(saturate(sqrt((_1187 * _1187) + (_1186 * _1186)) * 10.0f) - saturate(sqrt((_1176 * _1176) + (_1175 * _1175)) * 10.0f))) * ((_1214 * (1.0f - _1215)) + _1215)) * ((((_1198 * _1198) * (3.0f - (_1198 * 2.0f))) * ((saturate((((_1120.x * 0.25f) + -0.3499999940395355f) + (_1132.y * 0.75f)) * 1.600000023841858f) * 0.5f) + -0.3500000238418579f)) + 1.0f);
      float _1227 = _1223 * (_1100 * 0.10000000149011612f);
      float4 _1235 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_1227 * (0.5f - TEXCOORD.x)) * _1132.x) + TEXCOORD.x), (((_1227 * (0.5f - TEXCOORD.y)) * _1132.y) + TEXCOORD.y)));
      float _1245 = (pow(_1235.x, 0.012683313339948654f));
      float _1246 = (pow(_1235.y, 0.012683313339948654f));
      float _1247 = (pow(_1235.z, 0.012683313339948654f));
      float _1272 = exp2(log2(max(0.0f, (_1245 + -0.8359375f)) / (18.8515625f - (_1245 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
      float _1273 = exp2(log2(max(0.0f, (_1246 + -0.8359375f)) / (18.8515625f - (_1246 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
      float _1274 = exp2(log2(max(0.0f, (_1247 + -0.8359375f)) / (18.8515625f - (_1247 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
      float _1275 = 1.0f - _1223;
      float _1282 = ((_1275 * _1275) * _1275) * saturate(((_1214 * _1214) * 2.0f) * _1214);
      float _1285 = max(0.0010000000474974513f, _exposure0.x);
      float _1295 = (((1.0f / _1285) - _1272) * _1282) + _1272;
      float _1296 = (((0.6000000238418579f / _1285) - _1273) * _1282) + _1273;
      float _1297 = (((0.30000001192092896f / _1285) - _1274) * _1282) + _1274;
      float _1307 = ((_1100 * _1100) * _1100) * saturate(_1100 + -0.5f);
      float _1312 = saturate(_1223 * 2.0f);
      _1427 = (_1312 + _1093);
      _1428 = ((((_1295 - _1094) + (((_1223 / _1285) - _1295) * _1307)) * _1312) + _1094);
      _1429 = ((((_1296 - _1095) + ((((_1223 * 0.25f) / _1285) - _1296) * _1307)) * _1312) + _1095);
      _1430 = ((((_1297 - _1096) - (_1297 * _1307)) * _1312) + _1096);
    } else {
      if (_temperatureWarning < 0.0f) {
        float _1329 = _67 * TEXCOORD.x;
        float4 _1338 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_165 < (uint)65000), _165, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1329 * 1.5f), (TEXCOORD.y * 1.5f)));
        int _1343 = WaveReadLaneFirst(_materialIndex);
        int _1351 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1343 < (uint)170000), _1343, 0)) + 0u))]._temperatureWarningTex);
        float4 _1358 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1351 < (uint)65000), _1351, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1329 * 2.0f), _70));
        float _1366 = (select(((TEXCOORD.y / (1.0f - TEXCOORD.x)) < 1.0f), (1.0f - _1358.y), _1358.y) + -0.5f) * 0.30000001192092896f;
        float _1368 = (_1338.x + -0.4000000059604645f) * 0.20000000298023224f;
        float _1376 = max(0.0010000000474974513f, _exposure0.x);
        float _1389 = 0.5f - (_1100 * 0.25f);
        float _1392 = max((abs(((TEXCOORD.x + -0.5f) + _1368) + _1366) - _1389), 0.0f);
        float _1393 = max((abs(((_1366 + _1368) + -0.4749999940395355f) + (TEXCOORD.y * 0.8999999761581421f)) - _1389), 0.0f);
        float _1415 = (_1100 * (1.0f - TEXCOORD.y)) * saturate((((_1358.y * 4.0f) * saturate(1.0f - ((1.0f - saturate(sqrt((_1393 * _1393) + (_1392 * _1392)) * 6.666666507720947f)) * 2.0f))) * saturate((_1358.y * _1358.y) * 2.0f)) * saturate(_1338.z * _1338.w));
        _1427 = (_1415 + _1093);
        _1428 = ((_1415 * ((((_1338.w * 1.8809775114059448f) + 0.11902248114347458f) / _1376) - _1094)) + _1094);
        _1429 = ((_1415 * ((((_1338.w * 1.3989123106002808f) + 0.6010876893997192f) / _1376) - _1095)) + _1095);
        _1430 = ((_1415 * ((2.0f / _1376) - _1096)) + _1096);
      } else {
        _1427 = _1093;
        _1428 = _1094;
        _1429 = _1095;
        _1430 = _1096;
      }
    }
  } else {
    _1427 = _1093;
    _1428 = _1094;
    _1429 = _1095;
    _1430 = _1096;
  }
  if (!(_electrocutionWarning == 0.0f)) {
    float _1435 = _67 * TEXCOORD.x;
    float4 _1444 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_165 < (uint)65000), _165, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1435 * 1.5f), (TEXCOORD.y * 1.5f)));
    int _1457 = WaveReadLaneFirst(_materialIndex);
    int _1465 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1457 < (uint)170000), _1457, 0)) + 0u))]._electrocutionTex);
    float4 _1472 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1465 < (uint)65000), _1465, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((_1444.x * 0.05000000074505806f) + (_1435 * 2.0f)), (((_1444.y * 0.05000000074505806f) + _70) + (_time.x * 0.10000000149011612f))));
    float _1476 = max(0.0010000000474974513f, _exposure0.x);
    float _1485 = 0.5f - (_electrocutionWarning * 0.07000000029802322f);
    float _1488 = max((abs(TEXCOORD.x + -0.5f) - _1485), 0.0f);
    float _1489 = max((abs(TEXCOORD.y + -0.5f) - _1485), 0.0f);
    float _1504 = 1.0f - abs((frac((_time.x * 2.0f) + _1444.y) * 2.0f) + -1.0f);
    float _1507 = (_1504 * _1504) * (saturate(sqrt((_1489 * _1489) + (_1488 * _1488)) / _1444.z) * _1472.x);
    float _1510 = (pow(_1507, 1.600000023841858f));
    _1522 = (_1507 + _1427);
    _1523 = ((_1510 * ((340.0f / _1476) - _1428)) + _1428);
    _1524 = ((_1510 * ((660.0f / _1476) - _1429)) + _1429);
    _1525 = ((_1510 * ((2000.0f / _1476) - _1430)) + _1430);
  } else {
    _1522 = _1427;
    _1523 = _1428;
    _1524 = _1429;
    _1525 = _1430;
  }
  uint _1527 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _1534 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_1527), 0));
    _1540 = (float((uint)((uint)(_1534.x & 127))) + 0.5f);
  } else {
    _1540 = saturate(_1522);
  }
  bool _1543 = (_localToneMappingParams.w > 0.0f);
  if (_1543) {
    float3 output_color = TonemapReplacer(float3(_1523, _1524, _1525));
    _1896 = output_color.x;
    _1897 = output_color.y;
    _1898 = output_color.z;
  } else {
    _1896 = _1523;
    _1897 = _1524;
    _1898 = _1525;
  }
  if (_etcParams.y > 1.0f) {
    float _1904 = abs(_69);
    float _1905 = abs(_70 + -1.0f);
    float _1909 = saturate(1.0f - (dot(float2(_1904, _1905), float2(_1904, _1905)) * saturate(_etcParams.y + -1.0f)));
    _1914 = (_1909 * _1896);
    _1915 = (_1909 * _1897);
    _1916 = (_1909 * _1898);
  } else {
    _1914 = _1896;
    _1915 = _1897;
    _1916 = _1898;
  }
  if ((_1543) && ((_etcParams.z > 0.0f))) {
    _1946 = select((_1914 <= 0.0031308000907301903f), (_1914 * 12.920000076293945f), (((pow(_1914, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1947 = select((_1915 <= 0.0031308000907301903f), (_1915 * 12.920000076293945f), (((pow(_1915, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1948 = select((_1916 <= 0.0031308000907301903f), (_1916 * 12.920000076293945f), (((pow(_1916, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1946 = _1914;
    _1947 = _1915;
    _1948 = _1916;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _1953 = float((uint)_1527);
    if (!(_1953 < _viewDir.w)) {
      if (!(_1953 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _1962 = _1946;
        _1963 = _1947;
        _1964 = _1948;
      } else {
        _1962 = 0.0f;
        _1963 = 0.0f;
        _1964 = 0.0f;
      }
    } else {
      _1962 = 0.0f;
      _1963 = 0.0f;
      _1964 = 0.0f;
    }
  } else {
    _1962 = _1946;
    _1963 = _1947;
    _1964 = _1948;
  }
  float _1974 = exp2(log2(_1962 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1975 = exp2(log2(_1963 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1976 = exp2(log2(_1964 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_1974 * 18.6875f) + 1.0f)) * ((_1974 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_1975 * 18.6875f) + 1.0f)) * ((_1975 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_1976 * 18.6875f) + 1.0f)) * ((_1976 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _1540;
  return SV_Target;
}