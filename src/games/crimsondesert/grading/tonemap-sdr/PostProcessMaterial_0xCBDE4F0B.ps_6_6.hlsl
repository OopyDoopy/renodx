#include "../tonemap.hlsli"

Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t36, space36);

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

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float4 _16;
  float _26;
  float _27;
  float _28;
  float _50;
  float _51;
  float _52;
  uint _56;
  float _70;
  float _275;
  float _276;
  float _277;
  float _370;
  float _371;
  float _372;
  float _492;
  float _493;
  float _494;
  float _515;
  float _516;
  float _517;
  float _550;
  float _551;
  float _552;
  float _566;
  float _567;
  float _568;
  float _79;
  float _128;
  float _129;
  float _130;
  float _132;
  float _139;
  float _140;
  float _141;
  float _160;
  float _161;
  float _162;
  float _163;
  float _164;
  float _165;
  float _166;
  float _167;
  float _168;
  float _214;
  float _215;
  float _216;
  float _217;
  float _218;
  float _219;
  float _220;
  float _237;
  float _238;
  float _239;
  float _240;
  float _246;
  float _249;
  float _256;
  float _257;
  float _258;
  float _287;
  float _312;
  float _313;
  float _314;
  float _333;
  float _334;
  float _335;
  float _341;
  float _345;
  float _346;
  float _347;
  float _348;
  float _353;
  float _378;
  float _382;
  float _383;
  float _384;
  float _385;
  int _426;
  float _481;
  float _505;
  float _506;
  float _510;
  float _557;
  float _578;
  float _579;
  float _580;
  float _13[36];
  _16 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _26 = (pow(_16.x, 0.012683313339948654f));
  _27 = (pow(_16.y, 0.012683313339948654f));
  _28 = (pow(_16.z, 0.012683313339948654f));
  _50 = exp2(log2(max(0.0f, (_26 + -0.8359375f)) / (18.8515625f - (_26 * 18.6875f))) * 6.277394771575928f);
  _51 = exp2(log2(max(0.0f, (_27 + -0.8359375f)) / (18.8515625f - (_27 * 18.6875f))) * 6.277394771575928f);
  _52 = exp2(log2(max(0.0f, (_28 + -0.8359375f)) / (18.8515625f - (_28 * 18.6875f))) * 6.277394771575928f);
  _56 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _70 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _56, 0)))).x) & 127))) + 0.5f);
  } else {
    _70 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_50, _51, _52));
    _492 = output_color.x;
    _493 = output_color.y;
    _494 = output_color.z;
  } else {
    _492 = (_50 * 10000.0f);
    _493 = (_51 * 10000.0f);
    _494 = (_52 * 10000.0f);
  }
  if (_etcParams.y > 1.0f) {
    _505 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _506 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _510 = saturate(1.0f - (dot(float2(_505, _506), float2(_505, _506)) * saturate(_etcParams.y + -1.0f)));
    _515 = (_510 * _492);
    _516 = (_510 * _493);
    _517 = (_510 * _494);
  } else {
    _515 = _492;
    _516 = _493;
    _517 = _494;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _550 = select((_515 <= 0.0031308000907301903f), (_515 * 12.920000076293945f), (((pow(_515, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _551 = select((_516 <= 0.0031308000907301903f), (_516 * 12.920000076293945f), (((pow(_516, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _552 = select((_517 <= 0.0031308000907301903f), (_517 * 12.920000076293945f), (((pow(_517, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _550 = _515;
    _551 = _516;
    _552 = _517;
  }
  if (!(_etcParams.y < 1.0f)) {
    _557 = float((uint)_56);
    if (!(_557 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_557 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _566 = _550;
        _567 = _551;
        _568 = _552;
      } else {
        _566 = 0.0f;
        _567 = 0.0f;
        _568 = 0.0f;
      }
    } else {
      _566 = 0.0f;
      _567 = 0.0f;
      _568 = 0.0f;
    }
  } else {
    _566 = _550;
    _567 = _551;
    _568 = _552;
  }
  _578 = exp2(log2(_566 * 9.999999747378752e-05f) * 0.1593017578125f);
  _579 = exp2(log2(_567 * 9.999999747378752e-05f) * 0.1593017578125f);
  _580 = exp2(log2(_568 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_578 * 18.6875f) + 1.0f)) * ((_578 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_579 * 18.6875f) + 1.0f)) * ((_579 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_580 * 18.6875f) + 1.0f)) * ((_580 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _70;
  return SV_Target;
}