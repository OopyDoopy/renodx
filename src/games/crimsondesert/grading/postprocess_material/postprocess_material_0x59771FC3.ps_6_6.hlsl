#include "../tonemap.hlsli"

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


Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t44, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t33, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t38, space36);

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

ConstantBuffer<PostProcessActionStruct> BindlessParameters_PostProcessAction[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _19[36];
  float4 _24 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _34 = (pow(_24.x, 0.012683313339948654f));
  float _35 = (pow(_24.y, 0.012683313339948654f));
  float _36 = (pow(_24.z, 0.012683313339948654f));
  float _61 = exp2(log2(max(0.0f, (_34 + -0.8359375f)) / (18.8515625f - (_34 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _62 = exp2(log2(max(0.0f, (_35 + -0.8359375f)) / (18.8515625f - (_35 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _63 = exp2(log2(max(0.0f, (_36 + -0.8359375f)) / (18.8515625f - (_36 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _67 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  int _68 = WaveReadLaneFirst(_materialIndex);
  int _77 = WaveReadLaneFirst(_materialIndex);
  int _86 = WaveReadLaneFirst(_materialIndex);
  bool _95 = (WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_68 < (uint)170000), _68, 0)) + 0u))]._gaussianBlurIntensity) > 0.0f);
  bool _96 = (WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_86 < (uint)170000), _86, 0)) + 0u))]._borderRatio) > 0.0f);
  float _143;
  float _144;
  float _145;
  float _146;
  float _192;
  float _193;
  float _194;
  float _322;
  float _323;
  float _324;
  float _325;
  float _326;
  float _327;
  int _328;
  float _381;
  float _382;
  float _383;
  float _507;
  float _508;
  float _509;
  float _523;
  float _769;
  float _770;
  float _771;
  float _891;
  float _892;
  float _893;
  float _914;
  float _915;
  float _916;
  float _949;
  float _950;
  float _951;
  float _965;
  float _966;
  float _967;
  if ((_95) || (_96)) {
    float4 _101 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    float _112 = (pow(_101.x, 0.012683313339948654f));
    float _113 = (pow(_101.y, 0.012683313339948654f));
    float _114 = (pow(_101.z, 0.012683313339948654f));
    _143 = (exp2(log2(max(0.0f, (_112 + -0.8359375f)) / (18.8515625f - (_112 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
    _144 = (exp2(log2(max(0.0f, (_113 + -0.8359375f)) / (18.8515625f - (_113 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
    _145 = (exp2(log2(max(0.0f, (_114 + -0.8359375f)) / (18.8515625f - (_114 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
    _146 = _101.w;
  } else {
    _143 = 0.0f;
    _144 = 0.0f;
    _145 = 0.0f;
    _146 = 0.0f;
  }
  if (_95) {
    int _148 = WaveReadLaneFirst(_materialIndex);
    int _157 = WaveReadLaneFirst(_materialIndex);
    float _169 = (TEXCOORD.x - WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_157 < (uint)170000), _157, 0)) + 0u))]._gaussianBlurPosition.x)) * _67;
    float _170 = TEXCOORD.y - WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_157 < (uint)170000), _157, 0)) + 0u))]._gaussianBlurPosition.y);
    float _181 = saturate((1.0f - ((1.0f / max(9.999999747378752e-06f, WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_77 < (uint)170000), _77, 0)) + 0u))]._gaussianBlurClampInnerRadius))) * sqrt(dot(float2(_169, _170), float2(_169, _170))))) * (1.0f / max((1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_148 < (uint)170000), _148, 0)) + 0u))]._gaussianBlurClampHardness)), 9.999999747378752e-06f)));
    _192 = ((_181 * (_61 - _143)) + _143);
    _193 = ((_181 * (_62 - _144)) + _144);
    _194 = ((_181 * (_63 - _145)) + _145);
  } else {
    _192 = _61;
    _193 = _62;
    _194 = _63;
  }
  int _200 = WaveReadLaneFirst(_materialIndex);
  float _208 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_200 < (uint)170000), _200, 0)) + 0u))]._radialBlurIntensity);
  if (_208 > 0.0f) {
    int _211 = WaveReadLaneFirst(_materialIndex);
    float _220 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_211 < (uint)170000), _211, 0)) + 0u))]._radialBlurPosition.x);
    float _221 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_211 < (uint)170000), _211, 0)) + 0u))]._radialBlurPosition.y);
    float _225 = (_srcTargetSizeAndInv.x * TEXCOORD.x) / _srcTargetSizeAndInv.x;
    float _226 = (_srcTargetSizeAndInv.y * TEXCOORD.y) / _srcTargetSizeAndInv.y;
    float4 _229 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_225, _226));
    float _239 = (pow(_229.x, 0.012683313339948654f));
    float _240 = (pow(_229.y, 0.012683313339948654f));
    float _241 = (pow(_229.z, 0.012683313339948654f));
    float _271 = 32.0f / _208;
    _322 = _225;
    _323 = _226;
    _324 = (exp2(log2(max(0.0f, (_239 + -0.8359375f)) / (18.8515625f - (_239 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
    _325 = (exp2(log2(max(0.0f, (_240 + -0.8359375f)) / (18.8515625f - (_240 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
    _326 = (exp2(log2(max(0.0f, (_241 + -0.8359375f)) / (18.8515625f - (_241 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
    _327 = 1.0f;
    _328 = 0;
    while(true) {
      float _329 = _322 + (((_220 - _225) / _271) * 0.10000000149011612f);
      float _330 = _323 + (((_221 - _226) / _271) * 0.10000000149011612f);
      float4 _333 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_329, _330));
      float _343 = (pow(_333.x, 0.012683313339948654f));
      float _344 = (pow(_333.y, 0.012683313339948654f));
      float _345 = (pow(_333.z, 0.012683313339948654f));
      float _370 = _327 * 9000.0f;
      float _374 = (exp2(log2(max(0.0f, (_343 + -0.8359375f)) / (18.8515625f - (_343 * 18.6875f))) * 6.277394771575928f) * _370) + _324;
      float _375 = (exp2(log2(max(0.0f, (_344 + -0.8359375f)) / (18.8515625f - (_344 * 18.6875f))) * 6.277394771575928f) * _370) + _325;
      float _376 = (exp2(log2(max(0.0f, (_345 + -0.8359375f)) / (18.8515625f - (_345 * 18.6875f))) * 6.277394771575928f) * _370) + _326;
      if (!((_328 + 1) == 10)) {
        _322 = _329;
        _323 = _330;
        _324 = _374;
        _325 = _375;
        _326 = _376;
        _327 = (_327 * 0.9900000095367432f);
        _328 = (_328 + 1);
        continue;
      }
      float _277 = _374 * 0.10000000149011612f;
      float _278 = _375 * 0.10000000149011612f;
      float _279 = _376 * 0.10000000149011612f;
      int _280 = WaveReadLaneFirst(_materialIndex);
      int _289 = WaveReadLaneFirst(_materialIndex);
      float _299 = (TEXCOORD.x - _220) * _67;
      float _300 = TEXCOORD.y - _221;
      float _311 = saturate((1.0f - ((1.0f / max(9.999999747378752e-06f, WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_280 < (uint)170000), _280, 0)) + 0u))]._radialBlurClampInnerRadius))) * sqrt(dot(float2(_299, _300), float2(_299, _300))))) * (1.0f / max((1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_289 < (uint)170000), _289, 0)) + 0u))]._radialBlurClampHardness)), 9.999999747378752e-06f)));
      _381 = ((_311 * (_192 - _277)) + _277);
      _382 = ((_311 * (_193 - _278)) + _278);
      _383 = ((_311 * (_194 - _279)) + _279);
      break;
    }
  } else {
    _381 = _192;
    _382 = _193;
    _383 = _194;
  }
  int _384 = WaveReadLaneFirst(_materialIndex);
  float _394 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_384 < (uint)170000), _384, 0)) + 0u))]._saturation.x);
  float _395 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_384 < (uint)170000), _384, 0)) + 0u))]._saturation.y);
  float _396 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_384 < (uint)170000), _384, 0)) + 0u))]._saturation.z);
  float _400 = (1.0f - _394) * 0.3086000084877014f;
  float _402 = (1.0f - _395) * 0.6093999743461609f;
  float _404 = (1.0f - _396) * 0.0820000022649765f;
  float _409 = _400 * _381;
  int _426 = WaveReadLaneFirst(_materialIndex);
  float _435 = max(WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_426 < (uint)170000), _426, 0)) + 0u))]._contrast), 0.0f);
  float _442 = max(0.0f, ((_435 * (mad(_383, _404, mad(_382, _402, ((_400 + _394) * _381))) + -0.5f)) + 0.5f));
  float _443 = max(0.0f, ((_435 * (mad(_383, _404, mad(_382, (_402 + _395), _409)) + -0.5f)) + 0.5f));
  float _444 = max(0.0f, ((_435 * (mad(_383, (_404 + _396), mad(_382, _402, _409)) + -0.5f)) + 0.5f));
  if (_96) {
    int _446 = WaveReadLaneFirst(_materialIndex);
    int _454 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_446 < (uint)170000), _446, 0)) + 0u))]._borderColor);
    float _457 = float((uint)((uint)(((uint)((uint)(_454)) >> 16) & 255)));
    float _460 = float((uint)((uint)(((uint)((uint)(_454)) >> 8) & 255)));
    float _462 = float((uint)((uint)(_454 & 255)));
    float _493 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
    _507 = ((((_493 * select(((_457 * 0.003921568859368563f) < 0.040449999272823334f), (_457 * 0.0003035269910469651f), exp2(log2((_457 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) - _442) * _146) + _442);
    _508 = ((((_493 * select(((_460 * 0.003921568859368563f) < 0.040449999272823334f), (_460 * 0.0003035269910469651f), exp2(log2((_460 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) - _443) * _146) + _443);
    _509 = ((((_493 * select(((_462 * 0.003921568859368563f) < 0.040449999272823334f), (_462 * 0.0003035269910469651f), exp2(log2((_462 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) - _444) * _146) + _444);
  } else {
    _507 = _442;
    _508 = _443;
    _509 = _444;
  }
  uint _510 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _517 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_510), 0));
    _523 = (float((uint)((uint)(_517.x & 127))) + 0.5f);
  } else {
    _523 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_507, _508, _509));
    _891 = output_color.x;
    _892 = output_color.y;
    _893 = output_color.z;
  } else {
    _891 = _507;
    _892 = _508;
    _893 = _509;
  }
  if (_etcParams.y > 1.0f) {
    float _904 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _905 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _909 = saturate(1.0f - (dot(float2(_904, _905), float2(_904, _905)) * saturate(_etcParams.y + -1.0f)));
    _914 = (_909 * _891);
    _915 = (_909 * _892);
    _916 = (_909 * _893);
  } else {
    _914 = _891;
    _915 = _892;
    _916 = _893;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _949 = select((_914 <= 0.0031308000907301903f), (_914 * 12.920000076293945f), (((pow(_914, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _950 = select((_915 <= 0.0031308000907301903f), (_915 * 12.920000076293945f), (((pow(_915, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _951 = select((_916 <= 0.0031308000907301903f), (_916 * 12.920000076293945f), (((pow(_916, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _949 = _914;
    _950 = _915;
    _951 = _916;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _956 = float((uint)_510);
    if (!(_956 < _viewDir.w)) {
      if (!(_956 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _965 = _949;
        _966 = _950;
        _967 = _951;
      } else {
        _965 = 0.0f;
        _966 = 0.0f;
        _967 = 0.0f;
      }
    } else {
      _965 = 0.0f;
      _966 = 0.0f;
      _967 = 0.0f;
    }
  } else {
    _965 = _949;
    _966 = _950;
    _967 = _951;
  }
  float _977 = exp2(log2(_965 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _978 = exp2(log2(_966 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _979 = exp2(log2(_967 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_977 * 18.6875f) + 1.0f)) * ((_977 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_978 * 18.6875f) + 1.0f)) * ((_978 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_979 * 18.6875f) + 1.0f)) * ((_979 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _523;
  return SV_Target;
}

