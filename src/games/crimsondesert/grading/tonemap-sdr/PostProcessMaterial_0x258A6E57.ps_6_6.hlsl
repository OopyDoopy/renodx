#include "../tonemap.hlsli"

struct PostProcessCameraLensRainStruct {
  float _rainSpeed;
  float _rainUTiling;
  float _rainVTiling;
  float _streakUTiling;
  float _streakVTiling;
  uint _rainNormalTexture;
  uint _rainMaskTexture;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t36, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t29, space36);

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

cbuffer __3__1__0__0__PostProcessMaterialIndex : register(b2, space1) {
  int _materialIndex : packoffset(c000.x);
  int _passIndex : packoffset(c000.y);
};

struct BindlessParameters_PostProcessCameraLensRain {
  PostProcessCameraLensRainStruct BindlessParameters_PostProcessCameraLensRain;
};

typedef BindlessParameters_PostProcessCameraLensRain BindlessParameters_PostProcessCameraLensRain_t;
ConstantBuffer<BindlessParameters_PostProcessCameraLensRain_t> BindlessParameters_PostProcessCameraLensRain[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

static const float _global_0[5] = { 0.05471208319067955f, 0.05641283839941025f, 0.05699142813682556f, 0.05641283839941025f, 0.05471208319067955f };

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float4 _23;
  float _47;
  float _49;
  float _50;
  float _51;
  int _52;
  float _54;
  float _55;
  float _56;
  int _57;
  float _159;
  float _364;
  float _365;
  float _366;
  float _459;
  float _460;
  float _461;
  float _581;
  float _582;
  float _583;
  float _604;
  float _605;
  float _606;
  float _639;
  float _640;
  float _641;
  float _655;
  float _656;
  float _657;
  float _64;
  float4 _75;
  float _82;
  float _83;
  float _84;
  int _85;
  int _88;
  int _100;
  float _108;
  int _110;
  float _118;
  int _120;
  int _128;
  float4 _135;
  float _143;
  float _144;
  float _145;
  uint _146;
  float _168;
  float _217;
  float _218;
  float _219;
  float _221;
  float _228;
  float _229;
  float _230;
  float _249;
  float _250;
  float _251;
  float _252;
  float _253;
  float _254;
  float _255;
  float _256;
  float _257;
  float _303;
  float _304;
  float _305;
  float _306;
  float _307;
  float _308;
  float _309;
  float _326;
  float _327;
  float _328;
  float _329;
  float _335;
  float _338;
  float _345;
  float _346;
  float _347;
  float _376;
  float _401;
  float _402;
  float _403;
  float _422;
  float _423;
  float _424;
  float _430;
  float _434;
  float _435;
  float _436;
  float _437;
  float _442;
  float _467;
  float _471;
  float _472;
  float _473;
  float _474;
  int _515;
  float _570;
  float _594;
  float _595;
  float _599;
  float _646;
  int __loop_jump_target = -1;
  float _19[36];
  _23 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _47 = 1.0f - (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(float((int)(int(_srcTargetSizeAndInv.x * TEXCOORD.x))) * asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x)), int(float((int)(int(_srcTargetSizeAndInv.y * TEXCOORD.y))) * asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y)), 0)))).x);
  _49 = 0.0f;
  _50 = 0.0f;
  _51 = 0.0f;
  _52 = -2;
  while(true) {
    _54 = _49;
    _55 = _50;
    _56 = _51;
    _57 = -2;
    while(true) {
      _64 = (_global_0[min((uint)((_52 + 2)), 4u)]) * (_global_0[min((uint)((_57 + 2)), 4u)]);
      _75 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((((_47 * _destTargetSizAndInv.z) * float((int)(_52))) + TEXCOORD.x), (((_47 * _destTargetSizAndInv.w) * float((int)(_57))) + TEXCOORD.y)));
      _82 = (_75.x * _64) + _54;
      _83 = (_75.y * _64) + _55;
      _84 = (_75.z * _64) + _56;
      _85 = _57 + 1;
      if (!(_85 == 3)) {
        _54 = _82;
        _55 = _83;
        _56 = _84;
        _57 = _85;
        continue;
      }
      _88 = _52 + 1;
      if (!(_88 == 3)) {
        _49 = _82;
        _50 = _83;
        _51 = _84;
        _52 = _88;
        __loop_jump_target = 48;
        break;
      }
      _100 = WaveReadLaneFirst(_materialIndex);
      _108 = WaveReadLaneFirst(BindlessParameters_PostProcessCameraLensRain[((int)((uint)(select(((uint)_100 < (uint)170000), _100, 0)) + 0u))].BindlessParameters_PostProcessCameraLensRain._rainUTiling);
      _110 = WaveReadLaneFirst(_materialIndex);
      _118 = WaveReadLaneFirst(BindlessParameters_PostProcessCameraLensRain[((int)((uint)(select(((uint)_110 < (uint)170000), _110, 0)) + 0u))].BindlessParameters_PostProcessCameraLensRain._rainVTiling);
      _120 = WaveReadLaneFirst(_materialIndex);
      _128 = WaveReadLaneFirst(BindlessParameters_PostProcessCameraLensRain[((int)((uint)(select(((uint)_120 < (uint)170000), _120, 0)) + 0u))].BindlessParameters_PostProcessCameraLensRain._rainMaskTexture);
      _135 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_128 < (uint)65000), _128, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_108 * TEXCOORD.x), (_118 * TEXCOORD.y)));
      _143 = (_135.y * ((_82 * 12.82451057434082f) - _23.x)) + _23.x;
      _144 = (_135.y * ((_83 * 12.82451057434082f) - _23.y)) + _23.y;
      _145 = (_135.y * ((_84 * 12.82451057434082f) - _23.z)) + _23.z;
      _146 = uint(SV_Position.y);
      if (_etcParams.y == 1.0f) {
        _159 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _146, 0)))).x) & 127))) + 0.5f);
      } else {
        _159 = 1.0f;
      }
      if (_localToneMappingParams.w > 0.0f) {
        float3 output_color = TonemapReplacer(float3(_143, _144, _145));
        _581 = output_color.x;
        _582 = output_color.y;
        _583 = output_color.z;
      } else {
        _581 = _143;
        _582 = _144;
        _583 = _145;
      }
      if (_etcParams.y > 1.0f) {
        _594 = abs((TEXCOORD.x * 2.0f) + -1.0f);
        _595 = abs((TEXCOORD.y * 2.0f) + -1.0f);
        _599 = saturate(1.0f - (dot(float2(_594, _595), float2(_594, _595)) * saturate(_etcParams.y + -1.0f)));
        _604 = (_599 * _581);
        _605 = (_599 * _582);
        _606 = (_599 * _583);
      } else {
        _604 = _581;
        _605 = _582;
        _606 = _583;
      }
      if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
        _639 = select((_604 <= 0.0031308000907301903f), (_604 * 12.920000076293945f), (((pow(_604, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
        _640 = select((_605 <= 0.0031308000907301903f), (_605 * 12.920000076293945f), (((pow(_605, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
        _641 = select((_606 <= 0.0031308000907301903f), (_606 * 12.920000076293945f), (((pow(_606, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
      } else {
        _639 = _604;
        _640 = _605;
        _641 = _606;
      }
      if (!(_etcParams.y < 1.0f)) {
        _646 = float((uint)_146);
        if (!(_646 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
          if (_646 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
            _655 = _639;
            _656 = _640;
            _657 = _641;
          } else {
            _655 = 0.0f;
            _656 = 0.0f;
            _657 = 0.0f;
          }
        } else {
          _655 = 0.0f;
          _656 = 0.0f;
          _657 = 0.0f;
        }
      } else {
        _655 = _639;
        _656 = _640;
        _657 = _641;
      }
      SV_Target.x = _655;
      SV_Target.y = _656;
      SV_Target.z = _657;
      SV_Target.w = _159;
      break;
    }
    if (__loop_jump_target == 48) {
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