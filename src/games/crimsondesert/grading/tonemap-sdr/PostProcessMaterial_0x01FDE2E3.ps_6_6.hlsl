struct PostProcessFisheye_DistortionStruct {
  float _maxPower;
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

ConstantBuffer<PostProcessFisheye_DistortionStruct> BindlessParameters_PostProcessFisheye_Distortion[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _31 = (_destTargetSizAndInv.x * TEXCOORD.x) / _srcTargetSizeAndInv.x;
  float _32 = (_destTargetSizAndInv.y * (1.0f - TEXCOORD.y)) / _srcTargetSizeAndInv.x;
  float _33 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  float _34 = 0.5f / _33;
  float _35 = _31 + -0.5f;
  float _36 = _32 - _34;
  float _37 = dot(float2(_35, _36), float2(_35, _36));
  float _38 = sqrt(_37);
  int _39 = WaveReadLaneFirst(_materialIndex);
  float _47 = WaveReadLaneFirst(BindlessParameters_PostProcessFisheye_Distortion[((int)((uint)(select(((uint)_39 < (uint)170000), _39, 0)) + 0u))]._maxPower);
  bool _48 = (_47 > 0.0f);
  float _56;
  float _94;
  float _95;
  float _117;
  float _322;
  float _323;
  float _324;
  float _417;
  float _418;
  float _419;
  float _473;
  float _474;
  float _475;
  float _494;
  float _495;
  float _496;
  float _526;
  float _527;
  float _528;
  float _542;
  float _543;
  float _544;
  if (_48) {
    _56 = sqrt(dot(float2(0.5f, _34), float2(0.5f, _34)));
  } else {
    if (!(_33 < 1.0f)) {
      _56 = _34;
    } else {
      _56 = 0.5f;
    }
  }
  if (_48) {
    float _58 = rsqrt(_37);
    float _60 = tan(_47 * _38);
    float _68 = tan(_56 * _47);
    _94 = (((((_56 * _35) * _58) * _60) / _68) + 0.5f);
    _95 = (((((_56 * _36) * _58) * _60) / _68) + _34);
  } else {
    if (_47 < 0.0f) {
      float _76 = rsqrt(_37);
      float _79 = atan((_47 * _38) * -10.0f);
      float _88 = atan((_47 * -10.0f) * _56);
      _94 = (((((_56 * _35) * _76) * _79) / _88) + 0.5f);
      _95 = (((((_56 * _36) * _76) * _79) / _88) + _34);
    } else {
      _94 = _31;
      _95 = _32;
    }
  }
  float4 _100 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(_94, (1.0f - (_95 * _33))));
  uint _104 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _111 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_104), 0));
    _117 = (float((uint)((uint)(_111.x & 127))) + 0.5f);
  } else {
    _117 = 1.0f;
  }
  bool _120 = (_localToneMappingParams.w > 0.0f);
  if (_120) {
    float3 output_color = TonemapReplacer(float3(_100.x, _100.y, _100.z));
    _473 = output_color.x;
    _474 = output_color.y;
    _475 = output_color.z;
  } else {
    _473 = _100.x;
    _474 = _100.y;
    _475 = _100.z;
  }
  if (_etcParams.y > 1.0f) {
    float _484 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _485 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _489 = saturate(1.0f - (dot(float2(_484, _485), float2(_484, _485)) * saturate(_etcParams.y + -1.0f)));
    _494 = (_489 * _473);
    _495 = (_489 * _474);
    _496 = (_489 * _475);
  } else {
    _494 = _473;
    _495 = _474;
    _496 = _475;
  }
  if ((_120) && ((_etcParams.z > 0.0f))) {
    _526 = select((_494 <= 0.0031308000907301903f), (_494 * 12.920000076293945f), (((pow(_494, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _527 = select((_495 <= 0.0031308000907301903f), (_495 * 12.920000076293945f), (((pow(_495, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _528 = select((_496 <= 0.0031308000907301903f), (_496 * 12.920000076293945f), (((pow(_496, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _526 = _494;
    _527 = _495;
    _528 = _496;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _533 = float((uint)_104);
    if (!(_533 < _viewDir.w)) {
      if (!(_533 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _542 = _526;
        _543 = _527;
        _544 = _528;
      } else {
        _542 = 0.0f;
        _543 = 0.0f;
        _544 = 0.0f;
      }
    } else {
      _542 = 0.0f;
      _543 = 0.0f;
      _544 = 0.0f;
    }
  } else {
    _542 = _526;
    _543 = _527;
    _544 = _528;
  }
  SV_Target.x = _542;
  SV_Target.y = _543;
  SV_Target.z = _544;
  SV_Target.w = _117;
  return SV_Target;
}