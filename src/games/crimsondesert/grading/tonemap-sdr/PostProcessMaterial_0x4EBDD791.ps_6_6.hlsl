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

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t32, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t33, space36);

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

ConstantBuffer<PostProcessScreenDamage_CDStruct> BindlessParameters_PostProcessScreenDamage_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float4 _25 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _368;
  float _369;
  float _370;
  float _384;
  float _589;
  float _590;
  float _591;
  float _684;
  float _685;
  float _686;
  float _740;
  float _741;
  float _742;
  float _761;
  float _762;
  float _763;
  float _793;
  float _794;
  float _795;
  float _809;
  float _810;
  float _811;
  if (!(!(_hpPercentage <= 20.0f))) {
    float _35 = 1.0f - (_hpPercentage * 0.009999999776482582f);
    if (((!(_hpPercentage <= 0.0f))) && ((_35 > 0.0f))) {
      float _41 = 0.12999999523162842f - (_hpPercentage * 0.006000000052154064f);
      float _43 = 2.0f - (_hpPercentage * 0.05000000074505806f);
      int _44 = WaveReadLaneFirst(_materialIndex);
      int _57 = WaveReadLaneFirst(_materialIndex);
      float _74 = _time.x * 0.30000001192092896f;
      int _77 = WaveReadLaneFirst(_materialIndex);
      int _85 = WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_77 < (uint)170000), _77, 0)) + 0u))]._borderInsideDistortionTexture);
      float4 _92 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_85 < (uint)65000), _85, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_74 + (TEXCOORD.x * 12.0f)), (_74 + (TEXCOORD.y * 6.0f))));
      float _94 = _92.x * 0.10000000149011612f;
      int _97 = WaveReadLaneFirst(_materialIndex);
      int _105 = WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_97 < (uint)170000), _97, 0)) + 0u))]._borderEdgeNoiseTexture);
      float4 _112 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_105 < (uint)65000), _105, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_57 < (uint)170000), _57, 0)) + 0u))]._borderEdgeNoiseOffset.x) + (WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_44 < (uint)170000), _44, 0)) + 0u))]._borderEdgeNoiseTile.x) * TEXCOORD.x)) + _94), ((WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_57 < (uint)170000), _57, 0)) + 0u))]._borderEdgeNoiseOffset.y) + (WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_44 < (uint)170000), _44, 0)) + 0u))]._borderEdgeNoiseTile.y) * TEXCOORD.y)) + _94)));
      int _114 = WaveReadLaneFirst(_materialIndex);
      float _128 = (_hpPercentage * 0.0020000000949949026f) + 0.36000001430511475f;
      float _131 = max((abs(TEXCOORD.x + -0.5f) - _128), 0.0f);
      float _132 = max((abs(TEXCOORD.y + -0.5f) - _128), 0.0f);
      int _145 = WaveReadLaneFirst(_materialIndex);
      float _154 = WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_145 < (uint)170000), _145, 0)) + 0u))]._borderFlickerOpacityMinMax.x);
      int _159 = WaveReadLaneFirst(_materialIndex);
      int _172 = WaveReadLaneFirst(_materialIndex);
      float _186 = min(max(_35, 0.0f), 1.0f) * saturate((saturate(((((WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_145 < (uint)170000), _145, 0)) + 0u))]._borderFlickerOpacityMinMax.y) - _154) * sin(frac(_time.x * _43) * 3.1415927410125732f)) + _154) * saturate(sqrt((_132 * _132) + (_131 * _131)) / WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_114 < (uint)170000), _114, 0)) + 0u))]._borderSmoothness))) * WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_159 < (uint)170000), _159, 0)) + 0u))]._borderFlickerIntensity)) * 2.0f) - (WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_172 < (uint)170000), _172, 0)) + 0u))]._borderEdgeNoiseRatio) * _112.x));
      int _187 = WaveReadLaneFirst(_materialIndex);
      int _195 = WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_187 < (uint)170000), _187, 0)) + 0u))]._sceneColorTint);
      float _198 = float((uint)((uint)(((uint)((uint)(_195)) >> 16) & 255)));
      float _201 = float((uint)((uint)(((uint)((uint)(_195)) >> 8) & 255)));
      float _203 = float((uint)((uint)(_195 & 255)));
      float _234 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
      int _238 = WaveReadLaneFirst(_materialIndex);
      int _246 = WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_238 < (uint)170000), _238, 0)) + 0u))]._borderColor1);
      float _249 = float((uint)((uint)(((uint)((uint)(_246)) >> 16) & 255)));
      float _252 = float((uint)((uint)(((uint)((uint)(_246)) >> 8) & 255)));
      float _254 = float((uint)((uint)(_246 & 255)));
      float _279 = select(((_249 * 0.003921568859368563f) < 0.040449999272823334f), (_249 * 0.0003035269910469651f), exp2(log2((_249 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
      float _280 = select(((_252 * 0.003921568859368563f) < 0.040449999272823334f), (_252 * 0.0003035269910469651f), exp2(log2((_252 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
      float _281 = select(((_254 * 0.003921568859368563f) < 0.040449999272823334f), (_254 * 0.0003035269910469651f), exp2(log2((_254 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
      int _282 = WaveReadLaneFirst(_materialIndex);
      int _290 = WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_282 < (uint)170000), _282, 0)) + 0u))]._borderColor2);
      float _293 = float((uint)((uint)(((uint)((uint)(_290)) >> 16) & 255)));
      float _296 = float((uint)((uint)(((uint)((uint)(_290)) >> 8) & 255)));
      float _298 = float((uint)((uint)(_290 & 255)));
      float _332 = saturate(sin(frac(_time.x * _43) * 3.1415927410125732f));
      float _345 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
      float _355 = (((_234 * select(((_198 * 0.003921568859368563f) < 0.040449999272823334f), (_198 * 0.0003035269910469651f), exp2(log2((_198 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) - _25.x) * _41) + _25.x;
      float _356 = (((_234 * select(((_201 * 0.003921568859368563f) < 0.040449999272823334f), (_201 * 0.0003035269910469651f), exp2(log2((_201 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) - _25.y) * _41) + _25.y;
      float _357 = (((_234 * select(((_203 * 0.003921568859368563f) < 0.040449999272823334f), (_203 * 0.0003035269910469651f), exp2(log2((_203 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) - _25.z) * _41) + _25.z;
      _368 = ((((_345 * ((_332 * (select(((_293 * 0.003921568859368563f) < 0.040449999272823334f), (_293 * 0.0003035269910469651f), exp2(log2((_293 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _279)) + _279)) - _355) * _186) + _355);
      _369 = ((((_345 * ((_332 * (select(((_296 * 0.003921568859368563f) < 0.040449999272823334f), (_296 * 0.0003035269910469651f), exp2(log2((_296 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _280)) + _280)) - _356) * _186) + _356);
      _370 = ((((_345 * ((_332 * (select(((_298 * 0.003921568859368563f) < 0.040449999272823334f), (_298 * 0.0003035269910469651f), exp2(log2((_298 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _281)) + _281)) - _357) * _186) + _357);
    } else {
      _368 = _25.x;
      _369 = _25.y;
      _370 = _25.z;
    }
  } else {
    _368 = _25.x;
    _369 = _25.y;
    _370 = _25.z;
  }
  uint _371 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _378 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_371), 0));
    _384 = (float((uint)((uint)(_378.x & 127))) + 0.5f);
  } else {
    _384 = _25.w;
  }
  bool _387 = (_localToneMappingParams.w > 0.0f);
  if (_387) {
    float3 output_color = TonemapReplacer(float3(_368, _369, _370));
    _740 = output_color.x;
    _741 = output_color.y;
    _742 = output_color.z;
  } else {
    _740 = _368;
    _741 = _369;
    _742 = _370;
  }
  if (_etcParams.y > 1.0f) {
    float _751 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _752 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _756 = saturate(1.0f - (dot(float2(_751, _752), float2(_751, _752)) * saturate(_etcParams.y + -1.0f)));
    _761 = (_756 * _740);
    _762 = (_756 * _741);
    _763 = (_756 * _742);
  } else {
    _761 = _740;
    _762 = _741;
    _763 = _742;
  }
  if ((_387) && ((_etcParams.z > 0.0f))) {
    _793 = select((_761 <= 0.0031308000907301903f), (_761 * 12.920000076293945f), (((pow(_761, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _794 = select((_762 <= 0.0031308000907301903f), (_762 * 12.920000076293945f), (((pow(_762, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _795 = select((_763 <= 0.0031308000907301903f), (_763 * 12.920000076293945f), (((pow(_763, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _793 = _761;
    _794 = _762;
    _795 = _763;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _800 = float((uint)_371);
    if (!(_800 < _viewDir.w)) {
      if (!(_800 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _809 = _793;
        _810 = _794;
        _811 = _795;
      } else {
        _809 = 0.0f;
        _810 = 0.0f;
        _811 = 0.0f;
      }
    } else {
      _809 = 0.0f;
      _810 = 0.0f;
      _811 = 0.0f;
    }
  } else {
    _809 = _793;
    _810 = _794;
    _811 = _795;
  }
  SV_Target.x = _809;
  SV_Target.y = _810;
  SV_Target.z = _811;
  SV_Target.w = _384;
  return SV_Target;
}