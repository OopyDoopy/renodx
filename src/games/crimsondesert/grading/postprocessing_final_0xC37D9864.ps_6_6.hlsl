#include "../common.hlsl"

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t37, space36);

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
  float4 _14;
  float _37;
  float _38;
  float _82;
  float _83;
  float _84;
  float _184;
  float _185;
  float _186;
  float _243;
  float _244;
  float _245;
  float _328;
  float _48;
  float _49;
  float _53;
  float _58;
  float _62;
  float _67;
  float _71;
  float _77;
  uint _90;
  uint _91;
  float _93;
  float _101;
  float4 _108;
  float4 _113;
  float4 _118;
  float4 _123;
  float _134;
  float _141;
  float _144;
  float _166;
  float _167;
  float _168;
  float _173;
  float _174;
  float _175;
  float _176;
  float _214;
  float _218;
  float _219;
  float _220;
  float _221;
  float _226;
  float _252;
  float _253;
  float _254;
  float _280;
  float _281;
  float _282;
  float _310;
  float _313;
  float _314;
  float _331;
  float _332;
  float _336;
  float _346;
  float _347;
  float _348;
  bool _381;
  _14 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointBlackBorder, float2(TEXCOORD.x, TEXCOORD.y));
  if (_postProcessParams.w > 0.0f) {
    _37 = (((float4)(__3__36__0__0__g_sceneColor.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(((_postProcessParams.w * ((TEXCOORD.x * 0.003000000026077032f) + -0.001500000013038516f)) + TEXCOORD.x), TEXCOORD.y), 0.0f))).x);
    _38 = (((float4)(__3__36__0__0__g_sceneColor.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, ((_postProcessParams.w * ((TEXCOORD.y * 0.003000000026077032f) + -0.001500000013038516f)) + TEXCOORD.y)), 0.0f))).z);
  } else {
    _37 = _14.x;
    _38 = _14.z;
  }

  _37 = lerp(_14.x, _37, CUSTOM_CHROMATIC_ABERRATION);
  _38 = lerp(_14.z, _38, CUSTOM_CHROMATIC_ABERRATION);

  bool vanilla_film_grain = (_slopeParams.w > 0.0f) && CUSTOM_FILM_GRAIN_TYPE == 0;
  if (vanilla_film_grain) {
    _48 = ((TEXCOORD.y + 4.0f) * (TEXCOORD.x + 4.0f)) * asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x);
    _49 = _48 * 0.7692307829856873f;
    _53 = frac(abs(_49));
    _58 = _48 * 0.08130080997943878f;
    _62 = frac(abs(_58));
    _67 = ((select((_58 >= (-0.0f - _58)), _62, (-0.0f - _62)) * 1230.0f) + 10.0f) * ((select((_49 >= (-0.0f - _49)), _53, (-0.0f - _53)) * 13.0f) + 1.0f);
    _71 = frac(abs(_67));
    _77 = ((0.007500052452087402f - (select((_67 >= (-0.0f - _67)), _71, (-0.0f - _71)) * 0.15000000596046448f)) * _slopeParams.w) + 1.0f;
    _82 = (_77 * _37);
    _83 = (_77 * _14.y);
    _84 = (_77 * _38);
  } else {
    _82 = _37;
    _83 = _14.y;
    _84 = _38;
  }

  if (CUSTOM_FILM_GRAIN_TYPE != 0 || CUSTOM_SHARPENING_TYPE != 0) {
    float3 color_pq = float3(_82, _83, _84);

    float scaling = RENODX_TONE_MAP_TYPE == 0 ? 100.0f : RENODX_DIFFUSE_WHITE_NITS;
    float3 color_bt2020 = renodx::color::pq::DecodeSafe(color_pq, scaling);
    float3 color_bt709 = renodx::color::bt709::from::BT2020(color_bt2020);
    color_bt709 = CustomPostProcessing(color_bt709, TEXCOORD, __3__36__0__0__g_sceneColor, __0__4__0__0__g_staticBilinearClamp, 0, scaling);
    color_bt2020 = renodx::color::bt2020::from::BT709(color_bt709);
    color_pq = renodx::color::pq::EncodeSafe(color_bt2020, scaling);

    _82 = color_pq.x;
    _83 = color_pq.y;
    _84 = color_pq.z;
  }

  _90 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].x) * TEXCOORD.x);
  _91 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) * TEXCOORD.y);
  _93 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticPointBlackBorder, float2(TEXCOORD.x, TEXCOORD.y));
  if (!((_93.x < 1.0000000116860974e-07f) || (_93.x == 1.0f))) {
    _101 = select((_postProcessParams.z >= 1.0f), 1.0f, 0.25f);
    _108 = __3__36__0__0__g_sceneColor.Load(int3(_90, ((int)(_91 + (uint)(-1))), 0));
    _113 = __3__36__0__0__g_sceneColor.Load(int3(((int)(_90 + (uint)(-1))), _91, 0));
    _118 = __3__36__0__0__g_sceneColor.Load(int3(((int)(_90 + 1u)), _91, 0));
    _123 = __3__36__0__0__g_sceneColor.Load(int3(_90, ((int)(_91 + 1u)), 0));
    _134 = max(max(_83, _108.y), max(max(_113.y, _118.y), _123.y));
    _141 = sqrt(saturate(min(min(min(_83, _108.y), min(min(_113.y, _118.y), _123.y)), (1.0f - _134)) * (1.0f / _134))) * (-1.0f / (((1.0f - _101) * 8.0f) + (_101 * 5.0f)));
    _144 = 1.0f / ((_141 * 4.0f) + 1.0f);
    _166 = saturate(((_141 * (((_113.x + _108.x) + _118.x) + _123.x)) + _82) * _144) - _82;
    _167 = saturate(((_141 * (((_113.y + _108.y) + _118.y) + _123.y)) + _83) * _144) - _83;
    _168 = saturate(((_141 * (((_113.z + _108.z) + _118.z) + _123.z)) + _84) * _144) - _84;
    _173 = 1.0f - dot(float3(abs(_166), abs(_167), abs(_168)), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
    _174 = _173 * _173;
    _175 = _174 * _174;
    _176 = _175 * _175;
    _184 = ((_176 * _166 * CUSTOM_SHARPENING) + _82);
    _185 = ((_176 * _167 * CUSTOM_SHARPENING) + _83);
    _186 = ((_176 * _168 * CUSTOM_SHARPENING) + _84);
  } else {
    _184 = _82;
    _185 = _83;
    _186 = _84;
  }
  _214 = 1.0f - abs(_etcParams.w);
  _218 = saturate(_etcParams.w);
#if 0
  _219 = (_214 * select((_184 < 0.040449999272823334f), (_184 * 0.07739938050508499f), exp2(log2((_184 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f))) + _218;
  _220 = (_214 * select((_185 < 0.040449999272823334f), (_185 * 0.07739938050508499f), exp2(log2((_185 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f))) + _218;
  _221 = (_214 * select((_186 < 0.040449999272823334f), (_186 * 0.07739938050508499f), exp2(log2((_186 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f))) + _218;
#else
  _219 = _214 * _184 + _218;
  _220 = _214 * _185 + _218;
  _221 = _214 * _186 + _218;
#endif

  if (_colorGradingParams.w > 0.0f) {
    _226 = saturate(_colorGradingParams.w);
    _243 = (((max(0.0f, (1.0f - _219)) - _219) * _226) + _219);
    _244 = (((max(0.0f, (1.0f - _220)) - _220) * _226) + _220);
    _245 = (((max(0.0f, (1.0f - _221)) - _221) * _226) + _221);
  } else {
    _243 = _219;
    _244 = _220;
    _245 = _221;
  }
  _252 = (pow(_243, 0.012683313339948654f));
  _253 = (pow(_244, 0.012683313339948654f));
  _254 = (pow(_245, 0.012683313339948654f));
  _280 = (TEXCOORD.x * 2.0f) + -1.0f;
  _281 = TEXCOORD.y * 2.0f;
  _282 = 1.0f - _281;
  _310 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[105u].w), 1.0000000116860974e-07f, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[104u].w), _282, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[103u].w) * _280))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[106u].w);
  _313 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[105u].x), 1.0000000116860974e-07f, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[104u].x), _282, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[103u].x) * _280))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[106u].x)) / _310) - _280;
  _314 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[105u].y), 1.0000000116860974e-07f, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[104u].y), _282, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[103u].y) * _280))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[106u].y)) / _310) - _282;
  if (_localToneMappingParams.w > 0.0f) {
    _328 = saturate(1.0f - (sqrt((_314 * _314) + (_313 * _313)) * 2.0f));
  } else {
    _328 = 1.0f;
  }
  _331 = abs(_280);
  _332 = abs(_281 + -1.0f);
  _336 = saturate(1.0f - ((_328 * _postProcessParams.x * CUSTOM_VIGNETTE) * dot(float2(_331, _332), float2(_331, _332))));
  _346 = exp2(log2(_336 * exp2(log2(max(0.0f, (_252 + -0.8359375f)) / (18.8515625f - (_252 * 18.6875f))) * 6.277394771575928f)) * 0.1593017578125f);
  _347 = exp2(log2(_336 * exp2(log2(max(0.0f, (_253 + -0.8359375f)) / (18.8515625f - (_253 * 18.6875f))) * 6.277394771575928f)) * 0.1593017578125f);
  _348 = exp2(log2(_336 * exp2(log2(max(0.0f, (_254 + -0.8359375f)) / (18.8515625f - (_254 * 18.6875f))) * 6.277394771575928f)) * 0.1593017578125f);
  _381 = (SV_Position.y >= asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w)) && (SV_Position.y < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w)));
  SV_Target.x = select(_381, exp2(log2((1.0f / ((_346 * 18.6875f) + 1.0f)) * ((_346 * 18.8515625f) + 0.8359375f)) * 78.84375f), 0.0f);
  SV_Target.y = select(_381, exp2(log2((1.0f / ((_347 * 18.6875f) + 1.0f)) * ((_347 * 18.8515625f) + 0.8359375f)) * 78.84375f), 0.0f);
  SV_Target.z = select(_381, exp2(log2((1.0f / ((_348 * 18.6875f) + 1.0f)) * ((_348 * 18.8515625f) + 0.8359375f)) * 78.84375f), 0.0f);
  SV_Target.w = _14.w;

  SV_Target.xyz = FinalizeHDR(
      SV_Target.xyz,
      asfloat(__3__35__0__0__SceneConstantBuffer_raw[42u].y),
      asfloat(__3__35__0__0__SceneConstantBuffer_raw[43u].y));

  return SV_Target;
}
