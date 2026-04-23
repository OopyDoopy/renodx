#include "./tonemap.hlsli"

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
  float _309;
  float _310;
  float _311;
  float _346;
  float _431;
  float _432;
  float _433;
  float _474;
  float _475;
  float _476;
  float _527;
  float _528;
  float _529;
  float _591;
  float _592;
  float _593;
  float _594;
  float _595;
  float _596;
  float _666;
  float _667;
  float _668;
  float _725;
  float _726;
  float _927;
  float _928;
  float _929;
  float _962;
  float _963;
  float _964;
  int _965;
  float _1142;
  float _1143;
  float _1144;
  float _1207;
  float _1208;
  float _1209;
  float _1249;
  float _1250;
  float _1251;
  float _1386;
  float _1387;
  float _1388;
  float _1450;
  float _1451;
  float _1452;
  float _1453;
  float _1454;
  float _1455;
  float _1654;
  float _1741;
  float _1742;
  float _1743;
  float _1865;
  float _1866;
  float _1867;
  float _1986;
  float _1987;
  float _1988;
  float _2106;
  float _2107;
  float _2108;
  float _2169;
  float _2170;
  float _2171;
  bool _2523;
  bool _2539;
  float _2586;
  float _2587;
  float _2588;
  float _2589;
  float _2722;
  float _2723;
  float _2724;
  float _2754;
  float _2755;
  float _2756;
  float _2899;
  float _2900;
  float _2901;
  float _2915;
  float _3161;
  float _3162;
  float _3163;
  float _3283;
  float _3284;
  float _3285;
  float _3306;
  float _3307;
  float _3308;
  float _3341;
  float _3342;
  float _3343;
  float _3357;
  float _3358;
  float _3359;
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
  int _246 = WaveReadLaneFirst(_materialIndex);
  int _254 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_246 < (uint)170000), _246, 0)) + 0u))]._noiseTex);
  [branch]
  if (!(!(_fleeCount >= 0.0010000000474974513f))) {
    float4 _278 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_254 < (uint)65000), _254, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((TEXCOORD.x * 4.0f), ((((_fleeCount * 0.0010000000474974513f) + -0.10000000149011612f) + ((TEXCOORD.y / _35) * 4.0f)) + (_time.x * 0.019999999552965164f))));
    float _287 = (TEXCOORD.x + -0.5f) + ((_278.x + -0.5f) * 0.15000000596046448f);
    float _288 = (TEXCOORD.y + -0.5f) + ((_278.y + -0.5f) * 0.15000000596046448f);
    float _301 = saturate(_fleeCount * 0.20000000298023224f) * saturate((((_fleeCount * 0.004999999888241291f) + -0.6000000238418579f) + sqrt((_287 * _287) + (_288 * _288))) / ((_fleeCount * 0.004000000189989805f) + 0.10000000149011612f));
    _309 = (_242.x - (_301 * _242.x));
    _310 = (_242.y - (_301 * _242.y));
    _311 = (_242.z - (_301 * _242.z));
  } else {
    _309 = _242.x;
    _310 = _242.y;
    _311 = _242.z;
  }
  int _312 = WaveReadLaneFirst(_materialIndex);
  if (((_226 >= 0.0010000000474974513f)) || ((WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_312 < (uint)170000), _312, 0)) + 0u))]._uiMainMenuEffect) >= 0.0010000000474974513f))) {
    int _325 = WaveReadLaneFirst(_materialIndex);
    if (WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_325 < (uint)170000), _325, 0)) + 0u))]._uiMainMenuEffect) > _226) {
      int _336 = WaveReadLaneFirst(_materialIndex);
      _346 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_336 < (uint)170000), _336, 0)) + 0u))]._uiMainMenuEffect);
    } else {
      _346 = _226;
    }
    float _354 = _346 * 0.5f;
    float4 _378 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_254 < (uint)65000), _254, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((TEXCOORD.x * 2.0f) * _35), (TEXCOORD.y * 2.0f)));
    int _383 = WaveReadLaneFirst(_materialIndex);
    bool _393 = (_226 < 0.0010000000474974513f);
    bool _394 = (_393) && ((WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_383 < (uint)170000), _383, 0)) + 0u))]._uiMainMenuEffect) >= 0.0010000000474974513f));
    int _396 = WaveReadLaneFirst(_materialIndex);
    float _414 = (TEXCOORD.y - select(_394, 0.550000011920929f, 0.5f)) - ((_378.y + -0.5f) * 0.05000000074505806f);
    float _415 = ((TEXCOORD.x - ((_378.x + -0.5f) * 0.05000000074505806f)) + select(_394, -0.41999998688697815f, -0.5f)) * _35;
    float _426 = ((_346 * -0.8999999761581421f) * (1.0f - saturate((select(((_393) && ((WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_396 < (uint)170000), _396, 0)) + 0u))]._uiMainMenuEffect) >= 0.0010000000474974513f))), 0.3499999940395355f, 0.4000000059604645f) - sqrt((_415 * _415) + (_414 * _414))) * 1.4285714626312256f))) + 1.0f;
    _431 = (_426 * ((_354 * (((_310 * 0.75f) - (_309 * 0.6069999933242798f)) + (_311 * 0.1889999955892563f))) + _309));
    _432 = (_426 * ((_354 * (((_309 * 0.3490000069141388f) - (_310 * 0.3140000104904175f)) + (_311 * 0.1679999977350235f))) + _310));
    _433 = (_426 * ((_354 * (((_309 * 0.2720000147819519f) + (_310 * 0.5339999794960022f)) - (_311 * 0.8690000176429749f))) + _311));
  } else {
    _431 = _309;
    _432 = _310;
    _433 = _311;
  }
  if ((((_49 >= 0.0010000000474974513f)) && ((_80 >= 0.0010000000474974513f))) | (((_58 >= 0.0010000000474974513f)) && ((_93 >= 0.0010000000474974513f))) | (((_67 >= 0.0010000000474974513f)) && ((_106 >= 0.0010000000474974513f)))) {
    float _448 = _238 + -0.5f;
    float _449 = _239 + -0.5f;
    float _458 = rsqrt(dot(float2(_448, _449), float2(_448, _449))) * ((max(max(_80, _93), _106) * 0.009999999776482582f) * sqrt((_449 * _449) + (_448 * _448)));
    float _459 = _458 * _448;
    float _461 = _458 * _449;
    float4 _467 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_238 - _459), (_239 - _461)));
    float4 _469 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_238, _239));
    float4 _471 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_459 + _238), (_461 + _239)));
    _474 = _467.x;
    _475 = _469.y;
    _476 = _471.z;
  } else {
    _474 = _431;
    _475 = _432;
    _476 = _433;
  }
  if (((_119 >= 0.0010000000474974513f)) && ((_128 >= 0.0010000000474974513f))) {
    int _481 = WaveReadLaneFirst(_materialIndex);
    float _492 = _238 - WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_481 < (uint)170000), _481, 0)) + 0u))]._chromaticAberrationShiftPosition.x);
    float _493 = _239 - WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_481 < (uint)170000), _481, 0)) + 0u))]._chromaticAberrationShiftPosition.y);
    float _502 = rsqrt(dot(float2(_492, _493), float2(_492, _493))) * ((_128 * 0.009999999776482582f) * sqrt((_493 * _493) + (_492 * _492)));
    float _503 = _502 * _492;
    float _505 = _502 * _493;
    float4 _511 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_238 - _503), (_239 - _505)));
    float4 _513 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_238, _239));
    float4 _515 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_503 + _238), (_505 + _239)));
    _527 = (lerp(_474, _511.x, _119));
    _528 = (lerp(_475, _513.y, _119));
    _529 = (lerp(_476, _515.z, _119));
  } else {
    _527 = _431;
    _528 = _432;
    _529 = _433;
  }
  int _530 = WaveReadLaneFirst(_materialIndex);
  float _538 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_530 < (uint)170000), _530, 0)) + 0u))]._detectModeG);
  int _539 = WaveReadLaneFirst(_materialIndex);
  float _547 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_539 < (uint)170000), _539, 0)) + 0u))]._detectModeR);
  int _548 = WaveReadLaneFirst(_materialIndex);
  float _556 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_548 < (uint)170000), _548, 0)) + 0u))]._detectModeB);
  int _557 = WaveReadLaneFirst(_materialIndex);
  float _565 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_557 < (uint)170000), _557, 0)) + 0u))]._detectModeKnowledge);
  int _566 = WaveReadLaneFirst(_materialIndex);
  float _574 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_566 < (uint)170000), _566, 0)) + 0u))]._detectModeInterrupt);
  float _579 = saturate((((_547 + _538) + _556) + _565) + _574);
  [branch]
  if (_579 > 0.0f) {
    if (!(_538 >= 0.0010000000474974513f)) {
      if (!(_547 >= 0.0010000000474974513f)) {
        if (!(_556 >= 0.0010000000474974513f)) {
          if (!(!(_565 >= 0.0010000000474974513f))) {
            _591 = 0.6000000238418579f;
            _592 = 0.6000000238418579f;
            _593 = 0.800000011920929f;
            _594 = 0.5f;
            _595 = 0.44999998807907104f;
            _596 = 0.949999988079071f;
          } else {
            _591 = 0.0f;
            _592 = 0.0f;
            _593 = 0.0f;
            _594 = 0.0f;
            _595 = 0.0f;
            _596 = 0.0f;
          }
        } else {
          _591 = 0.6000000238418579f;
          _592 = 0.699999988079071f;
          _593 = 0.699999988079071f;
          _594 = 0.6000000238418579f;
          _595 = 0.699999988079071f;
          _596 = 0.800000011920929f;
        }
      } else {
        _591 = 0.699999988079071f;
        _592 = 0.6000000238418579f;
        _593 = 0.6000000238418579f;
        _594 = 0.800000011920929f;
        _595 = 0.699999988079071f;
        _596 = 0.6000000238418579f;
      }
    } else {
      _591 = 0.6000000238418579f;
      _592 = 0.699999988079071f;
      _593 = 0.6000000238418579f;
      _594 = 0.6000000238418579f;
      _595 = 0.800000011920929f;
      _596 = 0.699999988079071f;
    }
    bool _597 = (_574 >= 0.0010000000474974513f);
    float _601 = select(_597, 0.800000011920929f, _594);
    float _602 = select(_597, 0.6000000238418579f, _595);
    float _603 = select(_597, 0.20000000298023224f, _596);
    float _610 = (1.0f - _601) * 0.3086000084877014f;
    float _612 = (1.0f - _602) * 0.6093999743461609f;
    float _614 = (1.0f - _603) * 0.0820000022649765f;
    float _616 = select(_597, 2.0f, _591) * _527;
    float _617 = select(_597, 2.0f, _592) * _528;
    float _618 = select(_597, 2.0f, _593) * _529;
    float _622 = _610 * _616;
    float _627 = 0.009999999776482582f / max(0.0010000000474974513f, _exposure0.x);
    float _637 = max((abs(TEXCOORD.x + -0.5f) + -0.07500000298023224f), 0.0f);
    float _638 = max((abs(TEXCOORD.y + -0.5f) + -0.07500000298023224f), 0.0f);
    float _646 = (_579 * 0.75f) * saturate(sqrt((_638 * _638) + (_637 * _637)) * 2.0f);
    float _653 = ((mad(_618, _614, mad(_617, _612, ((_610 + _601) * _616))) - _527) * _579) + _527;
    float _654 = ((mad(_618, _614, mad(_617, (_612 + _602), _622)) - _528) * _579) + _528;
    float _655 = ((mad(_618, (_614 + _603), mad(_617, _612, _622)) - _529) * _579) + _529;
    _666 = ((_646 * ((_627 * _601) - _653)) + _653);
    _667 = ((_646 * ((_627 * _602) - _654)) + _654);
    _668 = ((_646 * ((_627 * _603) - _655)) + _655);
  } else {
    _666 = _527;
    _667 = _528;
    _668 = _529;
  }
  if ((((((_highLightForVisionRemoteCatch > 0.0f)) || ((_highLightForVision > 0.0f)))) || ((_characterHighlight > 0.0f))) | (_followLearning > 0.0010000000474974513f)) {
    int2 _684; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_684.x, _684.y);
    uint _699 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_684.x))))) + 0.5f) * _238), int((float((int)(int(float((int)(_684.y))))) + 0.5f) * _239), 0));
    int _701 = _699.x & 255;
    float _709 = (float((uint)((uint)((uint)((uint)(_699.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
    float _710 = (float((uint)((uint)(((uint)((uint)(_699.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
    float _712 = 1.0f - abs(_709);
    float _713 = abs(_710);
    float _714 = _712 - _713;
    if (!(_714 >= 0.0f)) {
      _725 = (select((_709 >= 0.0f), 1.0f, -1.0f) * (1.0f - _713));
      _726 = (select((_710 >= 0.0f), 1.0f, -1.0f) * _712);
    } else {
      _725 = _709;
      _726 = _710;
    }
    float _728 = rsqrt(dot(float3(_725, _726, _714), float3(_725, _726, _714)));
    float _729 = _728 * _725;
    float _730 = _728 * _726;
    float _731 = _728 * _714;
    float _733 = rsqrt(dot(float3(_729, _730, _731), float3(_729, _730, _731)));
    float4 _739 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_238, _239));
    [branch]
    if (_701 == _renderPassTest) {
      int _752 = WaveReadLaneFirst(_materialIndex);
      float _761 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_752 < (uint)170000), _752, 0)) + 0u))]._testEffectRatio) * (1.0f / max(0.0010000000474974513f, _exposure0.x));
      _962 = (_761 + _666);
      _963 = _667;
      _964 = (_761 + _668);
      _965 = _701;
    } else {
      if ((_701 == _renderPassDetectObjective) || ((!(_701 == _renderPassDetectObjective)) && (_701 == _renderPassKnowledgeNPC))) {
        float4 _784 = __3__36__0__0__g_noiseTex.SampleLevel(__0__4__0__0__g_staticPointWrap, float2(frac((TEXCOORD.x * 0.015625f) * _bufferSizeAndInvSize.x), frac((TEXCOORD.y * 0.015625f) * _bufferSizeAndInvSize.y)), 0.0f);
        float _787 = (_784.x * 0.5f) + 0.5f;
        _962 = ((((_787 * _739.x) - _666) * _739.w) + _666);
        _963 = ((((_787 * _739.y) - _667) * _739.w) + _667);
        _964 = ((((_787 * _739.z) - _668) * _739.w) + _668);
        _965 = _701;
      } else {
        bool __defer_800_881 = false;
        if (!(_701 == _renderPassDetectRemoteCatch) || ((_701 == _renderPassDetectRemoteCatch) && (!(WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)(WaveReadLaneFirst(_materialIndex)) < (uint)170000), (WaveReadLaneFirst(_materialIndex)), 0)) + 0u))]._itemRatio) > 0.0010000000474974513f))) || (((_701 == _renderPassDetectRemoteCatch) && (WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)(WaveReadLaneFirst(_materialIndex)) < (uint)170000), (WaveReadLaneFirst(_materialIndex)), 0)) + 0u))]._itemRatio) > 0.0010000000474974513f)) && (!(((_highLightForVision > 0.0f)) || ((_highLightForVisionRemoteCatch > 0.0f)))))) {
          __defer_800_881 = true;
        } else {
          int _822 = WaveReadLaneFirst(_materialIndex);
          int _830 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_822 < (uint)170000), _822, 0)) + 0u))]._detectColorBase);
          float _833 = float((uint)((uint)(((uint)((uint)(_830)) >> 16) & 255)));
          float _836 = float((uint)((uint)(((uint)((uint)(_830)) >> 8) & 255)));
          float _838 = float((uint)((uint)(_830 & 255)));
          float _871 = max(0.0010000000474974513f, _exposure0.x);
          _962 = ((((select(((_833 * 0.003921568859368563f) < 0.040449999272823334f), (_833 * 0.0003035269910469651f), exp2(log2((_833 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * 10.0f) / _871) * _739.w) + _666);
          _963 = ((((select(((_836 * 0.003921568859368563f) < 0.040449999272823334f), (_836 * 0.0003035269910469651f), exp2(log2((_836 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * 10.0f) / _871) * _739.w) + _667);
          _964 = ((((select(((_838 * 0.003921568859368563f) < 0.040449999272823334f), (_838 * 0.0003035269910469651f), exp2(log2((_838 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * 10.0f) / _871) * _739.w) + _668);
          _965 = _701;
        }
        if (__defer_800_881) {
          bool _884 = (_701 == _renderPassSelfPlayer);
          bool __defer_881_896 = false;
          if ((_884) | (((_701 == _renderPassTest)) || ((_701 == _renderPassEnemy))) | (_701 == _renderPassDetectPickedRemoteCatch)) {
            __defer_881_896 = true;
          } else {
            _962 = _666;
            _963 = _667;
            _964 = _668;
            _965 = _701;
          }
          if (__defer_881_896) {
            if (((_characterHighlight > 0.0010000000474974513f)) || ((_highLightForVisionRemoteCatch > 0.0010000000474974513f))) {
              float _913 = 1.0f - saturate(dot(float3((_733 * _729), (_733 * _730), (_733 * _731)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
              float _914 = _913 * _913;
              float _915 = _914 * _914;
              if (!_884) {
                if (!(_701 == _renderPassTest)) {
                  bool _922 = (_701 == _renderPassEnemy);
                  _927 = select(_922, 1.0f, 0.20000000298023224f);
                  _928 = select(_922, 0.30000001192092896f, 0.4000000059604645f);
                  _929 = select(_922, 0.30000001192092896f, 1.0f);
                } else {
                  _927 = 1.0f;
                  _928 = 1.0f;
                  _929 = 1.0f;
                }
              } else {
                _927 = 1.0f;
                _928 = 1.0f;
                _929 = 1.0f;
              }
              float _936 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
              _962 = ((((_739.x - _666) + ((((_936 + (_666 * 10.0f)) * _927) - _739.x) * _915)) * _739.w) + _666);
              _963 = ((((_739.y - _667) + ((((_936 + (_667 * 10.0f)) * _928) - _739.y) * _915)) * _739.w) + _667);
              _964 = ((((_739.z - _668) + ((((_936 + (_668 * 10.0f)) * _929) - _739.z) * _915)) * _739.w) + _668);
              _965 = _701;
            } else {
              _962 = _666;
              _963 = _667;
              _964 = _668;
              _965 = _701;
            }
          }
        }
      }
    }
  } else {
    _962 = _666;
    _963 = _667;
    _964 = _668;
    _965 = 0;
  }
  if (!(!(_wantedRegionRatio >= 0.0010000000474974513f))) {
    [branch]
    if (!(!(_wantedRegionOpacity >= 0.0010000000474974513f))) {
      int _974 = WaveReadLaneFirst(_materialIndex);
      int _982 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_974 < (uint)170000), _974, 0)) + 0u))]._wantedRegionColor);
      float _985 = float((uint)((uint)(((uint)((uint)(_982)) >> 16) & 255)));
      float _988 = float((uint)((uint)(((uint)((uint)(_982)) >> 8) & 255)));
      float _990 = float((uint)((uint)(_982 & 255)));
      float _1023 = max(0.0010000000474974513f, _exposure0.x);
      float _1031 = _wantedRegionRadius * _wantedRegionRatio;
      float _1033 = saturate(_1031) * 4.0f;
      float _1036 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_238, _239));
      float _1039 = (_238 * 2.0f) + -1.0f;
      float _1041 = 1.0f - (_239 * 2.0f);
      float _1042 = max(1.0000000116860974e-07f, _1036.x);
      float _1070 = mad((_invViewProj[3].z), _1042, mad((_invViewProj[3].y), _1041, ((_invViewProj[3].x) * _1039))) + (_invViewProj[3].w);
      float _1076 = ((mad((_invViewProj[0].z), _1042, mad((_invViewProj[0].y), _1041, ((_invViewProj[0].x) * _1039))) + (_invViewProj[0].w)) / _1070) - _wantedRegionPosition.x;
      float _1077 = ((mad((_invViewProj[2].z), _1042, mad((_invViewProj[2].y), _1041, ((_invViewProj[2].x) * _1039))) + (_invViewProj[2].w)) / _1070) - _wantedRegionPosition.z;
      float _1081 = sqrt((_1076 * _1076) + (_1077 * _1077));
      float _1088 = saturate(floor(_1081 / _1031));
      float _1090 = (1.0f - _1088) * saturate(((_1033 - _1031) + _1081) / _1033);
      float _1097 = (1.0f - saturate((_1081 - _1031) / _1033)) * _1088;
      float _1101 = saturate(((_1097 * _1097) * _1097) + ((_1090 * _1090) * _1090));
      float _1104 = saturate((_1101 * 5.0f) + -4.0f);
      float _1105 = _1104 * _1104;
      float _1108 = ((_1105 * _1105) * 9.0f) + 1.0f;
      uint2 _1121 = __3__36__0__0__g_stencil.Load(int3((int)(uint(_bufferSizeAndInvSize.x * _238)), (int)(uint(_bufferSizeAndInvSize.y * _239)), 0));
      int _1123 = _1121.x & 127;
      float _1131 = (((float((uint)((uint)((uint)((uint)(_982)) >> 24))) * 0.003921568859368563f) * _wantedRegionOpacity) * _1101) * float((bool)((uint)(((_1123 != 57)) && (((uint)(_1123 + -53) > (uint)14)))));
      _1142 = ((_1131 * ((_1108 * (select(((_985 * 0.003921568859368563f) < 0.040449999272823334f), (_985 * 0.0003035269910469651f), exp2(log2((_985 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _1023)) - _962)) + _962);
      _1143 = ((_1131 * ((_1108 * (select(((_988 * 0.003921568859368563f) < 0.040449999272823334f), (_988 * 0.0003035269910469651f), exp2(log2((_988 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _1023)) - _963)) + _963);
      _1144 = ((_1131 * ((_1108 * (select(((_990 * 0.003921568859368563f) < 0.040449999272823334f), (_990 * 0.0003035269910469651f), exp2(log2((_990 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _1023)) - _964)) + _964);
    } else {
      _1142 = _962;
      _1143 = _963;
      _1144 = _964;
    }
  } else {
    _1142 = _962;
    _1143 = _963;
    _1144 = _964;
  }
  if (((((_temperatureWarning <= -0.009999999776482582f)) || ((_temperatureWarning >= 0.009999999776482582f)))) || ((_electrocutionWarning > 0.0010000000474974513f))) {
    float4 _1156 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_238, _239));
    float _1162 = _temperatureWarning * 0.009999999776482582f;
    if (_temperatureWarning > 0.0f) {
      float _1165 = saturate(saturate(_1162));
      float _1166 = TEXCOORD.x + -0.5f;
      float _1167 = TEXCOORD.y + -0.6000000238418579f;
      float _1175 = saturate((_1165 + -0.5f) + sqrt((_1167 * _1167) + (_1166 * _1166))) * _1165;
      float _1180 = (1.0f - (_1175 * 0.30000001192092896f)) * _1143;
      float _1181 = (1.0f - (_1175 * 0.699999988079071f)) * _1144;
      _1207 = ((_1156.x - _1142) * _1156.w);
      _1208 = (lerp(_1180, _1156.y, _1156.w));
      _1209 = (lerp(_1181, _1156.z, _1156.w));
    } else {
      float _1196 = (_1156.w * (1.0f - TEXCOORD.y)) * saturate(abs(_1162) * 2.0f);
      _1207 = (_1196 * (_1156.x - (_1142 * 0.30000001192092896f)));
      _1208 = ((_1196 * (_1156.y - (_1143 * 0.10000002384185791f))) + _1143);
      _1209 = ((_1196 * _1156.z) + _1144);
    }
    float _1210 = _1142 + _1207;
    if (!(_electrocutionWarning == 0.0f)) {
      float _1216 = max(0.0010000000474974513f, _exposure0.x);
      float _1220 = TEXCOORD.x + -0.5f;
      float _1221 = TEXCOORD.y + -0.6000000238418579f;
      float _1229 = (_electrocutionWarning * 0.5f) * saturate(sqrt((_1221 * _1221) + (_1220 * _1220)) + -0.30000001192092896f);
      float _1236 = (_1229 * ((0.05000000074505806f / _1216) - _1210)) + _1210;
      float _1237 = (_1229 * ((0.10000000149011612f / _1216) - _1208)) + _1208;
      float _1238 = (_1229 * ((0.5f / _1216) - _1209)) + _1209;
      _1249 = (lerp(_1236, _1156.x, _1156.w));
      _1250 = (lerp(_1237, _1156.y, _1156.w));
      _1251 = (lerp(_1238, _1156.z, _1156.w));
    } else {
      _1249 = _1210;
      _1250 = _1208;
      _1251 = _1209;
    }
  } else {
    _1249 = _1142;
    _1250 = _1143;
    _1251 = _1144;
  }
  [branch]
  if (!(!(_hpPercentage <= 20.0f))) {
    float _1257 = 1.0f - (_hpPercentage * 0.009999999776482582f);
    if (((!(_hpPercentage <= 0.0f))) && ((_1257 >= 0.0010000000474974513f))) {
      float _1272 = _time.x * 0.30000001192092896f;
      float4 _1281 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_254 < (uint)65000), _254, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1272 + (TEXCOORD.x * 12.0f)), (_1272 + (TEXCOORD.y * 6.0f))));
      float _1283 = _1281.w * 0.10000000149011612f;
      int _1286 = WaveReadLaneFirst(_materialIndex);
      int _1294 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1286 < (uint)170000), _1286, 0)) + 0u))]._borderEdgeNoiseTexture);
      float4 _1301 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1294 < (uint)65000), _1294, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((TEXCOORD.x * 2.0f) + 0.30000001192092896f) + _1283), (_1283 + TEXCOORD.y)));
      float _1308 = (_hpPercentage * 0.0020000000949949026f) + 0.36000001430511475f;
      float _1311 = max((abs(TEXCOORD.x + -0.5f) - _1308), 0.0f);
      float _1312 = max((abs(TEXCOORD.y + -0.5f) - _1308), 0.0f);
      float _1324 = sin(frac(_time.x * (2.0f - (_hpPercentage * 0.05000000074505806f))) * 3.1415927410125732f);
      float _1336 = 1.0f - _239;
      float _1339 = saturate((_1336 * _1336) * 2.0f);
      float _1340 = saturate(_1324);
      bool _1348 = ((_isPhotosensitiveMode_isAllolwBlood & 1) != 0);
      float _1350 = (_1340 * 0.0112674031406641f) + 0.022386489436030388f;
      float _1359 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
      float _1361 = select(_1348, 0.006995410192757845f, 0.04317210242152214f) * _1359;
      float _1365 = (min(max(_1257, 0.0f), 1.0f) * saturate((saturate(((_1324 * 0.19999998807907104f) + 0.800000011920929f) * saturate(sqrt((_1312 * _1312) + (_1311 * _1311)) * 3.846153974533081f)) * 2.0f) - (_1301.x * 1.440000057220459f))) * _1339;
      float _1366 = _1339 * (0.12999999523162842f - (_hpPercentage * 0.006000000052154064f));
      float _1373 = (((select(_1348, 0.215860515832901f, 0.04317210242152214f) * _1359) - _1249) * _1366) + _1249;
      float _1374 = ((_1361 - _1250) * _1366) + _1250;
      float _1375 = ((_1361 - _1251) * _1366) + _1251;
      _1386 = ((((select(_1348, ((_1340 * 0.056337013840675354f) + 0.11193244159221649f), _1350) * _1359) - _1373) * _1365) + _1373);
      _1387 = ((((select(_1348, ((_1340 * 0.0053743417374789715f) + 0.0021246890537440777f), _1350) * _1359) - _1374) * _1365) + _1374);
      _1388 = ((((select(_1348, 0.0021246890537440777f, _1350) * _1359) - _1375) * _1365) + _1375);
    } else {
      _1386 = _1249;
      _1387 = _1250;
      _1388 = _1251;
    }
  } else {
    _1386 = _1249;
    _1387 = _1250;
    _1388 = _1251;
  }
  int _1389 = WaveReadLaneFirst(_materialIndex);
  float _1399 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1389 < (uint)170000), _1389, 0)) + 0u))]._channelBrightness.x);
  float _1400 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1389 < (uint)170000), _1389, 0)) + 0u))]._channelBrightness.y);
  float _1401 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1389 < (uint)170000), _1389, 0)) + 0u))]._channelBrightness.z);
  int _1402 = WaveReadLaneFirst(_materialIndex);
  float _1412 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1402 < (uint)170000), _1402, 0)) + 0u))]._saturation.x);
  float _1413 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1402 < (uint)170000), _1402, 0)) + 0u))]._saturation.y);
  float _1414 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1402 < (uint)170000), _1402, 0)) + 0u))]._saturation.z);
  int _1415 = WaveReadLaneFirst(_materialIndex);
  bool _1428 = (WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_129 < (uint)170000), _129, 0)) + 0u))]._isBloodEffect) > 0.0010000000474974513f);
  if ((_1428) && (((_isPhotosensitiveMode_isAllolwBlood & 1) == 0))) {
    bool _1435 = ((_1399 > (_1400 + 0.05000000074505806f))) && ((_1399 > (_1401 + 0.05000000074505806f)));
    float _1436 = _1399 * 0.4000000059604645f;
    bool _1444 = ((_1412 > (_1413 + 0.05000000074505806f))) && ((_1412 > (_1414 + 0.05000000074505806f)));
    float _1445 = _1412 * 0.4000000059604645f;
    _1450 = select(_1435, _1436, _1399);
    _1451 = select(_1435, _1436, _1400);
    _1452 = select(_1435, _1436, _1401);
    _1453 = select(_1444, _1445, _1412);
    _1454 = select(_1444, _1445, _1413);
    _1455 = select(_1444, _1445, _1414);
  } else {
    _1450 = _1399;
    _1451 = _1400;
    _1452 = _1401;
    _1453 = _1412;
    _1454 = _1413;
    _1455 = _1414;
  }
  float _1456 = _1450 * _1386;
  float _1457 = _1451 * _1387;
  float _1458 = _1452 * _1388;
  float _1462 = (1.0f - _1453) * 0.3086000084877014f;
  float _1464 = (1.0f - _1454) * 0.6093999743461609f;
  float _1466 = (1.0f - _1455) * 0.0820000022649765f;
  float _1471 = _1462 * _1456;
  float _1488 = max(WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1415 < (uint)170000), _1415, 0)) + 0u))]._contrast), 0.0f);
  float _1495 = max(0.0f, ((_1488 * (mad(_1458, _1466, mad(_1457, _1464, ((_1462 + _1453) * _1456))) + -0.5f)) + 0.5f));
  float _1496 = max(0.0f, ((_1488 * (mad(_1458, _1466, mad(_1457, (_1464 + _1454), _1471)) + -0.5f)) + 0.5f));
  float _1497 = max(0.0f, ((_1488 * (mad(_1458, (_1466 + _1455), mad(_1457, _1464, _1471)) + -0.5f)) + 0.5f));
  int _1498 = WaveReadLaneFirst(_materialIndex);
  float _1506 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1498 < (uint)170000), _1498, 0)) + 0u))]._invertColor);
  float _1509 = _exposure2.x * 4.0f;
  float _1519 = ((_1509 - (_1495 * 2.0f)) * _1506) + _1495;
  float _1520 = ((_1509 - (_1496 * 2.0f)) * _1506) + _1496;
  float _1521 = ((_1509 - (_1497 * 2.0f)) * _1506) + _1497;
  int _1522 = WaveReadLaneFirst(_materialIndex);
  float _1530 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1522 < (uint)170000), _1522, 0)) + 0u))]._borderRatio);
  [branch]
  if (!(!(_1530 >= 0.0010000000474974513f))) {
    int _1533 = WaveReadLaneFirst(_materialIndex);
    int _1546 = WaveReadLaneFirst(_materialIndex);
    int _1559 = WaveReadLaneFirst(_materialIndex);
    int _1567 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1559 < (uint)170000), _1559, 0)) + 0u))]._borderEdgeNoiseTexture);
    float4 _1574 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1567 < (uint)65000), _1567, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1546 < (uint)170000), _1546, 0)) + 0u))]._borderEdgeNoiseOffset.x) + (WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1533 < (uint)170000), _1533, 0)) + 0u))]._borderEdgeNoiseTile.x) * TEXCOORD.x)), (WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1546 < (uint)170000), _1546, 0)) + 0u))]._borderEdgeNoiseOffset.y) + (WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1533 < (uint)170000), _1533, 0)) + 0u))]._borderEdgeNoiseTile.y) * TEXCOORD.y))));
    int _1576 = WaveReadLaneFirst(_materialIndex);
    int _1585 = WaveReadLaneFirst(_materialIndex);
    float _1599 = (1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1585 < (uint)170000), _1585, 0)) + 0u))]._borderWidth)) * 0.5f;
    float _1602 = max((abs(TEXCOORD.x + -0.5f) - _1599), 0.0f);
    float _1603 = max((abs(TEXCOORD.y + -0.5f) - _1599), 0.0f);
    float _1612 = 1.0f - ((1.0f - saturate(sqrt((_1603 * _1603) + (_1602 * _1602)) / WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1576 < (uint)170000), _1576, 0)) + 0u))]._borderSmoothness))) * 2.0f);
    int _1613 = WaveReadLaneFirst(_materialIndex);
    float _1621 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1613 < (uint)170000), _1613, 0)) + 0u))]._borderFlickerSpeed);
    if (_1621 > 0.0010000000474974513f) {
      int _1624 = WaveReadLaneFirst(_materialIndex);
      int _1642 = WaveReadLaneFirst(_materialIndex);
      _1654 = ((min(max(sin((_1621 * 3.1415927410125732f) * _time.x), WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1624 < (uint)170000), _1624, 0)) + 0u))]._borderFlickerOpacityMinMax.x)), WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1624 < (uint)170000), _1624, 0)) + 0u))]._borderFlickerOpacityMinMax.y)) * _1612) * WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1642 < (uint)170000), _1642, 0)) + 0u))]._borderFlickerIntensity));
    } else {
      _1654 = _1612;
    }
    int _1656 = WaveReadLaneFirst(_materialIndex);
    float _1670 = min(max(_1530, 0.0f), 1.0f) * saturate(saturate(_1654) - (WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1656 < (uint)170000), _1656, 0)) + 0u))]._borderEdgeNoiseRatio) * _1574.x));
    int _1671 = WaveReadLaneFirst(_materialIndex);
    int _1679 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1671 < (uint)170000), _1671, 0)) + 0u))]._borderColor);
    float _1682 = float((uint)((uint)(((uint)((uint)(_1679)) >> 16) & 255)));
    float _1685 = float((uint)((uint)(((uint)((uint)(_1679)) >> 8) & 255)));
    float _1687 = float((uint)((uint)(_1679 & 255)));
    float _1712 = select(((_1682 * 0.003921568859368563f) < 0.040449999272823334f), (_1682 * 0.0003035269910469651f), exp2(log2((_1682 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    bool _1719 = (_1428) && (((_isPhotosensitiveMode_isAllolwBlood & 1) == 0));
    float _1720 = _1712 * 0.4000000059604645f;
    float _1727 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
    _1741 = ((((select(_1719, _1720, _1712) * _1727) - _1519) * _1670) + _1519);
    _1742 = ((((select(_1719, _1720, select(((_1685 * 0.003921568859368563f) < 0.040449999272823334f), (_1685 * 0.0003035269910469651f), exp2(log2((_1685 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) * _1727) - _1520) * _1670) + _1520);
    _1743 = ((((select(_1719, _1720, select(((_1687 * 0.003921568859368563f) < 0.040449999272823334f), (_1687 * 0.0003035269910469651f), exp2(log2((_1687 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) * _1727) - _1521) * _1670) + _1521);
  } else {
    _1741 = _1519;
    _1742 = _1520;
    _1743 = _1521;
  }
  [branch]
  if (!(!(_58 >= 0.0010000000474974513f))) {
    float _1746 = TEXCOORD.x + -0.5f;
    float _1747 = TEXCOORD.y + -0.5f;
    int _1752 = WaveReadLaneFirst(_materialIndex);
    int _1766 = WaveReadLaneFirst(_materialIndex);
    float _1779 = saturate(exp2(log2(abs(0.5f - TEXCOORD.x)) * WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1766 < (uint)170000), _1766, 0)) + 0u))]._statusVignettePower2)) * (sqrt((_1747 * _1747) + (_1746 * _1746)) / max(0.0010000000474974513f, (1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1752 < (uint)170000), _1752, 0)) + 0u))]._statusVignetteRadius2)))));
    float _1784 = saturate(_58 * 10.0f) * saturate(_1779 * 2.0f);
    float _1791 = (_1784 * (_474 - _1741)) + _1741;
    float _1792 = (_1784 * (_475 - _1742)) + _1742;
    float _1793 = (_1784 * (_476 - _1743)) + _1743;
    int _1794 = WaveReadLaneFirst(_materialIndex);
    int _1802 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1794 < (uint)170000), _1794, 0)) + 0u))]._statusVignetteColor2);
    float _1805 = float((uint)((uint)(((uint)((uint)(_1802)) >> 16) & 255)));
    float _1808 = float((uint)((uint)(((uint)((uint)(_1802)) >> 8) & 255)));
    float _1810 = float((uint)((uint)(_1802 & 255)));
    float _1835 = select(((_1805 * 0.003921568859368563f) < 0.040449999272823334f), (_1805 * 0.0003035269910469651f), exp2(log2((_1805 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    bool _1842 = (_1428) && (((_isPhotosensitiveMode_isAllolwBlood & 1) == 0));
    float _1843 = _1835 * 0.20000000298023224f;
    float _1850 = max(0.0010000000474974513f, _exposure0.x);
    float _1857 = saturate(_1779) * _58;
    _1865 = ((((select(_1842, _1843, _1835) / _1850) - _1791) * _1857) + _1791);
    _1866 = ((((select(_1842, _1843, select(((_1808 * 0.003921568859368563f) < 0.040449999272823334f), (_1808 * 0.0003035269910469651f), exp2(log2((_1808 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) / _1850) - _1792) * _1857) + _1792);
    _1867 = ((((select(_1842, _1843, select(((_1810 * 0.003921568859368563f) < 0.040449999272823334f), (_1810 * 0.0003035269910469651f), exp2(log2((_1810 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) / _1850) - _1793) * _1857) + _1793);
  } else {
    _1865 = _1741;
    _1866 = _1742;
    _1867 = _1743;
  }
  [branch]
  if (!(!(_49 >= 0.0010000000474974513f))) {
    float _1870 = TEXCOORD.x + -0.5f;
    float _1871 = TEXCOORD.y + -0.5f;
    int _1876 = WaveReadLaneFirst(_materialIndex);
    int _1889 = WaveReadLaneFirst(_materialIndex);
    float _1902 = saturate(exp2(log2(1.0f - TEXCOORD.y) * WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1889 < (uint)170000), _1889, 0)) + 0u))]._statusVignettePower1)) * (sqrt((_1871 * _1871) + (_1870 * _1870)) / max(0.0010000000474974513f, (1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1876 < (uint)170000), _1876, 0)) + 0u))]._statusVignetteRadius1)))));
    float _1905 = saturate(_49 * 10.0f) * _1902;
    float _1912 = (_1905 * (_474 - _1865)) + _1865;
    float _1913 = (_1905 * (_475 - _1866)) + _1866;
    float _1914 = (_1905 * (_476 - _1867)) + _1867;
    int _1915 = WaveReadLaneFirst(_materialIndex);
    int _1923 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1915 < (uint)170000), _1915, 0)) + 0u))]._statusVignetteColor1);
    float _1926 = float((uint)((uint)(((uint)((uint)(_1923)) >> 16) & 255)));
    float _1929 = float((uint)((uint)(((uint)((uint)(_1923)) >> 8) & 255)));
    float _1931 = float((uint)((uint)(_1923 & 255)));
    float _1956 = select(((_1926 * 0.003921568859368563f) < 0.040449999272823334f), (_1926 * 0.0003035269910469651f), exp2(log2((_1926 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    bool _1963 = (_1428) && (((_isPhotosensitiveMode_isAllolwBlood & 1) == 0));
    float _1964 = _1956 * 0.20000000298023224f;
    float _1971 = max(0.0010000000474974513f, _exposure0.x);
    float _1978 = saturate(_1902) * _49;
    _1986 = ((((select(_1963, _1964, _1956) / _1971) - _1912) * _1978) + _1912);
    _1987 = ((((select(_1963, _1964, select(((_1929 * 0.003921568859368563f) < 0.040449999272823334f), (_1929 * 0.0003035269910469651f), exp2(log2((_1929 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) / _1971) - _1913) * _1978) + _1913);
    _1988 = ((((select(_1963, _1964, select(((_1931 * 0.003921568859368563f) < 0.040449999272823334f), (_1931 * 0.0003035269910469651f), exp2(log2((_1931 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) / _1971) - _1914) * _1978) + _1914);
  } else {
    _1986 = _1865;
    _1987 = _1866;
    _1988 = _1867;
  }
  [branch]
  if (!(!(_67 >= 0.0010000000474974513f))) {
    float _1991 = TEXCOORD.x + -0.5f;
    float _1992 = TEXCOORD.y + -0.5f;
    int _1997 = WaveReadLaneFirst(_materialIndex);
    int _2009 = WaveReadLaneFirst(_materialIndex);
    float _2022 = saturate(exp2(log2(TEXCOORD.y) * WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2009 < (uint)170000), _2009, 0)) + 0u))]._statusVignettePower3)) * (sqrt((_1992 * _1992) + (_1991 * _1991)) / max(0.0010000000474974513f, (1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1997 < (uint)170000), _1997, 0)) + 0u))]._statusVignetteRadius3)))));
    float _2025 = saturate(_67 * 10.0f) * _2022;
    float _2032 = (_2025 * (_474 - _1986)) + _1986;
    float _2033 = (_2025 * (_475 - _1987)) + _1987;
    float _2034 = (_2025 * (_476 - _1988)) + _1988;
    int _2035 = WaveReadLaneFirst(_materialIndex);
    int _2043 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2035 < (uint)170000), _2035, 0)) + 0u))]._statusVignetteColor3);
    float _2046 = float((uint)((uint)(((uint)((uint)(_2043)) >> 16) & 255)));
    float _2049 = float((uint)((uint)(((uint)((uint)(_2043)) >> 8) & 255)));
    float _2051 = float((uint)((uint)(_2043 & 255)));
    float _2076 = select(((_2046 * 0.003921568859368563f) < 0.040449999272823334f), (_2046 * 0.0003035269910469651f), exp2(log2((_2046 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    bool _2083 = (_1428) && (((_isPhotosensitiveMode_isAllolwBlood & 1) == 0));
    float _2084 = _2076 * 0.20000000298023224f;
    float _2091 = max(0.0010000000474974513f, _exposure0.x);
    float _2098 = saturate(_2022) * _67;
    _2106 = ((((select(_2083, _2084, _2076) / _2091) - _2032) * _2098) + _2032);
    _2107 = ((((select(_2083, _2084, select(((_2049 * 0.003921568859368563f) < 0.040449999272823334f), (_2049 * 0.0003035269910469651f), exp2(log2((_2049 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) / _2091) - _2033) * _2098) + _2033);
    _2108 = ((((select(_2083, _2084, select(((_2051 * 0.003921568859368563f) < 0.040449999272823334f), (_2051 * 0.0003035269910469651f), exp2(log2((_2051 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) / _2091) - _2034) * _2098) + _2034);
  } else {
    _2106 = _1986;
    _2107 = _1987;
    _2108 = _1988;
  }
  [branch]
  if (!(!(_hideStateRatio >= 0.0010000000474974513f))) {
    float _2113 = _hideStateRatio * 0.5f;
    float _2114 = TEXCOORD.x + -0.5f;
    float _2115 = TEXCOORD.y + -0.5f;
    float _2123 = saturate(((_2113 + -0.5f) + sqrt((_2115 * _2115) + (_2114 * _2114))) * 2.0f);
    float _2131 = saturate(((saturate(abs(0.5f - TEXCOORD.y) * 2.0f) - _2123) * 0.5f) + _2123);
    float _2139 = (((_2131 * _2131) * 0.8999999761581421f) * saturate(_hideStateRatio * 4.0f)) * (3.0f - (_2131 * 2.0f));
    float _2142 = dot(float3(_2106, _2107, _2108), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f)) * (1.0f - _2113);
    float _2145 = (pow(_2139, 0.5f));
    float _2152 = ((_2142 - _2106) * _2145) + _2106;
    float _2153 = ((_2142 - _2107) * _2145) + _2107;
    float _2154 = ((_2142 - _2108) * _2145) + _2108;
    float _2158 = 0.0010000000474974513f / max(0.0010000000474974513f, _exposure0.x);
    _2169 = (lerp(_2152, _2158, _2139));
    _2170 = (lerp(_2153, _2158, _2139));
    _2171 = (lerp(_2154, _2158, _2139));
  } else {
    _2169 = _2106;
    _2170 = _2107;
    _2171 = _2108;
  }
  if (_followLearning > 0.0010000000474974513f) {
    int _2176 = WaveReadLaneFirst(_materialIndex);
    int _2184 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2176 < (uint)170000), _2176, 0)) + 0u))]._followLearningColor);
    float _2187 = float((uint)((uint)(((uint)((uint)(_2184)) >> 16) & 255)));
    float _2190 = float((uint)((uint)(((uint)((uint)(_2184)) >> 8) & 255)));
    float _2192 = float((uint)((uint)(_2184 & 255)));
    float _2222 = max(0.0010000000474974513f, _exposure0.x);
    float _2223 = select(((_2187 * 0.003921568859368563f) < 0.040449999272823334f), (_2187 * 0.0003035269910469651f), exp2(log2((_2187 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _2222;
    float _2224 = select(((_2190 * 0.003921568859368563f) < 0.040449999272823334f), (_2190 * 0.0003035269910469651f), exp2(log2((_2190 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _2222;
    float _2225 = select(((_2192 * 0.003921568859368563f) < 0.040449999272823334f), (_2192 * 0.0003035269910469651f), exp2(log2((_2192 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _2222;
    int _2226 = WaveReadLaneFirst(_materialIndex);
    int _2234 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2226 < (uint)170000), _2226, 0)) + 0u))]._followLearningNoiseTex);
    float4 _2245 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_254 < (uint)65000), _254, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_238, ((_time.x * 0.20000000298023224f) + _239)));
    float _2252 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_238, _239));
    float _2255 = (_238 * 2.0f) + -1.0f;
    float _2257 = 1.0f - (_239 * 2.0f);
    float _2258 = max(1.0000000116860974e-07f, _2252.x);
    float _2294 = mad((_invViewProj[3].z), _2258, mad((_invViewProj[3].y), _2257, ((_invViewProj[3].x) * _2255))) + (_invViewProj[3].w);
    uint _2303 = uint(_bufferSizeAndInvSize.x * _238);
    uint _2304 = uint(_bufferSizeAndInvSize.y * _239);
    uint4 _2306 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_2303), (int)(_2304), 0));
    float4 _2309 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_2303), (int)(_2304), 0));
    float _2327 = (saturate(_2309.x * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _2328 = (saturate(_2309.y * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _2329 = (saturate(_2309.z * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _2331 = rsqrt(dot(float3(_2327, _2328, _2329), float3(_2327, _2328, _2329)));
    float _2332 = _2331 * _2327;
    float _2333 = _2331 * _2328;
    float _2334 = _2329 * _2331;
    float _2337 = (float((uint)((uint)(((uint)((uint)(_2306.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
    float _2338 = (float((uint)((uint)(_2306.w & 255))) * 0.007843137718737125f) + -1.0f;
    float _2341 = (_2337 + _2338) * 0.5f;
    float _2342 = (_2337 - _2338) * 0.5f;
    float _2346 = (1.0f - abs(_2341)) - abs(_2342);
    float _2348 = rsqrt(dot(float3(_2341, _2342, _2346), float3(_2341, _2342, _2346)));
    float _2349 = _2348 * _2341;
    float _2350 = _2348 * _2342;
    float _2351 = _2348 * _2346;
    float _2353 = select((_2334 >= 0.0f), 1.0f, -1.0f);
    float _2356 = -0.0f - (1.0f / (_2353 + _2334));
    float _2357 = _2333 * _2356;
    float _2358 = _2357 * _2332;
    float _2359 = _2353 * _2332;
    float _2368 = mad(_2351, _2332, mad(_2350, _2358, ((((_2359 * _2332) * _2356) + 1.0f) * _2349)));
    float _2372 = mad(_2351, _2333, mad(_2350, (_2353 + (_2357 * _2333)), ((_2349 * _2353) * _2358)));
    float _2376 = mad(_2351, _2334, mad(_2350, (-0.0f - _2333), (-0.0f - (_2359 * _2349))));
    float _2378 = rsqrt(dot(float3(_2368, _2372, _2376), float3(_2368, _2372, _2376)));
    float _2380 = _2378 * _2372;
    float _2381 = _2378 * _2376;
    float _2384 = _time.x * 0.5f;
    float _2387 = (((mad((_invViewProj[2].z), _2258, mad((_invViewProj[2].y), _2257, ((_invViewProj[2].x) * _2255))) + (_invViewProj[2].w)) / _2294) - _2384) * 0.20000000298023224f;
    float _2388 = (((mad((_invViewProj[1].z), _2258, mad((_invViewProj[1].y), _2257, ((_invViewProj[1].x) * _2255))) + (_invViewProj[1].w)) / _2294) - _2384) * 0.20000000298023224f;
    float4 _2395 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_2234 < (uint)65000), _2234, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_2387, _2388));
    float _2398 = (((mad((_invViewProj[0].z), _2258, mad((_invViewProj[0].y), _2257, ((_invViewProj[0].x) * _2255))) + (_invViewProj[0].w)) / _2294) - _2384) * 0.20000000298023224f;
    float4 _2399 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_2234 < (uint)65000), _2234, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_2398, _2387));
    float4 _2401 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_2234 < (uint)65000), _2234, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_2398, _2388));
    float _2407 = (abs(_2380) * (_2399.w - _2395.w)) + _2395.w;
    float _2410 = ((_2401.w - _2407) * abs(_2381)) + _2407;
    float _2411 = _2245.z + -0.5f;
    float _2416 = _238 + -0.5f;
    float _2418 = _239 + -0.5f;
    float _2423 = 0.375f - (_2411 * 0.25f);
    float _2426 = max((abs(((_2245.x + -0.5f) * 0.10000000149011612f) + _2416) - _2423), 0.0f);
    float _2427 = max((abs(((_2245.y + -0.5f) * 0.10000000149011612f) + _2418) - _2423), 0.0f);
    float _2432 = saturate(sqrt((_2427 * _2427) + (_2426 * _2426)));
    float _2436 = saturate(_followLearning * 2.0f);
    float _2442 = saturate(((((_2252.x * 100.0f) * _2436) - _2410) * 2.0f) + -0.5f);
    float _2452 = sqrt((_2418 * _2418) + (_2416 * _2416));
    float _2455 = ((saturate((_2436 * 2.0f) + -1.0f) * (1.0f - _2442)) + _2442) * saturate(_2452 + 0.5f);
    float _2457 = atan(_2418 / _2416);
    bool _2460 = (_2416 < 0.0f);
    bool _2461 = (_2416 == 0.0f);
    bool _2462 = (_2418 >= 0.0f);
    bool _2463 = (_2418 < 0.0f);
    float _2475 = _2410 * 0.5f;
    float4 _2488 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_2234 < (uint)65000), _2234, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((((_2411 * -0.5f) - _2475) - (_time.x * 0.20000000298023224f)) + select(((_2461) && (_2462)), 7.5f, select(((_2461) && (_2463)), -7.5f, (select(((_2460) && (_2463)), (_2457 + -3.1415927410125732f), select(((_2460) && (_2462)), (_2457 + 3.1415927410125732f), _2457)) * 4.774648189544678f)))), (((((_2245.w + -0.5f) * -0.5f) - _2475) + (_2452 * 2.0f)) - (_time.x * 1.5f))));
    float4 _2498 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * _238), int(_customRenderPassSizeInvSize.y * _239), 0));
    float _2502 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_238, _239));
    if (!(_965 == _renderPassSelfPlayer)) {
      _2523 = (_965 != _renderPassTest);
    } else {
      _2523 = false;
    }
    bool _2524 = !((1.0f - saturate(ceil(((_nearFarProj.x / max(1.0000000116860974e-07f, _2502.x)) + 0.5f) - (_nearFarProj.x / max(1.0000000116860974e-07f, _2498.x))))) == 0.0f);
    bool _2525 = (_2524) || (_2523);
    if (_965 == _renderPassTargetFocus) {
      if (_2524) {
        _2539 = (_965 != _renderPassAimHighlight);
      } else {
        _2539 = false;
      }
    } else {
      if ((_2524) || ((_965 != _renderPassLearning))) {
        _2539 = (_965 != _renderPassAimHighlight);
      } else {
        _2539 = false;
      }
    }
    float _2541 = saturate(_followLearning * 4.0f);
    float _2548 = (_2541 * (_242.x - _2169)) + _2169;
    float _2549 = (_2541 * (_242.y - _2170)) + _2170;
    float _2550 = (_2541 * (_242.z - _2171)) + _2171;
    bool _2551 = (_2525) && (_2539);
    if (_2551) {
      float _2558 = ((_followLearning * 0.25f) * _2488.w) * saturate(_2452 - (_2541 * 0.20000000298023224f));
      float4 _2562 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_2558 + _238), (_2558 + _239)));
      float _2576 = 1.0f - (_followLearning * 0.75f);
      _2586 = ((lerp(_2548, _2562.x, _2541)) * _2576);
      _2587 = ((lerp(_2549, _2562.y, _2541)) * _2576);
      _2588 = ((lerp(_2550, _2562.z, _2541)) * _2576);
      _2589 = _2455;
    } else {
      if (_2525) {
        _2586 = _2548;
        _2587 = _2549;
        _2588 = _2550;
        _2589 = select(_2539, _2455, 0.0f);
      } else {
        _2586 = _2548;
        _2587 = _2549;
        _2588 = _2550;
        _2589 = (_2455 * 0.4000000059604645f);
      }
    }
    float _2590 = dot(float3(_2586, _2587, _2588), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
    float _2597 = ((_2590 - _2586) * _2589) + _2586;
    float _2598 = ((_2590 - _2587) * _2589) + _2587;
    float _2599 = ((_2590 - _2588) * _2589) + _2588;
    float _2601 = _2410 * (_2245.z * 0.30000001192092896f);
    float _2607 = saturate(_2589 * 5.0f) * 0.8999999761581421f;
    float _2614 = (((_2601 * _2223) - _2597) * _2607) + _2597;
    float _2615 = (((_2601 * _2224) - _2598) * _2607) + _2598;
    float _2616 = (((_2601 * _2225) - _2599) * _2607) + _2599;
    int _2617 = WaveReadLaneFirst(_materialIndex);
    int _2625 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2617 < (uint)170000), _2617, 0)) + 0u))]._followLearningSaturationTone);
    float _2628 = float((uint)((uint)(((uint)((uint)(_2625)) >> 16) & 255)));
    float _2631 = float((uint)((uint)(((uint)((uint)(_2625)) >> 8) & 255)));
    float _2633 = float((uint)((uint)(_2625 & 255)));
    float _2658 = select(((_2628 * 0.003921568859368563f) < 0.040449999272823334f), (_2628 * 0.0003035269910469651f), exp2(log2((_2628 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _2659 = select(((_2631 * 0.003921568859368563f) < 0.040449999272823334f), (_2631 * 0.0003035269910469651f), exp2(log2((_2631 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _2660 = select(((_2633 * 0.003921568859368563f) < 0.040449999272823334f), (_2633 * 0.0003035269910469651f), exp2(log2((_2633 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _2664 = (1.0f - _2658) * 0.3086000084877014f;
    float _2666 = (1.0f - _2659) * 0.6093999743461609f;
    float _2668 = (1.0f - _2660) * 0.0820000022649765f;
    float _2673 = _2664 * _2614;
    float _2686 = (_followLearning * (mad(_2616, _2668, mad(_2615, _2666, ((_2664 + _2658) * _2614))) - _2614)) + _2614;
    float _2687 = (_followLearning * (mad(_2616, _2668, mad(_2615, (_2666 + _2659), _2673)) - _2615)) + _2615;
    float _2688 = (_followLearning * (mad(_2616, (_2668 + _2660), mad(_2615, _2666, _2673)) - _2616)) + _2616;
    if (!_2551) {
      float _2702 = saturate(1.0f - dot(float3((_2475 + (_2378 * _2368)), (_2475 + _2380), (_2475 + _2381)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
      float _2707 = select(_2525, ((_2702 * _2702) * 6.0f), (_2702 * 0.25f)) * _2702;
      float _2711 = (_followLearning * _followLearning) * saturate(_2410 * 10.0f);
      _2722 = (((_2711 * _2223) * _2707) + _2686);
      _2723 = (((_2711 * _2224) * _2707) + _2687);
      _2724 = (((_2711 * _2225) * _2707) + _2688);
    } else {
      _2722 = _2686;
      _2723 = _2687;
      _2724 = _2688;
    }
    float _2725 = _followLearning * _2432;
    float _2729 = 0.0010000000474974513f / max(0.0010000000474974513f, _exposure0.x);
    float _2736 = ((_2729 - _2722) * _2725) + _2722;
    float _2737 = ((_2729 - _2723) * _2725) + _2723;
    float _2738 = ((_2729 - _2724) * _2725) + _2724;
    float _2743 = saturate(((_2488.w * _2488.w) * 20.0f) * _followLearning) * _2432;
    _2754 = (lerp(_2736, _2223, _2743));
    _2755 = (lerp(_2737, _2224, _2743));
    _2756 = (lerp(_2738, _2225, _2743));
  } else {
    _2754 = _2169;
    _2755 = _2170;
    _2756 = _2171;
  }
  [branch]
  if ((dot(float4(_enemyAlert1.x, _enemyAlert1.y, _enemyAlert1.z, _enemyAlert1.w), float4(1.0f, 1.0f, 1.0f, 1.0f)) > 0.0f) | (dot(float4(_enemyAlert2.x, _enemyAlert2.y, _enemyAlert2.z, _enemyAlert2.w), float4(1.0f, 1.0f, 1.0f, 1.0f)) > 0.0f)) {
    bool _2776 = ((_isPhotosensitiveMode_isAllolwBlood & 1) != 0);
    float _2782 = max(0.0010000000474974513f, _exposure0.x);
    float4 _2799 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_254 < (uint)65000), _254, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((TEXCOORD.x * 2.0f) * _35), ((_time.x * 0.10000000149011612f) + (TEXCOORD.y * 2.0f))));
    float _2802 = _2799.x + -0.5f;
    float _2803 = _2799.y + -0.5f;
    float _2813 = 0.44999998807907104f - (_2802 * 0.004999999888241291f);
    float _2816 = max((abs((TEXCOORD.x + -0.5f) + (_2802 * 0.019999999552965164f)) - _2813), 0.0f);
    float _2817 = max((abs((TEXCOORD.y + -0.5f) + (_2803 * 0.019999999552965164f)) - _2813), 0.0f);
    int _2828 = WaveReadLaneFirst(_materialIndex);
    int _2836 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2828 < (uint)170000), _2828, 0)) + 0u))]._enemyAlertTex);
    float4 _2843 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_2836 < (uint)65000), _2836, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - (_2803 * 0.029999999329447746f)), (TEXCOORD.y - (_2802 * 0.029999999329447746f))));
    bool _2848 = (TEXCOORD.y > 0.5f);
    bool _2850 = (TEXCOORD.x < 0.5f);
    bool _2854 = (TEXCOORD.y < 0.5f);
    bool _2862 = (TEXCOORD.x > 0.5f);
    float _2886 = saturate(dot(float4((_2843.x * float((bool)(uint)(_2854))), (_2843.y * float((bool)((uint)((_2862) && (_2854))))), (_2843.z * float((bool)(uint)(_2862))), (_2843.w * float((bool)((uint)((_2862) && (_2848)))))), float4(_enemyAlert2.x, _enemyAlert2.y, _enemyAlert2.z, _enemyAlert2.w)) + dot(float4((_2843.x * float((bool)(uint)(_2848))), (_2843.y * float((bool)((uint)((_2850) && (_2848))))), (_2843.z * float((bool)(uint)(_2850))), (_2843.w * float((bool)((uint)((_2850) && (_2854)))))), float4(_enemyAlert1.x, _enemyAlert1.y, _enemyAlert1.z, _enemyAlert1.w))) * saturate(sqrt((_2817 * _2817) + (_2816 * _2816)) * 20.0f);
    float _2888 = (_2886 * _2886) * _2886;
    _2899 = ((_2888 * ((select(_2776, 0.09989875555038452f, 0.08437622338533401f) / _2782) - _2754)) + _2754);
    _2900 = ((_2888 * ((select(_2776, 0.027320895344018936f, 0.030713455751538277f) / _2782) - _2755)) + _2755);
    _2901 = ((_2888 * ((select(_2776, 0.04817182570695877f, 0.07036010921001434f) / _2782) - _2756)) + _2756);
  } else {
    _2899 = _2754;
    _2900 = _2755;
    _2901 = _2756;
  }
  uint _2902 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _2909 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_2902), 0));
    _2915 = (float((uint)((uint)(_2909.x & 127))) + 0.5f);
  } else {
    _2915 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_2899, _2900, _2901));
    _3283 = output_color.x;
    _3284 = output_color.y;
    _3285 = output_color.z;
  } else {
    _3283 = _2899;
    _3284 = _2900;
    _3285 = _2901;
  }
  if (_etcParams.y > 1.0f) {
    float _3296 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _3297 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _3301 = saturate(1.0f - (dot(float2(_3296, _3297), float2(_3296, _3297)) * saturate(_etcParams.y + -1.0f)));
    _3306 = (_3301 * _3283);
    _3307 = (_3301 * _3284);
    _3308 = (_3301 * _3285);
  } else {
    _3306 = _3283;
    _3307 = _3284;
    _3308 = _3285;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _3341 = select((_3306 <= 0.0031308000907301903f), (_3306 * 12.920000076293945f), (((pow(_3306, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _3342 = select((_3307 <= 0.0031308000907301903f), (_3307 * 12.920000076293945f), (((pow(_3307, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _3343 = select((_3308 <= 0.0031308000907301903f), (_3308 * 12.920000076293945f), (((pow(_3308, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _3341 = _3306;
    _3342 = _3307;
    _3343 = _3308;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _3348 = float((uint)_2902);
    if (!(_3348 < _viewDir.w)) {
      if (!(_3348 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _3357 = _3341;
        _3358 = _3342;
        _3359 = _3343;
      } else {
        _3357 = 0.0f;
        _3358 = 0.0f;
        _3359 = 0.0f;
      }
    } else {
      _3357 = 0.0f;
      _3358 = 0.0f;
      _3359 = 0.0f;
    }
  } else {
    _3357 = _3341;
    _3358 = _3342;
    _3359 = _3343;
  }
  SV_Target.x = _3357;
  SV_Target.y = _3358;
  SV_Target.z = _3359;
  SV_Target.w = _2915;
  return SV_Target;
}