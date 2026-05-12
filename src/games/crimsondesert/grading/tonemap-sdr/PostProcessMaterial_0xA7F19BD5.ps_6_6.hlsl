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
  float _32;
  float _33;
  float _34;
  float _59;
  float _60;
  float _61;
  int _62;
  float _70;
  float _71;
  float _78;
  float _79;
  float _80;
  uint _81;
  float _95;
  float _300;
  float _301;
  float _302;
  float _395;
  float _396;
  float _397;
  float _517;
  float _518;
  float _519;
  float _540;
  float _541;
  float _542;
  float _575;
  float _576;
  float _577;
  float _591;
  float _592;
  float _593;
  float _104;
  float _153;
  float _154;
  float _155;
  float _157;
  float _164;
  float _165;
  float _166;
  float _185;
  float _186;
  float _187;
  float _188;
  float _189;
  float _190;
  float _191;
  float _192;
  float _193;
  float _239;
  float _240;
  float _241;
  float _242;
  float _243;
  float _244;
  float _245;
  float _262;
  float _263;
  float _264;
  float _265;
  float _271;
  float _274;
  float _281;
  float _282;
  float _283;
  float _312;
  float _337;
  float _338;
  float _339;
  float _358;
  float _359;
  float _360;
  float _366;
  float _370;
  float _371;
  float _372;
  float _373;
  float _378;
  float _403;
  float _407;
  float _408;
  float _409;
  float _410;
  int _451;
  float _506;
  float _530;
  float _531;
  float _535;
  float _582;
  float _603;
  float _604;
  float _605;
  float _15[36];
  _22 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _32 = (pow(_22.x, 0.012683313339948654f));
  _33 = (pow(_22.y, 0.012683313339948654f));
  _34 = (pow(_22.z, 0.012683313339948654f));
  _59 = exp2(log2(max(0.0f, (_32 + -0.8359375f)) / (18.8515625f - (_32 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _60 = exp2(log2(max(0.0f, (_33 + -0.8359375f)) / (18.8515625f - (_33 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _61 = exp2(log2(max(0.0f, (_34 + -0.8359375f)) / (18.8515625f - (_34 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _62 = WaveReadLaneFirst(_materialIndex);
  _70 = WaveReadLaneFirst(BindlessParameters_PostProcessGrayscale[((int)((uint)(select(((uint)_62 < (uint)170000), _62, 0)) + 0u))].BindlessParameters_PostProcessGrayscale._ratio);
  _71 = dot(float3(_59, _60, _61), float3(0.26269999146461487f, 0.6779999732971191f, 0.059300001710653305f));
  _78 = ((_71 - _59) * _70) + _59;
  _79 = ((_71 - _60) * _70) + _60;
  _80 = ((_71 - _61) * _70) + _61;
  _81 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _95 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _81, 0)))).x) & 127))) + 0.5f);
  } else {
    _95 = _postProcessParams.x;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_78, _79, _80));
    _517 = output_color.x;
    _518 = output_color.y;
    _519 = output_color.z;
  } else {
    _517 = _78;
    _518 = _79;
    _519 = _80;
  }
  if (_etcParams.y > 1.0f) {
    _530 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _531 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _535 = saturate(1.0f - (dot(float2(_530, _531), float2(_530, _531)) * saturate(_etcParams.y + -1.0f)));
    _540 = (_535 * _517);
    _541 = (_535 * _518);
    _542 = (_535 * _519);
  } else {
    _540 = _517;
    _541 = _518;
    _542 = _519;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _575 = select((_540 <= 0.0031308000907301903f), (_540 * 12.920000076293945f), (((pow(_540, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _576 = select((_541 <= 0.0031308000907301903f), (_541 * 12.920000076293945f), (((pow(_541, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _577 = select((_542 <= 0.0031308000907301903f), (_542 * 12.920000076293945f), (((pow(_542, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _575 = _540;
    _576 = _541;
    _577 = _542;
  }
  if (!(_etcParams.y < 1.0f)) {
    _582 = float((uint)_81);
    if (!(_582 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_582 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _591 = _575;
        _592 = _576;
        _593 = _577;
      } else {
        _591 = 0.0f;
        _592 = 0.0f;
        _593 = 0.0f;
      }
    } else {
      _591 = 0.0f;
      _592 = 0.0f;
      _593 = 0.0f;
    }
  } else {
    _591 = _575;
    _592 = _576;
    _593 = _577;
  }
  _603 = exp2(log2(_591 * 9.999999747378752e-05f) * 0.1593017578125f);
  _604 = exp2(log2(_592 * 9.999999747378752e-05f) * 0.1593017578125f);
  _605 = exp2(log2(_593 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_603 * 18.6875f) + 1.0f)) * ((_603 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_604 * 18.6875f) + 1.0f)) * ((_604 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_605 * 18.6875f) + 1.0f)) * ((_605 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _95;
  return SV_Target;
}