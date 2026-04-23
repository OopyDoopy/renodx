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
  float _26 = (pow(_19.y, 0.012683313339948654f));
  float _27 = (pow(_19.z, 0.012683313339948654f));
  float _44 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _47 = (TEXCOORD.x * 2.0f) + -1.0f;
  float _48 = TEXCOORD.y * 2.0f;
  float _49 = 1.0f - _48;
  float _50 = max(1.0000000116860974e-07f, _44.x);
  float _86 = mad((_invViewProj[3].z), _50, mad((_invViewProj[3].y), _49, ((_invViewProj[3].x) * _47))) + (_invViewProj[3].w);
  int _90 = WaveReadLaneFirst(_materialIndex);
  float _103 = WaveReadLaneFirst(BindlessParameters_PostProcessZone[((int)((uint)(select(((uint)_90 < (uint)170000), _90, 0)) + 0u))]._mainPosition.x) - ((mad((_invViewProj[0].z), _50, mad((_invViewProj[0].y), _49, ((_invViewProj[0].x) * _47))) + (_invViewProj[0].w)) / _86);
  float _105 = WaveReadLaneFirst(BindlessParameters_PostProcessZone[((int)((uint)(select(((uint)_90 < (uint)170000), _90, 0)) + 0u))]._mainPosition.z) - ((mad((_invViewProj[2].z), _50, mad((_invViewProj[2].y), _49, ((_invViewProj[2].x) * _47))) + (_invViewProj[2].w)) / _86);
  float _106 = (WaveReadLaneFirst(BindlessParameters_PostProcessZone[((int)((uint)(select(((uint)_90 < (uint)170000), _90, 0)) + 0u))]._mainPosition.y) - ((mad((_invViewProj[1].z), _50, mad((_invViewProj[1].y), _49, ((_invViewProj[1].x) * _47))) + (_invViewProj[1].w)) / _86)) + 1.600000023841858f;
  int _109 = WaveReadLaneFirst(_materialIndex);
  int _118 = WaveReadLaneFirst(_materialIndex);
  int _129 = WaveReadLaneFirst(_materialIndex);
  int _145 = WaveReadLaneFirst(_materialIndex);
  float _192;
  float _438;
  float _439;
  float _440;
  float _560;
  float _561;
  float _562;
  float _580;
  float _581;
  float _582;
  float _615;
  float _616;
  float _617;
  float _631;
  float _632;
  float _633;
  float _163 = (pow(_19.x, 0.012683313339948654f));
  float _175 = saturate((WaveReadLaneFirst(BindlessParameters_PostProcessZone[((int)((uint)(select(((uint)_145 < (uint)170000), _145, 0)) + 0u))]._ratio) * (min(max((1.0f - saturate(exp2(log2(sqrt(dot(float3(_103, _106, _105), float3(_103, _106, _105))) - (WaveReadLaneFirst(BindlessParameters_PostProcessZone[((int)((uint)(select(((uint)_118 < (uint)170000), _118, 0)) + 0u))]._progress) * WaveReadLaneFirst(BindlessParameters_PostProcessZone[((int)((uint)(select(((uint)_109 < (uint)170000), _109, 0)) + 0u))]._radius))) * WaveReadLaneFirst(BindlessParameters_PostProcessZone[((int)((uint)(select(((uint)_129 < (uint)170000), _129, 0)) + 0u))]._edgeSmoothness)))), 0.0f), 1.0f) + -1.0f)) + 1.0f) * 10000.0f;
  float _176 = _175 * exp2(log2(max(0.0f, (_163 + -0.8359375f)) / (18.8515625f - (_163 * 18.6875f))) * 6.277394771575928f);
  float _177 = _175 * exp2(log2(max(0.0f, (_26 + -0.8359375f)) / (18.8515625f - (_26 * 18.6875f))) * 6.277394771575928f);
  float _178 = _175 * exp2(log2(max(0.0f, (_27 + -0.8359375f)) / (18.8515625f - (_27 * 18.6875f))) * 6.277394771575928f);
  uint _179 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _186 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_179), 0));
    _192 = (float((uint)((uint)(_186.x & 127))) + 0.5f);
  } else {
    _192 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_176, _177, _178));
    _560 = output_color.x;
    _561 = output_color.y;
    _562 = output_color.z;
  } else {
    _560 = _176;
    _561 = _177;
    _562 = _178;
  }
  if (_etcParams.y > 1.0f) {
    float _570 = abs(_47);
    float _571 = abs(_48 + -1.0f);
    float _575 = saturate(1.0f - (dot(float2(_570, _571), float2(_570, _571)) * saturate(_etcParams.y + -1.0f)));
    _580 = (_575 * _560);
    _581 = (_575 * _561);
    _582 = (_575 * _562);
  } else {
    _580 = _560;
    _581 = _561;
    _582 = _562;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _615 = select((_580 <= 0.0031308000907301903f), (_580 * 12.920000076293945f), (((pow(_580, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _616 = select((_581 <= 0.0031308000907301903f), (_581 * 12.920000076293945f), (((pow(_581, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _617 = select((_582 <= 0.0031308000907301903f), (_582 * 12.920000076293945f), (((pow(_582, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _615 = _580;
    _616 = _581;
    _617 = _582;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _622 = float((uint)_179);
    if (!(_622 < _viewDir.w)) {
      if (!(_622 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _631 = _615;
        _632 = _616;
        _633 = _617;
      } else {
        _631 = 0.0f;
        _632 = 0.0f;
        _633 = 0.0f;
      }
    } else {
      _631 = 0.0f;
      _632 = 0.0f;
      _633 = 0.0f;
    }
  } else {
    _631 = _615;
    _632 = _616;
    _633 = _617;
  }
  float _643 = exp2(log2(_631 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _644 = exp2(log2(_632 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _645 = exp2(log2(_633 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_643 * 18.6875f) + 1.0f)) * ((_643 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_644 * 18.6875f) + 1.0f)) * ((_644 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_645 * 18.6875f) + 1.0f)) * ((_645 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _192;
  return SV_Target;
}

