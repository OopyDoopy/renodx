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
  int _26 = WaveReadLaneFirst(_materialIndex);
  float _34 = WaveReadLaneFirst(BindlessParameters_PostProcessGrayscale[((int)((uint)(select(((uint)_26 < (uint)170000), _26, 0)) + 0u))]._ratio);
  float _35 = dot(float3(_22.x, _22.y, _22.z), float3(0.26269999146461487f, 0.6779999732971191f, 0.059300001710653305f));
  float _42 = ((_35 - _22.x) * _34) + _22.x;
  float _43 = ((_35 - _22.y) * _34) + _22.y;
  float _44 = ((_35 - _22.z) * _34) + _22.z;
  uint _45 = uint(SV_Position.y);
  float _59;
  float _305;
  float _306;
  float _307;
  float _427;
  float _428;
  float _429;
  float _450;
  float _451;
  float _452;
  float _485;
  float _486;
  float _487;
  float _501;
  float _502;
  float _503;
  if (_etcParams.y == 1.0f) {
    uint2 _53 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_45), 0));
    _59 = (float((uint)((uint)(_53.x & 127))) + 0.5f);
  } else {
    _59 = _postProcessParams.x;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_42, _43, _44));
    _427 = output_color.x;
    _428 = output_color.y;
    _429 = output_color.z;
  } else {
    _427 = _42;
    _428 = _43;
    _429 = _44;
  }
  if (_etcParams.y > 1.0f) {
    float _440 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _441 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _445 = saturate(1.0f - (dot(float2(_440, _441), float2(_440, _441)) * saturate(_etcParams.y + -1.0f)));
    _450 = (_445 * _427);
    _451 = (_445 * _428);
    _452 = (_445 * _429);
  } else {
    _450 = _427;
    _451 = _428;
    _452 = _429;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _485 = select((_450 <= 0.0031308000907301903f), (_450 * 12.920000076293945f), (((pow(_450, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _486 = select((_451 <= 0.0031308000907301903f), (_451 * 12.920000076293945f), (((pow(_451, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _487 = select((_452 <= 0.0031308000907301903f), (_452 * 12.920000076293945f), (((pow(_452, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _485 = _450;
    _486 = _451;
    _487 = _452;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _492 = float((uint)_45);
    if (!(_492 < _viewDir.w)) {
      if (!(_492 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _501 = _485;
        _502 = _486;
        _503 = _487;
      } else {
        _501 = 0.0f;
        _502 = 0.0f;
        _503 = 0.0f;
      }
    } else {
      _501 = 0.0f;
      _502 = 0.0f;
      _503 = 0.0f;
    }
  } else {
    _501 = _485;
    _502 = _486;
    _503 = _487;
  }
  SV_Target.x = _501;
  SV_Target.y = _502;
  SV_Target.z = _503;
  SV_Target.w = _59;
  return SV_Target;
}

