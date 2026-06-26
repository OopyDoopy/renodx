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


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t69, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t32, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t40, space36);

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

ConstantBuffer<PostProcessFlashbackStruct> BindlessParameters_PostProcessFlashback[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float4 _27 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  int _31 = WaveReadLaneFirst(_materialIndex);
  float _40 = saturate(WaveReadLaneFirst(BindlessParameters_PostProcessFlashback[((int)((uint)(select(((uint)_31 < (uint)170000), _31, 0)) + 0u))]._blendingRatio));
  float _64;
  float _65;
  float _66;
  float _93;
  float _94;
  float _95;
  float _162;
  float _163;
  float _164;
  float _190;
  float _191;
  float _192;
  float _368;
  float _369;
  float _370;
  float _392;
  float _393;
  float _394;
  float _408;
  float _613;
  float _614;
  float _615;
  float _708;
  float _709;
  float _710;
  float _764;
  float _765;
  float _766;
  float _785;
  float _786;
  float _787;
  float _817;
  float _818;
  float _819;
  float _833;
  float _834;
  float _835;
  [branch]
  if (!(_40 < 9.999999747378752e-05f)) {
    float _47 = 1.0f / max(0.0010000000474974513f, abs(_exposure0.x));
    float _50 = _exposure2.x * _47;
    float _51 = _47 * 0.5f;
    [branch]
    if (!(!(_40 >= 0.0010000000474974513f))) {
      float _56 = (1.0f - saturate(_50)) * _40;
      _64 = ((_56 * _27.x) + _27.x);
      _65 = ((_56 * _27.y) + _27.y);
      _66 = ((_56 * _27.z) + _27.z);
    } else {
      _64 = _27.x;
      _65 = _27.y;
      _66 = _27.z;
    }
    int _67 = WaveReadLaneFirst(_materialIndex);
    float _75 = WaveReadLaneFirst(BindlessParameters_PostProcessFlashback[((int)((uint)(select(((uint)_67 < (uint)170000), _67, 0)) + 0u))]._contrastRatio);
    bool _77 = (_40 >= 0.0010000000474974513f);
    if ((_77) && ((!(_75 == 1.0f)))) {
      float _82 = ((_75 + -1.0f) * _40) + 1.0f;
      _93 = ((_82 * (_64 - _51)) + _51);
      _94 = ((_82 * (_65 - _51)) + _51);
      _95 = ((_82 * (_66 - _51)) + _51);
    } else {
      _93 = _64;
      _94 = _65;
      _95 = _66;
    }
    int _96 = WaveReadLaneFirst(_materialIndex);
    float _104 = WaveReadLaneFirst(BindlessParameters_PostProcessFlashback[((int)((uint)(select(((uint)_96 < (uint)170000), _96, 0)) + 0u))]._depthFadingContrast);
    if ((_77) && ((_104 < 1.0f))) {
      int _108 = WaveReadLaneFirst(_materialIndex);
      float _117 = max(9.999999747378752e-05f, WaveReadLaneFirst(BindlessParameters_PostProcessFlashback[((int)((uint)(select(((uint)_108 < (uint)170000), _108, 0)) + 0u))]._depthFadingDistance));
      float _120 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
      float _133 = saturate((1.0f - saturate(_nearFarProj.x / (max(1.0000000116860974e-07f, _120.x) * _117))) / (1.0f - saturate(1.5f / _117)));
      float _137 = (_133 * _133) * (3.0f - (_133 * 2.0f));
      float _143 = (((1.0f - saturate(_50)) * 0.30000001192092896f) * (1.0f - _137)) + _137;
      float _154 = (1.0f - _104) * _40;
      _162 = ((((_143 * (_93 - _51)) + _51) * _154) + _93);
      _163 = ((((_143 * (_94 - _51)) + _51) * _154) + _94);
      _164 = ((((_143 * (_95 - _51)) + _51) * _154) + _95);
    } else {
      _162 = _93;
      _163 = _94;
      _164 = _95;
    }
    float4 _167 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    int _170 = WaveReadLaneFirst(_materialIndex);
    float _178 = WaveReadLaneFirst(BindlessParameters_PostProcessFlashback[((int)((uint)(select(((uint)_170 < (uint)170000), _170, 0)) + 0u))]._flickeringIntensity);
    [branch]
    if (!(!(_178 >= 0.0010000000474974513f))) {
      float _185 = 1.0f - (((_40 * 0.6000000238418579f) * _167.x) * _178);
      _190 = (_185 * _162);
      _191 = (_185 * _163);
      _192 = (_185 * _164);
    } else {
      _190 = _162;
      _191 = _163;
      _192 = _164;
    }
    int _193 = WaveReadLaneFirst(_materialIndex);
    float _201 = WaveReadLaneFirst(BindlessParameters_PostProcessFlashback[((int)((uint)(select(((uint)_193 < (uint)170000), _193, 0)) + 0u))]._lensDirtIntensity);
    [branch]
    if (!(!(_201 >= 9.999999747378752e-05f))) {
      float _212 = saturate((_sunDirection.y + 0.10000000149011612f) * 5.0f);
      float _216 = (_212 * _212) * (3.0f - (_212 * 2.0f));
      float _220 = rsqrt(dot(float3(_sunDirection.x, _sunDirection.y, _sunDirection.z), float3(_sunDirection.x, _sunDirection.y, _sunDirection.z)));
      float _229 = rsqrt(dot(float3(_moonDirection.x, _moonDirection.y, _moonDirection.z), float3(_moonDirection.x, _moonDirection.y, _moonDirection.z)));
      float _230 = _229 * _moonDirection.x;
      float _231 = _229 * _moonDirection.y;
      float _232 = _229 * _moonDirection.z;
      float _239 = (((_220 * _sunDirection.x) - _230) * _216) + _230;
      float _240 = (((_220 * _sunDirection.y) - _231) * _216) + _231;
      float _241 = (((_220 * _sunDirection.z) - _232) * _216) + _232;
      float _243 = rsqrt(dot(float3(_239, _240, _241), float3(_239, _240, _241)));
      float _248 = (TEXCOORD.x * 2.0f) + -1.0f;
      float _251 = ((1.0f - TEXCOORD.y) * 2.0f) + -1.0f;
      float _287 = ((_invViewProjRelative[3].w) + (_invViewProjRelative[3].z)) + mad((_invViewProjRelative[3].y), _251, ((_invViewProjRelative[3].x) * _248));
      float _288 = ((mad((_invViewProjRelative[0].y), _251, ((_invViewProjRelative[0].x) * _248)) + (_invViewProjRelative[0].z)) + (_invViewProjRelative[0].w)) / _287;
      float _289 = (((_invViewProjRelative[1].w) + (_invViewProjRelative[1].z)) + mad((_invViewProjRelative[1].y), _251, ((_invViewProjRelative[1].x) * _248))) / _287;
      float _290 = (((_invViewProjRelative[2].w) + (_invViewProjRelative[2].z)) + mad((_invViewProjRelative[2].y), _251, ((_invViewProjRelative[2].x) * _248))) / _287;
      float _292 = rsqrt(dot(float3(_288, _289, _290), float3(_288, _289, _290)));
      float _299 = saturate((dot(float3((_292 * _288), (_292 * _289), (_292 * _290)), float3((_239 * _243), (_240 * _243), (_241 * _243))) + -0.5f) * 2.0f);
      float _311 = (((_216 * 4.0f) + 3.0f) * _167.z) * saturate(exp2(log2((_299 * _299) * (3.0f - (_299 * 2.0f))) * 3.0f));
      int _315 = WaveReadLaneFirst(_materialIndex);
      float _323 = WaveReadLaneFirst(BindlessParameters_PostProcessFlashback[((int)((uint)(select(((uint)_315 < (uint)170000), _315, 0)) + 0u))]._lensDirtTexScale);
      int _328 = WaveReadLaneFirst(_materialIndex);
      int _336 = WaveReadLaneFirst(BindlessParameters_PostProcessFlashback[((int)((uint)(select(((uint)_328 < (uint)170000), _328, 0)) + 0u))]._lensDirtTex);
      float4 _343 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_336 < (uint)65000), _336, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((((1.0f / _srcTargetSizeAndInv.y) * TEXCOORD.x) * _srcTargetSizeAndInv.x) * _323), (_323 * TEXCOORD.y)));
      float _347 = dot(float3(0.30000001192092896f, 0.5899999737739563f, 0.10999999940395355f), float3(_343.x, _343.y, _343.z));
      float _360 = (((_47 * _40) * _201) * (6.0f - (_216 * 2.0f))) * (_311 + _167.z);
      _368 = (((lerp(_347, _343.x, _311)) * _360) + _190);
      _369 = (((lerp(_347, _343.y, _311)) * _360) + _191);
      _370 = (((lerp(_347, _343.z, _311)) * _360) + _192);
    } else {
      _368 = _190;
      _369 = _191;
      _370 = _192;
    }
    int _371 = WaveReadLaneFirst(_materialIndex);
    float _380 = saturate(WaveReadLaneFirst(BindlessParameters_PostProcessFlashback[((int)((uint)(select(((uint)_371 < (uint)170000), _371, 0)) + 0u))]._vignetteRatio));
    [branch]
    if (!(!(_380 >= 0.0010000000474974513f))) {
      float _384 = (_167.y * _40) * _380;
      _392 = (_368 - (_384 * _368));
      _393 = (_369 - (_384 * _369));
      _394 = (_370 - (_384 * _370));
    } else {
      _392 = _368;
      _393 = _369;
      _394 = _370;
    }
  } else {
    _392 = _27.x;
    _393 = _27.y;
    _394 = _27.z;
  }
  uint _395 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _402 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_395), 0));
    _408 = (float((uint)((uint)(_402.x & 127))) + 0.5f);
  } else {
    _408 = 1.0f;
  }
  bool _411 = (_localToneMappingParams.w > 0.0f);
  if (_411) {
    float3 output_color = TonemapReplacer(float3(_392, _393, _394));
    _764 = output_color.x;
    _765 = output_color.y;
    _766 = output_color.z;
  } else {
    _764 = _392;
    _765 = _393;
    _766 = _394;
  }
  if (_etcParams.y > 1.0f) {
    float _775 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _776 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _780 = saturate(1.0f - (dot(float2(_775, _776), float2(_775, _776)) * saturate(_etcParams.y + -1.0f)));
    _785 = (_780 * _764);
    _786 = (_780 * _765);
    _787 = (_780 * _766);
  } else {
    _785 = _764;
    _786 = _765;
    _787 = _766;
  }
  if ((_411) && ((_etcParams.z > 0.0f))) {
    _817 = select((_785 <= 0.0031308000907301903f), (_785 * 12.920000076293945f), (((pow(_785, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _818 = select((_786 <= 0.0031308000907301903f), (_786 * 12.920000076293945f), (((pow(_786, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _819 = select((_787 <= 0.0031308000907301903f), (_787 * 12.920000076293945f), (((pow(_787, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _817 = _785;
    _818 = _786;
    _819 = _787;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _824 = float((uint)_395);
    if (!(_824 < _viewDir.w)) {
      if (!(_824 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _833 = _817;
        _834 = _818;
        _835 = _819;
      } else {
        _833 = 0.0f;
        _834 = 0.0f;
        _835 = 0.0f;
      }
    } else {
      _833 = 0.0f;
      _834 = 0.0f;
      _835 = 0.0f;
    }
  } else {
    _833 = _817;
    _834 = _818;
    _835 = _819;
  }
  SV_Target.x = _833;
  SV_Target.y = _834;
  SV_Target.z = _835;
  SV_Target.w = _408;
  return SV_Target;
}