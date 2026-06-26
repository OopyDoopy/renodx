struct PostProcessWeatherBlendStruct {
  float _blendRatio;
  float _enableBlend;
  uint _noiseTex;
  uint _berserkColor;
  uint _berserkEndColor;
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
  float _contrast;
  float3 _saturation;
  float _chromaticAberrationRatio;
  float _chromaticAberrationShiftValue;
  float2 _chromaticAberrationShiftPosition;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

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

ConstantBuffer<PostProcessWeatherBlendStruct> BindlessParameters_PostProcessWeatherBlend[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float4 _42 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
  float _52 = (pow(_42.x, 0.012683313339948654f));
  float _53 = (pow(_42.y, 0.012683313339948654f));
  float _54 = (pow(_42.z, 0.012683313339948654f));
  float _76 = exp2(log2(max(0.0f, (_52 + -0.8359375f)) / (18.8515625f - (_52 * 18.6875f))) * 6.277394771575928f);
  float _77 = exp2(log2(max(0.0f, (_53 + -0.8359375f)) / (18.8515625f - (_53 * 18.6875f))) * 6.277394771575928f);
  float _78 = exp2(log2(max(0.0f, (_54 + -0.8359375f)) / (18.8515625f - (_54 * 18.6875f))) * 6.277394771575928f);
  float _79 = _76 * 10000.0f;
  float _80 = _77 * 10000.0f;
  float _81 = _78 * 10000.0f;
  int _82 = WaveReadLaneFirst(_materialIndex);
  float _90 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_82 < (uint)170000), _82, 0)) + 0u))]._blendRatio);
  int _91 = WaveReadLaneFirst(_materialIndex);
  float _413;
  float _414;
  float _415;
  float _429;
  float _634;
  float _635;
  float _636;
  float _729;
  float _730;
  float _731;
  float _785;
  float _786;
  float _787;
  float _806;
  float _807;
  float _808;
  float _838;
  float _839;
  float _840;
  float _854;
  float _855;
  float _856;
  if (((_90 >= 0.009999999776482582f)) && ((WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_91 < (uint)170000), _91, 0)) + 0u))]._enableBlend) > 0.009999999776482582f))) {
    int _110 = WaveReadLaneFirst(_materialIndex);
    int _118 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_110 < (uint)170000), _110, 0)) + 0u))]._noiseTex);
    float4 _125 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_118 < (uint)65000), _118, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, ((_time.x * 0.20000000298023224f) + TEXCOORD.y)));
    float4 _132 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    float _143 = (pow(_132.x, 0.012683313339948654f));
    float _144 = (pow(_132.y, 0.012683313339948654f));
    float _145 = (pow(_132.z, 0.012683313339948654f));
    float _173 = _132.w * 10000.0f;
    float _177 = ((exp2(log2(max(0.0f, (_143 + -0.8359375f)) / (18.8515625f - (_143 * 18.6875f))) * 6.277394771575928f) - _76) * _173) + _79;
    float _178 = ((exp2(log2(max(0.0f, (_144 + -0.8359375f)) / (18.8515625f - (_144 * 18.6875f))) * 6.277394771575928f) - _77) * _173) + _80;
    float _179 = ((exp2(log2(max(0.0f, (_145 + -0.8359375f)) / (18.8515625f - (_145 * 18.6875f))) * 6.277394771575928f) - _78) * _173) + _81;
    float _180 = TEXCOORD.x + -0.5f;
    float _181 = TEXCOORD.y + -0.5f;
    float _183 = atan(_181 / _180);
    bool _186 = (_180 < 0.0f);
    bool _187 = (_180 == 0.0f);
    bool _188 = (_181 >= 0.0f);
    bool _189 = (_181 < 0.0f);
    float _198 = select(((_187) && (_188)), 0.5f, select(((_187) && (_189)), -0.5f, (select(((_186) && (_189)), (_183 + -3.1415927410125732f), select(((_186) && (_188)), (_183 + 3.1415927410125732f), _183)) * 0.31830987334251404f)));
    float _202 = sqrt((_181 * _181) + (_180 * _180));
    int _217 = WaveReadLaneFirst(_materialIndex);
    int _225 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_217 < (uint)170000), _217, 0)) + 0u))]._noiseTex);
    float4 _232 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_225 < (uint)65000), _225, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_time.x * -0.20000000298023224f) - ((_125.z + -0.5f) * 0.5f)) + (_198 * 15.0f)), (((_202 * 2.0f) - ((_125.w + -0.5f) * 0.5f)) - (_time.x * 1.5f))));
    float _237 = (1.75f - saturate(_90 * 1.4285714626312256f)) * 0.5f;
    float _240 = max((abs(_180) - _237), 0.0f);
    float _241 = max((abs(_181) - _237), 0.0f);
    int _260 = WaveReadLaneFirst(_materialIndex);
    int _268 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_260 < (uint)170000), _260, 0)) + 0u))]._borderEdgeNoiseTexture);
    float4 _275 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_268 < (uint)65000), _268, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_198 * 9.0f) + (_125.x * 0.05000000074505806f)) - (_232.x * 0.10000000149011612f)), ((_202 + (_125.y * 0.05000000074505806f)) - ((_time.x + _232.x) * 0.10000000149011612f))));
    int _277 = WaveReadLaneFirst(_materialIndex);
    int _285 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_277 < (uint)170000), _277, 0)) + 0u))]._berserkColor);
    float _288 = float((uint)((uint)(((uint)((uint)(_285)) >> 16) & 255)));
    float _291 = float((uint)((uint)(((uint)((uint)(_285)) >> 8) & 255)));
    float _293 = float((uint)((uint)(_285 & 255)));
    float _323 = max(0.0010000000474974513f, _exposure0.x);
    float _329 = ((_275.y * _275.y) * saturate(sqrt((_241 * _241) + (_240 * _240)) * 6.666666507720947f)) * _275.y;
    float _336 = (((select(((_288 * 0.003921568859368563f) < 0.040449999272823334f), (_288 * 0.0003035269910469651f), exp2(log2((_288 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _323) - _177) * _329) + _177;
    float _337 = (((select(((_291 * 0.003921568859368563f) < 0.040449999272823334f), (_291 * 0.0003035269910469651f), exp2(log2((_291 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _323) - _178) * _329) + _178;
    float _338 = (((select(((_293 * 0.003921568859368563f) < 0.040449999272823334f), (_293 * 0.0003035269910469651f), exp2(log2((_293 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _323) - _179) * _329) + _179;
    int _339 = WaveReadLaneFirst(_materialIndex);
    int _347 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_339 < (uint)170000), _339, 0)) + 0u))]._berserkEndColor);
    float _350 = float((uint)((uint)(((uint)((uint)(_347)) >> 16) & 255)));
    float _353 = float((uint)((uint)(((uint)((uint)(_347)) >> 8) & 255)));
    float _355 = float((uint)((uint)(_347 & 255)));
    float _385 = max(0.0010000000474974513f, _exposure0.x);
    float _390 = select((_90 > 0.699999988079071f), 1.0f, 0.0f);
    float _397 = (((select(((_350 * 0.003921568859368563f) < 0.040449999272823334f), (_350 * 0.0003035269910469651f), exp2(log2((_350 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _385) - _336) * _390) + _336;
    float _398 = (((select(((_353 * 0.003921568859368563f) < 0.040449999272823334f), (_353 * 0.0003035269910469651f), exp2(log2((_353 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _385) - _337) * _390) + _337;
    float _399 = (((select(((_355 * 0.003921568859368563f) < 0.040449999272823334f), (_355 * 0.0003035269910469651f), exp2(log2((_355 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _385) - _338) * _390) + _338;
    float _402 = saturate((_90 + -0.800000011920929f) * 5.0f);
    _413 = (lerp(_397, _79, _402));
    _414 = (lerp(_398, _80, _402));
    _415 = (lerp(_399, _81, _402));
  } else {
    _413 = _79;
    _414 = _80;
    _415 = _81;
  }
  uint _416 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _423 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_416), 0));
    _429 = (float((uint)((uint)(_423.x & 127))) + 0.5f);
  } else {
    _429 = 1.0f;
  }
  bool _432 = (_localToneMappingParams.w > 0.0f);
  if (_432) {
    float3 output_color = TonemapReplacer(float3(_413, _414, _415));
    _785 = output_color.x;
    _786 = output_color.y;
    _787 = output_color.z;
  } else {
    _785 = _413;
    _786 = _414;
    _787 = _415;
  }
  if (_etcParams.y > 1.0f) {
    float _796 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _797 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _801 = saturate(1.0f - (dot(float2(_796, _797), float2(_796, _797)) * saturate(_etcParams.y + -1.0f)));
    _806 = (_801 * _785);
    _807 = (_801 * _786);
    _808 = (_801 * _787);
  } else {
    _806 = _785;
    _807 = _786;
    _808 = _787;
  }
  if ((_432) && ((_etcParams.z > 0.0f))) {
    _838 = select((_806 <= 0.0031308000907301903f), (_806 * 12.920000076293945f), (((pow(_806, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _839 = select((_807 <= 0.0031308000907301903f), (_807 * 12.920000076293945f), (((pow(_807, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _840 = select((_808 <= 0.0031308000907301903f), (_808 * 12.920000076293945f), (((pow(_808, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _838 = _806;
    _839 = _807;
    _840 = _808;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _845 = float((uint)_416);
    if (!(_845 < _viewDir.w)) {
      if (!(_845 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _854 = _838;
        _855 = _839;
        _856 = _840;
      } else {
        _854 = 0.0f;
        _855 = 0.0f;
        _856 = 0.0f;
      }
    } else {
      _854 = 0.0f;
      _855 = 0.0f;
      _856 = 0.0f;
    }
  } else {
    _854 = _838;
    _855 = _839;
    _856 = _840;
  }
  float _866 = exp2(log2(_854 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _867 = exp2(log2(_855 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _868 = exp2(log2(_856 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_866 * 18.6875f) + 1.0f)) * ((_866 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_867 * 18.6875f) + 1.0f)) * ((_867 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_868 * 18.6875f) + 1.0f)) * ((_868 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _429;
  return SV_Target;
}