#include "./shared.h"

// Custom dual-gamma encoding used by No Man's Sky
float CustomGammaEncode(float x) {
  float sign = (x < 0.0) ? -1.0 : 1.0;
  float abs_x = x * sign;
  float encoded;

  if (abs_x < 1.0) {
    encoded = pow(abs_x, 1.0 / 2.2);  // 0.4545454680919647216796875
  } else {
    if (abs_x > 0.0) {
      encoded = pow(abs_x, 1.0 / 2.4);  // 0.4166666567325592041015625
    } else {
      encoded = abs_x;
    }
  }

  return encoded * sign;
}

float3 CustomGammaEncode(float3 color) {
  return float3(
      CustomGammaEncode(color.x),
      CustomGammaEncode(color.y),
      CustomGammaEncode(color.z)
    );
}

// Custom dual-gamma decoding (inverse of encoding)
float CustomGammaDecode(float x) {
  float sign = (x < 0.0) ? -1.0 : 1.0;
  float abs_x = x * sign;
  float decoded;

  if (abs_x < 1.0) {
    decoded = pow(abs_x, 2.2);
  } else {
    if (abs_x > 0.0) {
      decoded = pow(abs_x, 2.4);
    } else {
      decoded = abs_x;
    }
  }

  return decoded * sign;
}

float3 CustomGammaDecode(float3 color) {
  return float3(
      CustomGammaDecode(color.x),
      CustomGammaDecode(color.y),
      CustomGammaDecode(color.z)
    );
}