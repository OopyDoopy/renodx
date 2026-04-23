#include "../tonemap.hlsli"

struct PostProcessScreenDamage_CDStruct {
  float _borderRatio;
  float _borderWidth;
  float _borderSmoothness;
  float _borderEdgeNoiseRatio;
  float2 _borderEdgeNoiseOffset;
  float2 _borderEdgeNoiseTile;
  uint _borderColor1;
  uint _borderColor2;
  uint _sceneColorTint;
  uint _borderEdgeNoiseTexture;
  uint _borderInsideDistortionTexture;
  float _borderFlickerSpeed;
  float _borderFlickerIntensity;
  float2 _borderFlickerOpacityMinMax;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

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

ConstantBuffer<PostProcessScreenDamage_CDStruct> BindlessParameters_PostProcessScreenDamage_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _19[36];
  float4 _24 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _35 = (pow(_24.x, 0.012683313339948654f));
  float _36 = (pow(_24.y, 0.012683313339948654f));
  float _37 = (pow(_24.z, 0.012683313339948654f));
  float _62 = exp2(log2(max(0.0f, (_35 + -0.8359375f)) / (18.8515625f - (_35 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _63 = exp2(log2(max(0.0f, (_36 + -0.8359375f)) / (18.8515625f - (_36 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _64 = exp2(log2(max(0.0f, (_37 + -0.8359375f)) / (18.8515625f - (_37 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _403;
  float _404;
  float _405;
  float _419;
  float _665;
  float _666;
  float _667;
  float _787;
  float _788;
  float _789;
  float _810;
  float _811;
  float _812;
  float _845;
  float _846;
  float _847;
  float _861;
  float _862;
  float _863;
  if (!(!(_hpPercentage <= 20.0f))) {
    float _70 = 1.0f - (_hpPercentage * 0.009999999776482582f);
    if (((!(_hpPercentage <= 0.0f))) && ((_70 > 0.0f))) {
      float _76 = 0.12999999523162842f - (_hpPercentage * 0.006000000052154064f);
      float _78 = 2.0f - (_hpPercentage * 0.05000000074505806f);
      int _79 = WaveReadLaneFirst(_materialIndex);
      int _92 = WaveReadLaneFirst(_materialIndex);
      float _109 = _time.x * 0.30000001192092896f;
      int _112 = WaveReadLaneFirst(_materialIndex);
      int _120 = WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_112 < (uint)170000), _112, 0)) + 0u))]._borderInsideDistortionTexture);
      float4 _127 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_120 < (uint)65000), _120, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_109 + (TEXCOORD.x * 12.0f)), (_109 + (TEXCOORD.y * 6.0f))));
      float _129 = _127.x * 0.10000000149011612f;
      int _132 = WaveReadLaneFirst(_materialIndex);
      int _140 = WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_132 < (uint)170000), _132, 0)) + 0u))]._borderEdgeNoiseTexture);
      float4 _147 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_140 < (uint)65000), _140, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_92 < (uint)170000), _92, 0)) + 0u))]._borderEdgeNoiseOffset.x) + (WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_79 < (uint)170000), _79, 0)) + 0u))]._borderEdgeNoiseTile.x) * TEXCOORD.x)) + _129), ((WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_92 < (uint)170000), _92, 0)) + 0u))]._borderEdgeNoiseOffset.y) + (WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_79 < (uint)170000), _79, 0)) + 0u))]._borderEdgeNoiseTile.y) * TEXCOORD.y)) + _129)));
      int _149 = WaveReadLaneFirst(_materialIndex);
      float _163 = (_hpPercentage * 0.0020000000949949026f) + 0.36000001430511475f;
      float _166 = max((abs(TEXCOORD.x + -0.5f) - _163), 0.0f);
      float _167 = max((abs(TEXCOORD.y + -0.5f) - _163), 0.0f);
      int _180 = WaveReadLaneFirst(_materialIndex);
      float _189 = WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_180 < (uint)170000), _180, 0)) + 0u))]._borderFlickerOpacityMinMax.x);
      int _194 = WaveReadLaneFirst(_materialIndex);
      int _207 = WaveReadLaneFirst(_materialIndex);
      float _221 = min(max(_70, 0.0f), 1.0f) * saturate((saturate(((((WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_180 < (uint)170000), _180, 0)) + 0u))]._borderFlickerOpacityMinMax.y) - _189) * sin(frac(_time.x * _78) * 3.1415927410125732f)) + _189) * saturate(sqrt((_167 * _167) + (_166 * _166)) / WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_149 < (uint)170000), _149, 0)) + 0u))]._borderSmoothness))) * WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_194 < (uint)170000), _194, 0)) + 0u))]._borderFlickerIntensity)) * 2.0f) - (WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_207 < (uint)170000), _207, 0)) + 0u))]._borderEdgeNoiseRatio) * _147.x));
      int _222 = WaveReadLaneFirst(_materialIndex);
      int _230 = WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_222 < (uint)170000), _222, 0)) + 0u))]._sceneColorTint);
      float _233 = float((uint)((uint)(((uint)((uint)(_230)) >> 16) & 255)));
      float _236 = float((uint)((uint)(((uint)((uint)(_230)) >> 8) & 255)));
      float _238 = float((uint)((uint)(_230 & 255)));
      float _269 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
      int _273 = WaveReadLaneFirst(_materialIndex);
      int _281 = WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_273 < (uint)170000), _273, 0)) + 0u))]._borderColor1);
      float _284 = float((uint)((uint)(((uint)((uint)(_281)) >> 16) & 255)));
      float _287 = float((uint)((uint)(((uint)((uint)(_281)) >> 8) & 255)));
      float _289 = float((uint)((uint)(_281 & 255)));
      float _314 = select(((_284 * 0.003921568859368563f) < 0.040449999272823334f), (_284 * 0.0003035269910469651f), exp2(log2((_284 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
      float _315 = select(((_287 * 0.003921568859368563f) < 0.040449999272823334f), (_287 * 0.0003035269910469651f), exp2(log2((_287 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
      float _316 = select(((_289 * 0.003921568859368563f) < 0.040449999272823334f), (_289 * 0.0003035269910469651f), exp2(log2((_289 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
      int _317 = WaveReadLaneFirst(_materialIndex);
      int _325 = WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_317 < (uint)170000), _317, 0)) + 0u))]._borderColor2);
      float _328 = float((uint)((uint)(((uint)((uint)(_325)) >> 16) & 255)));
      float _331 = float((uint)((uint)(((uint)((uint)(_325)) >> 8) & 255)));
      float _333 = float((uint)((uint)(_325 & 255)));
      float _367 = saturate(sin(frac(_time.x * _78) * 3.1415927410125732f));
      float _380 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
      float _390 = (((_269 * select(((_233 * 0.003921568859368563f) < 0.040449999272823334f), (_233 * 0.0003035269910469651f), exp2(log2((_233 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) - _62) * _76) + _62;
      float _391 = (((_269 * select(((_236 * 0.003921568859368563f) < 0.040449999272823334f), (_236 * 0.0003035269910469651f), exp2(log2((_236 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) - _63) * _76) + _63;
      float _392 = (((_269 * select(((_238 * 0.003921568859368563f) < 0.040449999272823334f), (_238 * 0.0003035269910469651f), exp2(log2((_238 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) - _64) * _76) + _64;
      _403 = ((((_380 * ((_367 * (select(((_328 * 0.003921568859368563f) < 0.040449999272823334f), (_328 * 0.0003035269910469651f), exp2(log2((_328 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _314)) + _314)) - _390) * _221) + _390);
      _404 = ((((_380 * ((_367 * (select(((_331 * 0.003921568859368563f) < 0.040449999272823334f), (_331 * 0.0003035269910469651f), exp2(log2((_331 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _315)) + _315)) - _391) * _221) + _391);
      _405 = ((((_380 * ((_367 * (select(((_333 * 0.003921568859368563f) < 0.040449999272823334f), (_333 * 0.0003035269910469651f), exp2(log2((_333 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _316)) + _316)) - _392) * _221) + _392);
    } else {
      _403 = _62;
      _404 = _63;
      _405 = _64;
    }
  } else {
    _403 = _62;
    _404 = _63;
    _405 = _64;
  }
  uint _406 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _413 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_406), 0));
    _419 = (float((uint)((uint)(_413.x & 127))) + 0.5f);
  } else {
    _419 = _24.w;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_403, _404, _405));
    _787 = output_color.x;
    _788 = output_color.y;
    _789 = output_color.z;
  } else {
    _787 = _403;
    _788 = _404;
    _789 = _405;
  }
  if (_etcParams.y > 1.0f) {
    float _800 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _801 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _805 = saturate(1.0f - (dot(float2(_800, _801), float2(_800, _801)) * saturate(_etcParams.y + -1.0f)));
    _810 = (_805 * _787);
    _811 = (_805 * _788);
    _812 = (_805 * _789);
  } else {
    _810 = _787;
    _811 = _788;
    _812 = _789;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _845 = select((_810 <= 0.0031308000907301903f), (_810 * 12.920000076293945f), (((pow(_810, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _846 = select((_811 <= 0.0031308000907301903f), (_811 * 12.920000076293945f), (((pow(_811, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _847 = select((_812 <= 0.0031308000907301903f), (_812 * 12.920000076293945f), (((pow(_812, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _845 = _810;
    _846 = _811;
    _847 = _812;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _852 = float((uint)_406);
    if (!(_852 < _viewDir.w)) {
      if (!(_852 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _861 = _845;
        _862 = _846;
        _863 = _847;
      } else {
        _861 = 0.0f;
        _862 = 0.0f;
        _863 = 0.0f;
      }
    } else {
      _861 = 0.0f;
      _862 = 0.0f;
      _863 = 0.0f;
    }
  } else {
    _861 = _845;
    _862 = _846;
    _863 = _847;
  }
  float _873 = exp2(log2(_861 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _874 = exp2(log2(_862 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _875 = exp2(log2(_863 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_873 * 18.6875f) + 1.0f)) * ((_873 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_874 * 18.6875f) + 1.0f)) * ((_874 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_875 * 18.6875f) + 1.0f)) * ((_875 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _419;
  return SV_Target;
}

