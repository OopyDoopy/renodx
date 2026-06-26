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
  float _37 = (pow(_27.x, 0.012683313339948654f));
  float _38 = (pow(_27.y, 0.012683313339948654f));
  float _39 = (pow(_27.z, 0.012683313339948654f));
  float _61 = exp2(log2(max(0.0f, (_37 + -0.8359375f)) / (18.8515625f - (_37 * 18.6875f))) * 6.277394771575928f);
  float _62 = exp2(log2(max(0.0f, (_38 + -0.8359375f)) / (18.8515625f - (_38 * 18.6875f))) * 6.277394771575928f);
  float _63 = exp2(log2(max(0.0f, (_39 + -0.8359375f)) / (18.8515625f - (_39 * 18.6875f))) * 6.277394771575928f);
  float _64 = _61 * 10000.0f;
  float _65 = _62 * 10000.0f;
  float _66 = _63 * 10000.0f;
  int _67 = WaveReadLaneFirst(_materialIndex);
  float _76 = saturate(WaveReadLaneFirst(BindlessParameters_PostProcessFlashback[((int)((uint)(select(((uint)_67 < (uint)170000), _67, 0)) + 0u))]._blendingRatio));
  float _101;
  float _102;
  float _103;
  float _130;
  float _131;
  float _132;
  float _199;
  float _200;
  float _201;
  float _261;
  float _262;
  float _263;
  float _439;
  float _440;
  float _441;
  float _464;
  float _465;
  float _466;
  float _480;
  float _685;
  float _686;
  float _687;
  float _780;
  float _781;
  float _782;
  float _836;
  float _837;
  float _838;
  float _857;
  float _858;
  float _859;
  float _889;
  float _890;
  float _891;
  float _905;
  float _906;
  float _907;
  [branch]
  if (!(_76 < 9.999999747378752e-05f)) {
    float _83 = 1.0f / max(0.0010000000474974513f, abs(_exposure0.x));
    float _86 = _exposure2.x * _83;
    float _87 = _83 * 0.5f;
    [branch]
    if (!(!(_76 >= 0.0010000000474974513f))) {
      float _93 = (1.0f - saturate(_86)) * (_76 * 10000.0f);
      _101 = (_61 * (_93 + 10000.0f));
      _102 = (_62 * (_93 + 10000.0f));
      _103 = (_63 * (_93 + 10000.0f));
    } else {
      _101 = _64;
      _102 = _65;
      _103 = _66;
    }
    int _104 = WaveReadLaneFirst(_materialIndex);
    float _112 = WaveReadLaneFirst(BindlessParameters_PostProcessFlashback[((int)((uint)(select(((uint)_104 < (uint)170000), _104, 0)) + 0u))]._contrastRatio);
    bool _114 = (_76 >= 0.0010000000474974513f);
    if ((_114) && ((!(_112 == 1.0f)))) {
      float _119 = ((_112 + -1.0f) * _76) + 1.0f;
      _130 = ((_119 * (_101 - _87)) + _87);
      _131 = ((_119 * (_102 - _87)) + _87);
      _132 = ((_119 * (_103 - _87)) + _87);
    } else {
      _130 = _101;
      _131 = _102;
      _132 = _103;
    }
    int _133 = WaveReadLaneFirst(_materialIndex);
    float _141 = WaveReadLaneFirst(BindlessParameters_PostProcessFlashback[((int)((uint)(select(((uint)_133 < (uint)170000), _133, 0)) + 0u))]._depthFadingContrast);
    if ((_114) && ((_141 < 1.0f))) {
      int _145 = WaveReadLaneFirst(_materialIndex);
      float _154 = max(9.999999747378752e-05f, WaveReadLaneFirst(BindlessParameters_PostProcessFlashback[((int)((uint)(select(((uint)_145 < (uint)170000), _145, 0)) + 0u))]._depthFadingDistance));
      float _157 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
      float _170 = saturate((1.0f - saturate(_nearFarProj.x / (max(1.0000000116860974e-07f, _157.x) * _154))) / (1.0f - saturate(1.5f / _154)));
      float _174 = (_170 * _170) * (3.0f - (_170 * 2.0f));
      float _180 = (((1.0f - saturate(_86)) * 0.30000001192092896f) * (1.0f - _174)) + _174;
      float _191 = (1.0f - _141) * _76;
      _199 = ((((_180 * (_130 - _87)) + _87) * _191) + _130);
      _200 = ((((_180 * (_131 - _87)) + _87) * _191) + _131);
      _201 = ((((_180 * (_132 - _87)) + _87) * _191) + _132);
    } else {
      _199 = _130;
      _200 = _131;
      _201 = _132;
    }
    float4 _204 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    float _214 = (pow(_204.x, 0.012683313339948654f));
    float _215 = (pow(_204.y, 0.012683313339948654f));
    float _216 = (pow(_204.z, 0.012683313339948654f));
    float _233 = exp2(log2(max(0.0f, (_216 + -0.8359375f)) / (18.8515625f - (_216 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    int _234 = WaveReadLaneFirst(_materialIndex);
    float _242 = WaveReadLaneFirst(BindlessParameters_PostProcessFlashback[((int)((uint)(select(((uint)_234 < (uint)170000), _234, 0)) + 0u))]._flickeringIntensity);
    [branch]
    if (!(!(_242 >= 0.0010000000474974513f))) {
      float _256 = 1.0f - (((_76 * 6000.0f) * _242) * exp2(log2(max(0.0f, (_214 + -0.8359375f)) / (18.8515625f - (_214 * 18.6875f))) * 6.277394771575928f));
      _261 = (_256 * _199);
      _262 = (_256 * _200);
      _263 = (_256 * _201);
    } else {
      _261 = _199;
      _262 = _200;
      _263 = _201;
    }
    int _264 = WaveReadLaneFirst(_materialIndex);
    float _272 = WaveReadLaneFirst(BindlessParameters_PostProcessFlashback[((int)((uint)(select(((uint)_264 < (uint)170000), _264, 0)) + 0u))]._lensDirtIntensity);
    [branch]
    if (!(!(_272 >= 9.999999747378752e-05f))) {
      float _283 = saturate((_sunDirection.y + 0.10000000149011612f) * 5.0f);
      float _287 = (_283 * _283) * (3.0f - (_283 * 2.0f));
      float _291 = rsqrt(dot(float3(_sunDirection.x, _sunDirection.y, _sunDirection.z), float3(_sunDirection.x, _sunDirection.y, _sunDirection.z)));
      float _300 = rsqrt(dot(float3(_moonDirection.x, _moonDirection.y, _moonDirection.z), float3(_moonDirection.x, _moonDirection.y, _moonDirection.z)));
      float _301 = _300 * _moonDirection.x;
      float _302 = _300 * _moonDirection.y;
      float _303 = _300 * _moonDirection.z;
      float _310 = (((_291 * _sunDirection.x) - _301) * _287) + _301;
      float _311 = (((_291 * _sunDirection.y) - _302) * _287) + _302;
      float _312 = (((_291 * _sunDirection.z) - _303) * _287) + _303;
      float _314 = rsqrt(dot(float3(_310, _311, _312), float3(_310, _311, _312)));
      float _319 = (TEXCOORD.x * 2.0f) + -1.0f;
      float _322 = ((1.0f - TEXCOORD.y) * 2.0f) + -1.0f;
      float _358 = ((_invViewProjRelative[3].w) + (_invViewProjRelative[3].z)) + mad((_invViewProjRelative[3].y), _322, ((_invViewProjRelative[3].x) * _319));
      float _359 = ((mad((_invViewProjRelative[0].y), _322, ((_invViewProjRelative[0].x) * _319)) + (_invViewProjRelative[0].z)) + (_invViewProjRelative[0].w)) / _358;
      float _360 = (((_invViewProjRelative[1].w) + (_invViewProjRelative[1].z)) + mad((_invViewProjRelative[1].y), _322, ((_invViewProjRelative[1].x) * _319))) / _358;
      float _361 = (((_invViewProjRelative[2].w) + (_invViewProjRelative[2].z)) + mad((_invViewProjRelative[2].y), _322, ((_invViewProjRelative[2].x) * _319))) / _358;
      float _363 = rsqrt(dot(float3(_359, _360, _361), float3(_359, _360, _361)));
      float _370 = saturate((dot(float3((_363 * _359), (_363 * _360), (_363 * _361)), float3((_310 * _314), (_311 * _314), (_312 * _314))) + -0.5f) * 2.0f);
      float _382 = (((_287 * 4.0f) + 3.0f) * _233) * saturate(exp2(log2((_370 * _370) * (3.0f - (_370 * 2.0f))) * 3.0f));
      int _386 = WaveReadLaneFirst(_materialIndex);
      float _394 = WaveReadLaneFirst(BindlessParameters_PostProcessFlashback[((int)((uint)(select(((uint)_386 < (uint)170000), _386, 0)) + 0u))]._lensDirtTexScale);
      int _399 = WaveReadLaneFirst(_materialIndex);
      int _407 = WaveReadLaneFirst(BindlessParameters_PostProcessFlashback[((int)((uint)(select(((uint)_399 < (uint)170000), _399, 0)) + 0u))]._lensDirtTex);
      float4 _414 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_407 < (uint)65000), _407, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((((1.0f / _srcTargetSizeAndInv.y) * TEXCOORD.x) * _srcTargetSizeAndInv.x) * _394), (_394 * TEXCOORD.y)));
      float _418 = dot(float3(0.30000001192092896f, 0.5899999737739563f, 0.10999999940395355f), float3(_414.x, _414.y, _414.z));
      float _431 = (((_83 * _76) * _272) * (6.0f - (_287 * 2.0f))) * (_382 + _233);
      _439 = (((lerp(_418, _414.x, _382)) * _431) + _261);
      _440 = (((lerp(_418, _414.y, _382)) * _431) + _262);
      _441 = (((lerp(_418, _414.z, _382)) * _431) + _263);
    } else {
      _439 = _261;
      _440 = _262;
      _441 = _263;
    }
    int _442 = WaveReadLaneFirst(_materialIndex);
    float _451 = saturate(WaveReadLaneFirst(BindlessParameters_PostProcessFlashback[((int)((uint)(select(((uint)_442 < (uint)170000), _442, 0)) + 0u))]._vignetteRatio));
    [branch]
    if (!(!(_451 >= 0.0010000000474974513f))) {
      float _456 = ((_76 * 10000.0f) * exp2(log2(max(0.0f, (_215 + -0.8359375f)) / (18.8515625f - (_215 * 18.6875f))) * 6.277394771575928f)) * _451;
      _464 = (_439 - (_456 * _439));
      _465 = (_440 - (_456 * _440));
      _466 = (_441 - (_456 * _441));
    } else {
      _464 = _439;
      _465 = _440;
      _466 = _441;
    }
  } else {
    _464 = _64;
    _465 = _65;
    _466 = _66;
  }
  uint _467 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _474 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_467), 0));
    _480 = (float((uint)((uint)(_474.x & 127))) + 0.5f);
  } else {
    _480 = 1.0f;
  }
  bool _483 = (_localToneMappingParams.w > 0.0f);
  if (_483) {
    float3 output_color = TonemapReplacer(float3(_464, _465, _466));
    _836 = output_color.x;
    _837 = output_color.y;
    _838 = output_color.z;
  } else {
    _836 = _464;
    _837 = _465;
    _838 = _466;
  }
  if (_etcParams.y > 1.0f) {
    float _847 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _848 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _852 = saturate(1.0f - (dot(float2(_847, _848), float2(_847, _848)) * saturate(_etcParams.y + -1.0f)));
    _857 = (_852 * _836);
    _858 = (_852 * _837);
    _859 = (_852 * _838);
  } else {
    _857 = _836;
    _858 = _837;
    _859 = _838;
  }
  if ((_483) && ((_etcParams.z > 0.0f))) {
    _889 = select((_857 <= 0.0031308000907301903f), (_857 * 12.920000076293945f), (((pow(_857, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _890 = select((_858 <= 0.0031308000907301903f), (_858 * 12.920000076293945f), (((pow(_858, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _891 = select((_859 <= 0.0031308000907301903f), (_859 * 12.920000076293945f), (((pow(_859, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _889 = _857;
    _890 = _858;
    _891 = _859;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _896 = float((uint)_467);
    if (!(_896 < _viewDir.w)) {
      if (!(_896 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _905 = _889;
        _906 = _890;
        _907 = _891;
      } else {
        _905 = 0.0f;
        _906 = 0.0f;
        _907 = 0.0f;
      }
    } else {
      _905 = 0.0f;
      _906 = 0.0f;
      _907 = 0.0f;
    }
  } else {
    _905 = _889;
    _906 = _890;
    _907 = _891;
  }
  float _917 = exp2(log2(_905 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _918 = exp2(log2(_906 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _919 = exp2(log2(_907 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_917 * 18.6875f) + 1.0f)) * ((_917 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_918 * 18.6875f) + 1.0f)) * ((_918 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_919 * 18.6875f) + 1.0f)) * ((_919 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _480;
  return SV_Target;
}