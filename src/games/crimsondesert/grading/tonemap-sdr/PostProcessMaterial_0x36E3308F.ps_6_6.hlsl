struct PostProcessGhost_CDStruct {
  float _ghostFXRatio;
  uint _ghostNoiseTex;
  float _ghostNoiseIntensity;
  float _ghostFXColorInnerBrightness;
  uint _ghostFXColor1;
  uint _ghostFXColor2;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t32, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t33, space36);

Texture2D<uint4> __3__36__0__0__g_gbufferBaseColor : register(t77, space36);

Texture2D<float4> __3__36__0__0__g_gbufferNormal : register(t78, space36);

Texture2D<uint> __3__36__0__0__g_CustomRenderPassValue : register(t79, space36);

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

ConstantBuffer<PostProcessGhost_CDStruct> BindlessParameters_PostProcessGhost_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float4 _34 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  int _38 = WaveReadLaneFirst(_materialIndex);
  float _142;
  float _143;
  float _384;
  float _385;
  float _386;
  float _387;
  float _388;
  float _389;
  float _390;
  float _411;
  float _412;
  float _413;
  float _427;
  float _632;
  float _633;
  float _634;
  float _727;
  float _728;
  float _729;
  float _783;
  float _784;
  float _785;
  float _804;
  float _805;
  float _806;
  float _836;
  float _837;
  float _838;
  float _852;
  float _853;
  float _854;
  if (!(!(WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_38 < (uint)170000), _38, 0)) + 0u))]._ghostFXRatio) >= 0.0010000000474974513f))) {
    float _50 = 4.0f / (_srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y);
    int _57 = WaveReadLaneFirst(_materialIndex);
    int _65 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_57 < (uint)170000), _57, 0)) + 0u))]._ghostNoiseTex);
    float4 _72 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_65 < (uint)65000), _65, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((TEXCOORD.x * 3.0f) * _50), ((_time.x * 0.30000001192092896f) + (_50 * TEXCOORD.y))));
    int _76 = WaveReadLaneFirst(_materialIndex);
    int _85 = WaveReadLaneFirst(_materialIndex);
    float _95 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_85 < (uint)170000), _85, 0)) + 0u))]._ghostNoiseIntensity) * (WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_76 < (uint)170000), _76, 0)) + 0u))]._ghostFXRatio) * _72.y);
    float _98 = (_95 * 0.009999999776482582f) + TEXCOORD.x;
    float _99 = (_95 * 0.05000000074505806f) + TEXCOORD.y;
    int2 _101; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_101.x, _101.y);
    uint _116 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_101.x))))) + 0.5f) * _98), int((float((int)(int(float((int)(_101.y))))) + 0.5f) * _99), 0));
    float _126 = (float((uint)((uint)((uint)((uint)(_116.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
    float _127 = (float((uint)((uint)(((uint)((uint)(_116.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
    float _129 = 1.0f - abs(_126);
    float _130 = abs(_127);
    float _131 = _129 - _130;
    if (!(_131 >= 0.0f)) {
      _142 = (select((_126 >= 0.0f), 1.0f, -1.0f) * (1.0f - _130));
      _143 = (select((_127 >= 0.0f), 1.0f, -1.0f) * _129);
    } else {
      _142 = _126;
      _143 = _127;
    }
    float _145 = rsqrt(dot(float3(_142, _143, _131), float3(_142, _143, _131)));
    float _146 = _145 * _142;
    float _147 = _145 * _143;
    float _148 = _145 * _131;
    float _150 = rsqrt(dot(float3(_146, _147, _148), float3(_146, _147, _148)));
    float _151 = _150 * _146;
    float _152 = _150 * _147;
    float _153 = _150 * _148;
    if ((_116.x & 255) == _renderPassNPCGhost) {
      uint _163 = uint(_bufferSizeAndInvSize.x * _98);
      uint _164 = uint(_bufferSizeAndInvSize.y * _99);
      uint4 _166 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_163), (int)(_164), 0));
      float4 _169 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_163), (int)(_164), 0));
      float _187 = (saturate(_169.x * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _188 = (saturate(_169.y * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _189 = (saturate(_169.z * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _191 = rsqrt(dot(float3(_187, _188, _189), float3(_187, _188, _189)));
      float _192 = _191 * _187;
      float _193 = _191 * _188;
      float _194 = _189 * _191;
      float _197 = (float((uint)((uint)(((uint)((uint)(_166.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
      float _198 = (float((uint)((uint)(_166.w & 255))) * 0.007843137718737125f) + -1.0f;
      float _201 = (_197 + _198) * 0.5f;
      float _202 = (_197 - _198) * 0.5f;
      float _206 = (1.0f - abs(_201)) - abs(_202);
      float _208 = rsqrt(dot(float3(_201, _202, _206), float3(_201, _202, _206)));
      float _209 = _208 * _201;
      float _210 = _208 * _202;
      float _211 = _208 * _206;
      float _213 = select((_194 >= 0.0f), 1.0f, -1.0f);
      float _216 = -0.0f - (1.0f / (_213 + _194));
      float _217 = _193 * _216;
      float _218 = _217 * _192;
      float _219 = _213 * _192;
      float _228 = mad(_211, _192, mad(_210, _218, ((((_219 * _192) * _216) + 1.0f) * _209)));
      float _232 = mad(_211, _193, mad(_210, (_213 + (_217 * _193)), ((_209 * _213) * _218)));
      float _236 = mad(_211, _194, mad(_210, (-0.0f - _193), (-0.0f - (_219 * _209))));
      float _238 = rsqrt(dot(float3(_228, _232, _236), float3(_228, _232, _236)));
      float _260 = saturate(1.0f - dot(float3(((((_238 * _228) - _151) * 0.20000000298023224f) + _151), ((((_238 * _232) - _152) * 0.20000000298023224f) + _152), ((((_238 * _236) - _153) * 0.20000000298023224f) + _153)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
      float _261 = _260 * 2.0f;
      float _264 = 1.0f - saturate(_261 * _260);
      int _265 = WaveReadLaneFirst(_materialIndex);
      float _274 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_265 < (uint)170000), _265, 0)) + 0u))]._ghostFXRatio) * _264;
      int _275 = WaveReadLaneFirst(_materialIndex);
      float _283 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_275 < (uint)170000), _275, 0)) + 0u))]._ghostFXColorInnerBrightness);
      float _293 = (((_283 * _34.x) - _34.x) * _274) + _34.x;
      float _294 = (((_283 * _34.y) - _34.y) * _274) + _34.y;
      float _295 = (((_283 * _34.z) - _34.z) * _274) + _34.z;
      float _297 = _260 * _264;
      float _303 = saturate(_72.x * 40.0f) * saturate((_297 * _297) * 30.0f);
      int _304 = WaveReadLaneFirst(_materialIndex);
      int _312 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_304 < (uint)170000), _304, 0)) + 0u))]._ghostFXColor1);
      float _321 = float((uint)((uint)(((uint)((uint)(_312)) >> 16) & 255))) * 0.003921568859368563f;
      float _322 = float((uint)((uint)(((uint)((uint)(_312)) >> 8) & 255))) * 0.003921568859368563f;
      float _323 = float((uint)((uint)(_312 & 255))) * 0.003921568859368563f;
      float _335 = max(0.0010000000474974513f, _exposure0.x);
      int _339 = WaveReadLaneFirst(_materialIndex);
      int _347 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_339 < (uint)170000), _339, 0)) + 0u))]._ghostFXColor2);
      float _361 = max(0.0010000000474974513f, _exposure0.x);
      float _362 = (float((uint)((uint)(((uint)((uint)(_347)) >> 16) & 255))) * 0.003921568859368563f) / _361;
      float _363 = (float((uint)((uint)(((uint)((uint)(_347)) >> 8) & 255))) * 0.003921568859368563f) / _361;
      float _364 = (float((uint)((uint)(_347 & 255))) * 0.003921568859368563f) / _361;
      float _371 = ((_293 - _362) * 0.10000000149011612f) + _362;
      float _372 = ((_294 - _363) * 0.10000000149011612f) + _363;
      float _373 = ((_295 - _364) * 0.10000000149011612f) + _364;
      _384 = _293;
      _385 = _294;
      _386 = _295;
      _387 = saturate(_261);
      _388 = (((((lerp(_321, _72.x, 0.10000000149011612f)) / _335) - _371) * _303) + _371);
      _389 = (((((lerp(_322, _72.y, 0.10000000149011612f)) / _335) - _372) * _303) + _372);
      _390 = (((((lerp(_323, _72.z, 0.10000000149011612f)) / _335) - _373) * _303) + _373);
    } else {
      _384 = _34.x;
      _385 = _34.y;
      _386 = _34.z;
      _387 = 0.0f;
      _388 = _34.x;
      _389 = _34.y;
      _390 = _34.z;
    }
    int _391 = WaveReadLaneFirst(_materialIndex);
    float _400 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_391 < (uint)170000), _391, 0)) + 0u))]._ghostFXRatio) * _387;
    _411 = ((_400 * (_388 - _384)) + _384);
    _412 = ((_400 * (_389 - _385)) + _385);
    _413 = ((_400 * (_390 - _386)) + _386);
  } else {
    _411 = _34.x;
    _412 = _34.y;
    _413 = _34.z;
  }
  uint _414 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _421 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_414), 0));
    _427 = (float((uint)((uint)(_421.x & 127))) + 0.5f);
  } else {
    _427 = 0.0f;
  }
  bool _430 = (_localToneMappingParams.w > 0.0f);
  if (_430) {
    float3 output_color = TonemapReplacer(float3(_411, _412, _413));
    _783 = output_color.x;
    _784 = output_color.y;
    _785 = output_color.z;
  } else {
    _783 = _411;
    _784 = _412;
    _785 = _413;
  }
  if (_etcParams.y > 1.0f) {
    float _794 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _795 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _799 = saturate(1.0f - (dot(float2(_794, _795), float2(_794, _795)) * saturate(_etcParams.y + -1.0f)));
    _804 = (_799 * _783);
    _805 = (_799 * _784);
    _806 = (_799 * _785);
  } else {
    _804 = _783;
    _805 = _784;
    _806 = _785;
  }
  if ((_430) && ((_etcParams.z > 0.0f))) {
    _836 = select((_804 <= 0.0031308000907301903f), (_804 * 12.920000076293945f), (((pow(_804, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _837 = select((_805 <= 0.0031308000907301903f), (_805 * 12.920000076293945f), (((pow(_805, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _838 = select((_806 <= 0.0031308000907301903f), (_806 * 12.920000076293945f), (((pow(_806, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _836 = _804;
    _837 = _805;
    _838 = _806;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _843 = float((uint)_414);
    if (!(_843 < _viewDir.w)) {
      if (!(_843 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _852 = _836;
        _853 = _837;
        _854 = _838;
      } else {
        _852 = 0.0f;
        _853 = 0.0f;
        _854 = 0.0f;
      }
    } else {
      _852 = 0.0f;
      _853 = 0.0f;
      _854 = 0.0f;
    }
  } else {
    _852 = _836;
    _853 = _837;
    _854 = _838;
  }
  SV_Target.x = _852;
  SV_Target.y = _853;
  SV_Target.z = _854;
  SV_Target.w = _427;
  return SV_Target;
}