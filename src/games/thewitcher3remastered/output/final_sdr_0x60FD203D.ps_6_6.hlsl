Texture2D<float4> t0 : register(t0);

Texture2D<float4> t1 : register(t1);

cbuffer cb3 : register(b3) {
  float4 CustomPixelConsts_000 : packoffset(c000.x);
  float4 CustomPixelConsts_016 : packoffset(c001.x);
  float4 CustomPixelConsts_032 : packoffset(c002.x);
  float4 CustomPixelConsts_048 : packoffset(c003.x);
  float4 CustomPixelConsts_064 : packoffset(c004.x);
  float4 CustomPixelConsts_080 : packoffset(c005.x);
  float4 CustomPixelConsts_096 : packoffset(c006.x);
  float4 CustomPixelConsts_112 : packoffset(c007.x);
  float4 CustomPixelConsts_128 : packoffset(c008.x);
  float4 CustomPixelConsts_144 : packoffset(c009.x);
  float4 CustomPixelConsts_160 : packoffset(c010.x);
  float4 CustomPixelConsts_176 : packoffset(c011.x);
  float4 CustomPixelConsts_192 : packoffset(c012.x);
  float4 CustomPixelConsts_208 : packoffset(c013.x);
  float4 CustomPixelConsts_224 : packoffset(c014.x);
  float4 CustomPixelConsts_240 : packoffset(c015.x);
  float4 CustomPixelConsts_256 : packoffset(c016.x);
  float4 CustomPixelConsts_272 : packoffset(c017.x);
  float4 CustomPixelConsts_288 : packoffset(c018.x);
  float4 CustomPixelConsts_304 : packoffset(c019.x);
  float4 CustomPixelConsts_320 : packoffset(c020.x);
  row_major float4x4 CustomPixelConsts_336 : packoffset(c021.x);
};

#include "./final_sdr_pass.hlsli"

SamplerState s1 : register(s1);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target = 0;
  float4 _26 = t1.Load(int3(int(SV_Position.x - CustomPixelConsts_016.x), int(SV_Position.y - CustomPixelConsts_016.y), 0));
  float4 _33 = t0.SampleLevel(s1, float2(TEXCOORD.x, TEXCOORD.y), 0.0f);
  float _88;
  float _89;
  float _90;
  float _181;
  float _182;
  float _183;
  float _229;
  float _230;
  float _231;
  float _232;
  float _233;
  float _234;
  if (CustomPixelConsts_272.w > 0.0f) {
    float _45 = (CustomPixelConsts_272.w * 0.1120000034570694f) + 1.0f;
    float _50 = 0.5f - (CustomPixelConsts_272.w * 0.07500000298023224f);
    float _51 = ((_33.x + -0.5f) * _45) + _50;
    float _52 = ((_33.y + -0.5f) * _45) + _50;
    float _53 = ((_33.z + -0.5f) * _45) + _50;
    uint _54 = uint(CustomPixelConsts_272.x);
    float _59 = ((_51 * 17.882400512695312f) + (_52 * 43.5161018371582f)) + (_53 * 4.119349956512451f);
    float _64 = ((_51 * 3.4556500911712646f) + (_52 * 27.155399322509766f)) + (_53 * 3.867140054702759f);
    float _69 = ((_51 * 0.029956599697470665f) + (_52 * 0.1843090057373047f)) + (_53 * 1.4670900106430054f);
    bool _70 = (_54 == 0);
    do {
      if (_70) {
        _88 = ((_64 * 2.023439884185791f) - (_69 * 2.52810001373291f));
        _89 = _64;
        _90 = _69;
      } else {
        if (_54 == 1) {
          _88 = _59;
          _89 = ((_59 * 0.4942069947719574f) + (_69 * 1.248270034790039f));
          _90 = _69;
        } else {
          if (_54 == 2) {
            _88 = _59;
            _89 = _64;
            _90 = ((_64 * 0.8011090159416199f) - (_59 * 0.3959130048751831f));
          } else {
            _88 = _59;
            _89 = _64;
            _90 = _69;
          }
        }
      }
      float _103 = (((_51 - (_88 * 0.08094444870948792f)) + (_89 * 0.13050441443920135f)) - (_90 * 0.11672106385231018f)) * 0.699999988079071f;
      float _120 = 1.0f - CustomPixelConsts_272.w;
      float _130 = CustomPixelConsts_272.y + 1.0f;
      float _136 = (CustomPixelConsts_272.z + 0.5f) + (CustomPixelConsts_272.w * 0.07999999821186066f);
      float _146 = ((_26.x + -0.5f) * _45) + _50;
      float _147 = ((_26.y + -0.5f) * _45) + _50;
      float _148 = ((_26.z + -0.5f) * _45) + _50;
      float _153 = ((_146 * 17.882400512695312f) + (_147 * 43.5161018371582f)) + (_148 * 4.119349956512451f);
      float _158 = ((_146 * 3.4556500911712646f) + (_147 * 27.155399322509766f)) + (_148 * 3.867140054702759f);
      float _163 = ((_146 * 0.029956599697470665f) + (_147 * 0.1843090057373047f)) + (_148 * 1.4670900106430054f);
      do {
        if (_70) {
          _181 = ((_158 * 2.023439884185791f) - (_163 * 2.52810001373291f));
          _182 = _158;
          _183 = _163;
        } else {
          if (_54 == 1) {
            _181 = _153;
            _182 = ((_153 * 0.4942069947719574f) + (_163 * 1.248270034790039f));
            _183 = _163;
          } else {
            if (_54 == 2) {
              _181 = _153;
              _182 = _158;
              _183 = ((_158 * 0.8011090159416199f) - (_153 * 0.3959130048751831f));
            } else {
              _181 = _153;
              _182 = _158;
              _183 = _163;
            }
          }
        }
        float _196 = (((_146 - (_181 * 0.08094444870948792f)) + (_182 * 0.13050441443920135f)) - (_183 * 0.11672106385231018f)) * 0.699999988079071f;
        _229 = (((((_146 * _120) + -0.5f) + (saturate(_146) * CustomPixelConsts_272.w)) * _130) + _136);
        _230 = (((((_147 * _120) + -0.5f) + (saturate(((((_181 * 0.010248533450067043f) + (_147 * 2.0f)) - (_182 * 0.05401932820677757f)) + (_183 * 0.11361470818519592f)) + _196) * CustomPixelConsts_272.w)) * _130) + _136);
        _231 = (((((_148 * _120) + -0.5f) + (saturate(((((_181 * 0.0003652969317045063f) + (_148 * 2.0f)) + (_182 * 0.004121614620089531f)) - (_183 * 0.693511426448822f)) + _196) * CustomPixelConsts_272.w)) * _130) + _136);
        _232 = (((((_51 * _120) + -0.5f) + (saturate(_51) * CustomPixelConsts_272.w)) * _130) + _136);
        _233 = (((((_52 * _120) + -0.5f) + (saturate(((((_88 * 0.010248533450067043f) + (_52 * 2.0f)) - (_89 * 0.05401932820677757f)) + (_90 * 0.11361470818519592f)) + _103) * CustomPixelConsts_272.w)) * _130) + _136);
        _234 = (((((_53 * _120) + -0.5f) + (saturate(((((_88 * 0.0003652969317045063f) + (_53 * 2.0f)) + (_89 * 0.004121614620089531f)) - (_90 * 0.693511426448822f)) + _103) * CustomPixelConsts_272.w)) * _130) + _136);
      } while (false);
    } while (false);
  } else {
    _229 = _26.x;
    _230 = _26.y;
    _231 = _26.z;
    _232 = _33.x;
    _233 = _33.y;
    _234 = _33.z;
  }
  SV_Target.w = exp2(log2(lerp(_33.w, _26.w, _26.w)) * CustomPixelConsts_032.z);

  float3 scene_color_gamma = float3(_232, _233, _234);
  float3 scene_linear = renodx::color::gamma::DecodeSafe(scene_color_gamma, 2.2f);
  if (CUSTOM_FILM_GRAIN_STRENGTH > 0.f
      || (CUSTOM_SHARPNESS > 0.f && CUSTOM_SHARPENING_TYPE == 1.f)) {
    scene_linear = TheWitcher3RemasteredApplyFinalSDRSceneEffects(
        scene_linear,
        TEXCOORD,
        t0,
        s1);
    scene_color_gamma = renodx::color::gamma::EncodeSafe(scene_linear, 2.2f);
  }

  if (RENODX_TONE_MAP_TYPE == 0.f) {
    float _235 = CustomPixelConsts_032.y * CustomPixelConsts_032.x;
    float _251 = pow(scene_color_gamma.x, _235);
    float _252 = pow(scene_color_gamma.y, _235);
    float _253 = pow(scene_color_gamma.z, _235);
    SV_Target.x = exp2(log2(((pow(_229, _235) - _251) * _26.w) + _251) * CustomPixelConsts_032.z);
    SV_Target.y = exp2(log2(((pow(_230, _235) - _252) * _26.w) + _252) * CustomPixelConsts_032.z);
    SV_Target.z = exp2(log2(((pow(_231, _235) - _253) * _26.w) + _253) * CustomPixelConsts_032.z);
  } else {
    float3 ui_linear = renodx::color::gamma::DecodeSafe(float3(_229, _230, _231), 2.2f);
    float3 output_linear = TheWitcher3RemasteredCompositeFinalSDRUI(
        scene_linear,
        ui_linear,
      _26.w);
    SV_Target.rgb = TheWitcher3RemasteredEncodeFinalSDR(output_linear);
  }

  return SV_Target;
}
