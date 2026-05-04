#include "./tonemap.hlsli"

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t33, space36);

RWTexture2D<float4> __3__38__0__1__g_textureUAV : register(u13, space38);

cbuffer __3__35__0__0__SceneConstantBuffer : register(b14, space35) {
  uint4 __3__35__0__0__SceneConstantBuffer_raw[172];
};

#if 0
cbuffer __3__35__0__0__ExposureConstantBuffer : register(b29, space35) {
  float4 _exposure0 : packoffset(c000.x);
  float4 _exposure1 : packoffset(c001.x);
  float4 _exposure2 : packoffset(c002.x);
  float4 _exposure3 : packoffset(c003.x);
  float4 _exposure4 : packoffset(c004.x);
};

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
  int3 _padding : packoffset(c012.y);
};
#endif

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

[numthreads(8, 8, 1)]
void main(
  uint3 SV_DispatchThreadID : SV_DispatchThreadID,
  uint3 SV_GroupID : SV_GroupID,
  uint3 SV_GroupThreadID : SV_GroupThreadID,
  uint SV_GroupIndex : SV_GroupIndex
) {
  float4 _12;
  float _21;
  float _70;
  float _71;
  float _72;
  float _74;
  float _81;
  float _82;
  float _83;
  float _102;
  float _103;
  float _104;
  float _105;
  float _106;
  float _107;
  float _108;
  float _109;
  float _110;
  float _156;
  float _157;
  float _158;
  float _159;
  float _160;
  float _161;
  float _162;
  float _175;
  float _176;
  float _177;
  float _178;
  float _184;
  float _187;
  float _194;
  float _195;
  float _196;
  float _203;
  float _204;
  float _205;
  float _215;
  float _240;
  float _241;
  float _242;
  float _261;
  float _262;
  float _263;
  _12 = __3__36__0__0__g_sceneColor.Load(int3((uint)(SV_DispatchThreadID.x), (uint)(SV_DispatchThreadID.y), 0));
  float3 output_color = TonemapReplacer(_12.xyz, false, false, true);
  _261 = output_color.x;
  _262 = output_color.y;
  _263 = output_color.z;
  // _21 = _userImageAdjust.z * _exposure0.x;
  // _70 = exp2(log2(max(0.0f, (((_21 * max(0.0f, (((_12.x * 1.705049991607666f) - (_12.y * 0.6217899918556213f)) - (_12.z * 0.08325999975204468f)))) * _slopeParams.x) + _offsetParams.x))) * _powerParams.x);
  // _71 = exp2(log2(max(0.0f, (((max(0.0f, (((_12.y * 1.1407999992370605f) - (_12.x * 0.13026000559329987f)) - (_12.z * 0.01054999977350235f))) * _21) * _slopeParams.y) + _offsetParams.y))) * _powerParams.y);
  // _72 = exp2(log2(max(0.0f, (((max(0.0f, (((_12.x * -0.024000000208616257f) - (_12.y * 0.12896999716758728f)) + (_12.z * 1.1529699563980103f))) * _21) * _slopeParams.z) + _offsetParams.z))) * _powerParams.z);
  // _74 = dot(float3(_70, _71, _72), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
  // _81 = ((_70 - _74) * _powerParams.w) + _74;
  // _82 = ((_71 - _74) * _powerParams.w) + _74;
  // _83 = ((_72 - _74) * _powerParams.w) + _74;
  // _102 = min(max(log2(mad(_83, 0.07922374457120895f, mad(_82, 0.07843360304832458f, (_81 * 0.8424790501594543f)))), -12.473930358886719f), 4.026069164276123f) + 12.473930358886719f;
  // _103 = min(max(log2(mad(_83, 0.07916612923145294f, mad(_82, 0.8784686326980591f, (_81 * 0.04232824221253395f)))), -12.473930358886719f), 4.026069164276123f) + 12.473930358886719f;
  // _104 = min(max(log2(mad(_83, 0.8791429996490479f, mad(_82, 0.07843360304832458f, (_81 * 0.042375653982162476f)))), -12.473930358886719f), 4.026069164276123f) + 12.473930358886719f;
  // _105 = _102 * 0.06060606241226196f;
  // _106 = _103 * 0.06060606241226196f;
  // _107 = _104 * 0.06060606241226196f;
  // _108 = _105 * _105;
  // _109 = _106 * _106;
  // _110 = _107 * _107;
  // _156 = min(0.0f, (-0.0f - (((_102 * 0.007218181621283293f) + ((_108 * 0.42980000376701355f) + (((_108 * _108) * ((31.959999084472656f - (_102 * 2.432727336883545f)) + (_108 * 15.5f))) - ((_102 * 0.41624245047569275f) * _108)))) + -0.002319999970495701f)));
  // _157 = min(0.0f, (-0.0f - (((_103 * 0.007218181621283293f) + ((_109 * 0.42980000376701355f) + (((_109 * _109) * ((31.959999084472656f - (_103 * 2.432727336883545f)) + (_109 * 15.5f))) - ((_103 * 0.41624245047569275f) * _109)))) + -0.002319999970495701f)));
  // _158 = min(0.0f, (-0.0f - (((_104 * 0.007218181621283293f) + ((_110 * 0.42980000376701355f) + (((_110 * _110) * ((31.959999084472656f - (_104 * 2.432727336883545f)) + (_110 * 15.5f))) - ((_104 * 0.41624245047569275f) * _110)))) + -0.002319999970495701f)));
  // _159 = -0.0f - _156;
  // _160 = -0.0f - _157;
  // _161 = -0.0f - _158;
  // _162 = dot(float3(_159, _160, _161), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
  // _175 = exp2(exp2(log2(abs((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].w) * 0.11666666716337204f) + -1.399999976158142f)) * 8.0f) * -1.4426950216293335f) + 1.0f;
  // _176 = -0.7999999523162842f / _175;
  // _177 = -1.2000000476837158f / _175;
  // _178 = 0.20000004768371582f / _175;
  // _184 = saturate((_exposure2.x + -0.6000000238418579f) * 0.10638298094272614f);
  // _187 = saturate((_exposure2.x + -0.10000000149011612f) * 2.0f);
  // _194 = (_176 + 1.399999976158142f) + (_187 * (-0.3999999761581421f - _176));
  // _195 = (_177 + 1.600000023841858f) + (_187 * (-0.6000000238418579f - _177));
  // _196 = (_178 + 0.8999999761581421f) + (_187 * (0.5f - _178));
  // _203 = ((1.0f - _194) * _184) + _194;
  // _204 = ((1.2000000476837158f - _195) * _184) + _195;
  // _205 = ((1.399999976158142f - _196) * _184) + _196;
  // _215 = 1.0f - _204;
  // _240 = ((exp2(_203 * log2(((_215 * saturate((_156 * _156) * _159)) + _204) * _159)) - _162) * _205) + _162;
  // _241 = ((exp2(log2(((_215 * saturate((_157 * _157) * _160)) + _204) * _160) * _203) - _162) * _205) + _162;
  // _242 = ((exp2(log2(((_215 * saturate((_158 * _158) * _161)) + _204) * _161) * _203) - _162) * _205) + _162;
  // _261 = saturate(exp2(log2(mad(_242, -0.09902974218130112f, mad(_241, -0.09802088141441345f, (_240 * 1.1968790292739868f)))) * 2.200000047683716f));
  // _262 = saturate(exp2(log2(mad(_242, -0.09896117448806763f, mad(_241, 1.1519031524658203f, (_240 * -0.052896853536367416f)))) * 2.200000047683716f));
  // _263 = saturate(exp2(log2(mad(_242, 1.151073694229126f, mad(_241, -0.09804344922304153f, (_240 * -0.05297163501381874f)))) * 2.200000047683716f));
  __3__38__0__1__g_textureUAV[int2((uint)(SV_DispatchThreadID.x), (uint)(SV_DispatchThreadID.y))] = float4(select((_261 <= 0.0031308000907301903f), (_261 * 12.920000076293945f), (((pow(_261, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f)), select((_262 <= 0.0031308000907301903f), (_262 * 12.920000076293945f), (((pow(_262, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f)), select((_263 <= 0.0031308000907301903f), (_263 * 12.920000076293945f), (((pow(_263, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f)), _12.w);
}