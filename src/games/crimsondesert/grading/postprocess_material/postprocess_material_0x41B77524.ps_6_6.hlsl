#include "../tonemap.hlsli"

struct PostProcessZoneStruct {
  float3 _mainPosition;
  float _radius;
  float _ratio;
  float _progress;
  float _edgeSmoothness;
  float _edgeWidth;
  uint _maskColor;
  uint _noiseTex;
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

ConstantBuffer<PostProcessZoneStruct> BindlessParameters_PostProcessZone[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _14[36];
  float4 _19 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _22 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _25 = (TEXCOORD.x * 2.0f) + -1.0f;
  float _26 = TEXCOORD.y * 2.0f;
  float _27 = 1.0f - _26;
  float _28 = max(1.0000000116860974e-07f, _22.x);
  float _64 = mad((_invViewProj[3].z), _28, mad((_invViewProj[3].y), _27, ((_invViewProj[3].x) * _25))) + (_invViewProj[3].w);
  int _68 = WaveReadLaneFirst(_materialIndex);
  float _81 = WaveReadLaneFirst(BindlessParameters_PostProcessZone[((int)((uint)(select(((uint)_68 < (uint)170000), _68, 0)) + 0u))]._mainPosition.x) - ((mad((_invViewProj[0].z), _28, mad((_invViewProj[0].y), _27, ((_invViewProj[0].x) * _25))) + (_invViewProj[0].w)) / _64);
  float _83 = WaveReadLaneFirst(BindlessParameters_PostProcessZone[((int)((uint)(select(((uint)_68 < (uint)170000), _68, 0)) + 0u))]._mainPosition.z) - ((mad((_invViewProj[2].z), _28, mad((_invViewProj[2].y), _27, ((_invViewProj[2].x) * _25))) + (_invViewProj[2].w)) / _64);
  float _84 = (WaveReadLaneFirst(BindlessParameters_PostProcessZone[((int)((uint)(select(((uint)_68 < (uint)170000), _68, 0)) + 0u))]._mainPosition.y) - ((mad((_invViewProj[1].z), _28, mad((_invViewProj[1].y), _27, ((_invViewProj[1].x) * _25))) + (_invViewProj[1].w)) / _64)) + 1.600000023841858f;
  int _87 = WaveReadLaneFirst(_materialIndex);
  int _96 = WaveReadLaneFirst(_materialIndex);
  int _107 = WaveReadLaneFirst(_materialIndex);
  int _123 = WaveReadLaneFirst(_materialIndex);
  float _158;
  float _404;
  float _405;
  float _406;
  float _526;
  float _527;
  float _528;
  float _546;
  float _547;
  float _548;
  float _581;
  float _582;
  float _583;
  float _597;
  float _598;
  float _599;
  float _141 = saturate((WaveReadLaneFirst(BindlessParameters_PostProcessZone[((int)((uint)(select(((uint)_123 < (uint)170000), _123, 0)) + 0u))]._ratio) * (min(max((1.0f - saturate(exp2(log2(sqrt(dot(float3(_81, _84, _83), float3(_81, _84, _83))) - (WaveReadLaneFirst(BindlessParameters_PostProcessZone[((int)((uint)(select(((uint)_96 < (uint)170000), _96, 0)) + 0u))]._progress) * WaveReadLaneFirst(BindlessParameters_PostProcessZone[((int)((uint)(select(((uint)_87 < (uint)170000), _87, 0)) + 0u))]._radius))) * WaveReadLaneFirst(BindlessParameters_PostProcessZone[((int)((uint)(select(((uint)_107 < (uint)170000), _107, 0)) + 0u))]._edgeSmoothness)))), 0.0f), 1.0f) + -1.0f)) + 1.0f);
  float _142 = _141 * _19.x;
  float _143 = _141 * _19.y;
  float _144 = _141 * _19.z;
  uint _145 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _152 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_145), 0));
    _158 = (float((uint)((uint)(_152.x & 127))) + 0.5f);
  } else {
    _158 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_142, _143, _144));
    _526 = output_color.x;
    _527 = output_color.y;
    _528 = output_color.z;
  } else {
    _526 = _142;
    _527 = _143;
    _528 = _144;
  }
  if (_etcParams.y > 1.0f) {
    float _536 = abs(_25);
    float _537 = abs(_26 + -1.0f);
    float _541 = saturate(1.0f - (dot(float2(_536, _537), float2(_536, _537)) * saturate(_etcParams.y + -1.0f)));
    _546 = (_541 * _526);
    _547 = (_541 * _527);
    _548 = (_541 * _528);
  } else {
    _546 = _526;
    _547 = _527;
    _548 = _528;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _581 = select((_546 <= 0.0031308000907301903f), (_546 * 12.920000076293945f), (((pow(_546, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _582 = select((_547 <= 0.0031308000907301903f), (_547 * 12.920000076293945f), (((pow(_547, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _583 = select((_548 <= 0.0031308000907301903f), (_548 * 12.920000076293945f), (((pow(_548, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _581 = _546;
    _582 = _547;
    _583 = _548;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _588 = float((uint)_145);
    if (!(_588 < _viewDir.w)) {
      if (!(_588 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _597 = _581;
        _598 = _582;
        _599 = _583;
      } else {
        _597 = 0.0f;
        _598 = 0.0f;
        _599 = 0.0f;
      }
    } else {
      _597 = 0.0f;
      _598 = 0.0f;
      _599 = 0.0f;
    }
  } else {
    _597 = _581;
    _598 = _582;
    _599 = _583;
  }
  SV_Target.x = _597;
  SV_Target.y = _598;
  SV_Target.z = _599;
  SV_Target.w = _158;
  return SV_Target;
}

