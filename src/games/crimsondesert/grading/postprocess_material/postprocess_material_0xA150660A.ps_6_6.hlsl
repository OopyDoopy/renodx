#include "../tonemap.hlsli"

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


Texture2D<float4> __3__36__0__0__g_sceneColor : register(t33, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t75, space36);

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

ConstantBuffer<PostProcessWorldLoadingStruct> BindlessParameters_PostProcessWorldLoading[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  int __loop_jump_target = -1;
  float _17[36];
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
  float _265;
  float _511;
  float _512;
  float _513;
  float _633;
  float _634;
  float _635;
  float _653;
  float _654;
  float _655;
  float _688;
  float _689;
  float _690;
  float _704;
  float _705;
  float _706;
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
        bool __defer_108_703 = false;
        if (!((_113 + 1) == 2)) {
          _109 = _159;
          _110 = _160;
          _111 = _161;
          _112 = _162;
          _113 = (_113 + 1);
          continue;
        }
        if (__defer_108_703) {
          SV_Target.x = _704;
          SV_Target.y = _705;
          SV_Target.z = _706;
          SV_Target.w = _265;
        }
        bool __defer_105_703 = false;
        if (!((_104 + 1) == 2)) {
          _100 = _159;
          _101 = _160;
          _102 = _161;
          _103 = _162;
          _104 = (_104 + 1);
          __loop_jump_target = 99;
          break;
        }
        if (__defer_105_703) {
          SV_Target.x = _704;
          SV_Target.y = _705;
          SV_Target.z = _706;
          SV_Target.w = _265;
        }
        bool __defer_96_703 = false;
        if (!((_95 + 1) == 2)) {
          _91 = _159;
          _92 = _160;
          _93 = _161;
          _94 = _162;
          _95 = (_95 + 1);
          __loop_jump_target = 90;
          break;
        }
        if (__defer_96_703) {
          SV_Target.x = _704;
          SV_Target.y = _705;
          SV_Target.z = _706;
          SV_Target.w = _265;
        }
        int _178 = WaveReadLaneFirst(_materialIndex);
        float _191 = ((_160 + _87) / _83) - _mainPosition.x;
        float _192 = ((_161 + _88) / _83) - _mainPosition.y;
        float _193 = ((_162 + _89) / _83) - _mainPosition.z;
        int _204 = WaveReadLaneFirst(_materialIndex);
        float _218 = _72 - _mainPosition.x;
        float _219 = _73 - _mainPosition.y;
        float _220 = _74 - _mainPosition.z;
        int _235 = WaveReadLaneFirst(_materialIndex);
        float _245 = ((1.0f - saturate(exp2(log2(abs(((1.0f - ((1.0f / max(9.999999747378752e-06f, (WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_204 < (uint)170000), _204, 0)) + 0u))]._radius) * 0.8333333134651184f))) * sqrt(dot(float3(_218, _219, _220), float3(_218, _219, _220))))) * 2.500000238418579f) + -0.5f) * 0.6666666865348816f)))) * (1.0f / max(0.0010000000474974513f, _exposure0.x))) * WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_235 < (uint)170000), _235, 0)) + 0u))]._ringRatio);
        float _249 = (_245 * 0.800000011920929f) + _25.x;
        float _250 = (_245 * 0.4000000059604645f) + _25.y;
        float _251 = (_245 * 0.20000000298023224f) + _25.z;
        uint _252 = uint(SV_Position.y);
        if (_etcParams.y == 1.0f) {
          uint2 _259 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_252), 0));
          _265 = (float((uint)((uint)(_259.x & 127))) + 0.5f);
        } else {
          _265 = saturate((_159 + 1.0f) - ((1.0f - ((1.0f / max(9.999999747378752e-06f, WaveReadLaneFirst(BindlessParameters_PostProcessWorldLoading[((int)((uint)(select(((uint)_178 < (uint)170000), _178, 0)) + 0u))]._radius))) * sqrt(dot(float3(_191, _192, _193), float3(_191, _192, _193))))) * 1.470588207244873f));
        }
        if (_localToneMappingParams.w > 0.0f) {
          float3 output_color = TonemapReplacer(float3(_249, _250, _251));
          _633 = output_color.x;
          _634 = output_color.y;
          _635 = output_color.z;
        } else {
          _633 = _249;
          _634 = _250;
          _635 = _251;
        }
        if (_etcParams.y > 1.0f) {
          float _643 = abs(_32);
          float _644 = abs(_33 + -1.0f);
          float _648 = saturate(1.0f - (dot(float2(_643, _644), float2(_643, _644)) * saturate(_etcParams.y + -1.0f)));
          _653 = (_648 * _633);
          _654 = (_648 * _634);
          _655 = (_648 * _635);
        } else {
          _653 = _633;
          _654 = _634;
          _655 = _635;
        }
        if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
          _688 = select((_653 <= 0.0031308000907301903f), (_653 * 12.920000076293945f), (((pow(_653, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
          _689 = select((_654 <= 0.0031308000907301903f), (_654 * 12.920000076293945f), (((pow(_654, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
          _690 = select((_655 <= 0.0031308000907301903f), (_655 * 12.920000076293945f), (((pow(_655, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
        } else {
          _688 = _653;
          _689 = _654;
          _690 = _655;
        }
        if (!(!(_etcParams.y >= 1.0f))) {
          float _695 = float((uint)_252);
          if (!(_695 < _viewDir.w)) {
            if (!(_695 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
              _704 = _688;
              _705 = _689;
              _706 = _690;
            } else {
              _704 = 0.0f;
              _705 = 0.0f;
              _706 = 0.0f;
            }
          } else {
            _704 = 0.0f;
            _705 = 0.0f;
            _706 = 0.0f;
          }
        } else {
          _704 = _688;
          _705 = _689;
          _706 = _690;
        }
        SV_Target.x = _704;
        SV_Target.y = _705;
        SV_Target.z = _706;
        SV_Target.w = _265;
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

