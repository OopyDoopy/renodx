#pragma once

#include <algorithm>
#include <array>
#include <cmath>
#include <cstdint>
#include <limits>

// CPU-side Prism primary authoring solver.
//
// This file owns all authoring-time colorimetry:
//   * selectable BT.709 / DCI-P3 / BT.2020 / AP1 / normalized-LMS starting bases
//   * Planckian temperature + CIE 1960 UCS tint (Duv)
//   * bounded and extrapolated primary hue/reach authoring in CIE 1931 xy
//   * white-inside-hull constraint
//   * primary matrix solve / inverse
//   * Prism-space Yf coefficients and neutral axis
//   * direct Prism <-> Stockman-Sharpe LMS matrices for MB grading
//
// The shader consumes the resolved matrices and coefficients.

namespace renodx::utils::prism {

namespace detail {

constexpr double kPi = 3.141592653589793238462643383279502884;
constexpr double kDegToRad = kPi / 180.0;
constexpr double kRadToDeg = 180.0 / kPi;
constexpr double kEpsilon = 1e-12;
constexpr double kWhiteBarycentricFloor = 1e-2;
constexpr double kMaximumCustomReach = 2.0;

struct Vec2 {
  double x = 0.0;
  double y = 0.0;
};

struct Vec3 {
  double x = 0.0;
  double y = 0.0;
  double z = 0.0;
};

struct Mat3 {
  // Row-major. Multiplication follows HLSL mul(matrix, column_vector).
  double m[3][3] = {};
};

inline Vec2 operator+(Vec2 a, Vec2 b) { return {a.x + b.x, a.y + b.y}; }
inline Vec2 operator-(Vec2 a, Vec2 b) { return {a.x - b.x, a.y - b.y}; }
inline Vec2 operator*(Vec2 a, double s) { return {a.x * s, a.y * s}; }
inline Vec2 operator*(double s, Vec2 a) { return a * s; }
inline Vec2 operator/(Vec2 a, double s) { return {a.x / s, a.y / s}; }

inline Vec3 operator+(Vec3 a, Vec3 b) { return {a.x + b.x, a.y + b.y, a.z + b.z}; }
inline Vec3 operator-(Vec3 a, Vec3 b) { return {a.x - b.x, a.y - b.y, a.z - b.z}; }
inline Vec3 operator*(Vec3 a, double s) { return {a.x * s, a.y * s, a.z * s}; }
inline Vec3 operator/(Vec3 a, double s) { return {a.x / s, a.y / s, a.z / s}; }

inline double Dot(Vec2 a, Vec2 b) { return a.x * b.x + a.y * b.y; }
inline double Dot(Vec3 a, Vec3 b) { return a.x * b.x + a.y * b.y + a.z * b.z; }
inline double Cross2(Vec2 a, Vec2 b) { return a.x * b.y - a.y * b.x; }
inline double Length(Vec2 v) { return std::sqrt(Dot(v, v)); }
inline Vec2 Normalize(Vec2 v) {
  const double length = Length(v);
  return length > kEpsilon ? v / length : Vec2{1.0, 0.0};
}

inline Vec3 Mul(const Mat3& a, Vec3 v) {
  return {
      a.m[0][0] * v.x + a.m[0][1] * v.y + a.m[0][2] * v.z,
      a.m[1][0] * v.x + a.m[1][1] * v.y + a.m[1][2] * v.z,
      a.m[2][0] * v.x + a.m[2][1] * v.y + a.m[2][2] * v.z,
  };
}

inline Mat3 Mul(const Mat3& a, const Mat3& b) {
  Mat3 out{};
  for (int r = 0; r < 3; ++r) {
    for (int c = 0; c < 3; ++c) {
      out.m[r][c] =
          a.m[r][0] * b.m[0][c]
          + a.m[r][1] * b.m[1][c]
          + a.m[r][2] * b.m[2][c];
    }
  }
  return out;
}

inline double Determinant(const Mat3& a) {
  return
      a.m[0][0] * (a.m[1][1] * a.m[2][2] - a.m[1][2] * a.m[2][1])
      - a.m[0][1] * (a.m[1][0] * a.m[2][2] - a.m[1][2] * a.m[2][0])
      + a.m[0][2] * (a.m[1][0] * a.m[2][1] - a.m[1][1] * a.m[2][0]);
}

inline Mat3 Inverse(const Mat3& a) {
  const double det = Determinant(a);
  if (std::abs(det) <= kEpsilon) {
    return Mat3{
        {{1.0, 0.0, 0.0},
         {0.0, 1.0, 0.0},
         {0.0, 0.0, 1.0}}};
  }

  const double inv_det = 1.0 / det;
  Mat3 out{};
  out.m[0][0] = +(a.m[1][1] * a.m[2][2] - a.m[1][2] * a.m[2][1]) * inv_det;
  out.m[0][1] = -(a.m[0][1] * a.m[2][2] - a.m[0][2] * a.m[2][1]) * inv_det;
  out.m[0][2] = +(a.m[0][1] * a.m[1][2] - a.m[0][2] * a.m[1][1]) * inv_det;
  out.m[1][0] = -(a.m[1][0] * a.m[2][2] - a.m[1][2] * a.m[2][0]) * inv_det;
  out.m[1][1] = +(a.m[0][0] * a.m[2][2] - a.m[0][2] * a.m[2][0]) * inv_det;
  out.m[1][2] = -(a.m[0][0] * a.m[1][2] - a.m[0][2] * a.m[1][0]) * inv_det;
  out.m[2][0] = +(a.m[1][0] * a.m[2][1] - a.m[1][1] * a.m[2][0]) * inv_det;
  out.m[2][1] = -(a.m[0][0] * a.m[2][1] - a.m[0][1] * a.m[2][0]) * inv_det;
  out.m[2][2] = +(a.m[0][0] * a.m[1][1] - a.m[0][1] * a.m[1][0]) * inv_det;
  return out;
}

inline Mat3 Columns(Vec3 a, Vec3 b, Vec3 c) {
  return Mat3{{
      {a.x, b.x, c.x},
      {a.y, b.y, c.y},
      {a.z, b.z, c.z},
  }};
}

inline Vec3 Row(const Mat3& m, int row) {
  return {m.m[row][0], m.m[row][1], m.m[row][2]};
}

inline Vec3 XYToXYZ(Vec2 xy, double Y = 1.0) {
  // Preserve the sign of y for signed basis chromaticities. A normalized LMS
  // basis can contain signed XYZ directions and therefore negative xy values.
  const double safe_y = std::abs(xy.y) > 1e-12
      ? xy.y
      : std::copysign(1e-12, xy.y == 0.0 ? 1.0 : xy.y);
  return {
      xy.x * Y / safe_y,
      Y,
      (1.0 - xy.x - xy.y) * Y / safe_y,
  };
}

inline Vec2 XYToUV1960(Vec2 xy) {
  const double denominator = -2.0 * xy.x + 12.0 * xy.y + 3.0;
  if (std::abs(denominator) <= kEpsilon) return {};
  return {
      4.0 * xy.x / denominator,
      6.0 * xy.y / denominator,
  };
}

inline Vec2 UV1960ToXY(Vec2 uv) {
  const double denominator = 2.0 * uv.x - 8.0 * uv.y + 4.0;
  if (std::abs(denominator) <= kEpsilon) return {1.0 / 3.0, 1.0 / 3.0};
  return {
      3.0 * uv.x / denominator,
      2.0 * uv.y / denominator,
  };
}

// Kim et al.-style polynomial approximation to the Planckian locus in CIE xy.
// Valid across the range used here (1667 K .. 25000 K).
inline Vec2 PlanckianXY(double kelvin) {
  const double T = std::clamp(kelvin, 1667.0, 25000.0);
  double x;
  if (T <= 4000.0) {
    x = -0.2661239e9 / (T * T * T)
        - 0.2343580e6 / (T * T)
        + 0.8776956e3 / T
        + 0.179910;
  } else {
    x = -3.0258469e9 / (T * T * T)
        + 2.1070379e6 / (T * T)
        + 0.2226347e3 / T
        + 0.240390;
  }

  double y;
  if (T <= 2222.0) {
    y = -1.1063814 * x * x * x
        - 1.34811020 * x * x
        + 2.18555832 * x
        - 0.20219683;
  } else if (T <= 4000.0) {
    y = -0.9549476 * x * x * x
        - 1.37418593 * x * x
        + 2.09137015 * x
        - 0.16748867;
  } else {
    y = 3.0817580 * x * x * x
        - 5.87338670 * x * x
        + 3.75112997 * x
        - 0.37001483;
  }

  return {x, y};
}

// Local tangent / positive-Duv normal in CIE 1960 UCS. The finite difference
// is taken in reciprocal temperature so the local geometry behaves smoothly
// across the Kelvin range.
inline std::pair<Vec2, Vec2> PlanckianTangentNormalUV(double kelvin) {
  const double clamped_kelvin = std::clamp(kelvin, 1667.0, 25000.0);
  const double mired = 1.0e6 / clamped_kelvin;
  constexpr double delta_mired = 0.5;
  const double min_mired = 1.0e6 / 25000.0;
  const double max_mired = 1.0e6 / 1667.0;

  const double warmer_mired = std::min(max_mired, mired + delta_mired);
  const double cooler_mired = std::max(min_mired, mired - delta_mired);

  const Vec2 warmer_uv = XYToUV1960(PlanckianXY(1.0e6 / warmer_mired));
  const Vec2 cooler_uv = XYToUV1960(PlanckianXY(1.0e6 / cooler_mired));
  const Vec2 tangent = Normalize(cooler_uv - warmer_uv);

  // Positive Duv convention: normal points to the upper/green side of the
  // Planckian locus in CIE 1960 UCS.
  const Vec2 positive_duv_normal = Normalize({tangent.y, -tangent.x});
  return {tangent, positive_duv_normal};
}

inline Vec2 TemperatureTintToXY(double kelvin, double tint_duv) {
  const Vec2 base_uv = XYToUV1960(PlanckianXY(kelvin));
  const auto [tangent, normal] = PlanckianTangentNormalUV(kelvin);
  (void)tangent;
  return UV1960ToXY(base_uv + normal * tint_duv);
}

struct TemperatureTint {
  double kelvin = 6500.0;
  double tint_duv = 0.0;
};

inline TemperatureTint XYToTemperatureTint(Vec2 target_xy) {
  const Vec2 target_uv = XYToUV1960(target_xy);

  // Find the closest Planckian point in reciprocal-temperature space.
  double lo = 1.0e6 / 25000.0;
  double hi = 1.0e6 / 1667.0;
  for (int i = 0; i < 72; ++i) {
    const double m1 = lo + (hi - lo) / 3.0;
    const double m2 = hi - (hi - lo) / 3.0;
    const Vec2 uv1 = XYToUV1960(PlanckianXY(1.0e6 / m1));
    const Vec2 uv2 = XYToUV1960(PlanckianXY(1.0e6 / m2));
    const Vec2 d1 = uv1 - target_uv;
    const Vec2 d2 = uv2 - target_uv;
    if (Dot(d1, d1) < Dot(d2, d2)) {
      hi = m2;
    } else {
      lo = m1;
    }
  }

  const double mired = 0.5 * (lo + hi);
  const double kelvin = 1.0e6 / mired;
  const Vec2 base_uv = XYToUV1960(PlanckianXY(kelvin));
  const auto [tangent, normal] = PlanckianTangentNormalUV(kelvin);
  (void)tangent;
  return {kelvin, Dot(target_uv - base_uv, normal)};
}

inline Vec3 Barycentric(Vec2 p, Vec2 a, Vec2 b, Vec2 c) {
  const Vec2 ab = b - a;
  const Vec2 ac = c - a;
  const Vec2 ap = p - a;
  const double denominator = Cross2(ab, ac);
  if (std::abs(denominator) <= kEpsilon) return {1.0 / 3.0, 1.0 / 3.0, 1.0 / 3.0};
  const double wb = Cross2(ap, ac) / denominator;
  const double wc = Cross2(ab, ap) / denominator;
  return {1.0 - wb - wc, wb, wc};
}

inline Vec2 ConstrainWhite(Vec2 white, Vec2 r, Vec2 g, Vec2 b, bool* constrained = nullptr) {
  Vec3 weights = Barycentric(white, r, g, b);
  const Vec3 original = weights;
  weights.x = std::max(weights.x, kWhiteBarycentricFloor);
  weights.y = std::max(weights.y, kWhiteBarycentricFloor);
  weights.z = std::max(weights.z, kWhiteBarycentricFloor);
  const double sum = weights.x + weights.y + weights.z;
  weights = weights / sum;
  if (constrained != nullptr) {
    *constrained =
        std::abs(weights.x - original.x) > 1e-10
        || std::abs(weights.y - original.y) > 1e-10
        || std::abs(weights.z - original.z) > 1e-10;
  }
  return r * weights.x + g * weights.y + b * weights.z;
}

inline Vec2 Rotate(Vec2 direction, double degrees) {
  const double angle = degrees * kDegToRad;
  const double s = std::sin(angle);
  const double c = std::cos(angle);
  return {c * direction.x - s * direction.y,
          s * direction.x + c * direction.y};
}

inline double PositiveAngleDegrees(Vec2 from, Vec2 to) {
  double angle = std::atan2(Cross2(from, to), Dot(from, to)) * kRadToDeg;
  if (angle < 0.0) angle += 360.0;
  return angle;
}

inline double ComputePrimaryHueLimit(Vec2 r, Vec2 g, Vec2 b, Vec2 white) {
  const Vec2 rd = Normalize(r - white);
  const Vec2 gd = Normalize(g - white);
  const Vec2 bd = Normalize(b - white);
  const double maximum_gap = std::max({
      PositiveAngleDegrees(rd, gd),
      PositiveAngleDegrees(gd, bd),
      PositiveAngleDegrees(bd, rd),
  });
  return std::max(0.0, 0.49 * (180.0 - maximum_gap));
}

inline double SmallestUndirectedAngleDegrees(Vec2 a, Vec2 b) {
  const double angle = PositiveAngleDegrees(a, b);
  return std::min(angle, 360.0 - angle);
}

inline double ComputeUnboundedPrimaryHueLimit(Vec2 r, Vec2 g, Vec2 b, Vec2 white) {
  const Vec2 rd = Normalize(r - white);
  const Vec2 gd = Normalize(g - white);
  const Vec2 bd = Normalize(b - white);
  const double minimum_separation = std::min({
      SmallestUndirectedAngleDegrees(rd, gd),
      SmallestUndirectedAngleDegrees(gd, bd),
      SmallestUndirectedAngleDegrees(bd, rd),
  });
  // Keep independently adjusted axes from crossing each other. Global hue is
  // still free to rotate the whole basis coherently.
  return std::max(0.0, minimum_separation * 0.45);
}

inline double RayEdgeIntersectionDistance(Vec2 origin, Vec2 direction, Vec2 a, Vec2 b) {
  const Vec2 edge = b - a;
  const double denominator = Cross2(direction, edge);
  if (std::abs(denominator) <= 1e-10) return std::numeric_limits<double>::infinity();
  const Vec2 relative = a - origin;
  const double ray_distance = Cross2(relative, edge) / denominator;
  const double edge_position = Cross2(relative, direction) / denominator;
  if (ray_distance <= 0.0 || edge_position < 0.0 || edge_position > 1.0) {
    return std::numeric_limits<double>::infinity();
  }
  return ray_distance;
}

inline Vec2 RayToBoundary(Vec2 white, Vec2 direction, Vec2 r, Vec2 g, Vec2 b) {
  double distance = std::numeric_limits<double>::infinity();
  distance = std::min(distance, RayEdgeIntersectionDistance(white, direction, r, g));
  distance = std::min(distance, RayEdgeIntersectionDistance(white, direction, g, b));
  distance = std::min(distance, RayEdgeIntersectionDistance(white, direction, b, r));
  if (!std::isfinite(distance)) return white;
  return white + direction * distance;
}

inline double ApplyReachStrength(double reach, double strength, double maximum_reach) {
  // A zero reach collapses a primary onto white and can make the primary
  // matrix singular. Keep the existing safety floor while exposing 0% in the
  // UI, and allow the Custom path to extrapolate past its base radius.
  const double safe_reach = std::clamp(reach, 0.05, maximum_reach);
  return std::exp2(std::log2(safe_reach) * std::max(strength, 0.0));
}

inline std::array<float, 4> PackRow(const Mat3& m, int row) {
  return {
      static_cast<float>(m.m[row][0]),
      static_cast<float>(m.m[row][1]),
      static_cast<float>(m.m[row][2]),
      0.0f,
  };
}

inline std::array<std::array<float, 4>, 3> PackMatrix(const Mat3& m) {
  return {PackRow(m, 0), PackRow(m, 1), PackRow(m, 2)};
}

// RenoDX current linear colorimetry constants.
inline constexpr Mat3 kBT709ToXYZ{{
    {0.4123907993, 0.3575843394, 0.1804807884},
    {0.2126390059, 0.7151686788, 0.0721923154},
    {0.0193308187, 0.1191947798, 0.9505321522},
}};

inline constexpr Mat3 kXYZToBT709{{
    {3.2409699419, -1.5373831776, -0.4986107603},
    {-0.9692436363, 1.8759675015, 0.0415550574},
    {0.0556300797, -0.2039769589, 1.0569715142},
}};

inline constexpr Mat3 kXYZToStockmanSharpLMS{{
    {0.2670502842655792, 0.8471990148492798, -0.03470416612462053},
    {-0.38706882411220156, 1.165429935890458, 0.10302286696614202},
    {0.026727793989083093, -0.02729131667566509, 0.5333267257603284},
}};

inline constexpr Mat3 kStockmanSharpLMSToXfYfZf{{
    {1.94735469, -1.41445123, 0.36476327},
    {0.68990272, 0.34832189, 0.0},
    {0.0, 0.0, 1.93485343},
}};

// Exact normalized Stockman LMS basis previously used for Prism experiments.
// BT.709/D65 white maps to LMS=(1,1,1), so the row sums are exactly 1.
inline constexpr Mat3 kBT709ToNormalizedLMS{{
    {0.26472075, 0.67401298, 0.06126627},
    {0.09215816, 0.81037427, 0.09746757},
    {0.01775004, 0.10944762, 0.87280234},
}};

inline constexpr Mat3 kNormalizedLMSToBT709{{
    {5.31371789, -4.43611139, 0.12239350},
    {-0.60034891, 1.75409022, -0.15374131},
    {-0.03278170, -0.12974283, 1.16252453},
}};

inline Vec2 XYZToXY(Vec3 xyz) {
  const double sum = xyz.x + xyz.y + xyz.z;
  if (std::abs(sum) <= kEpsilon) return {1.0 / 3.0, 1.0 / 3.0};
  return {xyz.x / sum, xyz.y / sum};
}

inline Vec2 BT709DirectionToXY(Vec3 bt709) {
  return XYZToXY(Mul(kBT709ToXYZ, bt709));
}

}  // namespace detail

enum class Gamut : std::int32_t {
  BT709 = 0,
  DCI_P3 = 1,
  BT2020 = 2,
  AP1 = 3,
  LMS_BT709_WHITE = 4,
};

struct Chromaticity {
  float x = 0.f;
  float y = 0.f;
};

struct GamutChromaticities {
  Chromaticity red{};
  Chromaticity green{};
  Chromaticity blue{};
};

struct WhitePreset {
  static constexpr std::array<double, 2> D65 = {0.3127, 0.3290};
  static constexpr std::array<double, 2> D60 = {0.32168, 0.33767};
  static constexpr std::array<double, 2> D55 = {0.33242, 0.34743};
  static constexpr std::array<double, 2> D50 = {0.34567, 0.35850};
  static constexpr std::array<double, 2> DCI = {0.3140, 0.3510};
};

struct TemperatureTint {
  float kelvin = 6500.f;
  // CIE 1960 UCS Duv. Positive is the green side of the Planckian locus;
  // negative is the magenta side.
  float tint_duv = 0.f;
};

inline TemperatureTint TemperatureTintFromXY(float x, float y) {
  const auto result = detail::XYToTemperatureTint({x, y});
  return {
      static_cast<float>(result.kelvin),
      static_cast<float>(result.tint_duv),
  };
}

inline std::array<float, 2> WhiteXYFromTemperatureTint(float kelvin, float tint_duv) {
  const auto xy = detail::TemperatureTintToXY(kelvin, tint_duv);
  return {static_cast<float>(xy.x), static_cast<float>(xy.y)};
}

struct AuthoringConfig {
  Gamut gamut = Gamut::BT709;
  bool allow_primary_extrapolation = false;

  // Structural authoring white. Defaults are the temperature/Duv
  // representation of exact D65 under this solver's Planckian approximation.
  float temperature_kelvin = 6501.7344f;
  float tint_duv = 0.0031730535f;

  float global_reach = 1.f;
  float global_hue_degrees = 0.f;

  float red_reach = 1.f;
  float red_hue_degrees = 0.f;

  float green_reach = 1.f;
  float green_hue_degrees = 0.f;

  float blue_reach = 1.f;
  float blue_hue_degrees = 0.f;

  float strength = 1.f;
};

// 16-byte row packing matches the float4 cbuffer fields and gives explicit
// HLSL matrix layout.
struct ResolvedConfig {
  std::array<std::array<float, 4>, 3> inset_rows{};          // BT.709 -> Prism
  std::array<std::array<float, 4>, 3> outset_rows{};         // Prism -> BT.709
  std::array<std::array<float, 4>, 3> working_to_lms_rows{}; // Prism -> Stockman-Sharpe LMS
  std::array<std::array<float, 4>, 3> lms_to_working_rows{}; // LMS -> Prism

  // xyz = Yf coefficients; w = 1 / Yf(neutral_axis)
  std::array<float, 4> yf_weights{};
  std::array<float, 4> yf_neutral_axis{};

  // CPU/UI diagnostics.
  std::array<float, 2> requested_white_xy{};
  std::array<float, 2> white_xy{};
  std::array<float, 2> red_xy{};
  std::array<float, 2> green_xy{};
  std::array<float, 2> blue_xy{};
  float independent_hue_limit_degrees = 0.f;
  float outset_determinant = 0.f;
  bool white_was_constrained = false;
};

namespace detail {

inline void GamutPrimaries(Gamut gamut, Vec2& r, Vec2& g, Vec2& b) {
  switch (gamut) {
    case Gamut::LMS_BT709_WHITE:
      // Treat the three unit axes of the exact normalized LMS basis as RGB-like
      // authoring primaries. These are RGB-like normalized basis directions;
      // their CIE embedding may contain signed coordinates.
      r = BT709DirectionToXY({
          kNormalizedLMSToBT709.m[0][0],
          kNormalizedLMSToBT709.m[1][0],
          kNormalizedLMSToBT709.m[2][0]});
      g = BT709DirectionToXY({
          kNormalizedLMSToBT709.m[0][1],
          kNormalizedLMSToBT709.m[1][1],
          kNormalizedLMSToBT709.m[2][1]});
      b = BT709DirectionToXY({
          kNormalizedLMSToBT709.m[0][2],
          kNormalizedLMSToBT709.m[1][2],
          kNormalizedLMSToBT709.m[2][2]});
      return;
    case Gamut::AP1:
      // ACES AP1 / ACEScg primary chromaticities. Prism independently controls
      // the structural white; exact AP1 uses the D60 preset.
      r = {0.713, 0.293};
      g = {0.165, 0.830};
      b = {0.128, 0.044};
      return;
    case Gamut::BT2020:
      r = {0.708, 0.292};
      g = {0.170, 0.797};
      b = {0.131, 0.046};
      return;
    case Gamut::DCI_P3:
      r = {0.680, 0.320};
      g = {0.265, 0.690};
      b = {0.150, 0.060};
      return;
    case Gamut::BT709:
    default:
      r = {0.640, 0.330};
      g = {0.300, 0.600};
      b = {0.150, 0.060};
      return;
  }
}

inline Vec2 AuthorPrimary(
    Vec2 base_primary,
    Vec2 white,
    double global_reach,
    double global_hue,
    double primary_reach,
    double primary_hue,
    double strength,
    double hue_limit,
    Vec2 gamut_r,
    Vec2 gamut_g,
    Vec2 gamut_b) {
  const double reach = ApplyReachStrength(global_reach * primary_reach, strength, 1.0);
  const double coherent_hue = global_hue * strength;
  const double independent_hue = std::clamp(primary_hue * strength, -hue_limit, hue_limit);
  const Vec2 base_direction = Normalize(base_primary - white);
  const Vec2 authored_direction = Rotate(base_direction, coherent_hue + independent_hue);
  const Vec2 boundary = RayToBoundary(white, authored_direction, gamut_r, gamut_g, gamut_b);
  return white + (boundary - white) * reach;
}

inline Vec2 AuthorUnboundedPrimary(
    Vec2 base_primary,
    Vec2 white,
    double global_reach,
    double global_hue,
    double primary_reach,
    double primary_hue,
    double strength,
    double hue_limit) {
  // Custom axes can be extrapolated beyond their starting radius. The UI
  // exposes two 0..200% reach factors with a combined effective reach cap of
  // 200%.
  const double reach = ApplyReachStrength(
      global_reach * primary_reach,
      strength,
      kMaximumCustomReach);
  const double coherent_hue = global_hue * strength;
  const double independent_hue = std::clamp(primary_hue * strength, -hue_limit, hue_limit);
  const Vec2 base_delta = base_primary - white;
  const Vec2 authored_delta = Rotate(base_delta, coherent_hue + independent_hue);
  return white + authored_delta * reach;
}

}  // namespace detail

inline GamutChromaticities GetGamutChromaticities(Gamut gamut) {
  detail::Vec2 r{};
  detail::Vec2 g{};
  detail::Vec2 b{};
  detail::GamutPrimaries(gamut, r, g, b);
  return {
      {static_cast<float>(r.x), static_cast<float>(r.y)},
      {static_cast<float>(g.x), static_cast<float>(g.y)},
      {static_cast<float>(b.x), static_cast<float>(b.y)},
  };
}

inline const char* GamutName(Gamut gamut) {
  switch (gamut) {
    case Gamut::DCI_P3: return "DCI-P3";
    case Gamut::BT2020: return "BT.2020";
    case Gamut::AP1: return "AP1";
    case Gamut::LMS_BT709_WHITE: return "LMS";
    case Gamut::BT709:
    default: return "BT.709";
  }
}

inline bool IsSignedBasis(Gamut gamut) {
  return gamut == Gamut::LMS_BT709_WHITE;
}

inline ResolvedConfig Resolve(const AuthoringConfig& config) {
  using namespace detail;

  Vec2 gamut_r{};
  Vec2 gamut_g{};
  Vec2 gamut_b{};
  GamutPrimaries(config.gamut, gamut_r, gamut_g, gamut_b);

  const Vec2 requested_white = TemperatureTintToXY(
      config.temperature_kelvin,
      config.tint_duv);

  const bool unbounded_primary_authoring =
      config.gamut == Gamut::LMS_BT709_WHITE
      || config.allow_primary_extrapolation;

  bool white_was_constrained = false;
  const Vec2 white = unbounded_primary_authoring
      ? requested_white
      : ConstrainWhite(
            requested_white,
            gamut_r,
            gamut_g,
            gamut_b,
            &white_was_constrained);

  const double hue_limit = unbounded_primary_authoring
      ? ComputeUnboundedPrimaryHueLimit(gamut_r, gamut_g, gamut_b, white)
      : ComputePrimaryHueLimit(gamut_r, gamut_g, gamut_b, white);

  const auto author_primary = [&](Vec2 base, double reach, double hue) {
    if (unbounded_primary_authoring) {
      return AuthorUnboundedPrimary(
          base, white,
          config.global_reach, config.global_hue_degrees,
          reach, hue,
          config.strength, hue_limit);
    }
    return AuthorPrimary(
        base, white,
        config.global_reach, config.global_hue_degrees,
        reach, hue,
        config.strength, hue_limit,
        gamut_r, gamut_g, gamut_b);
  };

  const Vec2 red = author_primary(gamut_r, config.red_reach, config.red_hue_degrees);
  const Vec2 green = author_primary(gamut_g, config.green_reach, config.green_hue_degrees);
  const Vec2 blue = author_primary(gamut_b, config.blue_reach, config.blue_hue_degrees);

  // Construct Prism -> XYZ with the authored chromaticity directions as columns,
  // then solve column scales so RGB=(1,1,1) reproduces the selected white.
  const Vec3 r_xyz = XYToXYZ(red);
  const Vec3 g_xyz = XYToXYZ(green);
  const Vec3 b_xyz = XYToXYZ(blue);
  const Vec3 white_xyz = XYToXYZ(white);
  const Mat3 direction_matrix = Columns(r_xyz, g_xyz, b_xyz);
  const Vec3 scales = Mul(Inverse(direction_matrix), white_xyz);
  const Mat3 prism_to_xyz = Columns(r_xyz * scales.x, g_xyz * scales.y, b_xyz * scales.z);

  const Mat3 outset = Mul(kXYZToBT709, prism_to_xyz);
  const Mat3 inset = Inverse(outset);

  const Mat3 stockman_to_xyz = Inverse(kXYZToStockmanSharpLMS);
  const Mat3 bt709_to_lms = Mul(kXYZToStockmanSharpLMS, kBT709ToXYZ);
  const Mat3 lms_to_bt709 = Mul(kXYZToBT709, stockman_to_xyz);
  const Mat3 working_to_lms = Mul(bt709_to_lms, outset);
  const Mat3 lms_to_working = Mul(inset, lms_to_bt709);

  // Yf functional in BT.709, then expressed directly in the Prism basis.
  const Mat3 bt709_to_xfyfzf = Mul(kStockmanSharpLMSToXfYfZf, bt709_to_lms);
  const Vec3 yf_bt709 = Row(bt709_to_xfyfzf, 1);
  const Vec3 yf_working = {
      yf_bt709.x * outset.m[0][0] + yf_bt709.y * outset.m[1][0] + yf_bt709.z * outset.m[2][0],
      yf_bt709.x * outset.m[0][1] + yf_bt709.y * outset.m[1][1] + yf_bt709.z * outset.m[2][1],
      yf_bt709.x * outset.m[0][2] + yf_bt709.y * outset.m[1][2] + yf_bt709.z * outset.m[2][2],
  };

  const Vec3 white_bt709 = Mul(kXYZToBT709, white_xyz);
  const Vec3 neutral_axis = Mul(inset, white_bt709);
  const double neutral_yf = Dot(neutral_axis, yf_working);
  const double neutral_yf_rcp = std::abs(neutral_yf) > kEpsilon ? 1.0 / neutral_yf : 1.0;

  ResolvedConfig resolved{};
  resolved.inset_rows = PackMatrix(inset);
  resolved.outset_rows = PackMatrix(outset);
  resolved.working_to_lms_rows = PackMatrix(working_to_lms);
  resolved.lms_to_working_rows = PackMatrix(lms_to_working);
  resolved.yf_weights = {
      static_cast<float>(yf_working.x),
      static_cast<float>(yf_working.y),
      static_cast<float>(yf_working.z),
      static_cast<float>(neutral_yf_rcp),
  };
  resolved.yf_neutral_axis = {
      static_cast<float>(neutral_axis.x),
      static_cast<float>(neutral_axis.y),
      static_cast<float>(neutral_axis.z),
      0.f,
  };

  resolved.requested_white_xy = {
      static_cast<float>(requested_white.x),
      static_cast<float>(requested_white.y),
  };
  resolved.white_xy = {static_cast<float>(white.x), static_cast<float>(white.y)};
  resolved.red_xy = {static_cast<float>(red.x), static_cast<float>(red.y)};
  resolved.green_xy = {static_cast<float>(green.x), static_cast<float>(green.y)};
  resolved.blue_xy = {static_cast<float>(blue.x), static_cast<float>(blue.y)};
  resolved.independent_hue_limit_degrees = static_cast<float>(hue_limit);
  resolved.outset_determinant = static_cast<float>(Determinant(outset));
  resolved.white_was_constrained = white_was_constrained;
  return resolved;
}

}  // namespace renodx::utils::prism
