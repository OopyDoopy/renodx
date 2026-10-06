#include "./saturation_common.hlsli"

Texture2D<float4> t0 : register(t0);

SamplerState s1 : register(s1);

float PhotomodeApplyExposureAndOptionalVanillaContrast(float color) {
  float exposure_applied = CustomPixelConsts_288.x * color;
  float contrast_output = ((exposure_applied - 0.5f) * CustomPixelConsts_288.y) + 0.5f;
  if (CUSTOM_GRADING_IMPROVEMENTS == 1.f
      && RENODX_TONE_MAP_TYPE != 0.f
      && (exposure_applied < 0.0f || exposure_applied > 1.0f
          || contrast_output < 0.0f || contrast_output > 1.0f)) {
    return contrast_output;
  }

  return saturate(
      ((saturate(exposure_applied) - 0.5f) * CustomPixelConsts_288.y) + 0.5f);
}

float PhotomodeShapeChannel(float color, float noise, float luminance, float luminance_scale) {
  float curve_input =
      (((color * luminance_scale) - luminance) * CustomPixelConsts_288.z) + luminance;
  float vanilla_input = abs(saturate(noise + saturate(curve_input)));
  float shaped_input = max(
      0.0f,
      (CustomPixelConsts_224.x * exp2(log2(vanilla_input) * CustomPixelConsts_128.x))
          + CustomPixelConsts_224.y);
  float vanilla_output = exp2(log2(shaped_input) * CustomPixelConsts_224.z);
  if (CUSTOM_GRADING_IMPROVEMENTS != 1.f || RENODX_TONE_MAP_TYPE == 0.f) {
    return vanilla_output;
  }

  float signed_input = curve_input + noise;
  float extended_shaped_input = CustomPixelConsts_224.x
      * renodx::math::SignPow(signed_input, CustomPixelConsts_128.x)
      + CustomPixelConsts_224.y;
  float extended_output = renodx::math::SignPow(extended_shaped_input, CustomPixelConsts_224.z);
  if (curve_input < 0.0f || curve_input > 1.0f
      || signed_input < 0.0f || signed_input > 1.0f
      || extended_output < 0.0f || extended_output > 1.0f) {
    return extended_output;
  }

  return vanilla_output;
}

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD,
  linear float2 TEXCOORD_2 : TEXCOORD2
) : SV_Target {
  float4 SV_Target = 0;
  float _17 = (TEXCOORD.x - CustomPixelConsts_272.x) / CustomPixelConsts_272.x;
  float _18 = (TEXCOORD.y - CustomPixelConsts_272.y) / CustomPixelConsts_272.y;
  float _22 = sqrt((_18 * _18) + (_17 * _17));
  float _25 = saturate((_22 - CustomPixelConsts_256.y) * CustomPixelConsts_256.z);
  float4 _28 = t0.SampleLevel(s1, float2(TEXCOORD.x, TEXCOORD.y), 0.0f);
  float _59;
  float _60;
  [branch]
  if (_25 > 0.0f) {
    float _43 = ((_25 * _25) * CustomPixelConsts_256.x) * min(max((1.0f / _22), -3.4028234663852886e+38f), 3.4028234663852886e+38f);
    float _45 = (_17 * CustomPixelConsts_272.z) * _43;
    float _47 = (_18 * CustomPixelConsts_272.w) * _43;
    float4 _52 = t0.SampleLevel(s1, float2((TEXCOORD.x - (_45 * 2.0f)), (TEXCOORD.y - (_47 * 2.0f))), 0.0f);
    float4 _56 = t0.SampleLevel(s1, float2((TEXCOORD.x - _45), (TEXCOORD.y - _47)), 0.0f);
    _59 = _52.x;
    _60 = _56.y;
  } else {
    _59 = _28.x;
    _60 = _28.y;
  }
  float _79 = PhotomodeApplyExposureAndOptionalVanillaContrast(_59);
  float _80 = PhotomodeApplyExposureAndOptionalVanillaContrast(_60);
  float _81 = PhotomodeApplyExposureAndOptionalVanillaContrast(_28.z);
  bool _83 = (CustomPixelConsts_288.w <= 6500.0f);
  float _92 = saturate((CustomPixelConsts_288.w + -1000.0f) * -0.0010000000474974513f);
  float _96 = (_92 * _92) * (3.0f - (_92 * 2.0f));
  float _109 = min(max(((select(_83, 0.0f, 1745.04248046875f) / (select(_83, 0.0f, -2666.347412109375f) + CustomPixelConsts_288.w)) + select(_83, 1.0f, 0.5599538683891296f)), 0.0f), 1.0f);
  float _110 = min(max(((select(_83, -2902.195556640625f, 1216.6168212890625f) / (select(_83, 1669.580322265625f, -2173.101318359375f) + CustomPixelConsts_288.w)) + select(_83, 1.3302674293518066f, 0.7038120031356812f)), 0.0f), 1.0f);
  float _111 = min(max((1.8993754386901855f - (8257.7998046875f / (CustomPixelConsts_288.w + 2575.28271484375f))), 0.0f), 1.0f);
  float _130 = ((((lerp(_109, 1.0f, _96)) * _79) - _79) * 0.699999988079071f) + _79;
  float _131 = ((((lerp(_110, 1.0f, _96)) * _80) - _80) * 0.699999988079071f) + _80;
  float _132 = ((((lerp(_111, 1.0f, _96)) * _81) - _81) * 0.699999988079071f) + _81;
  float _133 = dot(float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f), float3(_130, _131, _132));
    float _136 = _133
      / max(
        dot(
          float3(_130, _131, _132),
          float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f)),
        9.999999747378752e-06f);
  float _156 = (TEXCOORD_2.x * 0.125f) * CustomPixelConsts_304.z;
  float _159 = (TEXCOORD_2.y * 0.125f) * CustomPixelConsts_304.w;
  float _161 = CustomPixelConsts_304.y * 10.0f;
  float _162 = dot(float3(_156, _159, _161), float3(0.3333333432674408f, 0.3333333432674408f, 0.3333333432674408f));
  float _166 = floor(_156 + _162);
  float _167 = floor(_159 + _162);
  float _168 = floor(_161 + _162);
  float _172 = dot(float3(_166, _167, _168), float3(0.1666666716337204f, 0.1666666716337204f, 0.1666666716337204f));
  float _173 = _172 + (_156 - _166);
  float _174 = _172 + (_159 - _167);
  float _175 = (_161 - _168) + _172;
  float _179 = select((_173 < _174), 0.0f, 1.0f);
  float _180 = select((_174 < _175), 0.0f, 1.0f);
  float _181 = select((_175 < _173), 0.0f, 1.0f);
  float _182 = 1.0f - _179;
  float _183 = 1.0f - _180;
  float _184 = 1.0f - _181;
  float _185 = min(_179, _184);
  float _186 = min(_180, _182);
  float _187 = min(_181, _183);
  float _188 = max(_179, _184);
  float _189 = max(_180, _182);
  float _190 = max(_181, _183);
  float _194 = (_173 - _185) + 0.1666666716337204f;
  float _195 = (_174 - _186) + 0.1666666716337204f;
  float _196 = (_175 - _187) + 0.1666666716337204f;
  float _200 = (_173 - _188) + 0.3333333432674408f;
  float _201 = (_174 - _189) + 0.3333333432674408f;
  float _202 = (_175 - _190) + 0.3333333432674408f;
  float _203 = _173 + -0.5f;
  float _204 = _174 + -0.5f;
  float _205 = _175 + -0.5f;
  float _215 = _166 - (floor(_166 * 0.0034602077212184668f) * 289.0f);
  float _216 = _167 - (floor(_167 * 0.0034602077212184668f) * 289.0f);
  float _217 = _168 - (floor(_168 * 0.0034602077212184668f) * 289.0f);
  float _218 = _217 + _187;
  float _219 = _217 + _190;
  float _220 = _217 + 1.0f;
  float _229 = ((_217 * 34.0f) + 10.0f) * _217;
  float _230 = ((_218 * 34.0f) + 10.0f) * _218;
  float _231 = ((_219 * 34.0f) + 10.0f) * _219;
  float _232 = ((_220 * 34.0f) + 10.0f) * _220;
  float _246 = (_229 - (floor(_229 * 0.0034602077212184668f) * 289.0f)) + _216;
  float _249 = ((_216 + _186) - (floor(_230 * 0.0034602077212184668f) * 289.0f)) + _230;
  float _252 = ((_216 + _189) - (floor(_231 * 0.0034602077212184668f) * 289.0f)) + _231;
  float _255 = ((_216 + 1.0f) - (floor(_232 * 0.0034602077212184668f) * 289.0f)) + _232;
  float _264 = ((_246 * 34.0f) + 10.0f) * _246;
  float _265 = ((_249 * 34.0f) + 10.0f) * _249;
  float _266 = ((_252 * 34.0f) + 10.0f) * _252;
  float _267 = ((_255 * 34.0f) + 10.0f) * _255;
  float _281 = (_264 - (floor(_264 * 0.0034602077212184668f) * 289.0f)) + _215;
  float _284 = ((_215 + _185) - (floor(_265 * 0.0034602077212184668f) * 289.0f)) + _265;
  float _287 = ((_215 + _188) - (floor(_266 * 0.0034602077212184668f) * 289.0f)) + _266;
  float _290 = ((_215 + 1.0f) - (floor(_267 * 0.0034602077212184668f) * 289.0f)) + _267;
  float _299 = ((_281 * 34.0f) + 10.0f) * _281;
  float _300 = ((_284 * 34.0f) + 10.0f) * _284;
  float _301 = ((_287 * 34.0f) + 10.0f) * _287;
  float _302 = ((_290 * 34.0f) + 10.0f) * _290;
  float _315 = _299 - (floor(_299 * 0.0034602077212184668f) * 289.0f);
  float _316 = _300 - (floor(_300 * 0.0034602077212184668f) * 289.0f);
  float _317 = _301 - (floor(_301 * 0.0034602077212184668f) * 289.0f);
  float _318 = _302 - (floor(_302 * 0.0034602077212184668f) * 289.0f);
  float _331 = _315 - (floor(_315 * 0.020408164709806442f) * 49.0f);
  float _332 = _316 - (floor(_316 * 0.020408164709806442f) * 49.0f);
  float _333 = _317 - (floor(_317 * 0.020408164709806442f) * 49.0f);
  float _334 = _318 - (floor(_318 * 0.020408164709806442f) * 49.0f);
  float _339 = floor(_331 * 0.1428571492433548f);
  float _340 = floor(_332 * 0.1428571492433548f);
  float _341 = floor(_333 * 0.1428571492433548f);
  float _342 = floor(_334 * 0.1428571492433548f);
  float _359 = (_339 * 0.2857142984867096f) + -0.9285714030265808f;
  float _360 = (_340 * 0.2857142984867096f) + -0.9285714030265808f;
  float _361 = (_341 * 0.2857142984867096f) + -0.9285714030265808f;
  float _362 = (_342 * 0.2857142984867096f) + -0.9285714030265808f;
  float _367 = (floor(_331 - (_339 * 7.0f)) * 0.2857142984867096f) + -0.9285714030265808f;
  float _368 = (floor(_332 - (_340 * 7.0f)) * 0.2857142984867096f) + -0.9285714030265808f;
  float _369 = (floor(_333 - (_341 * 7.0f)) * 0.2857142984867096f) + -0.9285714030265808f;
  float _370 = (floor(_334 - (_342 * 7.0f)) * 0.2857142984867096f) + -0.9285714030265808f;
  float _383 = (1.0f - abs(_359)) - abs(_367);
  float _384 = (1.0f - abs(_360)) - abs(_368);
  float _385 = (1.0f - abs(_361)) - abs(_369);
  float _386 = (1.0f - abs(_362)) - abs(_370);
  float _415 = select((_383 > 0.0f), -0.0f, -1.0f);
  float _416 = select((_384 > 0.0f), -0.0f, -1.0f);
  float _417 = select((_385 > 0.0f), -0.0f, -1.0f);
  float _418 = select((_386 > 0.0f), -0.0f, -1.0f);
  float _423 = (((floor(_359) * 2.0f) + 1.0f) * _415) + _359;
  float _424 = (((floor(_367) * 2.0f) + 1.0f) * _415) + _367;
  float _425 = (((floor(_360) * 2.0f) + 1.0f) * _416) + _360;
  float _426 = (((floor(_368) * 2.0f) + 1.0f) * _416) + _368;
  float _431 = (((floor(_361) * 2.0f) + 1.0f) * _417) + _361;
  float _432 = (((floor(_369) * 2.0f) + 1.0f) * _417) + _369;
  float _433 = (((floor(_362) * 2.0f) + 1.0f) * _418) + _362;
  float _434 = (((floor(_370) * 2.0f) + 1.0f) * _418) + _370;
  float _443 = 1.7928428649902344f - (dot(float3(_423, _424, _383), float3(_423, _424, _383)) * 0.8537347316741943f);
  float _444 = 1.7928428649902344f - (dot(float3(_425, _426, _384), float3(_425, _426, _384)) * 0.8537347316741943f);
  float _445 = 1.7928428649902344f - (dot(float3(_431, _432, _385), float3(_431, _432, _385)) * 0.8537347316741943f);
  float _446 = 1.7928428649902344f - (dot(float3(_433, _434, _386), float3(_433, _434, _386)) * 0.8537347316741943f);
  float _467 = max((0.5f - dot(float3(_173, _174, _175), float3(_173, _174, _175))), 0.0f);
  float _468 = max((0.5f - dot(float3(_194, _195, _196), float3(_194, _195, _196))), 0.0f);
  float _469 = max((0.5f - dot(float3(_200, _201, _202), float3(_200, _201, _202))), 0.0f);
  float _470 = max((0.5f - dot(float3(_203, _204, _205), float3(_203, _204, _205))), 0.0f);
  float _471 = _467 * _467;
  float _472 = _468 * _468;
  float _473 = _469 * _469;
  float _474 = _470 * _470;
  float _486 = (CustomPixelConsts_304.x * 105.0f) * dot(float4((_471 * _471), (_472 * _472), (_473 * _473), (_474 * _474)), float4(dot(float3((_443 * _423), (_443 * _424), (_443 * _383)), float3(_173, _174, _175)), dot(float3((_444 * _425), (_444 * _426), (_444 * _384)), float3(_194, _195, _196)), dot(float3((_445 * _431), (_445 * _432), (_445 * _385)), float3(_200, _201, _202)), dot(float3((_446 * _433), (_446 * _434), (_446 * _386)), float3(_203, _204, _205))));
  float _526 = PhotomodeShapeChannel(_130, _486, _133, _136);
  float _527 = PhotomodeShapeChannel(_131, _486, _133, _136);
  float _528 = PhotomodeShapeChannel(_132, _486, _133, _136);
  float _529 = dot(float3(0.29899999499320984f, 0.5870000123977661f, 0.11400000005960464f), float3(_526, _527, _528));
  float _535 = saturate((_529 - CustomPixelConsts_160.x) * CustomPixelConsts_160.y);
  float _540 = saturate((_529 - CustomPixelConsts_160.z) * CustomPixelConsts_160.w);
  float _550;
  float _551;
  float _552;
  if (CUSTOM_GRADING_IMPROVEMENTS == 1.f && RENODX_TONE_MAP_TYPE != 0.f) {
    _550 = renodx::math::SignPow(_526, 2.200000047683716f);
    _551 = renodx::math::SignPow(_527, 2.200000047683716f);
    _552 = renodx::math::SignPow(_528, 2.200000047683716f);
  } else {
    _550 = exp2(log2(saturate(_526)) * 2.200000047683716f);
    _551 = exp2(log2(saturate(_527)) * 2.200000047683716f);
    _552 = exp2(log2(saturate(_528)) * 2.200000047683716f);
  }
  float _553 = dot(float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f), float3(_550, _551, _552));
  float _572 = ((CustomPixelConsts_176.x - CustomPixelConsts_192.x) * _535) + CustomPixelConsts_192.x;
  float _573 = ((CustomPixelConsts_176.y - CustomPixelConsts_192.y) * _535) + CustomPixelConsts_192.y;
  float _574 = ((CustomPixelConsts_176.z - CustomPixelConsts_192.z) * _535) + CustomPixelConsts_192.z;
  float _575 = ((CustomPixelConsts_176.w - CustomPixelConsts_192.w) * _535) + CustomPixelConsts_192.w;
  float _592 = ((CustomPixelConsts_208.w - _575) * _540) + _575;
  float grade_channel_r;
  float grade_channel_g;
  float grade_channel_b;
  float _621;
  float _622;
  float _623;
  if (CUSTOM_GRADING_IMPROVEMENTS == 1.f && RENODX_TONE_MAP_TYPE != 0.f) {
    grade_channel_r = ((_592 * (_550 - _553)) + _553) * lerp(_572, CustomPixelConsts_208.x, _540);
    grade_channel_g = ((_592 * (_551 - _553)) + _553) * lerp(_573, CustomPixelConsts_208.y, _540);
    grade_channel_b = ((_592 * (_552 - _553)) + _553) * lerp(_574, CustomPixelConsts_208.z, _540);
    _621 = CustomPixelConsts_144.x * renodx::math::SignPow(grade_channel_r, 0.4545454680919647f);
    _622 = CustomPixelConsts_144.y * renodx::math::SignPow(grade_channel_g, 0.4545454680919647f);
    _623 = CustomPixelConsts_144.z * renodx::math::SignPow(grade_channel_b, 0.4545454680919647f);
  } else {
    grade_channel_r = ((_592 * (_550 - _553)) + _553) * lerp(_572, CustomPixelConsts_208.x, _540);
    grade_channel_g = ((_592 * (_551 - _553)) + _553) * lerp(_573, CustomPixelConsts_208.y, _540);
    grade_channel_b = ((_592 * (_552 - _553)) + _553) * lerp(_574, CustomPixelConsts_208.z, _540);
    _621 = CustomPixelConsts_144.x * exp2(log2(saturate(grade_channel_r)) * 0.4545454680919647f);
    _622 = CustomPixelConsts_144.y * exp2(log2(saturate(grade_channel_g)) * 0.4545454680919647f);
    _623 = CustomPixelConsts_144.z * exp2(log2(saturate(grade_channel_b)) * 0.4545454680919647f);
  }
  SaturationGrade photo_mode_grade;
  if (CUSTOM_GRADING_IMPROVEMENTS == 1.f && RENODX_TONE_MAP_TYPE != 0.f) {
    photo_mode_grade.ungraded = float3(_550, _551, _552);
  } else {
    photo_mode_grade = ApplySaturationGrade(float3(_59, _60, _28.z));
  }
  photo_mode_grade.graded_gamma = float3(_621, _622, _623);
  float3 gamma_color = ApplyUserColorGrading(photo_mode_grade);
  float _624 = TEXCOORD_2.x + -0.5f;
  float _625 = TEXCOORD_2.y + -0.5f;
  float _636 = saturate((((sqrt((_625 * _625) + (_624 * _624)) * 2.0f) + -0.550000011920929f) + CustomPixelConsts_112.w) * 1.2195122241973877f);
  float _637 = _636 * _636;
  float3 vignette_luminance_source = renodx::color::gamma::DecodeSafe(gamma_color, 2.2f);
  float vignette_shape = min(
      dot(
          float4(-0.10000000149011612f, -0.10499999672174454f, 1.1200000047683716f, 0.09000000357627869f),
          float4(_637 * _637, _637 * _636, _637, _636)),
      0.9399999976158142f);
  float vignette_luminance = dot(vignette_luminance_source, CustomPixelConsts_096.rgb);
  float vignette = saturate(
      CustomPixelConsts_096.w
      * vignette_shape
      * saturate(1.0f - vignette_luminance)
      * CUSTOM_VIGNETTE);
  float3 vignetted_gamma = lerp(
      gamma_color,
      CustomPixelConsts_112.rgb * CUSTOM_VIGNETTE_BLACK_LEVEL,
      vignette);
  float3 output_gamma = ApplyOutputRange(vignetted_gamma);
  if (RENODX_TONE_MAP_TYPE == 0.f) {
    output_gamma = saturate(output_gamma);
  }
  SV_Target.rgb = ApplyFinalGradingTonemap(output_gamma);
  SV_Target.w = _28.w;
  return SV_Target;
}
