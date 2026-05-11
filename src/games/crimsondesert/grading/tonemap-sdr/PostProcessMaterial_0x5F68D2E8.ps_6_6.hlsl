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
  float _55;
  float _56;
  float _57;
  float _58;
  float _62;
  float _63;
  float _70;
  float _73;
  float _76;
  float _84;
  float _170;
  float _369;
  float _370;
  float _371;
  float _464;
  float _465;
  float _466;
  float _586;
  float _587;
  float _588;
  float _609;
  float _610;
  float _611;
  float _644;
  float _645;
  float _646;
  float _660;
  float _661;
  float _662;
  float _96;
  int _97;
  int _105;
  float _108;
  float _111;
  float _112;
  float _113;
  float _156;
  uint _157;
  float _179;
  float _222;
  float _223;
  float _224;
  float _226;
  float _233;
  float _234;
  float _235;
  float _254;
  float _255;
  float _256;
  float _257;
  float _258;
  float _259;
  float _260;
  float _261;
  float _262;
  float _308;
  float _309;
  float _310;
  float _311;
  float _312;
  float _313;
  float _314;
  float _331;
  float _332;
  float _333;
  float _334;
  float _340;
  float _343;
  float _350;
  float _351;
  float _352;
  float _381;
  float _406;
  float _407;
  float _408;
  float _427;
  float _428;
  float _429;
  float _435;
  float _439;
  float _440;
  float _441;
  float _442;
  float _447;
  float _472;
  float _476;
  float _477;
  float _478;
  float _479;
  int _520;
  float _575;
  float _599;
  float _600;
  float _604;
  float _651;
  float _17[36];
  _40 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _55 = TEXCOORD.x + -0.5f;
  _56 = TEXCOORD.y + -0.5f;
  _57 = abs(_55);
  _58 = abs(_56);
  _62 = min(_57, _58) / max(max(_57, _58), 9.99999993922529e-09f);
  _63 = _62 * _62;
  _70 = ((_63 * _62) * (((0.15931421518325806f - (_63 * 0.046496473252773285f)) * _63) + -0.32762277126312256f)) + _62;
  _73 = select((_58 > _57), (1.5707963705062866f - _70), _70);
  _76 = select((_55 < 0.0f), (3.1415927410125732f - _73), _73);
  _84 = select((_56 < 0.0f), (-0.0f - _76), _76) * 0.9549295902252197f;
  _96 = select(((uint)(((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * TEXCOORD.x)), (int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * TEXCOORD.y)), 0)))).x) & 127) + -53) < (uint)15), 0.0f, (saturate(1.0f - saturate(exp2(log2((__3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y))).x) * 0.5f) * 6.5f)) * (1.0f / max(9.999999747378752e-05f, _exposure0.x))));
  _97 = WaveReadLaneFirst(_materialIndex);
  _105 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_97 < (uint)170000), _97, 0)) + 0u))].BindlessParameters_PostProcessBerserk_CD._noiseTex2);
  _108 = (sqrt((_56 * _56) + (_55 * _55)) * 2.0f) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.699999988079071f);
  _111 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.030000001192092896f;
  _112 = _111 + _84;
  _113 = _111 + _108;
  _156 = dot(float3(_40.x, _40.y, _40.z), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
  _157 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _170 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _157, 0)))).x) & 127))) + 0.5f);
  } else {
    _170 = saturate((((((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_105 < (uint)65000), _105, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(frac((_84 + 0.4180000126361847f) - _111), frac((_108 + 0.35499998927116394f) - _111))))).w) + (((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_105 < (uint)65000), _105, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(frac(_112), frac(_113))))).w)) + (((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_105 < (uint)65000), _105, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(frac((_84 + 0.8550000190734863f) - _111), frac(_113 + 0.14800000190734863f))))).w)) + (((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_105 < (uint)65000), _105, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(frac(_112 + 0.6510000228881836f), frac((_108 + 0.7519999742507935f) - _111))))).w));
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_96, _156, 0.0f));
    _586 = output_color.x;
    _587 = output_color.y;
    _588 = output_color.z;
  } else {
    _586 = _96;
    _587 = _156;
    _588 = 0.0f;
  }
  if (_etcParams.y > 1.0f) {
    _599 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _600 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _604 = saturate(1.0f - (dot(float2(_599, _600), float2(_599, _600)) * saturate(_etcParams.y + -1.0f)));
    _609 = (_604 * _586);
    _610 = (_604 * _587);
    _611 = (_604 * _588);
  } else {
    _609 = _586;
    _610 = _587;
    _611 = _588;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _644 = select((_609 <= 0.0031308000907301903f), (_609 * 12.920000076293945f), (((pow(_609, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _645 = select((_610 <= 0.0031308000907301903f), (_610 * 12.920000076293945f), (((pow(_610, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _646 = select((_611 <= 0.0031308000907301903f), (_611 * 12.920000076293945f), (((pow(_611, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _644 = _609;
    _645 = _610;
    _646 = _611;
  }
  if (!(_etcParams.y < 1.0f)) {
    _651 = float((uint)_157);
    if (!(_651 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_651 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _660 = _644;
        _661 = _645;
        _662 = _646;
      } else {
        _660 = 0.0f;
        _661 = 0.0f;
        _662 = 0.0f;
      }
    } else {
      _660 = 0.0f;
      _661 = 0.0f;
      _662 = 0.0f;
    }
  } else {
    _660 = _644;
    _661 = _645;
    _662 = _646;
  }
  SV_Target.x = _660;
  SV_Target.y = _661;
  SV_Target.z = _662;
  SV_Target.w = _170;
  return SV_Target;
}