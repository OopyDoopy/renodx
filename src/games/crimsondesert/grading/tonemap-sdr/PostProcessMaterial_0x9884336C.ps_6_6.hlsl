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
  int _263;
  int _338;
  float _339;
  float _340;
  float _341;
  float _342;
  float _343;
  float _344;
  float _991;
  float _992;
  float _993;
  float _994;
  float _995;
  float _1021;
  float _1022;
  float _1023;
  float _1024;
  float _1319;
  float _1320;
  float _1321;
  float _1322;
  float _1414;
  float _1415;
  float _1416;
  float _1417;
  float _1432;
  float _1637;
  float _1638;
  float _1639;
  float _1732;
  float _1733;
  float _1734;
  float _1788;
  float _1789;
  float _1790;
  float _1806;
  float _1807;
  float _1808;
  float _1838;
  float _1839;
  float _1840;
  float _1854;
  float _1855;
  float _1856;
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
    if (_194 == _renderPassDetectObjective) {
      _263 = _renderPassDetectRemoteCatch;
      float4 _272 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * _144), int(_customRenderPassSizeInvSize.y * _145), 0));
      float _274 = max(1.0000000116860974e-07f, _272.x);
      float _310 = mad((_invViewProj[3].z), _274, mad((_invViewProj[3].y), _71, ((_invViewProj[3].x) * _69))) + (_invViewProj[3].w);
      uint _322 = __3__36__0__0__g_depthOpaque.Load(int3((int)(uint(_bufferSizeAndInvSize.x * _144)), (int)(uint(_bufferSizeAndInvSize.y * _145)), 0));
      _338 = _263;
      _339 = ((mad((_invViewProj[0].z), _274, mad((_invViewProj[0].y), _71, ((_invViewProj[0].x) * _69))) + (_invViewProj[0].w)) / _310);
      _340 = ((mad((_invViewProj[1].z), _274, mad((_invViewProj[1].y), _71, ((_invViewProj[1].x) * _69))) + (_invViewProj[1].w)) / _310);
      _341 = ((mad((_invViewProj[2].z), _274, mad((_invViewProj[2].y), _71, ((_invViewProj[2].x) * _69))) + (_invViewProj[2].w)) / _310);
      _342 = _272.x;
      _343 = (float((uint)((uint)(_322.x & 16777215))) * 5.960465188081798e-08f);
      _344 = (1.0f - saturate(dot(float3(_227, _228, _229), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z)))));
    } else {
      bool __branch_chain_241;
      if (_194 == _renderPassDetectRemoteCatch) {
        _263 = _renderPassDetectRemoteCatch;
        __branch_chain_241 = true;
      } else {
        if (((_194 == _renderPassDetectPickedRemoteCatch)) || ((_194 == _renderPassKnowledgeNPC))) {
          _263 = _renderPassDetectRemoteCatch;
          __branch_chain_241 = true;
        } else {
          if (((_194 == _renderPassEnemy)) || ((_194 == _renderPassSelfPlayer))) {
            _263 = _renderPassDetectRemoteCatch;
            __branch_chain_241 = true;
          } else {
            if (_194 == _renderPassTest) {
              _263 = _renderPassDetectRemoteCatch;
              __branch_chain_241 = true;
            } else {
              _338 = _renderPassDetectRemoteCatch;
              _339 = 0.0f;
              _340 = 0.0f;
              _341 = 0.0f;
              _342 = 0.0f;
              _343 = 0.0f;
              _344 = 0.0f;
              __branch_chain_241 = false;
            }
          }
        }
      }
      if (__branch_chain_241) {
        float4 _272 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * _144), int(_customRenderPassSizeInvSize.y * _145), 0));
        float _274 = max(1.0000000116860974e-07f, _272.x);
        float _310 = mad((_invViewProj[3].z), _274, mad((_invViewProj[3].y), _71, ((_invViewProj[3].x) * _69))) + (_invViewProj[3].w);
        uint _322 = __3__36__0__0__g_depthOpaque.Load(int3((int)(uint(_bufferSizeAndInvSize.x * _144)), (int)(uint(_bufferSizeAndInvSize.y * _145)), 0));
        _338 = _263;
        _339 = ((mad((_invViewProj[0].z), _274, mad((_invViewProj[0].y), _71, ((_invViewProj[0].x) * _69))) + (_invViewProj[0].w)) / _310);
        _340 = ((mad((_invViewProj[1].z), _274, mad((_invViewProj[1].y), _71, ((_invViewProj[1].x) * _69))) + (_invViewProj[1].w)) / _310);
        _341 = ((mad((_invViewProj[2].z), _274, mad((_invViewProj[2].y), _71, ((_invViewProj[2].x) * _69))) + (_invViewProj[2].w)) / _310);
        _342 = _272.x;
        _343 = (float((uint)((uint)(_322.x & 16777215))) * 5.960465188081798e-08f);
        _344 = (1.0f - saturate(dot(float3(_227, _228, _229), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z)))));
      }
    }
    bool __defer_337_440 = false;
    if (!(_194 == _338) || ((_194 == _338) && (!(WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)(WaveReadLaneFirst(_materialIndex)) < (uint)170000), (WaveReadLaneFirst(_materialIndex)), 0)) + 0u))]._itemRatio) > 0.0010000000474974513f))) || (((_194 == _338) && (WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)(WaveReadLaneFirst(_materialIndex)) < (uint)170000), (WaveReadLaneFirst(_materialIndex)), 0)) + 0u))]._itemRatio) > 0.0010000000474974513f)) && (((!(_highLightForVision >= 0.0010000000474974513f))) && ((!(_highLightForVisionRemoteCatch >= 0.0010000000474974513f)))))) {
      __defer_337_440 = true;
    } else {
      float _369 = _339 - _mainPosition.x;
      float _370 = _340 - _mainPosition.y;
      float _371 = _341 - _mainPosition.z;
      float _399 = rsqrt(dot(float3(_detectModeLook.x, _detectModeLook.y, _detectModeLook.z), float3(_detectModeLook.x, _detectModeLook.y, _detectModeLook.z)));
      float _400 = _399 * _detectModeLook.x;
      float _401 = _399 * _detectModeLook.y;
      float _402 = _399 * _detectModeLook.z;
      float _403 = _339 - _detectModePosition.x;
      float _404 = _340 - _detectModePosition.y;
      float _405 = _341 - _detectModePosition.z;
      float _406 = dot(float3(_400, _401, _402), float3(_403, _404, _405));
      float _412 = _403 - (_400 * _406);
      float _413 = _404 - (_401 * _406);
      float _414 = _405 - (_402 * _406);
      _1021 = ((((1.0f - saturate((sqrt(((_369 * _369) + (_370 * _370)) + (_371 * _371)) + -30.0f) * 0.05000000074505806f)) * saturate((_344 * _344) * 4.0f)) * (1.0f - saturate(sqrt(((_412 * _412) + (_413 * _413)) + (_414 * _414)) / max(0.0010000000474974513f, (tan(_detectModeAngle * 0.01745329238474369f) * _406))))) * exp2(log2(1.0f - saturate(sqrt(((_403 * _403) + (_404 * _404)) + (_405 * _405)) / _detectModeRadius)) * 10.0f));
      _1022 = _232.x;
      _1023 = _232.y;
      _1024 = _232.z;
    }
    if (__defer_337_440) {
      if (!(_194 == _renderPassDetectObjective) || ((_194 == _renderPassDetectObjective) && (((!(_highLightForVision >= 0.0010000000474974513f))) && ((!(_highLightForVisionRemoteCatch >= 0.0010000000474974513f)))))) {
        if (!(_194 == _renderPassKnowledgeNPC) || ((_194 == _renderPassKnowledgeNPC) && (!(_highLightForVision >= 0.0010000000474974513f)))) {
          bool _931 = (_194 == _renderPassSelfPlayer);
          bool __defer_928_942 = false;
          if ((_931) | (((((_194 == _renderPassTest)) || ((_194 == _renderPassEnemy)))) || ((_194 == _renderPassDetectPickedRemoteCatch)))) {
            __defer_928_942 = true;
          } else {
            _1021 = 0.0f;
            _1022 = _232.x;
            _1023 = _232.y;
            _1024 = _232.z;
          }
          if (__defer_928_942) {
            if (((_characterHighlight > 0.0010000000474974513f)) || ((_highLightForVisionRemoteCatch > 0.0010000000474974513f))) {
              if ((uint)_156 > (uint)10) {
                if ((uint)_156 < (uint)20) {
                  if (_156 == 11) {
                    float _969 = _344 * 0.02500000037252903f;
                    float4 _974 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_969 + _144), (_969 + _145)));
                    if (!_931) {
                      if (!(_194 == _renderPassTest)) {
                        float _985 = _974.y * 0.6000000238418579f;
                        if (_194 == _renderPassEnemy) {
                          _991 = _974.x;
                          _992 = _985;
                          _993 = (_974.z * 0.6000000238418579f);
                          _994 = 10.0f;
                          _995 = 1.0f;
                        } else {
                          _991 = (_974.x * 0.5f);
                          _992 = _985;
                          _993 = _974.z;
                          _994 = 50.0f;
                          _995 = 30.0f;
                        }
                      } else {
                        _991 = _974.x;
                        _992 = _974.y;
                        _993 = _974.z;
                        _994 = 10.0f;
                        _995 = 1.0f;
                      }
                    } else {
                      _991 = _974.x;
                      _992 = _974.y;
                      _993 = _974.z;
                      _994 = 10.0f;
                      _995 = 1.0f;
                    }
                    float _1003 = _339 - _mainPosition.x;
                    float _1004 = _340 - _mainPosition.y;
                    float _1005 = _341 - _mainPosition.z;
                    _1021 = (((1.0f - saturate((sqrt(((_1003 * _1003) + (_1004 * _1004)) + (_1005 * _1005)) - _995) / _994)) * (1.0f - saturate(ceil(((_nearFarProj.x / max(1.0000000116860974e-07f, _343)) + 0.5f) - (_nearFarProj.x / max(1.0000000116860974e-07f, _342)))))) * max(_highLightForVisionRemoteCatch, _characterHighlight));
                    _1022 = (_991 * 1.5f);
                    _1023 = (_992 * 1.5f);
                    _1024 = (_993 * 1.5f);
                  } else {
                    _1021 = 0.0f;
                    _1022 = _232.x;
                    _1023 = _232.y;
                    _1024 = _232.z;
                  }
                } else {
                  if (!(_156 == 107)) {
                    float _969 = _344 * 0.02500000037252903f;
                    float4 _974 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_969 + _144), (_969 + _145)));
                    if (!_931) {
                      if (!(_194 == _renderPassTest)) {
                        float _985 = _974.y * 0.6000000238418579f;
                        if (_194 == _renderPassEnemy) {
                          _991 = _974.x;
                          _992 = _985;
                          _993 = (_974.z * 0.6000000238418579f);
                          _994 = 10.0f;
                          _995 = 1.0f;
                        } else {
                          _991 = (_974.x * 0.5f);
                          _992 = _985;
                          _993 = _974.z;
                          _994 = 50.0f;
                          _995 = 30.0f;
                        }
                      } else {
                        _991 = _974.x;
                        _992 = _974.y;
                        _993 = _974.z;
                        _994 = 10.0f;
                        _995 = 1.0f;
                      }
                    } else {
                      _991 = _974.x;
                      _992 = _974.y;
                      _993 = _974.z;
                      _994 = 10.0f;
                      _995 = 1.0f;
                    }
                    float _1003 = _339 - _mainPosition.x;
                    float _1004 = _340 - _mainPosition.y;
                    float _1005 = _341 - _mainPosition.z;
                    _1021 = (((1.0f - saturate((sqrt(((_1003 * _1003) + (_1004 * _1004)) + (_1005 * _1005)) - _995) / _994)) * (1.0f - saturate(ceil(((_nearFarProj.x / max(1.0000000116860974e-07f, _343)) + 0.5f) - (_nearFarProj.x / max(1.0000000116860974e-07f, _342)))))) * max(_highLightForVisionRemoteCatch, _characterHighlight));
                    _1022 = (_991 * 1.5f);
                    _1023 = (_992 * 1.5f);
                    _1024 = (_993 * 1.5f);
                  } else {
                    _1021 = 0.0f;
                    _1022 = _232.x;
                    _1023 = _232.y;
                    _1024 = _232.z;
                  }
                }
              } else {
                float _969 = _344 * 0.02500000037252903f;
                float4 _974 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_969 + _144), (_969 + _145)));
                if (!_931) {
                  if (!(_194 == _renderPassTest)) {
                    float _985 = _974.y * 0.6000000238418579f;
                    if (_194 == _renderPassEnemy) {
                      _991 = _974.x;
                      _992 = _985;
                      _993 = (_974.z * 0.6000000238418579f);
                      _994 = 10.0f;
                      _995 = 1.0f;
                    } else {
                      _991 = (_974.x * 0.5f);
                      _992 = _985;
                      _993 = _974.z;
                      _994 = 50.0f;
                      _995 = 30.0f;
                    }
                  } else {
                    _991 = _974.x;
                    _992 = _974.y;
                    _993 = _974.z;
                    _994 = 10.0f;
                    _995 = 1.0f;
                  }
                } else {
                  _991 = _974.x;
                  _992 = _974.y;
                  _993 = _974.z;
                  _994 = 10.0f;
                  _995 = 1.0f;
                }
                float _1003 = _339 - _mainPosition.x;
                float _1004 = _340 - _mainPosition.y;
                float _1005 = _341 - _mainPosition.z;
                _1021 = (((1.0f - saturate((sqrt(((_1003 * _1003) + (_1004 * _1004)) + (_1005 * _1005)) - _995) / _994)) * (1.0f - saturate(ceil(((_nearFarProj.x / max(1.0000000116860974e-07f, _343)) + 0.5f) - (_nearFarProj.x / max(1.0000000116860974e-07f, _342)))))) * max(_highLightForVisionRemoteCatch, _characterHighlight));
                _1022 = (_991 * 1.5f);
                _1023 = (_992 * 1.5f);
                _1024 = (_993 * 1.5f);
              }
            } else {
              _1021 = 0.0f;
              _1022 = _232.x;
              _1023 = _232.y;
              _1024 = _232.z;
            }
          }
        } else {
          uint _788 = uint(_bufferSizeAndInvSize.x * _144);
          uint _789 = uint(_bufferSizeAndInvSize.y * _145);
          uint4 _791 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_788), (int)(_789), 0));
          float4 _794 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_788), (int)(_789), 0));
          float _812 = (saturate(_794.x * 1.0009784698486328f) * 2.0f) + -1.0f;
          float _813 = (saturate(_794.y * 1.0009784698486328f) * 2.0f) + -1.0f;
          float _814 = (saturate(_794.z * 1.0009784698486328f) * 2.0f) + -1.0f;
          float _816 = rsqrt(dot(float3(_812, _813, _814), float3(_812, _813, _814)));
          float _817 = _816 * _812;
          float _818 = _816 * _813;
          float _819 = _814 * _816;
          float _822 = (float((uint)((uint)(((uint)((uint)(_791.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
          float _823 = (float((uint)((uint)(_791.w & 255))) * 0.007843137718737125f) + -1.0f;
          float _826 = (_822 + _823) * 0.5f;
          float _827 = (_822 - _823) * 0.5f;
          float _831 = (1.0f - abs(_826)) - abs(_827);
          float _833 = rsqrt(dot(float3(_826, _827, _831), float3(_826, _827, _831)));
          float _834 = _833 * _826;
          float _835 = _833 * _827;
          float _836 = _833 * _831;
          float _838 = select((_819 >= 0.0f), 1.0f, -1.0f);
          float _841 = -0.0f - (1.0f / (_838 + _819));
          float _842 = _818 * _841;
          float _843 = _842 * _817;
          float _844 = _838 * _817;
          float _853 = mad(_836, _817, mad(_835, _843, ((((_844 * _817) * _841) + 1.0f) * _834)));
          float _857 = mad(_836, _818, mad(_835, (_838 + (_842 * _818)), ((_834 * _838) * _843)));
          float _861 = mad(_836, _819, mad(_835, (-0.0f - _818), (-0.0f - (_844 * _834))));
          float _863 = rsqrt(dot(float3(_853, _857, _861), float3(_853, _857, _861)));
          float _878 = 1.0f - dot(float3(((_863 * _853) + -0.10000000149011612f), ((_863 * _857) + -0.10000000149011612f), ((_863 * _861) + -0.10000000149011612f)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z)));
          float _883 = frac((_time.x * 2.0f) + _878);
          float _884 = _883 * _883;
          float _888 = _878 * 10.0f;
          float4 _895 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_165 < (uint)65000), _165, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_888, _888));
          float _897 = _895.x * _895.x;
          float _916 = 6.0f / max(0.0010000000474974513f, _exposure0.x);
          _1021 = ((saturate((_897 * _897) * 4.0f) * saturate((_884 * _884) * 5.0f)) * saturate(ceil(((_nearFarProj.x / max(1.0000000116860974e-07f, _343)) + 0.05000000074505806f) - (_nearFarProj.x / max(1.0000000116860974e-07f, _342)))));
          _1022 = ((_highLightForVision * (_916 - _232.x)) + _232.x);
          _1023 = ((_highLightForVision * ((_916 * 0.6444798111915588f) - _232.y)) + _232.y);
          _1024 = (_232.z - (_highLightForVision * _232.z));
        }
      } else {
        float _466 = _339 - _mainPosition.x;
        float _467 = _340 - _mainPosition.y;
        float _468 = _341 - _mainPosition.z;
        float _478 = (1.0f - saturate(sqrt(((_466 * _466) + (_467 * _467)) + (_468 * _468)) * 0.125f)) * 0.20000000298023224f;
        float _489 = _466 - ((_viewPos.x - _mainPosition.x) * _478);
        float _490 = _467 - ((_viewPos.y - _mainPosition.y) * _478);
        float _491 = _468 - ((_viewPos.z - _mainPosition.z) * _478);
        float _493 = rsqrt(dot(float3(_489, _490, _491), float3(_489, _490, _491)));
        float _496 = _491 * _493;
        float _500 = select((_496 < 0.0f), (-0.0f - _496), _496) + 1.0f;
        float _501 = (_490 * _493) / _500;
        float _502 = (_489 * _493) / _500;
        float _507 = _time.x + sin(_time.x);
        float4 _519 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_165 < (uint)65000), _165, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((_time.x * 0.10000000149011612f) + (_502 * 2.0f)), ((_507 * 0.10000000149011612f) + (_501 * 2.0f))));
        float4 _531 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_165 < (uint)65000), _165, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((_502 - (_time.x * 0.06000000238418579f)) - (_519.x * 0.05000000074505806f)), ((_501 - (_507 * 0.06000000238418579f)) - (_519.w * 0.05000000074505806f))));
        uint _549 = uint(((((_519.w + -1.0f) + _531.y) * 0.019999999552965164f) + _144) * _bufferSizeAndInvSize.x);
        uint _550 = uint(((((_519.y + -1.0f) + _531.w) * 0.019999999552965164f) + _145) * _bufferSizeAndInvSize.y);
        uint4 _552 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_549), (int)(_550), 0));
        float4 _555 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_549), (int)(_550), 0));
        float _573 = (saturate(_555.x * 1.0009784698486328f) * 2.0f) + -1.0f;
        float _574 = (saturate(_555.y * 1.0009784698486328f) * 2.0f) + -1.0f;
        float _575 = (saturate(_555.z * 1.0009784698486328f) * 2.0f) + -1.0f;
        float _577 = rsqrt(dot(float3(_573, _574, _575), float3(_573, _574, _575)));
        float _578 = _577 * _573;
        float _579 = _577 * _574;
        float _580 = _575 * _577;
        float _583 = (float((uint)((uint)(((uint)((uint)(_552.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
        float _584 = (float((uint)((uint)(_552.w & 255))) * 0.007843137718737125f) + -1.0f;
        float _587 = (_583 + _584) * 0.5f;
        float _588 = (_583 - _584) * 0.5f;
        float _592 = (1.0f - abs(_587)) - abs(_588);
        float _594 = rsqrt(dot(float3(_587, _588, _592), float3(_587, _588, _592)));
        float _595 = _594 * _587;
        float _596 = _594 * _588;
        float _597 = _594 * _592;
        float _599 = select((_580 >= 0.0f), 1.0f, -1.0f);
        float _602 = -0.0f - (1.0f / (_599 + _580));
        float _603 = _579 * _602;
        float _604 = _603 * _578;
        float _605 = _599 * _578;
        float _614 = mad(_597, _578, mad(_596, _604, ((((_605 * _578) * _602) + 1.0f) * _595)));
        float _618 = mad(_597, _579, mad(_596, (_599 + (_603 * _579)), ((_595 * _599) * _604)));
        float _622 = mad(_597, _580, mad(_596, (-0.0f - _579), (-0.0f - (_605 * _595))));
        float _624 = rsqrt(dot(float3(_614, _618, _622), float3(_614, _618, _622)));
        float _634 = 1.0f - abs(dot(float3((_624 * _614), (_624 * _618), (_624 * _622)), float3(_viewDir.x, _viewDir.y, _viewDir.z)));
        float _639 = saturate((_634 * _634) + ((_531.y * _519.y) * _531.z));
        float _653 = 1.0f - dot(float3((((_531.x + -0.5f) * _531.w) + _227), (((_531.y + -0.5f) * _531.w) + _228), (((_531.z + -0.5f) * _531.w) + _229)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z)));
        float _662 = (saturate(_639 * 10.0f) * saturate((_653 * _653) * 3.0f)) + ((_531.x * _531.z) * _531.w);
        int _666 = WaveReadLaneFirst(_materialIndex);
        int _674 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_666 < (uint)170000), _666, 0)) + 0u))]._objectiveMaskColor);
        float _677 = float((uint)((uint)(((uint)((uint)(_674)) >> 16) & 255)));
        float _680 = float((uint)((uint)(((uint)((uint)(_674)) >> 8) & 255)));
        float _682 = float((uint)((uint)(_674 & 255)));
        float _715 = (_531.y * _531.w) * (1.0f / max(0.0010000000474974513f, _exposure0.x));
        float _733 = rsqrt(dot(float3(_detectModeLook.x, _detectModeLook.y, _detectModeLook.z), float3(_detectModeLook.x, _detectModeLook.y, _detectModeLook.z)));
        float _734 = _733 * _detectModeLook.x;
        float _735 = _733 * _detectModeLook.y;
        float _736 = _733 * _detectModeLook.z;
        float _737 = _339 - _detectModePosition.x;
        float _738 = _340 - _detectModePosition.y;
        float _739 = _341 - _detectModePosition.z;
        float _740 = dot(float3(_734, _735, _736), float3(_737, _738, _739));
        float _746 = _737 - (_734 * _740);
        float _747 = _738 - (_735 * _740);
        float _748 = _739 - (_736 * _740);
        float _767 = 1.0f - saturate(sqrt(((_737 * _737) + (_738 * _738)) + (_739 * _739)) / _detectModeRadius);
        _1021 = (((_767 * _767) * ((1.0f - saturate(sqrt(((_746 * _746) + (_747 * _747)) + (_748 * _748)) / max(0.0010000000474974513f, (tan(_detectModeAngle * 0.01745329238474369f) * _740)))) * (((_639 - _662) * saturate(ceil(((_nearFarProj.x / max(1.0000000116860974e-07f, _343)) + 0.05000000074505806f) - (_nearFarProj.x / max(1.0000000116860974e-07f, _342))))) + _662))) * _highLightForVision);
        _1022 = (_715 * select(((_677 * 0.011764707043766975f) < 0.040449999272823334f), (_677 * 0.0009105810313485563f), exp2(log2((_677 * 0.011151381768286228f) + 0.052132703363895416f) * 2.4000000953674316f)));
        _1023 = (_715 * select(((_680 * 0.011764707043766975f) < 0.040449999272823334f), (_680 * 0.0009105810313485563f), exp2(log2((_680 * 0.011151381768286228f) + 0.052132703363895416f) * 2.4000000953674316f)));
        _1024 = (_715 * select(((_682 * 0.011764707043766975f) < 0.040449999272823334f), (_682 * 0.0009105810313485563f), exp2(log2((_682 * 0.011151381768286228f) + 0.052132703363895416f) * 2.4000000953674316f)));
      }
    }
  } else {
    _1021 = 0.0f;
    _1022 = 0.0f;
    _1023 = 0.0f;
    _1024 = 0.0f;
  }
  float _1028 = abs(_temperatureWarning * 0.009999999776482582f);
  if (_51) {
    if (_temperatureWarning > 0.0f) {
      float _1035 = _67 * TEXCOORD.x;
      float4 _1048 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_165 < (uint)65000), _165, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1035 * 4.25f), ((TEXCOORD.y * 3.0f) - (_time.x * 0.15000000596046448f))));
      float4 _1060 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_165 < (uint)65000), _165, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1035 * 2.299999952316284f), (((TEXCOORD.y * 2.0999999046325684f) - (_1048.x * 0.10000000149011612f)) + (_time.x * 0.20000000298023224f))));
      float _1066 = TEXCOORD.x + -0.5f;
      float _1099 = abs((_1066 + ((_1048.y + -0.5f) * 0.009999999776482582f)) + ((_1060.z + -0.5f) * 0.029999999329447746f));
      float _1100 = abs(((TEXCOORD.y + -0.5f) + ((_1048.x + -0.5f) * 0.019999999552965164f)) + ((_1060.y + -0.5f) * 0.029999999329447746f));
      float _1103 = max((_1099 + -0.5f), 0.0f);
      float _1104 = max((_1100 + -0.5f), 0.0f);
      float _1111 = 0.5f - min(max((((1.0f - (saturate(abs(_1066) * 2.0f) * 0.3999999761581421f)) * ((_1028 * 0.05000000447034836f) + 0.10000000149011612f)) * (((((_1048.z * 0.30000001192092896f) + -0.5f) + (_1060.x * 0.699999988079071f)) * 1.100000023841858f) + 1.0f)), ((_1028 * 0.017500001937150955f) + 0.03500000014901161f)), ((_1028 * 0.11000001430511475f) + 0.2200000137090683f));
      float _1114 = max((_1099 - _1111), 0.0f);
      float _1115 = max((_1100 - _1111), 0.0f);
      float _1126 = saturate((TEXCOORD.y + -0.15000000596046448f) * 1.2500001192092896f);
      float _1142 = saturate(_1060.x * _1048.x);
      float _1143 = _1028 * 0.20000000298023224f;
      float _1151 = ((saturate(_1028 * 2.0f) * saturate(saturate(sqrt((_1115 * _1115) + (_1114 * _1114)) * 10.0f) - saturate(sqrt((_1104 * _1104) + (_1103 * _1103)) * 10.0f))) * ((_1142 * (1.0f - _1143)) + _1143)) * ((((_1126 * _1126) * (3.0f - (_1126 * 2.0f))) * ((saturate((((_1048.x * 0.25f) + -0.3499999940395355f) + (_1060.y * 0.75f)) * 1.600000023841858f) * 0.5f) + -0.3500000238418579f)) + 1.0f);
      float _1155 = _1151 * (_1028 * 0.10000000149011612f);
      float4 _1163 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_1155 * (0.5f - TEXCOORD.x)) * _1060.x) + TEXCOORD.x), (((_1155 * (0.5f - TEXCOORD.y)) * _1060.y) + TEXCOORD.y)));
      float _1167 = 1.0f - _1151;
      float _1174 = ((_1167 * _1167) * _1167) * saturate(((_1142 * _1142) * 2.0f) * _1142);
      float _1177 = max(0.0010000000474974513f, _exposure0.x);
      float _1187 = (((1.0f / _1177) - _1163.x) * _1174) + _1163.x;
      float _1188 = (((0.6000000238418579f / _1177) - _1163.y) * _1174) + _1163.y;
      float _1189 = (((0.30000001192092896f / _1177) - _1163.z) * _1174) + _1163.z;
      float _1199 = ((_1028 * _1028) * _1028) * saturate(_1028 + -0.5f);
      float _1204 = saturate(_1151 * 2.0f);
      _1319 = (_1204 + _1021);
      _1320 = ((((_1187 - _1022) + (((_1151 / _1177) - _1187) * _1199)) * _1204) + _1022);
      _1321 = ((((_1188 - _1023) + ((((_1151 * 0.25f) / _1177) - _1188) * _1199)) * _1204) + _1023);
      _1322 = ((((_1189 - _1024) - (_1189 * _1199)) * _1204) + _1024);
    } else {
      if (_temperatureWarning < 0.0f) {
        float _1221 = _67 * TEXCOORD.x;
        float4 _1230 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_165 < (uint)65000), _165, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1221 * 1.5f), (TEXCOORD.y * 1.5f)));
        int _1235 = WaveReadLaneFirst(_materialIndex);
        int _1243 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1235 < (uint)170000), _1235, 0)) + 0u))]._temperatureWarningTex);
        float4 _1250 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1243 < (uint)65000), _1243, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1221 * 2.0f), _70));
        float _1258 = (select(((TEXCOORD.y / (1.0f - TEXCOORD.x)) < 1.0f), (1.0f - _1250.y), _1250.y) + -0.5f) * 0.30000001192092896f;
        float _1260 = (_1230.x + -0.4000000059604645f) * 0.20000000298023224f;
        float _1268 = max(0.0010000000474974513f, _exposure0.x);
        float _1281 = 0.5f - (_1028 * 0.25f);
        float _1284 = max((abs(((TEXCOORD.x + -0.5f) + _1260) + _1258) - _1281), 0.0f);
        float _1285 = max((abs(((_1258 + _1260) + -0.4749999940395355f) + (TEXCOORD.y * 0.8999999761581421f)) - _1281), 0.0f);
        float _1307 = (_1028 * (1.0f - TEXCOORD.y)) * saturate((((_1250.y * 4.0f) * saturate(1.0f - ((1.0f - saturate(sqrt((_1285 * _1285) + (_1284 * _1284)) * 6.666666507720947f)) * 2.0f))) * saturate((_1250.y * _1250.y) * 2.0f)) * saturate(_1230.z * _1230.w));
        _1319 = (_1307 + _1021);
        _1320 = ((_1307 * ((((_1230.w * 1.8809775114059448f) + 0.11902248114347458f) / _1268) - _1022)) + _1022);
        _1321 = ((_1307 * ((((_1230.w * 1.3989123106002808f) + 0.6010876893997192f) / _1268) - _1023)) + _1023);
        _1322 = ((_1307 * ((2.0f / _1268) - _1024)) + _1024);
      } else {
        _1319 = _1021;
        _1320 = _1022;
        _1321 = _1023;
        _1322 = _1024;
      }
    }
  } else {
    _1319 = _1021;
    _1320 = _1022;
    _1321 = _1023;
    _1322 = _1024;
  }
  if (!(_electrocutionWarning == 0.0f)) {
    float _1327 = _67 * TEXCOORD.x;
    float4 _1336 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_165 < (uint)65000), _165, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1327 * 1.5f), (TEXCOORD.y * 1.5f)));
    int _1349 = WaveReadLaneFirst(_materialIndex);
    int _1357 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1349 < (uint)170000), _1349, 0)) + 0u))]._electrocutionTex);
    float4 _1364 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1357 < (uint)65000), _1357, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((_1336.x * 0.05000000074505806f) + (_1327 * 2.0f)), (((_1336.y * 0.05000000074505806f) + _70) + (_time.x * 0.10000000149011612f))));
    float _1368 = max(0.0010000000474974513f, _exposure0.x);
    float _1377 = 0.5f - (_electrocutionWarning * 0.07000000029802322f);
    float _1380 = max((abs(TEXCOORD.x + -0.5f) - _1377), 0.0f);
    float _1381 = max((abs(TEXCOORD.y + -0.5f) - _1377), 0.0f);
    float _1396 = 1.0f - abs((frac((_time.x * 2.0f) + _1336.y) * 2.0f) + -1.0f);
    float _1399 = (_1396 * _1396) * (saturate(sqrt((_1381 * _1381) + (_1380 * _1380)) / _1336.z) * _1364.x);
    float _1402 = (pow(_1399, 1.600000023841858f));
    _1414 = (_1399 + _1319);
    _1415 = ((_1402 * ((340.0f / _1368) - _1320)) + _1320);
    _1416 = ((_1402 * ((660.0f / _1368) - _1321)) + _1321);
    _1417 = ((_1402 * ((2000.0f / _1368) - _1322)) + _1322);
  } else {
    _1414 = _1319;
    _1415 = _1320;
    _1416 = _1321;
    _1417 = _1322;
  }
  uint _1419 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _1426 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_1419), 0));
    _1432 = (float((uint)((uint)(_1426.x & 127))) + 0.5f);
  } else {
    _1432 = saturate(_1414);
  }
  bool _1435 = (_localToneMappingParams.w > 0.0f);
  if (_1435) {
    float3 output_color = TonemapReplacer(float3(_1415, _1416, _1417));
    _1788 = output_color.x;
    _1789 = output_color.y;
    _1790 = output_color.z;
  } else {
    _1788 = _1415;
    _1789 = _1416;
    _1790 = _1417;
  }
  if (_etcParams.y > 1.0f) {
    float _1796 = abs(_69);
    float _1797 = abs(_70 + -1.0f);
    float _1801 = saturate(1.0f - (dot(float2(_1796, _1797), float2(_1796, _1797)) * saturate(_etcParams.y + -1.0f)));
    _1806 = (_1801 * _1788);
    _1807 = (_1801 * _1789);
    _1808 = (_1801 * _1790);
  } else {
    _1806 = _1788;
    _1807 = _1789;
    _1808 = _1790;
  }
  if ((_1435) && ((_etcParams.z > 0.0f))) {
    _1838 = select((_1806 <= 0.0031308000907301903f), (_1806 * 12.920000076293945f), (((pow(_1806, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1839 = select((_1807 <= 0.0031308000907301903f), (_1807 * 12.920000076293945f), (((pow(_1807, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1840 = select((_1808 <= 0.0031308000907301903f), (_1808 * 12.920000076293945f), (((pow(_1808, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1838 = _1806;
    _1839 = _1807;
    _1840 = _1808;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _1845 = float((uint)_1419);
    if (!(_1845 < _viewDir.w)) {
      if (!(_1845 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _1854 = _1838;
        _1855 = _1839;
        _1856 = _1840;
      } else {
        _1854 = 0.0f;
        _1855 = 0.0f;
        _1856 = 0.0f;
      }
    } else {
      _1854 = 0.0f;
      _1855 = 0.0f;
      _1856 = 0.0f;
    }
  } else {
    _1854 = _1838;
    _1855 = _1839;
    _1856 = _1840;
  }
  SV_Target.x = _1854;
  SV_Target.y = _1855;
  SV_Target.z = _1856;
  SV_Target.w = _1432;
  return SV_Target;
}