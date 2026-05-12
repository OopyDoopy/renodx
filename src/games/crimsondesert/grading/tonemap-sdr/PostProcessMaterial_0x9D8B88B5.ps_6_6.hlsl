#include "../tonemap.hlsli"

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t37, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t29, space36);

Texture2D<uint> __3__36__0__0__g_CustomRenderPassValue : register(t69, space36);

Texture2D<float4> __3__36__0__0__g_CustomRenderPassDepth : register(t70, space36);

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
  float _30;
  float _31;
  float _32;
  float _72;
  float _73;
  uint2 _75;
  float _118;
  float _119;
  float _120;
  float _134;
  float _339;
  float _340;
  float _341;
  float _434;
  float _435;
  float _436;
  float _556;
  float _557;
  float _558;
  float _579;
  float _580;
  float _581;
  float _614;
  float _615;
  float _616;
  float _630;
  float _631;
  float _632;
  float _116;
  uint _121;
  float _143;
  float _192;
  float _193;
  float _194;
  float _196;
  float _203;
  float _204;
  float _205;
  float _224;
  float _225;
  float _226;
  float _227;
  float _228;
  float _229;
  float _230;
  float _231;
  float _232;
  float _278;
  float _279;
  float _280;
  float _281;
  float _282;
  float _283;
  float _284;
  float _301;
  float _302;
  float _303;
  float _304;
  float _310;
  float _313;
  float _320;
  float _321;
  float _322;
  float _351;
  float _376;
  float _377;
  float _378;
  float _397;
  float _398;
  float _399;
  float _405;
  float _409;
  float _410;
  float _411;
  float _412;
  float _417;
  float _442;
  float _446;
  float _447;
  float _448;
  float _449;
  int _490;
  float _545;
  float _569;
  float _570;
  float _574;
  float _621;
  float _642;
  float _643;
  float _644;
  float _17[36];
  _20 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _30 = (pow(_20.x, 0.012683313339948654f));
  _31 = (pow(_20.y, 0.012683313339948654f));
  _32 = (pow(_20.z, 0.012683313339948654f));
  _72 = float((int)(int((asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) + -1.0f) * saturate(TEXCOORD.x))));
  _73 = float((int)(int((asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) + -1.0f) * saturate(TEXCOORD.y))));
  __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_75.x, _75.y);
  if (!(((((uint)(__3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)((int)(_75.x)))))) + 0.5f) * _72), int((float((int)(int(float((int)((int)(_75.y)))))) + 0.5f) * _73), 0)))).x) & 255) == 0)) {
    _116 = saturate(ceil((0.10000000149011612f - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_72 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x)), int(_73 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y)), 0)))).x)))) + (asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, ((__3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y))).x)))));
    _118 = _116;
    _119 = _116;
    _120 = _116;
  } else {
    _118 = (exp2(log2(max(0.0f, (_30 + -0.8359375f)) / (18.8515625f - (_30 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
    _119 = (exp2(log2(max(0.0f, (_31 + -0.8359375f)) / (18.8515625f - (_31 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
    _120 = (exp2(log2(max(0.0f, (_32 + -0.8359375f)) / (18.8515625f - (_32 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
  }
  _121 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _134 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _121, 0)))).x) & 127))) + 0.5f);
  } else {
    _134 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_118, _119, _120));
    _556 = output_color.x;
    _557 = output_color.y;
    _558 = output_color.z;
  } else {
    _556 = _118;
    _557 = _119;
    _558 = _120;
  }
  if (_etcParams.y > 1.0f) {
    _569 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _570 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _574 = saturate(1.0f - (dot(float2(_569, _570), float2(_569, _570)) * saturate(_etcParams.y + -1.0f)));
    _579 = (_574 * _556);
    _580 = (_574 * _557);
    _581 = (_574 * _558);
  } else {
    _579 = _556;
    _580 = _557;
    _581 = _558;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _614 = select((_579 <= 0.0031308000907301903f), (_579 * 12.920000076293945f), (((pow(_579, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _615 = select((_580 <= 0.0031308000907301903f), (_580 * 12.920000076293945f), (((pow(_580, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _616 = select((_581 <= 0.0031308000907301903f), (_581 * 12.920000076293945f), (((pow(_581, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _614 = _579;
    _615 = _580;
    _616 = _581;
  }
  if (!(_etcParams.y < 1.0f)) {
    _621 = float((uint)_121);
    if (!(_621 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_621 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _630 = _614;
        _631 = _615;
        _632 = _616;
      } else {
        _630 = 0.0f;
        _631 = 0.0f;
        _632 = 0.0f;
      }
    } else {
      _630 = 0.0f;
      _631 = 0.0f;
      _632 = 0.0f;
    }
  } else {
    _630 = _614;
    _631 = _615;
    _632 = _616;
  }
  _642 = exp2(log2(_630 * 9.999999747378752e-05f) * 0.1593017578125f);
  _643 = exp2(log2(_631 * 9.999999747378752e-05f) * 0.1593017578125f);
  _644 = exp2(log2(_632 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_642 * 18.6875f) + 1.0f)) * ((_642 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_643 * 18.6875f) + 1.0f)) * ((_643 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_644 * 18.6875f) + 1.0f)) * ((_644 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _134;
  return SV_Target;
}