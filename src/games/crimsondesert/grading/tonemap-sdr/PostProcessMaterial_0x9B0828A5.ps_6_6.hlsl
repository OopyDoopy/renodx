struct PostProcessChromaticRadialBlurStruct {
  float _ratio;
  float _start;
  float _offsetR;
  float _offsetG;
  float _offsetB;
  float _rangeR;
  float _rangeG;
  float _rangeB;
  float _centerX;
  float _centerY;
};


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

ConstantBuffer<PostProcessChromaticRadialBlurStruct> BindlessParameters_PostProcessChromaticRadialBlur[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  int _19 = WaveReadLaneFirst(_materialIndex);
  int _28 = WaveReadLaneFirst(_materialIndex);
  float _36 = WaveReadLaneFirst(BindlessParameters_PostProcessChromaticRadialBlur[((int)((uint)(select(((uint)_28 < (uint)170000), _28, 0)) + 0u))]._start);
  int _37 = WaveReadLaneFirst(_materialIndex);
  int _46 = WaveReadLaneFirst(_materialIndex);
  int _55 = WaveReadLaneFirst(_materialIndex);
  int _64 = WaveReadLaneFirst(_materialIndex);
  int _73 = WaveReadLaneFirst(_materialIndex);
  int _82 = WaveReadLaneFirst(_materialIndex);
  int _91 = WaveReadLaneFirst(_materialIndex);
  float _99 = WaveReadLaneFirst(BindlessParameters_PostProcessChromaticRadialBlur[((int)((uint)(select(((uint)_91 < (uint)170000), _91, 0)) + 0u))]._centerX);
  int _100 = WaveReadLaneFirst(_materialIndex);
  float _108 = WaveReadLaneFirst(BindlessParameters_PostProcessChromaticRadialBlur[((int)((uint)(select(((uint)_100 < (uint)170000), _100, 0)) + 0u))]._centerY);
  float _109 = TEXCOORD.x - _99;
  float _110 = TEXCOORD.y - _108;
  float _127 = (float((uint)(uint)(_enableChromaticAberration)) * WaveReadLaneFirst(BindlessParameters_PostProcessChromaticRadialBlur[((int)((uint)(select(((uint)_19 < (uint)170000), _19, 0)) + 0u))]._ratio)) * saturate(((sqrt((_110 * _110) + (_109 * _109)) * 2.0f) - (_36 * 1.4142135381698608f)) / max(0.0010000000474974513f, ((1.0f - _36) * 1.4142135381698608f)));
  float _129;
  float _130;
  float _131;
  int _132;
  float _241;
  float _446;
  float _447;
  float _448;
  float _541;
  float _542;
  float _543;
  float _597;
  float _598;
  float _599;
  float _618;
  float _619;
  float _620;
  float _650;
  float _651;
  float _652;
  float _666;
  float _667;
  float _668;
  _129 = 0.0f;
  _130 = 0.0f;
  _131 = 0.0f;
  _132 = 0;
  while(true) {
    float _135 = float((int)(_132)) * 0.25f;
    float _137 = (1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessChromaticRadialBlur[((int)((uint)(select(((uint)_64 < (uint)170000), _64, 0)) + 0u))]._offsetR)) + (_135 * WaveReadLaneFirst(BindlessParameters_PostProcessChromaticRadialBlur[((int)((uint)(select(((uint)_37 < (uint)170000), _37, 0)) + 0u))]._rangeR));
    float _140 = (1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessChromaticRadialBlur[((int)((uint)(select(((uint)_73 < (uint)170000), _73, 0)) + 0u))]._offsetG)) + (_135 * WaveReadLaneFirst(BindlessParameters_PostProcessChromaticRadialBlur[((int)((uint)(select(((uint)_46 < (uint)170000), _46, 0)) + 0u))]._rangeG));
    float _143 = (1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessChromaticRadialBlur[((int)((uint)(select(((uint)_82 < (uint)170000), _82, 0)) + 0u))]._offsetB)) + (_135 * WaveReadLaneFirst(BindlessParameters_PostProcessChromaticRadialBlur[((int)((uint)(select(((uint)_55 < (uint)170000), _55, 0)) + 0u))]._rangeB));
    float _146 = _99 - TEXCOORD.x;
    float _148 = _108 - TEXCOORD.y;
    float4 _172 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(((_127 * ((_109 * _137) + _146)) + TEXCOORD.x), ((_127 * ((_110 * _137) + _148)) + TEXCOORD.y)));
    float _176 = (pow(_172.x, 0.012683313339948654f));
    float _186 = (exp2(log2(max(0.0f, (_176 + -0.8359375f)) / (18.8515625f - (_176 * 18.6875f))) * 6.277394771575928f) * 10000.0f) + _129;
    float4 _187 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(((_127 * ((_109 * _140) + _146)) + TEXCOORD.x), ((_127 * ((_110 * _140) + _148)) + TEXCOORD.y)));
    float _191 = (pow(_187.y, 0.012683313339948654f));
    float _201 = (exp2(log2(max(0.0f, (_191 + -0.8359375f)) / (18.8515625f - (_191 * 18.6875f))) * 6.277394771575928f) * 10000.0f) + _130;
    float4 _202 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(((_127 * ((_109 * _143) + _146)) + TEXCOORD.x), ((_127 * ((_110 * _143) + _148)) + TEXCOORD.y)));
    float _206 = (pow(_202.z, 0.012683313339948654f));
    float _216 = (exp2(log2(max(0.0f, (_206 + -0.8359375f)) / (18.8515625f - (_206 * 18.6875f))) * 6.277394771575928f) * 10000.0f) + _131;
    bool __defer_128_665 = false;
    if (!((_132 + 1) == 5)) {
      _129 = _186;
      _130 = _201;
      _131 = _216;
      _132 = (_132 + 1);
      continue;
    }
    if (__defer_128_665) {
      float _678 = exp2(log2(_666 * 9.999999747378752e-05f) * 0.1593017578125f);
      float _679 = exp2(log2(_667 * 9.999999747378752e-05f) * 0.1593017578125f);
      float _680 = exp2(log2(_668 * 9.999999747378752e-05f) * 0.1593017578125f);
      SV_Target.x = exp2(log2((1.0f / ((_678 * 18.6875f) + 1.0f)) * ((_678 * 18.8515625f) + 0.8359375f)) * 78.84375f);
      SV_Target.y = exp2(log2((1.0f / ((_679 * 18.6875f) + 1.0f)) * ((_679 * 18.8515625f) + 0.8359375f)) * 78.84375f);
      SV_Target.z = exp2(log2((1.0f / ((_680 * 18.6875f) + 1.0f)) * ((_680 * 18.8515625f) + 0.8359375f)) * 78.84375f);
      SV_Target.w = _241;
    }
    uint _228 = uint(SV_Position.y);
    if (_etcParams.y == 1.0f) {
      uint2 _235 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_228), 0));
      _241 = (float((uint)((uint)(_235.x & 127))) + 0.5f);
    } else {
      _241 = _postProcessParams.x;
    }
    bool _244 = (_localToneMappingParams.w > 0.0f);
    if (_244) {
      float3 output_color = TonemapReplacer(float3(_186, _201, _216));
      _597 = output_color.x;
      _598 = output_color.y;
      _599 = output_color.z;
    } else {
      _597 = (_186 * 0.20000000298023224f);
      _598 = (_201 * 0.20000000298023224f);
      _599 = (_216 * 0.20000000298023224f);
    }
    if (_etcParams.y > 1.0f) {
      float _608 = abs((TEXCOORD.x * 2.0f) + -1.0f);
      float _609 = abs((TEXCOORD.y * 2.0f) + -1.0f);
      float _613 = saturate(1.0f - (dot(float2(_608, _609), float2(_608, _609)) * saturate(_etcParams.y + -1.0f)));
      _618 = (_613 * _597);
      _619 = (_613 * _598);
      _620 = (_613 * _599);
    } else {
      _618 = _597;
      _619 = _598;
      _620 = _599;
    }
    if ((_244) && ((_etcParams.z > 0.0f))) {
      _650 = select((_618 <= 0.0031308000907301903f), (_618 * 12.920000076293945f), (((pow(_618, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
      _651 = select((_619 <= 0.0031308000907301903f), (_619 * 12.920000076293945f), (((pow(_619, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
      _652 = select((_620 <= 0.0031308000907301903f), (_620 * 12.920000076293945f), (((pow(_620, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    } else {
      _650 = _618;
      _651 = _619;
      _652 = _620;
    }
    if (!(!(_etcParams.y >= 1.0f))) {
      float _657 = float((uint)_228);
      if (!(_657 < _viewDir.w)) {
        if (!(_657 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
          _666 = _650;
          _667 = _651;
          _668 = _652;
        } else {
          _666 = 0.0f;
          _667 = 0.0f;
          _668 = 0.0f;
        }
      } else {
        _666 = 0.0f;
        _667 = 0.0f;
        _668 = 0.0f;
      }
    } else {
      _666 = _650;
      _667 = _651;
      _668 = _652;
    }
    float _678 = exp2(log2(_666 * 9.999999747378752e-05f) * 0.1593017578125f);
    float _679 = exp2(log2(_667 * 9.999999747378752e-05f) * 0.1593017578125f);
    float _680 = exp2(log2(_668 * 9.999999747378752e-05f) * 0.1593017578125f);
    SV_Target.x = exp2(log2((1.0f / ((_678 * 18.6875f) + 1.0f)) * ((_678 * 18.8515625f) + 0.8359375f)) * 78.84375f);
    SV_Target.y = exp2(log2((1.0f / ((_679 * 18.6875f) + 1.0f)) * ((_679 * 18.8515625f) + 0.8359375f)) * 78.84375f);
    SV_Target.z = exp2(log2((1.0f / ((_680 * 18.6875f) + 1.0f)) * ((_680 * 18.8515625f) + 0.8359375f)) * 78.84375f);
    SV_Target.w = _241;
    break;
  }
  return SV_Target;
}