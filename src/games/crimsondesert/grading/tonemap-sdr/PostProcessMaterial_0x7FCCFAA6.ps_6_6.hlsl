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
  float _201;
  float _406;
  float _407;
  float _408;
  float _501;
  float _502;
  float _503;
  float _623;
  float _624;
  float _625;
  float _646;
  float _647;
  float _648;
  float _681;
  float _682;
  float _683;
  float _697;
  float _698;
  float _699;
  float _83;
  float _84;
  float _87;
  float _88;
  float4 _93;
  float _103;
  float _104;
  float _105;
  float4 _132;
  float _142;
  float _143;
  float _144;
  float _171;
  float _174;
  float _177;
  int _178;
  uint _188;
  float _210;
  float _259;
  float _260;
  float _261;
  float _263;
  float _270;
  float _271;
  float _272;
  float _291;
  float _292;
  float _293;
  float _294;
  float _295;
  float _296;
  float _297;
  float _298;
  float _299;
  float _345;
  float _346;
  float _347;
  float _348;
  float _349;
  float _350;
  float _351;
  float _368;
  float _369;
  float _370;
  float _371;
  float _377;
  float _380;
  float _387;
  float _388;
  float _389;
  float _418;
  float _443;
  float _444;
  float _445;
  float _464;
  float _465;
  float _466;
  float _472;
  float _476;
  float _477;
  float _478;
  float _479;
  float _484;
  float _509;
  float _513;
  float _514;
  float _515;
  float _516;
  int _557;
  float _612;
  float _636;
  float _637;
  float _641;
  float _688;
  float _709;
  float _710;
  float _711;
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
    _103 = (pow(_93.x, 0.012683313339948654f));
    _104 = (pow(_93.y, 0.012683313339948654f));
    _105 = (pow(_93.z, 0.012683313339948654f));
    _132 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2((TEXCOORD.x - _87), (TEXCOORD.y - _88)));
    _142 = (pow(_132.x, 0.012683313339948654f));
    _143 = (pow(_132.y, 0.012683313339948654f));
    _144 = (pow(_132.z, 0.012683313339948654f));
    _171 = ((exp2(log2(max(0.0f, (_142 + -0.8359375f)) / (18.8515625f - (_142 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_103 + -0.8359375f)) / (18.8515625f - (_103 * 18.6875f))) * 6.277394771575928f)) * 10000.0f) + _77;
    _174 = ((exp2(log2(max(0.0f, (_143 + -0.8359375f)) / (18.8515625f - (_143 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_104 + -0.8359375f)) / (18.8515625f - (_104 * 18.6875f))) * 6.277394771575928f)) * 10000.0f) + _78;
    _177 = ((exp2(log2(max(0.0f, (_144 + -0.8359375f)) / (18.8515625f - (_144 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_105 + -0.8359375f)) / (18.8515625f - (_105 * 18.6875f))) * 6.277394771575928f)) * 10000.0f) + _79;
    _178 = _80 + 1;
    if (!(_178 == 33)) {
      _77 = _171;
      _78 = _174;
      _79 = _177;
      _80 = _178;
      continue;
    }
    _188 = uint(SV_Position.y);
    if (_etcParams.y == 1.0f) {
      _201 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _188, 0)))).x) & 127))) + 0.5f);
    } else {
      _201 = _postProcessParams.x;
    }
    if (_localToneMappingParams.w > 0.0f) {
      float3 output_color = TonemapReplacer(float3(_171, _174, _177));
      _623 = output_color.x;
      _624 = output_color.y;
      _625 = output_color.z;
    } else {
      _623 = (_171 * 0.015625f);
      _624 = (_174 * 0.015625f);
      _625 = (_177 * 0.015625f);
    }
    if (_etcParams.y > 1.0f) {
      _636 = abs((TEXCOORD.x * 2.0f) + -1.0f);
      _637 = abs((TEXCOORD.y * 2.0f) + -1.0f);
      _641 = saturate(1.0f - (dot(float2(_636, _637), float2(_636, _637)) * saturate(_etcParams.y + -1.0f)));
      _646 = (_641 * _623);
      _647 = (_641 * _624);
      _648 = (_641 * _625);
    } else {
      _646 = _623;
      _647 = _624;
      _648 = _625;
    }
    if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
      _681 = select((_646 <= 0.0031308000907301903f), (_646 * 12.920000076293945f), (((pow(_646, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
      _682 = select((_647 <= 0.0031308000907301903f), (_647 * 12.920000076293945f), (((pow(_647, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
      _683 = select((_648 <= 0.0031308000907301903f), (_648 * 12.920000076293945f), (((pow(_648, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    } else {
      _681 = _646;
      _682 = _647;
      _683 = _648;
    }
    if (!(_etcParams.y < 1.0f)) {
      _688 = float((uint)_188);
      if (!(_688 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        if (_688 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
          _697 = _681;
          _698 = _682;
          _699 = _683;
        } else {
          _697 = 0.0f;
          _698 = 0.0f;
          _699 = 0.0f;
        }
      } else {
        _697 = 0.0f;
        _698 = 0.0f;
        _699 = 0.0f;
      }
    } else {
      _697 = _681;
      _698 = _682;
      _699 = _683;
    }
    _709 = exp2(log2(_697 * 9.999999747378752e-05f) * 0.1593017578125f);
    _710 = exp2(log2(_698 * 9.999999747378752e-05f) * 0.1593017578125f);
    _711 = exp2(log2(_699 * 9.999999747378752e-05f) * 0.1593017578125f);
    SV_Target.x = exp2(log2((1.0f / ((_709 * 18.6875f) + 1.0f)) * ((_709 * 18.8515625f) + 0.8359375f)) * 78.84375f);
    SV_Target.y = exp2(log2((1.0f / ((_710 * 18.6875f) + 1.0f)) * ((_710 * 18.8515625f) + 0.8359375f)) * 78.84375f);
    SV_Target.z = exp2(log2((1.0f / ((_711 * 18.6875f) + 1.0f)) * ((_711 * 18.8515625f) + 0.8359375f)) * 78.84375f);
    SV_Target.w = _201;
    break;
  }
  return SV_Target;
}