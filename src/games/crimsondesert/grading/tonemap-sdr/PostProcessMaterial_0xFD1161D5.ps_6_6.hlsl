Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t69, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t32, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t33, space36);

Texture2D<uint> __3__36__0__0__g_CustomRenderPassValue : register(t79, space36);

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

#if 0 // Provided by tonemap.hlsli
cbuffer __3__35__0__0__ColorBlindConstantBuffer : register(b46, space35) {
  float4 _colorBlind0 : packoffset(c000.x);
  float4 _colorBlind1 : packoffset(c001.x);
  float4 _colorBlind2 : packoffset(c002.x);
};
#endif

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

static const float _global_0[13] = { 0.007210421375930309f, 0.007223543245345354f, 0.007234297227114439f, 0.007242672611027956f, 0.007248660083860159f, 0.007252255454659462f, 0.007253454532474279f, 0.007252255454659462f, 0.007248660083860159f, 0.007242672611027956f, 0.007234297227114439f, 0.007223543245345354f, 0.007210421375930309f };

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  int __loop_jump_target = -1;
  float4 _19 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _26 = (pow(_19.y, 0.012683313339948654f));
  float _27 = (pow(_19.z, 0.012683313339948654f));
  float _44 = exp2(log2(max(0.0f, (_26 + -0.8359375f)) / (18.8515625f - (_26 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _52 = float((int)(int(_bufferSizeAndInvSize.x * TEXCOORD.x)));
  float _53 = float((int)(int(_bufferSizeAndInvSize.y * TEXCOORD.y)));
  float4 _62 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_52 * _customRenderPassSizeInvSize.x), int(_53 * _customRenderPassSizeInvSize.y), 0));
  float _67 = 1.0f - _62.x;
  float _69;
  float _70;
  float _71;
  int _72;
  float _74;
  float _75;
  float _76;
  int _77;
  float _171;
  float _376;
  float _377;
  float _378;
  float _471;
  float _472;
  float _473;
  float _527;
  float _528;
  float _529;
  float _548;
  float _549;
  float _550;
  float _580;
  float _581;
  float _582;
  float _596;
  float _597;
  float _598;
  _69 = 0.0f;
  _70 = 0.0f;
  _71 = 0.0f;
  _72 = -6;
  while(true) {
    _74 = _69;
    _75 = _70;
    _76 = _71;
    _77 = -6;
    while(true) {
      float _84 = (_global_0[(_72 + 6)]) * (_global_0[(_77 + 6)]);
      float4 _95 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((((_67 * _srcTargetSizeAndInv.z) * float((int)(_72))) + TEXCOORD.x), (((_67 * _srcTargetSizeAndInv.w) * float((int)(_77))) + TEXCOORD.y)));
      float _102 = (_95.x * _84) + _74;
      float _103 = (_95.y * _84) + _75;
      float _104 = (_95.z * _84) + _76;
      bool __defer_73_595 = false;
      if (!((_77 + 1) == 7)) {
        _74 = _102;
        _75 = _103;
        _76 = _104;
        _77 = (_77 + 1);
        continue;
      }
      if (__defer_73_595) {
        float _608 = exp2(log2(_596 * 9.999999747378752e-05f) * 0.1593017578125f);
        float _609 = exp2(log2(_597 * 9.999999747378752e-05f) * 0.1593017578125f);
        float _610 = exp2(log2(_598 * 9.999999747378752e-05f) * 0.1593017578125f);
        SV_Target.x = exp2(log2((1.0f / ((_608 * 18.6875f) + 1.0f)) * ((_608 * 18.8515625f) + 0.8359375f)) * 78.84375f);
        SV_Target.y = exp2(log2((1.0f / ((_609 * 18.6875f) + 1.0f)) * ((_609 * 18.8515625f) + 0.8359375f)) * 78.84375f);
        SV_Target.z = exp2(log2((1.0f / ((_610 * 18.6875f) + 1.0f)) * ((_610 * 18.8515625f) + 0.8359375f)) * 78.84375f);
        SV_Target.w = _171;
      }
      bool __defer_107_595 = false;
      if (!((_72 + 1) == 7)) {
        _69 = _102;
        _70 = _103;
        _71 = _104;
        _72 = (_72 + 1);
        __loop_jump_target = 68;
        break;
      }
      if (__defer_107_595) {
        float _608 = exp2(log2(_596 * 9.999999747378752e-05f) * 0.1593017578125f);
        float _609 = exp2(log2(_597 * 9.999999747378752e-05f) * 0.1593017578125f);
        float _610 = exp2(log2(_598 * 9.999999747378752e-05f) * 0.1593017578125f);
        SV_Target.x = exp2(log2((1.0f / ((_608 * 18.6875f) + 1.0f)) * ((_608 * 18.8515625f) + 0.8359375f)) * 78.84375f);
        SV_Target.y = exp2(log2((1.0f / ((_609 * 18.6875f) + 1.0f)) * ((_609 * 18.8515625f) + 0.8359375f)) * 78.84375f);
        SV_Target.z = exp2(log2((1.0f / ((_610 * 18.6875f) + 1.0f)) * ((_610 * 18.8515625f) + 0.8359375f)) * 78.84375f);
        SV_Target.w = _171;
      }
      float _118 = (pow(_19.x, 0.012683313339948654f));
      float _127 = exp2(log2(max(0.0f, (_118 + -0.8359375f)) / (18.8515625f - (_118 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
      float _128 = exp2(log2(max(0.0f, (_27 + -0.8359375f)) / (18.8515625f - (_27 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
      int2 _133; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_133.x, _133.y);
      uint _148 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_133.x))))) + 0.5f) * _52), int((float((int)(int(float((int)(_133.y))))) + 0.5f) * _53), 0));
      bool _151 = ((_148.x & 255) != 30);
      float _155 = select(_151, ((_102 * 56493.91015625f) + _127), _127);
      float _156 = select(_151, ((_103 * 56493.91015625f) + _44), _44);
      float _157 = select(_151, ((_104 * 56493.91015625f) + _128), _128);
      uint _158 = uint(SV_Position.y);
      if (_etcParams.y == 1.0f) {
        uint2 _165 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_158), 0));
        _171 = (float((uint)((uint)(_165.x & 127))) + 0.5f);
      } else {
        _171 = 1.0f;
      }
      bool _174 = (_localToneMappingParams.w > 0.0f);
      if (_174) {
        float3 output_color = TonemapReplacer(float3(_155, _156, _157));
        _527 = output_color.x;
        _528 = output_color.y;
        _529 = output_color.z;
      } else {
        _527 = _155;
        _528 = _156;
        _529 = _157;
      }
      if (_etcParams.y > 1.0f) {
        float _538 = abs((TEXCOORD.x * 2.0f) + -1.0f);
        float _539 = abs((TEXCOORD.y * 2.0f) + -1.0f);
        float _543 = saturate(1.0f - (dot(float2(_538, _539), float2(_538, _539)) * saturate(_etcParams.y + -1.0f)));
        _548 = (_543 * _527);
        _549 = (_543 * _528);
        _550 = (_543 * _529);
      } else {
        _548 = _527;
        _549 = _528;
        _550 = _529;
      }
      if ((_174) && ((_etcParams.z > 0.0f))) {
        _580 = select((_548 <= 0.0031308000907301903f), (_548 * 12.920000076293945f), (((pow(_548, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
        _581 = select((_549 <= 0.0031308000907301903f), (_549 * 12.920000076293945f), (((pow(_549, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
        _582 = select((_550 <= 0.0031308000907301903f), (_550 * 12.920000076293945f), (((pow(_550, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
      } else {
        _580 = _548;
        _581 = _549;
        _582 = _550;
      }
      if (!(!(_etcParams.y >= 1.0f))) {
        float _587 = float((uint)_158);
        if (!(_587 < _viewDir.w)) {
          if (!(_587 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
            _596 = _580;
            _597 = _581;
            _598 = _582;
          } else {
            _596 = 0.0f;
            _597 = 0.0f;
            _598 = 0.0f;
          }
        } else {
          _596 = 0.0f;
          _597 = 0.0f;
          _598 = 0.0f;
        }
      } else {
        _596 = _580;
        _597 = _581;
        _598 = _582;
      }
      float _608 = exp2(log2(_596 * 9.999999747378752e-05f) * 0.1593017578125f);
      float _609 = exp2(log2(_597 * 9.999999747378752e-05f) * 0.1593017578125f);
      float _610 = exp2(log2(_598 * 9.999999747378752e-05f) * 0.1593017578125f);
      SV_Target.x = exp2(log2((1.0f / ((_608 * 18.6875f) + 1.0f)) * ((_608 * 18.8515625f) + 0.8359375f)) * 78.84375f);
      SV_Target.y = exp2(log2((1.0f / ((_609 * 18.6875f) + 1.0f)) * ((_609 * 18.8515625f) + 0.8359375f)) * 78.84375f);
      SV_Target.z = exp2(log2((1.0f / ((_610 * 18.6875f) + 1.0f)) * ((_610 * 18.8515625f) + 0.8359375f)) * 78.84375f);
      SV_Target.w = _171;
      break;
    }
    if (__loop_jump_target == 68) {
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