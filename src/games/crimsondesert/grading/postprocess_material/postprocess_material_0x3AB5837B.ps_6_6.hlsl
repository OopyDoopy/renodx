#include "../tonemap.hlsli"

struct PostProcessDirectionalBlurStruct {
  float _intensity;
  float _noiseStrength;
  float _direction;
  float _noiseScale;
  uint _noiseTexture;
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

cbuffer __3__1__0__0__PostProcessMaterialIndex : register(b2, space1) {
  int _materialIndex : packoffset(c000.x);
  int _passIndex : packoffset(c000.y);
};

ConstantBuffer<PostProcessDirectionalBlurStruct> BindlessParameters_PostProcessDirectionalBlur[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _14[36];
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
  float _132;
  float _378;
  float _379;
  float _380;
  float _500;
  float _501;
  float _502;
  float _523;
  float _524;
  float _525;
  float _558;
  float _559;
  float _560;
  float _574;
  float _575;
  float _576;
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
    bool __defer_76_573 = false;
    if (!((_80 + 1) == 33)) {
      _77 = _106;
      _78 = _107;
      _79 = _108;
      _80 = (_80 + 1);
      continue;
    }
    if (__defer_76_573) {
      SV_Target.x = _574;
      SV_Target.y = _575;
      SV_Target.z = _576;
      SV_Target.w = _132;
    }
    uint _119 = uint(SV_Position.y);
    if (_etcParams.y == 1.0f) {
      uint2 _126 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_119), 0));
      _132 = (float((uint)((uint)(_126.x & 127))) + 0.5f);
    } else {
      _132 = _postProcessParams.x;
    }
    if (_localToneMappingParams.w > 0.0f) {
      float3 output_color = TonemapReplacer(float3(_106, _107, _108));
      _500 = output_color.x;
      _501 = output_color.y;
      _502 = output_color.z;
    } else {
      _500 = _106;
      _501 = _107;
      _502 = _108;
    }
    if (_etcParams.y > 1.0f) {
      float _513 = abs((TEXCOORD.x * 2.0f) + -1.0f);
      float _514 = abs((TEXCOORD.y * 2.0f) + -1.0f);
      float _518 = saturate(1.0f - (dot(float2(_513, _514), float2(_513, _514)) * saturate(_etcParams.y + -1.0f)));
      _523 = (_518 * _500);
      _524 = (_518 * _501);
      _525 = (_518 * _502);
    } else {
      _523 = _500;
      _524 = _501;
      _525 = _502;
    }
    if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
      _558 = select((_523 <= 0.0031308000907301903f), (_523 * 12.920000076293945f), (((pow(_523, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
      _559 = select((_524 <= 0.0031308000907301903f), (_524 * 12.920000076293945f), (((pow(_524, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
      _560 = select((_525 <= 0.0031308000907301903f), (_525 * 12.920000076293945f), (((pow(_525, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    } else {
      _558 = _523;
      _559 = _524;
      _560 = _525;
    }
    if (!(!(_etcParams.y >= 1.0f))) {
      float _565 = float((uint)_119);
      if (!(_565 < _viewDir.w)) {
        if (!(_565 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
          _574 = _558;
          _575 = _559;
          _576 = _560;
        } else {
          _574 = 0.0f;
          _575 = 0.0f;
          _576 = 0.0f;
        }
      } else {
        _574 = 0.0f;
        _575 = 0.0f;
        _576 = 0.0f;
      }
    } else {
      _574 = _558;
      _575 = _559;
      _576 = _560;
    }
    SV_Target.x = _574;
    SV_Target.y = _575;
    SV_Target.z = _576;
    SV_Target.w = _132;
    break;
  }
  return SV_Target;
}

