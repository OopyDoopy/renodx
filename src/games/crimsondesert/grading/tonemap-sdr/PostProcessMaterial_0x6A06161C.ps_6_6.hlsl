struct TemplatePostProcessStruct {
  float _parameter;
};


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

ConstantBuffer<TemplatePostProcessStruct> BindlessParameters_TemplatePostProcess[] : register(b0, space100);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  int _17 = WaveReadLaneFirst(_materialIndex);
  float _25 = WaveReadLaneFirst(BindlessParameters_TemplatePostProcess[((int)((uint)(select(((uint)_17 < (uint)170000), _17, 0)) + 0u))]._parameter);
  uint _30 = uint(SV_Position.y);
  float _44;
  float _236;
  float _237;
  float _238;
  float _331;
  float _332;
  float _333;
  float _387;
  float _388;
  float _389;
  float _408;
  float _409;
  float _410;
  float _440;
  float _441;
  float _442;
  float _456;
  float _457;
  float _458;
  if (_etcParams.y == 1.0f) {
    uint2 _38 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_30), 0));
    _44 = (float((uint)((uint)(_38.x & 127))) + 0.5f);
  } else {
    _44 = select(isnan(_postProcessParams.x), 0.0f, 1.0f);
  }
  bool _47 = (_localToneMappingParams.w > 0.0f);
  if (_47) {
    float3 output_color = TonemapReplacer(float3(_25, _25, _25));
    _387 = output_color.x;
    _388 = output_color.y;
    _389 = output_color.z;
  } else {
    _387 = _25;
    _388 = _25;
    _389 = _25;
  }
  if (_etcParams.y > 1.0f) {
    float _398 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _399 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _403 = saturate(1.0f - (dot(float2(_398, _399), float2(_398, _399)) * saturate(_etcParams.y + -1.0f)));
    _408 = (_403 * _387);
    _409 = (_403 * _388);
    _410 = (_403 * _389);
  } else {
    _408 = _387;
    _409 = _388;
    _410 = _389;
  }
  if ((_47) && ((_etcParams.z > 0.0f))) {
    _440 = select((_408 <= 0.0031308000907301903f), (_408 * 12.920000076293945f), (((pow(_408, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _441 = select((_409 <= 0.0031308000907301903f), (_409 * 12.920000076293945f), (((pow(_409, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _442 = select((_410 <= 0.0031308000907301903f), (_410 * 12.920000076293945f), (((pow(_410, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _440 = _408;
    _441 = _409;
    _442 = _410;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _447 = float((uint)_30);
    if (!(_447 < _viewDir.w)) {
      if (!(_447 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _456 = _440;
        _457 = _441;
        _458 = _442;
      } else {
        _456 = 0.0f;
        _457 = 0.0f;
        _458 = 0.0f;
      }
    } else {
      _456 = 0.0f;
      _457 = 0.0f;
      _458 = 0.0f;
    }
  } else {
    _456 = _440;
    _457 = _441;
    _458 = _442;
  }
  SV_Target.x = _456;
  SV_Target.y = _457;
  SV_Target.z = _458;
  SV_Target.w = _44;
  return SV_Target;
}