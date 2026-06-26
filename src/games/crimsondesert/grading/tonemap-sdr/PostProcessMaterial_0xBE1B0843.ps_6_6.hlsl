Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t69, space36);

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

#if 0 // Provided by tonemap.hlsli
cbuffer __3__35__0__0__ColorBlindConstantBuffer : register(b46, space35) {
  float4 _colorBlind0 : packoffset(c000.x);
  float4 _colorBlind1 : packoffset(c001.x);
  float4 _colorBlind2 : packoffset(c002.x);
};
#endif

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float4 _17 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _27 = (pow(_17.x, 0.012683313339948654f));
  float _28 = (pow(_17.y, 0.012683313339948654f));
  float _29 = (pow(_17.z, 0.012683313339948654f));
  float _51 = exp2(log2(max(0.0f, (_27 + -0.8359375f)) / (18.8515625f - (_27 * 18.6875f))) * 6.277394771575928f);
  float _52 = exp2(log2(max(0.0f, (_28 + -0.8359375f)) / (18.8515625f - (_28 * 18.6875f))) * 6.277394771575928f);
  float _53 = exp2(log2(max(0.0f, (_29 + -0.8359375f)) / (18.8515625f - (_29 * 18.6875f))) * 6.277394771575928f);
  uint _57 = uint(SV_Position.y);
  float _71;
  float _276;
  float _277;
  float _278;
  float _371;
  float _372;
  float _373;
  float _427;
  float _428;
  float _429;
  float _448;
  float _449;
  float _450;
  float _480;
  float _481;
  float _482;
  float _496;
  float _497;
  float _498;
  if (_etcParams.y == 1.0f) {
    uint2 _65 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_57), 0));
    _71 = (float((uint)((uint)(_65.x & 127))) + 0.5f);
  } else {
    _71 = 1.0f;
  }
  bool _74 = (_localToneMappingParams.w > 0.0f);
  if (_74) {
    float3 output_color = TonemapReplacer(float3(_51, _52, _53));
    _427 = output_color.x;
    _428 = output_color.y;
    _429 = output_color.z;
  } else {
    _427 = (_51 * 10000.0f);
    _428 = (_52 * 10000.0f);
    _429 = (_53 * 10000.0f);
  }
  if (_etcParams.y > 1.0f) {
    float _438 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _439 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _443 = saturate(1.0f - (dot(float2(_438, _439), float2(_438, _439)) * saturate(_etcParams.y + -1.0f)));
    _448 = (_443 * _427);
    _449 = (_443 * _428);
    _450 = (_443 * _429);
  } else {
    _448 = _427;
    _449 = _428;
    _450 = _429;
  }
  if ((_74) && ((_etcParams.z > 0.0f))) {
    _480 = select((_448 <= 0.0031308000907301903f), (_448 * 12.920000076293945f), (((pow(_448, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _481 = select((_449 <= 0.0031308000907301903f), (_449 * 12.920000076293945f), (((pow(_449, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _482 = select((_450 <= 0.0031308000907301903f), (_450 * 12.920000076293945f), (((pow(_450, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _480 = _448;
    _481 = _449;
    _482 = _450;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _487 = float((uint)_57);
    if (!(_487 < _viewDir.w)) {
      if (!(_487 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _496 = _480;
        _497 = _481;
        _498 = _482;
      } else {
        _496 = 0.0f;
        _497 = 0.0f;
        _498 = 0.0f;
      }
    } else {
      _496 = 0.0f;
      _497 = 0.0f;
      _498 = 0.0f;
    }
  } else {
    _496 = _480;
    _497 = _481;
    _498 = _482;
  }
  float _508 = exp2(log2(_496 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _509 = exp2(log2(_497 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _510 = exp2(log2(_498 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_508 * 18.6875f) + 1.0f)) * ((_508 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_509 * 18.6875f) + 1.0f)) * ((_509 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_510 * 18.6875f) + 1.0f)) * ((_510 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _71;
  return SV_Target;
}