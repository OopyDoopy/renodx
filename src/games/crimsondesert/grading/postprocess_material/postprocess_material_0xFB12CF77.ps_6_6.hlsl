#include "../tonemap.hlsli"

struct PostProcessGrayscaleStruct {
  float _ratio;
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

cbuffer __3__1__0__0__PostProcessMaterialIndex : register(b2, space1) {
  int _materialIndex : packoffset(c000.x);
  int _passIndex : packoffset(c000.y);
};

ConstantBuffer<PostProcessGrayscaleStruct> BindlessParameters_PostProcessGrayscale[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _15[36];
  float4 _22 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _32 = (pow(_22.x, 0.012683313339948654f));
  float _33 = (pow(_22.y, 0.012683313339948654f));
  float _34 = (pow(_22.z, 0.012683313339948654f));
  float _59 = exp2(log2(max(0.0f, (_32 + -0.8359375f)) / (18.8515625f - (_32 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _60 = exp2(log2(max(0.0f, (_33 + -0.8359375f)) / (18.8515625f - (_33 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _61 = exp2(log2(max(0.0f, (_34 + -0.8359375f)) / (18.8515625f - (_34 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  int _62 = WaveReadLaneFirst(_materialIndex);
  float _70 = WaveReadLaneFirst(BindlessParameters_PostProcessGrayscale[((int)((uint)(select(((uint)_62 < (uint)170000), _62, 0)) + 0u))]._ratio);
  float _71 = dot(float3(_59, _60, _61), float3(0.26269999146461487f, 0.6779999732971191f, 0.059300001710653305f));
  float _78 = ((_71 - _59) * _70) + _59;
  float _79 = ((_71 - _60) * _70) + _60;
  float _80 = ((_71 - _61) * _70) + _61;
  uint _81 = uint(SV_Position.y);
  float _95;
  float _341;
  float _342;
  float _343;
  float _463;
  float _464;
  float _465;
  float _486;
  float _487;
  float _488;
  float _521;
  float _522;
  float _523;
  float _537;
  float _538;
  float _539;
  if (_etcParams.y == 1.0f) {
    uint2 _89 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_81), 0));
    _95 = (float((uint)((uint)(_89.x & 127))) + 0.5f);
  } else {
    _95 = _postProcessParams.x;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_78, _79, _80));
    _463 = output_color.x;
    _464 = output_color.y;
    _465 = output_color.z;
  } else {
    _463 = _78;
    _464 = _79;
    _465 = _80;
  }
  if (_etcParams.y > 1.0f) {
    float _476 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _477 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _481 = saturate(1.0f - (dot(float2(_476, _477), float2(_476, _477)) * saturate(_etcParams.y + -1.0f)));
    _486 = (_481 * _463);
    _487 = (_481 * _464);
    _488 = (_481 * _465);
  } else {
    _486 = _463;
    _487 = _464;
    _488 = _465;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _521 = select((_486 <= 0.0031308000907301903f), (_486 * 12.920000076293945f), (((pow(_486, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _522 = select((_487 <= 0.0031308000907301903f), (_487 * 12.920000076293945f), (((pow(_487, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _523 = select((_488 <= 0.0031308000907301903f), (_488 * 12.920000076293945f), (((pow(_488, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _521 = _486;
    _522 = _487;
    _523 = _488;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _528 = float((uint)_81);
    if (!(_528 < _viewDir.w)) {
      if (!(_528 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _537 = _521;
        _538 = _522;
        _539 = _523;
      } else {
        _537 = 0.0f;
        _538 = 0.0f;
        _539 = 0.0f;
      }
    } else {
      _537 = 0.0f;
      _538 = 0.0f;
      _539 = 0.0f;
    }
  } else {
    _537 = _521;
    _538 = _522;
    _539 = _523;
  }
  float _549 = exp2(log2(_537 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _550 = exp2(log2(_538 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _551 = exp2(log2(_539 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_549 * 18.6875f) + 1.0f)) * ((_549 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_550 * 18.6875f) + 1.0f)) * ((_550 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_551 * 18.6875f) + 1.0f)) * ((_551 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _95;
  return SV_Target;
}

