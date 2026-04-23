#include "../tonemap.hlsli"

struct PostProcessFisheye_DistortionStruct {
  float _maxPower;
};


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

ConstantBuffer<PostProcessFisheye_DistortionStruct> BindlessParameters_PostProcessFisheye_Distortion[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _18[36];
  float _30 = (_destTargetSizAndInv.x * TEXCOORD.x) / _srcTargetSizeAndInv.x;
  float _31 = (_destTargetSizAndInv.y * (1.0f - TEXCOORD.y)) / _srcTargetSizeAndInv.x;
  float _32 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  float _33 = 0.5f / _32;
  float _34 = _30 + -0.5f;
  float _35 = _31 - _33;
  float _36 = dot(float2(_34, _35), float2(_34, _35));
  float _37 = sqrt(_36);
  int _38 = WaveReadLaneFirst(_materialIndex);
  float _46 = WaveReadLaneFirst(BindlessParameters_PostProcessFisheye_Distortion[((int)((uint)(select(((uint)_38 < (uint)170000), _38, 0)) + 0u))]._maxPower);
  bool _47 = (_46 > 0.0f);
  float _55;
  float _93;
  float _94;
  float _152;
  float _398;
  float _399;
  float _400;
  float _520;
  float _521;
  float _522;
  float _543;
  float _544;
  float _545;
  float _578;
  float _579;
  float _580;
  float _594;
  float _595;
  float _596;
  if (_47) {
    _55 = sqrt(dot(float2(0.5f, _33), float2(0.5f, _33)));
  } else {
    if (!(_32 < 1.0f)) {
      _55 = _33;
    } else {
      _55 = 0.5f;
    }
  }
  if (_47) {
    float _57 = rsqrt(_36);
    float _59 = tan(_46 * _37);
    float _67 = tan(_55 * _46);
    _93 = (((((_55 * _34) * _57) * _59) / _67) + 0.5f);
    _94 = (((((_55 * _35) * _57) * _59) / _67) + _33);
  } else {
    if (_46 < 0.0f) {
      float _75 = rsqrt(_36);
      float _78 = atan((_46 * _37) * -10.0f);
      float _87 = atan((_46 * -10.0f) * _55);
      _93 = (((((_55 * _34) * _75) * _78) / _87) + 0.5f);
      _94 = (((((_55 * _35) * _75) * _78) / _87) + _33);
    } else {
      _93 = _30;
      _94 = _31;
    }
  }
  float4 _99 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(_93, (1.0f - (_94 * _32))));
  float _109 = (pow(_99.x, 0.012683313339948654f));
  float _110 = (pow(_99.y, 0.012683313339948654f));
  float _111 = (pow(_99.z, 0.012683313339948654f));
  float _133 = exp2(log2(max(0.0f, (_109 + -0.8359375f)) / (18.8515625f - (_109 * 18.6875f))) * 6.277394771575928f);
  float _134 = exp2(log2(max(0.0f, (_110 + -0.8359375f)) / (18.8515625f - (_110 * 18.6875f))) * 6.277394771575928f);
  float _135 = exp2(log2(max(0.0f, (_111 + -0.8359375f)) / (18.8515625f - (_111 * 18.6875f))) * 6.277394771575928f);
  uint _139 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _146 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_139), 0));
    _152 = (float((uint)((uint)(_146.x & 127))) + 0.5f);
  } else {
    _152 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_133, _134, _135));
    _520 = output_color.x;
    _521 = output_color.y;
    _522 = output_color.z;
  } else {
    _520 = _133;
    _521 = _134;
    _522 = _135;
  }
  if (_etcParams.y > 1.0f) {
    float _533 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _534 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _538 = saturate(1.0f - (dot(float2(_533, _534), float2(_533, _534)) * saturate(_etcParams.y + -1.0f)));
    _543 = (_538 * _520);
    _544 = (_538 * _521);
    _545 = (_538 * _522);
  } else {
    _543 = _520;
    _544 = _521;
    _545 = _522;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _578 = select((_543 <= 0.0031308000907301903f), (_543 * 12.920000076293945f), (((pow(_543, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _579 = select((_544 <= 0.0031308000907301903f), (_544 * 12.920000076293945f), (((pow(_544, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _580 = select((_545 <= 0.0031308000907301903f), (_545 * 12.920000076293945f), (((pow(_545, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _578 = _543;
    _579 = _544;
    _580 = _545;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _585 = float((uint)_139);
    if (!(_585 < _viewDir.w)) {
      if (!(_585 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _594 = _578;
        _595 = _579;
        _596 = _580;
      } else {
        _594 = 0.0f;
        _595 = 0.0f;
        _596 = 0.0f;
      }
    } else {
      _594 = 0.0f;
      _595 = 0.0f;
      _596 = 0.0f;
    }
  } else {
    _594 = _578;
    _595 = _579;
    _596 = _580;
  }
  float _606 = exp2(log2(_594 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _607 = exp2(log2(_595 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _608 = exp2(log2(_596 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_606 * 18.6875f) + 1.0f)) * ((_606 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_607 * 18.6875f) + 1.0f)) * ((_607 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_608 * 18.6875f) + 1.0f)) * ((_608 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _152;
  return SV_Target;
}

