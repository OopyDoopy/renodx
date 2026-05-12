#include "../tonemap.hlsli"

struct PostProcessDirectionalBlurStruct {
  float _intensity;
  float _noiseStrength;
  float _direction;
  float _noiseScale;
  uint _noiseTexture;
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

struct BindlessParameters_PostProcessDirectionalBlur {
  PostProcessDirectionalBlurStruct BindlessParameters_PostProcessDirectionalBlur;
};

typedef BindlessParameters_PostProcessDirectionalBlur BindlessParameters_PostProcessDirectionalBlur_t;
ConstantBuffer<BindlessParameters_PostProcessDirectionalBlur_t> BindlessParameters_PostProcessDirectionalBlur[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  int _18;
  float _26;
  int _29;
  int _37;
  int _46;
  float _54;
  int _58;
  float _66;
  int _67;
  float _75;
  float _77;
  float _78;
  float _79;
  int _80;
  float _132;
  float _337;
  float _338;
  float _339;
  float _432;
  float _433;
  float _434;
  float _554;
  float _555;
  float _556;
  float _577;
  float _578;
  float _579;
  float _612;
  float _613;
  float _614;
  float _628;
  float _629;
  float _630;
  float _83;
  float _84;
  float _87;
  float _88;
  float4 _93;
  float4 _102;
  float _106;
  float _107;
  float _108;
  int _109;
  uint _119;
  float _141;
  float _190;
  float _191;
  float _192;
  float _194;
  float _201;
  float _202;
  float _203;
  float _222;
  float _223;
  float _224;
  float _225;
  float _226;
  float _227;
  float _228;
  float _229;
  float _230;
  float _276;
  float _277;
  float _278;
  float _279;
  float _280;
  float _281;
  float _282;
  float _299;
  float _300;
  float _301;
  float _302;
  float _308;
  float _311;
  float _318;
  float _319;
  float _320;
  float _349;
  float _374;
  float _375;
  float _376;
  float _395;
  float _396;
  float _397;
  float _403;
  float _407;
  float _408;
  float _409;
  float _410;
  float _415;
  float _440;
  float _444;
  float _445;
  float _446;
  float _447;
  int _488;
  float _543;
  float _567;
  float _568;
  float _572;
  float _619;
  float _14[36];
  _18 = WaveReadLaneFirst(_materialIndex);
  _26 = WaveReadLaneFirst(BindlessParameters_PostProcessDirectionalBlur[((int)((uint)(select(((uint)_18 < (uint)170000), _18, 0)) + 0u))].BindlessParameters_PostProcessDirectionalBlur._noiseScale);
  _29 = WaveReadLaneFirst(_materialIndex);
  _37 = WaveReadLaneFirst(BindlessParameters_PostProcessDirectionalBlur[((int)((uint)(select(((uint)_29 < (uint)170000), _29, 0)) + 0u))].BindlessParameters_PostProcessDirectionalBlur._noiseTexture);
  _46 = WaveReadLaneFirst(_materialIndex);
  _54 = WaveReadLaneFirst(BindlessParameters_PostProcessDirectionalBlur[((int)((uint)(select(((uint)_46 < (uint)170000), _46, 0)) + 0u))].BindlessParameters_PostProcessDirectionalBlur._direction);
  _58 = WaveReadLaneFirst(_materialIndex);
  _66 = WaveReadLaneFirst(BindlessParameters_PostProcessDirectionalBlur[((int)((uint)(select(((uint)_58 < (uint)170000), _58, 0)) + 0u))].BindlessParameters_PostProcessDirectionalBlur._intensity);
  _67 = WaveReadLaneFirst(_materialIndex);
  _75 = WaveReadLaneFirst(BindlessParameters_PostProcessDirectionalBlur[((int)((uint)(select(((uint)_67 < (uint)170000), _67, 0)) + 0u))].BindlessParameters_PostProcessDirectionalBlur._noiseStrength);
  _77 = 0.0f;
  _78 = 0.0f;
  _79 = 0.0f;
  _80 = 1;
  while(true) {
    _83 = (_66 * 0.03125f) * float((int)(_80));
    _84 = _75 * (((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_37 < (uint)65000), _37, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_26 * TEXCOORD.x), (_26 * TEXCOORD.y))))).x);
    _87 = _83 * (_84 + (-0.0f - sin(_54)));
    _88 = _83 * (_84 + cos(_54));
    _93 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2((_87 + TEXCOORD.x), (_88 + TEXCOORD.y)));
    _102 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2((TEXCOORD.x - _87), (TEXCOORD.y - _88)));
    _106 = (_93.x + _77) + _102.x;
    _107 = (_93.y + _78) + _102.y;
    _108 = (_93.z + _79) + _102.z;
    _109 = _80 + 1;
    if (!(_109 == 33)) {
      _77 = _106;
      _78 = _107;
      _79 = _108;
      _80 = _109;
      continue;
    }
    _119 = uint(SV_Position.y);
    if (_etcParams.y == 1.0f) {
      _132 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _119, 0)))).x) & 127))) + 0.5f);
    } else {
      _132 = _postProcessParams.x;
    }
    if (_localToneMappingParams.w > 0.0f) {
      float3 output_color = TonemapReplacer(float3(_106, _107, _108));
      _554 = output_color.x;
      _555 = output_color.y;
      _556 = output_color.z;
    } else {
      _554 = (_106 * 0.015625f);
      _555 = (_107 * 0.015625f);
      _556 = (_108 * 0.015625f);
    }
    if (_etcParams.y > 1.0f) {
      _567 = abs((TEXCOORD.x * 2.0f) + -1.0f);
      _568 = abs((TEXCOORD.y * 2.0f) + -1.0f);
      _572 = saturate(1.0f - (dot(float2(_567, _568), float2(_567, _568)) * saturate(_etcParams.y + -1.0f)));
      _577 = (_572 * _554);
      _578 = (_572 * _555);
      _579 = (_572 * _556);
    } else {
      _577 = _554;
      _578 = _555;
      _579 = _556;
    }
    if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
      _612 = select((_577 <= 0.0031308000907301903f), (_577 * 12.920000076293945f), (((pow(_577, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
      _613 = select((_578 <= 0.0031308000907301903f), (_578 * 12.920000076293945f), (((pow(_578, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
      _614 = select((_579 <= 0.0031308000907301903f), (_579 * 12.920000076293945f), (((pow(_579, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    } else {
      _612 = _577;
      _613 = _578;
      _614 = _579;
    }
    if (!(_etcParams.y < 1.0f)) {
      _619 = float((uint)_119);
      if (!(_619 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        if (_619 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
          _628 = _612;
          _629 = _613;
          _630 = _614;
        } else {
          _628 = 0.0f;
          _629 = 0.0f;
          _630 = 0.0f;
        }
      } else {
        _628 = 0.0f;
        _629 = 0.0f;
        _630 = 0.0f;
      }
    } else {
      _628 = _612;
      _629 = _613;
      _630 = _614;
    }
    SV_Target.x = _628;
    SV_Target.y = _629;
    SV_Target.z = _630;
    SV_Target.w = _132;
    break;
  }
  return SV_Target;
}