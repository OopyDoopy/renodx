struct PostProcessFlashbackStruct {
  float _blendingRatio;
  float _flickeringIntensity;
  float _contrastRatio;
  float _depthFadingContrast;
  float _depthFadingDistance;
  float _vignetteRatio;
  float _vignetteWidth;
  float _vignetteShape;
  float _lensDirtIntensity;
  float _lensDirtTexScale;
  uint _lensDirtTex;
};


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

ConstantBuffer<PostProcessFlashbackStruct> BindlessParameters_PostProcessFlashback[] : register(b0, space100);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  int _18 = WaveReadLaneFirst(_materialIndex);
  float _27 = saturate(WaveReadLaneFirst(BindlessParameters_PostProcessFlashback[((int)((uint)(select(((uint)_18 < (uint)170000), _18, 0)) + 0u))]._blendingRatio));
  int _28 = WaveReadLaneFirst(_materialIndex);
  float _37 = saturate(WaveReadLaneFirst(BindlessParameters_PostProcessFlashback[((int)((uint)(select(((uint)_28 < (uint)170000), _28, 0)) + 0u))]._flickeringIntensity));
  int _38 = WaveReadLaneFirst(_materialIndex);
  float _47 = saturate(WaveReadLaneFirst(BindlessParameters_PostProcessFlashback[((int)((uint)(select(((uint)_38 < (uint)170000), _38, 0)) + 0u))]._vignetteRatio));
  int _48 = WaveReadLaneFirst(_materialIndex);
  float _57 = saturate(WaveReadLaneFirst(BindlessParameters_PostProcessFlashback[((int)((uint)(select(((uint)_48 < (uint)170000), _48, 0)) + 0u))]._lensDirtIntensity));
  float _134;
  float _177;
  float _207;
  float _208;
  float _209;
  float _223;
  float _428;
  float _429;
  float _430;
  float _523;
  float _524;
  float _525;
  float _579;
  float _580;
  float _581;
  float _600;
  float _601;
  float _602;
  float _632;
  float _633;
  float _634;
  float _648;
  float _649;
  float _650;
  if (!(((((((_27 < 9.999999747378752e-05f)) && ((_37 < 9.999999747378752e-05f)))) && ((_47 < 9.999999747378752e-05f)))) && ((_57 < 9.999999747378752e-05f)))) {
    [branch]
    if (!(!(_37 >= 0.0010000000474974513f))) {
      float _77 = (frac(sin(dot(float2(floor(_time.x * 0.3700000047683716f), 41.0f), float2(127.0999984741211f, 311.70001220703125f))) * 437.5450134277344f) + 3.0f) * _time.x;
      float _78 = floor(_77);
      float _80 = frac(_77);
      float _88 = frac(sin(dot(float2(53.0f, _78), float2(127.0999984741211f, 311.70001220703125f))) * 437.5450134277344f);
      float _97 = (((((_80 * _80) * (3.0f - (_80 * 2.0f))) * (frac(sin(dot(float2(53.0f, (_78 + 1.0f)), float2(127.0999984741211f, 311.70001220703125f))) * 437.5450134277344f) - _88)) + _88) * 3.1700000762939453f) + _77;
      float _98 = floor(_97);
      float _100 = frac(_97);
      float _108 = frac(sin(dot(float2(97.0f, _98), float2(127.0999984741211f, 311.70001220703125f))) * 437.5450134277344f);
      float _119 = TEXCOORD.x + -0.5f;
      float _120 = TEXCOORD.y + -0.5f;
      float _127 = saturate((sqrt((_120 * _120) + (_119 * _119)) + -0.07500000298023224f) * 2.0f);
      _134 = (((_127 * _127) * saturate(((_108 + -0.30000001192092896f) + (((_100 * _100) * (3.0f - (_100 * 2.0f))) * (frac(sin(dot(float2(97.0f, (_98 + 1.0f)), float2(127.0999984741211f, 311.70001220703125f))) * 437.5450134277344f) - _108))) * 1.4285714626312256f)) * (3.0f - (_127 * 2.0f)));
    } else {
      _134 = 0.0f;
    }
    [branch]
    if (!(!(_47 >= 0.0010000000474974513f))) {
      int _137 = WaveReadLaneFirst(_materialIndex);
      int _147 = WaveReadLaneFirst(_materialIndex);
      float _165 = (5.0f - ((WaveReadLaneFirst(BindlessParameters_PostProcessFlashback[((int)((uint)(select(((uint)_147 < (uint)170000), _147, 0)) + 0u))]._vignetteWidth) + 4.0f) * _27)) * 0.5f;
      float _168 = max((abs(TEXCOORD.x + -0.5f) - _165), 0.0f);
      float _169 = max((abs((TEXCOORD.y + -0.5f) / max(9.999999747378752e-05f, (WaveReadLaneFirst(BindlessParameters_PostProcessFlashback[((int)((uint)(select(((uint)_137 < (uint)170000), _137, 0)) + 0u))]._vignetteShape) * 3.1415927410125732f))) - _165), 0.0f);
      _177 = saturate(sqrt((_169 * _169) + (_168 * _168)) * 0.5f);
    } else {
      _177 = 0.0f;
    }
    [branch]
    if (!(!(_57 >= 9.999999747378752e-05f))) {
      float _187 = saturate(1.0f / max(0.0010000000474974513f, abs(_exposure0.x)));
      float _194 = -0.25f - (_187 * 0.25f);
      float _197 = max((abs(TEXCOORD.x + -0.5f) - _194), 0.0f);
      float _198 = max((abs((TEXCOORD.y + -0.5f) * 1.5303359031677246f) - _194), 0.0f);
      float _204 = saturate(sqrt((_198 * _198) + (_197 * _197)) / ((_187 * 0.7000000476837158f) + 1.2999999523162842f));
      _207 = _134;
      _208 = _177;
      _209 = (_204 * _204);
    } else {
      _207 = _134;
      _208 = _177;
      _209 = 0.0f;
    }
  } else {
    _207 = 0.0f;
    _208 = 0.0f;
    _209 = 0.0f;
  }
  uint _210 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _217 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_210), 0));
    _223 = (float((uint)((uint)(_217.x & 127))) + 0.5f);
  } else {
    _223 = 1.0f;
  }
  bool _226 = (_localToneMappingParams.w > 0.0f);
  if (_226) {
    float3 output_color = TonemapReplacer(float3(_207, _208, _209));
    _579 = output_color.x;
    _580 = output_color.y;
    _581 = output_color.z;
  } else {
    _579 = _207;
    _580 = _208;
    _581 = _209;
  }
  if (_etcParams.y > 1.0f) {
    float _590 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _591 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _595 = saturate(1.0f - (dot(float2(_590, _591), float2(_590, _591)) * saturate(_etcParams.y + -1.0f)));
    _600 = (_595 * _579);
    _601 = (_595 * _580);
    _602 = (_595 * _581);
  } else {
    _600 = _579;
    _601 = _580;
    _602 = _581;
  }
  if ((_226) && ((_etcParams.z > 0.0f))) {
    _632 = select((_600 <= 0.0031308000907301903f), (_600 * 12.920000076293945f), (((pow(_600, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _633 = select((_601 <= 0.0031308000907301903f), (_601 * 12.920000076293945f), (((pow(_601, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _634 = select((_602 <= 0.0031308000907301903f), (_602 * 12.920000076293945f), (((pow(_602, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _632 = _600;
    _633 = _601;
    _634 = _602;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _639 = float((uint)_210);
    if (!(_639 < _viewDir.w)) {
      if (!(_639 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _648 = _632;
        _649 = _633;
        _650 = _634;
      } else {
        _648 = 0.0f;
        _649 = 0.0f;
        _650 = 0.0f;
      }
    } else {
      _648 = 0.0f;
      _649 = 0.0f;
      _650 = 0.0f;
    }
  } else {
    _648 = _632;
    _649 = _633;
    _650 = _634;
  }
  SV_Target.x = _648;
  SV_Target.y = _649;
  SV_Target.z = _650;
  SV_Target.w = _223;
  return SV_Target;
}