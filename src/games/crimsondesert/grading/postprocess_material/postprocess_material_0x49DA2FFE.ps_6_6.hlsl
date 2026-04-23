#include "../tonemap.hlsli"

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t33, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t75, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t38, space36);

Texture2D<uint> __3__36__0__0__g_CustomRenderPassValue : register(t65, space36);

Texture2D<float4> __3__36__0__0__g_CustomRenderPassDepth : register(t66, space36);

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
  float _17[36];
  float4 _20 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _36 = float((int)(int((_bufferSizeAndInvSize.x + -1.0f) * saturate(TEXCOORD.x))));
  float _37 = float((int)(int((_bufferSizeAndInvSize.y + -1.0f) * saturate(TEXCOORD.y))));
  int2 _39; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_39.x, _39.y);
  uint _54 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_39.x))))) + 0.5f) * _36), int((float((int)(int(float((int)(_39.y))))) + 0.5f) * _37), 0));
  float _82;
  float _83;
  float _84;
  float _98;
  float _344;
  float _345;
  float _346;
  float _466;
  float _467;
  float _468;
  float _489;
  float _490;
  float _491;
  float _524;
  float _525;
  float _526;
  float _540;
  float _541;
  float _542;
  if (!((_54.x & 255) == 0)) {
    float4 _68 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_36 * _customRenderPassSizeInvSize.x), int(_37 * _customRenderPassSizeInvSize.y), 0));
    float _73 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    float _80 = saturate(ceil((0.10000000149011612f - (_nearFarProj.x / max(1.0000000116860974e-07f, _68.x))) + (_nearFarProj.x / max(1.0000000116860974e-07f, _73.x))));
    _82 = _80;
    _83 = _80;
    _84 = _80;
  } else {
    _82 = _20.x;
    _83 = _20.y;
    _84 = _20.z;
  }
  uint _85 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _92 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_85), 0));
    _98 = (float((uint)((uint)(_92.x & 127))) + 0.5f);
  } else {
    _98 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_82, _83, _84));
    _466 = output_color.x;
    _467 = output_color.y;
    _468 = output_color.z;
  } else {
    _466 = _82;
    _467 = _83;
    _468 = _84;
  }
  if (_etcParams.y > 1.0f) {
    float _479 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _480 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _484 = saturate(1.0f - (dot(float2(_479, _480), float2(_479, _480)) * saturate(_etcParams.y + -1.0f)));
    _489 = (_484 * _466);
    _490 = (_484 * _467);
    _491 = (_484 * _468);
  } else {
    _489 = _466;
    _490 = _467;
    _491 = _468;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _524 = select((_489 <= 0.0031308000907301903f), (_489 * 12.920000076293945f), (((pow(_489, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _525 = select((_490 <= 0.0031308000907301903f), (_490 * 12.920000076293945f), (((pow(_490, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _526 = select((_491 <= 0.0031308000907301903f), (_491 * 12.920000076293945f), (((pow(_491, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _524 = _489;
    _525 = _490;
    _526 = _491;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _531 = float((uint)_85);
    if (!(_531 < _viewDir.w)) {
      if (!(_531 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _540 = _524;
        _541 = _525;
        _542 = _526;
      } else {
        _540 = 0.0f;
        _541 = 0.0f;
        _542 = 0.0f;
      }
    } else {
      _540 = 0.0f;
      _541 = 0.0f;
      _542 = 0.0f;
    }
  } else {
    _540 = _524;
    _541 = _525;
    _542 = _526;
  }
  SV_Target.x = _540;
  SV_Target.y = _541;
  SV_Target.z = _542;
  SV_Target.w = _98;
  return SV_Target;
}

