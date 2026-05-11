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
  float _149;
  float _150;
  float _151;
  float _152;
  float _153;
  float _154;
  float _267;
  float _268;
  float _269;
  float _270;
  float _271;
  float _272;
  float _319;
  float _320;
  float _321;
  float _335;
  float _540;
  float _541;
  float _542;
  float _635;
  float _636;
  float _637;
  float _757;
  float _758;
  float _759;
  float _780;
  float _781;
  float _782;
  float _815;
  float _816;
  float _817;
  float _831;
  float _832;
  float _833;
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
  float _116;
  float _117;
  float _118;
  float _143;
  float _144;
  float _145;
  float _159;
  float _160;
  float _161;
  float _162;
  float _171;
  float _172;
  float _174;
  float _189;
  float _190;
  float _191;
  float _197;
  float _202;
  int _209;
  float _217;
  float _218;
  int _226;
  int _234;
  float4 _239;
  float _241;
  float _245;
  float _246;
  float _260;
  float _265;
  float _277;
  float _278;
  float _279;
  float _280;
  float _289;
  float _290;
  float _292;
  float _310;
  float _311;
  float _312;
  float _315;
  uint _322;
  float _344;
  float _393;
  float _394;
  float _395;
  float _397;
  float _404;
  float _405;
  float _406;
  float _425;
  float _426;
  float _427;
  float _428;
  float _429;
  float _430;
  float _431;
  float _432;
  float _433;
  float _479;
  float _480;
  float _481;
  float _482;
  float _483;
  float _484;
  float _485;
  float _502;
  float _503;
  float _504;
  float _505;
  float _511;
  float _514;
  float _521;
  float _522;
  float _523;
  float _552;
  float _577;
  float _578;
  float _579;
  float _598;
  float _599;
  float _600;
  float _606;
  float _610;
  float _611;
  float _612;
  float _613;
  float _618;
  float _643;
  float _647;
  float _648;
  float _649;
  float _650;
  int _691;
  float _746;
  float _770;
  float _771;
  float _775;
  float _822;
  float _843;
  float _844;
  float _845;
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
      _116 = (pow(_106.x, 0.012683313339948654f));
      _117 = (pow(_106.y, 0.012683313339948654f));
      _118 = (pow(_106.z, 0.012683313339948654f));
      _143 = exp2(log2(max(0.0f, (_116 + -0.8359375f)) / (18.8515625f - (_116 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
      _144 = exp2(log2(max(0.0f, (_117 + -0.8359375f)) / (18.8515625f - (_117 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
      _145 = exp2(log2(max(0.0f, (_118 + -0.8359375f)) / (18.8515625f - (_118 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
      if ((_97 * 0.5400000214576721f) > 0.0f) {
        _149 = _80;
        _150 = _80;
        _151 = 0.0f;
        _152 = 0.0f;
        _153 = 0.0f;
        _154 = -1.0f;
        while(true) {
          _159 = TEXCOORD.x - ((_149 * _78) * _154);
          _160 = TEXCOORD.y - ((_150 * _79) * _154);
          _161 = _159 + -0.5f;
          _162 = _160 + -0.5f;
          _171 = rsqrt(dot(float2(_161, _162), float2(_161, _162))) * ((_75 * 0.05999999865889549f) * sqrt((_161 * _161) + (_162 * _162)));
          _172 = _171 * _161;
          _174 = _171 * _162;
          _189 = ((((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_159 - _172), (_160 - _174))))).x) * 0.20000000298023224f) + _151;
          _190 = ((((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_159, _160)))).y) * 0.20000000298023224f) + _152;
          _191 = ((((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_172 + _159), (_174 + _160))))).z) * 0.20000000298023224f) + _153;
          _197 = _154 + 0.20000000298023224f;
          if (!(_197 > 1.0f)) {
            _149 = (_149 * 1.0099999904632568f);
            _150 = (_150 * 1.0099999904632568f);
            _151 = (_189 * 0.8999999761581421f);
            _152 = (_190 * 0.8999999761581421f);
            _153 = (_191 * 0.8999999761581421f);
            _154 = _197;
            continue;
          }
          _202 = 0.5400000214576721f / max(0.0010000000474974513f, _exposure0.x);
          _209 = WaveReadLaneFirst(_materialIndex);
          _217 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnter_CD[((int)((uint)(select(((uint)_209 < (uint)170000), _209, 0)) + 0u))].BindlessParameters_PostProcessAbyssEnter_CD._ppAbyssEnterRatio);
          _218 = _217 * saturate(_97 * 1.0800000429153442f);
          _319 = ((_218 * ((_189 * _202) - _143)) + _143);
          _320 = ((_218 * ((_190 * _202) - _144)) + _144);
          _321 = ((_218 * ((_191 * _202) - _145)) + _145);
          break;
        }
      } else {
        _319 = _143;
        _320 = _144;
        _321 = _145;
      }
      break;
    }
  } else {
    _226 = WaveReadLaneFirst(_materialIndex);
    _234 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnter_CD[((int)((uint)(select(((uint)_226 < (uint)170000), _226, 0)) + 0u))].BindlessParameters_PostProcessAbyssEnter_CD._effectType);
    if (_234 == 1) {
      _239 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
      _241 = _239.w + -0.4000000059604645f;
      _245 = float((uint)uint(_srcTargetSizeAndInv.x * TEXCOORD.x));
      _246 = float((uint)uint(_srcTargetSizeAndInv.y * TEXCOORD.y));
      _260 = min(max(((_241 * 6.6666669845581055f) + -1.0f), -1.0f), 1.0f);
      _265 = (_241 * 0.020000001415610313f) + -0.003000000026077032f;
      _267 = _265;
      _268 = _265;
      _269 = 0.0f;
      _270 = 0.0f;
      _271 = 0.0f;
      _272 = -1.0f;
      while(true) {
        _277 = TEXCOORD.x - ((_267 * ((frac(frac(dot(float2(_245, _246), float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f) + -0.5f) - (_260 * 8.742277657347586e-08f))) * _272);
        _278 = TEXCOORD.y - ((_268 * ((frac(frac(dot(float2((_245 + 32.665000915527344f), (_246 + 11.8149995803833f)), float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f) + -0.5f) - _260)) * _272);
        _279 = _277 + -0.5f;
        _280 = _278 + -0.5f;
        _289 = rsqrt(dot(float2(_279, _280), float2(_279, _280))) * (((_239.w + -0.30000001192092896f) * 0.0010000000474974513f) * sqrt((_279 * _279) + (_280 * _280)));
        _290 = _289 * _279;
        _292 = _289 * _280;
        _310 = (((((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_277 - _290), (_278 - _292))))).x) * 0.20000000298023224f) + _269) * 0.5f;
        _311 = (((((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_277, _278)))).y) * 0.20000000298023224f) + _270) * 0.5f;
        _312 = (((((float4)(__3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_290 + _277), (_292 + _278))))).z) * 0.20000000298023224f) + _271) * 0.5f;
        _315 = _272 + 0.20000000298023224f;
        if (!(_315 > 1.0f)) {
          _267 = (_267 * 0.20000000298023224f);
          _268 = (_268 * 0.20000000298023224f);
          _269 = _310;
          _270 = _311;
          _271 = _312;
          _272 = _315;
          continue;
        }
        _319 = _310;
        _320 = _311;
        _321 = _312;
        break;
      }
    } else {
      _319 = 0.0f;
      _320 = 0.0f;
      _321 = 0.0f;
    }
  }
  _322 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _335 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _322, 0)))).x) & 127))) + 0.5f);
  } else {
    _335 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_319, _320, _321));
    _757 = output_color.x;
    _758 = output_color.y;
    _759 = output_color.z;
  } else {
    _757 = _319;
    _758 = _320;
    _759 = _321;
  }
  if (_etcParams.y > 1.0f) {
    _770 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _771 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _775 = saturate(1.0f - (dot(float2(_770, _771), float2(_770, _771)) * saturate(_etcParams.y + -1.0f)));
    _780 = (_775 * _757);
    _781 = (_775 * _758);
    _782 = (_775 * _759);
  } else {
    _780 = _757;
    _781 = _758;
    _782 = _759;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _815 = select((_780 <= 0.0031308000907301903f), (_780 * 12.920000076293945f), (((pow(_780, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _816 = select((_781 <= 0.0031308000907301903f), (_781 * 12.920000076293945f), (((pow(_781, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _817 = select((_782 <= 0.0031308000907301903f), (_782 * 12.920000076293945f), (((pow(_782, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _815 = _780;
    _816 = _781;
    _817 = _782;
  }
  if (!(_etcParams.y < 1.0f)) {
    _822 = float((uint)_322);
    if (!(_822 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_822 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _831 = _815;
        _832 = _816;
        _833 = _817;
      } else {
        _831 = 0.0f;
        _832 = 0.0f;
        _833 = 0.0f;
      }
    } else {
      _831 = 0.0f;
      _832 = 0.0f;
      _833 = 0.0f;
    }
  } else {
    _831 = _815;
    _832 = _816;
    _833 = _817;
  }
  _843 = exp2(log2(_831 * 9.999999747378752e-05f) * 0.1593017578125f);
  _844 = exp2(log2(_832 * 9.999999747378752e-05f) * 0.1593017578125f);
  _845 = exp2(log2(_833 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_843 * 18.6875f) + 1.0f)) * ((_843 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_844 * 18.6875f) + 1.0f)) * ((_844 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_845 * 18.6875f) + 1.0f)) * ((_845 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _335;
  return SV_Target;
}