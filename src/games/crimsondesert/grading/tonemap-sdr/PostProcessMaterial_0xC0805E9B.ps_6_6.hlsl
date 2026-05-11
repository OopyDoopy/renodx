#include "../tonemap.hlsli"

struct PostProcessActionStruct {
  float _contrast;
  float3 _saturation;
  float _gaussianBlurIntensity;
  float2 _gaussianBlurPosition;
  float _gaussianBlurClampInnerRadius;
  float _gaussianBlurClampHardness;
  float2 _radialBlurPosition;
  float _radialBlurIntensity;
  float _radialBlurClampInnerRadius;
  float _radialBlurClampHardness;
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
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

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

cbuffer __3__1__0__0__PostProcessSizeConstant : register(b1, space1) {
  float4 _srcTargetSizeAndInv : packoffset(c000.x);
  float4 _destTargetSizAndInv : packoffset(c001.x);
};

cbuffer __3__1__0__0__PostProcessMaterialIndex : register(b2, space1) {
  int _materialIndex : packoffset(c000.x);
  int _passIndex : packoffset(c000.y);
};

struct BindlessParameters_PostProcessAction {
  PostProcessActionStruct BindlessParameters_PostProcessAction;
};

typedef BindlessParameters_PostProcessAction BindlessParameters_PostProcessAction_t;
ConstantBuffer<BindlessParameters_PostProcessAction_t> BindlessParameters_PostProcessAction[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

static const float _global_0[11] = { 0.048393867909908295f, 0.05793797969818115f, 0.06664453446865082f, 0.07365360110998154f, 0.0782080888748169f, 0.07978799939155579f, 0.0782080888748169f, 0.07365360110998154f, 0.06664453446865082f, 0.05793797969818115f, 0.048393867909908295f };

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  int _22;
  float _30;
  int _31;
  float _39;
  int _40;
  float _48;
  float _56;
  float _57;
  float _58;
  int _59;
  float _61;
  float _62;
  float _63;
  int _64;
  float _180;
  float _181;
  float _182;
  float _306;
  float _324;
  float _338;
  float _543;
  float _544;
  float _545;
  float _638;
  float _639;
  float _640;
  float _760;
  float _761;
  float _762;
  float _783;
  float _784;
  float _785;
  float _818;
  float _819;
  float _820;
  float _834;
  float _835;
  float _836;
  float4 _85;
  float _95;
  float _96;
  float _97;
  float _122;
  float _126;
  float _127;
  float _128;
  int _129;
  int _132;
  float4 _139;
  float _149;
  float _150;
  float _151;
  int _185;
  float _194;
  float _195;
  int _198;
  float _207;
  float _208;
  int _211;
  int _219;
  int _228;
  float _236;
  int _237;
  float _245;
  float _251;
  float _254;
  float _255;
  float _264;
  int _265;
  float _273;
  int _276;
  float _285;
  float _286;
  int _294;
  float _302;
  int _308;
  float _316;
  uint _325;
  float _347;
  float _396;
  float _397;
  float _398;
  float _400;
  float _407;
  float _408;
  float _409;
  float _428;
  float _429;
  float _430;
  float _431;
  float _432;
  float _433;
  float _434;
  float _435;
  float _436;
  float _482;
  float _483;
  float _484;
  float _485;
  float _486;
  float _487;
  float _488;
  float _505;
  float _506;
  float _507;
  float _508;
  float _514;
  float _517;
  float _524;
  float _525;
  float _526;
  float _555;
  float _580;
  float _581;
  float _582;
  float _601;
  float _602;
  float _603;
  float _609;
  float _613;
  float _614;
  float _615;
  float _616;
  float _621;
  float _646;
  float _650;
  float _651;
  float _652;
  float _653;
  int _694;
  float _749;
  float _773;
  float _774;
  float _778;
  float _825;
  float _846;
  float _847;
  float _848;
  int __loop_jump_target = -1;
  float _19[36];
  _22 = WaveReadLaneFirst(_materialIndex);
  _30 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_22 < (uint)170000), _22, 0)) + 0u))].BindlessParameters_PostProcessAction._gaussianBlurIntensity);
  _31 = WaveReadLaneFirst(_materialIndex);
  _39 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_31 < (uint)170000), _31, 0)) + 0u))].BindlessParameters_PostProcessAction._radialBlurIntensity);
  _40 = WaveReadLaneFirst(_materialIndex);
  _48 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_40 < (uint)170000), _40, 0)) + 0u))].BindlessParameters_PostProcessAction._borderRatio);
  if (_30 > 0.0f) {
    _56 = 0.0f;
    _57 = 0.0f;
    _58 = 0.0f;
    _59 = -5;
    while(true) {
      _61 = _56;
      _62 = _57;
      _63 = _58;
      _64 = -5;
      while(true) {
        _85 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((((float((int)(_59)) * _30) * _srcTargetSizeAndInv.z) + TEXCOORD.x), (((float((int)(_64)) * _30) * _srcTargetSizeAndInv.w) + TEXCOORD.y)));
        _95 = (pow(_85.x, 0.012683313339948654f));
        _96 = (pow(_85.y, 0.012683313339948654f));
        _97 = (pow(_85.z, 0.012683313339948654f));
        _122 = ((_global_0[min((uint)((_59 + 5)), 10u)]) * (_global_0[min((uint)((_64 + 5)), 10u)])) * 10000.0f;
        _126 = (exp2(log2(max(0.0f, (_95 + -0.8359375f)) / (18.8515625f - (_95 * 18.6875f))) * 6.277394771575928f) * _122) + _61;
        _127 = (exp2(log2(max(0.0f, (_96 + -0.8359375f)) / (18.8515625f - (_96 * 18.6875f))) * 6.277394771575928f) * _122) + _62;
        _128 = (exp2(log2(max(0.0f, (_97 + -0.8359375f)) / (18.8515625f - (_97 * 18.6875f))) * 6.277394771575928f) * _122) + _63;
        _129 = _64 + 1;
        if (!(_129 == 6)) {
          _61 = _126;
          _62 = _127;
          _63 = _128;
          _64 = _129;
          continue;
        }
        _132 = _59 + 1;
        if (!(_132 == 6)) {
          _56 = _126;
          _57 = _127;
          _58 = _128;
          _59 = _132;
          __loop_jump_target = 55;
          break;
        }
        while(true) {
          _180 = (_126 * 1.8792827129364014f);
          _181 = (_127 * 1.8792827129364014f);
          _182 = (_128 * 1.8792827129364014f);
          break;
        }
        break;
      }
      if (__loop_jump_target == 55) {
        __loop_jump_target = -1;
        continue;
      }
      if (__loop_jump_target != -1) {
        break;
      }
      break;
    }
  } else {
    if (_39 > 0.0f) {
      _139 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
      _149 = (pow(_139.x, 0.012683313339948654f));
      _150 = (pow(_139.y, 0.012683313339948654f));
      _151 = (pow(_139.z, 0.012683313339948654f));
      _180 = (exp2(log2(max(0.0f, (_149 + -0.8359375f)) / (18.8515625f - (_149 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
      _181 = (exp2(log2(max(0.0f, (_150 + -0.8359375f)) / (18.8515625f - (_150 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
      _182 = (exp2(log2(max(0.0f, (_151 + -0.8359375f)) / (18.8515625f - (_151 * 18.6875f))) * 6.277394771575928f) * 10000.0f);
    } else {
      _180 = 0.0f;
      _181 = 0.0f;
      _182 = 0.0f;
    }
  }
  if (_48 > 0.0f) {
    _185 = WaveReadLaneFirst(_materialIndex);
    _194 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_185 < (uint)170000), _185, 0)) + 0u))].BindlessParameters_PostProcessAction._borderEdgeNoiseTile.x);
    _195 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_185 < (uint)170000), _185, 0)) + 0u))].BindlessParameters_PostProcessAction._borderEdgeNoiseTile.y);
    _198 = WaveReadLaneFirst(_materialIndex);
    _207 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_198 < (uint)170000), _198, 0)) + 0u))].BindlessParameters_PostProcessAction._borderEdgeNoiseOffset.x);
    _208 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_198 < (uint)170000), _198, 0)) + 0u))].BindlessParameters_PostProcessAction._borderEdgeNoiseOffset.y);
    _211 = WaveReadLaneFirst(_materialIndex);
    _219 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_211 < (uint)170000), _211, 0)) + 0u))].BindlessParameters_PostProcessAction._borderEdgeNoiseTexture);
    _228 = WaveReadLaneFirst(_materialIndex);
    _236 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_228 < (uint)170000), _228, 0)) + 0u))].BindlessParameters_PostProcessAction._borderSmoothness);
    _237 = WaveReadLaneFirst(_materialIndex);
    _245 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_237 < (uint)170000), _237, 0)) + 0u))].BindlessParameters_PostProcessAction._borderWidth);
    _251 = (1.0f - _245) * 0.5f;
    _254 = max((abs(TEXCOORD.x + -0.5f) - _251), 0.0f);
    _255 = max((abs(TEXCOORD.y + -0.5f) - _251), 0.0f);
    _264 = 1.0f - ((1.0f - saturate(sqrt((_255 * _255) + (_254 * _254)) / _236)) * 2.0f);
    _265 = WaveReadLaneFirst(_materialIndex);
    _273 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_265 < (uint)170000), _265, 0)) + 0u))].BindlessParameters_PostProcessAction._borderFlickerSpeed);
    if (_273 > 0.0f) {
      _276 = WaveReadLaneFirst(_materialIndex);
      _285 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_276 < (uint)170000), _276, 0)) + 0u))].BindlessParameters_PostProcessAction._borderFlickerOpacityMinMax.x);
      _286 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_276 < (uint)170000), _276, 0)) + 0u))].BindlessParameters_PostProcessAction._borderFlickerOpacityMinMax.y);
      _294 = WaveReadLaneFirst(_materialIndex);
      _302 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_294 < (uint)170000), _294, 0)) + 0u))].BindlessParameters_PostProcessAction._borderFlickerIntensity);
      _306 = ((min(max(sin((_273 * 3.1415927410125732f) * asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x)), _285), _286) * _264) * _302);
    } else {
      _306 = _264;
    }
    _308 = WaveReadLaneFirst(_materialIndex);
    _316 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_308 < (uint)170000), _308, 0)) + 0u))].BindlessParameters_PostProcessAction._borderEdgeNoiseRatio);
    _324 = (min(max(_48, 0.0f), 1.0f) * saturate(saturate(_306) - (_316 * (((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_219 < (uint)65000), _219, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_207 + (_194 * TEXCOORD.x)), (_208 + (_195 * TEXCOORD.y)))))).x))));
  } else {
    _324 = 1.0f;
  }
  _325 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _338 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _325, 0)))).x) & 127))) + 0.5f);
  } else {
    _338 = _324;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_180, _181, _182));
    _760 = output_color.x;
    _761 = output_color.y;
    _762 = output_color.z;
  } else {
    _760 = _180;
    _761 = _181;
    _762 = _182;
  }
  if (_etcParams.y > 1.0f) {
    _773 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _774 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _778 = saturate(1.0f - (dot(float2(_773, _774), float2(_773, _774)) * saturate(_etcParams.y + -1.0f)));
    _783 = (_778 * _760);
    _784 = (_778 * _761);
    _785 = (_778 * _762);
  } else {
    _783 = _760;
    _784 = _761;
    _785 = _762;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _818 = select((_783 <= 0.0031308000907301903f), (_783 * 12.920000076293945f), (((pow(_783, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _819 = select((_784 <= 0.0031308000907301903f), (_784 * 12.920000076293945f), (((pow(_784, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _820 = select((_785 <= 0.0031308000907301903f), (_785 * 12.920000076293945f), (((pow(_785, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _818 = _783;
    _819 = _784;
    _820 = _785;
  }
  if (!(_etcParams.y < 1.0f)) {
    _825 = float((uint)_325);
    if (!(_825 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_825 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _834 = _818;
        _835 = _819;
        _836 = _820;
      } else {
        _834 = 0.0f;
        _835 = 0.0f;
        _836 = 0.0f;
      }
    } else {
      _834 = 0.0f;
      _835 = 0.0f;
      _836 = 0.0f;
    }
  } else {
    _834 = _818;
    _835 = _819;
    _836 = _820;
  }
  _846 = exp2(log2(_834 * 9.999999747378752e-05f) * 0.1593017578125f);
  _847 = exp2(log2(_835 * 9.999999747378752e-05f) * 0.1593017578125f);
  _848 = exp2(log2(_836 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_846 * 18.6875f) + 1.0f)) * ((_846 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_847 * 18.6875f) + 1.0f)) * ((_847 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_848 * 18.6875f) + 1.0f)) * ((_848 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _338;
  return SV_Target;
}