#include "../tonemap.hlsli"

Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t44, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t33, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t38, space36);

Texture2D<uint> __3__36__0__0__g_CustomRenderPassValue : register(t65, space36);

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

SamplerState __3__40__0__0__g_sampler : register(s1, space40);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

static const float _global_0[13] = { 0.007210421375930309f, 0.007223543245345354f, 0.007234297227114439f, 0.007242672611027956f, 0.007248660083860159f, 0.007252255454659462f, 0.007253454532474279f, 0.007252255454659462f, 0.007248660083860159f, 0.007242672611027956f, 0.007234297227114439f, 0.007223543245345354f, 0.007210421375930309f };

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  int __loop_jump_target = -1;
  float _17[36];
  float4 _20 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _29 = float((int)(int(_bufferSizeAndInvSize.x * TEXCOORD.x)));
  float _30 = float((int)(int(_bufferSizeAndInvSize.y * TEXCOORD.y)));
  float4 _39 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_29 * _customRenderPassSizeInvSize.x), int(_30 * _customRenderPassSizeInvSize.y), 0));
  float _44 = 1.0f - _39.x;
  float _46;
  float _47;
  float _48;
  int _49;
  float _51;
  float _52;
  float _53;
  int _54;
  float _135;
  float _381;
  float _382;
  float _383;
  float _503;
  float _504;
  float _505;
  float _526;
  float _527;
  float _528;
  float _561;
  float _562;
  float _563;
  float _577;
  float _578;
  float _579;
  _46 = 0.0f;
  _47 = 0.0f;
  _48 = 0.0f;
  _49 = -6;
  while(true) {
    _51 = _46;
    _52 = _47;
    _53 = _48;
    _54 = -6;
    while(true) {
      float _61 = (_global_0[(_49 + 6)]) * (_global_0[(_54 + 6)]);
      float4 _72 = __3__36__0__0__g_postProcessSizeColor.Sample(__3__40__0__0__g_sampler, float2((((_44 * _srcTargetSizeAndInv.z) * float((int)(_49))) + TEXCOORD.x), (((_44 * _srcTargetSizeAndInv.w) * float((int)(_54))) + TEXCOORD.y)));
      float _79 = (_72.x * _61) + _51;
      float _80 = (_72.y * _61) + _52;
      float _81 = (_72.z * _61) + _53;
      bool __defer_50_576 = false;
      if (!((_54 + 1) == 7)) {
        _51 = _79;
        _52 = _80;
        _53 = _81;
        _54 = (_54 + 1);
        continue;
      }
      if (__defer_50_576) {
        SV_Target.x = _577;
        SV_Target.y = _578;
        SV_Target.z = _579;
        SV_Target.w = _135;
      }
      bool __defer_84_576 = false;
      if (!((_49 + 1) == 7)) {
        _46 = _79;
        _47 = _80;
        _48 = _81;
        _49 = (_49 + 1);
        __loop_jump_target = 45;
        break;
      }
      if (__defer_84_576) {
        SV_Target.x = _577;
        SV_Target.y = _578;
        SV_Target.z = _579;
        SV_Target.w = _135;
      }
      int2 _97; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_97.x, _97.y);
      uint _112 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_97.x))))) + 0.5f) * _29), int((float((int)(int(float((int)(_97.y))))) + 0.5f) * _30), 0));
      bool _115 = ((_112.x & 255) != 30);
      float _119 = select(_115, ((_79 * 56493.91015625f) + _20.x), _20.x);
      float _120 = select(_115, ((_80 * 56493.91015625f) + _20.y), _20.y);
      float _121 = select(_115, ((_81 * 56493.91015625f) + _20.z), _20.z);
      uint _122 = uint(SV_Position.y);
      if (_etcParams.y == 1.0f) {
        uint2 _129 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_122), 0));
        _135 = (float((uint)((uint)(_129.x & 127))) + 0.5f);
      } else {
        _135 = 1.0f;
      }
      if (_localToneMappingParams.w > 0.0f) {
        float3 output_color = TonemapReplacer(float3(_119, _120, _121));
        _503 = output_color.x;
        _504 = output_color.y;
        _505 = output_color.z;
      } else {
        _503 = _119;
        _504 = _120;
        _505 = _121;
      }
      if (_etcParams.y > 1.0f) {
        float _516 = abs((TEXCOORD.x * 2.0f) + -1.0f);
        float _517 = abs((TEXCOORD.y * 2.0f) + -1.0f);
        float _521 = saturate(1.0f - (dot(float2(_516, _517), float2(_516, _517)) * saturate(_etcParams.y + -1.0f)));
        _526 = (_521 * _503);
        _527 = (_521 * _504);
        _528 = (_521 * _505);
      } else {
        _526 = _503;
        _527 = _504;
        _528 = _505;
      }
      if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
        _561 = select((_526 <= 0.0031308000907301903f), (_526 * 12.920000076293945f), (((pow(_526, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
        _562 = select((_527 <= 0.0031308000907301903f), (_527 * 12.920000076293945f), (((pow(_527, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
        _563 = select((_528 <= 0.0031308000907301903f), (_528 * 12.920000076293945f), (((pow(_528, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
      } else {
        _561 = _526;
        _562 = _527;
        _563 = _528;
      }
      if (!(!(_etcParams.y >= 1.0f))) {
        float _568 = float((uint)_122);
        if (!(_568 < _viewDir.w)) {
          if (!(_568 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
            _577 = _561;
            _578 = _562;
            _579 = _563;
          } else {
            _577 = 0.0f;
            _578 = 0.0f;
            _579 = 0.0f;
          }
        } else {
          _577 = 0.0f;
          _578 = 0.0f;
          _579 = 0.0f;
        }
      } else {
        _577 = _561;
        _578 = _562;
        _579 = _563;
      }
      SV_Target.x = _577;
      SV_Target.y = _578;
      SV_Target.z = _579;
      SV_Target.w = _135;
      break;
    }
    if (__loop_jump_target == 45) {
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

