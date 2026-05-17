#include "./common.hlsl"
#include "./psycho_test17_custom.hlsl"

#define TONE_MAP_TYPE 2

struct Intensity {
  float Intensity_000;
  float Intensity_004;
  float Intensity_008;
  float Intensity_012;
};


Texture3D<float4> t0[20] : register(t0);

Texture3D<float4> t20 : register(t20);

Texture3D<float4> t21 : register(t21);

RWTexture3D<float4> u0 : register(u0);

RWTexture3D<float4> u1 : register(u1);

cbuffer cb0 : register(b0) {
  uint4 cb0_raw[25];
};

SamplerState s0 : register(s0);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float3 LUTSampling1(float3 input_color) {
  float _16;
  float _27;
  float _28;
  float _29;
  float _54;
  float _55;
  float _56;
  float _63;
  float _64;
  float _65;
  int _70;
  float _71;
  float _72;
  float _73;
  float _168;
  float _169;
  float _170;
  float _89;
  float _90;
  float _91;
  float _116;
  float _118;
  float4 _129;
  float4 _133;
  float _141;
  float _142;
  float _143;
  int _144;


  _54 = input_color.x;
  _55 = input_color.y;
  _56 = input_color.z;

  if (!(asint(cb0_raw[20u].x) == 0)) {
    _70 = 0;
    _71 = _56;
    _72 = _55;
    _73 = _54;
    bool _loop_break_0 = false;
    while (true) {
      _89 = exp2(log2(saturate(_73 / asfloat(cb0_raw[20u].z))) * 0.1593017578125f);
      _90 = exp2(log2(saturate(_72 / asfloat(cb0_raw[20u].z))) * 0.1593017578125f);
      _91 = exp2(log2(saturate(_71 / asfloat(cb0_raw[20u].z))) * 0.1593017578125f);
      _116 = 0.5f / asfloat(cb0_raw[20u].y);
      _118 = (1.0f - _116) - _116;
      _129 = t0[((int)(_70 + 0u))].SampleLevel(s0, float3(((_118 * exp2(log2(((_89 * 18.8515625f) + 0.8359375f) / ((_89 * 18.6875f) + 1.0f)) * 78.84375f)) + _116), ((_118 * exp2(log2(((_90 * 18.8515625f) + 0.8359375f) / ((_90 * 18.6875f) + 1.0f)) * 78.84375f)) + _116), ((_118 * exp2(log2(((_91 * 18.8515625f) + 0.8359375f) / ((_91 * 18.6875f) + 1.0f)) * 78.84375f)) + _116)), 0.0f);
      _133 = asfloat(cb0_raw[_70]);
      _141 = (_133.x * (_129.x - _73)) + _73;
      _142 = (_133.x * (_129.y - _72)) + _72;
      _143 = (_133.x * (_129.z - _71)) + _71;
      _144 = _70 + 1;
      if (!(((uint)_144 < (uint)20) && ((uint)_144 < (uint)asint(cb0_raw[20u].x)))) {
        break;
      }
      _70 = _144;
      _71 = _143;
      _72 = _142;
      _73 = _141;
    }
    _63 = _143;
    _64 = _142;
    _65 = _141;
  } else {
    _63 = _56;
    _64 = _55;
    _65 = _54;
  }

  return float3(_65, _64, _63);
}

void LUTSampling2(float3 input_color, inout float4 sdr_color, inout float4 hdr_color) {
  float _63;
  float _64;
  float _65;
  float _154;
  float _155;
  float _156;
  float _157;
  float _158;
  float _173;
  float _180;
  float _181;
  float _182;
  float _202;
  float _203;
  float _204;
  float _229;
  float _231;
  float _235;
  float _236;
  float _237;
  float _276;
  float _277;
  float _278;
  float _297;
  float _322;
  float _330;
  float _352;
  float _360;
  float _382;
  float4 _240;
  float4 _245;
  float _284;
  float _285;
  float _286;
  float _289;
  bool _300;

  _180 = input_color.x;
  _181 = input_color.y;
  _182 = input_color.z;

  [branch]
  if (asfloat(cb0_raw[20u].w) > 0.0f) {
    _202 = exp2(log2(saturate(_180 / asfloat(cb0_raw[20u].z))) * 0.1593017578125f);
    _203 = exp2(log2(saturate(_181 / asfloat(cb0_raw[20u].z))) * 0.1593017578125f);
    _204 = exp2(log2(saturate(_182 / asfloat(cb0_raw[20u].z))) * 0.1593017578125f);
    _229 = 0.5f / asfloat(cb0_raw[20u].y);
    _231 = (1.0f - _229) - _229;
    _235 = (_231 * exp2(log2(((_202 * 18.8515625f) + 0.8359375f) / ((_202 * 18.6875f) + 1.0f)) * 78.84375f)) + _229;
    _236 = (_231 * exp2(log2(((_203 * 18.8515625f) + 0.8359375f) / ((_203 * 18.6875f) + 1.0f)) * 78.84375f)) + _229;
    _237 = (_231 * exp2(log2(((_204 * 18.8515625f) + 0.8359375f) / ((_204 * 18.6875f) + 1.0f)) * 78.84375f)) + _229;
    _240 = t20.SampleLevel(s0, float3(_235, _236, _237), 0.0f);
    _245 = t21.SampleLevel(s0, float3(_235, _236, _237), 0.0f);

    sdr_color = float4((((_240.x - _180) * asfloat(cb0_raw[20u].w)) + _180), (((_240.y - _181) * asfloat(cb0_raw[20u].w)) + _181), (((_240.z - _182) * asfloat(cb0_raw[20u].w)) + _182), 0.0f);

    // _276 = ((asfloat(cb0_raw[20u].w) * ((asfloat(cb0_raw[21u].x) * _245.x) - _180)) + _180);
    // _277 = ((asfloat(cb0_raw[20u].w) * ((asfloat(cb0_raw[21u].x) * _245.y) - _181)) + _181);
    // _278 = ((asfloat(cb0_raw[20u].w) * ((asfloat(cb0_raw[21u].x) * _245.z) - _182)) + _182);

    _276 = lerp(_180, _245.x * asfloat(cb0_raw[21u].x), asfloat(cb0_raw[20u].w));
    _277 = lerp(_181, _245.y * asfloat(cb0_raw[21u].x), asfloat(cb0_raw[20u].w));
    _278 = lerp(_182, _245.z * asfloat(cb0_raw[21u].x), asfloat(cb0_raw[20u].w));
  } else {

    sdr_color = float4(_180, _181, _182, 0.0f);

    _276 = _180;
    _277 = _181;
    _278 = _182;
  }
  hdr_color = float4(_276, _277, _278, 0.0f);
}

[numthreads(8, 8, 8)]
void main(
  uint3 SV_DispatchThreadID : SV_DispatchThreadID,
  uint3 SV_GroupID : SV_GroupID,
  uint3 SV_GroupThreadID : SV_GroupThreadID,
  uint SV_GroupIndex : SV_GroupIndex
) {
  float _16;
  float _27;
  float _28;
  float _29;
  float _54;
  float _55;
  float _56;
  float _63;
  float _64;
  float _65;
  int _70;
  float _71;
  float _72;
  float _73;
  float _168;
  float _169;
  float _170;
  float _276;
  float _277;
  float _278;
  float _297;
  float _322;
  float _330;
  float _352;
  float _360;
  float _382;
  float _89;
  float _90;
  float _91;
  float _116;
  float _118;
  float4 _129;
  float4 _133;
  float _141;
  float _142;
  float _143;
  int _144;
  float _154;
  float _155;
  float _156;
  float _157;
  float _158;
  float _173;
  float _180;
  float _181;
  float _182;
  float _202;
  float _203;
  float _204;
  float _229;
  float _231;
  float _235;
  float _236;
  float _237;
  float4 _240;
  float4 _245;
  float _284;
  float _285;
  float _286;
  float _289;
  bool _300;
  _16 = asfloat(cb0_raw[20u].y) + -1.0f;
  _27 = exp2(log2(float((uint)SV_DispatchThreadID.x) / _16) * 0.012683313339948654f);
  _28 = exp2(log2(float((uint)SV_DispatchThreadID.y) / _16) * 0.012683313339948654f);
  _29 = exp2(log2(float((uint)SV_DispatchThreadID.z) / _16) * 0.012683313339948654f);
  _54 = exp2(log2(max((_27 + -0.8359375f), 0.0f) / (18.8515625f - (_27 * 18.6875f))) * 6.277394771575928f) * asfloat(cb0_raw[20u].z);
  _55 = exp2(log2(max((_28 + -0.8359375f), 0.0f) / (18.8515625f - (_28 * 18.6875f))) * 6.277394771575928f) * asfloat(cb0_raw[20u].z);
  _56 = exp2(log2(max((_29 + -0.8359375f), 0.0f) / (18.8515625f - (_29 * 18.6875f))) * 6.277394771575928f) * asfloat(cb0_raw[20u].z);

  float3 lut_input_1 = float3(_54, _55, _56);

  float lut_peak = renodx::color::yf::from::BT709(LUTSampling1(100.f));
  float y_in = renodx::color::yf::from::BT709(lut_input_1);
  float y_out = renodx::tonemap::Neutwo(y_in, lut_peak);

  float3 reference_color_1 = renodx::color::correct::Luminance(lut_input_1, y_in, y_out);
  //float scale = renodx::math::DivideSafe(y_out, y_in, 1.f);

  // float3 lut_peak = LUTSampling1(100.f);
  // float3 reference_color_1 = renodx::tonemap::neutwo::PerChannel(lut_input_1, lut_peak);


  float3 lut_output_1 = LUTSampling1(lut_input_1);

  float3 lut_upgraded_1 = renodx::tonemap::UpgradeToneMap(lut_input_1, reference_color_1, lut_output_1);
  //float3 lut_upgraded_1 = UpgradeToneMapPerChannel(lut_input_1, reference_color_1, lut_output_1);

  //lut_upgraded_1 = lut_output_1;

  _63 = lut_upgraded_1.z;
  _64 = lut_upgraded_1.y;
  _65 = lut_upgraded_1.x;

  if (asfloat(cb0_raw[23u].w) > 0.10000000149011612f) {
    _154 = asfloat(cb0_raw[23u].x) * _65;
    _155 = asfloat(cb0_raw[23u].y) * _64;
    _156 = asfloat(cb0_raw[23u].z) * _63;
    _157 = dot(float3(_65, _64, _63), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
    _158 = dot(float3(_154, _155, _156), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
    if (!(_158 == 0.0f)) {
      _168 = ((_157 * _154) / _158);
      _169 = ((_157 * _155) / _158);
      _170 = ((_157 * _156) / _158);
    } else {
      _168 = _154;
      _169 = _155;
      _170 = _156;
    }
  } else {
    _168 = _65;
    _169 = _64;
    _170 = _63;
  }

  // SKIP Sat by Y
  // _173 = dot(float3(_168, _169, _170), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
  // _180 = ((_168 - _173) * asfloat(cb0_raw[22u].w)) + _173;
  // _181 = ((_169 - _173) * asfloat(cb0_raw[22u].w)) + _173;
  // _182 = ((_170 - _173) * asfloat(cb0_raw[22u].w)) + _173;

  _180 = _168;
  _181 = _169;
  _182 = _170;

  float3 graded = float3(_180, _181, _182);
  const float mid_gray = 0.18f;
  float4 mid_gray_out_sdr;
  float4 mid_gray_out_hdr;
  LUTSampling2(mid_gray, mid_gray_out_sdr, mid_gray_out_hdr);
  mid_gray_out_sdr = renodx::math::Average(mid_gray_out_sdr.xyz);
  mid_gray_out_hdr = renodx::math::Average(mid_gray_out_hdr.xyz);

  float4 lut_peak_sdr;
  float4 lut_peak_hdr;
  LUTSampling2(100.f, lut_peak_sdr, lut_peak_hdr);
  float3 reference_color_2 = renodx::tonemap::neutwo::PerChannel(graded, lut_peak_hdr.xyz);

  //inout for following colors
  float4 sdr_color;
  float4 hdr_color;
  LUTSampling2(graded, sdr_color, hdr_color);

  hdr_color.xyz = UpgradeToneMapPerChannel(graded, reference_color_2, hdr_color.xyz);

  _276 = hdr_color.x;
  _277 = hdr_color.y;
  _278 = hdr_color.z;

#if TONE_MAP_TYPE == 2
  sdr_color.xyz = renodx::tonemap::psycho::psychotm_test17_customized(
      //renodx::color::correct::Gamma(graded, true),
      graded,
      renodx::color::correct::Gamma(1.f),
      1.f,
      0.8f,
      1.f,
      1.f,
      asfloat(cb0_raw[22u].w),
      0.1f,
      100.f,
      1.f,
      1.f,
      1,
      1.25f,
      mid_gray,
      mid_gray_out_sdr.x,
      1.f,
      0
  );
 sdr_color.xyz = renodx::color::correct::Gamma(sdr_color.xyz, true);
#endif

  u0[int3((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y), (int)(SV_DispatchThreadID.z))] = sdr_color;

  // float3 lut_output_1 = float3(_276, _277, _278);
  // float3 upgraded_output = renodx::tonemap::UpgradeToneMap(lut_input_1, reference_color_1, lut_output_1);
  //float3 upgraded_output = UpgradeToneMapPerChannel(lut_input, reference_color, lut_output);
  //float3 upgraded_output = lut_output / scale;
  // _276 = upgraded_output.x;
  // _277 = upgraded_output.y;
  // _278 = upgraded_output.z;

  // _276 = renodx::math::DivideSafe(_276, scale, renodx::math::FLT_MAX);
  // _277 = renodx::math::DivideSafe(_277, scale, renodx::math::FLT_MAX);
  // _278 = renodx::math::DivideSafe(_278, scale, renodx::math::FLT_MAX);

  float4 output_color;
  output_color.w = 0.f;

  float3 untonemapped = float3(_276, _277, _278);
  float calculated_peak = asfloat(cb0_raw[21u].z);

#if TONE_MAP_TYPE == 2

  float3 tonemapped = renodx::tonemap::psycho::psychotm_test17_customized(
      lut_input_1,
      calculated_peak,
      1.f,
      0.8f,
      1.f,
      1.f,
      asfloat(cb0_raw[22u].w),
      0.1f,
      100.f,
      1.f,
      1.f,
      1,
      1.25f,
      mid_gray,
      mid_gray_out_hdr.x
  );
  output_color.xyz = tonemapped;
#elif TONE_MAP_TYPE == 1
  float3 neutwo_input = renodx::color::bt2020::from::BT709(untonemapped);
  float3 tonemapped = renodx::tonemap::neutwo::PerChannel(neutwo_input, calculated_peak);
  float3 neutwo_output = renodx::color::bt709::from::BT2020(tonemapped);
   output_color.xyz = neutwo_output;
   //output_color.xyz = hdr_color.xyz;
   //output_color.xyz = graded;
#else
  _284 = (_276 / asfloat(cb0_raw[21u].z));
  _285 = (_277 / asfloat(cb0_raw[21u].z));
  _286 = (_278 / asfloat(cb0_raw[21u].z));

    // Vanilla clamps to 0
    _284 = max(_284, 0.0f);
    _285 = max(_285, 0.0f);
    _286 = max(_286, 0.0f);

    _289 = asfloat(cb0_raw[24u].x) * 2.0f;
    if (_284 < _289) {
      _297 = (((_284 * _284) * asfloat(cb0_raw[24u].y)) + asfloat(cb0_raw[24u].x));
    } else {
      _297 = _284;
    }
    _300 = (asfloat(cb0_raw[22u].y) == -999.0f);
    if (!(_300 || (_297 < asfloat(cb0_raw[22u].x)))) {
      if (_297 < (asfloat(cb0_raw[21u].w) + 1.0f)) {
        _322 = (-0.0f - (exp2((((asfloat(cb0_raw[22u].z) * 0.6931471824645996f) * log2(-0.0f - ((-1.0f - asfloat(cb0_raw[21u].w)) + _297))) + asfloat(cb0_raw[22u].y)) * 1.4426950216293335f) + -1.0f));
      } else {
        _322 = 1.0f;
      }
    } else {
      _322 = _297;
    }
    if (_285 < _289) {
      _330 = (((_285 * _285) * asfloat(cb0_raw[24u].y)) + asfloat(cb0_raw[24u].x));
    } else {
      _330 = _285;
    }
    if (!(_300 || (_330 < asfloat(cb0_raw[22u].x)))) {
      if (_330 < (asfloat(cb0_raw[21u].w) + 1.0f)) {
        _352 = (-0.0f - (exp2((((asfloat(cb0_raw[22u].z) * 0.6931471824645996f) * log2(-0.0f - ((-1.0f - asfloat(cb0_raw[21u].w)) + _330))) + asfloat(cb0_raw[22u].y)) * 1.4426950216293335f) + -1.0f));
      } else {
        _352 = 1.0f;
      }
    } else {
      _352 = _330;
    }
    if (_286 < _289) {
      _360 = (((_286 * _286) * asfloat(cb0_raw[24u].y)) + asfloat(cb0_raw[24u].x));
    } else {
      _360 = _286;
    }
    if (!(_300 || (_360 < asfloat(cb0_raw[22u].x)))) {
      if (_360 < (asfloat(cb0_raw[21u].w) + 1.0f)) {
        _382 = (-0.0f - (exp2((((asfloat(cb0_raw[22u].z) * 0.6931471824645996f) * log2(-0.0f - ((-1.0f - asfloat(cb0_raw[21u].w)) + _360))) + asfloat(cb0_raw[22u].y)) * 1.4426950216293335f) + -1.0f));
      } else {
        _382 = 1.0f;
      }
    } else {
      _382 = _360;
    }

    output_color = float4((_322 * asfloat(cb0_raw[21u].z)), (_352 * asfloat(cb0_raw[21u].z)), (_382 * asfloat(cb0_raw[21u].z)), 0.0f);
#endif

  u1[int3((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y), (int)(SV_DispatchThreadID.z))] = output_color;

}