#include "../tonemap.hlsli"

struct PostProcessActionStruct {
  float _contrast;
  float3 _saturation;
  float _gaussianBlurIntensity;
  float2 _gaussianBlurPosition;
  float _gaussianBlurClampInnerRadius;
  float _gaussianBlurClampHardness;
  float2 _radialBlurPosition;
  float _radialBlurIntensity;
  float _radialBlurClampInnerRadius;
  float _radialBlurClampHardness;
  float _borderRatio;
  float _borderWidth;
  float _borderSmoothness;
  float _borderEdgeNoiseRatio;
  float2 _borderEdgeNoiseOffset;
  float2 _borderEdgeNoiseTile;
  uint _borderColor;
  uint _borderEdgeNoiseTexture;
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

cbuffer __3__1__0__0__PostProcessSizeConstant : register(b1, space1) {
  float4 _srcTargetSizeAndInv : packoffset(c000.x);
  float4 _destTargetSizAndInv : packoffset(c001.x);
};

cbuffer __3__1__0__0__PostProcessMaterialIndex : register(b2, space1) {
  int _materialIndex : packoffset(c000.x);
  int _passIndex : packoffset(c000.y);
};

ConstantBuffer<PostProcessActionStruct> BindlessParameters_PostProcessAction[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

static const float _global_0[11] = { 0.048393867909908295f, 0.05793797969818115f, 0.06664453446865082f, 0.07365360110998154f, 0.0782080888748169f, 0.07978799939155579f, 0.0782080888748169f, 0.07365360110998154f, 0.06664453446865082f, 0.05793797969818115f, 0.048393867909908295f };

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  int __loop_jump_target = -1;
  float _19[36];
  int _22 = WaveReadLaneFirst(_materialIndex);
  float _30 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_22 < (uint)170000), _22, 0)) + 0u))]._gaussianBlurIntensity);
  int _31 = WaveReadLaneFirst(_materialIndex);
  int _40 = WaveReadLaneFirst(_materialIndex);
  float _48 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_40 < (uint)170000), _40, 0)) + 0u))]._borderRatio);
  float _56;
  float _57;
  float _58;
  int _59;
  float _61;
  float _62;
  float _63;
  int _64;
  float _110;
  float _111;
  float _112;
  float _236;
  float _254;
  float _268;
  float _514;
  float _515;
  float _516;
  float _636;
  float _637;
  float _638;
  float _659;
  float _660;
  float _661;
  float _694;
  float _695;
  float _696;
  float _710;
  float _711;
  float _712;
  if (_30 > 0.0f) {
    _56 = 0.0f;
    _57 = 0.0f;
    _58 = 0.0f;
    _59 = -5;
    while(true) {
      _61 = _56;
      _62 = _57;
      _63 = _58;
      _64 = -5;
      while(true) {
        float _71 = (_global_0[(_59 + 5)]) * (_global_0[(_64 + 5)]);
        float4 _85 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((((float((int)(_59)) * _30) * _srcTargetSizeAndInv.z) + TEXCOORD.x), (((float((int)(_64)) * _30) * _srcTargetSizeAndInv.w) + TEXCOORD.y)));
        float _92 = (_85.x * _71) + _61;
        float _93 = (_85.y * _71) + _62;
        float _94 = (_85.z * _71) + _63;
        if (!((_64 + 1) == 6)) {
          _61 = _92;
          _62 = _93;
          _63 = _94;
          _64 = (_64 + 1);
          continue;
        }
        if (!((_59 + 1) == 6)) {
          _56 = _92;
          _57 = _93;
          _58 = _94;
          _59 = (_59 + 1);
          __loop_jump_target = 55;
          break;
        }
        _110 = (_92 * 1.8792827129364014f);
        _111 = (_93 * 1.8792827129364014f);
        _112 = (_94 * 1.8792827129364014f);
        break;
      }
      if (__loop_jump_target == 55) {
        __loop_jump_target = -1;
        continue;
      }
      if (__loop_jump_target != -1) {
        break;
      }
      break;
    }
  } else {
    if (WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_31 < (uint)170000), _31, 0)) + 0u))]._radialBlurIntensity) > 0.0f) {
      float4 _105 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
      _110 = _105.x;
      _111 = _105.y;
      _112 = _105.z;
    } else {
      _110 = 0.0f;
      _111 = 0.0f;
      _112 = 0.0f;
    }
  }
  if (_48 > 0.0f) {
    int _115 = WaveReadLaneFirst(_materialIndex);
    int _128 = WaveReadLaneFirst(_materialIndex);
    int _141 = WaveReadLaneFirst(_materialIndex);
    int _149 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_141 < (uint)170000), _141, 0)) + 0u))]._borderEdgeNoiseTexture);
    float4 _156 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_149 < (uint)65000), _149, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_128 < (uint)170000), _128, 0)) + 0u))]._borderEdgeNoiseOffset.x) + (WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_115 < (uint)170000), _115, 0)) + 0u))]._borderEdgeNoiseTile.x) * TEXCOORD.x)), (WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_128 < (uint)170000), _128, 0)) + 0u))]._borderEdgeNoiseOffset.y) + (WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_115 < (uint)170000), _115, 0)) + 0u))]._borderEdgeNoiseTile.y) * TEXCOORD.y))));
    int _158 = WaveReadLaneFirst(_materialIndex);
    int _167 = WaveReadLaneFirst(_materialIndex);
    float _181 = (1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_167 < (uint)170000), _167, 0)) + 0u))]._borderWidth)) * 0.5f;
    float _184 = max((abs(TEXCOORD.x + -0.5f) - _181), 0.0f);
    float _185 = max((abs(TEXCOORD.y + -0.5f) - _181), 0.0f);
    float _194 = 1.0f - ((1.0f - saturate(sqrt((_185 * _185) + (_184 * _184)) / WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_158 < (uint)170000), _158, 0)) + 0u))]._borderSmoothness))) * 2.0f);
    int _195 = WaveReadLaneFirst(_materialIndex);
    float _203 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_195 < (uint)170000), _195, 0)) + 0u))]._borderFlickerSpeed);
    if (_203 > 0.0f) {
      int _206 = WaveReadLaneFirst(_materialIndex);
      int _224 = WaveReadLaneFirst(_materialIndex);
      _236 = ((min(max(sin((_203 * 3.1415927410125732f) * _time.x), WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_206 < (uint)170000), _206, 0)) + 0u))]._borderFlickerOpacityMinMax.x)), WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_206 < (uint)170000), _206, 0)) + 0u))]._borderFlickerOpacityMinMax.y)) * _194) * WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_224 < (uint)170000), _224, 0)) + 0u))]._borderFlickerIntensity));
    } else {
      _236 = _194;
    }
    int _238 = WaveReadLaneFirst(_materialIndex);
    _254 = (min(max(_48, 0.0f), 1.0f) * saturate(saturate(_236) - (WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_238 < (uint)170000), _238, 0)) + 0u))]._borderEdgeNoiseRatio) * _156.x)));
  } else {
    _254 = 1.0f;
  }
  uint _255 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _262 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_255), 0));
    _268 = (float((uint)((uint)(_262.x & 127))) + 0.5f);
  } else {
    _268 = _254;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_110, _111, _112));
    _636 = output_color.x;
    _637 = output_color.y;
    _638 = output_color.z;
  } else {
    _636 = _110;
    _637 = _111;
    _638 = _112;
  }
  if (_etcParams.y > 1.0f) {
    float _649 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _650 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _654 = saturate(1.0f - (dot(float2(_649, _650), float2(_649, _650)) * saturate(_etcParams.y + -1.0f)));
    _659 = (_654 * _636);
    _660 = (_654 * _637);
    _661 = (_654 * _638);
  } else {
    _659 = _636;
    _660 = _637;
    _661 = _638;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _694 = select((_659 <= 0.0031308000907301903f), (_659 * 12.920000076293945f), (((pow(_659, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _695 = select((_660 <= 0.0031308000907301903f), (_660 * 12.920000076293945f), (((pow(_660, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _696 = select((_661 <= 0.0031308000907301903f), (_661 * 12.920000076293945f), (((pow(_661, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _694 = _659;
    _695 = _660;
    _696 = _661;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _701 = float((uint)_255);
    if (!(_701 < _viewDir.w)) {
      if (!(_701 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _710 = _694;
        _711 = _695;
        _712 = _696;
      } else {
        _710 = 0.0f;
        _711 = 0.0f;
        _712 = 0.0f;
      }
    } else {
      _710 = 0.0f;
      _711 = 0.0f;
      _712 = 0.0f;
    }
  } else {
    _710 = _694;
    _711 = _695;
    _712 = _696;
  }
  SV_Target.x = _710;
  SV_Target.y = _711;
  SV_Target.z = _712;
  SV_Target.w = _268;
  return SV_Target;
}

