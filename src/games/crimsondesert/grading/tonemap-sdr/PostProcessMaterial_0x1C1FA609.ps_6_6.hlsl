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
  float _160;
  float _364;
  float _365;
  float _366;
  float _459;
  float _460;
  float _461;
  float _515;
  float _516;
  float _517;
  float _533;
  float _534;
  float _535;
  float _565;
  float _566;
  float _567;
  float _581;
  float _582;
  float _583;
  float _143 = saturate((WaveReadLaneFirst(BindlessParameters_PostProcessZone[((int)((uint)(select(((uint)_123 < (uint)170000), _123, 0)) + 0u))]._ratio) * (min(max((1.0f - saturate(exp2(log2(sqrt(dot(float3(_81, _84, _83), float3(_81, _84, _83))) - (WaveReadLaneFirst(BindlessParameters_PostProcessZone[((int)((uint)(select(((uint)_96 < (uint)170000), _96, 0)) + 0u))]._progress) * WaveReadLaneFirst(BindlessParameters_PostProcessZone[((int)((uint)(select(((uint)_87 < (uint)170000), _87, 0)) + 0u))]._radius))) * WaveReadLaneFirst(BindlessParameters_PostProcessZone[((int)((uint)(select(((uint)_107 < (uint)170000), _107, 0)) + 0u))]._edgeSmoothness)))), 0.0f), 1.0f) + -1.0f)) + 1.0f);
  float _144 = _143 * _19.x;
  float _145 = _143 * _19.y;
  float _146 = _143 * _19.z;
  uint _147 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _154 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_147), 0));
    _160 = (float((uint)((uint)(_154.x & 127))) + 0.5f);
  } else {
    _160 = 1.0f;
  }
  bool _163 = (_localToneMappingParams.w > 0.0f);
  if (_163) {
    float3 output_color = TonemapReplacer(float3(_144, _145, _146));
    _515 = output_color.x;
    _516 = output_color.y;
    _517 = output_color.z;
  } else {
    _515 = _144;
    _516 = _145;
    _517 = _146;
  }
  if (_etcParams.y > 1.0f) {
    float _523 = abs(_25);
    float _524 = abs(_26 + -1.0f);
    float _528 = saturate(1.0f - (dot(float2(_523, _524), float2(_523, _524)) * saturate(_etcParams.y + -1.0f)));
    _533 = (_528 * _515);
    _534 = (_528 * _516);
    _535 = (_528 * _517);
  } else {
    _533 = _515;
    _534 = _516;
    _535 = _517;
  }
  if ((_163) && ((_etcParams.z > 0.0f))) {
    _565 = select((_533 <= 0.0031308000907301903f), (_533 * 12.920000076293945f), (((pow(_533, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _566 = select((_534 <= 0.0031308000907301903f), (_534 * 12.920000076293945f), (((pow(_534, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _567 = select((_535 <= 0.0031308000907301903f), (_535 * 12.920000076293945f), (((pow(_535, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _565 = _533;
    _566 = _534;
    _567 = _535;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _572 = float((uint)_147);
    if (!(_572 < _viewDir.w)) {
      if (!(_572 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _581 = _565;
        _582 = _566;
        _583 = _567;
      } else {
        _581 = 0.0f;
        _582 = 0.0f;
        _583 = 0.0f;
      }
    } else {
      _581 = 0.0f;
      _582 = 0.0f;
      _583 = 0.0f;
    }
  } else {
    _581 = _565;
    _582 = _566;
    _583 = _567;
  }
  SV_Target.x = _581;
  SV_Target.y = _582;
  SV_Target.z = _583;
  SV_Target.w = _160;
  return SV_Target;
}