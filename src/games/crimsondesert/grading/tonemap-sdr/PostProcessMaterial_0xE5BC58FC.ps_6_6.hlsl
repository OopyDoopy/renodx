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
  int _35;
  float _43;
  float _154;
  float _155;
  float _156;
  float _170;
  float _375;
  float _376;
  float _377;
  float _470;
  float _471;
  float _472;
  float _592;
  float _593;
  float _594;
  float _615;
  float _616;
  float _617;
  float _650;
  float _651;
  float _652;
  float _666;
  float _667;
  float _668;
  float _47;
  int _54;
  int _62;
  int _71;
  float _79;
  int _80;
  float _88;
  float _90;
  float _93;
  float _94;
  int _128;
  float _136;
  float _137;
  float4 _140;
  uint _157;
  float _179;
  float _228;
  float _229;
  float _230;
  float _232;
  float _239;
  float _240;
  float _241;
  float _260;
  float _261;
  float _262;
  float _263;
  float _264;
  float _265;
  float _266;
  float _267;
  float _268;
  float _314;
  float _315;
  float _316;
  float _317;
  float _318;
  float _319;
  float _320;
  float _337;
  float _338;
  float _339;
  float _340;
  float _346;
  float _349;
  float _356;
  float _357;
  float _358;
  float _387;
  float _412;
  float _413;
  float _414;
  float _433;
  float _434;
  float _435;
  float _441;
  float _445;
  float _446;
  float _447;
  float _448;
  float _453;
  float _478;
  float _482;
  float _483;
  float _484;
  float _485;
  int _526;
  float _581;
  float _605;
  float _606;
  float _610;
  float _657;
  float _22[36];
  _31 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _35 = WaveReadLaneFirst(_materialIndex);
  _43 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_35 < (uint)170000), _35, 0)) + 0u))].BindlessParameters_PostProcessGhost_CD._ghostFXRatio);
  if (!(_43 < 0.0010000000474974513f)) {
    _47 = 4.0f / (_srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y);
    _54 = WaveReadLaneFirst(_materialIndex);
    _62 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_54 < (uint)170000), _54, 0)) + 0u))].BindlessParameters_PostProcessGhost_CD._ghostNoiseTex);
    _71 = WaveReadLaneFirst(_materialIndex);
    _79 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_71 < (uint)170000), _71, 0)) + 0u))].BindlessParameters_PostProcessGhost_CD._ghostFXRatio);
    _80 = WaveReadLaneFirst(_materialIndex);
    _88 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_80 < (uint)170000), _80, 0)) + 0u))].BindlessParameters_PostProcessGhost_CD._ghostNoiseIntensity);
    _90 = _88 * (_79 * (((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_62 < (uint)65000), _62, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((TEXCOORD.x * 3.0f) * _47), ((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.30000001192092896f) + (_47 * TEXCOORD.y)))))).y));
    _93 = (_90 * 0.009999999776482582f) + TEXCOORD.x;
    _94 = (_90 * 0.05000000074505806f) + TEXCOORD.y;
    _128 = WaveReadLaneFirst(_materialIndex);
    _136 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_128 < (uint)170000), _128, 0)) + 0u))].BindlessParameters_PostProcessGhost_CD._ghostFXRatio);
    _137 = _136 * saturate(ceil(((asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, (float((uint)((uint)((((uint)(__3__36__0__0__g_depthOpaque.Load(int3((int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * _93)), (int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * _94)), 0)))).x) & 16777215))) * 5.960465188081798e-08f))) + 0.05000000074505806f) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[134u].x) / max(1.0000000116860974e-07f, (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * _93), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * _94), 0)))).x)))));
    _140 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    _154 = (lerp(_31.x, _140.x, _137));
    _155 = (lerp(_31.y, _140.y, _137));
    _156 = (lerp(_31.z, _140.z, _137));
  } else {
    _154 = _31.x;
    _155 = _31.y;
    _156 = _31.z;
  }
  _157 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _170 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _157, 0)))).x) & 127))) + 0.5f);
  } else {
    _170 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_154, _155, _156));
    _592 = output_color.x;
    _593 = output_color.y;
    _594 = output_color.z;
  } else {
    _592 = _154;
    _593 = _155;
    _594 = _156;
  }
  if (_etcParams.y > 1.0f) {
    _605 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _606 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _610 = saturate(1.0f - (dot(float2(_605, _606), float2(_605, _606)) * saturate(_etcParams.y + -1.0f)));
    _615 = (_610 * _592);
    _616 = (_610 * _593);
    _617 = (_610 * _594);
  } else {
    _615 = _592;
    _616 = _593;
    _617 = _594;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _650 = select((_615 <= 0.0031308000907301903f), (_615 * 12.920000076293945f), (((pow(_615, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _651 = select((_616 <= 0.0031308000907301903f), (_616 * 12.920000076293945f), (((pow(_616, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _652 = select((_617 <= 0.0031308000907301903f), (_617 * 12.920000076293945f), (((pow(_617, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _650 = _615;
    _651 = _616;
    _652 = _617;
  }
  if (!(_etcParams.y < 1.0f)) {
    _657 = float((uint)_157);
    if (!(_657 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_657 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _666 = _650;
        _667 = _651;
        _668 = _652;
      } else {
        _666 = 0.0f;
        _667 = 0.0f;
        _668 = 0.0f;
      }
    } else {
      _666 = 0.0f;
      _667 = 0.0f;
      _668 = 0.0f;
    }
  } else {
    _666 = _650;
    _667 = _651;
    _668 = _652;
  }
  SV_Target.x = _666;
  SV_Target.y = _667;
  SV_Target.z = _668;
  SV_Target.w = _170;
  return SV_Target;
}