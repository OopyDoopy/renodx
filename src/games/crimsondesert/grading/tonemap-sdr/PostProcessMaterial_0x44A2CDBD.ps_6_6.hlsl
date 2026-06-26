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


Texture2D<float4> __3__36__0__0__g_sceneColor : register(t32, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t40, space36);

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

ConstantBuffer<PostProcessZoneStruct> BindlessParameters_PostProcessZone[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
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
  float _194;
  float _398;
  float _399;
  float _400;
  float _493;
  float _494;
  float _495;
  float _549;
  float _550;
  float _551;
  float _567;
  float _568;
  float _569;
  float _599;
  float _600;
  float _601;
  float _615;
  float _616;
  float _617;
  float _165 = (pow(_19.x, 0.012683313339948654f));
  float _177 = saturate((WaveReadLaneFirst(BindlessParameters_PostProcessZone[((int)((uint)(select(((uint)_145 < (uint)170000), _145, 0)) + 0u))]._ratio) * (min(max((1.0f - saturate(exp2(log2(sqrt(dot(float3(_103, _106, _105), float3(_103, _106, _105))) - (WaveReadLaneFirst(BindlessParameters_PostProcessZone[((int)((uint)(select(((uint)_118 < (uint)170000), _118, 0)) + 0u))]._progress) * WaveReadLaneFirst(BindlessParameters_PostProcessZone[((int)((uint)(select(((uint)_109 < (uint)170000), _109, 0)) + 0u))]._radius))) * WaveReadLaneFirst(BindlessParameters_PostProcessZone[((int)((uint)(select(((uint)_129 < (uint)170000), _129, 0)) + 0u))]._edgeSmoothness)))), 0.0f), 1.0f) + -1.0f)) + 1.0f) * 10000.0f;
  float _178 = _177 * exp2(log2(max(0.0f, (_165 + -0.8359375f)) / (18.8515625f - (_165 * 18.6875f))) * 6.277394771575928f);
  float _179 = _177 * exp2(log2(max(0.0f, (_26 + -0.8359375f)) / (18.8515625f - (_26 * 18.6875f))) * 6.277394771575928f);
  float _180 = _177 * exp2(log2(max(0.0f, (_27 + -0.8359375f)) / (18.8515625f - (_27 * 18.6875f))) * 6.277394771575928f);
  uint _181 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _188 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_181), 0));
    _194 = (float((uint)((uint)(_188.x & 127))) + 0.5f);
  } else {
    _194 = 1.0f;
  }
  bool _197 = (_localToneMappingParams.w > 0.0f);
  if (_197) {
    float3 output_color = TonemapReplacer(float3(_178, _179, _180));
    _549 = output_color.x;
    _550 = output_color.y;
    _551 = output_color.z;
  } else {
    _549 = _178;
    _550 = _179;
    _551 = _180;
  }
  if (_etcParams.y > 1.0f) {
    float _557 = abs(_47);
    float _558 = abs(_48 + -1.0f);
    float _562 = saturate(1.0f - (dot(float2(_557, _558), float2(_557, _558)) * saturate(_etcParams.y + -1.0f)));
    _567 = (_562 * _549);
    _568 = (_562 * _550);
    _569 = (_562 * _551);
  } else {
    _567 = _549;
    _568 = _550;
    _569 = _551;
  }
  if ((_197) && ((_etcParams.z > 0.0f))) {
    _599 = select((_567 <= 0.0031308000907301903f), (_567 * 12.920000076293945f), (((pow(_567, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _600 = select((_568 <= 0.0031308000907301903f), (_568 * 12.920000076293945f), (((pow(_568, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _601 = select((_569 <= 0.0031308000907301903f), (_569 * 12.920000076293945f), (((pow(_569, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _599 = _567;
    _600 = _568;
    _601 = _569;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _606 = float((uint)_181);
    if (!(_606 < _viewDir.w)) {
      if (!(_606 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _615 = _599;
        _616 = _600;
        _617 = _601;
      } else {
        _615 = 0.0f;
        _616 = 0.0f;
        _617 = 0.0f;
      }
    } else {
      _615 = 0.0f;
      _616 = 0.0f;
      _617 = 0.0f;
    }
  } else {
    _615 = _599;
    _616 = _600;
    _617 = _601;
  }
  float _627 = exp2(log2(_615 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _628 = exp2(log2(_616 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _629 = exp2(log2(_617 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_627 * 18.6875f) + 1.0f)) * ((_627 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_628 * 18.6875f) + 1.0f)) * ((_628 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_629 * 18.6875f) + 1.0f)) * ((_629 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _194;
  return SV_Target;
}