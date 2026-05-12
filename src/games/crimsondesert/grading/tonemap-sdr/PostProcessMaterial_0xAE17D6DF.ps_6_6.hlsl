#include "../tonemap.hlsli"

struct PostProcessBerserk_CDStruct {
  float _scanRadius;
  float _fishEyeIntensity;
  float _bloodLineIntensity;
  float _auraIntensity;
  float _centerMaskWidth;
  float _fireIntensity;
  float _sphereMaskRatio;
  float _fogIntensity;
  float _scanRadiusEnd;
  float _ringMaskRadius;
  float _ringMaskIntensity;
  float _radialBlurIntensity;
  uint _noiseTex;
  uint _noiseTex2;
  uint _distortionTex;
  uint _marbleCrackTex;
  float _sphereMaskEndRatio;
  float _sphereMaskEndNoiseIntensity;
  float _sceneColorDistortionIntensity;
  float _characterMaskIntensity;
  uint _enemyGradientTex;
  uint _enemyMaskColor;
  float _flashRatio;
  uint _paperTex;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t37, space36);

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

struct BindlessParameters_PostProcessBerserk_CD {
  PostProcessBerserk_CDStruct BindlessParameters_PostProcessBerserk_CD;
};

typedef BindlessParameters_PostProcessBerserk_CD BindlessParameters_PostProcessBerserk_CD_t;
ConstantBuffer<BindlessParameters_PostProcessBerserk_CD_t> BindlessParameters_PostProcessBerserk_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float4 _40;
  float _50;
  float _51;
  float _52;
  float _91;
  float _92;
  float _93;
  float _94;
  float _98;
  float _99;
  float _106;
  float _109;
  float _112;
  float _120;
  float _206;
  float _405;
  float _406;
  float _407;
  float _500;
  float _501;
  float _502;
  float _622;
  float _623;
  float _624;
  float _645;
  float _646;
  float _647;
  float _680;
  float _681;
  float _682;
  float _696;
  float _697;
  float _698;
  float _132;
  int _133;
  int _141;
  float _144;
  float _147;
  float _148;
  float _149;
  float _192;
  uint _193;
  float _215;
  float _258;
  float _259;
  float _260;
  float _262;
  float _269;
  float _270;
  float _271;
  float _290;
  float _291;
  float _292;
  float _293;
  float _294;
  float _295;
  float _296;
  float _297;
  float _298;
  float _344;
  float _345;
  float _346;
  float _347;
  float _348;
  float _349;
  float _350;
  float _367;
  float _368;
  float _369;
  float _370;
  float _376;
  float _379;
  float _386;
  float _387;
  float _388;
  float _417;
  float _442;
  float _443;
  float _444;
  float _463;
  float _464;
  float _465;
  float _471;
  float _475;
  float _476;
  float _477;
  float _478;
  float _483;
  float _508;
  float _512;
  float _513;
  float _514;
  float _515;
  int _556;
  float _611;
  float _635;
  float _636;
  float _640;
  float _687;
  float _708;
  float _709;
  float _710;
  float _17[36];
  _40 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _50 = (pow(_40.x, 0.012683313339948654f));
  _51 = (pow(_40.y, 0.012683313339948654f));
  _52 = (pow(_40.z, 0.012683313339948654f));
  _91 = TEXCOORD.x + -0.5f;
  _92 = TEXCOORD.y + -0.5f;
  _93 = abs(_91);
  _94 = abs(_92);
  _98 = min(_93, _94) / max(max(_93, _94), 9.99999993922529e-09f);
  _99 = _98 * _98;
  _106 = ((_99 * _98) * (((0.15931421518325806f - (_99 * 0.046496473252773285f)) * _99) + -0.32762277126312256f)) + _98;
  _109 = select((_94 > _93), (1.5707963705062866f - _106), _106);
  _112 = select((_91 < 0.0f), (3.1415927410125732f - _109), _109);
  _120 = select((_92 < 0.0f), (-0.0f - _112), _112) * 0.9549295902252197f;
  _132 = select(((uint)(((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * TEXCOORD.x)), (int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * TEXCOORD.y)), 0)))).x) & 127) + -53) < (uint)15), 0.0f, (saturate(1.0f - saturate(exp2(log2((__3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y))).x) * 0.5f) * 6.5f)) * (1.0f / max(9.999999747378752e-05f, _exposure0.x))));
  _133 = WaveReadLaneFirst(_materialIndex);
  _141 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_133 < (uint)170000), _133, 0)) + 0u))].BindlessParameters_PostProcessBerserk_CD._noiseTex2);
  _144 = (sqrt((_92 * _92) + (_91 * _91)) * 2.0f) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.699999988079071f);
  _147 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.030000001192092896f;
  _148 = _147 + _120;
  _149 = _147 + _144;
  _192 = dot(float3((exp2(log2(max(0.0f, (_50 + -0.8359375f)) / (18.8515625f - (_50 * 18.6875f))) * 6.277394771575928f) * 10000.0f), (exp2(log2(max(0.0f, (_51 + -0.8359375f)) / (18.8515625f - (_51 * 18.6875f))) * 6.277394771575928f) * 10000.0f), (exp2(log2(max(0.0f, (_52 + -0.8359375f)) / (18.8515625f - (_52 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
  _193 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _206 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _193, 0)))).x) & 127))) + 0.5f);
  } else {
    _206 = saturate((((((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_141 < (uint)65000), _141, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(frac((_120 + 0.4180000126361847f) - _147), frac((_144 + 0.35499998927116394f) - _147))))).w) + (((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_141 < (uint)65000), _141, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(frac(_148), frac(_149))))).w)) + (((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_141 < (uint)65000), _141, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(frac((_120 + 0.8550000190734863f) - _147), frac(_149 + 0.14800000190734863f))))).w)) + (((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_141 < (uint)65000), _141, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(frac(_148 + 0.6510000228881836f), frac((_144 + 0.7519999742507935f) - _147))))).w));
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_132, _192, 0.0f));
    _622 = output_color.x;
    _623 = output_color.y;
    _624 = output_color.z;
  } else {
    _622 = _132;
    _623 = _192;
    _624 = 0.0f;
  }
  if (_etcParams.y > 1.0f) {
    _635 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _636 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _640 = saturate(1.0f - (dot(float2(_635, _636), float2(_635, _636)) * saturate(_etcParams.y + -1.0f)));
    _645 = (_640 * _622);
    _646 = (_640 * _623);
    _647 = (_640 * _624);
  } else {
    _645 = _622;
    _646 = _623;
    _647 = _624;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _680 = select((_645 <= 0.0031308000907301903f), (_645 * 12.920000076293945f), (((pow(_645, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _681 = select((_646 <= 0.0031308000907301903f), (_646 * 12.920000076293945f), (((pow(_646, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _682 = select((_647 <= 0.0031308000907301903f), (_647 * 12.920000076293945f), (((pow(_647, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _680 = _645;
    _681 = _646;
    _682 = _647;
  }
  if (!(_etcParams.y < 1.0f)) {
    _687 = float((uint)_193);
    if (!(_687 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_687 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _696 = _680;
        _697 = _681;
        _698 = _682;
      } else {
        _696 = 0.0f;
        _697 = 0.0f;
        _698 = 0.0f;
      }
    } else {
      _696 = 0.0f;
      _697 = 0.0f;
      _698 = 0.0f;
    }
  } else {
    _696 = _680;
    _697 = _681;
    _698 = _682;
  }
  _708 = exp2(log2(_696 * 9.999999747378752e-05f) * 0.1593017578125f);
  _709 = exp2(log2(_697 * 9.999999747378752e-05f) * 0.1593017578125f);
  _710 = exp2(log2(_698 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_708 * 18.6875f) + 1.0f)) * ((_708 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_709 * 18.6875f) + 1.0f)) * ((_709 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_710 * 18.6875f) + 1.0f)) * ((_710 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _206;
  return SV_Target;
}