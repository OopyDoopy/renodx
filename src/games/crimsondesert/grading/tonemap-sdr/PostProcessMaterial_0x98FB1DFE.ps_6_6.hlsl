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
  float _111;
  float _112;
  float _113;
  float _237;
  float _255;
  float _269;
  float _474;
  float _475;
  float _476;
  float _569;
  float _570;
  float _571;
  float _625;
  float _626;
  float _627;
  float _646;
  float _647;
  float _648;
  float _678;
  float _679;
  float _680;
  float _694;
  float _695;
  float _696;
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
        float _72 = (_global_0[(_60 + 5)]) * (_global_0[(_65 + 5)]);
        float4 _86 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((((float((int)(_60)) * _31) * _srcTargetSizeAndInv.z) + TEXCOORD.x), (((float((int)(_65)) * _31) * _srcTargetSizeAndInv.w) + TEXCOORD.y)));
        float _93 = (_86.x * _72) + _62;
        float _94 = (_86.y * _72) + _63;
        float _95 = (_86.z * _72) + _64;
        if (!((_65 + 1) == 6)) {
          _62 = _93;
          _63 = _94;
          _64 = _95;
          _65 = (_65 + 1);
          continue;
        }
        if (!((_60 + 1) == 6)) {
          _57 = _93;
          _58 = _94;
          _59 = _95;
          _60 = (_60 + 1);
          __loop_jump_target = 56;
          break;
        }
        _111 = (_93 * 1.8792827129364014f);
        _112 = (_94 * 1.8792827129364014f);
        _113 = (_95 * 1.8792827129364014f);
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
      float4 _106 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
      _111 = _106.x;
      _112 = _106.y;
      _113 = _106.z;
    } else {
      _111 = 0.0f;
      _112 = 0.0f;
      _113 = 0.0f;
    }
  }
  if (_49 > 0.0f) {
    int _116 = WaveReadLaneFirst(_materialIndex);
    int _129 = WaveReadLaneFirst(_materialIndex);
    int _142 = WaveReadLaneFirst(_materialIndex);
    int _150 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_142 < (uint)170000), _142, 0)) + 0u))]._borderEdgeNoiseTexture);
    float4 _157 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_150 < (uint)65000), _150, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_129 < (uint)170000), _129, 0)) + 0u))]._borderEdgeNoiseOffset.x) + (WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_116 < (uint)170000), _116, 0)) + 0u))]._borderEdgeNoiseTile.x) * TEXCOORD.x)), (WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_129 < (uint)170000), _129, 0)) + 0u))]._borderEdgeNoiseOffset.y) + (WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_116 < (uint)170000), _116, 0)) + 0u))]._borderEdgeNoiseTile.y) * TEXCOORD.y))));
    int _159 = WaveReadLaneFirst(_materialIndex);
    int _168 = WaveReadLaneFirst(_materialIndex);
    float _182 = (1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_168 < (uint)170000), _168, 0)) + 0u))]._borderWidth)) * 0.5f;
    float _185 = max((abs(TEXCOORD.x + -0.5f) - _182), 0.0f);
    float _186 = max((abs(TEXCOORD.y + -0.5f) - _182), 0.0f);
    float _195 = 1.0f - ((1.0f - saturate(sqrt((_186 * _186) + (_185 * _185)) / WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_159 < (uint)170000), _159, 0)) + 0u))]._borderSmoothness))) * 2.0f);
    int _196 = WaveReadLaneFirst(_materialIndex);
    float _204 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_196 < (uint)170000), _196, 0)) + 0u))]._borderFlickerSpeed);
    if (_204 > 0.0f) {
      int _207 = WaveReadLaneFirst(_materialIndex);
      int _225 = WaveReadLaneFirst(_materialIndex);
      _237 = ((min(max(sin((_204 * 3.1415927410125732f) * _time.x), WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_207 < (uint)170000), _207, 0)) + 0u))]._borderFlickerOpacityMinMax.x)), WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_207 < (uint)170000), _207, 0)) + 0u))]._borderFlickerOpacityMinMax.y)) * _195) * WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_225 < (uint)170000), _225, 0)) + 0u))]._borderFlickerIntensity));
    } else {
      _237 = _195;
    }
    int _239 = WaveReadLaneFirst(_materialIndex);
    _255 = (min(max(_49, 0.0f), 1.0f) * saturate(saturate(_237) - (WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_239 < (uint)170000), _239, 0)) + 0u))]._borderEdgeNoiseRatio) * _157.x)));
  } else {
    _255 = 1.0f;
  }
  uint _256 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _263 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_256), 0));
    _269 = (float((uint)((uint)(_263.x & 127))) + 0.5f);
  } else {
    _269 = _255;
  }
  bool _272 = (_localToneMappingParams.w > 0.0f);
  if (_272) {
    float3 output_color = TonemapReplacer(float3(_111, _112, _113));
    _625 = output_color.x;
    _626 = output_color.y;
    _627 = output_color.z;
  } else {
    _625 = _111;
    _626 = _112;
    _627 = _113;
  }
  if (_etcParams.y > 1.0f) {
    float _636 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _637 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _641 = saturate(1.0f - (dot(float2(_636, _637), float2(_636, _637)) * saturate(_etcParams.y + -1.0f)));
    _646 = (_641 * _625);
    _647 = (_641 * _626);
    _648 = (_641 * _627);
  } else {
    _646 = _625;
    _647 = _626;
    _648 = _627;
  }
  if ((_272) && ((_etcParams.z > 0.0f))) {
    _678 = select((_646 <= 0.0031308000907301903f), (_646 * 12.920000076293945f), (((pow(_646, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _679 = select((_647 <= 0.0031308000907301903f), (_647 * 12.920000076293945f), (((pow(_647, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _680 = select((_648 <= 0.0031308000907301903f), (_648 * 12.920000076293945f), (((pow(_648, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _678 = _646;
    _679 = _647;
    _680 = _648;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _685 = float((uint)_256);
    if (!(_685 < _viewDir.w)) {
      if (!(_685 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _694 = _678;
        _695 = _679;
        _696 = _680;
      } else {
        _694 = 0.0f;
        _695 = 0.0f;
        _696 = 0.0f;
      }
    } else {
      _694 = 0.0f;
      _695 = 0.0f;
      _696 = 0.0f;
    }
  } else {
    _694 = _678;
    _695 = _679;
    _696 = _680;
  }
  SV_Target.x = _694;
  SV_Target.y = _695;
  SV_Target.z = _696;
  SV_Target.w = _269;
  return SV_Target;
}