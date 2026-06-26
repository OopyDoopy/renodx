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
  float _59 = (pow(_48.x, 0.012683313339948654f));
  float _60 = (pow(_48.y, 0.012683313339948654f));
  float _61 = (pow(_48.z, 0.012683313339948654f));
  float4 _91 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _101 = (pow(_91.x, 0.012683313339948654f));
  float _102 = (pow(_91.y, 0.012683313339948654f));
  float _103 = (pow(_91.z, 0.012683313339948654f));
  float _134 = 10000.0f - (saturate(exp2(log2(1.0f - saturate((_viewPos.y - _38) / (WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterGlid_CD[((int)((uint)(select(((uint)_21 < (uint)170000), _21, 0)) + 0u))]._startYPos) - _38))) * 2.200000047683716f) * 7.0f) * 9950.0f);
  float _135 = _134 * exp2(log2(max(0.0f, (_101 + -0.8359375f)) / (18.8515625f - (_101 * 18.6875f))) * 6.277394771575928f);
  float _136 = _134 * exp2(log2(max(0.0f, (_102 + -0.8359375f)) / (18.8515625f - (_102 * 18.6875f))) * 6.277394771575928f);
  float _137 = _134 * exp2(log2(max(0.0f, (_103 + -0.8359375f)) / (18.8515625f - (_103 * 18.6875f))) * 6.277394771575928f);
  float _144 = (((exp2(log2(max(0.0f, (_59 + -0.8359375f)) / (18.8515625f - (_59 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _135) * _48.w) + _135;
  float _145 = (((exp2(log2(max(0.0f, (_60 + -0.8359375f)) / (18.8515625f - (_60 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _136) * _48.w) + _136;
  float _146 = (((exp2(log2(max(0.0f, (_61 + -0.8359375f)) / (18.8515625f - (_61 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _137) * _48.w) + _137;
  uint _147 = uint(SV_Position.y);
  float _161;
  float _366;
  float _367;
  float _368;
  float _461;
  float _462;
  float _463;
  float _517;
  float _518;
  float _519;
  float _538;
  float _539;
  float _540;
  float _570;
  float _571;
  float _572;
  float _586;
  float _587;
  float _588;
  if (_etcParams.y == 1.0f) {
    uint2 _155 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_147), 0));
    _161 = (float((uint)((uint)(_155.x & 127))) + 0.5f);
  } else {
    _161 = 1.0f;
  }
  bool _164 = (_localToneMappingParams.w > 0.0f);
  if (_164) {
    float3 output_color = TonemapReplacer(float3(_144, _145, _146));
    _517 = output_color.x;
    _518 = output_color.y;
    _519 = output_color.z;
  } else {
    _517 = _144;
    _518 = _145;
    _519 = _146;
  }
  if (_etcParams.y > 1.0f) {
    float _528 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _529 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _533 = saturate(1.0f - (dot(float2(_528, _529), float2(_528, _529)) * saturate(_etcParams.y + -1.0f)));
    _538 = (_533 * _517);
    _539 = (_533 * _518);
    _540 = (_533 * _519);
  } else {
    _538 = _517;
    _539 = _518;
    _540 = _519;
  }
  if ((_164) && ((_etcParams.z > 0.0f))) {
    _570 = select((_538 <= 0.0031308000907301903f), (_538 * 12.920000076293945f), (((pow(_538, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _571 = select((_539 <= 0.0031308000907301903f), (_539 * 12.920000076293945f), (((pow(_539, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _572 = select((_540 <= 0.0031308000907301903f), (_540 * 12.920000076293945f), (((pow(_540, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _570 = _538;
    _571 = _539;
    _572 = _540;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _577 = float((uint)_147);
    if (!(_577 < _viewDir.w)) {
      if (!(_577 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _586 = _570;
        _587 = _571;
        _588 = _572;
      } else {
        _586 = 0.0f;
        _587 = 0.0f;
        _588 = 0.0f;
      }
    } else {
      _586 = 0.0f;
      _587 = 0.0f;
      _588 = 0.0f;
    }
  } else {
    _586 = _570;
    _587 = _571;
    _588 = _572;
  }
  float _598 = exp2(log2(_586 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _599 = exp2(log2(_587 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _600 = exp2(log2(_588 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_598 * 18.6875f) + 1.0f)) * ((_598 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_599 * 18.6875f) + 1.0f)) * ((_599 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_600 * 18.6875f) + 1.0f)) * ((_600 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _161;
  return SV_Target;
}