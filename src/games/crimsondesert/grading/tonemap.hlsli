#include "../common.hlsl"
#include "./debug.hlsli"

cbuffer __3__35__0__0__ExposureConstantBuffer : register(b29, space35) {
  float4 _exposure0 : packoffset(c000.x);
  float4 _exposure1 : packoffset(c001.x);
  float4 _exposure2 : packoffset(c002.x);
  float4 _exposure3 : packoffset(c003.x);
  float4 _exposure4 : packoffset(c004.x);
};

// AE2 fields used by the grading path:
//   _exposure0.x = final adapted exposure scalar written by AdaptExposure
//   _exposure2.x = raw meter / histogram luminance
//   _exposure2.y = signed fast-direction settling delta from the clean field
//   _exposure2.z = clean adapted field ("Adapt" in the debug panel)
//   _exposure2.w = signed slow-direction settling delta from the clean field
//   _exposure4.z = filtered exposure history used by glare/lens effects

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
  int3 _padding : packoffset(c012.y);
};

// _userImageAdjust.z is the grading exposure multiplier
// ("ColorGradeExposure" in the addon UI). It sits on top of the AE solve.


float GetPerceptualAdaptedFieldYf() {
  // Prefer the clean adapted field, then fall back to the raw meter when
  // history is invalid (first frame / load / reset).
  float field_state = _exposure2.z;

  // AE2 exposes the live adaptation anchor as the clean field plus signed
  // settling deltas. Negative FastBg means the observer is still catching up
  // to a brighter field; positive SlowBg means the observer is still carrying
  // a brighter past state into a darker field.
  float fast_equivalent_background = _exposure2.y;
  float slow_equivalent_background = _exposure2.w;

  return field_state + fast_equivalent_background + slow_equivalent_background;
}

// // Core SDR curve stage only. Expects per-channel linear inputs and outputs in the same space.
// float3 SDRCurveOnly(float3 color) {
//   float _2972 = min(max(log2(max(color.x, 0.0f)), -12.473930358886719f), 4.026069164276123f) + 12.473930358886719f;
//   float _2973 = min(max(log2(max(color.y, 0.0f)), -12.473930358886719f), 4.026069164276123f) + 12.473930358886719f;
//   float _2974 = min(max(log2(max(color.z, 0.0f)), -12.473930358886719f), 4.026069164276123f) + 12.473930358886719f;
//   float _2975 = _2972 * 0.06060606241226196f;
//   float _2976 = _2973 * 0.06060606241226196f;
//   float _2977 = _2974 * 0.06060606241226196f;
//   float _2978 = _2975 * _2975;
//   float _2979 = _2976 * _2976;
//   float _2980 = _2977 * _2977;
//   float _3026 = min(0.0f, (-0.0f - (((_2972 * 0.007218181621283293f) + ((_2978 * 0.42980000376701355f) + (((_2978 * _2978) * ((31.959999084472656f - (_2972 * 2.432727336883545f)) + (_2978 * 15.5f))) - ((_2972 * 0.41624245047569275f) * _2978)))) + -0.002319999970495701f)));
//   float _3027 = min(0.0f, (-0.0f - (((_2973 * 0.007218181621283293f) + ((_2979 * 0.42980000376701355f) + (((_2979 * _2979) * ((31.959999084472656f - (_2973 * 2.432727336883545f)) + (_2979 * 15.5f))) - ((_2973 * 0.41624245047569275f) * _2979)))) + -0.002319999970495701f)));
//   float _3028 = min(0.0f, (-0.0f - (((_2974 * 0.007218181621283293f) + ((_2980 * 0.42980000376701355f) + (((_2980 * _2980) * ((31.959999084472656f - (_2974 * 2.432727336883545f)) + (_2980 * 15.5f))) - ((_2974 * 0.41624245047569275f) * _2980)))) + -0.002319999970495701f)));
//   float _3029 = -0.0f - _3026;
//   float _3030 = -0.0f - _3027;
//   float _3031 = -0.0f - _3028;
//   float _3032 = dot(float3(_3029, _3030, _3031), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
//   float _3038 = saturate((_exposure2.x + -3.0f) * 0.1428571492433548f) * 0.20000004768371582f;
//   float _3039 = _3038 + 1.0f;
//   float _3070 = ((exp2(log2((_3039 - (_3038 * saturate((_3026 * _3026) * _3029))) * _3029)) - _3032) * 1.399999976158142f) + _3032;
//   float _3071 = ((exp2(log2((_3039 - (saturate((_3027 * _3027) * _3030) * _3038)) * _3030)) - _3032) * 1.399999976158142f) + _3032;
//   float _3072 = ((exp2(log2((_3039 - (saturate((_3028 * _3028) * _3031) * _3038)) * _3031)) - _3032) * 1.399999976158142f) + _3032;
//   return float3(_3070, _3071, _3072);
// }

float3 ACESv2Curves(float3 color) {
  float _2972 = min(max(log2(mad(color.z, 0.07922374457120895f, mad(color.y, 0.07843360304832458f, (color.x * 0.8424790501594543f)))), -12.473930358886719f), 4.026069164276123f) + 12.473930358886719f;
  float _2973 = min(max(log2(mad(color.z, 0.07916612923145294f, mad(color.y, 0.8784686326980591f, (color.x * 0.04232824221253395f)))), -12.473930358886719f), 4.026069164276123f) + 12.473930358886719f;
  float _2974 = min(max(log2(mad(color.z, 0.8791429996490479f, mad(color.y, 0.07843360304832458f, (color.x * 0.042375653982162476f)))), -12.473930358886719f), 4.026069164276123f) + 12.473930358886719f;
  float _2975 = _2972 * 0.06060606241226196f;
  float _2976 = _2973 * 0.06060606241226196f;
  float _2977 = _2974 * 0.06060606241226196f;
  float _2978 = _2975 * _2975;
  float _2979 = _2976 * _2976;
  float _2980 = _2977 * _2977;
  float _3026 = min(0.0f, (-0.0f - (((_2972 * 0.007218181621283293f) + ((_2978 * 0.42980000376701355f) + (((_2978 * _2978) * ((31.959999084472656f - (_2972 * 2.432727336883545f)) + (_2978 * 15.5f))) - ((_2972 * 0.41624245047569275f) * _2978)))) + -0.002319999970495701f)));
  float _3027 = min(0.0f, (-0.0f - (((_2973 * 0.007218181621283293f) + ((_2979 * 0.42980000376701355f) + (((_2979 * _2979) * ((31.959999084472656f - (_2973 * 2.432727336883545f)) + (_2979 * 15.5f))) - ((_2973 * 0.41624245047569275f) * _2979)))) + -0.002319999970495701f)));
  float _3028 = min(0.0f, (-0.0f - (((_2974 * 0.007218181621283293f) + ((_2980 * 0.42980000376701355f) + (((_2980 * _2980) * ((31.959999084472656f - (_2974 * 2.432727336883545f)) + (_2980 * 15.5f))) - ((_2974 * 0.41624245047569275f) * _2980)))) + -0.002319999970495701f)));
  float _3029 = -0.0f - _3026;
  float _3030 = -0.0f - _3027;
  float _3031 = -0.0f - _3028;
  float _3032 = dot(float3(_3029, _3030, _3031), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
  float _3038 = saturate((_exposure2.x + -3.0f) * 0.1428571492433548f) * 0.20000004768371582f;
  float _3039 = _3038 + 1.0f;
  float _3070 = ((exp2(log2((_3039 - (_3038 * saturate((_3026 * _3026) * _3029))) * _3029)) - _3032) * 1.399999976158142f) + _3032;
  float _3071 = ((exp2(log2((_3039 - (saturate((_3027 * _3027) * _3030) * _3038)) * _3030)) - _3032) * 1.399999976158142f) + _3032;
  float _3072 = ((exp2(log2((_3039 - (saturate((_3028 * _3028) * _3031) * _3038)) * _3031)) - _3032) * 1.399999976158142f) + _3032;
  float _3091 = saturate(exp2(log2(mad(_3072, -0.09902974218130112f, mad(_3071, -0.09802088141441345f, (_3070 * 1.1968790292739868f)))) * 2.200000047683716f));
  float _3092 = saturate(exp2(log2(mad(_3072, -0.09896117448806763f, mad(_3071, 1.1519031524658203f, (_3070 * -0.052896853536367416f)))) * 2.200000047683716f));
  float _3093 = saturate(exp2(log2(mad(_3072, 1.151073694229126f, mad(_3071, -0.09804344922304153f, (_3070 * -0.05297163501381874f)))) * 2.200000047683716f));
  return float3(_3091, _3092, _3093);
}

float3 VanillaCurves(float3 color) {
  float3 aces = ACESv2Curves(color);
  float curveR = aces.x;
  float curveG = aces.y;
  float curveB = aces.z;

  if (_etcParams.z == 0.0f) {
    float blendAmount = 1.0f - abs(_etcParams.w);
    float blendOffset = saturate(_etcParams.w);
    float blendedR = (blendAmount * curveR) + blendOffset;
    float blendedG = (blendAmount * curveG) + blendOffset;
    float blendedB = (blendAmount * curveB) + blendOffset;

    if (_colorGradingParams.w > 0.0f) {
      float gradeStrength = saturate(_colorGradingParams.w);
      blendedR = (((max(0.0f, (1.0f - blendedR)) - blendedR) * gradeStrength) + blendedR);
      blendedG = (((max(0.0f, (1.0f - blendedG)) - blendedG) * gradeStrength) + blendedG);
      blendedB = (((max(0.0f, (1.0f - blendedB)) - blendedB) * gradeStrength) + blendedB);
    }

    float contrast = _userImageAdjust.y + 1.0f;
    float offset = _userImageAdjust.x + 0.5f;
    float gamma = 2.200000047683716f / ((min(max(_userImageAdjust.w, -1.0f), 1.0f) * 0.800000011920929f) + 2.200000047683716f);

    curveR = exp2(log2(saturate(((blendedR + -0.5f) * contrast) + offset)) * gamma);
    curveG = exp2(log2(saturate(((blendedG + -0.5f) * contrast) + offset)) * gamma);
    curveB = exp2(log2(saturate(((blendedB + -0.5f) * contrast) + offset)) * gamma);
  }

  return float3(curveR, curveG, curveB);
}

float3 SDRToneMap(float3 color, bool use_color_blind = false, bool use_etc_params = true) {
  float _1675, _1676, _1677;
  float _1797, _1798, _1799;
  float _25[36];

  _25[0] = 1.0f;
  _25[1] = 0.0f;
  _25[2] = 0.0f;
  _25[3] = 0.0f;
  _25[4] = 1.0f;
  _25[5] = 0.0f;
  _25[6] = 0.0f;
  _25[7] = 0.0f;
  _25[8] = 1.0f;
  _25[9] = 0.800000011920929f;
  _25[10] = 0.25832998752593994f;
  _25[11] = 0.0f;
  _25[12] = 0.20000000298023224f;
  _25[13] = 0.7416700124740601f;
  _25[14] = 0.14167000353336334f;
  _25[15] = 0.0f;
  _25[16] = 0.0f;
  _25[17] = 0.8583300113677979f;
  _25[18] = 0.8166700005531311f;
  _25[19] = 0.3333300054073334f;
  _25[20] = 0.0f;
  _25[21] = 0.1833299994468689f;
  _25[22] = 0.666670024394989f;
  _25[23] = 0.125f;
  _25[24] = 0.0f;
  _25[25] = 0.0f;
  _25[26] = 0.875f;
  _25[27] = 0.9666699767112732f;
  _25[28] = 0.0f;
  _25[29] = 0.0f;
  _25[30] = 0.033330000936985016f;
  _25[31] = 0.7333300113677979f;
  _25[32] = 0.1833299994468689f;
  _25[33] = 0.0f;
  _25[34] = 0.26666998863220215f;
  _25[35] = 0.8166700005531311f;

  float _1519 = min(max(log2(mad(color.z, 0.07922374457120895f, mad(color.y, 0.07843360304832458f, (color.x * 0.8424790501594543f)))), -12.473930358886719f), 4.026069164276123f) + 12.473930358886719f;
  float _1520 = min(max(log2(mad(color.z, 0.07916612923145294f, mad(color.y, 0.8784686326980591f, (color.x * 0.04232824221253395f)))), -12.473930358886719f), 4.026069164276123f) + 12.473930358886719f;
  float _1521 = min(max(log2(mad(color.z, 0.8791429996490479f, mad(color.y, 0.07843360304832458f, (color.x * 0.042375653982162476f)))), -12.473930358886719f), 4.026069164276123f) + 12.473930358886719f;
  float _1522 = _1519 * 0.06060606241226196f;
  float _1523 = _1520 * 0.06060606241226196f;
  float _1524 = _1521 * 0.06060606241226196f;
  float _1525 = _1522 * _1522;
  float _1526 = _1523 * _1523;
  float _1527 = _1524 * _1524;
  float _1573 = min(0.0f, (-0.0f - (((_1519 * 0.007218181621283293f) + ((_1525 * 0.42980000376701355f) + (((_1525 * _1525) * ((31.959999084472656f - (_1519 * 2.432727336883545f)) + (_1525 * 15.5f))) - ((_1519 * 0.41624245047569275f) * _1525)))) + -0.002319999970495701f)));
  float _1574 = min(0.0f, (-0.0f - (((_1520 * 0.007218181621283293f) + ((_1526 * 0.42980000376701355f) + (((_1526 * _1526) * ((31.959999084472656f - (_1520 * 2.432727336883545f)) + (_1526 * 15.5f))) - ((_1520 * 0.41624245047569275f) * _1526)))) + -0.002319999970495701f)));
  float _1575 = min(0.0f, (-0.0f - (((_1521 * 0.007218181621283293f) + ((_1527 * 0.42980000376701355f) + (((_1527 * _1527) * ((31.959999084472656f - (_1521 * 2.432727336883545f)) + (_1527 * 15.5f))) - ((_1521 * 0.41624245047569275f) * _1527)))) + -0.002319999970495701f)));
  float _1576 = -0.0f - _1573;
  float _1577 = -0.0f - _1574;
  float _1578 = -0.0f - _1575;
  float _1579 = dot(float3(_1576, _1577, _1578), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
  float _1585 = saturate((_exposure2.x + -3.0f) * 0.1428571492433548f) * 0.20000004768371582f;
  float _1586 = _1585 + 1.0f;
  float _1617 = ((exp2(log2((_1586 - (_1585 * saturate((_1573 * _1573) * _1576))) * _1576)) - _1579) * 1.399999976158142f) + _1579;
  float _1618 = ((exp2(log2((_1586 - (saturate((_1574 * _1574) * _1577) * _1585)) * _1577)) - _1579) * 1.399999976158142f) + _1579;
  float _1619 = ((exp2(log2((_1586 - (saturate((_1575 * _1575) * _1578) * _1585)) * _1578)) - _1579) * 1.399999976158142f) + _1579;
  float _1638 = saturate(exp2(log2(mad(_1619, -0.09902974218130112f, mad(_1618, -0.09802088141441345f, (_1617 * 1.1968790292739868f)))) * 2.200000047683716f));
  float _1639 = saturate(exp2(log2(mad(_1619, -0.09896117448806763f, mad(_1618, 1.1519031524658203f, (_1617 * -0.052896853536367416f)))) * 2.200000047683716f));
  float _1640 = saturate(exp2(log2(mad(_1619, 1.151073694229126f, mad(_1618, -0.09804344922304153f, (_1617 * -0.05297163501381874f)))) * 2.200000047683716f));
  if (_etcParams.z == 0.0f && use_etc_params) {
    float _1646 = 1.0f - abs(_etcParams.w);
    float _1650 = saturate(_etcParams.w);
    float _1651 = (_1646 * _1638) + _1650;
    float _1652 = (_1646 * _1639) + _1650;
    float _1653 = (_1646 * _1640) + _1650;
    if (_colorGradingParams.w > 0.0f) {
      float _1658 = saturate(_colorGradingParams.w);
      _1675 = (((max(0.0f, (1.0f - _1651)) - _1651) * _1658) + _1651);
      _1676 = (((max(0.0f, (1.0f - _1652)) - _1652) * _1658) + _1652);
      _1677 = (((max(0.0f, (1.0f - _1653)) - _1653) * _1658) + _1653);
    } else {
      _1675 = _1651;
      _1676 = _1652;
      _1677 = _1653;
    }
    float _1683 = _userImageAdjust.y + 1.0f;
    float _1687 = _userImageAdjust.x + 0.5f;
    float _1688 = ((_1675 + -0.5f) * _1683) + _1687;
    float _1689 = ((_1676 + -0.5f) * _1683) + _1687;
    float _1690 = ((_1677 + -0.5f) * _1683) + _1687;

    int _1731 = min(max(_colorBlindParam, 0), 3) * (int)use_color_blind; // Override in case we call this to get mid gray in HDR
    
    float _1786 = 2.200000047683716f / ((min(max(_userImageAdjust.w, -1.0f), 1.0f) * 0.800000011920929f) + 2.200000047683716f);
    _1797 = exp2(log2(saturate(mad((_25[((int)(6u + (_1731 * 9)))]), _1690, mad((_25[((int)(3u + (_1731 * 9)))]), _1689, ((_25[((int)(0u + (_1731 * 9)))]) * _1688))))) * _1786);
    _1798 = exp2(log2(saturate(mad((_25[((int)(7u + (_1731 * 9)))]), _1690, mad((_25[((int)(4u + (_1731 * 9)))]), _1689, ((_25[((int)(1u + (_1731 * 9)))]) * _1688))))) * _1786);
    _1799 = exp2(log2(saturate(mad((_25[((int)(8u + (_1731 * 9)))]), _1690, mad((_25[((int)(5u + (_1731 * 9)))]), _1689, ((_25[((int)(2u + (_1731 * 9)))]) * _1688))))) * _1786);
  } else {
    _1797 = _1638;
    _1798 = _1639;
    _1799 = _1640;
  }
  return float3(_1797, _1798, _1799);
}

float3 TonemapReplacer(float3 color, bool use_color_blind = true, bool use_etc_params = true, bool use_pre_curve = true) {
  bool tonemap_debug_enabled = false;
#if CUSTOM_TONEMAP_DEBUG
  tonemap_debug_enabled = TonemapDebugEnabled();
#endif

  float exposure = _userImageAdjust.z * _exposure0.x;

  [branch]
  if ((RENODX_TONE_MAP_TYPE != 0) && (IMPROVED_AUTO_EXPOSURE == 2)) {
    float histogram_mean = 0.18f;
    float histogram_target_mean = 0.18f;
    histogram_mean = GetPerceptualAdaptedFieldYf();

    if (_exposure2.z > 0.0f) {
      histogram_target_mean = _exposure2.z;
    } else {
      histogram_target_mean = histogram_mean;
    }
    histogram_target_mean = min(histogram_target_mean * exposure, 1.0f);
    histogram_target_mean = min(histogram_target_mean, 1.0f);
    float3 ungraded_bt709 = float3(
        max(0.0f, (((color.x * 1.705049991607666f) - (color.y * 0.6217899918556213f)) - (color.z * 0.08325999975204468f))),
        max(0.0f, (((color.y * 1.1407999992370605f) - (color.x * 0.13026000559329987f)) - (color.z * 0.01054999977350235f))),
        max(0.0f, (((color.x * -0.024000000208616257f) - (color.y * 0.12896999716758728f)) + (color.z * 1.1529699563980103f))));

    float3 perceptual_input_color = ungraded_bt709;
    if (use_pre_curve) {
      float3 graded_components = max(0.0f, (ungraded_bt709 * _slopeParams.xyz) + _offsetParams.xyz);
      float3 curved_bt709 = exp2(log2(graded_components) * _powerParams.xyz);
      float display_transform_luminance = dot(curved_bt709, float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      float3 graded_bt709 = lerp(display_transform_luminance.xxx, curved_bt709, _powerParams.w);
      perceptual_input_color = lerp(ungraded_bt709, graded_bt709, RENODX_COLOR_GRADE_STRENGTH);
    }

    float3 tonemap_input_color = perceptual_input_color;
#if CUSTOM_TONEMAP_DEBUG
    renodx::debug::graph::Config tonemap_graph_config = { false, 0, 0.0f, perceptual_input_color, RENODX_PEAK_WHITE_NITS, 100.0f };
    if (tonemap_debug_enabled) {
      tonemap_graph_config = renodx::debug::graph::DrawStart(
          float2(SV_Position.xy) + 0.5f,
          perceptual_input_color,
          __3__36__0__0__g_sceneColor,
          RENODX_PEAK_WHITE_NITS,
          100.0f);
      tonemap_input_color = tonemap_graph_config.color;
    }
#endif
    float3 output_color = CustomTonemapSDR(tonemap_input_color, histogram_mean, histogram_target_mean);
#if CUSTOM_TONEMAP_DEBUG
    if (tonemap_debug_enabled) {
      output_color = DrawTonemapGraph(output_color, tonemap_graph_config);
    }
#endif
    return output_color;
  } else {
    float3 ungraded_bt709 = float3(
        max(0.0f, (((color.x * 1.705049991607666f) - (color.y * 0.6217899918556213f)) - (color.z * 0.08325999975204468f))),
        max(0.0f, (((color.y * 1.1407999992370605f) - (color.x * 0.13026000559329987f)) - (color.z * 0.01054999977350235f))),
        max(0.0f, (((color.x * -0.024000000208616257f) - (color.y * 0.12896999716758728f)) + (color.z * 1.1529699563980103f))));

    ungraded_bt709 *= exposure;

    float3 input_color = ungraded_bt709;
    if (use_pre_curve) {
      float3 graded_components = max(0.0f, (ungraded_bt709 * _slopeParams.xyz) + _offsetParams.xyz);
      float3 curved_bt709 = exp2(log2(graded_components) * _powerParams.xyz);
      float display_transform_luminance = dot(curved_bt709, float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      float3 graded_bt709 = lerp(display_transform_luminance.xxx, curved_bt709, _powerParams.w);
      input_color = lerp(ungraded_bt709, graded_bt709, RENODX_COLOR_GRADE_STRENGTH);
    }

    if (RENODX_TONE_MAP_TYPE != 0) {
      float3 untonemapped_bt709 = input_color;

      const float mid_gray = 0.18f;
      float mid_gray_adjusted = SDRToneMap(mid_gray, false, false).x;
      mid_gray_adjusted = lerp(0.18f, mid_gray_adjusted, CUSTOM_TONE_MAP_MIDGRAY_ADJUST);

      float3 tonemap_input_color = untonemapped_bt709;
#if CUSTOM_TONEMAP_DEBUG
      renodx::debug::graph::Config tonemap_graph_config = { false, 0, 0.0f, untonemapped_bt709, RENODX_PEAK_WHITE_NITS, 100.0f };
      if (tonemap_debug_enabled) {
        tonemap_graph_config = renodx::debug::graph::DrawStart(
            float2(SV_Position.xy) + 0.5f,
            untonemapped_bt709,
            __3__36__0__0__g_sceneColor,
            RENODX_PEAK_WHITE_NITS,
            100.0f);
        tonemap_input_color = tonemap_graph_config.color;
      }
#endif
      float3 output_color = CustomTonemapSDR(tonemap_input_color, mid_gray, mid_gray_adjusted);
#if CUSTOM_TONEMAP_DEBUG
      if (tonemap_debug_enabled) {
        output_color = DrawTonemapGraph(output_color, tonemap_graph_config);
      }
#endif
      return output_color;
    } else {
      return SDRToneMap(input_color, use_color_blind, use_etc_params);
    }
  } 
}