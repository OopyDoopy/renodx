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
  float _28 = float((int)(int(_bufferSizeAndInvSize.x * TEXCOORD.x)));
  float _29 = float((int)(int(_bufferSizeAndInvSize.y * TEXCOORD.y)));
  float4 _38 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_28 * _customRenderPassSizeInvSize.x), int(_29 * _customRenderPassSizeInvSize.y), 0));
  float _43 = 1.0f - _38.x;
  float _45;
  float _46;
  float _47;
  int _48;
  float _50;
  float _51;
  float _52;
  int _53;
  float _135;
  float _340;
  float _341;
  float _342;
  float _435;
  float _436;
  float _437;
  float _491;
  float _492;
  float _493;
  float _512;
  float _513;
  float _514;
  float _544;
  float _545;
  float _546;
  float _560;
  float _561;
  float _562;
  _45 = 0.0f;
  _46 = 0.0f;
  _47 = 0.0f;
  _48 = -6;
  while(true) {
    _50 = _45;
    _51 = _46;
    _52 = _47;
    _53 = -6;
    while(true) {
      float _60 = (_global_0[(_48 + 6)]) * (_global_0[(_53 + 6)]);
      float4 _71 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((((_43 * _srcTargetSizeAndInv.z) * float((int)(_48))) + TEXCOORD.x), (((_43 * _srcTargetSizeAndInv.w) * float((int)(_53))) + TEXCOORD.y)));
      float _78 = (_71.x * _60) + _50;
      float _79 = (_71.y * _60) + _51;
      float _80 = (_71.z * _60) + _52;
      bool __defer_49_559 = false;
      if (!((_53 + 1) == 7)) {
        _50 = _78;
        _51 = _79;
        _52 = _80;
        _53 = (_53 + 1);
        continue;
      }
      if (__defer_49_559) {
        SV_Target.x = _560;
        SV_Target.y = _561;
        SV_Target.z = _562;
        SV_Target.w = _135;
      }
      bool __defer_83_559 = false;
      if (!((_48 + 1) == 7)) {
        _45 = _78;
        _46 = _79;
        _47 = _80;
        _48 = (_48 + 1);
        __loop_jump_target = 44;
        break;
      }
      if (__defer_83_559) {
        SV_Target.x = _560;
        SV_Target.y = _561;
        SV_Target.z = _562;
        SV_Target.w = _135;
      }
      int2 _97; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_97.x, _97.y);
      uint _112 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_97.x))))) + 0.5f) * _28), int((float((int)(int(float((int)(_97.y))))) + 0.5f) * _29), 0));
      bool _115 = ((_112.x & 255) != 30);
      float _119 = select(_115, ((_78 * 56493.91015625f) + _19.x), _19.x);
      float _120 = select(_115, ((_79 * 56493.91015625f) + _19.y), _19.y);
      float _121 = select(_115, ((_80 * 56493.91015625f) + _19.z), _19.z);
      uint _122 = uint(SV_Position.y);
      if (_etcParams.y == 1.0f) {
        uint2 _129 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_122), 0));
        _135 = (float((uint)((uint)(_129.x & 127))) + 0.5f);
      } else {
        _135 = 1.0f;
      }
      bool _138 = (_localToneMappingParams.w > 0.0f);
      if (_138) {
        float3 output_color = TonemapReplacer(float3(_119, _120, _121));
        _491 = output_color.x;
        _492 = output_color.y;
        _493 = output_color.z;
      } else {
        _491 = _119;
        _492 = _120;
        _493 = _121;
      }
      if (_etcParams.y > 1.0f) {
        float _502 = abs((TEXCOORD.x * 2.0f) + -1.0f);
        float _503 = abs((TEXCOORD.y * 2.0f) + -1.0f);
        float _507 = saturate(1.0f - (dot(float2(_502, _503), float2(_502, _503)) * saturate(_etcParams.y + -1.0f)));
        _512 = (_507 * _491);
        _513 = (_507 * _492);
        _514 = (_507 * _493);
      } else {
        _512 = _491;
        _513 = _492;
        _514 = _493;
      }
      if ((_138) && ((_etcParams.z > 0.0f))) {
        _544 = select((_512 <= 0.0031308000907301903f), (_512 * 12.920000076293945f), (((pow(_512, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
        _545 = select((_513 <= 0.0031308000907301903f), (_513 * 12.920000076293945f), (((pow(_513, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
        _546 = select((_514 <= 0.0031308000907301903f), (_514 * 12.920000076293945f), (((pow(_514, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
      } else {
        _544 = _512;
        _545 = _513;
        _546 = _514;
      }
      if (!(!(_etcParams.y >= 1.0f))) {
        float _551 = float((uint)_122);
        if (!(_551 < _viewDir.w)) {
          if (!(_551 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
            _560 = _544;
            _561 = _545;
            _562 = _546;
          } else {
            _560 = 0.0f;
            _561 = 0.0f;
            _562 = 0.0f;
          }
        } else {
          _560 = 0.0f;
          _561 = 0.0f;
          _562 = 0.0f;
        }
      } else {
        _560 = _544;
        _561 = _545;
        _562 = _546;
      }
      SV_Target.x = _560;
      SV_Target.y = _561;
      SV_Target.z = _562;
      SV_Target.w = _135;
      break;
    }
    if (__loop_jump_target == 44) {
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