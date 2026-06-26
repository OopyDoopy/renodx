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

Texture2D<float4> __3__36__0__0__g_noiseTex : register(t26, space36);

Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t69, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t32, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t40, space36);

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

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

SamplerState __0__4__0__0__g_staticPointWrap : register(s8, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _36 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  int _42 = WaveReadLaneFirst(_materialIndex);
  float _50 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_42 < (uint)170000), _42, 0)) + 0u))]._statusVignetteRatio1);
  int _51 = WaveReadLaneFirst(_materialIndex);
  float _59 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_51 < (uint)170000), _51, 0)) + 0u))]._statusVignetteRatio2);
  int _60 = WaveReadLaneFirst(_materialIndex);
  float _68 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_60 < (uint)170000), _60, 0)) + 0u))]._statusVignetteRatio3);
  int _69 = WaveReadLaneFirst(_materialIndex);
  float _81 = float((uint)(uint)(_enableChromaticAberration)) * WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_69 < (uint)170000), _69, 0)) + 0u))]._statusVignetteChromaticShift1);
  int _82 = WaveReadLaneFirst(_materialIndex);
  float _94 = float((uint)(uint)(_enableChromaticAberration)) * WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_82 < (uint)170000), _82, 0)) + 0u))]._statusVignetteChromaticShift2);
  int _95 = WaveReadLaneFirst(_materialIndex);
  float _107 = float((uint)(uint)(_enableChromaticAberration)) * WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_95 < (uint)170000), _95, 0)) + 0u))]._statusVignetteChromaticShift3);
  int _108 = WaveReadLaneFirst(_materialIndex);
  float _120 = float((uint)(uint)(_enableChromaticAberration)) * WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_108 < (uint)170000), _108, 0)) + 0u))]._chromaticAberrationRatio);
  int _121 = WaveReadLaneFirst(_materialIndex);
  float _129 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_121 < (uint)170000), _121, 0)) + 0u))]._chromaticAberrationShiftValue);
  int _130 = WaveReadLaneFirst(_materialIndex);
  int _139 = WaveReadLaneFirst(_materialIndex);
  float _147 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_139 < (uint)170000), _139, 0)) + 0u))]._fishEyeMaxPower);
  float _174;
  float _213;
  float _214;
  float _217;
  float _218;
  float _239;
  float _240;
  float _346;
  float _347;
  float _348;
  float _383;
  float _468;
  float _469;
  float _470;
  float _547;
  float _548;
  float _549;
  float _636;
  float _637;
  float _638;
  float _700;
  float _701;
  float _702;
  float _703;
  float _704;
  float _705;
  float _775;
  float _776;
  float _777;
  float _834;
  float _835;
  float _1072;
  float _1073;
  float _1074;
  float _1107;
  float _1108;
  float _1109;
  int _1110;
  float _1287;
  float _1288;
  float _1289;
  float _1388;
  float _1389;
  float _1390;
  float _1430;
  float _1431;
  float _1432;
  float _1567;
  float _1568;
  float _1569;
  float _1631;
  float _1632;
  float _1633;
  float _1634;
  float _1635;
  float _1636;
  float _1835;
  float _1922;
  float _1923;
  float _1924;
  float _2046;
  float _2047;
  float _2048;
  float _2167;
  float _2168;
  float _2169;
  float _2287;
  float _2288;
  float _2289;
  float _2350;
  float _2351;
  float _2352;
  bool _2704;
  bool _2721;
  float _2804;
  float _2805;
  float _2806;
  float _2807;
  float _2940;
  float _2941;
  float _2942;
  float _2972;
  float _2973;
  float _2974;
  float _3117;
  float _3118;
  float _3119;
  float _3133;
  float _3338;
  float _3339;
  float _3340;
  float _3433;
  float _3434;
  float _3435;
  float _3489;
  float _3490;
  float _3491;
  float _3510;
  float _3511;
  float _3512;
  float _3542;
  float _3543;
  float _3544;
  float _3558;
  float _3559;
  float _3560;
  [branch]
  if ((((_147 > 0.0010000000474974513f)) || ((_147 < -0.0010000000474974513f))) | (_followLearning > 0.0010000000474974513f)) {
    float _156 = 0.5f / _36;
    float _161 = ((_srcTargetSizeAndInv.x * TEXCOORD.x) / _srcTargetSizeAndInv.x) + -0.5f;
    float _162 = ((_srcTargetSizeAndInv.y * TEXCOORD.y) / _srcTargetSizeAndInv.x) - _156;
    float _163 = dot(float2(_161, _162), float2(_161, _162));
    float _164 = sqrt(_163);
    if (_followLearning > 0.0010000000474974513f) {
      _174 = ((pow(_followLearning, 0.25f)) * 1.5f);
    } else {
      _174 = _147;
    }
    if (_174 > 0.0f) {
      float _178 = sqrt(dot(float2(0.5f, _156), float2(0.5f, _156)));
      float _183 = tan(_174 * _164) * (rsqrt(_163) * _178);
      float _187 = tan(_178 * _174);
      _213 = (((_183 * _161) / _187) + 0.5f);
      _214 = (((_183 * _162) / _187) + _156);
    } else {
      if (_174 < 0.0f) {
        float _196 = select((_36 < 1.0f), 0.5f, _156);
        float _202 = atan((_174 * _164) * -10.0f) * (rsqrt(_163) * _196);
        float _207 = atan((_174 * -10.0f) * _196);
        _213 = (((_202 * _161) / _207) + 0.5f);
        _214 = (((_202 * _162) / _207) + _156);
      } else {
        _213 = 0.0f;
        _214 = 0.0f;
      }
    }
    _217 = _213;
    _218 = (_214 * _36);
  } else {
    _217 = TEXCOORD.x;
    _218 = TEXCOORD.y;
  }
  int _219 = WaveReadLaneFirst(_materialIndex);
  float _227 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_219 < (uint)170000), _219, 0)) + 0u))]._uiQuickSlotEffect);
  if (!(!(_227 >= 0.0010000000474974513f))) {
    _239 = ((_227 * (0.029999999329447746f - (_217 * 0.06000000238418579f))) + _217);
    _240 = ((_227 * (0.029999999329447746f - (_218 * 0.06000000238418579f))) + _218);
  } else {
    _239 = _217;
    _240 = _218;
  }
  float4 _243 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(_239, _240));
  float _253 = (pow(_243.x, 0.012683313339948654f));
  float _254 = (pow(_243.y, 0.012683313339948654f));
  float _255 = (pow(_243.z, 0.012683313339948654f));
  float _280 = exp2(log2(max(0.0f, (_253 + -0.8359375f)) / (18.8515625f - (_253 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _281 = exp2(log2(max(0.0f, (_254 + -0.8359375f)) / (18.8515625f - (_254 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _282 = exp2(log2(max(0.0f, (_255 + -0.8359375f)) / (18.8515625f - (_255 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  int _283 = WaveReadLaneFirst(_materialIndex);
  int _291 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_283 < (uint)170000), _283, 0)) + 0u))]._noiseTex);
  [branch]
  if (!(!(_fleeCount >= 0.0010000000474974513f))) {
    float4 _315 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_291 < (uint)65000), _291, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((TEXCOORD.x * 4.0f), ((((_fleeCount * 0.0010000000474974513f) + -0.10000000149011612f) + ((TEXCOORD.y / _36) * 4.0f)) + (_time.x * 0.019999999552965164f))));
    float _324 = (TEXCOORD.x + -0.5f) + ((_315.x + -0.5f) * 0.15000000596046448f);
    float _325 = (TEXCOORD.y + -0.5f) + ((_315.y + -0.5f) * 0.15000000596046448f);
    float _338 = saturate(_fleeCount * 0.20000000298023224f) * saturate((((_fleeCount * 0.004999999888241291f) + -0.6000000238418579f) + sqrt((_324 * _324) + (_325 * _325))) / ((_fleeCount * 0.004000000189989805f) + 0.10000000149011612f));
    _346 = (_280 - (_338 * _280));
    _347 = (_281 - (_338 * _281));
    _348 = (_282 - (_338 * _282));
  } else {
    _346 = _280;
    _347 = _281;
    _348 = _282;
  }
  int _349 = WaveReadLaneFirst(_materialIndex);
  if (((_227 >= 0.0010000000474974513f)) || ((WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_349 < (uint)170000), _349, 0)) + 0u))]._uiMainMenuEffect) >= 0.0010000000474974513f))) {
    int _362 = WaveReadLaneFirst(_materialIndex);
    if (WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_362 < (uint)170000), _362, 0)) + 0u))]._uiMainMenuEffect) > _227) {
      int _373 = WaveReadLaneFirst(_materialIndex);
      _383 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_373 < (uint)170000), _373, 0)) + 0u))]._uiMainMenuEffect);
    } else {
      _383 = _227;
    }
    float _391 = _383 * 0.5f;
    float4 _415 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_291 < (uint)65000), _291, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((TEXCOORD.x * 2.0f) * _36), (TEXCOORD.y * 2.0f)));
    int _420 = WaveReadLaneFirst(_materialIndex);
    bool _430 = (_227 < 0.0010000000474974513f);
    bool _431 = (_430) && ((WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_420 < (uint)170000), _420, 0)) + 0u))]._uiMainMenuEffect) >= 0.0010000000474974513f));
    int _433 = WaveReadLaneFirst(_materialIndex);
    float _451 = (TEXCOORD.y - select(_431, 0.550000011920929f, 0.5f)) - ((_415.y + -0.5f) * 0.05000000074505806f);
    float _452 = ((TEXCOORD.x - ((_415.x + -0.5f) * 0.05000000074505806f)) + select(_431, -0.41999998688697815f, -0.5f)) * _36;
    float _463 = ((_383 * -0.8999999761581421f) * (1.0f - saturate((select(((_430) && ((WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_433 < (uint)170000), _433, 0)) + 0u))]._uiMainMenuEffect) >= 0.0010000000474974513f))), 0.3499999940395355f, 0.4000000059604645f) - sqrt((_452 * _452) + (_451 * _451))) * 1.4285714626312256f))) + 1.0f;
    _468 = (_463 * ((_391 * (((_347 * 0.75f) - (_346 * 0.6069999933242798f)) + (_348 * 0.1889999955892563f))) + _346));
    _469 = (_463 * ((_391 * (((_346 * 0.3490000069141388f) - (_347 * 0.3140000104904175f)) + (_348 * 0.1679999977350235f))) + _347));
    _470 = (_463 * ((_391 * (((_346 * 0.2720000147819519f) + (_347 * 0.5339999794960022f)) - (_348 * 0.8690000176429749f))) + _348));
  } else {
    _468 = _346;
    _469 = _347;
    _470 = _348;
  }
  if ((((_50 >= 0.0010000000474974513f)) && ((_81 >= 0.0010000000474974513f))) | (((_59 >= 0.0010000000474974513f)) && ((_94 >= 0.0010000000474974513f))) | (((_68 >= 0.0010000000474974513f)) && ((_107 >= 0.0010000000474974513f)))) {
    float _485 = _239 + -0.5f;
    float _486 = _240 + -0.5f;
    float _495 = rsqrt(dot(float2(_485, _486), float2(_485, _486))) * ((max(max(_81, _94), _107) * 0.009999999776482582f) * sqrt((_486 * _486) + (_485 * _485)));
    float _496 = _495 * _485;
    float _498 = _495 * _486;
    float4 _504 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_239 - _496), (_240 - _498)));
    float _508 = (pow(_504.x, 0.012683313339948654f));
    float4 _518 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_239, _240));
    float _522 = (pow(_518.y, 0.012683313339948654f));
    float4 _532 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_496 + _239), (_498 + _240)));
    float _536 = (pow(_532.z, 0.012683313339948654f));
    _547 = (exp2(log2(max(0.0f, (_508 + -0.8359375f)) / (18.8515625f - (_508 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
    _548 = (exp2(log2(max(0.0f, (_522 + -0.8359375f)) / (18.8515625f - (_522 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
    _549 = (exp2(log2(max(0.0f, (_536 + -0.8359375f)) / (18.8515625f - (_536 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
  } else {
    _547 = _468;
    _548 = _469;
    _549 = _470;
  }
  if (((_120 >= 0.0010000000474974513f)) && ((_129 >= 0.0010000000474974513f))) {
    int _554 = WaveReadLaneFirst(_materialIndex);
    float _565 = _239 - WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_554 < (uint)170000), _554, 0)) + 0u))]._chromaticAberrationShiftPosition.x);
    float _566 = _240 - WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_554 < (uint)170000), _554, 0)) + 0u))]._chromaticAberrationShiftPosition.y);
    float _575 = rsqrt(dot(float2(_565, _566), float2(_565, _566))) * ((_129 * 0.009999999776482582f) * sqrt((_566 * _566) + (_565 * _565)));
    float _576 = _575 * _565;
    float _578 = _575 * _566;
    float4 _584 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_239 - _576), (_240 - _578)));
    float _588 = (pow(_584.x, 0.012683313339948654f));
    float4 _598 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_239, _240));
    float _602 = (pow(_598.y, 0.012683313339948654f));
    float4 _612 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_576 + _239), (_578 + _240)));
    float _616 = (pow(_612.z, 0.012683313339948654f));
    _636 = ((((exp2(log2(max(0.0f, (_588 + -0.8359375f)) / (18.8515625f - (_588 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _547) * _120) + _547);
    _637 = ((((exp2(log2(max(0.0f, (_602 + -0.8359375f)) / (18.8515625f - (_602 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _548) * _120) + _548);
    _638 = ((((exp2(log2(max(0.0f, (_616 + -0.8359375f)) / (18.8515625f - (_616 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _549) * _120) + _549);
  } else {
    _636 = _468;
    _637 = _469;
    _638 = _470;
  }
  int _639 = WaveReadLaneFirst(_materialIndex);
  float _647 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_639 < (uint)170000), _639, 0)) + 0u))]._detectModeG);
  int _648 = WaveReadLaneFirst(_materialIndex);
  float _656 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_648 < (uint)170000), _648, 0)) + 0u))]._detectModeR);
  int _657 = WaveReadLaneFirst(_materialIndex);
  float _665 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_657 < (uint)170000), _657, 0)) + 0u))]._detectModeB);
  int _666 = WaveReadLaneFirst(_materialIndex);
  float _674 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_666 < (uint)170000), _666, 0)) + 0u))]._detectModeKnowledge);
  int _675 = WaveReadLaneFirst(_materialIndex);
  float _683 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_675 < (uint)170000), _675, 0)) + 0u))]._detectModeInterrupt);
  float _688 = saturate((((_656 + _647) + _665) + _674) + _683);
  [branch]
  if (_688 > 0.0f) {
    if (!(_647 >= 0.0010000000474974513f)) {
      if (!(_656 >= 0.0010000000474974513f)) {
        if (!(_665 >= 0.0010000000474974513f)) {
          if (!(!(_674 >= 0.0010000000474974513f))) {
            _700 = 0.6000000238418579f;
            _701 = 0.6000000238418579f;
            _702 = 0.800000011920929f;
            _703 = 0.5f;
            _704 = 0.44999998807907104f;
            _705 = 0.949999988079071f;
          } else {
            _700 = 0.0f;
            _701 = 0.0f;
            _702 = 0.0f;
            _703 = 0.0f;
            _704 = 0.0f;
            _705 = 0.0f;
          }
        } else {
          _700 = 0.6000000238418579f;
          _701 = 0.699999988079071f;
          _702 = 0.699999988079071f;
          _703 = 0.6000000238418579f;
          _704 = 0.699999988079071f;
          _705 = 0.800000011920929f;
        }
      } else {
        _700 = 0.699999988079071f;
        _701 = 0.6000000238418579f;
        _702 = 0.6000000238418579f;
        _703 = 0.800000011920929f;
        _704 = 0.699999988079071f;
        _705 = 0.6000000238418579f;
      }
    } else {
      _700 = 0.6000000238418579f;
      _701 = 0.699999988079071f;
      _702 = 0.6000000238418579f;
      _703 = 0.6000000238418579f;
      _704 = 0.800000011920929f;
      _705 = 0.699999988079071f;
    }
    bool _706 = (_683 >= 0.0010000000474974513f);
    float _710 = select(_706, 0.800000011920929f, _703);
    float _711 = select(_706, 0.6000000238418579f, _704);
    float _712 = select(_706, 0.20000000298023224f, _705);
    float _719 = (1.0f - _710) * 0.3086000084877014f;
    float _721 = (1.0f - _711) * 0.6093999743461609f;
    float _723 = (1.0f - _712) * 0.0820000022649765f;
    float _725 = select(_706, 2.0f, _700) * _636;
    float _726 = select(_706, 2.0f, _701) * _637;
    float _727 = select(_706, 2.0f, _702) * _638;
    float _731 = _719 * _725;
    float _736 = 0.009999999776482582f / max(0.0010000000474974513f, _exposure0.x);
    float _746 = max((abs(TEXCOORD.x + -0.5f) + -0.07500000298023224f), 0.0f);
    float _747 = max((abs(TEXCOORD.y + -0.5f) + -0.07500000298023224f), 0.0f);
    float _755 = (_688 * 0.75f) * saturate(sqrt((_747 * _747) + (_746 * _746)) * 2.0f);
    float _762 = ((mad(_727, _723, mad(_726, _721, ((_719 + _710) * _725))) - _636) * _688) + _636;
    float _763 = ((mad(_727, _723, mad(_726, (_721 + _711), _731)) - _637) * _688) + _637;
    float _764 = ((mad(_727, (_723 + _712), mad(_726, _721, _731)) - _638) * _688) + _638;
    _775 = ((_755 * ((_736 * _710) - _762)) + _762);
    _776 = ((_755 * ((_736 * _711) - _763)) + _763);
    _777 = ((_755 * ((_736 * _712) - _764)) + _764);
  } else {
    _775 = _636;
    _776 = _637;
    _777 = _638;
  }
  if ((((((_highLightForVisionRemoteCatch > 0.0f)) || ((_highLightForVision > 0.0f)))) || ((_characterHighlight > 0.0f))) | (_followLearning > 0.0010000000474974513f)) {
    int2 _793; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_793.x, _793.y);
    uint _808 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_793.x))))) + 0.5f) * _239), int((float((int)(int(float((int)(_793.y))))) + 0.5f) * _240), 0));
    int _810 = _808.x & 255;
    float _818 = (float((uint)((uint)((uint)((uint)(_808.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
    float _819 = (float((uint)((uint)(((uint)((uint)(_808.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
    float _821 = 1.0f - abs(_818);
    float _822 = abs(_819);
    float _823 = _821 - _822;
    if (!(_823 >= 0.0f)) {
      _834 = (select((_818 >= 0.0f), 1.0f, -1.0f) * (1.0f - _822));
      _835 = (select((_819 >= 0.0f), 1.0f, -1.0f) * _821);
    } else {
      _834 = _818;
      _835 = _819;
    }
    float _837 = rsqrt(dot(float3(_834, _835, _823), float3(_834, _835, _823)));
    float _838 = _837 * _834;
    float _839 = _837 * _835;
    float _840 = _837 * _823;
    float _842 = rsqrt(dot(float3(_838, _839, _840), float3(_838, _839, _840)));
    float4 _848 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_239, _240));
    float _859 = (pow(_848.x, 0.012683313339948654f));
    float _860 = (pow(_848.y, 0.012683313339948654f));
    float _861 = (pow(_848.z, 0.012683313339948654f));
    float _886 = exp2(log2(max(0.0f, (_859 + -0.8359375f)) / (18.8515625f - (_859 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    float _887 = exp2(log2(max(0.0f, (_860 + -0.8359375f)) / (18.8515625f - (_860 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    float _888 = exp2(log2(max(0.0f, (_861 + -0.8359375f)) / (18.8515625f - (_861 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    [branch]
    if (_810 == _renderPassTest) {
      int _897 = WaveReadLaneFirst(_materialIndex);
      float _906 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_897 < (uint)170000), _897, 0)) + 0u))]._testEffectRatio) * (1.0f / max(0.0010000000474974513f, _exposure0.x));
      _1107 = (_906 + _775);
      _1108 = _776;
      _1109 = (_906 + _777);
      _1110 = _810;
    } else {
      if ((_810 == _renderPassDetectObjective) || ((!(_810 == _renderPassDetectObjective)) && (_810 == _renderPassKnowledgeNPC))) {
        float4 _929 = __3__36__0__0__g_noiseTex.SampleLevel(__0__4__0__0__g_staticPointWrap, float2(frac((TEXCOORD.x * 0.015625f) * _bufferSizeAndInvSize.x), frac((TEXCOORD.y * 0.015625f) * _bufferSizeAndInvSize.y)), 0.0f);
        float _932 = (_929.x * 0.5f) + 0.5f;
        _1107 = ((((_932 * _886) - _775) * _848.w) + _775);
        _1108 = ((((_932 * _887) - _776) * _848.w) + _776);
        _1109 = ((((_932 * _888) - _777) * _848.w) + _777);
        _1110 = _810;
      } else {
        bool __defer_945_1026 = false;
        if (!(_810 == _renderPassDetectRemoteCatch) || ((_810 == _renderPassDetectRemoteCatch) && (!(WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)(WaveReadLaneFirst(_materialIndex)) < (uint)170000), (WaveReadLaneFirst(_materialIndex)), 0)) + 0u))]._itemRatio) > 0.0010000000474974513f))) || (((_810 == _renderPassDetectRemoteCatch) && (WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)(WaveReadLaneFirst(_materialIndex)) < (uint)170000), (WaveReadLaneFirst(_materialIndex)), 0)) + 0u))]._itemRatio) > 0.0010000000474974513f)) && (!(((_highLightForVision > 0.0f)) || ((_highLightForVisionRemoteCatch > 0.0f)))))) {
          __defer_945_1026 = true;
        } else {
          int _967 = WaveReadLaneFirst(_materialIndex);
          int _975 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_967 < (uint)170000), _967, 0)) + 0u))]._detectColorBase);
          float _978 = float((uint)((uint)(((uint)((uint)(_975)) >> 16) & 255)));
          float _981 = float((uint)((uint)(((uint)((uint)(_975)) >> 8) & 255)));
          float _983 = float((uint)((uint)(_975 & 255)));
          float _1016 = max(0.0010000000474974513f, _exposure0.x);
          _1107 = ((((select(((_978 * 0.003921568859368563f) < 0.040449999272823334f), (_978 * 0.0003035269910469651f), exp2(log2((_978 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * 10.0f) / _1016) * _848.w) + _775);
          _1108 = ((((select(((_981 * 0.003921568859368563f) < 0.040449999272823334f), (_981 * 0.0003035269910469651f), exp2(log2((_981 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * 10.0f) / _1016) * _848.w) + _776);
          _1109 = ((((select(((_983 * 0.003921568859368563f) < 0.040449999272823334f), (_983 * 0.0003035269910469651f), exp2(log2((_983 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * 10.0f) / _1016) * _848.w) + _777);
          _1110 = _810;
        }
        if (__defer_945_1026) {
          bool _1029 = (_810 == _renderPassSelfPlayer);
          bool __defer_1026_1041 = false;
          if ((_1029) | (((_810 == _renderPassTest)) || ((_810 == _renderPassEnemy))) | (_810 == _renderPassDetectPickedRemoteCatch)) {
            __defer_1026_1041 = true;
          } else {
            _1107 = _775;
            _1108 = _776;
            _1109 = _777;
            _1110 = _810;
          }
          if (__defer_1026_1041) {
            if (((_characterHighlight > 0.0010000000474974513f)) || ((_highLightForVisionRemoteCatch > 0.0010000000474974513f))) {
              float _1058 = 1.0f - saturate(dot(float3((_842 * _838), (_842 * _839), (_842 * _840)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
              float _1059 = _1058 * _1058;
              float _1060 = _1059 * _1059;
              if (!_1029) {
                if (!(_810 == _renderPassTest)) {
                  bool _1067 = (_810 == _renderPassEnemy);
                  _1072 = select(_1067, 1.0f, 0.20000000298023224f);
                  _1073 = select(_1067, 0.30000001192092896f, 0.4000000059604645f);
                  _1074 = select(_1067, 0.30000001192092896f, 1.0f);
                } else {
                  _1072 = 1.0f;
                  _1073 = 1.0f;
                  _1074 = 1.0f;
                }
              } else {
                _1072 = 1.0f;
                _1073 = 1.0f;
                _1074 = 1.0f;
              }
              float _1081 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
              _1107 = ((((_886 - _775) + ((((_1081 + (_775 * 10.0f)) * _1072) - _886) * _1060)) * _848.w) + _775);
              _1108 = ((((_887 - _776) + ((((_1081 + (_776 * 10.0f)) * _1073) - _887) * _1060)) * _848.w) + _776);
              _1109 = ((((_888 - _777) + ((((_1081 + (_777 * 10.0f)) * _1074) - _888) * _1060)) * _848.w) + _777);
              _1110 = _810;
            } else {
              _1107 = _775;
              _1108 = _776;
              _1109 = _777;
              _1110 = _810;
            }
          }
        }
      }
    }
  } else {
    _1107 = _775;
    _1108 = _776;
    _1109 = _777;
    _1110 = 0;
  }
  if (!(!(_wantedRegionRatio >= 0.0010000000474974513f))) {
    [branch]
    if (!(!(_wantedRegionOpacity >= 0.0010000000474974513f))) {
      int _1119 = WaveReadLaneFirst(_materialIndex);
      int _1127 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1119 < (uint)170000), _1119, 0)) + 0u))]._wantedRegionColor);
      float _1130 = float((uint)((uint)(((uint)((uint)(_1127)) >> 16) & 255)));
      float _1133 = float((uint)((uint)(((uint)((uint)(_1127)) >> 8) & 255)));
      float _1135 = float((uint)((uint)(_1127 & 255)));
      float _1168 = max(0.0010000000474974513f, _exposure0.x);
      float _1176 = _wantedRegionRadius * _wantedRegionRatio;
      float _1178 = saturate(_1176) * 4.0f;
      float _1181 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_239, _240));
      float _1184 = (_239 * 2.0f) + -1.0f;
      float _1186 = 1.0f - (_240 * 2.0f);
      float _1187 = max(1.0000000116860974e-07f, _1181.x);
      float _1215 = mad((_invViewProj[3].z), _1187, mad((_invViewProj[3].y), _1186, ((_invViewProj[3].x) * _1184))) + (_invViewProj[3].w);
      float _1221 = ((mad((_invViewProj[0].z), _1187, mad((_invViewProj[0].y), _1186, ((_invViewProj[0].x) * _1184))) + (_invViewProj[0].w)) / _1215) - _wantedRegionPosition.x;
      float _1222 = ((mad((_invViewProj[2].z), _1187, mad((_invViewProj[2].y), _1186, ((_invViewProj[2].x) * _1184))) + (_invViewProj[2].w)) / _1215) - _wantedRegionPosition.z;
      float _1226 = sqrt((_1221 * _1221) + (_1222 * _1222));
      float _1233 = saturate(floor(_1226 / _1176));
      float _1235 = (1.0f - _1233) * saturate(((_1178 - _1176) + _1226) / _1178);
      float _1242 = (1.0f - saturate((_1226 - _1176) / _1178)) * _1233;
      float _1246 = saturate(((_1242 * _1242) * _1242) + ((_1235 * _1235) * _1235));
      float _1249 = saturate((_1246 * 5.0f) + -4.0f);
      float _1250 = _1249 * _1249;
      float _1253 = ((_1250 * _1250) * 9.0f) + 1.0f;
      uint2 _1266 = __3__36__0__0__g_stencil.Load(int3((int)(uint(_bufferSizeAndInvSize.x * _239)), (int)(uint(_bufferSizeAndInvSize.y * _240)), 0));
      int _1268 = _1266.x & 127;
      float _1276 = (((float((uint)((uint)((uint)((uint)(_1127)) >> 24))) * 0.003921568859368563f) * _wantedRegionOpacity) * _1246) * float((bool)((uint)(((_1268 != 57)) && (((uint)(_1268 + -53) > (uint)14)))));
      _1287 = ((_1276 * ((_1253 * (select(((_1130 * 0.003921568859368563f) < 0.040449999272823334f), (_1130 * 0.0003035269910469651f), exp2(log2((_1130 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _1168)) - _1107)) + _1107);
      _1288 = ((_1276 * ((_1253 * (select(((_1133 * 0.003921568859368563f) < 0.040449999272823334f), (_1133 * 0.0003035269910469651f), exp2(log2((_1133 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _1168)) - _1108)) + _1108);
      _1289 = ((_1276 * ((_1253 * (select(((_1135 * 0.003921568859368563f) < 0.040449999272823334f), (_1135 * 0.0003035269910469651f), exp2(log2((_1135 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _1168)) - _1109)) + _1109);
    } else {
      _1287 = _1107;
      _1288 = _1108;
      _1289 = _1109;
    }
  } else {
    _1287 = _1107;
    _1288 = _1108;
    _1289 = _1109;
  }
  if (((((_temperatureWarning <= -0.009999999776482582f)) || ((_temperatureWarning >= 0.009999999776482582f)))) || ((_electrocutionWarning > 0.0010000000474974513f))) {
    float4 _1301 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_239, _240));
    float _1312 = (pow(_1301.x, 0.012683313339948654f));
    float _1313 = (pow(_1301.y, 0.012683313339948654f));
    float _1314 = (pow(_1301.z, 0.012683313339948654f));
    float _1339 = exp2(log2(max(0.0f, (_1312 + -0.8359375f)) / (18.8515625f - (_1312 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    float _1340 = exp2(log2(max(0.0f, (_1313 + -0.8359375f)) / (18.8515625f - (_1313 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    float _1341 = exp2(log2(max(0.0f, (_1314 + -0.8359375f)) / (18.8515625f - (_1314 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    float _1343 = _temperatureWarning * 0.009999999776482582f;
    if (_temperatureWarning > 0.0f) {
      float _1346 = saturate(saturate(_1343));
      float _1347 = TEXCOORD.x + -0.5f;
      float _1348 = TEXCOORD.y + -0.6000000238418579f;
      float _1356 = saturate((_1346 + -0.5f) + sqrt((_1348 * _1348) + (_1347 * _1347))) * _1346;
      float _1361 = (1.0f - (_1356 * 0.30000001192092896f)) * _1288;
      float _1362 = (1.0f - (_1356 * 0.699999988079071f)) * _1289;
      _1388 = ((_1339 - _1287) * _1301.w);
      _1389 = (lerp(_1361, _1340, _1301.w));
      _1390 = (lerp(_1362, _1341, _1301.w));
    } else {
      float _1377 = (_1301.w * (1.0f - TEXCOORD.y)) * saturate(abs(_1343) * 2.0f);
      _1388 = (_1377 * (_1339 - (_1287 * 0.30000001192092896f)));
      _1389 = ((_1377 * (_1340 - (_1288 * 0.10000002384185791f))) + _1288);
      _1390 = ((_1377 * _1341) + _1289);
    }
    float _1391 = _1287 + _1388;
    if (!(_electrocutionWarning == 0.0f)) {
      float _1397 = max(0.0010000000474974513f, _exposure0.x);
      float _1401 = TEXCOORD.x + -0.5f;
      float _1402 = TEXCOORD.y + -0.6000000238418579f;
      float _1410 = (_electrocutionWarning * 0.5f) * saturate(sqrt((_1402 * _1402) + (_1401 * _1401)) + -0.30000001192092896f);
      float _1417 = (_1410 * ((0.05000000074505806f / _1397) - _1391)) + _1391;
      float _1418 = (_1410 * ((0.10000000149011612f / _1397) - _1389)) + _1389;
      float _1419 = (_1410 * ((0.5f / _1397) - _1390)) + _1390;
      _1430 = (lerp(_1417, _1339, _1301.w));
      _1431 = (lerp(_1418, _1340, _1301.w));
      _1432 = (lerp(_1419, _1341, _1301.w));
    } else {
      _1430 = _1391;
      _1431 = _1389;
      _1432 = _1390;
    }
  } else {
    _1430 = _1287;
    _1431 = _1288;
    _1432 = _1289;
  }
  [branch]
  if (!(!(_hpPercentage <= 20.0f))) {
    float _1438 = 1.0f - (_hpPercentage * 0.009999999776482582f);
    if (((!(_hpPercentage <= 0.0f))) && ((_1438 >= 0.0010000000474974513f))) {
      float _1453 = _time.x * 0.30000001192092896f;
      float4 _1462 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_291 < (uint)65000), _291, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1453 + (TEXCOORD.x * 12.0f)), (_1453 + (TEXCOORD.y * 6.0f))));
      float _1464 = _1462.w * 0.10000000149011612f;
      int _1467 = WaveReadLaneFirst(_materialIndex);
      int _1475 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1467 < (uint)170000), _1467, 0)) + 0u))]._borderEdgeNoiseTexture);
      float4 _1482 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1475 < (uint)65000), _1475, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((TEXCOORD.x * 2.0f) + 0.30000001192092896f) + _1464), (_1464 + TEXCOORD.y)));
      float _1489 = (_hpPercentage * 0.0020000000949949026f) + 0.36000001430511475f;
      float _1492 = max((abs(TEXCOORD.x + -0.5f) - _1489), 0.0f);
      float _1493 = max((abs(TEXCOORD.y + -0.5f) - _1489), 0.0f);
      float _1505 = sin(frac(_time.x * (2.0f - (_hpPercentage * 0.05000000074505806f))) * 3.1415927410125732f);
      float _1517 = 1.0f - _240;
      float _1520 = saturate((_1517 * _1517) * 2.0f);
      float _1521 = saturate(_1505);
      bool _1529 = ((_isPhotosensitiveMode_isAllolwBlood & 1) != 0);
      float _1531 = (_1521 * 0.0112674031406641f) + 0.022386489436030388f;
      float _1540 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
      float _1542 = select(_1529, 0.006995410192757845f, 0.04317210242152214f) * _1540;
      float _1546 = (min(max(_1438, 0.0f), 1.0f) * saturate((saturate(((_1505 * 0.19999998807907104f) + 0.800000011920929f) * saturate(sqrt((_1493 * _1493) + (_1492 * _1492)) * 3.846153974533081f)) * 2.0f) - (_1482.x * 1.440000057220459f))) * _1520;
      float _1547 = _1520 * (0.12999999523162842f - (_hpPercentage * 0.006000000052154064f));
      float _1554 = (((select(_1529, 0.215860515832901f, 0.04317210242152214f) * _1540) - _1430) * _1547) + _1430;
      float _1555 = ((_1542 - _1431) * _1547) + _1431;
      float _1556 = ((_1542 - _1432) * _1547) + _1432;
      _1567 = ((((select(_1529, ((_1521 * 0.056337013840675354f) + 0.11193244159221649f), _1531) * _1540) - _1554) * _1546) + _1554);
      _1568 = ((((select(_1529, ((_1521 * 0.0053743417374789715f) + 0.0021246890537440777f), _1531) * _1540) - _1555) * _1546) + _1555);
      _1569 = ((((select(_1529, 0.0021246890537440777f, _1531) * _1540) - _1556) * _1546) + _1556);
    } else {
      _1567 = _1430;
      _1568 = _1431;
      _1569 = _1432;
    }
  } else {
    _1567 = _1430;
    _1568 = _1431;
    _1569 = _1432;
  }
  int _1570 = WaveReadLaneFirst(_materialIndex);
  float _1580 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1570 < (uint)170000), _1570, 0)) + 0u))]._channelBrightness.x);
  float _1581 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1570 < (uint)170000), _1570, 0)) + 0u))]._channelBrightness.y);
  float _1582 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1570 < (uint)170000), _1570, 0)) + 0u))]._channelBrightness.z);
  int _1583 = WaveReadLaneFirst(_materialIndex);
  float _1593 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1583 < (uint)170000), _1583, 0)) + 0u))]._saturation.x);
  float _1594 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1583 < (uint)170000), _1583, 0)) + 0u))]._saturation.y);
  float _1595 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1583 < (uint)170000), _1583, 0)) + 0u))]._saturation.z);
  int _1596 = WaveReadLaneFirst(_materialIndex);
  bool _1609 = (WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_130 < (uint)170000), _130, 0)) + 0u))]._isBloodEffect) > 0.0010000000474974513f);
  if ((_1609) && (((_isPhotosensitiveMode_isAllolwBlood & 1) == 0))) {
    bool _1616 = ((_1580 > (_1581 + 0.05000000074505806f))) && ((_1580 > (_1582 + 0.05000000074505806f)));
    float _1617 = _1580 * 0.4000000059604645f;
    bool _1625 = ((_1593 > (_1594 + 0.05000000074505806f))) && ((_1593 > (_1595 + 0.05000000074505806f)));
    float _1626 = _1593 * 0.4000000059604645f;
    _1631 = select(_1616, _1617, _1580);
    _1632 = select(_1616, _1617, _1581);
    _1633 = select(_1616, _1617, _1582);
    _1634 = select(_1625, _1626, _1593);
    _1635 = select(_1625, _1626, _1594);
    _1636 = select(_1625, _1626, _1595);
  } else {
    _1631 = _1580;
    _1632 = _1581;
    _1633 = _1582;
    _1634 = _1593;
    _1635 = _1594;
    _1636 = _1595;
  }
  float _1637 = _1631 * _1567;
  float _1638 = _1632 * _1568;
  float _1639 = _1633 * _1569;
  float _1643 = (1.0f - _1634) * 0.3086000084877014f;
  float _1645 = (1.0f - _1635) * 0.6093999743461609f;
  float _1647 = (1.0f - _1636) * 0.0820000022649765f;
  float _1652 = _1643 * _1637;
  float _1669 = max(WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1596 < (uint)170000), _1596, 0)) + 0u))]._contrast), 0.0f);
  float _1676 = max(0.0f, ((_1669 * (mad(_1639, _1647, mad(_1638, _1645, ((_1643 + _1634) * _1637))) + -0.5f)) + 0.5f));
  float _1677 = max(0.0f, ((_1669 * (mad(_1639, _1647, mad(_1638, (_1645 + _1635), _1652)) + -0.5f)) + 0.5f));
  float _1678 = max(0.0f, ((_1669 * (mad(_1639, (_1647 + _1636), mad(_1638, _1645, _1652)) + -0.5f)) + 0.5f));
  int _1679 = WaveReadLaneFirst(_materialIndex);
  float _1687 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1679 < (uint)170000), _1679, 0)) + 0u))]._invertColor);
  float _1690 = _exposure2.x * 4.0f;
  float _1700 = ((_1690 - (_1676 * 2.0f)) * _1687) + _1676;
  float _1701 = ((_1690 - (_1677 * 2.0f)) * _1687) + _1677;
  float _1702 = ((_1690 - (_1678 * 2.0f)) * _1687) + _1678;
  int _1703 = WaveReadLaneFirst(_materialIndex);
  float _1711 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1703 < (uint)170000), _1703, 0)) + 0u))]._borderRatio);
  [branch]
  if (!(!(_1711 >= 0.0010000000474974513f))) {
    int _1714 = WaveReadLaneFirst(_materialIndex);
    int _1727 = WaveReadLaneFirst(_materialIndex);
    int _1740 = WaveReadLaneFirst(_materialIndex);
    int _1748 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1740 < (uint)170000), _1740, 0)) + 0u))]._borderEdgeNoiseTexture);
    float4 _1755 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1748 < (uint)65000), _1748, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1727 < (uint)170000), _1727, 0)) + 0u))]._borderEdgeNoiseOffset.x) + (WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1714 < (uint)170000), _1714, 0)) + 0u))]._borderEdgeNoiseTile.x) * TEXCOORD.x)), (WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1727 < (uint)170000), _1727, 0)) + 0u))]._borderEdgeNoiseOffset.y) + (WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1714 < (uint)170000), _1714, 0)) + 0u))]._borderEdgeNoiseTile.y) * TEXCOORD.y))));
    int _1757 = WaveReadLaneFirst(_materialIndex);
    int _1766 = WaveReadLaneFirst(_materialIndex);
    float _1780 = (1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1766 < (uint)170000), _1766, 0)) + 0u))]._borderWidth)) * 0.5f;
    float _1783 = max((abs(TEXCOORD.x + -0.5f) - _1780), 0.0f);
    float _1784 = max((abs(TEXCOORD.y + -0.5f) - _1780), 0.0f);
    float _1793 = 1.0f - ((1.0f - saturate(sqrt((_1784 * _1784) + (_1783 * _1783)) / WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1757 < (uint)170000), _1757, 0)) + 0u))]._borderSmoothness))) * 2.0f);
    int _1794 = WaveReadLaneFirst(_materialIndex);
    float _1802 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1794 < (uint)170000), _1794, 0)) + 0u))]._borderFlickerSpeed);
    if (_1802 > 0.0010000000474974513f) {
      int _1805 = WaveReadLaneFirst(_materialIndex);
      int _1823 = WaveReadLaneFirst(_materialIndex);
      _1835 = ((min(max(sin((_1802 * 3.1415927410125732f) * _time.x), WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1805 < (uint)170000), _1805, 0)) + 0u))]._borderFlickerOpacityMinMax.x)), WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1805 < (uint)170000), _1805, 0)) + 0u))]._borderFlickerOpacityMinMax.y)) * _1793) * WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1823 < (uint)170000), _1823, 0)) + 0u))]._borderFlickerIntensity));
    } else {
      _1835 = _1793;
    }
    int _1837 = WaveReadLaneFirst(_materialIndex);
    float _1851 = min(max(_1711, 0.0f), 1.0f) * saturate(saturate(_1835) - (WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1837 < (uint)170000), _1837, 0)) + 0u))]._borderEdgeNoiseRatio) * _1755.x));
    int _1852 = WaveReadLaneFirst(_materialIndex);
    int _1860 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1852 < (uint)170000), _1852, 0)) + 0u))]._borderColor);
    float _1863 = float((uint)((uint)(((uint)((uint)(_1860)) >> 16) & 255)));
    float _1866 = float((uint)((uint)(((uint)((uint)(_1860)) >> 8) & 255)));
    float _1868 = float((uint)((uint)(_1860 & 255)));
    float _1893 = select(((_1863 * 0.003921568859368563f) < 0.040449999272823334f), (_1863 * 0.0003035269910469651f), exp2(log2((_1863 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    bool _1900 = (_1609) && (((_isPhotosensitiveMode_isAllolwBlood & 1) == 0));
    float _1901 = _1893 * 0.4000000059604645f;
    float _1908 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
    _1922 = ((((select(_1900, _1901, _1893) * _1908) - _1700) * _1851) + _1700);
    _1923 = ((((select(_1900, _1901, select(((_1866 * 0.003921568859368563f) < 0.040449999272823334f), (_1866 * 0.0003035269910469651f), exp2(log2((_1866 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) * _1908) - _1701) * _1851) + _1701);
    _1924 = ((((select(_1900, _1901, select(((_1868 * 0.003921568859368563f) < 0.040449999272823334f), (_1868 * 0.0003035269910469651f), exp2(log2((_1868 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) * _1908) - _1702) * _1851) + _1702);
  } else {
    _1922 = _1700;
    _1923 = _1701;
    _1924 = _1702;
  }
  [branch]
  if (!(!(_59 >= 0.0010000000474974513f))) {
    float _1927 = TEXCOORD.x + -0.5f;
    float _1928 = TEXCOORD.y + -0.5f;
    int _1933 = WaveReadLaneFirst(_materialIndex);
    int _1947 = WaveReadLaneFirst(_materialIndex);
    float _1960 = saturate(exp2(log2(abs(0.5f - TEXCOORD.x)) * WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1947 < (uint)170000), _1947, 0)) + 0u))]._statusVignettePower2)) * (sqrt((_1928 * _1928) + (_1927 * _1927)) / max(0.0010000000474974513f, (1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1933 < (uint)170000), _1933, 0)) + 0u))]._statusVignetteRadius2)))));
    float _1965 = saturate(_59 * 10.0f) * saturate(_1960 * 2.0f);
    float _1972 = (_1965 * (_547 - _1922)) + _1922;
    float _1973 = (_1965 * (_548 - _1923)) + _1923;
    float _1974 = (_1965 * (_549 - _1924)) + _1924;
    int _1975 = WaveReadLaneFirst(_materialIndex);
    int _1983 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1975 < (uint)170000), _1975, 0)) + 0u))]._statusVignetteColor2);
    float _1986 = float((uint)((uint)(((uint)((uint)(_1983)) >> 16) & 255)));
    float _1989 = float((uint)((uint)(((uint)((uint)(_1983)) >> 8) & 255)));
    float _1991 = float((uint)((uint)(_1983 & 255)));
    float _2016 = select(((_1986 * 0.003921568859368563f) < 0.040449999272823334f), (_1986 * 0.0003035269910469651f), exp2(log2((_1986 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    bool _2023 = (_1609) && (((_isPhotosensitiveMode_isAllolwBlood & 1) == 0));
    float _2024 = _2016 * 0.20000000298023224f;
    float _2031 = max(0.0010000000474974513f, _exposure0.x);
    float _2038 = saturate(_1960) * _59;
    _2046 = ((((select(_2023, _2024, _2016) / _2031) - _1972) * _2038) + _1972);
    _2047 = ((((select(_2023, _2024, select(((_1989 * 0.003921568859368563f) < 0.040449999272823334f), (_1989 * 0.0003035269910469651f), exp2(log2((_1989 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) / _2031) - _1973) * _2038) + _1973);
    _2048 = ((((select(_2023, _2024, select(((_1991 * 0.003921568859368563f) < 0.040449999272823334f), (_1991 * 0.0003035269910469651f), exp2(log2((_1991 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) / _2031) - _1974) * _2038) + _1974);
  } else {
    _2046 = _1922;
    _2047 = _1923;
    _2048 = _1924;
  }
  [branch]
  if (!(!(_50 >= 0.0010000000474974513f))) {
    float _2051 = TEXCOORD.x + -0.5f;
    float _2052 = TEXCOORD.y + -0.5f;
    int _2057 = WaveReadLaneFirst(_materialIndex);
    int _2070 = WaveReadLaneFirst(_materialIndex);
    float _2083 = saturate(exp2(log2(1.0f - TEXCOORD.y) * WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2070 < (uint)170000), _2070, 0)) + 0u))]._statusVignettePower1)) * (sqrt((_2052 * _2052) + (_2051 * _2051)) / max(0.0010000000474974513f, (1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2057 < (uint)170000), _2057, 0)) + 0u))]._statusVignetteRadius1)))));
    float _2086 = saturate(_50 * 10.0f) * _2083;
    float _2093 = (_2086 * (_547 - _2046)) + _2046;
    float _2094 = (_2086 * (_548 - _2047)) + _2047;
    float _2095 = (_2086 * (_549 - _2048)) + _2048;
    int _2096 = WaveReadLaneFirst(_materialIndex);
    int _2104 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2096 < (uint)170000), _2096, 0)) + 0u))]._statusVignetteColor1);
    float _2107 = float((uint)((uint)(((uint)((uint)(_2104)) >> 16) & 255)));
    float _2110 = float((uint)((uint)(((uint)((uint)(_2104)) >> 8) & 255)));
    float _2112 = float((uint)((uint)(_2104 & 255)));
    float _2137 = select(((_2107 * 0.003921568859368563f) < 0.040449999272823334f), (_2107 * 0.0003035269910469651f), exp2(log2((_2107 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    bool _2144 = (_1609) && (((_isPhotosensitiveMode_isAllolwBlood & 1) == 0));
    float _2145 = _2137 * 0.20000000298023224f;
    float _2152 = max(0.0010000000474974513f, _exposure0.x);
    float _2159 = saturate(_2083) * _50;
    _2167 = ((((select(_2144, _2145, _2137) / _2152) - _2093) * _2159) + _2093);
    _2168 = ((((select(_2144, _2145, select(((_2110 * 0.003921568859368563f) < 0.040449999272823334f), (_2110 * 0.0003035269910469651f), exp2(log2((_2110 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) / _2152) - _2094) * _2159) + _2094);
    _2169 = ((((select(_2144, _2145, select(((_2112 * 0.003921568859368563f) < 0.040449999272823334f), (_2112 * 0.0003035269910469651f), exp2(log2((_2112 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) / _2152) - _2095) * _2159) + _2095);
  } else {
    _2167 = _2046;
    _2168 = _2047;
    _2169 = _2048;
  }
  [branch]
  if (!(!(_68 >= 0.0010000000474974513f))) {
    float _2172 = TEXCOORD.x + -0.5f;
    float _2173 = TEXCOORD.y + -0.5f;
    int _2178 = WaveReadLaneFirst(_materialIndex);
    int _2190 = WaveReadLaneFirst(_materialIndex);
    float _2203 = saturate(exp2(log2(TEXCOORD.y) * WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2190 < (uint)170000), _2190, 0)) + 0u))]._statusVignettePower3)) * (sqrt((_2173 * _2173) + (_2172 * _2172)) / max(0.0010000000474974513f, (1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2178 < (uint)170000), _2178, 0)) + 0u))]._statusVignetteRadius3)))));
    float _2206 = saturate(_68 * 10.0f) * _2203;
    float _2213 = (_2206 * (_547 - _2167)) + _2167;
    float _2214 = (_2206 * (_548 - _2168)) + _2168;
    float _2215 = (_2206 * (_549 - _2169)) + _2169;
    int _2216 = WaveReadLaneFirst(_materialIndex);
    int _2224 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2216 < (uint)170000), _2216, 0)) + 0u))]._statusVignetteColor3);
    float _2227 = float((uint)((uint)(((uint)((uint)(_2224)) >> 16) & 255)));
    float _2230 = float((uint)((uint)(((uint)((uint)(_2224)) >> 8) & 255)));
    float _2232 = float((uint)((uint)(_2224 & 255)));
    float _2257 = select(((_2227 * 0.003921568859368563f) < 0.040449999272823334f), (_2227 * 0.0003035269910469651f), exp2(log2((_2227 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    bool _2264 = (_1609) && (((_isPhotosensitiveMode_isAllolwBlood & 1) == 0));
    float _2265 = _2257 * 0.20000000298023224f;
    float _2272 = max(0.0010000000474974513f, _exposure0.x);
    float _2279 = saturate(_2203) * _68;
    _2287 = ((((select(_2264, _2265, _2257) / _2272) - _2213) * _2279) + _2213);
    _2288 = ((((select(_2264, _2265, select(((_2230 * 0.003921568859368563f) < 0.040449999272823334f), (_2230 * 0.0003035269910469651f), exp2(log2((_2230 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) / _2272) - _2214) * _2279) + _2214);
    _2289 = ((((select(_2264, _2265, select(((_2232 * 0.003921568859368563f) < 0.040449999272823334f), (_2232 * 0.0003035269910469651f), exp2(log2((_2232 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) / _2272) - _2215) * _2279) + _2215);
  } else {
    _2287 = _2167;
    _2288 = _2168;
    _2289 = _2169;
  }
  [branch]
  if (!(!(_hideStateRatio >= 0.0010000000474974513f))) {
    float _2294 = _hideStateRatio * 0.5f;
    float _2295 = TEXCOORD.x + -0.5f;
    float _2296 = TEXCOORD.y + -0.5f;
    float _2304 = saturate(((_2294 + -0.5f) + sqrt((_2296 * _2296) + (_2295 * _2295))) * 2.0f);
    float _2312 = saturate(((saturate(abs(0.5f - TEXCOORD.y) * 2.0f) - _2304) * 0.5f) + _2304);
    float _2320 = (((_2312 * _2312) * 0.8999999761581421f) * saturate(_hideStateRatio * 4.0f)) * (3.0f - (_2312 * 2.0f));
    float _2323 = dot(float3(_2287, _2288, _2289), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f)) * (1.0f - _2294);
    float _2326 = (pow(_2320, 0.5f));
    float _2333 = ((_2323 - _2287) * _2326) + _2287;
    float _2334 = ((_2323 - _2288) * _2326) + _2288;
    float _2335 = ((_2323 - _2289) * _2326) + _2289;
    float _2339 = 0.0010000000474974513f / max(0.0010000000474974513f, _exposure0.x);
    _2350 = (lerp(_2333, _2339, _2320));
    _2351 = (lerp(_2334, _2339, _2320));
    _2352 = (lerp(_2335, _2339, _2320));
  } else {
    _2350 = _2287;
    _2351 = _2288;
    _2352 = _2289;
  }
  if (_followLearning > 0.0010000000474974513f) {
    int _2357 = WaveReadLaneFirst(_materialIndex);
    int _2365 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2357 < (uint)170000), _2357, 0)) + 0u))]._followLearningColor);
    float _2368 = float((uint)((uint)(((uint)((uint)(_2365)) >> 16) & 255)));
    float _2371 = float((uint)((uint)(((uint)((uint)(_2365)) >> 8) & 255)));
    float _2373 = float((uint)((uint)(_2365 & 255)));
    float _2403 = max(0.0010000000474974513f, _exposure0.x);
    float _2404 = select(((_2368 * 0.003921568859368563f) < 0.040449999272823334f), (_2368 * 0.0003035269910469651f), exp2(log2((_2368 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _2403;
    float _2405 = select(((_2371 * 0.003921568859368563f) < 0.040449999272823334f), (_2371 * 0.0003035269910469651f), exp2(log2((_2371 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _2403;
    float _2406 = select(((_2373 * 0.003921568859368563f) < 0.040449999272823334f), (_2373 * 0.0003035269910469651f), exp2(log2((_2373 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _2403;
    int _2407 = WaveReadLaneFirst(_materialIndex);
    int _2415 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2407 < (uint)170000), _2407, 0)) + 0u))]._followLearningNoiseTex);
    float4 _2426 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_291 < (uint)65000), _291, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_239, ((_time.x * 0.20000000298023224f) + _240)));
    float _2433 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_239, _240));
    float _2436 = (_239 * 2.0f) + -1.0f;
    float _2438 = 1.0f - (_240 * 2.0f);
    float _2439 = max(1.0000000116860974e-07f, _2433.x);
    float _2475 = mad((_invViewProj[3].z), _2439, mad((_invViewProj[3].y), _2438, ((_invViewProj[3].x) * _2436))) + (_invViewProj[3].w);
    uint _2484 = uint(_bufferSizeAndInvSize.x * _239);
    uint _2485 = uint(_bufferSizeAndInvSize.y * _240);
    uint4 _2487 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_2484), (int)(_2485), 0));
    float4 _2490 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_2484), (int)(_2485), 0));
    float _2508 = (saturate(_2490.x * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _2509 = (saturate(_2490.y * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _2510 = (saturate(_2490.z * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _2512 = rsqrt(dot(float3(_2508, _2509, _2510), float3(_2508, _2509, _2510)));
    float _2513 = _2512 * _2508;
    float _2514 = _2512 * _2509;
    float _2515 = _2510 * _2512;
    float _2518 = (float((uint)((uint)(((uint)((uint)(_2487.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
    float _2519 = (float((uint)((uint)(_2487.w & 255))) * 0.007843137718737125f) + -1.0f;
    float _2522 = (_2518 + _2519) * 0.5f;
    float _2523 = (_2518 - _2519) * 0.5f;
    float _2527 = (1.0f - abs(_2522)) - abs(_2523);
    float _2529 = rsqrt(dot(float3(_2522, _2523, _2527), float3(_2522, _2523, _2527)));
    float _2530 = _2529 * _2522;
    float _2531 = _2529 * _2523;
    float _2532 = _2529 * _2527;
    float _2534 = select((_2515 >= 0.0f), 1.0f, -1.0f);
    float _2537 = -0.0f - (1.0f / (_2534 + _2515));
    float _2538 = _2514 * _2537;
    float _2539 = _2538 * _2513;
    float _2540 = _2534 * _2513;
    float _2549 = mad(_2532, _2513, mad(_2531, _2539, ((((_2540 * _2513) * _2537) + 1.0f) * _2530)));
    float _2553 = mad(_2532, _2514, mad(_2531, (_2534 + (_2538 * _2514)), ((_2530 * _2534) * _2539)));
    float _2557 = mad(_2532, _2515, mad(_2531, (-0.0f - _2514), (-0.0f - (_2540 * _2530))));
    float _2559 = rsqrt(dot(float3(_2549, _2553, _2557), float3(_2549, _2553, _2557)));
    float _2561 = _2559 * _2553;
    float _2562 = _2559 * _2557;
    float _2565 = _time.x * 0.5f;
    float _2568 = (((mad((_invViewProj[2].z), _2439, mad((_invViewProj[2].y), _2438, ((_invViewProj[2].x) * _2436))) + (_invViewProj[2].w)) / _2475) - _2565) * 0.20000000298023224f;
    float _2569 = (((mad((_invViewProj[1].z), _2439, mad((_invViewProj[1].y), _2438, ((_invViewProj[1].x) * _2436))) + (_invViewProj[1].w)) / _2475) - _2565) * 0.20000000298023224f;
    float4 _2576 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_2415 < (uint)65000), _2415, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_2568, _2569));
    float _2579 = (((mad((_invViewProj[0].z), _2439, mad((_invViewProj[0].y), _2438, ((_invViewProj[0].x) * _2436))) + (_invViewProj[0].w)) / _2475) - _2565) * 0.20000000298023224f;
    float4 _2580 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_2415 < (uint)65000), _2415, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_2579, _2568));
    float4 _2582 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_2415 < (uint)65000), _2415, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_2579, _2569));
    float _2588 = (abs(_2561) * (_2580.w - _2576.w)) + _2576.w;
    float _2591 = ((_2582.w - _2588) * abs(_2562)) + _2588;
    float _2592 = _2426.z + -0.5f;
    float _2597 = _239 + -0.5f;
    float _2599 = _240 + -0.5f;
    float _2604 = 0.375f - (_2592 * 0.25f);
    float _2607 = max((abs(((_2426.x + -0.5f) * 0.10000000149011612f) + _2597) - _2604), 0.0f);
    float _2608 = max((abs(((_2426.y + -0.5f) * 0.10000000149011612f) + _2599) - _2604), 0.0f);
    float _2613 = saturate(sqrt((_2608 * _2608) + (_2607 * _2607)));
    float _2617 = saturate(_followLearning * 2.0f);
    float _2623 = saturate(((((_2433.x * 100.0f) * _2617) - _2591) * 2.0f) + -0.5f);
    float _2633 = sqrt((_2599 * _2599) + (_2597 * _2597));
    float _2636 = ((saturate((_2617 * 2.0f) + -1.0f) * (1.0f - _2623)) + _2623) * saturate(_2633 + 0.5f);
    float _2638 = atan(_2599 / _2597);
    bool _2641 = (_2597 < 0.0f);
    bool _2642 = (_2597 == 0.0f);
    bool _2643 = (_2599 >= 0.0f);
    bool _2644 = (_2599 < 0.0f);
    float _2656 = _2591 * 0.5f;
    float4 _2669 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_2415 < (uint)65000), _2415, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((((_2592 * -0.5f) - _2656) - (_time.x * 0.20000000298023224f)) + select(((_2642) && (_2643)), 7.5f, select(((_2642) && (_2644)), -7.5f, (select(((_2641) && (_2644)), (_2638 + -3.1415927410125732f), select(((_2641) && (_2643)), (_2638 + 3.1415927410125732f), _2638)) * 4.774648189544678f)))), (((((_2426.w + -0.5f) * -0.5f) - _2656) + (_2633 * 2.0f)) - (_time.x * 1.5f))));
    float4 _2679 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * _239), int(_customRenderPassSizeInvSize.y * _240), 0));
    float _2683 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_239, _240));
    if (!(_1110 == _renderPassSelfPlayer)) {
      _2704 = (_1110 == _renderPassTest);
    } else {
      _2704 = true;
    }
    bool _2705 = !((1.0f - saturate(ceil(((_nearFarProj.x / max(1.0000000116860974e-07f, _2683.x)) + 0.5f) - (_nearFarProj.x / max(1.0000000116860974e-07f, _2679.x))))) == 0.0f);
    bool _2707 = (_2705) || ((!_2704));
    if (_1110 == _renderPassTargetFocus) {
      if (_2705) {
        _2721 = (_1110 != _renderPassAimHighlight);
      } else {
        _2721 = false;
      }
    } else {
      if ((_2705) || ((_1110 != _renderPassLearning))) {
        _2721 = (_1110 != _renderPassAimHighlight);
      } else {
        _2721 = false;
      }
    }
    float _2723 = saturate(_followLearning * 4.0f);
    float _2730 = (_2723 * (_280 - _2350)) + _2350;
    float _2731 = (_2723 * (_281 - _2351)) + _2351;
    float _2732 = (_2723 * (_282 - _2352)) + _2352;
    bool _2733 = (_2707) && (_2721);
    if (_2733) {
      float _2740 = ((_followLearning * 0.25f) * _2669.w) * saturate(_2633 - (_2723 * 0.20000000298023224f));
      float4 _2744 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_2740 + _239), (_2740 + _240)));
      float _2754 = (pow(_2744.x, 0.012683313339948654f));
      float _2755 = (pow(_2744.y, 0.012683313339948654f));
      float _2756 = (pow(_2744.z, 0.012683313339948654f));
      float _2794 = 1.0f - (_followLearning * 0.75f);
      _2804 = (((((exp2(log2(max(0.0f, (_2754 + -0.8359375f)) / (18.8515625f - (_2754 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _2730) * _2723) + _2730) * _2794);
      _2805 = (((((exp2(log2(max(0.0f, (_2755 + -0.8359375f)) / (18.8515625f - (_2755 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _2731) * _2723) + _2731) * _2794);
      _2806 = (((((exp2(log2(max(0.0f, (_2756 + -0.8359375f)) / (18.8515625f - (_2756 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _2732) * _2723) + _2732) * _2794);
      _2807 = _2636;
    } else {
      if (_2707) {
        _2804 = _2730;
        _2805 = _2731;
        _2806 = _2732;
        _2807 = select(_2721, _2636, 0.0f);
      } else {
        _2804 = _2730;
        _2805 = _2731;
        _2806 = _2732;
        _2807 = (_2636 * 0.4000000059604645f);
      }
    }
    float _2808 = dot(float3(_2804, _2805, _2806), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
    float _2815 = ((_2808 - _2804) * _2807) + _2804;
    float _2816 = ((_2808 - _2805) * _2807) + _2805;
    float _2817 = ((_2808 - _2806) * _2807) + _2806;
    float _2819 = _2591 * (_2426.z * 0.30000001192092896f);
    float _2825 = saturate(_2807 * 5.0f) * 0.8999999761581421f;
    float _2832 = (((_2819 * _2404) - _2815) * _2825) + _2815;
    float _2833 = (((_2819 * _2405) - _2816) * _2825) + _2816;
    float _2834 = (((_2819 * _2406) - _2817) * _2825) + _2817;
    int _2835 = WaveReadLaneFirst(_materialIndex);
    int _2843 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2835 < (uint)170000), _2835, 0)) + 0u))]._followLearningSaturationTone);
    float _2846 = float((uint)((uint)(((uint)((uint)(_2843)) >> 16) & 255)));
    float _2849 = float((uint)((uint)(((uint)((uint)(_2843)) >> 8) & 255)));
    float _2851 = float((uint)((uint)(_2843 & 255)));
    float _2876 = select(((_2846 * 0.003921568859368563f) < 0.040449999272823334f), (_2846 * 0.0003035269910469651f), exp2(log2((_2846 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _2877 = select(((_2849 * 0.003921568859368563f) < 0.040449999272823334f), (_2849 * 0.0003035269910469651f), exp2(log2((_2849 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _2878 = select(((_2851 * 0.003921568859368563f) < 0.040449999272823334f), (_2851 * 0.0003035269910469651f), exp2(log2((_2851 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _2882 = (1.0f - _2876) * 0.3086000084877014f;
    float _2884 = (1.0f - _2877) * 0.6093999743461609f;
    float _2886 = (1.0f - _2878) * 0.0820000022649765f;
    float _2891 = _2882 * _2832;
    float _2904 = (_followLearning * (mad(_2834, _2886, mad(_2833, _2884, ((_2882 + _2876) * _2832))) - _2832)) + _2832;
    float _2905 = (_followLearning * (mad(_2834, _2886, mad(_2833, (_2884 + _2877), _2891)) - _2833)) + _2833;
    float _2906 = (_followLearning * (mad(_2834, (_2886 + _2878), mad(_2833, _2884, _2891)) - _2834)) + _2834;
    if (!_2733) {
      float _2920 = saturate(1.0f - dot(float3((_2656 + (_2559 * _2549)), (_2656 + _2561), (_2656 + _2562)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
      float _2925 = select(_2707, ((_2920 * _2920) * 6.0f), (_2920 * 0.25f)) * _2920;
      float _2929 = (_followLearning * _followLearning) * saturate(_2591 * 10.0f);
      _2940 = (((_2929 * _2404) * _2925) + _2904);
      _2941 = (((_2929 * _2405) * _2925) + _2905);
      _2942 = (((_2929 * _2406) * _2925) + _2906);
    } else {
      _2940 = _2904;
      _2941 = _2905;
      _2942 = _2906;
    }
    float _2943 = _followLearning * _2613;
    float _2947 = 0.0010000000474974513f / max(0.0010000000474974513f, _exposure0.x);
    float _2954 = ((_2947 - _2940) * _2943) + _2940;
    float _2955 = ((_2947 - _2941) * _2943) + _2941;
    float _2956 = ((_2947 - _2942) * _2943) + _2942;
    float _2961 = saturate(((_2669.w * _2669.w) * 20.0f) * _followLearning) * _2613;
    _2972 = (lerp(_2954, _2404, _2961));
    _2973 = (lerp(_2955, _2405, _2961));
    _2974 = (lerp(_2956, _2406, _2961));
  } else {
    _2972 = _2350;
    _2973 = _2351;
    _2974 = _2352;
  }
  [branch]
  if ((dot(float4(_enemyAlert1.x, _enemyAlert1.y, _enemyAlert1.z, _enemyAlert1.w), float4(1.0f, 1.0f, 1.0f, 1.0f)) > 0.0f) | (dot(float4(_enemyAlert2.x, _enemyAlert2.y, _enemyAlert2.z, _enemyAlert2.w), float4(1.0f, 1.0f, 1.0f, 1.0f)) > 0.0f)) {
    bool _2994 = ((_isPhotosensitiveMode_isAllolwBlood & 1) != 0);
    float _3000 = max(0.0010000000474974513f, _exposure0.x);
    float4 _3017 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_291 < (uint)65000), _291, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((TEXCOORD.x * 2.0f) * _36), ((_time.x * 0.10000000149011612f) + (TEXCOORD.y * 2.0f))));
    float _3020 = _3017.x + -0.5f;
    float _3021 = _3017.y + -0.5f;
    float _3031 = 0.44999998807907104f - (_3020 * 0.004999999888241291f);
    float _3034 = max((abs((TEXCOORD.x + -0.5f) + (_3020 * 0.019999999552965164f)) - _3031), 0.0f);
    float _3035 = max((abs((TEXCOORD.y + -0.5f) + (_3021 * 0.019999999552965164f)) - _3031), 0.0f);
    int _3046 = WaveReadLaneFirst(_materialIndex);
    int _3054 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_3046 < (uint)170000), _3046, 0)) + 0u))]._enemyAlertTex);
    float4 _3061 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_3054 < (uint)65000), _3054, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - (_3021 * 0.029999999329447746f)), (TEXCOORD.y - (_3020 * 0.029999999329447746f))));
    bool _3066 = (TEXCOORD.y > 0.5f);
    bool _3068 = (TEXCOORD.x < 0.5f);
    bool _3072 = (TEXCOORD.y < 0.5f);
    bool _3080 = (TEXCOORD.x > 0.5f);
    float _3104 = saturate(dot(float4((_3061.x * float((bool)(uint)(_3072))), (_3061.y * float((bool)((uint)((_3080) && (_3072))))), (_3061.z * float((bool)(uint)(_3080))), (_3061.w * float((bool)((uint)((_3080) && (_3066)))))), float4(_enemyAlert2.x, _enemyAlert2.y, _enemyAlert2.z, _enemyAlert2.w)) + dot(float4((_3061.x * float((bool)(uint)(_3066))), (_3061.y * float((bool)((uint)((_3068) && (_3066))))), (_3061.z * float((bool)(uint)(_3068))), (_3061.w * float((bool)((uint)((_3068) && (_3072)))))), float4(_enemyAlert1.x, _enemyAlert1.y, _enemyAlert1.z, _enemyAlert1.w))) * saturate(sqrt((_3035 * _3035) + (_3034 * _3034)) * 20.0f);
    float _3106 = (_3104 * _3104) * _3104;
    _3117 = ((_3106 * ((select(_2994, 0.09989875555038452f, 0.08437622338533401f) / _3000) - _2972)) + _2972);
    _3118 = ((_3106 * ((select(_2994, 0.027320895344018936f, 0.030713455751538277f) / _3000) - _2973)) + _2973);
    _3119 = ((_3106 * ((select(_2994, 0.04817182570695877f, 0.07036010921001434f) / _3000) - _2974)) + _2974);
  } else {
    _3117 = _2972;
    _3118 = _2973;
    _3119 = _2974;
  }
  uint _3120 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _3127 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_3120), 0));
    _3133 = (float((uint)((uint)(_3127.x & 127))) + 0.5f);
  } else {
    _3133 = 1.0f;
  }
  bool _3136 = (_localToneMappingParams.w > 0.0f);
  if (_3136) {
    float3 output_color = TonemapReplacer(float3(_3117, _3118, _3119));
    _3489 = output_color.x;
    _3490 = output_color.y;
    _3491 = output_color.z;
  } else {
    _3489 = _3117;
    _3490 = _3118;
    _3491 = _3119;
  }
  if (_etcParams.y > 1.0f) {
    float _3500 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _3501 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _3505 = saturate(1.0f - (dot(float2(_3500, _3501), float2(_3500, _3501)) * saturate(_etcParams.y + -1.0f)));
    _3510 = (_3505 * _3489);
    _3511 = (_3505 * _3490);
    _3512 = (_3505 * _3491);
  } else {
    _3510 = _3489;
    _3511 = _3490;
    _3512 = _3491;
  }
  if ((_3136) && ((_etcParams.z > 0.0f))) {
    _3542 = select((_3510 <= 0.0031308000907301903f), (_3510 * 12.920000076293945f), (((pow(_3510, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _3543 = select((_3511 <= 0.0031308000907301903f), (_3511 * 12.920000076293945f), (((pow(_3511, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _3544 = select((_3512 <= 0.0031308000907301903f), (_3512 * 12.920000076293945f), (((pow(_3512, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _3542 = _3510;
    _3543 = _3511;
    _3544 = _3512;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _3549 = float((uint)_3120);
    if (!(_3549 < _viewDir.w)) {
      if (!(_3549 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _3558 = _3542;
        _3559 = _3543;
        _3560 = _3544;
      } else {
        _3558 = 0.0f;
        _3559 = 0.0f;
        _3560 = 0.0f;
      }
    } else {
      _3558 = 0.0f;
      _3559 = 0.0f;
      _3560 = 0.0f;
    }
  } else {
    _3558 = _3542;
    _3559 = _3543;
    _3560 = _3544;
  }
  float _3570 = exp2(log2(_3558 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _3571 = exp2(log2(_3559 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _3572 = exp2(log2(_3560 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_3570 * 18.6875f) + 1.0f)) * ((_3570 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_3571 * 18.6875f) + 1.0f)) * ((_3571 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_3572 * 18.6875f) + 1.0f)) * ((_3572 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _3133;
  return SV_Target;
}