#include "../tonemap.hlsli"

struct PostProcessOutlineExampleStruct {
  uint _outlineColor;
  float _outlineSize;
};


Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t36, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t29, space36);

Texture2D<uint> __3__36__0__0__g_CustomRenderPassValue : register(t69, space36);

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
  float _264;
  float _265;
  float _266;
  float _280;
  float _485;
  float _486;
  float _487;
  float _580;
  float _581;
  float _582;
  float _702;
  float _703;
  float _704;
  float _725;
  float _726;
  float _727;
  float _760;
  float _761;
  float _762;
  float _776;
  float _777;
  float _778;
  uint2 _28;
  bool _56;
  float _58;
  int _65;
  float _73;
  float4 _76;
  float _79;
  float _80;
  float4 _82;
  float4 _86;
  float _89;
  float4 _91;
  float4 _95;
  int _116;
  float _124;
  float4 _127;
  float _130;
  float _131;
  float4 _133;
  float4 _137;
  float _140;
  float4 _142;
  float4 _146;
  int _167;
  float _175;
  float4 _178;
  float _181;
  float _182;
  float4 _184;
  float4 _188;
  float _191;
  float4 _193;
  float4 _197;
  int _218;
  float _226;
  float4 _229;
  float _232;
  float _233;
  float4 _235;
  float4 _239;
  float _242;
  float4 _244;
  float4 _248;
  uint _267;
  float _289;
  float _338;
  float _339;
  float _340;
  float _342;
  float _349;
  float _350;
  float _351;
  float _370;
  float _371;
  float _372;
  float _373;
  float _374;
  float _375;
  float _376;
  float _377;
  float _378;
  float _424;
  float _425;
  float _426;
  float _427;
  float _428;
  float _429;
  float _430;
  float _447;
  float _448;
  float _449;
  float _450;
  float _456;
  float _459;
  float _466;
  float _467;
  float _468;
  float _497;
  float _522;
  float _523;
  float _524;
  float _543;
  float _544;
  float _545;
  float _551;
  float _555;
  float _556;
  float _557;
  float _558;
  float _563;
  float _588;
  float _592;
  float _593;
  float _594;
  float _595;
  int _636;
  float _691;
  float _715;
  float _716;
  float _720;
  float _767;
  float _20[36];
  if (_passIndex == 0) {
    __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_28.x, _28.y);
    _56 = (((((uint)(__3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)((int)(_28.x)))))) + 0.5f) * TEXCOORD.x), int((float((int)(int(float((int)((int)(_28.y)))))) + 0.5f) * TEXCOORD.y), 0)))).x) & 255) == 30);
    _58 = select(_56, (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * TEXCOORD.x), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * TEXCOORD.y), 0)))).x), 0.0f);
    _264 = select(_56, 1.0f, 0.0f);
    _265 = _58;
    _266 = _58;
  } else {
    if (_passIndex == 1) {
      _65 = WaveReadLaneFirst(_materialIndex);
      _73 = WaveReadLaneFirst(BindlessParameters_PostProcessOutlineExample[((int)((uint)(select(((uint)_65 < (uint)170000), _65, 0)) + 0u))].BindlessParameters_PostProcessOutlineExample._outlineSize);
      _76 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
      _79 = _73 * (1.0f / _destTargetSizAndInv.x);
      _80 = _79 * 1.384615421295166f;
      _82 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_80 + TEXCOORD.x), TEXCOORD.y));
      _86 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _80), TEXCOORD.y));
      _89 = _79 * 3.230769157409668f;
      _91 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_89 + TEXCOORD.x), TEXCOORD.y));
      _95 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _89), TEXCOORD.y));
      _264 = ((((_86.x + _82.x) * 0.31621623039245605f) + (_76.x * 0.227027028799057f)) + ((_95.x + _91.x) * 0.07027027010917664f));
      _265 = max(max(max(max(max(0.0f, _76.y), _82.y), _86.y), _91.y), _95.y);
      _266 = 0.0f;
    } else {
      if (_passIndex == 2) {
        _116 = WaveReadLaneFirst(_materialIndex);
        _124 = WaveReadLaneFirst(BindlessParameters_PostProcessOutlineExample[((int)((uint)(select(((uint)_116 < (uint)170000), _116, 0)) + 0u))].BindlessParameters_PostProcessOutlineExample._outlineSize);
        _127 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
        _130 = _124 * (1.0f / _destTargetSizAndInv.y);
        _131 = _130 * 1.384615421295166f;
        _133 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (_131 + TEXCOORD.y)));
        _137 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (TEXCOORD.y - _131)));
        _140 = _130 * 3.230769157409668f;
        _142 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (_140 + TEXCOORD.y)));
        _146 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (TEXCOORD.y - _140)));
        _264 = ((((_137.x + _133.x) * 0.31621623039245605f) + (_127.x * 0.227027028799057f)) + ((_146.x + _142.x) * 0.07027027010917664f));
        _265 = max(max(max(max(max(0.0f, _127.y), _133.y), _137.y), _142.y), _146.y);
        _266 = 0.0f;
      } else {
        if (_passIndex == 3) {
          _167 = WaveReadLaneFirst(_materialIndex);
          _175 = WaveReadLaneFirst(BindlessParameters_PostProcessOutlineExample[((int)((uint)(select(((uint)_167 < (uint)170000), _167, 0)) + 0u))].BindlessParameters_PostProcessOutlineExample._outlineSize);
          _178 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
          _181 = _175 * (1.0f / _destTargetSizAndInv.x);
          _182 = _181 * 1.384615421295166f;
          _184 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_182 + TEXCOORD.x), TEXCOORD.y));
          _188 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _182), TEXCOORD.y));
          _191 = _181 * 3.230769157409668f;
          _193 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_191 + TEXCOORD.x), TEXCOORD.y));
          _197 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _191), TEXCOORD.y));
          _264 = ((((_188.x + _184.x) * 0.31621623039245605f) + (_178.x * 0.227027028799057f)) + ((_197.x + _193.x) * 0.07027027010917664f));
          _265 = max(max(max(max(max(0.0f, _178.y), _184.y), _188.y), _193.y), _197.y);
          _266 = 0.0f;
        } else {
          if (_passIndex == 4) {
            _218 = WaveReadLaneFirst(_materialIndex);
            _226 = WaveReadLaneFirst(BindlessParameters_PostProcessOutlineExample[((int)((uint)(select(((uint)_218 < (uint)170000), _218, 0)) + 0u))].BindlessParameters_PostProcessOutlineExample._outlineSize);
            _229 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
            _232 = _226 * (1.0f / _destTargetSizAndInv.y);
            _233 = _232 * 1.384615421295166f;
            _235 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (_233 + TEXCOORD.y)));
            _239 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (TEXCOORD.y - _233)));
            _242 = _232 * 3.230769157409668f;
            _244 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (_242 + TEXCOORD.y)));
            _248 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (TEXCOORD.y - _242)));
            _264 = ((((_239.x + _235.x) * 0.31621623039245605f) + (_229.x * 0.227027028799057f)) + ((_248.x + _244.x) * 0.07027027010917664f));
            _265 = max(max(max(max(max(0.0f, _229.y), _235.y), _239.y), _244.y), _248.y);
            _266 = 0.0f;
          } else {
            _264 = 0.0f;
            _265 = 0.0f;
            _266 = 0.0f;
          }
        }
      }
    }
  }
  _267 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _280 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _267, 0)))).x) & 127))) + 0.5f);
  } else {
    _280 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_264, _265, _266));
    _702 = output_color.x;
    _703 = output_color.y;
    _704 = output_color.z;
  } else {
    _702 = _264;
    _703 = _265;
    _704 = _266;
  }
  if (_etcParams.y > 1.0f) {
    _715 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _716 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _720 = saturate(1.0f - (dot(float2(_715, _716), float2(_715, _716)) * saturate(_etcParams.y + -1.0f)));
    _725 = (_720 * _702);
    _726 = (_720 * _703);
    _727 = (_720 * _704);
  } else {
    _725 = _702;
    _726 = _703;
    _727 = _704;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _760 = select((_725 <= 0.0031308000907301903f), (_725 * 12.920000076293945f), (((pow(_725, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _761 = select((_726 <= 0.0031308000907301903f), (_726 * 12.920000076293945f), (((pow(_726, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _762 = select((_727 <= 0.0031308000907301903f), (_727 * 12.920000076293945f), (((pow(_727, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _760 = _725;
    _761 = _726;
    _762 = _727;
  }
  if (!(_etcParams.y < 1.0f)) {
    _767 = float((uint)_267);
    if (!(_767 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_767 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _776 = _760;
        _777 = _761;
        _778 = _762;
      } else {
        _776 = 0.0f;
        _777 = 0.0f;
        _778 = 0.0f;
      }
    } else {
      _776 = 0.0f;
      _777 = 0.0f;
      _778 = 0.0f;
    }
  } else {
    _776 = _760;
    _777 = _761;
    _778 = _762;
  }
  SV_Target.x = _776;
  SV_Target.y = _777;
  SV_Target.z = _778;
  SV_Target.w = _280;
  return SV_Target;
}