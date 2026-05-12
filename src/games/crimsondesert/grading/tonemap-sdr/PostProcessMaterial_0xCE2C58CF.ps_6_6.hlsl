#include "../tonemap.hlsli"

struct PostProcessGhost_CDStruct {
  float _ghostFXRatio;
  uint _ghostNoiseTex;
  float _ghostNoiseIntensity;
  float _ghostFXColorInnerBrightness;
  uint _ghostFXColor1;
  uint _ghostFXColor2;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t36, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

Texture2D<uint> __3__36__0__0__g_depthOpaque : register(t38, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t29, space36);

Texture2D<float4> __3__36__0__0__g_CustomRenderPassDepth : register(t70, space36);

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

struct BindlessParameters_PostProcessGhost_CD {
  PostProcessGhost_CDStruct BindlessParameters_PostProcessGhost_CD;
};

typedef BindlessParameters_PostProcessGhost_CD BindlessParameters_PostProcessGhost_CD_t;
ConstantBuffer<BindlessParameters_PostProcessGhost_CD_t> BindlessParameters_PostProcessGhost_CD[] : register(b0, space100);

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
  float4 _31;
  float _41;
  float _42;
  float _43;
  float _65;
  float _66;
  float _67;
  float _68;
  float _69;
  float _70;
  int _71;
  float _79;
  float _224;
  float _225;
  float _226;
  float _240;
  float _445;
  float _446;
  float _447;
  float _540;
  float _541;
  float _542;
  float _662;
  float _663;
  float _664;
  float _685;
  float _686;
  float _687;
  float _720;
  float _721;
  float _722;
  float _736;
  float _737;
  float _738;
  float _83;
  int _90;
  int _98;
  int _107;
  float _115;
  int _116;
  float _124;
  float _126;
  float _129;
  float _130;
  int _164;
  float _172;
  float4 _175;
  float _185;
  float _186;
  float _187;
  float _216;
  uint _227;
  float _249;
  float _298;
  float _299;
  float _300;
  float _302;
  float _309;
  float _310;
  float _311;
  float _330;
  float _331;
  float _332;
  float _333;
  float _334;
  float _335;
  float _336;
  float _337;
  float _338;
  float _384;
  float _385;
  float _386;
  float _387;
  float _388;
  float _389;
  float _390;
  float _407;
  float _408;
  float _409;
  float _410;
  float _416;
  float _419;
  float _426;
  float _427;
  float _428;
  float _457;
  float _482;
  float _483;
  float _484;
  float _503;
  float _504;
  float _505;
  float _511;
  float _515;
  float _516;
  float _517;
  float _518;
  float _523;
  float _548;
  float _552;
  float _553;
  float _554;
  float _555;
  int _596;
  float _651;
  float _675;
  float _676;
  float _680;
  float _727;
  float _748;
  float _749;
  float _750;
  float _22[36];
  _31 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _41 = (pow(_31.x, 0.012683313339948654f));
  _42 = (pow(_31.y, 0.012683313339948654f));
  _43 = (pow(_31.z, 0.012683313339948654f));
  _65 = exp2(log2(max(0.0f, (_41 + -0.8359375f)) / (18.8515625f - (_41 * 18.6875f))) * 6.277394771575928f);
  _66 = exp2(log2(max(0.0f, (_42 + -0.8359375f)) / (18.8515625f - (_42 * 18.6875f))) * 6.277394771575928f);
  _67 = exp2(log2(max(0.0f, (_43 + -0.8359375f)) / (18.8515625f - (_43 * 18.6875f))) * 6.277394771575928f);
  _68 = _65 * 10000.0f;
  _69 = _66 * 10000.0f;
  _70 = _67 * 10000.0f;
  _71 = WaveReadLaneFirst(_materialIndex);
  _79 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_71 < (uint)170000), _71, 0)) + 0u))].BindlessParameters_PostProcessGhost_CD._ghostFXRatio);
  if (!(_79 < 0.0010000000474974513f)) {
    _83 = 4.0f / (_srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y);
    _90 = WaveReadLaneFirst(_materialIndex);
    _98 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_90 < (uint)170000), _90, 0)) + 0u))].BindlessParameters_PostProcessGhost_CD._ghostNoiseTex);
    _107 = WaveReadLaneFirst(_materialIndex);
    _115 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_107 < (uint)170000), _107, 0)) + 0u))].BindlessParameters_PostProcessGhost_CD._ghostFXRatio);
    _116 = WaveReadLaneFirst(_materialIndex);
    _124 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_116 < (uint)170000), _116, 0)) + 0u))].BindlessParameters_PostProcessGhost_CD._ghostNoiseIntensity);
    _126 = _124 * (_115 * (((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_98 < (uint)65000), _98, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((TEXCOORD.x * 3.0f) * _83), ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.30000001192092896f) + (_83 * TEXCOORD.y)))))).y));
    _129 = (_126 * 0.009999999776482582f) + TEXCOORD.x;
    _130 = (_126 * 0.05000000074505806f) + TEXCOORD.y;
    _164 = WaveReadLaneFirst(_materialIndex);
    _172 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_164 < (uint)170000), _164, 0)) + 0u))].BindlessParameters_PostProcessGhost_CD._ghostFXRatio);
    _175 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    _185 = (pow(_175.x, 0.012683313339948654f));
    _186 = (pow(_175.y, 0.012683313339948654f));
    _187 = (pow(_175.z, 0.012683313339948654f));
    _216 = (saturate(ceil(((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, (float((uint)((uint)((((uint)(__3__36__0__0__g_depthOpaque.Load(int3((int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * _129)), (int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * _130)), 0)))).x) & 16777215))) * 5.960465188081798e-08f))) + 0.05000000074505806f) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * _129), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * _130), 0)))).x))))) * 10000.0f) * _172;
    _224 = (((exp2(log2(max(0.0f, (_185 + -0.8359375f)) / (18.8515625f - (_185 * 18.6875f))) * 6.277394771575928f) - _65) * _216) + _68);
    _225 = (((exp2(log2(max(0.0f, (_186 + -0.8359375f)) / (18.8515625f - (_186 * 18.6875f))) * 6.277394771575928f) - _66) * _216) + _69);
    _226 = (((exp2(log2(max(0.0f, (_187 + -0.8359375f)) / (18.8515625f - (_187 * 18.6875f))) * 6.277394771575928f) - _67) * _216) + _70);
  } else {
    _224 = _68;
    _225 = _69;
    _226 = _70;
  }
  _227 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _240 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _227, 0)))).x) & 127))) + 0.5f);
  } else {
    _240 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_224, _225, _226));
    _662 = output_color.x;
    _663 = output_color.y;
    _664 = output_color.z;
  } else {
    _662 = _224;
    _663 = _225;
    _664 = _226;
  }
  if (_etcParams.y > 1.0f) {
    _675 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _676 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _680 = saturate(1.0f - (dot(float2(_675, _676), float2(_675, _676)) * saturate(_etcParams.y + -1.0f)));
    _685 = (_680 * _662);
    _686 = (_680 * _663);
    _687 = (_680 * _664);
  } else {
    _685 = _662;
    _686 = _663;
    _687 = _664;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _720 = select((_685 <= 0.0031308000907301903f), (_685 * 12.920000076293945f), (((pow(_685, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _721 = select((_686 <= 0.0031308000907301903f), (_686 * 12.920000076293945f), (((pow(_686, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _722 = select((_687 <= 0.0031308000907301903f), (_687 * 12.920000076293945f), (((pow(_687, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _720 = _685;
    _721 = _686;
    _722 = _687;
  }
  if (!(_etcParams.y < 1.0f)) {
    _727 = float((uint)_227);
    if (!(_727 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_727 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _736 = _720;
        _737 = _721;
        _738 = _722;
      } else {
        _736 = 0.0f;
        _737 = 0.0f;
        _738 = 0.0f;
      }
    } else {
      _736 = 0.0f;
      _737 = 0.0f;
      _738 = 0.0f;
    }
  } else {
    _736 = _720;
    _737 = _721;
    _738 = _722;
  }
  _748 = exp2(log2(_736 * 9.999999747378752e-05f) * 0.1593017578125f);
  _749 = exp2(log2(_737 * 9.999999747378752e-05f) * 0.1593017578125f);
  _750 = exp2(log2(_738 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_748 * 18.6875f) + 1.0f)) * ((_748 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_749 * 18.6875f) + 1.0f)) * ((_749 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_750 * 18.6875f) + 1.0f)) * ((_750 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _240;
  return SV_Target;
}