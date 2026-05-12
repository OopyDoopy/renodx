#include "../tonemap.hlsli"

struct PostProcessCameraLensRainStruct {
  float _rainSpeed;
  float _rainUTiling;
  float _rainVTiling;
  float _streakUTiling;
  float _streakVTiling;
  uint _rainNormalTexture;
  uint _rainMaskTexture;
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

cbuffer __3__1__0__0__PostProcessMaterialIndex : register(b2, space1) {
  int _materialIndex : packoffset(c000.x);
  int _passIndex : packoffset(c000.y);
};

struct BindlessParameters_PostProcessCameraLensRain {
  PostProcessCameraLensRainStruct BindlessParameters_PostProcessCameraLensRain;
};

typedef BindlessParameters_PostProcessCameraLensRain BindlessParameters_PostProcessCameraLensRain_t;
ConstantBuffer<BindlessParameters_PostProcessCameraLensRain_t> BindlessParameters_PostProcessCameraLensRain[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  int _21;
  float _29;
  float _32;
  int _33;
  float _41;
  int _42;
  float _50;
  float _51;
  float _52;
  int _59;
  int _67;
  float _79;
  float _83;
  int _84;
  int _92;
  float _104;
  int _112;
  float _120;
  int _121;
  float _129;
  float _130;
  float _131;
  int _132;
  int _140;
  int _150;
  int _158;
  float4 _165;
  float _172;
  float _186;
  float _194;
  float4 _203;
  uint _211;
  float _225;
  float _430;
  float _431;
  float _432;
  float _525;
  float _526;
  float _527;
  float _647;
  float _648;
  float _649;
  float _670;
  float _671;
  float _672;
  float _705;
  float _706;
  float _707;
  float _721;
  float _722;
  float _723;
  float _234;
  float _283;
  float _284;
  float _285;
  float _287;
  float _294;
  float _295;
  float _296;
  float _315;
  float _316;
  float _317;
  float _318;
  float _319;
  float _320;
  float _321;
  float _322;
  float _323;
  float _369;
  float _370;
  float _371;
  float _372;
  float _373;
  float _374;
  float _375;
  float _392;
  float _393;
  float _394;
  float _395;
  float _401;
  float _404;
  float _411;
  float _412;
  float _413;
  float _442;
  float _467;
  float _468;
  float _469;
  float _488;
  float _489;
  float _490;
  float _496;
  float _500;
  float _501;
  float _502;
  float _503;
  float _508;
  float _533;
  float _537;
  float _538;
  float _539;
  float _540;
  int _581;
  float _636;
  float _660;
  float _661;
  float _665;
  float _712;
  float _16[36];
  _21 = WaveReadLaneFirst(_materialIndex);
  _29 = WaveReadLaneFirst(BindlessParameters_PostProcessCameraLensRain[((int)((uint)(select(((uint)_21 < (uint)170000), _21, 0)) + 0u))].BindlessParameters_PostProcessCameraLensRain._rainSpeed);
  _32 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * _29;
  _33 = WaveReadLaneFirst(_materialIndex);
  _41 = WaveReadLaneFirst(BindlessParameters_PostProcessCameraLensRain[((int)((uint)(select(((uint)_33 < (uint)170000), _33, 0)) + 0u))].BindlessParameters_PostProcessCameraLensRain._streakUTiling);
  _42 = WaveReadLaneFirst(_materialIndex);
  _50 = WaveReadLaneFirst(BindlessParameters_PostProcessCameraLensRain[((int)((uint)(select(((uint)_42 < (uint)170000), _42, 0)) + 0u))].BindlessParameters_PostProcessCameraLensRain._streakVTiling);
  _51 = _41 * TEXCOORD.x;
  _52 = _50 * TEXCOORD.y;
  _59 = WaveReadLaneFirst(_materialIndex);
  _67 = WaveReadLaneFirst(BindlessParameters_PostProcessCameraLensRain[((int)((uint)(select(((uint)_59 < (uint)170000), _59, 0)) + 0u))].BindlessParameters_PostProcessCameraLensRain._rainMaskTexture);
  _79 = saturate((abs(((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_67 < (uint)65000), _67, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_51, (_52 - frac(_32)))))).z) + -0.009999999776482582f) * 1.1235954761505127f);
  _83 = (_79 * _79) * (3.0f - (_79 * 2.0f));
  _84 = WaveReadLaneFirst(_materialIndex);
  _92 = WaveReadLaneFirst(BindlessParameters_PostProcessCameraLensRain[((int)((uint)(select(((uint)_84 < (uint)170000), _84, 0)) + 0u))].BindlessParameters_PostProcessCameraLensRain._rainMaskTexture);
  _104 = saturate((abs(((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_92 < (uint)65000), _92, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_51, ((_52 * 1.2000000476837158f) - frac(_32 * 1.5f)))))).z) + -0.03999999910593033f) * 50.0f);
  _112 = WaveReadLaneFirst(_materialIndex);
  _120 = WaveReadLaneFirst(BindlessParameters_PostProcessCameraLensRain[((int)((uint)(select(((uint)_112 < (uint)170000), _112, 0)) + 0u))].BindlessParameters_PostProcessCameraLensRain._rainUTiling);
  _121 = WaveReadLaneFirst(_materialIndex);
  _129 = WaveReadLaneFirst(BindlessParameters_PostProcessCameraLensRain[((int)((uint)(select(((uint)_121 < (uint)170000), _121, 0)) + 0u))].BindlessParameters_PostProcessCameraLensRain._rainVTiling);
  _130 = _120 * TEXCOORD.x;
  _131 = _129 * TEXCOORD.y;
  _132 = WaveReadLaneFirst(_materialIndex);
  _140 = WaveReadLaneFirst(BindlessParameters_PostProcessCameraLensRain[((int)((uint)(select(((uint)_132 < (uint)170000), _132, 0)) + 0u))].BindlessParameters_PostProcessCameraLensRain._rainMaskTexture);
  _150 = WaveReadLaneFirst(_materialIndex);
  _158 = WaveReadLaneFirst(BindlessParameters_PostProcessCameraLensRain[((int)((uint)(select(((uint)_150 < (uint)170000), _150, 0)) + 0u))].BindlessParameters_PostProcessCameraLensRain._rainNormalTexture);
  _165 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_158 < (uint)65000), _158, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_130, (1.0f - _131)));
  _172 = saturate((2.5f - TEXCOORD.y) * 0.3333333432674408f);
  _186 = saturate(saturate(((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_140 < (uint)65000), _140, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_130, _131)))).y) - saturate(((((((_104 * _104) * (3.0f - (_104 * 2.0f))) - _83) * 0.5f) + _83) - saturate(exp2(log2((_172 * _172) * (3.0f - (_172 * 2.0f))) * 1.100000023841858f))) * 5.0f));
  _194 = dot(float3(_186, _186, _186), float3(1.0f, 1.0f, 1.0f)) * 0.09000000357627869f;
  _203 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(abs((_194 * ((_186 * ((_165.x * 2.0f) + -1.4960784912109375f)) + 0.5f)) + TEXCOORD.x), abs(TEXCOORD.y - (_194 * ((_186 * ((_165.y * 2.0f) + -1.4960784912109375f)) + 0.5f)))));
  _211 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _225 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _211, 0)))).x) & 127))) + 0.5f);
  } else {
    _225 = select(isnan(_postProcessParams.x), 0.0f, _postProcessParams.x);
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_203.x, _203.y, _203.z));
    _647 = output_color.x;
    _648 = output_color.y;
    _649 = output_color.z;
  } else {
    _647 = _203.x;
    _648 = _203.y;
    _649 = _203.z;
  }
  if (_etcParams.y > 1.0f) {
    _660 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _661 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _665 = saturate(1.0f - (dot(float2(_660, _661), float2(_660, _661)) * saturate(_etcParams.y + -1.0f)));
    _670 = (_665 * _647);
    _671 = (_665 * _648);
    _672 = (_665 * _649);
  } else {
    _670 = _647;
    _671 = _648;
    _672 = _649;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _705 = select((_670 <= 0.0031308000907301903f), (_670 * 12.920000076293945f), (((pow(_670, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _706 = select((_671 <= 0.0031308000907301903f), (_671 * 12.920000076293945f), (((pow(_671, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _707 = select((_672 <= 0.0031308000907301903f), (_672 * 12.920000076293945f), (((pow(_672, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _705 = _670;
    _706 = _671;
    _707 = _672;
  }
  if (!(_etcParams.y < 1.0f)) {
    _712 = float((uint)_211);
    if (!(_712 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_712 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _721 = _705;
        _722 = _706;
        _723 = _707;
      } else {
        _721 = 0.0f;
        _722 = 0.0f;
        _723 = 0.0f;
      }
    } else {
      _721 = 0.0f;
      _722 = 0.0f;
      _723 = 0.0f;
    }
  } else {
    _721 = _705;
    _722 = _706;
    _723 = _707;
  }
  SV_Target.x = _721;
  SV_Target.y = _722;
  SV_Target.z = _723;
  SV_Target.w = _225;
  return SV_Target;
}