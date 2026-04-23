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
  float _180;
  float _181;
  float _182;
  float _306;
  float _324;
  float _338;
  float _584;
  float _585;
  float _586;
  float _706;
  float _707;
  float _708;
  float _729;
  float _730;
  float _731;
  float _764;
  float _765;
  float _766;
  float _780;
  float _781;
  float _782;
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
        float4 _85 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((((float((int)(_59)) * _30) * _srcTargetSizeAndInv.z) + TEXCOORD.x), (((float((int)(_64)) * _30) * _srcTargetSizeAndInv.w) + TEXCOORD.y)));
        float _95 = (pow(_85.x, 0.012683313339948654f));
        float _96 = (pow(_85.y, 0.012683313339948654f));
        float _97 = (pow(_85.z, 0.012683313339948654f));
        float _122 = ((_global_0[(_59 + 5)]) * (_global_0[(_64 + 5)])) * 10000.0f;
        float _126 = (exp2(log2(max(0.0f, (_95 + -0.8359375f)) / (18.8515625f - (_95 * 18.6875f))) * 6.277394771575928f) * _122) + _61;
        float _127 = (exp2(log2(max(0.0f, (_96 + -0.8359375f)) / (18.8515625f - (_96 * 18.6875f))) * 6.277394771575928f) * _122) + _62;
        float _128 = (exp2(log2(max(0.0f, (_97 + -0.8359375f)) / (18.8515625f - (_97 * 18.6875f))) * 6.277394771575928f) * _122) + _63;
        if (!((_64 + 1) == 6)) {
          _61 = _126;
          _62 = _127;
          _63 = _128;
          _64 = (_64 + 1);
          continue;
        }
        if (!((_59 + 1) == 6)) {
          _56 = _126;
          _57 = _127;
          _58 = _128;
          _59 = (_59 + 1);
          __loop_jump_target = 55;
          break;
        }
        _180 = (_126 * 1.8792827129364014f);
        _181 = (_127 * 1.8792827129364014f);
        _182 = (_128 * 1.8792827129364014f);
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
      float4 _139 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
      float _149 = (pow(_139.x, 0.012683313339948654f));
      float _150 = (pow(_139.y, 0.012683313339948654f));
      float _151 = (pow(_139.z, 0.012683313339948654f));
      _180 = (exp2(log2(max(0.0f, (_149 + -0.8359375f)) / (18.8515625f - (_149 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
      _181 = (exp2(log2(max(0.0f, (_150 + -0.8359375f)) / (18.8515625f - (_150 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
      _182 = (exp2(log2(max(0.0f, (_151 + -0.8359375f)) / (18.8515625f - (_151 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
    } else {
      _180 = 0.0f;
      _181 = 0.0f;
      _182 = 0.0f;
    }
  }
  if (_48 > 0.0f) {
    int _185 = WaveReadLaneFirst(_materialIndex);
    int _198 = WaveReadLaneFirst(_materialIndex);
    int _211 = WaveReadLaneFirst(_materialIndex);
    int _219 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_211 < (uint)170000), _211, 0)) + 0u))]._borderEdgeNoiseTexture);
    float4 _226 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_219 < (uint)65000), _219, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_198 < (uint)170000), _198, 0)) + 0u))]._borderEdgeNoiseOffset.x) + (WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_185 < (uint)170000), _185, 0)) + 0u))]._borderEdgeNoiseTile.x) * TEXCOORD.x)), (WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_198 < (uint)170000), _198, 0)) + 0u))]._borderEdgeNoiseOffset.y) + (WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_185 < (uint)170000), _185, 0)) + 0u))]._borderEdgeNoiseTile.y) * TEXCOORD.y))));
    int _228 = WaveReadLaneFirst(_materialIndex);
    int _237 = WaveReadLaneFirst(_materialIndex);
    float _251 = (1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_237 < (uint)170000), _237, 0)) + 0u))]._borderWidth)) * 0.5f;
    float _254 = max((abs(TEXCOORD.x + -0.5f) - _251), 0.0f);
    float _255 = max((abs(TEXCOORD.y + -0.5f) - _251), 0.0f);
    float _264 = 1.0f - ((1.0f - saturate(sqrt((_255 * _255) + (_254 * _254)) / WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_228 < (uint)170000), _228, 0)) + 0u))]._borderSmoothness))) * 2.0f);
    int _265 = WaveReadLaneFirst(_materialIndex);
    float _273 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_265 < (uint)170000), _265, 0)) + 0u))]._borderFlickerSpeed);
    if (_273 > 0.0f) {
      int _276 = WaveReadLaneFirst(_materialIndex);
      int _294 = WaveReadLaneFirst(_materialIndex);
      _306 = ((min(max(sin((_273 * 3.1415927410125732f) * _time.x), WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_276 < (uint)170000), _276, 0)) + 0u))]._borderFlickerOpacityMinMax.x)), WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_276 < (uint)170000), _276, 0)) + 0u))]._borderFlickerOpacityMinMax.y)) * _264) * WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_294 < (uint)170000), _294, 0)) + 0u))]._borderFlickerIntensity));
    } else {
      _306 = _264;
    }
    int _308 = WaveReadLaneFirst(_materialIndex);
    _324 = (min(max(_48, 0.0f), 1.0f) * saturate(saturate(_306) - (WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_308 < (uint)170000), _308, 0)) + 0u))]._borderEdgeNoiseRatio) * _226.x)));
  } else {
    _324 = 1.0f;
  }
  uint _325 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _332 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_325), 0));
    _338 = (float((uint)((uint)(_332.x & 127))) + 0.5f);
  } else {
    _338 = _324;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_180, _181, _182));
    _706 = output_color.x;
    _707 = output_color.y;
    _708 = output_color.z;
  } else {
    _706 = _180;
    _707 = _181;
    _708 = _182;
  }
  if (_etcParams.y > 1.0f) {
    float _719 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _720 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _724 = saturate(1.0f - (dot(float2(_719, _720), float2(_719, _720)) * saturate(_etcParams.y + -1.0f)));
    _729 = (_724 * _706);
    _730 = (_724 * _707);
    _731 = (_724 * _708);
  } else {
    _729 = _706;
    _730 = _707;
    _731 = _708;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _764 = select((_729 <= 0.0031308000907301903f), (_729 * 12.920000076293945f), (((pow(_729, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _765 = select((_730 <= 0.0031308000907301903f), (_730 * 12.920000076293945f), (((pow(_730, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _766 = select((_731 <= 0.0031308000907301903f), (_731 * 12.920000076293945f), (((pow(_731, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _764 = _729;
    _765 = _730;
    _766 = _731;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _771 = float((uint)_325);
    if (!(_771 < _viewDir.w)) {
      if (!(_771 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _780 = _764;
        _781 = _765;
        _782 = _766;
      } else {
        _780 = 0.0f;
        _781 = 0.0f;
        _782 = 0.0f;
      }
    } else {
      _780 = 0.0f;
      _781 = 0.0f;
      _782 = 0.0f;
    }
  } else {
    _780 = _764;
    _781 = _765;
    _782 = _766;
  }
  float _792 = exp2(log2(_780 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _793 = exp2(log2(_781 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _794 = exp2(log2(_782 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_792 * 18.6875f) + 1.0f)) * ((_792 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_793 * 18.6875f) + 1.0f)) * ((_793 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_794 * 18.6875f) + 1.0f)) * ((_794 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _338;
  return SV_Target;
}

