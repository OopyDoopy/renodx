#include "./tonemapping.hlsl"

#version 450

layout(set = 1, binding = 0) uniform sampler2D gBufferMap;

layout(location = 0) in VertexBlock {
  noperspective vec2 mTexCoordsVec2;
}
In;

layout(location = 0) out vec4 out_color0;

void main() {
  if (RENODX_TONE_MAP_TYPE == 1.0) {
    const vec3 untonemapped = texture(gBufferMap, In.mTexCoordsVec2).xyz;
    const bool is_hdr = LAST_IS_HDR == 1.0;
    const float diffuse_white_nits = is_hdr
                                         ? max(RENODX_DIFFUSE_WHITE_NITS, 1.0)
                                         : 100.0;
    const float peak_value = is_hdr
                                 ? max(
                                       RENODX_PEAK_WHITE_NITS / diffuse_white_nits,
                                       0.0002)
                                 : 1.0;

    vec3 prism_color = ApplyPrismToneMap(
        untonemapped,
        peak_value,
        diffuse_white_nits,
        0.18f,
        0.18f,
        1.2f);
    prism_color = renodx::effects::ApplyFilmGrain(
        prism_color,
        In.mTexCoordsVec2,
        CUSTOM_RANDOM,
        CUSTOM_FILM_GRAIN_STRENGTH * 0.03);

    prism_color = min(prism_color, peak_value);
    // The final pass is scaled in UI-white units. Convert the Prism scene
    // result from game-white units so ToneMapGameNits remains effective.
    prism_color = CustomIntermediate(prism_color);
    out_color0 = vec4(EncodePrismSDR(prism_color), 1.0);
    return;
  }
  vec4 _259 = texture(gBufferMap, In.mTexCoordsVec2);
  vec3 _260 = _259.xyz;
  vec3 _678 = _260 * 0.2199999988079071044921875;
  vec3 _267 = clamp(((fma(_260, _678 + vec3(0.0300000011920928955078125), vec3(0.00200000009499490261077880859375)) / fma(_260, _678 + vec3(0.300000011920928955078125), vec3(0.060000002384185791015625))) - vec3(0.0333333313465118408203125)) * vec3(2.492836475372314453125), vec3(0.0), vec3(1.0));
  float _758 = _267.x;
  float _776 = (_758 < 0.0) ? (-1.0) : 1.0;
  float _779 = _758 * _776;
  float _866;
  if (_779 < 1.0) {
    _866 = pow(max(_779, 0.0), 0.4545454680919647216796875);
  } else {
    float _867;
    if (_779 > 0.0) {
      _867 = pow(max(_779, 0.0), 0.4166666567325592041015625);
    } else {
      _867 = _779;
    }
    _866 = _867;
  }
  float _762 = _267.y;
  float _805 = (_762 < 0.0) ? (-1.0) : 1.0;
  float _808 = _762 * _805;
  float _871;
  if (_808 < 1.0) {
    _871 = pow(max(_808, 0.0), 0.4545454680919647216796875);
  } else {
    float _872;
    if (_808 > 0.0) {
      _872 = pow(max(_808, 0.0), 0.4166666567325592041015625);
    } else {
      _872 = _808;
    }
    _871 = _872;
  }
  float _766 = _267.z;
  float _834 = (_766 < 0.0) ? (-1.0) : 1.0;
  float _837 = _766 * _834;
  float _875;
  if (_837 < 1.0) {
    _875 = pow(max(_837, 0.0), 0.4545454680919647216796875);
  } else {
    float _876;
    if (_837 > 0.0) {
      _876 = pow(max(_837, 0.0), 0.4166666567325592041015625);
    } else {
      _876 = _837;
    }
    _875 = _876;
  }
  out_color0 = vec4(_866 * _776, _871 * _805, _875 * _834, 1.0);
}

