#include "../tonemap.hlsli"

struct PostProcessDrugStruct {
  float _panningSpeed;
  float _changeSpeed;
  float _panningWidth;
  float _distortionScale;
  float _distortionSpeed;
  float _distortionDensity;
  float _blendBias;
  float3 _colorTint;
  float _drugPPIntensity;
  float _centerMaskRadius;
  float _centerMaskHardness;
};


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

cbuffer __3__1__0__0__PostProcessSizeConstant : register(b1, space1) {
  float4 _srcTargetSizeAndInv : packoffset(c000.x);
  float4 _destTargetSizAndInv : packoffset(c001.x);
};

cbuffer __3__1__0__0__PostProcessMaterialIndex : register(b2, space1) {
  int _materialIndex : packoffset(c000.x);
  int _passIndex : packoffset(c000.y);
};

struct BindlessParameters_PostProcessDrug {
  PostProcessDrugStruct BindlessParameters_PostProcessDrug;
};

typedef BindlessParameters_PostProcessDrug BindlessParameters_PostProcessDrug_t;
ConstantBuffer<BindlessParameters_PostProcessDrug_t> BindlessParameters_PostProcessDrug[] : register(b0, space100);

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
  float _26;
  float _27;
  float _36;
  float4 _39;
  float _49;
  float _50;
  float _51;
  float _76;
  float _77;
  float _78;
  int _79;
  float _87;
  int _88;
  float _96;
  float _102;
  float _103;
  int _107;
  float _115;
  int _124;
  float _132;
  int _133;
  float _141;
  int _142;
  float _150;
  float _153;
  float _156;
  float4 _161;
  float4 _172;
  int _178;
  float _186;
  float _191;
  float _192;
  float _199;
  float _200;
  float _201;
  float4 _208;
  float _218;
  float _219;
  float _220;
  float _251;
  int _261;
  float _271;
  float _272;
  float _273;
  int _311;
  float _319;
  int _321;
  float _329;
  int _330;
  float _338;
  float _345;
  float _355;
  float _356;
  float _357;
  uint _358;
  float _372;
  float _577;
  float _578;
  float _579;
  float _672;
  float _673;
  float _674;
  float _794;
  float _795;
  float _796;
  float _817;
  float _818;
  float _819;
  float _852;
  float _853;
  float _854;
  float _868;
  float _869;
  float _870;
  float _381;
  float _430;
  float _431;
  float _432;
  float _434;
  float _441;
  float _442;
  float _443;
  float _462;
  float _463;
  float _464;
  float _465;
  float _466;
  float _467;
  float _468;
  float _469;
  float _470;
  float _516;
  float _517;
  float _518;
  float _519;
  float _520;
  float _521;
  float _522;
  float _539;
  float _540;
  float _541;
  float _542;
  float _548;
  float _551;
  float _558;
  float _559;
  float _560;
  float _589;
  float _614;
  float _615;
  float _616;
  float _635;
  float _636;
  float _637;
  float _643;
  float _647;
  float _648;
  float _649;
  float _650;
  float _655;
  float _680;
  float _684;
  float _685;
  float _686;
  float _687;
  int _728;
  float _783;
  float _807;
  float _808;
  float _812;
  float _859;
  float _880;
  float _881;
  float _882;
  float _18[36];
  _26 = TEXCOORD.x + -0.5f;
  _27 = TEXCOORD.y + -0.5f;
  _36 = saturate(min(((0.5f - abs(_26)) * _srcTargetSizeAndInv.x), ((0.5f - abs(_27)) * _srcTargetSizeAndInv.y)) * 0.05000000074505806f);
  _39 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _49 = (pow(_39.x, 0.012683313339948654f));
  _50 = (pow(_39.y, 0.012683313339948654f));
  _51 = (pow(_39.z, 0.012683313339948654f));
  _76 = exp2(log2(max(0.0f, (_49 + -0.8359375f)) / (18.8515625f - (_49 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _77 = exp2(log2(max(0.0f, (_50 + -0.8359375f)) / (18.8515625f - (_50 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _78 = exp2(log2(max(0.0f, (_51 + -0.8359375f)) / (18.8515625f - (_51 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _79 = WaveReadLaneFirst(_materialIndex);
  _87 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_79 < (uint)170000), _79, 0)) + 0u))].BindlessParameters_PostProcessDrug._distortionDensity);
  _88 = WaveReadLaneFirst(_materialIndex);
  _96 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_88 < (uint)170000), _88, 0)) + 0u))].BindlessParameters_PostProcessDrug._distortionScale);
  _102 = _96 * 0.009999999776482582f;
  _103 = cos(asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) + (_87 * TEXCOORD.x)) * _102;
  _107 = WaveReadLaneFirst(_materialIndex);
  _115 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_107 < (uint)170000), _107, 0)) + 0u))].BindlessParameters_PostProcessDrug._distortionSpeed);
  _124 = WaveReadLaneFirst(_materialIndex);
  _132 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_124 < (uint)170000), _124, 0)) + 0u))].BindlessParameters_PostProcessDrug._panningWidth);
  _133 = WaveReadLaneFirst(_materialIndex);
  _141 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_133 < (uint)170000), _133, 0)) + 0u))].BindlessParameters_PostProcessDrug._blendBias);
  _142 = WaveReadLaneFirst(_materialIndex);
  _150 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_142 < (uint)170000), _142, 0)) + 0u))].BindlessParameters_PostProcessDrug._panningSpeed);
  _153 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * _150;
  _156 = _132 * -0.009999999776482582f;
  _161 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, ((sin(_153 * 0.8975979089736938f) * _156) + TEXCOORD.y)));
  _172 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (((_132 * 0.009999999776482582f) * sin(_153 * 2.094395160675049f)) + TEXCOORD.y)));
  _178 = WaveReadLaneFirst(_materialIndex);
  _186 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_178 < (uint)170000), _178, 0)) + 0u))].BindlessParameters_PostProcessDrug._changeSpeed);
  _191 = min(max((sin(_186 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x)) * 2.0f), 0.0f), 1.0f);
  _192 = _191 * _141;
  _199 = (_192 * (_172.x - _161.x)) + _161.x;
  _200 = (_192 * (_172.y - _161.y)) + _161.y;
  _201 = (_192 * (_172.z - _161.z)) + _161.z;
  _208 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(((sin(_153 * 1.2566370964050293f) * _156) + ((_103 * _36) + TEXCOORD.x)), (((_102 * _36) * sin((_115 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x)) + (((TEXCOORD.y + TEXCOORD.x) + _103) * _87))) + TEXCOORD.y)));
  _218 = (pow(_208.x, 0.012683313339948654f));
  _219 = (pow(_208.y, 0.012683313339948654f));
  _220 = (pow(_208.z, 0.012683313339948654f));
  _251 = min(max((1.0f - _191), 0.0f), 1.0f) * _141;
  _261 = WaveReadLaneFirst(_materialIndex);
  _271 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_261 < (uint)170000), _261, 0)) + 0u))].BindlessParameters_PostProcessDrug._colorTint.x);
  _272 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_261 < (uint)170000), _261, 0)) + 0u))].BindlessParameters_PostProcessDrug._colorTint.y);
  _273 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_261 < (uint)170000), _261, 0)) + 0u))].BindlessParameters_PostProcessDrug._colorTint.z);
  _311 = WaveReadLaneFirst(_materialIndex);
  _319 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_311 < (uint)170000), _311, 0)) + 0u))].BindlessParameters_PostProcessDrug._centerMaskRadius);
  _321 = WaveReadLaneFirst(_materialIndex);
  _329 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_321 < (uint)170000), _321, 0)) + 0u))].BindlessParameters_PostProcessDrug._centerMaskHardness);
  _330 = WaveReadLaneFirst(_materialIndex);
  _338 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_330 < (uint)170000), _330, 0)) + 0u))].BindlessParameters_PostProcessDrug._centerMaskRadius);
  _345 = saturate((sqrt((_27 * _27) + (_26 * _26)) - _319) / max(0.0010000000474974513f, (saturate(_338 * 2.0f) * _329))) * _36;
  _355 = (_345 * ((select((_271 < 0.040449999272823334f), (_271 * 0.07739938050508499f), exp2(log2((_271 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)) * ((_251 * ((exp2(log2(max(0.0f, (_218 + -0.8359375f)) / (18.8515625f - (_218 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _199)) + _199)) - _76)) + _76;
  _356 = (_345 * ((select((_272 < 0.040449999272823334f), (_272 * 0.07739938050508499f), exp2(log2((_272 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)) * ((_251 * ((exp2(log2(max(0.0f, (_219 + -0.8359375f)) / (18.8515625f - (_219 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _200)) + _200)) - _77)) + _77;
  _357 = (_345 * ((select((_273 < 0.040449999272823334f), (_273 * 0.07739938050508499f), exp2(log2((_273 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)) * ((_251 * ((exp2(log2(max(0.0f, (_220 + -0.8359375f)) / (18.8515625f - (_220 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _201)) + _201)) - _78)) + _78;
  _358 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _372 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _358, 0)))).x) & 127))) + 0.5f);
  } else {
    _372 = _postProcessParams.x;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_355, _356, _357));
    _794 = output_color.x;
    _795 = output_color.y;
    _796 = output_color.z;
  } else {
    _794 = _355;
    _795 = _356;
    _796 = _357;
  }
  if (_etcParams.y > 1.0f) {
    _807 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _808 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _812 = saturate(1.0f - (dot(float2(_807, _808), float2(_807, _808)) * saturate(_etcParams.y + -1.0f)));
    _817 = (_812 * _794);
    _818 = (_812 * _795);
    _819 = (_812 * _796);
  } else {
    _817 = _794;
    _818 = _795;
    _819 = _796;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _852 = select((_817 <= 0.0031308000907301903f), (_817 * 12.920000076293945f), (((pow(_817, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _853 = select((_818 <= 0.0031308000907301903f), (_818 * 12.920000076293945f), (((pow(_818, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _854 = select((_819 <= 0.0031308000907301903f), (_819 * 12.920000076293945f), (((pow(_819, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _852 = _817;
    _853 = _818;
    _854 = _819;
  }
  if (!(_etcParams.y < 1.0f)) {
    _859 = float((uint)_358);
    if (!(_859 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_859 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _868 = _852;
        _869 = _853;
        _870 = _854;
      } else {
        _868 = 0.0f;
        _869 = 0.0f;
        _870 = 0.0f;
      }
    } else {
      _868 = 0.0f;
      _869 = 0.0f;
      _870 = 0.0f;
    }
  } else {
    _868 = _852;
    _869 = _853;
    _870 = _854;
  }
  _880 = exp2(log2(_868 * 9.999999747378752e-05f) * 0.1593017578125f);
  _881 = exp2(log2(_869 * 9.999999747378752e-05f) * 0.1593017578125f);
  _882 = exp2(log2(_870 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_880 * 18.6875f) + 1.0f)) * ((_880 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_881 * 18.6875f) + 1.0f)) * ((_881 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_882 * 18.6875f) + 1.0f)) * ((_882 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _372;
  return SV_Target;
}