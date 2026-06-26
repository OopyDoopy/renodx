struct PostProcessActionStruct {
  float _contrast;
  float3 _saturation;
  float _gaussianBlurIntensity;
  float2 _gaussianBlurPosition;
  float _gaussianBlurClampInnerRadius;
  float _gaussianBlurClampHardness;
  float2 _radialBlurPosition;
  float _radialBlurIntensity;
  float _radialBlurClampInnerRadius;
  float _radialBlurClampHardness;
  float _borderRatio;
  float _borderWidth;
  float _borderSmoothness;
  float _borderEdgeNoiseRatio;
  float2 _borderEdgeNoiseOffset;
  float2 _borderEdgeNoiseTile;
  uint _borderColor;
  uint _borderEdgeNoiseTexture;
  float _borderFlickerSpeed;
  float _borderFlickerIntensity;
  float2 _borderFlickerOpacityMinMax;
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

ConstantBuffer<PostProcessActionStruct> BindlessParameters_PostProcessAction[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float4 _25 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _35 = (pow(_25.x, 0.012683313339948654f));
  float _36 = (pow(_25.y, 0.012683313339948654f));
  float _37 = (pow(_25.z, 0.012683313339948654f));
  float _62 = exp2(log2(max(0.0f, (_35 + -0.8359375f)) / (18.8515625f - (_35 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _63 = exp2(log2(max(0.0f, (_36 + -0.8359375f)) / (18.8515625f - (_36 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _64 = exp2(log2(max(0.0f, (_37 + -0.8359375f)) / (18.8515625f - (_37 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _68 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  int _69 = WaveReadLaneFirst(_materialIndex);
  int _78 = WaveReadLaneFirst(_materialIndex);
  int _87 = WaveReadLaneFirst(_materialIndex);
  bool _96 = (WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_69 < (uint)170000), _69, 0)) + 0u))]._gaussianBlurIntensity) > 0.0f);
  bool _97 = (WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_87 < (uint)170000), _87, 0)) + 0u))]._borderRatio) > 0.0f);
  float _144;
  float _145;
  float _146;
  float _147;
  float _193;
  float _194;
  float _195;
  float _323;
  float _324;
  float _325;
  float _326;
  float _327;
  float _328;
  int _329;
  float _382;
  float _383;
  float _384;
  float _508;
  float _509;
  float _510;
  float _524;
  float _729;
  float _730;
  float _731;
  float _824;
  float _825;
  float _826;
  float _880;
  float _881;
  float _882;
  float _901;
  float _902;
  float _903;
  float _933;
  float _934;
  float _935;
  float _949;
  float _950;
  float _951;
  if ((_96) || (_97)) {
    float4 _102 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    float _113 = (pow(_102.x, 0.012683313339948654f));
    float _114 = (pow(_102.y, 0.012683313339948654f));
    float _115 = (pow(_102.z, 0.012683313339948654f));
    _144 = (exp2(log2(max(0.0f, (_113 + -0.8359375f)) / (18.8515625f - (_113 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
    _145 = (exp2(log2(max(0.0f, (_114 + -0.8359375f)) / (18.8515625f - (_114 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
    _146 = (exp2(log2(max(0.0f, (_115 + -0.8359375f)) / (18.8515625f - (_115 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
    _147 = _102.w;
  } else {
    _144 = 0.0f;
    _145 = 0.0f;
    _146 = 0.0f;
    _147 = 0.0f;
  }
  if (_96) {
    int _149 = WaveReadLaneFirst(_materialIndex);
    int _158 = WaveReadLaneFirst(_materialIndex);
    float _170 = (TEXCOORD.x - WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_158 < (uint)170000), _158, 0)) + 0u))]._gaussianBlurPosition.x)) * _68;
    float _171 = TEXCOORD.y - WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_158 < (uint)170000), _158, 0)) + 0u))]._gaussianBlurPosition.y);
    float _182 = saturate((1.0f - ((1.0f / max(9.999999747378752e-06f, WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_78 < (uint)170000), _78, 0)) + 0u))]._gaussianBlurClampInnerRadius))) * sqrt(dot(float2(_170, _171), float2(_170, _171))))) * (1.0f / max((1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_149 < (uint)170000), _149, 0)) + 0u))]._gaussianBlurClampHardness)), 9.999999747378752e-06f)));
    _193 = ((_182 * (_62 - _144)) + _144);
    _194 = ((_182 * (_63 - _145)) + _145);
    _195 = ((_182 * (_64 - _146)) + _146);
  } else {
    _193 = _62;
    _194 = _63;
    _195 = _64;
  }
  int _201 = WaveReadLaneFirst(_materialIndex);
  float _209 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_201 < (uint)170000), _201, 0)) + 0u))]._radialBlurIntensity);
  if (_209 > 0.0f) {
    int _212 = WaveReadLaneFirst(_materialIndex);
    float _221 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_212 < (uint)170000), _212, 0)) + 0u))]._radialBlurPosition.x);
    float _222 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_212 < (uint)170000), _212, 0)) + 0u))]._radialBlurPosition.y);
    float _226 = (_srcTargetSizeAndInv.x * TEXCOORD.x) / _srcTargetSizeAndInv.x;
    float _227 = (_srcTargetSizeAndInv.y * TEXCOORD.y) / _srcTargetSizeAndInv.y;
    float4 _230 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_226, _227));
    float _240 = (pow(_230.x, 0.012683313339948654f));
    float _241 = (pow(_230.y, 0.012683313339948654f));
    float _242 = (pow(_230.z, 0.012683313339948654f));
    float _272 = 32.0f / _209;
    _323 = _226;
    _324 = _227;
    _325 = (exp2(log2(max(0.0f, (_240 + -0.8359375f)) / (18.8515625f - (_240 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
    _326 = (exp2(log2(max(0.0f, (_241 + -0.8359375f)) / (18.8515625f - (_241 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
    _327 = (exp2(log2(max(0.0f, (_242 + -0.8359375f)) / (18.8515625f - (_242 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
    _328 = 1.0f;
    _329 = 0;
    while(true) {
      float _330 = _323 + (((_221 - _226) / _272) * 0.10000000149011612f);
      float _331 = _324 + (((_222 - _227) / _272) * 0.10000000149011612f);
      float4 _334 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_330, _331));
      float _344 = (pow(_334.x, 0.012683313339948654f));
      float _345 = (pow(_334.y, 0.012683313339948654f));
      float _346 = (pow(_334.z, 0.012683313339948654f));
      float _371 = _328 * 9000.0f;
      float _375 = (exp2(log2(max(0.0f, (_344 + -0.8359375f)) / (18.8515625f - (_344 * 18.6875f))) * 6.277394771575928f) * _371) + _325;
      float _376 = (exp2(log2(max(0.0f, (_345 + -0.8359375f)) / (18.8515625f - (_345 * 18.6875f))) * 6.277394771575928f) * _371) + _326;
      float _377 = (exp2(log2(max(0.0f, (_346 + -0.8359375f)) / (18.8515625f - (_346 * 18.6875f))) * 6.277394771575928f) * _371) + _327;
      if (!((_329 + 1) == 10)) {
        _323 = _330;
        _324 = _331;
        _325 = _375;
        _326 = _376;
        _327 = _377;
        _328 = (_328 * 0.9900000095367432f);
        _329 = (_329 + 1);
        continue;
      }
      float _278 = _375 * 0.10000000149011612f;
      float _279 = _376 * 0.10000000149011612f;
      float _280 = _377 * 0.10000000149011612f;
      int _281 = WaveReadLaneFirst(_materialIndex);
      int _290 = WaveReadLaneFirst(_materialIndex);
      float _300 = (TEXCOORD.x - _221) * _68;
      float _301 = TEXCOORD.y - _222;
      float _312 = saturate((1.0f - ((1.0f / max(9.999999747378752e-06f, WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_281 < (uint)170000), _281, 0)) + 0u))]._radialBlurClampInnerRadius))) * sqrt(dot(float2(_300, _301), float2(_300, _301))))) * (1.0f / max((1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_290 < (uint)170000), _290, 0)) + 0u))]._radialBlurClampHardness)), 9.999999747378752e-06f)));
      _382 = ((_312 * (_193 - _278)) + _278);
      _383 = ((_312 * (_194 - _279)) + _279);
      _384 = ((_312 * (_195 - _280)) + _280);
      break;
    }
  } else {
    _382 = _193;
    _383 = _194;
    _384 = _195;
  }
  int _385 = WaveReadLaneFirst(_materialIndex);
  float _395 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_385 < (uint)170000), _385, 0)) + 0u))]._saturation.x);
  float _396 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_385 < (uint)170000), _385, 0)) + 0u))]._saturation.y);
  float _397 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_385 < (uint)170000), _385, 0)) + 0u))]._saturation.z);
  float _401 = (1.0f - _395) * 0.3086000084877014f;
  float _403 = (1.0f - _396) * 0.6093999743461609f;
  float _405 = (1.0f - _397) * 0.0820000022649765f;
  float _410 = _401 * _382;
  int _427 = WaveReadLaneFirst(_materialIndex);
  float _436 = max(WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_427 < (uint)170000), _427, 0)) + 0u))]._contrast), 0.0f);
  float _443 = max(0.0f, ((_436 * (mad(_384, _405, mad(_383, _403, ((_401 + _395) * _382))) + -0.5f)) + 0.5f));
  float _444 = max(0.0f, ((_436 * (mad(_384, _405, mad(_383, (_403 + _396), _410)) + -0.5f)) + 0.5f));
  float _445 = max(0.0f, ((_436 * (mad(_384, (_405 + _397), mad(_383, _403, _410)) + -0.5f)) + 0.5f));
  if (_97) {
    int _447 = WaveReadLaneFirst(_materialIndex);
    int _455 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_447 < (uint)170000), _447, 0)) + 0u))]._borderColor);
    float _458 = float((uint)((uint)(((uint)((uint)(_455)) >> 16) & 255)));
    float _461 = float((uint)((uint)(((uint)((uint)(_455)) >> 8) & 255)));
    float _463 = float((uint)((uint)(_455 & 255)));
    float _494 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
    _508 = ((((_494 * select(((_458 * 0.003921568859368563f) < 0.040449999272823334f), (_458 * 0.0003035269910469651f), exp2(log2((_458 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) - _443) * _147) + _443);
    _509 = ((((_494 * select(((_461 * 0.003921568859368563f) < 0.040449999272823334f), (_461 * 0.0003035269910469651f), exp2(log2((_461 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) - _444) * _147) + _444);
    _510 = ((((_494 * select(((_463 * 0.003921568859368563f) < 0.040449999272823334f), (_463 * 0.0003035269910469651f), exp2(log2((_463 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) - _445) * _147) + _445);
  } else {
    _508 = _443;
    _509 = _444;
    _510 = _445;
  }
  uint _511 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _518 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_511), 0));
    _524 = (float((uint)((uint)(_518.x & 127))) + 0.5f);
  } else {
    _524 = 1.0f;
  }
  bool _527 = (_localToneMappingParams.w > 0.0f);
  if (_527) {
    float3 output_color = TonemapReplacer(float3(_508, _509, _510));
    _880 = output_color.x;
    _881 = output_color.y;
    _882 = output_color.z;
  } else {
    _880 = _508;
    _881 = _509;
    _882 = _510;
  }
  if (_etcParams.y > 1.0f) {
    float _891 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _892 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _896 = saturate(1.0f - (dot(float2(_891, _892), float2(_891, _892)) * saturate(_etcParams.y + -1.0f)));
    _901 = (_896 * _880);
    _902 = (_896 * _881);
    _903 = (_896 * _882);
  } else {
    _901 = _880;
    _902 = _881;
    _903 = _882;
  }
  if ((_527) && ((_etcParams.z > 0.0f))) {
    _933 = select((_901 <= 0.0031308000907301903f), (_901 * 12.920000076293945f), (((pow(_901, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _934 = select((_902 <= 0.0031308000907301903f), (_902 * 12.920000076293945f), (((pow(_902, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _935 = select((_903 <= 0.0031308000907301903f), (_903 * 12.920000076293945f), (((pow(_903, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _933 = _901;
    _934 = _902;
    _935 = _903;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _940 = float((uint)_511);
    if (!(_940 < _viewDir.w)) {
      if (!(_940 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _949 = _933;
        _950 = _934;
        _951 = _935;
      } else {
        _949 = 0.0f;
        _950 = 0.0f;
        _951 = 0.0f;
      }
    } else {
      _949 = 0.0f;
      _950 = 0.0f;
      _951 = 0.0f;
    }
  } else {
    _949 = _933;
    _950 = _934;
    _951 = _935;
  }
  float _961 = exp2(log2(_949 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _962 = exp2(log2(_950 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _963 = exp2(log2(_951 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_961 * 18.6875f) + 1.0f)) * ((_961 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_962 * 18.6875f) + 1.0f)) * ((_962 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_963 * 18.6875f) + 1.0f)) * ((_963 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _524;
  return SV_Target;
}