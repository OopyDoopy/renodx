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
  float4 _14;
  float _37;
  float _38;
  float _82;
  float _83;
  float _84;
  float _144;
  float _145;
  float _146;
  float _316;
  float _338;
  float _339;
  float _340;
  float _48;
  float _49;
  float _53;
  float _58;
  float _62;
  float _67;
  float _71;
  float _77;
  float _115;
  float _119;
  float _120;
  float _121;
  float _122;
  float _127;
  float _153;
  float _157;
  float _158;
  float _159;
  float _160;
  int _201;
  float _256;
  float _267;
  float _268;
  float _269;
  float _297;
  float _300;
  float _301;
  float _319;
  float _320;
  float _324;
  float _11[36];
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
    float3 color_bt709 = float3(_82, _83, _84);
    color_bt709 = renodx::color::srgb::Decode(color_bt709);
    color_bt709 = CustomPostProcessing(color_bt709, TEXCOORD, __3__36__0__0__g_sceneColor, __0__4__0__0__g_staticBilinearClamp, 1);
    color_bt709 = renodx::color::srgb::Encode(color_bt709);
    _82 = color_bt709.x;
    _83 = color_bt709.y;
    _84 = color_bt709.z;
  }

  _115 = 1.0f - abs(_etcParams.w);
  _119 = saturate(_etcParams.w);
  _120 = (_115 * saturate(select((_82 < 0.040449999272823334f), (_82 * 0.07739938050508499f), exp2(log2((_82 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)))) + _119;
  _121 = (_115 * saturate(select((_83 < 0.040449999272823334f), (_83 * 0.07739938050508499f), exp2(log2((_83 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)))) + _119;
  _122 = (_115 * saturate(select((_84 < 0.040449999272823334f), (_84 * 0.07739938050508499f), exp2(log2((_84 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)))) + _119;
  if (_colorGradingParams.w > 0.0f) {
    _127 = saturate(_colorGradingParams.w);
    _144 = (((max(0.0f, (1.0f - _120)) - _120) * _127) + _120);
    _145 = (((max(0.0f, (1.0f - _121)) - _121) * _127) + _121);
    _146 = (((max(0.0f, (1.0f - _122)) - _122) * _127) + _122);
  } else {
    _144 = _120;
    _145 = _121;
    _146 = _122;
  }
  _153 = _userImageAdjust.y + 1.0f;
  _157 = _userImageAdjust.x + 0.5f;
  _158 = (_153 * (_144 + -0.5f)) + _157;
  _159 = (_153 * (_145 + -0.5f)) + _157;
  _160 = (_153 * (_146 + -0.5f)) + _157;
  _11[0] = 1.0f;
  _11[1] = 0.0f;
  _11[2] = 0.0f;
  _11[3] = 0.0f;
  _11[4] = 1.0f;
  _11[5] = 0.0f;
  _11[6] = 0.0f;
  _11[7] = 0.0f;
  _11[8] = 1.0f;
  _11[9] = 0.800000011920929f;
  _11[10] = 0.25832998752593994f;
  _11[11] = 0.0f;
  _11[12] = 0.20000000298023224f;
  _11[13] = 0.7416700124740601f;
  _11[14] = 0.14167000353336334f;
  _11[15] = 0.0f;
  _11[16] = 0.0f;
  _11[17] = 0.8583300113677979f;
  _11[18] = 0.8166700005531311f;
  _11[19] = 0.3333300054073334f;
  _11[20] = 0.0f;
  _11[21] = 0.1833299994468689f;
  _11[22] = 0.666670024394989f;
  _11[23] = 0.125f;
  _11[24] = 0.0f;
  _11[25] = 0.0f;
  _11[26] = 0.875f;
  _11[27] = 0.9666699767112732f;
  _11[28] = 0.0f;
  _11[29] = 0.0f;
  _11[30] = 0.033330000936985016f;
  _11[31] = 0.7333300113677979f;
  _11[32] = 0.1833299994468689f;
  _11[33] = 0.0f;
  _11[34] = 0.26666998863220215f;
  _11[35] = 0.8166700005531311f;
  _201 = min((int)(max((int)(_colorBlindParam), (int)(0))), (int)(3));
  _256 = 2.200000047683716f / ((min(max(_userImageAdjust.w, -1.0f), 1.0f) * 0.800000011920929f) + 2.200000047683716f);
  _267 = (TEXCOORD.x * 2.0f) + -1.0f;
  _268 = TEXCOORD.y * 2.0f;
  _269 = 1.0f - _268;
  _297 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[105u].w), 1.0000000116860974e-07f, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[104u].w), _269, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[103u].w) * _267))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[106u].w);
  _300 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[105u].x), 1.0000000116860974e-07f, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[104u].x), _269, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[103u].x) * _267))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[106u].x)) / _297) - _267;
  _301 = ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[105u].y), 1.0000000116860974e-07f, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[104u].y), _269, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[103u].y) * _267))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[106u].y)) / _297) - _269;
  if (_localToneMappingParams.w > 0.0f) {
    _316 = saturate(1.0f - (sqrt((_301 * _301) + (_300 * _300)) * 2.0f));
  } else {
    _316 = 1.0f;
  }
  _319 = abs(_267);
  _320 = abs(_268 + -1.0f);
  _324 = saturate(1.0f - ((_316 * _postProcessParams.x * CUSTOM_VIGNETTE) * dot(float2(_319, _320), float2(_319, _320))));
  if (!(SV_Position.y < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
    if (SV_Position.y < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      _338 = (_324 * exp2(log2(saturate(mad((_11[min((uint)(((int)(6u + (_201 * 9)))), 35u)]), _160, mad((_11[min((uint)(((int)(3u + (_201 * 9)))), 35u)]), _159, ((_11[min((uint)(((int)(0u + (_201 * 9)))), 35u)]) * _158))))) * _256));
      _339 = (_324 * exp2(log2(saturate(mad((_11[min((uint)(((int)(7u + (_201 * 9)))), 35u)]), _160, mad((_11[min((uint)(((int)(4u + (_201 * 9)))), 35u)]), _159, ((_11[min((uint)(((int)(1u + (_201 * 9)))), 35u)]) * _158))))) * _256));
      _340 = (_324 * exp2(log2(saturate(mad((_11[min((uint)(((int)(8u + (_201 * 9)))), 35u)]), _160, mad((_11[min((uint)(((int)(5u + (_201 * 9)))), 35u)]), _159, ((_11[min((uint)(((int)(2u + (_201 * 9)))), 35u)]) * _158))))) * _256));
    } else {
      _338 = 0.0f;
      _339 = 0.0f;
      _340 = 0.0f;
    }
  } else {
    _338 = 0.0f;
    _339 = 0.0f;
    _340 = 0.0f;
  }
  SV_Target.x = _338;
  SV_Target.y = _339;
  SV_Target.z = _340;
  SV_Target.w = _14.w;

  SV_Target.xyz = FinalizeSDR(SV_Target.xyz);
  
  return SV_Target;
}