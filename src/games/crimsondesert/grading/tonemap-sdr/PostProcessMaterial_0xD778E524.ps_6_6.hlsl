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
  float _29;
  float _30;
  float _44;
  float _46;
  float _47;
  float _48;
  int _49;
  float _51;
  float _52;
  float _53;
  int _54;
  float _135;
  float _340;
  float _341;
  float _342;
  float _435;
  float _436;
  float _437;
  float _557;
  float _558;
  float _559;
  float _580;
  float _581;
  float _582;
  float _615;
  float _616;
  float _617;
  float _631;
  float _632;
  float _633;
  float _61;
  float4 _72;
  float _79;
  float _80;
  float _81;
  int _82;
  int _85;
  uint2 _97;
  bool _115;
  float _119;
  float _120;
  float _121;
  uint _122;
  float _144;
  float _193;
  float _194;
  float _195;
  float _197;
  float _204;
  float _205;
  float _206;
  float _225;
  float _226;
  float _227;
  float _228;
  float _229;
  float _230;
  float _231;
  float _232;
  float _233;
  float _279;
  float _280;
  float _281;
  float _282;
  float _283;
  float _284;
  float _285;
  float _302;
  float _303;
  float _304;
  float _305;
  float _311;
  float _314;
  float _321;
  float _322;
  float _323;
  float _352;
  float _377;
  float _378;
  float _379;
  float _398;
  float _399;
  float _400;
  float _406;
  float _410;
  float _411;
  float _412;
  float _413;
  float _418;
  float _443;
  float _447;
  float _448;
  float _449;
  float _450;
  int _491;
  float _546;
  float _570;
  float _571;
  float _575;
  float _622;
  int __loop_jump_target = -1;
  float _17[36];
  _20 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _29 = float((int)(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * TEXCOORD.x)));
  _30 = float((int)(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * TEXCOORD.y)));
  _44 = 1.0f - (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_29 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x)), int(_30 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y)), 0)))).x);
  _46 = 0.0f;
  _47 = 0.0f;
  _48 = 0.0f;
  _49 = -6;
  while(true) {
    _51 = _46;
    _52 = _47;
    _53 = _48;
    _54 = -6;
    while(true) {
      _61 = (_global_0[min((uint)((_49 + 6)), 12u)]) * (_global_0[min((uint)((_54 + 6)), 12u)]);
      _72 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((((_44 * _srcTargetSizeAndInv.z) * float((int)(_49))) + TEXCOORD.x), (((_44 * _srcTargetSizeAndInv.w) * float((int)(_54))) + TEXCOORD.y)));
      _79 = (_72.x * _61) + _51;
      _80 = (_72.y * _61) + _52;
      _81 = (_72.z * _61) + _53;
      _82 = _54 + 1;
      if (!(_82 == 7)) {
        _51 = _79;
        _52 = _80;
        _53 = _81;
        _54 = _82;
        continue;
      }
      _85 = _49 + 1;
      if (!(_85 == 7)) {
        _46 = _79;
        _47 = _80;
        _48 = _81;
        _49 = _85;
        __loop_jump_target = 45;
        break;
      }
      __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_97.x, _97.y);
      _115 = (((((uint)(__3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)((int)(_97.x)))))) + 0.5f) * _29), int((float((int)(int(float((int)((int)(_97.y)))))) + 0.5f) * _30), 0)))).x) & 255) != 30);
      _119 = select(_115, ((_79 * 56493.91015625f) + _20.x), _20.x);
      _120 = select(_115, ((_80 * 56493.91015625f) + _20.y), _20.y);
      _121 = select(_115, ((_81 * 56493.91015625f) + _20.z), _20.z);
      _122 = uint(SV_Position.y);
      if (_etcParams.y == 1.0f) {
        _135 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _122, 0)))).x) & 127))) + 0.5f);
      } else {
        _135 = 1.0f;
      }
      if (_localToneMappingParams.w > 0.0f) {
        float3 output_color = TonemapReplacer(float3(_119, _120, _121));
        _557 = output_color.x;
        _558 = output_color.y;
        _559 = output_color.z;
      } else {
        _557 = _119;
        _558 = _120;
        _559 = _121;
      }
      if (_etcParams.y > 1.0f) {
        _570 = abs((TEXCOORD.x * 2.0f) + -1.0f);
        _571 = abs((TEXCOORD.y * 2.0f) + -1.0f);
        _575 = saturate(1.0f - (dot(float2(_570, _571), float2(_570, _571)) * saturate(_etcParams.y + -1.0f)));
        _580 = (_575 * _557);
        _581 = (_575 * _558);
        _582 = (_575 * _559);
      } else {
        _580 = _557;
        _581 = _558;
        _582 = _559;
      }
      if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
        _615 = select((_580 <= 0.0031308000907301903f), (_580 * 12.920000076293945f), (((pow(_580, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
        _616 = select((_581 <= 0.0031308000907301903f), (_581 * 12.920000076293945f), (((pow(_581, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
        _617 = select((_582 <= 0.0031308000907301903f), (_582 * 12.920000076293945f), (((pow(_582, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
      } else {
        _615 = _580;
        _616 = _581;
        _617 = _582;
      }
      if (!(_etcParams.y < 1.0f)) {
        _622 = float((uint)_122);
        if (!(_622 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
          if (_622 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
            _631 = _615;
            _632 = _616;
            _633 = _617;
          } else {
            _631 = 0.0f;
            _632 = 0.0f;
            _633 = 0.0f;
          }
        } else {
          _631 = 0.0f;
          _632 = 0.0f;
          _633 = 0.0f;
        }
      } else {
        _631 = _615;
        _632 = _616;
        _633 = _617;
      }
      SV_Target.x = _631;
      SV_Target.y = _632;
      SV_Target.z = _633;
      SV_Target.w = _135;
      break;
    }
    if (__loop_jump_target == 45) {
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
