#include "../tonemap.hlsli"

Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t44, space36);

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

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _13[36];
  float4 _16 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _26 = (pow(_16.x, 0.012683313339948654f));
  float _27 = (pow(_16.y, 0.012683313339948654f));
  float _28 = (pow(_16.z, 0.012683313339948654f));
  float _50 = exp2(log2(max(0.0f, (_26 + -0.8359375f)) / (18.8515625f - (_26 * 18.6875f))) * 6.277394771575928f);
  float _51 = exp2(log2(max(0.0f, (_27 + -0.8359375f)) / (18.8515625f - (_27 * 18.6875f))) * 6.277394771575928f);
  float _52 = exp2(log2(max(0.0f, (_28 + -0.8359375f)) / (18.8515625f - (_28 * 18.6875f))) * 6.277394771575928f);
  uint _56 = uint(SV_Position.y);
  float _70;
  float _316;
  float _317;
  float _318;
  float _438;
  float _439;
  float _440;
  float _461;
  float _462;
  float _463;
  float _496;
  float _497;
  float _498;
  float _512;
  float _513;
  float _514;
  if (_etcParams.y == 1.0f) {
    uint2 _64 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_56), 0));
    _70 = (float((uint)((uint)(_64.x & 127))) + 0.5f);
  } else {
    _70 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_50, _51, _52));
    _438 = output_color.x;
    _439 = output_color.y;
    _440 = output_color.z;
  } else {
    _438 = _50;
    _439 = _51;
    _440 = _52;
  }
  if (_etcParams.y > 1.0f) {
    float _451 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _452 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _456 = saturate(1.0f - (dot(float2(_451, _452), float2(_451, _452)) * saturate(_etcParams.y + -1.0f)));
    _461 = (_456 * _438);
    _462 = (_456 * _439);
    _463 = (_456 * _440);
  } else {
    _461 = _438;
    _462 = _439;
    _463 = _440;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _496 = select((_461 <= 0.0031308000907301903f), (_461 * 12.920000076293945f), (((pow(_461, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _497 = select((_462 <= 0.0031308000907301903f), (_462 * 12.920000076293945f), (((pow(_462, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _498 = select((_463 <= 0.0031308000907301903f), (_463 * 12.920000076293945f), (((pow(_463, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _496 = _461;
    _497 = _462;
    _498 = _463;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _503 = float((uint)_56);
    if (!(_503 < _viewDir.w)) {
      if (!(_503 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _512 = _496;
        _513 = _497;
        _514 = _498;
      } else {
        _512 = 0.0f;
        _513 = 0.0f;
        _514 = 0.0f;
      }
    } else {
      _512 = 0.0f;
      _513 = 0.0f;
      _514 = 0.0f;
    }
  } else {
    _512 = _496;
    _513 = _497;
    _514 = _498;
  }
  float _524 = exp2(log2(_512 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _525 = exp2(log2(_513 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _526 = exp2(log2(_514 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_524 * 18.6875f) + 1.0f)) * ((_524 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_525 * 18.6875f) + 1.0f)) * ((_525 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_526 * 18.6875f) + 1.0f)) * ((_526 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _70;
  return SV_Target;
}

