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
  int _22 = WaveReadLaneFirst(_materialIndex);
  float _30 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_22 < (uint)170000), _22, 0)) + 0u))]._blendRatio);
  int _31 = WaveReadLaneFirst(_materialIndex);
  float _445;
  float _446;
  float _447;
  float _448;
  float _463;
  float _668;
  float _669;
  float _670;
  float _763;
  float _764;
  float _765;
  float _819;
  float _820;
  float _821;
  float _840;
  float _841;
  float _842;
  float _872;
  float _873;
  float _874;
  float _888;
  float _889;
  float _890;
  if (((_30 < 0.0010000000474974513f)) && ((WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_31 < (uint)170000), _31, 0)) + 0u))]._enableBlend) < 0.0010000000474974513f))) {
    if (true) discard;
  }
  float _48 = _screenSizeAndInvSize.x / _screenSizeAndInvSize.y;
  if (_30 > 0.0f) {
    float _61 = saturate(_30 * 2.0f);
    int _69 = WaveReadLaneFirst(_materialIndex);
    int _77 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_69 < (uint)170000), _69, 0)) + 0u))]._noiseTex);
    float4 _84 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_77 < (uint)65000), _77, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((TEXCOORD.x * 2.0f) * _48), ((_time.x * 0.019999999552965164f) + (TEXCOORD.y * 2.0f))));
    float _87 = TEXCOORD.x + -0.5f;
    float _88 = TEXCOORD.y + -0.5f;
    float _89 = _48 * _87;
    float _91 = atan(_88 / _89);
    bool _94 = (_89 < 0.0f);
    bool _95 = (_89 == 0.0f);
    bool _96 = (_88 >= 0.0f);
    bool _97 = (_88 < 0.0f);
    float _106 = select(((_96) && (_95)), 0.5f, select(((_97) && (_95)), -0.5f, (select(((_97) && (_94)), (_91 + -3.1415927410125732f), select(((_96) && (_94)), (_91 + 3.1415927410125732f), _91)) * 0.31830987334251404f)));
    float _108 = _88 * _88;
    float _110 = sqrt((_89 * _89) + _108);
    float _116 = _time.x * 0.20000000298023224f;
    int _119 = WaveReadLaneFirst(_materialIndex);
    int _127 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_119 < (uint)170000), _119, 0)) + 0u))]._noiseTex);
    float4 _134 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_127 < (uint)65000), _127, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_48 * 2.0f) * _106) - _116), ((_110 * 0.5f) - _116)));
    float _136 = 1.0f - _61;
    float _138 = (_61 * 2.0f) + -1.0f;
    float _150 = saturate((_110 - ((_136 * 1.5f) * ((((_134.x + -1.0f) + ((_84.w - _134.x) * saturate(_138))) * _61) + 1.0f))) / _136);
    float _153 = saturate(1.5f - abs(_138));
    int _162 = WaveReadLaneFirst(_materialIndex);
    int _170 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_162 < (uint)170000), _162, 0)) + 0u))]._noiseTex);
    float4 _177 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_170 < (uint)65000), _170, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_106 * _48) * 6.0f) - (_time.x * 0.20000000298023224f)), ((_110 - _time.x) * 0.5f)));
    float _187 = saturate(sqrt(_108 + (_87 * _87))) * (_153 * 4.0f);
    float _200 = ((saturate(1.5f - abs((_150 * 2.0f) + -1.0f)) * 4.0f) * saturate((1.0f - _150) * 5.0f)) + _153;
    float _203 = (_200 + (_187 * (_177.x + -0.5f))) * _87;
    float _205 = (_200 + (_187 * (_177.y + -0.5f))) * _88;
    float4 _211 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - (_203 * 0.03333333507180214f)), (TEXCOORD.y - (_205 * 0.03333333507180214f))));
    float _221 = (pow(_211.x, 0.012683313339948654f));
    float _222 = (pow(_211.y, 0.012683313339948654f));
    float _223 = (pow(_211.z, 0.012683313339948654f));
    float4 _252 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - (_203 * 0.06666667014360428f)), (TEXCOORD.y - (_205 * 0.06666667014360428f))));
    float _262 = (pow(_252.x, 0.012683313339948654f));
    float _263 = (pow(_252.y, 0.012683313339948654f));
    float _264 = (pow(_252.z, 0.012683313339948654f));
    float4 _296 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - (_203 * 0.10000000149011612f)), (TEXCOORD.y - (_205 * 0.10000000149011612f))));
    float _306 = (pow(_296.x, 0.012683313339948654f));
    float _307 = (pow(_296.y, 0.012683313339948654f));
    float _308 = (pow(_296.z, 0.012683313339948654f));
    float _336 = ((exp2(log2(max(0.0f, (_262 + -0.8359375f)) / (18.8515625f - (_262 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_221 + -0.8359375f)) / (18.8515625f - (_221 * 18.6875f))) * 6.277394771575928f)) + exp2(log2(max(0.0f, (_306 + -0.8359375f)) / (18.8515625f - (_306 * 18.6875f))) * 6.277394771575928f)) * 2500.0f;
    float _337 = ((exp2(log2(max(0.0f, (_263 + -0.8359375f)) / (18.8515625f - (_263 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_222 + -0.8359375f)) / (18.8515625f - (_222 * 18.6875f))) * 6.277394771575928f)) + exp2(log2(max(0.0f, (_307 + -0.8359375f)) / (18.8515625f - (_307 * 18.6875f))) * 6.277394771575928f)) * 2500.0f;
    float _338 = ((exp2(log2(max(0.0f, (_264 + -0.8359375f)) / (18.8515625f - (_264 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_223 + -0.8359375f)) / (18.8515625f - (_223 * 18.6875f))) * 6.277394771575928f)) + exp2(log2(max(0.0f, (_308 + -0.8359375f)) / (18.8515625f - (_308 * 18.6875f))) * 6.277394771575928f)) * 2500.0f;
    float _339 = dot(float3(_336, _337, _338), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
    int _349 = WaveReadLaneFirst(_materialIndex);
    int _357 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_349 < (uint)170000), _349, 0)) + 0u))]._berserkColor);
    float _360 = float((uint)((uint)(((uint)((uint)(_357)) >> 16) & 255)));
    float _363 = float((uint)((uint)(((uint)((uint)(_357)) >> 8) & 255)));
    float _365 = float((uint)((uint)(_357 & 255)));
    float _390 = select(((_360 * 0.003921568859368563f) < 0.040449999272823334f), (_360 * 0.0003035269910469651f), exp2(log2((_360 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _391 = select(((_363 * 0.003921568859368563f) < 0.040449999272823334f), (_363 * 0.0003035269910469651f), exp2(log2((_363 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _392 = select(((_365 * 0.003921568859368563f) < 0.040449999272823334f), (_365 * 0.0003035269910469651f), exp2(log2((_365 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _402 = (((_390 + -1.0f) * 0.800000011920929f) + 1.0f) * _336;
    float _403 = (((_391 + -1.0f) * 0.800000011920929f) + 1.0f) * _337;
    float _404 = (((_392 + -1.0f) * 0.800000011920929f) + 1.0f) * _338;
    float _407 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    float _412 = saturate((_407.x + (_84.z * 0.02500000037252903f)) * 12.5f);
    float _416 = (_412 * _412) * (3.0f - (_412 * 2.0f));
    float _423 = (_416 * ((lerp(_336, _339, 0.800000011920929f)) - _402)) + _402;
    float _424 = (_416 * ((lerp(_337, _339, 0.800000011920929f)) - _403)) + _403;
    float _425 = (_416 * ((lerp(_338, _339, 0.800000011920929f)) - _404)) + _404;
    float _428 = saturate((_30 + -0.5f) * 2.0f);
    float _431 = max(0.0010000000474974513f, _exposure0.x);
    _445 = _150;
    _446 = ((((_390 / _431) - _423) * _428) + _423);
    _447 = ((((_391 / _431) - _424) * _428) + _424);
    _448 = ((((_392 / _431) - _425) * _428) + _425);
  } else {
    _445 = 0.0f;
    _446 = 0.0f;
    _447 = 0.0f;
    _448 = 0.0f;
  }
  uint _450 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _457 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_450), 0));
    _463 = (float((uint)((uint)(_457.x & 127))) + 0.5f);
  } else {
    _463 = saturate(_445);
  }
  bool _466 = (_localToneMappingParams.w > 0.0f);
  if (_466) {
    float3 output_color = TonemapReplacer(float3(_446, _447, _448));
    _819 = output_color.x;
    _820 = output_color.y;
    _821 = output_color.z;
  } else {
    _819 = _446;
    _820 = _447;
    _821 = _448;
  }
  if (_etcParams.y > 1.0f) {
    float _830 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _831 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _835 = saturate(1.0f - (dot(float2(_830, _831), float2(_830, _831)) * saturate(_etcParams.y + -1.0f)));
    _840 = (_835 * _819);
    _841 = (_835 * _820);
    _842 = (_835 * _821);
  } else {
    _840 = _819;
    _841 = _820;
    _842 = _821;
  }
  if ((_466) && ((_etcParams.z > 0.0f))) {
    _872 = select((_840 <= 0.0031308000907301903f), (_840 * 12.920000076293945f), (((pow(_840, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _873 = select((_841 <= 0.0031308000907301903f), (_841 * 12.920000076293945f), (((pow(_841, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _874 = select((_842 <= 0.0031308000907301903f), (_842 * 12.920000076293945f), (((pow(_842, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _872 = _840;
    _873 = _841;
    _874 = _842;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _879 = float((uint)_450);
    if (!(_879 < _viewDir.w)) {
      if (!(_879 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _888 = _872;
        _889 = _873;
        _890 = _874;
      } else {
        _888 = 0.0f;
        _889 = 0.0f;
        _890 = 0.0f;
      }
    } else {
      _888 = 0.0f;
      _889 = 0.0f;
      _890 = 0.0f;
    }
  } else {
    _888 = _872;
    _889 = _873;
    _890 = _874;
  }
  float _900 = exp2(log2(_888 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _901 = exp2(log2(_889 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _902 = exp2(log2(_890 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_900 * 18.6875f) + 1.0f)) * ((_900 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_901 * 18.6875f) + 1.0f)) * ((_901 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_902 * 18.6875f) + 1.0f)) * ((_902 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _463;
  return SV_Target;
}