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
  float _362;
  float _567;
  float _568;
  float _569;
  float _662;
  float _663;
  float _664;
  float _784;
  float _785;
  float _786;
  float _807;
  float _808;
  float _809;
  float _842;
  float _843;
  float _844;
  float _858;
  float _859;
  float _860;
  float _79;
  float _81;
  float _89;
  float _97;
  float _100;
  float _109;
  float _118;
  float4 _123;
  float _133;
  float _134;
  float _135;
  float _160;
  float _161;
  float _162;
  int _163;
  float _171;
  float _172;
  int _182;
  int _190;
  float4 _197;
  int _202;
  int _210;
  float4 _217;
  int _222;
  int _230;
  float4 _237;
  float _251;
  int _258;
  float _266;
  float _269;
  float _270;
  float _271;
  float _272;
  int _273;
  float _281;
  int _282;
  float _290;
  int _291;
  float _299;
  float _301;
  float _308;
  float _309;
  float _310;
  int _311;
  float _319;
  float _320;
  int _333;
  float _343;
  float _344;
  float _345;
  float _346;
  float _347;
  float _348;
  uint _349;
  float _371;
  float _420;
  float _421;
  float _422;
  float _424;
  float _431;
  float _432;
  float _433;
  float _452;
  float _453;
  float _454;
  float _455;
  float _456;
  float _457;
  float _458;
  float _459;
  float _460;
  float _506;
  float _507;
  float _508;
  float _509;
  float _510;
  float _511;
  float _512;
  float _529;
  float _530;
  float _531;
  float _532;
  float _538;
  float _541;
  float _548;
  float _549;
  float _550;
  float _579;
  float _604;
  float _605;
  float _606;
  float _625;
  float _626;
  float _627;
  float _633;
  float _637;
  float _638;
  float _639;
  float _640;
  float _645;
  float _670;
  float _674;
  float _675;
  float _676;
  float _677;
  int _718;
  float _773;
  float _797;
  float _798;
  float _802;
  float _849;
  float _870;
  float _871;
  float _872;
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
  _133 = (pow(_123.x, 0.012683313339948654f));
  _134 = (pow(_123.y, 0.012683313339948654f));
  _135 = (pow(_123.z, 0.012683313339948654f));
  _160 = exp2(log2(max(0.0f, (_133 + -0.8359375f)) / (18.8515625f - (_133 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _161 = exp2(log2(max(0.0f, (_134 + -0.8359375f)) / (18.8515625f - (_134 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _162 = exp2(log2(max(0.0f, (_135 + -0.8359375f)) / (18.8515625f - (_135 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _163 = WaveReadLaneFirst(_materialIndex);
  _171 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_163 < (uint)170000), _163, 0)) + 0u))].BindlessParameters_PostProcessDamageTest._isDead);
  _172 = dot(float3(_160, _161, _162), float3(0.26269999146461487f, 0.6779999732971191f, 0.059300001710653305f));
  _182 = WaveReadLaneFirst(_materialIndex);
  _190 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_182 < (uint)170000), _182, 0)) + 0u))].BindlessParameters_PostProcessDamageTest._bloodTexture);
  _197 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_190 < (uint)65000), _190, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(_115, _118));
  _202 = WaveReadLaneFirst(_materialIndex);
  _210 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_202 < (uint)170000), _202, 0)) + 0u))].BindlessParameters_PostProcessDamageTest._dirtTexture);
  _217 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_210 < (uint)65000), _210, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(_115, _118));
  _222 = WaveReadLaneFirst(_materialIndex);
  _230 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_222 < (uint)170000), _222, 0)) + 0u))].BindlessParameters_PostProcessDamageTest._dirtMaskTexture);
  _237 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_230 < (uint)65000), _230, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(_115, _118));
  _251 = (dot(float3(asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z)), float3(asfloat(__3__35__0__0__SceneConstantBuffer_raw[42u].x), asfloat(__3__35__0__0__SceneConstantBuffer_raw[42u].y), asfloat(__3__35__0__0__SceneConstantBuffer_raw[42u].z))) * 25.0f) + 25.0f;
  _258 = WaveReadLaneFirst(_materialIndex);
  _266 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_258 < (uint)170000), _258, 0)) + 0u))].BindlessParameters_PostProcessDamageTest._vignettFalloff);
  _269 = exp2(log2((((_51 * 15.0f) * (1.0f - _51)) * _52) * (1.0f - _52)) * _266);
  _270 = _269 * (lerp(_160, _172, _171));
  _271 = _269 * (lerp(_161, _172, _171));
  _272 = _269 * (lerp(_162, _172, _171));
  _273 = WaveReadLaneFirst(_materialIndex);
  _281 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_273 < (uint)170000), _273, 0)) + 0u))].BindlessParameters_PostProcessDamageTest._dirtRatio1);
  _282 = WaveReadLaneFirst(_materialIndex);
  _290 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_282 < (uint)170000), _282, 0)) + 0u))].BindlessParameters_PostProcessDamageTest._dirtRatio2);
  _291 = WaveReadLaneFirst(_materialIndex);
  _299 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_291 < (uint)170000), _291, 0)) + 0u))].BindlessParameters_PostProcessDamageTest._dirtRatio3);
  _301 = dot(float3(_237.x, _237.y, _237.z), float3(_281, _290, _299)) * _217.w;
  _308 = (_301 * (_217.x - _270)) + _270;
  _309 = (_301 * (_217.y - _271)) + _271;
  _310 = (_301 * (_217.z - _272)) + _272;
  _311 = WaveReadLaneFirst(_materialIndex);
  _319 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_311 < (uint)170000), _311, 0)) + 0u))].BindlessParameters_PostProcessDamageTest._bloodRatio);
  _320 = _319 * _197.w;
  _333 = WaveReadLaneFirst(_materialIndex);
  _343 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_333 < (uint)170000), _333, 0)) + 0u))].BindlessParameters_PostProcessDamageTest._mulColor.x);
  _344 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_333 < (uint)170000), _333, 0)) + 0u))].BindlessParameters_PostProcessDamageTest._mulColor.y);
  _345 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_333 < (uint)170000), _333, 0)) + 0u))].BindlessParameters_PostProcessDamageTest._mulColor.z);
  _346 = _343 * ((_320 * ((_251 * _197.x) - _308)) + _308);
  _347 = _344 * ((_320 * ((_251 * _197.y) - _309)) + _309);
  _348 = _345 * ((_320 * ((_251 * _197.z) - _310)) + _310);
  _349 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _362 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _349, 0)))).x) & 127))) + 0.5f);
  } else {
    _362 = _postProcessParams.x;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_346, _347, _348));
    _784 = output_color.x;
    _785 = output_color.y;
    _786 = output_color.z;
  } else {
    _784 = _346;
    _785 = _347;
    _786 = _348;
  }
  if (_etcParams.y > 1.0f) {
    _797 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _798 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _802 = saturate(1.0f - (dot(float2(_797, _798), float2(_797, _798)) * saturate(_etcParams.y + -1.0f)));
    _807 = (_802 * _784);
    _808 = (_802 * _785);
    _809 = (_802 * _786);
  } else {
    _807 = _784;
    _808 = _785;
    _809 = _786;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _842 = select((_807 <= 0.0031308000907301903f), (_807 * 12.920000076293945f), (((pow(_807, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _843 = select((_808 <= 0.0031308000907301903f), (_808 * 12.920000076293945f), (((pow(_808, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _844 = select((_809 <= 0.0031308000907301903f), (_809 * 12.920000076293945f), (((pow(_809, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _842 = _807;
    _843 = _808;
    _844 = _809;
  }
  if (!(_etcParams.y < 1.0f)) {
    _849 = float((uint)_349);
    if (!(_849 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_849 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _858 = _842;
        _859 = _843;
        _860 = _844;
      } else {
        _858 = 0.0f;
        _859 = 0.0f;
        _860 = 0.0f;
      }
    } else {
      _858 = 0.0f;
      _859 = 0.0f;
      _860 = 0.0f;
    }
  } else {
    _858 = _842;
    _859 = _843;
    _860 = _844;
  }
  _870 = exp2(log2(_858 * 9.999999747378752e-05f) * 0.1593017578125f);
  _871 = exp2(log2(_859 * 9.999999747378752e-05f) * 0.1593017578125f);
  _872 = exp2(log2(_860 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_870 * 18.6875f) + 1.0f)) * ((_870 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_871 * 18.6875f) + 1.0f)) * ((_871 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_872 * 18.6875f) + 1.0f)) * ((_872 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _362;
  return SV_Target;
}