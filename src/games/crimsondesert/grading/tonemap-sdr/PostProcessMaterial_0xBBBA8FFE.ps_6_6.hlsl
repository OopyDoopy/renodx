#include "../tonemap.hlsli"

struct PostProcessDamageStruct {
  uint _bloodColor;
  float _bloodRatio;
  uint _dirtTexture;
  uint _dirtMaskTexture;
  float _dirtRatio1;
  float _dirtRatio2;
  float _dirtRatio3;
  uint _waterNormalTexture;
  uint _waterMaskTexture;
  float _waterRatio1;
  float _waterRatio2;
  float _waterRatio3;
  float _isDead;
  float _isBloodEffect;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

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

struct BindlessParameters_PostProcessDamage {
  PostProcessDamageStruct BindlessParameters_PostProcessDamage;
};

typedef BindlessParameters_PostProcessDamage BindlessParameters_PostProcessDamage_t;
ConstantBuffer<BindlessParameters_PostProcessDamage_t> BindlessParameters_PostProcessDamage[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  int _21;
  int _29;
  float4 _36;
  int _39;
  int _47;
  float4 _54;
  int _58;
  float _66;
  int _67;
  float _75;
  int _76;
  float _84;
  float _85;
  float4 _98;
  float _108;
  float _109;
  float _110;
  float _135;
  float _136;
  float _137;
  int _138;
  float _146;
  float _147;
  float _154;
  float _155;
  float _156;
  float _159;
  float _162;
  int _166;
  int _174;
  float _177;
  float _180;
  float _182;
  float _207;
  int _210;
  float _218;
  bool _224;
  float _225;
  int _229;
  int _237;
  float4 _244;
  int _249;
  int _257;
  float4 _264;
  int _268;
  float _276;
  int _277;
  float _285;
  int _286;
  float _294;
  float _296;
  float _303;
  float _304;
  float _305;
  int _306;
  float _314;
  float _315;
  float _325;
  float _326;
  float _327;
  uint _328;
  float _342;
  float _547;
  float _548;
  float _549;
  float _642;
  float _643;
  float _644;
  float _764;
  float _765;
  float _766;
  float _781;
  float _782;
  float _783;
  float _816;
  float _817;
  float _818;
  float _832;
  float _833;
  float _834;
  float _351;
  float _400;
  float _401;
  float _402;
  float _404;
  float _411;
  float _412;
  float _413;
  float _432;
  float _433;
  float _434;
  float _435;
  float _436;
  float _437;
  float _438;
  float _439;
  float _440;
  float _486;
  float _487;
  float _488;
  float _489;
  float _490;
  float _491;
  float _492;
  float _509;
  float _510;
  float _511;
  float _512;
  float _518;
  float _521;
  float _528;
  float _529;
  float _530;
  float _559;
  float _584;
  float _585;
  float _586;
  float _605;
  float _606;
  float _607;
  float _613;
  float _617;
  float _618;
  float _619;
  float _620;
  float _625;
  float _650;
  float _654;
  float _655;
  float _656;
  float _657;
  int _698;
  float _753;
  float _776;
  float _823;
  float _844;
  float _845;
  float _846;
  float _16[36];
  _21 = WaveReadLaneFirst(_materialIndex);
  _29 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_21 < (uint)170000), _21, 0)) + 0u))].BindlessParameters_PostProcessDamage._waterNormalTexture);
  _36 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_29 < (uint)65000), _29, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _39 = WaveReadLaneFirst(_materialIndex);
  _47 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_39 < (uint)170000), _39, 0)) + 0u))].BindlessParameters_PostProcessDamage._waterMaskTexture);
  _54 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_47 < (uint)65000), _47, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _58 = WaveReadLaneFirst(_materialIndex);
  _66 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_58 < (uint)170000), _58, 0)) + 0u))].BindlessParameters_PostProcessDamage._waterRatio1);
  _67 = WaveReadLaneFirst(_materialIndex);
  _75 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_67 < (uint)170000), _67, 0)) + 0u))].BindlessParameters_PostProcessDamage._waterRatio2);
  _76 = WaveReadLaneFirst(_materialIndex);
  _84 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_76 < (uint)170000), _76, 0)) + 0u))].BindlessParameters_PostProcessDamage._waterRatio3);
  _85 = dot(float3(_54.x, _54.y, _54.z), float3(_66, _75, _84));
  _98 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(abs((_85 * ((_36.x * 0.20000000298023224f) + -0.09960784763097763f)) + TEXCOORD.x), abs(TEXCOORD.y - (_85 * ((_36.y * 0.20000000298023224f) + -0.09960784763097763f)))));
  _108 = (pow(_98.x, 0.012683313339948654f));
  _109 = (pow(_98.y, 0.012683313339948654f));
  _110 = (pow(_98.z, 0.012683313339948654f));
  _135 = exp2(log2(max(0.0f, (_108 + -0.8359375f)) / (18.8515625f - (_108 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _136 = exp2(log2(max(0.0f, (_109 + -0.8359375f)) / (18.8515625f - (_109 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _137 = exp2(log2(max(0.0f, (_110 + -0.8359375f)) / (18.8515625f - (_110 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _138 = WaveReadLaneFirst(_materialIndex);
  _146 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_138 < (uint)170000), _138, 0)) + 0u))].BindlessParameters_PostProcessDamage._isDead);
  _147 = dot(float3(_135, _136, _137), float3(0.26269999146461487f, 0.6779999732971191f, 0.059300001710653305f));
  _154 = ((_147 - _135) * _146) + _135;
  _155 = ((_147 - _136) * _146) + _136;
  _156 = ((_147 - _137) * _146) + _137;
  _159 = abs((TEXCOORD.x * 2.0f) + -1.0f);
  _162 = abs((TEXCOORD.y * 2.0f) + -1.0f);
  _166 = WaveReadLaneFirst(_materialIndex);
  _174 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_166 < (uint)170000), _166, 0)) + 0u))].BindlessParameters_PostProcessDamage._bloodColor);
  _177 = float((uint)((uint)(((uint)(_174) >> 16) & 255)));
  _180 = float((uint)((uint)(((uint)(_174) >> 8) & 255)));
  _182 = float((uint)((uint)(_174 & 255)));
  _207 = select(((_177 * 0.003921568859368563f) < 0.040449999272823334f), (_177 * 0.0003035269910469651f), exp2(log2((_177 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
  _210 = WaveReadLaneFirst(_materialIndex);
  _218 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_210 < (uint)170000), _210, 0)) + 0u))].BindlessParameters_PostProcessDamage._isBloodEffect);
  _224 = (_218 > 0.0010000000474974513f) && ((asint(__3__35__0__0__SceneConstantBuffer_raw[171u].w) & 1) == 0);
  _225 = _207 * 0.4000000059604645f;
  _229 = WaveReadLaneFirst(_materialIndex);
  _237 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_229 < (uint)170000), _229, 0)) + 0u))].BindlessParameters_PostProcessDamage._dirtTexture);
  _244 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_237 < (uint)65000), _237, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _249 = WaveReadLaneFirst(_materialIndex);
  _257 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_249 < (uint)170000), _249, 0)) + 0u))].BindlessParameters_PostProcessDamage._dirtMaskTexture);
  _264 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_257 < (uint)65000), _257, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _268 = WaveReadLaneFirst(_materialIndex);
  _276 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_268 < (uint)170000), _268, 0)) + 0u))].BindlessParameters_PostProcessDamage._dirtRatio1);
  _277 = WaveReadLaneFirst(_materialIndex);
  _285 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_277 < (uint)170000), _277, 0)) + 0u))].BindlessParameters_PostProcessDamage._dirtRatio2);
  _286 = WaveReadLaneFirst(_materialIndex);
  _294 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_286 < (uint)170000), _286, 0)) + 0u))].BindlessParameters_PostProcessDamage._dirtRatio3);
  _296 = dot(float3(_264.x, _264.y, _264.z), float3(_276, _285, _294)) * _244.w;
  _303 = (_296 * (_244.x - _154)) + _154;
  _304 = (_296 * (_244.y - _155)) + _155;
  _305 = (_296 * (_244.z - _156)) + _156;
  _306 = WaveReadLaneFirst(_materialIndex);
  _314 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_306 < (uint)170000), _306, 0)) + 0u))].BindlessParameters_PostProcessDamage._bloodRatio);
  _315 = _314 * max((_159 * _159), (_162 * _162));
  _325 = _303 - ((_303 * (1.0f - select(_224, _225, _207))) * _315);
  _326 = _304 - ((_304 * (1.0f - select(_224, _225, select(((_180 * 0.003921568859368563f) < 0.040449999272823334f), (_180 * 0.0003035269910469651f), exp2(log2((_180 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))))) * _315);
  _327 = _305 - ((_305 * (1.0f - select(_224, _225, select(((_182 * 0.003921568859368563f) < 0.040449999272823334f), (_182 * 0.0003035269910469651f), exp2(log2((_182 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))))) * _315);
  _328 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _342 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _328, 0)))).x) & 127))) + 0.5f);
  } else {
    _342 = _postProcessParams.x;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_325, _326, _327));
    _764 = output_color.x;
    _765 = output_color.y;
    _766 = output_color.z;
  } else {
    _764 = _325;
    _765 = _326;
    _766 = _327;
  }
  if (_etcParams.y > 1.0f) {
    _776 = saturate(1.0f - (dot(float2(_159, _162), float2(_159, _162)) * saturate(_etcParams.y + -1.0f)));
    _781 = (_776 * _764);
    _782 = (_776 * _765);
    _783 = (_776 * _766);
  } else {
    _781 = _764;
    _782 = _765;
    _783 = _766;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _816 = select((_781 <= 0.0031308000907301903f), (_781 * 12.920000076293945f), (((pow(_781, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _817 = select((_782 <= 0.0031308000907301903f), (_782 * 12.920000076293945f), (((pow(_782, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _818 = select((_783 <= 0.0031308000907301903f), (_783 * 12.920000076293945f), (((pow(_783, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _816 = _781;
    _817 = _782;
    _818 = _783;
  }
  if (!(_etcParams.y < 1.0f)) {
    _823 = float((uint)_328);
    if (!(_823 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_823 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _832 = _816;
        _833 = _817;
        _834 = _818;
      } else {
        _832 = 0.0f;
        _833 = 0.0f;
        _834 = 0.0f;
      }
    } else {
      _832 = 0.0f;
      _833 = 0.0f;
      _834 = 0.0f;
    }
  } else {
    _832 = _816;
    _833 = _817;
    _834 = _818;
  }
  _844 = exp2(log2(_832 * 9.999999747378752e-05f) * 0.1593017578125f);
  _845 = exp2(log2(_833 * 9.999999747378752e-05f) * 0.1593017578125f);
  _846 = exp2(log2(_834 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_844 * 18.6875f) + 1.0f)) * ((_844 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_845 * 18.6875f) + 1.0f)) * ((_845 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_846 * 18.6875f) + 1.0f)) * ((_846 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _342;
  return SV_Target;
}