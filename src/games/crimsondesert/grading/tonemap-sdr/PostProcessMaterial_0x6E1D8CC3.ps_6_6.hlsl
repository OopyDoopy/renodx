#include "../tonemap.hlsli"

struct PostProcessSubspace_CDStruct {
  float _subspaceRatio;
  float4 _subspaceInfo;
  uint _subspaceTex;
  float _subspaceColorBlendRatio;
  uint _subspaceColor;
  uint _subspaceBlendColor;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t37, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t29, space36);

Texture2D<float4> __3__36__0__0__g_specularAO : register(t67, space36);

Texture2D<uint4> __3__36__0__0__g_gbufferBaseColor : register(t68, space36);

Texture2D<float4> __3__36__0__0__g_gbufferNormal : register(t44, space36);

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

struct BindlessParameters_PostProcessSubspace_CD {
  PostProcessSubspace_CDStruct BindlessParameters_PostProcessSubspace_CD;
};

typedef BindlessParameters_PostProcessSubspace_CD BindlessParameters_PostProcessSubspace_CD_t;
ConstantBuffer<BindlessParameters_PostProcessSubspace_CD_t> BindlessParameters_PostProcessSubspace_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _29;
  float4 _32;
  float _42;
  float _43;
  float _44;
  float _69;
  float _70;
  float _71;
  float _72;
  float _74;
  int _79;
  int _87;
  float4 _94;
  int _98;
  float _109;
  float _110;
  float _111;
  int _113;
  float _127;
  int _128;
  float _136;
  float _137;
  float _142;
  float _143;
  float _144;
  float _172;
  float _173;
  float _177;
  float _187;
  float _188;
  float _189;
  float _201;
  float _207;
  float _209;
  float _216;
  float _217;
  float _235;
  float _566;
  float _567;
  float _568;
  float _579;
  float _580;
  float _581;
  float _582;
  float _605;
  float _810;
  float _811;
  float _812;
  float _905;
  float _906;
  float _907;
  float _1027;
  float _1028;
  float _1029;
  float _1048;
  float _1049;
  float _1050;
  float _1083;
  float _1084;
  float _1085;
  float _1099;
  float _1100;
  float _1101;
  float _240;
  float _242;
  float _243;
  float _244;
  float _280;
  float _281;
  float _282;
  float _283;
  uint _289;
  uint _290;
  uint4 _292;
  float4 _295;
  float _313;
  float _314;
  float _315;
  float _317;
  float _318;
  float _319;
  float _320;
  float _323;
  float _324;
  float _327;
  float _328;
  float _332;
  float _334;
  float _335;
  float _336;
  float _337;
  float _339;
  float _342;
  float _343;
  float _344;
  float _345;
  float _354;
  float _358;
  float _362;
  float _364;
  float _374;
  float _375;
  float _376;
  float _392;
  float _393;
  float _394;
  float _395;
  float _401;
  float _413;
  int _418;
  int _426;
  float _429;
  float _432;
  float _434;
  float _459;
  float _460;
  float _461;
  int _462;
  int _470;
  float _473;
  float _476;
  float _478;
  int _506;
  float _514;
  float _527;
  float _530;
  float _548;
  float _564;
  float _574;
  float _589;
  float _590;
  float _591;
  uint _592;
  float _614;
  float _663;
  float _664;
  float _665;
  float _667;
  float _674;
  float _675;
  float _676;
  float _695;
  float _696;
  float _697;
  float _698;
  float _699;
  float _700;
  float _701;
  float _702;
  float _703;
  float _749;
  float _750;
  float _751;
  float _752;
  float _753;
  float _754;
  float _755;
  float _772;
  float _773;
  float _774;
  float _775;
  float _781;
  float _784;
  float _791;
  float _792;
  float _793;
  float _822;
  float _847;
  float _848;
  float _849;
  float _868;
  float _869;
  float _870;
  float _876;
  float _880;
  float _881;
  float _882;
  float _883;
  float _888;
  float _913;
  float _917;
  float _918;
  float _919;
  float _920;
  int _961;
  float _1016;
  float _1038;
  float _1039;
  float _1043;
  float _1090;
  float _1111;
  float _1112;
  float _1113;
  float _23[36];
  _29 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  _32 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _42 = (pow(_32.x, 0.012683313339948654f));
  _43 = (pow(_32.y, 0.012683313339948654f));
  _44 = (pow(_32.z, 0.012683313339948654f));
  _69 = exp2(log2(max(0.0f, (_42 + -0.8359375f)) / (18.8515625f - (_42 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _70 = exp2(log2(max(0.0f, (_43 + -0.8359375f)) / (18.8515625f - (_43 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _71 = exp2(log2(max(0.0f, (_44 + -0.8359375f)) / (18.8515625f - (_44 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _72 = TEXCOORD.x * 2.0f;
  _74 = TEXCOORD.y * 2.0f;
  _79 = WaveReadLaneFirst(_materialIndex);
  _87 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_79 < (uint)170000), _79, 0)) + 0u))].BindlessParameters_PostProcessSubspace_CD._subspaceTex);
  _94 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_87 < (uint)65000), _87, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_29 * _72), ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.10000000149011612f) + _74)));
  _98 = WaveReadLaneFirst(_materialIndex);
  _109 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_98 < (uint)170000), _98, 0)) + 0u))].BindlessParameters_PostProcessSubspace_CD._subspaceInfo.x);
  _110 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_98 < (uint)170000), _98, 0)) + 0u))].BindlessParameters_PostProcessSubspace_CD._subspaceInfo.y);
  _111 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_98 < (uint)170000), _98, 0)) + 0u))].BindlessParameters_PostProcessSubspace_CD._subspaceInfo.z);
  _113 = WaveReadLaneFirst(_materialIndex);
  _127 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_113 < (uint)170000), _113, 0)) + 0u))].BindlessParameters_PostProcessSubspace_CD._subspaceInfo.w);
  _128 = WaveReadLaneFirst(_materialIndex);
  _136 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_128 < (uint)170000), _128, 0)) + 0u))].BindlessParameters_PostProcessSubspace_CD._subspaceRatio);
  _137 = _136 * _127;
  _142 = _109 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].x);
  _143 = _110 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].y);
  _144 = _111 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].z);
  _172 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].w), _144, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].w), _143, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].w) * _142))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].w);
  _173 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].x), _144, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].x), _143, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].x) * _142))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].x)) / _172;
  _177 = 0.5f - (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].y), _144, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].y), _143, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].y) * _142))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].y)) / _172) * 0.5f);
  _187 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[62u].x) * _137) + _142;
  _188 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[63u].x) * _137) + _143;
  _189 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[64u].x) * _137) + _144;
  _201 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].w), _189, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].w), _188, (_187 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].w)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].w);
  _207 = (0.5f - (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].y), _189, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].y), _188, (_187 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].y)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].y)) / _201) * 0.5f)) - _177;
  _209 = (_29 * 0.5f) * (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].x), _189, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].x), _188, (_187 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].x)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].x)) / _201) - _173);
  _216 = TEXCOORD.y - _177;
  _217 = ((TEXCOORD.x + -0.5f) - (_173 * 0.5f)) * _29;
  _235 = float((bool)(uint)(dot(float3(_142, _143, _144), float3(asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z))) > 0.0f)) * saturate((1.0f - saturate(sqrt((_216 * _216) + (_217 * _217)) / max(0.0010000000474974513f, sqrt((_207 * _207) + (_209 * _209))))) * 5.0f);
  if (_235 > 0.0f) {
    _240 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    _242 = _72 + -1.0f;
    _243 = 1.0f - _74;
    _244 = max(1.0000000116860974e-07f, _240.x);
    _280 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].w), _244, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].w), _243, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].w) * _242))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].w);
    _281 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].x), _244, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].x), _243, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].x) * _242))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].x)) / _280;
    _282 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].y), _244, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].y), _243, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].y) * _242))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].y)) / _280;
    _283 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].z), _244, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].z), _243, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].z) * _242))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].z)) / _280;
    _289 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * TEXCOORD.x);
    _290 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * TEXCOORD.y);
    _292 = __3__36__0__0__g_gbufferBaseColor.Load(int3(_289, _290, 0));
    _295 = __3__36__0__0__g_gbufferNormal.Load(int3(_289, _290, 0));
    _313 = (saturate(_295.x * 1.0009784698486328f) * 2.0f) + -1.0f;
    _314 = (saturate(_295.y * 1.0009784698486328f) * 2.0f) + -1.0f;
    _315 = (saturate(_295.z * 1.0009784698486328f) * 2.0f) + -1.0f;
    _317 = rsqrt(dot(float3(_313, _314, _315), float3(_313, _314, _315)));
    _318 = _317 * _313;
    _319 = _317 * _314;
    _320 = _315 * _317;
    _323 = (float((uint)((uint)(((uint)((uint)(_292.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
    _324 = (float((uint)((uint)(_292.w & 255))) * 0.007843137718737125f) + -1.0f;
    _327 = (_323 + _324) * 0.5f;
    _328 = (_323 - _324) * 0.5f;
    _332 = (1.0f - abs(_327)) - abs(_328);
    _334 = rsqrt(dot(float3(_327, _328, _332), float3(_327, _328, _332)));
    _335 = _334 * _327;
    _336 = _334 * _328;
    _337 = _334 * _332;
    _339 = select((_320 >= 0.0f), 1.0f, -1.0f);
    _342 = -0.0f - (1.0f / (_339 + _320));
    _343 = _319 * _342;
    _344 = _343 * _318;
    _345 = _339 * _318;
    _354 = mad(_337, _318, mad(_336, _344, ((((_345 * _318) * _342) + 1.0f) * _335)));
    _358 = mad(_337, _319, mad(_336, (_339 + (_343 * _319)), ((_335 * _339) * _344)));
    _362 = mad(_337, _320, mad(_336, (-0.0f - _319), (-0.0f - (_345 * _335))));
    _364 = rsqrt(dot(float3(_354, _358, _362), float3(_354, _358, _362)));
    _374 = _281 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].x);
    _375 = _282 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].y);
    _376 = _283 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].z);
    _392 = 1.0f - saturate(dot(float3((_364 * _354), (_364 * _358), (_364 * _362)), float3((-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z)))));
    _393 = _109 - _281;
    _394 = _110 - _282;
    _395 = _111 - _283;
    _401 = sqrt(((_394 * _394) + (_393 * _393)) + (_395 * _395));
    _413 = exp2((2.0f - (saturate(saturate(1.0f - (_401 / max(0.0010000000474974513f, (_137 * 3.0f)))) * 2.0f) * 1.7999999523162842f)) * log2(_392));
    _418 = WaveReadLaneFirst(_materialIndex);
    _426 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_418 < (uint)170000), _418, 0)) + 0u))].BindlessParameters_PostProcessSubspace_CD._subspaceColor);
    _429 = float((uint)((uint)(((uint)(_426) >> 16) & 255)));
    _432 = float((uint)((uint)(((uint)(_426) >> 8) & 255)));
    _434 = float((uint)((uint)(_426 & 255)));
    _459 = select(((_429 * 0.003921568859368563f) < 0.040449999272823334f), (_429 * 0.0003035269910469651f), exp2(log2((_429 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _460 = select(((_432 * 0.003921568859368563f) < 0.040449999272823334f), (_432 * 0.0003035269910469651f), exp2(log2((_432 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _461 = select(((_434 * 0.003921568859368563f) < 0.040449999272823334f), (_434 * 0.0003035269910469651f), exp2(log2((_434 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _462 = WaveReadLaneFirst(_materialIndex);
    _470 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_462 < (uint)170000), _462, 0)) + 0u))].BindlessParameters_PostProcessSubspace_CD._subspaceBlendColor);
    _473 = float((uint)((uint)(((uint)(_470) >> 16) & 255)));
    _476 = float((uint)((uint)(((uint)(_470) >> 8) & 255)));
    _478 = float((uint)((uint)(_470 & 255)));
    _506 = WaveReadLaneFirst(_materialIndex);
    _514 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_506 < (uint)170000), _506, 0)) + 0u))].BindlessParameters_PostProcessSubspace_CD._subspaceColorBlendRatio);
    _527 = saturate(1.0f - (_401 / max(0.0010000000474974513f, _137)));
    _530 = saturate((_527 * _527) * 2.0f);
    if ((uint)(((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * TEXCOORD.x)), (int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * TEXCOORD.y)), 0)))).x) & 127) + -53) < (uint)15) {
      _548 = (_392 * _392) * ((_530 * 0.44999998807907104f) + 0.05000000074505806f);
      _566 = _548;
      _567 = _548;
      _568 = _548;
    } else {
      if ((_240.x < 1.0000000116860974e-07f) || (_240.x == 1.0f)) {
        _566 = (_94.x * 0.10000000149011612f);
        _567 = (_94.y * 0.10000000149011612f);
        _568 = (_94.z * 0.10000000149011612f);
      } else {
        _564 = (((float4)(__3__36__0__0__g_specularAO.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y), 0.0f))).w) * ((_530 * 0.8999999761581421f) + 0.10000000149011612f);
        _566 = _564;
        _567 = _564;
        _568 = _564;
      }
    }
    _574 = max(0.0010000000474974513f, _exposure0.x);
    _579 = ((_566 * ((_514 * (select(((_473 * 0.003921568859368563f) < 0.040449999272823334f), (_473 * 0.0003035269910469651f), exp2(log2((_473 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _459)) + _459)) / _574);
    _580 = ((_567 * ((_514 * (select(((_476 * 0.003921568859368563f) < 0.040449999272823334f), (_476 * 0.0003035269910469651f), exp2(log2((_476 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _460)) + _460)) / _574);
    _581 = ((_568 * ((_514 * (select(((_478 * 0.003921568859368563f) < 0.040449999272823334f), (_478 * 0.0003035269910469651f), exp2(log2((_478 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _461)) + _461)) / _574);
    _582 = ((((1.0f - _413) * saturate(((_137 - sqrt(((_142 * _142) + (_143 * _143)) + (_144 * _144))) + sqrt(((_375 * _375) + (_374 * _374)) + (_376 * _376))) * 5.0f)) + _413) * _235);
  } else {
    _579 = 0.0f;
    _580 = 0.0f;
    _581 = 0.0f;
    _582 = _235;
  }
  _589 = (_582 * (_579 - _69)) + _69;
  _590 = (_582 * (_580 - _70)) + _70;
  _591 = (_582 * (_581 - _71)) + _71;
  _592 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _605 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _592, 0)))).x) & 127))) + 0.5f);
  } else {
    _605 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_589, _590, _591));
    _1027 = output_color.x;
    _1028 = output_color.y;
    _1029 = output_color.z;
  } else {
    _1027 = _589;
    _1028 = _590;
    _1029 = _591;
  }
  if (_etcParams.y > 1.0f) {
    _1038 = abs(_72 + -1.0f);
    _1039 = abs(_74 + -1.0f);
    _1043 = saturate(1.0f - (dot(float2(_1038, _1039), float2(_1038, _1039)) * saturate(_etcParams.y + -1.0f)));
    _1048 = (_1043 * _1027);
    _1049 = (_1043 * _1028);
    _1050 = (_1043 * _1029);
  } else {
    _1048 = _1027;
    _1049 = _1028;
    _1050 = _1029;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _1083 = select((_1048 <= 0.0031308000907301903f), (_1048 * 12.920000076293945f), (((pow(_1048, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1084 = select((_1049 <= 0.0031308000907301903f), (_1049 * 12.920000076293945f), (((pow(_1049, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1085 = select((_1050 <= 0.0031308000907301903f), (_1050 * 12.920000076293945f), (((pow(_1050, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1083 = _1048;
    _1084 = _1049;
    _1085 = _1050;
  }
  if (!(_etcParams.y < 1.0f)) {
    _1090 = float((uint)_592);
    if (!(_1090 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_1090 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _1099 = _1083;
        _1100 = _1084;
        _1101 = _1085;
      } else {
        _1099 = 0.0f;
        _1100 = 0.0f;
        _1101 = 0.0f;
      }
    } else {
      _1099 = 0.0f;
      _1100 = 0.0f;
      _1101 = 0.0f;
    }
  } else {
    _1099 = _1083;
    _1100 = _1084;
    _1101 = _1085;
  }
  _1111 = exp2(log2(_1099 * 9.999999747378752e-05f) * 0.1593017578125f);
  _1112 = exp2(log2(_1100 * 9.999999747378752e-05f) * 0.1593017578125f);
  _1113 = exp2(log2(_1101 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_1111 * 18.6875f) + 1.0f)) * ((_1111 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_1112 * 18.6875f) + 1.0f)) * ((_1112 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_1113 * 18.6875f) + 1.0f)) * ((_1113 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _605;
  return SV_Target;
}