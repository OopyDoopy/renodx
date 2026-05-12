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
  float4 _41;
  int _45;
  float _53;
  int _54;
  float _62;
  float _342;
  float _343;
  float _344;
  float _358;
  float _563;
  float _564;
  float _565;
  float _658;
  float _659;
  float _660;
  float _780;
  float _781;
  float _782;
  float _803;
  float _804;
  float _805;
  float _838;
  float _839;
  float _840;
  float _854;
  float _855;
  float _856;
  int _73;
  int _81;
  float4 _88;
  float4 _95;
  float _106;
  float _107;
  float _108;
  float _109;
  float _110;
  float _112;
  bool _115;
  bool _116;
  bool _117;
  bool _118;
  float _127;
  float _131;
  int _146;
  int _154;
  float4 _161;
  float _166;
  float _169;
  float _170;
  int _189;
  int _197;
  float4 _204;
  int _206;
  int _214;
  float _217;
  float _220;
  float _222;
  float _252;
  float _258;
  float _265;
  float _266;
  float _267;
  int _268;
  int _276;
  float _279;
  float _282;
  float _284;
  float _314;
  float _319;
  float _326;
  float _327;
  float _328;
  float _331;
  uint _345;
  float _367;
  float _416;
  float _417;
  float _418;
  float _420;
  float _427;
  float _428;
  float _429;
  float _448;
  float _449;
  float _450;
  float _451;
  float _452;
  float _453;
  float _454;
  float _455;
  float _456;
  float _502;
  float _503;
  float _504;
  float _505;
  float _506;
  float _507;
  float _508;
  float _525;
  float _526;
  float _527;
  float _528;
  float _534;
  float _537;
  float _544;
  float _545;
  float _546;
  float _575;
  float _600;
  float _601;
  float _602;
  float _621;
  float _622;
  float _623;
  float _629;
  float _633;
  float _634;
  float _635;
  float _636;
  float _641;
  float _666;
  float _670;
  float _671;
  float _672;
  float _673;
  int _714;
  float _769;
  float _793;
  float _794;
  float _798;
  float _845;
  float _18[36];
  _41 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
  _45 = WaveReadLaneFirst(_materialIndex);
  _53 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_45 < (uint)170000), _45, 0)) + 0u))].BindlessParameters_PostProcessWeatherBlend._blendRatio);
  _54 = WaveReadLaneFirst(_materialIndex);
  _62 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_54 < (uint)170000), _54, 0)) + 0u))].BindlessParameters_PostProcessWeatherBlend._enableBlend);
  if ((_53 >= 0.009999999776482582f) && (_62 > 0.009999999776482582f)) {
    _73 = WaveReadLaneFirst(_materialIndex);
    _81 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_73 < (uint)170000), _73, 0)) + 0u))].BindlessParameters_PostProcessWeatherBlend._noiseTex);
    _88 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_81 < (uint)65000), _81, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.20000000298023224f) + TEXCOORD.y)));
    _95 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    _106 = ((_95.x - _41.x) * _95.w) + _41.x;
    _107 = ((_95.y - _41.y) * _95.w) + _41.y;
    _108 = ((_95.z - _41.z) * _95.w) + _41.z;
    _109 = TEXCOORD.x + -0.5f;
    _110 = TEXCOORD.y + -0.5f;
    _112 = atan(_110 / _109);
    _115 = (_109 < 0.0f);
    _116 = (_109 == 0.0f);
    _117 = (_110 >= 0.0f);
    _118 = (_110 < 0.0f);
    _127 = select((_116 && _117), 0.5f, select((_116 && _118), -0.5f, (select((_115 && _118), (_112 + -3.1415927410125732f), select((_115 && _117), (_112 + 3.1415927410125732f), _112)) * 0.31830987334251404f)));
    _131 = sqrt((_110 * _110) + (_109 * _109));
    _146 = WaveReadLaneFirst(_materialIndex);
    _154 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_146 < (uint)170000), _146, 0)) + 0u))].BindlessParameters_PostProcessWeatherBlend._noiseTex);
    _161 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_154 < (uint)65000), _154, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * -0.20000000298023224f) - ((_88.z + -0.5f) * 0.5f)) + (_127 * 15.0f)), (((_131 * 2.0f) - ((_88.w + -0.5f) * 0.5f)) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 1.5f))));
    _166 = (1.75f - saturate(_53 * 1.4285714626312256f)) * 0.5f;
    _169 = max((abs(_109) - _166), 0.0f);
    _170 = max((abs(_110) - _166), 0.0f);
    _189 = WaveReadLaneFirst(_materialIndex);
    _197 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_189 < (uint)170000), _189, 0)) + 0u))].BindlessParameters_PostProcessWeatherBlend._borderEdgeNoiseTexture);
    _204 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_197 < (uint)65000), _197, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_127 * 9.0f) + (_88.x * 0.05000000074505806f)) - (_161.x * 0.10000000149011612f)), ((_131 + (_88.y * 0.05000000074505806f)) - ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) + _161.x) * 0.10000000149011612f))));
    _206 = WaveReadLaneFirst(_materialIndex);
    _214 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_206 < (uint)170000), _206, 0)) + 0u))].BindlessParameters_PostProcessWeatherBlend._berserkColor);
    _217 = float((uint)((uint)(((uint)(_214) >> 16) & 255)));
    _220 = float((uint)((uint)(((uint)(_214) >> 8) & 255)));
    _222 = float((uint)((uint)(_214 & 255)));
    _252 = max(0.0010000000474974513f, _exposure0.x);
    _258 = ((_204.y * _204.y) * saturate(sqrt((_170 * _170) + (_169 * _169)) * 6.666666507720947f)) * _204.y;
    _265 = (((select(((_217 * 0.003921568859368563f) < 0.040449999272823334f), (_217 * 0.0003035269910469651f), exp2(log2((_217 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _252) - _106) * _258) + _106;
    _266 = (((select(((_220 * 0.003921568859368563f) < 0.040449999272823334f), (_220 * 0.0003035269910469651f), exp2(log2((_220 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _252) - _107) * _258) + _107;
    _267 = (((select(((_222 * 0.003921568859368563f) < 0.040449999272823334f), (_222 * 0.0003035269910469651f), exp2(log2((_222 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _252) - _108) * _258) + _108;
    _268 = WaveReadLaneFirst(_materialIndex);
    _276 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_268 < (uint)170000), _268, 0)) + 0u))].BindlessParameters_PostProcessWeatherBlend._berserkEndColor);
    _279 = float((uint)((uint)(((uint)(_276) >> 16) & 255)));
    _282 = float((uint)((uint)(((uint)(_276) >> 8) & 255)));
    _284 = float((uint)((uint)(_276 & 255)));
    _314 = max(0.0010000000474974513f, _exposure0.x);
    _319 = select((_53 > 0.699999988079071f), 1.0f, 0.0f);
    _326 = (((select(((_279 * 0.003921568859368563f) < 0.040449999272823334f), (_279 * 0.0003035269910469651f), exp2(log2((_279 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _314) - _265) * _319) + _265;
    _327 = (((select(((_282 * 0.003921568859368563f) < 0.040449999272823334f), (_282 * 0.0003035269910469651f), exp2(log2((_282 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _314) - _266) * _319) + _266;
    _328 = (((select(((_284 * 0.003921568859368563f) < 0.040449999272823334f), (_284 * 0.0003035269910469651f), exp2(log2((_284 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _314) - _267) * _319) + _267;
    _331 = saturate((_53 + -0.800000011920929f) * 5.0f);
    _342 = (lerp(_326, _41.x, _331));
    _343 = (lerp(_327, _41.y, _331));
    _344 = (lerp(_328, _41.z, _331));
  } else {
    _342 = _41.x;
    _343 = _41.y;
    _344 = _41.z;
  }
  _345 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _358 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _345, 0)))).x) & 127))) + 0.5f);
  } else {
    _358 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_342, _343, _344));
    _780 = output_color.x;
    _781 = output_color.y;
    _782 = output_color.z;
  } else {
    _780 = _342;
    _781 = _343;
    _782 = _344;
  }
  if (_etcParams.y > 1.0f) {
    _793 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _794 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _798 = saturate(1.0f - (dot(float2(_793, _794), float2(_793, _794)) * saturate(_etcParams.y + -1.0f)));
    _803 = (_798 * _780);
    _804 = (_798 * _781);
    _805 = (_798 * _782);
  } else {
    _803 = _780;
    _804 = _781;
    _805 = _782;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _838 = select((_803 <= 0.0031308000907301903f), (_803 * 12.920000076293945f), (((pow(_803, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _839 = select((_804 <= 0.0031308000907301903f), (_804 * 12.920000076293945f), (((pow(_804, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _840 = select((_805 <= 0.0031308000907301903f), (_805 * 12.920000076293945f), (((pow(_805, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _838 = _803;
    _839 = _804;
    _840 = _805;
  }
  if (!(_etcParams.y < 1.0f)) {
    _845 = float((uint)_345);
    if (!(_845 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_845 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
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
  SV_Target.x = _854;
  SV_Target.y = _855;
  SV_Target.z = _856;
  SV_Target.w = _358;
  return SV_Target;
}