struct PostProcessDirectionalBlurStruct {
  float _intensity;
  float _noiseStrength;
  float _direction;
  float _noiseScale;
  uint _noiseTexture;
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

ConstantBuffer<PostProcessDirectionalBlurStruct> BindlessParameters_PostProcessDirectionalBlur[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  int _18 = WaveReadLaneFirst(_materialIndex);
  float _26 = WaveReadLaneFirst(BindlessParameters_PostProcessDirectionalBlur[((int)((uint)(select(((uint)_18 < (uint)170000), _18, 0)) + 0u))]._noiseScale);
  int _29 = WaveReadLaneFirst(_materialIndex);
  int _37 = WaveReadLaneFirst(BindlessParameters_PostProcessDirectionalBlur[((int)((uint)(select(((uint)_29 < (uint)170000), _29, 0)) + 0u))]._noiseTexture);
  float4 _44 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_37 < (uint)65000), _37, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_26 * TEXCOORD.x), (_26 * TEXCOORD.y)));
  int _46 = WaveReadLaneFirst(_materialIndex);
  float _54 = WaveReadLaneFirst(BindlessParameters_PostProcessDirectionalBlur[((int)((uint)(select(((uint)_46 < (uint)170000), _46, 0)) + 0u))]._direction);
  int _58 = WaveReadLaneFirst(_materialIndex);
  int _67 = WaveReadLaneFirst(_materialIndex);
  float _77;
  float _78;
  float _79;
  int _80;
  float _133;
  float _338;
  float _339;
  float _340;
  float _433;
  float _434;
  float _435;
  float _489;
  float _490;
  float _491;
  float _510;
  float _511;
  float _512;
  float _542;
  float _543;
  float _544;
  float _558;
  float _559;
  float _560;
  _77 = 0.0f;
  _78 = 0.0f;
  _79 = 0.0f;
  _80 = 1;
  while(true) {
    float _83 = (WaveReadLaneFirst(BindlessParameters_PostProcessDirectionalBlur[((int)((uint)(select(((uint)_58 < (uint)170000), _58, 0)) + 0u))]._intensity) * 0.03125f) * float((int)(_80));
    float _84 = WaveReadLaneFirst(BindlessParameters_PostProcessDirectionalBlur[((int)((uint)(select(((uint)_67 < (uint)170000), _67, 0)) + 0u))]._noiseStrength) * _44.x;
    float _87 = _83 * (_84 + (-0.0f - sin(_54)));
    float _88 = _83 * (_84 + cos(_54));
    float4 _93 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2((_87 + TEXCOORD.x), (_88 + TEXCOORD.y)));
    float4 _102 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2((TEXCOORD.x - _87), (TEXCOORD.y - _88)));
    float _106 = (_93.x + _77) + _102.x;
    float _107 = (_93.y + _78) + _102.y;
    float _108 = (_93.z + _79) + _102.z;
    bool __defer_76_557 = false;
    if (!((_80 + 1) == 33)) {
      _77 = _106;
      _78 = _107;
      _79 = _108;
      _80 = (_80 + 1);
      continue;
    }
    if (__defer_76_557) {
      SV_Target.x = _558;
      SV_Target.y = _559;
      SV_Target.z = _560;
      SV_Target.w = _133;
    }
    uint _120 = uint(SV_Position.y);
    if (_etcParams.y == 1.0f) {
      uint2 _127 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_120), 0));
      _133 = (float((uint)((uint)(_127.x & 127))) + 0.5f);
    } else {
      _133 = _postProcessParams.x;
    }
    bool _136 = (_localToneMappingParams.w > 0.0f);
    if (_136) {
      float3 output_color = TonemapReplacer(float3(_106, _107, _108));
      _489 = output_color.x;
      _490 = output_color.y;
      _491 = output_color.z;
    } else {
      _489 = (_106 * 0.015625f);
      _490 = (_107 * 0.015625f);
      _491 = (_108 * 0.015625f);
    }
    if (_etcParams.y > 1.0f) {
      float _500 = abs((TEXCOORD.x * 2.0f) + -1.0f);
      float _501 = abs((TEXCOORD.y * 2.0f) + -1.0f);
      float _505 = saturate(1.0f - (dot(float2(_500, _501), float2(_500, _501)) * saturate(_etcParams.y + -1.0f)));
      _510 = (_505 * _489);
      _511 = (_505 * _490);
      _512 = (_505 * _491);
    } else {
      _510 = _489;
      _511 = _490;
      _512 = _491;
    }
    if ((_136) && ((_etcParams.z > 0.0f))) {
      _542 = select((_510 <= 0.0031308000907301903f), (_510 * 12.920000076293945f), (((pow(_510, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
      _543 = select((_511 <= 0.0031308000907301903f), (_511 * 12.920000076293945f), (((pow(_511, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
      _544 = select((_512 <= 0.0031308000907301903f), (_512 * 12.920000076293945f), (((pow(_512, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    } else {
      _542 = _510;
      _543 = _511;
      _544 = _512;
    }
    if (!(!(_etcParams.y >= 1.0f))) {
      float _549 = float((uint)_120);
      if (!(_549 < _viewDir.w)) {
        if (!(_549 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
          _558 = _542;
          _559 = _543;
          _560 = _544;
        } else {
          _558 = 0.0f;
          _559 = 0.0f;
          _560 = 0.0f;
        }
      } else {
        _558 = 0.0f;
        _559 = 0.0f;
        _560 = 0.0f;
      }
    } else {
      _558 = _542;
      _559 = _543;
      _560 = _544;
    }
    SV_Target.x = _558;
    SV_Target.y = _559;
    SV_Target.z = _560;
    SV_Target.w = _133;
    break;
  }
  return SV_Target;
}