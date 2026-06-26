struct PostProcessGrayscaleStruct {
  float _ratio;
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

ConstantBuffer<PostProcessGrayscaleStruct> BindlessParameters_PostProcessGrayscale[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float4 _23 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _33 = (pow(_23.x, 0.012683313339948654f));
  float _34 = (pow(_23.y, 0.012683313339948654f));
  float _35 = (pow(_23.z, 0.012683313339948654f));
  float _60 = exp2(log2(max(0.0f, (_33 + -0.8359375f)) / (18.8515625f - (_33 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _61 = exp2(log2(max(0.0f, (_34 + -0.8359375f)) / (18.8515625f - (_34 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _62 = exp2(log2(max(0.0f, (_35 + -0.8359375f)) / (18.8515625f - (_35 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  int _63 = WaveReadLaneFirst(_materialIndex);
  float _71 = WaveReadLaneFirst(BindlessParameters_PostProcessGrayscale[((int)((uint)(select(((uint)_63 < (uint)170000), _63, 0)) + 0u))]._ratio);
  float _72 = dot(float3(_60, _61, _62), float3(0.26269999146461487f, 0.6779999732971191f, 0.059300001710653305f));
  float _79 = ((_72 - _60) * _71) + _60;
  float _80 = ((_72 - _61) * _71) + _61;
  float _81 = ((_72 - _62) * _71) + _62;
  uint _82 = uint(SV_Position.y);
  float _96;
  float _301;
  float _302;
  float _303;
  float _396;
  float _397;
  float _398;
  float _452;
  float _453;
  float _454;
  float _473;
  float _474;
  float _475;
  float _505;
  float _506;
  float _507;
  float _521;
  float _522;
  float _523;
  if (_etcParams.y == 1.0f) {
    uint2 _90 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_82), 0));
    _96 = (float((uint)((uint)(_90.x & 127))) + 0.5f);
  } else {
    _96 = _postProcessParams.x;
  }
  bool _99 = (_localToneMappingParams.w > 0.0f);
  if (_99) {
    float3 output_color = TonemapReplacer(float3(_79, _80, _81));
    _452 = output_color.x;
    _453 = output_color.y;
    _454 = output_color.z;
  } else {
    _452 = _79;
    _453 = _80;
    _454 = _81;
  }
  if (_etcParams.y > 1.0f) {
    float _463 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _464 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _468 = saturate(1.0f - (dot(float2(_463, _464), float2(_463, _464)) * saturate(_etcParams.y + -1.0f)));
    _473 = (_468 * _452);
    _474 = (_468 * _453);
    _475 = (_468 * _454);
  } else {
    _473 = _452;
    _474 = _453;
    _475 = _454;
  }
  if ((_99) && ((_etcParams.z > 0.0f))) {
    _505 = select((_473 <= 0.0031308000907301903f), (_473 * 12.920000076293945f), (((pow(_473, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _506 = select((_474 <= 0.0031308000907301903f), (_474 * 12.920000076293945f), (((pow(_474, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _507 = select((_475 <= 0.0031308000907301903f), (_475 * 12.920000076293945f), (((pow(_475, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _505 = _473;
    _506 = _474;
    _507 = _475;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _512 = float((uint)_82);
    if (!(_512 < _viewDir.w)) {
      if (!(_512 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _521 = _505;
        _522 = _506;
        _523 = _507;
      } else {
        _521 = 0.0f;
        _522 = 0.0f;
        _523 = 0.0f;
      }
    } else {
      _521 = 0.0f;
      _522 = 0.0f;
      _523 = 0.0f;
    }
  } else {
    _521 = _505;
    _522 = _506;
    _523 = _507;
  }
  float _533 = exp2(log2(_521 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _534 = exp2(log2(_522 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _535 = exp2(log2(_523 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_533 * 18.6875f) + 1.0f)) * ((_533 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_534 * 18.6875f) + 1.0f)) * ((_534 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_535 * 18.6875f) + 1.0f)) * ((_535 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _96;
  return SV_Target;
}