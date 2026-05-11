#include "../tonemap.hlsli"

struct PostProcessDamageTestStruct {
  uint _bloodTexture;
  float _bloodRatio;
  uint _dirtTexture;
  uint _dirtMaskTexture;
  float _dirtRatio1;
  float _dirtRatio2;
  float _dirtRatio3;
  uint _waterNormalTexture;
  uint _waterMaskTexture;
  float _waterRatio1;
  float _waterRatio2;
  float _waterRatio3;
  float _isDead;
  float3 _mulColor;
  float _vignettFalloff;
  float _maxPower;
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

struct BindlessParameters_PostProcessDamageTest {
  PostProcessDamageTestStruct BindlessParameters_PostProcessDamageTest;
};

typedef BindlessParameters_PostProcessDamageTest BindlessParameters_PostProcessDamageTest_t;
ConstantBuffer<BindlessParameters_PostProcessDamageTest_t> BindlessParameters_PostProcessDamageTest[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _50;
  float _51;
  float _52;
  float _53;
  float _54;
  float _55;
  float _56;
  float _57;
  float _58;
  float _59;
  int _60;
  float _68;
  bool _69;
  float _77;
  float _115;
  float _116;
  float _326;
  float _531;
  float _532;
  float _533;
  float _626;
  float _627;
  float _628;
  float _748;
  float _749;
  float _750;
  float _771;
  float _772;
  float _773;
  float _806;
  float _807;
  float _808;
  float _822;
  float _823;
  float _824;
  float _79;
  float _81;
  float _89;
  float _97;
  float _100;
  float _109;
  float _118;
  float4 _123;
  int _127;
  float _135;
  float _136;
  int _146;
  int _154;
  float4 _161;
  int _166;
  int _174;
  float4 _181;
  int _186;
  int _194;
  float4 _201;
  float _215;
  int _222;
  float _230;
  float _233;
  float _234;
  float _235;
  float _236;
  int _237;
  float _245;
  int _246;
  float _254;
  int _255;
  float _263;
  float _265;
  float _272;
  float _273;
  float _274;
  int _275;
  float _283;
  float _284;
  int _297;
  float _307;
  float _308;
  float _309;
  float _310;
  float _311;
  float _312;
  uint _313;
  float _335;
  float _384;
  float _385;
  float _386;
  float _388;
  float _395;
  float _396;
  float _397;
  float _416;
  float _417;
  float _418;
  float _419;
  float _420;
  float _421;
  float _422;
  float _423;
  float _424;
  float _470;
  float _471;
  float _472;
  float _473;
  float _474;
  float _475;
  float _476;
  float _493;
  float _494;
  float _495;
  float _496;
  float _502;
  float _505;
  float _512;
  float _513;
  float _514;
  float _543;
  float _568;
  float _569;
  float _570;
  float _589;
  float _590;
  float _591;
  float _597;
  float _601;
  float _602;
  float _603;
  float _604;
  float _609;
  float _634;
  float _638;
  float _639;
  float _640;
  float _641;
  int _682;
  float _737;
  float _761;
  float _762;
  float _766;
  float _813;
  float _19[36];
  _50 = _destTargetSizAndInv.y * (1.0f - TEXCOORD.y);
  _51 = (_destTargetSizAndInv.x * TEXCOORD.x) / _srcTargetSizeAndInv.x;
  _52 = _50 / _srcTargetSizeAndInv.y;
  _53 = _50 / _srcTargetSizeAndInv.x;
  _54 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  _55 = 0.5f / _54;
  _56 = _51 + -0.5f;
  _57 = _53 - _55;
  _58 = dot(float2(_56, _57), float2(_56, _57));
  _59 = sqrt(_58);
  _60 = WaveReadLaneFirst(_materialIndex);
  _68 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_60 < (uint)170000), _60, 0)) + 0u))].BindlessParameters_PostProcessDamageTest._maxPower);
  _69 = (_68 > 0.0f);
  if (_69) {
    _77 = sqrt(dot(float2(0.5f, _55), float2(0.5f, _55)));
  } else {
    if (!(_54 < 1.0f)) {
      _77 = _55;
    } else {
      _77 = 0.5f;
    }
  }
  if (_69) {
    _79 = rsqrt(_58);
    _81 = tan(_68 * _59);
    _89 = tan(_77 * _68);
    _115 = (((((_77 * _56) * _79) * _81) / _89) + 0.5f);
    _116 = (((((_77 * _57) * _79) * _81) / _89) + _55);
  } else {
    if (_68 < 0.0f) {
      _97 = rsqrt(_58);
      _100 = atan((_68 * _59) * -10.0f);
      _109 = atan((_68 * -10.0f) * _77);
      _115 = (((((_77 * _56) * _97) * _100) / _109) + 0.5f);
      _116 = (((((_77 * _57) * _97) * _100) / _109) + _55);
    } else {
      _115 = _51;
      _116 = _53;
    }
  }
  _118 = 1.0f - (_116 * _54);
  _123 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(abs(_115), abs(_118)));
  _127 = WaveReadLaneFirst(_materialIndex);
  _135 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_127 < (uint)170000), _127, 0)) + 0u))].BindlessParameters_PostProcessDamageTest._isDead);
  _136 = dot(float3(_123.x, _123.y, _123.z), float3(0.26269999146461487f, 0.6779999732971191f, 0.059300001710653305f));
  _146 = WaveReadLaneFirst(_materialIndex);
  _154 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_146 < (uint)170000), _146, 0)) + 0u))].BindlessParameters_PostProcessDamageTest._bloodTexture);
  _161 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_154 < (uint)65000), _154, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(_115, _118));
  _166 = WaveReadLaneFirst(_materialIndex);
  _174 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_166 < (uint)170000), _166, 0)) + 0u))].BindlessParameters_PostProcessDamageTest._dirtTexture);
  _181 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_174 < (uint)65000), _174, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(_115, _118));
  _186 = WaveReadLaneFirst(_materialIndex);
  _194 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_186 < (uint)170000), _186, 0)) + 0u))].BindlessParameters_PostProcessDamageTest._dirtMaskTexture);
  _201 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_194 < (uint)65000), _194, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(_115, _118));
  _215 = (dot(float3(asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z)), float3(asfloat(__3__35__0__0__SceneConstantBuffer_raw[42u].x), asfloat(__3__35__0__0__SceneConstantBuffer_raw[42u].y), asfloat(__3__35__0__0__SceneConstantBuffer_raw[42u].z))) * 25.0f) + 25.0f;
  _222 = WaveReadLaneFirst(_materialIndex);
  _230 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_222 < (uint)170000), _222, 0)) + 0u))].BindlessParameters_PostProcessDamageTest._vignettFalloff);
  _233 = exp2(log2((((_51 * 15.0f) * (1.0f - _51)) * _52) * (1.0f - _52)) * _230);
  _234 = _233 * (lerp(_123.x, _136, _135));
  _235 = _233 * (lerp(_123.y, _136, _135));
  _236 = _233 * (lerp(_123.z, _136, _135));
  _237 = WaveReadLaneFirst(_materialIndex);
  _245 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_237 < (uint)170000), _237, 0)) + 0u))].BindlessParameters_PostProcessDamageTest._dirtRatio1);
  _246 = WaveReadLaneFirst(_materialIndex);
  _254 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_246 < (uint)170000), _246, 0)) + 0u))].BindlessParameters_PostProcessDamageTest._dirtRatio2);
  _255 = WaveReadLaneFirst(_materialIndex);
  _263 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_255 < (uint)170000), _255, 0)) + 0u))].BindlessParameters_PostProcessDamageTest._dirtRatio3);
  _265 = dot(float3(_201.x, _201.y, _201.z), float3(_245, _254, _263)) * _181.w;
  _272 = (_265 * (_181.x - _234)) + _234;
  _273 = (_265 * (_181.y - _235)) + _235;
  _274 = (_265 * (_181.z - _236)) + _236;
  _275 = WaveReadLaneFirst(_materialIndex);
  _283 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_275 < (uint)170000), _275, 0)) + 0u))].BindlessParameters_PostProcessDamageTest._bloodRatio);
  _284 = _283 * _161.w;
  _297 = WaveReadLaneFirst(_materialIndex);
  _307 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_297 < (uint)170000), _297, 0)) + 0u))].BindlessParameters_PostProcessDamageTest._mulColor.x);
  _308 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_297 < (uint)170000), _297, 0)) + 0u))].BindlessParameters_PostProcessDamageTest._mulColor.y);
  _309 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_297 < (uint)170000), _297, 0)) + 0u))].BindlessParameters_PostProcessDamageTest._mulColor.z);
  _310 = _307 * ((_284 * ((_215 * _161.x) - _272)) + _272);
  _311 = _308 * ((_284 * ((_215 * _161.y) - _273)) + _273);
  _312 = _309 * ((_284 * ((_215 * _161.z) - _274)) + _274);
  _313 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _326 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _313, 0)))).x) & 127))) + 0.5f);
  } else {
    _326 = _postProcessParams.x;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_310, _311, _312));
    _748 = output_color.x;
    _749 = output_color.y;
    _750 = output_color.z;
  } else {
    _748 = _310;
    _749 = _311;
    _750 = _312;
  }
  if (_etcParams.y > 1.0f) {
    _761 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _762 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _766 = saturate(1.0f - (dot(float2(_761, _762), float2(_761, _762)) * saturate(_etcParams.y + -1.0f)));
    _771 = (_766 * _748);
    _772 = (_766 * _749);
    _773 = (_766 * _750);
  } else {
    _771 = _748;
    _772 = _749;
    _773 = _750;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _806 = select((_771 <= 0.0031308000907301903f), (_771 * 12.920000076293945f), (((pow(_771, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _807 = select((_772 <= 0.0031308000907301903f), (_772 * 12.920000076293945f), (((pow(_772, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _808 = select((_773 <= 0.0031308000907301903f), (_773 * 12.920000076293945f), (((pow(_773, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _806 = _771;
    _807 = _772;
    _808 = _773;
  }
  if (!(_etcParams.y < 1.0f)) {
    _813 = float((uint)_313);
    if (!(_813 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_813 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _822 = _806;
        _823 = _807;
        _824 = _808;
      } else {
        _822 = 0.0f;
        _823 = 0.0f;
        _824 = 0.0f;
      }
    } else {
      _822 = 0.0f;
      _823 = 0.0f;
      _824 = 0.0f;
    }
  } else {
    _822 = _806;
    _823 = _807;
    _824 = _808;
  }
  SV_Target.x = _822;
  SV_Target.y = _823;
  SV_Target.z = _824;
  SV_Target.w = _326;
  return SV_Target;
}