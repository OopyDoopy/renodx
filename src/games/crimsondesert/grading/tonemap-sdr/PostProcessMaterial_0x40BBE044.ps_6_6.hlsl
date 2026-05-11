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
  float _36;
  float _38;
  int _43;
  int _51;
  float4 _58;
  int _62;
  float _73;
  float _74;
  float _75;
  int _77;
  float _91;
  int _92;
  float _100;
  float _101;
  float _106;
  float _107;
  float _108;
  float _136;
  float _137;
  float _141;
  float _151;
  float _152;
  float _153;
  float _165;
  float _171;
  float _173;
  float _180;
  float _181;
  float _199;
  float _530;
  float _531;
  float _532;
  float _543;
  float _544;
  float _545;
  float _546;
  float _569;
  float _774;
  float _775;
  float _776;
  float _869;
  float _870;
  float _871;
  float _991;
  float _992;
  float _993;
  float _1012;
  float _1013;
  float _1014;
  float _1047;
  float _1048;
  float _1049;
  float _1063;
  float _1064;
  float _1065;
  float _204;
  float _206;
  float _207;
  float _208;
  float _244;
  float _245;
  float _246;
  float _247;
  uint _253;
  uint _254;
  uint4 _256;
  float4 _259;
  float _277;
  float _278;
  float _279;
  float _281;
  float _282;
  float _283;
  float _284;
  float _287;
  float _288;
  float _291;
  float _292;
  float _296;
  float _298;
  float _299;
  float _300;
  float _301;
  float _303;
  float _306;
  float _307;
  float _308;
  float _309;
  float _318;
  float _322;
  float _326;
  float _328;
  float _338;
  float _339;
  float _340;
  float _356;
  float _357;
  float _358;
  float _359;
  float _365;
  float _377;
  int _382;
  int _390;
  float _393;
  float _396;
  float _398;
  float _423;
  float _424;
  float _425;
  int _426;
  int _434;
  float _437;
  float _440;
  float _442;
  int _470;
  float _478;
  float _491;
  float _494;
  float _512;
  float _528;
  float _538;
  float _553;
  float _554;
  float _555;
  uint _556;
  float _578;
  float _627;
  float _628;
  float _629;
  float _631;
  float _638;
  float _639;
  float _640;
  float _659;
  float _660;
  float _661;
  float _662;
  float _663;
  float _664;
  float _665;
  float _666;
  float _667;
  float _713;
  float _714;
  float _715;
  float _716;
  float _717;
  float _718;
  float _719;
  float _736;
  float _737;
  float _738;
  float _739;
  float _745;
  float _748;
  float _755;
  float _756;
  float _757;
  float _786;
  float _811;
  float _812;
  float _813;
  float _832;
  float _833;
  float _834;
  float _840;
  float _844;
  float _845;
  float _846;
  float _847;
  float _852;
  float _877;
  float _881;
  float _882;
  float _883;
  float _884;
  int _925;
  float _980;
  float _1002;
  float _1003;
  float _1007;
  float _1054;
  float _23[36];
  _29 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  _32 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _36 = TEXCOORD.x * 2.0f;
  _38 = TEXCOORD.y * 2.0f;
  _43 = WaveReadLaneFirst(_materialIndex);
  _51 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_43 < (uint)170000), _43, 0)) + 0u))].BindlessParameters_PostProcessSubspace_CD._subspaceTex);
  _58 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_51 < (uint)65000), _51, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_29 * _36), ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.10000000149011612f) + _38)));
  _62 = WaveReadLaneFirst(_materialIndex);
  _73 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_62 < (uint)170000), _62, 0)) + 0u))].BindlessParameters_PostProcessSubspace_CD._subspaceInfo.x);
  _74 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_62 < (uint)170000), _62, 0)) + 0u))].BindlessParameters_PostProcessSubspace_CD._subspaceInfo.y);
  _75 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_62 < (uint)170000), _62, 0)) + 0u))].BindlessParameters_PostProcessSubspace_CD._subspaceInfo.z);
  _77 = WaveReadLaneFirst(_materialIndex);
  _91 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_77 < (uint)170000), _77, 0)) + 0u))].BindlessParameters_PostProcessSubspace_CD._subspaceInfo.w);
  _92 = WaveReadLaneFirst(_materialIndex);
  _100 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_92 < (uint)170000), _92, 0)) + 0u))].BindlessParameters_PostProcessSubspace_CD._subspaceRatio);
  _101 = _100 * _91;
  _106 = _73 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].x);
  _107 = _74 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].y);
  _108 = _75 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].z);
  _136 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].w), _108, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].w), _107, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].w) * _106))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].w);
  _137 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].x), _108, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].x), _107, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].x) * _106))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].x)) / _136;
  _141 = 0.5f - (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].y), _108, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].y), _107, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].y) * _106))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].y)) / _136) * 0.5f);
  _151 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[62u].x) * _101) + _106;
  _152 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[63u].x) * _101) + _107;
  _153 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[64u].x) * _101) + _108;
  _165 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].w), _153, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].w), _152, (_151 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].w)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].w);
  _171 = (0.5f - (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].y), _153, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].y), _152, (_151 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].y)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].y)) / _165) * 0.5f)) - _141;
  _173 = (_29 * 0.5f) * (((mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[20u].x), _153, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[19u].x), _152, (_151 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[18u].x)))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[21u].x)) / _165) - _137);
  _180 = TEXCOORD.y - _141;
  _181 = ((TEXCOORD.x + -0.5f) - (_137 * 0.5f)) * _29;
  _199 = float((bool)(uint)(dot(float3(_106, _107, _108), float3(asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y), asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z))) > 0.0f)) * saturate((1.0f - saturate(sqrt((_180 * _180) + (_181 * _181)) / max(0.0010000000474974513f, sqrt((_171 * _171) + (_173 * _173))))) * 5.0f);
  if (_199 > 0.0f) {
    _204 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    _206 = _36 + -1.0f;
    _207 = 1.0f - _38;
    _208 = max(1.0000000116860974e-07f, _204.x);
    _244 = mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].w), _208, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].w), _207, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].w) * _206))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].w);
    _245 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].x), _208, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].x), _207, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].x) * _206))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].x)) / _244;
    _246 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].y), _208, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].y), _207, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].y) * _206))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].y)) / _244;
    _247 = (mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[28u].z), _208, mad(asfloat(__3__35__0__0__SceneConstantBuffer_raw[27u].z), _207, (asfloat(__3__35__0__0__SceneConstantBuffer_raw[26u].z) * _206))) + asfloat(__3__35__0__0__SceneConstantBuffer_raw[29u].z)) / _244;
    _253 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * TEXCOORD.x);
    _254 = uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * TEXCOORD.y);
    _256 = __3__36__0__0__g_gbufferBaseColor.Load(int3(_253, _254, 0));
    _259 = __3__36__0__0__g_gbufferNormal.Load(int3(_253, _254, 0));
    _277 = (saturate(_259.x * 1.0009784698486328f) * 2.0f) + -1.0f;
    _278 = (saturate(_259.y * 1.0009784698486328f) * 2.0f) + -1.0f;
    _279 = (saturate(_259.z * 1.0009784698486328f) * 2.0f) + -1.0f;
    _281 = rsqrt(dot(float3(_277, _278, _279), float3(_277, _278, _279)));
    _282 = _281 * _277;
    _283 = _281 * _278;
    _284 = _279 * _281;
    _287 = (float((uint)((uint)(((uint)((uint)(_256.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
    _288 = (float((uint)((uint)(_256.w & 255))) * 0.007843137718737125f) + -1.0f;
    _291 = (_287 + _288) * 0.5f;
    _292 = (_287 - _288) * 0.5f;
    _296 = (1.0f - abs(_291)) - abs(_292);
    _298 = rsqrt(dot(float3(_291, _292, _296), float3(_291, _292, _296)));
    _299 = _298 * _291;
    _300 = _298 * _292;
    _301 = _298 * _296;
    _303 = select((_284 >= 0.0f), 1.0f, -1.0f);
    _306 = -0.0f - (1.0f / (_303 + _284));
    _307 = _283 * _306;
    _308 = _307 * _282;
    _309 = _303 * _282;
    _318 = mad(_301, _282, mad(_300, _308, ((((_309 * _282) * _306) + 1.0f) * _299)));
    _322 = mad(_301, _283, mad(_300, (_303 + (_307 * _283)), ((_299 * _303) * _308)));
    _326 = mad(_301, _284, mad(_300, (-0.0f - _283), (-0.0f - (_309 * _299))));
    _328 = rsqrt(dot(float3(_318, _322, _326), float3(_318, _322, _326)));
    _338 = _245 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].x);
    _339 = _246 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].y);
    _340 = _247 - asfloat(__3__35__0__0__SceneConstantBuffer_raw[8u].z);
    _356 = 1.0f - saturate(dot(float3((_328 * _318), (_328 * _322), (_328 * _326)), float3((-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].x)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].y)), (-0.0f - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].z)))));
    _357 = _73 - _245;
    _358 = _74 - _246;
    _359 = _75 - _247;
    _365 = sqrt(((_358 * _358) + (_357 * _357)) + (_359 * _359));
    _377 = exp2((2.0f - (saturate(saturate(1.0f - (_365 / max(0.0010000000474974513f, (_101 * 3.0f)))) * 2.0f) * 1.7999999523162842f)) * log2(_356));
    _382 = WaveReadLaneFirst(_materialIndex);
    _390 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_382 < (uint)170000), _382, 0)) + 0u))].BindlessParameters_PostProcessSubspace_CD._subspaceColor);
    _393 = float((uint)((uint)(((uint)(_390) >> 16) & 255)));
    _396 = float((uint)((uint)(((uint)(_390) >> 8) & 255)));
    _398 = float((uint)((uint)(_390 & 255)));
    _423 = select(((_393 * 0.003921568859368563f) < 0.040449999272823334f), (_393 * 0.0003035269910469651f), exp2(log2((_393 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _424 = select(((_396 * 0.003921568859368563f) < 0.040449999272823334f), (_396 * 0.0003035269910469651f), exp2(log2((_396 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _425 = select(((_398 * 0.003921568859368563f) < 0.040449999272823334f), (_398 * 0.0003035269910469651f), exp2(log2((_398 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _426 = WaveReadLaneFirst(_materialIndex);
    _434 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_426 < (uint)170000), _426, 0)) + 0u))].BindlessParameters_PostProcessSubspace_CD._subspaceBlendColor);
    _437 = float((uint)((uint)(((uint)(_434) >> 16) & 255)));
    _440 = float((uint)((uint)(((uint)(_434) >> 8) & 255)));
    _442 = float((uint)((uint)(_434 & 255)));
    _470 = WaveReadLaneFirst(_materialIndex);
    _478 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_470 < (uint)170000), _470, 0)) + 0u))].BindlessParameters_PostProcessSubspace_CD._subspaceColorBlendRatio);
    _491 = saturate(1.0f - (_365 / max(0.0010000000474974513f, _101)));
    _494 = saturate((_491 * _491) * 2.0f);
    if ((uint)(((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * TEXCOORD.x)), (int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * TEXCOORD.y)), 0)))).x) & 127) + -53) < (uint)15) {
      _512 = (_356 * _356) * ((_494 * 0.44999998807907104f) + 0.05000000074505806f);
      _530 = _512;
      _531 = _512;
      _532 = _512;
    } else {
      if ((_204.x < 1.0000000116860974e-07f) || (_204.x == 1.0f)) {
        _530 = (_58.x * 0.10000000149011612f);
        _531 = (_58.y * 0.10000000149011612f);
        _532 = (_58.z * 0.10000000149011612f);
      } else {
        _528 = (((float4)(__3__36__0__0__g_specularAO.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y), 0.0f))).w) * ((_494 * 0.8999999761581421f) + 0.10000000149011612f);
        _530 = _528;
        _531 = _528;
        _532 = _528;
      }
    }
    _538 = max(0.0010000000474974513f, _exposure0.x);
    _543 = ((_530 * ((_478 * (select(((_437 * 0.003921568859368563f) < 0.040449999272823334f), (_437 * 0.0003035269910469651f), exp2(log2((_437 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _423)) + _423)) / _538);
    _544 = ((_531 * ((_478 * (select(((_440 * 0.003921568859368563f) < 0.040449999272823334f), (_440 * 0.0003035269910469651f), exp2(log2((_440 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _424)) + _424)) / _538);
    _545 = ((_532 * ((_478 * (select(((_442 * 0.003921568859368563f) < 0.040449999272823334f), (_442 * 0.0003035269910469651f), exp2(log2((_442 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _425)) + _425)) / _538);
    _546 = ((((1.0f - _377) * saturate(((_101 - sqrt(((_106 * _106) + (_107 * _107)) + (_108 * _108))) + sqrt(((_339 * _339) + (_338 * _338)) + (_340 * _340))) * 5.0f)) + _377) * _199);
  } else {
    _543 = 0.0f;
    _544 = 0.0f;
    _545 = 0.0f;
    _546 = _199;
  }
  _553 = (_546 * (_543 - _32.x)) + _32.x;
  _554 = (_546 * (_544 - _32.y)) + _32.y;
  _555 = (_546 * (_545 - _32.z)) + _32.z;
  _556 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _569 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _556, 0)))).x) & 127))) + 0.5f);
  } else {
    _569 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_553, _554, _555));
    _991 = output_color.x;
    _992 = output_color.y;
    _993 = output_color.z;
  } else {
    _991 = _553;
    _992 = _554;
    _993 = _555;
  }
  if (_etcParams.y > 1.0f) {
    _1002 = abs(_36 + -1.0f);
    _1003 = abs(_38 + -1.0f);
    _1007 = saturate(1.0f - (dot(float2(_1002, _1003), float2(_1002, _1003)) * saturate(_etcParams.y + -1.0f)));
    _1012 = (_1007 * _991);
    _1013 = (_1007 * _992);
    _1014 = (_1007 * _993);
  } else {
    _1012 = _991;
    _1013 = _992;
    _1014 = _993;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _1047 = select((_1012 <= 0.0031308000907301903f), (_1012 * 12.920000076293945f), (((pow(_1012, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1048 = select((_1013 <= 0.0031308000907301903f), (_1013 * 12.920000076293945f), (((pow(_1013, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1049 = select((_1014 <= 0.0031308000907301903f), (_1014 * 12.920000076293945f), (((pow(_1014, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1047 = _1012;
    _1048 = _1013;
    _1049 = _1014;
  }
  if (!(_etcParams.y < 1.0f)) {
    _1054 = float((uint)_556);
    if (!(_1054 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_1054 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _1063 = _1047;
        _1064 = _1048;
        _1065 = _1049;
      } else {
        _1063 = 0.0f;
        _1064 = 0.0f;
        _1065 = 0.0f;
      }
    } else {
      _1063 = 0.0f;
      _1064 = 0.0f;
      _1065 = 0.0f;
    }
  } else {
    _1063 = _1047;
    _1064 = _1048;
    _1065 = _1049;
  }
  SV_Target.x = _1063;
  SV_Target.y = _1064;
  SV_Target.z = _1065;
  SV_Target.w = _569;
  return SV_Target;
}