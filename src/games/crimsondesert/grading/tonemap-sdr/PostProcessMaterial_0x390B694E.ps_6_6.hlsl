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

cbuffer __3__35__0__0__SceneConstantBuffer : register(b16, space35) {
  uint4 __3__35__0__0__SceneConstantBuffer_raw[172];
};

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
  float _345;
  float _346;
  float _347;
  float _348;
  float _363;
  float _568;
  float _569;
  float _570;
  float _663;
  float _664;
  float _665;
  float _785;
  float _786;
  float _787;
  float _808;
  float _809;
  float _810;
  float _843;
  float _844;
  float _845;
  float _859;
  float _860;
  float _861;
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
  float4 _218;
  float4 _229;
  float _236;
  float _237;
  float _238;
  float _239;
  int _249;
  int _257;
  float _260;
  float _263;
  float _265;
  float _290;
  float _291;
  float _292;
  float _302;
  float _303;
  float _304;
  float _312;
  float _316;
  float _323;
  float _324;
  float _325;
  float _328;
  float _331;
  uint _350;
  float _372;
  float _421;
  float _422;
  float _423;
  float _425;
  float _432;
  float _433;
  float _434;
  float _453;
  float _454;
  float _455;
  float _456;
  float _457;
  float _458;
  float _459;
  float _460;
  float _461;
  float _507;
  float _508;
  float _509;
  float _510;
  float _511;
  float _512;
  float _513;
  float _530;
  float _531;
  float _532;
  float _533;
  float _539;
  float _542;
  float _549;
  float _550;
  float _551;
  float _580;
  float _605;
  float _606;
  float _607;
  float _626;
  float _627;
  float _628;
  float _634;
  float _638;
  float _639;
  float _640;
  float _641;
  float _646;
  float _671;
  float _675;
  float _676;
  float _677;
  float _678;
  int _719;
  float _774;
  float _798;
  float _799;
  float _803;
  float _850;
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
    _218 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - (_202 * 0.06666667014360428f)), (TEXCOORD.y - (_204 * 0.06666667014360428f))));
    _229 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - (_202 * 0.10000000149011612f)), (TEXCOORD.y - (_204 * 0.10000000149011612f))));
    _236 = ((_218.x + _210.x) + _229.x) * 0.25f;
    _237 = ((_218.y + _210.y) + _229.y) * 0.25f;
    _238 = ((_218.z + _210.z) + _229.z) * 0.25f;
    _239 = dot(float3(_236, _237, _238), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
    _249 = WaveReadLaneFirst(_materialIndex);
    _257 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_249 < (uint)170000), _249, 0)) + 0u))].BindlessParameters_PostProcessWeatherBlend._berserkColor);
    _260 = float((uint)((uint)(((uint)(_257) >> 16) & 255)));
    _263 = float((uint)((uint)(((uint)(_257) >> 8) & 255)));
    _265 = float((uint)((uint)(_257 & 255)));
    _290 = select(((_260 * 0.003921568859368563f) < 0.040449999272823334f), (_260 * 0.0003035269910469651f), exp2(log2((_260 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _291 = select(((_263 * 0.003921568859368563f) < 0.040449999272823334f), (_263 * 0.0003035269910469651f), exp2(log2((_263 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _292 = select(((_265 * 0.003921568859368563f) < 0.040449999272823334f), (_265 * 0.0003035269910469651f), exp2(log2((_265 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _302 = (((_290 + -1.0f) * 0.800000011920929f) + 1.0f) * _236;
    _303 = (((_291 + -1.0f) * 0.800000011920929f) + 1.0f) * _237;
    _304 = (((_292 + -1.0f) * 0.800000011920929f) + 1.0f) * _238;
    _312 = saturate((((__3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y))).x) + (_83.z * 0.02500000037252903f)) * 12.5f);
    _316 = (_312 * _312) * (3.0f - (_312 * 2.0f));
    _323 = (_316 * ((lerp(_236, _239, 0.800000011920929f)) - _302)) + _302;
    _324 = (_316 * ((lerp(_237, _239, 0.800000011920929f)) - _303)) + _303;
    _325 = (_316 * ((lerp(_238, _239, 0.800000011920929f)) - _304)) + _304;
    _328 = saturate((_29 + -0.5f) * 2.0f);
    _331 = max(0.0010000000474974513f, _exposure0.x);
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
  _350 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _363 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _350, 0)))).x) & 127))) + 0.5f);
  } else {
    _363 = saturate(_345);
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_346, _347, _348));
    _785 = output_color.x;
    _786 = output_color.y;
    _787 = output_color.z;
  } else {
    _785 = _346;
    _786 = _347;
    _787 = _348;
  }
  if (_etcParams.y > 1.0f) {
    _798 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _799 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _803 = saturate(1.0f - (dot(float2(_798, _799), float2(_798, _799)) * saturate(_etcParams.y + -1.0f)));
    _808 = (_803 * _785);
    _809 = (_803 * _786);
    _810 = (_803 * _787);
  } else {
    _808 = _785;
    _809 = _786;
    _810 = _787;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _843 = select((_808 <= 0.0031308000907301903f), (_808 * 12.920000076293945f), (((pow(_808, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _844 = select((_809 <= 0.0031308000907301903f), (_809 * 12.920000076293945f), (((pow(_809, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _845 = select((_810 <= 0.0031308000907301903f), (_810 * 12.920000076293945f), (((pow(_810, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _843 = _808;
    _844 = _809;
    _845 = _810;
  }
  if (!(_etcParams.y < 1.0f)) {
    _850 = float((uint)_350);
    if (!(_850 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_850 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _859 = _843;
        _860 = _844;
        _861 = _845;
      } else {
        _859 = 0.0f;
        _860 = 0.0f;
        _861 = 0.0f;
      }
    } else {
      _859 = 0.0f;
      _860 = 0.0f;
      _861 = 0.0f;
    }
  } else {
    _859 = _843;
    _860 = _844;
    _861 = _845;
  }
  SV_Target.x = _859;
  SV_Target.y = _860;
  SV_Target.z = _861;
  SV_Target.w = _363;
  return SV_Target;
}