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

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t32, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t40, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t33, space36);

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

ConstantBuffer<PostProcessKnowledgeGain_CDStruct> BindlessParameters_PostProcessKnowledgeGain_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  int _29 = WaveReadLaneFirst(_materialIndex);
  float _37 = WaveReadLaneFirst(BindlessParameters_PostProcessKnowledgeGain_CD[((int)((uint)(select(((uint)_29 < (uint)170000), _29, 0)) + 0u))]._knowledgeGainCharacterRatio);
  int _38 = WaveReadLaneFirst(_materialIndex);
  float _46 = WaveReadLaneFirst(BindlessParameters_PostProcessKnowledgeGain_CD[((int)((uint)(select(((uint)_38 < (uint)170000), _38, 0)) + 0u))]._knowledgeGainGimmickRatio);
  float _320;
  float _321;
  float _322;
  float _323;
  float _337;
  float _542;
  float _543;
  float _544;
  float _637;
  float _638;
  float _639;
  float _693;
  float _694;
  float _695;
  float _714;
  float _715;
  float _716;
  float _746;
  float _747;
  float _748;
  float _762;
  float _763;
  float _764;
  if (((_37 >= 0.0010000000474974513f)) || ((_46 >= 0.0010000000474974513f))) {
    float _61 = saturate(saturate(((1.0f - abs((1.25f - TEXCOORD.y) - (max(_37, _46) * 1.5f))) * 4.0f) + -3.0f) * 2.0f);
    if (_61 > 0.0010000000474974513f) {
      float _67 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
      float _70 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
      float _73 = min(max(_70.x, 0.009999999776482582f), 0.10000000149011612f);
      int _82 = WaveReadLaneFirst(_materialIndex);
      int _90 = WaveReadLaneFirst(BindlessParameters_PostProcessKnowledgeGain_CD[((int)((uint)(select(((uint)_82 < (uint)170000), _82, 0)) + 0u))]._noiseTex);
      float4 _97 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_90 < (uint)65000), _90, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((8.0f / _67) * TEXCOORD.x), ((_time.x * 0.10000000149011612f) + ((3.0f / _67) * TEXCOORD.y))));
      float _101 = _97.y + -0.4000000059604645f;
      float _102 = _73 * 0.25f;
      float _105 = ((_97.x + -0.4000000059604645f) * _102) + TEXCOORD.x;
      float _106 = (_101 * _102) + TEXCOORD.y;
      float _110 = _73 * 200.0f;
      float _111 = _bufferSizeAndInvSize.z * _110;
      float _112 = _bufferSizeAndInvSize.w * _110;
      int2 _116; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_116.x, _116.y);
      float _125 = float((int)(int(float((int)(_116.x))))) + 0.5f;
      float _126 = float((int)(int(float((int)(_116.y))))) + 0.5f;
      uint _131 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int(_125 * (_105 + _111)), int(_126 * (_106 + _112)), 0));
      uint _140 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int(_125 * (_105 - _111)), int(_126 * (_106 - _112)), 0));
      uint _147 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int(_125 * _105), int(_126 * _106), 0));
      float4 _170 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * _105), int(_customRenderPassSizeInvSize.y * _106), 0));
      float4 _191 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(uint(_bufferSizeAndInvSize.x * TEXCOORD.x)), (int)(uint(_bufferSizeAndInvSize.y * TEXCOORD.y)), 0));
      float _204 = (saturate(_191.x * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _205 = (saturate(_191.y * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _206 = (saturate(_191.z * 1.0009784698486328f) * 2.0f) + -1.0f;
      float _208 = rsqrt(dot(float3(_204, _205, _206), float3(_204, _205, _206)));
      float _220 = abs(dot(float3((_208 * _204), (_208 * _205), (_206 * _208)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
      float _223 = saturate((_220 * _220) * 2.0f);
      float _225 = (_73 * 0.10000000149011612f) * _101;
      float _226 = _225 + TEXCOORD.x;
      float _227 = _225 + TEXCOORD.y;
      float4 _229 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(_226, _227));
      float _233 = dot(float3(_229.x, _229.y, _229.z), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
      float4 _236 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_226 + -0.0020000000949949026f), (_227 + -0.0020000000949949026f)));
      float _240 = dot(float3(_236.x, _236.y, _236.z), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
      float4 _243 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_226 + 0.0020000000949949026f), (_227 + 0.0020000000949949026f)));
      float _247 = dot(float3(_243.x, _243.y, _243.z), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
      int _248 = WaveReadLaneFirst(_materialIndex);
      int _256 = WaveReadLaneFirst(BindlessParameters_PostProcessKnowledgeGain_CD[((int)((uint)(select(((uint)_248 < (uint)170000), _248, 0)) + 0u))]._knowledgeGainColor);
      float _259 = float((uint)((uint)(((uint)((uint)(_256)) >> 16) & 255)));
      float _262 = float((uint)((uint)(((uint)((uint)(_256)) >> 8) & 255)));
      float _264 = float((uint)((uint)(_256 & 255)));
      float _289 = select(((_259 * 0.003921568859368563f) < 0.040449999272823334f), (_259 * 0.0003035269910469651f), exp2(log2((_259 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
      float _290 = select(((_262 * 0.003921568859368563f) < 0.040449999272823334f), (_262 * 0.0003035269910469651f), exp2(log2((_262 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
      float _291 = select(((_264 * 0.003921568859368563f) < 0.040449999272823334f), (_264 * 0.0003035269910469651f), exp2(log2((_264 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
      float _303 = max(0.0010000000474974513f, _exposure0.x);
      _320 = ((((((lerp(_289, 0.0010000000474974513f, _223)) / _303) * _240) - _240) * 0.4000000059604645f) + _240);
      _321 = ((((((lerp(_290, 0.0010000000474974513f, _223)) / _303) * _233) - _233) * 0.4000000059604645f) + _233);
      _322 = ((((((lerp(_291, 0.0010000000474974513f, _223)) / _303) * _247) - _247) * 0.4000000059604645f) + _247);
      _323 = ((saturate(float((int)((((int)(uint)((int)((_140.x & 255) == _renderPassKnowledgeGain))) + ((int)(uint)((int)((_147.x & 255) == _renderPassKnowledgeGain)))) + ((int)(uint)((int)((_131.x & 255) == _renderPassKnowledgeGain)))))) * _61) * saturate(ceil(((_nearFarProj.x / max(1.0000000116860974e-07f, _70.x)) + 0.10000000149011612f) - (_nearFarProj.x / max(1.0000000116860974e-07f, _170.x)))));
    } else {
      _320 = 0.0f;
      _321 = 0.0f;
      _322 = 0.0f;
      _323 = 0.0f;
    }
  } else {
    _320 = 0.0f;
    _321 = 0.0f;
    _322 = 0.0f;
    _323 = 0.0f;
  }
  uint _324 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _331 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_324), 0));
    _337 = (float((uint)((uint)(_331.x & 127))) + 0.5f);
  } else {
    _337 = _323;
  }
  bool _340 = (_localToneMappingParams.w > 0.0f);
  if (_340) {
    float3 output_color = TonemapReplacer(float3(_320, _321, _322));
    _693 = output_color.x;
    _694 = output_color.y;
    _695 = output_color.z;
  } else {
    _693 = _320;
    _694 = _321;
    _695 = _322;
  }
  if (_etcParams.y > 1.0f) {
    float _704 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _705 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _709 = saturate(1.0f - (dot(float2(_704, _705), float2(_704, _705)) * saturate(_etcParams.y + -1.0f)));
    _714 = (_709 * _693);
    _715 = (_709 * _694);
    _716 = (_709 * _695);
  } else {
    _714 = _693;
    _715 = _694;
    _716 = _695;
  }
  if ((_340) && ((_etcParams.z > 0.0f))) {
    _746 = select((_714 <= 0.0031308000907301903f), (_714 * 12.920000076293945f), (((pow(_714, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _747 = select((_715 <= 0.0031308000907301903f), (_715 * 12.920000076293945f), (((pow(_715, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _748 = select((_716 <= 0.0031308000907301903f), (_716 * 12.920000076293945f), (((pow(_716, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _746 = _714;
    _747 = _715;
    _748 = _716;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _753 = float((uint)_324);
    if (!(_753 < _viewDir.w)) {
      if (!(_753 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _762 = _746;
        _763 = _747;
        _764 = _748;
      } else {
        _762 = 0.0f;
        _763 = 0.0f;
        _764 = 0.0f;
      }
    } else {
      _762 = 0.0f;
      _763 = 0.0f;
      _764 = 0.0f;
    }
  } else {
    _762 = _746;
    _763 = _747;
    _764 = _748;
  }
  SV_Target.x = _762;
  SV_Target.y = _763;
  SV_Target.z = _764;
  SV_Target.w = _337;
  return SV_Target;
}