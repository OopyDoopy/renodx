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
  float _153;
  float _358;
  float _359;
  float _360;
  float _453;
  float _454;
  float _455;
  float _509;
  float _510;
  float _511;
  float _530;
  float _531;
  float _532;
  float _562;
  float _563;
  float _564;
  float _578;
  float _579;
  float _580;
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
  float _110 = (pow(_100.x, 0.012683313339948654f));
  float _111 = (pow(_100.y, 0.012683313339948654f));
  float _112 = (pow(_100.z, 0.012683313339948654f));
  float _134 = exp2(log2(max(0.0f, (_110 + -0.8359375f)) / (18.8515625f - (_110 * 18.6875f))) * 6.277394771575928f);
  float _135 = exp2(log2(max(0.0f, (_111 + -0.8359375f)) / (18.8515625f - (_111 * 18.6875f))) * 6.277394771575928f);
  float _136 = exp2(log2(max(0.0f, (_112 + -0.8359375f)) / (18.8515625f - (_112 * 18.6875f))) * 6.277394771575928f);
  uint _140 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _147 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_140), 0));
    _153 = (float((uint)((uint)(_147.x & 127))) + 0.5f);
  } else {
    _153 = 1.0f;
  }
  bool _156 = (_localToneMappingParams.w > 0.0f);
  if (_156) {
    float3 output_color = TonemapReplacer(float3(_134, _135, _136));
    _509 = output_color.x;
    _510 = output_color.y;
    _511 = output_color.z;
  } else {
    _509 = (_134 * 10000.0f);
    _510 = (_135 * 10000.0f);
    _511 = (_136 * 10000.0f);
  }
  if (_etcParams.y > 1.0f) {
    float _520 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _521 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _525 = saturate(1.0f - (dot(float2(_520, _521), float2(_520, _521)) * saturate(_etcParams.y + -1.0f)));
    _530 = (_525 * _509);
    _531 = (_525 * _510);
    _532 = (_525 * _511);
  } else {
    _530 = _509;
    _531 = _510;
    _532 = _511;
  }
  if ((_156) && ((_etcParams.z > 0.0f))) {
    _562 = select((_530 <= 0.0031308000907301903f), (_530 * 12.920000076293945f), (((pow(_530, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _563 = select((_531 <= 0.0031308000907301903f), (_531 * 12.920000076293945f), (((pow(_531, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _564 = select((_532 <= 0.0031308000907301903f), (_532 * 12.920000076293945f), (((pow(_532, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _562 = _530;
    _563 = _531;
    _564 = _532;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _569 = float((uint)_140);
    if (!(_569 < _viewDir.w)) {
      if (!(_569 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _578 = _562;
        _579 = _563;
        _580 = _564;
      } else {
        _578 = 0.0f;
        _579 = 0.0f;
        _580 = 0.0f;
      }
    } else {
      _578 = 0.0f;
      _579 = 0.0f;
      _580 = 0.0f;
    }
  } else {
    _578 = _562;
    _579 = _563;
    _580 = _564;
  }
  float _590 = exp2(log2(_578 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _591 = exp2(log2(_579 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _592 = exp2(log2(_580 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_590 * 18.6875f) + 1.0f)) * ((_590 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_591 * 18.6875f) + 1.0f)) * ((_591 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_592 * 18.6875f) + 1.0f)) * ((_592 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _153;
  return SV_Target;
}