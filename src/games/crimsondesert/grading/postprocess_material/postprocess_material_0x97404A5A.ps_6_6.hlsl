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
  float _35 = (pow(_25.x, 0.012683313339948654f));
  float _36 = (pow(_25.y, 0.012683313339948654f));
  float _37 = (pow(_25.z, 0.012683313339948654f));
  float _62 = exp2(log2(max(0.0f, (_35 + -0.8359375f)) / (18.8515625f - (_35 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _63 = exp2(log2(max(0.0f, (_36 + -0.8359375f)) / (18.8515625f - (_36 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _64 = exp2(log2(max(0.0f, (_37 + -0.8359375f)) / (18.8515625f - (_37 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _67 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _70 = (TEXCOORD.x * 2.0f) + -1.0f;
  float _71 = TEXCOORD.y * 2.0f;
  float _72 = 1.0f - _71;
  float _73 = max(1.0000000116860974e-07f, _67.x);
  float _101 = mad((_invViewProj[3].z), _73, mad((_invViewProj[3].y), _72, ((_invViewProj[3].x) * _70))) + (_invViewProj[3].w);
  float _102 = (mad((_invViewProj[0].z), _73, mad((_invViewProj[0].y), _72, ((_invViewProj[0].x) * _70))) + (_invViewProj[0].w)) / _101;
  float _103 = (mad((_invViewProj[2].z), _73, mad((_invViewProj[2].y), _72, ((_invViewProj[2].x) * _70))) + (_invViewProj[2].w)) / _101;
  float _104 = abs(_102);
  float _106 = frac(abs(_104));
  float _107 = abs(_103);
  float _109 = frac(abs(_107));
  int _110 = WaveReadLaneFirst(_materialIndex);
  float _120 = WaveReadLaneFirst(BindlessParameters_PostProcessHousing[((int)((uint)(select(((uint)_110 < (uint)170000), _110, 0)) + 0u))]._pivotPosition.x);
  float _122 = WaveReadLaneFirst(BindlessParameters_PostProcessHousing[((int)((uint)(select(((uint)_110 < (uint)170000), _110, 0)) + 0u))]._pivotPosition.z);
  int _123 = WaveReadLaneFirst(_materialIndex);
  float _169;
  float _170;
  float _171;
  float _185;
  float _431;
  float _432;
  float _433;
  float _553;
  float _554;
  float _555;
  float _573;
  float _574;
  float _575;
  float _608;
  float _609;
  float _610;
  float _624;
  float _625;
  float _626;
  if (((((_102 > (WaveReadLaneFirst(BindlessParameters_PostProcessHousing[((int)((uint)(select(((uint)_123 < (uint)170000), _123, 0)) + 0u))]._rectMinMax.x) + _120))) && ((_103 > (WaveReadLaneFirst(BindlessParameters_PostProcessHousing[((int)((uint)(select(((uint)_123 < (uint)170000), _123, 0)) + 0u))]._rectMinMax.y) + _122))))) && ((_102 < (WaveReadLaneFirst(BindlessParameters_PostProcessHousing[((int)((uint)(select(((uint)_123 < (uint)170000), _123, 0)) + 0u))]._rectMinMax.z) + _120)))) {
    bool _164 = ((_103 < (WaveReadLaneFirst(BindlessParameters_PostProcessHousing[((int)((uint)(select(((uint)_123 < (uint)170000), _123, 0)) + 0u))]._rectMinMax.w) + _122))) && ((((abs(1.0f - select((_107 >= (-0.0f - _107)), _109, (-0.0f - _109))) < 0.03125f)) || ((abs(1.0f - select((_104 >= (-0.0f - _104)), _106, (-0.0f - _106))) < 0.03125f))));
    _169 = select(_164, 256.0f, _62);
    _170 = select(_164, 256.0f, _63);
    _171 = select(_164, 256.0f, _64);
  } else {
    _169 = _62;
    _170 = _63;
    _171 = _64;
  }
  uint _172 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _179 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_172), 0));
    _185 = (float((uint)((uint)(_179.x & 127))) + 0.5f);
  } else {
    _185 = _postProcessParams.x;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_169, _170, _171));
    _553 = output_color.x;
    _554 = output_color.y;
    _555 = output_color.z;
  } else {
    _553 = _169;
    _554 = _170;
    _555 = _171;
  }
  if (_etcParams.y > 1.0f) {
    float _563 = abs(_70);
    float _564 = abs(_71 + -1.0f);
    float _568 = saturate(1.0f - (dot(float2(_563, _564), float2(_563, _564)) * saturate(_etcParams.y + -1.0f)));
    _573 = (_568 * _553);
    _574 = (_568 * _554);
    _575 = (_568 * _555);
  } else {
    _573 = _553;
    _574 = _554;
    _575 = _555;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _608 = select((_573 <= 0.0031308000907301903f), (_573 * 12.920000076293945f), (((pow(_573, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _609 = select((_574 <= 0.0031308000907301903f), (_574 * 12.920000076293945f), (((pow(_574, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _610 = select((_575 <= 0.0031308000907301903f), (_575 * 12.920000076293945f), (((pow(_575, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _608 = _573;
    _609 = _574;
    _610 = _575;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _615 = float((uint)_172);
    if (!(_615 < _viewDir.w)) {
      if (!(_615 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _624 = _608;
        _625 = _609;
        _626 = _610;
      } else {
        _624 = 0.0f;
        _625 = 0.0f;
        _626 = 0.0f;
      }
    } else {
      _624 = 0.0f;
      _625 = 0.0f;
      _626 = 0.0f;
    }
  } else {
    _624 = _608;
    _625 = _609;
    _626 = _610;
  }
  float _636 = exp2(log2(_624 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _637 = exp2(log2(_625 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _638 = exp2(log2(_626 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_636 * 18.6875f) + 1.0f)) * ((_636 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_637 * 18.6875f) + 1.0f)) * ((_637 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_638 * 18.6875f) + 1.0f)) * ((_638 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _185;
  return SV_Target;
}

