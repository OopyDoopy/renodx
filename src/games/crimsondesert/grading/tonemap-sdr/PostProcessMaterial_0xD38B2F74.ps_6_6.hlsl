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
  float _32 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  int _33 = WaveReadLaneFirst(_materialIndex);
  int _42 = WaveReadLaneFirst(_materialIndex);
  int _51 = WaveReadLaneFirst(_materialIndex);
  bool _60 = (WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_33 < (uint)170000), _33, 0)) + 0u))]._gaussianBlurIntensity) > 0.0f);
  bool _61 = (WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_51 < (uint)170000), _51, 0)) + 0u))]._borderRatio) > 0.0f);
  float _72;
  float _73;
  float _74;
  float _75;
  float _121;
  float _122;
  float _123;
  float _215;
  float _216;
  float _217;
  float _218;
  float _219;
  float _220;
  int _221;
  float _241;
  float _242;
  float _243;
  float _367;
  float _368;
  float _369;
  float _383;
  float _588;
  float _589;
  float _590;
  float _683;
  float _684;
  float _685;
  float _739;
  float _740;
  float _741;
  float _760;
  float _761;
  float _762;
  float _792;
  float _793;
  float _794;
  float _808;
  float _809;
  float _810;
  if ((_60) || (_61)) {
    float4 _66 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    _72 = _66.x;
    _73 = _66.y;
    _74 = _66.z;
    _75 = _66.w;
  } else {
    _72 = 0.0f;
    _73 = 0.0f;
    _74 = 0.0f;
    _75 = 0.0f;
  }
  if (_60) {
    int _77 = WaveReadLaneFirst(_materialIndex);
    int _86 = WaveReadLaneFirst(_materialIndex);
    float _98 = (TEXCOORD.x - WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_86 < (uint)170000), _86, 0)) + 0u))]._gaussianBlurPosition.x)) * _32;
    float _99 = TEXCOORD.y - WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_86 < (uint)170000), _86, 0)) + 0u))]._gaussianBlurPosition.y);
    float _110 = saturate((1.0f - ((1.0f / max(9.999999747378752e-06f, WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_42 < (uint)170000), _42, 0)) + 0u))]._gaussianBlurClampInnerRadius))) * sqrt(dot(float2(_98, _99), float2(_98, _99))))) * (1.0f / max((1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_77 < (uint)170000), _77, 0)) + 0u))]._gaussianBlurClampHardness)), 9.999999747378752e-06f)));
    _121 = ((_110 * (_25.x - _72)) + _72);
    _122 = ((_110 * (_25.y - _73)) + _73);
    _123 = ((_110 * (_25.z - _74)) + _74);
  } else {
    _121 = _25.x;
    _122 = _25.y;
    _123 = _25.z;
  }
  int _129 = WaveReadLaneFirst(_materialIndex);
  float _137 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_129 < (uint)170000), _129, 0)) + 0u))]._radialBlurIntensity);
  if (_137 > 0.0f) {
    int _140 = WaveReadLaneFirst(_materialIndex);
    float _149 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_140 < (uint)170000), _140, 0)) + 0u))]._radialBlurPosition.x);
    float _150 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_140 < (uint)170000), _140, 0)) + 0u))]._radialBlurPosition.y);
    float _154 = (_srcTargetSizeAndInv.x * TEXCOORD.x) / _srcTargetSizeAndInv.x;
    float _155 = (_srcTargetSizeAndInv.y * TEXCOORD.y) / _srcTargetSizeAndInv.y;
    float4 _158 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_154, _155));
    float _164 = 32.0f / _137;
    _215 = _154;
    _216 = _155;
    _217 = _158.x;
    _218 = _158.y;
    _219 = _158.z;
    _220 = 1.0f;
    _221 = 0;
    while(true) {
      float _222 = _215 + (((_149 - _154) / _164) * 0.10000000149011612f);
      float _223 = _216 + (((_150 - _155) / _164) * 0.10000000149011612f);
      float4 _226 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_222, _223));
      float _230 = _220 * 0.8999999761581421f;
      float _234 = (_226.x * _230) + _217;
      float _235 = (_226.y * _230) + _218;
      float _236 = (_226.z * _230) + _219;
      if (!((_221 + 1) == 10)) {
        _215 = _222;
        _216 = _223;
        _217 = _234;
        _218 = _235;
        _219 = _236;
        _220 = (_220 * 0.9900000095367432f);
        _221 = (_221 + 1);
        continue;
      }
      float _170 = _234 * 0.10000000149011612f;
      float _171 = _235 * 0.10000000149011612f;
      float _172 = _236 * 0.10000000149011612f;
      int _173 = WaveReadLaneFirst(_materialIndex);
      int _182 = WaveReadLaneFirst(_materialIndex);
      float _192 = (TEXCOORD.x - _149) * _32;
      float _193 = TEXCOORD.y - _150;
      float _204 = saturate((1.0f - ((1.0f / max(9.999999747378752e-06f, WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_173 < (uint)170000), _173, 0)) + 0u))]._radialBlurClampInnerRadius))) * sqrt(dot(float2(_192, _193), float2(_192, _193))))) * (1.0f / max((1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_182 < (uint)170000), _182, 0)) + 0u))]._radialBlurClampHardness)), 9.999999747378752e-06f)));
      _241 = ((_204 * (_121 - _170)) + _170);
      _242 = ((_204 * (_122 - _171)) + _171);
      _243 = ((_204 * (_123 - _172)) + _172);
      break;
    }
  } else {
    _241 = _121;
    _242 = _122;
    _243 = _123;
  }
  int _244 = WaveReadLaneFirst(_materialIndex);
  float _254 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_244 < (uint)170000), _244, 0)) + 0u))]._saturation.x);
  float _255 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_244 < (uint)170000), _244, 0)) + 0u))]._saturation.y);
  float _256 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_244 < (uint)170000), _244, 0)) + 0u))]._saturation.z);
  float _260 = (1.0f - _254) * 0.3086000084877014f;
  float _262 = (1.0f - _255) * 0.6093999743461609f;
  float _264 = (1.0f - _256) * 0.0820000022649765f;
  float _269 = _260 * _241;
  int _286 = WaveReadLaneFirst(_materialIndex);
  float _295 = max(WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_286 < (uint)170000), _286, 0)) + 0u))]._contrast), 0.0f);
  float _302 = max(0.0f, ((_295 * (mad(_243, _264, mad(_242, _262, ((_260 + _254) * _241))) + -0.5f)) + 0.5f));
  float _303 = max(0.0f, ((_295 * (mad(_243, _264, mad(_242, (_262 + _255), _269)) + -0.5f)) + 0.5f));
  float _304 = max(0.0f, ((_295 * (mad(_243, (_264 + _256), mad(_242, _262, _269)) + -0.5f)) + 0.5f));
  if (_61) {
    int _306 = WaveReadLaneFirst(_materialIndex);
    int _314 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_306 < (uint)170000), _306, 0)) + 0u))]._borderColor);
    float _317 = float((uint)((uint)(((uint)((uint)(_314)) >> 16) & 255)));
    float _320 = float((uint)((uint)(((uint)((uint)(_314)) >> 8) & 255)));
    float _322 = float((uint)((uint)(_314 & 255)));
    float _353 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
    _367 = ((((_353 * select(((_317 * 0.003921568859368563f) < 0.040449999272823334f), (_317 * 0.0003035269910469651f), exp2(log2((_317 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) - _302) * _75) + _302);
    _368 = ((((_353 * select(((_320 * 0.003921568859368563f) < 0.040449999272823334f), (_320 * 0.0003035269910469651f), exp2(log2((_320 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) - _303) * _75) + _303);
    _369 = ((((_353 * select(((_322 * 0.003921568859368563f) < 0.040449999272823334f), (_322 * 0.0003035269910469651f), exp2(log2((_322 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) - _304) * _75) + _304);
  } else {
    _367 = _302;
    _368 = _303;
    _369 = _304;
  }
  uint _370 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _377 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_370), 0));
    _383 = (float((uint)((uint)(_377.x & 127))) + 0.5f);
  } else {
    _383 = 1.0f;
  }
  bool _386 = (_localToneMappingParams.w > 0.0f);
  if (_386) {
    float3 output_color = TonemapReplacer(float3(_367, _368, _369));
    _739 = output_color.x;
    _740 = output_color.y;
    _741 = output_color.z;
  } else {
    _739 = _367;
    _740 = _368;
    _741 = _369;
  }
  if (_etcParams.y > 1.0f) {
    float _750 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _751 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _755 = saturate(1.0f - (dot(float2(_750, _751), float2(_750, _751)) * saturate(_etcParams.y + -1.0f)));
    _760 = (_755 * _739);
    _761 = (_755 * _740);
    _762 = (_755 * _741);
  } else {
    _760 = _739;
    _761 = _740;
    _762 = _741;
  }
  if ((_386) && ((_etcParams.z > 0.0f))) {
    _792 = select((_760 <= 0.0031308000907301903f), (_760 * 12.920000076293945f), (((pow(_760, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _793 = select((_761 <= 0.0031308000907301903f), (_761 * 12.920000076293945f), (((pow(_761, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _794 = select((_762 <= 0.0031308000907301903f), (_762 * 12.920000076293945f), (((pow(_762, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _792 = _760;
    _793 = _761;
    _794 = _762;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _799 = float((uint)_370);
    if (!(_799 < _viewDir.w)) {
      if (!(_799 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _808 = _792;
        _809 = _793;
        _810 = _794;
      } else {
        _808 = 0.0f;
        _809 = 0.0f;
        _810 = 0.0f;
      }
    } else {
      _808 = 0.0f;
      _809 = 0.0f;
      _810 = 0.0f;
    }
  } else {
    _808 = _792;
    _809 = _793;
    _810 = _794;
  }
  SV_Target.x = _808;
  SV_Target.y = _809;
  SV_Target.z = _810;
  SV_Target.w = _383;
  return SV_Target;
}