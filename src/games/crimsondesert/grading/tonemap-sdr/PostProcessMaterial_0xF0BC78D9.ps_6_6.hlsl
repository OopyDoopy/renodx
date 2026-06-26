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
  float _30 = (pow(_23.y, 0.012683313339948654f));
  float _31 = (pow(_23.z, 0.012683313339948654f));
  float _48 = exp2(log2(max(0.0f, (_30 + -0.8359375f)) / (18.8515625f - (_30 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float4 _66 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(float((int)(int(_srcTargetSizeAndInv.x * TEXCOORD.x))) * _customRenderPassSizeInvSize.x), int(float((int)(int(_srcTargetSizeAndInv.y * TEXCOORD.y))) * _customRenderPassSizeInvSize.y), 0));
  float _71 = 1.0f - _66.x;
  float _73;
  float _74;
  float _75;
  int _76;
  float _78;
  float _79;
  float _80;
  int _81;
  float _196;
  float _401;
  float _402;
  float _403;
  float _496;
  float _497;
  float _498;
  float _552;
  float _553;
  float _554;
  float _573;
  float _574;
  float _575;
  float _605;
  float _606;
  float _607;
  float _621;
  float _622;
  float _623;
  _73 = 0.0f;
  _74 = 0.0f;
  _75 = 0.0f;
  _76 = -2;
  while(true) {
    _78 = _73;
    _79 = _74;
    _80 = _75;
    _81 = -2;
    while(true) {
      float _88 = (_global_0[(_76 + 2)]) * (_global_0[(_81 + 2)]);
      float4 _99 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((((_71 * _destTargetSizAndInv.z) * float((int)(_76))) + TEXCOORD.x), (((_71 * _destTargetSizAndInv.w) * float((int)(_81))) + TEXCOORD.y)));
      float _106 = (_99.x * _88) + _78;
      float _107 = (_99.y * _88) + _79;
      float _108 = (_99.z * _88) + _80;
      bool __defer_77_620 = false;
      if (!((_81 + 1) == 3)) {
        _78 = _106;
        _79 = _107;
        _80 = _108;
        _81 = (_81 + 1);
        continue;
      }
      if (__defer_77_620) {
        float _633 = exp2(log2(_621 * 9.999999747378752e-05f) * 0.1593017578125f);
        float _634 = exp2(log2(_622 * 9.999999747378752e-05f) * 0.1593017578125f);
        float _635 = exp2(log2(_623 * 9.999999747378752e-05f) * 0.1593017578125f);
        SV_Target.x = exp2(log2((1.0f / ((_633 * 18.6875f) + 1.0f)) * ((_633 * 18.8515625f) + 0.8359375f)) * 78.84375f);
        SV_Target.y = exp2(log2((1.0f / ((_634 * 18.6875f) + 1.0f)) * ((_634 * 18.8515625f) + 0.8359375f)) * 78.84375f);
        SV_Target.z = exp2(log2((1.0f / ((_635 * 18.6875f) + 1.0f)) * ((_635 * 18.8515625f) + 0.8359375f)) * 78.84375f);
        SV_Target.w = _196;
      }
      bool __defer_111_620 = false;
      if (!((_76 + 1) == 3)) {
        _73 = _106;
        _74 = _107;
        _75 = _108;
        _76 = (_76 + 1);
        __loop_jump_target = 72;
        break;
      }
      if (__defer_111_620) {
        float _633 = exp2(log2(_621 * 9.999999747378752e-05f) * 0.1593017578125f);
        float _634 = exp2(log2(_622 * 9.999999747378752e-05f) * 0.1593017578125f);
        float _635 = exp2(log2(_623 * 9.999999747378752e-05f) * 0.1593017578125f);
        SV_Target.x = exp2(log2((1.0f / ((_633 * 18.6875f) + 1.0f)) * ((_633 * 18.8515625f) + 0.8359375f)) * 78.84375f);
        SV_Target.y = exp2(log2((1.0f / ((_634 * 18.6875f) + 1.0f)) * ((_634 * 18.8515625f) + 0.8359375f)) * 78.84375f);
        SV_Target.z = exp2(log2((1.0f / ((_635 * 18.6875f) + 1.0f)) * ((_635 * 18.8515625f) + 0.8359375f)) * 78.84375f);
        SV_Target.w = _196;
      }
      float _123 = (pow(_23.x, 0.012683313339948654f));
      float _132 = exp2(log2(max(0.0f, (_123 + -0.8359375f)) / (18.8515625f - (_123 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
      float _133 = exp2(log2(max(0.0f, (_31 + -0.8359375f)) / (18.8515625f - (_31 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
      int _137 = WaveReadLaneFirst(_materialIndex);
      int _147 = WaveReadLaneFirst(_materialIndex);
      int _157 = WaveReadLaneFirst(_materialIndex);
      int _165 = WaveReadLaneFirst(BindlessParameters_PostProcessCameraLensRain[((int)((uint)(select(((uint)_157 < (uint)170000), _157, 0)) + 0u))]._rainMaskTexture);
      float4 _172 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_165 < (uint)65000), _165, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((WaveReadLaneFirst(BindlessParameters_PostProcessCameraLensRain[((int)((uint)(select(((uint)_137 < (uint)170000), _137, 0)) + 0u))]._rainUTiling) * TEXCOORD.x), (WaveReadLaneFirst(BindlessParameters_PostProcessCameraLensRain[((int)((uint)(select(((uint)_147 < (uint)170000), _147, 0)) + 0u))]._rainVTiling) * TEXCOORD.y)));
      float _180 = (_172.y * ((_106 * 12.82451057434082f) - _132)) + _132;
      float _181 = (_172.y * ((_107 * 12.82451057434082f) - _48)) + _48;
      float _182 = (_172.y * ((_108 * 12.82451057434082f) - _133)) + _133;
      uint _183 = uint(SV_Position.y);
      if (_etcParams.y == 1.0f) {
        uint2 _190 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_183), 0));
        _196 = (float((uint)((uint)(_190.x & 127))) + 0.5f);
      } else {
        _196 = 1.0f;
      }
      bool _199 = (_localToneMappingParams.w > 0.0f);
      if (_199) {
        float3 output_color = TonemapReplacer(float3(_180, _181, _182));
        _552 = output_color.x;
        _553 = output_color.y;
        _554 = output_color.z;
      } else {
        _552 = _180;
        _553 = _181;
        _554 = _182;
      }
      if (_etcParams.y > 1.0f) {
        float _563 = abs((TEXCOORD.x * 2.0f) + -1.0f);
        float _564 = abs((TEXCOORD.y * 2.0f) + -1.0f);
        float _568 = saturate(1.0f - (dot(float2(_563, _564), float2(_563, _564)) * saturate(_etcParams.y + -1.0f)));
        _573 = (_568 * _552);
        _574 = (_568 * _553);
        _575 = (_568 * _554);
      } else {
        _573 = _552;
        _574 = _553;
        _575 = _554;
      }
      if ((_199) && ((_etcParams.z > 0.0f))) {
        _605 = select((_573 <= 0.0031308000907301903f), (_573 * 12.920000076293945f), (((pow(_573, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
        _606 = select((_574 <= 0.0031308000907301903f), (_574 * 12.920000076293945f), (((pow(_574, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
        _607 = select((_575 <= 0.0031308000907301903f), (_575 * 12.920000076293945f), (((pow(_575, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
      } else {
        _605 = _573;
        _606 = _574;
        _607 = _575;
      }
      if (!(!(_etcParams.y >= 1.0f))) {
        float _612 = float((uint)_183);
        if (!(_612 < _viewDir.w)) {
          if (!(_612 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
            _621 = _605;
            _622 = _606;
            _623 = _607;
          } else {
            _621 = 0.0f;
            _622 = 0.0f;
            _623 = 0.0f;
          }
        } else {
          _621 = 0.0f;
          _622 = 0.0f;
          _623 = 0.0f;
        }
      } else {
        _621 = _605;
        _622 = _606;
        _623 = _607;
      }
      float _633 = exp2(log2(_621 * 9.999999747378752e-05f) * 0.1593017578125f);
      float _634 = exp2(log2(_622 * 9.999999747378752e-05f) * 0.1593017578125f);
      float _635 = exp2(log2(_623 * 9.999999747378752e-05f) * 0.1593017578125f);
      SV_Target.x = exp2(log2((1.0f / ((_633 * 18.6875f) + 1.0f)) * ((_633 * 18.8515625f) + 0.8359375f)) * 78.84375f);
      SV_Target.y = exp2(log2((1.0f / ((_634 * 18.6875f) + 1.0f)) * ((_634 * 18.8515625f) + 0.8359375f)) * 78.84375f);
      SV_Target.z = exp2(log2((1.0f / ((_635 * 18.6875f) + 1.0f)) * ((_635 * 18.8515625f) + 0.8359375f)) * 78.84375f);
      SV_Target.w = _196;
      break;
    }
    if (__loop_jump_target == 72) {
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