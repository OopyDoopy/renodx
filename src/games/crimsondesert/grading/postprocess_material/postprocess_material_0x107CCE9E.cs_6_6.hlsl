#include "../tonemap.hlsli"

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t33, space36);

RWTexture2D<float4> __3__38__0__1__g_textureUAV : register(u13, space38);

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

[numthreads(8, 8, 1)]
void main(
  uint3 SV_DispatchThreadID : SV_DispatchThreadID,
  uint3 SV_GroupID : SV_GroupID,
  uint3 SV_GroupThreadID : SV_GroupThreadID,
  uint SV_GroupIndex : SV_GroupIndex
) {
  float4 _10 = __3__36__0__0__g_sceneColor.Load(int3((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y), 0));

  float3 output_color = TonemapReplacer(_10.xyz, false, false, false);
  float _219 = output_color.x;
  float _220 = output_color.y;
  float _221 = output_color.z;

  // float _19 = _userImageAdjust.z * _exposure0.x;
  // float _68 = exp2(log2(max(0.0f, (((_19 * max(0.0f, (((_10.x * 1.705049991607666f) - (_10.y * 0.6217899918556213f)) - (_10.z * 0.08325999975204468f)))) * _slopeParams.x) + _offsetParams.x))) * _powerParams.x);
  // float _69 = exp2(log2(max(0.0f, (((max(0.0f, (((_10.y * 1.1407999992370605f) - (_10.x * 0.13026000559329987f)) - (_10.z * 0.01054999977350235f))) * _19) * _slopeParams.y) + _offsetParams.y))) * _powerParams.y);
  // float _70 = exp2(log2(max(0.0f, (((max(0.0f, (((_10.x * -0.024000000208616257f) - (_10.y * 0.12896999716758728f)) + (_10.z * 1.1529699563980103f))) * _19) * _slopeParams.z) + _offsetParams.z))) * _powerParams.z);
  // float _72 = dot(float3(_68, _69, _70), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
  // float _79 = ((_68 - _72) * _powerParams.w) + _72;
  // float _80 = ((_69 - _72) * _powerParams.w) + _72;
  // float _81 = ((_70 - _72) * _powerParams.w) + _72;
  // float _100 = min(max(log2(mad(_81, 0.07922374457120895f, mad(_80, 0.07843360304832458f, (_79 * 0.8424790501594543f)))), -12.473930358886719f), 4.026069164276123f) + 12.473930358886719f;
  // float _101 = min(max(log2(mad(_81, 0.07916612923145294f, mad(_80, 0.8784686326980591f, (_79 * 0.04232824221253395f)))), -12.473930358886719f), 4.026069164276123f) + 12.473930358886719f;
  // float _102 = min(max(log2(mad(_81, 0.8791429996490479f, mad(_80, 0.07843360304832458f, (_79 * 0.042375653982162476f)))), -12.473930358886719f), 4.026069164276123f) + 12.473930358886719f;
  // float _103 = _100 * 0.06060606241226196f;
  // float _104 = _101 * 0.06060606241226196f;
  // float _105 = _102 * 0.06060606241226196f;
  // float _106 = _103 * _103;
  // float _107 = _104 * _104;
  // float _108 = _105 * _105;
  // float _154 = min(0.0f, (-0.0f - (((_100 * 0.007218181621283293f) + ((_106 * 0.42980000376701355f) + (((_106 * _106) * ((31.959999084472656f - (_100 * 2.432727336883545f)) + (_106 * 15.5f))) - ((_100 * 0.41624245047569275f) * _106)))) + -0.002319999970495701f)));
  // float _155 = min(0.0f, (-0.0f - (((_101 * 0.007218181621283293f) + ((_107 * 0.42980000376701355f) + (((_107 * _107) * ((31.959999084472656f - (_101 * 2.432727336883545f)) + (_107 * 15.5f))) - ((_101 * 0.41624245047569275f) * _107)))) + -0.002319999970495701f)));
  // float _156 = min(0.0f, (-0.0f - (((_102 * 0.007218181621283293f) + ((_108 * 0.42980000376701355f) + (((_108 * _108) * ((31.959999084472656f - (_102 * 2.432727336883545f)) + (_108 * 15.5f))) - ((_102 * 0.41624245047569275f) * _108)))) + -0.002319999970495701f)));
  // float _157 = -0.0f - _154;
  // float _158 = -0.0f - _155;
  // float _159 = -0.0f - _156;
  // float _160 = dot(float3(_157, _158, _159), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
  // float _166 = saturate((_exposure2.x + -3.0f) * 0.1428571492433548f) * 0.20000004768371582f;
  // float _167 = _166 + 1.0f;
  // float _198 = ((exp2(log2((_167 - (_166 * saturate((_154 * _154) * _157))) * _157)) - _160) * 1.399999976158142f) + _160;
  // float _199 = ((exp2(log2((_167 - (saturate((_155 * _155) * _158) * _166)) * _158)) - _160) * 1.399999976158142f) + _160;
  // float _200 = ((exp2(log2((_167 - (saturate((_156 * _156) * _159) * _166)) * _159)) - _160) * 1.399999976158142f) + _160;
  // float _219 = saturate(exp2(log2(mad(_200, -0.09902974218130112f, mad(_199, -0.09802088141441345f, (_198 * 1.1968790292739868f)))) * 2.200000047683716f));
  // float _220 = saturate(exp2(log2(mad(_200, -0.09896117448806763f, mad(_199, 1.1519031524658203f, (_198 * -0.052896853536367416f)))) * 2.200000047683716f));
  // float _221 = saturate(exp2(log2(mad(_200, 1.151073694229126f, mad(_199, -0.09804344922304153f, (_198 * -0.05297163501381874f)))) * 2.200000047683716f));
  __3__38__0__1__g_textureUAV[int2((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y))] = float4(select((_219 <= 0.0031308000907301903f), (_219 * 12.920000076293945f), (((pow(_219, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f)), select((_220 <= 0.0031308000907301903f), (_220 * 12.920000076293945f), (((pow(_220, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f)), select((_221 <= 0.0031308000907301903f), (_221 * 12.920000076293945f), (((pow(_221, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f)), _10.w);
}