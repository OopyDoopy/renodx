#include "../tonemap.hlsli"

struct PostProcessCameraLensRainStruct {
  float _rainSpeed;
  float _rainUTiling;
  float _rainVTiling;
  float _streakUTiling;
  float _streakVTiling;
  uint _rainNormalTexture;
  uint _rainMaskTexture;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t36, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

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

struct BindlessParameters_PostProcessCameraLensRain {
  PostProcessCameraLensRainStruct BindlessParameters_PostProcessCameraLensRain;
};

typedef BindlessParameters_PostProcessCameraLensRain BindlessParameters_PostProcessCameraLensRain_t;
ConstantBuffer<BindlessParameters_PostProcessCameraLensRain_t> BindlessParameters_PostProcessCameraLensRain[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

static const float _global_0[5] = { 0.05471208319067955f, 0.05641283839941025f, 0.05699142813682556f, 0.05641283839941025f, 0.05471208319067955f };

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float4 _23;
  float _30;
  float _31;
  float _48;
  float _71;
  float _73;
  float _74;
  float _75;
  int _76;
  float _78;
  float _79;
  float _80;
  int _81;
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
  float _88;
  float4 _99;
  float _106;
  float _107;
  float _108;
  int _109;
  int _112;
  float _122;
  float _131;
  float _132;
  int _136;
  float _144;
  int _146;
  float _154;
  int _156;
  int _164;
  float4 _171;
  float _179;
  float _180;
  float _181;
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
  int __loop_jump_target = -1;
  float _19[36];
  _23 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _30 = (pow(_23.y, 0.012683313339948654f));
  _31 = (pow(_23.z, 0.012683313339948654f));
  _48 = exp2(log2(max(0.0f, (_30 + -0.8359375f)) / (18.8515625f - (_30 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  _71 = 1.0f - (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(float((int)(int(_srcTargetSizeAndInv.x * TEXCOORD.x))) * asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x)), int(float((int)(int(_srcTargetSizeAndInv.y * TEXCOORD.y))) * asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y)), 0)))).x);
  _73 = 0.0f;
  _74 = 0.0f;
  _75 = 0.0f;
  _76 = -2;
  while(true) {
    _78 = _73;
    _79 = _74;
    _80 = _75;
    _81 = -2;
    while(true) {
      _88 = (_global_0[min((uint)((_76 + 2)), 4u)]) * (_global_0[min((uint)((_81 + 2)), 4u)]);
      _99 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((((_71 * _destTargetSizAndInv.z) * float((int)(_76))) + TEXCOORD.x), (((_71 * _destTargetSizAndInv.w) * float((int)(_81))) + TEXCOORD.y)));
      _106 = (_99.x * _88) + _78;
      _107 = (_99.y * _88) + _79;
      _108 = (_99.z * _88) + _80;
      _109 = _81 + 1;
      if (!(_109 == 3)) {
        _78 = _106;
        _79 = _107;
        _80 = _108;
        _81 = _109;
        continue;
      }
      _112 = _76 + 1;
      if (!(_112 == 3)) {
        _73 = _106;
        _74 = _107;
        _75 = _108;
        _76 = _112;
        __loop_jump_target = 72;
        break;
      }
      _122 = (pow(_23.x, 0.012683313339948654f));
      _131 = exp2(log2(max(0.0f, (_122 + -0.8359375f)) / (18.8515625f - (_122 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
      _132 = exp2(log2(max(0.0f, (_31 + -0.8359375f)) / (18.8515625f - (_31 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
      _136 = WaveReadLaneFirst(_materialIndex);
      _144 = WaveReadLaneFirst(BindlessParameters_PostProcessCameraLensRain[((int)((uint)(select(((uint)_136 < (uint)170000), _136, 0)) + 0u))].BindlessParameters_PostProcessCameraLensRain._rainUTiling);
      _146 = WaveReadLaneFirst(_materialIndex);
      _154 = WaveReadLaneFirst(BindlessParameters_PostProcessCameraLensRain[((int)((uint)(select(((uint)_146 < (uint)170000), _146, 0)) + 0u))].BindlessParameters_PostProcessCameraLensRain._rainVTiling);
      _156 = WaveReadLaneFirst(_materialIndex);
      _164 = WaveReadLaneFirst(BindlessParameters_PostProcessCameraLensRain[((int)((uint)(select(((uint)_156 < (uint)170000), _156, 0)) + 0u))].BindlessParameters_PostProcessCameraLensRain._rainMaskTexture);
      _171 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_164 < (uint)65000), _164, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_144 * TEXCOORD.x), (_154 * TEXCOORD.y)));
      _179 = (_171.y * ((_106 * 12.82451057434082f) - _131)) + _131;
      _180 = (_171.y * ((_107 * 12.82451057434082f) - _48)) + _48;
      _181 = (_171.y * ((_108 * 12.82451057434082f) - _132)) + _132;
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
      break;
    }
    if (__loop_jump_target == 72) {
      __loop_jump_target = -1;
      continue;
    }
    if (__loop_jump_target != -1) {
      break;
    }
    break;
  }
  return SV_Target;
}