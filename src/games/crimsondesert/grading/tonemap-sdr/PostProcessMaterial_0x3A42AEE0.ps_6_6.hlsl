#include "../tonemap.hlsli"

struct PostProcessAbyssEnter_CDStruct {
  float _scanRadius;
  float _startFade;
  uint _noiseTex;
  uint _noiseTex2;
  uint _effectType;
  float _ppAbyssEnterRatio;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t36, space36);

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

struct BindlessParameters_PostProcessAbyssEnter_CD {
  PostProcessAbyssEnter_CDStruct BindlessParameters_PostProcessAbyssEnter_CD;
};

typedef BindlessParameters_PostProcessAbyssEnter_CD BindlessParameters_PostProcessAbyssEnter_CD_t;
ConstantBuffer<BindlessParameters_PostProcessAbyssEnter_CD_t> BindlessParameters_PostProcessAbyssEnter_CD[] : register(b0, space100);

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
  int _37;
  int _45;
  float _82;
  float _83;
  float _84;
  float _85;
  float _113;
  float _114;
  float _115;
  float _116;
  float _117;
  float _118;
  float _231;
  float _232;
  float _233;
  float _234;
  float _235;
  float _236;
  float _283;
  float _284;
  float _285;
  float _299;
  float _504;
  float _505;
  float _506;
  float _599;
  float _600;
  float _601;
  float _721;
  float _722;
  float _723;
  float _744;
  float _745;
  float _746;
  float _779;
  float _780;
  float _781;
  float _795;
  float _796;
  float _797;
  float _48;
  int _57;
  int _65;
  float4 _72;
  float _75;
  float _77;
  float _78;
  float _79;
  float _80;
  float _97;
  float _101;
  float4 _106;
  float _123;
  float _124;
  float _125;
  float _126;
  float _135;
  float _136;
  float _138;
  float _153;
  float _154;
  float _155;
  float _161;
  float _166;
  int _173;
  float _181;
  float _182;
  int _190;
  int _198;
  float4 _203;
  float _205;
  float _209;
  float _210;
  float _224;
  float _229;
  float _241;
  float _242;
  float _243;
  float _244;
  float _253;
  float _254;
  float _256;
  float _274;
  float _275;
  float _276;
  float _279;
  uint _286;
  float _308;
  float _357;
  float _358;
  float _359;
  float _361;
  float _368;
  float _369;
  float _370;
  float _389;
  float _390;
  float _391;
  float _392;
  float _393;
  float _394;
  float _395;
  float _396;
  float _397;
  float _443;
  float _444;
  float _445;
  float _446;
  float _447;
  float _448;
  float _449;
  float _466;
  float _467;
  float _468;
  float _469;
  float _475;
  float _478;
  float _485;
  float _486;
  float _487;
  float _516;
  float _541;
  float _542;
  float _543;
  float _562;
  float _563;
  float _564;
  float _570;
  float _574;
  float _575;
  float _576;
  float _577;
  float _582;
  float _607;
  float _611;
  float _612;
  float _613;
  float _614;
  int _655;
  float _710;
  float _734;
  float _735;
  float _739;
  float _786;
  float _20[36];
  _37 = WaveReadLaneFirst(_materialIndex);
  _45 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnter_CD[((int)((uint)(select(((uint)_37 < (uint)170000), _37, 0)) + 0u))].BindlessParameters_PostProcessAbyssEnter_CD._effectType);
  if (_45 == 0) {
    _48 = 4.0f / (_srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y);
    _57 = WaveReadLaneFirst(_materialIndex);
    _65 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnter_CD[((int)((uint)(select(((uint)_57 < (uint)170000), _57, 0)) + 0u))].BindlessParameters_PostProcessAbyssEnter_CD._noiseTex);
    _72 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_65 < (uint)65000), _65, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((_48 * TEXCOORD.x) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.2199999988079071f)), ((_48 * TEXCOORD.y) - (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.18000000715255737f))));
    _75 = _72.x + -0.30000001192092896f;
    _77 = ((_72.x + -0.4000000059604645f) * 10.471975326538086f) + -1.5707963705062866f;
    _78 = sin(_77);
    _79 = cos(_77);
    _80 = _75 * 0.029999999329447746f;
    _82 = _80;
    _83 = _80;
    _84 = 0.0f;
    _85 = -1.0f;
    while(true) {
      _97 = ((((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - ((_82 * _78) * _85)), (TEXCOORD.y - ((_83 * _79) * _85)))))).w) * 0.20000000298023224f) + _84;
      _101 = _85 + 0.20000000298023224f;
      if (!(_101 > 1.0f)) {
        _82 = (_82 * 1.0099999904632568f);
        _83 = (_83 * 1.0099999904632568f);
        _84 = (_97 * 0.8999999761581421f);
        _85 = _101;
        continue;
      }
      _106 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
      if ((_97 * 0.5400000214576721f) > 0.0f) {
        _113 = _80;
        _114 = _80;
        _115 = 0.0f;
        _116 = 0.0f;
        _117 = 0.0f;
        _118 = -1.0f;
        while(true) {
          _123 = TEXCOORD.x - ((_113 * _78) * _118);
          _124 = TEXCOORD.y - ((_114 * _79) * _118);
          _125 = _123 + -0.5f;
          _126 = _124 + -0.5f;
          _135 = rsqrt(dot(float2(_125, _126), float2(_125, _126))) * ((_75 * 0.05999999865889549f) * sqrt((_125 * _125) + (_126 * _126)));
          _136 = _135 * _125;
          _138 = _135 * _126;
          _153 = ((((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_123 - _136), (_124 - _138))))).x) * 0.20000000298023224f) + _115;
          _154 = ((((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_123, _124)))).y) * 0.20000000298023224f) + _116;
          _155 = ((((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_136 + _123), (_138 + _124))))).z) * 0.20000000298023224f) + _117;
          _161 = _118 + 0.20000000298023224f;
          if (!(_161 > 1.0f)) {
            _113 = (_113 * 1.0099999904632568f);
            _114 = (_114 * 1.0099999904632568f);
            _115 = (_153 * 0.8999999761581421f);
            _116 = (_154 * 0.8999999761581421f);
            _117 = (_155 * 0.8999999761581421f);
            _118 = _161;
            continue;
          }
          _166 = 0.5400000214576721f / max(0.0010000000474974513f, _exposure0.x);
          _173 = WaveReadLaneFirst(_materialIndex);
          _181 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnter_CD[((int)((uint)(select(((uint)_173 < (uint)170000), _173, 0)) + 0u))].BindlessParameters_PostProcessAbyssEnter_CD._ppAbyssEnterRatio);
          _182 = _181 * saturate(_97 * 1.0800000429153442f);
          _283 = ((_182 * ((_153 * _166) - _106.x)) + _106.x);
          _284 = ((_182 * ((_154 * _166) - _106.y)) + _106.y);
          _285 = ((_182 * ((_155 * _166) - _106.z)) + _106.z);
          break;
        }
      } else {
        _283 = _106.x;
        _284 = _106.y;
        _285 = _106.z;
      }
      break;
    }
  } else {
    _190 = WaveReadLaneFirst(_materialIndex);
    _198 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnter_CD[((int)((uint)(select(((uint)_190 < (uint)170000), _190, 0)) + 0u))].BindlessParameters_PostProcessAbyssEnter_CD._effectType);
    if (_198 == 1) {
      _203 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
      _205 = _203.w + -0.4000000059604645f;
      _209 = float((uint)uint(_srcTargetSizeAndInv.x * TEXCOORD.x));
      _210 = float((uint)uint(_srcTargetSizeAndInv.y * TEXCOORD.y));
      _224 = min(max(((_205 * 6.6666669845581055f) + -1.0f), -1.0f), 1.0f);
      _229 = (_205 * 0.020000001415610313f) + -0.003000000026077032f;
      _231 = _229;
      _232 = _229;
      _233 = 0.0f;
      _234 = 0.0f;
      _235 = 0.0f;
      _236 = -1.0f;
      while(true) {
        _241 = TEXCOORD.x - ((_231 * ((frac(frac(dot(float2(_209, _210), float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f) + -0.5f) - (_224 * 8.742277657347586e-08f))) * _236);
        _242 = TEXCOORD.y - ((_232 * ((frac(frac(dot(float2((_209 + 32.665000915527344f), (_210 + 11.8149995803833f)), float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f) + -0.5f) - _224)) * _236);
        _243 = _241 + -0.5f;
        _244 = _242 + -0.5f;
        _253 = rsqrt(dot(float2(_243, _244), float2(_243, _244))) * (((_203.w + -0.30000001192092896f) * 0.0010000000474974513f) * sqrt((_243 * _243) + (_244 * _244)));
        _254 = _253 * _243;
        _256 = _253 * _244;
        _274 = (((((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_241 - _254), (_242 - _256))))).x) * 0.20000000298023224f) + _233) * 0.5f;
        _275 = (((((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_241, _242)))).y) * 0.20000000298023224f) + _234) * 0.5f;
        _276 = (((((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_254 + _241), (_256 + _242))))).z) * 0.20000000298023224f) + _235) * 0.5f;
        _279 = _236 + 0.20000000298023224f;
        if (!(_279 > 1.0f)) {
          _231 = (_231 * 0.20000000298023224f);
          _232 = (_232 * 0.20000000298023224f);
          _233 = _274;
          _234 = _275;
          _235 = _276;
          _236 = _279;
          continue;
        }
        _283 = _274;
        _284 = _275;
        _285 = _276;
        break;
      }
    } else {
      _283 = 0.0f;
      _284 = 0.0f;
      _285 = 0.0f;
    }
  }
  _286 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _299 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _286, 0)))).x) & 127))) + 0.5f);
  } else {
    _299 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_283, _284, _285));
    _721 = output_color.x;
    _722 = output_color.y;
    _723 = output_color.z;
  } else {
    _721 = _283;
    _722 = _284;
    _723 = _285;
  }
  if (_etcParams.y > 1.0f) {
    _734 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _735 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _739 = saturate(1.0f - (dot(float2(_734, _735), float2(_734, _735)) * saturate(_etcParams.y + -1.0f)));
    _744 = (_739 * _721);
    _745 = (_739 * _722);
    _746 = (_739 * _723);
  } else {
    _744 = _721;
    _745 = _722;
    _746 = _723;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _779 = select((_744 <= 0.0031308000907301903f), (_744 * 12.920000076293945f), (((pow(_744, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _780 = select((_745 <= 0.0031308000907301903f), (_745 * 12.920000076293945f), (((pow(_745, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _781 = select((_746 <= 0.0031308000907301903f), (_746 * 12.920000076293945f), (((pow(_746, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _779 = _744;
    _780 = _745;
    _781 = _746;
  }
  if (!(_etcParams.y < 1.0f)) {
    _786 = float((uint)_286);
    if (!(_786 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_786 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _795 = _779;
        _796 = _780;
        _797 = _781;
      } else {
        _795 = 0.0f;
        _796 = 0.0f;
        _797 = 0.0f;
      }
    } else {
      _795 = 0.0f;
      _796 = 0.0f;
      _797 = 0.0f;
    }
  } else {
    _795 = _779;
    _796 = _780;
    _797 = _781;
  }
  SV_Target.x = _795;
  SV_Target.y = _796;
  SV_Target.z = _797;
  SV_Target.w = _299;
  return SV_Target;
}