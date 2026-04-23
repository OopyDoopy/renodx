#include "../tonemap.hlsli"

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

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t33, space36);

Texture2D<uint> __3__36__0__0__g_depthOpaque : register(t16, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t38, space36);

Texture2D<uint4> __3__36__0__0__g_gbufferBaseColor : register(t77, space36);

Texture2D<float4> __3__36__0__0__g_gbufferNormal : register(t64, space36);

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

ConstantBuffer<PostProcessUber_CDStruct> BindlessParameters_PostProcessUber_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _25[36];
  int _37 = WaveReadLaneFirst(_materialIndex);
  bool _46 = (WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_37 < (uint)170000), _37, 0)) + 0u))]._itemRatio) >= 0.009999999776482582f);
  bool _50 = (abs(_temperatureWarning) >= 0.009999999776482582f);
  float _139;
  float _140;
  float _143;
  float _144;
  float _206;
  float _207;
  int _287;
  int _362;
  float _363;
  float _364;
  float _365;
  float _366;
  float _367;
  float _368;
  float _1060;
  float _1061;
  float _1062;
  float _1063;
  float _1064;
  float _1090;
  float _1091;
  float _1092;
  float _1093;
  float _1424;
  float _1425;
  float _1426;
  float _1427;
  float _1519;
  float _1520;
  float _1521;
  float _1522;
  float _1537;
  float _1783;
  float _1784;
  float _1785;
  float _1905;
  float _1906;
  float _1907;
  float _1925;
  float _1926;
  float _1927;
  float _1960;
  float _1961;
  float _1962;
  float _1976;
  float _1977;
  float _1978;
  if (!((_46) || (_50))) {
    if (true) discard;
  }
  float _66 = _screenSizeAndInvSize.x / _screenSizeAndInvSize.y;
  float _68 = (TEXCOORD.x * 2.0f) + -1.0f;
  float _69 = TEXCOORD.y * 2.0f;
  float _70 = 1.0f - _69;
  int _71 = WaveReadLaneFirst(_materialIndex);
  float _79 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_71 < (uint)170000), _71, 0)) + 0u))]._fishEyeMaxPower);
  if (((((_79 > 0.0010000000474974513f)) || ((_79 < -0.0010000000474974513f)))) && ((!_46))) {
    float _91 = 0.5f / _66;
    float _98 = (((_destTargetSizAndInv.x * TEXCOORD.x) / _srcTargetSizeAndInv.x) * 4.0f) + -0.5f;
    float _99 = (((_destTargetSizAndInv.y * TEXCOORD.y) / _srcTargetSizeAndInv.x) * 4.0f) - _91;
    float _100 = dot(float2(_98, _99), float2(_98, _99));
    float _101 = sqrt(_100);
    if (_79 > 0.0f) {
      float _105 = sqrt(dot(float2(0.5f, _91), float2(0.5f, _91)));
      float _110 = tan(_101 * _79) * (rsqrt(_100) * _105);
      float _114 = tan(_105 * _79);
      _139 = (((_110 * _98) / _114) + 0.5f);
      _140 = (((_110 * _99) / _114) + _91);
    } else {
      if (_79 < 0.0f) {
        float _123 = select((_66 < 1.0f), 0.5f, _91);
        float _125 = _79 * -10.0f;
        float _129 = atan(_101 * _125) * (rsqrt(_100) * _123);
        float _133 = atan(_123 * _125);
        _139 = (((_129 * _98) / _133) + 0.5f);
        _140 = (((_129 * _99) / _133) + _91);
      } else {
        _139 = 0.0f;
        _140 = 0.0f;
      }
    }
    _143 = _139;
    _144 = (_140 * _66);
  } else {
    _143 = TEXCOORD.x;
    _144 = TEXCOORD.y;
  }
  int _145 = WaveReadLaneFirst(_materialIndex);
  int _153 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_145 < (uint)170000), _145, 0)) + 0u))]._noiseTex);
  if (((((_highLightForVisionRemoteCatch > 0.0f)) || ((_highLightForVision > 0.0f)))) || ((_characterHighlight > 0.0f))) {
    int2 _165; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_165.x, _165.y);
    uint _180 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_165.x))))) + 0.5f) * _143), int((float((int)(int(float((int)(_165.y))))) + 0.5f) * _144), 0));
    int _182 = _180.x & 255;
    float _190 = (float((uint)((uint)((uint)((uint)(_180.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
    float _191 = (float((uint)((uint)(((uint)((uint)(_180.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
    float _193 = 1.0f - abs(_190);
    float _194 = abs(_191);
    float _195 = _193 - _194;
    if (!(_195 >= 0.0f)) {
      _206 = (select((_190 >= 0.0f), 1.0f, -1.0f) * (1.0f - _194));
      _207 = (select((_191 >= 0.0f), 1.0f, -1.0f) * _193);
    } else {
      _206 = _190;
      _207 = _191;
    }
    float _209 = rsqrt(dot(float3(_206, _207, _195), float3(_206, _207, _195)));
    float _210 = _209 * _206;
    float _211 = _209 * _207;
    float _212 = _209 * _195;
    float _214 = rsqrt(dot(float3(_210, _211, _212), float3(_210, _211, _212)));
    float _215 = _214 * _210;
    float _216 = _214 * _211;
    float _217 = _214 * _212;
    float4 _220 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(_143, _144));
    float _230 = (pow(_220.x, 0.012683313339948654f));
    float _231 = (pow(_220.y, 0.012683313339948654f));
    float _232 = (pow(_220.z, 0.012683313339948654f));
    float _257 = exp2(log2(max(0.0f, (_230 + -0.8359375f)) / (18.8515625f - (_230 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    float _258 = exp2(log2(max(0.0f, (_231 + -0.8359375f)) / (18.8515625f - (_231 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    float _259 = exp2(log2(max(0.0f, (_232 + -0.8359375f)) / (18.8515625f - (_232 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    if (_182 == _renderPassDetectObjective) {
      _287 = _renderPassDetectRemoteCatch;
      float4 _296 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * _143), int(_customRenderPassSizeInvSize.y * _144), 0));
      float _298 = max(1.0000000116860974e-07f, _296.x);
      float _334 = mad((_invViewProj[3].z), _298, mad((_invViewProj[3].y), _70, ((_invViewProj[3].x) * _68))) + (_invViewProj[3].w);
      uint _346 = __3__36__0__0__g_depthOpaque.Load(int3((int)(uint(_bufferSizeAndInvSize.x * _143)), (int)(uint(_bufferSizeAndInvSize.y * _144)), 0));
      _362 = _287;
      _363 = ((mad((_invViewProj[0].z), _298, mad((_invViewProj[0].y), _70, ((_invViewProj[0].x) * _68))) + (_invViewProj[0].w)) / _334);
      _364 = ((mad((_invViewProj[1].z), _298, mad((_invViewProj[1].y), _70, ((_invViewProj[1].x) * _68))) + (_invViewProj[1].w)) / _334);
      _365 = ((mad((_invViewProj[2].z), _298, mad((_invViewProj[2].y), _70, ((_invViewProj[2].x) * _68))) + (_invViewProj[2].w)) / _334);
      _366 = _296.x;
      _367 = (float((uint)((uint)(_346.x & 16777215))) * 5.960465188081798e-08f);
      _368 = (1.0f - saturate(dot(float3(_215, _216, _217), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z)))));
    } else {
      bool __branch_chain_265;
      if (_182 == _renderPassDetectRemoteCatch) {
        _287 = _renderPassDetectRemoteCatch;
        __branch_chain_265 = true;
      } else {
        if (((_182 == _renderPassDetectPickedRemoteCatch)) || ((_182 == _renderPassKnowledgeNPC))) {
          _287 = _renderPassDetectRemoteCatch;
          __branch_chain_265 = true;
        } else {
          if (((_182 == _renderPassEnemy)) || ((_182 == _renderPassSelfPlayer))) {
            _287 = _renderPassDetectRemoteCatch;
            __branch_chain_265 = true;
          } else {
            if (_182 == _renderPassTest) {
              _287 = _renderPassDetectRemoteCatch;
              __branch_chain_265 = true;
            } else {
              _362 = _renderPassDetectRemoteCatch;
              _363 = 0.0f;
              _364 = 0.0f;
              _365 = 0.0f;
              _366 = 0.0f;
              _367 = 0.0f;
              _368 = 0.0f;
              __branch_chain_265 = false;
            }
          }
        }
      }
      if (__branch_chain_265) {
        float4 _296 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * _143), int(_customRenderPassSizeInvSize.y * _144), 0));
        float _298 = max(1.0000000116860974e-07f, _296.x);
        float _334 = mad((_invViewProj[3].z), _298, mad((_invViewProj[3].y), _70, ((_invViewProj[3].x) * _68))) + (_invViewProj[3].w);
        uint _346 = __3__36__0__0__g_depthOpaque.Load(int3((int)(uint(_bufferSizeAndInvSize.x * _143)), (int)(uint(_bufferSizeAndInvSize.y * _144)), 0));
        _362 = _287;
        _363 = ((mad((_invViewProj[0].z), _298, mad((_invViewProj[0].y), _70, ((_invViewProj[0].x) * _68))) + (_invViewProj[0].w)) / _334);
        _364 = ((mad((_invViewProj[1].z), _298, mad((_invViewProj[1].y), _70, ((_invViewProj[1].x) * _68))) + (_invViewProj[1].w)) / _334);
        _365 = ((mad((_invViewProj[2].z), _298, mad((_invViewProj[2].y), _70, ((_invViewProj[2].x) * _68))) + (_invViewProj[2].w)) / _334);
        _366 = _296.x;
        _367 = (float((uint)((uint)(_346.x & 16777215))) * 5.960465188081798e-08f);
        _368 = (1.0f - saturate(dot(float3(_215, _216, _217), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z)))));
      }
    }
    bool __defer_361_464 = false;
    if (!(_182 == _362) || ((_182 == _362) && (!(WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)(WaveReadLaneFirst(_materialIndex)) < (uint)170000), (WaveReadLaneFirst(_materialIndex)), 0)) + 0u))]._itemRatio) > 0.0010000000474974513f))) || (((_182 == _362) && (WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)(WaveReadLaneFirst(_materialIndex)) < (uint)170000), (WaveReadLaneFirst(_materialIndex)), 0)) + 0u))]._itemRatio) > 0.0010000000474974513f)) && (((!(_highLightForVision >= 0.0010000000474974513f))) && ((!(_highLightForVisionRemoteCatch >= 0.0010000000474974513f)))))) {
      __defer_361_464 = true;
    } else {
      float _393 = _363 - _mainPosition.x;
      float _394 = _364 - _mainPosition.y;
      float _395 = _365 - _mainPosition.z;
      float _423 = rsqrt(dot(float3(_detectModeLook.x, _detectModeLook.y, _detectModeLook.z), float3(_detectModeLook.x, _detectModeLook.y, _detectModeLook.z)));
      float _424 = _423 * _detectModeLook.x;
      float _425 = _423 * _detectModeLook.y;
      float _426 = _423 * _detectModeLook.z;
      float _427 = _363 - _detectModePosition.x;
      float _428 = _364 - _detectModePosition.y;
      float _429 = _365 - _detectModePosition.z;
      float _430 = dot(float3(_424, _425, _426), float3(_427, _428, _429));
      float _436 = _427 - (_424 * _430);
      float _437 = _428 - (_425 * _430);
      float _438 = _429 - (_426 * _430);
      _1090 = ((((1.0f - saturate((sqrt(((_393 * _393) + (_394 * _394)) + (_395 * _395)) + -30.0f) * 0.05000000074505806f)) * saturate((_368 * _368) * 4.0f)) * (1.0f - saturate(sqrt(((_436 * _436) + (_437 * _437)) + (_438 * _438)) / max(0.0010000000474974513f, (tan(_detectModeAngle * 0.01745329238474369f) * _430))))) * exp2(log2(1.0f - saturate(sqrt(((_427 * _427) + (_428 * _428)) + (_429 * _429)) / _detectModeRadius)) * 10.0f));
      _1091 = _257;
      _1092 = _258;
      _1093 = _259;
    }
    if (__defer_361_464) {
      if (!(_182 == _renderPassDetectObjective) || ((_182 == _renderPassDetectObjective) && (((!(_highLightForVision >= 0.0010000000474974513f))) && ((!(_highLightForVisionRemoteCatch >= 0.0010000000474974513f)))))) {
        if (!(_182 == _renderPassKnowledgeNPC) || ((_182 == _renderPassKnowledgeNPC) && (!(_highLightForVision >= 0.0010000000474974513f)))) {
          bool _955 = (_182 == _renderPassSelfPlayer);
          bool __defer_952_966 = false;
          if ((_955) | (((((_182 == _renderPassTest)) || ((_182 == _renderPassEnemy)))) || ((_182 == _renderPassDetectPickedRemoteCatch)))) {
            __defer_952_966 = true;
          } else {
            _1090 = 0.0f;
            _1091 = _257;
            _1092 = _258;
            _1093 = _259;
          }
          if (__defer_952_966) {
            if (((_characterHighlight > 0.0010000000474974513f)) || ((_highLightForVisionRemoteCatch > 0.0010000000474974513f))) {
              uint2 _982 = __3__36__0__0__g_stencil.Load(int3((int)(uint(_bufferSizeAndInvSize.x * _143)), (int)(uint(_bufferSizeAndInvSize.y * _144)), 0));
              int _984 = _982.x & 127;
              bool __defer_973_990 = false;
              if (!((uint)_984 > (uint)10) | ((((uint)_984 > (uint)19)) && ((_984 != 107)))) {
                __defer_973_990 = true;
              } else {
                _1090 = 0.0f;
                _1091 = _257;
                _1092 = _258;
                _1093 = _259;
              }
              if (__defer_973_990) {
                float _1002 = _368 * 0.02500000037252903f;
                float4 _1007 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1002 + _143), (_1002 + _144)));
                float _1017 = (pow(_1007.x, 0.012683313339948654f));
                float _1018 = (pow(_1007.y, 0.012683313339948654f));
                float _1019 = (pow(_1007.z, 0.012683313339948654f));
                float _1041 = exp2(log2(max(0.0f, (_1017 + -0.8359375f)) / (18.8515625f - (_1017 * 18.6875f))) * 6.277394771575928f);
                float _1042 = exp2(log2(max(0.0f, (_1018 + -0.8359375f)) / (18.8515625f - (_1018 * 18.6875f))) * 6.277394771575928f);
                float _1043 = exp2(log2(max(0.0f, (_1019 + -0.8359375f)) / (18.8515625f - (_1019 * 18.6875f))) * 6.277394771575928f);
                float _1044 = _1041 * 10000.0f;
                float _1045 = _1042 * 10000.0f;
                float _1046 = _1043 * 10000.0f;
                if (!_955) {
                  if (!(_182 == _renderPassTest)) {
                    float _1054 = _1042 * 6000.0f;
                    if (_182 == _renderPassEnemy) {
                      _1060 = _1044;
                      _1061 = _1054;
                      _1062 = (_1043 * 6000.0f);
                      _1063 = 10.0f;
                      _1064 = 1.0f;
                    } else {
                      _1060 = (_1041 * 5000.0f);
                      _1061 = _1054;
                      _1062 = _1046;
                      _1063 = 50.0f;
                      _1064 = 30.0f;
                    }
                  } else {
                    _1060 = _1044;
                    _1061 = _1045;
                    _1062 = _1046;
                    _1063 = 10.0f;
                    _1064 = 1.0f;
                  }
                } else {
                  _1060 = _1044;
                  _1061 = _1045;
                  _1062 = _1046;
                  _1063 = 10.0f;
                  _1064 = 1.0f;
                }
                float _1072 = _363 - _mainPosition.x;
                float _1073 = _364 - _mainPosition.y;
                float _1074 = _365 - _mainPosition.z;
                _1090 = (((1.0f - saturate((sqrt(((_1072 * _1072) + (_1073 * _1073)) + (_1074 * _1074)) - _1064) / _1063)) * (1.0f - saturate(ceil(((_nearFarProj.x / max(1.0000000116860974e-07f, _367)) + 0.5f) - (_nearFarProj.x / max(1.0000000116860974e-07f, _366)))))) * max(_highLightForVisionRemoteCatch, _characterHighlight));
                _1091 = (_1060 * 1.5f);
                _1092 = (_1061 * 1.5f);
                _1093 = (_1062 * 1.5f);
              }
            } else {
              _1090 = 0.0f;
              _1091 = _257;
              _1092 = _258;
              _1093 = _259;
            }
          }
        } else {
          uint _812 = uint(_bufferSizeAndInvSize.x * _143);
          uint _813 = uint(_bufferSizeAndInvSize.y * _144);
          uint4 _815 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_812), (int)(_813), 0));
          float4 _818 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_812), (int)(_813), 0));
          float _836 = (saturate(_818.x * 1.0009784698486328f) * 2.0f) + -1.0f;
          float _837 = (saturate(_818.y * 1.0009784698486328f) * 2.0f) + -1.0f;
          float _838 = (saturate(_818.z * 1.0009784698486328f) * 2.0f) + -1.0f;
          float _840 = rsqrt(dot(float3(_836, _837, _838), float3(_836, _837, _838)));
          float _841 = _840 * _836;
          float _842 = _840 * _837;
          float _843 = _838 * _840;
          float _846 = (float((uint)((uint)(((uint)((uint)(_815.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
          float _847 = (float((uint)((uint)(_815.w & 255))) * 0.007843137718737125f) + -1.0f;
          float _850 = (_846 + _847) * 0.5f;
          float _851 = (_846 - _847) * 0.5f;
          float _855 = (1.0f - abs(_850)) - abs(_851);
          float _857 = rsqrt(dot(float3(_850, _851, _855), float3(_850, _851, _855)));
          float _858 = _857 * _850;
          float _859 = _857 * _851;
          float _860 = _857 * _855;
          float _862 = select((_843 >= 0.0f), 1.0f, -1.0f);
          float _865 = -0.0f - (1.0f / (_862 + _843));
          float _866 = _842 * _865;
          float _867 = _866 * _841;
          float _868 = _862 * _841;
          float _877 = mad(_860, _841, mad(_859, _867, ((((_868 * _841) * _865) + 1.0f) * _858)));
          float _881 = mad(_860, _842, mad(_859, (_862 + (_866 * _842)), ((_858 * _862) * _867)));
          float _885 = mad(_860, _843, mad(_859, (-0.0f - _842), (-0.0f - (_868 * _858))));
          float _887 = rsqrt(dot(float3(_877, _881, _885), float3(_877, _881, _885)));
          float _902 = 1.0f - dot(float3(((_887 * _877) + -0.10000000149011612f), ((_887 * _881) + -0.10000000149011612f), ((_887 * _885) + -0.10000000149011612f)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z)));
          float _907 = frac((_time.x * 2.0f) + _902);
          float _908 = _907 * _907;
          float _912 = _902 * 10.0f;
          float4 _919 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_153 < (uint)65000), _153, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_912, _912));
          float _921 = _919.x * _919.x;
          float _940 = 6.0f / max(0.0010000000474974513f, _exposure0.x);
          _1090 = ((saturate((_921 * _921) * 4.0f) * saturate((_908 * _908) * 5.0f)) * saturate(ceil(((_nearFarProj.x / max(1.0000000116860974e-07f, _367)) + 0.05000000074505806f) - (_nearFarProj.x / max(1.0000000116860974e-07f, _366)))));
          _1091 = ((_highLightForVision * (_940 - _257)) + _257);
          _1092 = ((_highLightForVision * ((_940 * 0.6444798111915588f) - _258)) + _258);
          _1093 = (_259 - (_highLightForVision * _259));
        }
      } else {
        float _490 = _363 - _mainPosition.x;
        float _491 = _364 - _mainPosition.y;
        float _492 = _365 - _mainPosition.z;
        float _502 = (1.0f - saturate(sqrt(((_490 * _490) + (_491 * _491)) + (_492 * _492)) * 0.125f)) * 0.20000000298023224f;
        float _513 = _490 - ((_viewPos.x - _mainPosition.x) * _502);
        float _514 = _491 - ((_viewPos.y - _mainPosition.y) * _502);
        float _515 = _492 - ((_viewPos.z - _mainPosition.z) * _502);
        float _517 = rsqrt(dot(float3(_513, _514, _515), float3(_513, _514, _515)));
        float _520 = _515 * _517;
        float _524 = select((_520 < 0.0f), (-0.0f - _520), _520) + 1.0f;
        float _525 = (_514 * _517) / _524;
        float _526 = (_513 * _517) / _524;
        float _531 = _time.x + sin(_time.x);
        float4 _543 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_153 < (uint)65000), _153, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((_time.x * 0.10000000149011612f) + (_526 * 2.0f)), ((_531 * 0.10000000149011612f) + (_525 * 2.0f))));
        float4 _555 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_153 < (uint)65000), _153, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((_526 - (_time.x * 0.06000000238418579f)) - (_543.x * 0.05000000074505806f)), ((_525 - (_531 * 0.06000000238418579f)) - (_543.w * 0.05000000074505806f))));
        uint _573 = uint(((((_543.w + -1.0f) + _555.y) * 0.019999999552965164f) + _143) * _bufferSizeAndInvSize.x);
        uint _574 = uint(((((_543.y + -1.0f) + _555.w) * 0.019999999552965164f) + _144) * _bufferSizeAndInvSize.y);
        uint4 _576 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_573), (int)(_574), 0));
        float4 _579 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_573), (int)(_574), 0));
        float _597 = (saturate(_579.x * 1.0009784698486328f) * 2.0f) + -1.0f;
        float _598 = (saturate(_579.y * 1.0009784698486328f) * 2.0f) + -1.0f;
        float _599 = (saturate(_579.z * 1.0009784698486328f) * 2.0f) + -1.0f;
        float _601 = rsqrt(dot(float3(_597, _598, _599), float3(_597, _598, _599)));
        float _602 = _601 * _597;
        float _603 = _601 * _598;
        float _604 = _599 * _601;
        float _607 = (float((uint)((uint)(((uint)((uint)(_576.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
        float _608 = (float((uint)((uint)(_576.w & 255))) * 0.007843137718737125f) + -1.0f;
        float _611 = (_607 + _608) * 0.5f;
        float _612 = (_607 - _608) * 0.5f;
        float _616 = (1.0f - abs(_611)) - abs(_612);
        float _618 = rsqrt(dot(float3(_611, _612, _616), float3(_611, _612, _616)));
        float _619 = _618 * _611;
        float _620 = _618 * _612;
        float _621 = _618 * _616;
        float _623 = select((_604 >= 0.0f), 1.0f, -1.0f);
        float _626 = -0.0f - (1.0f / (_623 + _604));
        float _627 = _603 * _626;
        float _628 = _627 * _602;
        float _629 = _623 * _602;
        float _638 = mad(_621, _602, mad(_620, _628, ((((_629 * _602) * _626) + 1.0f) * _619)));
        float _642 = mad(_621, _603, mad(_620, (_623 + (_627 * _603)), ((_619 * _623) * _628)));
        float _646 = mad(_621, _604, mad(_620, (-0.0f - _603), (-0.0f - (_629 * _619))));
        float _648 = rsqrt(dot(float3(_638, _642, _646), float3(_638, _642, _646)));
        float _658 = 1.0f - abs(dot(float3((_648 * _638), (_648 * _642), (_648 * _646)), float3(_viewDir.x, _viewDir.y, _viewDir.z)));
        float _663 = saturate((_658 * _658) + ((_555.y * _543.y) * _555.z));
        float _677 = 1.0f - dot(float3((((_555.x + -0.5f) * _555.w) + _215), (((_555.y + -0.5f) * _555.w) + _216), (((_555.z + -0.5f) * _555.w) + _217)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z)));
        float _686 = (saturate(_663 * 10.0f) * saturate((_677 * _677) * 3.0f)) + ((_555.x * _555.z) * _555.w);
        int _690 = WaveReadLaneFirst(_materialIndex);
        int _698 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_690 < (uint)170000), _690, 0)) + 0u))]._objectiveMaskColor);
        float _701 = float((uint)((uint)(((uint)((uint)(_698)) >> 16) & 255)));
        float _704 = float((uint)((uint)(((uint)((uint)(_698)) >> 8) & 255)));
        float _706 = float((uint)((uint)(_698 & 255)));
        float _739 = (_555.y * _555.w) * (1.0f / max(0.0010000000474974513f, _exposure0.x));
        float _757 = rsqrt(dot(float3(_detectModeLook.x, _detectModeLook.y, _detectModeLook.z), float3(_detectModeLook.x, _detectModeLook.y, _detectModeLook.z)));
        float _758 = _757 * _detectModeLook.x;
        float _759 = _757 * _detectModeLook.y;
        float _760 = _757 * _detectModeLook.z;
        float _761 = _363 - _detectModePosition.x;
        float _762 = _364 - _detectModePosition.y;
        float _763 = _365 - _detectModePosition.z;
        float _764 = dot(float3(_758, _759, _760), float3(_761, _762, _763));
        float _770 = _761 - (_758 * _764);
        float _771 = _762 - (_759 * _764);
        float _772 = _763 - (_760 * _764);
        float _791 = 1.0f - saturate(sqrt(((_761 * _761) + (_762 * _762)) + (_763 * _763)) / _detectModeRadius);
        _1090 = (((_791 * _791) * ((1.0f - saturate(sqrt(((_770 * _770) + (_771 * _771)) + (_772 * _772)) / max(0.0010000000474974513f, (tan(_detectModeAngle * 0.01745329238474369f) * _764)))) * (((_663 - _686) * saturate(ceil(((_nearFarProj.x / max(1.0000000116860974e-07f, _367)) + 0.05000000074505806f) - (_nearFarProj.x / max(1.0000000116860974e-07f, _366))))) + _686))) * _highLightForVision);
        _1091 = (_739 * select(((_701 * 0.011764707043766975f) < 0.040449999272823334f), (_701 * 0.0009105810313485563f), exp2(log2((_701 * 0.011151381768286228f) + 0.052132703363895416f) * 2.4000000953674316f)));
        _1092 = (_739 * select(((_704 * 0.011764707043766975f) < 0.040449999272823334f), (_704 * 0.0009105810313485563f), exp2(log2((_704 * 0.011151381768286228f) + 0.052132703363895416f) * 2.4000000953674316f)));
        _1093 = (_739 * select(((_706 * 0.011764707043766975f) < 0.040449999272823334f), (_706 * 0.0009105810313485563f), exp2(log2((_706 * 0.011151381768286228f) + 0.052132703363895416f) * 2.4000000953674316f)));
      }
    }
  } else {
    _1090 = 0.0f;
    _1091 = 0.0f;
    _1092 = 0.0f;
    _1093 = 0.0f;
  }
  float _1097 = abs(_temperatureWarning * 0.009999999776482582f);
  if (_50) {
    if (_temperatureWarning > 0.0f) {
      float _1104 = _66 * TEXCOORD.x;
      float4 _1117 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_153 < (uint)65000), _153, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1104 * 4.25f), ((TEXCOORD.y * 3.0f) - (_time.x * 0.15000000596046448f))));
      float4 _1129 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_153 < (uint)65000), _153, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1104 * 2.299999952316284f), (((TEXCOORD.y * 2.0999999046325684f) - (_1117.x * 0.10000000149011612f)) + (_time.x * 0.20000000298023224f))));
      float _1135 = TEXCOORD.x + -0.5f;
      float _1168 = abs((_1135 + ((_1117.y + -0.5f) * 0.009999999776482582f)) + ((_1129.z + -0.5f) * 0.029999999329447746f));
      float _1169 = abs(((TEXCOORD.y + -0.5f) + ((_1117.x + -0.5f) * 0.019999999552965164f)) + ((_1129.y + -0.5f) * 0.029999999329447746f));
      float _1172 = max((_1168 + -0.5f), 0.0f);
      float _1173 = max((_1169 + -0.5f), 0.0f);
      float _1180 = 0.5f - min(max((((1.0f - (saturate(abs(_1135) * 2.0f) * 0.3999999761581421f)) * ((_1097 * 0.05000000447034836f) + 0.10000000149011612f)) * (((((_1117.z * 0.30000001192092896f) + -0.5f) + (_1129.x * 0.699999988079071f)) * 1.100000023841858f) + 1.0f)), ((_1097 * 0.017500001937150955f) + 0.03500000014901161f)), ((_1097 * 0.11000001430511475f) + 0.2200000137090683f));
      float _1183 = max((_1168 - _1180), 0.0f);
      float _1184 = max((_1169 - _1180), 0.0f);
      float _1195 = saturate((TEXCOORD.y + -0.15000000596046448f) * 1.2500001192092896f);
      float _1211 = saturate(_1129.x * _1117.x);
      float _1212 = _1097 * 0.20000000298023224f;
      float _1220 = ((saturate(_1097 * 2.0f) * saturate(saturate(sqrt((_1184 * _1184) + (_1183 * _1183)) * 10.0f) - saturate(sqrt((_1173 * _1173) + (_1172 * _1172)) * 10.0f))) * ((_1211 * (1.0f - _1212)) + _1212)) * ((((_1195 * _1195) * (3.0f - (_1195 * 2.0f))) * ((saturate((((_1117.x * 0.25f) + -0.3499999940395355f) + (_1129.y * 0.75f)) * 1.600000023841858f) * 0.5f) + -0.3500000238418579f)) + 1.0f);
      float _1224 = _1220 * (_1097 * 0.10000000149011612f);
      float4 _1232 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_1224 * (0.5f - TEXCOORD.x)) * _1129.x) + TEXCOORD.x), (((_1224 * (0.5f - TEXCOORD.y)) * _1129.y) + TEXCOORD.y)));
      float _1242 = (pow(_1232.x, 0.012683313339948654f));
      float _1243 = (pow(_1232.y, 0.012683313339948654f));
      float _1244 = (pow(_1232.z, 0.012683313339948654f));
      float _1269 = exp2(log2(max(0.0f, (_1242 + -0.8359375f)) / (18.8515625f - (_1242 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
      float _1270 = exp2(log2(max(0.0f, (_1243 + -0.8359375f)) / (18.8515625f - (_1243 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
      float _1271 = exp2(log2(max(0.0f, (_1244 + -0.8359375f)) / (18.8515625f - (_1244 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
      float _1272 = 1.0f - _1220;
      float _1279 = ((_1272 * _1272) * _1272) * saturate(((_1211 * _1211) * 2.0f) * _1211);
      float _1282 = max(0.0010000000474974513f, _exposure0.x);
      float _1292 = (((1.0f / _1282) - _1269) * _1279) + _1269;
      float _1293 = (((0.6000000238418579f / _1282) - _1270) * _1279) + _1270;
      float _1294 = (((0.30000001192092896f / _1282) - _1271) * _1279) + _1271;
      float _1304 = ((_1097 * _1097) * _1097) * saturate(_1097 + -0.5f);
      float _1309 = saturate(_1220 * 2.0f);
      _1424 = (_1309 + _1090);
      _1425 = ((((_1292 - _1091) + (((_1220 / _1282) - _1292) * _1304)) * _1309) + _1091);
      _1426 = ((((_1293 - _1092) + ((((_1220 * 0.25f) / _1282) - _1293) * _1304)) * _1309) + _1092);
      _1427 = ((((_1294 - _1093) - (_1294 * _1304)) * _1309) + _1093);
    } else {
      if (_temperatureWarning < 0.0f) {
        float _1326 = _66 * TEXCOORD.x;
        float4 _1335 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_153 < (uint)65000), _153, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1326 * 1.5f), (TEXCOORD.y * 1.5f)));
        int _1340 = WaveReadLaneFirst(_materialIndex);
        int _1348 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1340 < (uint)170000), _1340, 0)) + 0u))]._temperatureWarningTex);
        float4 _1355 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1348 < (uint)65000), _1348, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1326 * 2.0f), _69));
        float _1363 = (select(((TEXCOORD.y / (1.0f - TEXCOORD.x)) < 1.0f), (1.0f - _1355.y), _1355.y) + -0.5f) * 0.30000001192092896f;
        float _1365 = (_1335.x + -0.4000000059604645f) * 0.20000000298023224f;
        float _1373 = max(0.0010000000474974513f, _exposure0.x);
        float _1386 = 0.5f - (_1097 * 0.25f);
        float _1389 = max((abs(((TEXCOORD.x + -0.5f) + _1365) + _1363) - _1386), 0.0f);
        float _1390 = max((abs(((_1363 + _1365) + -0.4749999940395355f) + (TEXCOORD.y * 0.8999999761581421f)) - _1386), 0.0f);
        float _1412 = (_1097 * (1.0f - TEXCOORD.y)) * saturate((((_1355.y * 4.0f) * saturate(1.0f - ((1.0f - saturate(sqrt((_1390 * _1390) + (_1389 * _1389)) * 6.666666507720947f)) * 2.0f))) * saturate((_1355.y * _1355.y) * 2.0f)) * saturate(_1335.z * _1335.w));
        _1424 = (_1412 + _1090);
        _1425 = ((_1412 * ((((_1335.w * 1.8809775114059448f) + 0.11902248114347458f) / _1373) - _1091)) + _1091);
        _1426 = ((_1412 * ((((_1335.w * 1.3989123106002808f) + 0.6010876893997192f) / _1373) - _1092)) + _1092);
        _1427 = ((_1412 * ((2.0f / _1373) - _1093)) + _1093);
      } else {
        _1424 = _1090;
        _1425 = _1091;
        _1426 = _1092;
        _1427 = _1093;
      }
    }
  } else {
    _1424 = _1090;
    _1425 = _1091;
    _1426 = _1092;
    _1427 = _1093;
  }
  if (!(_electrocutionWarning == 0.0f)) {
    float _1432 = _66 * TEXCOORD.x;
    float4 _1441 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_153 < (uint)65000), _153, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1432 * 1.5f), (TEXCOORD.y * 1.5f)));
    int _1454 = WaveReadLaneFirst(_materialIndex);
    int _1462 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1454 < (uint)170000), _1454, 0)) + 0u))]._electrocutionTex);
    float4 _1469 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1462 < (uint)65000), _1462, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((_1441.x * 0.05000000074505806f) + (_1432 * 2.0f)), (((_1441.y * 0.05000000074505806f) + _69) + (_time.x * 0.10000000149011612f))));
    float _1473 = max(0.0010000000474974513f, _exposure0.x);
    float _1482 = 0.5f - (_electrocutionWarning * 0.07000000029802322f);
    float _1485 = max((abs(TEXCOORD.x + -0.5f) - _1482), 0.0f);
    float _1486 = max((abs(TEXCOORD.y + -0.5f) - _1482), 0.0f);
    float _1501 = 1.0f - abs((frac((_time.x * 2.0f) + _1441.y) * 2.0f) + -1.0f);
    float _1504 = (_1501 * _1501) * (saturate(sqrt((_1486 * _1486) + (_1485 * _1485)) / _1441.z) * _1469.x);
    float _1507 = (pow(_1504, 1.600000023841858f));
    _1519 = (_1504 + _1424);
    _1520 = ((_1507 * ((340.0f / _1473) - _1425)) + _1425);
    _1521 = ((_1507 * ((660.0f / _1473) - _1426)) + _1426);
    _1522 = ((_1507 * ((2000.0f / _1473) - _1427)) + _1427);
  } else {
    _1519 = _1424;
    _1520 = _1425;
    _1521 = _1426;
    _1522 = _1427;
  }
  uint _1524 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _1531 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_1524), 0));
    _1537 = (float((uint)((uint)(_1531.x & 127))) + 0.5f);
  } else {
    _1537 = saturate(_1519);
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_1520, _1521, _1522));
    _1905 = output_color.x;
    _1906 = output_color.y;
    _1907 = output_color.z;
  } else {
    _1905 = _1520;
    _1906 = _1521;
    _1907 = _1522;
  }
  if (_etcParams.y > 1.0f) {
    float _1915 = abs(_68);
    float _1916 = abs(_69 + -1.0f);
    float _1920 = saturate(1.0f - (dot(float2(_1915, _1916), float2(_1915, _1916)) * saturate(_etcParams.y + -1.0f)));
    _1925 = (_1920 * _1905);
    _1926 = (_1920 * _1906);
    _1927 = (_1920 * _1907);
  } else {
    _1925 = _1905;
    _1926 = _1906;
    _1927 = _1907;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _1960 = select((_1925 <= 0.0031308000907301903f), (_1925 * 12.920000076293945f), (((pow(_1925, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1961 = select((_1926 <= 0.0031308000907301903f), (_1926 * 12.920000076293945f), (((pow(_1926, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1962 = select((_1927 <= 0.0031308000907301903f), (_1927 * 12.920000076293945f), (((pow(_1927, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1960 = _1925;
    _1961 = _1926;
    _1962 = _1927;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _1967 = float((uint)_1524);
    if (!(_1967 < _viewDir.w)) {
      if (!(_1967 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _1976 = _1960;
        _1977 = _1961;
        _1978 = _1962;
      } else {
        _1976 = 0.0f;
        _1977 = 0.0f;
        _1978 = 0.0f;
      }
    } else {
      _1976 = 0.0f;
      _1977 = 0.0f;
      _1978 = 0.0f;
    }
  } else {
    _1976 = _1960;
    _1977 = _1961;
    _1978 = _1962;
  }
  float _1988 = exp2(log2(_1976 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1989 = exp2(log2(_1977 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1990 = exp2(log2(_1978 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_1988 * 18.6875f) + 1.0f)) * ((_1988 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_1989 * 18.6875f) + 1.0f)) * ((_1989 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_1990 * 18.6875f) + 1.0f)) * ((_1990 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _1537;
  return SV_Target;
}

