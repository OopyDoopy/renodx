struct PostProcessHousingStruct {
  float _ratio;
  float3 _pivotPosition;
  float4 _rectMinMax;
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

ConstantBuffer<PostProcessHousingStruct> BindlessParameters_PostProcessHousing[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float4 _26 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _32 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _35 = (TEXCOORD.x * 2.0f) + -1.0f;
  float _36 = TEXCOORD.y * 2.0f;
  float _37 = 1.0f - _36;
  float _38 = max(1.0000000116860974e-07f, _32.x);
  float _66 = mad((_invViewProj[3].z), _38, mad((_invViewProj[3].y), _37, ((_invViewProj[3].x) * _35))) + (_invViewProj[3].w);
  float _67 = (mad((_invViewProj[0].z), _38, mad((_invViewProj[0].y), _37, ((_invViewProj[0].x) * _35))) + (_invViewProj[0].w)) / _66;
  float _68 = (mad((_invViewProj[2].z), _38, mad((_invViewProj[2].y), _37, ((_invViewProj[2].x) * _35))) + (_invViewProj[2].w)) / _66;
  float _69 = abs(_67);
  float _71 = frac(abs(_69));
  float _72 = abs(_68);
  float _74 = frac(abs(_72));
  int _75 = WaveReadLaneFirst(_materialIndex);
  float _85 = WaveReadLaneFirst(BindlessParameters_PostProcessHousing[((int)((uint)(select(((uint)_75 < (uint)170000), _75, 0)) + 0u))]._pivotPosition.x);
  float _87 = WaveReadLaneFirst(BindlessParameters_PostProcessHousing[((int)((uint)(select(((uint)_75 < (uint)170000), _75, 0)) + 0u))]._pivotPosition.z);
  int _88 = WaveReadLaneFirst(_materialIndex);
  float _134;
  float _135;
  float _136;
  float _150;
  float _355;
  float _356;
  float _357;
  float _450;
  float _451;
  float _452;
  float _506;
  float _507;
  float _508;
  float _524;
  float _525;
  float _526;
  float _556;
  float _557;
  float _558;
  float _572;
  float _573;
  float _574;
  if (((((_67 > (WaveReadLaneFirst(BindlessParameters_PostProcessHousing[((int)((uint)(select(((uint)_88 < (uint)170000), _88, 0)) + 0u))]._rectMinMax.x) + _85))) && ((_68 > (WaveReadLaneFirst(BindlessParameters_PostProcessHousing[((int)((uint)(select(((uint)_88 < (uint)170000), _88, 0)) + 0u))]._rectMinMax.y) + _87))))) && ((_67 < (WaveReadLaneFirst(BindlessParameters_PostProcessHousing[((int)((uint)(select(((uint)_88 < (uint)170000), _88, 0)) + 0u))]._rectMinMax.z) + _85)))) {
    bool _129 = ((_68 < (WaveReadLaneFirst(BindlessParameters_PostProcessHousing[((int)((uint)(select(((uint)_88 < (uint)170000), _88, 0)) + 0u))]._rectMinMax.w) + _87))) && ((((abs(1.0f - select((_72 >= (-0.0f - _72)), _74, (-0.0f - _74))) < 0.03125f)) || ((abs(1.0f - select((_69 >= (-0.0f - _69)), _71, (-0.0f - _71))) < 0.03125f))));
    _134 = select(_129, 256.0f, _26.x);
    _135 = select(_129, 256.0f, _26.y);
    _136 = select(_129, 256.0f, _26.z);
  } else {
    _134 = _26.x;
    _135 = _26.y;
    _136 = _26.z;
  }
  uint _137 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _144 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_137), 0));
    _150 = (float((uint)((uint)(_144.x & 127))) + 0.5f);
  } else {
    _150 = _postProcessParams.x;
  }
  bool _153 = (_localToneMappingParams.w > 0.0f);
  if (_153) {
    float3 output_color = TonemapReplacer(float3(_134, _135, _136));
    _506 = output_color.x;
    _507 = output_color.y;
    _508 = output_color.z;
  } else {
    _506 = _134;
    _507 = _135;
    _508 = _136;
  }
  if (_etcParams.y > 1.0f) {
    float _514 = abs(_35);
    float _515 = abs(_36 + -1.0f);
    float _519 = saturate(1.0f - (dot(float2(_514, _515), float2(_514, _515)) * saturate(_etcParams.y + -1.0f)));
    _524 = (_519 * _506);
    _525 = (_519 * _507);
    _526 = (_519 * _508);
  } else {
    _524 = _506;
    _525 = _507;
    _526 = _508;
  }
  if ((_153) && ((_etcParams.z > 0.0f))) {
    _556 = select((_524 <= 0.0031308000907301903f), (_524 * 12.920000076293945f), (((pow(_524, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _557 = select((_525 <= 0.0031308000907301903f), (_525 * 12.920000076293945f), (((pow(_525, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _558 = select((_526 <= 0.0031308000907301903f), (_526 * 12.920000076293945f), (((pow(_526, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _556 = _524;
    _557 = _525;
    _558 = _526;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _563 = float((uint)_137);
    if (!(_563 < _viewDir.w)) {
      if (!(_563 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _572 = _556;
        _573 = _557;
        _574 = _558;
      } else {
        _572 = 0.0f;
        _573 = 0.0f;
        _574 = 0.0f;
      }
    } else {
      _572 = 0.0f;
      _573 = 0.0f;
      _574 = 0.0f;
    }
  } else {
    _572 = _556;
    _573 = _557;
    _574 = _558;
  }
  SV_Target.x = _572;
  SV_Target.y = _573;
  SV_Target.z = _574;
  SV_Target.w = _150;
  return SV_Target;
}