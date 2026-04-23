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
  float _30 = (pow(_20.x, 0.012683313339948654f));
  float _31 = (pow(_20.y, 0.012683313339948654f));
  float _32 = (pow(_20.z, 0.012683313339948654f));
  float _72 = float((int)(int((_bufferSizeAndInvSize.x + -1.0f) * saturate(TEXCOORD.x))));
  float _73 = float((int)(int((_bufferSizeAndInvSize.y + -1.0f) * saturate(TEXCOORD.y))));
  int2 _75; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_75.x, _75.y);
  uint _90 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_75.x))))) + 0.5f) * _72), int((float((int)(int(float((int)(_75.y))))) + 0.5f) * _73), 0));
  float _118;
  float _119;
  float _120;
  float _134;
  float _380;
  float _381;
  float _382;
  float _502;
  float _503;
  float _504;
  float _525;
  float _526;
  float _527;
  float _560;
  float _561;
  float _562;
  float _576;
  float _577;
  float _578;
  if (!((_90.x & 255) == 0)) {
    float4 _104 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_72 * _customRenderPassSizeInvSize.x), int(_73 * _customRenderPassSizeInvSize.y), 0));
    float _109 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    float _116 = saturate(ceil((0.10000000149011612f - (_nearFarProj.x / max(1.0000000116860974e-07f, _104.x))) + (_nearFarProj.x / max(1.0000000116860974e-07f, _109.x))));
    _118 = _116;
    _119 = _116;
    _120 = _116;
  } else {
    _118 = (exp2(log2(max(0.0f, (_30 + -0.8359375f)) / (18.8515625f - (_30 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
    _119 = (exp2(log2(max(0.0f, (_31 + -0.8359375f)) / (18.8515625f - (_31 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
    _120 = (exp2(log2(max(0.0f, (_32 + -0.8359375f)) / (18.8515625f - (_32 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
  }
  uint _121 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _128 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_121), 0));
    _134 = (float((uint)((uint)(_128.x & 127))) + 0.5f);
  } else {
    _134 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_118, _119, _120));
    _502 = output_color.x;
    _503 = output_color.y;
    _504 = output_color.z;
  } else {
    _502 = _118;
    _503 = _119;
    _504 = _120;
  }
  if (_etcParams.y > 1.0f) {
    float _515 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _516 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _520 = saturate(1.0f - (dot(float2(_515, _516), float2(_515, _516)) * saturate(_etcParams.y + -1.0f)));
    _525 = (_520 * _502);
    _526 = (_520 * _503);
    _527 = (_520 * _504);
  } else {
    _525 = _502;
    _526 = _503;
    _527 = _504;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _560 = select((_525 <= 0.0031308000907301903f), (_525 * 12.920000076293945f), (((pow(_525, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _561 = select((_526 <= 0.0031308000907301903f), (_526 * 12.920000076293945f), (((pow(_526, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _562 = select((_527 <= 0.0031308000907301903f), (_527 * 12.920000076293945f), (((pow(_527, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _560 = _525;
    _561 = _526;
    _562 = _527;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _567 = float((uint)_121);
    if (!(_567 < _viewDir.w)) {
      if (!(_567 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _576 = _560;
        _577 = _561;
        _578 = _562;
      } else {
        _576 = 0.0f;
        _577 = 0.0f;
        _578 = 0.0f;
      }
    } else {
      _576 = 0.0f;
      _577 = 0.0f;
      _578 = 0.0f;
    }
  } else {
    _576 = _560;
    _577 = _561;
    _578 = _562;
  }
  float _588 = exp2(log2(_576 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _589 = exp2(log2(_577 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _590 = exp2(log2(_578 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_588 * 18.6875f) + 1.0f)) * ((_588 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_589 * 18.6875f) + 1.0f)) * ((_589 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_590 * 18.6875f) + 1.0f)) * ((_590 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _134;
  return SV_Target;
}

