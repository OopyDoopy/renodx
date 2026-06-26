struct PostProcessCameraLensRainStruct {
  float _rainSpeed;
  float _rainUTiling;
  float _rainVTiling;
  float _streakUTiling;
  float _streakVTiling;
  uint _rainNormalTexture;
  uint _rainMaskTexture;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t69, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t32, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t33, space36);

Texture2D<float4> __3__36__0__0__g_CustomRenderPassDepth : register(t80, space36);

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

cbuffer __3__1__0__0__PostProcessSizeConstant : register(b1, space1) {
  float4 _srcTargetSizeAndInv : packoffset(c000.x);
  float4 _destTargetSizAndInv : packoffset(c001.x);
};

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

ConstantBuffer<PostProcessCameraLensRainStruct> BindlessParameters_PostProcessCameraLensRain[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

static const float _global_0[5] = { 0.05471208319067955f, 0.05641283839941025f, 0.05699142813682556f, 0.05641283839941025f, 0.05471208319067955f };

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  int __loop_jump_target = -1;
  float4 _23 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float4 _42 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(float((int)(int(_srcTargetSizeAndInv.x * TEXCOORD.x))) * _customRenderPassSizeInvSize.x), int(float((int)(int(_srcTargetSizeAndInv.y * TEXCOORD.y))) * _customRenderPassSizeInvSize.y), 0));
  float _47 = 1.0f - _42.x;
  float _49;
  float _50;
  float _51;
  int _52;
  float _54;
  float _55;
  float _56;
  int _57;
  float _160;
  float _365;
  float _366;
  float _367;
  float _460;
  float _461;
  float _462;
  float _516;
  float _517;
  float _518;
  float _537;
  float _538;
  float _539;
  float _569;
  float _570;
  float _571;
  float _585;
  float _586;
  float _587;
  _49 = 0.0f;
  _50 = 0.0f;
  _51 = 0.0f;
  _52 = -2;
  while(true) {
    _54 = _49;
    _55 = _50;
    _56 = _51;
    _57 = -2;
    while(true) {
      float _64 = (_global_0[(_52 + 2)]) * (_global_0[(_57 + 2)]);
      float4 _75 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((((_47 * _destTargetSizAndInv.z) * float((int)(_52))) + TEXCOORD.x), (((_47 * _destTargetSizAndInv.w) * float((int)(_57))) + TEXCOORD.y)));
      float _82 = (_75.x * _64) + _54;
      float _83 = (_75.y * _64) + _55;
      float _84 = (_75.z * _64) + _56;
      bool __defer_53_584 = false;
      if (!((_57 + 1) == 3)) {
        _54 = _82;
        _55 = _83;
        _56 = _84;
        _57 = (_57 + 1);
        continue;
      }
      if (__defer_53_584) {
        SV_Target.x = _585;
        SV_Target.y = _586;
        SV_Target.z = _587;
        SV_Target.w = _160;
      }
      bool __defer_87_584 = false;
      if (!((_52 + 1) == 3)) {
        _49 = _82;
        _50 = _83;
        _51 = _84;
        _52 = (_52 + 1);
        __loop_jump_target = 48;
        break;
      }
      if (__defer_87_584) {
        SV_Target.x = _585;
        SV_Target.y = _586;
        SV_Target.z = _587;
        SV_Target.w = _160;
      }
      int _101 = WaveReadLaneFirst(_materialIndex);
      int _111 = WaveReadLaneFirst(_materialIndex);
      int _121 = WaveReadLaneFirst(_materialIndex);
      int _129 = WaveReadLaneFirst(BindlessParameters_PostProcessCameraLensRain[((int)((uint)(select(((uint)_121 < (uint)170000), _121, 0)) + 0u))]._rainMaskTexture);
      float4 _136 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_129 < (uint)65000), _129, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((WaveReadLaneFirst(BindlessParameters_PostProcessCameraLensRain[((int)((uint)(select(((uint)_101 < (uint)170000), _101, 0)) + 0u))]._rainUTiling) * TEXCOORD.x), (WaveReadLaneFirst(BindlessParameters_PostProcessCameraLensRain[((int)((uint)(select(((uint)_111 < (uint)170000), _111, 0)) + 0u))]._rainVTiling) * TEXCOORD.y)));
      float _144 = (_136.y * ((_82 * 12.82451057434082f) - _23.x)) + _23.x;
      float _145 = (_136.y * ((_83 * 12.82451057434082f) - _23.y)) + _23.y;
      float _146 = (_136.y * ((_84 * 12.82451057434082f) - _23.z)) + _23.z;
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
        _516 = output_color.x;
        _517 = output_color.y;
        _518 = output_color.z;
      } else {
        _516 = _144;
        _517 = _145;
        _518 = _146;
      }
      if (_etcParams.y > 1.0f) {
        float _527 = abs((TEXCOORD.x * 2.0f) + -1.0f);
        float _528 = abs((TEXCOORD.y * 2.0f) + -1.0f);
        float _532 = saturate(1.0f - (dot(float2(_527, _528), float2(_527, _528)) * saturate(_etcParams.y + -1.0f)));
        _537 = (_532 * _516);
        _538 = (_532 * _517);
        _539 = (_532 * _518);
      } else {
        _537 = _516;
        _538 = _517;
        _539 = _518;
      }
      if ((_163) && ((_etcParams.z > 0.0f))) {
        _569 = select((_537 <= 0.0031308000907301903f), (_537 * 12.920000076293945f), (((pow(_537, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
        _570 = select((_538 <= 0.0031308000907301903f), (_538 * 12.920000076293945f), (((pow(_538, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
        _571 = select((_539 <= 0.0031308000907301903f), (_539 * 12.920000076293945f), (((pow(_539, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
      } else {
        _569 = _537;
        _570 = _538;
        _571 = _539;
      }
      if (!(!(_etcParams.y >= 1.0f))) {
        float _576 = float((uint)_147);
        if (!(_576 < _viewDir.w)) {
          if (!(_576 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
            _585 = _569;
            _586 = _570;
            _587 = _571;
          } else {
            _585 = 0.0f;
            _586 = 0.0f;
            _587 = 0.0f;
          }
        } else {
          _585 = 0.0f;
          _586 = 0.0f;
          _587 = 0.0f;
        }
      } else {
        _585 = _569;
        _586 = _570;
        _587 = _571;
      }
      SV_Target.x = _585;
      SV_Target.y = _586;
      SV_Target.z = _587;
      SV_Target.w = _160;
      break;
    }
    if (__loop_jump_target == 48) {
      __loop_jump_target = -1;
      continue;
    }
    if (__loop_jump_target != -1) {
      break;
    }
    break;
  }
  return SV_Target;
}