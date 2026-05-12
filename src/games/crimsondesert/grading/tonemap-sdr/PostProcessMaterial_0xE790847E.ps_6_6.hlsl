#include "../tonemap.hlsli"

struct PostProcessGrayscaleStruct {
  float _ratio;
};


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

struct BindlessParameters_PostProcessGrayscale {
  PostProcessGrayscaleStruct BindlessParameters_PostProcessGrayscale;
};

typedef BindlessParameters_PostProcessGrayscale BindlessParameters_PostProcessGrayscale_t;
ConstantBuffer<BindlessParameters_PostProcessGrayscale_t> BindlessParameters_PostProcessGrayscale[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float4 _22;
  int _26;
  float _34;
  float _35;
  float _42;
  float _43;
  float _44;
  uint _45;
  float _59;
  float _264;
  float _265;
  float _266;
  float _359;
  float _360;
  float _361;
  float _481;
  float _482;
  float _483;
  float _504;
  float _505;
  float _506;
  float _539;
  float _540;
  float _541;
  float _555;
  float _556;
  float _557;
  float _68;
  float _117;
  float _118;
  float _119;
  float _121;
  float _128;
  float _129;
  float _130;
  float _149;
  float _150;
  float _151;
  float _152;
  float _153;
  float _154;
  float _155;
  float _156;
  float _157;
  float _203;
  float _204;
  float _205;
  float _206;
  float _207;
  float _208;
  float _209;
  float _226;
  float _227;
  float _228;
  float _229;
  float _235;
  float _238;
  float _245;
  float _246;
  float _247;
  float _276;
  float _301;
  float _302;
  float _303;
  float _322;
  float _323;
  float _324;
  float _330;
  float _334;
  float _335;
  float _336;
  float _337;
  float _342;
  float _367;
  float _371;
  float _372;
  float _373;
  float _374;
  int _415;
  float _470;
  float _494;
  float _495;
  float _499;
  float _546;
  float _15[36];
  _22 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _26 = WaveReadLaneFirst(_materialIndex);
  _34 = WaveReadLaneFirst(BindlessParameters_PostProcessGrayscale[((int)((uint)(select(((uint)_26 < (uint)170000), _26, 0)) + 0u))].BindlessParameters_PostProcessGrayscale._ratio);
  _35 = dot(float3(_22.x, _22.y, _22.z), float3(0.26269999146461487f, 0.6779999732971191f, 0.059300001710653305f));
  _42 = ((_35 - _22.x) * _34) + _22.x;
  _43 = ((_35 - _22.y) * _34) + _22.y;
  _44 = ((_35 - _22.z) * _34) + _22.z;
  _45 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _59 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _45, 0)))).x) & 127))) + 0.5f);
  } else {
    _59 = _postProcessParams.x;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_42, _43, _44));
    _481 = output_color.x;
    _482 = output_color.y;
    _483 = output_color.z;
  } else {
    _481 = _42;
    _482 = _43;
    _483 = _44;
  }
  if (_etcParams.y > 1.0f) {
    _494 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _495 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _499 = saturate(1.0f - (dot(float2(_494, _495), float2(_494, _495)) * saturate(_etcParams.y + -1.0f)));
    _504 = (_499 * _481);
    _505 = (_499 * _482);
    _506 = (_499 * _483);
  } else {
    _504 = _481;
    _505 = _482;
    _506 = _483;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _539 = select((_504 <= 0.0031308000907301903f), (_504 * 12.920000076293945f), (((pow(_504, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _540 = select((_505 <= 0.0031308000907301903f), (_505 * 12.920000076293945f), (((pow(_505, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _541 = select((_506 <= 0.0031308000907301903f), (_506 * 12.920000076293945f), (((pow(_506, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _539 = _504;
    _540 = _505;
    _541 = _506;
  }
  if (!(_etcParams.y < 1.0f)) {
    _546 = float((uint)_45);
    if (!(_546 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_546 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _555 = _539;
        _556 = _540;
        _557 = _541;
      } else {
        _555 = 0.0f;
        _556 = 0.0f;
        _557 = 0.0f;
      }
    } else {
      _555 = 0.0f;
      _556 = 0.0f;
      _557 = 0.0f;
    }
  } else {
    _555 = _539;
    _556 = _540;
    _557 = _541;
  }
  SV_Target.x = _555;
  SV_Target.y = _556;
  SV_Target.z = _557;
  SV_Target.w = _59;
  return SV_Target;
}