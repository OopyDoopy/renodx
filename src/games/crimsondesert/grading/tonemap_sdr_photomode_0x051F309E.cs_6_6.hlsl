#include "./tonemap.hlsli"

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

RWTexture2D<float4> __3__38__0__1__g_textureUAV : register(u13, space38);

cbuffer __3__35__0__0__SceneConstantBuffer : register(b16, space35) {
  uint4 __3__35__0__0__SceneConstantBuffer_raw[172];
};

#if 0
cbuffer __3__35__0__0__ExposureConstantBuffer : register(b31, space35) {
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
  int _nightToneParm : packoffset(c012.y);
  int2 _padding : packoffset(c012.z);
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
  float4 _11;
  float _20;
  float _69;
  float _70;
  float _71;
  float _73;
  float _80;
  float _81;
  float _82;
  float _101;
  float _102;
  float _103;
  float _104;
  float _105;
  float _106;
  float _107;
  float _108;
  float _109;
  float _155;
  float _156;
  float _157;
  float _158;
  float _159;
  float _160;
  float _161;
  float _217;
  float _218;
  float _219;
  float _179;
  float _180;
  float _181;
  float _182;
  float _188;
  float _191;
  float _198;
  float _199;
  float _200;
  float _229;
  float _254;
  float _255;
  float _256;
  float _275;
  float _276;
  float _277;
  // _11 = __3__36__0__0__g_sceneColor.Load(int3((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y), 0));
  // _20 = _userImageAdjust.z * _exposure0.x;
  // _69 = exp2(log2(max(0.0f, (((_20 * max(0.0f, (((_11.x * 1.705049991607666f) - (_11.y * 0.6217899918556213f)) - (_11.z * 0.08325999975204468f)))) * _slopeParams.x) + _offsetParams.x))) * _powerParams.x);
  // _70 = exp2(log2(max(0.0f, (((max(0.0f, (((_11.y * 1.1407999992370605f) - (_11.x * 0.13026000559329987f)) - (_11.z * 0.01054999977350235f))) * _20) * _slopeParams.y) + _offsetParams.y))) * _powerParams.y);
  // _71 = exp2(log2(max(0.0f, (((max(0.0f, (((_11.x * -0.024000000208616257f) - (_11.y * 0.12896999716758728f)) + (_11.z * 1.1529699563980103f))) * _20) * _slopeParams.z) + _offsetParams.z))) * _powerParams.z);
  // _73 = dot(float3(_69, _70, _71), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
  // _80 = ((_69 - _73) * _powerParams.w) + _73;
  // _81 = ((_70 - _73) * _powerParams.w) + _73;
  // _82 = ((_71 - _73) * _powerParams.w) + _73;
  // _101 = min(max(log2(mad(_82, 0.07922374457120895f, mad(_81, 0.07843360304832458f, (_80 * 0.8424790501594543f)))), -12.473930358886719f), 4.026069164276123f) + 12.473930358886719f;
  // _102 = min(max(log2(mad(_82, 0.07916612923145294f, mad(_81, 0.8784686326980591f, (_80 * 0.04232824221253395f)))), -12.473930358886719f), 4.026069164276123f) + 12.473930358886719f;
  // _103 = min(max(log2(mad(_82, 0.8791429996490479f, mad(_81, 0.07843360304832458f, (_80 * 0.042375653982162476f)))), -12.473930358886719f), 4.026069164276123f) + 12.473930358886719f;
  // _104 = _101 * 0.06060606241226196f;
  // _105 = _102 * 0.06060606241226196f;
  // _106 = _103 * 0.06060606241226196f;
  // _107 = _104 * _104;
  // _108 = _105 * _105;
  // _109 = _106 * _106;
  // _155 = min(0.0f, (-0.0f - (((_101 * 0.007218181621283293f) + ((_107 * 0.42980000376701355f) + (((_107 * _107) * ((31.959999084472656f - (_101 * 2.432727336883545f)) + (_107 * 15.5f))) - ((_101 * 0.41624245047569275f) * _107)))) + -0.002319999970495701f)));
  // _156 = min(0.0f, (-0.0f - (((_102 * 0.007218181621283293f) + ((_108 * 0.42980000376701355f) + (((_108 * _108) * ((31.959999084472656f - (_102 * 2.432727336883545f)) + (_108 * 15.5f))) - ((_102 * 0.41624245047569275f) * _108)))) + -0.002319999970495701f)));
  // _157 = min(0.0f, (-0.0f - (((_103 * 0.007218181621283293f) + ((_109 * 0.42980000376701355f) + (((_109 * _109) * ((31.959999084472656f - (_103 * 2.432727336883545f)) + (_109 * 15.5f))) - ((_103 * 0.41624245047569275f) * _109)))) + -0.002319999970495701f)));
  // _158 = -0.0f - _155;
  // _159 = -0.0f - _156;
  // _160 = -0.0f - _157;
  // _161 = dot(float3(_158, _159, _160), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
  // if (_nightToneParm == 1) {
  //   _179 = exp2(exp2(log2(abs((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].w) * 0.11666666716337204f) + -1.399999976158142f)) * 8.0f) * -1.4426950216293335f) + 1.0f;
  //   _180 = -0.7999999523162842f / _179;
  //   _181 = -1.2000000476837158f / _179;
  //   _182 = 0.20000004768371582f / _179;
  //   _188 = saturate((_exposure2.x + -0.6000000238418579f) * 0.10638298094272614f);
  //   _191 = saturate((_exposure2.x + -0.10000000149011612f) * 2.0f);
  //   _198 = (_180 + 1.399999976158142f) + (_191 * (-0.3999999761581421f - _180));
  //   _199 = (_181 + 1.600000023841858f) + (_191 * (-0.6000000238418579f - _181));
  //   _200 = (_182 + 0.8999999761581421f) + (_191 * (0.5f - _182));
  //   _217 = (lerp(_199, 1.2000000476837158f, _188));
  //   _218 = (lerp(_198, 1.0f, _188));
  //   _219 = (lerp(_200, 1.399999976158142f, _188));
  // } else {
  //   _217 = ((saturate((_exposure2.x + -3.0f) * 0.1428571492433548f) * 0.20000004768371582f) + 1.0f);
  //   _218 = 1.0f;
  //   _219 = 1.399999976158142f;
  // }
  // _229 = 1.0f - _217;
  // _254 = ((exp2(log2(((saturate((_155 * _155) * _158) * _229) + _217) * _158) * _218) - _161) * _219) + _161;
  // _255 = ((exp2(log2(((saturate((_156 * _156) * _159) * _229) + _217) * _159) * _218) - _161) * _219) + _161;
  // _256 = ((exp2(log2(((saturate((_157 * _157) * _160) * _229) + _217) * _160) * _218) - _161) * _219) + _161;
  // _275 = saturate(exp2(log2(mad(_256, -0.09902974218130112f, mad(_255, -0.09802088141441345f, (_254 * 1.1968790292739868f)))) * 2.200000047683716f));
  // _276 = saturate(exp2(log2(mad(_256, -0.09896117448806763f, mad(_255, 1.1519031524658203f, (_254 * -0.052896853536367416f)))) * 2.200000047683716f));
  // _277 = saturate(exp2(log2(mad(_256, 1.151073694229126f, mad(_255, -0.09804344922304153f, (_254 * -0.05297163501381874f)))) * 2.200000047683716f));
  // __3__38__0__1__g_textureUAV[int2((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y))] = float4(select((_275 <= 0.0031308000907301903f), (_275 * 12.920000076293945f), (((pow(_275, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f)), select((_276 <= 0.0031308000907301903f), (_276 * 12.920000076293945f), (((pow(_276, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f)), select((_277 <= 0.0031308000907301903f), (_277 * 12.920000076293945f), (((pow(_277, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f)), _11.w);
  float4 sampled_color = __3__36__0__0__g_sceneColor.Load(int3((uint)(SV_DispatchThreadID.x), (uint)(SV_DispatchThreadID.y), 0));
  float3 output_color = TonemapReplacer(sampled_color.xyz, false, false, true);
  __3__38__0__1__g_textureUAV[int2((uint)(SV_DispatchThreadID.x), (uint)(SV_DispatchThreadID.y))] = float4(renodx::color::srgb::Encode(output_color), sampled_color.w);
}