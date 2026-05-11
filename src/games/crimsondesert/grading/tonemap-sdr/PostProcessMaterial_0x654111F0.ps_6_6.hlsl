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
  float _34;
  float _35;
  float _36;
  float _61;
  float _62;
  float _63;
  uint2 _65;
  float _179;
  float _180;
  float _181;
  float _195;
  float _400;
  float _401;
  float _402;
  float _495;
  float _496;
  float _497;
  float _617;
  float _618;
  float _619;
  float _640;
  float _641;
  float _642;
  float _675;
  float _676;
  float _677;
  float _691;
  float _692;
  float _693;
  float4 _99;
  float _106;
  float _107;
  int _127;
  int _135;
  float _138;
  float _141;
  float _143;
  float _171;
  uint _182;
  float _204;
  float _253;
  float _254;
  float _255;
  float _257;
  float _264;
  float _265;
  float _266;
  float _285;
  float _286;
  float _287;
  float _288;
  float _289;
  float _290;
  float _291;
  float _292;
  float _293;
  float _339;
  float _340;
  float _341;
  float _342;
  float _343;
  float _344;
  float _345;
  float _362;
  float _363;
  float _364;
  float _365;
  float _371;
  float _374;
  float _381;
  float _382;
  float _383;
  float _412;
  float _437;
  float _438;
  float _439;
  float _458;
  float _459;
  float _460;
  float _466;
  float _470;
  float _471;
  float _472;
  float _473;
  float _478;
  float _503;
  float _507;
  float _508;
  float _509;
  float _510;
  int _551;
  float _606;
  float _630;
  float _631;
  float _635;
  float _682;
  float _703;
  float _704;
  float _705;
  float _19[36];
  _24 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _34 = (pow(_24.x, 0.012683313339948654f));
  _35 = (pow(_24.y, 0.012683313339948654f));
  _36 = (pow(_24.z, 0.012683313339948654f));
  _61 = exp2(log2(max(0.0f, (_34 + -0.8359375f)) / (18.8515625f - (_34 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _62 = exp2(log2(max(0.0f, (_35 + -0.8359375f)) / (18.8515625f - (_35 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _63 = exp2(log2(max(0.0f, (_36 + -0.8359375f)) / (18.8515625f - (_36 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_65.x, _65.y);
  if (!(((((uint)(__3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)((int)(_65.x)))))) + 0.5f) * TEXCOORD.x), int((float((int)(int(float((int)((int)(_65.y)))))) + 0.5f) * TEXCOORD.y), 0)))).x) & 255) == 30)) {
    _99 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    _106 = (pow(_99.x, 0.012683313339948654f));
    _107 = (pow(_99.y, 0.012683313339948654f));
    if (!((float((uint)((uint)((((uint)(__3__36__0__0__g_depthOpaque.Load(int3((int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].x) * TEXCOORD.x)), (int)(uint(asfloat(__3__35__0__0__SceneConstantBuffer_raw[4u].y) * TEXCOORD.y)), 0)))).x) & 16777215))) * 5.960465188081798e-08f) > (exp2(log2(max(0.0f, (_107 + -0.8359375f)) / (18.8515625f - (_107 * 18.6875f))) * 6.277394771575928f) * 10000.0f))) {
      _127 = WaveReadLaneFirst(_materialIndex);
      _135 = WaveReadLaneFirst(BindlessParameters_PostProcessOutlineExample[((int)((uint)(select(((uint)_127 < (uint)170000), _127, 0)) + 0u))].BindlessParameters_PostProcessOutlineExample._outlineColor);
      _138 = float((uint)((uint)(((uint)(_135) >> 16) & 255)));
      _141 = float((uint)((uint)(((uint)(_135) >> 8) & 255)));
      _143 = float((uint)((uint)(_135 & 255)));
      _171 = exp2(log2(max(0.0f, (_106 + -0.8359375f)) / (18.8515625f - (_106 * 18.6875f))) * 6.277394771575928f) * 1e+06f;
      _179 = ((select(((_138 * 0.003921568859368563f) < 0.040449999272823334f), (_138 * 0.0003035269910469651f), exp2(log2((_138 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _171) + _61);
      _180 = ((select(((_141 * 0.003921568859368563f) < 0.040449999272823334f), (_141 * 0.0003035269910469651f), exp2(log2((_141 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _171) + _62);
      _181 = ((select(((_143 * 0.003921568859368563f) < 0.040449999272823334f), (_143 * 0.0003035269910469651f), exp2(log2((_143 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _171) + _63);
    } else {
      _179 = _61;
      _180 = _62;
      _181 = _63;
    }
  } else {
    _179 = _61;
    _180 = _62;
    _181 = _63;
  }
  _182 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _195 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _182, 0)))).x) & 127))) + 0.5f);
  } else {
    _195 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_179, _180, _181));
    _617 = output_color.x;
    _618 = output_color.y;
    _619 = output_color.z;
  } else {
    _617 = _179;
    _618 = _180;
    _619 = _181;
  }
  if (_etcParams.y > 1.0f) {
    _630 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _631 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _635 = saturate(1.0f - (dot(float2(_630, _631), float2(_630, _631)) * saturate(_etcParams.y + -1.0f)));
    _640 = (_635 * _617);
    _641 = (_635 * _618);
    _642 = (_635 * _619);
  } else {
    _640 = _617;
    _641 = _618;
    _642 = _619;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _675 = select((_640 <= 0.0031308000907301903f), (_640 * 12.920000076293945f), (((pow(_640, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _676 = select((_641 <= 0.0031308000907301903f), (_641 * 12.920000076293945f), (((pow(_641, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _677 = select((_642 <= 0.0031308000907301903f), (_642 * 12.920000076293945f), (((pow(_642, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _675 = _640;
    _676 = _641;
    _677 = _642;
  }
  if (!(_etcParams.y < 1.0f)) {
    _682 = float((uint)_182);
    if (!(_682 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_682 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _691 = _675;
        _692 = _676;
        _693 = _677;
      } else {
        _691 = 0.0f;
        _692 = 0.0f;
        _693 = 0.0f;
      }
    } else {
      _691 = 0.0f;
      _692 = 0.0f;
      _693 = 0.0f;
    }
  } else {
    _691 = _675;
    _692 = _676;
    _693 = _677;
  }
  _703 = exp2(log2(_691 * 9.999999747378752e-05f) * 0.1593017578125f);
  _704 = exp2(log2(_692 * 9.999999747378752e-05f) * 0.1593017578125f);
  _705 = exp2(log2(_693 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_703 * 18.6875f) + 1.0f)) * ((_703 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_704 * 18.6875f) + 1.0f)) * ((_704 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_705 * 18.6875f) + 1.0f)) * ((_705 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _195;
  return SV_Target;
}