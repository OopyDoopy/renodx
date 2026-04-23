#include "../tonemap.hlsli"

struct TemplatePostProcessStruct {
  float _parameter;
};


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

ConstantBuffer<TemplatePostProcessStruct> BindlessParameters_TemplatePostProcess[] : register(b0, space100);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _13[36];
  int _16 = WaveReadLaneFirst(_materialIndex);
  float _24 = WaveReadLaneFirst(BindlessParameters_TemplatePostProcess[((int)((uint)(select(((uint)_16 < (uint)170000), _16, 0)) + 0u))]._parameter);
  uint _29 = uint(SV_Position.y);
  float _43;
  float _276;
  float _277;
  float _278;
  float _398;
  float _399;
  float _400;
  float _421;
  float _422;
  float _423;
  float _456;
  float _457;
  float _458;
  float _472;
  float _473;
  float _474;
  if (_etcParams.y == 1.0f) {
    uint2 _37 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_29), 0));
    _43 = (float((uint)((uint)(_37.x & 127))) + 0.5f);
  } else {
    _43 = select(isnan(_postProcessParams.x), 0.0f, 1.0f);
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_24, _24, _24));
    _398 = output_color.x;
    _399 = output_color.y;
    _400 = output_color.z;
  } else {
    _398 = _24;
    _399 = _24;
    _400 = _24;
  }
  if (_etcParams.y > 1.0f) {
    float _411 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _412 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _416 = saturate(1.0f - (dot(float2(_411, _412), float2(_411, _412)) * saturate(_etcParams.y + -1.0f)));
    _421 = (_416 * _398);
    _422 = (_416 * _399);
    _423 = (_416 * _400);
  } else {
    _421 = _398;
    _422 = _399;
    _423 = _400;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _456 = select((_421 <= 0.0031308000907301903f), (_421 * 12.920000076293945f), (((pow(_421, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _457 = select((_422 <= 0.0031308000907301903f), (_422 * 12.920000076293945f), (((pow(_422, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _458 = select((_423 <= 0.0031308000907301903f), (_423 * 12.920000076293945f), (((pow(_423, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _456 = _421;
    _457 = _422;
    _458 = _423;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _463 = float((uint)_29);
    if (!(_463 < _viewDir.w)) {
      if (!(_463 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _472 = _456;
        _473 = _457;
        _474 = _458;
      } else {
        _472 = 0.0f;
        _473 = 0.0f;
        _474 = 0.0f;
      }
    } else {
      _472 = 0.0f;
      _473 = 0.0f;
      _474 = 0.0f;
    }
  } else {
    _472 = _456;
    _473 = _457;
    _474 = _458;
  }
  float _484 = exp2(log2(_472 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _485 = exp2(log2(_473 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _486 = exp2(log2(_474 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_484 * 18.6875f) + 1.0f)) * ((_484 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_485 * 18.6875f) + 1.0f)) * ((_485 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_486 * 18.6875f) + 1.0f)) * ((_486 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _43;
  return SV_Target;
}

