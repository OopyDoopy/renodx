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

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t33, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t75, space36);

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
  int _21 = WaveReadLaneFirst(_materialIndex);
  float _29 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_21 < (uint)170000), _21, 0)) + 0u))]._blendRatio);
  int _30 = WaveReadLaneFirst(_materialIndex);
  float _345;
  float _346;
  float _347;
  float _348;
  float _363;
  float _609;
  float _610;
  float _611;
  float _731;
  float _732;
  float _733;
  float _754;
  float _755;
  float _756;
  float _789;
  float _790;
  float _791;
  float _805;
  float _806;
  float _807;
  if (((_29 < 0.0010000000474974513f)) && ((WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_30 < (uint)170000), _30, 0)) + 0u))]._enableBlend) < 0.0010000000474974513f))) {
    if (true) discard;
  }
  float _47 = _screenSizeAndInvSize.x / _screenSizeAndInvSize.y;
  if (_29 > 0.0f) {
    float _60 = saturate(_29 * 2.0f);
    int _68 = WaveReadLaneFirst(_materialIndex);
    int _76 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_68 < (uint)170000), _68, 0)) + 0u))]._noiseTex);
    float4 _83 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_76 < (uint)65000), _76, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((TEXCOORD.x * 2.0f) * _47), ((_time.x * 0.019999999552965164f) + (TEXCOORD.y * 2.0f))));
    float _86 = TEXCOORD.x + -0.5f;
    float _87 = TEXCOORD.y + -0.5f;
    float _88 = _47 * _86;
    float _90 = atan(_87 / _88);
    bool _93 = (_88 < 0.0f);
    bool _94 = (_88 == 0.0f);
    bool _95 = (_87 >= 0.0f);
    bool _96 = (_87 < 0.0f);
    float _105 = select(((_95) && (_94)), 0.5f, select(((_96) && (_94)), -0.5f, (select(((_96) && (_93)), (_90 + -3.1415927410125732f), select(((_95) && (_93)), (_90 + 3.1415927410125732f), _90)) * 0.31830987334251404f)));
    float _107 = _87 * _87;
    float _109 = sqrt((_88 * _88) + _107);
    float _115 = _time.x * 0.20000000298023224f;
    int _118 = WaveReadLaneFirst(_materialIndex);
    int _126 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_118 < (uint)170000), _118, 0)) + 0u))]._noiseTex);
    float4 _133 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_126 < (uint)65000), _126, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_47 * 2.0f) * _105) - _115), ((_109 * 0.5f) - _115)));
    float _135 = 1.0f - _60;
    float _137 = (_60 * 2.0f) + -1.0f;
    float _149 = saturate((_109 - ((_135 * 1.5f) * ((((_133.x + -1.0f) + ((_83.w - _133.x) * saturate(_137))) * _60) + 1.0f))) / _135);
    float _152 = saturate(1.5f - abs(_137));
    int _161 = WaveReadLaneFirst(_materialIndex);
    int _169 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_161 < (uint)170000), _161, 0)) + 0u))]._noiseTex);
    float4 _176 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_169 < (uint)65000), _169, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_105 * _47) * 6.0f) - (_time.x * 0.20000000298023224f)), ((_109 - _time.x) * 0.5f)));
    float _186 = saturate(sqrt(_107 + (_86 * _86))) * (_152 * 4.0f);
    float _199 = ((saturate(1.5f - abs((_149 * 2.0f) + -1.0f)) * 4.0f) * saturate((1.0f - _149) * 5.0f)) + _152;
    float _202 = (_199 + (_186 * (_176.x + -0.5f))) * _86;
    float _204 = (_199 + (_186 * (_176.y + -0.5f))) * _87;
    float4 _210 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - (_202 * 0.03333333507180214f)), (TEXCOORD.y - (_204 * 0.03333333507180214f))));
    float4 _218 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - (_202 * 0.06666667014360428f)), (TEXCOORD.y - (_204 * 0.06666667014360428f))));
    float4 _229 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - (_202 * 0.10000000149011612f)), (TEXCOORD.y - (_204 * 0.10000000149011612f))));
    float _236 = ((_218.x + _210.x) + _229.x) * 0.25f;
    float _237 = ((_218.y + _210.y) + _229.y) * 0.25f;
    float _238 = ((_218.z + _210.z) + _229.z) * 0.25f;
    float _239 = dot(float3(_236, _237, _238), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
    int _249 = WaveReadLaneFirst(_materialIndex);
    int _257 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_249 < (uint)170000), _249, 0)) + 0u))]._berserkColor);
    float _260 = float((uint)((uint)(((uint)((uint)(_257)) >> 16) & 255)));
    float _263 = float((uint)((uint)(((uint)((uint)(_257)) >> 8) & 255)));
    float _265 = float((uint)((uint)(_257 & 255)));
    float _290 = select(((_260 * 0.003921568859368563f) < 0.040449999272823334f), (_260 * 0.0003035269910469651f), exp2(log2((_260 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _291 = select(((_263 * 0.003921568859368563f) < 0.040449999272823334f), (_263 * 0.0003035269910469651f), exp2(log2((_263 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _292 = select(((_265 * 0.003921568859368563f) < 0.040449999272823334f), (_265 * 0.0003035269910469651f), exp2(log2((_265 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _302 = (((_290 + -1.0f) * 0.800000011920929f) + 1.0f) * _236;
    float _303 = (((_291 + -1.0f) * 0.800000011920929f) + 1.0f) * _237;
    float _304 = (((_292 + -1.0f) * 0.800000011920929f) + 1.0f) * _238;
    float _307 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    float _312 = saturate((_307.x + (_83.z * 0.02500000037252903f)) * 12.5f);
    float _316 = (_312 * _312) * (3.0f - (_312 * 2.0f));
    float _323 = (_316 * ((lerp(_236, _239, 0.800000011920929f)) - _302)) + _302;
    float _324 = (_316 * ((lerp(_237, _239, 0.800000011920929f)) - _303)) + _303;
    float _325 = (_316 * ((lerp(_238, _239, 0.800000011920929f)) - _304)) + _304;
    float _328 = saturate((_29 + -0.5f) * 2.0f);
    float _331 = max(0.0010000000474974513f, _exposure0.x);
    _345 = _149;
    _346 = ((((_290 / _331) - _323) * _328) + _323);
    _347 = ((((_291 / _331) - _324) * _328) + _324);
    _348 = ((((_292 / _331) - _325) * _328) + _325);
  } else {
    _345 = 0.0f;
    _346 = 0.0f;
    _347 = 0.0f;
    _348 = 0.0f;
  }
  uint _350 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _357 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_350), 0));
    _363 = (float((uint)((uint)(_357.x & 127))) + 0.5f);
  } else {
    _363 = saturate(_345);
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_346, _347, _348));
    _731 = output_color.x;
    _732 = output_color.y;
    _733 = output_color.z;
  } else {
    _731 = _346;
    _732 = _347;
    _733 = _348;
  }
  if (_etcParams.y > 1.0f) {
    float _744 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _745 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _749 = saturate(1.0f - (dot(float2(_744, _745), float2(_744, _745)) * saturate(_etcParams.y + -1.0f)));
    _754 = (_749 * _731);
    _755 = (_749 * _732);
    _756 = (_749 * _733);
  } else {
    _754 = _731;
    _755 = _732;
    _756 = _733;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _789 = select((_754 <= 0.0031308000907301903f), (_754 * 12.920000076293945f), (((pow(_754, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _790 = select((_755 <= 0.0031308000907301903f), (_755 * 12.920000076293945f), (((pow(_755, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _791 = select((_756 <= 0.0031308000907301903f), (_756 * 12.920000076293945f), (((pow(_756, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _789 = _754;
    _790 = _755;
    _791 = _756;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _796 = float((uint)_350);
    if (!(_796 < _viewDir.w)) {
      if (!(_796 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _805 = _789;
        _806 = _790;
        _807 = _791;
      } else {
        _805 = 0.0f;
        _806 = 0.0f;
        _807 = 0.0f;
      }
    } else {
      _805 = 0.0f;
      _806 = 0.0f;
      _807 = 0.0f;
    }
  } else {
    _805 = _789;
    _806 = _790;
    _807 = _791;
  }
  SV_Target.x = _805;
  SV_Target.y = _806;
  SV_Target.z = _807;
  SV_Target.w = _363;
  return SV_Target;
}

