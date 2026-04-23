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
  float _367;
  float _368;
  float _369;
  float _383;
  float _629;
  float _630;
  float _631;
  float _751;
  float _752;
  float _753;
  float _774;
  float _775;
  float _776;
  float _809;
  float _810;
  float _811;
  float _825;
  float _826;
  float _827;
  if (!(!(_hpPercentage <= 20.0f))) {
    float _34 = 1.0f - (_hpPercentage * 0.009999999776482582f);
    if (((!(_hpPercentage <= 0.0f))) && ((_34 > 0.0f))) {
      float _40 = 0.12999999523162842f - (_hpPercentage * 0.006000000052154064f);
      float _42 = 2.0f - (_hpPercentage * 0.05000000074505806f);
      int _43 = WaveReadLaneFirst(_materialIndex);
      int _56 = WaveReadLaneFirst(_materialIndex);
      float _73 = _time.x * 0.30000001192092896f;
      int _76 = WaveReadLaneFirst(_materialIndex);
      int _84 = WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_76 < (uint)170000), _76, 0)) + 0u))]._borderInsideDistortionTexture);
      float4 _91 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_84 < (uint)65000), _84, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_73 + (TEXCOORD.x * 12.0f)), (_73 + (TEXCOORD.y * 6.0f))));
      float _93 = _91.x * 0.10000000149011612f;
      int _96 = WaveReadLaneFirst(_materialIndex);
      int _104 = WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_96 < (uint)170000), _96, 0)) + 0u))]._borderEdgeNoiseTexture);
      float4 _111 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_104 < (uint)65000), _104, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_56 < (uint)170000), _56, 0)) + 0u))]._borderEdgeNoiseOffset.x) + (WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_43 < (uint)170000), _43, 0)) + 0u))]._borderEdgeNoiseTile.x) * TEXCOORD.x)) + _93), ((WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_56 < (uint)170000), _56, 0)) + 0u))]._borderEdgeNoiseOffset.y) + (WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_43 < (uint)170000), _43, 0)) + 0u))]._borderEdgeNoiseTile.y) * TEXCOORD.y)) + _93)));
      int _113 = WaveReadLaneFirst(_materialIndex);
      float _127 = (_hpPercentage * 0.0020000000949949026f) + 0.36000001430511475f;
      float _130 = max((abs(TEXCOORD.x + -0.5f) - _127), 0.0f);
      float _131 = max((abs(TEXCOORD.y + -0.5f) - _127), 0.0f);
      int _144 = WaveReadLaneFirst(_materialIndex);
      float _153 = WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_144 < (uint)170000), _144, 0)) + 0u))]._borderFlickerOpacityMinMax.x);
      int _158 = WaveReadLaneFirst(_materialIndex);
      int _171 = WaveReadLaneFirst(_materialIndex);
      float _185 = min(max(_34, 0.0f), 1.0f) * saturate((saturate(((((WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_144 < (uint)170000), _144, 0)) + 0u))]._borderFlickerOpacityMinMax.y) - _153) * sin(frac(_time.x * _42) * 3.1415927410125732f)) + _153) * saturate(sqrt((_131 * _131) + (_130 * _130)) / WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_113 < (uint)170000), _113, 0)) + 0u))]._borderSmoothness))) * WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_158 < (uint)170000), _158, 0)) + 0u))]._borderFlickerIntensity)) * 2.0f) - (WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_171 < (uint)170000), _171, 0)) + 0u))]._borderEdgeNoiseRatio) * _111.x));
      int _186 = WaveReadLaneFirst(_materialIndex);
      int _194 = WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_186 < (uint)170000), _186, 0)) + 0u))]._sceneColorTint);
      float _197 = float((uint)((uint)(((uint)((uint)(_194)) >> 16) & 255)));
      float _200 = float((uint)((uint)(((uint)((uint)(_194)) >> 8) & 255)));
      float _202 = float((uint)((uint)(_194 & 255)));
      float _233 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
      int _237 = WaveReadLaneFirst(_materialIndex);
      int _245 = WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_237 < (uint)170000), _237, 0)) + 0u))]._borderColor1);
      float _248 = float((uint)((uint)(((uint)((uint)(_245)) >> 16) & 255)));
      float _251 = float((uint)((uint)(((uint)((uint)(_245)) >> 8) & 255)));
      float _253 = float((uint)((uint)(_245 & 255)));
      float _278 = select(((_248 * 0.003921568859368563f) < 0.040449999272823334f), (_248 * 0.0003035269910469651f), exp2(log2((_248 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
      float _279 = select(((_251 * 0.003921568859368563f) < 0.040449999272823334f), (_251 * 0.0003035269910469651f), exp2(log2((_251 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
      float _280 = select(((_253 * 0.003921568859368563f) < 0.040449999272823334f), (_253 * 0.0003035269910469651f), exp2(log2((_253 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
      int _281 = WaveReadLaneFirst(_materialIndex);
      int _289 = WaveReadLaneFirst(BindlessParameters_PostProcessScreenDamage_CD[((int)((uint)(select(((uint)_281 < (uint)170000), _281, 0)) + 0u))]._borderColor2);
      float _292 = float((uint)((uint)(((uint)((uint)(_289)) >> 16) & 255)));
      float _295 = float((uint)((uint)(((uint)((uint)(_289)) >> 8) & 255)));
      float _297 = float((uint)((uint)(_289 & 255)));
      float _331 = saturate(sin(frac(_time.x * _42) * 3.1415927410125732f));
      float _344 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
      float _354 = (((_233 * select(((_197 * 0.003921568859368563f) < 0.040449999272823334f), (_197 * 0.0003035269910469651f), exp2(log2((_197 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) - _24.x) * _40) + _24.x;
      float _355 = (((_233 * select(((_200 * 0.003921568859368563f) < 0.040449999272823334f), (_200 * 0.0003035269910469651f), exp2(log2((_200 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) - _24.y) * _40) + _24.y;
      float _356 = (((_233 * select(((_202 * 0.003921568859368563f) < 0.040449999272823334f), (_202 * 0.0003035269910469651f), exp2(log2((_202 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) - _24.z) * _40) + _24.z;
      _367 = ((((_344 * ((_331 * (select(((_292 * 0.003921568859368563f) < 0.040449999272823334f), (_292 * 0.0003035269910469651f), exp2(log2((_292 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _278)) + _278)) - _354) * _185) + _354);
      _368 = ((((_344 * ((_331 * (select(((_295 * 0.003921568859368563f) < 0.040449999272823334f), (_295 * 0.0003035269910469651f), exp2(log2((_295 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _279)) + _279)) - _355) * _185) + _355);
      _369 = ((((_344 * ((_331 * (select(((_297 * 0.003921568859368563f) < 0.040449999272823334f), (_297 * 0.0003035269910469651f), exp2(log2((_297 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _280)) + _280)) - _356) * _185) + _356);
    } else {
      _367 = _24.x;
      _368 = _24.y;
      _369 = _24.z;
    }
  } else {
    _367 = _24.x;
    _368 = _24.y;
    _369 = _24.z;
  }
  uint _370 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _377 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_370), 0));
    _383 = (float((uint)((uint)(_377.x & 127))) + 0.5f);
  } else {
    _383 = _24.w;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_367, _368, _369));
    _751 = output_color.x;
    _752 = output_color.y;
    _753 = output_color.z;
  } else {
    _751 = _367;
    _752 = _368;
    _753 = _369;
  }
  if (_etcParams.y > 1.0f) {
    float _764 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _765 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _769 = saturate(1.0f - (dot(float2(_764, _765), float2(_764, _765)) * saturate(_etcParams.y + -1.0f)));
    _774 = (_769 * _751);
    _775 = (_769 * _752);
    _776 = (_769 * _753);
  } else {
    _774 = _751;
    _775 = _752;
    _776 = _753;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _809 = select((_774 <= 0.0031308000907301903f), (_774 * 12.920000076293945f), (((pow(_774, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _810 = select((_775 <= 0.0031308000907301903f), (_775 * 12.920000076293945f), (((pow(_775, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _811 = select((_776 <= 0.0031308000907301903f), (_776 * 12.920000076293945f), (((pow(_776, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _809 = _774;
    _810 = _775;
    _811 = _776;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _816 = float((uint)_370);
    if (!(_816 < _viewDir.w)) {
      if (!(_816 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _825 = _809;
        _826 = _810;
        _827 = _811;
      } else {
        _825 = 0.0f;
        _826 = 0.0f;
        _827 = 0.0f;
      }
    } else {
      _825 = 0.0f;
      _826 = 0.0f;
      _827 = 0.0f;
    }
  } else {
    _825 = _809;
    _826 = _810;
    _827 = _811;
  }
  SV_Target.x = _825;
  SV_Target.y = _826;
  SV_Target.z = _827;
  SV_Target.w = _383;
  return SV_Target;
}

