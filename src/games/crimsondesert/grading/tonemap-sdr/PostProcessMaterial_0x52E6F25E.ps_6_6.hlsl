#include "../tonemap.hlsli"

struct PostProcessTransition_CDStruct {
  uint _chapterNoiseTex;
  uint _chapterCardTex;
  uint _lensDirtTex;
  float _chapterTransition;
  uint _sceneTintColor;
  uint _chapterCardColor;
  uint _chapterBackgroundColor;
};


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

struct BindlessParameters_PostProcessTransition_CD {
  PostProcessTransition_CDStruct BindlessParameters_PostProcessTransition_CD;
};

typedef BindlessParameters_PostProcessTransition_CD BindlessParameters_PostProcessTransition_CD_t;
ConstantBuffer<BindlessParameters_PostProcessTransition_CD_t> BindlessParameters_PostProcessTransition_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  int _19;
  float _27;
  float _73;
  float _74;
  float _75;
  float _89;
  float _294;
  float _295;
  float _296;
  float _389;
  float _390;
  float _391;
  float _511;
  float _512;
  float _513;
  float _534;
  float _535;
  float _536;
  float _569;
  float _570;
  float _571;
  float _585;
  float _586;
  float _587;
  float4 _32;
  float _42;
  float _43;
  float _44;
  uint _76;
  float _98;
  float _147;
  float _148;
  float _149;
  float _151;
  float _158;
  float _159;
  float _160;
  float _179;
  float _180;
  float _181;
  float _182;
  float _183;
  float _184;
  float _185;
  float _186;
  float _187;
  float _233;
  float _234;
  float _235;
  float _236;
  float _237;
  float _238;
  float _239;
  float _256;
  float _257;
  float _258;
  float _259;
  float _265;
  float _268;
  float _275;
  float _276;
  float _277;
  float _306;
  float _331;
  float _332;
  float _333;
  float _352;
  float _353;
  float _354;
  float _360;
  float _364;
  float _365;
  float _366;
  float _367;
  float _372;
  float _397;
  float _401;
  float _402;
  float _403;
  float _404;
  int _445;
  float _500;
  float _524;
  float _525;
  float _529;
  float _576;
  float _597;
  float _598;
  float _599;
  float _16[36];
  _19 = WaveReadLaneFirst(_materialIndex);
  _27 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_19 < (uint)170000), _19, 0)) + 0u))].BindlessParameters_PostProcessTransition_CD._chapterTransition);
  if (_27 > 0.0f) {
    _32 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
    _42 = (pow(_32.x, 0.012683313339948654f));
    _43 = (pow(_32.y, 0.012683313339948654f));
    _44 = (pow(_32.z, 0.012683313339948654f));
    _73 = (exp2(log2(max(0.0f, (_42 + -0.8359375f)) / (18.8515625f - (_42 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
    _74 = (exp2(log2(max(0.0f, (_43 + -0.8359375f)) / (18.8515625f - (_43 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
    _75 = (exp2(log2(max(0.0f, (_44 + -0.8359375f)) / (18.8515625f - (_44 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
  } else {
    _73 = 0.0f;
    _74 = 0.0f;
    _75 = 0.0f;
  }
  _76 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _89 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _76, 0)))).x) & 127))) + 0.5f);
  } else {
    _89 = 0.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_73, _74, _75));
    _511 = output_color.x;
    _512 = output_color.y;
    _513 = output_color.z;
  } else {
    _511 = _73;
    _512 = _74;
    _513 = _75;
  }
  if (_etcParams.y > 1.0f) {
    _524 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _525 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _529 = saturate(1.0f - (dot(float2(_524, _525), float2(_524, _525)) * saturate(_etcParams.y + -1.0f)));
    _534 = (_529 * _511);
    _535 = (_529 * _512);
    _536 = (_529 * _513);
  } else {
    _534 = _511;
    _535 = _512;
    _536 = _513;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _569 = select((_534 <= 0.0031308000907301903f), (_534 * 12.920000076293945f), (((pow(_534, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _570 = select((_535 <= 0.0031308000907301903f), (_535 * 12.920000076293945f), (((pow(_535, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _571 = select((_536 <= 0.0031308000907301903f), (_536 * 12.920000076293945f), (((pow(_536, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _569 = _534;
    _570 = _535;
    _571 = _536;
  }
  if (!(_etcParams.y < 1.0f)) {
    _576 = float((uint)_76);
    if (!(_576 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_576 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _585 = _569;
        _586 = _570;
        _587 = _571;
      } else {
        _585 = 0.0f;
        _586 = 0.0f;
        _587 = 0.0f;
      }
    } else {
      _585 = 0.0f;
      _586 = 0.0f;
      _587 = 0.0f;
    }
  } else {
    _585 = _569;
    _586 = _570;
    _587 = _571;
  }
  _597 = exp2(log2(_585 * 9.999999747378752e-05f) * 0.1593017578125f);
  _598 = exp2(log2(_586 * 9.999999747378752e-05f) * 0.1593017578125f);
  _599 = exp2(log2(_587 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_597 * 18.6875f) + 1.0f)) * ((_597 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_598 * 18.6875f) + 1.0f)) * ((_598 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_599 * 18.6875f) + 1.0f)) * ((_599 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _89;
  return SV_Target;
}