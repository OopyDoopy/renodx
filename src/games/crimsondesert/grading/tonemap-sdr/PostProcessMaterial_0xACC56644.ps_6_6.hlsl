#include "../tonemap.hlsli"

struct PostProcessOutlineStruct {
  float _outlineColorR;
  float _outlineColorG;
  float _outlineColorB;
};


Texture2D<uint2> __3__36__0__0__g_stencil : register(t29, space36);

Texture2D<uint> __3__36__0__0__g_CustomRenderPassValue : register(t69, space36);

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

struct BindlessParameters_PostProcessOutline {
  PostProcessOutlineStruct BindlessParameters_PostProcessOutline;
};

typedef BindlessParameters_PostProcessOutline BindlessParameters_PostProcessOutline_t;
ConstantBuffer<BindlessParameters_PostProcessOutline_t> BindlessParameters_PostProcessOutline[] : register(b0, space100);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  uint2 _28;
  float _76;
  float _77;
  float _78;
  float _92;
  float _297;
  float _298;
  float _299;
  float _392;
  float _393;
  float _394;
  float _514;
  float _515;
  float _516;
  float _537;
  float _538;
  float _539;
  float _572;
  float _573;
  float _574;
  float _588;
  float _589;
  float _590;
  int _48;
  float _56;
  int _57;
  float _65;
  int _66;
  float _74;
  uint _79;
  float _101;
  float _150;
  float _151;
  float _152;
  float _154;
  float _161;
  float _162;
  float _163;
  float _182;
  float _183;
  float _184;
  float _185;
  float _186;
  float _187;
  float _188;
  float _189;
  float _190;
  float _236;
  float _237;
  float _238;
  float _239;
  float _240;
  float _241;
  float _242;
  float _259;
  float _260;
  float _261;
  float _262;
  float _268;
  float _271;
  float _278;
  float _279;
  float _280;
  float _309;
  float _334;
  float _335;
  float _336;
  float _355;
  float _356;
  float _357;
  float _363;
  float _367;
  float _368;
  float _369;
  float _370;
  float _375;
  float _400;
  float _404;
  float _405;
  float _406;
  float _407;
  int _448;
  float _503;
  float _527;
  float _528;
  float _532;
  float _579;
  float _600;
  float _601;
  float _602;
  float _15[36];
  __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_28.x, _28.y);
  if (((((uint)(__3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)((int)(_28.x)))))) + 0.5f) * float((int)(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * TEXCOORD.x)))), int((float((int)(int(float((int)((int)(_28.y)))))) + 0.5f) * float((int)(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * TEXCOORD.y)))), 0)))).x) & 255) == 30) {
    _48 = WaveReadLaneFirst(_materialIndex);
    _56 = WaveReadLaneFirst(BindlessParameters_PostProcessOutline[((int)((uint)(select(((uint)_48 < (uint)170000), _48, 0)) + 0u))].BindlessParameters_PostProcessOutline._outlineColorR);
    _57 = WaveReadLaneFirst(_materialIndex);
    _65 = WaveReadLaneFirst(BindlessParameters_PostProcessOutline[((int)((uint)(select(((uint)_57 < (uint)170000), _57, 0)) + 0u))].BindlessParameters_PostProcessOutline._outlineColorB);
    _66 = WaveReadLaneFirst(_materialIndex);
    _74 = WaveReadLaneFirst(BindlessParameters_PostProcessOutline[((int)((uint)(select(((uint)_66 < (uint)170000), _66, 0)) + 0u))].BindlessParameters_PostProcessOutline._outlineColorG);
    _76 = _56;
    _77 = _65;
    _78 = _74;
  } else {
    _76 = 0.0f;
    _77 = 0.0f;
    _78 = 0.0f;
  }
  _79 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _92 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _79, 0)))).x) & 127))) + 0.5f);
  } else {
    _92 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_76, _77, _78));
    _514 = output_color.x;
    _515 = output_color.y;
    _516 = output_color.z;
  } else {
    _514 = _76;
    _515 = _77;
    _516 = _78;
  }
  if (_etcParams.y > 1.0f) {
    _527 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _528 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _532 = saturate(1.0f - (dot(float2(_527, _528), float2(_527, _528)) * saturate(_etcParams.y + -1.0f)));
    _537 = (_532 * _514);
    _538 = (_532 * _515);
    _539 = (_532 * _516);
  } else {
    _537 = _514;
    _538 = _515;
    _539 = _516;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _572 = select((_537 <= 0.0031308000907301903f), (_537 * 12.920000076293945f), (((pow(_537, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _573 = select((_538 <= 0.0031308000907301903f), (_538 * 12.920000076293945f), (((pow(_538, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _574 = select((_539 <= 0.0031308000907301903f), (_539 * 12.920000076293945f), (((pow(_539, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _572 = _537;
    _573 = _538;
    _574 = _539;
  }
  if (!(_etcParams.y < 1.0f)) {
    _579 = float((uint)_79);
    if (!(_579 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_579 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _588 = _572;
        _589 = _573;
        _590 = _574;
      } else {
        _588 = 0.0f;
        _589 = 0.0f;
        _590 = 0.0f;
      }
    } else {
      _588 = 0.0f;
      _589 = 0.0f;
      _590 = 0.0f;
    }
  } else {
    _588 = _572;
    _589 = _573;
    _590 = _574;
  }
  _600 = exp2(log2(_588 * 9.999999747378752e-05f) * 0.1593017578125f);
  _601 = exp2(log2(_589 * 9.999999747378752e-05f) * 0.1593017578125f);
  _602 = exp2(log2(_590 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_600 * 18.6875f) + 1.0f)) * ((_600 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_601 * 18.6875f) + 1.0f)) * ((_601 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_602 * 18.6875f) + 1.0f)) * ((_602 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _92;
  return SV_Target;
}