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
  float _27 = (pow(_20.y, 0.012683313339948654f));
  float _28 = (pow(_20.z, 0.012683313339948654f));
  float _45 = exp2(log2(max(0.0f, (_27 + -0.8359375f)) / (18.8515625f - (_27 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _53 = float((int)(int(_bufferSizeAndInvSize.x * TEXCOORD.x)));
  float _54 = float((int)(int(_bufferSizeAndInvSize.y * TEXCOORD.y)));
  float4 _63 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_53 * _customRenderPassSizeInvSize.x), int(_54 * _customRenderPassSizeInvSize.y), 0));
  float _68 = 1.0f - _63.x;
  float _70;
  float _71;
  float _72;
  int _73;
  float _75;
  float _76;
  float _77;
  int _78;
  float _171;
  float _417;
  float _418;
  float _419;
  float _539;
  float _540;
  float _541;
  float _562;
  float _563;
  float _564;
  float _597;
  float _598;
  float _599;
  float _613;
  float _614;
  float _615;
  _70 = 0.0f;
  _71 = 0.0f;
  _72 = 0.0f;
  _73 = -6;
  while(true) {
    _75 = _70;
    _76 = _71;
    _77 = _72;
    _78 = -6;
    while(true) {
      float _85 = (_global_0[(_73 + 6)]) * (_global_0[(_78 + 6)]);
      float4 _96 = __3__36__0__0__g_postProcessSizeColor.Sample(__3__40__0__0__g_sampler, float2((((_68 * _srcTargetSizeAndInv.z) * float((int)(_73))) + TEXCOORD.x), (((_68 * _srcTargetSizeAndInv.w) * float((int)(_78))) + TEXCOORD.y)));
      float _103 = (_96.x * _85) + _75;
      float _104 = (_96.y * _85) + _76;
      float _105 = (_96.z * _85) + _77;
      bool __defer_74_612 = false;
      if (!((_78 + 1) == 7)) {
        _75 = _103;
        _76 = _104;
        _77 = _105;
        _78 = (_78 + 1);
        continue;
      }
      if (__defer_74_612) {
        float _625 = exp2(log2(_613 * 9.999999747378752e-05f) * 0.1593017578125f);
        float _626 = exp2(log2(_614 * 9.999999747378752e-05f) * 0.1593017578125f);
        float _627 = exp2(log2(_615 * 9.999999747378752e-05f) * 0.1593017578125f);
        SV_Target.x = exp2(log2((1.0f / ((_625 * 18.6875f) + 1.0f)) * ((_625 * 18.8515625f) + 0.8359375f)) * 78.84375f);
        SV_Target.y = exp2(log2((1.0f / ((_626 * 18.6875f) + 1.0f)) * ((_626 * 18.8515625f) + 0.8359375f)) * 78.84375f);
        SV_Target.z = exp2(log2((1.0f / ((_627 * 18.6875f) + 1.0f)) * ((_627 * 18.8515625f) + 0.8359375f)) * 78.84375f);
        SV_Target.w = _171;
      }
      bool __defer_108_612 = false;
      if (!((_73 + 1) == 7)) {
        _70 = _103;
        _71 = _104;
        _72 = _105;
        _73 = (_73 + 1);
        __loop_jump_target = 69;
        break;
      }
      if (__defer_108_612) {
        float _625 = exp2(log2(_613 * 9.999999747378752e-05f) * 0.1593017578125f);
        float _626 = exp2(log2(_614 * 9.999999747378752e-05f) * 0.1593017578125f);
        float _627 = exp2(log2(_615 * 9.999999747378752e-05f) * 0.1593017578125f);
        SV_Target.x = exp2(log2((1.0f / ((_625 * 18.6875f) + 1.0f)) * ((_625 * 18.8515625f) + 0.8359375f)) * 78.84375f);
        SV_Target.y = exp2(log2((1.0f / ((_626 * 18.6875f) + 1.0f)) * ((_626 * 18.8515625f) + 0.8359375f)) * 78.84375f);
        SV_Target.z = exp2(log2((1.0f / ((_627 * 18.6875f) + 1.0f)) * ((_627 * 18.8515625f) + 0.8359375f)) * 78.84375f);
        SV_Target.w = _171;
      }
      float _118 = (pow(_20.x, 0.012683313339948654f));
      float _127 = exp2(log2(max(0.0f, (_118 + -0.8359375f)) / (18.8515625f - (_118 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
      float _128 = exp2(log2(max(0.0f, (_28 + -0.8359375f)) / (18.8515625f - (_28 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
      int2 _133; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_133.x, _133.y);
      uint _148 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_133.x))))) + 0.5f) * _53), int((float((int)(int(float((int)(_133.y))))) + 0.5f) * _54), 0));
      bool _151 = ((_148.x & 255) != 30);
      float _155 = select(_151, ((_103 * 56493.91015625f) + _127), _127);
      float _156 = select(_151, ((_104 * 56493.91015625f) + _45), _45);
      float _157 = select(_151, ((_105 * 56493.91015625f) + _128), _128);
      uint _158 = uint(SV_Position.y);
      if (_etcParams.y == 1.0f) {
        uint2 _165 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_158), 0));
        _171 = (float((uint)((uint)(_165.x & 127))) + 0.5f);
      } else {
        _171 = 1.0f;
      }
      if (_localToneMappingParams.w > 0.0f) {
        float3 output_color = TonemapReplacer(float3(_155, _156, _157));
        _539 = output_color.x;
        _540 = output_color.y;
        _541 = output_color.z;
      } else {
        _539 = _155;
        _540 = _156;
        _541 = _157;
      }
      if (_etcParams.y > 1.0f) {
        float _552 = abs((TEXCOORD.x * 2.0f) + -1.0f);
        float _553 = abs((TEXCOORD.y * 2.0f) + -1.0f);
        float _557 = saturate(1.0f - (dot(float2(_552, _553), float2(_552, _553)) * saturate(_etcParams.y + -1.0f)));
        _562 = (_557 * _539);
        _563 = (_557 * _540);
        _564 = (_557 * _541);
      } else {
        _562 = _539;
        _563 = _540;
        _564 = _541;
      }
      if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
        _597 = select((_562 <= 0.0031308000907301903f), (_562 * 12.920000076293945f), (((pow(_562, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
        _598 = select((_563 <= 0.0031308000907301903f), (_563 * 12.920000076293945f), (((pow(_563, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
        _599 = select((_564 <= 0.0031308000907301903f), (_564 * 12.920000076293945f), (((pow(_564, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
      } else {
        _597 = _562;
        _598 = _563;
        _599 = _564;
      }
      if (!(!(_etcParams.y >= 1.0f))) {
        float _604 = float((uint)_158);
        if (!(_604 < _viewDir.w)) {
          if (!(_604 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
            _613 = _597;
            _614 = _598;
            _615 = _599;
          } else {
            _613 = 0.0f;
            _614 = 0.0f;
            _615 = 0.0f;
          }
        } else {
          _613 = 0.0f;
          _614 = 0.0f;
          _615 = 0.0f;
        }
      } else {
        _613 = _597;
        _614 = _598;
        _615 = _599;
      }
      float _625 = exp2(log2(_613 * 9.999999747378752e-05f) * 0.1593017578125f);
      float _626 = exp2(log2(_614 * 9.999999747378752e-05f) * 0.1593017578125f);
      float _627 = exp2(log2(_615 * 9.999999747378752e-05f) * 0.1593017578125f);
      SV_Target.x = exp2(log2((1.0f / ((_625 * 18.6875f) + 1.0f)) * ((_625 * 18.8515625f) + 0.8359375f)) * 78.84375f);
      SV_Target.y = exp2(log2((1.0f / ((_626 * 18.6875f) + 1.0f)) * ((_626 * 18.8515625f) + 0.8359375f)) * 78.84375f);
      SV_Target.z = exp2(log2((1.0f / ((_627 * 18.6875f) + 1.0f)) * ((_627 * 18.8515625f) + 0.8359375f)) * 78.84375f);
      SV_Target.w = _171;
      break;
    }
    if (__loop_jump_target == 69) {
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

