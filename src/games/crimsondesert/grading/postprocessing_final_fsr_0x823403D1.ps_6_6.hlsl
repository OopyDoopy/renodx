#include "../common.hlsl"

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

cbuffer __3__35__0__0__SceneConstantBuffer : register(b16, space35) {
  uint4 __3__35__0__0__SceneConstantBuffer_raw[172];
};

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

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

SamplerState __0__4__0__0__g_staticPointBlackBorder : register(s11, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float4 _13;
  float _36;
  float _37;
  float _81;
  float _82;
  float _83;
  float _140;
  float _141;
  float _142;
  float _225;
  float _283;
  float _284;
  float _285;
  float _47;
  float _48;
  float _52;
  float _57;
  float _61;
  float _66;
  float _70;
  float _76;
  float _111;
  float _115;
  float _116;
  float _117;
  float _118;
  float _123;
  float _149;
  float _150;
  float _151;
  float _177;
  float _178;
  float _179;
  float _207;
  float _210;
  float _211;
  float _228;
  float _229;
  float _233;
  float _243;
  float _244;
  float _245;
  _13 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointBlackBorder, float2(TEXCOORD.x, TEXCOORD.y));
  if (_postProcessParams.w > 0.0f) {
    _36 = (((float4)(__3__36__0__0__g_sceneColor.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(((_postProcessParams.w * ((TEXCOORD.x * 0.003000000026077032f) + -0.001500000013038516f)) + TEXCOORD.x), TEXCOORD.y), 0.0f))).x);
    _37 = (((float4)(__3__36__0__0__g_sceneColor.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, ((_postProcessParams.w * ((TEXCOORD.y * 0.003000000026077032f) + -0.001500000013038516f)) + TEXCOORD.y)), 0.0f))).z);
  } else {
    _36 = _13.x;
    _37 = _13.z;
  }

  _36 = lerp(_13.x, _36, CUSTOM_CHROMATIC_ABERRATION);
  _37 = lerp(_13.z, _37, CUSTOM_CHROMATIC_ABERRATION);

  bool vanilla_film_grain = (_slopeParams.w > 0.0f) && CUSTOM_FILM_GRAIN_TYPE == 0;
  if (vanilla_film_grain) {
    _47 = ((TEXCOORD.y + 4.0f) * (TEXCOORD.x + 4.0f)) * asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x);
    _48 = _47 * 0.7692307829856873f;
    _52 = frac(abs(_48));
    _57 = _47 * 0.08130080997943878f;
    _61 = frac(abs(_57));
    _66 = ((select((_57 >= (-0.0f - _57)), _61, (-0.0f - _61)) * 1230.0f) + 10.0f) * ((select((_48 >= (-0.0f - _48)), _52, (-0.0f - _52)) * 13.0f) + 1.0f);
    _70 = frac(abs(_66));
    _76 = ((0.007500052452087402f - (select((_66 >= (-0.0f - _66)), _70, (-0.0f - _70)) * 0.15000000596046448f)) * _slopeParams.w) + 1.0f;
    _81 = (_76 * _36);
    _82 = (_76 * _13.y);
    _83 = (_76 * _37);
  } else {
    _81 = _36;
    _82 = _13.y;
    _83 = _37;
  }

  if (CUSTOM_FILM_GRAIN_TYPE != 0 || CUSTOM_SHARPENING_TYPE != 0) {
    float3 color_pq = float3(_81, _82, _83);

    float scaling = RENODX_TONE_MAP_TYPE == 0 ? 100.0f : RENODX_DIFFUSE_WHITE_NITS;
    float3 color_bt2020 = renodx::color::pq::DecodeSafe(color_pq, scaling);
    float3 color_bt709 = renodx::color::bt709::from::BT2020(color_bt2020);
    color_bt709 = CustomPostProcessing(color_bt709, TEXCOORD, __3__36__0__0__g_sceneColor, __0__4__0__0__g_staticBilinearClamp, 0, scaling);
    color_bt2020 = renodx::color::bt2020::from::BT709(color_bt709);
    color_pq = renodx::color::pq::EncodeSafe(color_bt2020, scaling);

    _81 = color_pq.x;
    _82 = color_pq.y;
    _83 = color_pq.z;
  }

  _111 = 1.0f - abs(_etcParams.w);
  _115 = saturate(_etcParams.w);
#if 0
  _116 = (_111 * select((_81 < 0.040449999272823334f), (_81 * 0.07739938050508499f), exp2(log2((_81 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f))) + _115;
  _117 = (_111 * select((_82 < 0.040449999272823334f), (_82 * 0.07739938050508499f), exp2(log2((_82 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f))) + _115;
  _118 = (_111 * select((_83 < 0.040449999272823334f), (_83 * 0.07739938050508499f), exp2(log2((_83 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f))) + _115;
#else
  _116 = _111 * _81 + _115;
  _117 = _111 * _82 + _115;
  _118 = _111 * _83 + _115;
#endif
  if (_colorGradingParams.w > 0.0f) {
    _123 = saturate(_colorGradingParams.w);
    _140 = (((max(0.0f, (1.0f - _116)) - _116) * _123) + _116);
    _141 = (((max(0.0f, (1.0f - _117)) - _117) * _123) + _117);
    _142 = (((max(0.0f, (1.0f - _118)) - _118) * _123) + _118);
  } else {
    _140 = _116;
    _141 = _117;
    _142 = _118;
  }
  _149 = (pow(_140, 0.012683313339948654f));
  _150 = (pow(_141, 0.012683313339948654f));
  _151 = (pow(_142, 0.012683313339948654f));
  _177 = (TEXCOORD.x * 2.0f) + -1.0f;
  _178 = TEXCOORD.y * 2.0f;
  _179 = 1.0f - _178;
  _207 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[105u].w), 1.0000000116860974e-07f, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[104u].w), _179, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[103u].w) * _177))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[106u].w);
  _210 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[105u].x), 1.0000000116860974e-07f, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[104u].x), _179, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[103u].x) * _177))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[106u].x)) / _207) - _177;
  _211 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[105u].y), 1.0000000116860974e-07f, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[104u].y), _179, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[103u].y) * _177))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[106u].y)) / _207) - _179;
  if (_localToneMappingParams.w > 0.0f) {
    _225 = saturate(1.0f - (sqrt((_211 * _211) + (_210 * _210)) * 2.0f));
  } else {
    _225 = 1.0f;
  }
  _228 = abs(_177);
  _229 = abs(_178 + -1.0f);
  _233 = saturate(1.0f - ((_225 * _postProcessParams.x * CUSTOM_VIGNETTE) * dot(float2(_228, _229), float2(_228, _229))));
  _243 = exp2(log2(_233 * exp2(log2(max(0.0f, (_149 + -0.8359375f)) / (18.8515625f - (_149 * 18.6875f))) * 6.277394771575928f)) * 0.1593017578125f);
  _244 = exp2(log2(_233 * exp2(log2(max(0.0f, (_150 + -0.8359375f)) / (18.8515625f - (_150 * 18.6875f))) * 6.277394771575928f)) * 0.1593017578125f);
  _245 = exp2(log2(_233 * exp2(log2(max(0.0f, (_151 + -0.8359375f)) / (18.8515625f - (_151 * 18.6875f))) * 6.277394771575928f)) * 0.1593017578125f);
  if (!(SV_Position.y < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
    if (SV_Position.y < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      _283 = exp2(log2((1.0f / ((_243 * 18.6875f) + 1.0f)) * ((_243 * 18.8515625f) + 0.8359375f)) * 78.84375f);
      _284 = exp2(log2((1.0f / ((_244 * 18.6875f) + 1.0f)) * ((_244 * 18.8515625f) + 0.8359375f)) * 78.84375f);
      _285 = exp2(log2((1.0f / ((_245 * 18.6875f) + 1.0f)) * ((_245 * 18.8515625f) + 0.8359375f)) * 78.84375f);
    } else {
      _283 = 0.0f;
      _284 = 0.0f;
      _285 = 0.0f;
    }
  } else {
    _283 = 0.0f;
    _284 = 0.0f;
    _285 = 0.0f;
  }
  SV_Target.x = _283;
  SV_Target.y = _284;
  SV_Target.z = _285;
  SV_Target.w = _13.w;

  SV_Target.xyz = FinalizeHDR(
      SV_Target.xyz,
      asfloat(__3__35__0__0__SceneConstantBuffer_raw[42u].y),
      asfloat(__3__35__0__0__SceneConstantBuffer_raw[43u].y));

  return SV_Target;
}
