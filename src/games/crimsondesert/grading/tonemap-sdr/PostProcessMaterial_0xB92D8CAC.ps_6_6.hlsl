struct PostProcessWorldLoadingStruct {
  float _radius;
  float _squareSize;
  float _maskThreshold;
  float _ringRatio;
  float _cubeSpaceGradientRatio;
  float _cubeSpaceEffectRatio;
  float _depthOuterMaskRadius;
  uint _invertDepthMask;
  float _depthIntensity;
  float _depthContrast;
  float _voronoiDotDensity;
  float _voronoiMovementSpeed;
  float _voronoiOffset;
  float3 _voronoiScrollSpeed;
  float _voronoiDotThreshold;
  float _voronoiDotRatio;
  float _rippleIntensity;
  float _rippleWidth;
  float _rippleCount;
  float _rippleContrast;
  float _rippleSpeed;
  float3 _ripplePosOffset;
  uint _noiseTex;
  float _bigRippleIntensity;
  float _bigRippleWidth;
  float _bigRipplePhaseOffset;
  float _bigRippleSpeed;
  float _bigRippleDistortionIntensity;
  float _bigRippleContrast;
  float _starburstIntensity;
  float _vignetteIntensity;
  uint _excludePlayer;
  float _ppWorldLoadingRatio;
};


Texture2D<float4> __3__36__0__0__g_sceneColor : register(t32, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t40, space36);

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

ConstantBuffer<PostProcessWorldLoadingStruct> BindlessParameters_PostProcessWorldLoading[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  int __loop_jump_target = -1;
  float4 _25 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
  float _29 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _32 = (TEXCOORD.x * 2.0f) + -1.0f;
  float _33 = TEXCOORD.y * 2.0f;
  float _34 = 1.0f - _33;
  float _35 = max(1.0000000116860974e-07f, _29.x);
  float _71 = mad((_invViewProj[3].z), _35, mad((_invViewProj[3].y), _34, ((_invViewProj[3].x) * _32))) + (_invViewProj[3].w);
  float _72 = (mad((_invViewProj[0].z), _35, mad((_invViewProj[0].y), _34, ((_invViewProj[0].x) * _32))) + (_invViewProj[0].w)) / _71;
  float _73 = (mad((_invViewProj[1].z), _35, mad((_invViewProj[1].y), _34, ((_invViewProj[1].x) * _32))) + (_invViewProj[1].w)) / _71;
  float _74 = (mad((_invViewProj[2].z), _35, mad((_invViewProj[2].y), _34, ((_invViewProj[2].x) * _32))) + (_invViewProj[2].w)) / _71;
  int _75 = WaveReadLaneFirst(_materialIndex);
  float _83 = WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_75 < (uint)170000), _75, 0)) + 0u))]._squareSize);
  float _84 = _83 * _72;
  float _85 = _83 * _73;
  float _86 = _83 * _74;
  float _87 = floor(_84);
  float _88 = floor(_85);
  float _89 = floor(_86);
  float _91;
  float _92;
  float _93;
  float _94;
  int _95;
  float _100;
  float _101;
  float _102;
  float _103;
  int _104;
  float _109;
  float _110;
  float _111;
  float _112;
  int _113;
  float _266;
  float _471;
  float _472;
  float _473;
  float _566;
  float _567;
  float _568;
  float _622;
  float _623;
  float _624;
  float _640;
  float _641;
  float _642;
  float _672;
  float _673;
  float _674;
  float _688;
  float _689;
  float _690;
  _91 = 10.0f;
  _92 = 0.0f;
  _93 = 0.0f;
  _94 = 0.0f;
  _95 = -1;
  while(true) {
    _100 = _91;
    _101 = _92;
    _102 = _93;
    _103 = _94;
    _104 = -1;
    while(true) {
      _109 = _100;
      _110 = _101;
      _111 = _102;
      _112 = _103;
      _113 = -1;
      while(true) {
        float _114 = float((int)(_113));
        float _115 = float((int)(_104));
        float _116 = float((int)(_95));
        float _120 = sin(_114 + _87);
        float _121 = sin(_115 + _88);
        float _122 = sin(_116 + _89);
        float _137 = _time.x * 0.20000000298023224f;
        float _144 = sin(_137 * frac(sin(dot(float3(_120, _121, _122), float3(12.98900032043457f, 78.23300170898438f, 37.71900177001953f))) * 143758.546875f)) + _114;
        float _145 = sin(_137 * frac(sin(dot(float3(_120, _121, _122), float3(39.34600067138672f, 11.135000228881836f, 83.15499877929688f))) * 143758.546875f)) + _115;
        float _146 = sin(_137 * frac(sin(dot(float3(_120, _121, _122), float3(73.15599822998047f, 52.23500061035156f, 9.151000022888184f))) * 143758.546875f)) + _116;
        float _157 = max(abs((_87 - _84) + _144), max(abs((_88 - _85) + _145), abs((_89 - _86) + _146)));
        bool _158 = (_157 < _109);
        float _159 = select(_158, _157, _109);
        float _160 = select(_158, _144, _110);
        float _161 = select(_158, _145, _111);
        float _162 = select(_158, _146, _112);
        bool __defer_108_687 = false;
        if (!((_113 + 1) == 2)) {
          _109 = _159;
          _110 = _160;
          _111 = _161;
          _112 = _162;
          _113 = (_113 + 1);
          continue;
        }
        if (__defer_108_687) {
          SV_Target.x = _688;
          SV_Target.y = _689;
          SV_Target.z = _690;
          SV_Target.w = _266;
        }
        bool __defer_105_687 = false;
        if (!((_104 + 1) == 2)) {
          _100 = _159;
          _101 = _160;
          _102 = _161;
          _103 = _162;
          _104 = (_104 + 1);
          __loop_jump_target = 99;
          break;
        }
        if (__defer_105_687) {
          SV_Target.x = _688;
          SV_Target.y = _689;
          SV_Target.z = _690;
          SV_Target.w = _266;
        }
        bool __defer_96_687 = false;
        if (!((_95 + 1) == 2)) {
          _91 = _159;
          _92 = _160;
          _93 = _161;
          _94 = _162;
          _95 = (_95 + 1);
          __loop_jump_target = 90;
          break;
        }
        if (__defer_96_687) {
          SV_Target.x = _688;
          SV_Target.y = _689;
          SV_Target.z = _690;
          SV_Target.w = _266;
        }
        int _179 = WaveReadLaneFirst(_materialIndex);
        float _192 = ((_160 + _87) / _83) - _mainPosition.x;
        float _193 = ((_161 + _88) / _83) - _mainPosition.y;
        float _194 = ((_162 + _89) / _83) - _mainPosition.z;
        int _205 = WaveReadLaneFirst(_materialIndex);
        float _219 = _72 - _mainPosition.x;
        float _220 = _73 - _mainPosition.y;
        float _221 = _74 - _mainPosition.z;
        int _236 = WaveReadLaneFirst(_materialIndex);
        float _246 = ((1.0f - saturate(exp2(log2(abs(((1.0f - ((1.0f / max(9.999999747378752e-06f, (WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_205 < (uint)170000), _205, 0)) + 0u))]._radius) * 0.8333333134651184f))) * sqrt(dot(float3(_219, _220, _221), float3(_219, _220, _221))))) * 2.500000238418579f) + -0.5f) * 0.6666666865348816f)))) * (1.0f / max(0.0010000000474974513f, _exposure0.x))) * WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_236 < (uint)170000), _236, 0)) + 0u))]._ringRatio);
        float _250 = (_246 * 0.800000011920929f) + _25.x;
        float _251 = (_246 * 0.4000000059604645f) + _25.y;
        float _252 = (_246 * 0.20000000298023224f) + _25.z;
        uint _253 = uint(SV_Position.y);
        if (_etcParams.y == 1.0f) {
          uint2 _260 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_253), 0));
          _266 = (float((uint)((uint)(_260.x & 127))) + 0.5f);
        } else {
          _266 = saturate((_159 + 1.0f) - ((1.0f - ((1.0f / max(9.999999747378752e-06f, WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_179 < (uint)170000), _179, 0)) + 0u))]._radius))) * sqrt(dot(float3(_192, _193, _194), float3(_192, _193, _194))))) * 1.470588207244873f));
        }
        bool _269 = (_localToneMappingParams.w > 0.0f);
        if (_269) {
          float3 output_color = TonemapReplacer(float3(_250, _251, _252));
          _622 = output_color.x;
          _623 = output_color.y;
          _624 = output_color.z;
        } else {
          _622 = _250;
          _623 = _251;
          _624 = _252;
        }
        if (_etcParams.y > 1.0f) {
          float _630 = abs(_32);
          float _631 = abs(_33 + -1.0f);
          float _635 = saturate(1.0f - (dot(float2(_630, _631), float2(_630, _631)) * saturate(_etcParams.y + -1.0f)));
          _640 = (_635 * _622);
          _641 = (_635 * _623);
          _642 = (_635 * _624);
        } else {
          _640 = _622;
          _641 = _623;
          _642 = _624;
        }
        if ((_269) && ((_etcParams.z > 0.0f))) {
          _672 = select((_640 <= 0.0031308000907301903f), (_640 * 12.920000076293945f), (((pow(_640, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
          _673 = select((_641 <= 0.0031308000907301903f), (_641 * 12.920000076293945f), (((pow(_641, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
          _674 = select((_642 <= 0.0031308000907301903f), (_642 * 12.920000076293945f), (((pow(_642, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
        } else {
          _672 = _640;
          _673 = _641;
          _674 = _642;
        }
        if (!(!(_etcParams.y >= 1.0f))) {
          float _679 = float((uint)_253);
          if (!(_679 < _viewDir.w)) {
            if (!(_679 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
              _688 = _672;
              _689 = _673;
              _690 = _674;
            } else {
              _688 = 0.0f;
              _689 = 0.0f;
              _690 = 0.0f;
            }
          } else {
            _688 = 0.0f;
            _689 = 0.0f;
            _690 = 0.0f;
          }
        } else {
          _688 = _672;
          _689 = _673;
          _690 = _674;
        }
        SV_Target.x = _688;
        SV_Target.y = _689;
        SV_Target.z = _690;
        SV_Target.w = _266;
        break;
      }
      if (__loop_jump_target == 99) {
        __loop_jump_target = -1;
        continue;
      }
      if (__loop_jump_target != -1) {
        break;
      }
      break;
    }
    if (__loop_jump_target == 90) {
      __loop_jump_target = -1;
      continue;
    }
    if (__loop_jump_target != -1) {
      break;
    }
    break;
  }
  return SV_Target;
}