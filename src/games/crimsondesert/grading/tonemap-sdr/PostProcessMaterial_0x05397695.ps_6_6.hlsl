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
  int _23 = WaveReadLaneFirst(_materialIndex);
  float _31 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_23 < (uint)170000), _23, 0)) + 0u))]._gaussianBlurIntensity);
  int _32 = WaveReadLaneFirst(_materialIndex);
  int _41 = WaveReadLaneFirst(_materialIndex);
  float _49 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_41 < (uint)170000), _41, 0)) + 0u))]._borderRatio);
  float _57;
  float _58;
  float _59;
  int _60;
  float _62;
  float _63;
  float _64;
  int _65;
  float _181;
  float _182;
  float _183;
  float _307;
  float _325;
  float _339;
  float _544;
  float _545;
  float _546;
  float _639;
  float _640;
  float _641;
  float _695;
  float _696;
  float _697;
  float _716;
  float _717;
  float _718;
  float _748;
  float _749;
  float _750;
  float _764;
  float _765;
  float _766;
  if (_31 > 0.0f) {
    _57 = 0.0f;
    _58 = 0.0f;
    _59 = 0.0f;
    _60 = -5;
    while(true) {
      _62 = _57;
      _63 = _58;
      _64 = _59;
      _65 = -5;
      while(true) {
        float4 _86 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((((float((int)(_60)) * _31) * _srcTargetSizeAndInv.z) + TEXCOORD.x), (((float((int)(_65)) * _31) * _srcTargetSizeAndInv.w) + TEXCOORD.y)));
        float _96 = (pow(_86.x, 0.012683313339948654f));
        float _97 = (pow(_86.y, 0.012683313339948654f));
        float _98 = (pow(_86.z, 0.012683313339948654f));
        float _123 = ((_global_0[(_60 + 5)]) * (_global_0[(_65 + 5)])) * 10000.0f;
        float _127 = (exp2(log2(max(0.0f, (_96 + -0.8359375f)) / (18.8515625f - (_96 * 18.6875f))) * 6.277394771575928f) * _123) + _62;
        float _128 = (exp2(log2(max(0.0f, (_97 + -0.8359375f)) / (18.8515625f - (_97 * 18.6875f))) * 6.277394771575928f) * _123) + _63;
        float _129 = (exp2(log2(max(0.0f, (_98 + -0.8359375f)) / (18.8515625f - (_98 * 18.6875f))) * 6.277394771575928f) * _123) + _64;
        if (!((_65 + 1) == 6)) {
          _62 = _127;
          _63 = _128;
          _64 = _129;
          _65 = (_65 + 1);
          continue;
        }
        if (!((_60 + 1) == 6)) {
          _57 = _127;
          _58 = _128;
          _59 = _129;
          _60 = (_60 + 1);
          __loop_jump_target = 56;
          break;
        }
        _181 = (_127 * 1.8792827129364014f);
        _182 = (_128 * 1.8792827129364014f);
        _183 = (_129 * 1.8792827129364014f);
        break;
      }
      if (__loop_jump_target == 56) {
        __loop_jump_target = -1;
        continue;
      }
      if (__loop_jump_target != -1) {
        break;
      }
      break;
    }
  } else {
    if (WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_32 < (uint)170000), _32, 0)) + 0u))]._radialBlurIntensity) > 0.0f) {
      float4 _140 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
      float _150 = (pow(_140.x, 0.012683313339948654f));
      float _151 = (pow(_140.y, 0.012683313339948654f));
      float _152 = (pow(_140.z, 0.012683313339948654f));
      _181 = (exp2(log2(max(0.0f, (_150 + -0.8359375f)) / (18.8515625f - (_150 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
      _182 = (exp2(log2(max(0.0f, (_151 + -0.8359375f)) / (18.8515625f - (_151 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
      _183 = (exp2(log2(max(0.0f, (_152 + -0.8359375f)) / (18.8515625f - (_152 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
    } else {
      _181 = 0.0f;
      _182 = 0.0f;
      _183 = 0.0f;
    }
  }
  if (_49 > 0.0f) {
    int _186 = WaveReadLaneFirst(_materialIndex);
    int _199 = WaveReadLaneFirst(_materialIndex);
    int _212 = WaveReadLaneFirst(_materialIndex);
    int _220 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_212 < (uint)170000), _212, 0)) + 0u))]._borderEdgeNoiseTexture);
    float4 _227 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_220 < (uint)65000), _220, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_199 < (uint)170000), _199, 0)) + 0u))]._borderEdgeNoiseOffset.x) + (WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_186 < (uint)170000), _186, 0)) + 0u))]._borderEdgeNoiseTile.x) * TEXCOORD.x)), (WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_199 < (uint)170000), _199, 0)) + 0u))]._borderEdgeNoiseOffset.y) + (WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_186 < (uint)170000), _186, 0)) + 0u))]._borderEdgeNoiseTile.y) * TEXCOORD.y))));
    int _229 = WaveReadLaneFirst(_materialIndex);
    int _238 = WaveReadLaneFirst(_materialIndex);
    float _252 = (1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_238 < (uint)170000), _238, 0)) + 0u))]._borderWidth)) * 0.5f;
    float _255 = max((abs(TEXCOORD.x + -0.5f) - _252), 0.0f);
    float _256 = max((abs(TEXCOORD.y + -0.5f) - _252), 0.0f);
    float _265 = 1.0f - ((1.0f - saturate(sqrt((_256 * _256) + (_255 * _255)) / WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_229 < (uint)170000), _229, 0)) + 0u))]._borderSmoothness))) * 2.0f);
    int _266 = WaveReadLaneFirst(_materialIndex);
    float _274 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_266 < (uint)170000), _266, 0)) + 0u))]._borderFlickerSpeed);
    if (_274 > 0.0f) {
      int _277 = WaveReadLaneFirst(_materialIndex);
      int _295 = WaveReadLaneFirst(_materialIndex);
      _307 = ((min(max(sin((_274 * 3.1415927410125732f) * _time.x), WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_277 < (uint)170000), _277, 0)) + 0u))]._borderFlickerOpacityMinMax.x)), WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_277 < (uint)170000), _277, 0)) + 0u))]._borderFlickerOpacityMinMax.y)) * _265) * WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_295 < (uint)170000), _295, 0)) + 0u))]._borderFlickerIntensity));
    } else {
      _307 = _265;
    }
    int _309 = WaveReadLaneFirst(_materialIndex);
    _325 = (min(max(_49, 0.0f), 1.0f) * saturate(saturate(_307) - (WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_309 < (uint)170000), _309, 0)) + 0u))]._borderEdgeNoiseRatio) * _227.x)));
  } else {
    _325 = 1.0f;
  }
  uint _326 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _333 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_326), 0));
    _339 = (float((uint)((uint)(_333.x & 127))) + 0.5f);
  } else {
    _339 = _325;
  }
  bool _342 = (_localToneMappingParams.w > 0.0f);
  if (_342) {
    float3 output_color = TonemapReplacer(float3(_181, _182, _183));
    _695 = output_color.x;
    _696 = output_color.y;
    _697 = output_color.z;
  } else {
    _695 = _181;
    _696 = _182;
    _697 = _183;
  }
  if (_etcParams.y > 1.0f) {
    float _706 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _707 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _711 = saturate(1.0f - (dot(float2(_706, _707), float2(_706, _707)) * saturate(_etcParams.y + -1.0f)));
    _716 = (_711 * _695);
    _717 = (_711 * _696);
    _718 = (_711 * _697);
  } else {
    _716 = _695;
    _717 = _696;
    _718 = _697;
  }
  if ((_342) && ((_etcParams.z > 0.0f))) {
    _748 = select((_716 <= 0.0031308000907301903f), (_716 * 12.920000076293945f), (((pow(_716, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _749 = select((_717 <= 0.0031308000907301903f), (_717 * 12.920000076293945f), (((pow(_717, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _750 = select((_718 <= 0.0031308000907301903f), (_718 * 12.920000076293945f), (((pow(_718, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _748 = _716;
    _749 = _717;
    _750 = _718;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _755 = float((uint)_326);
    if (!(_755 < _viewDir.w)) {
      if (!(_755 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _764 = _748;
        _765 = _749;
        _766 = _750;
      } else {
        _764 = 0.0f;
        _765 = 0.0f;
        _766 = 0.0f;
      }
    } else {
      _764 = 0.0f;
      _765 = 0.0f;
      _766 = 0.0f;
    }
  } else {
    _764 = _748;
    _765 = _749;
    _766 = _750;
  }
  float _776 = exp2(log2(_764 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _777 = exp2(log2(_765 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _778 = exp2(log2(_766 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_776 * 18.6875f) + 1.0f)) * ((_776 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_777 * 18.6875f) + 1.0f)) * ((_777 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_778 * 18.6875f) + 1.0f)) * ((_778 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _339;
  return SV_Target;
}