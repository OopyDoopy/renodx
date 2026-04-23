#include "../tonemap.hlsli"

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

cbuffer __3__1__0__0__PostProcessMaterialIndex : register(b2, space1) {
  int _materialIndex : packoffset(c000.x);
  int _passIndex : packoffset(c000.y);
};

ConstantBuffer<PostProcessWeatherBlendStruct> BindlessParameters_PostProcessWeatherBlend[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _18[36];
  float4 _41 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
  float _51 = (pow(_41.x, 0.012683313339948654f));
  float _52 = (pow(_41.y, 0.012683313339948654f));
  float _53 = (pow(_41.z, 0.012683313339948654f));
  float _75 = exp2(log2(max(0.0f, (_51 + -0.8359375f)) / (18.8515625f - (_51 * 18.6875f))) * 6.277394771575928f);
  float _76 = exp2(log2(max(0.0f, (_52 + -0.8359375f)) / (18.8515625f - (_52 * 18.6875f))) * 6.277394771575928f);
  float _77 = exp2(log2(max(0.0f, (_53 + -0.8359375f)) / (18.8515625f - (_53 * 18.6875f))) * 6.277394771575928f);
  float _78 = _75 * 10000.0f;
  float _79 = _76 * 10000.0f;
  float _80 = _77 * 10000.0f;
  int _81 = WaveReadLaneFirst(_materialIndex);
  float _89 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_81 < (uint)170000), _81, 0)) + 0u))]._blendRatio);
  int _90 = WaveReadLaneFirst(_materialIndex);
  float _412;
  float _413;
  float _414;
  float _428;
  float _674;
  float _675;
  float _676;
  float _796;
  float _797;
  float _798;
  float _819;
  float _820;
  float _821;
  float _854;
  float _855;
  float _856;
  float _870;
  float _871;
  float _872;
  if (((_89 >= 0.009999999776482582f)) && ((WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_90 < (uint)170000), _90, 0)) + 0u))]._enableBlend) > 0.009999999776482582f))) {
    int _109 = WaveReadLaneFirst(_materialIndex);
    int _117 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_109 < (uint)170000), _109, 0)) + 0u))]._noiseTex);
    float4 _124 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_117 < (uint)65000), _117, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, ((_time.x * 0.20000000298023224f) + TEXCOORD.y)));
    float4 _131 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    float _142 = (pow(_131.x, 0.012683313339948654f));
    float _143 = (pow(_131.y, 0.012683313339948654f));
    float _144 = (pow(_131.z, 0.012683313339948654f));
    float _172 = _131.w * 10000.0f;
    float _176 = ((exp2(log2(max(0.0f, (_142 + -0.8359375f)) / (18.8515625f - (_142 * 18.6875f))) * 6.277394771575928f) - _75) * _172) + _78;
    float _177 = ((exp2(log2(max(0.0f, (_143 + -0.8359375f)) / (18.8515625f - (_143 * 18.6875f))) * 6.277394771575928f) - _76) * _172) + _79;
    float _178 = ((exp2(log2(max(0.0f, (_144 + -0.8359375f)) / (18.8515625f - (_144 * 18.6875f))) * 6.277394771575928f) - _77) * _172) + _80;
    float _179 = TEXCOORD.x + -0.5f;
    float _180 = TEXCOORD.y + -0.5f;
    float _182 = atan(_180 / _179);
    bool _185 = (_179 < 0.0f);
    bool _186 = (_179 == 0.0f);
    bool _187 = (_180 >= 0.0f);
    bool _188 = (_180 < 0.0f);
    float _197 = select(((_186) && (_187)), 0.5f, select(((_186) && (_188)), -0.5f, (select(((_185) && (_188)), (_182 + -3.1415927410125732f), select(((_185) && (_187)), (_182 + 3.1415927410125732f), _182)) * 0.31830987334251404f)));
    float _201 = sqrt((_180 * _180) + (_179 * _179));
    int _216 = WaveReadLaneFirst(_materialIndex);
    int _224 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_216 < (uint)170000), _216, 0)) + 0u))]._noiseTex);
    float4 _231 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_224 < (uint)65000), _224, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_time.x * -0.20000000298023224f) - ((_124.z + -0.5f) * 0.5f)) + (_197 * 15.0f)), (((_201 * 2.0f) - ((_124.w + -0.5f) * 0.5f)) - (_time.x * 1.5f))));
    float _236 = (1.75f - saturate(_89 * 1.4285714626312256f)) * 0.5f;
    float _239 = max((abs(_179) - _236), 0.0f);
    float _240 = max((abs(_180) - _236), 0.0f);
    int _259 = WaveReadLaneFirst(_materialIndex);
    int _267 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_259 < (uint)170000), _259, 0)) + 0u))]._borderEdgeNoiseTexture);
    float4 _274 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_267 < (uint)65000), _267, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_197 * 9.0f) + (_124.x * 0.05000000074505806f)) - (_231.x * 0.10000000149011612f)), ((_201 + (_124.y * 0.05000000074505806f)) - ((_time.x + _231.x) * 0.10000000149011612f))));
    int _276 = WaveReadLaneFirst(_materialIndex);
    int _284 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_276 < (uint)170000), _276, 0)) + 0u))]._berserkColor);
    float _287 = float((uint)((uint)(((uint)((uint)(_284)) >> 16) & 255)));
    float _290 = float((uint)((uint)(((uint)((uint)(_284)) >> 8) & 255)));
    float _292 = float((uint)((uint)(_284 & 255)));
    float _322 = max(0.0010000000474974513f, _exposure0.x);
    float _328 = ((_274.y * _274.y) * saturate(sqrt((_240 * _240) + (_239 * _239)) * 6.666666507720947f)) * _274.y;
    float _335 = (((select(((_287 * 0.003921568859368563f) < 0.040449999272823334f), (_287 * 0.0003035269910469651f), exp2(log2((_287 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _322) - _176) * _328) + _176;
    float _336 = (((select(((_290 * 0.003921568859368563f) < 0.040449999272823334f), (_290 * 0.0003035269910469651f), exp2(log2((_290 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _322) - _177) * _328) + _177;
    float _337 = (((select(((_292 * 0.003921568859368563f) < 0.040449999272823334f), (_292 * 0.0003035269910469651f), exp2(log2((_292 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _322) - _178) * _328) + _178;
    int _338 = WaveReadLaneFirst(_materialIndex);
    int _346 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_338 < (uint)170000), _338, 0)) + 0u))]._berserkEndColor);
    float _349 = float((uint)((uint)(((uint)((uint)(_346)) >> 16) & 255)));
    float _352 = float((uint)((uint)(((uint)((uint)(_346)) >> 8) & 255)));
    float _354 = float((uint)((uint)(_346 & 255)));
    float _384 = max(0.0010000000474974513f, _exposure0.x);
    float _389 = select((_89 > 0.699999988079071f), 1.0f, 0.0f);
    float _396 = (((select(((_349 * 0.003921568859368563f) < 0.040449999272823334f), (_349 * 0.0003035269910469651f), exp2(log2((_349 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _384) - _335) * _389) + _335;
    float _397 = (((select(((_352 * 0.003921568859368563f) < 0.040449999272823334f), (_352 * 0.0003035269910469651f), exp2(log2((_352 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _384) - _336) * _389) + _336;
    float _398 = (((select(((_354 * 0.003921568859368563f) < 0.040449999272823334f), (_354 * 0.0003035269910469651f), exp2(log2((_354 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _384) - _337) * _389) + _337;
    float _401 = saturate((_89 + -0.800000011920929f) * 5.0f);
    _412 = (lerp(_396, _78, _401));
    _413 = (lerp(_397, _79, _401));
    _414 = (lerp(_398, _80, _401));
  } else {
    _412 = _78;
    _413 = _79;
    _414 = _80;
  }
  uint _415 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _422 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_415), 0));
    _428 = (float((uint)((uint)(_422.x & 127))) + 0.5f);
  } else {
    _428 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_412, _413, _414));
    _796 = output_color.x;
    _797 = output_color.y;
    _798 = output_color.z;
  } else {
    _796 = _412;
    _797 = _413;
    _798 = _414;
  }
  if (_etcParams.y > 1.0f) {
    float _809 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _810 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _814 = saturate(1.0f - (dot(float2(_809, _810), float2(_809, _810)) * saturate(_etcParams.y + -1.0f)));
    _819 = (_814 * _796);
    _820 = (_814 * _797);
    _821 = (_814 * _798);
  } else {
    _819 = _796;
    _820 = _797;
    _821 = _798;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _854 = select((_819 <= 0.0031308000907301903f), (_819 * 12.920000076293945f), (((pow(_819, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _855 = select((_820 <= 0.0031308000907301903f), (_820 * 12.920000076293945f), (((pow(_820, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _856 = select((_821 <= 0.0031308000907301903f), (_821 * 12.920000076293945f), (((pow(_821, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _854 = _819;
    _855 = _820;
    _856 = _821;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _861 = float((uint)_415);
    if (!(_861 < _viewDir.w)) {
      if (!(_861 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _870 = _854;
        _871 = _855;
        _872 = _856;
      } else {
        _870 = 0.0f;
        _871 = 0.0f;
        _872 = 0.0f;
      }
    } else {
      _870 = 0.0f;
      _871 = 0.0f;
      _872 = 0.0f;
    }
  } else {
    _870 = _854;
    _871 = _855;
    _872 = _856;
  }
  float _882 = exp2(log2(_870 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _883 = exp2(log2(_871 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _884 = exp2(log2(_872 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_882 * 18.6875f) + 1.0f)) * ((_882 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_883 * 18.6875f) + 1.0f)) * ((_883 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_884 * 18.6875f) + 1.0f)) * ((_884 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _428;
  return SV_Target;
}

