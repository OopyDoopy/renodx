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

Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t36, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

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
  float4 _41;
  float _51;
  float _52;
  float _53;
  float _75;
  float _76;
  float _77;
  float _78;
  float _79;
  float _80;
  int _81;
  float _89;
  int _90;
  float _98;
  float _412;
  float _413;
  float _414;
  float _428;
  float _633;
  float _634;
  float _635;
  float _728;
  float _729;
  float _730;
  float _850;
  float _851;
  float _852;
  float _873;
  float _874;
  float _875;
  float _908;
  float _909;
  float _910;
  float _924;
  float _925;
  float _926;
  int _109;
  int _117;
  float4 _124;
  float4 _131;
  float _142;
  float _143;
  float _144;
  float _172;
  float _176;
  float _177;
  float _178;
  float _179;
  float _180;
  float _182;
  bool _185;
  bool _186;
  bool _187;
  bool _188;
  float _197;
  float _201;
  int _216;
  int _224;
  float4 _231;
  float _236;
  float _239;
  float _240;
  int _259;
  int _267;
  float4 _274;
  int _276;
  int _284;
  float _287;
  float _290;
  float _292;
  float _322;
  float _328;
  float _335;
  float _336;
  float _337;
  int _338;
  int _346;
  float _349;
  float _352;
  float _354;
  float _384;
  float _389;
  float _396;
  float _397;
  float _398;
  float _401;
  uint _415;
  float _437;
  float _486;
  float _487;
  float _488;
  float _490;
  float _497;
  float _498;
  float _499;
  float _518;
  float _519;
  float _520;
  float _521;
  float _522;
  float _523;
  float _524;
  float _525;
  float _526;
  float _572;
  float _573;
  float _574;
  float _575;
  float _576;
  float _577;
  float _578;
  float _595;
  float _596;
  float _597;
  float _598;
  float _604;
  float _607;
  float _614;
  float _615;
  float _616;
  float _645;
  float _670;
  float _671;
  float _672;
  float _691;
  float _692;
  float _693;
  float _699;
  float _703;
  float _704;
  float _705;
  float _706;
  float _711;
  float _736;
  float _740;
  float _741;
  float _742;
  float _743;
  int _784;
  float _839;
  float _863;
  float _864;
  float _868;
  float _915;
  float _936;
  float _937;
  float _938;
  float _18[36];
  _41 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
  _51 = (pow(_41.x, 0.012683313339948654f));
  _52 = (pow(_41.y, 0.012683313339948654f));
  _53 = (pow(_41.z, 0.012683313339948654f));
  _75 = exp2(log2(max(0.0f, (_51 + -0.8359375f)) / (18.8515625f - (_51 * 18.6875f))) * 6.277394771575928f);
  _76 = exp2(log2(max(0.0f, (_52 + -0.8359375f)) / (18.8515625f - (_52 * 18.6875f))) * 6.277394771575928f);
  _77 = exp2(log2(max(0.0f, (_53 + -0.8359375f)) / (18.8515625f - (_53 * 18.6875f))) * 6.277394771575928f);
  _78 = _75 * 10000.0f;
  _79 = _76 * 10000.0f;
  _80 = _77 * 10000.0f;
  _81 = WaveReadLaneFirst(_materialIndex);
  _89 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_81 < (uint)170000), _81, 0)) + 0u))].BindlessParameters_PostProcessWeatherBlend._blendRatio);
  _90 = WaveReadLaneFirst(_materialIndex);
  _98 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_90 < (uint)170000), _90, 0)) + 0u))].BindlessParameters_PostProcessWeatherBlend._enableBlend);
  if ((_89 >= 0.009999999776482582f) && (_98 > 0.009999999776482582f)) {
    _109 = WaveReadLaneFirst(_materialIndex);
    _117 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_109 < (uint)170000), _109, 0)) + 0u))].BindlessParameters_PostProcessWeatherBlend._noiseTex);
    _124 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_117 < (uint)65000), _117, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.20000000298023224f) + TEXCOORD.y)));
    _131 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    _142 = (pow(_131.x, 0.012683313339948654f));
    _143 = (pow(_131.y, 0.012683313339948654f));
    _144 = (pow(_131.z, 0.012683313339948654f));
    _172 = _131.w * 10000.0f;
    _176 = ((exp2(log2(max(0.0f, (_142 + -0.8359375f)) / (18.8515625f - (_142 * 18.6875f))) * 6.277394771575928f) - _75) * _172) + _78;
    _177 = ((exp2(log2(max(0.0f, (_143 + -0.8359375f)) / (18.8515625f - (_143 * 18.6875f))) * 6.277394771575928f) - _76) * _172) + _79;
    _178 = ((exp2(log2(max(0.0f, (_144 + -0.8359375f)) / (18.8515625f - (_144 * 18.6875f))) * 6.277394771575928f) - _77) * _172) + _80;
    _179 = TEXCOORD.x + -0.5f;
    _180 = TEXCOORD.y + -0.5f;
    _182 = atan(_180 / _179);
    _185 = (_179 < 0.0f);
    _186 = (_179 == 0.0f);
    _187 = (_180 >= 0.0f);
    _188 = (_180 < 0.0f);
    _197 = select((_186 && _187), 0.5f, select((_186 && _188), -0.5f, (select((_185 && _188), (_182 + -3.1415927410125732f), select((_185 && _187), (_182 + 3.1415927410125732f), _182)) * 0.31830987334251404f)));
    _201 = sqrt((_180 * _180) + (_179 * _179));
    _216 = WaveReadLaneFirst(_materialIndex);
    _224 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_216 < (uint)170000), _216, 0)) + 0u))].BindlessParameters_PostProcessWeatherBlend._noiseTex);
    _231 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_224 < (uint)65000), _224, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * -0.20000000298023224f) - ((_124.z + -0.5f) * 0.5f)) + (_197 * 15.0f)), (((_201 * 2.0f) - ((_124.w + -0.5f) * 0.5f)) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 1.5f))));
    _236 = (1.75f - saturate(_89 * 1.4285714626312256f)) * 0.5f;
    _239 = max((abs(_179) - _236), 0.0f);
    _240 = max((abs(_180) - _236), 0.0f);
    _259 = WaveReadLaneFirst(_materialIndex);
    _267 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_259 < (uint)170000), _259, 0)) + 0u))].BindlessParameters_PostProcessWeatherBlend._borderEdgeNoiseTexture);
    _274 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_267 < (uint)65000), _267, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_197 * 9.0f) + (_124.x * 0.05000000074505806f)) - (_231.x * 0.10000000149011612f)), ((_201 + (_124.y * 0.05000000074505806f)) - ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) + _231.x) * 0.10000000149011612f))));
    _276 = WaveReadLaneFirst(_materialIndex);
    _284 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_276 < (uint)170000), _276, 0)) + 0u))].BindlessParameters_PostProcessWeatherBlend._berserkColor);
    _287 = float((uint)((uint)(((uint)(_284) >> 16) & 255)));
    _290 = float((uint)((uint)(((uint)(_284) >> 8) & 255)));
    _292 = float((uint)((uint)(_284 & 255)));
    _322 = max(0.0010000000474974513f, _exposure0.x);
    _328 = ((_274.y * _274.y) * saturate(sqrt((_240 * _240) + (_239 * _239)) * 6.666666507720947f)) * _274.y;
    _335 = (((select(((_287 * 0.003921568859368563f) < 0.040449999272823334f), (_287 * 0.0003035269910469651f), exp2(log2((_287 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _322) - _176) * _328) + _176;
    _336 = (((select(((_290 * 0.003921568859368563f) < 0.040449999272823334f), (_290 * 0.0003035269910469651f), exp2(log2((_290 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _322) - _177) * _328) + _177;
    _337 = (((select(((_292 * 0.003921568859368563f) < 0.040449999272823334f), (_292 * 0.0003035269910469651f), exp2(log2((_292 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _322) - _178) * _328) + _178;
    _338 = WaveReadLaneFirst(_materialIndex);
    _346 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_338 < (uint)170000), _338, 0)) + 0u))].BindlessParameters_PostProcessWeatherBlend._berserkEndColor);
    _349 = float((uint)((uint)(((uint)(_346) >> 16) & 255)));
    _352 = float((uint)((uint)(((uint)(_346) >> 8) & 255)));
    _354 = float((uint)((uint)(_346 & 255)));
    _384 = max(0.0010000000474974513f, _exposure0.x);
    _389 = select((_89 > 0.699999988079071f), 1.0f, 0.0f);
    _396 = (((select(((_349 * 0.003921568859368563f) < 0.040449999272823334f), (_349 * 0.0003035269910469651f), exp2(log2((_349 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _384) - _335) * _389) + _335;
    _397 = (((select(((_352 * 0.003921568859368563f) < 0.040449999272823334f), (_352 * 0.0003035269910469651f), exp2(log2((_352 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _384) - _336) * _389) + _336;
    _398 = (((select(((_354 * 0.003921568859368563f) < 0.040449999272823334f), (_354 * 0.0003035269910469651f), exp2(log2((_354 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _384) - _337) * _389) + _337;
    _401 = saturate((_89 + -0.800000011920929f) * 5.0f);
    _412 = (lerp(_396, _78, _401));
    _413 = (lerp(_397, _79, _401));
    _414 = (lerp(_398, _80, _401));
  } else {
    _412 = _78;
    _413 = _79;
    _414 = _80;
  }
  _415 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _428 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _415, 0)))).x) & 127))) + 0.5f);
  } else {
    _428 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_412, _413, _414));
    _850 = output_color.x;
    _851 = output_color.y;
    _852 = output_color.z;
  } else {
    _850 = _412;
    _851 = _413;
    _852 = _414;
  }
  if (_etcParams.y > 1.0f) {
    _863 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _864 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _868 = saturate(1.0f - (dot(float2(_863, _864), float2(_863, _864)) * saturate(_etcParams.y + -1.0f)));
    _873 = (_868 * _850);
    _874 = (_868 * _851);
    _875 = (_868 * _852);
  } else {
    _873 = _850;
    _874 = _851;
    _875 = _852;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _908 = select((_873 <= 0.0031308000907301903f), (_873 * 12.920000076293945f), (((pow(_873, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _909 = select((_874 <= 0.0031308000907301903f), (_874 * 12.920000076293945f), (((pow(_874, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _910 = select((_875 <= 0.0031308000907301903f), (_875 * 12.920000076293945f), (((pow(_875, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _908 = _873;
    _909 = _874;
    _910 = _875;
  }
  if (!(_etcParams.y < 1.0f)) {
    _915 = float((uint)_415);
    if (!(_915 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_915 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _924 = _908;
        _925 = _909;
        _926 = _910;
      } else {
        _924 = 0.0f;
        _925 = 0.0f;
        _926 = 0.0f;
      }
    } else {
      _924 = 0.0f;
      _925 = 0.0f;
      _926 = 0.0f;
    }
  } else {
    _924 = _908;
    _925 = _909;
    _926 = _910;
  }
  _936 = exp2(log2(_924 * 9.999999747378752e-05f) * 0.1593017578125f);
  _937 = exp2(log2(_925 * 9.999999747378752e-05f) * 0.1593017578125f);
  _938 = exp2(log2(_926 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_936 * 18.6875f) + 1.0f)) * ((_936 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_937 * 18.6875f) + 1.0f)) * ((_937 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_938 * 18.6875f) + 1.0f)) * ((_938 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _428;
  return SV_Target;
}