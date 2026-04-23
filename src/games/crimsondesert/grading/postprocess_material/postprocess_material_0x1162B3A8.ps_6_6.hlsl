#include "../tonemap.hlsli"

struct PostProcessLensFlareForGimmick_CDStruct {
  uint _lensDirtTexture;
  uint _lensColorTableTexture;
  uint _noiseTex;
  uint _noiseTex2;
  float _lensflareRatio;
  float _sunFlareScale;
  float _sunFlareIntensity;
  float _sunFlareAnimSpeed;
  float _sunFlareWeightThreshold;
  float _sunFlareWeightIntensity;
  float _lensDirtIntensity;
  float _lensDirtThreshold;
  float _chromaticShiftValue;
  float _useFishUV;
  float _fishEyeIntensity;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t44, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t33, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t38, space36);

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

ConstantBuffer<PostProcessLensFlareForGimmick_CDStruct> BindlessParameters_PostProcessLensFlareForGimmick_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _22[36];
  float4 _27 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  int _29 = WaveReadLaneFirst(_materialIndex);
  float _38 = TEXCOORD.x + -0.5f;
  float _39 = TEXCOORD.y + -0.5f;
  float _47 = rsqrt(dot(float2(_38, _39), float2(_38, _39))) * (sqrt((_39 * _39) + (_38 * _38)) * WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_29 < (uint)170000), _29, 0)) + 0u))]._chromaticShiftValue));
  float _48 = _47 * _38;
  float _50 = _47 * _39;
  float4 _56 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _48), (TEXCOORD.y - _50)));
  float4 _58 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float4 _60 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_48 + TEXCOORD.x), (_50 + TEXCOORD.y)));
  float4 _64 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
  float _74 = (pow(_64.x, 0.012683313339948654f));
  float _75 = (pow(_64.y, 0.012683313339948654f));
  float _76 = (pow(_64.z, 0.012683313339948654f));
  float _101 = exp2(log2(max(0.0f, (_74 + -0.8359375f)) / (18.8515625f - (_74 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _102 = exp2(log2(max(0.0f, (_75 + -0.8359375f)) / (18.8515625f - (_75 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _103 = exp2(log2(max(0.0f, (_76 + -0.8359375f)) / (18.8515625f - (_76 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _107 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  int _108 = WaveReadLaneFirst(_materialIndex);
  float _116 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_108 < (uint)170000), _108, 0)) + 0u))]._fishEyeIntensity);
  float _122 = (_srcTargetSizeAndInv.x * TEXCOORD.x) / _srcTargetSizeAndInv.x;
  float _123 = (_srcTargetSizeAndInv.y * TEXCOORD.y) / _srcTargetSizeAndInv.x;
  float _124 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  float _125 = 0.5f / _124;
  float _126 = _122 + -0.5f;
  float _127 = _123 - _125;
  float _128 = dot(float2(_126, _127), float2(_126, _127));
  float _129 = sqrt(_128);
  bool _130 = (_116 > 0.0f);
  float _138;
  float _175;
  float _176;
  float _705;
  float _706;
  float _707;
  float _721;
  float _967;
  float _968;
  float _969;
  float _1089;
  float _1090;
  float _1091;
  float _1112;
  float _1113;
  float _1114;
  float _1147;
  float _1148;
  float _1149;
  float _1163;
  float _1164;
  float _1165;
  if (_130) {
    _138 = sqrt(dot(float2(0.5f, _125), float2(0.5f, _125)));
  } else {
    if (!(_124 < 1.0f)) {
      _138 = _125;
    } else {
      _138 = 0.5f;
    }
  }
  if (_130) {
    float _140 = rsqrt(_128);
    float _142 = tan(_129 * _116);
    float _150 = tan(_138 * _116);
    _175 = (((((_138 * _126) * _140) * _142) / _150) + 0.5f);
    _176 = (((((_138 * _127) * _140) * _142) / _150) + _125);
  } else {
    if (_116 < 0.0f) {
      float _158 = rsqrt(_128);
      float _159 = _116 * -10.0f;
      float _161 = atan(_129 * _159);
      float _169 = atan(_138 * _159);
      _175 = (((((_138 * _126) * _158) * _161) / _169) + 0.5f);
      _176 = (((((_138 * _127) * _158) * _161) / _169) + _125);
    } else {
      _175 = _122;
      _176 = _123;
    }
  }
  int _178 = WaveReadLaneFirst(_materialIndex);
  bool _187 = (WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_178 < (uint)170000), _178, 0)) + 0u))]._useFishUV) == 1.0f);
  float _190 = select(_187, _175, TEXCOORD.x) + -0.5f;
  float _191 = select(_187, (_176 * _124), TEXCOORD.y) + -0.5f;
  float _192 = _190 * _107;
  float _232 = mad((_viewProj[3].z), _questGuideWorldPosition.z, mad((_viewProj[3].y), _questGuideWorldPosition.y, ((_viewProj[3].x) * _questGuideWorldPosition.x))) + (_viewProj[3].w);
  float _235 = (mad((_viewProj[2].z), _questGuideWorldPosition.z, mad((_viewProj[2].y), _questGuideWorldPosition.y, ((_viewProj[2].x) * _questGuideWorldPosition.x))) + (_viewProj[2].w)) / _232;
  float _236 = ((mad((_viewProj[1].z), _questGuideWorldPosition.z, mad((_viewProj[1].y), _questGuideWorldPosition.y, ((_viewProj[1].x) * _questGuideWorldPosition.x))) + (_viewProj[1].w)) / _232) * -0.5f;
  float _238 = (_107 * 0.5f) * ((mad((_viewProj[0].z), _questGuideWorldPosition.z, mad((_viewProj[0].y), _questGuideWorldPosition.y, ((_viewProj[0].x) * _questGuideWorldPosition.x))) + (_viewProj[0].w)) / _232);
  if ((!(abs(_questGuideWorldPosition.x) <= 9.999999747378752e-06f)) || ((!(!(abs(_questGuideWorldPosition.x) <= 9.999999747378752e-06f))) && (!(abs(_questGuideWorldPosition.y) <= 9.999999747378752e-06f)))) {
    if (!(((_236 >= 1.0499999523162842f)) || ((((_236 <= -1.5f)) || ((((_238 >= 1.600000023841858f)) || ((((_238 <= -1.600000023841858f)) || ((((_235 < 0.0f)) || ((_238 <= -1.5f)))))))))))) {
      float _272 = _192 - _238;
      float _273 = _191 - _236;
      float _275 = atan(_272 / _273);
      bool _278 = (_273 < 0.0f);
      bool _279 = (_273 == 0.0f);
      bool _280 = (_272 >= 0.0f);
      bool _281 = (_272 < 0.0f);
      bool _284 = (_281) && (_278);
      float _285 = select(_284, (_275 + -3.1415927410125732f), select(((_280) && (_278)), (_275 + 3.1415927410125732f), _275));
      bool _286 = (_281) && (_279);
      bool _288 = (_280) && (_279);
      float _289 = select(_288, 1.5707963705062866f, select(_286, -1.5707963705062866f, _285));
      float _293 = sqrt((_273 * _273) + (_272 * _272));
      int _310 = WaveReadLaneFirst(_materialIndex);
      int _320 = WaveReadLaneFirst(_materialIndex);
      float _334 = _238 - _192;
      float _335 = _236 - _191;
      int _340 = WaveReadLaneFirst(_materialIndex);
      float _351 = max((0.019999999552965164f / (WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_340 < (uint)170000), _340, 0)) + 0u))]._sunFlareScale) * sqrt((_335 * _335) + (_334 * _334)))), 0.0f);
      float _352 = _351 * _351;
      int _363 = WaveReadLaneFirst(_materialIndex);
      float _372 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_363 < (uint)170000), _363, 0)) + 0u))]._sunFlareAnimSpeed) * _time.x;
      int _374 = WaveReadLaneFirst(_materialIndex);
      int _382 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_374 < (uint)170000), _374, 0)) + 0u))]._noiseTex);
      float4 _389 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_382 < (uint)65000), _382, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((sin((_289 * 2.0f) + _238) * 4.0f) - cos((_289 * 3.0f) + _236)) + _372), _372));
      float _397 = 1.0f / exp2((_293 * 1.4426950216293335f) * ((frac(_389.x) * 0.6600000262260437f) + 0.33000001311302185f));
      float _400 = frac((_397 * 20.0f) + 1.0031249523162842f);
      float _407 = exp2(log2(1.0f - abs((_397 * 2.0f) + -1.0f)) * 0.30000001192092896f);
      float _444 = sin(select(_288, 6.2831854820251465f, select(_286, -6.2831854820251465f, (_285 * 4.0f))));
      float _445 = _444 * _272;
      float _446 = _444 * _273;
      float _465 = exp2(log2(((saturate(_397 + -0.8999999761581421f) * 3.0f) + exp2(log2(1.0f - saturate(sqrt((_445 * _445) + (_446 * _446)))) * 8.0f)) * _397) * 12.949999809265137f) * (_397 * 0.4999999701976776f);
      int _469 = WaveReadLaneFirst(_materialIndex);
      int _477 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_469 < (uint)170000), _469, 0)) + 0u))]._noiseTex);
      float _481 = exp2(log2(_293 * 16.0f) * 0.5f);
      float _485 = atan(_273 / _272);
      bool _488 = (_272 == 0.0f);
      bool _489 = (_273 >= 0.0f);
      float4 _506 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_477 < (uint)65000), _477, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(select(((_488) && (_489)), 2.356194496154785f, select(((_488) && (_278)), -2.356194496154785f, (select(_284, (_485 + -3.1415927410125732f), select(((_281) && (_489)), (_485 + 3.1415927410125732f), _485)) * 1.5f))), ((_time.x * 0.20000000298023224f) - _481)));
      float _513 = atan((-0.0f - _273) / (-0.0f - _272));
      bool _516 = (_272 > -0.0f);
      bool _517 = (_272 == -0.0f);
      bool _518 = (_273 <= -0.0f);
      bool _519 = (_273 > -0.0f);
      float4 _534 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_477 < (uint)65000), _477, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(select(((_517) && (_518)), 2.356194496154785f, select(((_517) && (_519)), -2.356194496154785f, (select(((_516) && (_519)), (_513 + -3.1415927410125732f), select(((_516) && (_518)), (_513 + 3.1415927410125732f), _513)) * 1.5f))), ((_time.x * 0.20000000298023224f) - (_481 * 0.5f))));
      float _559 = exp2(log2(min(max((1.0f - (_293 * 2.0f)), 0.0f), 1.0f)) * 5.199999809265137f);
      float _570 = exp2(log2(min(max((1.100000023841858f - (_293 * 4.0f)), 0.0f), 1.0f)) * 4.199999809265137f) * 0.10000000149011612f;
      float _585 = (((pow(_293, 0.10000000149011612f)) * 0.10000000149011612f) + 0.800000011920929f) + (sin(_389.x * 8.0f) * 0.20000000298023224f);
      float _595 = (exp2(log2(saturate(1.0f - (WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_310 < (uint)170000), _310, 0)) + 0u))]._sunFlareWeightIntensity) * sqrt((_190 * _190) + (_191 * _191))))) * WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_320 < (uint)170000), _320, 0)) + 0u))]._sunFlareWeightThreshold)) * 150.0f) * _exposure2.x;
      int _599 = WaveReadLaneFirst(_materialIndex);
      int _607 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_599 < (uint)170000), _599, 0)) + 0u))]._lensDirtTexture);
      float4 _614 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_607 < (uint)65000), _607, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
      int _618 = WaveReadLaneFirst(_materialIndex);
      float _626 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_618 < (uint)170000), _618, 0)) + 0u))]._lensDirtThreshold);
      int _639 = WaveReadLaneFirst(_materialIndex);
      float _647 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_639 < (uint)170000), _639, 0)) + 0u))]._lensDirtIntensity);
      float _669 = ((_viewDir.y + _viewDir.x) * 33.60000228881836f) + (TEXCOORD.x * 0.10000000149011612f);
      float _673 = frac(sin(floor(_669)) * 43758.546875f);
      int _684 = WaveReadLaneFirst(_materialIndex);
      float _694 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_684 < (uint)170000), _684, 0)) + 0u))]._lensflareRatio) * (((((frac(_669) * (frac(sin(ceil(_669)) * 43758.546875f) - _673)) + _673) * 0.6499999761581421f) + 0.3499999940395355f) * _27.w);
      _705 = (((_694 * (((((((_570 + (_559 * exp2(log2(saturate(max(_506.x, _534.x))) * 4.0f))) * 5.599999904632568f) + (_465 * (((min(max((abs((frac(_400 + 1.0f) * 6.0f) + -3.0f) + -1.0f), 0.0f), 1.0f) + -1.0f) * _407) + 1.0f))) * _585) + _352) * _595) + _56.x)) * saturate((_647 * (saturate(pow(_614.x, _626)) + -1.0f)) + 1.0f)) + _101);
      _706 = (((_694 * (((((((_570 + (_559 * exp2(log2(saturate(max(_506.y, _534.y))) * 4.0f))) * 5.599999904632568f) + (_465 * (((min(max((abs((frac(_400 + 0.6666666865348816f) * 6.0f) + -3.0f) + -1.0f), 0.0f), 1.0f) + -1.0f) * _407) + 1.0f))) * _585) + _352) * _595) + _58.y)) * saturate((_647 * (saturate(pow(_614.y, _626)) + -1.0f)) + 1.0f)) + _102);
      _707 = (((_694 * (((((((_570 + (_559 * exp2(log2(saturate(max(_506.z, _534.z))) * 4.0f))) * 7.0f) + (_465 * (((min(max((abs((frac(_400 + 0.3333333432674408f) * 6.0f) + -3.0f) + -1.0f), 0.0f), 1.0f) + -1.0f) * _407) + 1.0f))) * _585) + _352) * _595) + _60.z)) * saturate((_647 * (saturate(pow(_614.z, _626)) + -1.0f)) + 1.0f)) + _103);
    } else {
      _705 = _101;
      _706 = _102;
      _707 = _103;
    }
  } else {
    if (!(((_236 >= 1.0499999523162842f)) || ((((_236 <= -1.5f)) || ((((_238 >= 1.600000023841858f)) || ((((_238 <= -1.600000023841858f)) || ((((_238 <= -1.5f)) || ((((_235 < 0.0f)) || ((abs(_questGuideWorldPosition.z) <= 9.999999747378752e-06f)))))))))))))) {
      float _272 = _192 - _238;
      float _273 = _191 - _236;
      float _275 = atan(_272 / _273);
      bool _278 = (_273 < 0.0f);
      bool _279 = (_273 == 0.0f);
      bool _280 = (_272 >= 0.0f);
      bool _281 = (_272 < 0.0f);
      bool _284 = (_281) && (_278);
      float _285 = select(_284, (_275 + -3.1415927410125732f), select(((_280) && (_278)), (_275 + 3.1415927410125732f), _275));
      bool _286 = (_281) && (_279);
      bool _288 = (_280) && (_279);
      float _289 = select(_288, 1.5707963705062866f, select(_286, -1.5707963705062866f, _285));
      float _293 = sqrt((_273 * _273) + (_272 * _272));
      int _310 = WaveReadLaneFirst(_materialIndex);
      int _320 = WaveReadLaneFirst(_materialIndex);
      float _334 = _238 - _192;
      float _335 = _236 - _191;
      int _340 = WaveReadLaneFirst(_materialIndex);
      float _351 = max((0.019999999552965164f / (WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_340 < (uint)170000), _340, 0)) + 0u))]._sunFlareScale) * sqrt((_335 * _335) + (_334 * _334)))), 0.0f);
      float _352 = _351 * _351;
      int _363 = WaveReadLaneFirst(_materialIndex);
      float _372 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_363 < (uint)170000), _363, 0)) + 0u))]._sunFlareAnimSpeed) * _time.x;
      int _374 = WaveReadLaneFirst(_materialIndex);
      int _382 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_374 < (uint)170000), _374, 0)) + 0u))]._noiseTex);
      float4 _389 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_382 < (uint)65000), _382, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((sin((_289 * 2.0f) + _238) * 4.0f) - cos((_289 * 3.0f) + _236)) + _372), _372));
      float _397 = 1.0f / exp2((_293 * 1.4426950216293335f) * ((frac(_389.x) * 0.6600000262260437f) + 0.33000001311302185f));
      float _400 = frac((_397 * 20.0f) + 1.0031249523162842f);
      float _407 = exp2(log2(1.0f - abs((_397 * 2.0f) + -1.0f)) * 0.30000001192092896f);
      float _444 = sin(select(_288, 6.2831854820251465f, select(_286, -6.2831854820251465f, (_285 * 4.0f))));
      float _445 = _444 * _272;
      float _446 = _444 * _273;
      float _465 = exp2(log2(((saturate(_397 + -0.8999999761581421f) * 3.0f) + exp2(log2(1.0f - saturate(sqrt((_445 * _445) + (_446 * _446)))) * 8.0f)) * _397) * 12.949999809265137f) * (_397 * 0.4999999701976776f);
      int _469 = WaveReadLaneFirst(_materialIndex);
      int _477 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_469 < (uint)170000), _469, 0)) + 0u))]._noiseTex);
      float _481 = exp2(log2(_293 * 16.0f) * 0.5f);
      float _485 = atan(_273 / _272);
      bool _488 = (_272 == 0.0f);
      bool _489 = (_273 >= 0.0f);
      float4 _506 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_477 < (uint)65000), _477, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(select(((_488) && (_489)), 2.356194496154785f, select(((_488) && (_278)), -2.356194496154785f, (select(_284, (_485 + -3.1415927410125732f), select(((_281) && (_489)), (_485 + 3.1415927410125732f), _485)) * 1.5f))), ((_time.x * 0.20000000298023224f) - _481)));
      float _513 = atan((-0.0f - _273) / (-0.0f - _272));
      bool _516 = (_272 > -0.0f);
      bool _517 = (_272 == -0.0f);
      bool _518 = (_273 <= -0.0f);
      bool _519 = (_273 > -0.0f);
      float4 _534 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_477 < (uint)65000), _477, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(select(((_517) && (_518)), 2.356194496154785f, select(((_517) && (_519)), -2.356194496154785f, (select(((_516) && (_519)), (_513 + -3.1415927410125732f), select(((_516) && (_518)), (_513 + 3.1415927410125732f), _513)) * 1.5f))), ((_time.x * 0.20000000298023224f) - (_481 * 0.5f))));
      float _559 = exp2(log2(min(max((1.0f - (_293 * 2.0f)), 0.0f), 1.0f)) * 5.199999809265137f);
      float _570 = exp2(log2(min(max((1.100000023841858f - (_293 * 4.0f)), 0.0f), 1.0f)) * 4.199999809265137f) * 0.10000000149011612f;
      float _585 = (((pow(_293, 0.10000000149011612f)) * 0.10000000149011612f) + 0.800000011920929f) + (sin(_389.x * 8.0f) * 0.20000000298023224f);
      float _595 = (exp2(log2(saturate(1.0f - (WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_310 < (uint)170000), _310, 0)) + 0u))]._sunFlareWeightIntensity) * sqrt((_190 * _190) + (_191 * _191))))) * WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_320 < (uint)170000), _320, 0)) + 0u))]._sunFlareWeightThreshold)) * 150.0f) * _exposure2.x;
      int _599 = WaveReadLaneFirst(_materialIndex);
      int _607 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_599 < (uint)170000), _599, 0)) + 0u))]._lensDirtTexture);
      float4 _614 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_607 < (uint)65000), _607, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
      int _618 = WaveReadLaneFirst(_materialIndex);
      float _626 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_618 < (uint)170000), _618, 0)) + 0u))]._lensDirtThreshold);
      int _639 = WaveReadLaneFirst(_materialIndex);
      float _647 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_639 < (uint)170000), _639, 0)) + 0u))]._lensDirtIntensity);
      float _669 = ((_viewDir.y + _viewDir.x) * 33.60000228881836f) + (TEXCOORD.x * 0.10000000149011612f);
      float _673 = frac(sin(floor(_669)) * 43758.546875f);
      int _684 = WaveReadLaneFirst(_materialIndex);
      float _694 = WaveReadLaneFirst(BindlessParameters_PostProcessLensFlareForGimmick_CD[((int)((uint)(select(((uint)_684 < (uint)170000), _684, 0)) + 0u))]._lensflareRatio) * (((((frac(_669) * (frac(sin(ceil(_669)) * 43758.546875f) - _673)) + _673) * 0.6499999761581421f) + 0.3499999940395355f) * _27.w);
      _705 = (((_694 * (((((((_570 + (_559 * exp2(log2(saturate(max(_506.x, _534.x))) * 4.0f))) * 5.599999904632568f) + (_465 * (((min(max((abs((frac(_400 + 1.0f) * 6.0f) + -3.0f) + -1.0f), 0.0f), 1.0f) + -1.0f) * _407) + 1.0f))) * _585) + _352) * _595) + _56.x)) * saturate((_647 * (saturate(pow(_614.x, _626)) + -1.0f)) + 1.0f)) + _101);
      _706 = (((_694 * (((((((_570 + (_559 * exp2(log2(saturate(max(_506.y, _534.y))) * 4.0f))) * 5.599999904632568f) + (_465 * (((min(max((abs((frac(_400 + 0.6666666865348816f) * 6.0f) + -3.0f) + -1.0f), 0.0f), 1.0f) + -1.0f) * _407) + 1.0f))) * _585) + _352) * _595) + _58.y)) * saturate((_647 * (saturate(pow(_614.y, _626)) + -1.0f)) + 1.0f)) + _102);
      _707 = (((_694 * (((((((_570 + (_559 * exp2(log2(saturate(max(_506.z, _534.z))) * 4.0f))) * 7.0f) + (_465 * (((min(max((abs((frac(_400 + 0.3333333432674408f) * 6.0f) + -3.0f) + -1.0f), 0.0f), 1.0f) + -1.0f) * _407) + 1.0f))) * _585) + _352) * _595) + _60.z)) * saturate((_647 * (saturate(pow(_614.z, _626)) + -1.0f)) + 1.0f)) + _103);
    } else {
      _705 = _101;
      _706 = _102;
      _707 = _103;
    }
  }
  uint _708 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _715 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_708), 0));
    _721 = (float((uint)((uint)(_715.x & 127))) + 0.5f);
  } else {
    _721 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_705, _706, _707));
    _1089 = output_color.x;
    _1090 = output_color.y;
    _1091 = output_color.z;
  } else {
    _1089 = _705;
    _1090 = _706;
    _1091 = _707;
  }
  if (_etcParams.y > 1.0f) {
    float _1102 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _1103 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _1107 = saturate(1.0f - (dot(float2(_1102, _1103), float2(_1102, _1103)) * saturate(_etcParams.y + -1.0f)));
    _1112 = (_1107 * _1089);
    _1113 = (_1107 * _1090);
    _1114 = (_1107 * _1091);
  } else {
    _1112 = _1089;
    _1113 = _1090;
    _1114 = _1091;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _1147 = select((_1112 <= 0.0031308000907301903f), (_1112 * 12.920000076293945f), (((pow(_1112, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1148 = select((_1113 <= 0.0031308000907301903f), (_1113 * 12.920000076293945f), (((pow(_1113, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1149 = select((_1114 <= 0.0031308000907301903f), (_1114 * 12.920000076293945f), (((pow(_1114, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1147 = _1112;
    _1148 = _1113;
    _1149 = _1114;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _1154 = float((uint)_708);
    if (!(_1154 < _viewDir.w)) {
      if (!(_1154 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _1163 = _1147;
        _1164 = _1148;
        _1165 = _1149;
      } else {
        _1163 = 0.0f;
        _1164 = 0.0f;
        _1165 = 0.0f;
      }
    } else {
      _1163 = 0.0f;
      _1164 = 0.0f;
      _1165 = 0.0f;
    }
  } else {
    _1163 = _1147;
    _1164 = _1148;
    _1165 = _1149;
  }
  float _1175 = exp2(log2(_1163 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1176 = exp2(log2(_1164 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1177 = exp2(log2(_1165 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_1175 * 18.6875f) + 1.0f)) * ((_1175 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_1176 * 18.6875f) + 1.0f)) * ((_1176 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_1177 * 18.6875f) + 1.0f)) * ((_1177 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _721;
  return SV_Target;
}

