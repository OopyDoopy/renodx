#include "../tonemap.hlsli"

struct PostProcessMirrorStruct {
  float _ratio;
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

struct BindlessParameters_PostProcessMirror {
  PostProcessMirrorStruct BindlessParameters_PostProcessMirror;
};

typedef BindlessParameters_PostProcessMirror BindlessParameters_PostProcessMirror_t;
ConstantBuffer<BindlessParameters_PostProcessMirror_t> BindlessParameters_PostProcessMirror[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  int _20;
  float _28;
  float4 _34;
  float _44;
  float _45;
  float _46;
  float _68;
  float _69;
  float _70;
  uint _74;
  float _88;
  float _293;
  float _294;
  float _295;
  float _388;
  float _389;
  float _390;
  float _510;
  float _511;
  float _512;
  float _533;
  float _534;
  float _535;
  float _568;
  float _569;
  float _570;
  float _584;
  float _585;
  float _586;
  float _97;
  float _146;
  float _147;
  float _148;
  float _150;
  float _157;
  float _158;
  float _159;
  float _178;
  float _179;
  float _180;
  float _181;
  float _182;
  float _183;
  float _184;
  float _185;
  float _186;
  float _232;
  float _233;
  float _234;
  float _235;
  float _236;
  float _237;
  float _238;
  float _255;
  float _256;
  float _257;
  float _258;
  float _264;
  float _267;
  float _274;
  float _275;
  float _276;
  float _305;
  float _330;
  float _331;
  float _332;
  float _351;
  float _352;
  float _353;
  float _359;
  float _363;
  float _364;
  float _365;
  float _366;
  float _371;
  float _396;
  float _400;
  float _401;
  float _402;
  float _403;
  int _444;
  float _499;
  float _523;
  float _524;
  float _528;
  float _575;
  float _596;
  float _597;
  float _598;
  float _15[36];
  _20 = WaveReadLaneFirst(_materialIndex);
  _28 = WaveReadLaneFirst(BindlessParameters_PostProcessMirror[((int)((uint)(select(((uint)_20 < (uint)170000), _20, 0)) + 0u))].BindlessParameters_PostProcessMirror._ratio);
  _34 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(select((_28 > 0.5f), (1.0f - TEXCOORD.x), TEXCOORD.x), TEXCOORD.y));
  _44 = (pow(_34.x, 0.012683313339948654f));
  _45 = (pow(_34.y, 0.012683313339948654f));
  _46 = (pow(_34.z, 0.012683313339948654f));
  _68 = exp2(log2(max(0.0f, (_44 + -0.8359375f)) / (18.8515625f - (_44 * 18.6875f))) * 6.277394771575928f);
  _69 = exp2(log2(max(0.0f, (_45 + -0.8359375f)) / (18.8515625f - (_45 * 18.6875f))) * 6.277394771575928f);
  _70 = exp2(log2(max(0.0f, (_46 + -0.8359375f)) / (18.8515625f - (_46 * 18.6875f))) * 6.277394771575928f);
  _74 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _88 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _74, 0)))).x) & 127))) + 0.5f);
  } else {
    _88 = _postProcessParams.x;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_68, _69, _70));
    _510 = output_color.x;
    _511 = output_color.y;
    _512 = output_color.z;
  } else {
    _510 = (_68 * 10000.0f);
    _511 = (_69 * 10000.0f);
    _512 = (_70 * 10000.0f);
  }
  if (_etcParams.y > 1.0f) {
    _523 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _524 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _528 = saturate(1.0f - (dot(float2(_523, _524), float2(_523, _524)) * saturate(_etcParams.y + -1.0f)));
    _533 = (_528 * _510);
    _534 = (_528 * _511);
    _535 = (_528 * _512);
  } else {
    _533 = _510;
    _534 = _511;
    _535 = _512;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _568 = select((_533 <= 0.0031308000907301903f), (_533 * 12.920000076293945f), (((pow(_533, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _569 = select((_534 <= 0.0031308000907301903f), (_534 * 12.920000076293945f), (((pow(_534, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _570 = select((_535 <= 0.0031308000907301903f), (_535 * 12.920000076293945f), (((pow(_535, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _568 = _533;
    _569 = _534;
    _570 = _535;
  }
  if (!(_etcParams.y < 1.0f)) {
    _575 = float((uint)_74);
    if (!(_575 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_575 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _584 = _568;
        _585 = _569;
        _586 = _570;
      } else {
        _584 = 0.0f;
        _585 = 0.0f;
        _586 = 0.0f;
      }
    } else {
      _584 = 0.0f;
      _585 = 0.0f;
      _586 = 0.0f;
    }
  } else {
    _584 = _568;
    _585 = _569;
    _586 = _570;
  }
  _596 = exp2(log2(_584 * 9.999999747378752e-05f) * 0.1593017578125f);
  _597 = exp2(log2(_585 * 9.999999747378752e-05f) * 0.1593017578125f);
  _598 = exp2(log2(_586 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_596 * 18.6875f) + 1.0f)) * ((_596 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_597 * 18.6875f) + 1.0f)) * ((_597 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_598 * 18.6875f) + 1.0f)) * ((_598 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _88;
  return SV_Target;
}