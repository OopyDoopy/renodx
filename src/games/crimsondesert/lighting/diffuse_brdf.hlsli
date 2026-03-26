// All functions return a scalar diffuse factor (no albedo weighting)
// The game's pipeline applies albedo downstream
// Multiply the return value by saturate(NdotL) externally if needed

#ifndef DIFFUSE_BRDF_HLSLI
#define DIFFUSE_BRDF_HLSLI

static const float RDXL_PI     = 3.14159265f;
static const float RDXL_INV_PI = 0.31830987334251404f;

// ============================================================================
// Hammon 2017 Diffuse BRDF (scalar)
// ----------------------------------------------------------------------------
// Earl Hammon Jr., GDC 2017
//
// Energy-conserving diffuse with multi-scatter compensation.
// Returns scalar: single + multi (no albedo, no NdotL).
// ============================================================================
float HammonDiffuseScalar(
    float NdotL, float NdotV, float NdotH, float VdotH,
    float roughness)
{
  float facing = 0.5f + 0.5f * VdotH;
  float rough  = facing * (0.9f - 0.4f * facing)
               * ((0.5f + NdotH) / max(NdotH, 0.1f));

  float oneMinusNdotL = 1.0f - NdotL;
  float NdotL5 = oneMinusNdotL * oneMinusNdotL;
  NdotL5 *= NdotL5 * oneMinusNdotL;

  float oneMinusNdotV = 1.0f - NdotV;
  float NdotV5 = oneMinusNdotV * oneMinusNdotV;
  NdotV5 *= NdotV5 * oneMinusNdotV;

  float smooth_val = 1.05f * (1.0f - NdotL5) * (1.0f - NdotV5);
  float single = lerp(smooth_val, rough, roughness) * RDXL_INV_PI;
  float multi  = 0.1159f * roughness;
  return single + multi;
}

// ============================================================================
// EON — Energy Preserving Oren Nayar Diffuse BRDF (scalar, exact)
// ----------------------------------------------------------------------------
// Portsmouth, Kutz & Hill 2025 — "EON: A Practical Energy-Preserving
// Rough Diffuse BRDF"
//
// Uses the EXACT directional albedo (not polynomial approximation)
// Returns scalar: (f_ss + f_ms) with rho = 1 (no albedo, no NdotL)
//
// Parameters use world-space dot products; the azimuthal s-term is
// reconstructed from  s = dot(L,V) - NdotL * NdotV
// ============================================================================

// FON constants
static const float EON_C1 = 0.5f - 2.0f / (3.0f * RDXL_PI);  // ~0.2876
static const float EON_C2 = 2.0f / 3.0f - 28.0f / (15.0f * RDXL_PI);  // ~0.0716

// FON Directional Albedo — Exact closed form
float EON_E_FON_Exact_L(float mu, float r)
{
  float AF = 1.0f / (1.0f + EON_C1 * r);
  float BF = r * AF;
  float Si = sqrt(max(1.0f - mu * mu, 0.0f));
  float G  = Si * (acos(clamp(mu, -1.0f, 1.0f)) - Si * mu)
           + (2.0f / 3.0f) * ((Si / max(mu, 1e-7f)) * (1.0f - Si * Si * Si) - Si);
  return AF + (BF * RDXL_INV_PI) * G;
}

// EON scalar evaluation (exact E_FON, rho = 1)
// NdotL, NdotV : saturated cos-theta for light/view
// LdotV        : dot(L, V) — NOT saturated, can be negative
// roughness    : linear roughness [0,1]
float EON_DiffuseScalar(
    float NdotL, float NdotV, float LdotV, float roughness)
{
  float mu_i = NdotL;
  float mu_o = NdotV;

  // Azimuthal s-term: dot(wi, wo) - mu_i * mu_o
  // In tangent space: s = dot(wi_local, wo_local) - wi_local.z * wo_local.z
  // In world space:   s = dot(L, V) - NdotL * NdotV
  float s = LdotV - mu_i * mu_o;

  // FON s/t ratio — clamped denominator for rasterization stability.
  // The paper's formulation diverges when both mu_i and mu_o are small
  // (grazing foliage, complex geometry).  CLTC importance sampling in
  // path tracing naturally avoids these configurations, but in a deferred
  // rasterizer we must clamp.  Threshold 0.1 matches Hammon's approach
  // for NdotH and caps sovertF at s/0.1 ≈ 10 max
  float sovertF = (s > 0.0f) ? (s / max(max(mu_i, mu_o), 0.1f)) : s;

  // FON A coefficient
  float AF = 1.0f / (1.0f + EON_C1 * roughness);

  // Single-scatter (rho = 1) — clamped to non negative.
  // Negative values occur when s is large negative (backlit geometry)
  // with high roughness: (1 + r * s) < 0.  The paper handles this
  // via multi-scatter energy compensation, but with rho=1 scalar
  // mode the correction is imperfect.  Clamping f_ss ≥ 0 prevents
  // the darker than Lambert artifact
  float f_ss = max(0.0f, RDXL_INV_PI * AF * (1.0f + roughness * sovertF));

  // Directional albedos (exact)
  float EFo = EON_E_FON_Exact_L(mu_o, roughness);
  float EFi = EON_E_FON_Exact_L(mu_i, roughness);

  // Average albedo
  float avgEF = AF * (1.0f + EON_C2 * roughness);

  // Multi-scatter with rho = 1:
  //   rho_ms = rho^2 * avgEF / (1 - rho * (1 - avgEF))
  //          = 1 * avgEF / (1 - 1 * (1 - avgEF))
  //          = avgEF / avgEF = 1
  //   f_ms = 1 * (1/PI) * (1-EFo) * (1-EFi) / (1-avgEF)
  float f_ms = RDXL_INV_PI
             * max(1e-7f, 1.0f - EFo)
             * max(1e-7f, 1.0f - EFi)
             / max(1e-7f, 1.0f - avgEF);

  return f_ss + f_ms;
}

// ============================================================================
// Callisto Smooth Terminator (SIGGRAPH 2023)
// ----------------------------------------------------------------------------
// Taken from Striking Distance Studios — slides 90/98
// Softens the hard light/dark boundary on low-poly geometry where
// interpolated normals create a visible faceted terminator line
// Returns scalar c2 that multiplies the entire BRDF (diffuse + specular)
//
//   o — intensity [0,1] (0 = off, higher = smoother)
//   p — edge length [0,1] (default 0.5)
// ============================================================================
float CallistoSmoothTerminator(
    float NdotL, float VdotH, float NdotH,
    float o, float p)
{
  float d3 = 1.0f - VdotH;
  d3 = d3 * d3 * d3;
  float h3 = 1.0f - NdotH;
  h3 = h3 * h3 * h3;

  float alpha_s = (1.0f - d3) * (1.0f - h3);

  float edge      = alpha_s * p;
  float cosTheta_i = max(NdotL, 0.0f);
  float s          = smoothstep(0.0f, edge, cosTheta_i);

  return lerp(1.0f, s, alpha_s * o);
}

// ============================================================================
// Geometric Specular Anti-Aliasing — Compute Shader Compatible
// ----------------------------------------------------------------------------
// Tokuyoshi & Kaplanyan 2021: "Improved Geometric Specular Anti-Aliasing"
// Adapted for compute shaders using QuadReadAcrossX/Y instead of ddx/ddy
//
// Widens roughness based on screen-space normal derivatives to eliminate
// specular shimmer on distant surfaces where normals alias at sub-pixel
//
//   normalWS  — world-space shading normal (normalised)
//   roughness — linear roughness [0,1]
//   strength  — user control [0,1]: 0=off, 1=full filtering
//
// Returns: filtered linear roughness
// ============================================================================
float NDFFilterRoughnessCS(
    float3 normalWS,
    float  roughness,
    float  strength)
{
  // Approximate screen-space derivatives via wave quad intrinsics
  float3 dndu = QuadReadAcrossX(normalWS) - normalWS;
  float3 dndv = QuadReadAcrossY(normalWS) - normalWS;

  static const float SIGMA2 = 0.15915494f;  // 1/(2pi)
  float kernelRoughness2 = 2.0f * SIGMA2 * (dot(dndu, dndu) + dot(dndv, dndv));

  // kappa = 0.18 clamping threshold (Kaplanyan 2016 / Tokuyoshi 2021)
  static const float KAPPA = 0.18f;
  float clampedKernel = min(kernelRoughness2, KAPPA) * strength;

  float alpha  = roughness * roughness;
  float alpha2 = saturate(alpha * alpha + clampedKernel);
  return sqrt(sqrt(alpha2));  // back to linear roughness
}

// ============================================================================
// Diffraction on Rough Surfaces — Shift Only Fast Path
// ----------------------------------------------------------------------------
// Werner et al. 2024 (JCGT) / Clausen et al. 2023 spectral shift function
// Adds wavelength dependent colour fringing to metallic specular highlights
//
// Only the spectral shift is applied (no speckle noise)
//
//   NdotH     — saturate(dot(N, H))
//   roughness — GGX alpha (linear roughness)
//
// Returns: float3 RGB modifier to multiply into specular
//          Values near 1.0 with subtle colour variation
// ============================================================================

struct DiffractionParams {
  float  alpha;
  float  w;
  float  h;
  float3 shiftScatter;
  float3 shiftIntensity;
};

DiffractionParams DiffractionParamsRoughMetal()
{
  DiffractionParams p;
  p.alpha          = 0.3922;
  p.w              = 3.8261;
  p.h              = 0.00198;
  p.shiftScatter   = float3(1.0, 0.88, 0.76);
  p.shiftIntensity = float3(0.95, 1.0, 1.05);
  return p;
}

DiffractionParams DiffractionParamsSmoothMetal()
{
  DiffractionParams p;
  p.alpha          = 0.14033;
  p.w              = 6.4455;
  p.h              = 0.00077;
  p.shiftScatter   = float3(1.0, 0.88, 0.76);
  p.shiftIntensity = float3(0.95, 1.0, 1.05);
  return p;
}

DiffractionParams DiffractionParamsFromRoughness(float alpha)
{
  DiffractionParams rough  = DiffractionParamsRoughMetal();
  DiffractionParams smooth = DiffractionParamsSmoothMetal();
  float t = saturate((0.3922 - alpha) / (0.3922 - 0.14033));
  DiffractionParams p;
  p.alpha          = alpha;
  p.w              = lerp(rough.w, smooth.w, t);
  p.h              = lerp(rough.h, smooth.h, t);
  p.shiftScatter   = lerp(rough.shiftScatter, smooth.shiftScatter, t);
  p.shiftIntensity = lerp(rough.shiftIntensity, smooth.shiftIntensity, t);
  return p;
}

float3 DiffractionShift(float thetaM, DiffractionParams params)
{
  float cosWT = cos(params.w * thetaM);
  return params.shiftScatter * cosWT * params.h + params.shiftIntensity;
}

float3 DiffractionShiftOnly(float NdotH, float roughness)
{
  DiffractionParams params = DiffractionParamsFromRoughness(roughness);
  float thetaM = acos(NdotH);
  return DiffractionShift(thetaM, params);
}

#endif  // DIFFUSE_BRDF_HLSLI
