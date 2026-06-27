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
  // RenoDX: >>> [Patch: BasicPostProcessChromaticAberration] [Version: 1.12.02]
  // Description: SDR DLAA can use this composite material shader as the final visible output and skip the standalone SDR final shader where RenoDX normally scales chromatic aberration. Apply the RenoDX Chromatic Aberration setting to this shader's generic material chromatic aberration ratio while leaving separate status/vignette chromatic effects under the game's native controls.
  _120 *= CUSTOM_CHROMATIC_ABERRATION;
  // RenoDX: <<< [Patch: BasicPostProcessChromaticAberration]
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
  float _310;
  float _311;
  float _312;
  float _347;
  float _432;
  float _433;
  float _434;
  float _475;
  float _476;
  float _477;
  float _528;
  float _529;
  float _530;
  float _592;
  float _593;
  float _594;
  float _595;
  float _596;
  float _597;
  float _667;
  float _668;
  float _669;
  float _726;
  float _727;
  float _928;
  float _929;
  float _930;
  float _963;
  float _964;
  float _965;
  int _966;
  float _1143;
  float _1144;
  float _1145;
  float _1208;
  float _1209;
  float _1210;
  float _1250;
  float _1251;
  float _1252;
  float _1387;
  float _1388;
  float _1389;
  float _1451;
  float _1452;
  float _1453;
  float _1454;
  float _1455;
  float _1456;
  float _1655;
  float _1742;
  float _1743;
  float _1744;
  float _1866;
  float _1867;
  float _1868;
  float _1987;
  float _1988;
  float _1989;
  float _2107;
  float _2108;
  float _2109;
  float _2170;
  float _2171;
  float _2172;
  bool _2524;
  bool _2541;
  float _2588;
  float _2589;
  float _2590;
  float _2591;
  float _2724;
  float _2725;
  float _2726;
  float _2756;
  float _2757;
  float _2758;
  float _2901;
  float _2902;
  float _2903;
  float _2917;
  float _3122;
  float _3123;
  float _3124;
  float _3217;
  float _3218;
  float _3219;
  float _3273;
  float _3274;
  float _3275;
  float _3294;
  float _3295;
  float _3296;
  float _3326;
  float _3327;
  float _3328;
  float _3342;
  float _3343;
  float _3344;
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
  int _247 = WaveReadLaneFirst(_materialIndex);
  int _255 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_247 < (uint)170000), _247, 0)) + 0u))]._noiseTex);
  [branch]
  if (!(!(_fleeCount >= 0.0010000000474974513f))) {
    float4 _279 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_255 < (uint)65000), _255, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((TEXCOORD.x * 4.0f), ((((_fleeCount * 0.0010000000474974513f) + -0.10000000149011612f) + ((TEXCOORD.y / _36) * 4.0f)) + (_time.x * 0.019999999552965164f))));
    float _288 = (TEXCOORD.x + -0.5f) + ((_279.x + -0.5f) * 0.15000000596046448f);
    float _289 = (TEXCOORD.y + -0.5f) + ((_279.y + -0.5f) * 0.15000000596046448f);
    float _302 = saturate(_fleeCount * 0.20000000298023224f) * saturate((((_fleeCount * 0.004999999888241291f) + -0.6000000238418579f) + sqrt((_288 * _288) + (_289 * _289))) / ((_fleeCount * 0.004000000189989805f) + 0.10000000149011612f));
    _310 = (_243.x - (_302 * _243.x));
    _311 = (_243.y - (_302 * _243.y));
    _312 = (_243.z - (_302 * _243.z));
  } else {
    _310 = _243.x;
    _311 = _243.y;
    _312 = _243.z;
  }
  int _313 = WaveReadLaneFirst(_materialIndex);
  if (((_227 >= 0.0010000000474974513f)) || ((WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_313 < (uint)170000), _313, 0)) + 0u))]._uiMainMenuEffect) >= 0.0010000000474974513f))) {
    int _326 = WaveReadLaneFirst(_materialIndex);
    if (WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_326 < (uint)170000), _326, 0)) + 0u))]._uiMainMenuEffect) > _227) {
      int _337 = WaveReadLaneFirst(_materialIndex);
      _347 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_337 < (uint)170000), _337, 0)) + 0u))]._uiMainMenuEffect);
    } else {
      _347 = _227;
    }
    float _355 = _347 * 0.5f;
    float4 _379 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_255 < (uint)65000), _255, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((TEXCOORD.x * 2.0f) * _36), (TEXCOORD.y * 2.0f)));
    int _384 = WaveReadLaneFirst(_materialIndex);
    bool _394 = (_227 < 0.0010000000474974513f);
    bool _395 = (_394) && ((WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_384 < (uint)170000), _384, 0)) + 0u))]._uiMainMenuEffect) >= 0.0010000000474974513f));
    int _397 = WaveReadLaneFirst(_materialIndex);
    float _415 = (TEXCOORD.y - select(_395, 0.550000011920929f, 0.5f)) - ((_379.y + -0.5f) * 0.05000000074505806f);
    float _416 = ((TEXCOORD.x - ((_379.x + -0.5f) * 0.05000000074505806f)) + select(_395, -0.41999998688697815f, -0.5f)) * _36;
    float _427 = ((_347 * -0.8999999761581421f) * (1.0f - saturate((select(((_394) && ((WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_397 < (uint)170000), _397, 0)) + 0u))]._uiMainMenuEffect) >= 0.0010000000474974513f))), 0.3499999940395355f, 0.4000000059604645f) - sqrt((_416 * _416) + (_415 * _415))) * 1.4285714626312256f))) + 1.0f;
    _432 = (_427 * ((_355 * (((_311 * 0.75f) - (_310 * 0.6069999933242798f)) + (_312 * 0.1889999955892563f))) + _310));
    _433 = (_427 * ((_355 * (((_310 * 0.3490000069141388f) - (_311 * 0.3140000104904175f)) + (_312 * 0.1679999977350235f))) + _311));
    _434 = (_427 * ((_355 * (((_310 * 0.2720000147819519f) + (_311 * 0.5339999794960022f)) - (_312 * 0.8690000176429749f))) + _312));
  } else {
    _432 = _310;
    _433 = _311;
    _434 = _312;
  }
  if ((((_50 >= 0.0010000000474974513f)) && ((_81 >= 0.0010000000474974513f))) | (((_59 >= 0.0010000000474974513f)) && ((_94 >= 0.0010000000474974513f))) | (((_68 >= 0.0010000000474974513f)) && ((_107 >= 0.0010000000474974513f)))) {
    float _449 = _239 + -0.5f;
    float _450 = _240 + -0.5f;
    float _459 = rsqrt(dot(float2(_449, _450), float2(_449, _450))) * ((max(max(_81, _94), _107) * 0.009999999776482582f) * sqrt((_450 * _450) + (_449 * _449)));
    float _460 = _459 * _449;
    float _462 = _459 * _450;
    float4 _468 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_239 - _460), (_240 - _462)));
    float4 _470 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_239, _240));
    float4 _472 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_460 + _239), (_462 + _240)));
    _475 = _468.x;
    _476 = _470.y;
    _477 = _472.z;
  } else {
    _475 = _432;
    _476 = _433;
    _477 = _434;
  }
  if (((_120 >= 0.0010000000474974513f)) && ((_129 >= 0.0010000000474974513f))) {
    int _482 = WaveReadLaneFirst(_materialIndex);
    float _493 = _239 - WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_482 < (uint)170000), _482, 0)) + 0u))]._chromaticAberrationShiftPosition.x);
    float _494 = _240 - WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_482 < (uint)170000), _482, 0)) + 0u))]._chromaticAberrationShiftPosition.y);
    float _503 = rsqrt(dot(float2(_493, _494), float2(_493, _494))) * ((_129 * 0.009999999776482582f) * sqrt((_494 * _494) + (_493 * _493)));
    float _504 = _503 * _493;
    float _506 = _503 * _494;
    float4 _512 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_239 - _504), (_240 - _506)));
    float4 _514 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_239, _240));
    float4 _516 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_504 + _239), (_506 + _240)));
    _528 = (lerp(_475, _512.x, _120));
    _529 = (lerp(_476, _514.y, _120));
    _530 = (lerp(_477, _516.z, _120));
  } else {
    _528 = _432;
    _529 = _433;
    _530 = _434;
  }
  int _531 = WaveReadLaneFirst(_materialIndex);
  float _539 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_531 < (uint)170000), _531, 0)) + 0u))]._detectModeG);
  int _540 = WaveReadLaneFirst(_materialIndex);
  float _548 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_540 < (uint)170000), _540, 0)) + 0u))]._detectModeR);
  int _549 = WaveReadLaneFirst(_materialIndex);
  float _557 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_549 < (uint)170000), _549, 0)) + 0u))]._detectModeB);
  int _558 = WaveReadLaneFirst(_materialIndex);
  float _566 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_558 < (uint)170000), _558, 0)) + 0u))]._detectModeKnowledge);
  int _567 = WaveReadLaneFirst(_materialIndex);
  float _575 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_567 < (uint)170000), _567, 0)) + 0u))]._detectModeInterrupt);
  float _580 = saturate((((_548 + _539) + _557) + _566) + _575);
  [branch]
  if (_580 > 0.0f) {
    if (!(_539 >= 0.0010000000474974513f)) {
      if (!(_548 >= 0.0010000000474974513f)) {
        if (!(_557 >= 0.0010000000474974513f)) {
          if (!(!(_566 >= 0.0010000000474974513f))) {
            _592 = 0.6000000238418579f;
            _593 = 0.6000000238418579f;
            _594 = 0.800000011920929f;
            _595 = 0.5f;
            _596 = 0.44999998807907104f;
            _597 = 0.949999988079071f;
          } else {
            _592 = 0.0f;
            _593 = 0.0f;
            _594 = 0.0f;
            _595 = 0.0f;
            _596 = 0.0f;
            _597 = 0.0f;
          }
        } else {
          _592 = 0.6000000238418579f;
          _593 = 0.699999988079071f;
          _594 = 0.699999988079071f;
          _595 = 0.6000000238418579f;
          _596 = 0.699999988079071f;
          _597 = 0.800000011920929f;
        }
      } else {
        _592 = 0.699999988079071f;
        _593 = 0.6000000238418579f;
        _594 = 0.6000000238418579f;
        _595 = 0.800000011920929f;
        _596 = 0.699999988079071f;
        _597 = 0.6000000238418579f;
      }
    } else {
      _592 = 0.6000000238418579f;
      _593 = 0.699999988079071f;
      _594 = 0.6000000238418579f;
      _595 = 0.6000000238418579f;
      _596 = 0.800000011920929f;
      _597 = 0.699999988079071f;
    }
    bool _598 = (_575 >= 0.0010000000474974513f);
    float _602 = select(_598, 0.800000011920929f, _595);
    float _603 = select(_598, 0.6000000238418579f, _596);
    float _604 = select(_598, 0.20000000298023224f, _597);
    float _611 = (1.0f - _602) * 0.3086000084877014f;
    float _613 = (1.0f - _603) * 0.6093999743461609f;
    float _615 = (1.0f - _604) * 0.0820000022649765f;
    float _617 = select(_598, 2.0f, _592) * _528;
    float _618 = select(_598, 2.0f, _593) * _529;
    float _619 = select(_598, 2.0f, _594) * _530;
    float _623 = _611 * _617;
    float _628 = 0.009999999776482582f / max(0.0010000000474974513f, _exposure0.x);
    float _638 = max((abs(TEXCOORD.x + -0.5f) + -0.07500000298023224f), 0.0f);
    float _639 = max((abs(TEXCOORD.y + -0.5f) + -0.07500000298023224f), 0.0f);
    float _647 = (_580 * 0.75f) * saturate(sqrt((_639 * _639) + (_638 * _638)) * 2.0f);
    float _654 = ((mad(_619, _615, mad(_618, _613, ((_611 + _602) * _617))) - _528) * _580) + _528;
    float _655 = ((mad(_619, _615, mad(_618, (_613 + _603), _623)) - _529) * _580) + _529;
    float _656 = ((mad(_619, (_615 + _604), mad(_618, _613, _623)) - _530) * _580) + _530;
    _667 = ((_647 * ((_628 * _602) - _654)) + _654);
    _668 = ((_647 * ((_628 * _603) - _655)) + _655);
    _669 = ((_647 * ((_628 * _604) - _656)) + _656);
  } else {
    _667 = _528;
    _668 = _529;
    _669 = _530;
  }
  if ((((((_highLightForVisionRemoteCatch > 0.0f)) || ((_highLightForVision > 0.0f)))) || ((_characterHighlight > 0.0f))) | (_followLearning > 0.0010000000474974513f)) {
    int2 _685; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_685.x, _685.y);
    uint _700 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_685.x))))) + 0.5f) * _239), int((float((int)(int(float((int)(_685.y))))) + 0.5f) * _240), 0));
    int _702 = _700.x & 255;
    float _710 = (float((uint)((uint)((uint)((uint)(_700.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
    float _711 = (float((uint)((uint)(((uint)((uint)(_700.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
    float _713 = 1.0f - abs(_710);
    float _714 = abs(_711);
    float _715 = _713 - _714;
    if (!(_715 >= 0.0f)) {
      _726 = (select((_710 >= 0.0f), 1.0f, -1.0f) * (1.0f - _714));
      _727 = (select((_711 >= 0.0f), 1.0f, -1.0f) * _713);
    } else {
      _726 = _710;
      _727 = _711;
    }
    float _729 = rsqrt(dot(float3(_726, _727, _715), float3(_726, _727, _715)));
    float _730 = _729 * _726;
    float _731 = _729 * _727;
    float _732 = _729 * _715;
    float _734 = rsqrt(dot(float3(_730, _731, _732), float3(_730, _731, _732)));
    float4 _740 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_239, _240));
    [branch]
    if (_702 == _renderPassTest) {
      int _753 = WaveReadLaneFirst(_materialIndex);
      float _762 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_753 < (uint)170000), _753, 0)) + 0u))]._testEffectRatio) * (1.0f / max(0.0010000000474974513f, _exposure0.x));
      _963 = (_762 + _667);
      _964 = _668;
      _965 = (_762 + _669);
      _966 = _702;
    } else {
      if ((_702 == _renderPassDetectObjective) || ((!(_702 == _renderPassDetectObjective)) && (_702 == _renderPassKnowledgeNPC))) {
        float4 _785 = __3__36__0__0__g_noiseTex.SampleLevel(__0__4__0__0__g_staticPointWrap, float2(frac((TEXCOORD.x * 0.015625f) * _bufferSizeAndInvSize.x), frac((TEXCOORD.y * 0.015625f) * _bufferSizeAndInvSize.y)), 0.0f);
        float _788 = (_785.x * 0.5f) + 0.5f;
        _963 = ((((_788 * _740.x) - _667) * _740.w) + _667);
        _964 = ((((_788 * _740.y) - _668) * _740.w) + _668);
        _965 = ((((_788 * _740.z) - _669) * _740.w) + _669);
        _966 = _702;
      } else {
        bool __defer_801_882 = false;
        if (!(_702 == _renderPassDetectRemoteCatch) || ((_702 == _renderPassDetectRemoteCatch) && (!(WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)(WaveReadLaneFirst(_materialIndex)) < (uint)170000), (WaveReadLaneFirst(_materialIndex)), 0)) + 0u))]._itemRatio) > 0.0010000000474974513f))) || (((_702 == _renderPassDetectRemoteCatch) && (WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)(WaveReadLaneFirst(_materialIndex)) < (uint)170000), (WaveReadLaneFirst(_materialIndex)), 0)) + 0u))]._itemRatio) > 0.0010000000474974513f)) && (!(((_highLightForVision > 0.0f)) || ((_highLightForVisionRemoteCatch > 0.0f)))))) {
          __defer_801_882 = true;
        } else {
          int _823 = WaveReadLaneFirst(_materialIndex);
          int _831 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_823 < (uint)170000), _823, 0)) + 0u))]._detectColorBase);
          float _834 = float((uint)((uint)(((uint)((uint)(_831)) >> 16) & 255)));
          float _837 = float((uint)((uint)(((uint)((uint)(_831)) >> 8) & 255)));
          float _839 = float((uint)((uint)(_831 & 255)));
          float _872 = max(0.0010000000474974513f, _exposure0.x);
          _963 = ((((select(((_834 * 0.003921568859368563f) < 0.040449999272823334f), (_834 * 0.0003035269910469651f), exp2(log2((_834 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * 10.0f) / _872) * _740.w) + _667);
          _964 = ((((select(((_837 * 0.003921568859368563f) < 0.040449999272823334f), (_837 * 0.0003035269910469651f), exp2(log2((_837 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * 10.0f) / _872) * _740.w) + _668);
          _965 = ((((select(((_839 * 0.003921568859368563f) < 0.040449999272823334f), (_839 * 0.0003035269910469651f), exp2(log2((_839 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * 10.0f) / _872) * _740.w) + _669);
          _966 = _702;
        }
        if (__defer_801_882) {
          bool _885 = (_702 == _renderPassSelfPlayer);
          bool __defer_882_897 = false;
          if ((_885) | (((_702 == _renderPassTest)) || ((_702 == _renderPassEnemy))) | (_702 == _renderPassDetectPickedRemoteCatch)) {
            __defer_882_897 = true;
          } else {
            _963 = _667;
            _964 = _668;
            _965 = _669;
            _966 = _702;
          }
          if (__defer_882_897) {
            if (((_characterHighlight > 0.0010000000474974513f)) || ((_highLightForVisionRemoteCatch > 0.0010000000474974513f))) {
              float _914 = 1.0f - saturate(dot(float3((_734 * _730), (_734 * _731), (_734 * _732)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
              float _915 = _914 * _914;
              float _916 = _915 * _915;
              if (!_885) {
                if (!(_702 == _renderPassTest)) {
                  bool _923 = (_702 == _renderPassEnemy);
                  _928 = select(_923, 1.0f, 0.20000000298023224f);
                  _929 = select(_923, 0.30000001192092896f, 0.4000000059604645f);
                  _930 = select(_923, 0.30000001192092896f, 1.0f);
                } else {
                  _928 = 1.0f;
                  _929 = 1.0f;
                  _930 = 1.0f;
                }
              } else {
                _928 = 1.0f;
                _929 = 1.0f;
                _930 = 1.0f;
              }
              float _937 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
              _963 = ((((_740.x - _667) + ((((_937 + (_667 * 10.0f)) * _928) - _740.x) * _916)) * _740.w) + _667);
              _964 = ((((_740.y - _668) + ((((_937 + (_668 * 10.0f)) * _929) - _740.y) * _916)) * _740.w) + _668);
              _965 = ((((_740.z - _669) + ((((_937 + (_669 * 10.0f)) * _930) - _740.z) * _916)) * _740.w) + _669);
              _966 = _702;
            } else {
              _963 = _667;
              _964 = _668;
              _965 = _669;
              _966 = _702;
            }
          }
        }
      }
    }
  } else {
    _963 = _667;
    _964 = _668;
    _965 = _669;
    _966 = 0;
  }
  if (!(!(_wantedRegionRatio >= 0.0010000000474974513f))) {
    [branch]
    if (!(!(_wantedRegionOpacity >= 0.0010000000474974513f))) {
      int _975 = WaveReadLaneFirst(_materialIndex);
      int _983 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_975 < (uint)170000), _975, 0)) + 0u))]._wantedRegionColor);
      float _986 = float((uint)((uint)(((uint)((uint)(_983)) >> 16) & 255)));
      float _989 = float((uint)((uint)(((uint)((uint)(_983)) >> 8) & 255)));
      float _991 = float((uint)((uint)(_983 & 255)));
      float _1024 = max(0.0010000000474974513f, _exposure0.x);
      float _1032 = _wantedRegionRadius * _wantedRegionRatio;
      float _1034 = saturate(_1032) * 4.0f;
      float _1037 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_239, _240));
      float _1040 = (_239 * 2.0f) + -1.0f;
      float _1042 = 1.0f - (_240 * 2.0f);
      float _1043 = max(1.0000000116860974e-07f, _1037.x);
      float _1071 = mad((_invViewProj[3].z), _1043, mad((_invViewProj[3].y), _1042, ((_invViewProj[3].x) * _1040))) + (_invViewProj[3].w);
      float _1077 = ((mad((_invViewProj[0].z), _1043, mad((_invViewProj[0].y), _1042, ((_invViewProj[0].x) * _1040))) + (_invViewProj[0].w)) / _1071) - _wantedRegionPosition.x;
      float _1078 = ((mad((_invViewProj[2].z), _1043, mad((_invViewProj[2].y), _1042, ((_invViewProj[2].x) * _1040))) + (_invViewProj[2].w)) / _1071) - _wantedRegionPosition.z;
      float _1082 = sqrt((_1077 * _1077) + (_1078 * _1078));
      float _1089 = saturate(floor(_1082 / _1032));
      float _1091 = (1.0f - _1089) * saturate(((_1034 - _1032) + _1082) / _1034);
      float _1098 = (1.0f - saturate((_1082 - _1032) / _1034)) * _1089;
      float _1102 = saturate(((_1098 * _1098) * _1098) + ((_1091 * _1091) * _1091));
      float _1105 = saturate((_1102 * 5.0f) + -4.0f);
      float _1106 = _1105 * _1105;
      float _1109 = ((_1106 * _1106) * 9.0f) + 1.0f;
      uint2 _1122 = __3__36__0__0__g_stencil.Load(int3((int)(uint(_bufferSizeAndInvSize.x * _239)), (int)(uint(_bufferSizeAndInvSize.y * _240)), 0));
      int _1124 = _1122.x & 127;
      float _1132 = (((float((uint)((uint)((uint)((uint)(_983)) >> 24))) * 0.003921568859368563f) * _wantedRegionOpacity) * _1102) * float((bool)((uint)(((_1124 != 57)) && (((uint)(_1124 + -53) > (uint)14)))));
      _1143 = ((_1132 * ((_1109 * (select(((_986 * 0.003921568859368563f) < 0.040449999272823334f), (_986 * 0.0003035269910469651f), exp2(log2((_986 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _1024)) - _963)) + _963);
      _1144 = ((_1132 * ((_1109 * (select(((_989 * 0.003921568859368563f) < 0.040449999272823334f), (_989 * 0.0003035269910469651f), exp2(log2((_989 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _1024)) - _964)) + _964);
      _1145 = ((_1132 * ((_1109 * (select(((_991 * 0.003921568859368563f) < 0.040449999272823334f), (_991 * 0.0003035269910469651f), exp2(log2((_991 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _1024)) - _965)) + _965);
    } else {
      _1143 = _963;
      _1144 = _964;
      _1145 = _965;
    }
  } else {
    _1143 = _963;
    _1144 = _964;
    _1145 = _965;
  }
  if (((((_temperatureWarning <= -0.009999999776482582f)) || ((_temperatureWarning >= 0.009999999776482582f)))) || ((_electrocutionWarning > 0.0010000000474974513f))) {
    float4 _1157 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_239, _240));
    float _1163 = _temperatureWarning * 0.009999999776482582f;
    if (_temperatureWarning > 0.0f) {
      float _1166 = saturate(saturate(_1163));
      float _1167 = TEXCOORD.x + -0.5f;
      float _1168 = TEXCOORD.y + -0.6000000238418579f;
      float _1176 = saturate((_1166 + -0.5f) + sqrt((_1168 * _1168) + (_1167 * _1167))) * _1166;
      float _1181 = (1.0f - (_1176 * 0.30000001192092896f)) * _1144;
      float _1182 = (1.0f - (_1176 * 0.699999988079071f)) * _1145;
      _1208 = ((_1157.x - _1143) * _1157.w);
      _1209 = (lerp(_1181, _1157.y, _1157.w));
      _1210 = (lerp(_1182, _1157.z, _1157.w));
    } else {
      float _1197 = (_1157.w * (1.0f - TEXCOORD.y)) * saturate(abs(_1163) * 2.0f);
      _1208 = (_1197 * (_1157.x - (_1143 * 0.30000001192092896f)));
      _1209 = ((_1197 * (_1157.y - (_1144 * 0.10000002384185791f))) + _1144);
      _1210 = ((_1197 * _1157.z) + _1145);
    }
    float _1211 = _1143 + _1208;
    if (!(_electrocutionWarning == 0.0f)) {
      float _1217 = max(0.0010000000474974513f, _exposure0.x);
      float _1221 = TEXCOORD.x + -0.5f;
      float _1222 = TEXCOORD.y + -0.6000000238418579f;
      float _1230 = (_electrocutionWarning * 0.5f) * saturate(sqrt((_1222 * _1222) + (_1221 * _1221)) + -0.30000001192092896f);
      float _1237 = (_1230 * ((0.05000000074505806f / _1217) - _1211)) + _1211;
      float _1238 = (_1230 * ((0.10000000149011612f / _1217) - _1209)) + _1209;
      float _1239 = (_1230 * ((0.5f / _1217) - _1210)) + _1210;
      _1250 = (lerp(_1237, _1157.x, _1157.w));
      _1251 = (lerp(_1238, _1157.y, _1157.w));
      _1252 = (lerp(_1239, _1157.z, _1157.w));
    } else {
      _1250 = _1211;
      _1251 = _1209;
      _1252 = _1210;
    }
  } else {
    _1250 = _1143;
    _1251 = _1144;
    _1252 = _1145;
  }
  [branch]
  if (!(!(_hpPercentage <= 20.0f))) {
    float _1258 = 1.0f - (_hpPercentage * 0.009999999776482582f);
    if (((!(_hpPercentage <= 0.0f))) && ((_1258 >= 0.0010000000474974513f))) {
      float _1273 = _time.x * 0.30000001192092896f;
      float4 _1282 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_255 < (uint)65000), _255, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_1273 + (TEXCOORD.x * 12.0f)), (_1273 + (TEXCOORD.y * 6.0f))));
      float _1284 = _1282.w * 0.10000000149011612f;
      int _1287 = WaveReadLaneFirst(_materialIndex);
      int _1295 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1287 < (uint)170000), _1287, 0)) + 0u))]._borderEdgeNoiseTexture);
      float4 _1302 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1295 < (uint)65000), _1295, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((TEXCOORD.x * 2.0f) + 0.30000001192092896f) + _1284), (_1284 + TEXCOORD.y)));
      float _1309 = (_hpPercentage * 0.0020000000949949026f) + 0.36000001430511475f;
      float _1312 = max((abs(TEXCOORD.x + -0.5f) - _1309), 0.0f);
      float _1313 = max((abs(TEXCOORD.y + -0.5f) - _1309), 0.0f);
      float _1325 = sin(frac(_time.x * (2.0f - (_hpPercentage * 0.05000000074505806f))) * 3.1415927410125732f);
      float _1337 = 1.0f - _240;
      float _1340 = saturate((_1337 * _1337) * 2.0f);
      float _1341 = saturate(_1325);
      bool _1349 = ((_isPhotosensitiveMode_isAllolwBlood & 1) != 0);
      float _1351 = (_1341 * 0.0112674031406641f) + 0.022386489436030388f;
      float _1360 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
      float _1362 = select(_1349, 0.006995410192757845f, 0.04317210242152214f) * _1360;
      float _1366 = (min(max(_1258, 0.0f), 1.0f) * saturate((saturate(((_1325 * 0.19999998807907104f) + 0.800000011920929f) * saturate(sqrt((_1313 * _1313) + (_1312 * _1312)) * 3.846153974533081f)) * 2.0f) - (_1302.x * 1.440000057220459f))) * _1340;
      float _1367 = _1340 * (0.12999999523162842f - (_hpPercentage * 0.006000000052154064f));
      float _1374 = (((select(_1349, 0.215860515832901f, 0.04317210242152214f) * _1360) - _1250) * _1367) + _1250;
      float _1375 = ((_1362 - _1251) * _1367) + _1251;
      float _1376 = ((_1362 - _1252) * _1367) + _1252;
      _1387 = ((((select(_1349, ((_1341 * 0.056337013840675354f) + 0.11193244159221649f), _1351) * _1360) - _1374) * _1366) + _1374);
      _1388 = ((((select(_1349, ((_1341 * 0.0053743417374789715f) + 0.0021246890537440777f), _1351) * _1360) - _1375) * _1366) + _1375);
      _1389 = ((((select(_1349, 0.0021246890537440777f, _1351) * _1360) - _1376) * _1366) + _1376);
    } else {
      _1387 = _1250;
      _1388 = _1251;
      _1389 = _1252;
    }
  } else {
    _1387 = _1250;
    _1388 = _1251;
    _1389 = _1252;
  }
  int _1390 = WaveReadLaneFirst(_materialIndex);
  float _1400 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1390 < (uint)170000), _1390, 0)) + 0u))]._channelBrightness.x);
  float _1401 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1390 < (uint)170000), _1390, 0)) + 0u))]._channelBrightness.y);
  float _1402 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1390 < (uint)170000), _1390, 0)) + 0u))]._channelBrightness.z);
  int _1403 = WaveReadLaneFirst(_materialIndex);
  float _1413 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1403 < (uint)170000), _1403, 0)) + 0u))]._saturation.x);
  float _1414 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1403 < (uint)170000), _1403, 0)) + 0u))]._saturation.y);
  float _1415 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1403 < (uint)170000), _1403, 0)) + 0u))]._saturation.z);
  int _1416 = WaveReadLaneFirst(_materialIndex);
  bool _1429 = (WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_130 < (uint)170000), _130, 0)) + 0u))]._isBloodEffect) > 0.0010000000474974513f);
  if ((_1429) && (((_isPhotosensitiveMode_isAllolwBlood & 1) == 0))) {
    bool _1436 = ((_1400 > (_1401 + 0.05000000074505806f))) && ((_1400 > (_1402 + 0.05000000074505806f)));
    float _1437 = _1400 * 0.4000000059604645f;
    bool _1445 = ((_1413 > (_1414 + 0.05000000074505806f))) && ((_1413 > (_1415 + 0.05000000074505806f)));
    float _1446 = _1413 * 0.4000000059604645f;
    _1451 = select(_1436, _1437, _1400);
    _1452 = select(_1436, _1437, _1401);
    _1453 = select(_1436, _1437, _1402);
    _1454 = select(_1445, _1446, _1413);
    _1455 = select(_1445, _1446, _1414);
    _1456 = select(_1445, _1446, _1415);
  } else {
    _1451 = _1400;
    _1452 = _1401;
    _1453 = _1402;
    _1454 = _1413;
    _1455 = _1414;
    _1456 = _1415;
  }
  float _1457 = _1451 * _1387;
  float _1458 = _1452 * _1388;
  float _1459 = _1453 * _1389;
  float _1463 = (1.0f - _1454) * 0.3086000084877014f;
  float _1465 = (1.0f - _1455) * 0.6093999743461609f;
  float _1467 = (1.0f - _1456) * 0.0820000022649765f;
  float _1472 = _1463 * _1457;
  float _1489 = max(WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1416 < (uint)170000), _1416, 0)) + 0u))]._contrast), 0.0f);
  float _1496 = max(0.0f, ((_1489 * (mad(_1459, _1467, mad(_1458, _1465, ((_1463 + _1454) * _1457))) + -0.5f)) + 0.5f));
  float _1497 = max(0.0f, ((_1489 * (mad(_1459, _1467, mad(_1458, (_1465 + _1455), _1472)) + -0.5f)) + 0.5f));
  float _1498 = max(0.0f, ((_1489 * (mad(_1459, (_1467 + _1456), mad(_1458, _1465, _1472)) + -0.5f)) + 0.5f));
  int _1499 = WaveReadLaneFirst(_materialIndex);
  float _1507 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1499 < (uint)170000), _1499, 0)) + 0u))]._invertColor);
  float _1510 = _exposure2.x * 4.0f;
  float _1520 = ((_1510 - (_1496 * 2.0f)) * _1507) + _1496;
  float _1521 = ((_1510 - (_1497 * 2.0f)) * _1507) + _1497;
  float _1522 = ((_1510 - (_1498 * 2.0f)) * _1507) + _1498;
  int _1523 = WaveReadLaneFirst(_materialIndex);
  float _1531 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1523 < (uint)170000), _1523, 0)) + 0u))]._borderRatio);
  [branch]
  if (!(!(_1531 >= 0.0010000000474974513f))) {
    int _1534 = WaveReadLaneFirst(_materialIndex);
    int _1547 = WaveReadLaneFirst(_materialIndex);
    int _1560 = WaveReadLaneFirst(_materialIndex);
    int _1568 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1560 < (uint)170000), _1560, 0)) + 0u))]._borderEdgeNoiseTexture);
    float4 _1575 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_1568 < (uint)65000), _1568, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1547 < (uint)170000), _1547, 0)) + 0u))]._borderEdgeNoiseOffset.x) + (WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1534 < (uint)170000), _1534, 0)) + 0u))]._borderEdgeNoiseTile.x) * TEXCOORD.x)), (WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1547 < (uint)170000), _1547, 0)) + 0u))]._borderEdgeNoiseOffset.y) + (WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1534 < (uint)170000), _1534, 0)) + 0u))]._borderEdgeNoiseTile.y) * TEXCOORD.y))));
    int _1577 = WaveReadLaneFirst(_materialIndex);
    int _1586 = WaveReadLaneFirst(_materialIndex);
    float _1600 = (1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1586 < (uint)170000), _1586, 0)) + 0u))]._borderWidth)) * 0.5f;
    float _1603 = max((abs(TEXCOORD.x + -0.5f) - _1600), 0.0f);
    float _1604 = max((abs(TEXCOORD.y + -0.5f) - _1600), 0.0f);
    float _1613 = 1.0f - ((1.0f - saturate(sqrt((_1604 * _1604) + (_1603 * _1603)) / WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1577 < (uint)170000), _1577, 0)) + 0u))]._borderSmoothness))) * 2.0f);
    int _1614 = WaveReadLaneFirst(_materialIndex);
    float _1622 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1614 < (uint)170000), _1614, 0)) + 0u))]._borderFlickerSpeed);
    if (_1622 > 0.0010000000474974513f) {
      int _1625 = WaveReadLaneFirst(_materialIndex);
      int _1643 = WaveReadLaneFirst(_materialIndex);
      _1655 = ((min(max(sin((_1622 * 3.1415927410125732f) * _time.x), WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1625 < (uint)170000), _1625, 0)) + 0u))]._borderFlickerOpacityMinMax.x)), WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1625 < (uint)170000), _1625, 0)) + 0u))]._borderFlickerOpacityMinMax.y)) * _1613) * WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1643 < (uint)170000), _1643, 0)) + 0u))]._borderFlickerIntensity));
    } else {
      _1655 = _1613;
    }
    int _1657 = WaveReadLaneFirst(_materialIndex);
    float _1671 = min(max(_1531, 0.0f), 1.0f) * saturate(saturate(_1655) - (WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1657 < (uint)170000), _1657, 0)) + 0u))]._borderEdgeNoiseRatio) * _1575.x));
    int _1672 = WaveReadLaneFirst(_materialIndex);
    int _1680 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1672 < (uint)170000), _1672, 0)) + 0u))]._borderColor);
    float _1683 = float((uint)((uint)(((uint)((uint)(_1680)) >> 16) & 255)));
    float _1686 = float((uint)((uint)(((uint)((uint)(_1680)) >> 8) & 255)));
    float _1688 = float((uint)((uint)(_1680 & 255)));
    float _1713 = select(((_1683 * 0.003921568859368563f) < 0.040449999272823334f), (_1683 * 0.0003035269910469651f), exp2(log2((_1683 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    bool _1720 = (_1429) && (((_isPhotosensitiveMode_isAllolwBlood & 1) == 0));
    float _1721 = _1713 * 0.4000000059604645f;
    float _1728 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
    _1742 = ((((select(_1720, _1721, _1713) * _1728) - _1520) * _1671) + _1520);
    _1743 = ((((select(_1720, _1721, select(((_1686 * 0.003921568859368563f) < 0.040449999272823334f), (_1686 * 0.0003035269910469651f), exp2(log2((_1686 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) * _1728) - _1521) * _1671) + _1521);
    _1744 = ((((select(_1720, _1721, select(((_1688 * 0.003921568859368563f) < 0.040449999272823334f), (_1688 * 0.0003035269910469651f), exp2(log2((_1688 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) * _1728) - _1522) * _1671) + _1522);
  } else {
    _1742 = _1520;
    _1743 = _1521;
    _1744 = _1522;
  }
  [branch]
  if (!(!(_59 >= 0.0010000000474974513f))) {
    float _1747 = TEXCOORD.x + -0.5f;
    float _1748 = TEXCOORD.y + -0.5f;
    int _1753 = WaveReadLaneFirst(_materialIndex);
    int _1767 = WaveReadLaneFirst(_materialIndex);
    float _1780 = saturate(exp2(log2(abs(0.5f - TEXCOORD.x)) * WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1767 < (uint)170000), _1767, 0)) + 0u))]._statusVignettePower2)) * (sqrt((_1748 * _1748) + (_1747 * _1747)) / max(0.0010000000474974513f, (1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1753 < (uint)170000), _1753, 0)) + 0u))]._statusVignetteRadius2)))));
    float _1785 = saturate(_59 * 10.0f) * saturate(_1780 * 2.0f);
    float _1792 = (_1785 * (_475 - _1742)) + _1742;
    float _1793 = (_1785 * (_476 - _1743)) + _1743;
    float _1794 = (_1785 * (_477 - _1744)) + _1744;
    int _1795 = WaveReadLaneFirst(_materialIndex);
    int _1803 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1795 < (uint)170000), _1795, 0)) + 0u))]._statusVignetteColor2);
    float _1806 = float((uint)((uint)(((uint)((uint)(_1803)) >> 16) & 255)));
    float _1809 = float((uint)((uint)(((uint)((uint)(_1803)) >> 8) & 255)));
    float _1811 = float((uint)((uint)(_1803 & 255)));
    float _1836 = select(((_1806 * 0.003921568859368563f) < 0.040449999272823334f), (_1806 * 0.0003035269910469651f), exp2(log2((_1806 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    bool _1843 = (_1429) && (((_isPhotosensitiveMode_isAllolwBlood & 1) == 0));
    float _1844 = _1836 * 0.20000000298023224f;
    float _1851 = max(0.0010000000474974513f, _exposure0.x);
    float _1858 = saturate(_1780) * _59;
    _1866 = ((((select(_1843, _1844, _1836) / _1851) - _1792) * _1858) + _1792);
    _1867 = ((((select(_1843, _1844, select(((_1809 * 0.003921568859368563f) < 0.040449999272823334f), (_1809 * 0.0003035269910469651f), exp2(log2((_1809 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) / _1851) - _1793) * _1858) + _1793);
    _1868 = ((((select(_1843, _1844, select(((_1811 * 0.003921568859368563f) < 0.040449999272823334f), (_1811 * 0.0003035269910469651f), exp2(log2((_1811 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) / _1851) - _1794) * _1858) + _1794);
  } else {
    _1866 = _1742;
    _1867 = _1743;
    _1868 = _1744;
  }
  [branch]
  if (!(!(_50 >= 0.0010000000474974513f))) {
    float _1871 = TEXCOORD.x + -0.5f;
    float _1872 = TEXCOORD.y + -0.5f;
    int _1877 = WaveReadLaneFirst(_materialIndex);
    int _1890 = WaveReadLaneFirst(_materialIndex);
    float _1903 = saturate(exp2(log2(1.0f - TEXCOORD.y) * WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1890 < (uint)170000), _1890, 0)) + 0u))]._statusVignettePower1)) * (sqrt((_1872 * _1872) + (_1871 * _1871)) / max(0.0010000000474974513f, (1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1877 < (uint)170000), _1877, 0)) + 0u))]._statusVignetteRadius1)))));
    float _1906 = saturate(_50 * 10.0f) * _1903;
    float _1913 = (_1906 * (_475 - _1866)) + _1866;
    float _1914 = (_1906 * (_476 - _1867)) + _1867;
    float _1915 = (_1906 * (_477 - _1868)) + _1868;
    int _1916 = WaveReadLaneFirst(_materialIndex);
    int _1924 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1916 < (uint)170000), _1916, 0)) + 0u))]._statusVignetteColor1);
    float _1927 = float((uint)((uint)(((uint)((uint)(_1924)) >> 16) & 255)));
    float _1930 = float((uint)((uint)(((uint)((uint)(_1924)) >> 8) & 255)));
    float _1932 = float((uint)((uint)(_1924 & 255)));
    float _1957 = select(((_1927 * 0.003921568859368563f) < 0.040449999272823334f), (_1927 * 0.0003035269910469651f), exp2(log2((_1927 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    bool _1964 = (_1429) && (((_isPhotosensitiveMode_isAllolwBlood & 1) == 0));
    float _1965 = _1957 * 0.20000000298023224f;
    float _1972 = max(0.0010000000474974513f, _exposure0.x);
    float _1979 = saturate(_1903) * _50;
    _1987 = ((((select(_1964, _1965, _1957) / _1972) - _1913) * _1979) + _1913);
    _1988 = ((((select(_1964, _1965, select(((_1930 * 0.003921568859368563f) < 0.040449999272823334f), (_1930 * 0.0003035269910469651f), exp2(log2((_1930 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) / _1972) - _1914) * _1979) + _1914);
    _1989 = ((((select(_1964, _1965, select(((_1932 * 0.003921568859368563f) < 0.040449999272823334f), (_1932 * 0.0003035269910469651f), exp2(log2((_1932 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) / _1972) - _1915) * _1979) + _1915);
  } else {
    _1987 = _1866;
    _1988 = _1867;
    _1989 = _1868;
  }
  [branch]
  if (!(!(_68 >= 0.0010000000474974513f))) {
    float _1992 = TEXCOORD.x + -0.5f;
    float _1993 = TEXCOORD.y + -0.5f;
    int _1998 = WaveReadLaneFirst(_materialIndex);
    int _2010 = WaveReadLaneFirst(_materialIndex);
    float _2023 = saturate(exp2(log2(TEXCOORD.y) * WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2010 < (uint)170000), _2010, 0)) + 0u))]._statusVignettePower3)) * (sqrt((_1993 * _1993) + (_1992 * _1992)) / max(0.0010000000474974513f, (1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_1998 < (uint)170000), _1998, 0)) + 0u))]._statusVignetteRadius3)))));
    float _2026 = saturate(_68 * 10.0f) * _2023;
    float _2033 = (_2026 * (_475 - _1987)) + _1987;
    float _2034 = (_2026 * (_476 - _1988)) + _1988;
    float _2035 = (_2026 * (_477 - _1989)) + _1989;
    int _2036 = WaveReadLaneFirst(_materialIndex);
    int _2044 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2036 < (uint)170000), _2036, 0)) + 0u))]._statusVignetteColor3);
    float _2047 = float((uint)((uint)(((uint)((uint)(_2044)) >> 16) & 255)));
    float _2050 = float((uint)((uint)(((uint)((uint)(_2044)) >> 8) & 255)));
    float _2052 = float((uint)((uint)(_2044 & 255)));
    float _2077 = select(((_2047 * 0.003921568859368563f) < 0.040449999272823334f), (_2047 * 0.0003035269910469651f), exp2(log2((_2047 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    bool _2084 = (_1429) && (((_isPhotosensitiveMode_isAllolwBlood & 1) == 0));
    float _2085 = _2077 * 0.20000000298023224f;
    float _2092 = max(0.0010000000474974513f, _exposure0.x);
    float _2099 = saturate(_2023) * _68;
    _2107 = ((((select(_2084, _2085, _2077) / _2092) - _2033) * _2099) + _2033);
    _2108 = ((((select(_2084, _2085, select(((_2050 * 0.003921568859368563f) < 0.040449999272823334f), (_2050 * 0.0003035269910469651f), exp2(log2((_2050 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) / _2092) - _2034) * _2099) + _2034);
    _2109 = ((((select(_2084, _2085, select(((_2052 * 0.003921568859368563f) < 0.040449999272823334f), (_2052 * 0.0003035269910469651f), exp2(log2((_2052 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) / _2092) - _2035) * _2099) + _2035);
  } else {
    _2107 = _1987;
    _2108 = _1988;
    _2109 = _1989;
  }
  [branch]
  if (!(!(_hideStateRatio >= 0.0010000000474974513f))) {
    float _2114 = _hideStateRatio * 0.5f;
    float _2115 = TEXCOORD.x + -0.5f;
    float _2116 = TEXCOORD.y + -0.5f;
    float _2124 = saturate(((_2114 + -0.5f) + sqrt((_2116 * _2116) + (_2115 * _2115))) * 2.0f);
    float _2132 = saturate(((saturate(abs(0.5f - TEXCOORD.y) * 2.0f) - _2124) * 0.5f) + _2124);
    float _2140 = (((_2132 * _2132) * 0.8999999761581421f) * saturate(_hideStateRatio * 4.0f)) * (3.0f - (_2132 * 2.0f));
    float _2143 = dot(float3(_2107, _2108, _2109), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f)) * (1.0f - _2114);
    float _2146 = (pow(_2140, 0.5f));
    float _2153 = ((_2143 - _2107) * _2146) + _2107;
    float _2154 = ((_2143 - _2108) * _2146) + _2108;
    float _2155 = ((_2143 - _2109) * _2146) + _2109;
    float _2159 = 0.0010000000474974513f / max(0.0010000000474974513f, _exposure0.x);
    _2170 = (lerp(_2153, _2159, _2140));
    _2171 = (lerp(_2154, _2159, _2140));
    _2172 = (lerp(_2155, _2159, _2140));
  } else {
    _2170 = _2107;
    _2171 = _2108;
    _2172 = _2109;
  }
  if (_followLearning > 0.0010000000474974513f) {
    int _2177 = WaveReadLaneFirst(_materialIndex);
    int _2185 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2177 < (uint)170000), _2177, 0)) + 0u))]._followLearningColor);
    float _2188 = float((uint)((uint)(((uint)((uint)(_2185)) >> 16) & 255)));
    float _2191 = float((uint)((uint)(((uint)((uint)(_2185)) >> 8) & 255)));
    float _2193 = float((uint)((uint)(_2185 & 255)));
    float _2223 = max(0.0010000000474974513f, _exposure0.x);
    float _2224 = select(((_2188 * 0.003921568859368563f) < 0.040449999272823334f), (_2188 * 0.0003035269910469651f), exp2(log2((_2188 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _2223;
    float _2225 = select(((_2191 * 0.003921568859368563f) < 0.040449999272823334f), (_2191 * 0.0003035269910469651f), exp2(log2((_2191 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _2223;
    float _2226 = select(((_2193 * 0.003921568859368563f) < 0.040449999272823334f), (_2193 * 0.0003035269910469651f), exp2(log2((_2193 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _2223;
    int _2227 = WaveReadLaneFirst(_materialIndex);
    int _2235 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2227 < (uint)170000), _2227, 0)) + 0u))]._followLearningNoiseTex);
    float4 _2246 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_255 < (uint)65000), _255, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_239, ((_time.x * 0.20000000298023224f) + _240)));
    float _2253 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_239, _240));
    float _2256 = (_239 * 2.0f) + -1.0f;
    float _2258 = 1.0f - (_240 * 2.0f);
    float _2259 = max(1.0000000116860974e-07f, _2253.x);
    float _2295 = mad((_invViewProj[3].z), _2259, mad((_invViewProj[3].y), _2258, ((_invViewProj[3].x) * _2256))) + (_invViewProj[3].w);
    uint _2304 = uint(_bufferSizeAndInvSize.x * _239);
    uint _2305 = uint(_bufferSizeAndInvSize.y * _240);
    uint4 _2307 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_2304), (int)(_2305), 0));
    float4 _2310 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_2304), (int)(_2305), 0));
    float _2328 = (saturate(_2310.x * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _2329 = (saturate(_2310.y * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _2330 = (saturate(_2310.z * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _2332 = rsqrt(dot(float3(_2328, _2329, _2330), float3(_2328, _2329, _2330)));
    float _2333 = _2332 * _2328;
    float _2334 = _2332 * _2329;
    float _2335 = _2330 * _2332;
    float _2338 = (float((uint)((uint)(((uint)((uint)(_2307.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
    float _2339 = (float((uint)((uint)(_2307.w & 255))) * 0.007843137718737125f) + -1.0f;
    float _2342 = (_2338 + _2339) * 0.5f;
    float _2343 = (_2338 - _2339) * 0.5f;
    float _2347 = (1.0f - abs(_2342)) - abs(_2343);
    float _2349 = rsqrt(dot(float3(_2342, _2343, _2347), float3(_2342, _2343, _2347)));
    float _2350 = _2349 * _2342;
    float _2351 = _2349 * _2343;
    float _2352 = _2349 * _2347;
    float _2354 = select((_2335 >= 0.0f), 1.0f, -1.0f);
    float _2357 = -0.0f - (1.0f / (_2354 + _2335));
    float _2358 = _2334 * _2357;
    float _2359 = _2358 * _2333;
    float _2360 = _2354 * _2333;
    float _2369 = mad(_2352, _2333, mad(_2351, _2359, ((((_2360 * _2333) * _2357) + 1.0f) * _2350)));
    float _2373 = mad(_2352, _2334, mad(_2351, (_2354 + (_2358 * _2334)), ((_2350 * _2354) * _2359)));
    float _2377 = mad(_2352, _2335, mad(_2351, (-0.0f - _2334), (-0.0f - (_2360 * _2350))));
    float _2379 = rsqrt(dot(float3(_2369, _2373, _2377), float3(_2369, _2373, _2377)));
    float _2381 = _2379 * _2373;
    float _2382 = _2379 * _2377;
    float _2385 = _time.x * 0.5f;
    float _2388 = (((mad((_invViewProj[2].z), _2259, mad((_invViewProj[2].y), _2258, ((_invViewProj[2].x) * _2256))) + (_invViewProj[2].w)) / _2295) - _2385) * 0.20000000298023224f;
    float _2389 = (((mad((_invViewProj[1].z), _2259, mad((_invViewProj[1].y), _2258, ((_invViewProj[1].x) * _2256))) + (_invViewProj[1].w)) / _2295) - _2385) * 0.20000000298023224f;
    float4 _2396 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_2235 < (uint)65000), _2235, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_2388, _2389));
    float _2399 = (((mad((_invViewProj[0].z), _2259, mad((_invViewProj[0].y), _2258, ((_invViewProj[0].x) * _2256))) + (_invViewProj[0].w)) / _2295) - _2385) * 0.20000000298023224f;
    float4 _2400 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_2235 < (uint)65000), _2235, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_2399, _2388));
    float4 _2402 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_2235 < (uint)65000), _2235, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_2399, _2389));
    float _2408 = (abs(_2381) * (_2400.w - _2396.w)) + _2396.w;
    float _2411 = ((_2402.w - _2408) * abs(_2382)) + _2408;
    float _2412 = _2246.z + -0.5f;
    float _2417 = _239 + -0.5f;
    float _2419 = _240 + -0.5f;
    float _2424 = 0.375f - (_2412 * 0.25f);
    float _2427 = max((abs(((_2246.x + -0.5f) * 0.10000000149011612f) + _2417) - _2424), 0.0f);
    float _2428 = max((abs(((_2246.y + -0.5f) * 0.10000000149011612f) + _2419) - _2424), 0.0f);
    float _2433 = saturate(sqrt((_2428 * _2428) + (_2427 * _2427)));
    float _2437 = saturate(_followLearning * 2.0f);
    float _2443 = saturate(((((_2253.x * 100.0f) * _2437) - _2411) * 2.0f) + -0.5f);
    float _2453 = sqrt((_2419 * _2419) + (_2417 * _2417));
    float _2456 = ((saturate((_2437 * 2.0f) + -1.0f) * (1.0f - _2443)) + _2443) * saturate(_2453 + 0.5f);
    float _2458 = atan(_2419 / _2417);
    bool _2461 = (_2417 < 0.0f);
    bool _2462 = (_2417 == 0.0f);
    bool _2463 = (_2419 >= 0.0f);
    bool _2464 = (_2419 < 0.0f);
    float _2476 = _2411 * 0.5f;
    float4 _2489 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_2235 < (uint)65000), _2235, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((((_2412 * -0.5f) - _2476) - (_time.x * 0.20000000298023224f)) + select(((_2462) && (_2463)), 7.5f, select(((_2462) && (_2464)), -7.5f, (select(((_2461) && (_2464)), (_2458 + -3.1415927410125732f), select(((_2461) && (_2463)), (_2458 + 3.1415927410125732f), _2458)) * 4.774648189544678f)))), (((((_2246.w + -0.5f) * -0.5f) - _2476) + (_2453 * 2.0f)) - (_time.x * 1.5f))));
    float4 _2499 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * _239), int(_customRenderPassSizeInvSize.y * _240), 0));
    float _2503 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_239, _240));
    if (!(_966 == _renderPassSelfPlayer)) {
      _2524 = (_966 == _renderPassTest);
    } else {
      _2524 = true;
    }
    bool _2525 = !((1.0f - saturate(ceil(((_nearFarProj.x / max(1.0000000116860974e-07f, _2503.x)) + 0.5f) - (_nearFarProj.x / max(1.0000000116860974e-07f, _2499.x))))) == 0.0f);
    bool _2527 = (_2525) || ((!_2524));
    if (_966 == _renderPassTargetFocus) {
      if (_2525) {
        _2541 = (_966 != _renderPassAimHighlight);
      } else {
        _2541 = false;
      }
    } else {
      if ((_2525) || ((_966 != _renderPassLearning))) {
        _2541 = (_966 != _renderPassAimHighlight);
      } else {
        _2541 = false;
      }
    }
    float _2543 = saturate(_followLearning * 4.0f);
    float _2550 = (_2543 * (_243.x - _2170)) + _2170;
    float _2551 = (_2543 * (_243.y - _2171)) + _2171;
    float _2552 = (_2543 * (_243.z - _2172)) + _2172;
    bool _2553 = (_2527) && (_2541);
    if (_2553) {
      float _2560 = ((_followLearning * 0.25f) * _2489.w) * saturate(_2453 - (_2543 * 0.20000000298023224f));
      float4 _2564 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_2560 + _239), (_2560 + _240)));
      float _2578 = 1.0f - (_followLearning * 0.75f);
      _2588 = ((lerp(_2550, _2564.x, _2543)) * _2578);
      _2589 = ((lerp(_2551, _2564.y, _2543)) * _2578);
      _2590 = ((lerp(_2552, _2564.z, _2543)) * _2578);
      _2591 = _2456;
    } else {
      if (_2527) {
        _2588 = _2550;
        _2589 = _2551;
        _2590 = _2552;
        _2591 = select(_2541, _2456, 0.0f);
      } else {
        _2588 = _2550;
        _2589 = _2551;
        _2590 = _2552;
        _2591 = (_2456 * 0.4000000059604645f);
      }
    }
    float _2592 = dot(float3(_2588, _2589, _2590), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
    float _2599 = ((_2592 - _2588) * _2591) + _2588;
    float _2600 = ((_2592 - _2589) * _2591) + _2589;
    float _2601 = ((_2592 - _2590) * _2591) + _2590;
    float _2603 = _2411 * (_2246.z * 0.30000001192092896f);
    float _2609 = saturate(_2591 * 5.0f) * 0.8999999761581421f;
    float _2616 = (((_2603 * _2224) - _2599) * _2609) + _2599;
    float _2617 = (((_2603 * _2225) - _2600) * _2609) + _2600;
    float _2618 = (((_2603 * _2226) - _2601) * _2609) + _2601;
    int _2619 = WaveReadLaneFirst(_materialIndex);
    int _2627 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2619 < (uint)170000), _2619, 0)) + 0u))]._followLearningSaturationTone);
    float _2630 = float((uint)((uint)(((uint)((uint)(_2627)) >> 16) & 255)));
    float _2633 = float((uint)((uint)(((uint)((uint)(_2627)) >> 8) & 255)));
    float _2635 = float((uint)((uint)(_2627 & 255)));
    float _2660 = select(((_2630 * 0.003921568859368563f) < 0.040449999272823334f), (_2630 * 0.0003035269910469651f), exp2(log2((_2630 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _2661 = select(((_2633 * 0.003921568859368563f) < 0.040449999272823334f), (_2633 * 0.0003035269910469651f), exp2(log2((_2633 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _2662 = select(((_2635 * 0.003921568859368563f) < 0.040449999272823334f), (_2635 * 0.0003035269910469651f), exp2(log2((_2635 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _2666 = (1.0f - _2660) * 0.3086000084877014f;
    float _2668 = (1.0f - _2661) * 0.6093999743461609f;
    float _2670 = (1.0f - _2662) * 0.0820000022649765f;
    float _2675 = _2666 * _2616;
    float _2688 = (_followLearning * (mad(_2618, _2670, mad(_2617, _2668, ((_2666 + _2660) * _2616))) - _2616)) + _2616;
    float _2689 = (_followLearning * (mad(_2618, _2670, mad(_2617, (_2668 + _2661), _2675)) - _2617)) + _2617;
    float _2690 = (_followLearning * (mad(_2618, (_2670 + _2662), mad(_2617, _2668, _2675)) - _2618)) + _2618;
    if (!_2553) {
      float _2704 = saturate(1.0f - dot(float3((_2476 + (_2379 * _2369)), (_2476 + _2381), (_2476 + _2382)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
      float _2709 = select(_2527, ((_2704 * _2704) * 6.0f), (_2704 * 0.25f)) * _2704;
      float _2713 = (_followLearning * _followLearning) * saturate(_2411 * 10.0f);
      _2724 = (((_2713 * _2224) * _2709) + _2688);
      _2725 = (((_2713 * _2225) * _2709) + _2689);
      _2726 = (((_2713 * _2226) * _2709) + _2690);
    } else {
      _2724 = _2688;
      _2725 = _2689;
      _2726 = _2690;
    }
    float _2727 = _followLearning * _2433;
    float _2731 = 0.0010000000474974513f / max(0.0010000000474974513f, _exposure0.x);
    float _2738 = ((_2731 - _2724) * _2727) + _2724;
    float _2739 = ((_2731 - _2725) * _2727) + _2725;
    float _2740 = ((_2731 - _2726) * _2727) + _2726;
    float _2745 = saturate(((_2489.w * _2489.w) * 20.0f) * _followLearning) * _2433;
    _2756 = (lerp(_2738, _2224, _2745));
    _2757 = (lerp(_2739, _2225, _2745));
    _2758 = (lerp(_2740, _2226, _2745));
  } else {
    _2756 = _2170;
    _2757 = _2171;
    _2758 = _2172;
  }
  [branch]
  if ((dot(float4(_enemyAlert1.x, _enemyAlert1.y, _enemyAlert1.z, _enemyAlert1.w), float4(1.0f, 1.0f, 1.0f, 1.0f)) > 0.0f) | (dot(float4(_enemyAlert2.x, _enemyAlert2.y, _enemyAlert2.z, _enemyAlert2.w), float4(1.0f, 1.0f, 1.0f, 1.0f)) > 0.0f)) {
    bool _2778 = ((_isPhotosensitiveMode_isAllolwBlood & 1) != 0);
    float _2784 = max(0.0010000000474974513f, _exposure0.x);
    float4 _2801 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_255 < (uint)65000), _255, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((TEXCOORD.x * 2.0f) * _36), ((_time.x * 0.10000000149011612f) + (TEXCOORD.y * 2.0f))));
    float _2804 = _2801.x + -0.5f;
    float _2805 = _2801.y + -0.5f;
    float _2815 = 0.44999998807907104f - (_2804 * 0.004999999888241291f);
    float _2818 = max((abs((TEXCOORD.x + -0.5f) + (_2804 * 0.019999999552965164f)) - _2815), 0.0f);
    float _2819 = max((abs((TEXCOORD.y + -0.5f) + (_2805 * 0.019999999552965164f)) - _2815), 0.0f);
    int _2830 = WaveReadLaneFirst(_materialIndex);
    int _2838 = WaveReadLaneFirst(BindlessParameters_PostProcessUber_CD[((int)((uint)(select(((uint)_2830 < (uint)170000), _2830, 0)) + 0u))]._enemyAlertTex);
    float4 _2845 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_2838 < (uint)65000), _2838, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - (_2805 * 0.029999999329447746f)), (TEXCOORD.y - (_2804 * 0.029999999329447746f))));
    bool _2850 = (TEXCOORD.y > 0.5f);
    bool _2852 = (TEXCOORD.x < 0.5f);
    bool _2856 = (TEXCOORD.y < 0.5f);
    bool _2864 = (TEXCOORD.x > 0.5f);
    float _2888 = saturate(dot(float4((_2845.x * float((bool)(uint)(_2856))), (_2845.y * float((bool)((uint)((_2864) && (_2856))))), (_2845.z * float((bool)(uint)(_2864))), (_2845.w * float((bool)((uint)((_2864) && (_2850)))))), float4(_enemyAlert2.x, _enemyAlert2.y, _enemyAlert2.z, _enemyAlert2.w)) + dot(float4((_2845.x * float((bool)(uint)(_2850))), (_2845.y * float((bool)((uint)((_2852) && (_2850))))), (_2845.z * float((bool)(uint)(_2852))), (_2845.w * float((bool)((uint)((_2852) && (_2856)))))), float4(_enemyAlert1.x, _enemyAlert1.y, _enemyAlert1.z, _enemyAlert1.w))) * saturate(sqrt((_2819 * _2819) + (_2818 * _2818)) * 20.0f);
    float _2890 = (_2888 * _2888) * _2888;
    _2901 = ((_2890 * ((select(_2778, 0.09989875555038452f, 0.08437622338533401f) / _2784) - _2756)) + _2756);
    _2902 = ((_2890 * ((select(_2778, 0.027320895344018936f, 0.030713455751538277f) / _2784) - _2757)) + _2757);
    _2903 = ((_2890 * ((select(_2778, 0.04817182570695877f, 0.07036010921001434f) / _2784) - _2758)) + _2758);
  } else {
    _2901 = _2756;
    _2902 = _2757;
    _2903 = _2758;
  }
  uint _2904 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _2911 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_2904), 0));
    _2917 = (float((uint)((uint)(_2911.x & 127))) + 0.5f);
  } else {
    _2917 = 1.0f;
  }
  bool _2920 = (_localToneMappingParams.w > 0.0f);
  if (_2920) {
    float3 output_color = TonemapReplacer(float3(_2901, _2902, _2903));
    _3273 = output_color.x;
    _3274 = output_color.y;
    _3275 = output_color.z;
  } else {
    _3273 = _2901;
    _3274 = _2902;
    _3275 = _2903;
  }
  // RenoDX: >>> [Patch: BasicPostProcessFilmGrain] [Version: 1.12.02]
  // Description: SDR DLAA can use this composite material shader as the final visible output and skip the standalone SDR final shader. When the runtime marks this draw as the basic postprocess final path, apply RenoDX custom film grain directly to the local output color. This preserves the older direct-output material fallback without sampling neighboring final-pass textures from a different source stage.
  if (CUSTOM_BASIC_POSTPROCESS_FINAL == 1.f && CUSTOM_FILM_GRAIN_TYPE != 0) {
    float3 _rndx_postprocess_color = renodx::effects::ApplyFilmGrain(float3(_3273, _3274, _3275), TEXCOORD, CUSTOM_RANDOM, CUSTOM_FILM_GRAIN_STRENGTH * 0.03f);
    _3273 = _rndx_postprocess_color.x;
    _3274 = _rndx_postprocess_color.y;
    _3275 = _rndx_postprocess_color.z;
  }
  // RenoDX: <<< [Patch: BasicPostProcessFilmGrain]
  if (_etcParams.y > 1.0f) {
    float _3284 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _3285 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    // RenoDX: >>> [Patch: BasicPostProcessVignette] [Version: 1.12.02]
    // Description: The SDR DLAA material-final path uses this shader's native output vignette instead of the standalone SDR final shader's different final-pass vignette. When this shader is the selected basic postprocess final path, scale the native material vignette by the RenoDX Vignette setting while leaving HDR and DLSS intermediate uses untouched.
    float _rndx_vignette_strength = saturate(_etcParams.y + -1.0f);
    if (CUSTOM_BASIC_POSTPROCESS_FINAL == 1.f) {
      _rndx_vignette_strength *= CUSTOM_VIGNETTE;
    }
    float _3289 = saturate(1.0f - (dot(float2(_3284, _3285), float2(_3284, _3285)) * _rndx_vignette_strength));
    // RenoDX: <<< [Patch: BasicPostProcessVignette]
    _3294 = (_3289 * _3273);
    _3295 = (_3289 * _3274);
    _3296 = (_3289 * _3275);
  } else {
    _3294 = _3273;
    _3295 = _3274;
    _3296 = _3275;
  }
  if ((_2920) && ((_etcParams.z > 0.0f))) {
    _3326 = select((_3294 <= 0.0031308000907301903f), (_3294 * 12.920000076293945f), (((pow(_3294, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _3327 = select((_3295 <= 0.0031308000907301903f), (_3295 * 12.920000076293945f), (((pow(_3295, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _3328 = select((_3296 <= 0.0031308000907301903f), (_3296 * 12.920000076293945f), (((pow(_3296, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _3326 = _3294;
    _3327 = _3295;
    _3328 = _3296;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _3333 = float((uint)_2904);
    if (!(_3333 < _viewDir.w)) {
      if (!(_3333 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _3342 = _3326;
        _3343 = _3327;
        _3344 = _3328;
      } else {
        _3342 = 0.0f;
        _3343 = 0.0f;
        _3344 = 0.0f;
      }
    } else {
      _3342 = 0.0f;
      _3343 = 0.0f;
      _3344 = 0.0f;
    }
  } else {
    _3342 = _3326;
    _3343 = _3327;
    _3344 = _3328;
  }
  // RenoDX: >>> [Patch: BasicPostProcessFinalizeSDR] [Version: 1.12.02]
  // Description: SDR DLAA can bypass the standalone SDR final shader and output this composite material directly to the fake swapchain. When the addon marks this shader as the basic postprocess final path, run only the shared SDR finalization step here so white point/color-temperature, Purkinje, and the SDR Gamma setting are not skipped. This intentionally avoids standalone-final sharpening, RCAS, and late final color-transfer math because this material shader does not have the same final-source texture semantics.
  if (CUSTOM_BASIC_POSTPROCESS_FINAL == 1.f) {
    float3 _rndx_final_color = FinalizeSDR(float3(_3342, _3343, _3344), _sunDirection.y, _moonDirection.y);
    _3342 = _rndx_final_color.x;
    _3343 = _rndx_final_color.y;
    _3344 = _rndx_final_color.z;
  }
  // RenoDX: <<< [Patch: BasicPostProcessFinalizeSDR]
  SV_Target.x = _3342;
  SV_Target.y = _3343;
  SV_Target.z = _3344;
  SV_Target.w = _2917;
  return SV_Target;
}
