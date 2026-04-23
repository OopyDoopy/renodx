#include "../tonemap.hlsli"

struct PostProcessTransition_CDStruct {
  uint _chapterNoiseTex;
  uint _chapterCardTex;
  uint _lensDirtTex;
  float _chapterTransition;
  uint _sceneTintColor;
  uint _chapterCardColor;
  uint _chapterBackgroundColor;
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

ConstantBuffer<PostProcessTransition_CDStruct> BindlessParameters_PostProcessTransition_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _16[36];
  int _19 = WaveReadLaneFirst(_materialIndex);
  float _73;
  float _74;
  float _75;
  float _89;
  float _335;
  float _336;
  float _337;
  float _457;
  float _458;
  float _459;
  float _480;
  float _481;
  float _482;
  float _515;
  float _516;
  float _517;
  float _531;
  float _532;
  float _533;
  if (WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_19 < (uint)170000), _19, 0)) + 0u))]._chapterTransition) > 0.0f) {
    float4 _32 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
    float _42 = (pow(_32.x, 0.012683313339948654f));
    float _43 = (pow(_32.y, 0.012683313339948654f));
    float _44 = (pow(_32.z, 0.012683313339948654f));
    _73 = (exp2(log2(max(0.0f, (_42 + -0.8359375f)) / (18.8515625f - (_42 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
    _74 = (exp2(log2(max(0.0f, (_43 + -0.8359375f)) / (18.8515625f - (_43 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
    _75 = (exp2(log2(max(0.0f, (_44 + -0.8359375f)) / (18.8515625f - (_44 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
  } else {
    _73 = 0.0f;
    _74 = 0.0f;
    _75 = 0.0f;
  }
  uint _76 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _83 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_76), 0));
    _89 = (float((uint)((uint)(_83.x & 127))) + 0.5f);
  } else {
    _89 = 0.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_73, _74, _75));
    _457 = output_color.x;
    _458 = output_color.y;
    _459 = output_color.z;
  } else {
    _457 = _73;
    _458 = _74;
    _459 = _75;
  }
  if (_etcParams.y > 1.0f) {
    float _470 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _471 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _475 = saturate(1.0f - (dot(float2(_470, _471), float2(_470, _471)) * saturate(_etcParams.y + -1.0f)));
    _480 = (_475 * _457);
    _481 = (_475 * _458);
    _482 = (_475 * _459);
  } else {
    _480 = _457;
    _481 = _458;
    _482 = _459;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _515 = select((_480 <= 0.0031308000907301903f), (_480 * 12.920000076293945f), (((pow(_480, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _516 = select((_481 <= 0.0031308000907301903f), (_481 * 12.920000076293945f), (((pow(_481, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _517 = select((_482 <= 0.0031308000907301903f), (_482 * 12.920000076293945f), (((pow(_482, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _515 = _480;
    _516 = _481;
    _517 = _482;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _522 = float((uint)_76);
    if (!(_522 < _viewDir.w)) {
      if (!(_522 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _531 = _515;
        _532 = _516;
        _533 = _517;
      } else {
        _531 = 0.0f;
        _532 = 0.0f;
        _533 = 0.0f;
      }
    } else {
      _531 = 0.0f;
      _532 = 0.0f;
      _533 = 0.0f;
    }
  } else {
    _531 = _515;
    _532 = _516;
    _533 = _517;
  }
  float _543 = exp2(log2(_531 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _544 = exp2(log2(_532 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _545 = exp2(log2(_533 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_543 * 18.6875f) + 1.0f)) * ((_543 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_544 * 18.6875f) + 1.0f)) * ((_544 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_545 * 18.6875f) + 1.0f)) * ((_545 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _89;
  return SV_Target;
}

