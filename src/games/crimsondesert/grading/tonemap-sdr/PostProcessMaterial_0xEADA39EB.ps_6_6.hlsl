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
  float _152;
  float _357;
  float _358;
  float _359;
  float _452;
  float _453;
  float _454;
  float _574;
  float _575;
  float _576;
  float _597;
  float _598;
  float _599;
  float _632;
  float _633;
  float _634;
  float _648;
  float _649;
  float _650;
  float _57;
  float _59;
  float _67;
  float _75;
  float _78;
  float _87;
  float4 _99;
  float _109;
  float _110;
  float _111;
  float _133;
  float _134;
  float _135;
  uint _139;
  float _161;
  float _210;
  float _211;
  float _212;
  float _214;
  float _221;
  float _222;
  float _223;
  float _242;
  float _243;
  float _244;
  float _245;
  float _246;
  float _247;
  float _248;
  float _249;
  float _250;
  float _296;
  float _297;
  float _298;
  float _299;
  float _300;
  float _301;
  float _302;
  float _319;
  float _320;
  float _321;
  float _322;
  float _328;
  float _331;
  float _338;
  float _339;
  float _340;
  float _369;
  float _394;
  float _395;
  float _396;
  float _415;
  float _416;
  float _417;
  float _423;
  float _427;
  float _428;
  float _429;
  float _430;
  float _435;
  float _460;
  float _464;
  float _465;
  float _466;
  float _467;
  int _508;
  float _563;
  float _587;
  float _588;
  float _592;
  float _639;
  float _660;
  float _661;
  float _662;
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
  _109 = (pow(_99.x, 0.012683313339948654f));
  _110 = (pow(_99.y, 0.012683313339948654f));
  _111 = (pow(_99.z, 0.012683313339948654f));
  _133 = exp2(log2(max(0.0f, (_109 + -0.8359375f)) / (18.8515625f - (_109 * 18.6875f))) * 6.277394771575928f);
  _134 = exp2(log2(max(0.0f, (_110 + -0.8359375f)) / (18.8515625f - (_110 * 18.6875f))) * 6.277394771575928f);
  _135 = exp2(log2(max(0.0f, (_111 + -0.8359375f)) / (18.8515625f - (_111 * 18.6875f))) * 6.277394771575928f);
  _139 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _152 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _139, 0)))).x) & 127))) + 0.5f);
  } else {
    _152 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_133, _134, _135));
    _574 = output_color.x;
    _575 = output_color.y;
    _576 = output_color.z;
  } else {
    _574 = (_133 * 10000.0f);
    _575 = (_134 * 10000.0f);
    _576 = (_135 * 10000.0f);
  }
  if (_etcParams.y > 1.0f) {
    _587 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _588 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _592 = saturate(1.0f - (dot(float2(_587, _588), float2(_587, _588)) * saturate(_etcParams.y + -1.0f)));
    _597 = (_592 * _574);
    _598 = (_592 * _575);
    _599 = (_592 * _576);
  } else {
    _597 = _574;
    _598 = _575;
    _599 = _576;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _632 = select((_597 <= 0.0031308000907301903f), (_597 * 12.920000076293945f), (((pow(_597, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _633 = select((_598 <= 0.0031308000907301903f), (_598 * 12.920000076293945f), (((pow(_598, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _634 = select((_599 <= 0.0031308000907301903f), (_599 * 12.920000076293945f), (((pow(_599, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _632 = _597;
    _633 = _598;
    _634 = _599;
  }
  if (!(_etcParams.y < 1.0f)) {
    _639 = float((uint)_139);
    if (!(_639 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_639 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _648 = _632;
        _649 = _633;
        _650 = _634;
      } else {
        _648 = 0.0f;
        _649 = 0.0f;
        _650 = 0.0f;
      }
    } else {
      _648 = 0.0f;
      _649 = 0.0f;
      _650 = 0.0f;
    }
  } else {
    _648 = _632;
    _649 = _633;
    _650 = _634;
  }
  _660 = exp2(log2(_648 * 9.999999747378752e-05f) * 0.1593017578125f);
  _661 = exp2(log2(_649 * 9.999999747378752e-05f) * 0.1593017578125f);
  _662 = exp2(log2(_650 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_660 * 18.6875f) + 1.0f)) * ((_660 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_661 * 18.6875f) + 1.0f)) * ((_661 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_662 * 18.6875f) + 1.0f)) * ((_662 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _152;
  return SV_Target;
}