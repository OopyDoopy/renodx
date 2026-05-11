#include "../tonemap.hlsli"

struct PostProcessAbyssEnterGlid_CDStruct {
  float _startYPos;
  float _endYPos;
  float _cubeScale;
  float _cameraSpeed;
  float _cameraSinIntensity;
  float3 _screenFadeColor;
  float _screenFadeRatio;
  float3 _fogColor;
  float3 _ambientColor;
  float3 _globalColor;
  float3 _lightColor;
  float3 _centerGlowColor;
  float _centerGlowRadius;
  float _stardustIntensity;
  float _particleIntensity;
  float _particleEmissionWidth;
  float _anamorphicIntensity;
  float _anamorphicWidth;
  float _largeHalo;
  float _largeHaloIntensity;
  float _middleHaloIntensity;
  float _blubIntensity;
  float _streakGlowIntensity;
  float _centerpoint;
  float _tunnelTotal;
  float _cameraFov;
  float _cubeDistance;
  uint _screenWarpTex;
  float _screenWarpRatio;
};


Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t36, space36);

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

cbuffer __3__1__0__0__PostProcessMaterialIndex : register(b2, space1) {
  int _materialIndex : packoffset(c000.x);
  int _passIndex : packoffset(c000.y);
};

struct BindlessParameters_PostProcessAbyssEnterGlid_CD {
  PostProcessAbyssEnterGlid_CDStruct BindlessParameters_PostProcessAbyssEnterGlid_CD;
};

typedef BindlessParameters_PostProcessAbyssEnterGlid_CD BindlessParameters_PostProcessAbyssEnterGlid_CD_t;
ConstantBuffer<BindlessParameters_PostProcessAbyssEnterGlid_CD_t> BindlessParameters_PostProcessAbyssEnterGlid_CD[] : register(b0, space100);

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
  int _20;
  float _28;
  int _29;
  float _37;
  float4 _47;
  float4 _54;
  float _64;
  float _65;
  float _66;
  float _67;
  float _74;
  float _75;
  float _76;
  uint _77;
  float _91;
  float _296;
  float _297;
  float _298;
  float _391;
  float _392;
  float _393;
  float _513;
  float _514;
  float _515;
  float _536;
  float _537;
  float _538;
  float _571;
  float _572;
  float _573;
  float _587;
  float _588;
  float _589;
  float _100;
  float _149;
  float _150;
  float _151;
  float _153;
  float _160;
  float _161;
  float _162;
  float _181;
  float _182;
  float _183;
  float _184;
  float _185;
  float _186;
  float _187;
  float _188;
  float _189;
  float _235;
  float _236;
  float _237;
  float _238;
  float _239;
  float _240;
  float _241;
  float _258;
  float _259;
  float _260;
  float _261;
  float _267;
  float _270;
  float _277;
  float _278;
  float _279;
  float _308;
  float _333;
  float _334;
  float _335;
  float _354;
  float _355;
  float _356;
  float _362;
  float _366;
  float _367;
  float _368;
  float _369;
  float _374;
  float _399;
  float _403;
  float _404;
  float _405;
  float _406;
  int _447;
  float _502;
  float _526;
  float _527;
  float _531;
  float _578;
  float _17[36];
  _20 = WaveReadLaneFirst(_materialIndex);
  _28 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterGlid_CD[((int)((uint)(select(((uint)_20 < (uint)170000), _20, 0)) + 0u))].BindlessParameters_PostProcessAbyssEnterGlid_CD._startYPos);
  _29 = WaveReadLaneFirst(_materialIndex);
  _37 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterGlid_CD[((int)((uint)(select(((uint)_29 < (uint)170000), _29, 0)) + 0u))].BindlessParameters_PostProcessAbyssEnterGlid_CD._endYPos);
  _47 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
  _54 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _64 = 1.0f - (saturate(exp2(log2(1.0f - saturate((asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].y) - _37) / (_28 - _37))) * 2.200000047683716f) * 7.0f) * 0.9950000047683716f);
  _65 = _64 * _54.x;
  _66 = _64 * _54.y;
  _67 = _64 * _54.z;
  _74 = ((_47.x - _65) * _47.w) + _65;
  _75 = ((_47.y - _66) * _47.w) + _66;
  _76 = ((_47.z - _67) * _47.w) + _67;
  _77 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _91 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _77, 0)))).x) & 127))) + 0.5f);
  } else {
    _91 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_74, _75, _76));
    _513 = output_color.x;
    _514 = output_color.y;
    _515 = output_color.z;
  } else {
    _513 = _74;
    _514 = _75;
    _515 = _76;
  }
  if (_etcParams.y > 1.0f) {
    _526 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _527 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _531 = saturate(1.0f - (dot(float2(_526, _527), float2(_526, _527)) * saturate(_etcParams.y + -1.0f)));
    _536 = (_531 * _513);
    _537 = (_531 * _514);
    _538 = (_531 * _515);
  } else {
    _536 = _513;
    _537 = _514;
    _538 = _515;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _571 = select((_536 <= 0.0031308000907301903f), (_536 * 12.920000076293945f), (((pow(_536, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _572 = select((_537 <= 0.0031308000907301903f), (_537 * 12.920000076293945f), (((pow(_537, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _573 = select((_538 <= 0.0031308000907301903f), (_538 * 12.920000076293945f), (((pow(_538, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _571 = _536;
    _572 = _537;
    _573 = _538;
  }
  if (!(_etcParams.y < 1.0f)) {
    _578 = float((uint)_77);
    if (!(_578 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_578 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _587 = _571;
        _588 = _572;
        _589 = _573;
      } else {
        _587 = 0.0f;
        _588 = 0.0f;
        _589 = 0.0f;
      }
    } else {
      _587 = 0.0f;
      _588 = 0.0f;
      _589 = 0.0f;
    }
  } else {
    _587 = _571;
    _588 = _572;
    _589 = _573;
  }
  SV_Target.x = _587;
  SV_Target.y = _588;
  SV_Target.z = _589;
  SV_Target.w = _91;
  return SV_Target;
}