#include "../tonemap.hlsli"

struct PostProcessGhost_CDStruct {
  float _ghostFXRatio;
  uint _ghostNoiseTex;
  float _ghostNoiseIntensity;
  float _ghostFXColorInnerBrightness;
  uint _ghostFXColor1;
  uint _ghostFXColor2;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t33, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t38, space36);

Texture2D<uint4> __3__36__0__0__g_gbufferBaseColor : register(t77, space36);

Texture2D<float4> __3__36__0__0__g_gbufferNormal : register(t64, space36);

Texture2D<uint> __3__36__0__0__g_CustomRenderPassValue : register(t65, space36);

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

ConstantBuffer<PostProcessGhost_CDStruct> BindlessParameters_PostProcessGhost_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _24[36];
  float4 _33 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  int _37 = WaveReadLaneFirst(_materialIndex);
  float _141;
  float _142;
  float _383;
  float _384;
  float _385;
  float _386;
  float _387;
  float _388;
  float _389;
  float _410;
  float _411;
  float _412;
  float _426;
  float _672;
  float _673;
  float _674;
  float _794;
  float _795;
  float _796;
  float _817;
  float _818;
  float _819;
  float _852;
  float _853;
  float _854;
  float _868;
  float _869;
  float _870;
  if (!(!(WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_37 < (uint)170000), _37, 0)) + 0u))]._ghostFXRatio) >= 0.0010000000474974513f))) {
    float _49 = 4.0f / (_srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y);
    int _56 = WaveReadLaneFirst(_materialIndex);
    int _64 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_56 < (uint)170000), _56, 0)) + 0u))]._ghostNoiseTex);
    float4 _71 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_64 < (uint)65000), _64, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((TEXCOORD.x * 3.0f) * _49), ((_time.x * 0.30000001192092896f) + (_49 * TEXCOORD.y))));
    int _75 = WaveReadLaneFirst(_materialIndex);
    int _84 = WaveReadLaneFirst(_materialIndex);
    float _94 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_84 < (uint)170000), _84, 0)) + 0u))]._ghostNoiseIntensity) * (WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_75 < (uint)170000), _75, 0)) + 0u))]._ghostFXRatio) * _71.y);
    float _97 = (_94 * 0.009999999776482582f) + TEXCOORD.x;
    float _98 = (_94 * 0.05000000074505806f) + TEXCOORD.y;
    int2 _100; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_100.x, _100.y);
    uint _115 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_100.x))))) + 0.5f) * _97), int((float((int)(int(float((int)(_100.y))))) + 0.5f) * _98), 0));
    float _125 = (float((uint)((uint)((uint)((uint)(_115.x)) >> 20))) * 0.0004884005174972117f) + -1.0f;
    float _126 = (float((uint)((uint)(((uint)((uint)(_115.x)) >> 8) & 4095))) * 0.0004884005174972117f) + -1.0f;
    float _128 = 1.0f - abs(_125);
    float _129 = abs(_126);
    float _130 = _128 - _129;
    if (!(_130 >= 0.0f)) {
      _141 = (select((_125 >= 0.0f), 1.0f, -1.0f) * (1.0f - _129));
      _142 = (select((_126 >= 0.0f), 1.0f, -1.0f) * _128);
    } else {
      _141 = _125;
      _142 = _126;
    }
    float _144 = rsqrt(dot(float3(_141, _142, _130), float3(_141, _142, _130)));
    float _145 = _144 * _141;
    float _146 = _144 * _142;
    float _147 = _144 * _130;
    float _149 = rsqrt(dot(float3(_145, _146, _147), float3(_145, _146, _147)));
    float _150 = _149 * _145;
    float _151 = _149 * _146;
    float _152 = _149 * _147;
    if ((_115.x & 255) == _renderPassNPCGhost) {
      uint _162 = uint(_bufferSizeAndInvSize.x * _97);
      uint _163 = uint(_bufferSizeAndInvSize.y * _98);
      uint4 _165 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_162), (int)(_163), 0));
      float4 _168 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_162), (int)(_163), 0));
      float _186 = (saturate(_168.x * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _187 = (saturate(_168.y * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _188 = (saturate(_168.z * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _190 = rsqrt(dot(float3(_186, _187, _188), float3(_186, _187, _188)));
      float _191 = _190 * _186;
      float _192 = _190 * _187;
      float _193 = _188 * _190;
      float _196 = (float((uint)((uint)(((uint)((uint)(_165.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
      float _197 = (float((uint)((uint)(_165.w & 255))) * 0.007843137718737125f) + -1.0f;
      float _200 = (_196 + _197) * 0.5f;
      float _201 = (_196 - _197) * 0.5f;
      float _205 = (1.0f - abs(_200)) - abs(_201);
      float _207 = rsqrt(dot(float3(_200, _201, _205), float3(_200, _201, _205)));
      float _208 = _207 * _200;
      float _209 = _207 * _201;
      float _210 = _207 * _205;
      float _212 = select((_193 >= 0.0f), 1.0f, -1.0f);
      float _215 = -0.0f - (1.0f / (_212 + _193));
      float _216 = _192 * _215;
      float _217 = _216 * _191;
      float _218 = _212 * _191;
      float _227 = mad(_210, _191, mad(_209, _217, ((((_218 * _191) * _215) + 1.0f) * _208)));
      float _231 = mad(_210, _192, mad(_209, (_212 + (_216 * _192)), ((_208 * _212) * _217)));
      float _235 = mad(_210, _193, mad(_209, (-0.0f - _192), (-0.0f - (_218 * _208))));
      float _237 = rsqrt(dot(float3(_227, _231, _235), float3(_227, _231, _235)));
      float _259 = saturate(1.0f - dot(float3(((((_237 * _227) - _150) * 0.20000000298023224f) + _150), ((((_237 * _231) - _151) * 0.20000000298023224f) + _151), ((((_237 * _235) - _152) * 0.20000000298023224f) + _152)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
      float _260 = _259 * 2.0f;
      float _263 = 1.0f - saturate(_260 * _259);
      int _264 = WaveReadLaneFirst(_materialIndex);
      float _273 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_264 < (uint)170000), _264, 0)) + 0u))]._ghostFXRatio) * _263;
      int _274 = WaveReadLaneFirst(_materialIndex);
      float _282 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_274 < (uint)170000), _274, 0)) + 0u))]._ghostFXColorInnerBrightness);
      float _292 = (((_282 * _33.x) - _33.x) * _273) + _33.x;
      float _293 = (((_282 * _33.y) - _33.y) * _273) + _33.y;
      float _294 = (((_282 * _33.z) - _33.z) * _273) + _33.z;
      float _296 = _259 * _263;
      float _302 = saturate(_71.x * 40.0f) * saturate((_296 * _296) * 30.0f);
      int _303 = WaveReadLaneFirst(_materialIndex);
      int _311 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_303 < (uint)170000), _303, 0)) + 0u))]._ghostFXColor1);
      float _320 = float((uint)((uint)(((uint)((uint)(_311)) >> 16) & 255))) * 0.003921568859368563f;
      float _321 = float((uint)((uint)(((uint)((uint)(_311)) >> 8) & 255))) * 0.003921568859368563f;
      float _322 = float((uint)((uint)(_311 & 255))) * 0.003921568859368563f;
      float _334 = max(0.0010000000474974513f, _exposure0.x);
      int _338 = WaveReadLaneFirst(_materialIndex);
      int _346 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_338 < (uint)170000), _338, 0)) + 0u))]._ghostFXColor2);
      float _360 = max(0.0010000000474974513f, _exposure0.x);
      float _361 = (float((uint)((uint)(((uint)((uint)(_346)) >> 16) & 255))) * 0.003921568859368563f) / _360;
      float _362 = (float((uint)((uint)(((uint)((uint)(_346)) >> 8) & 255))) * 0.003921568859368563f) / _360;
      float _363 = (float((uint)((uint)(_346 & 255))) * 0.003921568859368563f) / _360;
      float _370 = ((_292 - _361) * 0.10000000149011612f) + _361;
      float _371 = ((_293 - _362) * 0.10000000149011612f) + _362;
      float _372 = ((_294 - _363) * 0.10000000149011612f) + _363;
      _383 = _292;
      _384 = _293;
      _385 = _294;
      _386 = saturate(_260);
      _387 = (((((lerp(_320, _71.x, 0.10000000149011612f)) / _334) - _370) * _302) + _370);
      _388 = (((((lerp(_321, _71.y, 0.10000000149011612f)) / _334) - _371) * _302) + _371);
      _389 = (((((lerp(_322, _71.z, 0.10000000149011612f)) / _334) - _372) * _302) + _372);
    } else {
      _383 = _33.x;
      _384 = _33.y;
      _385 = _33.z;
      _386 = 0.0f;
      _387 = _33.x;
      _388 = _33.y;
      _389 = _33.z;
    }
    int _390 = WaveReadLaneFirst(_materialIndex);
    float _399 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_390 < (uint)170000), _390, 0)) + 0u))]._ghostFXRatio) * _386;
    _410 = ((_399 * (_387 - _383)) + _383);
    _411 = ((_399 * (_388 - _384)) + _384);
    _412 = ((_399 * (_389 - _385)) + _385);
  } else {
    _410 = _33.x;
    _411 = _33.y;
    _412 = _33.z;
  }
  uint _413 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _420 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_413), 0));
    _426 = (float((uint)((uint)(_420.x & 127))) + 0.5f);
  } else {
    _426 = 0.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_410, _411, _412));
    _794 = output_color.x;
    _795 = output_color.y;
    _796 = output_color.z;
  } else {
    _794 = _410;
    _795 = _411;
    _796 = _412;
  }
  if (_etcParams.y > 1.0f) {
    float _807 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _808 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _812 = saturate(1.0f - (dot(float2(_807, _808), float2(_807, _808)) * saturate(_etcParams.y + -1.0f)));
    _817 = (_812 * _794);
    _818 = (_812 * _795);
    _819 = (_812 * _796);
  } else {
    _817 = _794;
    _818 = _795;
    _819 = _796;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _852 = select((_817 <= 0.0031308000907301903f), (_817 * 12.920000076293945f), (((pow(_817, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _853 = select((_818 <= 0.0031308000907301903f), (_818 * 12.920000076293945f), (((pow(_818, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _854 = select((_819 <= 0.0031308000907301903f), (_819 * 12.920000076293945f), (((pow(_819, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _852 = _817;
    _853 = _818;
    _854 = _819;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _859 = float((uint)_413);
    if (!(_859 < _viewDir.w)) {
      if (!(_859 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _868 = _852;
        _869 = _853;
        _870 = _854;
      } else {
        _868 = 0.0f;
        _869 = 0.0f;
        _870 = 0.0f;
      }
    } else {
      _868 = 0.0f;
      _869 = 0.0f;
      _870 = 0.0f;
    }
  } else {
    _868 = _852;
    _869 = _853;
    _870 = _854;
  }
  SV_Target.x = _868;
  SV_Target.y = _869;
  SV_Target.z = _870;
  SV_Target.w = _426;
  return SV_Target;
}

