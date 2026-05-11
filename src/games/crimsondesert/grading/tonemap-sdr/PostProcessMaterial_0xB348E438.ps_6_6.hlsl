#include "../tonemap.hlsli"

struct PostProcessOutlineExampleStruct {
  uint _outlineColor;
  float _outlineSize;
};


Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t36, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

Texture2D<uint> __3__36__0__0__g_depthOpaque : register(t38, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t29, space36);

Texture2D<uint> __3__36__0__0__g_CustomRenderPassValue : register(t69, space36);

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

struct BindlessParameters_PostProcessOutlineExample {
  PostProcessOutlineExampleStruct BindlessParameters_PostProcessOutlineExample;
};

typedef BindlessParameters_PostProcessOutlineExample BindlessParameters_PostProcessOutlineExample_t;
ConstantBuffer<BindlessParameters_PostProcessOutlineExample_t> BindlessParameters_PostProcessOutlineExample[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float4 _24;
  uint2 _29;
  float _120;
  float _121;
  float _122;
  float _136;
  float _341;
  float _342;
  float _343;
  float _436;
  float _437;
  float _438;
  float _558;
  float _559;
  float _560;
  float _581;
  float _582;
  float _583;
  float _616;
  float _617;
  float _618;
  float _632;
  float _633;
  float _634;
  float4 _63;
  int _68;
  int _76;
  float _79;
  float _82;
  float _84;
  float _112;
  uint _123;
  float _145;
  float _194;
  float _195;
  float _196;
  float _198;
  float _205;
  float _206;
  float _207;
  float _226;
  float _227;
  float _228;
  float _229;
  float _230;
  float _231;
  float _232;
  float _233;
  float _234;
  float _280;
  float _281;
  float _282;
  float _283;
  float _284;
  float _285;
  float _286;
  float _303;
  float _304;
  float _305;
  float _306;
  float _312;
  float _315;
  float _322;
  float _323;
  float _324;
  float _353;
  float _378;
  float _379;
  float _380;
  float _399;
  float _400;
  float _401;
  float _407;
  float _411;
  float _412;
  float _413;
  float _414;
  float _419;
  float _444;
  float _448;
  float _449;
  float _450;
  float _451;
  int _492;
  float _547;
  float _571;
  float _572;
  float _576;
  float _623;
  float _19[36];
  _24 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_29.x, _29.y);
  if (!(((((uint)(__3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)((int)(_29.x)))))) + 0.5f) * TEXCOORD.x), int((float((int)(int(float((int)((int)(_29.y)))))) + 0.5f) * TEXCOORD.y), 0)))).x) & 255) == 30)) {
    _63 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    if (!((float((uint)((uint)((((uint)(__3__36__0__0__g_depthOpaque.Load(int3((int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * TEXCOORD.x)), (int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * TEXCOORD.y)), 0)))).x) & 16777215))) * 5.960465188081798e-08f) > _63.y)) {
      _68 = WaveReadLaneFirst(_materialIndex);
      _76 = WaveReadLaneFirst(BindlessParameters_PostProcessOutlineExample[((int)((uint)(select(((uint)_68 < (uint)170000), _68, 0)) + 0u))].BindlessParameters_PostProcessOutlineExample._outlineColor);
      _79 = float((uint)((uint)(((uint)(_76) >> 16) & 255)));
      _82 = float((uint)((uint)(((uint)(_76) >> 8) & 255)));
      _84 = float((uint)((uint)(_76 & 255)));
      _112 = _63.x * 100.0f;
      _120 = ((select(((_79 * 0.003921568859368563f) < 0.040449999272823334f), (_79 * 0.0003035269910469651f), exp2(log2((_79 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _112) + _24.x);
      _121 = ((select(((_82 * 0.003921568859368563f) < 0.040449999272823334f), (_82 * 0.0003035269910469651f), exp2(log2((_82 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _112) + _24.y);
      _122 = ((select(((_84 * 0.003921568859368563f) < 0.040449999272823334f), (_84 * 0.0003035269910469651f), exp2(log2((_84 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _112) + _24.z);
    } else {
      _120 = _24.x;
      _121 = _24.y;
      _122 = _24.z;
    }
  } else {
    _120 = _24.x;
    _121 = _24.y;
    _122 = _24.z;
  }
  _123 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _136 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _123, 0)))).x) & 127))) + 0.5f);
  } else {
    _136 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_120, _121, _122));
    _558 = output_color.x;
    _559 = output_color.y;
    _560 = output_color.z;
  } else {
    _558 = _120;
    _559 = _121;
    _560 = _122;
  }
  if (_etcParams.y > 1.0f) {
    _571 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _572 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _576 = saturate(1.0f - (dot(float2(_571, _572), float2(_571, _572)) * saturate(_etcParams.y + -1.0f)));
    _581 = (_576 * _558);
    _582 = (_576 * _559);
    _583 = (_576 * _560);
  } else {
    _581 = _558;
    _582 = _559;
    _583 = _560;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _616 = select((_581 <= 0.0031308000907301903f), (_581 * 12.920000076293945f), (((pow(_581, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _617 = select((_582 <= 0.0031308000907301903f), (_582 * 12.920000076293945f), (((pow(_582, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _618 = select((_583 <= 0.0031308000907301903f), (_583 * 12.920000076293945f), (((pow(_583, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _616 = _581;
    _617 = _582;
    _618 = _583;
  }
  if (!(_etcParams.y < 1.0f)) {
    _623 = float((uint)_123);
    if (!(_623 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_623 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _632 = _616;
        _633 = _617;
        _634 = _618;
      } else {
        _632 = 0.0f;
        _633 = 0.0f;
        _634 = 0.0f;
      }
    } else {
      _632 = 0.0f;
      _633 = 0.0f;
      _634 = 0.0f;
    }
  } else {
    _632 = _616;
    _633 = _617;
    _634 = _618;
  }
  SV_Target.x = _632;
  SV_Target.y = _633;
  SV_Target.z = _634;
  SV_Target.w = _136;
  return SV_Target;
}