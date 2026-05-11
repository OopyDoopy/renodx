#include "../tonemap.hlsli"

struct PostProcessFisheye_DistortionStruct {
  float _maxPower;
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

cbuffer __3__1__0__0__PostProcessSizeConstant : register(b1, space1) {
  float4 _srcTargetSizeAndInv : packoffset(c000.x);
  float4 _destTargetSizAndInv : packoffset(c001.x);
};

cbuffer __3__1__0__0__PostProcessMaterialIndex : register(b2, space1) {
  int _materialIndex : packoffset(c000.x);
  int _passIndex : packoffset(c000.y);
};

struct BindlessParameters_PostProcessFisheye_Distortion {
  PostProcessFisheye_DistortionStruct BindlessParameters_PostProcessFisheye_Distortion;
};

typedef BindlessParameters_PostProcessFisheye_Distortion BindlessParameters_PostProcessFisheye_Distortion_t;
ConstantBuffer<BindlessParameters_PostProcessFisheye_Distortion_t> BindlessParameters_PostProcessFisheye_Distortion[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _30;
  float _31;
  float _32;
  float _33;
  float _34;
  float _35;
  float _36;
  float _37;
  int _38;
  float _46;
  bool _47;
  float _55;
  float _93;
  float _94;
  float _116;
  float _321;
  float _322;
  float _323;
  float _416;
  float _417;
  float _418;
  float _538;
  float _539;
  float _540;
  float _561;
  float _562;
  float _563;
  float _596;
  float _597;
  float _598;
  float _612;
  float _613;
  float _614;
  float _57;
  float _59;
  float _67;
  float _75;
  float _78;
  float _87;
  float4 _99;
  uint _103;
  float _125;
  float _174;
  float _175;
  float _176;
  float _178;
  float _185;
  float _186;
  float _187;
  float _206;
  float _207;
  float _208;
  float _209;
  float _210;
  float _211;
  float _212;
  float _213;
  float _214;
  float _260;
  float _261;
  float _262;
  float _263;
  float _264;
  float _265;
  float _266;
  float _283;
  float _284;
  float _285;
  float _286;
  float _292;
  float _295;
  float _302;
  float _303;
  float _304;
  float _333;
  float _358;
  float _359;
  float _360;
  float _379;
  float _380;
  float _381;
  float _387;
  float _391;
  float _392;
  float _393;
  float _394;
  float _399;
  float _424;
  float _428;
  float _429;
  float _430;
  float _431;
  int _472;
  float _527;
  float _551;
  float _552;
  float _556;
  float _603;
  float _18[36];
  _30 = (_destTargetSizAndInv.x * TEXCOORD.x) / _srcTargetSizeAndInv.x;
  _31 = (_destTargetSizAndInv.y * (1.0f - TEXCOORD.y)) / _srcTargetSizeAndInv.x;
  _32 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  _33 = 0.5f / _32;
  _34 = _30 + -0.5f;
  _35 = _31 - _33;
  _36 = dot(float2(_34, _35), float2(_34, _35));
  _37 = sqrt(_36);
  _38 = WaveReadLaneFirst(_materialIndex);
  _46 = WaveReadLaneFirst(BindlessParameters_PostProcessFisheye_Distortion[((int)((uint)(select(((uint)_38 < (uint)170000), _38, 0)) + 0u))].BindlessParameters_PostProcessFisheye_Distortion._maxPower);
  _47 = (_46 > 0.0f);
  if (_47) {
    _55 = sqrt(dot(float2(0.5f, _33), float2(0.5f, _33)));
  } else {
    if (!(_32 < 1.0f)) {
      _55 = _33;
    } else {
      _55 = 0.5f;
    }
  }
  if (_47) {
    _57 = rsqrt(_36);
    _59 = tan(_46 * _37);
    _67 = tan(_55 * _46);
    _93 = (((((_55 * _34) * _57) * _59) / _67) + 0.5f);
    _94 = (((((_55 * _35) * _57) * _59) / _67) + _33);
  } else {
    if (_46 < 0.0f) {
      _75 = rsqrt(_36);
      _78 = atan((_46 * _37) * -10.0f);
      _87 = atan((_46 * -10.0f) * _55);
      _93 = (((((_55 * _34) * _75) * _78) / _87) + 0.5f);
      _94 = (((((_55 * _35) * _75) * _78) / _87) + _33);
    } else {
      _93 = _30;
      _94 = _31;
    }
  }
  _99 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(_93, (1.0f - (_94 * _32))));
  _103 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _116 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _103, 0)))).x) & 127))) + 0.5f);
  } else {
    _116 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_99.x, _99.y, _99.z));
    _538 = output_color.x;
    _539 = output_color.y;
    _540 = output_color.z;
  } else {
    _538 = _99.x;
    _539 = _99.y;
    _540 = _99.z;
  }
  if (_etcParams.y > 1.0f) {
    _551 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _552 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _556 = saturate(1.0f - (dot(float2(_551, _552), float2(_551, _552)) * saturate(_etcParams.y + -1.0f)));
    _561 = (_556 * _538);
    _562 = (_556 * _539);
    _563 = (_556 * _540);
  } else {
    _561 = _538;
    _562 = _539;
    _563 = _540;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _596 = select((_561 <= 0.0031308000907301903f), (_561 * 12.920000076293945f), (((pow(_561, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _597 = select((_562 <= 0.0031308000907301903f), (_562 * 12.920000076293945f), (((pow(_562, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _598 = select((_563 <= 0.0031308000907301903f), (_563 * 12.920000076293945f), (((pow(_563, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _596 = _561;
    _597 = _562;
    _598 = _563;
  }
  if (!(_etcParams.y < 1.0f)) {
    _603 = float((uint)_103);
    if (!(_603 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_603 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _612 = _596;
        _613 = _597;
        _614 = _598;
      } else {
        _612 = 0.0f;
        _613 = 0.0f;
        _614 = 0.0f;
      }
    } else {
      _612 = 0.0f;
      _613 = 0.0f;
      _614 = 0.0f;
    }
  } else {
    _612 = _596;
    _613 = _597;
    _614 = _598;
  }
  SV_Target.x = _612;
  SV_Target.y = _613;
  SV_Target.z = _614;
  SV_Target.w = _116;
  return SV_Target;
}