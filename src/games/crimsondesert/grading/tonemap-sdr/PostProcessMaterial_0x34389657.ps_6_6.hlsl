#include "../tonemap.hlsli"

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t37, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t29, space36);

Texture2D<uint> __3__36__0__0__g_CustomRenderPassValue : register(t69, space36);

Texture2D<float4> __3__36__0__0__g_CustomRenderPassDepth : register(t70, space36);

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

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float4 _20;
  float _36;
  float _37;
  uint2 _39;
  float _82;
  float _83;
  float _84;
  float _98;
  float _303;
  float _304;
  float _305;
  float _398;
  float _399;
  float _400;
  float _520;
  float _521;
  float _522;
  float _543;
  float _544;
  float _545;
  float _578;
  float _579;
  float _580;
  float _594;
  float _595;
  float _596;
  float _80;
  uint _85;
  float _107;
  float _156;
  float _157;
  float _158;
  float _160;
  float _167;
  float _168;
  float _169;
  float _188;
  float _189;
  float _190;
  float _191;
  float _192;
  float _193;
  float _194;
  float _195;
  float _196;
  float _242;
  float _243;
  float _244;
  float _245;
  float _246;
  float _247;
  float _248;
  float _265;
  float _266;
  float _267;
  float _268;
  float _274;
  float _277;
  float _284;
  float _285;
  float _286;
  float _315;
  float _340;
  float _341;
  float _342;
  float _361;
  float _362;
  float _363;
  float _369;
  float _373;
  float _374;
  float _375;
  float _376;
  float _381;
  float _406;
  float _410;
  float _411;
  float _412;
  float _413;
  int _454;
  float _509;
  float _533;
  float _534;
  float _538;
  float _585;
  float _17[36];
  _20 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _36 = float((int)(int((asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) + -1.0f) * saturate(TEXCOORD.x))));
  _37 = float((int)(int((asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) + -1.0f) * saturate(TEXCOORD.y))));
  __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_39.x, _39.y);
  if (!(((((uint)(__3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)((int)(_39.x)))))) + 0.5f) * _36), int((float((int)(int(float((int)((int)(_39.y)))))) + 0.5f) * _37), 0)))).x) & 255) == 0)) {
    _80 = saturate(ceil((0.10000000149011612f - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_36 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x)), int(_37 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y)), 0)))).x)))) + (asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, ((__3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y))).x)))));
    _82 = _80;
    _83 = _80;
    _84 = _80;
  } else {
    _82 = _20.x;
    _83 = _20.y;
    _84 = _20.z;
  }
  _85 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _98 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _85, 0)))).x) & 127))) + 0.5f);
  } else {
    _98 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_82, _83, _84));
    _520 = output_color.x;
    _521 = output_color.y;
    _522 = output_color.z;
  } else {
    _520 = _82;
    _521 = _83;
    _522 = _84;
  }
  if (_etcParams.y > 1.0f) {
    _533 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _534 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _538 = saturate(1.0f - (dot(float2(_533, _534), float2(_533, _534)) * saturate(_etcParams.y + -1.0f)));
    _543 = (_538 * _520);
    _544 = (_538 * _521);
    _545 = (_538 * _522);
  } else {
    _543 = _520;
    _544 = _521;
    _545 = _522;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _578 = select((_543 <= 0.0031308000907301903f), (_543 * 12.920000076293945f), (((pow(_543, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _579 = select((_544 <= 0.0031308000907301903f), (_544 * 12.920000076293945f), (((pow(_544, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _580 = select((_545 <= 0.0031308000907301903f), (_545 * 12.920000076293945f), (((pow(_545, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _578 = _543;
    _579 = _544;
    _580 = _545;
  }
  if (!(_etcParams.y < 1.0f)) {
    _585 = float((uint)_85);
    if (!(_585 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_585 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _594 = _578;
        _595 = _579;
        _596 = _580;
      } else {
        _594 = 0.0f;
        _595 = 0.0f;
        _596 = 0.0f;
      }
    } else {
      _594 = 0.0f;
      _595 = 0.0f;
      _596 = 0.0f;
    }
  } else {
    _594 = _578;
    _595 = _579;
    _596 = _580;
  }
  SV_Target.x = _594;
  SV_Target.y = _595;
  SV_Target.z = _596;
  SV_Target.w = _98;
  return SV_Target;
}