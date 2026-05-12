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

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t37, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t29, space36);

#if 0 // Provided by tonemap.hlsli
cbuffer __3__35__0__0__SceneConstantBuffer : register(b16, space35) {
  uint4 __3__35__0__0__SceneConstantBuffer_raw[172];
};
#endif

#if 0 // Provided by tonemap.hlsli
cbuffer __3__35__0__0__ExposureConstantBuffer : register(b31, space35) {
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
  int _colorBlindParam : packoffset(c012.x);
  int _nightToneParm : packoffset(c012.y);
  int2 _padding : packoffset(c012.z);
};
#endif

cbuffer __3__1__0__0__PostProcessMaterialIndex : register(b2, space1) {
  int _materialIndex : packoffset(c000.x);
  int _passIndex : packoffset(c000.y);
};

struct BindlessParameters_PostProcessWeatherBlend {
  PostProcessWeatherBlendStruct BindlessParameters_PostProcessWeatherBlend;
};

typedef BindlessParameters_PostProcessWeatherBlend BindlessParameters_PostProcessWeatherBlend_t;
ConstantBuffer<BindlessParameters_PostProcessWeatherBlend_t> BindlessParameters_PostProcessWeatherBlend[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  int _21;
  float _29;
  int _30;
  float _38;
  float _444;
  float _445;
  float _446;
  float _447;
  float _462;
  float _667;
  float _668;
  float _669;
  float _762;
  float _763;
  float _764;
  float _884;
  float _885;
  float _886;
  float _907;
  float _908;
  float _909;
  float _942;
  float _943;
  float _944;
  float _958;
  float _959;
  float _960;
  float _47;
  float _60;
  int _68;
  int _76;
  float4 _83;
  float _86;
  float _87;
  float _88;
  float _90;
  bool _93;
  bool _94;
  bool _95;
  bool _96;
  float _105;
  float _107;
  float _109;
  float _115;
  int _118;
  int _126;
  float4 _133;
  float _135;
  float _137;
  float _149;
  float _152;
  int _161;
  int _169;
  float4 _176;
  float _186;
  float _199;
  float _202;
  float _204;
  float4 _210;
  float _220;
  float _221;
  float _222;
  float4 _251;
  float _261;
  float _262;
  float _263;
  float4 _295;
  float _305;
  float _306;
  float _307;
  float _335;
  float _336;
  float _337;
  float _338;
  int _348;
  int _356;
  float _359;
  float _362;
  float _364;
  float _389;
  float _390;
  float _391;
  float _401;
  float _402;
  float _403;
  float _411;
  float _415;
  float _422;
  float _423;
  float _424;
  float _427;
  float _430;
  uint _449;
  float _471;
  float _520;
  float _521;
  float _522;
  float _524;
  float _531;
  float _532;
  float _533;
  float _552;
  float _553;
  float _554;
  float _555;
  float _556;
  float _557;
  float _558;
  float _559;
  float _560;
  float _606;
  float _607;
  float _608;
  float _609;
  float _610;
  float _611;
  float _612;
  float _629;
  float _630;
  float _631;
  float _632;
  float _638;
  float _641;
  float _648;
  float _649;
  float _650;
  float _679;
  float _704;
  float _705;
  float _706;
  float _725;
  float _726;
  float _727;
  float _733;
  float _737;
  float _738;
  float _739;
  float _740;
  float _745;
  float _770;
  float _774;
  float _775;
  float _776;
  float _777;
  int _818;
  float _873;
  float _897;
  float _898;
  float _902;
  float _949;
  float _970;
  float _971;
  float _972;
  float _18[36];
  _21 = WaveReadLaneFirst(_materialIndex);
  _29 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_21 < (uint)170000), _21, 0)) + 0u))].BindlessParameters_PostProcessWeatherBlend._blendRatio);
  _30 = WaveReadLaneFirst(_materialIndex);
  _38 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_30 < (uint)170000), _30, 0)) + 0u))].BindlessParameters_PostProcessWeatherBlend._enableBlend);
  if ((_29 < 0.0010000000474974513f) && (_38 < 0.0010000000474974513f)) {
    if (true) discard;
  }
  _47 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].x) / asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y);
  if (_29 > 0.0f) {
    _60 = saturate(_29 * 2.0f);
    _68 = WaveReadLaneFirst(_materialIndex);
    _76 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_68 < (uint)170000), _68, 0)) + 0u))].BindlessParameters_PostProcessWeatherBlend._noiseTex);
    _83 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_76 < (uint)65000), _76, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((TEXCOORD.x * 2.0f) * _47), ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.019999999552965164f) + (TEXCOORD.y * 2.0f))));
    _86 = TEXCOORD.x + -0.5f;
    _87 = TEXCOORD.y + -0.5f;
    _88 = _47 * _86;
    _90 = atan(_87 / _88);
    _93 = (_88 < 0.0f);
    _94 = (_88 == 0.0f);
    _95 = (_87 >= 0.0f);
    _96 = (_87 < 0.0f);
    _105 = select((_95 && _94), 0.5f, select((_96 && _94), -0.5f, (select((_96 && _93), (_90 + -3.1415927410125732f), select((_95 && _93), (_90 + 3.1415927410125732f), _90)) * 0.31830987334251404f)));
    _107 = _87 * _87;
    _109 = sqrt((_88 * _88) + _107);
    _115 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.20000000298023224f;
    _118 = WaveReadLaneFirst(_materialIndex);
    _126 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_118 < (uint)170000), _118, 0)) + 0u))].BindlessParameters_PostProcessWeatherBlend._noiseTex);
    _133 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_126 < (uint)65000), _126, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_47 * 2.0f) * _105) - _115), ((_109 * 0.5f) - _115)));
    _135 = 1.0f - _60;
    _137 = (_60 * 2.0f) + -1.0f;
    _149 = saturate((_109 - ((_135 * 1.5f) * ((((_133.x + -1.0f) + ((_83.w - _133.x) * saturate(_137))) * _60) + 1.0f))) / _135);
    _152 = saturate(1.5f - abs(_137));
    _161 = WaveReadLaneFirst(_materialIndex);
    _169 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_161 < (uint)170000), _161, 0)) + 0u))].BindlessParameters_PostProcessWeatherBlend._noiseTex);
    _176 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_169 < (uint)65000), _169, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_105 * _47) * 6.0f) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.20000000298023224f)), ((_109 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x)) * 0.5f)));
    _186 = saturate(sqrt(_107 + (_86 * _86))) * (_152 * 4.0f);
    _199 = ((saturate(1.5f - abs((_149 * 2.0f) + -1.0f)) * 4.0f) * saturate((1.0f - _149) * 5.0f)) + _152;
    _202 = (_199 + (_186 * (_176.x + -0.5f))) * _86;
    _204 = (_199 + (_186 * (_176.y + -0.5f))) * _87;
    _210 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - (_202 * 0.03333333507180214f)), (TEXCOORD.y - (_204 * 0.03333333507180214f))));
    _220 = (pow(_210.x, 0.012683313339948654f));
    _221 = (pow(_210.y, 0.012683313339948654f));
    _222 = (pow(_210.z, 0.012683313339948654f));
    _251 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - (_202 * 0.06666667014360428f)), (TEXCOORD.y - (_204 * 0.06666667014360428f))));
    _261 = (pow(_251.x, 0.012683313339948654f));
    _262 = (pow(_251.y, 0.012683313339948654f));
    _263 = (pow(_251.z, 0.012683313339948654f));
    _295 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - (_202 * 0.10000000149011612f)), (TEXCOORD.y - (_204 * 0.10000000149011612f))));
    _305 = (pow(_295.x, 0.012683313339948654f));
    _306 = (pow(_295.y, 0.012683313339948654f));
    _307 = (pow(_295.z, 0.012683313339948654f));
    _335 = ((exp2(log2(max(0.0f, (_261 + -0.8359375f)) / (18.8515625f - (_261 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_220 + -0.8359375f)) / (18.8515625f - (_220 * 18.6875f))) * 6.277394771575928f)) + exp2(log2(max(0.0f, (_305 + -0.8359375f)) / (18.8515625f - (_305 * 18.6875f))) * 6.277394771575928f)) * 2500.0f;
    _336 = ((exp2(log2(max(0.0f, (_262 + -0.8359375f)) / (18.8515625f - (_262 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_221 + -0.8359375f)) / (18.8515625f - (_221 * 18.6875f))) * 6.277394771575928f)) + exp2(log2(max(0.0f, (_306 + -0.8359375f)) / (18.8515625f - (_306 * 18.6875f))) * 6.277394771575928f)) * 2500.0f;
    _337 = ((exp2(log2(max(0.0f, (_263 + -0.8359375f)) / (18.8515625f - (_263 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_222 + -0.8359375f)) / (18.8515625f - (_222 * 18.6875f))) * 6.277394771575928f)) + exp2(log2(max(0.0f, (_307 + -0.8359375f)) / (18.8515625f - (_307 * 18.6875f))) * 6.277394771575928f)) * 2500.0f;
    _338 = dot(float3(_335, _336, _337), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
    _348 = WaveReadLaneFirst(_materialIndex);
    _356 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_348 < (uint)170000), _348, 0)) + 0u))].BindlessParameters_PostProcessWeatherBlend._berserkColor);
    _359 = float((uint)((uint)(((uint)(_356) >> 16) & 255)));
    _362 = float((uint)((uint)(((uint)(_356) >> 8) & 255)));
    _364 = float((uint)((uint)(_356 & 255)));
    _389 = select(((_359 * 0.003921568859368563f) < 0.040449999272823334f), (_359 * 0.0003035269910469651f), exp2(log2((_359 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _390 = select(((_362 * 0.003921568859368563f) < 0.040449999272823334f), (_362 * 0.0003035269910469651f), exp2(log2((_362 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _391 = select(((_364 * 0.003921568859368563f) < 0.040449999272823334f), (_364 * 0.0003035269910469651f), exp2(log2((_364 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _401 = (((_389 + -1.0f) * 0.800000011920929f) + 1.0f) * _335;
    _402 = (((_390 + -1.0f) * 0.800000011920929f) + 1.0f) * _336;
    _403 = (((_391 + -1.0f) * 0.800000011920929f) + 1.0f) * _337;
    _411 = saturate((((__3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y))).x) + (_83.z * 0.02500000037252903f)) * 12.5f);
    _415 = (_411 * _411) * (3.0f - (_411 * 2.0f));
    _422 = (_415 * ((lerp(_335, _338, 0.800000011920929f)) - _401)) + _401;
    _423 = (_415 * ((lerp(_336, _338, 0.800000011920929f)) - _402)) + _402;
    _424 = (_415 * ((lerp(_337, _338, 0.800000011920929f)) - _403)) + _403;
    _427 = saturate((_29 + -0.5f) * 2.0f);
    _430 = max(0.0010000000474974513f, _exposure0.x);
    _444 = _149;
    _445 = ((((_389 / _430) - _422) * _427) + _422);
    _446 = ((((_390 / _430) - _423) * _427) + _423);
    _447 = ((((_391 / _430) - _424) * _427) + _424);
  } else {
    _444 = 0.0f;
    _445 = 0.0f;
    _446 = 0.0f;
    _447 = 0.0f;
  }
  _449 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _462 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _449, 0)))).x) & 127))) + 0.5f);
  } else {
    _462 = saturate(_444);
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_445, _446, _447));
    _884 = output_color.x;
    _885 = output_color.y;
    _886 = output_color.z;
  } else {
    _884 = _445;
    _885 = _446;
    _886 = _447;
  }
  if (_etcParams.y > 1.0f) {
    _897 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _898 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _902 = saturate(1.0f - (dot(float2(_897, _898), float2(_897, _898)) * saturate(_etcParams.y + -1.0f)));
    _907 = (_902 * _884);
    _908 = (_902 * _885);
    _909 = (_902 * _886);
  } else {
    _907 = _884;
    _908 = _885;
    _909 = _886;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _942 = select((_907 <= 0.0031308000907301903f), (_907 * 12.920000076293945f), (((pow(_907, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _943 = select((_908 <= 0.0031308000907301903f), (_908 * 12.920000076293945f), (((pow(_908, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _944 = select((_909 <= 0.0031308000907301903f), (_909 * 12.920000076293945f), (((pow(_909, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _942 = _907;
    _943 = _908;
    _944 = _909;
  }
  if (!(_etcParams.y < 1.0f)) {
    _949 = float((uint)_449);
    if (!(_949 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_949 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _958 = _942;
        _959 = _943;
        _960 = _944;
      } else {
        _958 = 0.0f;
        _959 = 0.0f;
        _960 = 0.0f;
      }
    } else {
      _958 = 0.0f;
      _959 = 0.0f;
      _960 = 0.0f;
    }
  } else {
    _958 = _942;
    _959 = _943;
    _960 = _944;
  }
  _970 = exp2(log2(_958 * 9.999999747378752e-05f) * 0.1593017578125f);
  _971 = exp2(log2(_959 * 9.999999747378752e-05f) * 0.1593017578125f);
  _972 = exp2(log2(_960 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_970 * 18.6875f) + 1.0f)) * ((_970 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_971 * 18.6875f) + 1.0f)) * ((_971 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_972 * 18.6875f) + 1.0f)) * ((_972 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _462;
  return SV_Target;
}