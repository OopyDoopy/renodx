#include "../tonemap.hlsli"

struct PostProcessZoneStruct {
  float3 _mainPosition;
  float _radius;
  float _ratio;
  float _progress;
  float _edgeSmoothness;
  float _edgeWidth;
  uint _maskColor;
  uint _noiseTex;
};


Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t37, space36);

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

struct BindlessParameters_PostProcessZone {
  PostProcessZoneStruct BindlessParameters_PostProcessZone;
};

typedef BindlessParameters_PostProcessZone BindlessParameters_PostProcessZone_t;
ConstantBuffer<BindlessParameters_PostProcessZone_t> BindlessParameters_PostProcessZone[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float4 _19;
  float _25;
  float _26;
  float _27;
  float _28;
  float _64;
  int _68;
  float _78;
  float _79;
  float _80;
  float _81;
  float _83;
  float _84;
  int _87;
  float _95;
  int _96;
  float _104;
  int _107;
  float _115;
  int _123;
  float _131;
  float _159;
  float _363;
  float _364;
  float _365;
  float _458;
  float _459;
  float _460;
  float _580;
  float _581;
  float _582;
  float _600;
  float _601;
  float _602;
  float _635;
  float _636;
  float _637;
  float _651;
  float _652;
  float _653;
  float _142;
  float _143;
  float _144;
  float _145;
  uint _146;
  float _168;
  float _217;
  float _218;
  float _219;
  float _221;
  float _228;
  float _229;
  float _230;
  float _249;
  float _250;
  float _251;
  float _252;
  float _253;
  float _254;
  float _255;
  float _256;
  float _257;
  float _303;
  float _304;
  float _305;
  float _306;
  float _307;
  float _308;
  float _309;
  float _325;
  float _326;
  float _327;
  float _328;
  float _334;
  float _337;
  float _344;
  float _345;
  float _346;
  float _375;
  float _400;
  float _401;
  float _402;
  float _421;
  float _422;
  float _423;
  float _429;
  float _433;
  float _434;
  float _435;
  float _436;
  float _441;
  float _466;
  float _470;
  float _471;
  float _472;
  float _473;
  int _514;
  float _569;
  float _590;
  float _591;
  float _595;
  float _642;
  float _14[36];
  _19 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _25 = (TEXCOORD.x * 2.0f) + -1.0f;
  _26 = TEXCOORD.y * 2.0f;
  _27 = 1.0f - _26;
  _28 = max(1.0000000116860974e-07f, ((__3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y))).x));
  _64 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].w), _28, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].w), _27, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].w) * _25))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].w);
  _68 = WaveReadLaneFirst(_materialIndex);
  _78 = WaveReadLaneFirst(BindlessParameters_PostProcessZone[((int)((uint)(select(((uint)_68 < (uint)170000), _68, 0)) + 0u))].BindlessParameters_PostProcessZone._mainPosition.x);
  _79 = WaveReadLaneFirst(BindlessParameters_PostProcessZone[((int)((uint)(select(((uint)_68 < (uint)170000), _68, 0)) + 0u))].BindlessParameters_PostProcessZone._mainPosition.y);
  _80 = WaveReadLaneFirst(BindlessParameters_PostProcessZone[((int)((uint)(select(((uint)_68 < (uint)170000), _68, 0)) + 0u))].BindlessParameters_PostProcessZone._mainPosition.z);
  _81 = _78 - ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].x), _28, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].x), _27, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].x) * _25))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].x)) / _64);
  _83 = _80 - ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].z), _28, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].z), _27, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].z) * _25))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].z)) / _64);
  _84 = (_79 - ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].y), _28, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].y), _27, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].y) * _25))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].y)) / _64)) + 1.600000023841858f;
  _87 = WaveReadLaneFirst(_materialIndex);
  _95 = WaveReadLaneFirst(BindlessParameters_PostProcessZone[((int)((uint)(select(((uint)_87 < (uint)170000), _87, 0)) + 0u))].BindlessParameters_PostProcessZone._radius);
  _96 = WaveReadLaneFirst(_materialIndex);
  _104 = WaveReadLaneFirst(BindlessParameters_PostProcessZone[((int)((uint)(select(((uint)_96 < (uint)170000), _96, 0)) + 0u))].BindlessParameters_PostProcessZone._progress);
  _107 = WaveReadLaneFirst(_materialIndex);
  _115 = WaveReadLaneFirst(BindlessParameters_PostProcessZone[((int)((uint)(select(((uint)_107 < (uint)170000), _107, 0)) + 0u))].BindlessParameters_PostProcessZone._edgeSmoothness);
  _123 = WaveReadLaneFirst(_materialIndex);
  _131 = WaveReadLaneFirst(BindlessParameters_PostProcessZone[((int)((uint)(select(((uint)_123 < (uint)170000), _123, 0)) + 0u))].BindlessParameters_PostProcessZone._ratio);
  _142 = saturate((_131 * (min(max((1.0f - saturate(exp2(log2(sqrt(dot(float3(_81, _84, _83), float3(_81, _84, _83))) - (_104 * _95)) * _115))), 0.0f), 1.0f) + -1.0f)) + 1.0f);
  _143 = _142 * _19.x;
  _144 = _142 * _19.y;
  _145 = _142 * _19.z;
  _146 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _159 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _146, 0)))).x) & 127))) + 0.5f);
  } else {
    _159 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_143, _144, _145));
    _580 = output_color.x;
    _581 = output_color.y;
    _582 = output_color.z;
  } else {
    _580 = _143;
    _581 = _144;
    _582 = _145;
  }
  if (_etcParams.y > 1.0f) {
    _590 = abs(_25);
    _591 = abs(_26 + -1.0f);
    _595 = saturate(1.0f - (dot(float2(_590, _591), float2(_590, _591)) * saturate(_etcParams.y + -1.0f)));
    _600 = (_595 * _580);
    _601 = (_595 * _581);
    _602 = (_595 * _582);
  } else {
    _600 = _580;
    _601 = _581;
    _602 = _582;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _635 = select((_600 <= 0.0031308000907301903f), (_600 * 12.920000076293945f), (((pow(_600, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _636 = select((_601 <= 0.0031308000907301903f), (_601 * 12.920000076293945f), (((pow(_601, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _637 = select((_602 <= 0.0031308000907301903f), (_602 * 12.920000076293945f), (((pow(_602, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _635 = _600;
    _636 = _601;
    _637 = _602;
  }
  if (!(_etcParams.y < 1.0f)) {
    _642 = float((uint)_146);
    if (!(_642 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_642 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _651 = _635;
        _652 = _636;
        _653 = _637;
      } else {
        _651 = 0.0f;
        _652 = 0.0f;
        _653 = 0.0f;
      }
    } else {
      _651 = 0.0f;
      _652 = 0.0f;
      _653 = 0.0f;
    }
  } else {
    _651 = _635;
    _652 = _636;
    _653 = _637;
  }
  SV_Target.x = _651;
  SV_Target.y = _652;
  SV_Target.z = _653;
  SV_Target.w = _159;
  return SV_Target;
}