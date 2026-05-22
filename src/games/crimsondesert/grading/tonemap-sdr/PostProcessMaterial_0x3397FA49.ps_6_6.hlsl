#include "../tonemap.hlsli"

Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t36, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

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

cbuffer __3__1__0__0__PostProcessSizeConstant : register(b1, space1) {
  float4 _srcTargetSizeAndInv : packoffset(c000.x);
  float4 _destTargetSizAndInv : packoffset(c001.x);
};

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

static const float _global_0[13] = { 0.007210421375930309f, 0.007223543245345354f, 0.007234297227114439f, 0.007242672611027956f, 0.007248660083860159f, 0.007252255454659462f, 0.007253454532474279f, 0.007252255454659462f, 0.007248660083860159f, 0.007242672611027956f, 0.007234297227114439f, 0.007223543245345354f, 0.007210421375930309f };

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float4 _20;
  float _27;
  float _28;
  float _45;
  float _53;
  float _54;
  float _68;
  float _70;
  float _71;
  float _72;
  int _73;
  float _75;
  float _76;
  float _77;
  int _78;
  float _171;
  float _376;
  float _377;
  float _378;
  float _471;
  float _472;
  float _473;
  float _593;
  float _594;
  float _595;
  float _616;
  float _617;
  float _618;
  float _651;
  float _652;
  float _653;
  float _667;
  float _668;
  float _669;
  float _85;
  float4 _96;
  float _103;
  float _104;
  float _105;
  int _106;
  int _109;
  float _118;
  float _127;
  float _128;
  uint2 _133;
  bool _151;
  float _155;
  float _156;
  float _157;
  uint _158;
  float _180;
  float _229;
  float _230;
  float _231;
  float _233;
  float _240;
  float _241;
  float _242;
  float _261;
  float _262;
  float _263;
  float _264;
  float _265;
  float _266;
  float _267;
  float _268;
  float _269;
  float _315;
  float _316;
  float _317;
  float _318;
  float _319;
  float _320;
  float _321;
  float _338;
  float _339;
  float _340;
  float _341;
  float _347;
  float _350;
  float _357;
  float _358;
  float _359;
  float _388;
  float _413;
  float _414;
  float _415;
  float _434;
  float _435;
  float _436;
  float _442;
  float _446;
  float _447;
  float _448;
  float _449;
  float _454;
  float _479;
  float _483;
  float _484;
  float _485;
  float _486;
  int _527;
  float _582;
  float _606;
  float _607;
  float _611;
  float _658;
  float _679;
  float _680;
  float _681;
  int __loop_jump_target = -1;
  float _17[36];
  _20 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _27 = (pow(_20.y, 0.012683313339948654f));
  _28 = (pow(_20.z, 0.012683313339948654f));
  _45 = exp2(log2(max(0.0f, (_27 + -0.8359375f)) / (18.8515625f - (_27 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _53 = float((int)(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * TEXCOORD.x)));
  _54 = float((int)(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * TEXCOORD.y)));
  _68 = 1.0f - (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_53 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x)), int(_54 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y)), 0)))).x);
  _70 = 0.0f;
  _71 = 0.0f;
  _72 = 0.0f;
  _73 = -6;
  while(true) {
    _75 = _70;
    _76 = _71;
    _77 = _72;
    _78 = -6;
    while(true) {
      _85 = (_global_0[min((uint)((_73 + 6)), 12u)]) * (_global_0[min((uint)((_78 + 6)), 12u)]);
      _96 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((((_68 * _srcTargetSizeAndInv.z) * float((int)(_73))) + TEXCOORD.x), (((_68 * _srcTargetSizeAndInv.w) * float((int)(_78))) + TEXCOORD.y)));
      _103 = (_96.x * _85) + _75;
      _104 = (_96.y * _85) + _76;
      _105 = (_96.z * _85) + _77;
      _106 = _78 + 1;
      if (!(_106 == 7)) {
        _75 = _103;
        _76 = _104;
        _77 = _105;
        _78 = _106;
        continue;
      }
      _109 = _73 + 1;
      if (!(_109 == 7)) {
        _70 = _103;
        _71 = _104;
        _72 = _105;
        _73 = _109;
        __loop_jump_target = 69;
        break;
      }
      _118 = (pow(_20.x, 0.012683313339948654f));
      _127 = exp2(log2(max(0.0f, (_118 + -0.8359375f)) / (18.8515625f - (_118 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
      _128 = exp2(log2(max(0.0f, (_28 + -0.8359375f)) / (18.8515625f - (_28 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
      __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_133.x, _133.y);
      _151 = (((((uint)(__3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)((int)(_133.x)))))) + 0.5f) * _53), int((float((int)(int(float((int)((int)(_133.y)))))) + 0.5f) * _54), 0)))).x) & 255) != 30);
      _155 = select(_151, ((_103 * 56493.91015625f) + _127), _127);
      _156 = select(_151, ((_104 * 56493.91015625f) + _45), _45);
      _157 = select(_151, ((_105 * 56493.91015625f) + _128), _128);
      _158 = uint(SV_Position.y);
      if (_etcParams.y == 1.0f) {
        _171 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _158, 0)))).x) & 127))) + 0.5f);
      } else {
        _171 = 1.0f;
      }
      if (_localToneMappingParams.w > 0.0f) {
        float3 output_color = TonemapReplacer(float3(_155, _156, _157));
        _593 = output_color.x;
        _594 = output_color.y;
        _595 = output_color.z;
      } else {
        _593 = _155;
        _594 = _156;
        _595 = _157;
      }
      if (_etcParams.y > 1.0f) {
        _606 = abs((TEXCOORD.x * 2.0f) + -1.0f);
        _607 = abs((TEXCOORD.y * 2.0f) + -1.0f);
        _611 = saturate(1.0f - (dot(float2(_606, _607), float2(_606, _607)) * saturate(_etcParams.y + -1.0f)));
        _616 = (_611 * _593);
        _617 = (_611 * _594);
        _618 = (_611 * _595);
      } else {
        _616 = _593;
        _617 = _594;
        _618 = _595;
      }
      if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
        _651 = select((_616 <= 0.0031308000907301903f), (_616 * 12.920000076293945f), (((pow(_616, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
        _652 = select((_617 <= 0.0031308000907301903f), (_617 * 12.920000076293945f), (((pow(_617, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
        _653 = select((_618 <= 0.0031308000907301903f), (_618 * 12.920000076293945f), (((pow(_618, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
      } else {
        _651 = _616;
        _652 = _617;
        _653 = _618;
      }
      if (!(_etcParams.y < 1.0f)) {
        _658 = float((uint)_158);
        if (!(_658 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
          if (_658 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
            _667 = _651;
            _668 = _652;
            _669 = _653;
          } else {
            _667 = 0.0f;
            _668 = 0.0f;
            _669 = 0.0f;
          }
        } else {
          _667 = 0.0f;
          _668 = 0.0f;
          _669 = 0.0f;
        }
      } else {
        _667 = _651;
        _668 = _652;
        _669 = _653;
      }
      _679 = exp2(log2(_667 * 9.999999747378752e-05f) * 0.1593017578125f);
      _680 = exp2(log2(_668 * 9.999999747378752e-05f) * 0.1593017578125f);
      _681 = exp2(log2(_669 * 9.999999747378752e-05f) * 0.1593017578125f);
      SV_Target.x = exp2(log2((1.0f / ((_679 * 18.6875f) + 1.0f)) * ((_679 * 18.8515625f) + 0.8359375f)) * 78.84375f);
      SV_Target.y = exp2(log2((1.0f / ((_680 * 18.6875f) + 1.0f)) * ((_680 * 18.8515625f) + 0.8359375f)) * 78.84375f);
      SV_Target.z = exp2(log2((1.0f / ((_681 * 18.6875f) + 1.0f)) * ((_681 * 18.8515625f) + 0.8359375f)) * 78.84375f);
      SV_Target.w = _171;
      break;
    }
    if (__loop_jump_target == 69) {
      __loop_jump_target = -1;
      continue;
    }
    if (__loop_jump_target != -1) {
      break;
    }
    break;
  }
  return SV_Target;
}
