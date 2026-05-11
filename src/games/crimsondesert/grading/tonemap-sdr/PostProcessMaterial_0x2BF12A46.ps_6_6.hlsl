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
  float _26;
  float _27;
  float _47;
  float _48;
  float _49;
  float _50;
  float _86;
  int _90;
  float _100;
  float _101;
  float _102;
  float _103;
  float _105;
  float _106;
  int _109;
  float _117;
  int _118;
  float _126;
  int _129;
  float _137;
  int _145;
  float _153;
  float _193;
  float _397;
  float _398;
  float _399;
  float _492;
  float _493;
  float _494;
  float _614;
  float _615;
  float _616;
  float _634;
  float _635;
  float _636;
  float _669;
  float _670;
  float _671;
  float _685;
  float _686;
  float _687;
  float _164;
  float _176;
  float _177;
  float _178;
  float _179;
  uint _180;
  float _202;
  float _251;
  float _252;
  float _253;
  float _255;
  float _262;
  float _263;
  float _264;
  float _283;
  float _284;
  float _285;
  float _286;
  float _287;
  float _288;
  float _289;
  float _290;
  float _291;
  float _337;
  float _338;
  float _339;
  float _340;
  float _341;
  float _342;
  float _343;
  float _359;
  float _360;
  float _361;
  float _362;
  float _368;
  float _371;
  float _378;
  float _379;
  float _380;
  float _409;
  float _434;
  float _435;
  float _436;
  float _455;
  float _456;
  float _457;
  float _463;
  float _467;
  float _468;
  float _469;
  float _470;
  float _475;
  float _500;
  float _504;
  float _505;
  float _506;
  float _507;
  int _548;
  float _603;
  float _624;
  float _625;
  float _629;
  float _676;
  float _697;
  float _698;
  float _699;
  float _14[36];
  _19 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _26 = (pow(_19.y, 0.012683313339948654f));
  _27 = (pow(_19.z, 0.012683313339948654f));
  _47 = (TEXCOORD.x * 2.0f) + -1.0f;
  _48 = TEXCOORD.y * 2.0f;
  _49 = 1.0f - _48;
  _50 = max(1.0000000116860974e-07f, ((__3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y))).x));
  _86 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].w), _50, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].w), _49, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].w) * _47))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].w);
  _90 = WaveReadLaneFirst(_materialIndex);
  _100 = WaveReadLaneFirst(BindlessParameters_PostProcessZone[((int)((uint)(select(((uint)_90 < (uint)170000), _90, 0)) + 0u))].BindlessParameters_PostProcessZone._mainPosition.x);
  _101 = WaveReadLaneFirst(BindlessParameters_PostProcessZone[((int)((uint)(select(((uint)_90 < (uint)170000), _90, 0)) + 0u))].BindlessParameters_PostProcessZone._mainPosition.y);
  _102 = WaveReadLaneFirst(BindlessParameters_PostProcessZone[((int)((uint)(select(((uint)_90 < (uint)170000), _90, 0)) + 0u))].BindlessParameters_PostProcessZone._mainPosition.z);
  _103 = _100 - ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].x), _50, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].x), _49, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].x) * _47))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].x)) / _86);
  _105 = _102 - ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].z), _50, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].z), _49, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].z) * _47))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].z)) / _86);
  _106 = (_101 - ((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].y), _50, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].y), _49, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].y) * _47))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].y)) / _86)) + 1.600000023841858f;
  _109 = WaveReadLaneFirst(_materialIndex);
  _117 = WaveReadLaneFirst(BindlessParameters_PostProcessZone[((int)((uint)(select(((uint)_109 < (uint)170000), _109, 0)) + 0u))].BindlessParameters_PostProcessZone._radius);
  _118 = WaveReadLaneFirst(_materialIndex);
  _126 = WaveReadLaneFirst(BindlessParameters_PostProcessZone[((int)((uint)(select(((uint)_118 < (uint)170000), _118, 0)) + 0u))].BindlessParameters_PostProcessZone._progress);
  _129 = WaveReadLaneFirst(_materialIndex);
  _137 = WaveReadLaneFirst(BindlessParameters_PostProcessZone[((int)((uint)(select(((uint)_129 < (uint)170000), _129, 0)) + 0u))].BindlessParameters_PostProcessZone._edgeSmoothness);
  _145 = WaveReadLaneFirst(_materialIndex);
  _153 = WaveReadLaneFirst(BindlessParameters_PostProcessZone[((int)((uint)(select(((uint)_145 < (uint)170000), _145, 0)) + 0u))].BindlessParameters_PostProcessZone._ratio);
  _164 = (pow(_19.x, 0.012683313339948654f));
  _176 = saturate((_153 * (min(max((1.0f - saturate(exp2(log2(sqrt(dot(float3(_103, _106, _105), float3(_103, _106, _105))) - (_126 * _117)) * _137))), 0.0f), 1.0f) + -1.0f)) + 1.0f) * 10000.0f;
  _177 = _176 * exp2(log2(max(0.0f, (_164 + -0.8359375f)) / (18.8515625f - (_164 * 18.6875f))) * 6.277394771575928f);
  _178 = _176 * exp2(log2(max(0.0f, (_26 + -0.8359375f)) / (18.8515625f - (_26 * 18.6875f))) * 6.277394771575928f);
  _179 = _176 * exp2(log2(max(0.0f, (_27 + -0.8359375f)) / (18.8515625f - (_27 * 18.6875f))) * 6.277394771575928f);
  _180 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _193 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _180, 0)))).x) & 127))) + 0.5f);
  } else {
    _193 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_177, _178, _179));
    _614 = output_color.x;
    _615 = output_color.y;
    _616 = output_color.z;
  } else {
    _614 = _177;
    _615 = _178;
    _616 = _179;
  }
  if (_etcParams.y > 1.0f) {
    _624 = abs(_47);
    _625 = abs(_48 + -1.0f);
    _629 = saturate(1.0f - (dot(float2(_624, _625), float2(_624, _625)) * saturate(_etcParams.y + -1.0f)));
    _634 = (_629 * _614);
    _635 = (_629 * _615);
    _636 = (_629 * _616);
  } else {
    _634 = _614;
    _635 = _615;
    _636 = _616;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _669 = select((_634 <= 0.0031308000907301903f), (_634 * 12.920000076293945f), (((pow(_634, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _670 = select((_635 <= 0.0031308000907301903f), (_635 * 12.920000076293945f), (((pow(_635, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _671 = select((_636 <= 0.0031308000907301903f), (_636 * 12.920000076293945f), (((pow(_636, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _669 = _634;
    _670 = _635;
    _671 = _636;
  }
  if (!(_etcParams.y < 1.0f)) {
    _676 = float((uint)_180);
    if (!(_676 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_676 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _685 = _669;
        _686 = _670;
        _687 = _671;
      } else {
        _685 = 0.0f;
        _686 = 0.0f;
        _687 = 0.0f;
      }
    } else {
      _685 = 0.0f;
      _686 = 0.0f;
      _687 = 0.0f;
    }
  } else {
    _685 = _669;
    _686 = _670;
    _687 = _671;
  }
  _697 = exp2(log2(_685 * 9.999999747378752e-05f) * 0.1593017578125f);
  _698 = exp2(log2(_686 * 9.999999747378752e-05f) * 0.1593017578125f);
  _699 = exp2(log2(_687 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_697 * 18.6875f) + 1.0f)) * ((_697 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_698 * 18.6875f) + 1.0f)) * ((_698 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_699 * 18.6875f) + 1.0f)) * ((_699 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _193;
  return SV_Target;
}