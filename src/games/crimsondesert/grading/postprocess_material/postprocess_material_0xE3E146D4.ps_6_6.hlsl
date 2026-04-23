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

Texture2D<float4> __3__36__0__0__g_noiseTex : register(t12, space36);

Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t44, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t33, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t75, space36);

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

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

SamplerState __0__4__0__0__g_staticPointWrap : register(s8, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _29[36];
  float _35 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  int _41 = WaveReadLaneFirst(_materialIndex);
  float _49 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_41 < (uint)170000), _41, 0)) + 0u))]._statusVignetteRatio1);
  int _50 = WaveReadLaneFirst(_materialIndex);
  float _58 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_50 < (uint)170000), _50, 0)) + 0u))]._statusVignetteRatio2);
  int _59 = WaveReadLaneFirst(_materialIndex);
  float _67 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_59 < (uint)170000), _59, 0)) + 0u))]._statusVignetteRatio3);
  int _68 = WaveReadLaneFirst(_materialIndex);
  float _80 = float((uint)(uint)(_enableChromaticAberration)) * WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_68 < (uint)170000), _68, 0)) + 0u))]._statusVignetteChromaticShift1);
  int _81 = WaveReadLaneFirst(_materialIndex);
  float _93 = float((uint)(uint)(_enableChromaticAberration)) * WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_81 < (uint)170000), _81, 0)) + 0u))]._statusVignetteChromaticShift2);
  int _94 = WaveReadLaneFirst(_materialIndex);
  float _106 = float((uint)(uint)(_enableChromaticAberration)) * WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_94 < (uint)170000), _94, 0)) + 0u))]._statusVignetteChromaticShift3);
  int _107 = WaveReadLaneFirst(_materialIndex);
  float _119 = float((uint)(uint)(_enableChromaticAberration)) * WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_107 < (uint)170000), _107, 0)) + 0u))]._chromaticAberrationRatio);
  int _120 = WaveReadLaneFirst(_materialIndex);
  float _128 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_120 < (uint)170000), _120, 0)) + 0u))]._chromaticAberrationShiftValue);
  int _129 = WaveReadLaneFirst(_materialIndex);
  int _138 = WaveReadLaneFirst(_materialIndex);
  float _146 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_138 < (uint)170000), _138, 0)) + 0u))]._fishEyeMaxPower);
  float _173;
  float _212;
  float _213;
  float _216;
  float _217;
  float _238;
  float _239;
  float _345;
  float _346;
  float _347;
  float _382;
  float _467;
  float _468;
  float _469;
  float _546;
  float _547;
  float _548;
  float _635;
  float _636;
  float _637;
  float _699;
  float _700;
  float _701;
  float _702;
  float _703;
  float _704;
  float _774;
  float _775;
  float _776;
  float _833;
  float _834;
  float _1071;
  float _1072;
  float _1073;
  float _1106;
  float _1107;
  float _1108;
  int _1109;
  float _1286;
  float _1287;
  float _1288;
  float _1387;
  float _1388;
  float _1389;
  float _1429;
  float _1430;
  float _1431;
  float _1566;
  float _1567;
  float _1568;
  float _1630;
  float _1631;
  float _1632;
  float _1633;
  float _1634;
  float _1635;
  float _1834;
  float _1921;
  float _1922;
  float _1923;
  float _2045;
  float _2046;
  float _2047;
  float _2166;
  float _2167;
  float _2168;
  float _2286;
  float _2287;
  float _2288;
  float _2349;
  float _2350;
  float _2351;
  bool _2703;
  bool _2719;
  float _2802;
  float _2803;
  float _2804;
  float _2805;
  float _2938;
  float _2939;
  float _2940;
  float _2970;
  float _2971;
  float _2972;
  float _3115;
  float _3116;
  float _3117;
  float _3131;
  float _3377;
  float _3378;
  float _3379;
  float _3499;
  float _3500;
  float _3501;
  float _3522;
  float _3523;
  float _3524;
  float _3557;
  float _3558;
  float _3559;
  float _3573;
  float _3574;
  float _3575;
  [branch]
  if ((((_146 > 0.0010000000474974513f)) || ((_146 < -0.0010000000474974513f))) | (_followLearning > 0.0010000000474974513f)) {
    float _155 = 0.5f / _35;
    float _160 = ((_srcTargetSizeAndInv.x * TEXCOORD.x) / _srcTargetSizeAndInv.x) + -0.5f;
    float _161 = ((_srcTargetSizeAndInv.y * TEXCOORD.y) / _srcTargetSizeAndInv.x) - _155;
    float _162 = dot(float2(_160, _161), float2(_160, _161));
    float _163 = sqrt(_162);
    if (_followLearning > 0.0010000000474974513f) {
      _173 = ((pow(_followLearning, 0.25f)) * 1.5f);
    } else {
      _173 = _146;
    }
    if (_173 > 0.0f) {
      float _177 = sqrt(dot(float2(0.5f, _155), float2(0.5f, _155)));
      float _182 = tan(_173 * _163) * (rsqrt(_162) * _177);
      float _186 = tan(_177 * _173);
      _212 = (((_182 * _160) / _186) + 0.5f);
      _213 = (((_182 * _161) / _186) + _155);
    } else {
      if (_173 < 0.0f) {
        float _195 = select((_35 < 1.0f), 0.5f, _155);
        float _201 = atan((_173 * _163) * -10.0f) * (rsqrt(_162) * _195);
        float _206 = atan((_173 * -10.0f) * _195);
        _212 = (((_201 * _160) / _206) + 0.5f);
        _213 = (((_201 * _161) / _206) + _155);
      } else {
        _212 = 0.0f;
        _213 = 0.0f;
      }
    }
    _216 = _212;
    _217 = (_213 * _35);
  } else {
    _216 = TEXCOORD.x;
    _217 = TEXCOORD.y;
  }
  int _218 = WaveReadLaneFirst(_materialIndex);
  float _226 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_218 < (uint)170000), _218, 0)) + 0u))]._uiQuickSlotEffect);
  if (!(!(_226 >= 0.0010000000474974513f))) {
    _238 = ((_226 * (0.029999999329447746f - (_216 * 0.06000000238418579f))) + _216);
    _239 = ((_226 * (0.029999999329447746f - (_217 * 0.06000000238418579f))) + _217);
  } else {
    _238 = _216;
    _239 = _217;
  }
  float4 _242 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(_238, _239));
  float _252 = (pow(_242.x, 0.012683313339948654f));
  float _253 = (pow(_242.y, 0.012683313339948654f));
  float _254 = (pow(_242.z, 0.012683313339948654f));
  float _279 = exp2(log2(max(0.0f, (_252 + -0.8359375f)) / (18.8515625f - (_252 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _280 = exp2(log2(max(0.0f, (_253 + -0.8359375f)) / (18.8515625f - (_253 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _281 = exp2(log2(max(0.0f, (_254 + -0.8359375f)) / (18.8515625f - (_254 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  int _282 = WaveReadLaneFirst(_materialIndex);
  int _290 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_282 < (uint)170000), _282, 0)) + 0u))]._noiseTex);
  [branch]
  if (!(!(_fleeCount >= 0.0010000000474974513f))) {
    float4 _314 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_290 < (uint)65000), _290, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((TEXCOORD.x * 4.0f), ((((_fleeCount * 0.0010000000474974513f) + -0.10000000149011612f) + ((TEXCOORD.y / _35) * 4.0f)) + (_time.x * 0.019999999552965164f))));
    float _323 = (TEXCOORD.x + -0.5f) + ((_314.x + -0.5f) * 0.15000000596046448f);
    float _324 = (TEXCOORD.y + -0.5f) + ((_314.y + -0.5f) * 0.15000000596046448f);
    float _337 = saturate(_fleeCount * 0.20000000298023224f) * saturate((((_fleeCount * 0.004999999888241291f) + -0.6000000238418579f) + sqrt((_323 * _323) + (_324 * _324))) / ((_fleeCount * 0.004000000189989805f) + 0.10000000149011612f));
    _345 = (_279 - (_337 * _279));
    _346 = (_280 - (_337 * _280));
    _347 = (_281 - (_337 * _281));
  } else {
    _345 = _279;
    _346 = _280;
    _347 = _281;
  }
  int _348 = WaveReadLaneFirst(_materialIndex);
  if (((_226 >= 0.0010000000474974513f)) || ((WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_348 < (uint)170000), _348, 0)) + 0u))]._uiMainMenuEffect) >= 0.0010000000474974513f))) {
    int _361 = WaveReadLaneFirst(_materialIndex);
    if (WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_361 < (uint)170000), _361, 0)) + 0u))]._uiMainMenuEffect) > _226) {
      int _372 = WaveReadLaneFirst(_materialIndex);
      _382 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_372 < (uint)170000), _372, 0)) + 0u))]._uiMainMenuEffect);
    } else {
      _382 = _226;
    }
    float _390 = _382 * 0.5f;
    float4 _414 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_290 < (uint)65000), _290, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((TEXCOORD.x * 2.0f) * _35), (TEXCOORD.y * 2.0f)));
    int _419 = WaveReadLaneFirst(_materialIndex);
    bool _429 = (_226 < 0.0010000000474974513f);
    bool _430 = (_429) && ((WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_419 < (uint)170000), _419, 0)) + 0u))]._uiMainMenuEffect) >= 0.0010000000474974513f));
    int _432 = WaveReadLaneFirst(_materialIndex);
    float _450 = (TEXCOORD.y - select(_430, 0.550000011920929f, 0.5f)) - ((_414.y + -0.5f) * 0.05000000074505806f);
    float _451 = ((TEXCOORD.x - ((_414.x + -0.5f) * 0.05000000074505806f)) + select(_430, -0.41999998688697815f, -0.5f)) * _35;
    float _462 = ((_382 * -0.8999999761581421f) * (1.0f - saturate((select(((_429) && ((WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_432 < (uint)170000), _432, 0)) + 0u))]._uiMainMenuEffect) >= 0.0010000000474974513f))), 0.3499999940395355f, 0.4000000059604645f) - sqrt((_451 * _451) + (_450 * _450))) * 1.4285714626312256f))) + 1.0f;
    _467 = (_462 * ((_390 * (((_346 * 0.75f) - (_345 * 0.6069999933242798f)) + (_347 * 0.1889999955892563f))) + _345));
    _468 = (_462 * ((_390 * (((_345 * 0.3490000069141388f) - (_346 * 0.3140000104904175f)) + (_347 * 0.1679999977350235f))) + _346));
    _469 = (_462 * ((_390 * (((_345 * 0.2720000147819519f) + (_346 * 0.5339999794960022f)) - (_347 * 0.8690000176429749f))) + _347));
  } else {
    _467 = _345;
    _468 = _346;
    _469 = _347;
  }
  if ((((_49 >= 0.0010000000474974513f)) && ((_80 >= 0.0010000000474974513f))) | (((_58 >= 0.0010000000474974513f)) && ((_93 >= 0.0010000000474974513f))) | (((_67 >= 0.0010000000474974513f)) && ((_106 >= 0.0010000000474974513f)))) {
    float _484 = _238 + -0.5f;
    float _485 = _239 + -0.5f;
    float _494 = rsqrt(dot(float2(_484, _485), float2(_484, _485))) * ((max(max(_80, _93), _106) * 0.009999999776482582f) * sqrt((_485 * _485) + (_484 * _484)));
    float _495 = _494 * _484;
    float _497 = _494 * _485;
    float4 _503 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_238 - _495), (_239 - _497)));
    float _507 = (pow(_503.x, 0.012683313339948654f));
    float4 _517 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_238, _239));
    float _521 = (pow(_517.y, 0.012683313339948654f));
    float4 _531 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_495 + _238), (_497 + _239)));
    float _535 = (pow(_531.z, 0.012683313339948654f));
    _546 = (exp2(log2(max(0.0f, (_507 + -0.8359375f)) / (18.8515625f - (_507 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
    _547 = (exp2(log2(max(0.0f, (_521 + -0.8359375f)) / (18.8515625f - (_521 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
    _548 = (exp2(log2(max(0.0f, (_535 + -0.8359375f)) / (18.8515625f - (_535 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
  } else {
    _546 = _467;
    _547 = _468;
    _548 = _469;
  }
  if (((_119 >= 0.0010000000474974513f)) && ((_128 >= 0.0010000000474974513f))) {
    int _553 = WaveReadLaneFirst(_materialIndex);
    float _564 = _238 - WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_553 < (uint)170000), _553, 0)) + 0u))]._chromaticAberrationShiftPosition.x);
    float _565 = _239 - WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_553 < (uint)170000), _553, 0)) + 0u))]._chromaticAberrationShiftPosition.y);
    float _574 = rsqrt(dot(float2(_564, _565), float2(_564, _565))) * ((_128 * 0.009999999776482582f) * sqrt((_565 * _565) + (_564 * _564)));
    float _575 = _574 * _564;
    float _577 = _574 * _565;
    float4 _583 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_238 - _575), (_239 - _577)));
    float _587 = (pow(_583.x, 0.012683313339948654f));
    float4 _597 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_238, _239));
    float _601 = (pow(_597.y, 0.012683313339948654f));
    float4 _611 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_575 + _238), (_577 + _239)));
    float _615 = (pow(_611.z, 0.012683313339948654f));
    _635 = ((((exp2(log2(max(0.0f, (_587 + -0.8359375f)) / (18.8515625f - (_587 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _546) * _119) + _546);
    _636 = ((((exp2(log2(max(0.0f, (_601 + -0.8359375f)) / (18.8515625f - (_601 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _547) * _119) + _547);
    _637 = ((((exp2(log2(max(0.0f, (_615 + -0.8359375f)) / (18.8515625f - (_615 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _548) * _119) + _548);
  } else {
    _635 = _467;
    _636 = _468;
    _637 = _469;
  }
  int _638 = WaveReadLaneFirst(_materialIndex);
  float _646 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_638 < (uint)170000), _638, 0)) + 0u))]._detectModeG);
  int _647 = WaveReadLaneFirst(_materialIndex);
  float _655 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_647 < (uint)170000), _647, 0)) + 0u))]._detectModeR);
  int _656 = WaveReadLaneFirst(_materialIndex);
  float _664 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_656 < (uint)170000), _656, 0)) + 0u))]._detectModeB);
  int _665 = WaveReadLaneFirst(_materialIndex);
  float _673 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_665 < (uint)170000), _665, 0)) + 0u))]._detectModeKnowledge);
  int _674 = WaveReadLaneFirst(_materialIndex);
  float _682 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_674 < (uint)170000), _674, 0)) + 0u))]._detectModeInterrupt);
  float _687 = saturate((((_655 + _646) + _664) + _673) + _682);
  [branch]
  if (_687 > 0.0f) {
    if (!(_646 >= 0.0010000000474974513f)) {
      if (!(_655 >= 0.0010000000474974513f)) {
        if (!(_664 >= 0.0010000000474974513f)) {
          if (!(!(_673 >= 0.0010000000474974513f))) {
            _699 = 0.6000000238418579f;
            _700 = 0.6000000238418579f;
            _701 = 0.800000011920929f;
            _702 = 0.5f;
            _703 = 0.44999998807907104f;
            _704 = 0.949999988079071f;
          } else {
            _699 = 0.0f;
            _700 = 0.0f;
            _701 = 0.0f;
            _702 = 0.0f;
            _703 = 0.0f;
            _704 = 0.0f;
          }
        } else {
          _699 = 0.6000000238418579f;
          _700 = 0.699999988079071f;
          _701 = 0.699999988079071f;
          _702 = 0.6000000238418579f;
          _703 = 0.699999988079071f;
          _704 = 0.800000011920929f;
        }
      } else {
        _699 = 0.699999988079071f;
        _700 = 0.6000000238418579f;
        _701 = 0.6000000238418579f;
        _702 = 0.800000011920929f;
        _703 = 0.699999988079071f;
        _704 = 0.6000000238418579f;
      }
    } else {
      _699 = 0.6000000238418579f;
      _700 = 0.699999988079071f;
      _701 = 0.6000000238418579f;
      _702 = 0.6000000238418579f;
      _703 = 0.800000011920929f;
      _704 = 0.699999988079071f;
    }
    bool _705 = (_682 >= 0.0010000000474974513f);
    float _709 = select(_705, 0.800000011920929f, _702);
    float _710 = select(_705, 0.6000000238418579f, _703);
    float _711 = select(_705, 0.20000000298023224f, _704);
    float _718 = (1.0f - _709) * 0.3086000084877014f;
    float _720 = (1.0f - _710) * 0.6093999743461609f;
    float _722 = (1.0f - _711) * 0.0820000022649765f;
    float _724 = select(_705, 2.0f, _699) * _635;
    float _725 = select(_705, 2.0f, _700) * _636;
    float _726 = select(_705, 2.0f, _701) * _637;
    float _730 = _718 * _724;
    float _735 = 0.009999999776482582f / max(0.0010000000474974513f, _exposure0.x);
    float _745 = max((abs(TEXCOORD.x + -0.5f) + -0.07500000298023224f), 0.0f);
    float _746 = max((abs(TEXCOORD.y + -0.5f) + -0.07500000298023224f), 0.0f);
    float _754 = (_687 * 0.75f) * saturate(sqrt((_746 * _746) + (_745 * _745)) * 2.0f);
    float _761 = ((mad(_726, _722, mad(_725, _720, ((_718 + _709) * _724))) - _635) * _687) + _635;
    float _762 = ((mad(_726, _722, mad(_725, (_720 + _710), _730)) - _636) * _687) + _636;
    float _763 = ((mad(_726, (_722 + _711), mad(_725, _720, _730)) - _637) * _687) + _637;
    _774 = ((_754 * ((_735 * _709) - _761)) + _761);
    _775 = ((_754 * ((_735 * _710) - _762)) + _762);
    _776 = ((_754 * ((_735 * _711) - _763)) + _763);
  } else {
    _774 = _635;
    _775 = _636;
    _776 = _637;
  }
  if ((((((_highLightForVisionRemoteCatch > 0.0f)) || ((_highLightForVision > 0.0f)))) || ((_characterHighlight > 0.0f))) | (_followLearning > 0.0010000000474974513f)) {
    int2 _792; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_792.x, _792.y);
    uint _807 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_792.x))))) + 0.5f) * _238), int((float((int)(int(float((int)(_792.y))))) + 0.5f) * _239), 0));
    int _809 = _807.x & 255;
    float _817 = (float((uint)((uint)((uint)((uint)(_807.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
    float _818 = (float((uint)((uint)(((uint)((uint)(_807.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
    float _820 = 1.0f - abs(_817);
    float _821 = abs(_818);
    float _822 = _820 - _821;
    if (!(_822 >= 0.0f)) {
      _833 = (select((_817 >= 0.0f), 1.0f, -1.0f) * (1.0f - _821));
      _834 = (select((_818 >= 0.0f), 1.0f, -1.0f) * _820);
    } else {
      _833 = _817;
      _834 = _818;
    }
    float _836 = rsqrt(dot(float3(_833, _834, _822), float3(_833, _834, _822)));
    float _837 = _836 * _833;
    float _838 = _836 * _834;
    float _839 = _836 * _822;
    float _841 = rsqrt(dot(float3(_837, _838, _839), float3(_837, _838, _839)));
    float4 _847 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_238, _239));
    float _858 = (pow(_847.x, 0.012683313339948654f));
    float _859 = (pow(_847.y, 0.012683313339948654f));
    float _860 = (pow(_847.z, 0.012683313339948654f));
    float _885 = exp2(log2(max(0.0f, (_858 + -0.8359375f)) / (18.8515625f - (_858 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    float _886 = exp2(log2(max(0.0f, (_859 + -0.8359375f)) / (18.8515625f - (_859 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    float _887 = exp2(log2(max(0.0f, (_860 + -0.8359375f)) / (18.8515625f - (_860 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    [branch]
    if (_809 == _renderPassTest) {
      int _896 = WaveReadLaneFirst(_materialIndex);
      float _905 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_896 < (uint)170000), _896, 0)) + 0u))]._testEffectRatio) * (1.0f / max(0.0010000000474974513f, _exposure0.x));
      _1106 = (_905 + _774);
      _1107 = _775;
      _1108 = (_905 + _776);
      _1109 = _809;
    } else {
      if ((_809 == _renderPassDetectObjective) || ((!(_809 == _renderPassDetectObjective)) && (_809 == _renderPassKnowledgeNPC))) {
        float4 _928 = __3__36__0__0__g_noiseTex.SampleLevel(__0__4__0__0__g_staticPointWrap, float2(frac((TEXCOORD.x * 0.015625f) * _bufferSizeAndInvSize.x), frac((TEXCOORD.y * 0.015625f) * _bufferSizeAndInvSize.y)), 0.0f);
        float _931 = (_928.x * 0.5f) + 0.5f;
        _1106 = ((((_931 * _885) - _774) * _847.w) + _774);
        _1107 = ((((_931 * _886) - _775) * _847.w) + _775);
        _1108 = ((((_931 * _887) - _776) * _847.w) + _776);
        _1109 = _809;
      } else {
        bool __defer_944_1025 = false;
        if (!(_809 == _renderPassDetectRemoteCatch) || ((_809 == _renderPassDetectRemoteCatch) && (!(WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)(WaveReadLaneFirst(_materialIndex)) < (uint)170000), (WaveReadLaneFirst(_materialIndex)), 0)) + 0u))]._itemRatio) > 0.0010000000474974513f))) || (((_809 == _renderPassDetectRemoteCatch) && (WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)(WaveReadLaneFirst(_materialIndex)) < (uint)170000), (WaveReadLaneFirst(_materialIndex)), 0)) + 0u))]._itemRatio) > 0.0010000000474974513f)) && (!(((_highLightForVision > 0.0f)) || ((_highLightForVisionRemoteCatch > 0.0f)))))) {
          __defer_944_1025 = true;
        } else {
          int _966 = WaveReadLaneFirst(_materialIndex);
          int _974 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_966 < (uint)170000), _966, 0)) + 0u))]._detectColorBase);
          float _977 = float((uint)((uint)(((uint)((uint)(_974)) >> 16) & 255)));
          float _980 = float((uint)((uint)(((uint)((uint)(_974)) >> 8) & 255)));
          float _982 = float((uint)((uint)(_974 & 255)));
          float _1015 = max(0.0010000000474974513f, _exposure0.x);
          _1106 = ((((select(((_977 * 0.003921568859368563f) < 0.040449999272823334f), (_977 * 0.0003035269910469651f), exp2(log2((_977 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * 10.0f) / _1015) * _847.w) + _774);
          _1107 = ((((select(((_980 * 0.003921568859368563f) < 0.040449999272823334f), (_980 * 0.0003035269910469651f), exp2(log2((_980 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * 10.0f) / _1015) * _847.w) + _775);
          _1108 = ((((select(((_982 * 0.003921568859368563f) < 0.040449999272823334f), (_982 * 0.0003035269910469651f), exp2(log2((_982 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * 10.0f) / _1015) * _847.w) + _776);
          _1109 = _809;
        }
        if (__defer_944_1025) {
          bool _1028 = (_809 == _renderPassSelfPlayer);
          bool __defer_1025_1040 = false;
          if ((_1028) | (((_809 == _renderPassTest)) || ((_809 == _renderPassEnemy))) | (_809 == _renderPassDetectPickedRemoteCatch)) {
            __defer_1025_1040 = true;
          } else {
            _1106 = _774;
            _1107 = _775;
            _1108 = _776;
            _1109 = _809;
          }
          if (__defer_1025_1040) {
            if (((_characterHighlight > 0.0010000000474974513f)) || ((_highLightForVisionRemoteCatch > 0.0010000000474974513f))) {
              float _1057 = 1.0f - saturate(dot(float3((_841 * _837), (_841 * _838), (_841 * _839)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
              float _1058 = _1057 * _1057;
              float _1059 = _1058 * _1058;
              if (!_1028) {
                if (!(_809 == _renderPassTest)) {
                  bool _1066 = (_809 == _renderPassEnemy);
                  _1071 = select(_1066, 1.0f, 0.20000000298023224f);
                  _1072 = select(_1066, 0.30000001192092896f, 0.4000000059604645f);
                  _1073 = select(_1066, 0.30000001192092896f, 1.0f);
                } else {
                  _1071 = 1.0f;
                  _1072 = 1.0f;
                  _1073 = 1.0f;
                }
              } else {
                _1071 = 1.0f;
                _1072 = 1.0f;
                _1073 = 1.0f;
              }
              float _1080 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
              _1106 = ((((_885 - _774) + ((((_1080 + (_774 * 10.0f)) * _1071) - _885) * _1059)) * _847.w) + _774);
              _1107 = ((((_886 - _775) + ((((_1080 + (_775 * 10.0f)) * _1072) - _886) * _1059)) * _847.w) + _775);
              _1108 = ((((_887 - _776) + ((((_1080 + (_776 * 10.0f)) * _1073) - _887) * _1059)) * _847.w) + _776);
              _1109 = _809;
            } else {
              _1106 = _774;
              _1107 = _775;
              _1108 = _776;
              _1109 = _809;
            }
          }
        }
      }
    }
  } else {
    _1106 = _774;
    _1107 = _775;
    _1108 = _776;
    _1109 = 0;
  }
  if (!(!(_wantedRegionRatio >= 0.0010000000474974513f))) {
    [branch]
    if (!(!(_wantedRegionOpacity >= 0.0010000000474974513f))) {
      int _1118 = WaveReadLaneFirst(_materialIndex);
      int _1126 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1118 < (uint)170000), _1118, 0)) + 0u))]._wantedRegionColor);
      float _1129 = float((uint)((uint)(((uint)((uint)(_1126)) >> 16) & 255)));
      float _1132 = float((uint)((uint)(((uint)((uint)(_1126)) >> 8) & 255)));
      float _1134 = float((uint)((uint)(_1126 & 255)));
      float _1167 = max(0.0010000000474974513f, _exposure0.x);
      float _1175 = _wantedRegionRadius * _wantedRegionRatio;
      float _1177 = saturate(_1175) * 4.0f;
      float _1180 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_238, _239));
      float _1183 = (_238 * 2.0f) + -1.0f;
      float _1185 = 1.0f - (_239 * 2.0f);
      float _1186 = max(1.0000000116860974e-07f, _1180.x);
      float _1214 = mad((_invViewProj[3].z), _1186, mad((_invViewProj[3].y), _1185, ((_invViewProj[3].x) * _1183))) + (_invViewProj[3].w);
      float _1220 = ((mad((_invViewProj[0].z), _1186, mad((_invViewProj[0].y), _1185, ((_invViewProj[0].x) * _1183))) + (_invViewProj[0].w)) / _1214) - _wantedRegionPosition.x;
      float _1221 = ((mad((_invViewProj[2].z), _1186, mad((_invViewProj[2].y), _1185, ((_invViewProj[2].x) * _1183))) + (_invViewProj[2].w)) / _1214) - _wantedRegionPosition.z;
      float _1225 = sqrt((_1220 * _1220) + (_1221 * _1221));
      float _1232 = saturate(floor(_1225 / _1175));
      float _1234 = (1.0f - _1232) * saturate(((_1177 - _1175) + _1225) / _1177);
      float _1241 = (1.0f - saturate((_1225 - _1175) / _1177)) * _1232;
      float _1245 = saturate(((_1241 * _1241) * _1241) + ((_1234 * _1234) * _1234));
      float _1248 = saturate((_1245 * 5.0f) + -4.0f);
      float _1249 = _1248 * _1248;
      float _1252 = ((_1249 * _1249) * 9.0f) + 1.0f;
      uint2 _1265 = __3__36__0__0__g_stencil.Load(int3((int)(uint(_bufferSizeAndInvSize.x * _238)), (int)(uint(_bufferSizeAndInvSize.y * _239)), 0));
      int _1267 = _1265.x & 127;
      float _1275 = (((float((uint)((uint)((uint)((uint)(_1126)) >> 24))) * 0.003921568859368563f) * _wantedRegionOpacity) * _1245) * float((bool)((uint)(((_1267 != 57)) && (((uint)(_1267 + -53) > (uint)14)))));
      _1286 = ((_1275 * ((_1252 * (select(((_1129 * 0.003921568859368563f) < 0.040449999272823334f), (_1129 * 0.0003035269910469651f), exp2(log2((_1129 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _1167)) - _1106)) + _1106);
      _1287 = ((_1275 * ((_1252 * (select(((_1132 * 0.003921568859368563f) < 0.040449999272823334f), (_1132 * 0.0003035269910469651f), exp2(log2((_1132 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _1167)) - _1107)) + _1107);
      _1288 = ((_1275 * ((_1252 * (select(((_1134 * 0.003921568859368563f) < 0.040449999272823334f), (_1134 * 0.0003035269910469651f), exp2(log2((_1134 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _1167)) - _1108)) + _1108);
    } else {
      _1286 = _1106;
      _1287 = _1107;
      _1288 = _1108;
    }
  } else {
    _1286 = _1106;
    _1287 = _1107;
    _1288 = _1108;
  }
  if (((((_temperatureWarning <= -0.009999999776482582f)) || ((_temperatureWarning >= 0.009999999776482582f)))) || ((_electrocutionWarning > 0.0010000000474974513f))) {
    float4 _1300 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_238, _239));
    float _1311 = (pow(_1300.x, 0.012683313339948654f));
    float _1312 = (pow(_1300.y, 0.012683313339948654f));
    float _1313 = (pow(_1300.z, 0.012683313339948654f));
    float _1338 = exp2(log2(max(0.0f, (_1311 + -0.8359375f)) / (18.8515625f - (_1311 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    float _1339 = exp2(log2(max(0.0f, (_1312 + -0.8359375f)) / (18.8515625f - (_1312 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    float _1340 = exp2(log2(max(0.0f, (_1313 + -0.8359375f)) / (18.8515625f - (_1313 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    float _1342 = _temperatureWarning * 0.009999999776482582f;
    if (_temperatureWarning > 0.0f) {
      float _1345 = saturate(saturate(_1342));
      float _1346 = TEXCOORD.x + -0.5f;
      float _1347 = TEXCOORD.y + -0.6000000238418579f;
      float _1355 = saturate((_1345 + -0.5f) + sqrt((_1347 * _1347) + (_1346 * _1346))) * _1345;
      float _1360 = (1.0f - (_1355 * 0.30000001192092896f)) * _1287;
      float _1361 = (1.0f - (_1355 * 0.699999988079071f)) * _1288;
      _1387 = ((_1338 - _1286) * _1300.w);
      _1388 = (lerp(_1360, _1339, _1300.w));
      _1389 = (lerp(_1361, _1340, _1300.w));
    } else {
      float _1376 = (_1300.w * (1.0f - TEXCOORD.y)) * saturate(abs(_1342) * 2.0f);
      _1387 = (_1376 * (_1338 - (_1286 * 0.30000001192092896f)));
      _1388 = ((_1376 * (_1339 - (_1287 * 0.10000002384185791f))) + _1287);
      _1389 = ((_1376 * _1340) + _1288);
    }
    float _1390 = _1286 + _1387;
    if (!(_electrocutionWarning == 0.0f)) {
      float _1396 = max(0.0010000000474974513f, _exposure0.x);
      float _1400 = TEXCOORD.x + -0.5f;
      float _1401 = TEXCOORD.y + -0.6000000238418579f;
      float _1409 = (_electrocutionWarning * 0.5f) * saturate(sqrt((_1401 * _1401) + (_1400 * _1400)) + -0.30000001192092896f);
      float _1416 = (_1409 * ((0.05000000074505806f / _1396) - _1390)) + _1390;
      float _1417 = (_1409 * ((0.10000000149011612f / _1396) - _1388)) + _1388;
      float _1418 = (_1409 * ((0.5f / _1396) - _1389)) + _1389;
      _1429 = (lerp(_1416, _1338, _1300.w));
      _1430 = (lerp(_1417, _1339, _1300.w));
      _1431 = (lerp(_1418, _1340, _1300.w));
    } else {
      _1429 = _1390;
      _1430 = _1388;
      _1431 = _1389;
    }
  } else {
    _1429 = _1286;
    _1430 = _1287;
    _1431 = _1288;
  }
  [branch]
  if (!(!(_hpPercentage <= 20.0f))) {
    float _1437 = 1.0f - (_hpPercentage * 0.009999999776482582f);
    if (((!(_hpPercentage <= 0.0f))) && ((_1437 >= 0.0010000000474974513f))) {
      float _1452 = _time.x * 0.30000001192092896f;
      float4 _1461 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_290 < (uint)65000), _290, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1452 + (TEXCOORD.x * 12.0f)), (_1452 + (TEXCOORD.y * 6.0f))));
      float _1463 = _1461.w * 0.10000000149011612f;
      int _1466 = WaveReadLaneFirst(_materialIndex);
      int _1474 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1466 < (uint)170000), _1466, 0)) + 0u))]._borderEdgeNoiseTexture);
      float4 _1481 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1474 < (uint)65000), _1474, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((TEXCOORD.x * 2.0f) + 0.30000001192092896f) + _1463), (_1463 + TEXCOORD.y)));
      float _1488 = (_hpPercentage * 0.0020000000949949026f) + 0.36000001430511475f;
      float _1491 = max((abs(TEXCOORD.x + -0.5f) - _1488), 0.0f);
      float _1492 = max((abs(TEXCOORD.y + -0.5f) - _1488), 0.0f);
      float _1504 = sin(frac(_time.x * (2.0f - (_hpPercentage * 0.05000000074505806f))) * 3.1415927410125732f);
      float _1516 = 1.0f - _239;
      float _1519 = saturate((_1516 * _1516) * 2.0f);
      float _1520 = saturate(_1504);
      bool _1528 = ((_isPhotosensitiveMode_isAllolwBlood & 1) != 0);
      float _1530 = (_1520 * 0.0112674031406641f) + 0.022386489436030388f;
      float _1539 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
      float _1541 = select(_1528, 0.006995410192757845f, 0.04317210242152214f) * _1539;
      float _1545 = (min(max(_1437, 0.0f), 1.0f) * saturate((saturate(((_1504 * 0.19999998807907104f) + 0.800000011920929f) * saturate(sqrt((_1492 * _1492) + (_1491 * _1491)) * 3.846153974533081f)) * 2.0f) - (_1481.x * 1.440000057220459f))) * _1519;
      float _1546 = _1519 * (0.12999999523162842f - (_hpPercentage * 0.006000000052154064f));
      float _1553 = (((select(_1528, 0.215860515832901f, 0.04317210242152214f) * _1539) - _1429) * _1546) + _1429;
      float _1554 = ((_1541 - _1430) * _1546) + _1430;
      float _1555 = ((_1541 - _1431) * _1546) + _1431;
      _1566 = ((((select(_1528, ((_1520 * 0.056337013840675354f) + 0.11193244159221649f), _1530) * _1539) - _1553) * _1545) + _1553);
      _1567 = ((((select(_1528, ((_1520 * 0.0053743417374789715f) + 0.0021246890537440777f), _1530) * _1539) - _1554) * _1545) + _1554);
      _1568 = ((((select(_1528, 0.0021246890537440777f, _1530) * _1539) - _1555) * _1545) + _1555);
    } else {
      _1566 = _1429;
      _1567 = _1430;
      _1568 = _1431;
    }
  } else {
    _1566 = _1429;
    _1567 = _1430;
    _1568 = _1431;
  }
  int _1569 = WaveReadLaneFirst(_materialIndex);
  float _1579 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1569 < (uint)170000), _1569, 0)) + 0u))]._channelBrightness.x);
  float _1580 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1569 < (uint)170000), _1569, 0)) + 0u))]._channelBrightness.y);
  float _1581 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1569 < (uint)170000), _1569, 0)) + 0u))]._channelBrightness.z);
  int _1582 = WaveReadLaneFirst(_materialIndex);
  float _1592 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1582 < (uint)170000), _1582, 0)) + 0u))]._saturation.x);
  float _1593 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1582 < (uint)170000), _1582, 0)) + 0u))]._saturation.y);
  float _1594 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1582 < (uint)170000), _1582, 0)) + 0u))]._saturation.z);
  int _1595 = WaveReadLaneFirst(_materialIndex);
  bool _1608 = (WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_129 < (uint)170000), _129, 0)) + 0u))]._isBloodEffect) > 0.0010000000474974513f);
  if ((_1608) && (((_isPhotosensitiveMode_isAllolwBlood & 1) == 0))) {
    bool _1615 = ((_1579 > (_1580 + 0.05000000074505806f))) && ((_1579 > (_1581 + 0.05000000074505806f)));
    float _1616 = _1579 * 0.4000000059604645f;
    bool _1624 = ((_1592 > (_1593 + 0.05000000074505806f))) && ((_1592 > (_1594 + 0.05000000074505806f)));
    float _1625 = _1592 * 0.4000000059604645f;
    _1630 = select(_1615, _1616, _1579);
    _1631 = select(_1615, _1616, _1580);
    _1632 = select(_1615, _1616, _1581);
    _1633 = select(_1624, _1625, _1592);
    _1634 = select(_1624, _1625, _1593);
    _1635 = select(_1624, _1625, _1594);
  } else {
    _1630 = _1579;
    _1631 = _1580;
    _1632 = _1581;
    _1633 = _1592;
    _1634 = _1593;
    _1635 = _1594;
  }
  float _1636 = _1630 * _1566;
  float _1637 = _1631 * _1567;
  float _1638 = _1632 * _1568;
  float _1642 = (1.0f - _1633) * 0.3086000084877014f;
  float _1644 = (1.0f - _1634) * 0.6093999743461609f;
  float _1646 = (1.0f - _1635) * 0.0820000022649765f;
  float _1651 = _1642 * _1636;
  float _1668 = max(WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1595 < (uint)170000), _1595, 0)) + 0u))]._contrast), 0.0f);
  float _1675 = max(0.0f, ((_1668 * (mad(_1638, _1646, mad(_1637, _1644, ((_1642 + _1633) * _1636))) + -0.5f)) + 0.5f));
  float _1676 = max(0.0f, ((_1668 * (mad(_1638, _1646, mad(_1637, (_1644 + _1634), _1651)) + -0.5f)) + 0.5f));
  float _1677 = max(0.0f, ((_1668 * (mad(_1638, (_1646 + _1635), mad(_1637, _1644, _1651)) + -0.5f)) + 0.5f));
  int _1678 = WaveReadLaneFirst(_materialIndex);
  float _1686 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1678 < (uint)170000), _1678, 0)) + 0u))]._invertColor);
  float _1689 = _exposure2.x * 4.0f;
  float _1699 = ((_1689 - (_1675 * 2.0f)) * _1686) + _1675;
  float _1700 = ((_1689 - (_1676 * 2.0f)) * _1686) + _1676;
  float _1701 = ((_1689 - (_1677 * 2.0f)) * _1686) + _1677;
  int _1702 = WaveReadLaneFirst(_materialIndex);
  float _1710 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1702 < (uint)170000), _1702, 0)) + 0u))]._borderRatio);
  [branch]
  if (!(!(_1710 >= 0.0010000000474974513f))) {
    int _1713 = WaveReadLaneFirst(_materialIndex);
    int _1726 = WaveReadLaneFirst(_materialIndex);
    int _1739 = WaveReadLaneFirst(_materialIndex);
    int _1747 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1739 < (uint)170000), _1739, 0)) + 0u))]._borderEdgeNoiseTexture);
    float4 _1754 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1747 < (uint)65000), _1747, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1726 < (uint)170000), _1726, 0)) + 0u))]._borderEdgeNoiseOffset.x) + (WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1713 < (uint)170000), _1713, 0)) + 0u))]._borderEdgeNoiseTile.x) * TEXCOORD.x)), (WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1726 < (uint)170000), _1726, 0)) + 0u))]._borderEdgeNoiseOffset.y) + (WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1713 < (uint)170000), _1713, 0)) + 0u))]._borderEdgeNoiseTile.y) * TEXCOORD.y))));
    int _1756 = WaveReadLaneFirst(_materialIndex);
    int _1765 = WaveReadLaneFirst(_materialIndex);
    float _1779 = (1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1765 < (uint)170000), _1765, 0)) + 0u))]._borderWidth)) * 0.5f;
    float _1782 = max((abs(TEXCOORD.x + -0.5f) - _1779), 0.0f);
    float _1783 = max((abs(TEXCOORD.y + -0.5f) - _1779), 0.0f);
    float _1792 = 1.0f - ((1.0f - saturate(sqrt((_1783 * _1783) + (_1782 * _1782)) / WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1756 < (uint)170000), _1756, 0)) + 0u))]._borderSmoothness))) * 2.0f);
    int _1793 = WaveReadLaneFirst(_materialIndex);
    float _1801 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1793 < (uint)170000), _1793, 0)) + 0u))]._borderFlickerSpeed);
    if (_1801 > 0.0010000000474974513f) {
      int _1804 = WaveReadLaneFirst(_materialIndex);
      int _1822 = WaveReadLaneFirst(_materialIndex);
      _1834 = ((min(max(sin((_1801 * 3.1415927410125732f) * _time.x), WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1804 < (uint)170000), _1804, 0)) + 0u))]._borderFlickerOpacityMinMax.x)), WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1804 < (uint)170000), _1804, 0)) + 0u))]._borderFlickerOpacityMinMax.y)) * _1792) * WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1822 < (uint)170000), _1822, 0)) + 0u))]._borderFlickerIntensity));
    } else {
      _1834 = _1792;
    }
    int _1836 = WaveReadLaneFirst(_materialIndex);
    float _1850 = min(max(_1710, 0.0f), 1.0f) * saturate(saturate(_1834) - (WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1836 < (uint)170000), _1836, 0)) + 0u))]._borderEdgeNoiseRatio) * _1754.x));
    int _1851 = WaveReadLaneFirst(_materialIndex);
    int _1859 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1851 < (uint)170000), _1851, 0)) + 0u))]._borderColor);
    float _1862 = float((uint)((uint)(((uint)((uint)(_1859)) >> 16) & 255)));
    float _1865 = float((uint)((uint)(((uint)((uint)(_1859)) >> 8) & 255)));
    float _1867 = float((uint)((uint)(_1859 & 255)));
    float _1892 = select(((_1862 * 0.003921568859368563f) < 0.040449999272823334f), (_1862 * 0.0003035269910469651f), exp2(log2((_1862 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    bool _1899 = (_1608) && (((_isPhotosensitiveMode_isAllolwBlood & 1) == 0));
    float _1900 = _1892 * 0.4000000059604645f;
    float _1907 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
    _1921 = ((((select(_1899, _1900, _1892) * _1907) - _1699) * _1850) + _1699);
    _1922 = ((((select(_1899, _1900, select(((_1865 * 0.003921568859368563f) < 0.040449999272823334f), (_1865 * 0.0003035269910469651f), exp2(log2((_1865 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) * _1907) - _1700) * _1850) + _1700);
    _1923 = ((((select(_1899, _1900, select(((_1867 * 0.003921568859368563f) < 0.040449999272823334f), (_1867 * 0.0003035269910469651f), exp2(log2((_1867 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) * _1907) - _1701) * _1850) + _1701);
  } else {
    _1921 = _1699;
    _1922 = _1700;
    _1923 = _1701;
  }
  [branch]
  if (!(!(_58 >= 0.0010000000474974513f))) {
    float _1926 = TEXCOORD.x + -0.5f;
    float _1927 = TEXCOORD.y + -0.5f;
    int _1932 = WaveReadLaneFirst(_materialIndex);
    int _1946 = WaveReadLaneFirst(_materialIndex);
    float _1959 = saturate(exp2(log2(abs(0.5f - TEXCOORD.x)) * WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1946 < (uint)170000), _1946, 0)) + 0u))]._statusVignettePower2)) * (sqrt((_1927 * _1927) + (_1926 * _1926)) / max(0.0010000000474974513f, (1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1932 < (uint)170000), _1932, 0)) + 0u))]._statusVignetteRadius2)))));
    float _1964 = saturate(_58 * 10.0f) * saturate(_1959 * 2.0f);
    float _1971 = (_1964 * (_546 - _1921)) + _1921;
    float _1972 = (_1964 * (_547 - _1922)) + _1922;
    float _1973 = (_1964 * (_548 - _1923)) + _1923;
    int _1974 = WaveReadLaneFirst(_materialIndex);
    int _1982 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1974 < (uint)170000), _1974, 0)) + 0u))]._statusVignetteColor2);
    float _1985 = float((uint)((uint)(((uint)((uint)(_1982)) >> 16) & 255)));
    float _1988 = float((uint)((uint)(((uint)((uint)(_1982)) >> 8) & 255)));
    float _1990 = float((uint)((uint)(_1982 & 255)));
    float _2015 = select(((_1985 * 0.003921568859368563f) < 0.040449999272823334f), (_1985 * 0.0003035269910469651f), exp2(log2((_1985 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    bool _2022 = (_1608) && (((_isPhotosensitiveMode_isAllolwBlood & 1) == 0));
    float _2023 = _2015 * 0.20000000298023224f;
    float _2030 = max(0.0010000000474974513f, _exposure0.x);
    float _2037 = saturate(_1959) * _58;
    _2045 = ((((select(_2022, _2023, _2015) / _2030) - _1971) * _2037) + _1971);
    _2046 = ((((select(_2022, _2023, select(((_1988 * 0.003921568859368563f) < 0.040449999272823334f), (_1988 * 0.0003035269910469651f), exp2(log2((_1988 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) / _2030) - _1972) * _2037) + _1972);
    _2047 = ((((select(_2022, _2023, select(((_1990 * 0.003921568859368563f) < 0.040449999272823334f), (_1990 * 0.0003035269910469651f), exp2(log2((_1990 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) / _2030) - _1973) * _2037) + _1973);
  } else {
    _2045 = _1921;
    _2046 = _1922;
    _2047 = _1923;
  }
  [branch]
  if (!(!(_49 >= 0.0010000000474974513f))) {
    float _2050 = TEXCOORD.x + -0.5f;
    float _2051 = TEXCOORD.y + -0.5f;
    int _2056 = WaveReadLaneFirst(_materialIndex);
    int _2069 = WaveReadLaneFirst(_materialIndex);
    float _2082 = saturate(exp2(log2(1.0f - TEXCOORD.y) * WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2069 < (uint)170000), _2069, 0)) + 0u))]._statusVignettePower1)) * (sqrt((_2051 * _2051) + (_2050 * _2050)) / max(0.0010000000474974513f, (1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2056 < (uint)170000), _2056, 0)) + 0u))]._statusVignetteRadius1)))));
    float _2085 = saturate(_49 * 10.0f) * _2082;
    float _2092 = (_2085 * (_546 - _2045)) + _2045;
    float _2093 = (_2085 * (_547 - _2046)) + _2046;
    float _2094 = (_2085 * (_548 - _2047)) + _2047;
    int _2095 = WaveReadLaneFirst(_materialIndex);
    int _2103 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2095 < (uint)170000), _2095, 0)) + 0u))]._statusVignetteColor1);
    float _2106 = float((uint)((uint)(((uint)((uint)(_2103)) >> 16) & 255)));
    float _2109 = float((uint)((uint)(((uint)((uint)(_2103)) >> 8) & 255)));
    float _2111 = float((uint)((uint)(_2103 & 255)));
    float _2136 = select(((_2106 * 0.003921568859368563f) < 0.040449999272823334f), (_2106 * 0.0003035269910469651f), exp2(log2((_2106 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    bool _2143 = (_1608) && (((_isPhotosensitiveMode_isAllolwBlood & 1) == 0));
    float _2144 = _2136 * 0.20000000298023224f;
    float _2151 = max(0.0010000000474974513f, _exposure0.x);
    float _2158 = saturate(_2082) * _49;
    _2166 = ((((select(_2143, _2144, _2136) / _2151) - _2092) * _2158) + _2092);
    _2167 = ((((select(_2143, _2144, select(((_2109 * 0.003921568859368563f) < 0.040449999272823334f), (_2109 * 0.0003035269910469651f), exp2(log2((_2109 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) / _2151) - _2093) * _2158) + _2093);
    _2168 = ((((select(_2143, _2144, select(((_2111 * 0.003921568859368563f) < 0.040449999272823334f), (_2111 * 0.0003035269910469651f), exp2(log2((_2111 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) / _2151) - _2094) * _2158) + _2094);
  } else {
    _2166 = _2045;
    _2167 = _2046;
    _2168 = _2047;
  }
  [branch]
  if (!(!(_67 >= 0.0010000000474974513f))) {
    float _2171 = TEXCOORD.x + -0.5f;
    float _2172 = TEXCOORD.y + -0.5f;
    int _2177 = WaveReadLaneFirst(_materialIndex);
    int _2189 = WaveReadLaneFirst(_materialIndex);
    float _2202 = saturate(exp2(log2(TEXCOORD.y) * WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2189 < (uint)170000), _2189, 0)) + 0u))]._statusVignettePower3)) * (sqrt((_2172 * _2172) + (_2171 * _2171)) / max(0.0010000000474974513f, (1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2177 < (uint)170000), _2177, 0)) + 0u))]._statusVignetteRadius3)))));
    float _2205 = saturate(_67 * 10.0f) * _2202;
    float _2212 = (_2205 * (_546 - _2166)) + _2166;
    float _2213 = (_2205 * (_547 - _2167)) + _2167;
    float _2214 = (_2205 * (_548 - _2168)) + _2168;
    int _2215 = WaveReadLaneFirst(_materialIndex);
    int _2223 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2215 < (uint)170000), _2215, 0)) + 0u))]._statusVignetteColor3);
    float _2226 = float((uint)((uint)(((uint)((uint)(_2223)) >> 16) & 255)));
    float _2229 = float((uint)((uint)(((uint)((uint)(_2223)) >> 8) & 255)));
    float _2231 = float((uint)((uint)(_2223 & 255)));
    float _2256 = select(((_2226 * 0.003921568859368563f) < 0.040449999272823334f), (_2226 * 0.0003035269910469651f), exp2(log2((_2226 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    bool _2263 = (_1608) && (((_isPhotosensitiveMode_isAllolwBlood & 1) == 0));
    float _2264 = _2256 * 0.20000000298023224f;
    float _2271 = max(0.0010000000474974513f, _exposure0.x);
    float _2278 = saturate(_2202) * _67;
    _2286 = ((((select(_2263, _2264, _2256) / _2271) - _2212) * _2278) + _2212);
    _2287 = ((((select(_2263, _2264, select(((_2229 * 0.003921568859368563f) < 0.040449999272823334f), (_2229 * 0.0003035269910469651f), exp2(log2((_2229 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) / _2271) - _2213) * _2278) + _2213);
    _2288 = ((((select(_2263, _2264, select(((_2231 * 0.003921568859368563f) < 0.040449999272823334f), (_2231 * 0.0003035269910469651f), exp2(log2((_2231 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) / _2271) - _2214) * _2278) + _2214);
  } else {
    _2286 = _2166;
    _2287 = _2167;
    _2288 = _2168;
  }
  [branch]
  if (!(!(_hideStateRatio >= 0.0010000000474974513f))) {
    float _2293 = _hideStateRatio * 0.5f;
    float _2294 = TEXCOORD.x + -0.5f;
    float _2295 = TEXCOORD.y + -0.5f;
    float _2303 = saturate(((_2293 + -0.5f) + sqrt((_2295 * _2295) + (_2294 * _2294))) * 2.0f);
    float _2311 = saturate(((saturate(abs(0.5f - TEXCOORD.y) * 2.0f) - _2303) * 0.5f) + _2303);
    float _2319 = (((_2311 * _2311) * 0.8999999761581421f) * saturate(_hideStateRatio * 4.0f)) * (3.0f - (_2311 * 2.0f));
    float _2322 = dot(float3(_2286, _2287, _2288), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f)) * (1.0f - _2293);
    float _2325 = (pow(_2319, 0.5f));
    float _2332 = ((_2322 - _2286) * _2325) + _2286;
    float _2333 = ((_2322 - _2287) * _2325) + _2287;
    float _2334 = ((_2322 - _2288) * _2325) + _2288;
    float _2338 = 0.0010000000474974513f / max(0.0010000000474974513f, _exposure0.x);
    _2349 = (lerp(_2332, _2338, _2319));
    _2350 = (lerp(_2333, _2338, _2319));
    _2351 = (lerp(_2334, _2338, _2319));
  } else {
    _2349 = _2286;
    _2350 = _2287;
    _2351 = _2288;
  }
  if (_followLearning > 0.0010000000474974513f) {
    int _2356 = WaveReadLaneFirst(_materialIndex);
    int _2364 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2356 < (uint)170000), _2356, 0)) + 0u))]._followLearningColor);
    float _2367 = float((uint)((uint)(((uint)((uint)(_2364)) >> 16) & 255)));
    float _2370 = float((uint)((uint)(((uint)((uint)(_2364)) >> 8) & 255)));
    float _2372 = float((uint)((uint)(_2364 & 255)));
    float _2402 = max(0.0010000000474974513f, _exposure0.x);
    float _2403 = select(((_2367 * 0.003921568859368563f) < 0.040449999272823334f), (_2367 * 0.0003035269910469651f), exp2(log2((_2367 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _2402;
    float _2404 = select(((_2370 * 0.003921568859368563f) < 0.040449999272823334f), (_2370 * 0.0003035269910469651f), exp2(log2((_2370 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _2402;
    float _2405 = select(((_2372 * 0.003921568859368563f) < 0.040449999272823334f), (_2372 * 0.0003035269910469651f), exp2(log2((_2372 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _2402;
    int _2406 = WaveReadLaneFirst(_materialIndex);
    int _2414 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2406 < (uint)170000), _2406, 0)) + 0u))]._followLearningNoiseTex);
    float4 _2425 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_290 < (uint)65000), _290, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_238, ((_time.x * 0.20000000298023224f) + _239)));
    float _2432 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_238, _239));
    float _2435 = (_238 * 2.0f) + -1.0f;
    float _2437 = 1.0f - (_239 * 2.0f);
    float _2438 = max(1.0000000116860974e-07f, _2432.x);
    float _2474 = mad((_invViewProj[3].z), _2438, mad((_invViewProj[3].y), _2437, ((_invViewProj[3].x) * _2435))) + (_invViewProj[3].w);
    uint _2483 = uint(_bufferSizeAndInvSize.x * _238);
    uint _2484 = uint(_bufferSizeAndInvSize.y * _239);
    uint4 _2486 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_2483), (int)(_2484), 0));
    float4 _2489 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_2483), (int)(_2484), 0));
    float _2507 = (saturate(_2489.x * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _2508 = (saturate(_2489.y * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _2509 = (saturate(_2489.z * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _2511 = rsqrt(dot(float3(_2507, _2508, _2509), float3(_2507, _2508, _2509)));
    float _2512 = _2511 * _2507;
    float _2513 = _2511 * _2508;
    float _2514 = _2509 * _2511;
    float _2517 = (float((uint)((uint)(((uint)((uint)(_2486.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
    float _2518 = (float((uint)((uint)(_2486.w & 255))) * 0.007843137718737125f) + -1.0f;
    float _2521 = (_2517 + _2518) * 0.5f;
    float _2522 = (_2517 - _2518) * 0.5f;
    float _2526 = (1.0f - abs(_2521)) - abs(_2522);
    float _2528 = rsqrt(dot(float3(_2521, _2522, _2526), float3(_2521, _2522, _2526)));
    float _2529 = _2528 * _2521;
    float _2530 = _2528 * _2522;
    float _2531 = _2528 * _2526;
    float _2533 = select((_2514 >= 0.0f), 1.0f, -1.0f);
    float _2536 = -0.0f - (1.0f / (_2533 + _2514));
    float _2537 = _2513 * _2536;
    float _2538 = _2537 * _2512;
    float _2539 = _2533 * _2512;
    float _2548 = mad(_2531, _2512, mad(_2530, _2538, ((((_2539 * _2512) * _2536) + 1.0f) * _2529)));
    float _2552 = mad(_2531, _2513, mad(_2530, (_2533 + (_2537 * _2513)), ((_2529 * _2533) * _2538)));
    float _2556 = mad(_2531, _2514, mad(_2530, (-0.0f - _2513), (-0.0f - (_2539 * _2529))));
    float _2558 = rsqrt(dot(float3(_2548, _2552, _2556), float3(_2548, _2552, _2556)));
    float _2560 = _2558 * _2552;
    float _2561 = _2558 * _2556;
    float _2564 = _time.x * 0.5f;
    float _2567 = (((mad((_invViewProj[2].z), _2438, mad((_invViewProj[2].y), _2437, ((_invViewProj[2].x) * _2435))) + (_invViewProj[2].w)) / _2474) - _2564) * 0.20000000298023224f;
    float _2568 = (((mad((_invViewProj[1].z), _2438, mad((_invViewProj[1].y), _2437, ((_invViewProj[1].x) * _2435))) + (_invViewProj[1].w)) / _2474) - _2564) * 0.20000000298023224f;
    float4 _2575 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_2414 < (uint)65000), _2414, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_2567, _2568));
    float _2578 = (((mad((_invViewProj[0].z), _2438, mad((_invViewProj[0].y), _2437, ((_invViewProj[0].x) * _2435))) + (_invViewProj[0].w)) / _2474) - _2564) * 0.20000000298023224f;
    float4 _2579 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_2414 < (uint)65000), _2414, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_2578, _2567));
    float4 _2581 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_2414 < (uint)65000), _2414, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_2578, _2568));
    float _2587 = (abs(_2560) * (_2579.w - _2575.w)) + _2575.w;
    float _2590 = ((_2581.w - _2587) * abs(_2561)) + _2587;
    float _2591 = _2425.z + -0.5f;
    float _2596 = _238 + -0.5f;
    float _2598 = _239 + -0.5f;
    float _2603 = 0.375f - (_2591 * 0.25f);
    float _2606 = max((abs(((_2425.x + -0.5f) * 0.10000000149011612f) + _2596) - _2603), 0.0f);
    float _2607 = max((abs(((_2425.y + -0.5f) * 0.10000000149011612f) + _2598) - _2603), 0.0f);
    float _2612 = saturate(sqrt((_2607 * _2607) + (_2606 * _2606)));
    float _2616 = saturate(_followLearning * 2.0f);
    float _2622 = saturate(((((_2432.x * 100.0f) * _2616) - _2590) * 2.0f) + -0.5f);
    float _2632 = sqrt((_2598 * _2598) + (_2596 * _2596));
    float _2635 = ((saturate((_2616 * 2.0f) + -1.0f) * (1.0f - _2622)) + _2622) * saturate(_2632 + 0.5f);
    float _2637 = atan(_2598 / _2596);
    bool _2640 = (_2596 < 0.0f);
    bool _2641 = (_2596 == 0.0f);
    bool _2642 = (_2598 >= 0.0f);
    bool _2643 = (_2598 < 0.0f);
    float _2655 = _2590 * 0.5f;
    float4 _2668 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_2414 < (uint)65000), _2414, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((((_2591 * -0.5f) - _2655) - (_time.x * 0.20000000298023224f)) + select(((_2641) && (_2642)), 7.5f, select(((_2641) && (_2643)), -7.5f, (select(((_2640) && (_2643)), (_2637 + -3.1415927410125732f), select(((_2640) && (_2642)), (_2637 + 3.1415927410125732f), _2637)) * 4.774648189544678f)))), (((((_2425.w + -0.5f) * -0.5f) - _2655) + (_2632 * 2.0f)) - (_time.x * 1.5f))));
    float4 _2678 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * _238), int(_customRenderPassSizeInvSize.y * _239), 0));
    float _2682 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_238, _239));
    if (!(_1109 == _renderPassSelfPlayer)) {
      _2703 = (_1109 != _renderPassTest);
    } else {
      _2703 = false;
    }
    bool _2704 = !((1.0f - saturate(ceil(((_nearFarProj.x / max(1.0000000116860974e-07f, _2682.x)) + 0.5f) - (_nearFarProj.x / max(1.0000000116860974e-07f, _2678.x))))) == 0.0f);
    bool _2705 = (_2704) || (_2703);
    if (_1109 == _renderPassTargetFocus) {
      if (_2704) {
        _2719 = (_1109 != _renderPassAimHighlight);
      } else {
        _2719 = false;
      }
    } else {
      if ((_2704) || ((_1109 != _renderPassLearning))) {
        _2719 = (_1109 != _renderPassAimHighlight);
      } else {
        _2719 = false;
      }
    }
    float _2721 = saturate(_followLearning * 4.0f);
    float _2728 = (_2721 * (_279 - _2349)) + _2349;
    float _2729 = (_2721 * (_280 - _2350)) + _2350;
    float _2730 = (_2721 * (_281 - _2351)) + _2351;
    bool _2731 = (_2705) && (_2719);
    if (_2731) {
      float _2738 = ((_followLearning * 0.25f) * _2668.w) * saturate(_2632 - (_2721 * 0.20000000298023224f));
      float4 _2742 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_2738 + _238), (_2738 + _239)));
      float _2752 = (pow(_2742.x, 0.012683313339948654f));
      float _2753 = (pow(_2742.y, 0.012683313339948654f));
      float _2754 = (pow(_2742.z, 0.012683313339948654f));
      float _2792 = 1.0f - (_followLearning * 0.75f);
      _2802 = (((((exp2(log2(max(0.0f, (_2752 + -0.8359375f)) / (18.8515625f - (_2752 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _2728) * _2721) + _2728) * _2792);
      _2803 = (((((exp2(log2(max(0.0f, (_2753 + -0.8359375f)) / (18.8515625f - (_2753 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _2729) * _2721) + _2729) * _2792);
      _2804 = (((((exp2(log2(max(0.0f, (_2754 + -0.8359375f)) / (18.8515625f - (_2754 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _2730) * _2721) + _2730) * _2792);
      _2805 = _2635;
    } else {
      if (_2705) {
        _2802 = _2728;
        _2803 = _2729;
        _2804 = _2730;
        _2805 = select(_2719, _2635, 0.0f);
      } else {
        _2802 = _2728;
        _2803 = _2729;
        _2804 = _2730;
        _2805 = (_2635 * 0.4000000059604645f);
      }
    }
    float _2806 = dot(float3(_2802, _2803, _2804), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
    float _2813 = ((_2806 - _2802) * _2805) + _2802;
    float _2814 = ((_2806 - _2803) * _2805) + _2803;
    float _2815 = ((_2806 - _2804) * _2805) + _2804;
    float _2817 = _2590 * (_2425.z * 0.30000001192092896f);
    float _2823 = saturate(_2805 * 5.0f) * 0.8999999761581421f;
    float _2830 = (((_2817 * _2403) - _2813) * _2823) + _2813;
    float _2831 = (((_2817 * _2404) - _2814) * _2823) + _2814;
    float _2832 = (((_2817 * _2405) - _2815) * _2823) + _2815;
    int _2833 = WaveReadLaneFirst(_materialIndex);
    int _2841 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2833 < (uint)170000), _2833, 0)) + 0u))]._followLearningSaturationTone);
    float _2844 = float((uint)((uint)(((uint)((uint)(_2841)) >> 16) & 255)));
    float _2847 = float((uint)((uint)(((uint)((uint)(_2841)) >> 8) & 255)));
    float _2849 = float((uint)((uint)(_2841 & 255)));
    float _2874 = select(((_2844 * 0.003921568859368563f) < 0.040449999272823334f), (_2844 * 0.0003035269910469651f), exp2(log2((_2844 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _2875 = select(((_2847 * 0.003921568859368563f) < 0.040449999272823334f), (_2847 * 0.0003035269910469651f), exp2(log2((_2847 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _2876 = select(((_2849 * 0.003921568859368563f) < 0.040449999272823334f), (_2849 * 0.0003035269910469651f), exp2(log2((_2849 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _2880 = (1.0f - _2874) * 0.3086000084877014f;
    float _2882 = (1.0f - _2875) * 0.6093999743461609f;
    float _2884 = (1.0f - _2876) * 0.0820000022649765f;
    float _2889 = _2880 * _2830;
    float _2902 = (_followLearning * (mad(_2832, _2884, mad(_2831, _2882, ((_2880 + _2874) * _2830))) - _2830)) + _2830;
    float _2903 = (_followLearning * (mad(_2832, _2884, mad(_2831, (_2882 + _2875), _2889)) - _2831)) + _2831;
    float _2904 = (_followLearning * (mad(_2832, (_2884 + _2876), mad(_2831, _2882, _2889)) - _2832)) + _2832;
    if (!_2731) {
      float _2918 = saturate(1.0f - dot(float3((_2655 + (_2558 * _2548)), (_2655 + _2560), (_2655 + _2561)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
      float _2923 = select(_2705, ((_2918 * _2918) * 6.0f), (_2918 * 0.25f)) * _2918;
      float _2927 = (_followLearning * _followLearning) * saturate(_2590 * 10.0f);
      _2938 = (((_2927 * _2403) * _2923) + _2902);
      _2939 = (((_2927 * _2404) * _2923) + _2903);
      _2940 = (((_2927 * _2405) * _2923) + _2904);
    } else {
      _2938 = _2902;
      _2939 = _2903;
      _2940 = _2904;
    }
    float _2941 = _followLearning * _2612;
    float _2945 = 0.0010000000474974513f / max(0.0010000000474974513f, _exposure0.x);
    float _2952 = ((_2945 - _2938) * _2941) + _2938;
    float _2953 = ((_2945 - _2939) * _2941) + _2939;
    float _2954 = ((_2945 - _2940) * _2941) + _2940;
    float _2959 = saturate(((_2668.w * _2668.w) * 20.0f) * _followLearning) * _2612;
    _2970 = (lerp(_2952, _2403, _2959));
    _2971 = (lerp(_2953, _2404, _2959));
    _2972 = (lerp(_2954, _2405, _2959));
  } else {
    _2970 = _2349;
    _2971 = _2350;
    _2972 = _2351;
  }
  [branch]
  if ((dot(float4(_enemyAlert1.x, _enemyAlert1.y, _enemyAlert1.z, _enemyAlert1.w), float4(1.0f, 1.0f, 1.0f, 1.0f)) > 0.0f) | (dot(float4(_enemyAlert2.x, _enemyAlert2.y, _enemyAlert2.z, _enemyAlert2.w), float4(1.0f, 1.0f, 1.0f, 1.0f)) > 0.0f)) {
    bool _2992 = ((_isPhotosensitiveMode_isAllolwBlood & 1) != 0);
    float _2998 = max(0.0010000000474974513f, _exposure0.x);
    float4 _3015 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_290 < (uint)65000), _290, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((TEXCOORD.x * 2.0f) * _35), ((_time.x * 0.10000000149011612f) + (TEXCOORD.y * 2.0f))));
    float _3018 = _3015.x + -0.5f;
    float _3019 = _3015.y + -0.5f;
    float _3029 = 0.44999998807907104f - (_3018 * 0.004999999888241291f);
    float _3032 = max((abs((TEXCOORD.x + -0.5f) + (_3018 * 0.019999999552965164f)) - _3029), 0.0f);
    float _3033 = max((abs((TEXCOORD.y + -0.5f) + (_3019 * 0.019999999552965164f)) - _3029), 0.0f);
    int _3044 = WaveReadLaneFirst(_materialIndex);
    int _3052 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_3044 < (uint)170000), _3044, 0)) + 0u))]._enemyAlertTex);
    float4 _3059 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_3052 < (uint)65000), _3052, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - (_3019 * 0.029999999329447746f)), (TEXCOORD.y - (_3018 * 0.029999999329447746f))));
    bool _3064 = (TEXCOORD.y > 0.5f);
    bool _3066 = (TEXCOORD.x < 0.5f);
    bool _3070 = (TEXCOORD.y < 0.5f);
    bool _3078 = (TEXCOORD.x > 0.5f);
    float _3102 = saturate(dot(float4((_3059.x * float((bool)(uint)(_3070))), (_3059.y * float((bool)((uint)((_3078) && (_3070))))), (_3059.z * float((bool)(uint)(_3078))), (_3059.w * float((bool)((uint)((_3078) && (_3064)))))), float4(_enemyAlert2.x, _enemyAlert2.y, _enemyAlert2.z, _enemyAlert2.w)) + dot(float4((_3059.x * float((bool)(uint)(_3064))), (_3059.y * float((bool)((uint)((_3066) && (_3064))))), (_3059.z * float((bool)(uint)(_3066))), (_3059.w * float((bool)((uint)((_3066) && (_3070)))))), float4(_enemyAlert1.x, _enemyAlert1.y, _enemyAlert1.z, _enemyAlert1.w))) * saturate(sqrt((_3033 * _3033) + (_3032 * _3032)) * 20.0f);
    float _3104 = (_3102 * _3102) * _3102;
    _3115 = ((_3104 * ((select(_2992, 0.09989875555038452f, 0.08437622338533401f) / _2998) - _2970)) + _2970);
    _3116 = ((_3104 * ((select(_2992, 0.027320895344018936f, 0.030713455751538277f) / _2998) - _2971)) + _2971);
    _3117 = ((_3104 * ((select(_2992, 0.04817182570695877f, 0.07036010921001434f) / _2998) - _2972)) + _2972);
  } else {
    _3115 = _2970;
    _3116 = _2971;
    _3117 = _2972;
  }
  uint _3118 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _3125 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_3118), 0));
    _3131 = (float((uint)((uint)(_3125.x & 127))) + 0.5f);
  } else {
    _3131 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_3115, _3116, _3117));
    _3499 = output_color.x;
    _3500 = output_color.y;
    _3501 = output_color.z;
  } else {
    _3499 = _3115;
    _3500 = _3116;
    _3501 = _3117;
  }
  if (_etcParams.y > 1.0f) {
    float _3512 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _3513 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _3517 = saturate(1.0f - (dot(float2(_3512, _3513), float2(_3512, _3513)) * saturate(_etcParams.y + -1.0f)));
    _3522 = (_3517 * _3499);
    _3523 = (_3517 * _3500);
    _3524 = (_3517 * _3501);
  } else {
    _3522 = _3499;
    _3523 = _3500;
    _3524 = _3501;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _3557 = select((_3522 <= 0.0031308000907301903f), (_3522 * 12.920000076293945f), (((pow(_3522, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _3558 = select((_3523 <= 0.0031308000907301903f), (_3523 * 12.920000076293945f), (((pow(_3523, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _3559 = select((_3524 <= 0.0031308000907301903f), (_3524 * 12.920000076293945f), (((pow(_3524, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _3557 = _3522;
    _3558 = _3523;
    _3559 = _3524;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _3564 = float((uint)_3118);
    if (!(_3564 < _viewDir.w)) {
      if (!(_3564 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _3573 = _3557;
        _3574 = _3558;
        _3575 = _3559;
      } else {
        _3573 = 0.0f;
        _3574 = 0.0f;
        _3575 = 0.0f;
      }
    } else {
      _3573 = 0.0f;
      _3574 = 0.0f;
      _3575 = 0.0f;
    }
  } else {
    _3573 = _3557;
    _3574 = _3558;
    _3575 = _3559;
  }
  float _3585 = exp2(log2(_3573 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _3586 = exp2(log2(_3574 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _3587 = exp2(log2(_3575 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_3585 * 18.6875f) + 1.0f)) * ((_3585 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_3586 * 18.6875f) + 1.0f)) * ((_3586 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_3587 * 18.6875f) + 1.0f)) * ((_3587 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _3131;
  return SV_Target;
}

