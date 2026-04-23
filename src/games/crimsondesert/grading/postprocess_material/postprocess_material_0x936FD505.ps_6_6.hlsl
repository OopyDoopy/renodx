#include "../tonemap.hlsli"

struct PostProcessAbyssEnterGlid_CDStruct {
  float _startYPos;
  float _endYPos;
  float _cubeScale;
  float _cameraSpeed;
  float _cameraSinIntensity;
  float3 _screenFadeColor;
  float _screenFadeRatio;
  float3 _fogColor;
  float3 _ambientColor;
  float3 _globalColor;
  float3 _lightColor;
  float3 _centerGlowColor;
  float _centerGlowRadius;
  float _stardustIntensity;
  float _particleIntensity;
  float _particleEmissionWidth;
  float _anamorphicIntensity;
  float _anamorphicWidth;
  float _largeHalo;
  float _largeHaloIntensity;
  float _middleHaloIntensity;
  float _blubIntensity;
  float _streakGlowIntensity;
  float _centerpoint;
  float _tunnelTotal;
  float _cameraFov;
  float _cubeDistance;
  uint _screenWarpTex;
  float _screenWarpRatio;
};


Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t44, space36);

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

ConstantBuffer<PostProcessAbyssEnterGlid_CDStruct> BindlessParameters_PostProcessAbyssEnterGlid_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _17[36];
  int _20 = WaveReadLaneFirst(_materialIndex);
  int _29 = WaveReadLaneFirst(_materialIndex);
  float _37 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterGlid_CD[((int)((uint)(select(((uint)_29 < (uint)170000), _29, 0)) + 0u))]._endYPos);
  float4 _47 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
  float4 _54 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _64 = 1.0f - (saturate(exp2(log2(1.0f - saturate((_viewPos.y - _37) / (WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterGlid_CD[((int)((uint)(select(((uint)_20 < (uint)170000), _20, 0)) + 0u))]._startYPos) - _37))) * 2.200000047683716f) * 7.0f) * 0.9950000047683716f);
  float _65 = _64 * _54.x;
  float _66 = _64 * _54.y;
  float _67 = _64 * _54.z;
  float _74 = ((_47.x - _65) * _47.w) + _65;
  float _75 = ((_47.y - _66) * _47.w) + _66;
  float _76 = ((_47.z - _67) * _47.w) + _67;
  uint _77 = uint(SV_Position.y);
  float _91;
  float _337;
  float _338;
  float _339;
  float _459;
  float _460;
  float _461;
  float _482;
  float _483;
  float _484;
  float _517;
  float _518;
  float _519;
  float _533;
  float _534;
  float _535;
  if (_etcParams.y == 1.0f) {
    uint2 _85 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_77), 0));
    _91 = (float((uint)((uint)(_85.x & 127))) + 0.5f);
  } else {
    _91 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_74, _75, _76));
    _459 = output_color.x;
    _460 = output_color.y;
    _461 = output_color.z;
  } else {
    _459 = _74;
    _460 = _75;
    _461 = _76;
  }
  if (_etcParams.y > 1.0f) {
    float _472 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _473 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _477 = saturate(1.0f - (dot(float2(_472, _473), float2(_472, _473)) * saturate(_etcParams.y + -1.0f)));
    _482 = (_477 * _459);
    _483 = (_477 * _460);
    _484 = (_477 * _461);
  } else {
    _482 = _459;
    _483 = _460;
    _484 = _461;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _517 = select((_482 <= 0.0031308000907301903f), (_482 * 12.920000076293945f), (((pow(_482, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _518 = select((_483 <= 0.0031308000907301903f), (_483 * 12.920000076293945f), (((pow(_483, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _519 = select((_484 <= 0.0031308000907301903f), (_484 * 12.920000076293945f), (((pow(_484, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _517 = _482;
    _518 = _483;
    _519 = _484;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _524 = float((uint)_77);
    if (!(_524 < _viewDir.w)) {
      if (!(_524 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _533 = _517;
        _534 = _518;
        _535 = _519;
      } else {
        _533 = 0.0f;
        _534 = 0.0f;
        _535 = 0.0f;
      }
    } else {
      _533 = 0.0f;
      _534 = 0.0f;
      _535 = 0.0f;
    }
  } else {
    _533 = _517;
    _534 = _518;
    _535 = _519;
  }
  SV_Target.x = _533;
  SV_Target.y = _534;
  SV_Target.z = _535;
  SV_Target.w = _91;
  return SV_Target;
}

