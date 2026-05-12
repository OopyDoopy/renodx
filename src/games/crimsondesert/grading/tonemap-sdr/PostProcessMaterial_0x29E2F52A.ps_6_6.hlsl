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
  float _110;
  float _111;
  float _112;
  float _236;
  float _254;
  float _268;
  float _473;
  float _474;
  float _475;
  float _568;
  float _569;
  float _570;
  float _690;
  float _691;
  float _692;
  float _713;
  float _714;
  float _715;
  float _748;
  float _749;
  float _750;
  float _764;
  float _765;
  float _766;
  float _71;
  float4 _85;
  float _92;
  float _93;
  float _94;
  int _95;
  int _98;
  float4 _105;
  int _115;
  float _124;
  float _125;
  int _128;
  float _137;
  float _138;
  int _141;
  int _149;
  int _158;
  float _166;
  int _167;
  float _175;
  float _181;
  float _184;
  float _185;
  float _194;
  int _195;
  float _203;
  int _206;
  float _215;
  float _216;
  int _224;
  float _232;
  int _238;
  float _246;
  uint _255;
  float _277;
  float _326;
  float _327;
  float _328;
  float _330;
  float _337;
  float _338;
  float _339;
  float _358;
  float _359;
  float _360;
  float _361;
  float _362;
  float _363;
  float _364;
  float _365;
  float _366;
  float _412;
  float _413;
  float _414;
  float _415;
  float _416;
  float _417;
  float _418;
  float _435;
  float _436;
  float _437;
  float _438;
  float _444;
  float _447;
  float _454;
  float _455;
  float _456;
  float _485;
  float _510;
  float _511;
  float _512;
  float _531;
  float _532;
  float _533;
  float _539;
  float _543;
  float _544;
  float _545;
  float _546;
  float _551;
  float _576;
  float _580;
  float _581;
  float _582;
  float _583;
  int _624;
  float _679;
  float _703;
  float _704;
  float _708;
  float _755;
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
        _71 = (_global_0[min((uint)((_59 + 5)), 10u)]) * (_global_0[min((uint)((_64 + 5)), 10u)]);
        _85 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((((float((int)(_59)) * _30) * _srcTargetSizeAndInv.z) + TEXCOORD.x), (((float((int)(_64)) * _30) * _srcTargetSizeAndInv.w) + TEXCOORD.y)));
        _92 = (_85.x * _71) + _61;
        _93 = (_85.y * _71) + _62;
        _94 = (_85.z * _71) + _63;
        _95 = _64 + 1;
        if (!(_95 == 6)) {
          _61 = _92;
          _62 = _93;
          _63 = _94;
          _64 = _95;
          continue;
        }
        _98 = _59 + 1;
        if (!(_98 == 6)) {
          _56 = _92;
          _57 = _93;
          _58 = _94;
          _59 = _98;
          __loop_jump_target = 55;
          break;
        }
        while(true) {
          _110 = (_92 * 1.8792827129364014f);
          _111 = (_93 * 1.8792827129364014f);
          _112 = (_94 * 1.8792827129364014f);
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
      _105 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
      _110 = _105.x;
      _111 = _105.y;
      _112 = _105.z;
    } else {
      _110 = 0.0f;
      _111 = 0.0f;
      _112 = 0.0f;
    }
  }
  if (_48 > 0.0f) {
    _115 = WaveReadLaneFirst(_materialIndex);
    _124 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_115 < (uint)170000), _115, 0)) + 0u))].BindlessParameters_PostProcessAction._borderEdgeNoiseTile.x);
    _125 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_115 < (uint)170000), _115, 0)) + 0u))].BindlessParameters_PostProcessAction._borderEdgeNoiseTile.y);
    _128 = WaveReadLaneFirst(_materialIndex);
    _137 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_128 < (uint)170000), _128, 0)) + 0u))].BindlessParameters_PostProcessAction._borderEdgeNoiseOffset.x);
    _138 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_128 < (uint)170000), _128, 0)) + 0u))].BindlessParameters_PostProcessAction._borderEdgeNoiseOffset.y);
    _141 = WaveReadLaneFirst(_materialIndex);
    _149 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_141 < (uint)170000), _141, 0)) + 0u))].BindlessParameters_PostProcessAction._borderEdgeNoiseTexture);
    _158 = WaveReadLaneFirst(_materialIndex);
    _166 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_158 < (uint)170000), _158, 0)) + 0u))].BindlessParameters_PostProcessAction._borderSmoothness);
    _167 = WaveReadLaneFirst(_materialIndex);
    _175 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_167 < (uint)170000), _167, 0)) + 0u))].BindlessParameters_PostProcessAction._borderWidth);
    _181 = (1.0f - _175) * 0.5f;
    _184 = max((abs(TEXCOORD.x + -0.5f) - _181), 0.0f);
    _185 = max((abs(TEXCOORD.y + -0.5f) - _181), 0.0f);
    _194 = 1.0f - ((1.0f - saturate(sqrt((_185 * _185) + (_184 * _184)) / _166)) * 2.0f);
    _195 = WaveReadLaneFirst(_materialIndex);
    _203 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_195 < (uint)170000), _195, 0)) + 0u))].BindlessParameters_PostProcessAction._borderFlickerSpeed);
    if (_203 > 0.0f) {
      _206 = WaveReadLaneFirst(_materialIndex);
      _215 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_206 < (uint)170000), _206, 0)) + 0u))].BindlessParameters_PostProcessAction._borderFlickerOpacityMinMax.x);
      _216 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_206 < (uint)170000), _206, 0)) + 0u))].BindlessParameters_PostProcessAction._borderFlickerOpacityMinMax.y);
      _224 = WaveReadLaneFirst(_materialIndex);
      _232 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_224 < (uint)170000), _224, 0)) + 0u))].BindlessParameters_PostProcessAction._borderFlickerIntensity);
      _236 = ((min(max(sin((_203 * 3.1415927410125732f) * asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x)), _215), _216) * _194) * _232);
    } else {
      _236 = _194;
    }
    _238 = WaveReadLaneFirst(_materialIndex);
    _246 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_238 < (uint)170000), _238, 0)) + 0u))].BindlessParameters_PostProcessAction._borderEdgeNoiseRatio);
    _254 = (min(max(_48, 0.0f), 1.0f) * saturate(saturate(_236) - (_246 * (((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_149 < (uint)65000), _149, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_137 + (_124 * TEXCOORD.x)), (_138 + (_125 * TEXCOORD.y)))))).x))));
  } else {
    _254 = 1.0f;
  }
  _255 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _268 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _255, 0)))).x) & 127))) + 0.5f);
  } else {
    _268 = _254;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_110, _111, _112));
    _690 = output_color.x;
    _691 = output_color.y;
    _692 = output_color.z;
  } else {
    _690 = _110;
    _691 = _111;
    _692 = _112;
  }
  if (_etcParams.y > 1.0f) {
    _703 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _704 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _708 = saturate(1.0f - (dot(float2(_703, _704), float2(_703, _704)) * saturate(_etcParams.y + -1.0f)));
    _713 = (_708 * _690);
    _714 = (_708 * _691);
    _715 = (_708 * _692);
  } else {
    _713 = _690;
    _714 = _691;
    _715 = _692;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _748 = select((_713 <= 0.0031308000907301903f), (_713 * 12.920000076293945f), (((pow(_713, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _749 = select((_714 <= 0.0031308000907301903f), (_714 * 12.920000076293945f), (((pow(_714, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _750 = select((_715 <= 0.0031308000907301903f), (_715 * 12.920000076293945f), (((pow(_715, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _748 = _713;
    _749 = _714;
    _750 = _715;
  }
  if (!(_etcParams.y < 1.0f)) {
    _755 = float((uint)_255);
    if (!(_755 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_755 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _764 = _748;
        _765 = _749;
        _766 = _750;
      } else {
        _764 = 0.0f;
        _765 = 0.0f;
        _766 = 0.0f;
      }
    } else {
      _764 = 0.0f;
      _765 = 0.0f;
      _766 = 0.0f;
    }
  } else {
    _764 = _748;
    _765 = _749;
    _766 = _750;
  }
  SV_Target.x = _764;
  SV_Target.y = _765;
  SV_Target.z = _766;
  SV_Target.w = _268;
  return SV_Target;
}