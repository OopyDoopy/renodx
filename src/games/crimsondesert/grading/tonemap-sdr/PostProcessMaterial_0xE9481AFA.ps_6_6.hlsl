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


Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t69, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t32, space36);

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

ConstantBuffer<PostProcessAbyssEnterGlid_CDStruct> BindlessParameters_PostProcessAbyssEnterGlid_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  int _21 = WaveReadLaneFirst(_materialIndex);
  int _30 = WaveReadLaneFirst(_materialIndex);
  float _38 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterGlid_CD[((int)((uint)(select(((uint)_30 < (uint)170000), _30, 0)) + 0u))]._endYPos);
  float4 _48 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
  float4 _55 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _65 = 1.0f - (saturate(exp2(log2(1.0f - saturate((_viewPos.y - _38) / (WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterGlid_CD[((int)((uint)(select(((uint)_21 < (uint)170000), _21, 0)) + 0u))]._startYPos) - _38))) * 2.200000047683716f) * 7.0f) * 0.9950000047683716f);
  float _66 = _65 * _55.x;
  float _67 = _65 * _55.y;
  float _68 = _65 * _55.z;
  float _75 = ((_48.x - _66) * _48.w) + _66;
  float _76 = ((_48.y - _67) * _48.w) + _67;
  float _77 = ((_48.z - _68) * _48.w) + _68;
  uint _78 = uint(SV_Position.y);
  float _92;
  float _297;
  float _298;
  float _299;
  float _392;
  float _393;
  float _394;
  float _448;
  float _449;
  float _450;
  float _469;
  float _470;
  float _471;
  float _501;
  float _502;
  float _503;
  float _517;
  float _518;
  float _519;
  if (_etcParams.y == 1.0f) {
    uint2 _86 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_78), 0));
    _92 = (float((uint)((uint)(_86.x & 127))) + 0.5f);
  } else {
    _92 = 1.0f;
  }
  bool _95 = (_localToneMappingParams.w > 0.0f);
  if (_95) {
    float3 output_color = TonemapReplacer(float3(_75, _76, _77));
    _448 = output_color.x;
    _449 = output_color.y;
    _450 = output_color.z;
  } else {
    _448 = _75;
    _449 = _76;
    _450 = _77;
  }
  if (_etcParams.y > 1.0f) {
    float _459 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _460 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _464 = saturate(1.0f - (dot(float2(_459, _460), float2(_459, _460)) * saturate(_etcParams.y + -1.0f)));
    _469 = (_464 * _448);
    _470 = (_464 * _449);
    _471 = (_464 * _450);
  } else {
    _469 = _448;
    _470 = _449;
    _471 = _450;
  }
  if ((_95) && ((_etcParams.z > 0.0f))) {
    _501 = select((_469 <= 0.0031308000907301903f), (_469 * 12.920000076293945f), (((pow(_469, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _502 = select((_470 <= 0.0031308000907301903f), (_470 * 12.920000076293945f), (((pow(_470, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _503 = select((_471 <= 0.0031308000907301903f), (_471 * 12.920000076293945f), (((pow(_471, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _501 = _469;
    _502 = _470;
    _503 = _471;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _508 = float((uint)_78);
    if (!(_508 < _viewDir.w)) {
      if (!(_508 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _517 = _501;
        _518 = _502;
        _519 = _503;
      } else {
        _517 = 0.0f;
        _518 = 0.0f;
        _519 = 0.0f;
      }
    } else {
      _517 = 0.0f;
      _518 = 0.0f;
      _519 = 0.0f;
    }
  } else {
    _517 = _501;
    _518 = _502;
    _519 = _503;
  }
  SV_Target.x = _517;
  SV_Target.y = _518;
  SV_Target.z = _519;
  SV_Target.w = _92;
  return SV_Target;
}