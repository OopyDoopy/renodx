#ifndef SRC_GAMES_HELLDIVERS2_TONEMAP_TONEMAP_HLSLI_
#define SRC_GAMES_HELLDIVERS2_TONEMAP_TONEMAP_HLSLI_

#include "../../../shaders/tonemap/aces.hlsl"

namespace helldivers2 {
namespace tonemap {

struct ACESParameters {
  float coefficients[20];
  float low_input;
  float low_output;
  float middle_input;
  float high_input;
  float high_output;
  float low_slope;
  float high_slope;
  float target_peak_nits;
  float diffuse_white_nits;
};

static const float ACES_ODT_BLACK_NITS = 3.5073844628641381859779357910156e-05f;

static const float4 ACES_RRT_COEFFICIENTS[11] = {
    float4(1.f, 0.f, 0.f, 0.f),
    float4(0.f, 1.f, 0.f, 0.f),
    float4(0.f, 0.f, 1.f, 0.f),
    float4(0.f, 0.f, 0.f, 1.f),
    float4(-4.f, -0.718548238277435302734375f, 0.f, 0.f),
    float4(-4.f, 2.0810306072235107421875f, 0.f, 0.f),
    float4(-3.1573765277862548828125f, 3.66812419891357421875f, 0.f, 0.f),
    float4(-0.485249996185302734375f, 4.f, 0.f, 0.f),
    float4(1.84773242473602294921875f, 4.f, 0.f, 0.f),
    float4(1.84773242473602294921875f, 4.f, 0.f, 0.f),
    0.f.xxxx,
};

int ConvertFloatToInt(float value) {
  return isnan(value) ? 0 : ((value < -2147483648.f) ? int(0x80000000) : ((value > 2147483520.f) ? 2147483647 : int(value)));
}

float EvaluateODTToneScale(float value, in ACESParameters parameters) {
  const float LOG10_2 = 0.3010300099849700927734375f;
  float log_input = value <= 0.f ? -4.f : log2(value) * LOG10_2;
  float low_boundary = log2(parameters.low_input) * LOG10_2;

  if (log_input <= low_boundary) {
    float low_output = log2(parameters.low_output) * LOG10_2;
    return mad(parameters.low_slope, log_input, low_output - low_boundary * parameters.low_slope);
  }

  float middle_boundary = log2(parameters.middle_input) * LOG10_2;
  if (log_input < middle_boundary) {
    float coordinate = ((log_input - low_boundary) * 7.f) / (middle_boundary - low_boundary);
    int segment = ConvertFloatToInt(coordinate);
    float t = coordinate - trunc(coordinate);
    uint index0 = uint(segment);
    uint index1 = uint(segment + 1);
    uint index2 = uint(segment + 2);
    float3 knots = float3(parameters.coefficients[index0], parameters.coefficients[index1], parameters.coefficients[index2]);
    float3 basis = float3(0.5f * t * t, -t * t + t + 0.5f, 0.5f * t * t - t + 0.5f);
    return dot(basis, knots.zyx);
  }

  float high_boundary = log2(parameters.high_input) * LOG10_2;
  float native_high_output = log2(parameters.high_output) * LOG10_2;
  float output_scale = max(parameters.diffuse_white_nits / 100.f, 0.000001f);
  // The ODT black offset is subtracted before output scaling, so include it in
  // the pre-scaled target to land exactly on target_peak_nits afterward.
  float compensated_peak_nits = max(
      parameters.target_peak_nits / output_scale + ACES_ODT_BLACK_NITS,
      0.000001f);
  float target_high_output = log2(compensated_peak_nits) * LOG10_2;
  float middle_output = (parameters.coefficients[10] + parameters.coefficients[11]) * 0.5f;
  float upper_output_scale = (target_high_output - middle_output) /
                             max(native_high_output - middle_output, 0.000001f);
  if (log_input < high_boundary) {
    float coordinate = ((log_input - middle_boundary) * 7.f) / (high_boundary - middle_boundary);
    int segment = ConvertFloatToInt(coordinate);
    float t = coordinate - trunc(coordinate);
    uint index0 = uint(segment + 10);
    uint index1 = uint(segment + 11);
    uint index2 = uint(segment + 12);
    float3 knots = float3(parameters.coefficients[index0], parameters.coefficients[index1], parameters.coefficients[index2]);
    knots = middle_output + (knots - middle_output) * upper_output_scale;
    float3 basis = float3(0.5f * t * t, -t * t + t + 0.5f, 0.5f * t * t - t + 0.5f);
    return dot(basis, knots.zyx);
  }

  // Treat the configured display peak as a ceiling rather than preserving the
  // native positive extrapolation above the ODT high anchor.
  return target_high_output;
}

float EvaluateRRTToneScale(float value) {
  float log_input = value <= 0.f ? -14.f : log2(value);
  if (log_input <= -17.4739322662353515625f) return -4.f;
  if (log_input >= 15.52606868743896484375f) return 4.f;

  bool low_segment = log_input < -2.4739310741424560546875f;
  float coordinate = low_segment
      ? mad(log_input, 0.3010300099849700927734375f, 5.2601776123046875f) * 0.6643855571746826171875f
      : mad(log_input, 0.3010300099849700927734375f, 0.74472749233245849609375f) * 0.55365467071533203125f;
  int segment = ConvertFloatToInt(coordinate);
  float t = coordinate - trunc(coordinate);
  uint index0 = min(uint(segment + 4), 10u);
  uint index1 = min(uint(segment + 5), 10u);
  uint index2 = min(uint(segment + 6), 10u);
  float knot0 = low_segment ? ACES_RRT_COEFFICIENTS[index0].x : ACES_RRT_COEFFICIENTS[index0].y;
  float knot1 = low_segment ? ACES_RRT_COEFFICIENTS[index1].x : ACES_RRT_COEFFICIENTS[index1].y;
  float knot2 = low_segment ? ACES_RRT_COEFFICIENTS[index2].x : ACES_RRT_COEFFICIENTS[index2].y;

  return dot(float3(t * t, t, 1.f),
             float3(0.5f * knot0 - knot1 + 0.5f * knot2, -knot0 + knot1, 0.5f * knot0 + 0.5f * knot1));
}

float3 ApplyACES(float3 linear_bt709, in ACESParameters parameters) {
  const float LOG2_10 = 3.3219280242919921875f;
  float output_scale = max(parameters.diffuse_white_nits / 100.f, 0.000001f);

  // Linear BT.709/D65 to ACES2065-1 AP0/D60. No native 2.5x exposure.
  float3 ap0 = float3(
      dot(float3(0.4397009909152984619140625f, 0.3829779922962188720703125f, 0.1773349940776824951171875f), linear_bt709),
      dot(float3(0.08979229629039764404296875f, 0.813422977924346923828125f, 0.09676159918308258056640625f), linear_bt709),
      dot(float3(0.01754399947822093963623046875f, 0.11154399812221527099609375f, 0.870703995227813720703125f), linear_bt709));
  ap0 = min(ap0, 65504.f);

  // Native ACES RRT glow, red modifier, AP0-to-AP1 conversion, and desaturation.
  float3 rrt_ap1 = renodx::tonemap::aces::RRT(ap0);
  rrt_ap1 = exp2(float3(
      EvaluateRRTToneScale(rrt_ap1.r),
      EvaluateRRTToneScale(rrt_ap1.g),
      EvaluateRRTToneScale(rrt_ap1.b)) * LOG2_10);

  // Preserve the formal RRT output (AP1-to-AP0) and ODT input
  // (AP0-to-AP1) transforms used by the native shader.
  float3 rrt_ap0 = float3(
      dot(float3(0.695452213287353515625f, 0.140678703784942626953125f, 0.16386906802654266357421875f), rrt_ap1),
      dot(float3(0.0447945632040500640869140625f, 0.859671115875244140625f, 0.095534317195415496826171875f), rrt_ap1),
      dot(float3(-0.0055258828215301036834716796875f, 0.0040252101607620716094970703125f, 1.00150072574615478515625f), rrt_ap1));
  float3 odt_ap1 = float3(
      dot(float3(1.45143926143646240234375f, -0.236510753631591796875f, -0.214928567409515380859375f), rrt_ap0),
      dot(float3(-0.07655377686023712158203125f, 1.1762297153472900390625f, -0.0996759235858917236328125f), rrt_ap0),
      dot(float3(0.0083161480724811553955078125f, -0.0060324496589601039886474609375f, 0.99771630764007568359375f), rrt_ap0));

  float3 display_ap1_nits = (exp2(float3(
      EvaluateODTToneScale(odt_ap1.r, parameters),
      EvaluateODTToneScale(odt_ap1.g, parameters),
      EvaluateODTToneScale(odt_ap1.b, parameters)) * LOG2_10) - ACES_ODT_BLACK_NITS) * output_scale;

  // AP1/D60 to XYZ/D60, chromatically adapt D60 to D65, then XYZ to BT.2020.
  float3 xyz_d60 = float3(
      dot(float3(0.662454187870025634765625f, 0.1340042054653167724609375f, 0.1561876833438873291015625f), display_ap1_nits),
      dot(float3(0.272228717803955078125f, 0.674081742763519287109375f, 0.053689517080783843994140625f), display_ap1_nits),
      dot(float3(-0.0055746496655046939849853515625f, 0.0040607335977256298065185546875f, 1.01033914089202880859375f), display_ap1_nits));
  float3 xyz_d65 = float3(
      dot(float3(0.98722398281097412109375f, -0.0061132698319852352142333984375f, 0.01595330052077770233154296875f), xyz_d60),
      dot(float3(-0.007598360069096088409423828125f, 1.00186002254486083984375f, 0.0053301998414099216461181640625f), xyz_d60),
      dot(float3(0.003072570078074932098388671875f, -0.0050959498621523380279541015625f, 1.0816800594329833984375f), xyz_d60));
  float3 bt2020_nits = float3(
      dot(float3(1.71665096282958984375f, -0.35567080974578857421875f, -0.2533662319183349609375f), xyz_d65),
      dot(float3(-0.666684329509735107421875f, 1.616481304168701171875f, 0.0157685391604900360107421875f), xyz_d65),
      dot(float3(0.0176398493349552154541015625f, -0.04277060925960540771484375f, 0.94210326671600341796875f), xyz_d65));

  // AP1-to-BT.2020 conversion can create channel excursions above the AP1
  // ceiling. Scale all channels together so the final signal cannot exceed
  // the configured absolute peak while preserving RGB ratios.
  float max_bt2020_nits = max(max(bt2020_nits.r, bt2020_nits.g), bt2020_nits.b);
  bt2020_nits *= min(1.f, parameters.target_peak_nits / max(max_bt2020_nits, 0.000001f));

  return renodx::color::pq::EncodeSafe(bt2020_nits, 1.f);
}

}  // namespace tonemap
}  // namespace helldivers2

#endif  // SRC_GAMES_HELLDIVERS2_TONEMAP_TONEMAP_HLSLI_
