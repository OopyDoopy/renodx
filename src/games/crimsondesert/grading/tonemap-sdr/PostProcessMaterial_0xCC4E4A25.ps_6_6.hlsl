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
  float _346;
  float _347;
  float _348;
  float _349;
  float _364;
  float _569;
  float _570;
  float _571;
  float _664;
  float _665;
  float _666;
  float _720;
  float _721;
  float _722;
  float _741;
  float _742;
  float _743;
  float _773;
  float _774;
  float _775;
  float _789;
  float _790;
  float _791;
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
    float4 _219 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - (_203 * 0.06666667014360428f)), (TEXCOORD.y - (_205 * 0.06666667014360428f))));
    float4 _230 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - (_203 * 0.10000000149011612f)), (TEXCOORD.y - (_205 * 0.10000000149011612f))));
    float _237 = ((_219.x + _211.x) + _230.x) * 0.25f;
    float _238 = ((_219.y + _211.y) + _230.y) * 0.25f;
    float _239 = ((_219.z + _211.z) + _230.z) * 0.25f;
    float _240 = dot(float3(_237, _238, _239), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
    int _250 = WaveReadLaneFirst(_materialIndex);
    int _258 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_250 < (uint)170000), _250, 0)) + 0u))]._berserkColor);
    float _261 = float((uint)((uint)(((uint)((uint)(_258)) >> 16) & 255)));
    float _264 = float((uint)((uint)(((uint)((uint)(_258)) >> 8) & 255)));
    float _266 = float((uint)((uint)(_258 & 255)));
    float _291 = select(((_261 * 0.003921568859368563f) < 0.040449999272823334f), (_261 * 0.0003035269910469651f), exp2(log2((_261 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _292 = select(((_264 * 0.003921568859368563f) < 0.040449999272823334f), (_264 * 0.0003035269910469651f), exp2(log2((_264 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _293 = select(((_266 * 0.003921568859368563f) < 0.040449999272823334f), (_266 * 0.0003035269910469651f), exp2(log2((_266 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _303 = (((_291 + -1.0f) * 0.800000011920929f) + 1.0f) * _237;
    float _304 = (((_292 + -1.0f) * 0.800000011920929f) + 1.0f) * _238;
    float _305 = (((_293 + -1.0f) * 0.800000011920929f) + 1.0f) * _239;
    float _308 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    float _313 = saturate((_308.x + (_84.z * 0.02500000037252903f)) * 12.5f);
    float _317 = (_313 * _313) * (3.0f - (_313 * 2.0f));
    float _324 = (_317 * ((lerp(_237, _240, 0.800000011920929f)) - _303)) + _303;
    float _325 = (_317 * ((lerp(_238, _240, 0.800000011920929f)) - _304)) + _304;
    float _326 = (_317 * ((lerp(_239, _240, 0.800000011920929f)) - _305)) + _305;
    float _329 = saturate((_30 + -0.5f) * 2.0f);
    float _332 = max(0.0010000000474974513f, _exposure0.x);
    _346 = _150;
    _347 = ((((_291 / _332) - _324) * _329) + _324);
    _348 = ((((_292 / _332) - _325) * _329) + _325);
    _349 = ((((_293 / _332) - _326) * _329) + _326);
  } else {
    _346 = 0.0f;
    _347 = 0.0f;
    _348 = 0.0f;
    _349 = 0.0f;
  }
  uint _351 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _358 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_351), 0));
    _364 = (float((uint)((uint)(_358.x & 127))) + 0.5f);
  } else {
    _364 = saturate(_346);
  }
  bool _367 = (_localToneMappingParams.w > 0.0f);
  if (_367) {
    float3 output_color = TonemapReplacer(float3(_347, _348, _349));
    _720 = output_color.x;
    _721 = output_color.y;
    _722 = output_color.z;
  } else {
    _720 = _347;
    _721 = _348;
    _722 = _349;
  }
  if (_etcParams.y > 1.0f) {
    float _731 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _732 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _736 = saturate(1.0f - (dot(float2(_731, _732), float2(_731, _732)) * saturate(_etcParams.y + -1.0f)));
    _741 = (_736 * _720);
    _742 = (_736 * _721);
    _743 = (_736 * _722);
  } else {
    _741 = _720;
    _742 = _721;
    _743 = _722;
  }
  if ((_367) && ((_etcParams.z > 0.0f))) {
    _773 = select((_741 <= 0.0031308000907301903f), (_741 * 12.920000076293945f), (((pow(_741, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _774 = select((_742 <= 0.0031308000907301903f), (_742 * 12.920000076293945f), (((pow(_742, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _775 = select((_743 <= 0.0031308000907301903f), (_743 * 12.920000076293945f), (((pow(_743, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _773 = _741;
    _774 = _742;
    _775 = _743;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _780 = float((uint)_351);
    if (!(_780 < _viewDir.w)) {
      if (!(_780 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _789 = _773;
        _790 = _774;
        _791 = _775;
      } else {
        _789 = 0.0f;
        _790 = 0.0f;
        _791 = 0.0f;
      }
    } else {
      _789 = 0.0f;
      _790 = 0.0f;
      _791 = 0.0f;
    }
  } else {
    _789 = _773;
    _790 = _774;
    _791 = _775;
  }
  SV_Target.x = _789;
  SV_Target.y = _790;
  SV_Target.z = _791;
  SV_Target.w = _364;
  return SV_Target;
}