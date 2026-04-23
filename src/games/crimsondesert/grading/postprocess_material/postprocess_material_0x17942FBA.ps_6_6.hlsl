#include "../tonemap.hlsli"

struct PostProcessHousingStruct {
  float _ratio;
  float3 _pivotPosition;
  float4 _rectMinMax;
};


Texture2D<float4> __3__36__0__0__g_sceneColor : register(t33, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t75, space36);

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

ConstantBuffer<PostProcessHousingStruct> BindlessParameters_PostProcessHousing[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _18[36];
  float4 _25 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _31 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _34 = (TEXCOORD.x * 2.0f) + -1.0f;
  float _35 = TEXCOORD.y * 2.0f;
  float _36 = 1.0f - _35;
  float _37 = max(1.0000000116860974e-07f, _31.x);
  float _65 = mad((_invViewProj[3].z), _37, mad((_invViewProj[3].y), _36, ((_invViewProj[3].x) * _34))) + (_invViewProj[3].w);
  float _66 = (mad((_invViewProj[0].z), _37, mad((_invViewProj[0].y), _36, ((_invViewProj[0].x) * _34))) + (_invViewProj[0].w)) / _65;
  float _67 = (mad((_invViewProj[2].z), _37, mad((_invViewProj[2].y), _36, ((_invViewProj[2].x) * _34))) + (_invViewProj[2].w)) / _65;
  float _68 = abs(_66);
  float _70 = frac(abs(_68));
  float _71 = abs(_67);
  float _73 = frac(abs(_71));
  int _74 = WaveReadLaneFirst(_materialIndex);
  float _84 = WaveReadLaneFirst(BindlessParameters_PostProcessHousing[((int)((uint)(select(((uint)_74 < (uint)170000), _74, 0)) + 0u))]._pivotPosition.x);
  float _86 = WaveReadLaneFirst(BindlessParameters_PostProcessHousing[((int)((uint)(select(((uint)_74 < (uint)170000), _74, 0)) + 0u))]._pivotPosition.z);
  int _87 = WaveReadLaneFirst(_materialIndex);
  float _133;
  float _134;
  float _135;
  float _149;
  float _395;
  float _396;
  float _397;
  float _517;
  float _518;
  float _519;
  float _537;
  float _538;
  float _539;
  float _572;
  float _573;
  float _574;
  float _588;
  float _589;
  float _590;
  if (((((_66 > (WaveReadLaneFirst(BindlessParameters_PostProcessHousing[((int)((uint)(select(((uint)_87 < (uint)170000), _87, 0)) + 0u))]._rectMinMax.x) + _84))) && ((_67 > (WaveReadLaneFirst(BindlessParameters_PostProcessHousing[((int)((uint)(select(((uint)_87 < (uint)170000), _87, 0)) + 0u))]._rectMinMax.y) + _86))))) && ((_66 < (WaveReadLaneFirst(BindlessParameters_PostProcessHousing[((int)((uint)(select(((uint)_87 < (uint)170000), _87, 0)) + 0u))]._rectMinMax.z) + _84)))) {
    bool _128 = ((_67 < (WaveReadLaneFirst(BindlessParameters_PostProcessHousing[((int)((uint)(select(((uint)_87 < (uint)170000), _87, 0)) + 0u))]._rectMinMax.w) + _86))) && ((((abs(1.0f - select((_71 >= (-0.0f - _71)), _73, (-0.0f - _73))) < 0.03125f)) || ((abs(1.0f - select((_68 >= (-0.0f - _68)), _70, (-0.0f - _70))) < 0.03125f))));
    _133 = select(_128, 256.0f, _25.x);
    _134 = select(_128, 256.0f, _25.y);
    _135 = select(_128, 256.0f, _25.z);
  } else {
    _133 = _25.x;
    _134 = _25.y;
    _135 = _25.z;
  }
  uint _136 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _143 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_136), 0));
    _149 = (float((uint)((uint)(_143.x & 127))) + 0.5f);
  } else {
    _149 = _postProcessParams.x;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_133, _134, _135));
    _517 = output_color.x;
    _518 = output_color.y;
    _519 = output_color.z;
  } else {
    _517 = _133;
    _518 = _134;
    _519 = _135;
  }
  if (_etcParams.y > 1.0f) {
    float _527 = abs(_34);
    float _528 = abs(_35 + -1.0f);
    float _532 = saturate(1.0f - (dot(float2(_527, _528), float2(_527, _528)) * saturate(_etcParams.y + -1.0f)));
    _537 = (_532 * _517);
    _538 = (_532 * _518);
    _539 = (_532 * _519);
  } else {
    _537 = _517;
    _538 = _518;
    _539 = _519;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _572 = select((_537 <= 0.0031308000907301903f), (_537 * 12.920000076293945f), (((pow(_537, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _573 = select((_538 <= 0.0031308000907301903f), (_538 * 12.920000076293945f), (((pow(_538, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _574 = select((_539 <= 0.0031308000907301903f), (_539 * 12.920000076293945f), (((pow(_539, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _572 = _537;
    _573 = _538;
    _574 = _539;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _579 = float((uint)_136);
    if (!(_579 < _viewDir.w)) {
      if (!(_579 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _588 = _572;
        _589 = _573;
        _590 = _574;
      } else {
        _588 = 0.0f;
        _589 = 0.0f;
        _590 = 0.0f;
      }
    } else {
      _588 = 0.0f;
      _589 = 0.0f;
      _590 = 0.0f;
    }
  } else {
    _588 = _572;
    _589 = _573;
    _590 = _574;
  }
  SV_Target.x = _588;
  SV_Target.y = _589;
  SV_Target.z = _590;
  SV_Target.w = _149;
  return SV_Target;
}

