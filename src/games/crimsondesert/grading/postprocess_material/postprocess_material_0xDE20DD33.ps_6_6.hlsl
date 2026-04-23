#include "../tonemap.hlsli"

struct PostProcessKnowledgeGain_CDStruct {
  uint _noiseTex;
  uint _regionTex;
  float _knowledgeGainRegionRatio;
  float _knowledgeGainCharacterRatio;
  float _knowledgeGainGimmickRatio;
  uint _knowledgeGainColor;
  uint _knowledgeGainRegionNumberR;
  uint _knowledgeGainRegionNumberG;
  float3 _knowledgeGainBoundBoxMin;
  float3 _knowledgeGainBoundBoxMax;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t33, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t75, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t38, space36);

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

ConstantBuffer<PostProcessKnowledgeGain_CDStruct> BindlessParameters_PostProcessKnowledgeGain_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _25[36];
  int _28 = WaveReadLaneFirst(_materialIndex);
  float _36 = WaveReadLaneFirst(BindlessParameters_PostProcessKnowledgeGain_CD[((int)((uint)(select(((uint)_28 < (uint)170000), _28, 0)) + 0u))]._knowledgeGainCharacterRatio);
  int _37 = WaveReadLaneFirst(_materialIndex);
  float _45 = WaveReadLaneFirst(BindlessParameters_PostProcessKnowledgeGain_CD[((int)((uint)(select(((uint)_37 < (uint)170000), _37, 0)) + 0u))]._knowledgeGainGimmickRatio);
  float _319;
  float _320;
  float _321;
  float _322;
  float _336;
  float _582;
  float _583;
  float _584;
  float _704;
  float _705;
  float _706;
  float _727;
  float _728;
  float _729;
  float _762;
  float _763;
  float _764;
  float _778;
  float _779;
  float _780;
  if (((_36 >= 0.0010000000474974513f)) || ((_45 >= 0.0010000000474974513f))) {
    float _60 = saturate(saturate(((1.0f - abs((1.25f - TEXCOORD.y) - (max(_36, _45) * 1.5f))) * 4.0f) + -3.0f) * 2.0f);
    if (_60 > 0.0010000000474974513f) {
      float _66 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
      float _69 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
      float _72 = min(max(_69.x, 0.009999999776482582f), 0.10000000149011612f);
      int _81 = WaveReadLaneFirst(_materialIndex);
      int _89 = WaveReadLaneFirst(BindlessParameters_PostProcessKnowledgeGain_CD[((int)((uint)(select(((uint)_81 < (uint)170000), _81, 0)) + 0u))]._noiseTex);
      float4 _96 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_89 < (uint)65000), _89, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((8.0f / _66) * TEXCOORD.x), ((_time.x * 0.10000000149011612f) + ((3.0f / _66) * TEXCOORD.y))));
      float _100 = _96.y + -0.4000000059604645f;
      float _101 = _72 * 0.25f;
      float _104 = ((_96.x + -0.4000000059604645f) * _101) + TEXCOORD.x;
      float _105 = (_100 * _101) + TEXCOORD.y;
      float _109 = _72 * 200.0f;
      float _110 = _bufferSizeAndInvSize.z * _109;
      float _111 = _bufferSizeAndInvSize.w * _109;
      int2 _115; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_115.x, _115.y);
      float _124 = float((int)(int(float((int)(_115.x))))) + 0.5f;
      float _125 = float((int)(int(float((int)(_115.y))))) + 0.5f;
      uint _130 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int(_124 * (_104 + _110)), int(_125 * (_105 + _111)), 0));
      uint _139 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int(_124 * (_104 - _110)), int(_125 * (_105 - _111)), 0));
      uint _146 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int(_124 * _104), int(_125 * _105), 0));
      float4 _169 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * _104), int(_customRenderPassSizeInvSize.y * _105), 0));
      float4 _190 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(uint(_bufferSizeAndInvSize.x * TEXCOORD.x)), (int)(uint(_bufferSizeAndInvSize.y * TEXCOORD.y)), 0));
      float _203 = (saturate(_190.x * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _204 = (saturate(_190.y * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _205 = (saturate(_190.z * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _207 = rsqrt(dot(float3(_203, _204, _205), float3(_203, _204, _205)));
      float _219 = abs(dot(float3((_207 * _203), (_207 * _204), (_205 * _207)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
      float _222 = saturate((_219 * _219) * 2.0f);
      float _224 = (_72 * 0.10000000149011612f) * _100;
      float _225 = _224 + TEXCOORD.x;
      float _226 = _224 + TEXCOORD.y;
      float4 _228 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(_225, _226));
      float _232 = dot(float3(_228.x, _228.y, _228.z), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
      float4 _235 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_225 + -0.0020000000949949026f), (_226 + -0.0020000000949949026f)));
      float _239 = dot(float3(_235.x, _235.y, _235.z), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
      float4 _242 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_225 + 0.0020000000949949026f), (_226 + 0.0020000000949949026f)));
      float _246 = dot(float3(_242.x, _242.y, _242.z), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
      int _247 = WaveReadLaneFirst(_materialIndex);
      int _255 = WaveReadLaneFirst(BindlessParameters_PostProcessKnowledgeGain_CD[((int)((uint)(select(((uint)_247 < (uint)170000), _247, 0)) + 0u))]._knowledgeGainColor);
      float _258 = float((uint)((uint)(((uint)((uint)(_255)) >> 16) & 255)));
      float _261 = float((uint)((uint)(((uint)((uint)(_255)) >> 8) & 255)));
      float _263 = float((uint)((uint)(_255 & 255)));
      float _288 = select(((_258 * 0.003921568859368563f) < 0.040449999272823334f), (_258 * 0.0003035269910469651f), exp2(log2((_258 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
      float _289 = select(((_261 * 0.003921568859368563f) < 0.040449999272823334f), (_261 * 0.0003035269910469651f), exp2(log2((_261 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
      float _290 = select(((_263 * 0.003921568859368563f) < 0.040449999272823334f), (_263 * 0.0003035269910469651f), exp2(log2((_263 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
      float _302 = max(0.0010000000474974513f, _exposure0.x);
      _319 = ((((((lerp(_288, 0.0010000000474974513f, _222)) / _302) * _239) - _239) * 0.4000000059604645f) + _239);
      _320 = ((((((lerp(_289, 0.0010000000474974513f, _222)) / _302) * _232) - _232) * 0.4000000059604645f) + _232);
      _321 = ((((((lerp(_290, 0.0010000000474974513f, _222)) / _302) * _246) - _246) * 0.4000000059604645f) + _246);
      _322 = ((saturate(float((int)((((int)(uint)((int)((_139.x & 255) == _renderPassKnowledgeGain))) + ((int)(uint)((int)((_146.x & 255) == _renderPassKnowledgeGain)))) + ((int)(uint)((int)((_130.x & 255) == _renderPassKnowledgeGain)))))) * _60) * saturate(ceil(((_nearFarProj.x / max(1.0000000116860974e-07f, _69.x)) + 0.10000000149011612f) - (_nearFarProj.x / max(1.0000000116860974e-07f, _169.x)))));
    } else {
      _319 = 0.0f;
      _320 = 0.0f;
      _321 = 0.0f;
      _322 = 0.0f;
    }
  } else {
    _319 = 0.0f;
    _320 = 0.0f;
    _321 = 0.0f;
    _322 = 0.0f;
  }
  uint _323 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _330 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_323), 0));
    _336 = (float((uint)((uint)(_330.x & 127))) + 0.5f);
  } else {
    _336 = _322;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_319, _320, _321));
    _704 = output_color.x;
    _705 = output_color.y;
    _706 = output_color.z;
  } else {
    _704 = _319;
    _705 = _320;
    _706 = _321;
  }
  if (_etcParams.y > 1.0f) {
    float _717 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _718 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _722 = saturate(1.0f - (dot(float2(_717, _718), float2(_717, _718)) * saturate(_etcParams.y + -1.0f)));
    _727 = (_722 * _704);
    _728 = (_722 * _705);
    _729 = (_722 * _706);
  } else {
    _727 = _704;
    _728 = _705;
    _729 = _706;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _762 = select((_727 <= 0.0031308000907301903f), (_727 * 12.920000076293945f), (((pow(_727, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _763 = select((_728 <= 0.0031308000907301903f), (_728 * 12.920000076293945f), (((pow(_728, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _764 = select((_729 <= 0.0031308000907301903f), (_729 * 12.920000076293945f), (((pow(_729, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _762 = _727;
    _763 = _728;
    _764 = _729;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _769 = float((uint)_323);
    if (!(_769 < _viewDir.w)) {
      if (!(_769 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _778 = _762;
        _779 = _763;
        _780 = _764;
      } else {
        _778 = 0.0f;
        _779 = 0.0f;
        _780 = 0.0f;
      }
    } else {
      _778 = 0.0f;
      _779 = 0.0f;
      _780 = 0.0f;
    }
  } else {
    _778 = _762;
    _779 = _763;
    _780 = _764;
  }
  SV_Target.x = _778;
  SV_Target.y = _779;
  SV_Target.z = _780;
  SV_Target.w = _336;
  return SV_Target;
}

