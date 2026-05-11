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
  int _43;
  float _51;
  int _52;
  float _60;
  float _66;
  float _67;
  int _71;
  float _79;
  int _88;
  float _96;
  int _97;
  float _105;
  int _106;
  float _114;
  float _117;
  float _120;
  float4 _125;
  float4 _136;
  int _142;
  float _150;
  float _155;
  float _156;
  float _163;
  float _164;
  float _165;
  float4 _172;
  float _179;
  int _189;
  float _199;
  float _200;
  float _201;
  int _239;
  float _247;
  int _249;
  float _257;
  int _258;
  float _266;
  float _273;
  float _283;
  float _284;
  float _285;
  uint _286;
  float _300;
  float _505;
  float _506;
  float _507;
  float _600;
  float _601;
  float _602;
  float _722;
  float _723;
  float _724;
  float _745;
  float _746;
  float _747;
  float _780;
  float _781;
  float _782;
  float _796;
  float _797;
  float _798;
  float _309;
  float _358;
  float _359;
  float _360;
  float _362;
  float _369;
  float _370;
  float _371;
  float _390;
  float _391;
  float _392;
  float _393;
  float _394;
  float _395;
  float _396;
  float _397;
  float _398;
  float _444;
  float _445;
  float _446;
  float _447;
  float _448;
  float _449;
  float _450;
  float _467;
  float _468;
  float _469;
  float _470;
  float _476;
  float _479;
  float _486;
  float _487;
  float _488;
  float _517;
  float _542;
  float _543;
  float _544;
  float _563;
  float _564;
  float _565;
  float _571;
  float _575;
  float _576;
  float _577;
  float _578;
  float _583;
  float _608;
  float _612;
  float _613;
  float _614;
  float _615;
  int _656;
  float _711;
  float _735;
  float _736;
  float _740;
  float _787;
  float _18[36];
  _26 = TEXCOORD.x + -0.5f;
  _27 = TEXCOORD.y + -0.5f;
  _36 = saturate(min(((0.5f - abs(_26)) * _srcTargetSizeAndInv.x), ((0.5f - abs(_27)) * _srcTargetSizeAndInv.y)) * 0.05000000074505806f);
  _39 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _43 = WaveReadLaneFirst(_materialIndex);
  _51 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_43 < (uint)170000), _43, 0)) + 0u))].BindlessParameters_PostProcessDrug._distortionDensity);
  _52 = WaveReadLaneFirst(_materialIndex);
  _60 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_52 < (uint)170000), _52, 0)) + 0u))].BindlessParameters_PostProcessDrug._distortionScale);
  _66 = _60 * 0.009999999776482582f;
  _67 = cos(asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) + (_51 * TEXCOORD.x)) * _66;
  _71 = WaveReadLaneFirst(_materialIndex);
  _79 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_71 < (uint)170000), _71, 0)) + 0u))].BindlessParameters_PostProcessDrug._distortionSpeed);
  _88 = WaveReadLaneFirst(_materialIndex);
  _96 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_88 < (uint)170000), _88, 0)) + 0u))].BindlessParameters_PostProcessDrug._panningWidth);
  _97 = WaveReadLaneFirst(_materialIndex);
  _105 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_97 < (uint)170000), _97, 0)) + 0u))].BindlessParameters_PostProcessDrug._blendBias);
  _106 = WaveReadLaneFirst(_materialIndex);
  _114 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_106 < (uint)170000), _106, 0)) + 0u))].BindlessParameters_PostProcessDrug._panningSpeed);
  _117 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * _114;
  _120 = _96 * -0.009999999776482582f;
  _125 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, ((sin(_117 * 0.8975979089736938f) * _120) + TEXCOORD.y)));
  _136 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (((_96 * 0.009999999776482582f) * sin(_117 * 2.094395160675049f)) + TEXCOORD.y)));
  _142 = WaveReadLaneFirst(_materialIndex);
  _150 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_142 < (uint)170000), _142, 0)) + 0u))].BindlessParameters_PostProcessDrug._changeSpeed);
  _155 = min(max((sin(_150 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x)) * 2.0f), 0.0f), 1.0f);
  _156 = _155 * _105;
  _163 = (_156 * (_136.x - _125.x)) + _125.x;
  _164 = (_156 * (_136.y - _125.y)) + _125.y;
  _165 = (_156 * (_136.z - _125.z)) + _125.z;
  _172 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(((sin(_117 * 1.2566370964050293f) * _120) + ((_67 * _36) + TEXCOORD.x)), (((_66 * _36) * sin((_79 * asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x)) + (((TEXCOORD.y + TEXCOORD.x) + _67) * _51))) + TEXCOORD.y)));
  _179 = min(max((1.0f - _155), 0.0f), 1.0f) * _105;
  _189 = WaveReadLaneFirst(_materialIndex);
  _199 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_189 < (uint)170000), _189, 0)) + 0u))].BindlessParameters_PostProcessDrug._colorTint.x);
  _200 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_189 < (uint)170000), _189, 0)) + 0u))].BindlessParameters_PostProcessDrug._colorTint.y);
  _201 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_189 < (uint)170000), _189, 0)) + 0u))].BindlessParameters_PostProcessDrug._colorTint.z);
  _239 = WaveReadLaneFirst(_materialIndex);
  _247 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_239 < (uint)170000), _239, 0)) + 0u))].BindlessParameters_PostProcessDrug._centerMaskRadius);
  _249 = WaveReadLaneFirst(_materialIndex);
  _257 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_249 < (uint)170000), _249, 0)) + 0u))].BindlessParameters_PostProcessDrug._centerMaskHardness);
  _258 = WaveReadLaneFirst(_materialIndex);
  _266 = WaveReadLaneFirst(BindlessParameters_PostProcessDrug[((int)((uint)(select(((uint)_258 < (uint)170000), _258, 0)) + 0u))].BindlessParameters_PostProcessDrug._centerMaskRadius);
  _273 = saturate((sqrt((_27 * _27) + (_26 * _26)) - _247) / max(0.0010000000474974513f, (saturate(_266 * 2.0f) * _257))) * _36;
  _283 = (_273 * ((select((_199 < 0.040449999272823334f), (_199 * 0.07739938050508499f), exp2(log2((_199 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)) * ((_179 * (_172.x - _163)) + _163)) - _39.x)) + _39.x;
  _284 = (_273 * ((select((_200 < 0.040449999272823334f), (_200 * 0.07739938050508499f), exp2(log2((_200 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)) * ((_179 * (_172.y - _164)) + _164)) - _39.y)) + _39.y;
  _285 = (_273 * ((select((_201 < 0.040449999272823334f), (_201 * 0.07739938050508499f), exp2(log2((_201 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)) * ((_179 * (_172.z - _165)) + _165)) - _39.z)) + _39.z;
  _286 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _300 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _286, 0)))).x) & 127))) + 0.5f);
  } else {
    _300 = _postProcessParams.x;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_283, _284, _285));
    _722 = output_color.x;
    _723 = output_color.y;
    _724 = output_color.z;
  } else {
    _722 = _283;
    _723 = _284;
    _724 = _285;
  }
  if (_etcParams.y > 1.0f) {
    _735 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _736 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _740 = saturate(1.0f - (dot(float2(_735, _736), float2(_735, _736)) * saturate(_etcParams.y + -1.0f)));
    _745 = (_740 * _722);
    _746 = (_740 * _723);
    _747 = (_740 * _724);
  } else {
    _745 = _722;
    _746 = _723;
    _747 = _724;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _780 = select((_745 <= 0.0031308000907301903f), (_745 * 12.920000076293945f), (((pow(_745, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _781 = select((_746 <= 0.0031308000907301903f), (_746 * 12.920000076293945f), (((pow(_746, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _782 = select((_747 <= 0.0031308000907301903f), (_747 * 12.920000076293945f), (((pow(_747, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _780 = _745;
    _781 = _746;
    _782 = _747;
  }
  if (!(_etcParams.y < 1.0f)) {
    _787 = float((uint)_286);
    if (!(_787 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_787 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _796 = _780;
        _797 = _781;
        _798 = _782;
      } else {
        _796 = 0.0f;
        _797 = 0.0f;
        _798 = 0.0f;
      }
    } else {
      _796 = 0.0f;
      _797 = 0.0f;
      _798 = 0.0f;
    }
  } else {
    _796 = _780;
    _797 = _781;
    _798 = _782;
  }
  SV_Target.x = _796;
  SV_Target.y = _797;
  SV_Target.z = _798;
  SV_Target.w = _300;
  return SV_Target;
}