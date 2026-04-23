#include "../tonemap.hlsli"

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

Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t44, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t33, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t38, space36);

Texture2D<float4> __3__36__0__0__g_CustomRenderPassDepth : register(t66, space36);

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

cbuffer __3__1__0__0__PostProcessSizeConstant : register(b1, space1) {
  float4 _srcTargetSizeAndInv : packoffset(c000.x);
  float4 _destTargetSizAndInv : packoffset(c001.x);
};

cbuffer __3__1__0__0__PostProcessMaterialIndex : register(b2, space1) {
  int _materialIndex : packoffset(c000.x);
  int _passIndex : packoffset(c000.y);
};

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
  float _19[36];
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
  float _159;
  float _405;
  float _406;
  float _407;
  float _527;
  float _528;
  float _529;
  float _550;
  float _551;
  float _552;
  float _585;
  float _586;
  float _587;
  float _601;
  float _602;
  float _603;
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
      bool __defer_53_600 = false;
      if (!((_57 + 1) == 3)) {
        _54 = _82;
        _55 = _83;
        _56 = _84;
        _57 = (_57 + 1);
        continue;
      }
      if (__defer_53_600) {
        SV_Target.x = _601;
        SV_Target.y = _602;
        SV_Target.z = _603;
        SV_Target.w = _159;
      }
      bool __defer_87_600 = false;
      if (!((_52 + 1) == 3)) {
        _49 = _82;
        _50 = _83;
        _51 = _84;
        _52 = (_52 + 1);
        __loop_jump_target = 48;
        break;
      }
      if (__defer_87_600) {
        SV_Target.x = _601;
        SV_Target.y = _602;
        SV_Target.z = _603;
        SV_Target.w = _159;
      }
      int _100 = WaveReadLaneFirst(_materialIndex);
      int _110 = WaveReadLaneFirst(_materialIndex);
      int _120 = WaveReadLaneFirst(_materialIndex);
      int _128 = WaveReadLaneFirst(BindlessParameters_PostProcessCameraLensRain[((int)((uint)(select(((uint)_120 < (uint)170000), _120, 0)) + 0u))]._rainMaskTexture);
      float4 _135 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_128 < (uint)65000), _128, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((WaveReadLaneFirst(BindlessParameters_PostProcessCameraLensRain[((int)((uint)(select(((uint)_100 < (uint)170000), _100, 0)) + 0u))]._rainUTiling) * TEXCOORD.x), (WaveReadLaneFirst(BindlessParameters_PostProcessCameraLensRain[((int)((uint)(select(((uint)_110 < (uint)170000), _110, 0)) + 0u))]._rainVTiling) * TEXCOORD.y)));
      float _143 = (_135.y * ((_82 * 12.82451057434082f) - _23.x)) + _23.x;
      float _144 = (_135.y * ((_83 * 12.82451057434082f) - _23.y)) + _23.y;
      float _145 = (_135.y * ((_84 * 12.82451057434082f) - _23.z)) + _23.z;
      uint _146 = uint(SV_Position.y);
      if (_etcParams.y == 1.0f) {
        uint2 _153 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_146), 0));
        _159 = (float((uint)((uint)(_153.x & 127))) + 0.5f);
      } else {
        _159 = 1.0f;
      }
      if (_localToneMappingParams.w > 0.0f) {
        float3 output_color = TonemapReplacer(float3(_143, _144, _145));
        _527 = output_color.x;
        _528 = output_color.y;
        _529 = output_color.z;
      } else {
        _527 = _143;
        _528 = _144;
        _529 = _145;
      }
      if (_etcParams.y > 1.0f) {
        float _540 = abs((TEXCOORD.x * 2.0f) + -1.0f);
        float _541 = abs((TEXCOORD.y * 2.0f) + -1.0f);
        float _545 = saturate(1.0f - (dot(float2(_540, _541), float2(_540, _541)) * saturate(_etcParams.y + -1.0f)));
        _550 = (_545 * _527);
        _551 = (_545 * _528);
        _552 = (_545 * _529);
      } else {
        _550 = _527;
        _551 = _528;
        _552 = _529;
      }
      if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
        _585 = select((_550 <= 0.0031308000907301903f), (_550 * 12.920000076293945f), (((pow(_550, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
        _586 = select((_551 <= 0.0031308000907301903f), (_551 * 12.920000076293945f), (((pow(_551, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
        _587 = select((_552 <= 0.0031308000907301903f), (_552 * 12.920000076293945f), (((pow(_552, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
      } else {
        _585 = _550;
        _586 = _551;
        _587 = _552;
      }
      if (!(!(_etcParams.y >= 1.0f))) {
        float _592 = float((uint)_146);
        if (!(_592 < _viewDir.w)) {
          if (!(_592 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
            _601 = _585;
            _602 = _586;
            _603 = _587;
          } else {
            _601 = 0.0f;
            _602 = 0.0f;
            _603 = 0.0f;
          }
        } else {
          _601 = 0.0f;
          _602 = 0.0f;
          _603 = 0.0f;
        }
      } else {
        _601 = _585;
        _602 = _586;
        _603 = _587;
      }
      SV_Target.x = _601;
      SV_Target.y = _602;
      SV_Target.z = _603;
      SV_Target.w = _159;
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

