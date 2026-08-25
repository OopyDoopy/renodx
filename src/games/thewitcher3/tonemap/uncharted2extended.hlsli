#include "../shared.h"

namespace Uncharted2 {

float Derivative(
    float x,
    float a, float b, float c,
    float d, float e, float f) {
  float num = -a * b * (c - 1.0) * x * x
              + 2.0 * a * d * (f - e) * x
              + b * d * (c * f - e);

  float den = x * (a * x + b) + d * f;
  den = den * den;

  return num / den;
}

float FindSecondDerivativeRoot(float a, float b, float c, float d, float e, float f) {
  // Coefficients of the numerator of f''(x):
  // num(x) = A3 x^3 + A2 x^2 + A1 x + A0

  float A3 = a * a * b * (c - 1.0f);
  float A2 = 3.0f * a * a * d * (e - f);
  float A1 = 3.0f * a * b * d * (e - c * f);
  float A0 = a * d * d * (f * f - e * f) + b * b * d * (e - c * f);

  const float epsilon = 1e-12f;
  const float no_positive_root = 1e30f;

  // A vanished cubic coefficient leaves a quadratic or linear inflection
  // polynomial. Do not discard its valid positive roots.
  if (abs(A3) < epsilon) {
    if (abs(A2) < epsilon) {
      if (abs(A1) < epsilon) return 0.f;
      return max(-A0 / A1, 0.f);
    }

    float discriminant = A1 * A1 - 4.f * A2 * A0;
    if (discriminant < 0.f) return 0.f;

    float root_scale = 0.5f / A2;
    float root_offset = sqrt(discriminant);
    float root1 = (-A1 - root_offset) * root_scale;
    float root2 = (-A1 + root_offset) * root_scale;
    float first_positive = min(
        root1 > 0.f ? root1 : no_positive_root,
        root2 > 0.f ? root2 : no_positive_root);
    return first_positive == no_positive_root ? 0.f : first_positive;
  }

  // Normalize to monic cubic: x^3 + ax^2 + bx + c = 0
  float invA3 = 1.0f / A3;
  float an = A2 * invA3;
  float bn = A1 * invA3;
  float cn = A0 * invA3;

  // Depressed cubic t^3 + p t + q = 0  with x = t - a/3
  float an_3 = an / 3.0f;
  float p = bn - an * an_3;
  float q = 2.0f * an * an * an / 27.0f - an * bn / 3.0f + cn;

  float half_q = 0.5f * q;
  float Delta = half_q * half_q + (p / 3.0f) * (p / 3.0f) * (p / 3.0f);

  if (Delta > epsilon) {
    float sqrtD = sqrt(Delta);
    float u = (-half_q + sqrtD);
    float v = (-half_q - sqrtD);

    // Use signed cube root
    float u_c = renodx::math::SignPow(u, 1.0f / 3.0f);
    float v_c = renodx::math::SignPow(v, 1.0f / 3.0f);
    return max(u_c + v_c - an_3, 0.f);
  }

  float first_positive = no_positive_root;
  if (Delta >= -epsilon) {
    // The repeated-root case has two unique roots. Cardano's principal root
    // alone can be negative while the repeated root is the first valid pivot.
    float u = renodx::math::SignPow(-half_q, 1.0f / 3.0f);
    float root1 = 2.f * u - an_3;
    float root2 = -u - an_3;
    first_positive = min(
        root1 > 0.f ? root1 : no_positive_root,
        root2 > 0.f ? root2 : no_positive_root);
  } else {
    // Three real roots: select the first positive inflection rather than only
    // the principal trigonometric root.
    float m = 2.0f * sqrt(-p / 3.0f);
    float angle = acos(clamp((-half_q) / sqrt(-(p * p * p) / 27.0f), -1.f, 1.f));
    float root1 = m * cos(angle / 3.f) - an_3;
    float root2 = m * cos((angle + 2.f * 3.14159265358979323846f) / 3.f) - an_3;
    float root3 = m * cos((angle + 4.f * 3.14159265358979323846f) / 3.f) - an_3;
    first_positive = min(
        root1 > 0.f ? root1 : no_positive_root,
        min(
            root2 > 0.f ? root2 : no_positive_root,
            root3 > 0.f ? root3 : no_positive_root));
  }

  return first_positive == no_positive_root ? 0.f : first_positive;
}

// Analytic knee root of f'''(x) = 0 for Uncharted2/Hable ApplyCurve
// a,b,c,d,e,f > 0, typically 0 < c < 1.
// Returns the smallest positive real root ("first knee") in x > 0.
float FindThirdDerivativeRoot(float a, float b, float c, float d, float e, float f) {
  // sqrt(a b^2 c^2 - 2 a b^2 c + a b^2)
  float sqrt_ab = sqrt(
      a * b * b * c * c
      - 2.f * a * b * b * c
      + a * b * b);

  // sqrt(a d^2 e^2 - 2 a d^2 e f + a d^2 f^2
  //    + b^2 c^2 d f + b^2 (-c) d e - b^2 c d f + b^2 d e)
  float sqrt_df = sqrt(
      a * d * d * e * e
      - 2.f * a * d * d * e * f
      + a * d * d * f * f
      + b * b * c * c * d * f
      + b * b * (-c) * d * e
      - b * b * c * d * f
      + b * b * d * e);

  // Precompute (d e - d f)
  float de_df = d * e - d * f;

  // Inner big piece: sqrt_ab * (...) / (8 * sqrt_df)
  float term_top =
      32.f * (a * d * d * e * f - a * d * d * f * f + b * b * c * d * f - b * b * d * e)
      / (a * a * b * (c - 1.f));

  float term_mid =
      96.f * de_df * (c * d * f - d * e)
      / (a * b * (c - 1.f) * (c - 1.f));

  float de_df2 = de_df * de_df;
  float de_df3 = de_df2 * de_df;

  float term_tail =
      64.f * de_df3
      / (b * b * b * (c - 1.f) * (c - 1.f) * (c - 1.f));

  float Tfrac = sqrt_ab * (term_top - term_mid - term_tail)
                / (8.f * sqrt_df);

  // (12 a^2 b c d f - 12 a^2 b d e) / (6 (a^3 b c - a^3 b))
  float Tmid2_num = 12.f * a * a * b * c * d * f
                    - 12.f * a * a * b * d * e;
  float Tmid2_den = 6.f * (a * a * a * b * c - a * a * a * b);
  float Tmid2 = Tmid2_num / Tmid2_den;

  // (6 (c d f - d e))/(a (c - 1))
  float T3 = 6.f * (c * d * f - d * e)
             / (a * (c - 1.f));

  // (8 (d e - d f)^2)/(b^2 (c - 1)^2)
  float T4 = 8.f * de_df2
             / (b * b * (c - 1.f) * (c - 1.f));

  // Centers for the ± branches
  float centerNeg = -Tfrac + Tmid2 + T3 + T4;  // used with sqrt(-centerNeg)
  float centerPos = Tfrac + Tmid2 + T3 + T4;   // used with sqrt( centerPos)

  // Branch square roots: use SignSqrt for robustness and correct branch behaviour
  float sNeg = renodx::math::SignSqrt(-centerNeg);
  float sPos = renodx::math::SignSqrt(centerPos);

  // Shifts:
  //  - first two roots use:  - sqrt_df/sqrt_ab - (d e - d f)/(b (c - 1))
  //  - last two use:          sqrt_df/sqrt_ab - (d e - d f)/(b (c - 1))
  float shift1 = sqrt_df / sqrt_ab + de_df / (b * (c - 1.f));  // we subtract this
  float shift2 = sqrt_df / sqrt_ab - de_df / (b * (c - 1.f));  // we add this

  // The four analytic roots from WA, mapped to floats:
  float r1 = -0.5f * sNeg - shift1;  // -1/2 * sqrt(-centerNeg) - shift1
  float r2 = 0.5f * sNeg - shift1;   //  1/2 * sqrt(-centerNeg) - shift1
  float r3 = -0.5f * sPos + shift2;  // -1/2 * sqrt( centerPos) + shift2
  float r4 = 0.5f * sPos + shift2;   //  1/2 * sqrt( centerPos) + shift2

  // Max root seems to be always be the right one
  float root = saturate(renodx::math::Max(r1, r2, r3, r4));

  return root;
}

namespace Config {

struct Uncharted2ExtendedConfig {
  float pivot_point;
  float white_precompute;
  float coeffs[6];  // A,B,C,D,E,F
};

Uncharted2ExtendedConfig CreateUncharted2ExtendedConfig(
    float pivot_point,
    float coeffs[6], float white_precompute) {
  Uncharted2ExtendedConfig cfg;
  cfg.pivot_point = pivot_point;
  cfg.white_precompute = white_precompute;
  cfg.coeffs = coeffs;

  return cfg;
}

Uncharted2ExtendedConfig CreateUncharted2ExtendedConfig(float coeffs[6], float white_precompute) {
  float pivot_point = FindThirdDerivativeRoot(coeffs[0], coeffs[1], coeffs[2], coeffs[3], coeffs[4], coeffs[5]);
  // pivot_point = (pivot_point + FindSecondDerivativeRoot(coeffs[0], coeffs[1], coeffs[2], coeffs[3], coeffs[4], coeffs[5])) / 2.f;

  return CreateUncharted2ExtendedConfig(pivot_point, coeffs, white_precompute);
}

}  // Config

#define APPLY_EXTENDED_GENERATOR(T)                                                            \
  T ApplyExtended(                                                                             \
      T x,                                                                                     \
      T base,                                                                                  \
      float pivot_point,                                                                       \
      float white_precompute,                                                                  \
      float A, float B, float C, float D, float E, float F) {                                  \
    float pivot_x = pivot_point;                                                               \
    float pivot_y = renodx::tonemap::ApplyCurve(pivot_x, A, B, C, D, E, F) * white_precompute; \
    float slope = Derivative(pivot_x, A, B, C, D, E, F) * white_precompute;                    \
    T offset = pivot_y - slope * pivot_x;                                                      \
                                                                                               \
    T extended = slope * x + offset; /* match slope */                                         \
                                                                                               \
    return lerp(base, extended, step(pivot_x, x));                                             \
  }

APPLY_EXTENDED_GENERATOR(float)
APPLY_EXTENDED_GENERATOR(float3)
#undef APPLY_EXTENDED_GENERATOR

float ApplyExtended(float x, float base, Config::Uncharted2ExtendedConfig uc2_config) {
  return ApplyExtended(
      x, base, uc2_config.pivot_point, uc2_config.white_precompute,
      uc2_config.coeffs[0], uc2_config.coeffs[1], uc2_config.coeffs[2],
      uc2_config.coeffs[3], uc2_config.coeffs[4], uc2_config.coeffs[5]);
}

float3 ApplyExtended(float3 x, float3 base, Config::Uncharted2ExtendedConfig uc2_config) {
  return ApplyExtended(
      x, base, uc2_config.pivot_point, uc2_config.white_precompute,
      uc2_config.coeffs[0], uc2_config.coeffs[1], uc2_config.coeffs[2],
      uc2_config.coeffs[3], uc2_config.coeffs[4], uc2_config.coeffs[5]);
}

float ApplyExtended(float x, Config::Uncharted2ExtendedConfig uc2_config) {
  float base =
      renodx::tonemap::ApplyCurve(x, uc2_config.coeffs[0], uc2_config.coeffs[1], uc2_config.coeffs[2],
                                  uc2_config.coeffs[3], uc2_config.coeffs[4], uc2_config.coeffs[5])
      * uc2_config.white_precompute;

  return ApplyExtended(x, base, uc2_config);
}

float3 ApplyExtended(float3 x, Config::Uncharted2ExtendedConfig uc2_config) {
  float3 base =
      renodx::tonemap::ApplyCurve(x, uc2_config.coeffs[0], uc2_config.coeffs[1], uc2_config.coeffs[2],
                                  uc2_config.coeffs[3], uc2_config.coeffs[4], uc2_config.coeffs[5])
      * uc2_config.white_precompute;
  return ApplyExtended(x, base, uc2_config);
}
}  // Uncharted2
