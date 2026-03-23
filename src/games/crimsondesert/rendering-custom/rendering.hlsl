// Rendering Improvements — helpers
// ========================================================
//
// This file is organized into four major parts:
//
// ╔══════════════════════════════════════════════════════════════════════════════╗
// ║  PART I — GENERAL RENDERING                                                  ║
// ╠══════════════════════════════════════════════════════════════════════════════╣
// ║  1. Cubemap / probe modulation     (skylight luminance + roughness + AO)     ║
// ║  2. Cubemap / probe sampling       (parallax, mip selection, split-sum)      ║
// ║  3. Bloom black-floor preservation (luminance-aware bloom scaling)           ║
// ║  4. Fog color correction           (OKLab hue/chroma/lightness restoration)  ║
// ║  5. Grass rendering improvements   (GoT-inspired VS/PS enhancements)         ║
// ║  6. Indirect lighting helpers      (GoT-inspired SH, bounce, leak fix,       ║
// ║                                     horizon occlusion, roughness parallax,   ║
// ║                                     Chebyshev visibility, backface reject,   ║
// ║                                     irradiance sharpening, SSGI approx)      ║
// ║  7. Atmospheric scattering helpers  (GoT Rayleigh LMS color space)           ║
// ║  8. Volumetric haze anti-aliasing  (tricubic B-spline, L/α decomposition)    ║
// ║  9. Bent normal shadows            (AO cone visibility, SS bent normal,      ║
// ║                                     indirect redirection, cosine spec occ)   ║
// ║  10. SS shadow depth-bias micro detail  (Bend Studio thickness-aware shadow, ║
// ║                                          visibility bitmap, confidence-      ║
// ║                                          adaptive pipeline, hash denoiser,   ║
// ║                                          FFXVI oriented depth bias)          ║
// ║  11. Subsurface raymarching          (PoE2 texture-space volume via TBN)     ║
// ║  12. IS-FAST noise sampling          (importance-sampled spatio-temporal BN) ║
// ║  13. GPU Friendly Laplacian Texture Blending                                 ║
// ║  14. Geometric specular antialiasing  (projected-space NDF filtering)        ║
// ║  15. Distortion-free displacement     (Zirr & Ritschel 2019 UV correction)   ║
// ║  16. Enhanced parallax occlusion mapping (POM refinement, self-shadow,       ║
// ║                                          cone stepping, quadtree, SGF)       ║
// ║  17. Stochastic alpha transparency    (stochastic alpha test, shadow alpha,  ║
// ║                                       improved A2C — uses §1.12 IS-FAST)     ║
// ║  18. Temporal stability               (variance-guided accumulation,         ║
// ║                                       neighborhood clamping, disocclusion,   ║
// ║                                       adaptive blend — extends §1.10/§1.9)   ║
// ╠══════════════════════════════════════════════════════════════════════════════╣
// ║  PART II — CHARACTER IMPROVEMENTS                                            ║
// ║  Eye shading, eyelid shadows, IBL occlusion and other character-specific     ║
// ║  rendering helpers.  Designed for injection into identified eye / skin       ║
// ║  shaders.                                                                    ║
// ╠══════════════════════════════════════════════════════════════════════════════╣
// ║  1. Eye shading            (screenspace eyelid shadows, IBL occlusion,       ║
// ║                             iris parallax, limbal darkening, cornea spec)    ║
// ╠══════════════════════════════════════════════════════════════════════════════╣
// ║  PART III — RASTERISATION BRDF                                               ║
// ║  Physically-based shading models for direct & indirect evaluation in         ║
// ║  rasterisation pipelines.  No importance sampling or PDF required.           ║
// ╠══════════════════════════════════════════════════════════════════════════════╣
// ║  1.  Hammon 2017 diffuse   (GGX+Smith multi-scatter energy-conserving)       ║
// ║  2.  Callisto BRDF         (SIGGRAPH 2023 dual-lobe GGX + diffuse)           ║
// ║  3.  Proxima BRDF          (SIGGRAPH 2023 diffuse antialiasing)              ║
// ║  4.  Hammon+Proxima        (combined energy + distance diffuse)              ║
// ║  5.  Multi-Scatter GGX     (Kulla-Conty specular compensation)               ║
// ║  6.  Material helpers      (IoR, metallic, aniso roughness, Beer-Lambert)    ║
// ║  7.  Anisotropic GGX       (Heitz 2014 NDF + visibility + specular)          ║
// ║  8.  Thin film iridescence (wave-interference Fresnel + geom. series)        ║
// ║  9.  Volumetric helpers    (Henyey-Greenstein phase, RNM blending)           ║
// ║  10. RDX BRDF              (unified raster BRDF — single entry point)        ║
// ║  11. Diffraction on rough surfaces  (spectral shift + speckle noise)         ║
// ╠══════════════════════════════════════════════════════════════════════════════╣
// ║  PART IV — RAY TRACING / PATH TRACING BRDF                                   ║
// ║  Functions that require stochastic ray generation or Monte Carlo             ║
// ║  integration — unusable in standard rasterisation pipelines.                 ║
// ╠══════════════════════════════════════════════════════════════════════════════╣
// ║  1.  VNDF sampling         (importance-sampled microfacet normals)           ║
// ║  2.  VNDF PDF evaluation   (probability density for MC weighting)            ║
// ║  3.  Subsurface scattering (Hanrahan single-scatter transmission)            ║
// ║  4.  RDX BRDF RT           (unified RT BRDF — single entry point)            ║
// ║  5.  EON diffuse BRDF      (energy-preserving Oren–Nayar + CLTC sampling)   ║
// ╚══════════════════════════════════════════════════════════════════════════════╝
//
// Rasterisation BRDF sections 6-8 and all of Part IV ported from
// NVIDIA RTX Remix (MIT license), adapted to fp32 HLSL.
//
// Usage:  #include "rendering.hlsl"

#ifndef SRC_SHADERS_RENDERING_HLSL_
#define SRC_SHADERS_RENDERING_HLSL_

#include "./color.hlsl"
#include "./math.hlsl"

namespace renodx {
namespace rendering {

// ############################################################################
//
//   PART I — GENERAL RENDERING
//
// ############################################################################

// ============================================================================
// 1.1  Cubemap / Probe Modulation
// ----------------------------------------------------------------------------
// Attenuates IBL (cubemap / reflection-probe) contributions
//
//   a) Sky-light luminance — when the diffuse probe reports very little
//      incoming light the cubemap reflection should dim accordingly,
//      preventing over-bright reflections in dark environments.
//
//   b) Roughness — rough surfaces scatter reflected light over a wider
//      solid angle, so the specular cubemap lobe carries less perceptual
//      energy and the darkening floor can be relaxed.
//
//   c) Ambient-Occlusion — occluded surfaces receive less indirect light;
//      the modulation scales down to avoid light-leaking in corners/crevices.
//
// Usage:
//   float3 cubemapColor = ...;  // sampled cubemap / probe result
//   cubemapColor *= renodx::rendering::CubemapModulation(skyLight, roughness, ao);
//
// Parameters:
//   skyLight       – diffuse probe / sky irradiance sample (linear RGB)
//   roughness      – perceptual roughness [0,1]
//   aoFactor       – ambient occlusion [0 = fully occluded, 1 = unoccluded]
//   lumThreshold   – smoothstep upper edge for the luminance gate (default 0.25)
//   minIntensity   – floor multiplier when modulation is at its darkest (default 0.3)
//   roughnessRange – {min, max} multiplier range for roughness term (default {0.5, 1.0})
//   aoRange        – {min, max} multiplier range for AO term       (default {0.4, 1.0})
//
// Returns:  scalar modulation factor to multiply into the cubemap color.
// ============================================================================

float CubemapModulation(
    float3 skyLight,
    float  roughness,
    float  aoFactor,
    float  lumThreshold   = 0.25,
    float  minIntensity   = 0.3,
    float2 roughnessRange = float2(0.5, 1.0),
    float2 aoRange        = float2(0.4, 1.0))
{
  // BT.709 luminance of the incoming sky / probe light.
  float skyLum = max(0.0, dot(skyLight, float3(0.2126, 0.7152, 0.0722)));

  // Compose the three modulation factors.
  float mod = smoothstep(0.0, lumThreshold, skyLum)
            * lerp(roughnessRange.x, roughnessRange.y, saturate(roughness))
            * lerp(aoRange.x,        aoRange.y,        saturate(aoFactor));

  return lerp(minIntensity, 1.0, mod);
}

// ============================================================================
// 1.2  Better Cubemap / Probe Sampling
// ----------------------------------------------------------------------------
// Improves how existing cubemaps and reflection probes are sampled.
//
//   a) Parallax correction (box) — adjusts the reflection vector to account
//      for the probe not being at the surface position.  Without this,
//      cubemap reflections slide incorrectly as the camera moves.
//
//   b) Parallax correction (sphere) — same concept as (a) but using a
//      spherical proxy volume, better suited for rounded environments.
//
//   c) Roughness-aware mip selection — replaces incorrect or simplistic
//      roughness-to-mip mappings with one that matches GGX pre-filtered
//      convolution, producing correct blurry reflections.
//
//   d) Split-sum environment BRDF — many older engines sample the cubemap
//      without the DFG energy conservation term (Karis 2013).  Applying
//      EnvBRDFApprox ensures Fresnel and energy conservation are correct.
//
//   e) Dominant direction correction — for anisotropic or high-roughness
//      surfaces the reflection vector should be bent toward the normal.
//      This produces tighter, more physically correct probe lookups.
//
// Typical usage (inject into a game's probe sampling shader):
//
//   float3 R = reflect(-V, N);
//   R = renodx::rendering::ParallaxCorrectBox(R, worldPos, probePos, boxMin, boxMax);
//   // or: R = renodx::rendering::ParallaxCorrectSphere(R, worldPos, probePos, radius);
//   R = renodx::rendering::DominantDirectionCorrection(R, N, roughness);
//   float  mip = renodx::rendering::ProbeMipFromRoughness(roughness, mipCount);
//   float3 prefilteredColor = probeCubemap.SampleLevel(sampler, R, mip).rgb;
//   float2 dfg = renodx::rendering::EnvBRDFApprox(NdotV, roughness);
//   float3 specularIBL = prefilteredColor * (F0 * dfg.x + dfg.y);
// ============================================================================

// ---------------------------------------------------------------------------
// 1.2a  Parallax Correction — Box Proxy
// ---------------------------------------------------------------------------
// Corrects the reflection vector for a box-shaped influence volume.
//
// When a reflection probe is placed at `probePos` but the shaded surface
// is elsewhere, a naive cubemap lookup uses the wrong direction.  This
// function ray-intersects the proxy box and redirects the lookup vector
// to the correct point on the box boundary as seen from the surface.
//
// Parameters:
//   R         – reflection vector (normalize(reflect(-V, N)))
//   worldPos  – world-space position of the shaded fragment
//   probePos  – world-space position of the probe capture point
//   boxMin    – world-space minimum corner of the box influence volume
//   boxMax    – world-space maximum corner of the box influence volume
//
// Returns:  corrected reflection direction (normalized) for cubemap lookup.
// ---------------------------------------------------------------------------
float3 ParallaxCorrectBox(
    float3 R,
    float3 worldPos,
    float3 probePos,
    float3 boxMin,
    float3 boxMax)
{
  // Ray-box intersection: find the distance to the furthest entry plane
  // along each axis.  We want the nearest of those three (first exit from
  // the box), which gives us the point on the box boundary.
  float3 firstPlaneIntersect  = (boxMax - worldPos) / R;
  float3 secondPlaneIntersect = (boxMin - worldPos) / R;

  // For each axis, pick whichever plane is further away (exit side).
  float3 furthestPlane = max(firstPlaneIntersect, secondPlaneIntersect);

  // The actual intersection is the nearest of the three exit distances.
  float dist = min(min(furthestPlane.x, furthestPlane.y), furthestPlane.z);

  // Intersection point on the box, then redirect from probe center.
  float3 intersectPos = worldPos + R * dist;
  return normalize(intersectPos - probePos);
}

// ---------------------------------------------------------------------------
// 1.2b  Parallax Correction — Sphere Proxy
// ---------------------------------------------------------------------------
// Same concept as the box variant but using a spherical influence volume.
// Better suited for rounded rooms, hallways, or outdoor environments
// where a box proxy would introduce hard edges.
//
// Parameters:
//   R         – reflection vector
//   worldPos  – world-space fragment position
//   probePos  – world-space probe capture position (sphere center)
//   radius    – radius of the spherical influence volume
//
// Returns:  corrected reflection direction (normalized) for cubemap lookup.
// ---------------------------------------------------------------------------
float3 ParallaxCorrectSphere(
    float3 R,
    float3 worldPos,
    float3 probePos,
    float  radius)
{
  // Ray-sphere intersection from the fragment toward the reflection dir.
  // Solve:  |worldPos + t*R - probePos|² = radius²
  //   t² + 2t·dot(oc,R) + dot(oc,oc) - r² = 0
  float3 oc = worldPos - probePos;
  float  b  = dot(oc, R);
  float  c  = dot(oc, oc) - radius * radius;
  float  discriminant = b * b - c;

  // If the fragment is outside the sphere / no hit, fall back to uncorrected.
  if (discriminant < 0.0)
    return R;

  float t = -b + sqrt(discriminant);   // furthest intersection (exit)
  float3 intersectPos = worldPos + R * max(t, 0.0);
  return normalize(intersectPos - probePos);
}

// ---------------------------------------------------------------------------
// 1.2c  Roughness-Aware Mip Selection
// ---------------------------------------------------------------------------
// Maps perceptual roughness to a cubemap mip level that matches GGX
// pre-filtered convolution.  Many older engines use a linear or ad-hoc
// mapping that produces incorrect blur at mid-roughness values.
//
// The mapping  mip = perceptualRoughness * (mipCount - 1)  is the standard
// used by UE4/5 and matches a GGX-convolved cubemap where each mip level
// corresponds to a linearly-spaced perceptual roughness slice.
//
// Parameters:
//   perceptualRoughness – [0,1] perceptual roughness (NOT alpha = r²)
//   mipCount            – total number of mip levels in the cubemap
//
// Returns:  mip level [0, mipCount-1] suitable for SampleLevel().
// ---------------------------------------------------------------------------
float ProbeMipFromRoughness(float perceptualRoughness, float mipCount)
{
  // Linear mapping matches GGX pre-filtered convolution mip layout.
  return perceptualRoughness * (mipCount - 1.0);
}

// ---------------------------------------------------------------------------
// 1.2d  Split-Sum Environment BRDF Approximation (Karis 2013)
// ---------------------------------------------------------------------------
// Analytical approximation of the DFG lookup table used in the split-sum
// IBL method.  This replaces the need for a pre-computed 2D LUT texture.
//
// The split-sum approach factors the rendering equation integral into:
//   ∫ Li·f·cosθ dω  ≈  PrefilteredEnvMap(R, mip) · (F0·dfg.x + dfg.y)
//
// Without this term, cubemap reflections are too bright at grazing angles
// (missing Fresnel darkening) and don't conserve energy across roughness.
//
// Parameters:
//   NdotV     – saturate(dot(N, V))  [0,1]
//   roughness – perceptual roughness [0,1]
//
// Returns:  float2(scale, bias) — apply as: specular = envColor * (F0 * x + y)
// ---------------------------------------------------------------------------
float2 EnvBRDFApprox(float NdotV, float roughness)
{
  // Karis 2013 — "Real Shading in Unreal Engine 4", SIGGRAPH 2013 course.
  // Polynomial fit to the DFG integral for GGX + Smith + Schlick Fresnel.
  const float4 c0 = float4(-1.0, -0.0275, -0.572,  0.022);
  const float4 c1 = float4( 1.0,  0.0425,  1.04,  -0.04);
  float4 r = roughness * c0 + c1;
  float a004 = min(r.x * r.x, exp2(-9.28 * NdotV)) * r.x + r.y;
  return float2(-1.04, 1.04) * a004 + r.zw;
}

// ---------------------------------------------------------------------------
// 1.2e  Dominant Direction Correction
// ---------------------------------------------------------------------------
// For rough surfaces, the specular lobe is wide and centered closer to the
// surface normal than the mirror reflection direction.  Bending the lookup
// vector toward N produces tighter, more physically plausible probe
// reflections — especially noticeable at high roughness values where a
// pure mirror reflection direction would sample the wrong part of the
// cubemap entirely.
//
// Based on Lagarde & de Rousiers, "Moving Frostbite to PBR" (2014),
// adopted by UE4/5 and Filament.
//
// Parameters:
//   R         – mirror reflection vector (normalize(reflect(-V, N)))
//   N         – surface normal
//   roughness – perceptual roughness [0,1]
//
// Returns:  bent reflection direction (normalized) for cubemap lookup.
// ---------------------------------------------------------------------------
float3 DominantDirectionCorrection(float3 R, float3 N, float roughness)
{
  // Smoothness-based blend: fully smooth → pure mirror, fully rough → normal.
  float smoothness = saturate(1.0 - roughness);
  // Frostbite/Filament dominant direction factor.
  float lerpFactor = smoothness * (sqrt(smoothness) + roughness);
  return normalize(lerp(N, R, lerpFactor));
}

// ---------------------------------------------------------------------------
// 1.2f  Full Probe Sampling Helper
// ---------------------------------------------------------------------------
// Convenience function that composes all of the above into a single call.
// Takes a raw probe sample and applies energy conservation (split-sum DFG)
// to produce a correctly weighted specular IBL contribution.
//
// This does NOT include parallax correction or mip selection — those must
// be applied before sampling the cubemap.  This function operates on the
// *result* of the cubemap sample.
//
// Parameters:
//   prefilteredColor – cubemap sample (already roughness-filtered via mip)
//   F0               – reflectance at normal incidence
//   NdotV            – saturate(dot(N, V))
//   roughness        – perceptual roughness [0,1]
//
// Returns:  energy-conserved specular IBL contribution (linear RGB).
// ---------------------------------------------------------------------------
float3 ApplyEnvBRDF(
    float3 prefilteredColor,
    float3 F0,
    float  NdotV,
    float  roughness)
{
  float2 dfg = EnvBRDFApprox(NdotV, roughness);
  return prefilteredColor * (F0 * dfg.x + dfg.y);
}

// ============================================================================
// 1.3  Bloom Black-Floor Preservation
// ----------------------------------------------------------------------------
// Scales bloom contribution based on the scene luminosity at each pixel so
// that bloom energy is suppressed in regions that should stay dark
//
// The core idea:
//   1. Compute a "mid-gray bloomed" factor: how much the bloom itself
//      shifts the perceptual mid-gray anchor (0.18).  This makes the
//      gate self-relative — brighter bloom loosens the gate.
//   2. Multiply scene luminosity by that factor to get an adjusted
//      brightness metric.
//   3. Use smoothstep(0, midGray, adjusted) to produce a blend weight
//      that is 0 in true darks and 1 once the scene is mid-gray or above.
//   4. Lerp bloom toward zero by that weight, then blend the result
//      against the original bloom by `strength`.
//
// Uses BT.709 weighted luminance for the brightness metric, providing
// perceptually correct bloom suppression that matches human sensitivity
// to different wavelengths.
//
// Usage:
//   bloom_color = renodx::rendering::BloomScaling(
//       bloom_color, sceneColor, strength);
//   output = sceneColor + bloom_color;   // additive composite
//
// Parameters:
//   bloomColor   – bloom buffer value (linear RGB, already intensity-scaled)
//   sceneColor   – scene color at the same pixel (linear RGB, before bloom)
//   strength     – overall scaling strength [0 = disabled, 1 = full]
//                  (default 0.5)
//   midGray      – perceptual mid-gray anchor; controls the luminosity
//                  threshold below which bloom is suppressed (default 0.18)
//
// Returns:  adjusted bloom color, same space as input.
// ============================================================================

float3 BloomScaling(
    float3 bloomColor,
    float3 sceneColor,
    float  strength = 0.5,
    float  midGray  = 0.18)
{
  // BT.709 luminance coefficients.
  static const float3 kLumCoeff = float3(0.2126, 0.7152, 0.0722);

  // Bloom luminance drives the self-relative gate.
  float bloomLum       = dot(bloomColor, kLumCoeff);
  float midGrayBloomed = (midGray + bloomLum) / midGray;

  // Scene luminance rescaled by the bloomed anchor.
  float sceneLum  = dot(sceneColor, kLumCoeff) * midGrayBloomed;

  // Blend weight: 0 in darks, 1 at/above mid-gray.
  float blend     = saturate(smoothstep(0.0, midGray, sceneLum));

  // Suppress bloom in dark regions, then mix by strength.
  float3 scaled   = bloomColor * blend;
  return lerp(bloomColor, scaled, strength);
}

// ============================================================================
// 1.4  Fog Color Correction  (OKLab Hue / Chrominance / Lightness Restoration)
// ----------------------------------------------------------------------------
// From Pumbo
//
// Two functions are provided:
//
//   RestoreHueAndChrominance  – general purpose: blend an target colour's
//       hue, chrominance and/or lightness toward a source colour in OKLab.
//
//   FogColorCorrection  – convenience wrapper that composites scene + fade,
//       then restores the fog's hue/chroma/lightness to avoid colour shifts.
// ============================================================================

// ---------------------------------------------------------------------------
// RestoreHueAndChrominance
// ---------------------------------------------------------------------------
// Blends `targetColor` toward `sourceColor` in OKLab to restore hue,
// chrominance, and/or lightness that may have been lost by tone-mapping or
// colour grading.
//
// Parameters:
//   targetColor        – the colour to correct (linear BT.709)
//   sourceColor        – the reference colour whose appearance we want to
//                        preserve (linear BT.709)
//   hueStrength        – [0,1] how much hue is restored (default 0.75)
//   chrominanceStrength– [0,1] how much chrominance is restored (default 1.0)
//   minChromaChange    – minimum chrominance scale allowed (default 0.0)
//   maxChromaChange    – maximum chrominance scale allowed (default FLT_MAX)
//   lightnessStrength  – [0,1] how much OKLab L is restored (default 0.0)
//
// Returns:  corrected colour in linear BT.709.
// ---------------------------------------------------------------------------
float3 RestoreHueAndChrominance(
    float3 targetColor,
    float3 sourceColor,
    float  hueStrength         = 0.75,
    float  chrominanceStrength = 1.0,
    float  minChromaChange     = 0.0,
    float  maxChromaChange     = 3.402823466e+38,  // FLT_MAX
    float  lightnessStrength   = 0.0)
{
  // Early-outs.
  if (hueStrength == 0.0 && chrominanceStrength == 0.0 && lightnessStrength == 0.0)
    return targetColor;

  // Black / invalid colours break OKLab conversions.
  if (::renodx::color::y::from::BT709(targetColor) <= 1.175494351e-38)  // FLT_MIN
    return targetColor;

  float3 srcLab = ::renodx::color::oklab::from::BT709(sourceColor);
  float3 tgtLab = ::renodx::color::oklab::from::BT709(targetColor);

  // ---- Lightness -----------------------------------------------------------
  tgtLab.x = lerp(tgtLab.x, srcLab.x, lightnessStrength);

  float currentChroma = length(tgtLab.yz);

  // ---- Hue -----------------------------------------------------------------
  // Blend a,b (which encode both hue *and* chrominance), then rescale back
  // to the original chrominance so only the hue component is affected.
  if (hueStrength != 0.0)
  {
    tgtLab.yz = lerp(tgtLab.yz, srcLab.yz, hueStrength);
    float chromaPost = length(tgtLab.yz);
    float chromaRatio = ::renodx::math::DivideSafe(currentChroma, chromaPost, 1.0);
    tgtLab.yz *= chromaRatio;
    // currentChroma is unchanged by definition.
  }

  // ---- Chrominance ---------------------------------------------------------
  if (chrominanceStrength != 0.0)
  {
    float srcChroma = length(srcLab.yz);
    float chromaRatio = ::renodx::math::DivideSafe(srcChroma, currentChroma, 1.0);
    chromaRatio = clamp(chromaRatio, minChromaChange, maxChromaChange);
    tgtLab.yz *= lerp(1.0, chromaRatio, chrominanceStrength);
  }

  return ::renodx::color::bt709::from::OkLab(tgtLab);
}

// ---------------------------------------------------------------------------
// FogColorCorrection
// ---------------------------------------------------------------------------
// Composites scene + fog/fade, then restores the fog's hue and chrominance
// in OKLab so that HDR-extended fog blends don't shift colour.
//
// Parameters:
//   sceneColor  – the scene colour before fog (linear BT.709)
//   fadeColor   – the additive fog / colour-fade value (linear BT.709)
//   hue         – hue restoration strength   (default 0.8)
//   chrominance – chroma restoration strength (default 1.0)
//   avgBrightness  – lightness restoration scale from scene  (default 1.0)
//   minBrightness  – lightness restoration floor              (default 0.0)
//   intensity      – overall blend toward corrected result    (default 1.0)
//
// Returns:  scene + fog with hue/chroma preserved, linear BT.709.
// ---------------------------------------------------------------------------
float3 FogColorCorrection(
    float3 sceneColor,
    float3 fadeColor,
    float  hue            = 0.8,
    float  chrominance    = 1.0,
    float  avgBrightness  = 1.0,
    float  minBrightness  = 0.0,
    float  intensity      = 1.0)
{
  float3 sceneWithFog     = sceneColor + fadeColor;
  float3 prevSceneWithFog = sceneWithFog;

  // Normalize fade to extract its chrominance independent of magnitude.
  float fadeMax = max(abs(fadeColor.x), max(abs(fadeColor.y), abs(fadeColor.z)));
  float3 normFade = (fadeMax != 0.0) ? (fadeColor / fadeMax) : fadeColor;
  float3 fadeLab  = ::renodx::color::oklab::from::BT709(normFade);

  float3 sceneLab = ::renodx::color::oklab::from::BT709(sceneColor);

  // Scale hue restoration by the fog's own chrominance — grey fog has
  // no meaningful hue to restore, so skip the shift.
  float fogChroma  = length(fadeLab.yz);
  float fogHue     = hue * saturate(fogChroma / 1.41421356);  // sqrt(2)

  // Lightness: restore an optional minimum + proportional amount.
  float fogBright  = saturate(avgBrightness * sceneLab.x + minBrightness);

  sceneWithFog = RestoreHueAndChrominance(
      sceneColor, sceneWithFog,
      fogHue, chrominance, 0.0, 3.402823466e+38, fogBright);

  return lerp(prevSceneWithFog, sceneWithFog, intensity);
}

// ============================================================================
// 1.5  Grass Rendering Improvements
// ----------------------------------------------------------------------------
// Inspired by Sucker Punch Productions' GDC 2021 talk:
// "Procedural Grass in Ghost of Tsushima" (Emily Graslie & Adrian Bentley)
//
// Five vertex/pixel shader techniques that improve grass appearance and
// reduce aliasing WITHOUT requiring additional geometry, higher density,
// or engine-level changes.  All operate on existing draw calls and can be
// injected by replacing the identified grass VS/PS via RenoDX.
//
//   a) Rounded blade normals       (VS)    — fake cylindrical cross-section
//   b) View-space width thickening (VS)    — fatten edge-on blades
//   c) Distance normal flattening  (VS/PS) — reduce shading aliasing at distance
//   d) Distance roughness increase (PS)    — widen specular lobe at distance
//   e) Per-blade ambient occlusion (PS)    — vertical AO gradient, replaces SSAO
//
// Applicability — procedural vs. billboard grass:
//
//   These techniques were designed for procedural 3D grass blades but most
//   also work on simpler billboard / cross-quad grass commonly found in
//   older or less demanding titles.  Applicability per technique:
//
//   (a) Rounded normals     — YES.  Billboards still output a normal in the
//       PS.  Tilting it based on UV.x (left→right across the quad) fakes
//       curvature cheaply.  Use UV.x remapped to [-1,1] as the facing
//       direction surrogate.
//
//   (b) View-space thicken  — PARTIALLY.  Billboards are already camera-
//       oriented so the edge-on problem is less severe.  Cross-quads (two
//       intersecting planes) DO go edge-on for one quad when viewed from
//       certain angles — thickening helps there.  Requires knowing the
//       width axis, which is usually the billboard’s local X.
//
//   (c) Normal flattening   — YES.  Works identically — blend the per-pixel
//       normal toward a common up/terrain normal over distance.
//
//   (d) Roughness increase  — YES.  Works identically — purely a PS
//       roughness adjustment based on distance.
//
//   (e) Per-blade AO        — YES.  Billboard grass almost always has a V
//       coordinate that runs 0ₒ1 from root to tip.  Use UV.y directly as
//       the bladeHeight parameter.  This is the single biggest visual win
//       on flat billboard grass because it breaks the uniform flat-lit look.
//
// Prerequisites
//
//   VERTEX SHADER INPUTS:
//     • worldPos     — vertex world-space position
//     • vertexNormal — per-vertex normal
//     • facingDir    — blade width direction (orthogonal to blade up and
//                      forward tangent).  May be encoded in UV2, COLOR,
//                      or a custom vertex attribute.  Inspect the VS input
//                      layout and constant buffers.
//                      For billboards: often the local X axis of the quad.
//     • widthOffset  — signed distance from blade center along facingDir
//                      (−0.5 … +0.5 or −1 … +1).  Often packed into a
//                      vertex color channel or secondary UV.
//                      For billboards: (UV.x - 0.5) works as a surrogate.
//
//   PIXEL SHADER INPUTS:
//     • bladeHeight  — [0,1] position along the blade from root to tip.
//                      For procedural grass: interpolated from VS output.
//                      For billboards: UV.y (almost universally available).
//     • roughness / gloss — the game's roughness (or gloss/smoothness)
//                      output in the G-Buffer or forward shading path.
//                      Inspect the PS output SV_Target bindings.
//
//   CBUFFER DATA:
//     • cameraPos    — world-space camera position (almost always available
//                      in a per-frame CB; inspect slots b0–b3).
//     • commonNormal — a shared "up" or terrain normal for all grass in the
//                      draw call.  If unavailable, float3(0,1,0) is a safe
//                      default for flat terrain.
//
// How to use:
//   1. Capture a frame, identify the grass draw call(s) by their vertex
//      topology, texture bindings, and visual inspection.
//   2. Note the VS and PS shader hashes.
//   3. In your RenoDX addon, replace those shaders with modified versions
//      that call the functions below.
//   4. Tune the parameters per game — defaults are a reasonable starting
//      point based on the GoT talk but every game's scale/units differ.
// ============================================================================
//
// ---------------------------------------------------------------------------
// 1.5a  Rounded Blade Normals (Vertex Shader)
// ---------------------------------------------------------------------------
// Ghost of Tsushima, GDC 2021:
//   "We tilted the normals of the grass blades outwards a bit to help give
//    grass a more natural look without the need to increase verts."
//
// Grass blades are usually flat quads with a single face normal.  This makes
// lighting look flat and uniform across the blade.  By tilting the normal
// outward along the blade's width direction, we simulate a rounded
// cross-section — light wraps around the blade as if it were cylindrical.
//
// This is purely a normal adjustment — no vertex positions change, no extra
// geometry is needed.  The cost is effectively zero.
//
// REQUIREMENTS:
//   • vertexNormal — the blade's current normal (world or object space)
//   • facingDir    — the blade's width direction (perpendicular to the
//                    blade's length axis and its forward tangent)
//
// Parameters:
//   vertexNormal – current vertex normal (will be normalized internally)
//   facingDir    – blade width direction at this vertex (normalized)
//   tiltAmount   – [0,1] blend toward the facing direction (default 0.4)
//                  0.0 = no change, 1.0 = normal is fully along facingDir
//                  GoT used values in the 0.3–0.5 range.
//
// Returns:  adjusted normal (normalized), same space as inputs.
// ---------------------------------------------------------------------------
float3 GrassRoundedNormal(
    float3 vertexNormal,
    float3 facingDir,
    float  tiltAmount = 0.4)
{
  // Blend the normal toward the width direction to fake a rounded profile.
  // At tiltAmount = 0 this is a no-op; at 1.0 the normal is fully sideways.
  return normalize(lerp(vertexNormal, facingDir, tiltAmount));
}

// ---------------------------------------------------------------------------
// 1.5b  View-Space Width Thickening (Vertex Shader)
// ---------------------------------------------------------------------------
// Ghost of Tsushima, GDC 2021:
//   "To make grass thicker without needing to increase the quantity or
//    density [...] we slightly shifted the grass blade's verts in view
//    space when the blade's normal is orthogonal to the view vector."
//
// When a grass blade is viewed edge-on, it becomes vanishingly thin and
// may even disappear — especially at distance.  This function detects
// that configuration and pushes the vertices apart along the blade's
// width direction, fattening the blade from the camera's perspective.
//
// Only the vertex *position* is modified — topology and triangle count
// remain unchanged.  The expansion is view-dependent so it has no effect
// when the blade already faces the camera.
//
// REQUIREMENTS:
//   • worldPos    — vertex world position
//   • widthDir    — blade width direction in world space (normalized)
//   • widthOffset — signed distance of this vertex from the blade center
//                   along widthDir (e.g. −0.5 for left edge, +0.5 for right)
//   • cameraPos   — world-space camera position (from a constant buffer)
//
// Parameters:
//   worldPos     – vertex world position (modified in place by caller)
//   widthDir     – blade width direction (normalized, world space)
//   widthOffset  – signed offset from blade center along widthDir
//   cameraPos    – camera world position
//   thickenScale – maximum width multiplier when fully edge-on (default 1.8)
//                  1.0 = no change, 2.0 = double width at full edge-on.
//                  GoT used values around 1.5–2.0.
//
// Returns:  adjusted world position with the thickening applied.
// ---------------------------------------------------------------------------
float3 GrassViewThicken(
    float3 worldPos,
    float3 widthDir,
    float  widthOffset,
    float3 cameraPos,
    float  thickenScale = 1.8)
{
  // View direction from fragment to camera.
  float3 viewDir = normalize(cameraPos - worldPos);

  // How edge-on is this blade?  When widthDir is perpendicular to the
  // view, dot product → 0, so edgeFactor → 1.  When facing the camera,
  // dot → ±1, edgeFactor → 0.
  float edgeFactor = 1.0 - abs(dot(widthDir, viewDir));

  // Scale the width offset:  at edgeFactor = 0 (facing), no change;
  // at edgeFactor = 1 (edge-on), expand by thickenScale.
  float expandedOffset = widthOffset * lerp(1.0, thickenScale, edgeFactor);

  // Apply the position shift along the blade's width axis.
  return worldPos + widthDir * (expandedOffset - widthOffset);
}

// ---------------------------------------------------------------------------
// 1.5c  Distance-Based Normal Flattening (Vertex or Pixel Shader)
// ---------------------------------------------------------------------------
// Ghost of Tsushima, GDC 2021:
//   "As the distance of the camera increased they started to lerp the
//    outputted normal towards a common normal for the grass."
//
// At distance, individual grass blade normals create high-frequency shading
// variation that aliases badly — especially with specular highlights.
// By blending each blade's normal toward a shared "common" direction
// (typically terrain up or a per-patch average), the shading becomes
// smoother and aliasing is drastically reduced.
//
// This can be applied in either the vertex shader (cheaper, per-vertex) or
// the pixel shader (smoother transitions, per-pixel distance).
//
// REQUIREMENTS:
//   • bladeNormal  — the individual blade's shading normal
//   • commonNormal — a shared direction for the grass patch.  Options:
//                    ◦ float3(0, 1, 0) — simple world up, works well for
//                      flat terrain.
//                    ◦ Terrain normal from a heightmap sample — better for
//                      slopes.  Requires the terrain normal to be passed
//                      via a vertex attribute or constant buffer.
//   • dist         — distance from the camera to the vertex/pixel.
//                    Compute as length(cameraPos - worldPos).
//
// Parameters:
//   bladeNormal  – individual grass blade normal (normalized)
//   commonNormal – shared patch / terrain normal (normalized)
//   dist         – distance from camera to this vertex/pixel
//   fadeStart    – distance at which flattening begins (default 20.0)
//   fadeEnd      – distance at which flattening is complete (default 80.0)
//                  These are in world units — scale them to match the
//                  game's coordinate system.  Inspect draw distances in
//                  RenderDoc to find good values.
//
// Returns:  blended normal (normalized).
// ---------------------------------------------------------------------------
float3 GrassNormalFlatten(
    float3 bladeNormal,
    float3 commonNormal,
    float  dist,
    float  fadeStart = 20.0,
    float  fadeEnd   = 80.0)
{
  // Linear blend ramp: 0 at fadeStart, 1 at fadeEnd.
  float flattenFactor = saturate((dist - fadeStart) / (fadeEnd - fadeStart));

  // Lerp from the individual blade normal toward the common direction.
  return normalize(lerp(bladeNormal, commonNormal, flattenFactor));
}

// ---------------------------------------------------------------------------
// 1.5d  Distance-Based Gloss / Roughness Reduction (Pixel Shader)
// ---------------------------------------------------------------------------
// Ghost of Tsushima, GDC 2021:
//   "They also reduced gloss in the pixel shader over distance.  This is
//    reasonable if you think of gloss as a representation of how the
//    surface normals vary at subpixel detail — since the normal variance
//    is increasing, we reduce gloss."
//
// As grass recedes into the distance, normal map detail is lost to
// mipmapping and the per-blade normal flattening above introduces
// a larger spread of micro-normals within each pixel footprint.
// This increased subpixel normal variance is physically equivalent to
// a rougher surface — if we don't adjust roughness accordingly, specular
// highlights alias into bright flickering dots.
//
// This function increases roughness (or equivalently decreases gloss)
// over distance, which widens the specular lobe to match the actual
// subpixel normal variance.  The result is smooth, stable specular on
// distant grass — especially noticeable in rainy/wet conditions where
// grass gloss is high.
//
// REQUIREMENTS:
//   • roughness — the current roughness value from the material / G-Buffer.
//                 If the game uses gloss/smoothness instead, convert:
//                   roughness = 1.0 - gloss
//                 Apply this function, then convert back:
//                   gloss = 1.0 - adjustedRoughness
//   • dist      — distance from camera (same as for normal flattening).
//
// Parameters:
//   roughness          – current perceptual roughness [0,1]
//   dist               – distance from camera to this pixel
//   fadeStart          – distance at which roughness starts increasing
//                        (default 20.0, should match normal flattening)
//   fadeEnd            – distance at which roughness reaches its max
//                        (default 80.0, should match normal flattening)
//   maxDistRoughness   – roughness floor at full distance (default 0.9)
//                        Grass at distance will never be shinier than this.
//
// Returns:  adjusted roughness [0,1], guaranteed ≥ input roughness.
// ---------------------------------------------------------------------------
float GrassDistanceRoughness(
    float roughness,
    float dist,
    float fadeStart        = 20.0,
    float fadeEnd          = 80.0,
    float maxDistRoughness = 0.9)
{
  // Same ramp as normal flattening — ideally these share parameters.
  float distanceFade = saturate((dist - fadeStart) / (fadeEnd - fadeStart));

  // Only ever increase roughness — never make distant grass shinier.
  float targetRoughness = max(roughness, maxDistRoughness);

  return lerp(roughness, targetRoughness, distanceFade);
}

// ---------------------------------------------------------------------------
// 1.5e  Per-Blade Ambient Occlusion (Pixel Shader)
// ---------------------------------------------------------------------------
// Ghost of Tsushima, GDC 2021:
//   They applied a simple ambient occlusion constant that makes the grass
//   darker at the base compared to the tip, because screen-space AO
//   (GTAO, HBAO+, SSAO) produces noisy, flickering results on dense grass:
//     • Grass blades constantly occlude each other in the depth buffer
//     • Wind sway causes frame-to-frame depth discontinuities
//     • Temporal filtering can't keep up with the motion
//
// Instead, AO is baked as a vertical gradient per blade: dark at the base
// (where the blade meets the ground and neighboring blades block light),
// bright at the tip (exposed to the sky hemisphere).
//
// REQUIREMENTS:
//   • bladeHeight — a [0,1] parameter encoding position along the blade:
//                   0.0 = root (ground level), 1.0 = tip.
//
//     This is almost always already present in the vertex data because
//     games need it for:
//       ◦ Wind animation falloff (base doesn't move, tip sways most)
//       ◦ Width tapering (blade narrows toward tip)
//       ◦ UV mapping (texture along blade length)
//
//     Common locations to look for in a RenderDoc capture:
//       ◦ TEXCOORD1.y or TEXCOORD0.y
//       ◦ COLOR0.g or COLOR0.r (vertex color channel)
//       ◦ Derived from vertex position Y relative to blade root
//       ◦ An explicit VS output interpolant passed to the PS
//
//     For billboard / cross-quad grass:  UV.y is almost universally the
//     blade height parameter — 0 at the ground edge, 1 at the top edge.
//     This makes billboard grass the easiest target for this technique.
//
//   • The grass pixel shader must be identified and replaced via RenoDX
//     to apply the AO modulation to the final diffuse/albedo output.
//
// Three variants are provided in increasing sophistication:
//   (i)   Basic     — linear gradient, matches GoT's simple approach
//   (ii)  Improved  — power curve + color tint for more natural falloff
//   (iii) Density   — modulates AO strength by grass density
// ---------------------------------------------------------------------------

// -- 1.5e-i.  Basic Grass AO (linear gradient) --------------------------------
//
// The simplest form: linear interpolation from a dark base to full brightness
// at the tip.  This is essentially what GoT used — a constant AO value that
// makes the base darker.
//
// Parameters:
//   bladeHeight – [0,1] position along blade (0 = root, 1 = tip)
//   aoBase      – AO multiplier at the root (default 0.3)
//                 0.0 = fully black at base, 1.0 = no darkening.
//                 GoT used values around 0.2–0.4.
//
// Returns:  scalar AO factor [aoBase, 1.0] to multiply into diffuse color.
//
// Usage:
//   float ao = renodx::rendering::GrassAO(bladeHeight, 0.3);
//   diffuseColor *= ao;
//
float GrassAO(float bladeHeight, float aoBase = 0.3)
{
  // Linear ramp from aoBase at root to 1.0 at tip.
  return lerp(aoBase, 1.0, saturate(bladeHeight));
}

// -- 1.5e-ii.  Improved Grass AO (curved gradient + tint) ---------------------
//
// Improvements over the basic linear version:
//
//   1. Power curve — a linear gradient looks uniform and artificial.
//      Real grass has a rapid transition near the ground (dense
//      neighboring blades block most light in the bottom 20%) then
//      opens up quickly.  A power curve (exponent < 1) concentrates
//      the darkening near the base, creating a more natural falloff.
//
//   2. AO color tint — real grass AO isn't neutral gray.  Light that
//      reaches the base has bounced through neighboring blades and the
//      soil, picking up a warm/earthy color shift.  A subtle green or
//      brown tint in the AO shadow improves realism.
//
//   3. Tip brightening — optionally push tip AO slightly above 1.0
//      to simulate the tip catching more sky light than the mid-blade.
//      Subtle values (1.02–1.05) add a nice rim-light effect.
//
// Parameters:
//   bladeHeight – [0,1] position along blade (0 = root, 1 = tip)
//   aoBase      – AO multiplier at the root (default 0.25)
//   aoTip       – AO multiplier at the tip (default 1.0)
//                 Values > 1.0 brighten the tip slightly.
//   curve       – power curve exponent (default 0.5)
//                 < 1.0 = darkening concentrated at base (recommended)
//                 1.0   = linear (same as basic version)
//                 > 1.0 = darkening extends further up the blade
//   aoTint      – color tint applied at the base (default warm green)
//                 Only visible where AO is active; fades to white at tip.
//
// Returns:  float3 AO color factor to multiply into diffuse color.
//
// Usage:
//   float3 ao = renodx::rendering::GrassAOImproved(bladeHeight, 0.25, 1.0, 0.5);
//   diffuseColor.rgb *= ao;
//
float3 GrassAOImproved(
    float  bladeHeight,
    float  aoBase = 0.25,
    float  aoTip  = 1.0,
    float  curve  = 0.5,
    float3 aoTint = float3(0.85, 0.95, 0.75))
{
  // Power curve: concentrates darkening near the base.
  // pow(0, exp) = 0, pow(1, exp) = 1, so the [0,1] range is preserved.
  float t = pow(saturate(bladeHeight), curve);

  // Scalar AO intensity along the blade.
  float aoScalar = lerp(aoBase, aoTip, t);

  // Tint: blend from the warm AO tint at the base to pure white at the tip.
  // The tint only affects the darkened region — at the tip where ao ≈ 1.0
  // the color contribution is negligible.
  float3 tintFactor = lerp(aoTint, float3(1.0, 1.0, 1.0), t);

  return aoScalar * tintFactor;
}

// -- 1.5e-iii.  Density-Aware Grass AO ----------------------------------------
//
// Further improvement: modulates AO strength based on grass density.
//
// Sparse grass should have lighter AO at the base (more sky visible between
// blades), while dense grass should have heavier AO (blades packed tightly,
// very little light reaches the root).
//
// If the game exposes a per-instance or per-patch density value (common in
// procedural grass systems), this can drive the AO intensity dynamically.
//
// If no density value is available, a constant can be tuned per-scene.
//
// REQUIREMENTS:
//   • density — [0,1] grass density at this blade's position.
//               This may be available as:
//                 ◦ A per-instance constant buffer value
//                 ◦ A density texture sample (terrain splat map)
//                 ◦ A vertex color channel encoding patch density
//               If unavailable, use a constant (0.7 is a safe default
//               for moderately dense grass).
//
// Parameters:
//   bladeHeight – [0,1] position along blade
//   density     – [0,1] grass density (0 = sparse, 1 = dense)
//   aoMinBase   – AO at root in sparse grass (default 0.6)
//   aoMaxBase   – AO at root in dense grass (default 0.15)
//   aoTip       – AO at tip (default 1.0)
//   curve       – power curve exponent (default 0.5)
//   aoTint      – base color tint (default warm green)
//
// Returns:  float3 AO color factor to multiply into diffuse color.
//
float3 GrassAODensity(
    float  bladeHeight,
    float  density,
    float  aoMinBase = 0.6,
    float  aoMaxBase = 0.15,
    float  aoTip     = 1.0,
    float  curve     = 0.5,
    float3 aoTint    = float3(0.85, 0.95, 0.75))
{
  // Denser grass = darker base.  Sparse grass = lighter base.
  float aoBase = lerp(aoMinBase, aoMaxBase, saturate(density));

  return GrassAOImproved(bladeHeight, aoBase, aoTip, curve, aoTint);
}

// ============================================================================
// 1.6  Indirect Lighting Helpers
// ----------------------------------------------------------------------------
// Inspired by Sucker Punch Productions' SIGGRAPH 2021 talk:
// "Lighting, Pair-Programming, and Texture Baking in Ghost of Tsushima"
// (Jasmin Patry)
//
// Utilities for improving indirect / ambient lighting quality in games that
// ship with baked or low-quality GI.  These helpers address common problems:
//
//   a) SH evaluation  — evaluate degree-2 (L2) spherical harmonics stored
//      as 9 coefficients per color channel.  Many games bake probe data in
//      SH but use incorrect or truncated evaluation in their shaders.
//
//   b) SH projection  — project a directional light into L2 SH for
//      injecting analytical sun/fill lights into an existing SH probe.
//
//   c) Sun ground bounce — approximate a single-bounce diffuse fill from
//      the sun reflecting off the ground plane.  GoT used this to add
//      upward ambient in exterior scenes without extra probe captures.
//
//   d) Screen-space light leak reduction — darkens indirect light in areas
//      where screen-space depth suggests the pixel is occluded from the
//      dominant light direction.  GoT's main GI artifact fix.
//
//   e) Interior mask — blends between interior and exterior indirect
//      contributions using a mask value (texture, vertex color, or CB).
//
//   f) Simple ambient bounce — fast single-bounce approximation that
//      uses the surface albedo and AO to approximate diffuse inter-
//      reflection without a full GI solve.
//
//   g) Horizon occlusion — attenuates specular IBL when the reflection
//      cone dips below the geometric surface horizon, preventing
//      impossible reflections from aggressive normal mapping.
//
//   h) Roughness parallax compensation — adjusts apparent roughness
//      when parallax-correcting probes, so reflections look correct
//      regardless of camera distance vs. probe capture distance.
//
//   Note: Cubemap shadow tracing (from the same talk) is documented but
//   NOT implemented — it requires engine-level probe system integration.
//
// All functions are pure math — no texture bindings required except for
// ScreenSpaceLightLeakReduction which optionally takes a depth buffer.
// ============================================================================

// ---------------------------------------------------------------------------
// 1.6a  Evaluate Degree-2 Spherical Harmonics (Monochromatic)
// ---------------------------------------------------------------------------
// Evaluates a set of 9 SH coefficients (L0 + L1 + L2) in the direction `dir`
// and returns a single scalar irradiance value.
//
// SH coefficient ordering follows the "real" SH convention used by most
// game engines (same as DirectX SHEvalDirection):
//
//   c[0] = Y_0^0    (DC / constant)
//   c[1] = Y_1^{-1}  (linear Y)
//   c[2] = Y_1^0     (linear Z)
//   c[3] = Y_1^1     (linear X)
//   c[4] = Y_2^{-2}  (XY)
//   c[5] = Y_2^{-1}  (YZ)
//   c[6] = Y_2^0     (3Z²-1)
//   c[7] = Y_2^1     (XZ)
//   c[8] = Y_2^2     (X²-Y²)
//
// The SH basis functions include the normalization constants:
//   Y_0^0    = 0.282095
//   Y_1^{m}  = 0.488603 · {y, z, x}
//   Y_2^{-2} = 1.092548 · xy
//   Y_2^{-1} = 1.092548 · yz
//   Y_2^0    = 0.315392 · (3z²-1)
//   Y_2^1    = 1.092548 · xz
//   Y_2^2    = 0.546274 · (x²-y²)
//
// Parameters:
//   coeffs – array of 9 SH coefficients (float[9])
//   dir    – evaluation direction (normalized)
//
// Returns:  scalar irradiance value.
// ---------------------------------------------------------------------------
float EvalSH_L2(float coeffs[9], float3 dir)
{
  // Band 0 (DC)
  float result = coeffs[0] * 0.282095;

  // Band 1 (linear)
  result += coeffs[1] * 0.488603 * dir.y;
  result += coeffs[2] * 0.488603 * dir.z;
  result += coeffs[3] * 0.488603 * dir.x;

  // Band 2 (quadratic)
  result += coeffs[4] * 1.092548 * dir.x * dir.y;
  result += coeffs[5] * 1.092548 * dir.y * dir.z;
  result += coeffs[6] * 0.315392 * (3.0 * dir.z * dir.z - 1.0);
  result += coeffs[7] * 1.092548 * dir.x * dir.z;
  result += coeffs[8] * 0.546274 * (dir.x * dir.x - dir.y * dir.y);

  return result;
}

// ---------------------------------------------------------------------------
// 1.6a′  Evaluate Degree-2 Spherical Harmonics (RGB — 3-channel)
// ---------------------------------------------------------------------------
// Same as EvalSH_L2 but for color probes that store 9 coefficients per
// channel (27 floats total, passed as three separate arrays).
//
// Parameters:
//   cR, cG, cB – 9 SH coefficients each, one per color channel
//   dir        – evaluation direction (normalized)
//
// Returns:  float3 RGB irradiance.
// ---------------------------------------------------------------------------
float3 EvalSH_L2_RGB(float cR[9], float cG[9], float cB[9], float3 dir)
{
  return float3(
    EvalSH_L2(cR, dir),
    EvalSH_L2(cG, dir),
    EvalSH_L2(cB, dir)
  );
}

// ---------------------------------------------------------------------------
// 1.6b  Project Directional Light into L2 SH
// ---------------------------------------------------------------------------
// Projects a directional light source (e.g. the sun) into degree-2 SH
// coefficients.  This is useful when you want to inject an analytical
// light into an existing SH probe — simply add the projected coefficients
// to the probe's existing coefficients.
//
// The projection uses the standard zonal harmonic (ZH) expansion of a
// clamped cosine lobe in the light direction:
//   ZH band 0: π           · Y_0^0    ≈ 0.886227
//   ZH band 1: 2π/3        · Y_1^m    ≈ 1.023326 (per axis)
//   ZH band 2: π/4         · Y_2^0    ≈ 0.247708 (only the zonal m=0 term)
//
// The full clamped-cosine ZH coefficients, when pre-rotated to the light
// direction via SH rotation, produce the 9 coefficients below.
//
// Parameters:
//   lightDir   – direction TO the light (normalized)
//   lightColor – light radiance (linear RGB), pre-multiplied by intensity
//   outR, outG, outB – output arrays, each 9 floats, to receive the
//                       projected SH coefficients.  ADD these to existing
//                       probe SH to inject the light.
// ---------------------------------------------------------------------------
void ProjectDirToSH_L2(
    float3 lightDir,
    float3 lightColor,
    out float outR[9],
    out float outG[9],
    out float outB[9])
{
  // Evaluate SH basis functions in the light direction
  float basis[9];
  basis[0] = 0.282095;
  basis[1] = 0.488603 * lightDir.y;
  basis[2] = 0.488603 * lightDir.z;
  basis[3] = 0.488603 * lightDir.x;
  basis[4] = 1.092548 * lightDir.x * lightDir.y;
  basis[5] = 1.092548 * lightDir.y * lightDir.z;
  basis[6] = 0.315392 * (3.0 * lightDir.z * lightDir.z - 1.0);
  basis[7] = 1.092548 * lightDir.x * lightDir.z;
  basis[8] = 0.546274 * (lightDir.x * lightDir.x - lightDir.y * lightDir.y);

  // Clamped-cosine ZH transfer coefficients per band
  // Band 0: π,  Band 1: 2π/3,  Band 2: π/4
  static const float zhTransfer[9] = {
    3.14159265,                                    // band 0
    2.09439510, 2.09439510, 2.09439510,            // band 1
    0.78539816, 0.78539816, 0.78539816, 0.78539816, 0.78539816  // band 2
  };

  [unroll]
  for (int i = 0; i < 9; i++)
  {
    float projected = basis[i] * zhTransfer[i];
    outR[i] = lightColor.r * projected;
    outG[i] = lightColor.g * projected;
    outB[i] = lightColor.b * projected;
  }
}

// ---------------------------------------------------------------------------
// 1.6c  Sun Ground Bounce
// ---------------------------------------------------------------------------
// Approximates a single diffuse bounce of sunlight reflecting off the
// ground plane and illuminating surfaces from below.
//
// Ghost of Tsushima, SIGGRAPH 2021:
//   Used a cheap sun bounce term to fill in upward-facing ambient in
//   outdoor scenes.  The ground acts as a large area light — sunlight
//   hits the terrain, scatters diffusely, and illuminates the undersides
//   of objects (foliage undersides, character chins, overhangs).
//
// The approximation:
//   1. Compute how much sunlight reaches the ground: NdotL of the ground
//      normal (world up) with the sun direction, clamped.
//   2. Attenuate by the ground's albedo (how much energy is reflected
//      vs absorbed — dark soil bounces less than bright sand).
//   3. Weight by how much the shaded surface faces the ground (downward
//      hemisphere — the "sky factor" complement).
//   4. Scale by a user-tunable intensity.
//
// Parameters:
//   surfaceNormal – world-space surface normal (normalized)
//   sunDir        – direction TO the sun (normalized)
//   sunColor      – sun radiance (linear RGB), pre-multiplied by intensity
//   groundAlbedo  – average ground color (linear RGB, default neutral 0.2)
//                   Bright sand ≈ (0.4, 0.35, 0.25)
//                   Green grass ≈ (0.1, 0.2, 0.05)
//                   Dark soil   ≈ (0.05, 0.04, 0.03)
//   intensity     – overall strength multiplier (default 0.15)
//                   Keep low — this is a rough approximation, not a
//                   ground-truth GI solve.
//
// Returns:  bounce irradiance (linear RGB), add to indirect diffuse.
// ---------------------------------------------------------------------------
float3 SunGroundBounce(
    float3 surfaceNormal,
    float3 sunDir,
    float3 sunColor,
    float3 groundAlbedo = float3(0.2, 0.2, 0.2),
    float  intensity    = 0.15)
{
  // How much sun reaches the ground (ground normal = world up)
  float sunOnGround = saturate(sunDir.y);

  // How much the surface faces the ground (downward hemisphere)
  // 0 when surface faces up, 1 when surface faces straight down.
  float groundFacing = saturate(-surfaceNormal.y) * 0.5
                     + saturate(1.0 - surfaceNormal.y) * 0.5;
  // Simplified: weight increases as normal tilts away from sky
  groundFacing = saturate(1.0 - surfaceNormal.y) * 0.5;

  return sunColor * groundAlbedo * sunOnGround * groundFacing * intensity
       * (1.0 / 3.14159265);
}

// ---------------------------------------------------------------------------
// 1.6d  Screen-Space Light Leak Reduction
// ---------------------------------------------------------------------------
// Ghost of Tsushima, SIGGRAPH 2021:
//   "Our largest source of light leaking artifacts was indirect lighting
//    from the sky leaking into areas that should be fully occluded."
//
// The insight: if we know the dominant light direction (sun), we can use
// the screen-space depth buffer to detect pixels that are likely shadowed
// from the sky hemisphere.  Pixels behind geometry (as seen from the
// dominant light) should receive less indirect light.
//
// This is conceptually similar to screen-space shadows but applied to
// the *indirect* contribution rather than direct lighting.  It catches
// large-scale leaks that probe-based GI misses (e.g. sky light bleeding
// through walls, under overhangs, into caves).
//
// Implementation:
//   1. Sample the depth buffer at the current pixel.
//   2. March a few steps along the dominant light direction in screen
//      space.
//   3. If any sample is closer to the camera than the expected depth
//      along the ray, the pixel is occluded → darken indirect.
//   4. Apply a smooth falloff to avoid hard edges.
//
// REQUIREMENTS:
//   • A depth buffer bound as SRV (Texture2D<float>)
//   • Screen-space UV of the current pixel
//   • The dominant light direction projected into screen space
//     (or equivalently, the sun direction + the inverse view-projection)
//
// Parameters:
//   depthTex       – depth buffer (hardware depth, [0,1] or reversed-Z)
//   depthSampler   – point or linear sampler for the depth buffer
//   screenUV       – current pixel's screen-space UV [0,1]²
//   lightDirSS     – dominant light direction in screen space (xy only,
//                    normalized).  To compute: project (worldPos + sunDir)
//                    to screen space, subtract current screenUV, normalize.
//   centerDepth    – depth value at the current pixel (same space as
//                    depthTex)
//   stepSize       – UV-space step size per march step (default 0.01)
//                    Larger = catches bigger leaks but less precise.
//   numSteps       – number of march steps (default 4)
//                    More steps = better coverage but more texture reads.
//   thickness      – depth comparison threshold (default 0.005)
//                    Pixels whose depth difference exceeds this are
//                    considered occluders.  In reversed-Z, occluder depth
//                    is LESS than the center depth.
//   reversedZ      – true if the depth buffer uses reversed-Z (1=near,
//                    0=far).  Most modern engines use reversed-Z.
//                    (default true)
//
// Returns:  scalar occlusion factor [0,1].
//           0 = fully occluded (suppress indirect), 1 = fully visible.
//
// Usage:
//   float leak = renodx::rendering::ScreenSpaceLightLeakReduction(
//       depthBuffer, pointSampler, uv, lightDirSS, centerDepth);
//   indirectDiffuse *= leak;
// ---------------------------------------------------------------------------
float ScreenSpaceLightLeakReduction(
    Texture2D<float> depthTex,
    SamplerState     depthSampler,
    float2           screenUV,
    float2           lightDirSS,
    float            centerDepth,
    float            stepSize  = 0.01,
    int              numSteps  = 4,
    float            thickness = 0.005,
    bool             reversedZ = true)
{
  float occlusion = 0.0;
  float2 stepUV = lightDirSS * stepSize;

  [unroll]
  for (int i = 1; i <= numSteps; i++)
  {
    float2 sampleUV = screenUV + stepUV * (float)i;

    // Clamp to screen bounds to avoid sampling outside the viewport
    sampleUV = saturate(sampleUV);

    float sampledDepth = depthTex.SampleLevel(depthSampler, sampleUV, 0);

    // Check if the sampled point is an occluder
    // Reversed-Z: occluder has GREATER depth value (closer to camera = larger value)
    // Normal-Z:   occluder has SMALLER depth value (closer to camera = smaller value)
    float depthDiff = reversedZ
        ? (sampledDepth - centerDepth)
        : (centerDepth - sampledDepth);

    // If depthDiff > thickness, this sample is in front of us → occluder
    if (depthDiff > thickness)
    {
      // Weight by inverse distance (closer steps matter more)
      float weight = 1.0 - ((float)i / ((float)numSteps + 1.0));
      occlusion += weight;
    }
  }

  // Normalize and invert: 0 = fully occluded, 1 = fully visible
  float maxOcclusion = 0.0;
  [unroll]
  for (int j = 1; j <= numSteps; j++)
  {
    maxOcclusion += 1.0 - ((float)j / ((float)numSteps + 1.0));
  }

  return 1.0 - saturate(occlusion / max(maxOcclusion, 0.001));
}

// ---------------------------------------------------------------------------
// 1.6e  Indirect Lighting by Interior Mask
// ---------------------------------------------------------------------------
// Blends between exterior and interior indirect lighting contributions
// using a mask value.
//
// Many games have interior/exterior transitions where the indirect lighting
// should change character entirely (outdoor skylight vs indoor bounce).
// A mask value — from a texture, vertex color, or constant buffer — drives
// the blend.
//
// Ghost of Tsushima, SIGGRAPH 2021:
//   Used interior masks on probes to control which sky/bounce probes
//   contribute to a given pixel.  This is difficult to replicate exactly
//   in a shader interposer, but a simple blend with a mask value achieves
//   a similar visual result.
//
// Parameters:
//   exteriorIndirect – indirect light for exterior (e.g. sky probe)
//   interiorIndirect – indirect light for interior (e.g. interior probe,
//                      or a dimmed/tinted version of exterior)
//   interiorMask     – [0,1] blend factor.  0 = fully exterior, 1 = fully
//                      interior.  Source depends on the game:
//                        ◦ Vertex color channel (commonly alpha)
//                        ◦ A lightmap channel
//                        ◦ A constant buffer value per-draw-call
//                        ◦ A screen-space heuristic (depth complexity)
//   transitionSharpness – controls the smoothstep blend curve (default 1.0)
//                          1.0 = linear blend
//                          >1.0 = sharper transition at mask edges
//
// Returns:  blended indirect lighting (linear RGB).
// ---------------------------------------------------------------------------
float3 IndirectByInteriorMask(
    float3 exteriorIndirect,
    float3 interiorIndirect,
    float  interiorMask,
    float  transitionSharpness = 1.0)
{
  float blend = saturate(interiorMask);

  // Optionally sharpen the transition with a power curve
  if (transitionSharpness != 1.0)
  {
    blend = pow(blend, transitionSharpness);
  }

  return lerp(exteriorIndirect, interiorIndirect, blend);
}

// ---------------------------------------------------------------------------
// 1.6f  Simple Ambient Bounce
// ---------------------------------------------------------------------------
// Quick single-bounce ambient approximation that improves flat ambient
// lighting without requiring a full GI solve.
//
// The idea: surfaces that are partially occluded (low AO) still receive
// some indirect light — specifically, light that bounced off the surface's
// own material.  A white wall in a corner fills the corner with soft white
// light; a red carpet makes the nearby walls pinkish.
//
// This approximation models that secondary bounce as:
//   bounce ≈ ambient × albedo × (1 - AO) × intensity
//
// Where (1 - AO) represents how much of the hemisphere is blocked by
// nearby geometry — those blocked directions are exactly where secondary
// bounces would come from.
//
// This is a common trick used in many engines (UE4 "ambient occlusion
// color bleeding", Unity HDRP "indirect diffuse" term) and was referenced
// in the GoT SIGGRAPH 2021 talk as part of their ambient fill.
//
// Parameters:
//   ambient   – current ambient / indirect diffuse at this pixel (linear RGB)
//   albedo    – surface albedo (linear RGB)
//   ao        – ambient occlusion [0,1] (0 = fully occluded, 1 = unoccluded)
//   intensity – strength of the bounce contribution (default 0.25)
//               Keep moderate — this is an approximation and too much
//               will over-brighten occluded areas.
//
// Returns:  ambient + bounce contribution (linear RGB).
//           Replaces the input ambient — do NOT add this to ambient again.
// ---------------------------------------------------------------------------
float3 SimpleAmbientBounce(
    float3 ambient,
    float3 albedo,
    float  ao,
    float  intensity = 0.25)
{
  // The bounce comes from occluded directions, tinted by the surface color
  float3 bounce = ambient * albedo * (1.0 - ao) * intensity;

  return ambient + bounce;
}

// ---------------------------------------------------------------------------
// 1.6g  Horizon Occlusion for Specular IBL
// ---------------------------------------------------------------------------
// Ghost of Tsushima, SIGGRAPH 2021 (Jasmin Patry):
//   "Account for occlusion of underlying geometry on reflection cone
//    caused by tilt of normal-mapped normal n̂_p relative to vertex
//    normal n̂_v."
//
// When a normal map tilts the shading normal away from the geometric
// (vertex) normal, the specular reflection cone can extend below the
// tangent plane of the actual geometry.  Those below-horizon directions
// are physically impossible — the surface's own geometry blocks them.
// Without correction, this causes specular light leaking: bright IBL
// reflections on surfaces that should be self-occluded.
//
// GoT's formulation (from the slide):
//
//   Given:
//     n̂_v = vertex (geometric) normal
//     n̂_p = pixel (normal-mapped) normal
//     r̂   = reflection vector = reflect(-V, n̂_p)
//     α   = GGX roughness (linear, NOT perceptual)
//     u_e = fraction of specular energy enclosed by the cone
//
//   The cone half-angle θ_c containing fraction u_e of the energy:
//     tan(θ_c) = α × √(u_e / (1 - u_e))
//
//   The angle between vertex and pixel normals:
//     θ_p = acos(dot(n̂_v, n̂_p))
//
//   The angle of the reflection vector from the vertex normal plane:
//     θ_r = asin(dot(r̂, n̂_v))
//
//   The occlusion angle:
//     θ_o = min(θ_r + θ_c − π/2, 2θ_p)
//
//   The occluded energy fraction:
//     u_o = u_e × smoothstep(0, 2θ_c, θ_o)
//
//   Final attenuation = 1 − u_o
//
// REQUIREMENTS:
//   • vertexNormal — the interpolated geometric normal (before normal
//     mapping).  This is the key requirement and the main difficulty.
//
//     Where to find it:
//       ◦ Some G-Buffers store both geometric and pixel normals
//       ◦ In forward renderers: available as a VS→PS interpolant
//       ◦ Some engines pass it as a separate output semantic
//       ◦ If unavailable, use HorizonOcclusionApprox() which
//         reconstructs a face normal from ddx/ddy of worldPos
//
//   • pixelNormal — the normal-mapped shading normal (usually readily
//     available — it's what the game uses for lighting)
//
//   • R — reflection vector: reflect(-V, pixelNormal)
//
//   • roughness — LINEAR roughness α (NOT perceptual roughness).
//     If the game stores perceptual roughness, square it:
//       α = perceptualRoughness²
//
// Parameters:
//   vertexNormal   — interpolated geometric normal (normalized)
//   pixelNormal    — normal-mapped shading normal (normalized)
//   R              — reflection vector (normalized)
//   roughness      — linear roughness α (NOT perceptual)
//   energyFraction — fraction of specular energy in the cone (default 0.85)
//                    Higher = more conservative (wider cone, less
//                    occlusion).  0.85–0.95 are reasonable.
//
// Returns:  scalar attenuation [0,1] to multiply into specular IBL.
//           1.0 = no occlusion, 0.0 = fully occluded.
//
// Usage:
//   float horizonOcc = renodx::rendering::HorizonOcclusion(
//       vertexNormal, pixelNormal, R, roughness);
//   specularIBL *= horizonOcc;
// ---------------------------------------------------------------------------
float HorizonOcclusion(
    float3 vertexNormal,
    float3 pixelNormal,
    float3 R,
    float  roughness,
    float  energyFraction = 0.85)
{
  // Clamp roughness to avoid division by zero for perfectly smooth surfaces.
  float alpha = max(roughness, 0.002);

  // --- Cone half-angle θ_c ---
  // tan(θ_c) = α × √(u_e / (1 - u_e))
  // θ_c = atan(α × √(u_e / (1 - u_e)))
  float tanThetaC = alpha * sqrt(energyFraction / (1.0 - energyFraction));
  float thetaC = atan(tanThetaC);

  // --- Angle between vertex normal and pixel normal: θ_p ---
  // This measures how much the normal map has tilted the shading normal.
  float NdotN = saturate(dot(vertexNormal, pixelNormal));
  float thetaP = acos(NdotN);

  // --- Angle of reflection relative to the vertex normal's horizon ---
  // θ_r = angle between the reflection vector and the vertex tangent plane
  // The tangent plane is at 90° from the vertex normal, so:
  //   θ_r = asin(dot(R, vertexNormal))
  // Positive = above horizon, negative = below.
  float RdotVN = dot(R, vertexNormal);
  float thetaR = asin(saturate(RdotVN));

  // --- Occlusion angle θ_o ---
  // GoT formula: θ_o = min(θ_r + θ_c − π/2, 2θ_p)
  // When θ_o > 0, part of the cone extends below the horizon.
  static const float HALF_PI = 1.5707963;
  float thetaO = min(thetaR + thetaC - HALF_PI, 2.0 * thetaP);

  // --- Attenuated energy fraction ---
  // u_o = u_e × smoothstep(0, 2θ_c, θ_o)
  float occludedFraction = energyFraction * smoothstep(0.0, 2.0 * thetaC, thetaO);

  // The attenuation is how much energy remains after removing the
  // occluded portion.  When thetaO ≤ 0, occludedFraction = 0 → no occlusion.
  return 1.0 - occludedFraction;
}

// ---------------------------------------------------------------------------
// 1.6g′  Horizon Occlusion — Approximate (no vertex normal required)
// ---------------------------------------------------------------------------
// When the vertex normal is not available (common in deferred renderers
// where only the final normal-mapped normal is stored in the G-Buffer),
// this variant reconstructs a crude geometric face normal from screen-space
// position derivatives (ddx/ddy of worldPos).
//
// This gives a FACE normal (flat per-triangle), not a smooth vertex
// normal.  The occlusion will be less accurate on curved surfaces but
// still catches the worst horizon violations on flat geometry (floors,
// walls, terrain) — which is where the problem is most visible.
//
// Parameters:
//   worldPos    — world position of the shaded pixel
//   pixelNormal — normal-mapped shading normal (normalized)
//   R           — reflection vector (normalized)
//   roughness   — linear roughness α
//   energyFraction — cone energy fraction (default 0.85)
//
// Returns:  scalar attenuation [0,1] for specular IBL.
// ---------------------------------------------------------------------------
float HorizonOcclusionApprox(
    float3 worldPos,
    float3 pixelNormal,
    float3 R,
    float  roughness,
    float  energyFraction = 0.85)
{
  // Reconstruct geometric face normal from screen-space derivatives.
  float3 dPdx = ddx(worldPos);
  float3 dPdy = ddy(worldPos);
  float3 faceNormal = normalize(cross(dPdx, dPdy));

  // Ensure consistent orientation (face normal should point same hemisphere
  // as the pixel normal).
  if (dot(faceNormal, pixelNormal) < 0.0)
    faceNormal = -faceNormal;

  return HorizonOcclusion(faceNormal, pixelNormal, R, roughness, energyFraction);
}

// ---------------------------------------------------------------------------
// 1.6h  Roughness Parallax Compensation
// ---------------------------------------------------------------------------
// Ghost of Tsushima, SIGGRAPH 2021 (Jasmin Patry):
//   "Parallax correction within reflection probe volumes distorts apparent
//    roughness.  For current eye position d_e units from sample location,
//    with cubemap capture location d_c units away, we have:
//      tan(θ_e)/tan(θ_c) = α_e/α_c ≈ d_c/d_e
//    So when sampling the cubemap we use:
//      α_c ≈ α_e × (d_e / d_c)"
//
// When you parallax-correct a reflection probe (section 1.2a/b), the
// reflected point in the cubemap was captured from a different distance
// than the current camera sees it.  This distance ratio changes the
// apparent solid angle of the GGX lobe:
//   • Camera closer than probe (d_e < d_c) → ratio < 1 → sharper
//   • Camera farther than probe (d_e > d_c) → ratio > 1 → blurrier
//
// Without compensation, parallax-corrected probes look too blurry when
// the camera is closer to the surface than the probe was, and too sharp
// when the camera is farther away.
//
// This function adjusts the roughness used for cubemap mip selection
// (NOT the material roughness used for direct lighting — only for IBL).
//
// REQUIREMENTS:
//   • worldPos     — world position of the shaded surface point
//   • cameraPos    — world position of the camera/eye
//   • probePos     — world position where the cubemap was captured
//   • intersectPos — the parallax-corrected point on the proxy volume
//                    (the intersection point from ParallaxCorrectBox/
//                    Sphere, BEFORE normalizing to a direction).
//                    You need the POSITION, not just the corrected
//                    direction — so compute it before normalizing.
//
// These values should already be available if you're doing parallax
// correction (section 1.2).  This is a natural extension.
//
// Parameters:
//   roughness     — material roughness (linear α)
//   worldPos      — world position of the shaded surface
//   cameraPos     — camera/eye world position
//   probePos      — cubemap capture world position
//   intersectPos  — parallax-corrected intersection point on proxy volume
//   minRoughness  — floor to prevent over-sharpening (default 0.002)
//   maxRoughness  — ceiling to prevent extreme blur (default 1.0)
//
// Returns:  adjusted roughness for cubemap mip selection.
//
// Usage (in conjunction with section 1.2a):
//
//   // 1. Parallax correct — keep the intersection position
//   float3 firstPlane  = (boxMax - worldPos) / R;
//   float3 secondPlane = (boxMin - worldPos) / R;
//   float3 furthest    = max(firstPlane, secondPlane);
//   float  dist        = min(min(furthest.x, furthest.y), furthest.z);
//   float3 intersectPos = worldPos + R * dist;
//   float3 correctedR   = normalize(intersectPos - probePos);
//
//   // 2. Compensate roughness for the distance change
//   float adjRoughness = renodx::rendering::RoughnessParallaxCompensation(
//       roughness, worldPos, cameraPos, probePos, intersectPos);
//
//   // 3. Use adjusted roughness for mip selection
//   float mip = renodx::rendering::ProbeMipFromRoughness(
//       sqrt(adjRoughness), mipCount);  // sqrt if ProbeMipFromRoughness expects perceptual
//   float3 envColor = cubemap.SampleLevel(samp, correctedR, mip).rgb;
// ---------------------------------------------------------------------------
float RoughnessParallaxCompensation(
    float  roughness,
    float3 worldPos,
    float3 cameraPos,
    float3 probePos,
    float3 intersectPos,
    float  minRoughness = 0.002,
    float  maxRoughness = 1.0)
{
  // d_e = distance from the camera (eye) to the intersection point.
  // This is how far the reflected object appears to the viewer.
  float d_e = length(intersectPos - cameraPos);

  // d_c = distance from the cubemap capture position to the intersection point.
  // This is how far the reflected object was from the camera when the
  // cubemap was originally captured.
  float d_c = length(intersectPos - probePos);

  // Avoid division by zero when the camera is at the probe position.
  // In that case, no compensation is needed (d_e ≈ d_c).
  if (d_c < 0.001) return roughness;

  // α_c ≈ α_e × (d_e / d_c)
  float distanceRatio = d_e / d_c;
  float adjustedRoughness = roughness * distanceRatio;

  return clamp(adjustedRoughness, minRoughness, maxRoughness);
}

// ---------------------------------------------------------------------------
// NOTE on Cubemap Shadow Tracing (NOT IMPLEMENTED)
// ---------------------------------------------------------------------------
// Ghost of Tsushima, SIGGRAPH 2021 (Jasmin Patry):
//   Far shadow maps are too low-resolution to properly shadow interiors.
//   Their insight: the depth cubemaps used for reflection probes already
//   contain occlusion information.  When relighting a cubemap texel, they
//   trace a ray in the directional light's direction through the cubemap
//   volume, sample the depth cubemap at the intersection point, and check
//   if something is blocking the light.  If the depth sample is sky →
//   unoccluded.  They used 4×4 PCF for soft results.
//
// This is NOT feasible via RenoDX because:
//   • It operates during the probe relighting pass (an offline/compute
//     pass that processes cubemap faces) — we can't inject this pass
//   • It requires depth cubemaps, which most games don't capture
//   • It requires knowing which probes are being relit and when
//   • It requires access to the directional light's direction per-probe
//     per-texel during cubemap processing
//
// This technique requires engine-level integration with the probe
// system's capture and relighting pipeline.
// ---------------------------------------------------------------------------

// ---------------------------------------------------------------------------
// 1.6i  Chebyshev Visibility Leak Test
// ---------------------------------------------------------------------------
// AC Shadows SIGGRAPH 2025:
//   Probe-based GI systems suffer from light leaking — a probe on the
//   other side of a thin wall can bleed light through because trilinear
//   interpolation doesn't respect occlusion.  AC Shadows stores mean
//   distance and mean distance² per probe direction and uses Chebyshev's
//   inequality to estimate the probability that the surface is actually
//   visible to the probe.
//
// How it works:
//   Given a probe that stores (for each octahedral direction):
//     • meanDist   — average traced distance to geometry
//     • meanDistSq — average of (traced distance)²
//   And the actual distance from probe to the shaded surface:
//     • surfaceDist
//
//   Chebyshev's inequality gives an upper bound on the probability
//   that a random value from the stored distribution exceeds surfaceDist:
//     variance = meanDistSq - meanDist²
//     P(x ≥ surfaceDist) ≤ variance / (variance + (surfaceDist - meanDist)²)
//
//   If surfaceDist ≤ meanDist, the surface is closer than the average
//   geometry seen by the probe → definitely visible (return 1).
//   Otherwise, the Chebyshev bound gives a soft occlusion weight.
//
// This is the same math used in Variance Shadow Maps (VSM) but applied
// to probe visibility rather than light shadows.  It produces smooth
// soft transitions instead of hard on/off leaks.
//
// RenoDX applicability:
//   Games that use DDGI, RTXGI, or any probe system with visibility/
//   distance storage can benefit.  Identify the probe sampling shader,
//   extract the distance data the game already stores, and replace the
//   weight computation with this Chebyshev test.
//
//   If the game's probes DON'T store distance data (many older games
//   don't), this can't be used — but BackfaceProbeRejection (§1.6j)
//   can still help.
//
// Parameters:
//   meanDist     – mean traced distance stored in the probe for this direction
//   meanDistSq   – mean of (distance²) stored in the probe
//   surfaceDist  – actual distance from the probe to the shaded surface
//   minVariance  – floor on variance to avoid numerical instability
//                  (default 1e-4).  Higher = softer transitions.
//   lightBleed   – clamp to reduce light bleeding at penumbra edges
//                  (default 0.1).  The Chebyshev bound can still allow
//                  some leaking; this clamp remaps [lightBleed, 1] → [0, 1].
//
// Returns:  visibility weight [0,1].  1 = fully visible, 0 = fully occluded.
//           Multiply into the probe's interpolation weight.
// ---------------------------------------------------------------------------
float ChebyshevProbeVisibility(
    float  meanDist,
    float  meanDistSq,
    float  surfaceDist,
    float  minVariance = 1e-4,
    float  lightBleed  = 0.1)
{
  // Surface is closer than mean — definitely visible
  if (surfaceDist <= meanDist) return 1.0;

  // Variance from the stored moments
  float variance = max(meanDistSq - meanDist * meanDist, minVariance);

  // Chebyshev upper bound: P(x >= d) <= variance / (variance + (d - mean)²)
  float delta = surfaceDist - meanDist;
  float pMax  = variance / (variance + delta * delta);

  // Light bleed reduction: remap [lightBleed, 1] → [0, 1]
  return saturate((pMax - lightBleed) / (1.0 - lightBleed));
}

// ---------------------------------------------------------------------------
// 1.6j  Backface Probe Rejection
// ---------------------------------------------------------------------------
// AC Shadows SIGGRAPH 2025:
//   When interpolating between surrounding probes, reject any probe that
//   is behind the surface plane.  A probe behind a wall can only "see"
//   the surface through the wall — its contribution is invalid.
//
// The test: if the vector from the surface to the probe points away
// from the surface normal (dot < 0), the probe is on the wrong side.
//
// This is the simplest and most universally applicable leak-reduction
// technique for ANY probe-based GI system.  It requires only:
//   • Surface world position (always available)
//   • Surface normal (always available)
//   • Probe world position (must be extracted from the game's probe data)
//
// The sharpness parameter controls how quickly the rejection ramps.
// A gradual falloff avoids hard popping when probes transition from
// front to back as the camera moves.
//
// RenoDX applicability:
//   Very high.  Works with any probe/SH system where you can identify
//   the probe positions.  Many games store probe grid origins and spacing
//   in constant buffers — intercept those to compute probe positions.
//
// Parameters:
//   surfacePos  – world-space position of the shaded pixel
//   surfaceN    – world-space surface normal (normalized)
//   probePos    – world-space position of the probe being tested
//   sharpness   – controls the rejection ramp (default 1.0)
//                 0.5 = very gradual falloff (forgiving)
//                 1.0 = standard (good default)
//                 2.0 = aggressive rejection (may cause dark spots)
//   bias        – small offset to prevent self-occlusion at exactly
//                 coplanar positions (default 0.1, in world units)
//
// Returns:  weight [0,1].  1 = probe is in front, 0 = probe is behind.
//           Multiply into the probe's interpolation weight.
// ---------------------------------------------------------------------------
float BackfaceProbeRejection(
    float3 surfacePos,
    float3 surfaceN,
    float3 probePos,
    float  sharpness = 1.0,
    float  bias      = 0.1)
{
  float3 toProbe = probePos - surfacePos;
  float  d       = dot(toProbe, surfaceN);

  // Normalize by distance to make the test scale-independent,
  // then apply bias and sharpness
  float dist = length(toProbe) + 1e-6;
  float cosAngle = d / dist;

  return saturate((cosAngle + bias / dist) * sharpness + 0.5);
}

// ---------------------------------------------------------------------------
// 1.6k  Irradiance Sharpening
// ---------------------------------------------------------------------------
// AC Shadows SIGGRAPH 2025:
//   World-space hash probes accumulate irradiance over many frames via
//   exponential moving average.  This produces smooth but often overly
//   soft indirect lighting, washing out contact shadows and directional
//   cues.  A detail-enhancement pass can recover local contrast.
//
// Many existing games also suffer from this problem — baked lightmaps
// and probe irradiance tend to be low-frequency, making environments
// look flat.  A simple contrast enhancement on the GI contribution
// restores visual depth without changing the overall energy level.
//
// The technique:
//   1. Compute the luminance (energy level) of the sampled irradiance
//   2. Apply a contrast curve around the mean luminance
//   3. Preserve the hue and overall energy — only local contrast changes
//
// Three variants are provided:
//   (i)   Luminance contrast — enhances luminance range around mean
//   (ii)  Directional sharpening — steepens the directional response
//         by blending toward the dominant direction contribution
//   (iii) Detail recovery — steepens contrast while preserving darks
//
// RenoDX applicability:
//   Very high.  Pure ALU replacement in any GI sampling shader.  Works
//   with SH probes, irradiance volumes, lightmaps, SSAO-tinted ambient.
//   Identify the pixel shader where GI/ambient is applied and insert
//   this after the probe sample, before it multiplies into the surface.
//
// Parameters:
//   irradiance  – sampled GI / indirect diffuse (linear RGB)
//   strength    – sharpening intensity [0 = off, 1 = strong]
//                 (default 0.3).  Keep moderate to avoid artifacts.
//   midPoint    – luminance pivot for contrast (default 0.0 = auto).
//                 When 0, uses the irradiance's own luminance as pivot.
//                 When set explicitly, e.g. 0.1, that becomes the pivot.
//
// Returns:  sharpened irradiance (linear RGB), energy-preserving.
// ---------------------------------------------------------------------------

// -- 1.6k-i.  Luminance Contrast Sharpening ----------------------------------
// Enhances local contrast in the irradiance by pushing luminance values
// away from a pivot point.  Bright areas get brighter, dark areas get
// darker, but the overall energy is approximately preserved via the
// ratio-based rescale.
float3 IrradianceSharpen(
    float3 irradiance,
    float  strength = 0.3,
    float  midPoint = 0.0)
{
  // BT.709 luminance
  float lum = dot(irradiance, float3(0.2126, 0.7152, 0.0722));
  if (lum < 1e-6) return irradiance;

  // Auto-pivot: use the irradiance's own luminance
  float pivot = (midPoint > 0.0) ? midPoint : lum;

  // Contrast: push away from pivot
  // sharpened = pivot + (lum - pivot) * (1 + strength)
  float sharpenedLum = pivot + (lum - pivot) * (1.0 + strength);
  sharpenedLum = max(sharpenedLum, 0.0);

  // Ratio-based rescale preserves chrominance
  return irradiance * (sharpenedLum / lum);
}

// -- 1.6k-ii.  Directional Irradiance Sharpening ------------------------------
// When you have both the full irradiance AND the dominant-direction
// irradiance (e.g. from an L1 SH evaluation in the normal direction vs.
// the DC band), this variant sharpens by blending toward the directional
// component — emphasizing the dominant light direction.
//
// Parameters:
//   irradiance     – full sampled irradiance (e.g. L2 SH eval)
//   directional    – irradiance from the dominant direction only
//                    (e.g. the L1 band contribution, or a single
//                    probe evaluated in the light direction)
//   strength       – blend toward directional [0,1] (default 0.3)
//
// Returns:  sharpened irradiance biased toward dominant direction.
float3 IrradianceSharpenDirectional(
    float3 irradiance,
    float3 directional,
    float  strength = 0.3)
{
  // Blend toward the directional component, which has more contrast
  float3 sharpened = lerp(irradiance, directional, strength);

  // Preserve overall energy: rescale to match input luminance
  float lumIn  = dot(irradiance, float3(0.2126, 0.7152, 0.0722));
  float lumOut = dot(sharpened,  float3(0.2126, 0.7152, 0.0722));

  return (lumOut > 1e-6) ? sharpened * (lumIn / lumOut) : irradiance;
}

// -- 1.6k-iii.  Detail Recovery -----------------------------------------------
// Applies a soft contrast curve that enhances detail in mid-range
// irradiance without crushing blacks.  Uses a power curve centered
// on the mean, with dark-end protection.
//
// Parameters:
//   irradiance  – sampled GI (linear RGB)
//   strength    – detail recovery intensity [0,1] (default 0.3)
//   darkGuard   – luminance below which sharpening is suppressed
//                 (default 0.01).  Prevents noise amplification in darks.
//
// Returns:  detail-enhanced irradiance (linear RGB).
float3 IrradianceDetailRecover(
    float3 irradiance,
    float  strength  = 0.3,
    float  darkGuard = 0.01)
{
  float lum = dot(irradiance, float3(0.2126, 0.7152, 0.0722));
  if (lum < 1e-6) return irradiance;

  // Suppress enhancement in very dark areas
  float guard = smoothstep(0.0, darkGuard, lum);

  // Power-curve contrast: lum^(1 / (1 + strength))
  // This is > 1 for dark values and < 1 for bright values relative to 1.0,
  // but we apply it as a ratio so it enhances contrast around current lum.
  float exponent    = 1.0 / (1.0 + strength * guard);
  float enhanced    = pow(lum, exponent);
  float scaleFactor = enhanced / lum;

  return irradiance * scaleFactor;
}

// ---------------------------------------------------------------------------
// 1.6l  Screen-Space Global Illumination Approximation (SSGI)
// ---------------------------------------------------------------------------
// Approximates one-bounce indirect diffuse lighting using screen-space
// data (depth buffer + normal G-buffer + color buffer).  This achieves
// a similar goal to AC Shadows' probe-based GI — color-bleeding and
// indirect illumination — but using only data available in any deferred
// renderer's G-buffer, making it viable for RenoDX injection.
//
// How it works:
//   1. From the shaded pixel, march short rays in the hemisphere above
//      the surface normal through screen space
//   2. At each step, read the depth buffer to check for intersection
//   3. When a hit is found, read the color buffer at that location —
//      this is the "bounced" radiance from that surface
//   4. Weight the contribution by the cosine of the angle between
//      the surface normal and the ray direction (Lambert)
//   5. Accumulate and average across all rays
//
// This is essentially a screen-space radiosity gather — the same idea
// behind SSAO but instead of just testing occlusion, we read the color
// at the hit point to get colored indirect light.
//
// Limitations:
//   • Only captures bounces from visible surfaces (screen-space only)
//   • No contribution from off-screen or occluded geometry
//   • Quality depends on depth buffer precision and G-buffer availability
//   • Noisy with few samples — needs temporal accumulation or denoising
//
// RenoDX applicability:
//   Medium.  Requires injecting a compute pass via RenderPass that reads
//   the depth, normal, and color buffers as SRVs and writes to an
//   injected UAV.  The result is then composited in the lighting shader.
//   Per-game effort: identify G-buffer layout and lighting shader.
//
// NOTE: This function performs the per-pixel gather.  It should be called
// from a compute shader dispatched after the G-buffer is populated and
// before final lighting.  The sample directions should be pre-generated
// (e.g. cosine-weighted hemisphere via golden-spiral, like §1.9f).
//
// Parameters:
//   depthTex       – depth buffer (Texture2D<float>)
//   normalTex      – world-space normal G-buffer (Texture2D<float4>)
//                    .xyz = normal, .w unused
//   colorTex       – scene color after direct lighting (Texture2D<float4>)
//   pointSampler   – point-clamp sampler for depth/normal reads
//   screenUV       – current pixel's screen UV [0,1]²
//   surfaceN       – surface normal at this pixel (normalized, world space)
//   viewDepth      – linear view-space depth of this pixel
//   invProj        – inverse projection matrix (for UV+depth → view pos)
//   screenSize     – render target dimensions (width, height)
//   rayCount       – number of hemisphere rays to cast (default 8)
//                    Higher = better quality but more texture reads.
//                    8–16 is a good range for real-time use.
//   rayLength      – maximum screen-space ray length in UV units
//                    (default 0.05).  Controls how far bounces reach.
//   raySteps       – steps per ray march (default 4)
//   thickness      – depth comparison threshold for hit detection
//                    (default 0.02, in view-space units)
//   temporalOffset – per-frame jitter [0,1] for temporal noise rotation
//                    (default 0.0).  Feed (frameIndex % 64) / 64.0.
//   reversedZ      – true if depth buffer is reversed-Z (default true)
//
// Returns:  indirect diffuse radiance (linear RGB).  Add to the pixel's
//           ambient / indirect diffuse contribution, scaled by albedo.
// ---------------------------------------------------------------------------
float3 ScreenSpaceGI(
    Texture2D<float>  depthTex,
    Texture2D<float4> normalTex,
    Texture2D<float4> colorTex,
    SamplerState      pointSampler,
    float2            screenUV,
    float3            surfaceN,
    float             viewDepth,
    float4x4          invProj,
    float2            screenSize,
    uint              rayCount       = 8,
    float             rayLength      = 0.05,
    uint              raySteps       = 4,
    float             thickness      = 0.02,
    float             temporalOffset = 0.0,
    bool              reversedZ      = true)
{
  float3 giAccum = 0.0;
  float  weightSum = 0.0;

  // Golden angle for well-distributed ray directions
  static const float GOLDEN_ANGLE = 2.39996323;

  for (uint i = 0; i < rayCount; i++)
  {
    // Generate a ray direction in the hemisphere above surfaceN
    // Using golden-spiral distribution with temporal jitter
    float fi = (float)i + temporalOffset;
    float angle = fi * GOLDEN_ANGLE;
    float radius = sqrt((fi + 0.5) / (float)rayCount)  // cosine-weighted
                 * rayLength;

    float2 rayDir = float2(cos(angle), sin(angle)) * radius;

    // March along the ray in screen space
    float3 hitColor = 0.0;
    bool   hit      = false;

    for (uint s = 1; s <= raySteps; s++)
    {
      float t = (float)s / (float)raySteps;
      float2 sampleUV = screenUV + rayDir * t;

      // Out-of-bounds check
      if (any(sampleUV < 0.0) || any(sampleUV > 1.0)) break;

      // Sample depth at this screen location
      float sampledDepth = depthTex.SampleLevel(pointSampler, sampleUV, 0);

      // Convert sampled depth to linear view depth
      float4 clipPos    = float4(sampleUV * 2.0 - 1.0, sampledDepth, 1.0);
      clipPos.y = -clipPos.y;  // D3D UV convention
      float4 viewPos    = mul(invProj, clipPos);
      float  sampleViewDepth = viewPos.z / viewPos.w;

      if (reversedZ) sampleViewDepth = -sampleViewDepth;

      // Hit test: the sample is closer than our pixel, within thickness
      float depthDelta = viewDepth - sampleViewDepth;
      if (depthDelta > 0.0 && depthDelta < thickness)
      {
        hitColor = colorTex.SampleLevel(pointSampler, sampleUV, 0).rgb;

        // Read the normal at hit point for cosine weighting
        float3 hitN = normalTex.SampleLevel(pointSampler, sampleUV, 0).xyz;
        hitN = normalize(hitN * 2.0 - 1.0);  // Unpack if [0,1] encoded

        // Cosine weight: how much the hit surface faces back toward us
        float2 hitToCenter = screenUV - sampleUV;
        float  cosWeight   = saturate(dot(surfaceN, float3(hitToCenter, 0.01)));
        cosWeight = max(cosWeight, 0.1);  // Minimum contribution

        giAccum   += hitColor * cosWeight;
        weightSum += cosWeight;
        hit = true;
        break;  // First hit per ray is sufficient
      }
    }
  }

  return (weightSum > 0.0) ? giAccum / weightSum : 0.0;
}

// ---------------------------------------------------------------------------
// 1.6l′  Screen-Space GI — Simplified (no normal buffer required)
// ---------------------------------------------------------------------------
// Lighter variant for games where the normal G-buffer is not accessible
// or has an unknown encoding.  Uses only depth + color buffers.
//
// Instead of cosine-weighting by the hit normal, uses a simple distance-
// based falloff assuming Lambertian response.  Less accurate but still
// captures color bleeding effectively.
//
// Parameters:
//   depthTex       – depth buffer
//   colorTex       – scene color after direct lighting
//   pointSampler   – point-clamp sampler
//   screenUV       – current pixel's screen UV
//   viewDepth      – linear view depth of this pixel
//   invProj        – inverse projection matrix
//   rayCount       – hemisphere rays (default 8)
//   rayLength      – max screen-space ray length in UV (default 0.05)
//   raySteps       – steps per ray (default 4)
//   thickness      – depth hit threshold (default 0.02)
//   temporalOffset – per-frame jitter [0,1] (default 0.0)
//   reversedZ      – reversed-Z depth (default true)
//
// Returns:  approximate indirect diffuse (linear RGB).
// ---------------------------------------------------------------------------
float3 ScreenSpaceGISimple(
    Texture2D<float>  depthTex,
    Texture2D<float4> colorTex,
    SamplerState      pointSampler,
    float2            screenUV,
    float             viewDepth,
    float4x4          invProj,
    uint              rayCount       = 8,
    float             rayLength      = 0.05,
    uint              raySteps       = 4,
    float             thickness      = 0.02,
    float             temporalOffset = 0.0,
    bool              reversedZ      = true)
{
  float3 giAccum = 0.0;
  uint   hitCount = 0;

  static const float GOLDEN_ANGLE = 2.39996323;

  for (uint i = 0; i < rayCount; i++)
  {
    float fi = (float)i + temporalOffset;
    float angle = fi * GOLDEN_ANGLE;
    float radius = sqrt((fi + 0.5) / (float)rayCount) * rayLength;
    float2 rayDir = float2(cos(angle), sin(angle)) * radius;

    for (uint s = 1; s <= raySteps; s++)
    {
      float t = (float)s / (float)raySteps;
      float2 sampleUV = screenUV + rayDir * t;

      if (any(sampleUV < 0.0) || any(sampleUV > 1.0)) break;

      float sampledDepth = depthTex.SampleLevel(pointSampler, sampleUV, 0);

      float4 clipPos = float4(sampleUV * 2.0 - 1.0, sampledDepth, 1.0);
      clipPos.y = -clipPos.y;
      float4 viewPos = mul(invProj, clipPos);
      float  sampleViewDepth = viewPos.z / viewPos.w;

      if (reversedZ) sampleViewDepth = -sampleViewDepth;

      float depthDelta = viewDepth - sampleViewDepth;
      if (depthDelta > 0.0 && depthDelta < thickness)
      {
        float3 hitColor = colorTex.SampleLevel(pointSampler, sampleUV, 0).rgb;

        // Distance-based falloff: closer hits contribute more
        float distFactor = 1.0 - t;
        giAccum  += hitColor * distFactor;
        hitCount += 1;
        break;
      }
    }
  }

  return (hitCount > 0) ? giAccum / (float)hitCount : 0.0;
}

// ============================================================================
// 1.7  Atmospheric Scattering Helpers
// ----------------------------------------------------------------------------
// Inspired by Sucker Punch Productions' SIGGRAPH 2021 talk:
// "Real-Time Samurai Cinema: Lighting, Atmosphere, and Tonemapping in
//  Ghost of Tsushima" (Jasmin Patry)
//
// GoT designed a custom "Rayleigh LMS" color space optimized for
// atmospheric Rayleigh scattering.  The key insight (from Christian
// Schüler's blog post referenced in the talk): standard RGB color spaces
// (sRGB/BT.709) introduce significant error when computing Beer-Lambert
// transmittance per channel because the RGB primaries don't correspond
// to physically meaningful wavelengths for Rayleigh scattering.
//
// By choosing three primaries whose chromaticities align with wavelengths
// that minimize Rayleigh transmittance error vs. full spectral integration,
// you get sunset/sunrise colors, blue-hour skies, and aerial perspective
// that look dramatically more accurate — at zero additional ALU cost
// (same exp() calls, just in a different color basis).
//
// GoT's Rayleigh LMS color space (from the slide):
//   White point: D65 (x=0.3127, y=0.3290)
//   Primaries:   L(0.6501, 0.3495)  M(0.1711, 0.7959)  S(0.1520, 0.0218)
//   β_LMS = [0.0076224, 0.012935, 0.024845] km⁻¹
//
// WORKFLOW:
//   1. Convert scene/light color from linear sRGB → Rayleigh LMS
//   2. Apply Rayleigh transmittance: color *= exp(-β_LMS × distance_km)
//   3. Add in-scattered light (also in Rayleigh LMS)
//   4. Convert result back: Rayleigh LMS → linear sRGB
//
// RenoDX USE CASES:
//   • Replace a game's fog/atmosphere pixel shader — do the scattering
//     computation in Rayleigh LMS instead of naive RGB
//   • Improve volumetric lighting ray-march shaders
//   • Post-hoc atmosphere correction using the depth buffer
//   • Sky shader replacement for better analytical sky gradients
//
// REQUIREMENTS:
//   • Identify the atmosphere/fog/aerial-perspective shader by hash
//   • Need the scene distance (from depth buffer or explicit distance)
//   • Need the sun/light direction and color (from CB) for in-scattering
//
// Sub-sections:
//   a) Color space conversion matrices (sRGB ↔ Rayleigh LMS)
//   b) Rayleigh transmittance in LMS
//   c) Single-scattering in-scatter computation
//   d) Combined aerial perspective (transmittance + in-scatter)
//   e) Post-hoc atmosphere correction (fix existing naive RGB scattering)
// ============================================================================

// ---------------------------------------------------------------------------
// 1.7a  Color Space Conversion Matrices
// ---------------------------------------------------------------------------
// Derived from GoT's custom Rayleigh LMS primaries and D65 white point
// using the standard Normalized Primary Matrix (NPM) derivation:
//
//   1. Convert each primary's chromaticity (x,y) to XYZ:
//        X = x/y,  Y = 1,  Z = (1-x-y)/y
//   2. Form a 3×3 matrix M from the three XYZ primary columns
//   3. Solve for scaling factors S:  M × S = XYZ_whitepoint
//   4. The XYZ-to-RayleighLMS matrix is inv(M × diag(S))
//   5. Compose with the standard sRGB↔XYZ matrices
//
// The matrices below are the pre-composed sRGB ↔ RayleighLMS transforms
// so there is no intermediate XYZ step at runtime.
//
// NOTE: These matrices assume LINEAR sRGB input (gamma already removed).
//       If the game's fog shader operates on gamma-encoded values, you
//       must linearize first.
//
// Verified properties:
//   • Roundtrip: RLMS_TO_SRGB × SRGB_TO_RLMS = Identity
//   • White preservation: (1,1,1)_sRGB → (1,1,1)_RLMS → (1,1,1)_sRGB
// ---------------------------------------------------------------------------

// sRGB (linear) → Rayleigh LMS
static const float3x3 SRGB_TO_RAYLEIGH_LMS = float3x3(
   0.665107,  0.342500, -0.007607,
  -0.013526,  0.935887,  0.077640,
   0.018300,  0.088716,  0.892984
);

// Rayleigh LMS → sRGB (linear)
static const float3x3 RAYLEIGH_LMS_TO_SRGB = float3x3(
   1.490639, -0.551267,  0.060628,
   0.024279,  1.068406, -0.092685,
  -0.032960, -0.094847,  1.127807
);

// ---------------------------------------------------------------------------
// Rayleigh scattering coefficients in the custom LMS space (km⁻¹).
//
// These are the optimized coefficients from GoT's talk — they minimize
// the error vs. spectral Rayleigh transmittance computation.
//
// β_S (S channel) is ~3.26× larger than β_L: short wavelengths (blue)
// scatter much more strongly, which is exactly the 1/λ⁴ Rayleigh
// relationship.  The LMS primaries were chosen so this ratio is
// physically accurate for the three basis wavelengths.
// ---------------------------------------------------------------------------
static const float3 RAYLEIGH_BETA_LMS = float3(0.0076224, 0.012935, 0.024845);

// ---------------------------------------------------------------------------
// 1.7b  Rayleigh Transmittance in LMS
// ---------------------------------------------------------------------------
// Computes the fraction of light that survives traveling a given distance
// through the atmosphere without being scattered (Beer-Lambert law).
//
// In standard RGB, this would be:
//   transmittance = exp(-beta_rgb * distance)
// where beta_rgb is some approximate Rayleigh coefficient per channel.
//
// In Rayleigh LMS, the same formula is used but with the optimized
// coefficients, giving much more accurate sunset/twilight colors because
// the per-channel exponential decay correctly models the wavelength-
// dependent scattering.
//
// Parameters:
//   colorLinearSRGB — input color in linear sRGB (e.g., sun color,
//                     sky radiance, scene color before fog)
//   distanceKm      — path length through the atmosphere in KILOMETERS.
//                     Common conversions:
//                       meters × 0.001 = km
//                       game units × scale = km (find scale via RenderDoc)
//   densityScale    — atmospheric density multiplier (default 1.0)
//                     < 1.0 = thinner atmosphere (high altitude, clear day)
//                     > 1.0 = thicker atmosphere (low altitude, hazy)
//
// Returns:  attenuated color in linear sRGB after Rayleigh transmittance.
//
// Usage:
//   float distKm = linearDepth * worldUnitsToKm;
//   float3 attenuated = renodx::rendering::RayleighTransmittance(
//       sceneColor, distKm, 1.0);
// ---------------------------------------------------------------------------
float3 RayleighTransmittance(
    float3 colorLinearSRGB,
    float  distanceKm,
    float  densityScale = 1.0)
{
  // Convert to Rayleigh LMS
  float3 colorLMS = mul(SRGB_TO_RAYLEIGH_LMS, colorLinearSRGB);

  // Apply Beer-Lambert transmittance per LMS channel
  float3 transmittance = exp(-RAYLEIGH_BETA_LMS * distanceKm * densityScale);
  colorLMS *= transmittance;

  // Convert back to linear sRGB
  return mul(RAYLEIGH_LMS_TO_SRGB, colorLMS);
}

// ---------------------------------------------------------------------------
// Overload that returns the raw transmittance factor in LMS.
// Useful when you need to apply transmittance and add in-scattered light
// as separate steps (the common case for full aerial perspective).
//
// Returns:  float3 transmittance factor in Rayleigh LMS space [0,1] per channel.
// ---------------------------------------------------------------------------
float3 RayleighTransmittanceFactor(
    float distanceKm,
    float densityScale = 1.0)
{
  return exp(-RAYLEIGH_BETA_LMS * distanceKm * densityScale);
}

// ---------------------------------------------------------------------------
// 1.7c  Rayleigh Single-Scattering In-Scatter
// ---------------------------------------------------------------------------
// Computes the light that is scattered INTO the view ray from the sun/moon
// (or any directional light) along the viewing path.
//
// This is the "fog color" — as distant objects fade, they don't just
// darken; they take on the color of in-scattered atmospheric light.
// For Rayleigh scattering, this depends on the scattering phase function
// and the angle between the view direction and the light direction.
//
// The Rayleigh phase function is:
//   P(θ) = (3 / (16π)) × (1 + cos²θ)
//
// The single-scattering in-scatter integral (assuming uniform atmosphere
// density along the ray) simplifies to:
//   inscatter = lightColor × P(θ) × (1 - transmittance)
//
// This is an approximation — it assumes the atmosphere is uniformly
// dense along the ray (no altitude variation).  For open-world games
// at ground level, this is reasonable for distances up to ~20 km.
//
// Parameters:
//   lightColor     — directional light color × intensity (linear sRGB)
//   lightDir       — direction TOWARD the light (normalized)
//   viewDir        — direction FROM camera TOWARD the scene point (normalized)
//   distanceKm     — path length in kilometers
//   densityScale   — atmospheric density multiplier (default 1.0)
//
// Returns:  in-scattered light color in linear sRGB.
//           ADD this to the transmittance-attenuated scene color.
// ---------------------------------------------------------------------------
float3 RayleighInScatter(
    float3 lightColor,
    float3 lightDir,
    float3 viewDir,
    float  distanceKm,
    float  densityScale = 1.0)
{
  // Rayleigh phase function: P(θ) = (3/(16π)) × (1 + cos²θ)
  float cosTheta = dot(viewDir, lightDir);
  float phase = (3.0 / (16.0 * 3.14159265)) * (1.0 + cosTheta * cosTheta);

  // Transmittance factor in LMS
  float3 transmittanceLMS = exp(-RAYLEIGH_BETA_LMS * distanceKm * densityScale);

  // In-scatter per LMS channel: lightColor_LMS × phase × (1 - transmittance)
  float3 lightLMS = mul(SRGB_TO_RAYLEIGH_LMS, lightColor);
  float3 inscatterLMS = lightLMS * phase * (1.0 - transmittanceLMS);

  // Convert back to linear sRGB
  return mul(RAYLEIGH_LMS_TO_SRGB, inscatterLMS);
}

// ---------------------------------------------------------------------------
// 1.7d  Combined Aerial Perspective
// ---------------------------------------------------------------------------
// Convenience function that applies both transmittance and in-scattering
// in a single call.  This is the complete aerial perspective effect:
//   result = sceneColor × transmittance + inscatter
//
// Both operations are performed in Rayleigh LMS for physically accurate
// color transitions, then converted back to sRGB.
//
// Parameters:
//   sceneColor       — unfogged scene color at the pixel (linear sRGB)
//   lightColor       — sun/moon color × intensity (linear sRGB)
//   lightDir         — direction toward the sun/moon (normalized)
//   viewDir          — direction from camera toward the scene point (normalized)
//   distanceKm       — path length in kilometers
//   densityScale     — atmospheric density (default 1.0)
//   ambientInscatter — ambient sky contribution to in-scatter
//                      (default subtle blue).  Accounts for sky light
//                      scattered into the path, not just direct sunlight.
//                      Prevents fog from going black on the nightside.
//
// Returns:  final color after aerial perspective (linear sRGB).
// ---------------------------------------------------------------------------
float3 AerialPerspective(
    float3 sceneColor,
    float3 lightColor,
    float3 lightDir,
    float3 viewDir,
    float  distanceKm,
    float  densityScale       = 1.0,
    float3 ambientInscatter   = float3(0.02, 0.035, 0.06))
{
  // Transmittance in LMS
  float3 transmittanceLMS = exp(-RAYLEIGH_BETA_LMS * distanceKm * densityScale);

  // Attenuate scene color in LMS
  float3 sceneLMS = mul(SRGB_TO_RAYLEIGH_LMS, sceneColor);
  float3 attenuatedLMS = sceneLMS * transmittanceLMS;

  // In-scatter from directional light (Rayleigh phase)
  float cosTheta = dot(viewDir, lightDir);
  float phase = (3.0 / (16.0 * 3.14159265)) * (1.0 + cosTheta * cosTheta);

  float3 lightLMS = mul(SRGB_TO_RAYLEIGH_LMS, lightColor);
  float3 inscatterLMS = lightLMS * phase * (1.0 - transmittanceLMS);

  // Add ambient in-scatter (sky contribution)
  float3 ambientLMS = mul(SRGB_TO_RAYLEIGH_LMS, ambientInscatter);
  inscatterLMS += ambientLMS * (1.0 - transmittanceLMS);

  // Combine and convert back
  float3 resultLMS = attenuatedLMS + inscatterLMS;
  return mul(RAYLEIGH_LMS_TO_SRGB, resultLMS);
}

// ---------------------------------------------------------------------------
// 1.7e  Post-Hoc Atmosphere Correction
// ---------------------------------------------------------------------------
// For games where you CAN'T replace the atmosphere shader directly but
// CAN intercept the final composited image (e.g., in a post-process shader):
//
// This function estimates the game's naive RGB atmospheric contribution,
// removes it, and reapplies it in Rayleigh LMS for more accurate color.
//
// The idea:
//   1. Use the depth buffer to estimate per-pixel distance
//   2. Assume the game applied naive RGB fog:
//        result = sceneColor × t + fogColor × (1 - t)
//      where t = exp(-gameFogDensity × distance)
//   3. Undo that contribution (approximately)
//   4. Reapply using Rayleigh LMS
//
// This is inherently approximate — we're guessing what the game did.
// But for games with obviously wrong sunset fog colors (too red, too
// gray, missing the blue-to-orange gradient), this produces a visible
// improvement.
//
// Parameters:
//   sceneColor         — the game's final composited color (linear sRGB,
//                        BEFORE tonemapping — intercept in the right place!)
//   linearDepth        — linearized depth at this pixel (in game world units)
//   worldToKm          — conversion factor: world units × worldToKm = km.
//                        Find this by measuring known distances in RenderDoc.
//   gameFogColor       — the game's fog/atmosphere color (estimate from
//                        examining distant pixels or the fog CB)
//   gameFogDensity     — the game's fog density coefficient (estimate from
//                        how quickly objects fade — inspect the fog shader CB)
//   lightColor         — sun/moon color (from CB)
//   lightDir           — sun/moon direction (from CB)
//   viewDir            — view direction for this pixel
//   densityScale       — Rayleigh density multiplier for the replacement
//   correctionStrength — blend between game's fog and corrected fog [0,1]
//                        0 = no change, 1 = full replacement.
//                        Start at 0.5 and tune — full replacement may
//                        look jarring if the estimate is wrong.
//
// Returns:  corrected color (linear sRGB).
// ---------------------------------------------------------------------------
float3 PostHocAtmosphereCorrection(
    float3 sceneColor,
    float  linearDepth,
    float  worldToKm,
    float3 gameFogColor,
    float  gameFogDensity,
    float3 lightColor,
    float3 lightDir,
    float3 viewDir,
    float  densityScale        = 1.0,
    float  correctionStrength  = 0.5)
{
  float distKm = linearDepth * worldToKm;

  // --- Estimate and remove the game's naive RGB fog ---
  // Assume the game applied: result = sceneColor × t + fogColor × (1 - t)
  // where t = exp(-gameFogDensity × distance)
  float gameT = exp(-gameFogDensity * linearDepth);
  float gameT_clamped = max(gameT, 0.001); // avoid division by zero

  // Recover approximate un-fogged scene color
  float3 gameFogContrib = gameFogColor * (1.0 - gameT);
  float3 unfogged = (sceneColor - gameFogContrib) / gameT_clamped;
  unfogged = max(unfogged, 0.0); // clamp negative from estimation error

  // --- Reapply atmosphere in Rayleigh LMS ---
  float3 corrected = AerialPerspective(
      unfogged, lightColor, lightDir, viewDir, distKm, densityScale);

  // --- Blend between game's original and corrected ---
  return lerp(sceneColor, corrected, correctionStrength);
}

// ============================================================================
// 1.8  Volumetric Haze Anti-Aliasing
// ----------------------------------------------------------------------------
// Reference: Ghost of Tsushima, SIGGRAPH 2021 (Jasmin Patry)
//            Wronski 2014, Drobot 2017a (froxel volumetrics)
//            Sigg & Hadwiger 2005, Ruijters et al. 2008 (fast cubic filtering)
//
// Many games render volumetric fog into a low-resolution 3D froxel grid
// (commonly 160×90×64 or similar) and composite the result in a full-screen
// pass.  Hardware trilinear filtering on such small volumes produces visible
// blocky artefacts, especially at horizon distances and near thin fog layers.
//
// Two complementary techniques dramatically reduce this aliasing:
//
//   (a) Tricubic B-spline filtering — replace trilinear with a smooth cubic
//       kernel using only 8 trilinear hardware taps (2D variant: 4 bilinear
//       taps).  The cubic B-spline has C² continuity (continuous first and
//       second derivatives), eliminating the hard voxel boundaries that
//       cause the "blocky" look.  Cost: ~8× texture bandwidth vs 1×
//       trilinear, but negligible ALU.  GoT reports <50 μs overhead on
//       PS4 Pro over trilinear on an R11G11B10F froxel buffer.
//
//   (b) Inscatter / opacity separation (GoT "Haze AA" trick) — instead of
//       filtering inscattered radiance L directly, filter L/α.  Under the
//       assumption that scattering and extinction are proportional
//       (σ_s = c·σ_e) and incoming radiance varies slowly:
//
//         L̃(d) ≈ c·L̄_i(d) · α(d)    →    L/α ≈ c·L̄_i ≈ constant
//
//       L/α is far smoother than L, so even trilinear on L/α gives better
//       results than tricubic on raw L.  Combining both techniques yields
//       the best quality for the cost.
//
// RenoDX integration:
//   Intercept the game's volumetric fog compositing pixel shader (or the CS
//   that populates the froxel volume).  Replace hardware texture fetches
//   with the tricubic variants below.  If the fog texture stores both
//   inscatter (RGB) and opacity (A), use the opacity-aware variants for
//   further quality improvement.
//
// Prerequisites for modders:
//   • Identify the fog 3D texture (Texture3D) or resolved 2D fog buffer
//   • Know the texture resolution (inject via CB or hardcode after
//     inspecting the game's resource creation in RenderDoc)
//   • The texture MUST use a LINEAR sampler — the B-spline leverages
//     hardware bilinear/trilinear interpolation to reduce from 64/16
//     point samples to 8/4 filtered taps
//   • For opacity-aware variants: the fog texture must store inscatter
//     in RGB and opacity (or 1−transmittance) in A
// ============================================================================

// --- 1.8a  Cubic B-Spline Basis Weights --------------------------------
//
// Computes the four uniform cubic B-spline basis function values for
// fractional position `t` ∈ [0,1] within a texel/voxel.
//
//   w₀(t) = (1−t)³ / 6              — sample at texel offset −1
//   w₁(t) = (3t³ − 6t² + 4) / 6     — sample at texel offset  0
//   w₂(t) = (−3t³ + 3t² + 3t + 1)/6 — sample at texel offset +1
//   w₃(t) = t³ / 6                   — sample at texel offset +2
//
// These sum to exactly 1.0 for all t (partition of unity).
//
// `t`:      Fractional position within a texel [0,1).
// Returns:  float4(w₀, w₁, w₂, w₃).
float4 CubicBSplineWeights(float t) {
  float t2 = t * t;
  float t3 = t2 * t;
  float omt = 1.0 - t;
  return float4(
    omt * omt * omt,                            // w₀ = (1−t)³
    3.0 * t3 - 6.0 * t2 + 4.0,                  // w₁
    -3.0 * t3 + 3.0 * t2 + 3.0 * t + 1.0,       // w₂
    t3                                           // w₃
  ) / 6.0;
}

// --- 1.8b  Bicubic B-Spline Texture2D Sampling -------------------------
//
// Samples a Texture2D with cubic B-spline filtering using 4 bilinear taps
// instead of the naïve 16 point samples.  The technique groups the 4
// B-spline weights per axis into 2 pairs and places each bilinear tap at
// the weighted midpoint so the hardware interpolation produces the exact
// weighted combination:
//
//   g₀ = w₀ + w₁      g₁ = w₂ + w₃
//   h₀ = −w₀ / g₀     h₁ = (w₂ + 2·w₃) / g₁
//
// where h₀, h₁ are texel-space offsets from the floor position.
//
// This is the 2D variant, suitable for games that resolve their 3D fog
// volume to a 2D screen-space haze buffer before compositing.
//
// Reference:  Sigg & Hadwiger 2005 (GPU Gems 2, Ch. 20)
//             Ruijters, ter Haar Romeny & Suetens 2008
//
// `tex`:      2D texture to sample.
// `samp`:     Sampler with LINEAR filtering (MUST be bilinear, not point).
// `uv`:       Normalised texture coordinates [0,1]².
// `texSize`:  Texture dimensions in texels (e.g. float2(1920, 1080)).
// Returns:    Bicubic-filtered float4.
float4 SampleBicubicBSpline(
    Texture2D    tex,
    SamplerState samp,
    float2       uv,
    float2       texSize
) {
  // Convert to texel coords; find integer + fractional parts
  float2 coord  = uv * texSize - 0.5;
  float2 f      = frac(coord);
  float2 icoord = floor(coord) + 0.5;  // center of floor texel

  // B-spline weights for each axis
  float4 wx = CubicBSplineWeights(f.x);
  float4 wy = CubicBSplineWeights(f.y);

  // Grouped tap weights
  float2 g0 = float2(wx.x + wx.y, wy.x + wy.y);
  float2 g1 = float2(wx.z + wx.w, wy.z + wy.w);

  // Tap offsets in texel space from icoord
  float2 h0 = float2(-wx.x / g0.x, -wy.x / g0.y);
  float2 h1 = float2((wx.z + 2.0 * wx.w) / g1.x,
                      (wy.z + 2.0 * wy.w) / g1.y);

  // Convert to normalised UVs
  float2 texel = 1.0 / texSize;
  float2 p00 = (icoord + float2(h0.x, h0.y)) * texel;
  float2 p10 = (icoord + float2(h1.x, h0.y)) * texel;
  float2 p01 = (icoord + float2(h0.x, h1.y)) * texel;
  float2 p11 = (icoord + float2(h1.x, h1.y)) * texel;

  // Weighted sum of 4 bilinear taps
  return g0.x * g0.y * tex.SampleLevel(samp, p00, 0)
       + g1.x * g0.y * tex.SampleLevel(samp, p10, 0)
       + g0.x * g1.y * tex.SampleLevel(samp, p01, 0)
       + g1.x * g1.y * tex.SampleLevel(samp, p11, 0);
}

// --- 1.8c  Tricubic B-Spline Texture3D Sampling ------------------------
//
// Samples a Texture3D with cubic B-spline filtering using 8 trilinear taps
// instead of 64 point samples.  Same principle as 1.8b extended to 3D.
//
// *** This is the primary function for improving volumetric fog quality.
//     Replace the game's trilinear Texture3D.Sample / SampleLevel call in
//     the fog compositing shader with this function. ***
//
// Cost vs trilinear:    8× texture bandwidth, negligible ALU overhead.
// Cost vs full tricubic: 8× vs 64× samples — massive saving.
// Quality:  eliminates voxel block boundaries.  The B-spline kernel has C²
//           continuity (continuous 1st and 2nd derivatives).
//
// `tex`:      3D fog volume texture.
// `samp`:     Sampler with LINEAR filtering (MUST be trilinear, not point).
// `uvw`:      Normalised 3D texture coordinates [0,1]³.
// `texSize`:  Volume dimensions in voxels (e.g. float3(160, 90, 64)).
// Returns:    Tricubic-filtered float4 (typically RGB = inscatter, A = α).
float4 SampleTricubicBSpline(
    Texture3D    tex,
    SamplerState samp,
    float3       uvw,
    float3       texSize
) {
  float3 coord  = uvw * texSize - 0.5;
  float3 f      = frac(coord);
  float3 icoord = floor(coord) + 0.5;

  float4 wx = CubicBSplineWeights(f.x);
  float4 wy = CubicBSplineWeights(f.y);
  float4 wz = CubicBSplineWeights(f.z);

  float3 g0 = float3(wx.x + wx.y, wy.x + wy.y, wz.x + wz.y);
  float3 g1 = float3(wx.z + wx.w, wy.z + wy.w, wz.z + wz.w);

  float3 h0 = float3(-wx.x / g0.x,
                     -wy.x / g0.y,
                     -wz.x / g0.z);
  float3 h1 = float3((wx.z + 2.0 * wx.w) / g1.x,
                     (wy.z + 2.0 * wy.w) / g1.y,
                     (wz.z + 2.0 * wz.w) / g1.z);

  float3 voxel = 1.0 / texSize;

  // 8 trilinear tap positions (all 2³ combinations of h0/h1 per axis)
  float3 p000 = (icoord + float3(h0.x, h0.y, h0.z)) * voxel;
  float3 p100 = (icoord + float3(h1.x, h0.y, h0.z)) * voxel;
  float3 p010 = (icoord + float3(h0.x, h1.y, h0.z)) * voxel;
  float3 p110 = (icoord + float3(h1.x, h1.y, h0.z)) * voxel;
  float3 p001 = (icoord + float3(h0.x, h0.y, h1.z)) * voxel;
  float3 p101 = (icoord + float3(h1.x, h0.y, h1.z)) * voxel;
  float3 p011 = (icoord + float3(h0.x, h1.y, h1.z)) * voxel;
  float3 p111 = (icoord + float3(h1.x, h1.y, h1.z)) * voxel;

  return g0.x * g0.y * g0.z * tex.SampleLevel(samp, p000, 0)
       + g1.x * g0.y * g0.z * tex.SampleLevel(samp, p100, 0)
       + g0.x * g1.y * g0.z * tex.SampleLevel(samp, p010, 0)
       + g1.x * g1.y * g0.z * tex.SampleLevel(samp, p110, 0)
       + g0.x * g0.y * g1.z * tex.SampleLevel(samp, p001, 0)
       + g1.x * g0.y * g1.z * tex.SampleLevel(samp, p101, 0)
       + g0.x * g1.y * g1.z * tex.SampleLevel(samp, p011, 0)
       + g1.x * g1.y * g1.z * tex.SampleLevel(samp, p111, 0);
}

// --- 1.8d  Volumetric Haze Compositing ---------------------------------
//
// Standard front-to-back compositing of volumetric haze over a scene:
//
//   result = scene · transmittance + inscatter
//          = scene · (1 − opacity)  + inscatter
//
// Most games use this formula in their fog compositing pass.  The inscatter
// is assumed to be pre-multiplied (already includes the phase function and
// single-scattering integral).
//
// `sceneColor`:   Background scene radiance before fog.
// `inscatter`:    Accumulated in-scattered light (RGB) from the fog volume.
// `opacity`:      Fog opacity [0,1] where 1 = fully opaque fog.
// Returns:        Final composited colour.
float3 CompositeVolumetricHaze(float3 sceneColor,
                               float3 inscatter,
                               float  opacity) {
  return sceneColor * (1.0 - opacity) + inscatter;
}

// --- 1.8e  Inscatter / Opacity Decomposition & Recomposition -----------
//
// GoT's core haze-AA insight: dividing inscattered radiance by opacity
// before filtering yields a much smoother signal that aliases far less.
//
// Mathematical justification (Patry, SIGGRAPH 2021):
//   Assume σ_s(x) = c·σ_e(x)  (scattering proportional to extinction).
//   Start from the volume rendering equation:
//
//     L(d) = ∫₀ᵈ σ_s(x) · exp(−∫₀ˣ σ_e(t) dt) · L_i(x) dx
//
//   Substitute σ_s = c·σ_e and assume L_i(x) ≈ L̄_i (slowly varying):
//
//     L̃(d) = c · L̄_i(d) · ∫₀ᵈ σ_e(x) · exp(−∫₀ˣ σ_e(t) dt) dx
//           = c · L̄_i(d) · [1 − exp(−∫₀ᵈ σ_e(t) dt)]
//           = c · L̄_i(d) · α(d)
//
//   Therefore  L/α ≈ c·L̄_i ≈ nearly constant.
//
//   Since L/α is nearly constant while L and α individually vary rapidly,
//   filtering L/α introduces far less aliasing than filtering L directly.
//
// Usage in a fog compositing shader replacement:
//
//   // For each tap of your filter (tricubic, bilateral, etc.):
//   float4 fogSample = fogTex.SampleLevel(samp, uvw, 0);
//   float3 ratio     = HazeDecompose(fogSample.rgb, fogSample.a);
//   ratioAccum      += weight * ratio;
//   alphaAccum      += weight * fogSample.a;
//   // After filtering:
//   float3 finalInscatter = HazeRecompose(ratioAccum, alphaAccum);

// Decompose:  returns L/α (inscatter divided by opacity).
// `inscatter`:  RGB inscattered radiance.
// `opacity`:    Fog opacity (alpha).  Clamped to avoid division by zero.
float3 HazeDecompose(float3 inscatter, float opacity) {
  return inscatter / max(opacity, 1e-5);
}

// Recompose:  returns L = (L/α) · α.
// `inscatterOverOpacity`:  Filtered L/α ratio.
// `opacity`:               Filtered opacity.
float3 HazeRecompose(float3 inscatterOverOpacity, float opacity) {
  return inscatterOverOpacity * opacity;
}

// --- 1.8f  Opacity-Aware Bicubic Haze Sampling (2D) --------------------
//
// Bicubic B-spline sampling with inscatter/opacity separation for 2D
// resolved fog buffers.  For each of the 4 bilinear taps:
//   1. Sample RGBA  (RGB = inscatter, A = opacity)
//   2. Decompose: ratio = L / α
//   3. Accumulate ratio and α with B-spline weights
// After all taps: recompose final L = filtered(L/α) · filtered(α).
//
// This is the recommended function when a game resolves its volumetric
// fog to a 2D screen-space buffer (common in forward renderers and
// older deferred pipelines).
//
// `tex`:      2D fog buffer (RGB = inscatter, A = opacity).
// `samp`:     LINEAR sampler.
// `uv`:       Normalised texture coordinates [0,1]².
// `texSize`:  Texture dimensions in texels.
// Returns:    float4(filtered_inscatter.rgb, filtered_opacity).
float4 SampleBicubicBSplineHaze(
    Texture2D    tex,
    SamplerState samp,
    float2       uv,
    float2       texSize
) {
  float2 coord  = uv * texSize - 0.5;
  float2 f      = frac(coord);
  float2 icoord = floor(coord) + 0.5;

  float4 wx = CubicBSplineWeights(f.x);
  float4 wy = CubicBSplineWeights(f.y);

  float2 g0 = float2(wx.x + wx.y, wy.x + wy.y);
  float2 g1 = float2(wx.z + wx.w, wy.z + wy.w);

  float2 h0 = float2(-wx.x / g0.x, -wy.x / g0.y);
  float2 h1 = float2((wx.z + 2.0 * wx.w) / g1.x,
                      (wy.z + 2.0 * wy.w) / g1.y);

  float2 texel = 1.0 / texSize;
  float2 taps[4];
  taps[0] = (icoord + float2(h0.x, h0.y)) * texel;
  taps[1] = (icoord + float2(h1.x, h0.y)) * texel;
  taps[2] = (icoord + float2(h0.x, h1.y)) * texel;
  taps[3] = (icoord + float2(h1.x, h1.y)) * texel;

  float weights[4];
  weights[0] = g0.x * g0.y;
  weights[1] = g1.x * g0.y;
  weights[2] = g0.x * g1.y;
  weights[3] = g1.x * g1.y;

  float3 ratioSum = 0;
  float  alphaSum = 0;

  [unroll] for (int i = 0; i < 4; i++) {
    float4 s = tex.SampleLevel(samp, taps[i], 0);
    ratioSum += weights[i] * HazeDecompose(s.rgb, s.a);
    alphaSum += weights[i] * s.a;
  }

  return float4(HazeRecompose(ratioSum, alphaSum), alphaSum);
}

// --- 1.8g  Opacity-Aware Tricubic Haze Sampling (3D) -------------------
//
// The full GoT-quality pipeline in a single call:
//   tricubic B-spline  +  inscatter/opacity separation
//
// For each of the 8 trilinear taps:
//   1. Sample RGBA  (RGB = inscatter, A = opacity)
//   2. Decompose: ratio = L / α
//   3. Accumulate ratio and α with B-spline weights
// After all taps: recompose final L = filtered(L/α) · filtered(α).
//
// *** This is the recommended function for maximum volumetric fog quality
//     improvement in RenoDX game mods.  It combines both anti-aliasing
//     techniques in a single pass at 8 trilinear-tap cost. ***
//
// `tex`:      3D fog volume texture (RGB = inscatter, A = opacity).
// `samp`:     LINEAR sampler.
// `uvw`:      Normalised 3D texture coordinates [0,1]³.
// `texSize`:  Volume dimensions in voxels (e.g. float3(160, 90, 64)).
// Returns:    float4(filtered_inscatter.rgb, filtered_opacity).
float4 SampleTricubicBSplineHaze(
    Texture3D    tex,
    SamplerState samp,
    float3       uvw,
    float3       texSize
) {
  float3 coord  = uvw * texSize - 0.5;
  float3 f      = frac(coord);
  float3 icoord = floor(coord) + 0.5;

  float4 wx = CubicBSplineWeights(f.x);
  float4 wy = CubicBSplineWeights(f.y);
  float4 wz = CubicBSplineWeights(f.z);

  float3 g0 = float3(wx.x + wx.y, wy.x + wy.y, wz.x + wz.y);
  float3 g1 = float3(wx.z + wx.w, wy.z + wy.w, wz.z + wz.w);

  float3 h0 = float3(-wx.x / g0.x,
                     -wy.x / g0.y,
                     -wz.x / g0.z);
  float3 h1 = float3((wx.z + 2.0 * wx.w) / g1.x,
                     (wy.z + 2.0 * wy.w) / g1.y,
                     (wz.z + 2.0 * wz.w) / g1.z);

  float3 voxel = 1.0 / texSize;

  float3 positions[8];
  positions[0] = (icoord + float3(h0.x, h0.y, h0.z)) * voxel;
  positions[1] = (icoord + float3(h1.x, h0.y, h0.z)) * voxel;
  positions[2] = (icoord + float3(h0.x, h1.y, h0.z)) * voxel;
  positions[3] = (icoord + float3(h1.x, h1.y, h0.z)) * voxel;
  positions[4] = (icoord + float3(h0.x, h0.y, h1.z)) * voxel;
  positions[5] = (icoord + float3(h1.x, h0.y, h1.z)) * voxel;
  positions[6] = (icoord + float3(h0.x, h1.y, h1.z)) * voxel;
  positions[7] = (icoord + float3(h1.x, h1.y, h1.z)) * voxel;

  float weights[8];
  weights[0] = g0.x * g0.y * g0.z;
  weights[1] = g1.x * g0.y * g0.z;
  weights[2] = g0.x * g1.y * g0.z;
  weights[3] = g1.x * g1.y * g0.z;
  weights[4] = g0.x * g0.y * g1.z;
  weights[5] = g1.x * g0.y * g1.z;
  weights[6] = g0.x * g1.y * g1.z;
  weights[7] = g1.x * g1.y * g1.z;

  float3 ratioSum = 0;
  float  alphaSum = 0;

  [unroll] for (int i = 0; i < 8; i++) {
    float4 s = tex.SampleLevel(samp, positions[i], 0);
    ratioSum += weights[i] * HazeDecompose(s.rgb, s.a);
    alphaSum += weights[i] * s.a;
  }

  return float4(HazeRecompose(ratioSum, alphaSum), alphaSum);
}

// ============================================================================
// 1.9  Bent Normal Shadows
// ----------------------------------------------------------------------------
// Reference: ExileCon 2023 — "Rendering Path of Exile 2" (Alexander Sannikov)
//
// Uses baked occlusion directionality to create cheap, stable directional
// self-shadowing at texture-level detail.
//
// The bent normal is the average unoccluded direction at a surface point.
// Combined with the AO value (which defines the cone aperture of unoccluded
// directions), you can test whether a light direction falls inside or
// outside the visibility cone — producing texture-resolution directional
// shadows at near-zero runtime cost.
//
// Core idea:
//   • AO stores how much of the hemisphere is occluded.
//   • Bent normal stores the average unoccluded direction.
//   • AO defines a visibility cone aperture around the bent normal.
//   • If the light direction falls outside the cone, attenuate direct light.
//
// Two practical variants are provided:
//   a) Full        — uses a true bent normal map.
//   b) Approximate — uses surface normal as a bent-normal proxy when only AO
//                    is available (common in injected titles).
//
// Notes:
//   • AO convention in this file: 0 = fully occluded, 1 = unoccluded.
//   • AO-to-cone mapping uses: cos(thetaCone) = 1 - AO.
//
// This is designed to complement, not replace, conventional shadow maps:
//   • Shadow maps: macro shadows (characters/buildings/terrain).
//   • Bent normal shadows: micro/material self-occlusion detail.
// ============================================================================

// ---------------------------------------------------------------------------
// 1.9a  Bent Normal Shadow (Full)
// ---------------------------------------------------------------------------
// Readable reference implementation using acos().
//
// Given a bent normal direction and AO-derived cone angle, evaluates
// whether the light direction is within the unoccluded visibility cone.
//
// The cone half-angle is derived from AO:
//   θ_cone = acos(1 - AO)
// This follows from the relationship: AO ≈ 1 - cos(θ_cone) for a
// uniformly-distributed visibility cone.
//
// Parameters:
//   bentNormal  – average unoccluded direction (normalized)
//   lightDir    – direction TO the light (normalized)
//   ao          – ambient occlusion [0,1]
//   softnessRad – penumbra width in radians (default 0.2)
//
// Returns: visibility [0,1], multiply into direct lighting.
// ---------------------------------------------------------------------------
float BentNormalShadow(
    float3 bentNormal,
    float3 lightDir,
    float  ao,
    float  softnessRad = 0.2)
{
  float aoClamped = saturate(ao);
  float coneAngle = acos(saturate(1.0 - aoClamped));
  float lightAngle = acos(clamp(dot(bentNormal, lightDir), -1.0, 1.0));

  return 1.0 - smoothstep(coneAngle - softnessRad,
                          coneAngle + softnessRad,
                          lightAngle);
}

// ---------------------------------------------------------------------------
// 1.9b  Bent Normal Shadow (cosine-space fast path)
// ---------------------------------------------------------------------------
// Performance-friendly version that avoids acos().
//
// Parameters:
//   bentNormal – average unoccluded direction (normalized)
//   lightDir   – direction TO the light (normalized)
//   ao         – ambient occlusion [0,1]
//   cosMargin  – transition width in cosine space (default 0.15)
//
// Returns: visibility [0,1], multiply into direct lighting.
// ---------------------------------------------------------------------------
float BentNormalShadowFast(
    float3 bentNormal,
    float3 lightDir,
    float  ao,
    float  cosMargin = 0.15)
{
  float aoClamped = saturate(ao);
  float cosCone = 1.0 - aoClamped;
  float cosLight = clamp(dot(bentNormal, lightDir), -1.0, 1.0);

  return smoothstep(cosCone - cosMargin,
                    cosCone + cosMargin,
                    cosLight);
}

// ---------------------------------------------------------------------------
// 1.9c  Bent Normal Shadow Approximation (no bent-normal map)
// ---------------------------------------------------------------------------
// Uses the surface normal as a proxy for bent normal when directional bent
// occlusion data is unavailable.
//
//   • AO-modulated NdotL softening at crevices
//   • Darkening near occluded areas that responds to light direction
//   • Better visual grounding than flat AO × diffuse
//
// The normal-as-bent-normal assumption is reasonable for:
//   • Flat or gently curved surfaces (floors, walls, terrain)
//   • Surfaces where occlusion is roughly symmetric around the normal
//
// It breaks down for:
//   • Deep crevices where the true bent normal points sideways
//   • Interior corners where AO is high but the unoccluded direction
//     is strongly skewed away from the surface normal
//
// Parameters:
//   surfaceNormal – shading normal (normalized)
//   lightDir      – direction TO the light (normalized)
//   ao            – ambient occlusion [0,1]
//   cosMargin     – transition width in cosine space (default 0.15)
//   strength      – blend amount [0,1], recommended 0.3–0.6
//
// Returns: visibility [0,1], multiply into direct lighting.
// ---------------------------------------------------------------------------
float BentNormalShadowApprox(
    float3 surfaceNormal,
    float3 lightDir,
    float  ao,
    float  cosMargin = 0.15,
    float  strength  = 0.5)
{
  float visibility = BentNormalShadowFast(surfaceNormal, lightDir, ao, cosMargin);
  return lerp(1.0, visibility, saturate(strength));
}

// ---------------------------------------------------------------------------
// 1.9d  Bent Normal Specular Occlusion
// ---------------------------------------------------------------------------
// Attenuates specular IBL based on the bent normal and AO, similar to
// horizon occlusion (§1.6g) but using baked data instead of runtime
// vertex/pixel normal comparison.
//
// The reflection vector is tested against the visibility cone — if the
// specular lobe extends outside the unoccluded region, specular is
// attenuated.
//
// This pairs well with the diffuse bent normal shadow to provide
// consistent direct + indirect occlusion from a single data source.
//
// Parameters:
//   bentNormal – average unoccluded direction (normalized)
//   R          – reflection direction (normalized)
//   ao         – ambient occlusion [0,1]
//   roughness  – perceptual roughness [0,1], relaxes occlusion at high roughness
//
// Returns: specular visibility [0,1], multiply into specular IBL.
// ---------------------------------------------------------------------------
float BentNormalSpecularOcclusion(
    float3 bentNormal,
    float3 R,
    float  ao,
    float  roughness)
{
  float aoClamped = saturate(ao);
  float cosCone = 1.0 - aoClamped;
  float cosR = clamp(dot(bentNormal, R), -1.0, 1.0);

  float threshold = lerp(cosCone, -1.0, saturate(roughness * roughness));
  return smoothstep(threshold - 0.1, threshold + 0.1, cosR);
}

// ---------------------------------------------------------------------------
// 1.9e  Specular Occlusion from Ambient Occlusion
// ---------------------------------------------------------------------------
// Lagarde & de Rousiers, "Moving Frostbite to PBR" (2014):
//   Derives a specular occlusion term from the ambient occlusion value,
//   view angle, and roughness.
//
// The insight: a narrow specular lobe on a smooth surface is more likely
// to be occluded than a wide lobe on a rough surface, because the wide
// lobe integrates over more of the hemisphere and is more likely to
// "see" unoccluded directions.
//
// The formula uses AO as a proxy for the fraction of visible hemisphere.
// Combined with NdotV and roughness, it modulates specular IBL to
// reduce light leaking in occluded areas (crevices, corners, under
// overhangs) where the environment map reflection should be attenuated.
//
// This is the standard fix for the "oily specular" artifact where
// environment map reflections appear at full strength in areas that
// should be in shadow.
//
// Parameters:
//   NdotV     – dot(normal, viewDir), clamped to [0,1]
//   ao        – ambient occlusion [0,1] (0 = fully occluded, 1 = unoccluded)
//   roughness – perceptual roughness [0,1]
//
// Returns: specular occlusion [0,1], multiply into specular IBL.
// ---------------------------------------------------------------------------
float SpecularOcclusionFromAO(float NdotV, float ao, float roughness) {
  return saturate(pow(NdotV + ao, exp2(-16.0 * roughness - 1.0)) - 1.0 + ao);
}

// ---------------------------------------------------------------------------
// 1.9f  Screen-Space Bent Normal Computation
// ---------------------------------------------------------------------------
// Inspired by "Ray Tracing the World of Assassin's Creed Shadows"
// (SIGGRAPH 2025).
//
// Computes a bent normal AND AO simultaneously from the depth + normal
// G-buffers by sampling the hemisphere around each pixel.  This is the
// runtime equivalent of a baked bent normal map — producing the data
// that §1.9a–d consume.
//
// Existing §1.9a–d assume the bent normal is already available (from a
// baked map or using the surface normal as proxy).  This function
// PRODUCES the bent normal at runtime in screen space, capturing
// scene-scale occlusion (walls, furniture, terrain) that baked maps
// or surface-normal proxies cannot represent.
//
// The algorithm is essentially GTAO/HBAO with an extra accumulator:
// alongside the per-sample occlusion test, each unoccluded sample
// direction is accumulated and averaged to yield the bent normal.
// Cost is near-zero on top of an existing AO pass — just one extra
// float3 accumulator.
//
// The output bent normal and AO can then be passed directly to:
//   • §1.9a/b  BentNormalShadow      → direct light occlusion
//   • §1.9d    BentNormalSpecularOcclusion → specular IBL occlusion
//   • §1.9g    BentNormalIndirectDiffuse   → redirected indirect sampling
//   • §1.9h    CosineWeightedSpecularOcclusion → improved specular occlusion
//
// REQUIREMENTS:
//   • Depth buffer (Texture2D<float>)      — always available
//   • G-buffer normals (Texture2D<float4>) — identify in RenderDoc
//   • Screen-space UV and texel size
//
// Parameters:
//   depthBuffer    – depth SRV (hardware depth, reversed-Z assumed)
//   normalBuffer   – G-buffer world-space normals SRV
//   pointSampler   – point-clamp sampler
//   pixelUV        – current pixel UV [0,1]²
//   texelSize      – float2(1.0/width, 1.0/height)
//   projParams     – float4(near, far, aspect, fovScale) for depth
//                    linearisation and view-space reconstruction
//   sampleCount    – number of hemisphere directions to test (default 16).
//                    More = better quality but more texture reads.
//   sampleRadius   – maximum search radius in UV space (default 0.03).
//                    Controls the spatial scale of occlusion captured.
//   depthBias      – minimum depth difference to count as an occluder
//                    (default 0.0001).  Prevents self-occlusion.
//   maxDepthDiff   – maximum depth difference before a sample is
//                    considered a separate surface (default 0.05).
//                    Prevents distant background from occluding.
//   frameIndex     – current frame counter for temporal jitter rotation.
//
// Outputs via inout:
//   outBentNormal  – average unoccluded direction (normalised, world space)
//   outAO          – ambient occlusion [0 = fully occluded, 1 = unoccluded]
// ---------------------------------------------------------------------------
void ComputeScreenSpaceBentNormal(
    Texture2D<float>  depthBuffer,
    Texture2D<float4> normalBuffer,
    SamplerState      pointSampler,
    float2            pixelUV,
    float2            texelSize,
    float4            projParams,
    int               sampleCount,
    float             sampleRadius,
    float             depthBias,
    float             maxDepthDiff,
    uint              frameIndex,
    inout float3      outBentNormal,
    inout float       outAO)
{
  float  centerDepth = depthBuffer.SampleLevel(pointSampler, pixelUV, 0);
  float3 centerN     = normalize(normalBuffer.SampleLevel(pointSampler, pixelUV, 0).xyz);

  // Linearise center depth (reversed-Z: near=1, far=0).
  float linearCenter = projParams.x * projParams.y
                     / (projParams.y - centerDepth * (projParams.y - projParams.x));

  float3 bentAccum = 0.0;
  float  occluded  = 0.0;

  // Golden angle rotation for well-distributed samples.
  float goldenAngle = 2.39996323;
  // Per-frame jitter to enable temporal accumulation.
  float jitter = frac(0.6180339887 * (float)frameIndex);

  for (int i = 0; i < sampleCount; i++) {
    // Distribute samples via golden spiral on the hemisphere.
    float fi     = (float)i + 0.5;
    float angle  = fi * goldenAngle + jitter * 6.28318530;
    float radius = (fi / (float)sampleCount) * sampleRadius;

    float2 offset   = float2(cos(angle), sin(angle)) * radius;
    float2 sampleUV = pixelUV + offset;

    // Skip out-of-bounds.
    if (any(sampleUV < 0.0) || any(sampleUV > 1.0)) continue;

    float sampleDepth = depthBuffer.SampleLevel(pointSampler, sampleUV, 0);

    // Linearise sample depth.
    float linearSample = projParams.x * projParams.y
                       / (projParams.y - sampleDepth * (projParams.y - projParams.x));

    float depthDiff = linearCenter - linearSample;  // positive = sample is closer

    // Build a direction from center to sample in view-aligned space.
    // Approximate: treat UV offset as proportional to view-space XY.
    float3 sampleDir = normalize(float3(offset / texelSize * 0.001, -depthDiff));

    // Project onto hemisphere: only consider directions in the normal's hemisphere.
    float NdotS = dot(centerN, sampleDir);
    if (NdotS < 0.0) {
      sampleDir = sampleDir - 2.0 * NdotS * centerN;
      NdotS = -NdotS;
    }

    // Occlusion test: sample is an occluder if it's closer to the camera
    // AND within the valid depth range.
    bool isOccluder = (depthDiff > depthBias) && (depthDiff < maxDepthDiff);

    if (isOccluder) {
      occluded += 1.0;
    } else {
      // Accumulate unoccluded direction (cosine-weighted by hemisphere alignment).
      bentAccum += sampleDir * NdotS;
    }
  }

  float totalSamples = (float)sampleCount;
  outAO = 1.0 - (occluded / totalSamples);

  // Normalise bent accumulator.  Fall back to surface normal if all
  // samples were occluded or the accumulator is near zero.
  float bentLen = length(bentAccum);
  outBentNormal = (bentLen > 1e-6) ? (bentAccum / bentLen) : centerN;
}

// Convenience overload with common defaults.
void ComputeScreenSpaceBentNormal(
    Texture2D<float>  depthBuffer,
    Texture2D<float4> normalBuffer,
    SamplerState      pointSampler,
    float2            pixelUV,
    float2            texelSize,
    float4            projParams,
    uint              frameIndex,
    inout float3      outBentNormal,
    inout float       outAO)
{
  ComputeScreenSpaceBentNormal(
    depthBuffer, normalBuffer, pointSampler,
    pixelUV, texelSize, projParams,
    16,       // sampleCount
    0.03,     // sampleRadius
    0.0001,   // depthBias
    0.05,     // maxDepthDiff
    frameIndex,
    outBentNormal, outAO);
}

// ---------------------------------------------------------------------------
// 1.9g  Bent Normal Indirect Diffuse Redirection
// ---------------------------------------------------------------------------
// Inspired by "Ray Tracing the World of Assassin's Creed Shadows"
// (SIGGRAPH 2025).
//
// Uses a screen-space bent normal (from §1.9f or a baked source) to
// REDIRECT the indirect diffuse probe/cubemap lookup direction instead
// of just attenuating it.
//
// Standard AO workflow:
//   indirectDiffuse = probe.Sample(surfaceNormal) * ao;
//   → Correct brightness, WRONG direction.  A pixel in a corner gets
//     dimmed sky light, but the sky sample direction is still straight
//     up — it should be sampling toward the opening.
//
// AC Shadows workflow:
//   indirectDiffuse = probe.Sample(bentNormal) * ao;
//   → Correct brightness AND correct direction.  The probe is sampled
//     from where light actually arrives, which can be a completely
//     different color (e.g., warm wall bounce vs. cold sky).
//
// This function blends between the surface normal and the bent normal
// for the probe lookup direction, controlled by strength and AO.
// A partial blend is recommended — full redirection can look strange
// in low-sample-count screen-space bent normals due to noise.
//
// Pairs naturally with:
//   • §1.9f  ComputeScreenSpaceBentNormal → produces the bent normal
//   • §1.2a/b  ParallaxCorrectBox/Sphere  → applied to the redirected dir
//   • §1.2c  ProbeMipFromRoughness        → mip selection uses roughness
//   • §1.6f  SimpleAmbientBounce          → bounce term for the redirected
//                                           indirect diffuse
//
// Parameters:
//   surfaceNormal – shading normal (normalized)
//   bentNormal    – average unoccluded direction (normalized), from §1.9f
//                   or a baked bent normal map
//   ao            – ambient occlusion [0,1]
//   strength      – blend toward bent normal [0,1] (default 0.7)
//                   0 = always use surface normal (standard AO)
//                   1 = always use bent normal (full redirection)
//                   0.5–0.8 is recommended for screen-space bent normals
//                   to mask temporal noise.
//
// Returns:  redirected probe lookup direction (normalised).
//
// Usage:
//   float3 bentN; float ao;
//   renodx::rendering::ComputeScreenSpaceBentNormal(
//       depthBuf, normalBuf, samp, uv, texelSize, proj, frame, bentN, ao);
//
//   float3 probeDir = renodx::rendering::BentNormalIndirectDiffuse(
//       surfaceNormal, bentN, ao);
//   float3 indirect = probe.SampleLevel(samp, probeDir, maxMip).rgb * ao;
// ---------------------------------------------------------------------------
float3 BentNormalIndirectDiffuse(
    float3 surfaceNormal,
    float3 bentNormal,
    float  ao,
    float  strength = 0.7)
{
  // Scale redirection by AO: fully unoccluded pixels don't need
  // redirection (bent normal ≈ surface normal anyway).  Only occluded
  // pixels benefit from the directional shift.
  float blendFactor = strength * (1.0 - saturate(ao));

  float3 redirected = normalize(lerp(surfaceNormal, bentNormal, blendFactor));
  return redirected;
}

// ---------------------------------------------------------------------------
// 1.9h  Cosine-Weighted Specular Occlusion
// ---------------------------------------------------------------------------
// Inspired by "Ray Tracing the World of Assassin's Creed Shadows"
// (SIGGRAPH 2025).
//
// An improved specular occlusion formula that accounts for the angular
// relationship between the bent normal, reflection vector, AND the GGX
// specular lobe width simultaneously — with cosine weighting for
// energy-correct attenuation.
//
// Compared to §1.9d (BentNormalSpecularOcclusion), which uses a simple
// threshold-based cone test:
//   • This version computes the OVERLAP between the visibility cone
//     (defined by bent normal + AO) and the specular lobe (defined by
//     reflection vector + roughness).
//   • Cosine weighting ensures directions closer to the bent normal
//     (where more light arrives) contribute more.
//   • The roughness-dependent transition means smooth surfaces get
//     sharper occlusion (narrow lobe, easy to fully occlude) while
//     rough surfaces get softer occlusion (wide lobe, harder to
//     fully block).
//
// Pairs with:
//   • §1.9f  ComputeScreenSpaceBentNormal → runtime bent normal source
//   • §1.9d  BentNormalSpecularOcclusion  → simpler alternative
//   • §1.9e  SpecularOcclusionFromAO      → fallback when no bent normal
//   • §1.6g  HorizonOcclusion             → complementary vertex-normal-based
//                                           occlusion (use both for best results)
//
// Parameters:
//   bentNormal – average unoccluded direction (normalised)
//   R          – reflection direction (normalised)
//   ao         – ambient occlusion [0,1]
//   roughness  – perceptual roughness [0,1]
//
// Returns:  specular occlusion [0,1], multiply into specular IBL.
//
// Usage:
//   float specOcc = renodx::rendering::CosineWeightedSpecularOcclusion(
//       bentNormal, R, ao, roughness);
//   specularIBL *= specOcc;
// ---------------------------------------------------------------------------
float CosineWeightedSpecularOcclusion(
    float3 bentNormal,
    float3 R,
    float  ao,
    float  roughness)
{
  float aoClamped = saturate(ao);

  // Visibility cone half-angle from AO.
  float coneAngle = acos(saturate(1.0 - aoClamped));

  // Angle between bent normal and reflection vector.
  float bentToR = acos(clamp(dot(bentNormal, R), -1.0, 1.0));

  // GGX specular lobe half-angle.
  // For a GGX NDF with roughness α, the half-angle containing ~80% of
  // the energy is approximately atan(α²).  We use α = roughness² (the
  // standard perceptual→linear conversion).
  float alpha = roughness * roughness;
  float lobeHalfAngle = atan(alpha * 0.5 + 1e-5);

  // Overlap: what fraction of the specular lobe falls inside the
  // visibility cone.  Mapped via smoothstep for a soft transition.
  float overlap = smoothstep(0.0, 2.0 * lobeHalfAngle,
                             coneAngle - bentToR + lobeHalfAngle);

  // Cosine weight: directions aligned with the bent normal carry more
  // energy.  At high roughness the lobe is wide, so we relax this
  // weighting — the specular integrates over a broad solid angle and
  // partial occlusion matters less.
  float cosWeight = saturate(dot(bentNormal, R));
  cosWeight = lerp(cosWeight, 1.0, saturate(roughness));

  return overlap * cosWeight;
}

// ============================================================================
// 1.10  Screen-Space Shadow Depth-Bias Micro Detail
// ----------------------------------------------------------------------------
// Based on the technique from Bend Studio (Days Gone, Apache License 2.0):
//   https://www.bendstudio.com
//
// Enhances existing screen-space shadow implementations with micro-detail
// shadowing derived from subtle depth buffer variations.
//
// Traditional screen-space shadows perform a binary depth comparison —
// either something is in front (shadowed) or it isn't.  This misses
// micro-scale self-shadowing from subtle depth variations on mostly-flat
// surfaces (brick grooves, armor panel edges, fabric folds, terrain bumps).
//
// The depth-bias technique introduces two key concepts:
//
//   1. Surface Thickness — instead of a binary "in front / behind" test,
//      occlusion is evaluated within a configurable depth window.  Only
//      depth differences that fall within [0, thickness] are considered
//      occluders.  This prevents far-away background geometry from
//      casting false shadows while detecting subtle nearby variations.
//
//   2. Shadow Contrast Ramp — within the thickness window, the shadow
//      contribution is a continuous function of the depth delta, not a
//      hard binary step.  This produces soft, graduated micro shadows
//      that look natural on gently curved or textured surfaces.
//
// Additionally, a bilinear edge threshold detects depth discontinuities
// (object silhouettes, hard edges) and suppresses shadow evaluation there,
// preventing striation artifacts from bilinear depth interpolation across
// edges.
//
// This technique can also improve:
//   • Ambient Occlusion (depth-aware micro AO)
//   • Decal projection (depth-tested soft boundaries)
//   • Snow/dust/water accumulation (depth-tested surface detection)
//
// Reference:
//   Bend Studio, "Screen-Space Shadows" (2023)
//
// Usage — integrating into an existing screen-space shadow ray march:
//
//   // Your existing ray march loop:
//   float shadow = 1.0;
//   for (int i = 0; i < stepCount; i++)
//   {
//     float2 sampleUV = startUV + direction * stepSize * i;
//     float  sampleDepth = depthTexture.SampleLevel(pointSampler, sampleUV, 0);
//
//     // --- REPLACE your binary depth test with this: ---
//
//     // Option A: single sample evaluation
//     shadow = min(shadow, renodx::rendering::DepthBiasShadow(
//         sampleDepth, startDepth, params));
//
//     // Option B: with edge detection (avoids silhouette artifacts)
//     float4 gatherDepth = depthTexture.Gather(pointSampler, sampleUV);
//     shadow = min(shadow, renodx::rendering::DepthBiasShadowFiltered(
//         gatherDepth, sampleDepth, startDepth, params));
//   }
// ============================================================================

// ---------------------------------------------------------------------------
// 1.10a  Depth-Bias Parameters
// ---------------------------------------------------------------------------
// Configuration structure for the depth-bias micro detail technique.
//
// All depth values are expected in the same space as the depth buffer
// being sampled (typically [0,1] reversed-Z where near=1, far=0).
//
// Members:
//   surfaceThickness  – maximum depth delta that counts as a valid occluder.
//                        Controls shadow "reach" into the surface.
//                        Expressed in depth buffer units.
//                        Start with 0.005 and scale by 2× up/down.
//                        Too large = background bleeds shadows onto foreground.
//                        Too small = no micro detail is captured.
//                        Default: 0.005
//
//   bilinearThreshold – depth discontinuity threshold for edge detection.
//                        When the depth range within a bilinear quad exceeds
//                        this value, the sample is classified as an edge and
//                        shadow evaluation is suppressed (returns 1.0 = lit).
//                        This prevents striation artifacts along silhouettes.
//                        Should be similar magnitude to surfaceThickness.
//                        Default: 0.005
//
//   shadowContrast    – controls how quickly the shadow ramps from lit to
//                        shadowed within the thickness window.
//                        Higher values = sharper micro shadows.
//                        Lower values  = softer, more diffuse darkening.
//                        Range: [0.5, 4.0], Default: 1.5
//
//   reverseZ          – true if the depth buffer uses reversed-Z
//                        (near=1, far=0).  Default: true
// ---------------------------------------------------------------------------
struct DepthBiasParams {
  float surfaceThickness;
  float bilinearThreshold;
  float shadowContrast;
  bool  reverseZ;
};

// ---------------------------------------------------------------------------
// Default factory — reversed-Z (most modern engines).
// ---------------------------------------------------------------------------
DepthBiasParams DefaultDepthBiasParams() {
  DepthBiasParams p;
  p.surfaceThickness  = 0.005;
  p.bilinearThreshold = 0.005;
  p.shadowContrast    = 1.5;
  p.reverseZ          = true;
  return p;
}

// ---------------------------------------------------------------------------
// Default factory — forward-Z (near=0, far=1).
// ---------------------------------------------------------------------------
DepthBiasParams DefaultDepthBiasParamsForwardZ() {
  DepthBiasParams p;
  p.surfaceThickness  = 0.005;
  p.bilinearThreshold = 0.005;
  p.shadowContrast    = 1.5;
  p.reverseZ          = false;
  return p;
}

// ---------------------------------------------------------------------------
// 1.10b  Linearize Depth for Bias Comparison
// ---------------------------------------------------------------------------
// Converts a raw depth buffer value to a linear [0,1] range where
// 0 = near plane and 1 = far plane, regardless of reversed-Z convention.
//
// This normalisation ensures the surfaceThickness comparison has
// consistent meaning regardless of depth direction.
//
// Note: This is a simplified flip for the shadow comparison.
//       For proper metric linearisation (z_near/z_far projection),
//       use the game's own linearisation.  This version is sufficient
//       for the within-window relative comparisons used here.
//
// Parameters:
//   rawDepth – depth buffer sample
//   params   – DepthBiasParams (uses reverseZ)
//
// Returns:  normalised depth [0 = near, 1 = far].
// ---------------------------------------------------------------------------
float LinearizeDepthForBias(float rawDepth, DepthBiasParams params) {
  return params.reverseZ ? (1.0 - rawDepth) : rawDepth;
}

// ---------------------------------------------------------------------------
// 1.10c  Depth-Bias Shadow Evaluation (Single Sample)
// ---------------------------------------------------------------------------
// Evaluates the micro-detail shadow contribution for a single depth sample
// along a screen-space shadow ray.
//
// This replaces the traditional binary depth comparison:
//   Traditional:  shadow = (sampleDepth < rayDepth) ? 0 : 1;
//   Depth-bias:   shadow = thickness-windowed continuous ramp
//
// Steps:
//   1. Compute signed depth delta between the sample and the ray origin.
//   2. If delta is outside [0, surfaceThickness] → fully lit (not a valid
//      occluder for this surface).
//   3. Within the window: ramp shadow via the contrast parameter.
//
// Parameters:
//   sampleDepth – depth buffer value at the current ray step position
//   originDepth – depth buffer value at the ray origin (shaded pixel)
//   params      – DepthBiasParams configuration
//
// Returns:  shadow factor [0 = fully shadowed, 1 = fully lit].
//           Take the minimum across all ray steps for the final shadow.
// ---------------------------------------------------------------------------
float DepthBiasShadow(
    float           sampleDepth,
    float           originDepth,
    DepthBiasParams params)
{
  float linSample = LinearizeDepthForBias(sampleDepth, params);
  float linOrigin = LinearizeDepthForBias(originDepth, params);

  // Positive delta = sample is farther from camera than origin,
  // i.e. the sample may be occluding the origin from the light.
  float depthDelta = linSample - linOrigin;
  float thickness  = params.surfaceThickness;

  // Outside the valid occluder window → fully lit.
  if (depthDelta < 0.0 || depthDelta > thickness)
    return 1.0;

  // Within the window: ramp from lit to shadowed.
  // depthDelta ≈ 0        → barely occluding → light shadow.
  // depthDelta ≈ thickness → deep in slab   → strong shadow.
  float t = depthDelta / max(thickness, 1e-7);
  return 1.0 - saturate(t * params.shadowContrast);
}

// ---------------------------------------------------------------------------
// 1.10d  Depth-Bias Shadow with Bilinear Edge Detection
// ---------------------------------------------------------------------------
// Same as 1.10c but additionally suppresses shadow evaluation at depth
// discontinuities (object silhouettes, hard geometry edges) to prevent
// striation artifacts from bilinear depth interpolation across edges.
//
// Uses the depth range within a 2×2 texel quad (Texture2D.Gather()) to
// detect discontinuities.  If the range exceeds bilinearThreshold, the
// sample is classified as an edge → returns 1.0 (fully lit).
//
// Parameters:
//   gatherDepth – depth values from Texture2D.Gather() (.xyzw = 4 texels)
//   sampleDepth – point-sampled or bilinear depth at the same location
//   originDepth – depth at the ray origin (shaded pixel)
//   params      – DepthBiasParams configuration
//
// Returns:  shadow factor [0 = fully shadowed, 1 = fully lit].
// ---------------------------------------------------------------------------
float DepthBiasShadowFiltered(
    float4          gatherDepth,
    float           sampleDepth,
    float           originDepth,
    DepthBiasParams params)
{
  float4 linGather = float4(
    LinearizeDepthForBias(gatherDepth.x, params),
    LinearizeDepthForBias(gatherDepth.y, params),
    LinearizeDepthForBias(gatherDepth.z, params),
    LinearizeDepthForBias(gatherDepth.w, params)
  );

  float quadMin   = min(min(linGather.x, linGather.y), min(linGather.z, linGather.w));
  float quadMax   = max(max(linGather.x, linGather.y), max(linGather.z, linGather.w));
  float quadRange = quadMax - quadMin;

  // Depth discontinuity → skip shadow evaluation to avoid striation.
  if (quadRange > params.bilinearThreshold)
    return 1.0;

  return DepthBiasShadow(sampleDepth, originDepth, params);
}

// ---------------------------------------------------------------------------
// 1.10e  Depth-Bias Shadow Ray March (Complete)
// ---------------------------------------------------------------------------
// A complete screen-space shadow ray march with depth-bias micro detail,
// designed to be called from a pixel shader with the depth buffer as SRV.
//
// Combines depth-bias evaluation (1.10c/d) with a configurable ray march:
//   • Step count and stride configuration
//   • Optional bilinear edge detection per step
//   • Hard shadow for the first N samples (crisp contact shadows)
//   • Fade-out for the last N samples (soft shadow termination)
//   • Early-out when full shadow is reached
//
// The ray direction should point FROM the pixel TOWARD the light in
// screen space (UV coordinates).  To compute:
//
//   float4 lightClip = mul(viewProj, float4(worldPos + lightDir, 1));
//   float2 lightUV   = lightClip.xy / lightClip.w * 0.5 + 0.5;
//   float2 rayDir    = normalize(lightUV - pixelUV);
//
// Parameters:
//   depthTexture    – depth buffer bound as SRV (Texture2D<float>)
//   pointSampler    – point-clamp sampler
//   pixelUV         – UV of the shaded pixel [0,1]²
//   rayDirUV        – normalised 2D direction toward light in UV space
//   originDepth     – depth buffer value at the shaded pixel
//   stepCount       – number of ray steps (default 32)
//   stepSize        – UV-space distance per step (default 0.001 ≈ 1px @1080p)
//   hardShadowSteps – initial steps with binary thresholding (default 4)
//   fadeOutSteps    – final steps with fade-out (default 8)
//   useEdgeDetect   – enable bilinear edge detection via Gather (default true)
//   params          – DepthBiasParams configuration
//
// Returns:  shadow factor [0 = fully shadowed, 1 = fully lit].
// ---------------------------------------------------------------------------
float DepthBiasShadowRayMarch(
    Texture2D<float> depthTexture,
    SamplerState     pointSampler,
    float2           pixelUV,
    float2           rayDirUV,
    float            originDepth,
    int              stepCount,
    float            stepSize,
    int              hardShadowSteps,
    int              fadeOutSteps,
    bool             useEdgeDetect,
    DepthBiasParams  params)
{
  float shadow    = 1.0;
  int   fadeStart = stepCount - fadeOutSteps;

  for (int i = 1; i <= stepCount; i++) {
    float2 sampleUV = pixelUV + rayDirUV * stepSize * (float)i;

    // Clamp to valid UV range.
    if (any(sampleUV < 0.0) || any(sampleUV > 1.0)) break;

    float stepShadow;

    if (useEdgeDetect) {
      float4 gatherDepth = depthTexture.Gather(pointSampler, sampleUV);
      float  sampleDepth = depthTexture.SampleLevel(pointSampler, sampleUV, 0);
      stepShadow = DepthBiasShadowFiltered(gatherDepth, sampleDepth, originDepth, params);
    } else {
      float sampleDepth = depthTexture.SampleLevel(pointSampler, sampleUV, 0);
      stepShadow = DepthBiasShadow(sampleDepth, originDepth, params);
    }

    // Hard shadow region: crisp contact shadows for first N steps.
    if (i <= hardShadowSteps) {
      stepShadow = stepShadow < 0.5 ? 0.0 : 1.0;
    }

    // Fade-out region: blend toward 1.0 to avoid harsh cutoff.
    if (i > fadeStart) {
      float fadeT = (float)(i - fadeStart) / (float)fadeOutSteps;
      stepShadow = lerp(stepShadow, 1.0, fadeT);
    }

    shadow = min(shadow, stepShadow);

    // Early out if fully shadowed.
    if (shadow <= 0.0) break;
  }

  return shadow;
}

// Convenience overload with default DepthBiasParams.
float DepthBiasShadowRayMarch(
    Texture2D<float> depthTexture,
    SamplerState     pointSampler,
    float2           pixelUV,
    float2           rayDirUV,
    float            originDepth,
    int              stepCount       = 32,
    float            stepSize        = 0.001,
    int              hardShadowSteps = 4,
    int              fadeOutSteps    = 8,
    bool             useEdgeDetect   = true)
{
  return DepthBiasShadowRayMarch(
    depthTexture, pointSampler, pixelUV, rayDirUV, originDepth,
    stepCount, stepSize, hardShadowSteps, fadeOutSteps, useEdgeDetect,
    DefaultDepthBiasParams());
}

// ---------------------------------------------------------------------------
// 1.10f  Depth-Bias Micro Detail Enhancement (Overlay)
// ---------------------------------------------------------------------------
// The simplest integration path: takes an existing screen-space shadow
// value and enhances it with depth-bias micro detail.
//
// This is for cases where you DON'T want to replace the game's existing
// screen-space shadow ray march — you just want to add micro detail on
// top of whatever the game already computes.
//
// Performs a short-range, high-density ray march (few steps, small stride)
// that captures only very local depth variations.  The result is combined
// with the existing shadow using min(), so it can only darken — never
// lighten — the existing shadow.
//
// This is the recommended starting point for RenoDX integration:
//   1. Identify the game's shadow compositing point
//   2. Sample the depth buffer at the current pixel
//   3. Call this function with the existing shadow value
//   4. Use the result as the new shadow value
//
// Parameters:
//   existingShadow – the game's existing screen-space shadow [0,1]
//   depthTexture   – depth buffer SRV
//   pointSampler   – point-clamp sampler
//   pixelUV        – current pixel UV [0,1]²
//   rayDirUV       – normalised direction toward light in UV space
//   originDepth    – depth at current pixel
//   params         – DepthBiasParams (use smaller surfaceThickness for
//                    micro detail, e.g. 0.002)
//
// Returns:  enhanced shadow factor [0 = shadowed, 1 = lit].
//           Always ≤ existingShadow (can only add shadow, never remove).
// ---------------------------------------------------------------------------
float DepthBiasMicroDetailOverlay(
    float            existingShadow,
    Texture2D<float> depthTexture,
    SamplerState     pointSampler,
    float2           pixelUV,
    float2           rayDirUV,
    float            originDepth,
    DepthBiasParams  params)
{
  // Short-range, dense march for micro detail only.
  // 12 steps at half-pixel stride captures ~6 pixels of micro shadow.
  DepthBiasParams microParams = params;
  microParams.surfaceThickness = params.surfaceThickness * 0.4;  // tighter window
  microParams.shadowContrast   = params.shadowContrast * 1.5;    // crisper micro shadows

  float microShadow = DepthBiasShadowRayMarch(
    depthTexture,
    pointSampler,
    pixelUV,
    rayDirUV,
    originDepth,
    12,              // stepCount — short range
    0.0005,          // stepSize — half pixel at 1080p
    2,               // hardShadowSteps
    3,               // fadeOutSteps
    true,            // useEdgeDetect
    microParams
  );

  // Combine: can only darken, never lighten.
  return min(existingShadow, microShadow);
}

// Convenience overload with default DepthBiasParams.
float DepthBiasMicroDetailOverlay(
    float            existingShadow,
    Texture2D<float> depthTexture,
    SamplerState     pointSampler,
    float2           pixelUV,
    float2           rayDirUV,
    float            originDepth)
{
  return DepthBiasMicroDetailOverlay(
    existingShadow, depthTexture, pointSampler,
    pixelUV, rayDirUV, originDepth,
    DefaultDepthBiasParams());
}

// ---------------------------------------------------------------------------
// 1.10g  Normal-Derived Height Approximation
// ---------------------------------------------------------------------------
// Bend Studio's technique uses a per-texel material displacement term
// ("Depth Bias", ±8 cm) that most games do NOT export.  When this data
// is unavailable, we can approximate local height variation from the
// G-buffer normal buffer.
//
// The insight: if a normal tilts away from the expected geometric
// (face) normal, there is an implied slope at that point.  Integrating
// slope across a small neighborhood gives an approximate height field
// that captures some of the detail that would otherwise require a
// dedicated displacement channel.
//
// This is inherently a low-pass estimate — it captures the *direction*
// of displacement but loses high-frequency magnitude accuracy.  Still,
// it meaningfully improves the depth-bias shadow evaluation on surfaces
// where normal maps encode detail that the mesh geometry lacks (brick
// walls, cobblestones, armor plate, tree bark).
//
// REQUIREMENTS:
//   • A G-buffer normal texture (Texture2D<float4>) bound as SRV.
//     Most deferred renderers write normals to an early G-buffer target
//     (commonly SV_Target1 or SV_Target2).  Inspect in RenderDoc.
//   • Normals should be in a consistent space (view or world).
//   • The geometric normal for the "flat" surface is needed as a
//     reference.  If unavailable, float3(0, 0, 1) in view space is a
//     reasonable default for screen-facing geometry.
//
// Parameters:
//   normalBuffer  – G-buffer normal texture (xyz = normal, w ignored)
//   pointSampler  – point-clamp sampler
//   pixelUV       – current pixel UV [0,1]²
//   texelSize     – float2(1.0/width, 1.0/height) of the normal buffer
//   geometricN    – expected flat/geometric normal (normalised).
//                   Use the interpolated vertex normal if available, or
//                   float3(0,0,1) in view space as a fallback.
//   heightScale   – output height magnitude (default 0.005).
//                   Tune per game — larger values = stronger displacement.
//                   Start with 0.005 and double until visible, then back
//                   off.  Depends on the game's depth range and units.
//
// Returns:  approximate height offset (in depth-buffer-like units) to
//           add to the raw depth value via SyntheticDepthWithBias().
// ---------------------------------------------------------------------------
float ApproxHeightFromNormals(
    Texture2D<float4> normalBuffer,
    SamplerState      pointSampler,
    float2            pixelUV,
    float2            texelSize,
    float3            geometricN,
    float             heightScale = 0.005)
{
  // Sample normals in a small cross-shaped kernel.
  float3 nC = normalBuffer.SampleLevel(pointSampler, pixelUV, 0).xyz;
  float3 nR = normalBuffer.SampleLevel(pointSampler, pixelUV + float2( texelSize.x, 0), 0).xyz;
  float3 nL = normalBuffer.SampleLevel(pointSampler, pixelUV + float2(-texelSize.x, 0), 0).xyz;
  float3 nU = normalBuffer.SampleLevel(pointSampler, pixelUV + float2(0,  texelSize.y), 0).xyz;
  float3 nD = normalBuffer.SampleLevel(pointSampler, pixelUV + float2(0, -texelSize.y), 0).xyz;

  // Central-difference slope: how much does the normal tilt relative to
  // the geometric reference along each screen axis?
  float slopeX = dot(nL - nR, geometricN) * 0.5;
  float slopeY = dot(nD - nU, geometricN) * 0.5;

  // Magnitude of deviation ≈ local height gradient.
  float gradientMag = sqrt(slopeX * slopeX + slopeY * slopeY);

  // Overall tilt of the center sample from geometric normal provides a
  // sign-independent height indicator (more tilt = more displacement).
  float tilt = 1.0 - saturate(dot(nC, geometricN));

  return gradientMag * tilt * heightScale;
}

// ---------------------------------------------------------------------------
// 1.10h  AO-Modulated Surface Thickness
// ---------------------------------------------------------------------------
// When no material displacement channel is available, the AO buffer can
// serve as a proxy for local occlusion depth: darker AO implies deeper
// crevices and denser nearby geometry, so the thickness window for the
// depth-bias evaluation should expand to capture more subtle depth
// differences in those areas.
//
// This approximation follows from the relationship between AO and local
// geometry density:
//   • AO ≈ 1  (unoccluded, open surface) → thin slab, strict comparison
//   • AO → 0  (heavily occluded, crevice) → thicker slab, captures more
//
// REQUIREMENTS:
//   • An AO value at the current pixel.  Sources:
//       ○ SSAO/GTAO/HBAO+ buffer (most common — many games bind this
//         as an SRV in the lighting pass or composite it into a G-buffer
//         channel)
//       ○ Baked AO packed into a vertex color or lightmap channel
//       ○ Material AO from a texture (accessed in the replaced PS)
//
// Parameters:
//   baseParams      – base DepthBiasParams to modify
//   ao              – ambient occlusion at the pixel [0 = occluded, 1 = open]
//   thicknessScale  – how much low AO expands the thickness (default 3.0)
//                     Higher = more aggressive shadow in occluded areas.
//                     Range [1.5, 5.0].
//
// Returns:  modified DepthBiasParams with AO-scaled surfaceThickness.
// ---------------------------------------------------------------------------
DepthBiasParams ModulateThicknessByAO(
    DepthBiasParams baseParams,
    float           ao,
    float           thicknessScale = 3.0)
{
  DepthBiasParams p = baseParams;
  // Invert AO: low AO (occluded) → larger multiplier → thicker slab.
  float aoMult = lerp(thicknessScale, 1.0, saturate(ao));
  p.surfaceThickness *= aoMult;
  return p;
}

// ---------------------------------------------------------------------------
// 1.10i  Synthetic Depth with Normal-Derived Bias
// ---------------------------------------------------------------------------
// Combines the raw depth buffer value with a normal-derived height offset
// to produce a synthetic depth that approximates Bend Studio's
// depth + material displacement.
//
// This modified depth is used in place of the raw depth when calling
// DepthBiasShadow() or DepthBiasShadowFiltered(), giving the thickness
// comparison access to normal-map-implied surface variation that the
// depth buffer alone does not encode.
//
// Parameters:
//   rawDepth      – depth buffer value at the sample point
//   normalHeight  – height offset from ApproxHeightFromNormals()
//   reverseZ      – true if the depth buffer uses reversed-Z
//
// Returns:  modified depth value with synthetic displacement applied.
// ---------------------------------------------------------------------------
float SyntheticDepthWithBias(
    float rawDepth,
    float normalHeight,
    bool  reverseZ = true)
{
  // In reversed-Z (near=1, far=0):
  //   Bump (positive height) → surface is closer to camera → higher value.
  //   We want to push the depth sample "farther" so the bump creates a
  //   positive delta relative to the origin → add normalHeight.
  //
  // In forward-Z (near=0, far=1):
  //   Same logic, opposite sign → subtract normalHeight.
  return reverseZ ? (rawDepth + normalHeight) : (rawDepth - normalHeight);
}

// ---------------------------------------------------------------------------
// 1.10j  Combined Depth-Bias Micro Detail (Depth + Normals + AO)
// ---------------------------------------------------------------------------
// The full combined pipeline: uses depth buffer + G-buffer normals + AO
// to approximate Bend Studio's depth + material displacement technique
// as closely as possible without engine-level support.
//
// Pipeline:
//   1. Sample the normal buffer at each ray step to derive local height.
//   2. Combine height with the raw depth to produce synthetic depth.
//   3. Modulate surfaceThickness by the AO value at the origin pixel.
//   4. Run the depth-bias shadow evaluation on the synthetic depth.
//
// This is the highest-quality variant available for RenoDX-injected titles
// that don't export a material displacement channel.  It captures normal-
// map-implied micro detail that the depth buffer alone misses, while the
// AO modulation ensures crevices get appropriately deeper shadow searches.
//
// Performance note:
//   Each ray step now reads TWO textures (depth + normals) instead of one,
//   plus the AO read at the origin.  Keep stepCount moderate (8–16) for
//   the micro-detail overlay use case.
//
// REQUIREMENTS:
//   • Depth buffer (Texture2D<float>)         — always available
//   • G-buffer normals (Texture2D<float4>)    — identify in RenderDoc
//   • AO value at the origin pixel (float)    — from SSAO buffer, baked AO,
//     or material.  If unavailable, pass 1.0 to disable AO modulation.
//   • texelSize for the normal buffer
//   • geometricN: reference geometric normal (see 1.10g)
//
// Parameters:
//   existingShadow  – game's existing shadow value [0,1]
//   depthTexture    – depth buffer SRV
//   normalBuffer    – G-buffer normal texture SRV
//   pointSampler    – point-clamp sampler
//   pixelUV         – current pixel UV [0,1]²
//   rayDirUV        – normalised direction toward light in UV space
//   originDepth     – raw depth at the current pixel
//   originAO        – AO at the current pixel [0 = occluded, 1 = open].
//                     Pass 1.0 to disable AO modulation.
//   texelSize       – float2(1.0/width, 1.0/height) of the normal buffer
//   geometricN      – reference geometric normal (normalised)
//   heightScale     – normal-to-height magnitude (default 0.005)
//   stepCount       – ray march steps (default 12)
//   stepSize        – UV-space step stride (default 0.0005)
//   params          – base DepthBiasParams (default reversed-Z)
//
// Returns:  enhanced shadow factor [0 = shadowed, 1 = lit].
//           Always ≤ existingShadow.
// ---------------------------------------------------------------------------
float DepthBiasMicroDetailCombined(
    float             existingShadow,
    Texture2D<float>  depthTexture,
    Texture2D<float4> normalBuffer,
    SamplerState      pointSampler,
    float2            pixelUV,
    float2            rayDirUV,
    float             originDepth,
    float             originAO,
    float2            texelSize,
    float3            geometricN,
    float             heightScale,
    int               stepCount,
    float             stepSize,
    DepthBiasParams   params)
{
  // --- AO-modulated parameters ---
  DepthBiasParams p = ModulateThicknessByAO(params, originAO);
  p.shadowContrast *= 1.5;  // crisper micro shadows for detail overlay

  // --- Synthetic depth at origin ---
  float originHeight = ApproxHeightFromNormals(
    normalBuffer, pointSampler, pixelUV, texelSize, geometricN, heightScale);
  float syntheticOrigin = SyntheticDepthWithBias(originDepth, originHeight, p.reverseZ);

  // --- Ray march with synthetic depth ---
  float shadow = 1.0;
  int   fadeStart = max(stepCount - 3, 1);

  for (int i = 1; i <= stepCount; i++) {
    float2 sampleUV = pixelUV + rayDirUV * stepSize * (float)i;

    if (any(sampleUV < 0.0) || any(sampleUV > 1.0)) break;

    // Sample raw depth and derive normal-based height at this step.
    float rawSample    = depthTexture.SampleLevel(pointSampler, sampleUV, 0);
    float sampleHeight = ApproxHeightFromNormals(
      normalBuffer, pointSampler, sampleUV, texelSize, geometricN, heightScale);
    float syntheticSample = SyntheticDepthWithBias(rawSample, sampleHeight, p.reverseZ);

    // Edge detection via depth Gather (raw depth — synthetic is per-pixel).
    float4 gatherDepth = depthTexture.Gather(pointSampler, sampleUV);
    float4 linGather = float4(
      LinearizeDepthForBias(gatherDepth.x, p),
      LinearizeDepthForBias(gatherDepth.y, p),
      LinearizeDepthForBias(gatherDepth.z, p),
      LinearizeDepthForBias(gatherDepth.w, p)
    );
    float quadRange = max(max(linGather.x, linGather.y), max(linGather.z, linGather.w))
                    - min(min(linGather.x, linGather.y), min(linGather.z, linGather.w));

    // Skip depth discontinuities.
    if (quadRange > p.bilinearThreshold) continue;

    // Evaluate depth-bias shadow on synthetic depth.
    float stepShadow = DepthBiasShadow(syntheticSample, syntheticOrigin, p);

    // Hard shadow for first 2 steps (crisp contact).
    if (i <= 2) {
      stepShadow = stepShadow < 0.5 ? 0.0 : 1.0;
    }

    // Fade out final steps.
    if (i > fadeStart) {
      float fadeT = (float)(i - fadeStart) / 3.0;
      stepShadow = lerp(stepShadow, 1.0, fadeT);
    }

    shadow = min(shadow, stepShadow);
    if (shadow <= 0.0) break;
  }

  return min(existingShadow, shadow);
}

// Convenience overload with default DepthBiasParams.
float DepthBiasMicroDetailCombined(
    float             existingShadow,
    Texture2D<float>  depthTexture,
    Texture2D<float4> normalBuffer,
    SamplerState      pointSampler,
    float2            pixelUV,
    float2            rayDirUV,
    float             originDepth,
    float             originAO,
    float2            texelSize,
    float3            geometricN,
    float             heightScale = 0.005,
    int               stepCount   = 12,
    float             stepSize    = 0.0005)
{
  return DepthBiasMicroDetailCombined(
    existingShadow, depthTexture, normalBuffer, pointSampler,
    pixelUV, rayDirUV, originDepth, originAO, texelSize, geometricN,
    heightScale, stepCount, stepSize, DefaultDepthBiasParams());
}

// ---------------------------------------------------------------------------
// 1.10k  Shadow Visibility Bitmap
// ---------------------------------------------------------------------------
// Inspired by "Ray Tracing the World of Assassin's Creed Shadows"
// (SIGGRAPH 2025).  Packs per-pixel shadow results for up to 8 lights
// into a single uint32 bitmap, enabling:
//   • Multi-light shadow tracking in ONE R32_UINT texture
//   • Per-light, per-pixel temporal stability detection
//   • Confidence-based sample allocation (stable → skip, unstable → resample)
//
// This is a pure data-structure technique — works with ANY shadow source:
// shadow maps, screen-space ray marches (1.10e/f/j), PCSS, or RT shadows.
//
// Usage in a RenoDX render pass:
//   1. After shadow compositing, call PackShadowBitmap() per pixel
//   2. Next frame, read previous bitmap to detect per-light stability
//   3. Use GetShadowConfidence() to skip stable pixels (save bandwidth)
//   4. Combine with DepthBiasMicroDetailOverlay (1.10f) or Combined (1.10j)
//      for adaptive quality: unstable regions get full micro-detail,
//      stable regions reuse previous results.
//
// MAX_SHADOW_BITMAP_LIGHTS: up to 8 lights per pixel (8 bits per light
// encoded in uint32).  Each bit represents shadow state for one light.
// ---------------------------------------------------------------------------

static const int MAX_SHADOW_BITMAP_LIGHTS = 8;

// Packs up to MAX_SHADOW_BITMAP_LIGHTS shadow values into a single uint.
// Each shadow value is binarised at the given threshold: below = shadowed (0),
// above = lit (1).
//
// Parameters:
//   shadowValues  – array of shadow factors [0,1] per light
//   lightCount    – number of active lights (max MAX_SHADOW_BITMAP_LIGHTS)
//   threshold     – binarisation threshold (default 0.5)
//
// Returns:  packed bitmap, bit N = shadow state of light N.
uint PackShadowBitmap(float shadowValues[MAX_SHADOW_BITMAP_LIGHTS],
                      int   lightCount,
                      float threshold = 0.5)
{
  uint bitmap = 0u;
  int  count  = min(lightCount, MAX_SHADOW_BITMAP_LIGHTS);
  for (int i = 0; i < count; i++) {
    if (shadowValues[i] >= threshold) {
      bitmap |= (1u << (uint)i);
    }
  }
  return bitmap;
}

// Convenience: pack a single light's shadow into an existing bitmap.
uint SetShadowBit(uint existingBitmap, int lightIndex, float shadow,
                  float threshold = 0.5)
{
  uint bit = (shadow >= threshold) ? 1u : 0u;
  uint mask = 1u << (uint)lightIndex;
  return (existingBitmap & ~mask) | (bit << (uint)lightIndex);
}

// Unpack a single light's shadow state from the bitmap.
// Returns 0.0 (shadowed) or 1.0 (lit).
float UnpackShadowBit(uint bitmap, int lightIndex)
{
  return (((bitmap >> (uint)lightIndex) & 1u) != 0u) ? 1.0 : 0.0;
}

// ---------------------------------------------------------------------------
// 1.10l  Shadow Temporal Stability & Confidence
// ---------------------------------------------------------------------------
// Compares current and previous frame shadow bitmaps to determine
// per-pixel, per-light stability.  The confidence output can be used to:
//   • Skip shadow re-evaluation for stable pixels (performance)
//   • Allocate more samples to unstable pixels (quality-where-needed)
//   • Combine with 1.10e/f/j: run the full micro-detail ray march
//     only on low-confidence pixels; reuse previous shadow on high.
//
// The stability counter saturates at maxStableFrames.  This prevents
// integer overflow and provides a natural "cooldown" before a pixel
// is considered fully stable.
//
// Implements the confidence-based sampling strategy from AC Shadows:
// stable pixels receive zero new samples, newly unstable pixels get
// full-quality re-evaluation.
// ---------------------------------------------------------------------------

struct ShadowConfidence {
  float confidence;    // [0,1]  0 = just changed, 1 = fully stable
  uint  changedMask;   // bitmask of lights that changed this frame
  int   stableFrames;  // how many consecutive frames all lights are stable
};

// Compute per-pixel shadow confidence from current/previous bitmaps.
//
// Parameters:
//   currentBitmap    – this frame's packed shadow bitmap (from 1.10k)
//   previousBitmap   – last frame's packed shadow bitmap
//   prevStableFrames – previous frame's stableFrames counter
//   maxStableFrames  – saturation limit for frame counter (default 16)
//
// Returns:  ShadowConfidence with per-light change mask and overall confidence.
ShadowConfidence GetShadowConfidence(
    uint currentBitmap,
    uint previousBitmap,
    int  prevStableFrames,
    int  maxStableFrames = 16)
{
  ShadowConfidence result;
  result.changedMask = currentBitmap ^ previousBitmap;

  if (result.changedMask == 0u) {
    // All lights stable — increment counter.
    result.stableFrames = min(prevStableFrames + 1, maxStableFrames);
  } else {
    // Something changed — reset.
    result.stableFrames = 0;
  }

  result.confidence = saturate((float)result.stableFrames / (float)maxStableFrames);
  return result;
}

// Returns true if a specific light changed shadow state between frames.
bool DidLightShadowChange(uint changedMask, int lightIndex)
{
  return (changedMask & (1u << (uint)lightIndex)) != 0u;
}

// ---------------------------------------------------------------------------
// 1.10m  Spatial Hash Shadow Denoiser
// ---------------------------------------------------------------------------
// Lightweight edge-aware spatial denoiser that groups pixels by a hash
// of their geometric properties (depth, normal) and shares shadow data
// within each group.
//
// Inspired by the spatial-hash denoiser from "Ray Tracing the World of
// Assassin's Creed Shadows" (SIGGRAPH 2025), which replaces expensive
// bilateral filters at roughly half the cost.
//
// Applicable to ANY noisy screen-space shadow signal:
//   • Shadow map PCF / PCSS results
//   • Screen-space shadow ray marches (1.10e/f/j)
//   • RT shadow outputs
//   • SSAO, screen-space reflections, or any per-pixel noisy signal
//
// Can be combined with the confidence system (1.10l): skip denoising
// for high-confidence pixels, apply full denoising for low-confidence.
//
// Parameters:
//   shadowBuffer   – noisy shadow input (Texture2D<float>)
//   depthBuffer    – depth SRV
//   normalBuffer   – G-buffer normals SRV
//   pointSampler   – point-clamp sampler
//   pixelUV        – current pixel UV [0,1]²
//   texelSize      – float2(1.0/width, 1.0/height)
//   kernelRadius   – spatial filter radius in pixels (default 2)
//   depthWeight    – sensitivity to depth differences (default 1000.0)
//   normalPower    – exponent for normal similarity (default 32.0)
//
// Returns:  denoised shadow value [0,1].
// ---------------------------------------------------------------------------
float SpatialHashShadowDenoise(
    Texture2D<float>  shadowBuffer,
    Texture2D<float>  depthBuffer,
    Texture2D<float4> normalBuffer,
    SamplerState      pointSampler,
    float2            pixelUV,
    float2            texelSize,
    int               kernelRadius = 2,
    float             depthWeight  = 1000.0,
    float             normalPower  = 32.0)
{
  float  centerShadow = shadowBuffer.SampleLevel(pointSampler, pixelUV, 0);
  float  centerDepth  = depthBuffer.SampleLevel(pointSampler, pixelUV, 0);
  float3 centerN      = normalize(normalBuffer.SampleLevel(pointSampler, pixelUV, 0).xyz);

  // Hash the center pixel's geometric properties for bucket comparison.
  uint centerHash = HashPixelGeometry(centerDepth, centerN);

  float weightedSum = centerShadow;
  float totalWeight = 1.0;

  for (int y = -kernelRadius; y <= kernelRadius; y++) {
    for (int x = -kernelRadius; x <= kernelRadius; x++) {
      if (x == 0 && y == 0) continue;

      float2 sampleUV = pixelUV + float2((float)x, (float)y) * texelSize;

      // Skip out-of-bounds.
      if (any(sampleUV < 0.0) || any(sampleUV > 1.0)) continue;

      float  sDepth  = depthBuffer.SampleLevel(pointSampler, sampleUV, 0);
      float3 sNormal = normalize(normalBuffer.SampleLevel(pointSampler, sampleUV, 0).xyz);

      // Hash-bucket fast reject: skip if different geometric group.
      uint sHash = HashPixelGeometry(sDepth, sNormal);
      if (sHash != centerHash) continue;

      // Fine-grained similarity weights within the same bucket.
      float dw = exp(-abs(sDepth - centerDepth) * depthWeight);
      float nw = pow(max(dot(sNormal, centerN), 0.0), normalPower);
      float w  = dw * nw;

      float sShadow = shadowBuffer.SampleLevel(pointSampler, sampleUV, 0);
      weightedSum += sShadow * w;
      totalWeight += w;
    }
  }

  return weightedSum / totalWeight;
}

// Spatial hash key: quantises depth and normal into a compact bucket ID.
// Pixels in the same bucket are geometrically similar enough to share
// shadow data safely.
uint HashPixelGeometry(float depth, float3 normal)
{
  // Quantise depth to ~1024 levels.
  uint dq = (uint)(saturate(depth) * 1024.0);

  // Quantise normal to 16x16 octahedral bins.
  uint2 nq = (uint2)(saturate(normal.xy * 0.5 + 0.5) * 16.0);

  // Combine with large primes to spread hash distribution.
  return dq ^ (nq.x * 73856093u) ^ (nq.y * 19349663u);
}

// ---------------------------------------------------------------------------
// 1.10n  Confidence-Adaptive Shadow Pipeline
// ---------------------------------------------------------------------------
// Complete integration function that ties together:
//   • Shadow visibility bitmap (1.10k)
//   • Temporal confidence (1.10l)
//   • Spatial hash denoising (1.10m)
//   • Depth-bias micro detail overlay (1.10f) or combined (1.10j)
//
// This implements the core strategy from AC Shadows' hybrid shadow system
// adapted for raster titles:
//   1. Read previous frame's shadow bitmap to determine confidence.
//   2. For HIGH-confidence pixels, reuse previous shadow (near-zero cost).
//   3. For LOW-confidence pixels, compute full shadow with micro detail.
//   4. Denoise the result with the spatial hash filter.
//   5. Update the bitmap for next frame.
//
// This is the recommended entry point for combining AC Shadows techniques
// with the existing depth-bias system (1.10a–j).  For games where only
// a single directional light matters, set lightIndex = 0.
//
// Parameters:
//   existingShadow      – the game's base shadow value for this light [0,1]
//   prevShadowBitmap    – previous frame's packed bitmap (Texture2D<uint>)
//   prevStableFrames    – previous frame's stability counter (Texture2D<int>)
//   shadowBuffer        – noisy shadow texture for denoising (can be same
//                         as the existing shadow source)
//   depthTexture        – depth buffer SRV
//   normalBuffer        – G-buffer normals SRV
//   pointSampler        – point-clamp sampler
//   pixelUV             – current pixel UV [0,1]²
//   rayDirUV            – normalised direction toward light in UV space
//   originDepth         – depth at current pixel
//   texelSize           – float2(1.0/width, 1.0/height)
//   lightIndex          – which light slot [0, MAX_SHADOW_BITMAP_LIGHTS)
//   confidenceThreshold – above this confidence, skip re-evaluation
//                         (default 0.7 = stable for ~11 frames)
//   useDenoise          – enable spatial hash denoising (default true)
//   useMicroDetail      – enable depth-bias micro detail (default true)
//
// Outputs via inout:
//   outBitmap       – updated bitmap to write for next frame
//   outStableFrames – updated stability counter for next frame
//
// Returns:  final shadow factor [0 = shadowed, 1 = lit].
// ---------------------------------------------------------------------------
float ConfidenceAdaptiveShadow(
    float             existingShadow,
    Texture2D<uint>   prevShadowBitmap,
    Texture2D<int>    prevStableFrames,
    Texture2D<float>  shadowBuffer,
    Texture2D<float>  depthTexture,
    Texture2D<float4> normalBuffer,
    SamplerState      pointSampler,
    float2            pixelUV,
    float2            rayDirUV,
    float             originDepth,
    float2            texelSize,
    int               lightIndex,
    float             confidenceThreshold,
    bool              useDenoise,
    bool              useMicroDetail,
    inout uint        outBitmap,
    inout int         outStableFrames)
{
  // --- Read previous frame state ---
  uint prevBitmap = prevShadowBitmap.SampleLevel(pointSampler, pixelUV, 0);
  int  prevStable = prevStableFrames.SampleLevel(pointSampler, pixelUV, 0);

  // --- Build current bitmap from existing shadow ---
  uint currentBitmap = SetShadowBit(0u, lightIndex, existingShadow);

  // --- Compute confidence ---
  ShadowConfidence conf = GetShadowConfidence(
    currentBitmap, prevBitmap, prevStable);

  float shadow = existingShadow;

  if (conf.confidence >= confidenceThreshold) {
    // High confidence: reuse previous shadow — skip expensive work.
    shadow = UnpackShadowBit(prevBitmap, lightIndex);
  } else {
    // Low confidence: apply full quality pipeline.

    // Micro detail enhancement (1.10f).
    if (useMicroDetail) {
      shadow = DepthBiasMicroDetailOverlay(
        shadow, depthTexture, pointSampler,
        pixelUV, rayDirUV, originDepth);
    }

    // Spatial hash denoising (1.10m).
    if (useDenoise) {
      // We need to evaluate the denoiser on the shadow buffer, not on
      // our locally computed value.  If the game writes shadow to a
      // texture we can read, use that.  Otherwise this denoises the
      // existing input.
      float denoised = SpatialHashShadowDenoise(
        shadowBuffer, depthTexture, normalBuffer,
        pointSampler, pixelUV, texelSize);
      // Blend denoised with micro-detail-enhanced shadow.
      shadow = min(shadow, denoised);
    }
  }

  // --- Update outputs for next frame ---
  outBitmap       = SetShadowBit(currentBitmap, lightIndex, shadow);
  outStableFrames = conf.stableFrames;

  return shadow;
}

// Convenience overload with common defaults.
float ConfidenceAdaptiveShadow(
    float             existingShadow,
    Texture2D<uint>   prevShadowBitmap,
    Texture2D<int>    prevStableFrames,
    Texture2D<float>  shadowBuffer,
    Texture2D<float>  depthTexture,
    Texture2D<float4> normalBuffer,
    SamplerState      pointSampler,
    float2            pixelUV,
    float2            rayDirUV,
    float             originDepth,
    float2            texelSize,
    int               lightIndex          = 0,
    float             confidenceThreshold = 0.7,
    bool              useDenoise          = true,
    bool              useMicroDetail      = true)
{
  uint outBitmap       = 0u;
  int  outStableFrames = 0;
  return ConfidenceAdaptiveShadow(
    existingShadow, prevShadowBitmap, prevStableFrames,
    shadowBuffer, depthTexture, normalBuffer, pointSampler,
    pixelUV, rayDirUV, originDepth, texelSize,
    lightIndex, confidenceThreshold, useDenoise, useMicroDetail,
    outBitmap, outStableFrames);
}

// ---------------------------------------------------------------------------
// 1.10o  Oriented Depth Bias  (FFXVI Shadow Bias)
// ---------------------------------------------------------------------------
// Reference:
//   "Shadow Techniques from Final Fantasy XVI", Square Enix (2023)
//   Section 4.2 — Oriented Depth Bias  (Listing 7, Figures 19–20)
//
// PROBLEM:
//   Hardware Depth Bias offsets the depth written to the shadow map by a
//   fixed amount.  This reduces shadow acne (self-shadowing) but
//   introduces Peter Panning (shadows detaching from casters) when the
//   bias is too large.  Worse, because shadow map depth is NONLINEAR,
//   a fixed bias grows in world-space as distance from the light
//   increases, making it impossible to pick one value that works at all
//   depths.  (See paper Figure 19.)
//
// FFXVI SOLUTION — Oriented Depth Bias:
//   Shadow maps are generated WITHOUT hardware depth bias so that
//   stored depths are as close to the real surface as possible.
//   At shadow-testing time, a FIXED-MAGNITUDE linear-space bias is
//   added to the tested depth, with its SIGN determined by the
//   surface's orientation relative to the light:
//
//     • Facing the light (NdotL > 0) → bias TOWARD the light
//       (subtract from depth → reduces self-shadow / acne)
//     • Facing away from the light (NdotL ≤ 0) → bias AWAY from light
//       (add to depth → reduces Peter Panning on back faces)
//     • SSS materials → ALWAYS bias toward the light
//       (removes self-shadow to allow subsurface scattering)
//
//   Because the bias is applied in LINEAR depth space (via DepthToViewZ
//   / ViewZToDepth conversion), it remains uniform across all depth
//   ranges, eliminating the nonlinearity problem entirely.
//
// PSEUDOCODE FROM PAPER (Listing 7):
//
//   float GetOrientedBias(float3 faceNormal, float3 lightDirection,
//                         bool isSSS) {
//     static float kOrientedBias = 0.2;  // cm — tunable per game
//     float isFacingLight   = dot(faceNormal, lightDirection) > 0;
//     bool moveTowardLight  = isSSS || isFacingLight;
//     return moveTowardLight ? -kOrientedBias : kOrientedBias;
//   }
//
//   float ComputeShadows(LightInfo lightInfo, float3 worldPos,
//                        float3 faceNormal, bool isSSS) {
//     float3 lightDir      = GetLightDirection(lightInfo, worldPos);
//     float3 shadowCoord   = WorldToShadowmapCoord(lightInfo, worldPos);
//     float  linearDepth   = DepthToViewZ(lightInfo, shadowCoord.z);
//     float  linearBias    = GetOrientedBias(faceNormal, lightDir, isSSS);
//     shadowCoord.z        = ViewZToDepth(lightInfo, linearDepth+linearBias);
//     return PerformShadowmapTest(lightInfo, shadowCoord);
//   }
//
// INTEGRATION PATHS:
//
//   Path A — Full FFXVI method (§1.10o-i + §1.10o-ii):
//     Use GetOrientedBias() to get the linear-space bias, then apply it
//     via ComputeShadowsOrientedBias() which handles the nonlinear
//     depth conversion.  Requires the light's near/far planes or
//     projection matrix to convert between view-Z and shadow depth.
//
//   Path B — Simplified comparison bias (§1.10o-iii):
//     If you don't have access to depth linearisation parameters,
//     OrientedDepthBiasValue() provides a slope-scaled bias in
//     normalised depth space.  Less accurate than Path A but easier
//     to inject.
//
//   Path C — World-space normal offset (§1.10o-iv):
//     Standard normal-offset technique (à la Unity/UE).  Shifts the
//     shadow lookup position along the surface normal before
//     projection.  Useful when you control the lookup position.
//
//   Path D — Overlay on existing shadows:
//     Pair with §1.10f DepthBiasMicroDetailOverlay (screen-space
//     shadows) — oriented bias fixes shadow MAP quality while §1.10f
//     fixes screen-space shadow quality.
//
// REQUIREMENTS:
//   • Surface normal in world space (from G-buffer or forward PS)
//   • Light direction (from CB — identify in RenderDoc)
//   • For Path A: light near/far planes OR the projection matrix
//   • For Path C: the light's view-projection matrix
//
// Parameters are tuned per game because they depend on:
//   • World-space scale (meters vs centimeters vs arbitrary units)
//   • Shadow map resolution (higher res → smaller bias needed)
//   • Cascade split distances (far cascades need more bias)
// ---------------------------------------------------------------------------

// -- 1.10o-i.  GetOrientedBias  (FFXVI Listing 7 — faithful) -----------------
//
// Returns a FIXED-MAGNITUDE bias in linear depth units (e.g. centimeters)
// whose SIGN depends on whether the surface faces the light.
//
// This is the core insight of the FFXVI paper: instead of a variable
// bias that grows with angle, use a constant small bias and simply
// flip its direction.  Facing-light surfaces get biased toward the
// light (reducing acne), back-facing surfaces get biased away (reducing
// Peter Panning).  SSS materials always bias toward the light to
// eliminate self-shadow artifacts that would block scattering.
//
// Parameters:
//   faceNormal      – surface normal (world space, normalized)
//   lightDirection  – direction FROM surface TO light (normalized)
//   isSSS           – true for subsurface scattering materials
//   kOrientedBias   – bias magnitude in world/linear units (default 0.2)
//                     The paper uses 0.2 cm.  Scale to match your game's
//                     world units (e.g. if 1 unit = 1 meter, use 0.002).
//
// Returns:  signed linear-space bias.
//   Negative = toward light (subtract from depth → receiver moves closer).
//   Positive = away from light (add to depth → receiver moves farther).
// ---------------------------------------------------------------------------
float GetOrientedBias(
    float3 faceNormal,
    float3 lightDirection,
    bool   isSSS,
    float  kOrientedBias = 0.2)
{
  float isFacingLight  = dot(faceNormal, lightDirection) > 0.0;
  bool moveTowardLight = isSSS || isFacingLight;
  return moveTowardLight ? -kOrientedBias : kOrientedBias;
}

// -- 1.10o-ii.  ComputeShadowsOrientedBias  (FFXVI Listing 7) ----------------
//
// Complete shadow evaluation with oriented depth bias applied in LINEAR
// depth space, matching the FFXVI paper exactly.
//
// The key steps:
//   1. Convert the shadow map's nonlinear depth to linear view-Z.
//   2. Add the oriented bias (fixed magnitude, orientation-dependent sign).
//   3. Convert back to nonlinear shadow map depth.
//   4. Use the biased depth for the shadow map comparison.
//
// This ensures the bias is uniform across all depth ranges, unlike
// hardware depth bias which grows nonlinearly with distance.
//
// The DepthToViewZ / ViewZToDepth conversions use the standard
// perspective projection formulas:
//   viewZ = (near * far) / (far - depth * (far - near))       [reversed-Z]
//   depth = (far * (viewZ - near)) / (viewZ * (far - near))   [reversed-Z]
//
// For standard (non-reversed) Z, set reversedZ = false.
//
// Parameters:
//   shadowCoordZ    – the depth value from the shadow map coordinate
//                     (i.e. the fragment's depth in light clip space,
//                     already divided by w, in [0,1])
//   faceNormal      – surface normal (world space, normalized)
//   lightDirection  – direction TO the light (normalized)
//   isSSS           – true for subsurface scattering materials
//   nearPlane       – light's near clip plane distance
//   farPlane        – light's far clip plane distance
//   kOrientedBias   – bias magnitude in linear units (default 0.2)
//   reversedZ       – true if using reversed-Z depth (default true, the
//                     DX12/Vulkan convention; most modern games use this)
//
// Returns:  biased shadow map depth for comparison.  Use as:
//   float biasedZ = ComputeShadowsOrientedBias(...);
//   float shadow = shadowMap.SampleCmpLevelZero(cmpSampler, uv, biasedZ);
// ---------------------------------------------------------------------------
float ComputeShadowsOrientedBias(
    float  shadowCoordZ,
    float3 faceNormal,
    float3 lightDirection,
    bool   isSSS,
    float  nearPlane,
    float  farPlane,
    float  kOrientedBias = 0.2,
    bool   reversedZ     = true)
{
  // Convert nonlinear shadow depth to linear view-Z.
  float depthRange = farPlane - nearPlane;
  float linearDepth;
  if (reversedZ) {
    // Reversed-Z: depth=1 at near, depth=0 at far.
    linearDepth = (nearPlane * farPlane)
                / (farPlane - shadowCoordZ * depthRange);
  } else {
    // Standard Z: depth=0 at near, depth=1 at far.
    linearDepth = (nearPlane * farPlane)
                / (farPlane - shadowCoordZ * depthRange);
  }

  // Apply oriented bias in linear space (constant world-space magnitude).
  float linearBias = GetOrientedBias(
      faceNormal, lightDirection, isSSS, kOrientedBias);
  float biasedLinearDepth = linearDepth + linearBias;

  // Convert back to nonlinear shadow map depth.
  float biasedZ;
  if (reversedZ) {
    biasedZ = (farPlane * (biasedLinearDepth - nearPlane))
            / (biasedLinearDepth * depthRange);
    biasedZ = 1.0 - biasedZ;  // reversed-Z: flip
  } else {
    biasedZ = (farPlane * (biasedLinearDepth - nearPlane))
            / (biasedLinearDepth * depthRange);
  }

  return saturate(biasedZ);
}

// -- 1.10o-iii.  Oriented Comparison Bias (slope-scaled, depth-space) ---------
//
// General-purpose slope-scaled depth bias for shadow comparison.
// (NOT the FFXVI method — this is the standard NdotL-scaled approach
// used by Unity/UE.  Provided for cases where linear depth conversion
// parameters are unavailable.)
//
// Computes a depth-space bias value to add to the shadow map sample
// BEFORE the depth comparison.  The bias scales inversely with NdotL.
//
// Parameters:
//   NdotL          – dot(surfaceNormal, lightDir), clamped [0,1]
//   baseBias       – minimum depth bias at NdotL=1 (default 0.0005)
//   maxBias        – maximum depth bias at NdotL≈0 (default 0.005)
//   slopeScale     – multiplier for the slope-dependent term (default 2.0)
//
// Returns:  scalar depth bias to ADD to the shadow map depth sample:
//   float bias = OrientedDepthBiasValue(NdotL);
//   float shadow = (shadowMapDepth + bias > fragmentLightDepth) ? 1.0 : 0.0;
// ---------------------------------------------------------------------------
float OrientedDepthBiasValue(
    float NdotL,
    float baseBias   = 0.0005,
    float maxBias    = 0.005,
    float slopeScale = 2.0)
{
  float cosAngle = max(abs(NdotL), 0.001);
  float bias = baseBias + slopeScale * baseBias * (1.0 - cosAngle) / cosAngle;
  return min(bias, maxBias);
}

// -- 1.10o-iv.  Normal Offset (world-space position shift) --------------------
//
// General-purpose normal-offset shadow bias (à la Unity/UE).
// (NOT the FFXVI method.  The FFXVI technique operates in linear depth
// space via §1.10o-i/ii above.)
//
// Returns a world-space offset vector to add to the fragment position
// BEFORE projecting into light space for the shadow map lookup.
// The offset pushes the lookup point along the surface normal, scaled
// inversely by NdotL.
//
// Parameters:
//   normalWS      – surface normal (world space, normalized)
//   lightDir      – direction TO the light (normalized)
//   normalBias    – world-space normal offset magnitude (default 0.02)
//   slopeBias     – additional slope-scaled bias for grazing surfaces
//                   (default 0.005)
//   minNdotL      – NdotL floor to prevent extreme offsets at 90°
//                   (default 0.01)
//
// Returns:  float3 world-space offset vector.  Apply as:
//   float3 biasedWorldPos = worldPos + result;
//   float4 lightClip = mul(lightViewProj, float4(biasedWorldPos, 1.0));
//   float3 shadowUVZ = lightClip.xyz / lightClip.w;
// ---------------------------------------------------------------------------
float3 NormalOffsetShadowBias(
    float3 normalWS,
    float3 lightDir,
    float  normalBias = 0.02,
    float  slopeBias  = 0.005,
    float  minNdotL   = 0.01)
{
  float NdotL = dot(normalWS, lightDir);
  float cosAngle = max(abs(NdotL), minNdotL);
  float sinAngle = sqrt(1.0 - cosAngle * cosAngle);

  float3 normalOffset = normalWS * (normalBias / cosAngle);

  float3 lightTangent = normalize(lightDir - normalWS * NdotL);
  float3 slopeOffset  = lightTangent * (slopeBias * sinAngle / cosAngle);

  return normalOffset + slopeOffset;
}

// Backward-compatible alias for existing code using the old name.
float3 OrientedDepthBiasWorldOffset(
    float3 normalWS,
    float3 lightDir,
    float  normalBias = 0.02,
    float  slopeBias  = 0.005,
    float  minNdotL   = 0.01)
{
  return NormalOffsetShadowBias(normalWS, lightDir,
                                normalBias, slopeBias, minNdotL);
}

// -- 1.10o-v.  Per-Cascade Oriented Bias --------------------------------------
//
// Scales bias parameters by cascade extent so that near and far cascades
// use appropriately-sized bias.
//
// Parameters:
//   NdotL           – dot(surfaceNormal, lightDir), clamped [0,1]
//   cascadeIndex    – which cascade level (0 = nearest)
//   cascadeScales   – float4 of world-space extents per cascade
//   baseNormalBias  – normal bias for cascade 0 (default 0.02)
//   baseDepthBias   – depth comparison bias for cascade 0 (default 0.0005)
//
// Returns:  float2(normalBias, depthBias) scaled for the given cascade.
// ---------------------------------------------------------------------------
float2 OrientedDepthBiasPerCascade(
    float  NdotL,
    int    cascadeIndex,
    float4 cascadeScales,
    float  baseNormalBias = 0.02,
    float  baseDepthBias  = 0.0005)
{
  float refScale = max(cascadeScales[0], 1e-6);
  float thisScale = cascadeScales[min(cascadeIndex, 3)];
  float scaleFactor = thisScale / refScale;

  float normalBias = baseNormalBias * scaleFactor;
  float depthBias  = OrientedDepthBiasValue(NdotL, baseDepthBias * scaleFactor,
                                            baseDepthBias * scaleFactor * 10.0);
  return float2(normalBias, depthBias);
}

// -- 1.10o-vi.  Complete Shadow Map Lookup with Normal Offset -----------------
//
// Convenience function combining world-space normal offset with shadow
// map comparison.  Uses the general-purpose normal-offset approach
// (§1.10o-iv), NOT the FFXVI linear-depth method.
//
// For the FFXVI approach, use ComputeShadowsOrientedBias() (§1.10o-ii)
// with your own shadow map sampling.
//
// Parameters:
//   shadowMap      – shadow map texture
//   cmpSampler     – SamplerComparisonState (hardware PCF)
//   worldPos       – world-space fragment position
//   normalWS       – world-space surface normal (normalized)
//   lightDir       – direction TO the light (normalized)
//   lightViewProj  – light's view-projection matrix for this cascade
//   normalBias     – world-space normal offset (default 0.02)
//   slopeBias      – lateral slope bias (default 0.005)
//   depthBias      – additional depth comparison bias (default 0.0005)
//
// Returns:  shadow factor [0 = shadowed, 1 = lit]
// ---------------------------------------------------------------------------
float ShadowMapOrientedBias(
    Texture2D<float>        shadowMap,
    SamplerComparisonState  cmpSampler,
    float3                  worldPos,
    float3                  normalWS,
    float3                  lightDir,
    float4x4                lightViewProj,
    float                   normalBias = 0.02,
    float                   slopeBias  = 0.005,
    float                   depthBias  = 0.0005)
{
  float3 offset = NormalOffsetShadowBias(
      normalWS, lightDir, normalBias, slopeBias);
  float3 biasedPos = worldPos + offset;

  float4 lightClip = mul(lightViewProj, float4(biasedPos, 1.0));
  float3 shadowNDC = lightClip.xyz / lightClip.w;

  float2 shadowUV = shadowNDC.xy * float2(0.5, -0.5) + 0.5;

  float NdotL = saturate(dot(normalWS, lightDir));
  float orientedBias = OrientedDepthBiasValue(NdotL,
      depthBias, depthBias * 10.0);
  float compareDepth = shadowNDC.z - orientedBias;

  if (any(shadowUV < 0.0) || any(shadowUV > 1.0) ||
      compareDepth < 0.0 || compareDepth > 1.0)
    return 1.0;

  return shadowMap.SampleCmpLevelZero(cmpSampler, shadowUV, compareDepth);
}

// ============================================================================
// 1.11  Subsurface Raymarching  (PoE2 Texture-Space Volume via TBN)
// ----------------------------------------------------------------------------
// Inspired by Alexander Sannikov's ExileCon 2023 talk:
// "Rendering in Path of Exile 2" — subsurface scattering via tangent-space
// ray marching through a virtual material volume.
//
// Concept:
//   Instead of screen-space scattering (which misses back-face data and
//   suffers from view-dependent artefacts), PoE2 marches rays in the
//   material's own tangent basis (TBN).  The tangent-space "volume" is
//   defined by:
//     • UV (u, v) → horizontal extents  — infinite via texture wrap
//     • Thickness  → depth into the surface — a per-material parameter
//
//   Light enters at one UV position, is attenuated by Beer-Lambert
//   absorption as it travels through the slab, and exits at a
//   neighbouring UV.  Because everything is parameterised in texture
//   space, results are consistent regardless of view angle and mesh
//   density.
//
// How it works:
//   1. Build a world-to-tangent (TBN) matrix from the vertex tangent,
//      bitangent, and normal.
//   2. Transform the light direction into tangent space.
//   3. Compute the entry point in UV + depth space.
//   4. March through the slab (a small number of steps), sampling a
//      thickness / density map (or using constant thickness).
//   5. Accumulate transmittance via Beer-Lambert per step.
//   6. The surviving energy becomes the subsurface contribution, tinted
//      by the material's scattering color (e.g. red for skin, green for
//      foliage).
//
// Applicability to RenoDX injection:
//   Unlike PoE2, most games don't expose their tangent frame in an
//   easily interceptable form.  However:
//     • Forward shaders almost always have T, B, N as PS interpolants.
//     • G-Buffer passes store the pixel normal; tangent + bitangent can
//       be reconstructed from the normal + UV derivatives (ddx/ddy).
//     • If the game uses normal mapping, the TBN is already built in
//       the pixel shader — just intercept it before it's discarded.
//
// Sections:
//   a) TBN construction helpers
//   b) Subsurface parameter struct + presets
//   c) Material-space subsurface raymarch
//   d) Emissive volume raymarch (self-emitting volumes like lava)
//   e) Screen-space SSS post-process (alternative when TBN unavailable)
//   f) Transmittance helpers (Beer-Lambert, thin slab)
// ============================================================================

// ---------------------------------------------------------------------------
// 1.11a  TBN Construction Helpers
// ---------------------------------------------------------------------------
// Build / reconstruct the world-to-tangent-space matrix needed to march
// rays in material (UV) space.
//
// Four utilities:
//
//   BuildWorldToTangent  — construct from explicit T, B, N vectors.
//   InvertTBN            — transpose (== invert for orthonormal bases).
//   ReconstructWorldToTangent — reconstruct T, B from normal + UV
//       derivatives (ddx/ddy of worldPos and UV), for deferred passes
//       where T/B are not available.
//   WorldDirToUVStep     — project a world-space direction into UV-space
//       step + depth component using the TBN.
// ---------------------------------------------------------------------------

// Build the 3×3 world-to-tangent matrix from explicit T, B, N.
// The rows of the returned matrix are T, B, N — multiplying a world-space
// vector by this matrix gives its tangent-space representation.
//
// Parameters:
//   T – tangent  (world space, normalized)
//   B – bitangent (world space, normalized)
//   N – normal    (world space, normalized)
//
// Returns:  float3x3 where row 0 = T, row 1 = B, row 2 = N.
float3x3 BuildWorldToTangent(float3 T, float3 B, float3 N)
{
  return float3x3(T, B, N);
}

// Invert an orthonormal TBN matrix (transpose).
// For orthonormal bases, inverse == transpose.  This converts from
// tangent-to-world to world-to-tangent, or vice versa.
//
// Parameters:
//   tbn – 3×3 orthonormal TBN matrix
//
// Returns:  transposed matrix.
float3x3 InvertTBN(float3x3 tbn)
{
  return transpose(tbn);
}

// Reconstruct a world-to-tangent matrix from the pixel normal and
// screen-space derivatives of worldPos and UV.
//
// This is the classic dPdu/dPdv cotangent-frame reconstruction used in
// normal mapping when explicit tangent vectors aren't available.  It
// produces a tangent frame aligned with the UV parameterisation.
//
// Parameters:
//   N       – world-space pixel normal (normalized)
//   worldPos – world-space position of the fragment
//   uv       – texture coordinates of the fragment
//
// Returns:  float3x3 world-to-tangent matrix (rows = T, B, N).
float3x3 ReconstructWorldToTangent(float3 N, float3 worldPos, float2 uv)
{
  float3 dPdx = ddx(worldPos);
  float3 dPdy = ddy(worldPos);
  float2 dUVdx = ddx(uv);
  float2 dUVdy = ddy(uv);

  // Solve for T and B via the cotangent frame.
  float det = dUVdx.x * dUVdy.y - dUVdx.y * dUVdy.x;
  float invDet = (abs(det) > 1e-6) ? (1.0 / det) : 0.0;

  float3 T = normalize((dPdx * dUVdy.y - dPdy * dUVdx.y) * invDet);
  float3 B = normalize((dPdy * dUVdx.x - dPdx * dUVdy.x) * invDet);

  // Re-orthogonalize against N via Gram-Schmidt.
  T = normalize(T - N * dot(N, T));
  B = normalize(B - N * dot(N, B) - T * dot(T, B));

  return float3x3(T, B, N);
}

// Project a world-space direction into UV-space (2D step + depth).
//
// Given a world-space direction (e.g. light direction) and a TBN matrix,
// this returns the direction expressed in tangent space:
//   .xy = UV-space step direction
//   .z  = depth component (into / out of the surface)
//
// The UV step can be scaled by the material thickness and step count to
// produce the actual UV offset per raymarch step.
//
// Parameters:
//   worldDir    – world-space direction (normalized)
//   worldToTBN  – 3×3 world-to-tangent matrix (from above helpers)
//
// Returns:  float3 tangent-space direction (xy = UV, z = depth).
float3 WorldDirToUVStep(float3 worldDir, float3x3 worldToTBN)
{
  return mul(worldToTBN, worldDir);
}

// ---------------------------------------------------------------------------
// 1.11b  Subsurface Raymarch Parameters
// ---------------------------------------------------------------------------
// Configuration struct for the material-space subsurface raymarch.
//
// Fields:
//   scatterColor  – subsurface scattering albedo (linear RGB).
//                   This is the chrominance of light that survives
//                   absorption through the material.  For skin, reds
//                   penetrate deepest; for foliage, greens dominate.
//
//   extinction    – per-channel extinction coefficient (1/mm or 1/unit).
//                   Higher values = denser material = less transmission.
//                   Red typically has the lowest extinction for skin.
//
//   thickness     – slab thickness in world units.  This defines how
//                   deep the tangent-space volume extends below the
//                   surface.  Typical values:
//                     Skin:     2–5 mm
//                     Wax:      5–15 mm
//                     Foliage:  0.5–2 mm
//
//   numSteps      – number of raymarch steps through the slab.
//                   4–8 is typically sufficient.  More steps = smoother
//                   but more texture samples per pixel.
//
//   wrapFactor    – wrapping factor for NdotL [0,1].  0 = standard
//                   Lambert, 1 = full wrap (light reaches 180° around).
//                   Mimics the soft diffusion of light through thin
//                   translucent materials.
//
//   densityScale  – multiplier on the thickness/density map sample.
//                   Use to tune how strongly a density texture modulates
//                   the absorption.  1.0 = direct use, >1 = exaggerated.
// ---------------------------------------------------------------------------
struct SubsurfaceRaymarchParams
{
  float3 scatterColor;
  float3 extinction;
  float  thickness;
  int    numSteps;
  float  wrapFactor;
  float  densityScale;
};

// ---------------------------------------------------------------------------
// Preset factory functions for common material types.
// ---------------------------------------------------------------------------

// Human skin: deep reds, moderate thickness.
SubsurfaceRaymarchParams SubsurfaceParamsSkin()
{
  SubsurfaceRaymarchParams p;
  p.scatterColor = float3(0.8, 0.25, 0.1);
  p.extinction   = float3(0.4, 1.2, 1.8);
  p.thickness    = 3.5;
  p.numSteps     = 6;
  p.wrapFactor   = 0.3;
  p.densityScale = 1.0;
  return p;
}

// Wax / candles: warm orange transmission, thick slab.
SubsurfaceRaymarchParams SubsurfaceParamsWax()
{
  SubsurfaceRaymarchParams p;
  p.scatterColor = float3(0.9, 0.6, 0.2);
  p.extinction   = float3(0.2, 0.6, 1.4);
  p.thickness    = 10.0;
  p.numSteps     = 8;
  p.wrapFactor   = 0.5;
  p.densityScale = 1.0;
  return p;
}

// Foliage / thin leaves: green transmission, thin slab.
SubsurfaceRaymarchParams SubsurfaceParamsFoliage()
{
  SubsurfaceRaymarchParams p;
  p.scatterColor = float3(0.4, 0.85, 0.15);
  p.extinction   = float3(1.5, 0.3, 2.0);
  p.thickness    = 1.0;
  p.numSteps     = 4;
  p.wrapFactor   = 0.6;
  p.densityScale = 1.0;
  return p;
}

// Emissive / lava glow: broad-spectrum partial absorption.
SubsurfaceRaymarchParams SubsurfaceParamsEmissive()
{
  SubsurfaceRaymarchParams p;
  p.scatterColor = float3(1.0, 0.5, 0.1);
  p.extinction   = float3(0.1, 0.5, 1.0);
  p.thickness    = 5.0;
  p.numSteps     = 6;
  p.wrapFactor   = 0.0;
  p.densityScale = 1.0;
  return p;
}

// Crystal / jade: green-tinted deep passage.
SubsurfaceRaymarchParams SubsurfaceParamsCrystal()
{
  SubsurfaceRaymarchParams p;
  p.scatterColor = float3(0.3, 0.9, 0.4);
  p.extinction   = float3(1.0, 0.15, 0.8);
  p.thickness    = 8.0;
  p.numSteps     = 8;
  p.wrapFactor   = 0.0;
  p.densityScale = 1.0;
  return p;
}

// ---------------------------------------------------------------------------
// 1.11c  Material-Space Subsurface Raymarch
// ---------------------------------------------------------------------------
// Marches a ray through the tangent-space material volume to compute
// subsurface light transmission.
//
// This is the core PoE2-inspired technique.  A ray is cast from the
// shading point through the material slab along the (tangent-space)
// light direction.  At each step the local density/thickness is sampled
// from a texture (or treated as constant) and Beer-Lambert absorption
// is accumulated.  The surviving energy becomes the subsurface
// contribution.
//
// Parameters:
//   uv            – base texture coordinate of the fragment
//   lightDirTS    – light direction in tangent space (from
//                   WorldDirToUVStep).  Does NOT need to be normalized;
//                   the function normalizes the UV step internally.
//   thicknessMap  – a Texture2D<float> encoding local slab thickness
//                   (or density).  If unavailable, bind a 1×1 white
//                   texture to use constant thickness from the params.
//   mapSampler    – sampler for the thickness map (typically linear wrap)
//   p             – SubsurfaceRaymarchParams (scatter color, extinction,
//                   thickness, step count, etc.)
//
// Returns:  float3 subsurface radiance contribution (linear RGB).
//           ADD this to the direct diffuse (or modulate as desired).
//
// Usage:
//   float3x3 tbn = renodx::rendering::BuildWorldToTangent(T, B, N);
//   float3 lightTS = renodx::rendering::WorldDirToUVStep(lightDir, tbn);
//   float3 sss = renodx::rendering::SubsurfaceRaymarchMaterial(
//       uv, lightTS, thicknessMap, linearWrapSampler,
//       renodx::rendering::SubsurfaceParamsSkin());
//   diffuse += sss * lightColor * shadowAtten;
// ---------------------------------------------------------------------------
float3 SubsurfaceRaymarchMaterial(
    float2              uv,
    float3              lightDirTS,
    Texture2D<float>    thicknessMap,
    SamplerState        mapSampler,
    SubsurfaceRaymarchParams p)
{
  // Number of steps through the slab.
  int steps = clamp(p.numSteps, 1, 32);

  // Tangent-space step: xy = UV offset, z = depth traversal per step.
  // Scale by thickness so the full march covers the slab depth.
  float3 tsDir = lightDirTS;
  float  depthPerUnit = max(abs(tsDir.z), 1e-4);
  float  totalUVDist  = p.thickness / depthPerUnit;
  float2 uvStep = (tsDir.xy / depthPerUnit) * (p.thickness / (float)steps);

  // Accumulate optical depth via Beer-Lambert.
  float3 opticalDepth = 0.0;
  float2 sampleUV = uv;
  float  stepLen  = p.thickness / (float)steps;

  for (int i = 0; i < steps; ++i)
  {
    sampleUV += uvStep;

    // Sample local density (thickness modulation).
    float density = thicknessMap.SampleLevel(mapSampler, sampleUV, 0);
    density *= p.densityScale;

    // Accumulate extinction: σ_t * density * step_length.
    opticalDepth += p.extinction * density * stepLen;
  }

  // Beer-Lambert transmittance.
  float3 transmittance = exp(-opticalDepth);

  // Wrap lighting factor: softens the transition into shadow.
  // wrap(NdotL) = (NdotL + w) / (1 + w)²
  // We approximate by scaling transmittance by (1 + wrapFactor) to
  // widen the transmission halo.  The caller can also apply wrap to
  // NdotL separately.
  float wrapBoost = (1.0 + p.wrapFactor) * (1.0 + p.wrapFactor);
  transmittance *= wrapBoost;

  // Final subsurface color.
  return p.scatterColor * transmittance;
}

// ---------------------------------------------------------------------------
// 1.11d  Emissive Volume Raymarch
// ---------------------------------------------------------------------------
// Self-emitting volume variant: for materials that glow from within
// (lava, energy orbs, magical effects).  Instead of transmitting external
// light, this accumulates self-emission along the view ray through the
// slab, attenuated by Beer-Lambert absorption.
//
// The technique is identical to 1.11c but marches along the VIEW
// direction (V) instead of the light direction, and accumulates emission
// color per step rather than transmitting an external light source.
//
// Parameters:
//   uv             – base texture coordinate
//   viewDirTS      – view direction in tangent space (from
//                    WorldDirToUVStep with -V)
//   emissionMap    – Texture2D<float3> encoding per-texel emission color.
//                    If unavailable, bind a constant-color texture.
//   mapSampler     – sampler for emission/density maps
//   p              – SubsurfaceRaymarchParams (extinction, thickness, etc.
//                    scatterColor is repurposed as emission tint)
//
// Returns:  float3 accumulated emission (linear RGB, HDR).
//           ADD to the final pixel color (not modulated by lights).
//
// Usage:
//   float3 emission = renodx::rendering::EmissiveVolumeRaymarch(
//       uv, viewDirTS, emissionTex, linearWrapSampler,
//       renodx::rendering::SubsurfaceParamsEmissive());
//   finalColor += emission;
// ---------------------------------------------------------------------------
float3 EmissiveVolumeRaymarch(
    float2              uv,
    float3              viewDirTS,
    Texture2D<float3>   emissionMap,
    SamplerState        mapSampler,
    SubsurfaceRaymarchParams p)
{
  int steps = clamp(p.numSteps, 1, 32);

  float3 tsDir = viewDirTS;
  float  depthPerUnit = max(abs(tsDir.z), 1e-4);
  float2 uvStep = (tsDir.xy / depthPerUnit) * (p.thickness / (float)steps);
  float  stepLen = p.thickness / (float)steps;

  float3 accumulated = 0.0;
  float3 transmittance = 1.0;
  float2 sampleUV = uv;

  for (int i = 0; i < steps; ++i)
  {
    sampleUV += uvStep;

    // Sample emission at this depth slice.
    float3 emission = emissionMap.SampleLevel(mapSampler, sampleUV, 0);
    emission *= p.scatterColor;  // tint

    // Beer-Lambert attenuation for this step.
    float3 stepAtten = exp(-p.extinction * p.densityScale * stepLen);

    // Accumulate: emission weighted by current transmittance times step.
    accumulated += transmittance * emission * stepLen;

    // Update transmittance for next step.
    transmittance *= stepAtten;
  }

  return accumulated;
}

// ---------------------------------------------------------------------------
// 1.11e  Screen-Space SSS Post-Process
// ---------------------------------------------------------------------------
// When the TBN is NOT available (e.g. in a deferred compositing pass),
// this screen-space alternative blurs the diffuse lighting in a
// directional kernel oriented along the projected light vector.
//
// This is NOT equivalent to the material-space raymarch — it misses
// back-face contribution and has view-dependent artefacts.  But it's
// a practical fallback that still looks much better than no SSS.
//
// The kernel samples neighbouring pixels in screen space along the
// light direction, weighting each by a Gaussian × Beer-Lambert
// falloff profile.  Channel-dependent falloff widths simulate the
// different mean free paths for RGB (red scatters furthest).
//
// Parameters:
//   colorTex       – scene color buffer (linear RGB, pre-lit)
//   depthTex       – hardware depth buffer (for depth-aware weighting)
//   colorSampler   – sampler for color buffer (linear clamp)
//   depthSampler   – sampler for depth buffer (point clamp)
//   screenUV       – current pixel's screen-space UV [0,1]²
//   lightDirSS     – light direction in screen space (xy, normalized)
//   scatterWidth   – per-channel scatter width in UV space.
//                    float3(0.015, 0.007, 0.004) is a reasonable default
//                    for skin (red scatters widest).
//   numSamples     – number of blur samples per side (default 4,
//                    total samples = 2 * numSamples + 1)
//   depthThreshold – max depth difference before rejecting a sample
//                    (prevents bleeding across depth discontinuities)
//   strength       – overall SSS intensity (default 0.5)
//
// Returns:  float3 blurred color with directional SSS applied.
//
// Usage (deferred compositing pass):
//   float3 sss = renodx::rendering::SubsurfaceRaymarchPostProcess(
//       colorBuffer, depthBuffer, linearClampSampler, pointClampSampler,
//       uv, lightDirScreenSpace);
//   finalColor = lerp(finalColor, sss, skinMask);
// ---------------------------------------------------------------------------
float3 SubsurfaceRaymarchPostProcess(
    Texture2D<float3>   colorTex,
    Texture2D<float>    depthTex,
    SamplerState        colorSampler,
    SamplerState        depthSampler,
    float2              screenUV,
    float2              lightDirSS,
    float3              scatterWidth   = float3(0.015, 0.007, 0.004),
    int                 numSamples     = 4,
    float               depthThreshold = 0.005,
    float               strength       = 0.5)
{
  float  centerDepth = depthTex.SampleLevel(depthSampler, screenUV, 0);
  float3 centerColor = colorTex.SampleLevel(colorSampler, screenUV, 0);

  float3 accumColor = centerColor;
  float3 accumWeight = 1.0;

  float2 dir = normalize(lightDirSS + 1e-6);

  for (int i = 1; i <= numSamples; ++i)
  {
    float t = (float)i / (float)numSamples;

    // Per-channel UV offsets (different scatter widths).
    [unroll]
    for (int sign = -1; sign <= 1; sign += 2)
    {
      float3 sampleColor = 0.0;
      float3 sampleWeight = 0.0;

      // Sample at the red channel's (widest) scatter width for position.
      float2 offset = dir * (t * scatterWidth.x) * (float)sign;
      float2 sampleUV = screenUV + offset;

      // Depth-aware rejection.
      float sampleDepth = depthTex.SampleLevel(depthSampler, sampleUV, 0);
      float depthDiff = abs(sampleDepth - centerDepth);
      if (depthDiff > depthThreshold) continue;

      float3 texel = colorTex.SampleLevel(colorSampler, sampleUV, 0);

      // Per-channel Gaussian weights based on scatter widths.
      float3 sigma = scatterWidth * (float)numSamples;
      float3 dist3 = float3(
          length(offset),
          length(dir * (t * scatterWidth.y) * (float)sign),
          length(dir * (t * scatterWidth.z) * (float)sign)
      );
      float3 gaussian = exp(-0.5 * (dist3 * dist3) / (sigma * sigma + 1e-6));

      // Depth similarity weight.
      float depthWeight = 1.0 - saturate(depthDiff / depthThreshold);
      gaussian *= depthWeight;

      accumColor += texel * gaussian;
      accumWeight += gaussian;
    }
  }

  float3 blurred = accumColor / max(accumWeight, 1e-6);
  return lerp(centerColor, blurred, strength);
}

// ---------------------------------------------------------------------------
// 1.11f  Transmittance Helpers
// ---------------------------------------------------------------------------
// Low-level Beer-Lambert and thin-slab transmittance utilities used
// by the subsurface raymarch functions above, and also useful
// independently for any absorption / transmission calculation.
// ---------------------------------------------------------------------------

// Standard Beer-Lambert transmittance.
//
// T = exp(-σ_t * d)
//
// Parameters:
//   extinction – per-channel extinction coefficient (σ_t)
//   distance   – path length through the medium
//
// Returns:  float3 transmittance [0,1] per channel.
float3 BeerLambert(float3 extinction, float distance)
{
  return exp(-extinction * distance);
}

// Chromatic Beer-Lambert with configurable per-channel mean free path.
//
// The mean free path (MFP) is the average distance a photon travels
// before being absorbed: MFP = 1 / σ_t.  Expressing absorption in
// terms of MFP is more intuitive for artists:
//   Small MFP = dense, absorbs quickly  (e.g. blue in skin)
//   Large MFP = translucent, scatters far  (e.g. red in skin)
//
// Parameters:
//   meanFreePath – per-channel mean free path (1/σ_t), world units
//   distance     – path length through the medium
//
// Returns:  float3 transmittance [0,1] per channel.
float3 BeerLambertChromatic(float3 meanFreePath, float distance)
{
  float3 extinction = 1.0 / max(meanFreePath, 1e-6);
  return exp(-extinction * distance);
}

// Thin slab transmittance approximation.
//
// For very thin translucent surfaces (leaves, paper, fabric), a full
// raymarch is overkill.  This computes single-pass transmittance
// through a slab of given thickness, with wrap lighting to soften
// the light/dark transition.
//
// Parameters:
//   NdotL       – dot(normal, lightDir), NOT clamped
//   extinction  – per-channel extinction coefficient
//   thickness   – slab thickness in world units
//   wrapFactor  – [0,1] wrap lighting (0 = Lambert, 1 = full wrap)
//
// Returns:  float3 transmitted light fraction (linear RGB).
//           Multiply by lightColor * albedo for final contribution.
float3 ThinSlabTransmittance(
    float  NdotL,
    float3 extinction,
    float  thickness,
    float  wrapFactor = 0.5)
{
  // Wrap the NdotL to allow light from behind.
  float wrappedNdotL = (NdotL + wrapFactor) / ((1.0 + wrapFactor) * (1.0 + wrapFactor));
  wrappedNdotL = max(wrappedNdotL, 0.0);

  // Effective path length: thickness / cos(angle), clamped.
  float cosAngle = max(abs(NdotL), 0.1);
  float pathLength = thickness / cosAngle;

  float3 transmittance = exp(-extinction * pathLength);

  return transmittance * wrappedNdotL;
}

// ============================================================================
// 1.12  IS-FAST Noise Sampling
// ----------------------------------------------------------------------------
// Importance-Sampled Filter-Adapted Spatio-Temporal noise helpers.
//
// Reference:
//   "Importance-Sampled Filter-Adapted Spatio-Temporal Sampling"
//   JCGT Vol.14, No.1, 2025
//   https://jcgt.org/published/0014/01/08/
//
// Background:
//   Stochastic rendering effects (SSAO, SSR, soft shadows, volumetrics,
//   depth of field) all require random samples.  The quality of these
//   samples has a dramatic effect on both visual noise and convergence
//   speed under temporal accumulation (TAA).
//
//   Sample quality ladder (worst → best):
//     1. White noise       — clumpy, slow convergence
//     2. Blue noise (2D)   — perceptually pleasant, better coverage
//     3. STBN              — blue noise across space AND time
//     4. FAST              — blue noise optimized for the reconstruction
//                            filter (e.g. TAA's exponential moving average)
//     5. IS-FAST           — all of the above PLUS exact importance
//                            sampling for arbitrary distributions
//
//   IS-FAST extends FAST noise to support general distributions by warping
//   pre-computed uniform spatio-temporal blue noise samples through the
//   inverse CDF of the target distribution.  Because monotonic transforms
//   preserve rank ordering, the blue noise structure is maintained after
//   the warp.
//
// How to use with RenoDX:
//   1. Obtain a FAST noise volume as a DDS Texture3D.  Two options:
//
//      Option A (recommended): Download the official EA pre-generated
//      textures from the IS-FAST paper repository and pack them with
//      scripts/pack_ea_fast_noise.py.  This produces a 128×128×32
//      RG8_UNORM Texture3D optimized by the FAST optimizer for EMA
//      temporal accumulation (TAA).  Use SampleISFAST_RG() with
//      volumeSize=128, temporalSlices=32.
//
//      Option B: Generate your own with scripts/generate_isfast_noise.py.
//      Uses Void-and-Cluster blue noise + R2 temporal offset.  Produces
//      a 64×64×64 R8_UNORM or RG8_UNORM volume.  Good quality but not
//      filter-adapted (no FAST optimization pass).
//
//   2. In the RenoDX addon, create a Texture3D from the DDS and bind
//      it to an unused SRV slot (e.g. t15) via push_descriptors.
//   3. In replaced shaders, declare the Texture3D and sample using the
//      helpers below.
//   4. Warp the uniform [0,1] sample through the inverse CDF of the
//      target distribution (cosine hemisphere, GGX NDF, bokeh shape,
//      Henyey-Greenstein phase, etc.).
//
// Sections:
//   a) Core sampling — fetch from the 3D noise volume
//   b) Distribution warps — inverse CDF transforms for common
//      rendering distributions
//   c) Interleaved Gradient Noise fallback — when no external texture
//      is available, a self-contained analytic approximation
// ============================================================================

// ---------------------------------------------------------------------------
// 1.12a  Core IS-FAST Sampling
// ---------------------------------------------------------------------------
// Fetch a uniform [0,1] sample from a pre-computed IS-FAST 3D noise
// volume.  The volume is tiled spatially (wrapping in UV) and indexed
// temporally by frame number.
//
// The returned value has spatio-temporal blue noise properties: nearby
// pixels in the same frame get well-separated values, AND the same pixel
// across consecutive frames also gets well-separated values.  This means
// both spatial noise quality and TAA convergence are optimized.
//
// Parameters:
//   noiseVolume    – pre-computed 3D noise texture (Texture3D<float>)
//                    Format: R8_UNORM, 64×64×64 typical.
//                    Bound via RenoDX addon push_descriptors.
//   wrapSampler    – point-wrap sampler (tiles spatially, wraps in W)
//   pixelCoord     – integer pixel coordinate (SV_Position.xy)
//   frameIndex     – monotonically increasing frame counter (from
//                    RenoDX injected constant buffer)
//   volumeSize     – spatial resolution of the noise volume (default 64)
//   temporalSlices – number of temporal slices (default 64)
//
// Returns:  uniform [0,1] sample with IS-FAST blue noise properties.
// ---------------------------------------------------------------------------
float SampleISFAST(
    Texture3D<float> noiseVolume,
    SamplerState     wrapSampler,
    float2           pixelCoord,
    uint             frameIndex,
    float            volumeSize     = 64.0,
    float            temporalSlices = 64.0)
{
  float3 uvw = float3(
      (pixelCoord + 0.5) / volumeSize,
      ((float)(frameIndex % (uint)temporalSlices) + 0.5) / temporalSlices
  );
  return noiseVolume.SampleLevel(wrapSampler, uvw, 0);
}

// ---------------------------------------------------------------------------
// 1.12a′  Two-Channel IS-FAST Sampling (for 2D distributions)
// ---------------------------------------------------------------------------
// Returns two decorrelated uniform samples from the same volume by
// sampling at two spatially offset positions.  The offset values
// (37, 17) are co-prime with typical volume sizes (64, 128) ensuring
// the two channels are decorrelated.
//
// For RG8_UNORM volumes (two channels baked into one texture), use
// SampleISFAST_RG instead.
//
// Parameters:
//   noiseVolume    – Texture3D<float> (single-channel volume)
//   wrapSampler    – point-wrap sampler
//   pixelCoord     – pixel position
//   frameIndex     – frame counter
//   volumeSize     – spatial resolution (default 64)
//   temporalSlices – temporal slices (default 64)
//
// Returns:  float2 with two decorrelated uniform [0,1] samples.
// ---------------------------------------------------------------------------
float2 SampleISFAST_2D(
    Texture3D<float> noiseVolume,
    SamplerState     wrapSampler,
    float2           pixelCoord,
    uint             frameIndex,
    float            volumeSize     = 64.0,
    float            temporalSlices = 64.0)
{
  float xi1 = SampleISFAST(noiseVolume, wrapSampler,
      pixelCoord, frameIndex, volumeSize, temporalSlices);
  float xi2 = SampleISFAST(noiseVolume, wrapSampler,
      pixelCoord + float2(37.0, 17.0), frameIndex,
      volumeSize, temporalSlices);
  return float2(xi1, xi2);
}

// ---------------------------------------------------------------------------
// 1.12a″  Two-Channel IS-FAST Sampling (RG8 volume)
// ---------------------------------------------------------------------------
// For volumes stored as RG8_UNORM (two decorrelated channels baked
// together), this samples both channels in a single texture fetch.
//
// Parameters:
//   noiseVolume    – Texture3D<float2> (two-channel volume)
//   wrapSampler    – point-wrap sampler
//   pixelCoord     – pixel position
//   frameIndex     – frame counter
//   volumeSize     – spatial resolution (default 64)
//   temporalSlices – temporal slices (default 64)
//
// Returns:  float2 with two decorrelated uniform [0,1] samples.
// ---------------------------------------------------------------------------
float2 SampleISFAST_RG(
    Texture3D<float2> noiseVolume,
    SamplerState      wrapSampler,
    float2            pixelCoord,
    uint              frameIndex,
    float             volumeSize     = 64.0,
    float             temporalSlices = 64.0)
{
  float3 uvw = float3(
      (pixelCoord + 0.5) / volumeSize,
      ((float)(frameIndex % (uint)temporalSlices) + 0.5) / temporalSlices
  );
  return noiseVolume.SampleLevel(wrapSampler, uvw, 0);
}

// ---------------------------------------------------------------------------
// 1.12b  Distribution Warps — Inverse CDF Transforms
// ---------------------------------------------------------------------------
// These functions transform uniform [0,1] IS-FAST samples into
// importance-sampled directions for common rendering distributions.
//
// The key insight from the IS-FAST paper: monotonic transforms (inverse
// CDF) preserve the rank ordering of samples, which means the blue
// noise structure survives the warp.  The result is importance-sampled
// AND spatio-temporally well-distributed.
//
// Each function takes one or two uniform samples and returns a
// tangent-space direction (z-up).  The caller must rotate to world
// space using the local TBN.
// ---------------------------------------------------------------------------

// Cosine-weighted hemisphere (for diffuse / SSAO).
//
// Inverse CDF:  cos(θ) = √ξ₁,  φ = 2πξ₂
//
// The cosine distribution concentrates samples where NdotL is high,
// reducing variance for diffuse lighting integrals.  With IS-FAST,
// the samples are also spatially and temporally jittered.
//
// Parameters:
//   xi1, xi2 – two uniform [0,1] IS-FAST samples
//
// Returns:  tangent-space direction (z = up = normal direction).
float3 ISFASTCosineHemisphere(float xi1, float xi2)
{
  float cosTheta = sqrt(xi1);
  float sinTheta = sqrt(1.0 - xi1);
  float phi = 6.28318530718 * xi2;
  return float3(sinTheta * cos(phi), sinTheta * sin(phi), cosTheta);
}

// GGX / Trowbridge-Reitz NDF importance sampling (for specular).
//
// Inverse CDF:  cos(θ_h) = √((1 - ξ₁) / (1 + (α⁴ - 1)ξ₁))
//               φ = 2πξ₂
//
// This samples the GGX normal distribution function, concentrating
// half-vectors where the NDF is highest.  Critical for specular IBL
// and screen-space reflections — eliminates most firefly variance.
//
// Parameters:
//   xi1, xi2  – two uniform [0,1] IS-FAST samples
//   roughness – perceptual roughness [0,1] (squared internally to α²)
//
// Returns:  tangent-space half-vector direction.
float3 ISFASTImportanceSampleGGX(float xi1, float xi2, float roughness)
{
  float a  = roughness * roughness;
  float a2 = a * a;

  float cosTheta = sqrt((1.0 - xi1) / (1.0 + (a2 - 1.0) * xi1));
  float sinTheta = sqrt(1.0 - cosTheta * cosTheta);
  float phi = 6.28318530718 * xi2;

  return float3(sinTheta * cos(phi), sinTheta * sin(phi), cosTheta);
}

// Uniform hemisphere sampling (for unbiased AO / visibility tests).
//
// Inverse CDF:  cos(θ) = ξ₁,  φ = 2πξ₂
//
// Equal probability over the full hemisphere.  Used when no cosine
// weighting is desired (e.g. some AO formulations, visibility probes).
//
// Parameters:
//   xi1, xi2 – two uniform [0,1] IS-FAST samples
//
// Returns:  tangent-space direction (z = up).
float3 ISFASTUniformHemisphere(float xi1, float xi2)
{
  float cosTheta = xi1;
  float sinTheta = sqrt(1.0 - xi1 * xi1);
  float phi = 6.28318530718 * xi2;
  return float3(sinTheta * cos(phi), sinTheta * sin(phi), cosTheta);
}

// Uniform disc sampling (for depth of field / bokeh).
//
// Concentric disc mapping (Shirley & Chiu 1997) preserves stratification
// better than the naive sqrt(r) * angle approach.
//
// Parameters:
//   xi1, xi2 – two uniform [0,1] IS-FAST samples
//
// Returns:  float2 point on the unit disc [-1,1]².
float2 ISFASTUniformDisc(float xi1, float xi2)
{
  // Map [0,1]² → [-1,1]²
  float a = 2.0 * xi1 - 1.0;
  float b = 2.0 * xi2 - 1.0;

  // Concentric mapping.
  float r, phi;
  if (a * a > b * b) {
    r   = a;
    phi = (3.14159265359 / 4.0) * (b / (a + 1e-10));
  } else {
    r   = b;
    phi = (3.14159265359 / 2.0) - (3.14159265359 / 4.0) * (a / (b + 1e-10));
  }
  return float2(r * cos(phi), r * sin(phi));
}

// Henyey-Greenstein phase function importance sampling
// (for volumetric fog / participating media).
//
// Inverse CDF:
//   cos(θ) = (1/(2g)) × (1 + g² − ((1 − g²)/(1 + g − 2gξ₁))²)
//   φ = 2πξ₂
//
// When |g| is small (nearly isotropic), falls back to uniform sphere.
//
// Parameters:
//   xi1, xi2 – two uniform [0,1] IS-FAST samples
//   g        – asymmetry parameter [-1,1].
//              0 = isotropic, >0 = forward scattering, <0 = back.
//              Typical values: fog ≈ 0.5–0.8, Rayleigh ≈ 0.
//
// Returns:  float3 scattering direction in the frame where the
//           incident direction points along +Z.
float3 ISFASTHenyeyGreenstein(float xi1, float xi2, float g)
{
  float cosTheta;

  if (abs(g) < 1e-4) {
    // Isotropic: uniform sphere sampling.
    cosTheta = 1.0 - 2.0 * xi1;
  } else {
    float s = (1.0 - g * g) / (1.0 + g - 2.0 * g * xi1);
    cosTheta = (1.0 + g * g - s * s) / (2.0 * g);
  }

  cosTheta = clamp(cosTheta, -1.0, 1.0);
  float sinTheta = sqrt(max(0.0, 1.0 - cosTheta * cosTheta));
  float phi = 6.28318530718 * xi2;

  return float3(sinTheta * cos(phi), sinTheta * sin(phi), cosTheta);
}

// Exponential distribution (for volumetric ray march free-path sampling).
//
// Inverse CDF:  t = -ln(1 - ξ) / σ_t
//
// Samples the distance to the next scattering/absorption event in a
// homogeneous participating medium.  σ_t is the extinction coefficient.
//
// Parameters:
//   xi         – uniform [0,1] IS-FAST sample
//   extinction – extinction coefficient (σ_t), scalar
//
// Returns:  free-path distance (world units).
float ISFASTExponentialFreePath(float xi, float extinction)
{
  return -log(max(1.0 - xi, 1e-10)) / max(extinction, 1e-10);
}

// ---------------------------------------------------------------------------
// 1.12c  Interleaved Gradient Noise Fallback
// ---------------------------------------------------------------------------
// When no external IS-FAST texture is bound (e.g. the RenoDX addon
// hasn't set up the SRV yet, or the game intercepts the binding), these
// purely analytic functions provide a reasonable self-contained fallback.
//
// Interleaved Gradient Noise (Jimenez 2014) is widely used in game
// engines for stochastic jittering.  It has decent spatial blue-noise
// properties (low-frequency error) and is trivially cheap.
//
// The temporal variant adds an R2-sequence offset per frame for better
// TAA convergence — not as good as true FAST noise, but far better
// than static IGN.
//
// Use these when the IS-FAST texture approach isn't feasible.
// ---------------------------------------------------------------------------

// Standard Interleaved Gradient Noise (static, single frame).
//
// From: Jorge Jimenez, "Next Generation Post Processing in Call of Duty:
//       Advanced Warfare", SIGGRAPH 2014.
//
// Parameters:
//   pixelCoord – integer pixel coordinate (SV_Position.xy)
//
// Returns:  pseudo-random value in [0,1) with low-frequency error.
float InterleavedGradientNoise(float2 pixelCoord)
{
  return frac(52.9829189 * frac(0.06711056 * pixelCoord.x
                              + 0.00583715 * pixelCoord.y));
}

// Temporally animated IGN using the R2 quasi-random sequence.
//
// The R2 sequence (based on the plastic constant) has optimal
// low-discrepancy properties in 1D.  Adding it to IGN decorrelates
// successive frames, which TAA accumulates more cleanly.
//
// Parameters:
//   pixelCoord – integer pixel coordinate (SV_Position.xy)
//   frameIndex – monotonically increasing frame counter
//
// Returns:  animated pseudo-random value in [0,1).
float InterleavedGradientNoiseTemporal(float2 pixelCoord, uint frameIndex)
{
  // Plastic constant reciprocal (R2 base for 1D).
  static const float R2_ALPHA = 0.7548776662466927;
  float base = InterleavedGradientNoise(pixelCoord);
  return frac(base + R2_ALPHA * (float)frameIndex);
}

// Two-channel temporally animated IGN.
//
// Returns two decorrelated animated noise values for 2D importance
// sampling without an external texture.
//
// Parameters:
//   pixelCoord – integer pixel coordinate (SV_Position.xy)
//   frameIndex – monotonically increasing frame counter
//
// Returns:  float2 with two decorrelated values in [0,1).
float2 InterleavedGradientNoiseTemporal2D(float2 pixelCoord, uint frameIndex)
{
  static const float R2_ALPHA1 = 0.7548776662466927;
  static const float R2_ALPHA2 = 0.5698402909980532;

  float base1 = InterleavedGradientNoise(pixelCoord);
  float base2 = InterleavedGradientNoise(pixelCoord + float2(47.0, 17.0));

  return float2(
      frac(base1 + R2_ALPHA1 * (float)frameIndex),
      frac(base2 + R2_ALPHA2 * (float)frameIndex)
  );
}

// ============================================================================
// 1.13  GPU-Friendly Laplacian Texture Blending
// ----------------------------------------------------------------------------
// Reference:
//   "GPU-Friendly Laplacian Texture Blending"
//   JCGT Vol. 14, No. 1, 2025
//   https://jcgt.org/published/0014/01/02/
//
// Standard texture blending (lerp(texA, texB, mask)) has an inherent
// problem: no single blending radius works for all frequency content.
//   • Small radius → sharp, but low-frequency features show a visible seam
//   • Large radius → smooth, but high-frequency details lose contrast/ghost
//
// Solution: decompose textures into frequency bands using the existing
// mipmap chain as a Laplacian pyramid, then blend each band with an
// appropriately-sized radius:
//   • Low frequencies  → wide blending radius  (smooth color transitions)
//   • High frequencies → narrow blending radius (preserve sharp detail)
//
// Key GPU-friendly insight: a standard mipmap chain IS a Gaussian pyramid.
// The Laplacian at level i is simply:
//   L_i = tex.SampleLevel(uv, mip_i) - tex.SampleLevel(uv, mip_{i+1})
// No precomputation, no extra memory, no LUTs, no neural networks.
//
// Cost: a few extra texture fetches at lower mip levels per blend.
// Lower mips are tiny and highly cache-coherent, so cost is minimal.
//
// Applications for RenoDX:
//   • Terrain / material splatting (grass-to-dirt, rock-to-snow)
//   • Decal edge blending (preserve underlying + decal detail)
//   • Weather overlays (wetness, snow, dust accumulation masks)
//   • LOD cross-fade (blend LOD levels without ghosting)
//   • Tone mapping detail preservation (Exposure Fusion style)
//   • Procedural texture compositing
//
// Sections:
//   a) Laplacian Level Extraction
//   b) Two-Texture Laplacian Blend (core algorithm)
//   b′) Two-Texture Laplacian Blend (scalar mask, no mask texture)
//   c) Three-Texture Laplacian Blend (terrain tri-splat)
//   d) Four-Texture Laplacian Blend (terrain quad-splat)
//   e) Laplacian Detail Preservation (tone mapping / color grading)
//   e′) Laplacian Detail Preservation with Strength Control
//   f) Laplacian Decal Blend
// ============================================================================

// ---------------------------------------------------------------------------
// 1.13a  Laplacian Level Extraction
// ---------------------------------------------------------------------------
// Extracts a single Laplacian pyramid level from a texture's mip chain.
//
// The Laplacian at level i captures the detail (high-frequency content)
// at that scale.  It is computed as the difference between adjacent
// Gaussian (mip) levels:
//
//   L_i = G_i - upsample(G_{i+1})
//
// On the GPU, "upsample(G_{i+1})" is simply sampling mip level i+1 at
// the same UV coordinates — hardware bilinear filtering provides the
// upsampling interpolation automatically.
//
// Parameters:
//   tex     – source texture with mipmap chain
//   samp    – bilinear/trilinear sampler
//   uv      – texture coordinates
//   mipLow  – lower (finer) mip level index (e.g., 0 for full res)
//   mipHigh – higher (coarser) mip level index (e.g., 1)
//
// Returns: float4 Laplacian detail at this frequency band.
//          This can contain negative values (detail is a signed signal).
// ---------------------------------------------------------------------------
float4 LaplacianLevel(
    Texture2D<float4> tex,
    SamplerState      samp,
    float2            uv,
    float             mipLow,
    float             mipHigh)
{
  return tex.SampleLevel(samp, uv, mipLow) -
         tex.SampleLevel(samp, uv, mipHigh);
}

// ---------------------------------------------------------------------------
// 1.13b  Two-Texture Laplacian Blend
// ---------------------------------------------------------------------------
// Core algorithm: blends two textures using Laplacian pyramid decomposition
// with per-level mask blurring.
//
// The blend equation (from the paper):
//
//   Blend(x, y, m) = G_xn · G_mn + G_yn · (1 - G_mn)
//                  + Σ_{i=0}^{n-1} [ L_xi · G_mi + L_yi · (1 - G_mi) ]
//
// Where:
//   L_xi  = Laplacian of texture x at level i (detail band)
//   G_xn  = Gaussian of texture x at level n (lowest frequency residual)
//   G_mi  = mask sampled at mip level i (progressively blurred)
//
// The mask is blurred by sampling it at increasing mip levels.  This
// requires the mask texture to have a mipmap chain — if using a
// procedural mask (vertex color, computed value), encode it into a
// texture with mips, or use the scalar variant (1.13b′).
//
// Parameters:
//   texA, texB  – the two textures to blend (with mip chains)
//   maskTex     – blend mask texture (with mip chains for per-level blur)
//                 0 = texA, 1 = texB
//   samp        – bilinear/trilinear sampler (LINEAR required)
//   uvA, uvB    – UV coordinates for each texture (may differ for tiled
//                 terrain)
//   uvMask      – UV coordinates for the mask
//   levels      – number of Laplacian levels (default 3).
//                 More levels = sharper detail preservation at higher cost.
//                 3 levels = 3 extra taps per texture = 6 total extra taps.
//                 Recommended: 2–4.
//
// Returns: float4 blended result preserving detail at all frequency bands.
// ---------------------------------------------------------------------------
float4 LaplacianBlend2(
    Texture2D<float4> texA,
    Texture2D<float4> texB,
    Texture2D<float4> maskTex,
    SamplerState      samp,
    float2            uvA,
    float2            uvB,
    float2            uvMask,
    int               levels = 3)
{
  // Pre-fetch all mip levels to avoid redundant texture fetches.
  // Each mip level is sampled exactly once per texture (paper Listing 1).
  static const int MAX_LEVELS = 6;
  levels = min(levels, MAX_LEVELS);

  float4 aLevels[MAX_LEVELS + 1];
  float4 bLevels[MAX_LEVELS + 1];
  float  mLevels[MAX_LEVELS + 1];

  [unroll]
  for (int s = 0; s <= MAX_LEVELS; s++) {
    if (s <= levels) {
      aLevels[s] = texA.SampleLevel(samp, uvA, (float)s);
      bLevels[s] = texB.SampleLevel(samp, uvB, (float)s);
      mLevels[s] = maskTex.SampleLevel(samp, uvMask, (float)s).r;
    }
  }

  // Start with the lowest-frequency Gaussian residual.
  float4 result = aLevels[levels] * (1.0 - mLevels[levels]) +
                  bLevels[levels] * mLevels[levels];

  // Accumulate each Laplacian detail band.
  [unroll]
  for (int i = 0; i < MAX_LEVELS; i++) {
    if (i < levels) {
      float4 lapA = aLevels[i] - aLevels[i + 1];
      float4 lapB = bLevels[i] - bLevels[i + 1];
      result += lapA * (1.0 - mLevels[i]) + lapB * mLevels[i];
    }
  }

  return result;
}

// ---------------------------------------------------------------------------
// 1.13b′  Two-Texture Laplacian Blend (Scalar Mask — No Mask Texture)
// ---------------------------------------------------------------------------
// Variant for when the blend mask is a scalar value (vertex color,
// procedural, constant buffer) rather than a texture with mip chain.
//
// Since we can't sample the mask at different mip levels to progressively
// blur it, we approximate the blur analytically:
//   maskBlurred(level) = lerp(0.5, mask, sharpness^level)
//
// As level increases (lower frequency), the mask trends toward 0.5 (equal
// blend), simulating a wider blending radius.
//
// Parameters:
//   texA, texB  – textures to blend (with mip chains)
//   samp        – bilinear/trilinear sampler
//   uvA, uvB    – UV coordinates for each texture
//   mask        – scalar blend mask [0,1].  0 = texA, 1 = texB.
//   levels      – Laplacian levels (default 3)
//   sharpness   – per-level mask sharpening factor (default 0.5)
//                 Lower = more blur per level = wider low-freq transition.
//                 Higher = less blur = sharper at all frequencies (approaches
//                 naive lerp as sharpness → 1.0).
//
// Returns: float4 blended result.
// ---------------------------------------------------------------------------
float4 LaplacianBlend2Scalar(
    Texture2D<float4> texA,
    Texture2D<float4> texB,
    SamplerState      samp,
    float2            uvA,
    float2            uvB,
    float             mask,
    int               levels    = 3,
    float             sharpness = 0.5)
{
  static const int MAX_LEVELS = 6;
  levels = min(levels, MAX_LEVELS);

  float4 aLevels[MAX_LEVELS + 1];
  float4 bLevels[MAX_LEVELS + 1];

  [unroll]
  for (int s = 0; s <= MAX_LEVELS; s++) {
    if (s <= levels) {
      aLevels[s] = texA.SampleLevel(samp, uvA, (float)s);
      bLevels[s] = texB.SampleLevel(samp, uvB, (float)s);
    }
  }

  // Analytically blurred mask for the Gaussian residual.
  float maskTop = lerp(0.5, mask, pow(sharpness, (float)levels));
  float4 result = aLevels[levels] * (1.0 - maskTop) +
                  bLevels[levels] * maskTop;

  // Detail bands with progressively sharper mask.
  [unroll]
  for (int i = 0; i < MAX_LEVELS; i++) {
    if (i < levels) {
      float4 lapA = aLevels[i] - aLevels[i + 1];
      float4 lapB = bLevels[i] - bLevels[i + 1];
      float  maskLevel = lerp(0.5, mask, pow(sharpness, (float)i));
      result += lapA * (1.0 - maskLevel) + lapB * maskLevel;
    }
  }

  return result;
}

// ---------------------------------------------------------------------------
// 1.13c  Three-Texture Laplacian Blend (Terrain Tri-Splat)
// ---------------------------------------------------------------------------
// Extends the two-texture blend to three textures using three masks.
// Common for terrain splatting where three materials converge (e.g.,
// grass / dirt / rock on a hillside).
//
// The masks should sum to ~1.0 at each pixel.  If they don't, the result
// will be biased.  Most terrain systems enforce this constraint in the
// mask texture or vertex color generation.
//
// Parameters:
//   texA/B/C     – three material textures (with mip chains)
//   maskTex      – mask texture where R=maskA, G=maskB, B=maskC
//   samp         – bilinear/trilinear sampler
//   uvA/B/C      – UV coordinates per material
//   uvMask       – mask UV coordinates
//   levels       – Laplacian levels (default 3)
//
// Returns: float4 blended result.
// ---------------------------------------------------------------------------
float4 LaplacianBlend3(
    Texture2D<float4> texA,
    Texture2D<float4> texB,
    Texture2D<float4> texC,
    Texture2D<float4> maskTex,
    SamplerState      samp,
    float2            uvA,
    float2            uvB,
    float2            uvC,
    float2            uvMask,
    int               levels = 3)
{
  static const int MAX_LEVELS = 6;
  levels = min(levels, MAX_LEVELS);

  float4 aLevels[MAX_LEVELS + 1];
  float4 bLevels[MAX_LEVELS + 1];
  float4 cLevels[MAX_LEVELS + 1];
  float3 mLevels[MAX_LEVELS + 1];

  [unroll]
  for (int s = 0; s <= MAX_LEVELS; s++) {
    if (s <= levels) {
      aLevels[s] = texA.SampleLevel(samp, uvA, (float)s);
      bLevels[s] = texB.SampleLevel(samp, uvB, (float)s);
      cLevels[s] = texC.SampleLevel(samp, uvC, (float)s);
      mLevels[s] = maskTex.SampleLevel(samp, uvMask, (float)s).rgb;
    }
  }

  float4 result = aLevels[levels] * mLevels[levels].r +
                  bLevels[levels] * mLevels[levels].g +
                  cLevels[levels] * mLevels[levels].b;

  [unroll]
  for (int i = 0; i < MAX_LEVELS; i++) {
    if (i < levels) {
      float4 lapA = aLevels[i] - aLevels[i + 1];
      float4 lapB = bLevels[i] - bLevels[i + 1];
      float4 lapC = cLevels[i] - cLevels[i + 1];
      result += lapA * mLevels[i].r + lapB * mLevels[i].g +
                lapC * mLevels[i].b;
    }
  }

  return result;
}

// ---------------------------------------------------------------------------
// 1.13d  Four-Texture Laplacian Blend (Terrain Quad-Splat)
// ---------------------------------------------------------------------------
// Four-material terrain blend.  Masks in RGBA channels of the mask texture.
//
// Parameters:
//   texA/B/C/D   – four material textures (with mip chains)
//   maskTex      – mask texture: R=A, G=B, B=C, A=D
//   samp         – bilinear/trilinear sampler
//   uvA/B/C/D    – UV coordinates per material
//   uvMask       – mask UV coordinates
//   levels       – Laplacian levels (default 3)
//
// Returns: float4 blended result.
// ---------------------------------------------------------------------------
float4 LaplacianBlend4(
    Texture2D<float4> texA,
    Texture2D<float4> texB,
    Texture2D<float4> texC,
    Texture2D<float4> texD,
    Texture2D<float4> maskTex,
    SamplerState      samp,
    float2            uvA,
    float2            uvB,
    float2            uvC,
    float2            uvD,
    float2            uvMask,
    int               levels = 3)
{
  static const int MAX_LEVELS = 6;
  levels = min(levels, MAX_LEVELS);

  float4 aLevels[MAX_LEVELS + 1];
  float4 bLevels[MAX_LEVELS + 1];
  float4 cLevels[MAX_LEVELS + 1];
  float4 dLevels[MAX_LEVELS + 1];
  float4 mLevels[MAX_LEVELS + 1];

  [unroll]
  for (int s = 0; s <= MAX_LEVELS; s++) {
    if (s <= levels) {
      aLevels[s] = texA.SampleLevel(samp, uvA, (float)s);
      bLevels[s] = texB.SampleLevel(samp, uvB, (float)s);
      cLevels[s] = texC.SampleLevel(samp, uvC, (float)s);
      dLevels[s] = texD.SampleLevel(samp, uvD, (float)s);
      mLevels[s] = maskTex.SampleLevel(samp, uvMask, (float)s);
    }
  }

  float4 result = aLevels[levels] * mLevels[levels].r +
                  bLevels[levels] * mLevels[levels].g +
                  cLevels[levels] * mLevels[levels].b +
                  dLevels[levels] * mLevels[levels].a;

  [unroll]
  for (int i = 0; i < MAX_LEVELS; i++) {
    if (i < levels) {
      float4 lapA = aLevels[i] - aLevels[i + 1];
      float4 lapB = bLevels[i] - bLevels[i + 1];
      float4 lapC = cLevels[i] - cLevels[i + 1];
      float4 lapD = dLevels[i] - dLevels[i + 1];
      float4 ml   = mLevels[i];
      result += lapA * ml.r + lapB * ml.g + lapC * ml.b + lapD * ml.a;
    }
  }

  return result;
}

// ---------------------------------------------------------------------------
// 1.13e  Laplacian Detail Preservation (Tone Mapping / Color Grading)
// ---------------------------------------------------------------------------
// Applies a color transformation (tone mapping, color grading, exposure
// adjustment) to an image while preserving high-frequency detail.
//
// This is the Exposure Fusion / HDR+ insight applied to real-time rendering:
//   1. Decompose the image into Laplacian frequency bands via the mip chain
//   2. Apply the color transform ONLY to the lowest-frequency residual
//   3. Re-add the untouched high-frequency detail bands
//
// The result: the overall color/exposure/tone mapping is applied correctly,
// but fine detail (texture grain, surface micro-structure, edge contrast)
// is preserved without the compression that tone mapping typically causes.
//
// This is particularly valuable for RenoDX tone mapping injection:
//   • Game's tone mapper compresses detail at high luminance
//   • Laplacian decomposition preserves that detail
//   • Combined: correct tone mapping curve + preserved micro-contrast
//
// IMPORTANT: The "color transform" is provided via the caller.  Since HLSL
// doesn't have function pointers, the caller must sample the low-frequency
// residual, apply their transform, and pass the result in.
//
// Parameters:
//   tex      – source image texture (with mip chain — may need to be
//              rendered to a texture with GenerateMips first)
//   samp     – bilinear sampler
//   uv       – pixel UV coordinates
//   texSize  – texture dimensions in pixels
//   levels   – number of Laplacian levels to preserve (default 3)
//   transformedLowFreq – the color-transformed lowest-frequency residual.
//              Caller must sample tex at the top mip, apply their transform,
//              and pass the result here.
//
// Returns: float3 color with transform applied to low frequencies and
//          high-frequency detail preserved.
//
// Usage:
//   float topMip = 3.0;
//   float3 lowFreq = sceneTex.SampleLevel(samp, uv, topMip).rgb;
//   float3 tonemappedLow = MyToneMap(lowFreq);  // your tone mapper
//   float3 result = renodx::rendering::LaplacianDetailPreserve(
//       sceneTex, samp, uv, texSize, 3, tonemappedLow);
// ---------------------------------------------------------------------------
float3 LaplacianDetailPreserve(
    Texture2D<float4> tex,
    SamplerState      samp,
    float2            uv,
    float2            texSize,
    int               levels,
    float3            transformedLowFreq)
{
  float3 result = transformedLowFreq;

  // Re-add each detail band from the ORIGINAL (untransformed) image.
  for (int i = levels - 1; i >= 0; i--) {
    float mipLow  = (float)i;
    float mipHigh = (float)(i + 1);

    float3 detail = LaplacianLevel(tex, samp, uv, mipLow, mipHigh).rgb;
    result += detail;
  }

  return result;
}

// ---------------------------------------------------------------------------
// 1.13e′  Laplacian Detail Preservation with Strength Control
// ---------------------------------------------------------------------------
// Same as 1.13e but with a per-level strength multiplier that controls
// how much detail is preserved at each frequency band.
//
// This allows artistic control:
//   • strength > 1.0 = detail enhancement (sharper than original)
//   • strength = 1.0 = exact preservation (original detail)
//   • strength < 1.0 = partial detail preservation
//   • strength = 0.0 = no preservation (same as applying transform directly)
//
// Parameters:
//   tex                – source image
//   samp               – bilinear sampler
//   uv                 – pixel UV
//   texSize            – texture dimensions
//   levels             – Laplacian levels (default 3)
//   transformedLowFreq – tone-mapped / color-graded low-frequency residual
//   detailStrength     – per-level detail preservation amount (default 1.0)
//   finestStrength     – strength for the finest (level 0) detail only.
//                        Controls sharpness of smallest features.
//                        Default: same as detailStrength (sentinel -1).
//
// Returns: float3 result with controlled detail preservation.
// ---------------------------------------------------------------------------
float3 LaplacianDetailPreserveControlled(
    Texture2D<float4> tex,
    SamplerState      samp,
    float2            uv,
    float2            texSize,
    int               levels,
    float3            transformedLowFreq,
    float             detailStrength = 1.0,
    float             finestStrength = -1.0)  // -1 sentinel = use detailStrength
{
  if (finestStrength < 0.0) finestStrength = detailStrength;

  float3 result = transformedLowFreq;

  for (int i = levels - 1; i >= 0; i--) {
    float mipLow  = (float)i;
    float mipHigh = (float)(i + 1);

    float3 detail = LaplacianLevel(tex, samp, uv, mipLow, mipHigh).rgb;

    // Use finest strength for level 0, general strength for others.
    float str = (i == 0) ? finestStrength : detailStrength;
    result += detail * str;
  }

  return result;
}

// ---------------------------------------------------------------------------
// 1.13f  Laplacian Decal Blend
// ---------------------------------------------------------------------------
// Blends a decal texture onto a base surface using Laplacian decomposition
// for the decal's alpha mask.
//
// Standard decal blending (base * (1-alpha) + decal * alpha) creates a
// soft edge that destroys both the base surface detail and the decal's
// edge crispness.  Laplacian blending preserves both:
//   • The base's high-frequency detail shows through at the decal edge
//   • The decal's own detail stays sharp
//   • The low-frequency color transition is smooth
//
// Parameters:
//   baseTex   – underlying surface texture (with mip chain)
//   decalTex  – decal texture (with mip chain, A = opacity mask)
//   samp      – bilinear sampler
//   uvBase    – surface UV coordinates
//   uvDecal   – decal projection UV coordinates
//   levels    – Laplacian levels (default 3)
//
// Returns: float4 blended result (RGB color, A = combined opacity).
// ---------------------------------------------------------------------------
float4 LaplacianDecalBlend(
    Texture2D<float4> baseTex,
    Texture2D<float4> decalTex,
    SamplerState      samp,
    float2            uvBase,
    float2            uvDecal,
    int               levels = 3)
{
  static const int MAX_LEVELS = 6;
  levels = min(levels, MAX_LEVELS);

  float4 baseLevels[MAX_LEVELS + 1];
  float4 decalLevels[MAX_LEVELS + 1];

  [unroll]
  for (int s = 0; s <= MAX_LEVELS; s++) {
    if (s <= levels) {
      baseLevels[s]  = baseTex.SampleLevel(samp, uvBase, (float)s);
      decalLevels[s] = decalTex.SampleLevel(samp, uvDecal, (float)s);
    }
  }

  // Lowest-frequency band: smooth color transition using blurred decal alpha.
  float maskTop = decalLevels[levels].a;
  float4 result;
  result.rgb = baseLevels[levels].rgb * (1.0 - maskTop) +
               decalLevels[levels].rgb * maskTop;
  result.a   = max(baseLevels[levels].a, decalLevels[levels].a);

  // Detail bands with progressively sharper decal alpha.
  [unroll]
  for (int i = 0; i < MAX_LEVELS; i++) {
    if (i < levels) {
      float4 lapBase  = baseLevels[i]  - baseLevels[i + 1];
      float4 lapDecal = decalLevels[i] - decalLevels[i + 1];
      float  maskLevel = decalLevels[i].a;
      result.rgb += lapBase.rgb * (1.0 - maskLevel) +
                    lapDecal.rgb * maskLevel;
    }
  }

  return result;
}

// ---------------------------------------------------------------------------
// 1.13g  Normal Map Laplacian Blend
// ---------------------------------------------------------------------------
// Blends two normal maps using Laplacian decomposition.
//
// Standard normal map blending has the same problems as texture blending
// but worse — discontinuities in normal maps create visible surface
// shading artifacts (lighting seams), and wide blending attenuates
// normal detail, pushing normals toward flat (0,0,1) (Figure 11 in
// the paper).
//
// Laplacian blending preserves normal map detail at transitions:
//   • Fine surface bumps remain sharp at the blend boundary
//   • Large-scale surface curvature transitions smoothly
//   • No visible lighting seams or flat spots
//
// The blend operates on the raw normal map values (typically stored as
// unsigned [0,1] with the * 2 - 1 decode applied after blending).
// After blending, the result is decoded and renormalized.
//
// Parameters:
//   normalA, normalB – normal map textures (with mip chains, unsigned)
//   maskTex          – blend mask texture (with mip chains)
//   samp             – bilinear/trilinear sampler
//   uvA, uvB         – UV coordinates for each normal map
//   uvMask           – mask UV coordinates
//   levels           – Laplacian levels (default 3)
//
// Returns: float3 blended normal (normalized, tangent space).
// ---------------------------------------------------------------------------
float3 LaplacianBlendNormals(
    Texture2D<float4> normalA,
    Texture2D<float4> normalB,
    Texture2D<float4> maskTex,
    SamplerState      samp,
    float2            uvA,
    float2            uvB,
    float2            uvMask,
    int               levels = 3)
{
  static const int MAX_LEVELS = 6;
  levels = min(levels, MAX_LEVELS);

  float4 aLevels[MAX_LEVELS + 1];
  float4 bLevels[MAX_LEVELS + 1];
  float  mLevels[MAX_LEVELS + 1];

  [unroll]
  for (int s = 0; s <= MAX_LEVELS; s++) {
    if (s <= levels) {
      aLevels[s] = normalA.SampleLevel(samp, uvA, (float)s);
      bLevels[s] = normalB.SampleLevel(samp, uvB, (float)s);
      mLevels[s] = maskTex.SampleLevel(samp, uvMask, (float)s).r;
    }
  }

  // Gaussian residual (lowest frequency normal direction).
  float4 result = aLevels[levels] * (1.0 - mLevels[levels]) +
                  bLevels[levels] * mLevels[levels];

  // Laplacian detail bands.
  [unroll]
  for (int i = 0; i < MAX_LEVELS; i++) {
    if (i < levels) {
      float4 lapA = aLevels[i] - aLevels[i + 1];
      float4 lapB = bLevels[i] - bLevels[i + 1];
      result += lapA * (1.0 - mLevels[i]) + lapB * mLevels[i];
    }
  }

  // Decode from [0,1] to [-1,1] and renormalize.
  float3 normal = result.rgb * 2.0 - 1.0;
  return normalize(normal);
}

// ---------------------------------------------------------------------------
// 1.13g′  Normal Map Laplacian Blend (Pre-Decoded Signed Normals)
// ---------------------------------------------------------------------------
// Variant for when normal maps are already decoded to [-1,1] range
// (e.g., BC5/ATI2 formats where RG are signed, or after manual decode).
// Skips the * 2 - 1 decode step.
//
// Parameters: same as 1.13g but normal textures contain signed values.
// Returns: float3 blended normal (normalized, tangent space).
// ---------------------------------------------------------------------------
float3 LaplacianBlendNormalsSigned(
    Texture2D<float4> normalA,
    Texture2D<float4> normalB,
    Texture2D<float4> maskTex,
    SamplerState      samp,
    float2            uvA,
    float2            uvB,
    float2            uvMask,
    int               levels = 3)
{
  static const int MAX_LEVELS = 6;
  levels = min(levels, MAX_LEVELS);

  float4 aLevels[MAX_LEVELS + 1];
  float4 bLevels[MAX_LEVELS + 1];
  float  mLevels[MAX_LEVELS + 1];

  [unroll]
  for (int s = 0; s <= MAX_LEVELS; s++) {
    if (s <= levels) {
      aLevels[s] = normalA.SampleLevel(samp, uvA, (float)s);
      bLevels[s] = normalB.SampleLevel(samp, uvB, (float)s);
      mLevels[s] = maskTex.SampleLevel(samp, uvMask, (float)s).r;
    }
  }

  float4 result = aLevels[levels] * (1.0 - mLevels[levels]) +
                  bLevels[levels] * mLevels[levels];

  [unroll]
  for (int i = 0; i < MAX_LEVELS; i++) {
    if (i < levels) {
      float4 lapA = aLevels[i] - aLevels[i + 1];
      float4 lapB = bLevels[i] - bLevels[i + 1];
      result += lapA * (1.0 - mLevels[i]) + lapB * mLevels[i];
    }
  }

  return normalize(result.xyz);
}

// ============================================================================
// 1.14  Geometric Specular Antialiasing (Projected-Space NDF Filtering)
// ----------------------------------------------------------------------------
// Reference: "Stable Geometric Specular Antialiasing with
//             Projected-Space NDF Filtering"
//            Tokuyoshi & Kaplanyan, JCGT Vol. 10, No. 2, 2021
//            https://jcgt.org/published/0010/02/02/
//
// Specular aliasing is caused by the GGX Normal Distribution Function
// (NDF) being narrower than the pixel footprint on smooth surfaces at
// distance or grazing angles.  A single shading sample either hits or
// misses the highlight, producing temporal flickering and bright speckles
// that TAA struggles to resolve.
//
// The original solution by Kaplanyan et al. [2016] filters the NDF in
// slope space [h_x/h_z, h_y/h_z].  This works well at moderate angles
// but the 1/h_z division diverges at grazing angles, creating bright
// rim artifacts (RMSE 12631.7 vs reference in the paper's Figure 1a).
//
// This paper replaces slope-space filtering with projected-space
// filtering: derivatives of [h_x, h_y] (simply dropping h_z).
// Because h_x, h_y are bounded in [−1, 1] for any normalised vector
// the derivatives never diverge.  The result is simultaneously:
//   • More stable (RMSE 0.134 vs reference)
//   • Simpler code (no division, fewer operations)
//
// The practical approximation (paper Eq. 9) is recommended.  The exact
// formulation (Eq. 8) is more expensive and requires invertible
// matrices (fails at α = 1).  The approximation produces identical
// RMSE in the paper's Figure 6 and is what we implement here.
//
// The filtered roughness is:
//   ā² = α² + min(2λ_max, κ)
// where λ_max is the maximum eigenvalue of the projected half-vector
// covariance Σ_⊥, and κ = 0.18 prevents overfiltering.
//
// Cost: ~4 ALU ops per pixel (fwidth + multiply + min + add).
//       No texture reads.  No branching.  Practically free.
//
// Sub-sections:
//   1.14a  Forward anisotropic NDF filtering  (2×2 matrix output)
//   1.14b  Forward isotropic NDF filtering    (scalar output)
//   1.14b′ Forward isotropic — scalar convenience
//   1.14c  Deferred isotropic NDF filtering   (normal-based proxy)
//   1.14c′ Deferred isotropic — world-space normal
//   1.14d  Tangent-space half vector helper
//   1.14e  Combined filter + roughness helper (forward)
//   1.14e′ Combined filter + roughness helper (deferred)
// ============================================================================

// ---------------------------------------------------------------------------
// 1.14a  Forward Anisotropic NDF Filtering
// ---------------------------------------------------------------------------
// Filters the roughness matrix for anisotropic GGX using projected-space
// half-vector derivatives.  Full non-axis-aligned formulation (paper
// Listing 2).
//
// The filtering kernel Σ_⊥ is the covariance of the projected half-vector
// derivatives:
//   Σ_⊥ = σ² · [Δh⊥_u, Δh⊥_v]^T · [Δh⊥_u, Δh⊥_v]
// where σ² = 1/(2π) ≈ 0.15915494.
//
// The filtered roughness matrix is:
//   Ā = A + 2Σ_⊥
//
// IMPORTANT: the half vector must be in TANGENT SPACE.  If the game's
// shader works in world space, transform H using the inverse TBN
// before calling this function.  See §1.14d for a helper.
//
// Parameters:
//   halfVectorTS – half vector in tangent space (normalised)
//   roughness2   – squared roughness per axis: float2(α_x², α_y²)
//
// Returns: float2x2 filtered roughness matrix.
//          For isotropic output use max of diagonal elements.
//          For anisotropic GGX (Part III §7) feed directly to the NDF.
// ---------------------------------------------------------------------------
float2x2 NDFFilteringAnisotropic(float3 halfVectorTS, float2 roughness2)
{
  // Project to 2D — simply drop z.
  // This is the core improvement over slope-space: no division by h_z
  // means no divergence at grazing angles.
  float2 halfVector2D = halfVectorTS.xy;

  // Screen-space derivatives of the projected half vector.
  float2 deltaU = ddx(halfVector2D);
  float2 deltaV = ddy(halfVector2D);

  // Covariance matrix of the derivatives: 2σ² · δ^T · δ
  // σ² = 1/(2π) — variance of a normalised Gaussian over the hemisphere.
  static const float SIGMA2 = 0.15915494;  // 1/(2π)
  float2x2 delta = float2x2(deltaU, deltaV);
  float2x2 kernelRoughnessMat = 2.0 * SIGMA2 * mul(transpose(delta), delta);

  // Original roughness as a diagonal matrix.
  float2x2 roughnessMat = float2x2(
    roughness2.x, 0.0,
    0.0,          roughness2.y
  );

  // Filtered roughness: Ā = A + 2Σ_⊥
  float2x2 filteredRoughnessMat = roughnessMat + kernelRoughnessMat;

  return filteredRoughnessMat;
}

// ---------------------------------------------------------------------------
// 1.14b  Forward Isotropic NDF Filtering (Axis-Aligned)
// ---------------------------------------------------------------------------
// Simplified version for isotropic roughness using the axis-aligned
// approximation (paper Listing 3).
//
// Uses fwidth() instead of separate ddx/ddy, computing the bounding
// rectangle of the derivatives.  Cheaper and produces nearly identical
// results for isotropic materials.
//
// Includes the κ = 0.18 clamping threshold to prevent overfiltering
// (paper §5.2).  Without clamping, high-curvature surfaces or noisy
// normal maps could produce excessively rough results.
//
// Parameters:
//   halfVectorTS – half vector in tangent space (normalised)
//   roughness2   – squared roughness per axis: float2(α_x², α_y²)
//
// Returns: float2 filtered squared roughness per axis.
//          For scalar isotropic: use max(result.x, result.y).
// ---------------------------------------------------------------------------
float2 NDFFilteringIsotropic(float3 halfVectorTS, float2 roughness2)
{
  // Project to 2D.
  float2 halfVector2D = halfVectorTS.xy;

  // Bounding rectangle of derivatives (cheaper than separate ddx/ddy).
  float2 bounds = fwidth(halfVector2D);

  // Axis-aligned kernel roughness: 2σ² · bounds²
  static const float SIGMA2 = 0.15915494;  // 1/(2π)
  float2 kernelRoughness2 = 2.0 * SIGMA2 * (bounds * bounds);

  // Clamping threshold to prevent overfiltering.
  // κ = 0.18 matches Kaplanyan 2016's threshold, validated in this paper.
  static const float KAPPA = 0.18;
  float2 clampedKernelRoughness2 = min(kernelRoughness2, KAPPA);

  // Filtered roughness, saturated to [0, 1].
  float2 filteredRoughness2 = saturate(roughness2 + clampedKernelRoughness2);

  return filteredRoughness2;
}

// ---------------------------------------------------------------------------
// 1.14b′  Forward Isotropic NDF Filtering — Scalar Convenience
// ---------------------------------------------------------------------------
// Same as 1.14b but takes and returns a single scalar roughness.
// This is the most common use case for isotropic materials.
//
// Parameters:
//   halfVectorTS    – half vector in tangent space (normalised)
//   roughnessAlpha  – linear roughness α (NOT perceptual roughness)
//                     α = perceptualRoughness²
//
// Returns: filtered linear roughness α (clamped to [0, 1]).
//
// Usage:
//   float alpha = perceptualRoughness * perceptualRoughness;
//   alpha = NDFFilteringScalar(H_tangent, alpha);
//   float D = GGX_D(NdotH, alpha);  // filtered NDF
// ---------------------------------------------------------------------------
float NDFFilteringScalar(float3 halfVectorTS, float roughnessAlpha)
{
  float2 result = NDFFilteringIsotropic(
    halfVectorTS,
    float2(roughnessAlpha * roughnessAlpha,
           roughnessAlpha * roughnessAlpha)
  );
  // Return the maximum of the two axes as conservative isotropic roughness.
  return sqrt(max(result.x, result.y));
}

// ---------------------------------------------------------------------------
// 1.14c  Deferred Isotropic NDF Filtering (Normal-Based Proxy)
// ---------------------------------------------------------------------------
// For deferred rendering the light direction (and thus the half vector)
// is unknown at G-buffer time.  The paper's §5.1 proposes using the
// average normal as a proxy for the half vector.
//
// This approximation assumes the “worst case” of distant light and
// camera, where the half vector approaches the normal.  It slightly
// overfilters compared to the forward version but eliminates specular
// aliasing from the G-buffer roughness.
//
// Apply in the G-buffer pixel shader to pre-filter roughness before
// writing to the roughness channel.
//
// Parameters:
//   normalTS   – shading normal in tangent space (normalised)
//   roughness2 – squared roughness per axis: float2(α_x², α_y²)
//
// Returns: float2 filtered squared roughness per axis.
// ---------------------------------------------------------------------------
float2 NDFFilteringDeferred(float3 normalTS, float2 roughness2)
{
  // Paper Eq. (13) / Listing 5: use full 3D derivatives of the normal.
  // ||Δn̂⊥_u|| = ||Δn_u|| and ||Δn̂⊥_v|| = ||Δn_v|| (Eq. 12),
  // so the trace of Σ_⊥ = σ²(||Δn_u||² + ||Δn_v||²).
  float3 dndu = ddx(normalTS);
  float3 dndv = ddy(normalTS);

  static const float SIGMA2 = 0.15915494;  // 1/(2π)
  float kernelRoughness2 = 2.0 * SIGMA2 * (dot(dndu, dndu) + dot(dndv, dndv));

  static const float KAPPA = 0.18;
  float clampedKernel = min(kernelRoughness2, KAPPA);

  float2 filteredRoughness2 = saturate(roughness2 + clampedKernel);
  return filteredRoughness2;
}

// ---------------------------------------------------------------------------
// 1.14c′  Deferred Isotropic NDF Filtering — World-Space Normal
// ---------------------------------------------------------------------------
// Convenience variant that works directly with world-space normals.
//
// Since we only need the screen-space derivatives of the normal's
// projected coordinates, and those derivatives are view-dependent
// regardless, world-space normals are a reasonable proxy when the
// tangent space is unavailable in the deferred G-buffer pass.
//
// Parameters:
//   normalWS      – shading normal in world space (normalised)
//   roughnessAlpha – linear roughness α
//
// Returns: filtered linear roughness α.
// ---------------------------------------------------------------------------
float NDFFilteringDeferredWS(float3 normalWS, float roughnessAlpha)
{
  // Paper Eq. (13) / Listing 5: full 3D derivatives of the world-space normal.
  // ā² = α² + min(2σ²(||Δn_u||² + ||Δn_v||²), κ)
  float3 dndu = ddx(normalWS);
  float3 dndv = ddy(normalWS);

  static const float SIGMA2 = 0.15915494;  // 1/(2π)
  float kernelRoughness2 = 2.0 * SIGMA2 * (dot(dndu, dndu) + dot(dndv, dndv));

  static const float KAPPA = 0.18;
  float clampedKernel = min(kernelRoughness2, KAPPA);

  float alpha2 = roughnessAlpha * roughnessAlpha;
  float filteredAlpha2 = saturate(alpha2 + clampedKernel);
  return sqrt(filteredAlpha2);
}

// ---------------------------------------------------------------------------
// 1.14d  Tangent-Space Half Vector Helper
// ---------------------------------------------------------------------------
// Transforms a world-space half vector to tangent space using a TBN
// matrix.  Many games compute H = normalize(L + V) in world space.
// The NDF filtering functions require it in tangent space where the
// normal map's detail is encoded.
//
// Parameters:
//   halfVectorWS – half vector in world space (normalised)
//   tangentWS    – tangent vector (normalised, world space)
//   bitangentWS  – bitangent vector (normalised, world space)
//   normalWS     – surface normal (normalised, world space)
//                  Ideally the GEOMETRIC normal (before normal mapping)
//                  for maximum accuracy, but the pixel normal works
//                  acceptably.
//
// Returns: float3 half vector in tangent space (normalised).
// ---------------------------------------------------------------------------
float3 NDFWorldToTangentHalfVector(
    float3 halfVectorWS,
    float3 tangentWS,
    float3 bitangentWS,
    float3 normalWS)
{
  // TBN matrix: rows are the tangent-space basis vectors.
  // Orthonormal → transpose = inverse.
  float3x3 TBN = float3x3(tangentWS, bitangentWS, normalWS);
  return normalize(mul(TBN, halfVectorWS));
}

// ---------------------------------------------------------------------------
// 1.14e  Combined Filter + Roughness Helper (Forward)
// ---------------------------------------------------------------------------
// Convenience function that applies NDF filtering and returns a
// ready-to-use roughness value for the most common case: isotropic
// forward rendering.
//
// This is the "just make my specular stop flickering" function.
// Call it once per pixel before evaluating any specular BRDF.
//
// Parameters:
//   halfVectorTS        – half vector in tangent space (normalised)
//   perceptualRoughness – [0,1] perceptual roughness (as authored)
//
// Returns: filtered perceptual roughness [0,1].
//          Convert to alpha with: α = result × result.
//
// Usage:
//   float3 H_ts = NDFWorldToTangentHalfVector(H, T, B, N);
//   roughness   = NDFFilteredRoughness(H_ts, roughness);
//   // ...proceed with normal BRDF evaluation using filtered roughness...
// ---------------------------------------------------------------------------
float NDFFilteredRoughness(float3 halfVectorTS, float perceptualRoughness)
{
  float alpha = perceptualRoughness * perceptualRoughness;
  float filteredAlpha = NDFFilteringScalar(halfVectorTS, alpha);
  return sqrt(filteredAlpha);  // back to perceptual roughness
}

// ---------------------------------------------------------------------------
// 1.14e′  Combined Filter + Roughness Helper (Deferred, No Half Vector)
// ---------------------------------------------------------------------------
// Same convenience but for deferred rendering where H is unavailable.
// Uses the world-space normal as proxy.
//
// Parameters:
//   normalWS            – shading normal in world space (normalised)
//   perceptualRoughness – [0,1] perceptual roughness
//
// Returns: filtered perceptual roughness [0,1].
//
// Usage:
//   roughness = NDFFilteredRoughnessDeferred(pixelNormal_WS, roughness);
//   // Write filtered roughness to G-buffer
// ---------------------------------------------------------------------------
float NDFFilteredRoughnessDeferred(float3 normalWS, float perceptualRoughness)
{
  float alpha = perceptualRoughness * perceptualRoughness;
  float filteredAlpha = NDFFilteringDeferredWS(normalWS, alpha);
  return sqrt(filteredAlpha);
}

// ============================================================================
// 1.15  Distortion-Free Displacement Mapping
// ----------------------------------------------------------------------------
// Reference: Tobias Zirr & Tobias Ritschel,
//            "Distortion-Free Displacement Mapping",
//            Computer Graphics Forum (Eurographics) 38(2), 2019
//
// When displacement mapping is applied to a surface whose UV
// parametrization was designed for low distortion, the displacement
// itself reintroduces distortion: a small isotropic texel patch in UV
// space may cover a large, stretched anisotropic area in world space
// after displacement.  This produces characteristic "rubber band"
// artifacts in diffuse and detail textures.
//
// The paper solves this by computing a 2D *correction field*  c(u)
// that warps texture coordinates so that the first fundamental form of
// the displaced surface through the corrected coordinates is as close
// to isometric as possible.  The solver minimises a MIPS-like energy
// (angle + area preservation) per texel over a regular quad grid,
// using massively-parallel Gauss-Seidel iterations on the GPU.
//
// Two usage variants:
//   (a) Without resampling — store Δc = c − u as a separate RG texture.
//       At render time, read g(u + Δc(u)) instead of g(u).  Fully
//       backward-compatible; works with any shading pipeline.
//   (b) With resampling — pre-warp the colour texture g using c.
//       Zero runtime cost, but requires an offline pre-pass and a
//       bijective u↔c mapping.
//
// The code below provides:
//   • The per-texel energy & gradient evaluation  (Listing 1)
//   • Data structures and the node-fetch helper   (Listing 2)
//   • Neighbour enumeration + gradient accumulation (Listing 3)
//   • Ternary line-search update step              (Listing 4)
//   • Runtime correction-offset application helper
//
// The solver is designed to run as a full-screen compute/pixel shader
// dispatched at the displacement-map resolution, ping-ponging between
// two correction-offset textures.  Typically 200–400 iterations at
// 256×256 converge in ~1–3 seconds (GTX 560-era).
//
// Sub-sections:
//   1.15a  Constants & parameters
//   1.15b  Area-preserving pow helper
//   1.15c  Triangle energy & gradient  (Listing 1)
//   1.15d  Constraint gradient
//   1.15e  Global-border test
//   1.15f  Node structure & fetch      (Listing 2)
//   1.15g  Neighbour enumeration       (Listing 3)
//   1.15h  Line-search update          (Listing 4)
//   1.15i  Runtime correction lookup
//   1.15j  Correction compression helpers
// ============================================================================

// ---------------------------------------------------------------------------
// 1.15a  Constants & Parameters
// ---------------------------------------------------------------------------
// θ controls the tradeoff between angle and area preservation in the
// MIPS energy.  θ = 3 gives equal weight to both (recommended by the
// paper and by Degener et al. [DMK03]).  θ = 2 is pure MIPS (Hormann
// et al. [HPS08]).
//
// NUM_NEIGHBORS = 6 because each texel sits on a regular quad grid
// that is split into triangles; each texel touches six triangles.
// ---------------------------------------------------------------------------
static const int   DFDM_NUM_NEIGHBORS      = 6;
static const float DFDM_THETA              = 3.0;
static const float DFDM_AREA_PRESERVATION  = 1.0;  // areaPreservation weight

// ---------------------------------------------------------------------------
// 1.15b  Area-Preserving Power Helper
// ---------------------------------------------------------------------------
// pow(x, areaPreservation) with derivative.
// When areaPreservation = 1 this simplifies to identity.
// ---------------------------------------------------------------------------
float DFDMAreaPreservePow(float x)
{
  return pow(x, DFDM_AREA_PRESERVATION);
}

float DFDMAreaPreservePowDeriv(float x)
{
  return DFDM_AREA_PRESERVATION * pow(x, DFDM_AREA_PRESERVATION - 1.0);
}

// ---------------------------------------------------------------------------
// 1.15c  Triangle Energy & Gradient (Listing 1)
// ---------------------------------------------------------------------------
// Computes the MIPS distortion energy E_{i,j} for triangle j adjacent
// to texel i, and the gradient ∇_c E_{i,j} with respect to the
// correction vector c_i.
//
// dnpos1, dnpos2 : edge vectors Δf_{i,j}  and Δf_{i,j+1} in 3D
//                  (world-space displaced positions)
// dnuv1,  dnuv2  : edge vectors Δc_{i,j}  and Δc_{i,j+1} in 2D
//                  (corrected texture coordinates)
//
// Returns gradient in computeGradient; energy written to `energy`.
// ---------------------------------------------------------------------------
float3 DFDMComputeGradient(
    float3 dnpos1, float3 dnpos2,
    float2 dnuv1,  float2 dnuv2,
    out float energy)
{
  // Area of the 3D triangle (‖Δf₁ × Δf₂‖)
  float adpos = length(cross(dnpos1, dnpos2));

  // 2D area terms — these are the two triangle areas A^c and A^f
  // formed by the corrected UV edges.
  float aduv = dnuv1.x * dnuv2.y - dnuv2.x * dnuv1.y;

  // ── Energy ──────────────────────────────────────────────────────
  // E = Part1 + Part2 * θ + Part3
  //
  // Part1 = ‖Δc‖² / (adpos * aduv)   — isometry (Frobenius of I_f/c)
  // Part2 = lengthSq(Δf) terms        — angle preservation
  // Part3 = (adpos/aduv)^areaPreservation + inverse — area preservation
  //
  float energyPart1 = 1.0 / (adpos * aduv);
  float energyPart2 =
      dot(dnuv1 - dnuv2, dnuv1 - dnuv2) * dot(dnpos1, dnpos2)
    + dot(dnuv1, dnuv1)                  * dot(dnpos2, dnpos2)
    + dot(dnuv2, dnuv2)                  * dot(dnpos1, dnpos1)
    - dot(dnuv1 + dnuv2, dnuv1 + dnuv2) * dot(dnpos1, dnpos2);

  float energyPart3Inner = adpos / aduv;
  float energyPart3      = DFDMAreaPreservePow(energyPart3Inner);

  energy = energyPart3 + energyPart2 * energyPart1;

  // ── Gradient ∇_c E_{i,j} ────────────────────────────────────────
  // The paper derives a closed-form gradient by noting that the
  // partials of Δc_{i,j} with respect to c are ±1.
  //
  // Three parts corresponding to E^(1), E^(2), E^(3).

  // ∇_c of the UV-area term (Cramer / signed-area derivative)
  float2 gradAreaUV = float2(
    dnuv2.y - dnuv1.y,
    dnuv1.x - dnuv2.x
  );

  // ∇_c E^(1)  — the 1/(adpos·aduv) factor
  float3 gradE1;
  gradE1.xy = -energyPart1 / aduv * gradAreaUV;
  gradE1.z  = 0.0;  // no z-component for 2D correction

  // ∇_c E^(2)  — Frobenius cross terms
  //   ∂(lenSq terms)/∂c_i  using  ∂Δc_{i,j}/∂c_i = +1,  ∂Δc_{i,j+1}/∂c_i = +1
  float3 gradE2;
  float2 dLenTerms =
      (dnuv1 - dnuv2) * dot(dnpos1, dnpos2) * (-2.0)
    + dnuv1 * dot(dnpos2, dnpos2) * (-2.0)
    + dnuv2 * dot(dnpos1, dnpos1) * (-2.0)
    + (dnuv1 + dnuv2) * dot(dnpos1, dnpos2) * 2.0;

  gradE2.xy = energyPart1 * dLenTerms
            + energyPart2 * (-energyPart1 / aduv) * gradAreaUV;
  gradE2.z  = 0.0;

  // ∇_c E^(3)  — area preservation
  float3 gradE3;
  gradE3.xy = DFDMAreaPreservePowDeriv(energyPart3Inner)
            * float2(dnuv2.y - dnuv1.y, dnuv1.x - dnuv2.x)
            * (1.0 / (adpos * aduv * aduv));
  gradE3.z  = 0.0;

  return
      energyPart3 * (
        (energyPart2 * energyPart1 / aduv)
        * float3(-gradAreaUV, 0.0)
        + energyPart1 * 2.6 * float3(
            (dnuv1) * dot(dnpos2 - dnpos1, dnpos2)
          + (dnuv2) * dot(dnpos2 - dnpos1, dnpos1), 0.0)
      )
    + energyPart1 * energyPart2 + (
        DFDMAreaPreservePowDeriv(energyPart3Inner)
        * float3(
            float2(dnuv2.y - dnuv1.y, dnuv1.x - dnuv2.x)
            * (1.0 / adpos * adpos / (aduv * aduv)),
            0.0)
      );
}

// Convenience: energy only, no gradient.
float DFDMComputeEnergy(float3 dnpos1, float3 dnpos2, float2 dnuv1, float2 dnuv2)
{
  float energy;
  DFDMComputeGradient(dnpos1, dnpos2, dnuv1, dnuv2, energy);
  return energy;
}

// ---------------------------------------------------------------------------
// 1.15d  Constraint Gradient
// ---------------------------------------------------------------------------
// Optional fixation constraint E_γ: penalty for moving pinned texels.
//
// γ(u) ∈ [0,1] is supplied as a fixation map (e.g. certain height
// intervals, or artist-painted regions).  γ = 1 ⟹ texel is pinned;
// the penalty term grows quickly if the correction moves it away from
// the identity mapping  c = u.
//
// Parameters:
//   duv        – current correction offset  c − u
//   pinned     – fixation strength γ ∈ [0,1]
//   resolution – displacement-map resolution (int2)
//
// Returns:
//   ec  – constraint gradient  (float2, added to total gradient)
//   energy (out) – scalar energy contribution
// ---------------------------------------------------------------------------
float2 DFDMComputeConstraintGradient(
    float2 duv,
    float  pinned,
    int2   resolution,
    out float energy)
{
  float2 mc = pinned * float2(resolution);
  float  es = 1.0 / max(1.0 - dot(duv * mc, duv * mc), 5e-32);
  energy = 0.5 * es;
  return es * es * (duv * mc * mc);
}

// ---------------------------------------------------------------------------
// 1.15e  Global-Border Test
// ---------------------------------------------------------------------------
// Returns true for texels on the outermost 1-texel border of the
// displacement map.  Used to freeze boundary texels when fixBoundary
// is enabled (non-tiled textures).
// ---------------------------------------------------------------------------
bool DFDMOnGlobalBorder(int2 coord, int2 resolution)
{
  return coord.x == 0
      || coord.y == 0
      || coord.x == resolution.x - 1
      || coord.y == resolution.y - 1;
}

// ---------------------------------------------------------------------------
// 1.15f  Node Structure & Fetch (Listing 2)
// ---------------------------------------------------------------------------
// Each texel is treated as a vertex in the triangulated quad grid.
// `pos`    – 3D displaced position  (displacement map * scale)
// `uv`     – corrected texture coordinate  (identity + correction offset)
// `uvo`    – raw correction offset (Δc)
// `pinned` – fixation strength γ
// ---------------------------------------------------------------------------
struct DFDMNode
{
  float3 pos;     // world-space displaced position
  float2 uv;      // corrected UV = u + Δc
  float2 uvo;     // raw correction offset Δc
  float  pinned;  // fixation γ ∈ [0,1]
};

// Fetches a node from the two input textures:
//   displaceTex       – height-field (or vector) displacement
//   correctionOffsetTex – RG float texture storing Δc from previous iteration
//
// pixelWidth          – float2(1.0/resX, 1.0/resY)
// texelOffset         – half-texel offset (0 or 0.5*pixelWidth)
// displacementScale   – world-space scale applied to the height
// fixHeight, fixInterval – height range [fixHeight ± fixInterval/2] that
//                          maps to γ = 1 (fully pinned).
// fixBoundary         – if true, texels on the texture border are pinned.
// ---------------------------------------------------------------------------
DFDMNode DFDMFetchNode(
    Texture2D<float>  displaceTex,
    Texture2D<float2> correctionOffsetTex,
    SamplerState      pointSampler,
    float2            coord,       // integer texel coordinate
    float2            pixelWidth,
    float2            texelOffset,
    float             displacementScale,
    float             fixHeight,
    float             fixInterval,
    bool              fixBoundary)
{
  DFDMNode n;
  float2 wrapCoord = frac(coord);

  // Apply half-texel offset to match geometry displacement evaluation.
  float height = displaceTex.SampleLevel(
      pointSampler,
      wrapCoord + texelOffset + float2(pixelWidth.x * 0.5, 0.0),
      0);
  n.pos = float3(coord, displacementScale * height);

  // Read current correction offset from previous iteration.
  n.uvo = correctionOffsetTex.SampleLevel(
      pointSampler, wrapCoord, 0);

  // Compute fixation from height interval.
  n.pinned = (fixInterval > 0.0)
    ? max(1.0 - abs(height - fixHeight) / fixInterval, 0.0)
    : 0.0;

  n.uv = n.uvo + coord;
  return n;
}

// ---------------------------------------------------------------------------
// 1.15g  Neighbour Enumeration & Gradient Accumulation (Listing 3)
// ---------------------------------------------------------------------------
// Enumerates the 6-neighbourhood of the current texel (the six
// triangles formed by the quad-grid diagonal split), computes the
// energy gradient for each, and accumulates.
//
// fragCoord      – integer coordinate of the current texel
// pixelWidth     – 1.0 / resolution
// texelOffset    – half-texel offset for displacement evaluation
// displacementScale – world-space height scale
// fixHeight / fixInterval / fixBoundary – constraint parameters
//
// Returns through out parameters:
//   gradient – accumulated 2D gradient  ∇e_i
//   energy   – total scalar energy  E_i
//   currentNode – the fetched node for the current texel
// ---------------------------------------------------------------------------
void DFDMAccumulateGradient(
    Texture2D<float>  displaceTex,
    Texture2D<float2> correctionOffsetTex,
    SamplerState      pointSampler,
    int2              fragCoord,
    float2            pixelWidth,
    float2            texelOffset,
    float             displacementScale,
    float             fixHeight,
    float             fixInterval,
    bool              fixBoundary,
    out float2        gradient,
    out float         energy,
    out DFDMNode      currentNode)
{
  currentNode = DFDMFetchNode(
      displaceTex, correctionOffsetTex, pointSampler,
      float2(fragCoord),
      pixelWidth, texelOffset, displacementScale,
      fixHeight, fixInterval, fixBoundary);

  // Collect the 6 neighbour positions and UVs.
  float3 dnpos[DFDM_NUM_NEIGHBORS];
  float2 dnuv [DFDM_NUM_NEIGHBORS];

  int i = 0;
  for (int2 co = int2(-1, -1); co.y <= 1; co.y++)
  {
    for (co.x = -1; co.x <= 1; co.x++)
    {
      if (co.x == co.y) continue;  // skip (0,0) and diagonal duplicates

      DFDMNode nn = DFDMFetchNode(
          displaceTex, correctionOffsetTex, pointSampler,
          float2(fragCoord + co),
          pixelWidth, texelOffset, displacementScale,
          fixHeight, fixInterval, fixBoundary);

      // Compute neighbour index for the quad-diagonal split.
      int nbidx;
      if      (co.x == 0)  nbidx = (co.y == -1) ? 5 : 2;
      else if (co.y == 0)  nbidx = (co.x == -1) ? 0 : 3;
      else if (co.x == -1) nbidx = 1;    // (-1, +1)
      else                 nbidx = 4;    // (+1, -1)

      dnpos[nbidx] = currentNode.pos - nn.pos;
      dnuv [nbidx] = currentNode.uv  - nn.uv;
      i++;
    }
  }

  // Accumulate energy & gradient over the 6 triangles.
  energy    = 0.0;
  gradient  = float2(0.0, 0.0);

  for (int n1 = DFDM_NUM_NEIGHBORS - 1, j = 0;
       j < DFDM_NUM_NEIGHBORS;
       n1 = j++)
  {
    float neighbourEnergy;
    float3 grad3 = DFDMComputeGradient(
        dnpos[j], dnpos[n1],
        dnuv [j], dnuv [n1],
        neighbourEnergy);
    gradient += grad3.xy;
    energy   += neighbourEnergy;
  }

  energy *= 0.5 / float(DFDM_NUM_NEIGHBORS);

  // Handle optional constraint.
  float cEnergy;
  float2 cGrad = DFDMComputeConstraintGradient(
      currentNode.uv - currentNode.pos.xy,
      currentNode.pinned,
      int2(round(1.0 / pixelWidth)),
      cEnergy);
  gradient += cGrad;
  energy   += cEnergy;
}

// ---------------------------------------------------------------------------
// 1.15h  Line-Search Update Step (Listing 4)
// ---------------------------------------------------------------------------
// Performs a ternary search along the gradient direction to find the
// optimal step size, then writes the updated correction offset.
//
// This function is the inner body of the per-texel optimisation shader.
// It should be called once per texel per iteration, writing to the
// output correction-offset texture (ping-pong).
//
// iterationIdx    – current iteration number (0-based)
// fixBoundary     – freeze border texels
// All texture / parameter arguments are the same as DFDMAccumulateGradient.
//
// Returns the new correction offset (float4, .xy used, .zw = 0).
// ---------------------------------------------------------------------------
float4 DFDMUpdateStep(
    Texture2D<float>  displaceTex,
    Texture2D<float2> correctionOffsetTex,
    SamplerState      pointSampler,
    int2              fragCoord,
    int2              resolution,
    float2            texelOffset,
    float             displacementScale,
    float             fixHeight,
    float             fixInterval,
    bool              fixBoundary,
    int               iterationIdx)
{
  float2 pixelWidth = 1.0 / float2(resolution);

  float2   gradient;
  float    energy;
  DFDMNode currentNode;

  DFDMAccumulateGradient(
      displaceTex, correctionOffsetTex, pointSampler,
      fragCoord, pixelWidth, texelOffset, displacementScale,
      fixHeight, fixInterval, fixBoundary,
      gradient, energy, currentNode);

  // ── Compute maximum step size (before triangle flips) ──────────
  float minStepSize = 0.0;
  float maxStepSize = 2.0e32;

  // Re-fetch neighbours for step-size bounding.
  float3 dnpos[DFDM_NUM_NEIGHBORS];
  float2 dnuv [DFDM_NUM_NEIGHBORS];
  {
    int idx = 0;
    for (int2 co = int2(-1, -1); co.y <= 1; co.y++)
    {
      for (co.x = -1; co.x <= 1; co.x++)
      {
        if (co.x == co.y) continue;

        DFDMNode nn = DFDMFetchNode(
            displaceTex, correctionOffsetTex, pointSampler,
            float2(fragCoord + co),
            pixelWidth, texelOffset, displacementScale,
            fixHeight, fixInterval, fixBoundary);

        int nbidx;
        if      (co.x == 0)  nbidx = (co.y == -1) ? 5 : 2;
        else if (co.y == 0)  nbidx = (co.x == -1) ? 0 : 3;
        else if (co.x == -1) nbidx = 1;
        else                 nbidx = 4;

        dnpos[nbidx] = currentNode.pos - nn.pos;
        dnuv [nbidx] = currentNode.uv  - nn.uv;
        idx++;
      }
    }
  }

  // Bound step size to prevent triangle inversions.
  for (int ii = 0, jj = DFDM_NUM_NEIGHBORS - 1;
       ii < DFDM_NUM_NEIGHBORS;
       jj = ii++)
  {
    float aduv  = dnuv[jj].x  * dnuv[ii].y  - dnuv[ii].x  * dnuv[jj].y;
    float djXg  = dnuv[jj].x  * gradient.y  - gradient.x  * dnuv[jj].y;
    float dgXi  = gradient.x  * dnuv[ii].y  - dnuv[ii].x  * gradient.y;
    float den   = djXg + dgXi;
    float aduv0offset = aduv / den;

    if (aduv0offset > 0.0)
    {
      if (aduv > 0.0)
        maxStepSize = min(maxStepSize, aduv0offset);
      else
        minStepSize = max(minStepSize, aduv0offset);
    }
  }

  // assert: minStepSize <= maxStepSize
  if (!(minStepSize <= maxStepSize))
  {
    minStepSize = 0.0;
    maxStepSize = 0.0;
  }

  // ── Ternary search on gradient line to find optimum ────────────
  [loop]
  while (maxStepSize - minStepSize > 1.0e-6 * maxStepSize)
  {
    float third1 = lerp(minStepSize, maxStepSize, 1.0 / 3.0);
    float third2 = lerp(minStepSize, maxStepSize, 2.0 / 3.0);
    float2 duv1  = third1 * gradient;
    float2 duv2  = third2 * gradient;

    float e1 = 0.0, e2 = 0.0;
    for (int n1 = DFDM_NUM_NEIGHBORS - 1, kk = 0;
         kk < DFDM_NUM_NEIGHBORS;
         n1 = kk++)
    {
      e1 += DFDMComputeEnergy(dnpos[kk], dnpos[n1],
                              dnuv[kk] - duv1, dnuv[n1] - duv1);
      e2 += DFDMComputeEnergy(dnpos[kk], dnpos[n1],
                              dnuv[kk] - duv2, dnuv[n1] - duv2);
    }
    e1 *= 0.5 / float(DFDM_NUM_NEIGHBORS);
    e2 *= 0.5 / float(DFDM_NUM_NEIGHBORS);

    // Add constraint penalty at the two test points.
    float pe1, pe2;
    float2 cg1 = DFDMComputeConstraintGradient(
        currentNode.uv - duv1 - currentNode.pos.xy,
        currentNode.pinned,
        resolution,
        pe1);
    float2 cg2 = DFDMComputeConstraintGradient(
        currentNode.uv - duv2 - currentNode.pos.xy,
        currentNode.pinned,
        resolution,
        pe2);
    e1 += pe1;
    e2 += pe2;

    if (e1 > e2)
      minStepSize = third1;
    else
      maxStepSize = third2;
  }
  float stepSize = lerp(minStepSize, maxStepSize, 0.5);

  // ── Boundary handling ──────────────────────────────────────────
  if (fixBoundary && DFDMOnGlobalBorder(fragCoord, resolution))
    stepSize = 0.0;

  float4 newCorrectionOffset = float4(currentNode.uvo.xy, 0.0, 0.0);

  // Ensure convergence: only move 1 vertex per neighbourhood per
  // iteration (checkerboard pattern, alternating rows & columns).
  if (   (fragCoord.x & 1) == (iterationIdx & 1)
      && (fragCoord.y & 1) == ((iterationIdx >> 1) & 1))
  {
    newCorrectionOffset.xy -= stepSize * gradient;
  }

  return newCorrectionOffset;
}

// ---------------------------------------------------------------------------
// 1.15i  Runtime Correction Lookup
// ---------------------------------------------------------------------------
// Applies the pre-computed correction offset at render time.
// This is the "without resampling" variant (§3.3.1 of the paper).
//
// Instead of sampling  g(u),  sample  g(u + Δc(u))  where Δc is the
// correction-offset texture produced by the solver.
//
// Parameters:
//   uv                – original texture coordinate
//   correctionOffsetTex – RG texture containing Δc (packed or float)
//   correctionSampler – bilinear sampler (wrap/clamp as needed)
//
// Returns: corrected UV to use when sampling diffuse / detail textures.
// ---------------------------------------------------------------------------
float2 DFDMCorrectedUV(
    float2            uv,
    Texture2D<float2> correctionOffsetTex,
    SamplerState      correctionSampler)
{
  float2 deltaC = correctionOffsetTex.SampleLevel(correctionSampler, uv, 0);
  return uv + deltaC;
}

// Variant accepting a pre-read offset (e.g. from a buffer or manual fetch).
float2 DFDMCorrectedUV(float2 uv, float2 correctionOffset)
{
  return uv + correctionOffset;
}

// ---------------------------------------------------------------------------
// 1.15j  Correction Compression Helpers
// ---------------------------------------------------------------------------
// The paper notes that correction offsets are typically tiny (±0.02 in
// UV space).  For storage in an 8-bit RG texture the range is found,
// then offsets are remapped to [0,255].
//
// Pack (offline / solver output):
//   quantised  = (Δc − rangeMin) / (rangeMax − rangeMin)
//
// Unpack (runtime, before DFDMCorrectedUV):
//   Δc = quantised * (rangeMax − rangeMin) + rangeMin
//
// rangeMin / rangeMax are stored as shader constants or in a small
// header texture.  Using half the displacement-map resolution for the
// correction texture is often sufficient.
// ---------------------------------------------------------------------------
float2 DFDMPackCorrectionOffset(
    float2 offset,
    float2 rangeMin,
    float2 rangeMax)
{
  return (offset - rangeMin) / (rangeMax - rangeMin);
}

float2 DFDMUnpackCorrectionOffset(
    float2 packed,
    float2 rangeMin,
    float2 rangeMax)
{
  return packed * (rangeMax - rangeMin) + rangeMin;
}

// Corrected UV using a packed 8-bit correction texture.
float2 DFDMCorrectedUVPacked(
    float2            uv,
    Texture2D<float2> correctionOffsetTex,
    SamplerState      correctionSampler,
    float2            rangeMin,
    float2            rangeMax)
{
  float2 packed = correctionOffsetTex.SampleLevel(correctionSampler, uv, 0);
  float2 deltaC = DFDMUnpackCorrectionOffset(packed, rangeMin, rangeMax);
  return uv + deltaC;
}

// ============================================================================
// 1.16  Enhanced Parallax Occlusion Mapping
// ----------------------------------------------------------------------------
// References:
//   • Tatarchuk 2006 — "Practical Parallax Occlusion Mapping with
//     Approximate Soft Shadows for Detailed Surface Rendering",
//     ShaderX5
//   • Dummer 2006 — "Cone Step Mapping: An Iterative Ray-Heightfield
//     Intersection Algorithm", unpublished
//   • Policarpo 2007 — "Relaxed Cone Stepping for Relief Mapping",
//     GPU Gems 3
//   • Drobot 2009 — "Quadtree Displacement Mapping with Height
//     Blending", GPU Pro 1
//   • Mikkelsen 2020 — "Surface Gradient–Based Bump Mapping
//     Framework", Journal of Computer Graphics Techniques
//   • Risser et al. 2005 — "Interval Mapping", GPU Gems 2
//
// Parallax Occlusion Mapping (POM) is the dominant real-time technique
// for per-pixel displacement in rasterisation pipelines.  Many games
// ship with basic linear-search POM that uses excessive step counts
// or lacks self-shadowing.  This section provides drop-in improvements
// that operate purely at the pixel shader level, making them ideal
// for RenoDX shader injection by hash-matching existing POM shaders.
//
// Sub-sections:
//   1.16a  Constants & configuration
//   1.16b  Tangent-space view ray setup
//   1.16c  Contact-refinement POM  (coarse linear + binary refine)
//   1.16d  POM self-shadowing
//   1.16e  Cone step mapping
//   1.16f  Relaxed cone stepping
//   1.16g  Quadtree displacement mapping (hierarchical min-max)
//   1.16h  Surface gradient bump mapping framework
//   1.16i  Interval mapping (affine root bracketing)
// ============================================================================

// ---------------------------------------------------------------------------
// 1.16a  Constants & Configuration
// ---------------------------------------------------------------------------
// Tunable defaults for the various POM techniques.  Override these
// with #define before including this file if needed.
// ---------------------------------------------------------------------------
#ifndef RENODX_POM_LINEAR_STEPS_MIN
#define RENODX_POM_LINEAR_STEPS_MIN 8
#endif

#ifndef RENODX_POM_LINEAR_STEPS_MAX
#define RENODX_POM_LINEAR_STEPS_MAX 64
#endif

#ifndef RENODX_POM_BINARY_STEPS
#define RENODX_POM_BINARY_STEPS 5
#endif

#ifndef RENODX_POM_SHADOW_STEPS
#define RENODX_POM_SHADOW_STEPS 16
#endif

#ifndef RENODX_POM_HEIGHT_SCALE
#define RENODX_POM_HEIGHT_SCALE 0.05
#endif

// Cone step mapping defaults.
#ifndef RENODX_CONE_STEPS
#define RENODX_CONE_STEPS 15
#endif

#ifndef RENODX_CONE_BINARY_STEPS
#define RENODX_CONE_BINARY_STEPS 6
#endif

// Quadtree displacement mapping defaults.
#ifndef RENODX_QDM_MAX_LEVELS
#define RENODX_QDM_MAX_LEVELS 8
#endif

#ifndef RENODX_QDM_MAX_ITERATIONS
#define RENODX_QDM_MAX_ITERATIONS 64
#endif

// ---------------------------------------------------------------------------
// 1.16b  Tangent-Space View Ray Setup
// ---------------------------------------------------------------------------
// Converts the world-space view direction to tangent space for
// heightfield ray-marching.  Also computes the adaptive step count
// based on the angle between the view direction and the surface
// normal — steep angles need more steps to avoid missed features.
//
// Parameters:
//   viewDirWS   – world-space direction from surface to camera (normalised)
//   tangentWS   – normalised tangent (world space)
//   bitangentWS – normalised bitangent (world space)
//   normalWS    – normalised surface normal (world space)
//   heightScale – displacement amplitude in UV space (default 0.05)
//
// Returns: float3 tangent-space view direction scaled so that
//          marching by t ∈ [0,1] in the XY plane covers the full
//          depth range [0, heightScale].
// ---------------------------------------------------------------------------
float3 POMViewRayTS(
    float3 viewDirWS,
    float3 tangentWS,
    float3 bitangentWS,
    float3 normalWS,
    float  heightScale)
{
  float3x3 TBN = float3x3(tangentWS, bitangentWS, normalWS);
  float3 viewTS = normalize(mul(TBN, viewDirWS));
  // Scale XY so that a step of 1.0 in Z spans the full height range.
  viewTS.xy *= heightScale;
  return viewTS;
}

// Adaptive step count: more steps at grazing angles, fewer head-on.
//
// Parameters:
//   viewDirTS – tangent-space view direction (from POMViewRayTS)
//   minSteps  – minimum linear steps (default RENODX_POM_LINEAR_STEPS_MIN)
//   maxSteps  – maximum linear steps (default RENODX_POM_LINEAR_STEPS_MAX)
//
// Returns: integer step count.
int POMAdaptiveStepCount(
    float3 viewDirTS,
    int    minSteps,
    int    maxSteps)
{
  // NdotV in tangent space: viewDirTS.z is cos(θ) with the normal.
  float NdotV = abs(viewDirTS.z);
  return (int)lerp((float)maxSteps, (float)minSteps, NdotV);
}

// ---------------------------------------------------------------------------
// 1.16c  Contact-Refinement POM
// ---------------------------------------------------------------------------
// The standard POM approach performs a fixed linear search (often
// 32–128 steps) and stops at the first intersection.  This is both
// expensive and inaccurate — high step counts waste ALU on smooth
// regions, while low step counts miss thin features.
//
// Contact-refinement replaces this with a two-phase approach:
//   Phase 1: Coarse linear search with few steps (8–16) to bracket
//            the first intersection between two adjacent samples.
//   Phase 2: Binary refinement (5 iterations) between those two
//            samples to find the precise intersection.
//
// This gives identical or better quality to a 64-step linear search
// at roughly half the texture-fetch cost.
//
// Parameters:
//   heightMap        – R channel heightmap (1.0 = top, 0.0 = bottom)
//   heightSampler    – sampler for the heightmap
//   uv               – base UV coordinates
//   viewDirTS        – tangent-space view ray (from POMViewRayTS)
//   heightScale      – displacement scale (world units)
//   linearSteps      – coarse search step count
//   binarySteps      – refinement step count
//
// Returns: float2 parallax-displaced UV coordinates.
// ---------------------------------------------------------------------------
float2 POMContactRefinement(
    Texture2D<float>  heightMap,
    SamplerState      heightSampler,
    float2            uv,
    float3            viewDirTS,
    float             heightScale,
    int               linearSteps,
    int               binarySteps)
{
  // Step along the view ray through the depth range [1..0].
  float  stepSize  = 1.0 / (float)linearSteps;
  float2 uvStep    = viewDirTS.xy * stepSize;
  float  rayDepth  = 1.0;   // Start at the top.

  float2 currUV    = uv;
  float  currH     = heightMap.SampleLevel(heightSampler, currUV, 0);

  float2 prevUV    = currUV;
  float  prevH     = currH;
  float  prevRay   = rayDepth;

  // Phase 1: coarse linear march.
  [loop]
  for (int i = 0; i < linearSteps; i++) {
    if (rayDepth <= currH) break;   // Below the surface.

    prevUV   = currUV;
    prevH    = currH;
    prevRay  = rayDepth;

    rayDepth -= stepSize;
    currUV   -= uvStep;
    currH     = heightMap.SampleLevel(heightSampler, currUV, 0);
  }

  // Phase 2: binary refinement between prevUV and currUV.
  [loop]
  for (int j = 0; j < binarySteps; j++) {
    float2 midUV  = 0.5 * (prevUV + currUV);
    float  midRay = 0.5 * (prevRay + rayDepth);
    float  midH   = heightMap.SampleLevel(heightSampler, midUV, 0);

    if (midRay <= midH) {
      // Intersection is in the upper half.
      currUV   = midUV;
      rayDepth = midRay;
      currH    = midH;
    } else {
      // Intersection is in the lower half.
      prevUV  = midUV;
      prevRay = midRay;
      prevH   = midH;
    }
  }

  return currUV;
}

// Convenience overload using default step counts.
float2 POMContactRefinement(
    Texture2D<float> heightMap,
    SamplerState     heightSampler,
    float2           uv,
    float3           viewDirTS,
    float            heightScale)
{
  int steps = POMAdaptiveStepCount(viewDirTS,
                                   RENODX_POM_LINEAR_STEPS_MIN,
                                   RENODX_POM_LINEAR_STEPS_MAX);
  return POMContactRefinement(heightMap, heightSampler, uv, viewDirTS,
                              heightScale, steps, RENODX_POM_BINARY_STEPS);
}

// ---------------------------------------------------------------------------
// 1.16d  POM Self-Shadowing
// ---------------------------------------------------------------------------
// After finding the parallax intersection point (from §1.16c or any
// other POM method), trace a second ray from that point toward the
// light source through the heightfield.  If the ray passes below the
// height surface, the point is in shadow.
//
// This produces contact shadows that follow the heightmap detail —
// cobblestones casting tiny shadows, brick mortar in shadow, etc.
// Many shipped POM implementations skip this due to its perceived
// cost, but 8–16 linear steps are sufficient for convincing results.
//
// The function returns a soft shadow factor (0 = fully shadowed,
// 1 = fully lit) computed as the minimum ratio of (rayHeight - surfaceHeight)
// to the total trace distance, following Tatarchuk 2006.
//
// Parameters:
//   heightMap      – R channel heightmap (1.0 = top, 0.0 = bottom)
//   heightSampler  – sampler for the heightmap
//   pomUV          – parallax-displaced UV (output of POM trace)
//   pomDepth       – depth at the POM intersection point [0,1]
//   lightDirTS     – tangent-space light direction (normalised,
//                    pointing *toward* the light)
//   heightScale    – displacement scale (must match POM trace)
//   shadowSteps    – number of shadow ray steps
//
// Returns: float shadow factor in [0,1].
// ---------------------------------------------------------------------------
float POMSelfShadow(
    Texture2D<float> heightMap,
    SamplerState     heightSampler,
    float2           pomUV,
    float            pomDepth,
    float3           lightDirTS,
    float            heightScale,
    int              shadowSteps)
{
  // If the light is below the surface horizon, fully shadowed.
  if (lightDirTS.z <= 0.0) return 0.0;

  float  stepSize  = 1.0 / (float)shadowSteps;
  float2 uvStep    = lightDirTS.xy * heightScale * stepSize;
  float  zStep     = lightDirTS.z * stepSize;

  float2 currUV    = pomUV;
  float  currDepth = pomDepth;
  float  shadow    = 1.0;

  [loop]
  for (int i = 0; i < shadowSteps; i++) {
    currUV    += uvStep;
    currDepth += zStep;

    float h = heightMap.SampleLevel(heightSampler, currUV, 0);

    // If the ray has exited the height range, stop.
    if (currDepth >= 1.0) break;

    // Ratio between the ray clearance above the surface and the
    // total step count gives a soft penumbra.
    float diff = currDepth - h;
    if (diff < 0.0) {
      // Below the surface — shadowed.
      shadow = 0.0;
      break;
    }
    shadow = min(shadow, diff / (stepSize * (float)(i + 1) + 1e-5));
  }

  return saturate(shadow);
}

// Convenience overload with default step count.
float POMSelfShadow(
    Texture2D<float> heightMap,
    SamplerState     heightSampler,
    float2           pomUV,
    float            pomDepth,
    float3           lightDirTS,
    float            heightScale)
{
  return POMSelfShadow(heightMap, heightSampler, pomUV, pomDepth,
                       lightDirTS, heightScale, RENODX_POM_SHADOW_STEPS);
}

// ---------------------------------------------------------------------------
// 1.16e  Cone Step Mapping
// ---------------------------------------------------------------------------
// Reference: Dummer 2006 — "Cone Step Mapping"
//
// Standard linear-search POM must use small step sizes to avoid
// stepping over thin features.  Cone step mapping pre-computes a
// "cone radius" per texel: the radius of the largest cone centered
// at that texel which doesn't intersect any neighbouring heightfield
// geometry.  During the ray march, each step can advance by this
// safe distance, dramatically reducing the iteration count (typically
// from 30–64 to 5–15) while guaranteeing no features are skipped.
//
// The cone map is stored as a single-channel texture (R8 or R16)
// alongside the heightmap.  It can be pre-computed offline or in a
// one-time compute pass.
//
// Parameters:
//   heightMap     – R channel heightmap (1 = top, 0 = bottom)
//   coneMap       – R channel cone radius texture (normalised [0,1])
//   samp          – shared sampler for both textures
//   uv            – base UV coordinates
//   viewDirTS     – tangent-space view ray (from POMViewRayTS)
//   heightScale   – displacement scale
//   coneSteps     – number of cone step iterations
//   binarySteps   – binary refinement iterations after intersection
//
// Returns: float2 parallax-displaced UV coordinates.
// ---------------------------------------------------------------------------
float2 ConeStepMapping(
    Texture2D<float> heightMap,
    Texture2D<float> coneMap,
    SamplerState     samp,
    float2           uv,
    float3           viewDirTS,
    float            heightScale,
    int              coneSteps,
    int              binarySteps)
{
  float3 ray = float3(viewDirTS.xy, -viewDirTS.z);
  // Normalise so that Z component magnitude = 1.
  float  iz  = 1.0 / max(abs(ray.z), 1e-6);
  ray *= iz;

  float3 pos = float3(uv, 0.0);  // Start at the surface top.

  float2 prevUV = uv;
  float  prevZ  = 0.0;

  [loop]
  for (int i = 0; i < coneSteps; i++) {
    float h = 1.0 - heightMap.SampleLevel(samp, pos.xy, 0);
    float d = pos.z - h;

    if (d >= 0.0) {
      // Below the surface — intersection bracketed.
      break;
    }

    // Safe step distance: how far the cone allows us to travel.
    float coneRadius = coneMap.SampleLevel(samp, pos.xy, 0);
    float stepDist   = max(-d * coneRadius / (1.0 + coneRadius * length(ray.xy)), 1e-5);

    prevUV = pos.xy;
    prevZ  = pos.z;

    pos += ray * stepDist * heightScale;
  }

  // Binary refinement between previous safe position and intersection.
  float2 lo = prevUV;
  float2 hi = pos.xy;
  float  loZ = prevZ;
  float  hiZ = pos.z;

  [loop]
  for (int j = 0; j < binarySteps; j++) {
    float2 midUV = 0.5 * (lo + hi);
    float  midZ  = 0.5 * (loZ + hiZ);
    float  midH  = 1.0 - heightMap.SampleLevel(samp, midUV, 0);

    if (midZ >= midH) {
      hi  = midUV;
      hiZ = midZ;
    } else {
      lo  = midUV;
      loZ = midZ;
    }
  }

  return 0.5 * (lo + hi);
}

// Convenience overload with default step counts.
float2 ConeStepMapping(
    Texture2D<float> heightMap,
    Texture2D<float> coneMap,
    SamplerState     samp,
    float2           uv,
    float3           viewDirTS,
    float            heightScale)
{
  return ConeStepMapping(heightMap, coneMap, samp, uv, viewDirTS,
                         heightScale, RENODX_CONE_STEPS,
                         RENODX_CONE_BINARY_STEPS);
}

// ---------------------------------------------------------------------------
// 1.16f  Relaxed Cone Stepping
// ---------------------------------------------------------------------------
// Reference: Policarpo 2007 — "Relaxed Cone Stepping for Relief
//            Mapping", GPU Gems 3
//
// Relaxes the conservative cone bounds from §1.16e by allowing the
// cone to slightly penetrate neighbouring geometry.  This permits
// larger steps (often 2–3× bigger) with negligible visual error.
// The relaxation factor controls the trade-off: 0.0 = full
// conservative (identical to §1.16e), 1.0 = maximally relaxed.
//
// Parameters:
//   heightMap       – R channel heightmap
//   coneMap         – R channel cone radius texture
//   samp            – shared sampler
//   uv              – base UV coordinates
//   viewDirTS       – tangent-space view ray
//   heightScale     – displacement scale
//   relaxation      – relaxation factor [0,1] (0.3–0.5 recommended)
//   coneSteps       – number of relaxed cone iterations
//   binarySteps     – binary refinement iterations
//
// Returns: float2 parallax-displaced UV coordinates.
// ---------------------------------------------------------------------------
float2 RelaxedConeStepMapping(
    Texture2D<float> heightMap,
    Texture2D<float> coneMap,
    SamplerState     samp,
    float2           uv,
    float3           viewDirTS,
    float            heightScale,
    float            relaxation,
    int              coneSteps,
    int              binarySteps)
{
  float3 ray = float3(viewDirTS.xy, -viewDirTS.z);
  float  iz  = 1.0 / max(abs(ray.z), 1e-6);
  ray *= iz;

  float3 pos = float3(uv, 0.0);
  float2 prevUV = uv;
  float  prevZ  = 0.0;

  [loop]
  for (int i = 0; i < coneSteps; i++) {
    float h = 1.0 - heightMap.SampleLevel(samp, pos.xy, 0);
    float d = pos.z - h;

    if (d >= 0.0) break;

    float coneRadius = coneMap.SampleLevel(samp, pos.xy, 0);
    // Relaxation: allow the cone to extend past its conservative bound.
    float relaxedRadius = coneRadius * (1.0 + relaxation);
    float stepDist = max(-d * relaxedRadius / (1.0 + relaxedRadius * length(ray.xy)), 1e-5);

    prevUV = pos.xy;
    prevZ  = pos.z;

    pos += ray * stepDist * heightScale;
  }

  float2 lo = prevUV;
  float2 hi = pos.xy;
  float  loZ = prevZ;
  float  hiZ = pos.z;

  [loop]
  for (int j = 0; j < binarySteps; j++) {
    float2 midUV = 0.5 * (lo + hi);
    float  midZ  = 0.5 * (loZ + hiZ);
    float  midH  = 1.0 - heightMap.SampleLevel(samp, midUV, 0);

    if (midZ >= midH) {
      hi  = midUV;
      hiZ = midZ;
    } else {
      lo  = midUV;
      loZ = midZ;
    }
  }

  return 0.5 * (lo + hi);
}

// Convenience overload with default relaxation and step counts.
float2 RelaxedConeStepMapping(
    Texture2D<float> heightMap,
    Texture2D<float> coneMap,
    SamplerState     samp,
    float2           uv,
    float3           viewDirTS,
    float            heightScale)
{
  return RelaxedConeStepMapping(heightMap, coneMap, samp, uv, viewDirTS,
                                heightScale, 0.4, RENODX_CONE_STEPS,
                                RENODX_CONE_BINARY_STEPS);
}

// ---------------------------------------------------------------------------
// 1.16g  Quadtree Displacement Mapping (Hierarchical Min-Max)
// ---------------------------------------------------------------------------
// Reference: Drobot 2009 — "Quadtree Displacement Mapping with
//            Height Blending", GPU Pro 1
//
// Builds a hierarchical min-max mip chain over the heightmap.  During
// the ray march, the algorithm starts at the coarsest mip level and
// tests the ray against the min-max bounds of each cell.  If the ray
// misses the cell's bounds, it skips the entire subtree.  Only cells
// where intersection is possible are refined to finer levels.
//
// This gives logarithmic convergence in the common case (flat or
// smoothly-varying regions) while still finding thin features that
// uniform-step POM would miss.
//
// The min-max mip chain must be pre-computed: each mip texel stores
// (min_height, max_height) of the 2×2 block below it.  This can be
// generated with a standard mip-generation compute pass using
// min/max instead of average.
//
// Parameters:
//   heightMinMaxMip – min-max heightmap with full mip chain
//                     .r = min height, .g = max height for each cell
//   samp            – sampler (point or bilinear; point is traditional)
//   uv              – base UV coordinates
//   viewDirTS       – tangent-space view ray
//   heightScale     – displacement scale
//   textureSize     – resolution of the base (mip 0) heightmap
//   maxLevels       – number of mip levels in the min-max chain
//   maxIterations   – safety cap on iterations (prevents infinite loops)
//
// Returns: float2 parallax-displaced UV coordinates.
// ---------------------------------------------------------------------------
float2 QuadtreeDisplacementMapping(
    Texture2D<float2> heightMinMaxMip,
    SamplerState      samp,
    float2            uv,
    float3            viewDirTS,
    float             heightScale,
    float2            textureSize,
    int               maxLevels,
    int               maxIterations)
{
  // Normalise the ray so Z steps are unit.
  float3 ray = float3(viewDirTS.xy, -viewDirTS.z);
  float  iz  = 1.0 / max(abs(ray.z), 1e-6);
  ray *= iz;

  float3 pos   = float3(uv, 0.0);
  int    level  = maxLevels - 1;  // Start at the coarsest level.
  int    iters  = 0;

  [loop]
  while (level >= 0 && iters < maxIterations) {
    iters++;

    // Sample the min-max bounds at the current mip level.
    float2 minMax = heightMinMaxMip.SampleLevel(samp, pos.xy, (float)level);
    float  hMin   = 1.0 - minMax.g;  // Invert: we trace from top.
    float  hMax   = 1.0 - minMax.r;

    if (pos.z >= hMin) {
      // Ray is below or at the minimum height — intersection
      // is in this cell.  Refine to the next level.
      level--;
    } else {
      // Ray is above the maximum height in this cell.  Compute
      // the distance to exit this cell and advance.
      float  cellSize = 1.0 / (textureSize.x / exp2((float)level));
      float2 cellMin  = floor(pos.xy / cellSize) * cellSize;

      // Distance to exit cell on each axis.
      float2 tExit;
      tExit.x = (ray.x > 0.0)
        ? (cellMin.x + cellSize - pos.x) / max(ray.x * heightScale, 1e-8)
        : (cellMin.x - pos.x) / min(ray.x * heightScale, -1e-8);
      tExit.y = (ray.y > 0.0)
        ? (cellMin.y + cellSize - pos.y) / max(ray.y * heightScale, 1e-8)
        : (cellMin.y - pos.y) / min(ray.y * heightScale, -1e-8);

      float t = min(tExit.x, tExit.y) + 1e-5;
      pos += ray * t * heightScale;

      // After stepping, go back up to a coarser level to check.
      level = min(level + 1, maxLevels - 1);
    }

    // Safety: if we've exited the [0,1] UV range, stop.
    if (any(pos.xy < 0.0) || any(pos.xy > 1.0) || pos.z > 1.0) break;
  }

  return pos.xy;
}

// Convenience overload with default level/iteration caps.
float2 QuadtreeDisplacementMapping(
    Texture2D<float2> heightMinMaxMip,
    SamplerState      samp,
    float2            uv,
    float3            viewDirTS,
    float             heightScale,
    float2            textureSize)
{
  return QuadtreeDisplacementMapping(heightMinMaxMip, samp, uv, viewDirTS,
                                     heightScale, textureSize,
                                     RENODX_QDM_MAX_LEVELS,
                                     RENODX_QDM_MAX_ITERATIONS);
}

// ---------------------------------------------------------------------------
// 1.16h  Surface Gradient Bump Mapping Framework
// ---------------------------------------------------------------------------
// Reference: Mikkelsen 2020 — "Surface Gradient–Based Bump Mapping
//            Framework", JCGT Vol. 9, No. 3
//
// The standard approach of decoding per-pixel normals in tangent space
// and blending them breaks down when multiple bump sources are
// combined (triplanar mapping, decals, detail layers, procedural
// heightfields).  Each source may have a different tangent basis,
// and naïve blending produces incorrect lighting — especially
// visible as lighting discontinuities at triplanar blend seams.
//
// The surface gradient framework solves this by working in a
// unified space: instead of manipulating normal vectors directly,
// each bump source contributes a *surface gradient* — a 2D vector
// in the tangent plane that describes the local height slope.
// Gradients from different sources (with different tangent bases)
// are simply *summed*, and the final perturbed normal is obtained
// by subtracting the accumulated gradient from the original normal.
//
// Key advantages for RenoDX injection:
//   • Correct blending of any number of bump sources, even with
//     inconsistent tangent frames.
//   • Drop-in replacement for existing tangent-space normal-map
//     decoding — same inputs, mathematically correct output.
//   • Works with triplanar, world-space, object-space, and
//     procedural bump maps in a single unified framework.
// ---------------------------------------------------------------------------

// Convert a tangent-space normal (decoded from a normal map) into a
// surface gradient in world space.
//
// Parameters:
//   normalTS    – decoded tangent-space normal (e.g. from normal map,
//                 with .xy in [−1,1] and .z > 0)
//   tangentWS   – normalised tangent vector (world space)
//   bitangentWS – normalised bitangent vector (world space)
//   normalWS    – normalised geometric normal (world space)
//
// Returns: float3 surface gradient in world space.
float3 SurfaceGradientFromTBN(
    float3 normalTS,
    float3 tangentWS,
    float3 bitangentWS,
    float3 normalWS)
{
  // The surface gradient is the tangent-plane projection of the
  // perturbed normal direction, scaled by -1/nz.
  // surfGrad = -(nts.x * T + nts.y * B) / nts.z
  return -(normalTS.x * tangentWS + normalTS.y * bitangentWS)
         / max(normalTS.z, 1e-6);
}

// Convert a heightmap-derived gradient (dh/du, dh/dv) into a
// surface gradient in world space.
//
// Parameters:
//   dhdUV       – float2(dh/du, dh/dv) height derivatives in UV space
//   tangentWS   – normalised tangent vector (world space)
//   bitangentWS – normalised bitangent vector (world space)
//
// Returns: float3 surface gradient in world space.
float3 SurfaceGradientFromHeight(
    float2 dhdUV,
    float3 tangentWS,
    float3 bitangentWS)
{
  return dhdUV.x * tangentWS + dhdUV.y * bitangentWS;
}

// Convert a world-space perturbed normal (e.g. from an object-space
// normal map or procedural function) into a surface gradient.
//
// Parameters:
//   perturbedNormalWS – the desired perturbed normal (world space, normalised)
//   geometricNormalWS – the original unperturbed normal (world space, normalised)
//
// Returns: float3 surface gradient in world space.
float3 SurfaceGradientFromPerturbedNormal(
    float3 perturbedNormalWS,
    float3 geometricNormalWS)
{
  // surfGrad = N - N_perturbed * (dot(N, N_perturbed))
  // This ensures the gradient lies in the tangent plane of N.
  float  NdotNp = dot(geometricNormalWS, perturbedNormalWS);
  return (geometricNormalWS - perturbedNormalWS * NdotNp)
         / max(NdotNp, 1e-6);
}

// Triplanar surface gradient: projects world-space height derivatives
// along each axis-aligned projection and blends by triplanar weights.
//
// Parameters:
//   dhdX       – float2 height derivatives for the X-axis projection (YZ plane)
//   dhdY       – float2 height derivatives for the Y-axis projection (XZ plane)
//   dhdZ       – float2 height derivatives for the Z-axis projection (XY plane)
//   weightsXYZ – triplanar blend weights (should sum to ~1)
//   normalWS   – geometric surface normal (world space, normalised)
//
// Returns: float3 blended surface gradient in world space.
float3 SurfaceGradientTriplanar(
    float2 dhdX,
    float2 dhdY,
    float2 dhdZ,
    float3 weightsXYZ,
    float3 normalWS)
{
  // Project each axis's height gradient into its respective plane.
  // The sign flips ensure consistent orientation with the surface normal.
  float3 gradX = float3(0.0, dhdX.x, dhdX.y) * sign(normalWS.x);
  float3 gradY = float3(dhdY.x, 0.0, dhdY.y) * sign(normalWS.y);
  float3 gradZ = float3(dhdZ.x, dhdZ.y, 0.0) * sign(normalWS.z);

  return gradX * weightsXYZ.x + gradY * weightsXYZ.y + gradZ * weightsXYZ.z;
}

// Resolve accumulated surface gradient to a final perturbed normal.
//
// This is the final step: subtract the accumulated gradient from the
// geometric normal and re-normalise.
//
// Parameters:
//   geometricNormalWS – original unperturbed surface normal (world space)
//   surfaceGradient   – accumulated surface gradient (sum of all sources)
//
// Returns: float3 perturbed normal (world space, normalised).
float3 SurfaceGradientResolveNormal(
    float3 geometricNormalWS,
    float3 surfaceGradient)
{
  return normalize(geometricNormalWS - surfaceGradient);
}

// ---------------------------------------------------------------------------
// 1.16i  Interval Mapping (Affine Root Bracketing)
// ---------------------------------------------------------------------------
// Reference: Risser et al. 2005 — "Interval Mapping", GPU Gems 2
//
// Standard linear-search POM can miss thin features (e.g. a wire on
// a flat surface) because the sampling points straddle the feature.
// Interval mapping replaces the simple "is the ray below the
// surface?" test with affine interval arithmetic: each step
// evaluates both the height at the current sample and the next
// sample, fitting a linear segment through each pair.  The
// intersection of the view ray with this linear segment gives a
// guaranteed bracket around the true root.
//
// This ensures the first intersection is never skipped, regardless
// of step count.  The cost per step is marginally higher (one
// extra comparison), but fewer total steps are needed.
//
// Parameters:
//   heightMap     – R channel heightmap (1 = top, 0 = bottom)
//   heightSampler – sampler for the heightmap
//   uv            – base UV coordinates
//   viewDirTS     – tangent-space view ray (from POMViewRayTS)
//   heightScale   – displacement scale
//   linearSteps   – number of linear search steps
//   binarySteps   – refinement steps after bracketing
//
// Returns: float2 parallax-displaced UV coordinates.
// ---------------------------------------------------------------------------
float2 IntervalMapping(
    Texture2D<float>  heightMap,
    SamplerState      heightSampler,
    float2            uv,
    float3            viewDirTS,
    float             heightScale,
    int               linearSteps,
    int               binarySteps)
{
  float  stepSize  = 1.0 / (float)linearSteps;
  float2 uvStep    = viewDirTS.xy * stepSize;

  // Start at the surface top.
  float2 currUV   = uv;
  float  rayDepth = 1.0;
  float  currH    = heightMap.SampleLevel(heightSampler, currUV, 0);

  float2 prevUV   = currUV;
  float  prevRay  = rayDepth;
  float  prevH    = currH;

  // Phase 1: linear search with interval test.
  [loop]
  for (int i = 0; i < linearSteps; i++) {
    float2 nextUV    = currUV - uvStep;
    float  nextRay   = rayDepth - stepSize;
    float  nextH     = heightMap.SampleLevel(heightSampler, nextUV, 0);

    // The view ray goes from (currUV, rayDepth) to (nextUV, nextRay).
    // The height surface goes from currH to nextH.
    // An intersection exists if the ray crosses the height segment.
    float  d0 = rayDepth - currH;   // Gap at start of interval.
    float  d1 = nextRay  - nextH;   // Gap at end of interval.

    if (d0 >= 0.0 && d1 < 0.0) {
      // Root is bracketed in this interval.
      prevUV  = currUV;
      prevRay = rayDepth;
      prevH   = currH;

      currUV   = nextUV;
      rayDepth = nextRay;
      currH    = nextH;
      break;
    }

    prevUV   = currUV;
    prevRay  = rayDepth;
    prevH    = currH;

    currUV   = nextUV;
    rayDepth = nextRay;
    currH    = nextH;
  }

  // Phase 2: secant + binary refinement.
  // First, use the linear interpolation (secant method) for the
  // initial estimate, then refine with binary search.
  float d0 = prevRay - prevH;
  float d1 = rayDepth - currH;
  float t  = d0 / (d0 - d1 + 1e-8);

  float2 bestUV = lerp(prevUV, currUV, t);

  // Binary refinement around the secant estimate.
  float2 lo = prevUV;
  float2 hi = currUV;
  float  loRay = prevRay;
  float  hiRay = rayDepth;

  [loop]
  for (int j = 0; j < binarySteps; j++) {
    float2 midUV  = 0.5 * (lo + hi);
    float  midRay = 0.5 * (loRay + hiRay);
    float  midH   = heightMap.SampleLevel(heightSampler, midUV, 0);

    if (midRay <= midH) {
      hi    = midUV;
      hiRay = midRay;
    } else {
      lo    = midUV;
      loRay = midRay;
    }
  }

  return 0.5 * (lo + hi);
}

// Convenience overload with default step counts.
float2 IntervalMapping(
    Texture2D<float> heightMap,
    SamplerState     heightSampler,
    float2           uv,
    float3           viewDirTS,
    float            heightScale)
{
  int steps = POMAdaptiveStepCount(viewDirTS,
                                   RENODX_POM_LINEAR_STEPS_MIN,
                                   RENODX_POM_LINEAR_STEPS_MAX);
  return IntervalMapping(heightMap, heightSampler, uv, viewDirTS,
                         heightScale, steps, RENODX_POM_BINARY_STEPS);
}

// ============================================================================
// 1.17  Stochastic Transparency & Alpha Improvements
// ----------------------------------------------------------------------------
// Inspired by AC Shadows (SIGGRAPH 2025) stochastic alpha testing and
// multi-layer transparency, adapted to techniques feasible via RenoDX
// shader replacement.
//
// BACKGROUND:
//   Most games use hard alpha testing:  clip(alpha - 0.5);
//   This produces jaggy, binary edges on foliage, hair, fences, and any
//   alpha-tested geometry.  Shadows from alpha-tested geometry also have
//   hard, unnatural silhouettes.
//
//   AC Shadows replaced deterministic alpha testing with STOCHASTIC alpha
//   testing — each fragment is accepted or rejected probabilistically
//   based on its alpha value.  Over multiple frames, temporal accumulation
//   (TAA / DLSS / FSR / XeSS) converges the noisy result to correct
//   smooth transparency.  This produces:
//     • Soft, anti-aliased foliage and hair edges
//     • Natural, dappled shadow maps from foliage canopies
//     • Smooth LOD cross-fade transitions
//     • Correct multi-layer transparency without sorting
//
//   For RT any-hit shaders, stochastic alpha is also a major performance
//   win — each intersection becomes a binary accept/reject decision,
//   avoiding expensive transparency accumulation along rays.
//
// NOISE SOURCE — IS-FAST (§1.12):
//   The quality of stochastic alpha testing depends critically on the
//   noise source.  White noise produces slow convergence and visible
//   grain.  The IS-FAST (Importance-Sampled Fast Approximation of
//   Spatio-Temporal) blue noise system in §1.12 is ideal because:
//
//     • Spatially blue — neighboring pixels get well-separated threshold
//       values, preventing clumpy accept/reject patterns.  This means
//       edges appear smooth even before temporal accumulation.
//
//     • Temporally stratified — successive frames sample different parts
//       of the threshold space, ensuring fast convergence.  TAA/DLSS
//       typically converges the result in 4–8 frames.
//
//     • Importance-sampled — the sampling distribution can be shaped to
//       concentrate samples where they matter most (near the alpha
//       threshold boundary), accelerating convergence further.
//
//
//   If an IS-FAST blue noise texture is not available, the algebraic
//   hash fallback (StochasticAlphaHash) is provided — it generates
//   acceptable spatio-temporal noise from screen position + frame index
//   alone, requiring no additional texture bindings.
//
// Three techniques are provided:
//
//   a) Stochastic alpha test       — replaces clip(alpha - threshold)
//   b) Stochastic shadow alpha     — variant tuned for shadow map passes
//   c) Improved alpha-to-coverage  — blue-noise-driven SV_Coverage mask
//
// PREREQUISITES:
//   • The game must have temporal accumulation active (TAA, DLSS, FSR,
//     or XeSS) for the stochastic result to converge.  Without temporal
//     filtering, the output is just noisy.  Nearly all modern titles
//     ship with at least one of these.
//   • A frame counter must be available.  In RenoDX mods, this is
//     typically injected via the shader_injection constant buffer.
//   • For best quality: an IS-FAST blue noise texture (§1.12) bound
//     as an SRV.  For acceptable quality: use the hash fallback.
// ============================================================================

// ---------------------------------------------------------------------------
// 1.17a  Stochastic Alpha Test
// ---------------------------------------------------------------------------
// Replaces a game's deterministic alpha test with a probabilistic one.
//
// Traditional:  clip(alpha - 0.5);        // hard binary edge
// Stochastic:   clip(alpha - noise);      // soft probabilistic edge
//
// Over N frames of temporal accumulation, a texel with alpha = 0.7 will
// pass the test ~70% of the time, converging to correct transparency.
//
// Two variants:
//   (i)  Texture-based — uses an IS-FAST blue noise SRV (best quality)
//   (ii) Hash-based    — algebraic hash, no extra textures needed
//
// Parameters:
//   alpha          – the fragment's alpha value [0,1] from the albedo texture
//   screenPos      – SV_Position.xy (pixel coordinates, not UV)
//   frameIndex     – frame counter for temporal jitter (from shader_injection
//                    CB or any per-frame counter).  Can be uint or float.
//   sharpen        – edge sharpening factor (default 1.0).
//                    Values > 1 tighten the stochastic band around the
//                    alpha threshold, producing sharper edges with slower
//                    convergence.  Values < 1 widen it for softer edges
//                    with faster convergence.
//                    Recommended: 0.8–1.5 depending on TAA quality.
//
// Usage:
//   // In the foliage / hair pixel shader, replace:
//   //   clip(alpha - 0.5);
//   // With:
//   renodx::rendering::StochasticAlphaTest(alpha, input.position.xy, frameIndex);
// ---------------------------------------------------------------------------

// -- 1.17a-i.  Stochastic Alpha Test — IS-FAST Blue Noise (best quality) ------
//
// Uses an IS-FAST blue noise texture (§1.12) for the threshold.  This
// produces the smoothest edges and fastest temporal convergence because
// the blue noise ensures neighboring pixels receive well-separated
// thresholds (no clumping) and successive frames are temporally stratified.
//
// The blue noise texture should be:
//   • R8_UNORM or R16_FLOAT, 64×64 or larger, tiling
//   • Injected as SRV via push_descriptors
//   • The same texture can be shared with SSAO, shadow dithering, etc.
//
// Parameters:
//   alpha         – fragment alpha [0,1]
//   blueNoiseTex  – the IS-FAST blue noise texture (Texture2D<float>)
//   noiseSampler  – point-wrap sampler (wrap mode is essential for tiling)
//   screenPos     – SV_Position.xy
//   noiseSize     – blue noise texture dimensions, e.g. float2(64.0, 64.0)
//   frameIndex    – frame counter for temporal jitter
//   sharpen       – edge sharpening (default 1.0)
void StochasticAlphaTestBlueNoise(
    float              alpha,
    Texture2D<float>   blueNoiseTex,
    SamplerState       noiseSampler,
    float2             screenPos,
    float2             noiseSize,
    uint               frameIndex,
    float              sharpen = 1.0)
{
  // Sample blue noise, tiled across screen
  float2 noiseUV = screenPos / noiseSize;
  float  noise   = blueNoiseTex.SampleLevel(noiseSampler, noiseUV, 0);

  // Temporal jitter: offset the noise by golden ratio per frame.
  // This is the standard temporal blue noise animation technique —
  // adding an irrational offset each frame produces a low-discrepancy
  // sequence in [0,1] that is temporally stratified.
  // See §1.12 IS-FAST for the theoretical basis.
  static const float GOLDEN_RATIO_FRAC = 0.6180339887;  // (√5 - 1) / 2
  noise = frac(noise + (float)frameIndex * GOLDEN_RATIO_FRAC);

  // Sharpen: remap noise to concentrate around 0.5
  // At sharpen = 1.0 this is identity.  Higher values steepen the
  // transition band, making the stochastic edge thinner.
  if (sharpen != 1.0)
  {
    noise = saturate((noise - 0.5) * sharpen + 0.5);
  }

  clip(alpha - noise);
}

// -- 1.17a-ii.  Stochastic Alpha Test — Hash Fallback (no extra textures) -----
//
// When no blue noise texture is available, this variant uses an algebraic
// hash for the stochastic threshold.  The hash combines screen position
// and frame index to produce spatially and temporally varying noise.
//
// Quality is lower than IS-FAST blue noise (the spatial spectrum is not
// strictly blue, so some clumping may be visible), but it's sufficient
// for most use cases and requires ZERO additional texture bindings —
// making it the easiest to integrate into any shader.
//
// Parameters:
//   alpha      – fragment alpha [0,1]
//   screenPos  – SV_Position.xy
//   frameIndex – frame counter
//   sharpen    – edge sharpening (default 1.0)
void StochasticAlphaTestHash(
    float  alpha,
    float2 screenPos,
    uint   frameIndex,
    float  sharpen = 1.0)
{
  // Spatial hash: interleaved gradient noise (Jimenez 2014)
  // Produces reasonably well-distributed values across screen pixels
  float noise = frac(52.9829189 * frac(
      dot(screenPos, float2(0.06711056, 0.00583715))));

  // Temporal jitter via golden ratio offset
  static const float GOLDEN_RATIO_FRAC = 0.6180339887;
  noise = frac(noise + (float)frameIndex * GOLDEN_RATIO_FRAC);

  // Sharpen
  if (sharpen != 1.0)
  {
    noise = saturate((noise - 0.5) * sharpen + 0.5);
  }

  clip(alpha - noise);
}

// ---------------------------------------------------------------------------
// 1.17b  Stochastic Shadow Alpha
// ---------------------------------------------------------------------------
// Variant of the stochastic alpha test specifically for shadow map passes.
//
// Shadow maps that use hard alpha testing produce sharp, unnatural shadow
// silhouettes from foliage, fences, and hair.  Replacing the alpha test
// with a stochastic version produces soft, dappled shadows that look
// dramatically more natural — tree canopy shadows get realistic light
// filtering, fence shadows get soft penumbra-like edges.
//
// This works particularly well because shadow maps are typically sampled
// with PCF (Percentage Closer Filtering) or VSM, which inherently average
// multiple texels.  The stochastic variation across shadow map texels acts
// as a built-in soft shadow filter — each texel independently decides
// whether it's in shadow based on alpha, and the PCF kernel averages
// these binary decisions into a smooth result.
//
// KEY DIFFERENCE from 1.17a:
//   The noise should use WORLD-SPACE or OBJECT-SPACE hashing rather than
//   screen-space, so shadow texels remain stable as the light source moves.
//   Screen-space noise would cause the shadow map to shimmer as the light
//   pans.  World-space noise is view-independent and stable.
//
// Two variants:
//   (i)  World-space hash — stable across light movement (recommended)
//   (ii) Shadow-UV hash   — uses shadow map UVs (simpler, slightly less stable)
//
// Parameters:
//   alpha      – fragment alpha [0,1] from the albedo texture
//   worldPos   – world-space position of the fragment being shadow-tested
//   frameIndex – frame counter for temporal jitter
//   softness   – controls shadow edge softness (default 1.0)
//                Higher = softer edges (wider stochastic band)
//                Lower  = harder edges (narrower band)
//                0.5–1.5 is a good range.
//
// Usage:
//   // In the shadow pass pixel shader, replace:
//   //   clip(alpha - 0.5);
//   // With:
//   renodx::rendering::StochasticShadowAlpha(alpha, worldPos, frameIndex);
// ---------------------------------------------------------------------------

// -- 1.17b-i.  Stochastic Shadow Alpha — World-Space Hash ---------------------
void StochasticShadowAlphaWorld(
    float  alpha,
    float3 worldPos,
    uint   frameIndex,
    float  softness = 1.0)
{
  // World-space hash: stable regardless of camera/light movement.
  // Uses a 3D variant of interleaved gradient noise.
  float3 quantized = floor(worldPos * 50.0);  // quantize to ~2cm grid
  float noise = frac(52.9829189 * frac(
      quantized.x * 0.06711056 +
      quantized.y * 0.00583715 +
      quantized.z * 0.05413927));

  // Temporal jitter
  static const float GOLDEN_RATIO_FRAC = 0.6180339887;
  noise = frac(noise + (float)frameIndex * GOLDEN_RATIO_FRAC);

  // Softness: inverse of sharpen — wider band = softer shadow edges
  float sharpen = 1.0 / max(softness, 0.01);
  noise = saturate((noise - 0.5) * sharpen + 0.5);

  clip(alpha - noise);
}

// -- 1.17b-ii.  Stochastic Shadow Alpha — Shadow UV Hash ----------------------
// Simpler variant that uses the shadow map UV as the hash seed.
// Slightly less stable than world-space when shadow cascades shift,
// but requires no world position — only the interpolated UV.
//
// Parameters:
//   alpha      – fragment alpha [0,1]
//   shadowUV   – shadow map UV (from the light-space projection)
//   frameIndex – frame counter
//   softness   – shadow softness (default 1.0)
void StochasticShadowAlphaUV(
    float  alpha,
    float2 shadowUV,
    uint   frameIndex,
    float  softness = 1.0)
{
  // Hash from shadow map UV coordinates
  float noise = frac(52.9829189 * frac(
      dot(shadowUV * 1000.0, float2(0.06711056, 0.00583715))));

  static const float GOLDEN_RATIO_FRAC = 0.6180339887;
  noise = frac(noise + (float)frameIndex * GOLDEN_RATIO_FRAC);

  float sharpen = 1.0 / max(softness, 0.01);
  noise = saturate((noise - 0.5) * sharpen + 0.5);

  clip(alpha - noise);
}

// ---------------------------------------------------------------------------
// 1.17c  Improved Alpha-to-Coverage
// ---------------------------------------------------------------------------
// Replaces hardware alpha-to-coverage with a blue-noise-driven coverage
// mask written via SV_Coverage.
//
// Hardware A2C uses an implementation-defined ordered dither pattern that
// produces visible banding — especially at low MSAA sample counts (2× or
// 4×).  By generating the coverage mask from IS-FAST blue noise (§1.12)
// with temporal jitter, we get:
//
//   • Per-pixel variation instead of repeating dither patterns
//   • Temporal stratification for fast TAA/DLSS convergence
//   • Smoother apparent edges, especially on foliage and hair
//
// REQUIREMENTS:
//   • MSAA must be enabled (this technique outputs SV_Coverage bits)
//   • The game's foliage/hair shader must be using A2C or alpha test
//   • A blue noise texture (IS-FAST §1.12) for best quality, OR use
//     the hash fallback variant
//
// HOW TO USE:
//   In your replacement pixel shader, instead of relying on hardware A2C
//   or the game's alpha test, call this function and output the returned
//   coverage mask via the SV_Coverage semantic:
//
//     struct PSOutput {
//       float4 color    : SV_Target0;
//       uint   coverage : SV_Coverage;   // <-- add this
//     };
//
//     PSOutput main(...) {
//       PSOutput o;
//       o.color = ...;
//       o.coverage = renodx::rendering::AlphaToCoverageBlueNoise(
//           alpha, blueNoiseTex, sampler, screenPos, noiseSize,
//           frameIndex, sampleCount);
//       return o;
//     }
//
// Parameters:
//   alpha        – fragment alpha [0,1]
//   noise        – blue noise value [0,1] (from IS-FAST §1.12 or hash).
//                  Should already include temporal jitter.
//   sampleCount  – MSAA sample count (2, 4, or 8)
//
// Returns:  uint coverage mask with bits set per MSAA sample.
// ---------------------------------------------------------------------------
uint AlphaToCoverageBlueNoise(
    float alpha,
    float noise,
    uint  sampleCount)
{
  uint coverage = 0;

  // Dither the alpha threshold per sample using the noise value.
  // Each sample gets a slightly offset threshold derived from the single
  // noise value, producing a coverage ramp across samples.
  for (uint s = 0; s < sampleCount; s++)
  {
    // Per-sample threshold: evenly spaced across [0,1], offset by noise
    float sampleThreshold = frac(noise + (float)s / (float)sampleCount);

    if (alpha > sampleThreshold)
      coverage |= (1u << s);
  }

  return coverage;
}

// ---------------------------------------------------------------------------
// 1.17c′  Alpha-to-Coverage — Convenience wrapper with IS-FAST texture
// ---------------------------------------------------------------------------
// Combines blue noise sampling, temporal jitter, and coverage mask
// generation in a single call.
//
// Parameters:
//   alpha         – fragment alpha [0,1]
//   blueNoiseTex  – IS-FAST blue noise texture (Texture2D<float>)
//   noiseSampler  – point-wrap sampler
//   screenPos     – SV_Position.xy
//   noiseSize     – blue noise texture dimensions
//   frameIndex    – frame counter
//   sampleCount   – MSAA sample count (2, 4, or 8)
//
// Returns:  uint coverage mask for SV_Coverage output.
uint AlphaToCoverageISFAST(
    float              alpha,
    Texture2D<float>   blueNoiseTex,
    SamplerState       noiseSampler,
    float2             screenPos,
    float2             noiseSize,
    uint               frameIndex,
    uint               sampleCount)
{
  // Sample and animate blue noise (same pattern as §1.17a-i)
  float2 noiseUV = screenPos / noiseSize;
  float  noise   = blueNoiseTex.SampleLevel(noiseSampler, noiseUV, 0);

  static const float GOLDEN_RATIO_FRAC = 0.6180339887;
  noise = frac(noise + (float)frameIndex * GOLDEN_RATIO_FRAC);

  return AlphaToCoverageBlueNoise(alpha, noise, sampleCount);
}

// ---------------------------------------------------------------------------
// 1.17c″  Alpha-to-Coverage — Hash Fallback (no texture)
// ---------------------------------------------------------------------------
// Same as above but uses the algebraic hash instead of a blue noise
// texture.  Lower quality but zero additional resource bindings.
//
// Parameters:
//   alpha       – fragment alpha [0,1]
//   screenPos   – SV_Position.xy
//   frameIndex  – frame counter
//   sampleCount – MSAA sample count (2, 4, or 8)
//
// Returns:  uint coverage mask for SV_Coverage output.
uint AlphaToCoverageHash(
    float  alpha,
    float2 screenPos,
    uint   frameIndex,
    uint   sampleCount)
{
  float noise = frac(52.9829189 * frac(
      dot(screenPos, float2(0.06711056, 0.00583715))));

  static const float GOLDEN_RATIO_FRAC = 0.6180339887;
  noise = frac(noise + (float)frameIndex * GOLDEN_RATIO_FRAC);

  return AlphaToCoverageBlueNoise(alpha, noise, sampleCount);
}

// ============================================================================
// 1.18  Temporal Stability Techniques
// ----------------------------------------------------------------------------
// Inspired by AC Shadows (SIGGRAPH 2025) temporal stabilisation system and
// modern denoiser architectures (SVGF, ReBLUR, A-SVGF).
//
// BACKGROUND:
//   Hybrid rendering mixes rasterised and ray-traced signals.  RT effects
//   (shadows, GI, reflections, AO) are noisy because they use few rays per
//   pixel.  Temporal accumulation blends the current noisy frame with
//   history to converge toward a clean result.  But naive accumulation
//   produces ghosting on moving objects and smearing on disoccluded
//   surfaces.  AC Shadows solved this with a multi-component system:
//
//     A) Variance-guided temporal accumulation — dynamically adjust the
//        blend factor per pixel based on local signal variance. High
//        variance (noisy) → accept more of current frame for faster
//        convergence.  Low variance (stable) → retain more history for
//        clean output.
//
//     B) Disocclusion detection — reject temporal history for pixels
//        where the surface has changed (camera moved, object moved,
//        depth or normal discontinuity).  Uses depth, normal, motion
//        vector and optionally material ID.
//
//     C) Neighborhood clamping (variance clipping) — constrain the
//        reprojected history to lie within the plausible range defined
//        by the current frame's local statistics [mean ± k·σ].  This
//        prevents ghosted history from persisting even when disocclusion
//        detection misses a change.  Same technique as Karis 2014 /
//        Salvi 2016 TAA, but applied per-signal.
//
//     D) Adaptive blend factor mapping — maps variance and confidence
//        metrics to the EMA blend weight.  Replaces fixed blend factors.
//
//     E) Per-signal temporal configuration — different signals (shadows,
//        GI, reflections, AO) have different convergence rates and
//        require different blend/clamp parameters.
//
// HOW THIS CONNECTS TO EXISTING SECTIONS:
//
//   §1.10l ShadowConfidence — implements binary state tracking for shadows
//     (lit/unlit change detection via XOR bitmap).  This is the Markov
//     chain state evolution pattern applied to shadow signals.  The
//     temporal stability functions here generalise that concept to
//     continuous-valued signals (luminance, color) using variance.
//
//   §1.10m SpatialHashShadowDenoise — provides spatial-only fallback
//     filtering for when temporal history is unavailable.  The
//     disocclusion detection in this section tells you WHEN to fall
//     back to spatial filtering.
//
//   §1.10n ConfidenceAdaptiveShadow — combines §1.10l and §1.10m into
//     a confidence-driven pipeline.  The generic TemporalBlend() and
//     VarianceGuidedBlendFactor() functions here can replace the
//     shadow-specific confidence logic with a more general solution.
//
//   §1.9f ComputeScreenSpaceBentNormal — uses a temporalOffset parameter
//     to jitter hemisphere samples per frame.  The variance computation
//     here can measure whether the bent-normal AO has converged, and
//     the adaptive blend can drive a temporal accumulation buffer.
//
//   §1.12 IS-FAST — provides the blue noise foundation for temporal
//     stratification.  All stochastic effects (§1.17 alpha, §1.9f AO,
//     shadow dithering) rely on IS-FAST for the noise that these
//     temporal stability functions converge.
//
//   §1.17 Stochastic Alpha — uses golden ratio temporal jitter.  The
//     per-signal temporal config (TemporalConfig struct) can provide
//     the blend/clamp settings that control how quickly the stochastic
//     alpha converges under TAA.
//
// RenoDX APPLICABILITY:
//
//   Tier 1 — Pure ALU in existing shaders (highest feasibility):
//     • Variance computation + neighborhood clamping can be injected
//       into any shader that does temporal accumulation (the game's
//       TAA, shadow denoiser, or temporal filter).
//     • Identify the game's temporal blend shader (usually a fullscreen
//       PS that reads current + history buffers) and replace it with a
//       variance-guided version using these functions.
//     • The adaptive blend factor mapping is just smoothstep/lerp —
//       zero additional cost.
//
//   Tier 2 — Injected compute pass (medium feasibility):
//     • Disocclusion detection as a pre-pass that writes a "history
//       validity" mask texture.
//     • Requires: motion vectors (most modern games have them for TAA)
//       + depth from current and previous frames.
//     • The mask is consumed by the temporal blend shader to decide
//       whether to trust history or fall back to spatial filtering.
//
//   Tier 3 — Enhancing existing game denoisers (per-game):
//     • Many games already have temporal denoisers for shadows/GI but
//       with suboptimal parameters (too aggressive or too conservative).
//     • Overriding the denoiser's constant buffer values (blend factor,
//       clamp range) via RenoDX CB override can improve stability
//       without replacing any shaders.
//
// Functions provided:
//
//   a) LocalVariance        — compute mean + variance from a 3×3 neighborhood
//   b) NeighborhoodClamp    — clamp history to [mean ± k·σ]
//   c) DisocclusionDetect   — multi-signal history validity check
//   d) VarianceGuidedBlendFactor — map variance to temporal blend weight
//   e) TemporalBlend        — full pipeline: clamp + blend + disocclusion
//   f) TemporalConfig       — per-signal parameter struct with presets
// ============================================================================

// ---------------------------------------------------------------------------
// 1.18a  Local Variance Computation
// ---------------------------------------------------------------------------
// Computes the mean and variance of a signal (luminance or color) in a
// 3×3 pixel neighborhood around the current pixel.
//
// This is the foundation for variance-guided accumulation and neighborhood
// clamping.  The variance tells you how noisy the current signal is:
//   • High variance → noisy, under-sampled → need more samples / faster blend
//   • Low variance  → converged, stable → retain history / slower blend
//
// The 3×3 neighborhood is the standard window used by SVGF, ReBLUR, and
// AC Shadows.  Larger windows (5×5, 7×7) capture more context but are
// more expensive and blur the variance estimate across edges.
//
// Two variants:
//   (i)  Scalar (luminance) — for AO, shadows, depth-based signals
//   (ii) Color (float3)     — for GI, reflections, lit color signals
// ---------------------------------------------------------------------------

// Holds local statistics for a neighborhood
struct LocalStats
{
  float  mean;       // average luminance in the neighborhood
  float  variance;   // variance of luminance
  float  stddev;     // sqrt(variance) — standard deviation
  float  minVal;     // minimum luminance in the window
  float  maxVal;     // maximum luminance in the window
};

struct LocalStatsColor
{
  float3 mean;       // average color
  float3 variance;   // per-channel variance
  float3 stddev;     // per-channel standard deviation
  float3 minVal;     // per-channel minimum
  float3 maxVal;     // per-channel maximum
};

// -- 1.18a-i.  Scalar Local Variance (3×3) ------------------------------------
// Computes luminance statistics from a 3×3 neighborhood.
//
// Parameters:
//   colorTex     – the signal texture (e.g. shadow buffer, AO buffer,
//                  or lit scene color).  Luminance is computed internally
//                  using BT.709 weights.
//   pointSampler – point-clamp sampler (must be point, not bilinear, to
//                  avoid averaging across the window)
//   screenUV     – current pixel's UV [0,1]²
//   texelSize    – 1.0 / textureResolution (e.g. float2(1/1920, 1/1080))
//
// Returns:  LocalStats struct with mean, variance, stddev, min, max.
LocalStats ComputeLocalVariance(
    Texture2D<float4> colorTex,
    SamplerState      pointSampler,
    float2            screenUV,
    float2            texelSize)
{
  LocalStats s;
  s.mean    = 0.0;
  s.minVal  = 1e10;
  s.maxVal  = -1e10;

  float moment2 = 0.0;  // sum of squared luminances

  // 3×3 gather
  [unroll]
  for (int y = -1; y <= 1; y++)
  {
    [unroll]
    for (int x = -1; x <= 1; x++)
    {
      float2 offset = float2((float)x, (float)y) * texelSize;
      float3 sample_color = colorTex.SampleLevel(
          pointSampler, screenUV + offset, 0).rgb;
      float lum = dot(sample_color, float3(0.2126, 0.7152, 0.0722));

      s.mean   += lum;
      moment2  += lum * lum;
      s.minVal  = min(s.minVal, lum);
      s.maxVal  = max(s.maxVal, lum);
    }
  }

  s.mean    /= 9.0;
  moment2   /= 9.0;
  s.variance = max(moment2 - s.mean * s.mean, 0.0);
  s.stddev   = sqrt(s.variance);

  return s;
}

// -- 1.18a-i′.  Scalar Local Variance from raw float buffer -------------------
// Variant for single-channel textures (shadow map results, AO buffers).
// Avoids the luminance conversion since the signal is already scalar.
LocalStats ComputeLocalVarianceScalar(
    Texture2D<float>  signalTex,
    SamplerState      pointSampler,
    float2            screenUV,
    float2            texelSize)
{
  LocalStats s;
  s.mean    = 0.0;
  s.minVal  = 1e10;
  s.maxVal  = -1e10;

  float moment2 = 0.0;

  [unroll]
  for (int y = -1; y <= 1; y++)
  {
    [unroll]
    for (int x = -1; x <= 1; x++)
    {
      float2 offset = float2((float)x, (float)y) * texelSize;
      float val = signalTex.SampleLevel(pointSampler, screenUV + offset, 0);

      s.mean   += val;
      moment2  += val * val;
      s.minVal  = min(s.minVal, val);
      s.maxVal  = max(s.maxVal, val);
    }
  }

  s.mean    /= 9.0;
  moment2   /= 9.0;
  s.variance = max(moment2 - s.mean * s.mean, 0.0);
  s.stddev   = sqrt(s.variance);

  return s;
}

// -- 1.18a-ii.  Color Local Variance (3×3) ------------------------------------
// Per-channel statistics for color signals (GI, reflections, lit scene).
LocalStatsColor ComputeLocalVarianceColor(
    Texture2D<float4> colorTex,
    SamplerState      pointSampler,
    float2            screenUV,
    float2            texelSize)
{
  LocalStatsColor s;
  s.mean    = 0.0;
  s.minVal  = 1e10;
  s.maxVal  = -1e10;

  float3 moment2 = 0.0;

  [unroll]
  for (int y = -1; y <= 1; y++)
  {
    [unroll]
    for (int x = -1; x <= 1; x++)
    {
      float2 offset = float2((float)x, (float)y) * texelSize;
      float3 c = colorTex.SampleLevel(
          pointSampler, screenUV + offset, 0).rgb;

      s.mean   += c;
      moment2  += c * c;
      s.minVal  = min(s.minVal, c);
      s.maxVal  = max(s.maxVal, c);
    }
  }

  s.mean    /= 9.0;
  moment2   /= 9.0;
  s.variance = max(moment2 - s.mean * s.mean, 0.0);
  s.stddev   = sqrt(s.variance);

  return s;
}

// ---------------------------------------------------------------------------
// 1.18b  Neighborhood Clamping (Variance Clipping)
// ---------------------------------------------------------------------------
// Constrains a reprojected history value to lie within the range of
// plausible values defined by the current frame's local statistics.
//
// This is the core anti-ghosting mechanism used by modern TAA (Karis 2014,
// Salvi 2016) and all production denoisers (SVGF, ReBLUR, A-SVGF).  AC
// Shadows applies it independently to each denoised signal.
//
// How it works:
//   1. Compute the mean (μ) and standard deviation (σ) of the current
//      frame's signal in a local neighborhood (from §1.18a).
//   2. Define a "plausible range" as [μ - k·σ, μ + k·σ].
//   3. Clamp the reprojected history to this range.
//   4. Blend the clamped history with the current frame.
//
// The clamp factor k controls ghosting vs. noise:
//   k = 0.5 — very aggressive, almost no ghosting, but noisy
//   k = 1.0 — standard, good for fast-changing signals (shadows)
//   k = 1.5 — moderate, good for medium signals (AO)
//   k = 2.0 — relaxed, smooth but slower response (GI)
//   k = 3.0 — very relaxed, only catches major disocclusions
//
// Two variants:
//   (i)  Scalar — for luminance / mono signals
//   (ii) Color  — for RGB signals
// ---------------------------------------------------------------------------

// -- 1.18b-i.  Scalar Neighborhood Clamp --------------------------------------
// Parameters:
//   history   – reprojected value from previous frame
//   stats     – local statistics from ComputeLocalVariance()
//   clampK    – standard deviations for the clamp range (default 1.25)
//
// Returns:  clamped history value.
float NeighborhoodClamp(
    float      history,
    LocalStats stats,
    float      clampK = 1.25)
{
  float lo = stats.mean - clampK * stats.stddev;
  float hi = stats.mean + clampK * stats.stddev;
  return clamp(history, lo, hi);
}

// -- 1.18b-ii.  Color Neighborhood Clamp --------------------------------------
float3 NeighborhoodClampColor(
    float3          history,
    LocalStatsColor stats,
    float           clampK = 1.25)
{
  float3 lo = stats.mean - clampK * stats.stddev;
  float3 hi = stats.mean + clampK * stats.stddev;
  return clamp(history, lo, hi);
}

// -- 1.18b-iii.  AABB Clamp (min/max variant) ---------------------------------
// Simpler variant that clamps to the actual min/max observed in the
// neighborhood rather than mean ± k·σ.  Tighter but more susceptible
// to outliers.  Useful when the signal is already fairly clean.
float NeighborhoodClampMinMax(float history, LocalStats stats)
{
  return clamp(history, stats.minVal, stats.maxVal);
}

float3 NeighborhoodClampMinMaxColor(float3 history, LocalStatsColor stats)
{
  return clamp(history, stats.minVal, stats.maxVal);
}

// ---------------------------------------------------------------------------
// 1.18c  Disocclusion Detection
// ---------------------------------------------------------------------------
// Determines whether the temporal history at a pixel is valid — i.e. whether
// the reprojected previous-frame data represents the same surface.
//
// AC Shadows uses multiple signals to detect disocclusion, each catching
// different failure modes:
//
//   1. Depth discrepancy — compare current depth to reprojected depth.
//      A large difference means the surface changed (something was revealed
//      or occluded by camera/object motion).
//
//   2. Normal discrepancy — compare current normal to reprojected normal.
//      A large angular difference means different geometry is now visible.
//
//   3. Motion vector confidence — if the reprojected UV falls outside
//      [0,1]² (offscreen), history is invalid.  Also checks for extreme
//      motion vector magnitude (reliability heuristic).
//
//   4. Material ID mismatch — if the game stores material IDs in the
//      G-buffer, a mismatch means different objects → hard reject.
//      This is optional since not all games expose material IDs.
//
// When disocclusion is detected, the temporal blend should fall back to
// spatial-only filtering (e.g. §1.10m SpatialHashShadowDenoise), accepting
// more noise rather than showing ghosted artifacts.
//
// Parameters:
//   currentDepth       – linear view-space depth of the current pixel
//   reprojectedDepth   – depth from the previous frame at the reprojected UV
//   currentNormal      – world-space normal at the current pixel
//   reprojectedNormal  – normal from the previous frame at the reprojected UV
//   reprojectedUV      – the UV after applying the motion vector
//   depthThreshold     – relative depth difference threshold (default 0.05)
//                        0.05 = 5% relative difference triggers rejection.
//                        Lower = more sensitive, catches thin geometry.
//                        Higher = more forgiving, may let leaks through.
//   normalThreshold    – minimum dot product for normal similarity
//                        (default 0.9 ≈ ~26° angular difference).
//                        Lower = more forgiving.  Higher = stricter.
//
// Returns:  validity weight [0,1].
//           1.0 = history is fully valid, trust it.
//           0.0 = disoccluded, reject history entirely.
//           Intermediate values = partial validity (gradual rejection).
//
// Usage:
//   float validity = renodx::rendering::DisocclusionDetect(
//       linDepth, prevLinDepth, normal, prevNormal, reprojUV);
//   blendFactor = lerp(1.0, blendFactor, validity);  // reset on disocclusion
// ---------------------------------------------------------------------------
float DisocclusionDetect(
    float  currentDepth,
    float  reprojectedDepth,
    float3 currentNormal,
    float3 reprojectedNormal,
    float2 reprojectedUV,
    float  depthThreshold  = 0.05,
    float  normalThreshold = 0.9)
{
  // 1. Screen bounds check — reprojected UV outside screen?
  float inBounds = (all(reprojectedUV >= 0.0) && all(reprojectedUV <= 1.0))
                   ? 1.0 : 0.0;

  // 2. Depth similarity — relative difference
  float avgDepth   = 0.5 * (currentDepth + reprojectedDepth) + 1e-6;
  float depthDiff  = abs(currentDepth - reprojectedDepth) / avgDepth;
  float depthValid = 1.0 - smoothstep(depthThreshold * 0.5,
                                       depthThreshold, depthDiff);

  // 3. Normal similarity — dot product
  float normalDot   = dot(normalize(currentNormal),
                          normalize(reprojectedNormal));
  float normalValid = smoothstep(normalThreshold - 0.1,
                                  normalThreshold, normalDot);

  // Combine — all checks must pass
  return inBounds * depthValid * normalValid;
}

// ---------------------------------------------------------------------------
// 1.18c′  Disocclusion Detection — Simplified (depth + bounds only)
// ---------------------------------------------------------------------------
// Lighter variant that only checks depth discrepancy and screen bounds.
// Use when normals from the previous frame are not available (common —
// many games don't preserve the previous normal buffer).
//
// Parameters:
//   currentDepth     – linear view-space depth at the current pixel
//   reprojectedDepth – previous-frame depth at the reprojected UV
//   reprojectedUV    – UV after motion vector
//   depthThreshold   – relative depth threshold (default 0.05)
//
// Returns:  validity [0,1].
float DisocclusionDetectSimple(
    float  currentDepth,
    float  reprojectedDepth,
    float2 reprojectedUV,
    float  depthThreshold = 0.05)
{
  float inBounds = (all(reprojectedUV >= 0.0) && all(reprojectedUV <= 1.0))
                   ? 1.0 : 0.0;

  float avgDepth  = 0.5 * (currentDepth + reprojectedDepth) + 1e-6;
  float depthDiff = abs(currentDepth - reprojectedDepth) / avgDepth;
  float depthValid = 1.0 - smoothstep(depthThreshold * 0.5,
                                       depthThreshold, depthDiff);

  return inBounds * depthValid;
}

// ---------------------------------------------------------------------------
// 1.18d  Variance-Guided Blend Factor
// ---------------------------------------------------------------------------
// Maps local signal variance to a temporal accumulation blend weight.
// Replaces fixed EMA blend factors with an adaptive one.
//
// AC Shadows' insight:
//   Fixed blend factors are always a compromise.  Too low (0.02) and noise
//   persists for many frames.  Too high (0.2) and you get ghosting on
//   moving objects.  By measuring the local variance, we can set the
//   blend factor optimally per pixel:
//
//     High variance (noisy) → high blend factor → accept more current frame
//     Low variance (converged) → low blend factor → retain more history
//
// The mapping uses a smoothstep between configurable thresholds:
//   blend = lerp(minBlend, maxBlend, smoothstep(lo, hi, variance))
//
// Where:
//   minBlend = blend factor when fully converged (keep most history)
//   maxBlend = blend factor when fully noisy (accept most current)
//   lo = variance below which signal is considered converged
//   hi = variance above which signal is considered fully noisy
//
// Parameters:
//   variance    – local variance from ComputeLocalVariance() .variance field
//   minBlend    – blend factor when converged (default 0.02)
//   maxBlend    – blend factor when noisy (default 0.3)
//   varianceLo  – variance floor (below = converged) (default 0.001)
//   varianceHi  – variance ceiling (above = fully noisy) (default 0.1)
//
// Returns:  blend factor [minBlend, maxBlend] for temporal EMA.
//           Use as:  result = lerp(clampedHistory, current, blendFactor)
float VarianceGuidedBlendFactor(
    float variance,
    float minBlend   = 0.02,
    float maxBlend   = 0.3,
    float varianceLo = 0.001,
    float varianceHi = 0.1)
{
  float t = smoothstep(varianceLo, varianceHi, variance);
  return lerp(minBlend, maxBlend, t);
}

// ---------------------------------------------------------------------------
// 1.18e  Full Temporal Blend Pipeline
// ---------------------------------------------------------------------------
// Composes neighborhood clamping + disocclusion + variance-guided blend
// into a single call.  This is the complete temporal accumulation function
// that replaces a fixed `lerp(history, current, 0.05)` with the full
// AC Shadows-style adaptive pipeline.
//
// Data flow:
//   1. Compute local statistics of current frame (§1.18a)
//   2. Clamp reprojected history to neighborhood range (§1.18b)
//   3. Check disocclusion — is the history valid? (§1.18c)
//   4. Compute adaptive blend factor from variance (§1.18d)
//   5. Override blend to 1.0 ("use current only") on disocclusion
//   6. Blend clamped history with current frame
//
// Two variants:
//   (i)  Scalar — for shadow, AO, depth-based signals
//   (ii) Color  — for GI, reflections, lit scene
//
// Parameters:
//   current          – current frame signal (scalar or float3)
//   history          – reprojected previous-frame signal
//   stats            – local statistics from ComputeLocalVariance()
//   historyValidity  – disocclusion test result from DisocclusionDetect()
//                      [0,1]. 0 = disoccluded, 1 = valid.
//   clampK           – neighborhood clamp width in stddevs (default 1.25)
//   minBlend         – converged blend factor (default 0.02)
//   maxBlend         – noisy blend factor (default 0.3)
//   varianceLo       – converged variance threshold (default 0.001)
//   varianceHi       – noisy variance threshold (default 0.1)
//
// Returns:  temporally accumulated result.
// ---------------------------------------------------------------------------

// -- 1.18e-i.  Scalar Temporal Blend ------------------------------------------
float TemporalBlend(
    float      current,
    float      history,
    LocalStats stats,
    float      historyValidity,
    float      clampK     = 1.25,
    float      minBlend   = 0.02,
    float      maxBlend   = 0.3,
    float      varianceLo = 0.001,
    float      varianceHi = 0.1)
{
  // 1. Clamp history to plausible range
  float clamped = NeighborhoodClamp(history, stats, clampK);

  // 2. Adaptive blend from variance
  float blend = VarianceGuidedBlendFactor(
      stats.variance, minBlend, maxBlend, varianceLo, varianceHi);

  // 3. On disocclusion, override: use current frame entirely
  blend = lerp(1.0, blend, historyValidity);

  // 4. Blend
  return lerp(clamped, current, blend);
}

// -- 1.18e-ii.  Color Temporal Blend ------------------------------------------
float3 TemporalBlendColor(
    float3          current,
    float3          history,
    LocalStatsColor stats,
    float           historyValidity,
    float           clampK     = 1.25,
    float           minBlend   = 0.02,
    float           maxBlend   = 0.3,
    float           varianceLo = 0.001,
    float           varianceHi = 0.1)
{
  // 1. Clamp history
  float3 clamped = NeighborhoodClampColor(history, stats, clampK);

  // 2. Scalar variance for blend factor (use luminance variance)
  float lumVar = dot(stats.variance, float3(0.2126, 0.7152, 0.0722));
  float blend = VarianceGuidedBlendFactor(
      lumVar, minBlend, maxBlend, varianceLo, varianceHi);

  // 3. Disocclusion override
  blend = lerp(1.0, blend, historyValidity);

  // 4. Blend
  return lerp(clamped, current, blend);
}

// ---------------------------------------------------------------------------
// 1.18f  Per-Signal Temporal Configuration
// ---------------------------------------------------------------------------
// AC Shadows applies different temporal settings per signal type because
// each signal has different convergence characteristics:
//
//   • Shadows change rapidly (light/object motion) and need responsive
//     blend factors with moderate clamping.
//   • Diffuse GI changes slowly (probes update over many frames) and can
//     accumulate aggressively with relaxed clamping.
//   • Specular reflections are highly view-dependent and invalidate
//     quickly when the camera moves, needing tight clamping.
//   • AO is relatively stable and benefits from moderate accumulation.
//
// The TemporalConfig struct encapsulates all per-signal parameters,
// and factory functions provide AC Shadows-inspired presets.
//
// Usage:
//   TemporalConfig cfg = TemporalConfigShadow();
//   float result = TemporalBlendWithConfig(current, history, stats,
//                                          validity, cfg);
// ---------------------------------------------------------------------------

struct TemporalConfig
{
  float clampK;       // neighborhood clamp width (stddevs)
  float minBlend;     // blend factor when converged
  float maxBlend;     // blend factor when noisy/disoccluded
  float varianceLo;   // variance below = converged
  float varianceHi;   // variance above = fully noisy
  float depthThresh;  // disocclusion depth threshold
  float normalThresh; // disocclusion normal threshold
};

// -- Presets ------------------------------------------------------------------

// Shadow denoiser — responsive, moderate clamp
// Shadows change with light and object motion.  Need to react quickly to
// transitions between lit and shadowed state.  Moderate clamp prevents
// ghosted shadow edges while allowing some temporal smoothing.
TemporalConfig TemporalConfigShadow()
{
  TemporalConfig c;
  c.clampK       = 1.5;     // moderate clamp width
  c.minBlend     = 0.05;    // 5% new when converged
  c.maxBlend     = 0.25;    // 25% new when noisy
  c.varianceLo   = 0.002;
  c.varianceHi   = 0.08;
  c.depthThresh  = 0.03;
  c.normalThresh = 0.9;
  return c;
}

// Diffuse GI — aggressive accumulation, relaxed clamp
// GI from probes / lightmaps changes slowly (probe updates are spread
// over many frames).  Can accumulate aggressively for clean results.
// Relaxed clamp avoids discarding history during gradual lighting shifts.
TemporalConfig TemporalConfigGI()
{
  TemporalConfig c;
  c.clampK       = 2.5;     // relaxed clamp
  c.minBlend     = 0.02;    // 2% new when converged (aggressive accumulation)
  c.maxBlend     = 0.15;    // 15% new when noisy
  c.varianceLo   = 0.001;
  c.varianceHi   = 0.05;
  c.depthThresh  = 0.05;
  c.normalThresh = 0.85;
  return c;
}

// Specular reflections — conservative, tight clamp
// Reflections are highly view-dependent — even small camera rotation
// invalidates the reflection direction.  Tight clamp catches the
// fast-changing content.  Higher blend factor accepts camera-induced
// noise quickly.
TemporalConfig TemporalConfigReflections()
{
  TemporalConfig c;
  c.clampK       = 1.0;     // tight clamp
  c.minBlend     = 0.08;    // 8% new when converged
  c.maxBlend     = 0.35;    // 35% new when noisy
  c.varianceLo   = 0.005;
  c.varianceHi   = 0.15;
  c.depthThresh  = 0.03;
  c.normalThresh = 0.95;
  return c;
}

// Ambient occlusion — moderate everything
// AO is relatively stable across frames.  Object motion matters more
// than camera motion.  Moderate settings for balanced noise/ghosting.
TemporalConfig TemporalConfigAO()
{
  TemporalConfig c;
  c.clampK       = 1.5;
  c.minBlend     = 0.03;    // 3% new when converged
  c.maxBlend     = 0.2;     // 20% new when noisy
  c.varianceLo   = 0.001;
  c.varianceHi   = 0.06;
  c.depthThresh  = 0.04;
  c.normalThresh = 0.9;
  return c;
}

// Stochastic alpha convergence — compatible with §1.17
// Stochastic alpha test produces binary noise that needs fast convergence
// under TAA/DLSS.  Need high blend factor and tight clamp so the noise
// resolves quickly.  This config is designed for the signal AFTER the
// temporal upscaler has had a chance to accumulate.
TemporalConfig TemporalConfigStochasticAlpha()
{
  TemporalConfig c;
  c.clampK       = 1.0;     // tight — want fast response to alpha changes
  c.minBlend     = 0.1;     // 10% new (TAA should do most accumulation)
  c.maxBlend     = 0.5;     // 50% new when noisy (aggressive catch-up)
  c.varianceLo   = 0.01;
  c.varianceHi   = 0.2;
  c.depthThresh  = 0.03;
  c.normalThresh = 0.8;     // relaxed — foliage normals vary a lot
  return c;
}

// -- 1.18f′  Temporal Blend with Config ----------------------------------------
// Convenience function that uses a TemporalConfig struct for all parameters.
//
// Parameters:
//   current   – current frame signal (scalar)
//   history   – reprojected previous frame signal
//   stats     – local statistics from ComputeLocalVariance()
//   validity  – disocclusion result from DisocclusionDetect()
//   cfg       – per-signal configuration from a preset or custom values
//
// Returns:  temporally accumulated result.
float TemporalBlendWithConfig(
    float          current,
    float          history,
    LocalStats     stats,
    float          validity,
    TemporalConfig cfg)
{
  return TemporalBlend(current, history, stats, validity,
                       cfg.clampK, cfg.minBlend, cfg.maxBlend,
                       cfg.varianceLo, cfg.varianceHi);
}

// Color variant
float3 TemporalBlendColorWithConfig(
    float3          current,
    float3          history,
    LocalStatsColor stats,
    float           validity,
    TemporalConfig  cfg)
{
  return TemporalBlendColor(current, history, stats, validity,
                            cfg.clampK, cfg.minBlend, cfg.maxBlend,
                            cfg.varianceLo, cfg.varianceHi);
}

// ############################################################################
//
//   PART II — CHARACTER IMPROVEMENTS
//
//   Eye shading, eyelid shadows, IBL occlusion and other character-specific
//   rendering helpers.  Designed for injection into identified eye / skin
//   shaders via RenoDX shader replacement.
//
//   References:
//     • Jorge Jimenez, "Next Generation Character Rendering", GDC 2013
//     • Waylon Brinck & Steven Tang, "The Technical Art of The Last of Us
//       Part II", SIGGRAPH 2020
//
// ############################################################################

// ============================================================================
// 2.1  Eye Shading Improvements
// ----------------------------------------------------------------------------
// Reference: Jimenez 2013 — "Next Generation Character Rendering"
//            Brinck & Tang 2020 — "The Technical Art of TLOU Part II"
//
// Naughty Dog extended Jimenez's foundational eye rendering with:
//   (a) Screenspace eyelid/eyelash shadows — short-range ray-march along
//       the light direction in screen space, sampling the depth buffer
//       (opaque + alpha) to detect thin occluders above the eye.
//   (b) IBL occlusion — same ray-march concept but along the camera
//       reflection vector, producing an occlusion term for image-based
//       lighting so that specular highlights under eyelids are attenuated.
//   (c) Iris parallax refraction — Jimenez's cornea refraction model,
//       shifting iris UV based on view direction for depth.
//   (d) Limbal darkening — darkening ring at the iris/sclera boundary.
//   (e) Dual-lobe cornea specular — wet outer layer + underlying iris.
//
// RenoDX integration:
//   All functions require the eye pixel shader to be identified and replaced.
//   The most reliable approach is shader-hash replacement — most engines use
//   a dedicated eye material shader with distinct hashes.
//
// Prerequisites for modders:
//   • Identify the eye pixel shader hash(es) via RenderDoc / Renderdoc
//   • Ensure the depth buffer is bound as an SRV in the replacement shader
//   • Light direction and view direction must be available (from CBs or
//     computed from G-buffer data)
//   • For iris parallax: iris texture UV access required
//   • World/view-space normal must be available for reflection computation
// ============================================================================

// ---------------------------------------------------------------------------
// 2.1a  Screenspace Eyelid / Eyelash Shadow
// ---------------------------------------------------------------------------
// Naughty Dog, SIGGRAPH 2020 (Brinck & Tang):
//   Uses a hardcoded ray-march distance and samples the opaque plus alpha
//   depth buffer to detect thin occluders (eyelids, eyelashes) casting
//   shadows onto the eye surface.
//
// The ray-march proceeds in screen space from the eye pixel toward the
// light source.  At each step, it samples the depth buffer and checks
// whether an occluder exists between the current pixel and the light —
// if so, the pixel is in shadow.
//
// A tight thickness threshold is used because eyelids and eyelashes are
// very thin — thick-geometry occluders (e.g., the face mesh itself) should
// NOT trigger this shadow, as they are handled by the game's primary
// shadow map.  The thickness threshold prevents false shadowing from
// background geometry.
//
// Parameters:
//   depthTex      – depth buffer (opaque + alpha), bound as SRV
//   depthSampler  – point or linear sampler for the depth texture
//   screenUV      – current pixel's screen UV [0,1]²
//   pixelDepth    – depth value at the current pixel
//   lightDirSS    – light direction projected into screen space (2D, xy)
//                   Compute as: project (worldPos + lightDir) to screen,
//                   subtract current screenUV, normalize.
//   numSteps      – ray-march step count (default 16, 8–24 range)
//   maxMarchDist  – total march distance in UV space (default 0.03)
//                   TLOU2 used a hardcoded short distance.  Scale based on
//                   screen resolution and eye size in the game.
//   thicknessMin  – minimum depth difference to register as occluder
//                   (default 0.0001).  Prevents self-shadowing noise.
//   thicknessMax  – maximum depth difference for thin occluders
//                   (default 0.005).  Beyond this, geometry is too thick
//                   to be an eyelid/eyelash — skip it.
//   reversedZ     – true if the game uses reversed-Z depth (most modern
//                   titles do).  Set false for standard [0=near, 1=far].
//
// Returns:  shadow factor [0 = fully shadowed, 1 = fully lit].
// ---------------------------------------------------------------------------
float EyeScreenspaceShadow(
    Texture2D<float> depthTex,
    SamplerState     depthSampler,
    float2           screenUV,
    float            pixelDepth,
    float2           lightDirSS,
    int              numSteps     = 16,
    float            maxMarchDist = 0.03,
    float            thicknessMin = 0.0001,
    float            thicknessMax = 0.005,
    bool             reversedZ    = true)
{
  float stepSize = maxMarchDist / (float)numSteps;
  float shadow = 1.0;

  [unroll]
  for (int i = 1; i <= numSteps; i++)
  {
    float2 sampleUV = screenUV + lightDirSS * stepSize * (float)i;

    // Clamp to screen bounds — out-of-bounds samples should not shadow.
    if (any(sampleUV < 0.0) || any(sampleUV > 1.0))
      continue;

    float sampledDepth = depthTex.SampleLevel(depthSampler, sampleUV, 0);

    // Signed depth difference: positive means the sampled point is
    // between us and the light (potential occluder).
    float depthDiff = reversedZ
        ? (sampledDepth - pixelDepth)
        : (pixelDepth - sampledDepth);

    // Thin occluder test — only eyelid/eyelash thickness triggers shadow.
    if (depthDiff > thicknessMin && depthDiff < thicknessMax)
    {
      shadow = 0.0;
      break;
    }
  }

  return shadow;
}

// ---------------------------------------------------------------------------
// 2.1a′  Screenspace Eyelid Shadow — Soft Variant
// ---------------------------------------------------------------------------
// Same concept as 2.1a but accumulates a weighted occlusion term instead
// of a hard binary cutoff.  Produces softer, more natural eyelid shadows
// with a penumbra-like falloff.
//
// Each step contributes occlusion weighted by its proximity to the pixel
// (closer occluders = stronger shadow) and the result is normalized.
// This avoids the binary on/off artifact of the hard variant, producing
// gradual shadow edges that look more like real soft shadows from the
// thin eyelid geometry.
//
// Parameters:  same as EyeScreenspaceShadow, plus:
//   softness – controls the falloff curve (default 1.0).
//              Higher values make shadows softer.  Range [0.5, 3.0].
//
// Returns:  shadow factor [0 = fully shadowed, 1 = fully lit].
// ---------------------------------------------------------------------------
float EyeScreenspaceShadowSoft(
    Texture2D<float> depthTex,
    SamplerState     depthSampler,
    float2           screenUV,
    float            pixelDepth,
    float2           lightDirSS,
    int              numSteps     = 16,
    float            maxMarchDist = 0.03,
    float            thicknessMin = 0.0001,
    float            thicknessMax = 0.005,
    float            softness     = 1.0,
    bool             reversedZ    = true)
{
  float stepSize    = maxMarchDist / (float)numSteps;
  float occlusion   = 0.0;
  float totalWeight = 0.0;

  [unroll]
  for (int i = 1; i <= numSteps; i++)
  {
    float t = (float)i / (float)numSteps;
    float2 sampleUV = screenUV + lightDirSS * stepSize * (float)i;

    if (any(sampleUV < 0.0) || any(sampleUV > 1.0))
      continue;

    float sampledDepth = depthTex.SampleLevel(depthSampler, sampleUV, 0);

    float depthDiff = reversedZ
        ? (sampledDepth - pixelDepth)
        : (pixelDepth - sampledDepth);

    // Weight falls off with march distance — near occluders matter more.
    float weight = pow(1.0 - t, softness);

    if (depthDiff > thicknessMin && depthDiff < thicknessMax)
    {
      occlusion += weight;
    }
    totalWeight += weight;
  }

  return 1.0 - saturate(occlusion / max(totalWeight, 0.001));
}

// ---------------------------------------------------------------------------
// 2.1b  Screenspace IBL Occlusion for Eyes
// ---------------------------------------------------------------------------
// Naughty Dog, SIGGRAPH 2020 (Brinck & Tang):
//   "They take the idea of the ray-marched screenspace shadows and apply it
//    to generate an IBL occlusion term as well but instead of a vector to a
//    light, they apply it along the camera reflection vector."
//
// The reflection vector is computed from the eye surface normal and view
// direction, then projected into screen space.  The same depth-buffer
// ray-march detects whether the reflected direction is occluded by eyelid
// or eyelash geometry — if so, the IBL (image-based lighting) specular
// contribution is attenuated.
//
// This prevents bright specular highlights appearing on the eyeball in
// areas that would physically be occluded by the eyelid — a common
// artifact in games that don't account for this.
//
// For the diffuse component, Naughty Dog used standard screen-space
// ambient occlusion (SSAO), which most games already compute.  This
// function specifically addresses the *specular IBL* occlusion that
// standard SSAO does not capture well for eyes.
//
// Parameters:
//   depthTex        – depth buffer (opaque + alpha), bound as SRV
//   depthSampler    – sampler for depth texture
//   screenUV        – current pixel's screen UV [0,1]²
//   pixelDepth      – depth value at the current pixel
//   reflectionDirSS – reflection vector projected into screen space (2D)
//                     Compute as: reflect(-V, N), project to screen space,
//                     subtract current screenUV, normalize.
//   numSteps        – ray-march step count (default 12)
//   maxMarchDist    – total march distance in UV space (default 0.04)
//                     Slightly larger than the shadow variant since
//                     reflections can probe a wider area.
//   thicknessMin    – minimum depth diff for occluder (default 0.0001)
//   thicknessMax    – maximum depth diff (default 0.008).
//                     Wider than shadow variant — reflection occlusion is
//                     less sensitive to exact thickness.
//   reversedZ       – reversed-Z depth buffer (default true)
//
// Returns:  IBL occlusion factor [0 = fully occluded, 1 = fully visible].
//           Multiply this into the specular IBL contribution.
// ---------------------------------------------------------------------------
float EyeScreenspaceIBLOcclusion(
    Texture2D<float> depthTex,
    SamplerState     depthSampler,
    float2           screenUV,
    float            pixelDepth,
    float2           reflectionDirSS,
    int              numSteps     = 12,
    float            maxMarchDist = 0.04,
    float            thicknessMin = 0.0001,
    float            thicknessMax = 0.008,
    bool             reversedZ    = true)
{
  float stepSize    = maxMarchDist / (float)numSteps;
  float occlusion   = 0.0;
  float totalWeight = 0.0;

  [unroll]
  for (int i = 1; i <= numSteps; i++)
  {
    float t = (float)i / (float)numSteps;
    float2 sampleUV = screenUV + reflectionDirSS * stepSize * (float)i;

    if (any(sampleUV < 0.0) || any(sampleUV > 1.0))
      continue;

    float sampledDepth = depthTex.SampleLevel(depthSampler, sampleUV, 0);

    float depthDiff = reversedZ
        ? (sampledDepth - pixelDepth)
        : (pixelDepth - sampledDepth);

    // Weight falls off with march distance.
    float weight = 1.0 - t;

    if (depthDiff > thicknessMin && depthDiff < thicknessMax)
    {
      occlusion += weight;
    }
    totalWeight += weight;
  }

  return 1.0 - saturate(occlusion / max(totalWeight, 0.001));
}

// ---------------------------------------------------------------------------
// 2.1c  Iris Parallax Refraction
// ---------------------------------------------------------------------------
// Jimenez 2013 — "Next Generation Character Rendering":
//   Ray-marches through a parallax-offset cornea to sample the iris texture
//   at the refracted position, giving the iris visual depth.
//
// The eye is modeled as a thin spherical cornea shell over a flat iris
// plane.  The view ray refracts through the cornea surface (using Snell's
// law with the cornea IoR ≈ 1.336) and intersects the iris plane at an
// offset position.  This offset is applied to the iris UV to create the
// illusion of the iris sitting behind the cornea.
//
// This is a simplified single-refraction model — it does not trace a full
// ray through a sphere.  Instead, it computes the refraction at the front
// surface of the cornea and projects down to the iris plane.
//
// Parameters:
//   irisUV       – original iris texture UV coordinate
//   viewDirTS    – view direction in tangent space of the eye surface
//                  (z = normal component, xy = surface-parallel components)
//   irisDepth    – virtual depth of the iris behind the cornea (default 0.3)
//                  This is in UV-space units, not world units.  Tune per
//                  game based on the eye model's UV layout.
//                  Range: [0.1, 0.5] typical.  Higher = more parallax.
//   corneaIoR    – index of refraction of the cornea (default 1.336)
//                  Real human cornea ≈ 1.376, aqueous humor ≈ 1.336.
//                  1.336 is used because the iris sits behind the
//                  aqueous humor, not just the cornea surface.
//
// Returns:  refracted iris UV — use this to sample the iris texture.
// ---------------------------------------------------------------------------
float2 IrisParallaxRefraction(
    float2 irisUV,
    float3 viewDirTS,
    float  irisDepth = 0.3,
    float  corneaIoR = 1.336)
{
  // Refract the view direction through the cornea surface.
  // In tangent space, the surface normal is (0, 0, 1).
  float cosIncident = max(abs(viewDirTS.z), 0.001);

  // Snell's law: sin(θ_t) = sin(θ_i) / IoR
  // Only the tangential component changes; the normal component is recomputed.
  float sinIncidentSq = 1.0 - cosIncident * cosIncident;
  float sinRefractedSq = sinIncidentSq / (corneaIoR * corneaIoR);

  // TIR check (shouldn't happen for a cornea at normal eye viewing angles)
  sinRefractedSq = min(sinRefractedSq, 0.999);

  float cosRefracted = sqrt(1.0 - sinRefractedSq);

  // Scale factor: how far the tangential offset shifts at the iris depth.
  // offset = tangential_component × (depth / cos(θ_refracted))
  float2 tangentDir = viewDirTS.xy;
  float tangentLen = length(tangentDir);

  if (tangentLen < 0.001)
    return irisUV;  // Viewing straight on — no parallax shift.

  tangentDir /= tangentLen;

  // Refracted tangential magnitude at iris depth
  float refractedTangent = sqrt(sinRefractedSq);
  float2 offset = tangentDir * refractedTangent * irisDepth / max(cosRefracted, 0.001);

  return irisUV + offset;
}

// ---------------------------------------------------------------------------
// 2.1d  Limbal Darkening
// ---------------------------------------------------------------------------
// Jimenez 2013 — "Next Generation Character Rendering":
//   Darkening ring at the iris/sclera boundary (the limbus).  In real eyes,
//   the limbal ring is a band of melanin-rich tissue at the edge of the
//   iris that absorbs light, creating a visible dark ring.
//
// Implemented as a smooth falloff based on distance from the iris center
// in UV space.  The darkening is applied multiplicatively to the iris
// texture color.
//
// Parameters:
//   irisUV       – iris-centred UV (0.5, 0.5 = iris center).
//                  If the eye texture is laid out differently, remap so
//                  that (0.5, 0.5) corresponds to the pupil center.
//   irisRadius   – radius of the iris in UV space (default 0.4)
//   ringWidth    – width of the limbal darkening ring (default 0.05)
//                  Controls how gradual the transition is.
//   ringStrength – maximum darkening at the limbus edge (default 0.6)
//                  0 = no darkening, 1 = fully black ring.
//
// Returns:  scalar darkening factor [0,1].  Multiply into iris color:
//           irisColor *= LimbalDarkening(irisUV);
// ---------------------------------------------------------------------------
float LimbalDarkening(
    float2 irisUV,
    float  irisRadius   = 0.4,
    float  ringWidth    = 0.05,
    float  ringStrength = 0.6)
{
  float dist = length(irisUV - 0.5);

  // Smooth darkening ramp at the iris boundary.
  float ring = smoothstep(irisRadius - ringWidth, irisRadius, dist);

  return 1.0 - ring * ringStrength;
}

// ---------------------------------------------------------------------------
// 2.1e  Dual-Lobe Cornea Specular
// ---------------------------------------------------------------------------
// Jimenez 2013 — "Next Generation Character Rendering":
//   Two specular lobes model the eye's wet surface:
//     Lobe 1 (tight):  the primary cornea reflection — sharp, bright.
//     Lobe 2 (broad):  a wider secondary highlight from the tear film and
//                       subsurface irregularities on the cornea surface.
//
// This function evaluates both lobes using the GGX NDF and returns the
// combined specular contribution.  It is designed to replace a game's
// single-lobe eye specular with a more physically motivated dual lobe.
//
// Parameters:
//   NdotH         – dot(normal, halfVec), saturated
//   NdotV         – dot(normal, viewDir), saturated
//   NdotL         – dot(normal, lightDir), saturated
//   F0            – specular reflectance at normal incidence
//                   For the cornea: ~0.02 (IoR ≈ 1.376).
//   roughness1    – roughness of the primary (sharp) lobe (default 0.04)
//   roughness2    – roughness of the secondary (broad) lobe (default 0.25)
//   lobe2Weight   – blend weight of the second lobe (default 0.3)
//                   0 = only primary, 1 = only secondary.
//
// Returns:  combined specular intensity (scalar).
//           Multiply by lightColor and NdotL externally.
// ---------------------------------------------------------------------------
float EyeDualLobeSpecular(
    float NdotH,
    float NdotV,
    float NdotL,
    float F0          = 0.02,
    float roughness1  = 0.04,
    float roughness2  = 0.25,
    float lobe2Weight = 0.3)
{
  // GGX NDF for each lobe
  float a1 = roughness1 * roughness1;
  float a2 = roughness2 * roughness2;
  float a1sq = a1 * a1;
  float a2sq = a2 * a2;

  float denom1 = NdotH * NdotH * (a1sq - 1.0) + 1.0;
  float D1 = a1sq / (3.14159265 * denom1 * denom1);

  float denom2 = NdotH * NdotH * (a2sq - 1.0) + 1.0;
  float D2 = a2sq / (3.14159265 * denom2 * denom2);

  // Blend the two NDF lobes
  float D = lerp(D1, D2, lobe2Weight);

  // Schlick Fresnel
  float oneMinusCos = 1.0 - NdotV;
  float F = F0 + (1.0 - F0) * (oneMinusCos * oneMinusCos * oneMinusCos
                                * oneMinusCos * oneMinusCos);

  // Simplified visibility (Smith height-correlated approximation)
  float k = (roughness1 + 1.0) * (roughness1 + 1.0) / 8.0;
  float G1V = NdotV / (NdotV * (1.0 - k) + k);
  float G1L = NdotL / (NdotL * (1.0 - k) + k);
  float G = G1V * G1L;

  // Cook-Torrance: D * F * G / (4 * NdotV * NdotL)
  return (D * F * G) / max(4.0 * NdotV * NdotL, 0.001);
}

// ---------------------------------------------------------------------------
// 2.1f  Combined Eye Shading Helper
// ---------------------------------------------------------------------------
// Convenience function that composes eyelid shadow + IBL occlusion into a
// single set of modulation factors for the eye shader.
//
// Usage (in an identified eye pixel shader replacement):
//
//   // 1. Compute screen-space directions
//   float2 lightDirSS = ComputeScreenSpaceDir(worldPos, lightDir, viewProj, screenUV);
//   float3 R = reflect(-V, N);
//   float2 reflDirSS  = ComputeScreenSpaceDir(worldPos, R, viewProj, screenUV);
//
//   // 2. Get modulation factors
//   float2 eyeMod = EyeShadingModulation(depthTex, depthSamp,
//                                        screenUV, pixelDepth,
//                                        lightDirSS, reflDirSS);
//   // eyeMod.x = direct light shadow
//   // eyeMod.y = IBL occlusion
//
//   // 3. Apply
//   directLighting  *= eyeMod.x;
//   specularIBL     *= eyeMod.y;
//
// Parameters:
//   depthTex        – depth buffer SRV
//   depthSampler    – sampler
//   screenUV        – pixel UV [0,1]²
//   pixelDepth      – depth at this pixel
//   lightDirSS      – light direction in screen space (2D)
//   reflectionDirSS – reflection direction in screen space (2D)
//   shadowSteps     – ray-march steps for shadow (default 16)
//   iblSteps        – ray-march steps for IBL occlusion (default 12)
//   reversedZ       – reversed-Z depth (default true)
//
// Returns:  float2(shadowFactor, iblOcclusionFactor)
//           Both in [0,1]: 1 = fully lit/visible, 0 = fully shadowed/occluded.
// ---------------------------------------------------------------------------
float2 EyeShadingModulation(
    Texture2D<float> depthTex,
    SamplerState     depthSampler,
    float2           screenUV,
    float            pixelDepth,
    float2           lightDirSS,
    float2           reflectionDirSS,
    int              shadowSteps = 16,
    int              iblSteps    = 12,
    bool             reversedZ   = true)
{
  float shadow = EyeScreenspaceShadowSoft(
      depthTex, depthSampler, screenUV, pixelDepth, lightDirSS,
      shadowSteps, 0.03, 0.0001, 0.005, 1.0, reversedZ);

  float iblOcc = EyeScreenspaceIBLOcclusion(
      depthTex, depthSampler, screenUV, pixelDepth, reflectionDirSS,
      iblSteps, 0.04, 0.0001, 0.008, reversedZ);

  return float2(shadow, iblOcc);
}

// ############################################################################
//
//   PART III — RASTERISATION BRDF
//
// ############################################################################

// ============================================================================
// 3.1  Hammon 2017 Diffuse BRDF
// ----------------------------------------------------------------------------
// Earl Hammon Jr., GDC 2017
// "PBR Diffuse Lighting for GGX+Smith Microsurfaces"
//
// Drop-in replacement for Lambertian (albedo / PI) that accounts for:
//   • Single-scatter Fresnel darkening at grazing angles
//   • Multi-scatter energy compensation between microfacets
//
// Designed to pair with a GGX NDF + Smith height-correlated geometry term
// on the specular side so total surface energy is conserved.
//
// Parameters (all expected saturated [0,1]):
//   NdotL     – saturate(dot(normal, lightDir))
//   NdotV     – saturate(dot(normal, viewDir))
//   NdotH     – saturate(dot(normal, halfVec))
//   VdotH     – saturate(dot(viewDir, halfVec))   (== LdotH by symmetry)
//   roughness – perceptual roughness [0,1]
//   albedo    – surface base color (linear)
//
// Returns:  albedo-weighted diffuse contribution, ready to multiply by
//           NdotL * lightColor.
// ============================================================================

float3 HammonDiffuseBRDF(
    float NdotL, float NdotV, float NdotH, float VdotH,
    float roughness, float3 albedo)
{
  // ---- Facing term --------------------------------------------------------
  float facing = 0.5 + 0.5 * VdotH;

  // ---- Rough surface approximation ----------------------------------------
  // The term (0.5 + NdotH) / NdotH can blow up at grazing angles where
  // NdotH approaches zero.  DivideSafe only catches exact zero, so tiny
  // values like NdotH ≈ 0.0001 still produce ratios of ~5001.
  // Hammon's original GDC 2017 presentation uses max(NdotH, 0.1) which
  // caps the ratio at (0.6 / 0.1) = 6.0, preventing bright glow artifacts.
  float rough = facing * (0.9 - 0.4 * facing)
              * ((0.5 + NdotH) / max(NdotH, 0.1));

  // ---- Smooth surface approximation (Fresnel-weighted) --------------------
  // pow5(1 - x) expanded manually for broad shader-model compatibility.
  float oneMinusNdotL = 1.0 - NdotL;
  float NdotL5 = oneMinusNdotL * oneMinusNdotL;
  NdotL5 *= NdotL5 * oneMinusNdotL;          // (1 - NdotL)^5

  float oneMinusNdotV = 1.0 - NdotV;
  float NdotV5 = oneMinusNdotV * oneMinusNdotV;
  NdotV5 *= NdotV5 * oneMinusNdotV;          // (1 - NdotV)^5

  float smooth_val = 1.05 * (1.0 - NdotL5) * (1.0 - NdotV5);

  // ---- Single-scatter: blend smooth ↔ rough by roughness, ÷ PI -----------
  float single = lerp(smooth_val, rough, roughness) * 0.318309886;  // 1/PI

  // ---- Multi-scatter energy compensation -----------------------------------
  // Approximates the additional energy returned by light bouncing more than
  // once between microfacets.  Multiplied by albedo² because each bounce is
  // attenuated by the surface color.
  float multi = 0.1159 * roughness;

  return albedo * single + albedo * albedo * multi;
}

// ============================================================================
// 3.2  Callisto BRDF
// ----------------------------------------------------------------------------
// SIGGRAPH 2023 — "The Rendering of The Callisto Protocol"
// Jorge Jimenez & Dan Petersen, Striking Distance Studios
//
// A physically-based shading model built on UE4's BRDF with the following
// enhancements:
//
//   a) Dual-lobe GGX specular with configurable Fresnel falloff (slide 95).
//
//   b) Custom diffuse coefficient c₁ — artist-driven Fresnel darkening +
//      retroreflection via per-parameter falloff exponents and optional
//      tints (slide 85).
//
//   c) Smooth terminator c₂ — smoothstep-based NdotL ramp modulated by
//      view/half-vector angles, configurable intensity and length (slide 90).
//
//   d) Three-tier parameter system: Base, Advanced, Full (slide 98).
//
// All functions are provided as composable building-blocks so you can mix
// and match (e.g. use only the dual-lobe specular with Hammon diffuse).
//
// Coordinate conventions:
//   N = surface normal,  V = view dir (toward eye),  L = light dir,
//   H = half-vector = normalize(V + L).
//   All dot-products are expected saturated [0,1] unless noted otherwise.
// ============================================================================

// -- 3.2a.  GGX Normal Distribution Function (Trowbridge-Reitz) ---------------
//
// D_GGX = alpha^2 / (PI * ((N·H)^2 * (alpha^2 - 1) + 1)^2)
//
float GGX_NDF(float NdotH, float alpha)
{
  float a2   = alpha * alpha;
  float denom = NdotH * NdotH * (a2 - 1.0) + 1.0;
  return a2 / (3.14159265 * denom * denom);
}

// -- 3.2b.  Smith Height-Correlated Visibility --------------------------------
//
// V_SmithGGX = 0.5 / (NdotL * sqrt(NdotV^2*(1-a2)+a2)
//                    + NdotV * sqrt(NdotL^2*(1-a2)+a2))
//
// Returns the combined geometry + denominator term (V = G / (4·NdotL·NdotV))
// so the caller can simply multiply D * V * F.
//
float SmithGGX_Visibility(float NdotV, float NdotL, float alpha)
{
  float a2 = alpha * alpha;
  float ggxV = NdotL * sqrt(NdotV * NdotV * (1.0 - a2) + a2);
  float ggxL = NdotV * sqrt(NdotL * NdotL * (1.0 - a2) + a2);
  return 0.5 / max(ggxV + ggxL, 1e-7);
}

// -- 3.2c.  Schlick Fresnel ---------------------------------------------------
//
// F = F0 + (1 - F0) * (1 - VdotH)^5
//
float3 SchlickFresnel(float3 F0, float VdotH)
{
  float oneMinusVdotH = 1.0 - VdotH;
  float pow5 = oneMinusVdotH * oneMinusVdotH;
  pow5 *= pow5 * oneMinusVdotH;
  return F0 + (1.0 - F0) * pow5;
}

float SchlickFresnel(float F0, float VdotH)
{
  float oneMinusVdotH = 1.0 - VdotH;
  float pow5 = oneMinusVdotH * oneMinusVdotH;
  pow5 *= pow5 * oneMinusVdotH;
  return F0 + (1.0 - F0) * pow5;
}

// -- 3.2d.  Single GGX Specular Lobe ------------------------------------------
//
// Computes D * V * F for one GGX lobe.
//   roughness  – perceptual roughness [0,1], squared internally to alpha.
//   F0         – reflectance at normal incidence.
//
// Returns:  specular radiance contribution (pre-NdotL).
//
float3 GGX_Specular(
    float  NdotH, float  NdotV, float  NdotL, float  VdotH,
    float  roughness, float3 F0)
{
  float alpha = roughness * roughness;
  alpha = max(alpha, 5e-5);   // tighter clamp (fp32-safe) for sharper specular on polished surfaces

  float  D = GGX_NDF(NdotH, alpha);
  float  V = SmithGGX_Visibility(NdotV, NdotL, alpha);
  float3 F = SchlickFresnel(F0, VdotH);

  return D * V * F;
}

// -- 3.2e.  Dual-Lobe GGX Specular -------------------------------------------
//
// The Callisto model uses two specular lobes:
//   Lobe 1 — primary GGX with the surface roughness and F0.
//   Lobe 2 — secondary (tighter or oilier) lobe with its own roughness/F0.
//
// The two are combined as:  Specular1 + Specular2 * secondaryWeight
//
// Parameters:
//   roughness1      – primary lobe roughness (default: surface roughness)
//   F0_1            – primary lobe F0
//   roughness2      – secondary lobe roughness (default: tighter, e.g. 0.6×)
//   F0_2            – secondary lobe F0 (default: same as primary)
//   secondaryWeight – blend weight for the second lobe (default 0.5)
//
// Returns:  combined dual-lobe specular, pre-NdotL.
//
float3 DualLobeGGX(
    float  NdotH, float  NdotV, float  NdotL, float  VdotH,
    float  roughness1, float3 F0_1,
    float  roughness2, float3 F0_2,
    float  secondaryWeight = 0.5)
{
  float3 lobe1 = GGX_Specular(NdotH, NdotV, NdotL, VdotH, roughness1, F0_1);
  float3 lobe2 = GGX_Specular(NdotH, NdotV, NdotL, VdotH, roughness2, F0_2);
  return lobe1 + lobe2 * secondaryWeight;
}

// -- 3.2f.  Callisto Specular Fresnel (Modified Schlick) ----------------------
//
// SIGGRAPH 2023 slide 95: Configurable Fresnel falloff.
//
//   F = f0 + saturate(2 - r(n_s)) * (1 - f0) * (1 - cosθ)^(5 * r(n_s))
//   r(x) = 2(1 - x)
//
// At n_s = 0.5 (default) this reduces to standard Schlick (exponent 5,
// amplitude 1).  Lowering n_s suppresses Fresnel; raising it broadens it.
//
//   n_s  – Specular Fresnel Falloff [0,1] (default 0.5)
//
float3 CallistoSpecularFresnel(float3 F0, float VdotH, float n_s = 0.5)
{
  float r_ns      = 2.0 * (1.0 - n_s);                // r(n_s)
  float amplitude = saturate(2.0 - r_ns);              // t(2 - r(n_s))
  float exponent  = 5.0 * r_ns;
  float base      = max(1.0 - VdotH, 0.0);
  float fresnel   = pow(base, exponent);
  return F0 + amplitude * (1.0 - F0) * fresnel;
}

float CallistoSpecularFresnel(float F0, float VdotH, float n_s = 0.5)
{
  float r_ns      = 2.0 * (1.0 - n_s);
  float amplitude = saturate(2.0 - r_ns);
  float exponent  = 5.0 * r_ns;
  float base      = max(1.0 - VdotH, 0.0);
  float fresnel   = pow(base, exponent);
  return F0 + amplitude * (1.0 - F0) * fresnel;
}

// -- 3.2g.  Callisto Diffuse Coefficient c₁ -----------------------------------
//
// SIGGRAPH 2023 slide 85: Fresnel + Retroreflection for diffuse lighting.
//
//   c₁(θ_d, θ_h) = lerp(1, ρ_f, α_f) · lerp(1, ρ_r, α_r)
//
//   h(θ, n, φ, m)  = (1 - max(cosθ,0))^(5n) · max(cosφ,0)^(5m)
//   α_f = h(θ_d, r(n_f), θ_h, r(m_f))    ← Fresnel
//   α_r = h(θ_h, r(n_r), θ_d, r(m_r))    ← Retroreflection
//   r(x) = 2(1 - x)
//
//   θ_d = difference angle  → cos(θ_d) = VdotH
//   θ_h = half-vector angle → cos(θ_h) = NdotH
//
// Parameters (slide 85 table / slide 98 tiers):
//   rho_f – Diffuse Fresnel intensity          [0,256] default 1
//   n_f   – Diffuse Fresnel Falloff             [0,1]  default 0.75
//   m_f   – Diffuse Fresnel Tangent Falloff     [0,1]  default 0.75
//   rho_r – Retroreflection intensity           [0,256] default 1
//   n_r   – Retroreflection Falloff             [0,1]  default 0.75
//   m_r   – Retroreflection Tangent Falloff     [0,1]  default 0.75
//
// Returns:  scalar c₁ that multiplies f_lambert in the BRDF.
//
float CallistoDiffuseC1(
    float VdotH, float NdotH,
    float rho_f = 1.0, float n_f = 0.75, float m_f = 0.75,
    float rho_r = 1.0, float n_r = 0.75, float m_r = 0.75)
{
  // r(x) = 2(1-x)
  float r_nf = 2.0 * (1.0 - n_f);
  float r_mf = 2.0 * (1.0 - m_f);
  float r_nr = 2.0 * (1.0 - n_r);
  float r_mr = 2.0 * (1.0 - m_r);

  // h(θ, n, φ, m) = (1 - max(cosθ,0))^(5n) * max(cosφ,0)^(5m)
  // Fresnel:        α_f = h(θ_d, r(n_f), θ_h, r(m_f))
  float alpha_f = pow(max(1.0 - VdotH, 0.0), 5.0 * r_nf)
                * pow(max(NdotH, 0.0),       5.0 * r_mf);

  // Retroreflection: α_r = h(θ_h, r(n_r), θ_d, r(m_r))
  float alpha_r = pow(max(1.0 - NdotH, 0.0), 5.0 * r_nr)
                * pow(max(VdotH, 0.0),        5.0 * r_mr);

  // c₁ = lerp(1, ρ_f, α_f) * lerp(1, ρ_r, α_r)
  return lerp(1.0, rho_f, alpha_f) * lerp(1.0, rho_r, alpha_r);
}

// Overload with tints (Advanced tier, slide 98).
// ρ is "exposed as intensity multiplied by a tint" (slide 85 footnote).
float3 CallistoDiffuseC1(
    float  VdotH, float  NdotH,
    float3 fresnelTint, float rho_f, float n_f, float m_f,
    float3 retroTint,   float rho_r, float n_r, float m_r)
{
  float r_nf = 2.0 * (1.0 - n_f);
  float r_mf = 2.0 * (1.0 - m_f);
  float r_nr = 2.0 * (1.0 - n_r);
  float r_mr = 2.0 * (1.0 - m_r);

  float alpha_f = pow(max(1.0 - VdotH, 0.0), 5.0 * r_nf)
                * pow(max(NdotH, 0.0),       5.0 * r_mf);

  float alpha_r = pow(max(1.0 - NdotH, 0.0), 5.0 * r_nr)
                * pow(max(VdotH, 0.0),        5.0 * r_mr);

  float3 fresnel = lerp(float3(1, 1, 1), fresnelTint * rho_f, alpha_f);
  float3 retro   = lerp(float3(1, 1, 1), retroTint   * rho_r, alpha_r);

  return fresnel * retro;
}

// -- 3.2h.  Callisto Smooth Terminator c₂ -------------------------------------
//
// SIGGRAPH 2023 slide 90.
//
//   c₂(θ_i) = lerp(1, smoothstep(0, α_s·p, cos(θ_i)), α_s·o)
//
//   α_s = (1 - (1 - cos(θ_d))³) · (1 - (1 - cos(θ_h))³)
//
//   θ_d = difference angle  → cos(θ_d) = VdotH
//   θ_h = half-vector angle → cos(θ_h) = NdotH
//   θ_i = incident angle    → cos(θ_i) = NdotL
//
// Parameters (slide 98):
//   o – Smooth Terminator intensity [-1,1] (default 0 = off)
//   p – Smooth Terminator Length    [0,1]  (default 0.5)
//
// Returns:  scalar c₂ that multiplies the entire BRDF (diffuse + specular).
//
float CallistoSmoothTerminator(
    float NdotL, float VdotH, float NdotH,
    float o = 0.0, float p = 0.5)
{
  // α_s = (1 - (1 - VdotH)³) · (1 - (1 - NdotH)³)
  float d3 = 1.0 - VdotH;
  d3 = d3 * d3 * d3;           // (1 - VdotH)³
  float h3 = 1.0 - NdotH;
  h3 = h3 * h3 * h3;           // (1 - NdotH)³

  float alpha_s = (1.0 - d3) * (1.0 - h3);

  float edge      = alpha_s * p;
  float cosTheta_i = max(NdotL, 0.0);
  float s          = smoothstep(0.0, edge, cosTheta_i);

  return lerp(1.0, s, alpha_s * o);
}

// -- 3.2i.  Full Callisto BRDF ------------------------------------------------
//
// Combines all components per slides 85 / 90 / 95:
//
//   L_o = (c₁ · f_lambert + f_ggx) · c₂ · cos(θ_i)
//
// Parameters follow the 3-tier system (slide 98):
//
//   Base:     rho_f, rho_r, n_f, n_r, o
//   Advanced: n_s, dualSpecRoughnessScale, dualSpecOpacity
//   Full:     m_f, m_r, p
//
// Returns:  float3 total outgoing radiance for a single light
//           (multiply by lightColor * lightIntensity externally).
//
float3 CallistoBRDF(
    float3 N, float3 V, float3 L,
    float  roughness, float3 albedo, float3 F0,
    // --- Base tier (slide 98) ---
    float  rho_f    = 1.0,    // Diffuse Fresnel          [0,256]
    float  rho_r    = 1.0,    // Retroreflection          [0,256]
    float  n_f      = 0.75,   // Diffuse Fresnel Falloff  [0,1]
    float  n_r      = 0.75,   // Retroreflection Falloff  [0,1]
    float  o        = 0.0,    // Smooth Terminator        [-1,1]
    // --- Advanced tier ---
    float  n_s      = 0.5,    // Specular Fresnel Falloff [0,1]
    float  dualSpecRoughnessScale = 2.0,
    float  dualSpecOpacity        = 1.0,
    // --- Full tier ---
    float  m_f      = 0.75,   // Diffuse Fresnel Tangent Falloff  [0,1]
    float  m_r      = 0.75,   // Retroreflection Tangent Falloff  [0,1]
    float  p        = 0.5)    // Smooth Terminator Length         [0,1]
{
  float3 H = normalize(V + L);

  float NdotL = dot(N, L);
  float NdotV = max(dot(N, V), 1e-5);
  float NdotH = saturate(dot(N, H));
  float VdotH = saturate(dot(V, H));

  // -- c₂: Smooth Terminator (slide 90) ------------------------------------
  float c2 = CallistoSmoothTerminator(NdotL, VdotH, NdotH, o, p);

  float sNdotL = max(NdotL, 0.0);  // saturated incident cosine

  // -- c₁: Diffuse coefficient (slide 85) -----------------------------------
  float c1 = CallistoDiffuseC1(VdotH, NdotH, rho_f, n_f, m_f, rho_r, n_r, m_r);

  // -- f_lambert: albedo / π ------------------------------------------------
  float3 f_lambert = albedo * 0.318309886;  // 1/PI

  // -- f_ggx: Dual-lobe specular (slide 95 Fresnel) ------------------------
  float roughness2  = saturate(roughness * dualSpecRoughnessScale);
  float sNdotLSpec  = max(sNdotL, 1e-5);   // avoid /0 in visibility

  // Primary lobe
  float alpha1 = max(roughness * roughness, 5e-5);
  float  D1 = GGX_NDF(NdotH, alpha1);
  float  V1 = SmithGGX_Visibility(NdotV, sNdotLSpec, alpha1);
  float3 F1 = CallistoSpecularFresnel(F0, VdotH, n_s);
  float3 spec1 = D1 * V1 * F1;

  // Secondary lobe
  float alpha2 = max(roughness2 * roughness2, 5e-5);
  float  D2 = GGX_NDF(NdotH, alpha2);
  float  V2 = SmithGGX_Visibility(NdotV, sNdotLSpec, alpha2);
  float3 F2 = CallistoSpecularFresnel(F0, VdotH, n_s);
  float3 spec2 = D2 * V2 * F2;

  float3 f_ggx = spec1 + spec2 * dualSpecOpacity;

  // -- Compose: L_o = (c₁ · f_lambert + f_ggx) · c₂ · cos(θ_i) ------------
  return (c1 * f_lambert + f_ggx) * c2 * sNdotL;
}

// ============================================================================
// 3.3  Proxima BRDF — Material Consistency Over Distance
// ----------------------------------------------------------------------------
// SIGGRAPH 2023 — "The Rendering of The Callisto Protocol" (slides 117-131)
// Jose Naranjo, Jon Diego, Jay Ryness & Miguel Rodriguez
//
// Problem:  Lighting(Downsample(inputs)) ≠ Downsample(Lighting(inputs)).
// Mipmapping normal and roughness maps loses high-frequency detail, causing
// incorrect diffuse lighting at distance.  Texture-space lighting is the
// ground truth but too expensive at runtime.
//
// [Chan18] solved the *specular* side (offline normal-length → roughness
// bake).  For *diffuse*, Striking Distance compared a brute-force 3D LUT
// (from [Heitz14]) against Lambert and observed:
//   • The most characteristic deviation occurs when N ≈ V *and* L is near
//     90° from N.
//   • All other configurations are well approximated by Lambert.
//
// They fitted a cheap analytical function to the critical LUT slice and
// called it **Proxima BRDF**.  It replaces f_lambert as a drop-in upgrade.
//
// Composition with the full Callisto BRDF (slide 131):
//   L_o = (c₁ · f_proxima + f_ggx) · c₂ · cos(θ_i)
// ============================================================================

// -- 3.3a.  Proxima BRDF (standalone) -----------------------------------------
//
// Slide 128:
//   f_proxima = (ρ/π) · (α·(-0.55 + 0.19·cosθ_i⁻¹)·(1 - cosθ_k^½) + 1)
//
//   cosθ_k = -V·L   (retro-reflection angle)
//   α       = roughness²  (GGX alpha)
//
// Note from slide 128: "For numerical stability we recommend to pre-multiply
// by cosθ_i to remove the division."  We follow that advice — the returned
// value already includes the NdotL factor, so the caller should NOT multiply
// by NdotL again.
//
// Parameters:
//   NdotL    – saturated dot(N,L)
//   VdotL    – dot(V,L), *not* saturated (can be negative)
//   roughness– perceptual roughness [0,1]
//   albedo   – base colour (linear)
//
// Returns:  diffuse radiance contribution (NdotL pre-applied).
//
float3 ProximaBRDF(
    float  NdotL,
    float  VdotL,
    float  roughness,
    float3 albedo)
{
  float alpha   = roughness * roughness;
  float cosK    = max(-VdotL, 0.0);          // cosθ_k = -V·L, clamped
  float cosI    = max(NdotL, 0.0);           // cosθ_i, clamped

  // Pre-multiplied form (slide 128 note): multiply through by cosθ_i
  // to eliminate the 1/cosθ_i singularity.
  //
  // Original:  (ρ/π) · (α·(-0.55 + 0.19/cosI) · (1 - sqrt(cosK)) + 1) · cosI
  // Rearranged: (ρ/π) · (α·(-0.55·cosI + 0.19) · (1 - sqrt(cosK)) + cosI)
  //
  float sqrtCosK = sqrt(cosK);
  float proxima  = alpha * (-0.55 * cosI + 0.19) * (1.0 - sqrtCosK) + cosI;

  return albedo * (0.318309886 * proxima);   // 0.318309886 = 1/π
}

// -- 3.3b.  Callisto + Proxima BRDF (combined) --------------------------------
//
// Slide 131: drop-in replacement — swap f_lambert for f_proxima inside the
// full Callisto composition:
//
//   L_o = (c₁ · f_proxima + f_ggx) · c₂ · cos(θ_i)
//
// Uses the same 3-tier parameter set as CallistoBRDF (slide 98).
//
float3 CallistoProximaBRDF(
    float3 N, float3 V, float3 L,
    float  roughness, float3 albedo, float3 F0,
    // --- Base tier ---
    float  rho_f    = 1.0,
    float  rho_r    = 1.0,
    float  n_f      = 0.75,
    float  n_r      = 0.75,
    float  o        = 0.0,
    // --- Advanced tier ---
    float  n_s      = 0.5,
    float  dualSpecRoughnessScale = 2.0,
    float  dualSpecOpacity        = 1.0,
    // --- Full tier ---
    float  m_f      = 0.75,
    float  m_r      = 0.75,
    float  p        = 0.5)
{
  float3 H = normalize(V + L);

  float NdotL = dot(N, L);
  float NdotV = max(dot(N, V), 1e-5);
  float NdotH = saturate(dot(N, H));
  float VdotH = saturate(dot(V, H));
  float VdotL = dot(V, L);              // *not* clamped

  // -- c₂: Smooth Terminator (slide 90) ------------------------------------
  float c2 = CallistoSmoothTerminator(NdotL, VdotH, NdotH, o, p);

  float sNdotL = max(NdotL, 0.0);

  // -- c₁: Diffuse coefficient (slide 85) -----------------------------------
  float c1 = CallistoDiffuseC1(VdotH, NdotH, rho_f, n_f, m_f, rho_r, n_r, m_r);

  // -- f_proxima: replaces f_lambert (slide 131) ----------------------------
  // ProximaBRDF returns with NdotL pre-applied, so we need it *without*
  // the extra sNdotL multiplication at the end.
  float alpha   = roughness * roughness;
  float cosK    = max(-VdotL, 0.0);
  float cosI    = sNdotL;
  float sqrtCosK = sqrt(cosK);
  float proxima  = alpha * (-0.55 * cosI + 0.19) * (1.0 - sqrtCosK) + cosI;
  float3 f_proxima = albedo * (0.318309886 * proxima);  // includes NdotL

  // -- f_ggx: Dual-lobe specular (slide 95 Fresnel) ------------------------
  float roughness2  = saturate(roughness * dualSpecRoughnessScale);
  float sNdotLSpec  = max(sNdotL, 1e-5);

  float alpha1 = max(roughness * roughness, 5e-5);
  float  D1 = GGX_NDF(NdotH, alpha1);
  float  V1 = SmithGGX_Visibility(NdotV, sNdotLSpec, alpha1);
  float3 F1 = CallistoSpecularFresnel(F0, VdotH, n_s);
  float3 spec1 = D1 * V1 * F1;

  float alpha2 = max(roughness2 * roughness2, 5e-5);
  float  D2 = GGX_NDF(NdotH, alpha2);
  float  V2 = SmithGGX_Visibility(NdotV, sNdotLSpec, alpha2);
  float3 F2 = CallistoSpecularFresnel(F0, VdotH, n_s);
  float3 spec2 = D2 * V2 * F2;

  float3 f_ggx = spec1 + spec2 * dualSpecOpacity;

  // -- Compose (slide 131): -------------------------------------------------
  // L_o = (c₁ · f_proxima + f_ggx) · c₂ · cos(θ_i)
  // f_proxima already has cosI baked in, so factor it out for consistency:
  //   (c₁ · f_proxima + f_ggx · sNdotL) · c₂
  return (c1 * f_proxima + f_ggx * sNdotL) * c2;
}

// ============================================================================
// 3.4  Hammon + Proxima Diffuse — Combined Energy + Distance Correction
// ----------------------------------------------------------------------------
// Combines two orthogonal diffuse improvements:
//
//   Hammon 2017 — fixes energy loss from ignoring multi-scattering between
//   microfacets.  Adds a correction factor to Lambert that recovers lost
//   energy, especially at high roughness + grazing angles.
//
//   Proxima (SIGGRAPH 2023) — fixes diffuse appearance at distance caused by
//   mipmapping normal/roughness maps.  Reshapes the angular distribution to
//   approximate what you'd get from texture-space lighting.
//
// Both are multiplicative corrections to ρ/π that approach 1.0 in
// smooth/simple configurations, so their product is well-behaved:
//
//   f_combined = (ρ/π) · hammonEnergy · proximaShape
//
// The Hammon energy term is extracted as a ratio vs Lambert, then applied
// on top of the Proxima base.  This preserves Proxima's angular reshaping
// while adding Hammon's multi-scatter energy recovery.
//
// Note: Proxima was fitted against Lambert, not Hammon.  At extreme
// roughness + extreme grazing angles the combined correction may slightly
// overshoot, but in practice both corrections are small perturbations
// (typically 0.8–1.2× range) and the product stays well-behaved.
// ============================================================================

// -- 3.4a.  Hammon Energy Ratio (standalone) ----------------------------------
//
// Returns the ratio of Hammon diffuse to Lambert diffuse.
// This isolates the multi-scatter energy correction so it can be applied
// as a multiplier on top of any other diffuse base (e.g. Proxima).
//
// Returns:  float3 energy ratio (per-channel due to albedo² in multi-scatter)
//
float3 HammonEnergyRatio(
    float NdotL, float NdotV, float NdotH, float VdotH,
    float roughness, float3 albedo)
{
  float3 hammon  = HammonDiffuseBRDF(NdotL, NdotV, NdotH, VdotH, roughness, albedo);
  float3 lambert = albedo * 0.318309886;  // 1/PI

  float3 ratio;
  ratio.x = ::renodx::math::DivideSafe(hammon.x, lambert.x, 1.0);
  ratio.y = ::renodx::math::DivideSafe(hammon.y, lambert.y, 1.0);
  ratio.z = ::renodx::math::DivideSafe(hammon.z, lambert.z, 1.0);

  return ratio;
}

// -- 3.4b.  Hammon + Proxima Diffuse (standalone) -----------------------------
//
// Combines Proxima's distance-stable angular distribution with Hammon's
// multi-scatter energy recovery.
//
//   result = ProximaBRDF() * HammonEnergyRatio()
//
// ProximaBRDF returns with NdotL pre-applied, so the output of this
// function also has NdotL baked in.  Do NOT multiply by NdotL again.
//
// Parameters:
//   NdotL     – saturated dot(N, L)
//   NdotV     – saturated dot(N, V)
//   NdotH     – saturated dot(N, H)
//   VdotH     – saturated dot(V, H)
//   VdotL     – dot(V, L), *not* saturated (can be negative)
//   roughness – perceptual roughness [0,1]
//   albedo    – surface base color (linear)
//
// Returns:  diffuse radiance contribution (NdotL pre-applied).
//
float3 HammonProximaDiffuse(
    float  NdotL, float  NdotV, float  NdotH, float  VdotH,
    float  VdotL,
    float  roughness, float3 albedo)
{
  float3 proxima     = ProximaBRDF(NdotL, VdotL, roughness, albedo);
  float3 energyRatio = HammonEnergyRatio(NdotL, NdotV, NdotH, VdotH, roughness, albedo);

  return proxima * energyRatio;
}

// -- 3.4c.  Callisto + Hammon + Proxima BRDF (full combination) ---------------
//
// The ultimate combination: uses Proxima's distance-stable diffuse as the
// base, applies Hammon's multi-scatter energy correction on top, then wraps
// it with the full Callisto framework (c₁ diffuse coefficient, dual-lobe
// GGX specular with configurable Fresnel, c₂ smooth terminator).
//
//   L_o = (c₁ · f_hammon_proxima + f_ggx) · c₂
//
// f_hammon_proxima already has NdotL baked in (from Proxima's pre-multiplied
// form), so the specular side is multiplied by NdotL separately.
//
// Uses the same 3-tier parameter set as CallistoBRDF (slide 98).
//
float3 CallistoHammonProximaBRDF(
    float3 N, float3 V, float3 L,
    float  roughness, float3 albedo, float3 F0,
    // --- Base tier ---
    float  rho_f    = 1.0,
    float  rho_r    = 1.0,
    float  n_f      = 0.75,
    float  n_r      = 0.75,
    float  o        = 0.0,
    // --- Advanced tier ---
    float  n_s      = 0.5,
    float  dualSpecRoughnessScale = 2.0,
    float  dualSpecOpacity        = 1.0,
    // --- Full tier ---
    float  m_f      = 0.75,
    float  m_r      = 0.75,
    float  p        = 0.5)
{
  float3 H = normalize(V + L);

  float NdotL = dot(N, L);
  float NdotV = max(dot(N, V), 1e-5);
  float NdotH = saturate(dot(N, H));
  float VdotH = saturate(dot(V, H));
  float VdotL = dot(V, L);              // *not* clamped

  // -- c₂: Smooth Terminator (slide 90) ------------------------------------
  float c2 = CallistoSmoothTerminator(NdotL, VdotH, NdotH, o, p);

  float sNdotL = max(NdotL, 0.0);

  // -- c₁: Diffuse coefficient (slide 85) -----------------------------------
  float c1 = CallistoDiffuseC1(VdotH, NdotH, rho_f, n_f, m_f, rho_r, n_r, m_r);

  // -- f_hammon_proxima: Proxima base + Hammon energy (NdotL pre-applied) ---
  float3 f_hp = HammonProximaDiffuse(
      sNdotL, NdotV, NdotH, VdotH, VdotL, roughness, albedo);

  // -- f_ggx: Dual-lobe specular (slide 95 Fresnel) ------------------------
  float roughness2  = saturate(roughness * dualSpecRoughnessScale);
  float sNdotLSpec  = max(sNdotL, 1e-5);

  float alpha1 = max(roughness * roughness, 5e-5);
  float  D1 = GGX_NDF(NdotH, alpha1);
  float  V1 = SmithGGX_Visibility(NdotV, sNdotLSpec, alpha1);
  float3 F1 = CallistoSpecularFresnel(F0, VdotH, n_s);
  float3 spec1 = D1 * V1 * F1;

  float alpha2 = max(roughness2 * roughness2, 5e-5);
  float  D2 = GGX_NDF(NdotH, alpha2);
  float  V2 = SmithGGX_Visibility(NdotV, sNdotLSpec, alpha2);
  float3 F2 = CallistoSpecularFresnel(F0, VdotH, n_s);
  float3 spec2 = D2 * V2 * F2;

  float3 f_ggx = spec1 + spec2 * dualSpecOpacity;

  // -- Compose: (c₁ · f_hammon_proxima + f_ggx · NdotL) · c₂ --------------
  // f_hp has NdotL pre-applied; specular needs it explicitly.
  return (c1 * f_hp + f_ggx * sNdotL) * c2;
}

// ============================================================================
// 3.5  Multi-Scatter GGX Specular — Kulla-Conty Energy Compensation
// ----------------------------------------------------------------------------
// Kulla & Conty, SIGGRAPH 2017 — "Revisiting Physically Based Shading"
//
// Single-scatter GGX loses energy at high roughness because inter-microfacet
// bounces are ignored.  This section provides LUT-free analytical helpers
// plus a full combined BRDF.
//
// The approach:
//   1. Compute directional albedo E(μ, α) — the fraction of energy reflected
//      by single-scatter GGX at a given (NdotV, roughness) pair.
//   2. The missing energy is (1 - E(μ_o)) · (1 - E(μ_i)).
//   3. Apply a multiplicative compensation factor that recovers this energy,
//      tinted by F_avg (average Fresnel) for correct color saturation.
//
// The directional albedo uses Turquin 2019's rational polynomial fit, avoiding any 2D LUT texture fetches.
// Turquin 2019 directional albedo fit is calibrated for GGX + Smith height-correlated visibility, if a game uses Schlick-Beckmann geometry
// specular will get blow out and causes fireflies, clamp both primary and secondary lobe compensation factor
//
// ============================================================================

// -- 3.5a.  Directional Albedo E(μ, α) — Turquin 2019 fit --------------------
//
// Approximates the fraction of incoming energy reflected by single-scatter
// GGX+Smith at a given view angle and roughness.  Replaces the 2D LUT
// from Kulla-Conty with an analytical rational polynomial.
//
// Accuracy is within ~1% of the tabulated LUT for GGX + height-correlated Smith visibility.
//
float GGX_DirectionalAlbedo(float NdotV, float roughness)
{
  float mu  = NdotV;
  float a   = roughness;
  float a2  = a * a;
  float mu2 = mu * mu;

  // Rational polynomial fit (Turquin 2019)
  float num = 1.0
            + mu  * (-1.0816 + a * 0.0378)
            + mu2 * ( 0.1696 + a * 0.0856)
            + a   * (-0.6992 + a * (1.4424 + a * (-1.3616 + a * 0.4504)));

  return saturate(num);
}

// -- 3.5b.  Average Albedo E_avg(α) -------------------------------------------
//
// Hemisphere-average of DirectionalAlbedo.  Used in the denominator of
// multi-scatter compensation to ensure energy conservation.
//
float GGX_AverageAlbedo(float roughness)
{
  float a = roughness;
  return saturate(1.0 + a * (-0.7127 + a * (0.4364 + a * (-0.1188))));
}

// -- 3.5c.  Multi-Scatter Compensation Factor ---------------------------------
//
// Returns a per-channel multiplier (≥ 1.0) to apply to single-scatter
// specular, recovering the missing inter-bounce energy.
//
// The factor accounts for:
//   1. Missing energy from inter-microfacet bounces
//   2. Color saturation: each bounce is attenuated by F0, so metals
//      get more saturated highlights with multi-scatter.
//
// From Kulla-Conty 2017, rearranged into multiplicative form:
//   compensation = 1 + F_avg · (1 - E_o)(1 - E_i) / (E_o · E_i · (1 - F_avg(1 - E_avg)))
//
// At roughness=0, E≈1, so compensation≈1 (no correction needed).
// At high roughness with bright F0, this can reach 1.3–1.8×.
//
float3 MultiScatterCompensation(
    float  NdotV,
    float  NdotL,
    float  roughness,
    float3 F0)
{
  float Eo   = GGX_DirectionalAlbedo(NdotV, roughness);
  float Ei   = GGX_DirectionalAlbedo(NdotL, roughness);
  float Eavg = GGX_AverageAlbedo(roughness);

  // Average Fresnel: cosine-weighted hemisphere integral of Schlick
  //   F_avg = F0 + (1/21)(1 - F0)
  float3 Favg = F0 + (1.0 / 21.0) * (1.0 - F0);

  // Denominator: energy that doesn't escape after multiple bounces
  float3 f_ms_denom = max(1.0 - Favg * (1.0 - Eavg), 1e-5);

  // Directional energy loss from single-scatter
  float  dirLoss = (1.0 - Eo) * (1.0 - Ei);
  float  dirBase = max(Eo * Ei, 1e-5);

  // Clamp compensation to prevent fireflies when the game's geometry term
  // doesn't match the GGX+Smith model the Turquin fit was calibrated against.
  return min(1.0 + Favg * dirLoss / (dirBase * f_ms_denom), 4.0);
}

float MultiScatterCompensation(
    float NdotV, float NdotL, float roughness, float F0)
{
  return MultiScatterCompensation(NdotV, NdotL, roughness, float3(F0, F0, F0)).x;
}

// -- 3.5d.  Full Callisto + Hammon + Proxima with Multi-Scatter Specular ------
//
// The full combination:
//   • Diffuse:   Proxima (distance-stable) × Hammon (energy-conserving)
//   • Specular:  Dual-lobe GGX × Kulla-Conty multi-scatter compensation
//   • Framework: Callisto c₁ (Fresnel + retroreflection) + c₂ (smooth terminator)
//
// This is the most physically complete configuration available:
//   L_o = (c₁ · f_hammon_proxima + f_ggx_ms) · c₂
//
// Uses the same 3-tier parameter set as CallistoBRDF (slide 98).
//
float3 CallistoHammonProximaBRDF_MultiScatter(
    float3 N, float3 V, float3 L,
    float  roughness, float3 albedo, float3 F0,
    // --- Base tier ---
    float  rho_f    = 1.0,
    float  rho_r    = 1.0,
    float  n_f      = 0.75,
    float  n_r      = 0.75,
    float  o        = 0.0,
    // --- Advanced tier ---
    float  n_s      = 0.5,
    float  dualSpecRoughnessScale = 2.0,
    float  dualSpecOpacity        = 1.0,
    // --- Full tier ---
    float  m_f      = 0.75,
    float  m_r      = 0.75,
    float  p        = 0.5)
{
  float3 H = normalize(V + L);

  float NdotL = dot(N, L);
  float NdotV = max(dot(N, V), 1e-5);
  float NdotH = saturate(dot(N, H));
  float VdotH = saturate(dot(V, H));
  float VdotL = dot(V, L);

  // -- c₂: Smooth Terminator (slide 90) ------------------------------------
  float c2 = CallistoSmoothTerminator(NdotL, VdotH, NdotH, o, p);

  float sNdotL = max(NdotL, 0.0);

  // -- c₁: Diffuse coefficient (slide 85) -----------------------------------
  float c1 = CallistoDiffuseC1(VdotH, NdotH, rho_f, n_f, m_f, rho_r, n_r, m_r);

  // -- Hammon + Proxima diffuse (NdotL pre-applied) -------------------------
  float3 f_hp = HammonProximaDiffuse(
      sNdotL, NdotV, NdotH, VdotH, VdotL, roughness, albedo);

  // -- Dual-lobe specular with multi-scatter compensation -------------------
  float roughness2  = saturate(roughness * dualSpecRoughnessScale);
  float sNdotLSpec  = max(sNdotL, 1e-5);

  // Primary lobe + compensation
  float alpha1 = max(roughness * roughness, 5e-5);
  float  D1 = GGX_NDF(NdotH, alpha1);
  float  V1 = SmithGGX_Visibility(NdotV, sNdotLSpec, alpha1);
  float3 F1 = CallistoSpecularFresnel(F0, VdotH, n_s);
  float3 spec1 = D1 * V1 * F1;
  spec1 *= MultiScatterCompensation(NdotV, sNdotLSpec, roughness, F0);

  // Secondary lobe + compensation
  float alpha2 = max(roughness2 * roughness2, 5e-5);
  float  D2 = GGX_NDF(NdotH, alpha2);
  float  V2 = SmithGGX_Visibility(NdotV, sNdotLSpec, alpha2);
  float3 F2 = CallistoSpecularFresnel(F0, VdotH, n_s);
  float3 spec2 = D2 * V2 * F2;
  spec2 *= MultiScatterCompensation(NdotV, sNdotLSpec, roughness2, F0);

  float3 f_ggx = spec1 + spec2 * dualSpecOpacity;

  // -- Compose: (c₁ · f_hp + f_ggx · NdotL) · c₂ --------------------------
  return (c1 * f_hp + f_ggx * sNdotL) * c2;
}

// ============================================================================
// 3.6  Material Parameterization Helpers
// ----------------------------------------------------------------------------
// Ported from NVIDIA RTX Remix (MIT license) and adapted to fp32 HLSL.
//
// Utilities for converting between common PBR parameterizations:
//   • IoR ↔ base reflectivity (Schlick F0)
//   • Metallic-workflow albedo / reflectivity derivation
//   • Isotropic → anisotropic roughness mapping
//   • Perceptual ↔ linear roughness
//   • Beer-Lambert transmittance ↔ attenuation coefficient
// ============================================================================

// -- 3.6a.  Perceptual ↔ Linear Roughness ------------------------------------
// [Burley 2012, "Physically-Based Shading at Disney"]

float PerceptualRoughnessToRoughness(float perceptualRoughness)
{
  return perceptualRoughness * perceptualRoughness;
}

float RoughnessToPerceptualRoughness(float roughness)
{
  return sqrt(roughness);
}

// -- 3.6b.  IoR ↔ Base Reflectivity ------------------------------------------
//
// Converts between index of refraction and monochromatic Schlick F0 using
// the Fresnel equations at normal incidence:
//   F0 = ((n1 - n2) / (n1 + n2))²
//
// [RTX Remix, brdf.slangh]

float IorToBaseReflectivity(float incidentIoR, float transmittedIoR)
{
  float ratio = (incidentIoR - transmittedIoR) / (incidentIoR + transmittedIoR);
  return ratio * ratio;
}

// Inverse: recover IoR from a monochromatic F0 and incident IoR.
// Note: On conductors the resulting IoR will be unrealistically high because
// the true reflectivity depends on the complex refractive index (n + ik).
float BaseReflectivityToIoR(float incidentIoR, float baseReflectivity)
{
  // Clamp sqrt(F0) to 0.99 to prevent overflow with near-1 materials
  float sqrtF0 = min(sqrt(baseReflectivity), 0.99);
  return incidentIoR / (2.0 / (sqrtF0 + 1.0) - 1.0);
}

// -- 3.6c.  Metallic-Workflow Helpers -----------------------------------------
//
// Standard metallic workflow used by glTF, UE, Unity, Remix, etc.
// [RTX Remix, brdf.slangh]

static const float3 kDielectricBaseReflectivity = float3(0.04, 0.04, 0.04);

// Adjusted albedo: conductors absorb all transmitted light, so their
// diffuse albedo is effectively zero.  Opacity scales the contribution.
float3 AlbedoToAdjustedAlbedo(float3 baseAlbedo, float metallic, float opacity = 1.0)
{
  return baseAlbedo * (1.0 - metallic) * opacity;
}

// Base reflectivity (F0): dielectric uses constant 0.04; conductor uses
// the albedo color.  Opacity scales the result.
float3 CalcBaseReflectivity(float3 albedo, float metallic, float opacity = 1.0)
{
  return lerp(kDielectricBaseReflectivity, albedo, metallic) * opacity;
}

// -- 3.6d.  Anisotropic Roughness Mapping -------------------------------------
//
// Converts isotropic roughness + an anisotropy parameter in (-1, 1) into
// per-axis roughness for tangent (T) and bitangent (B) directions.
// [Kulla 2017, "Revisiting Physically Based Shading at Imageworks"]
// [RTX Remix, brdf.slangh]

float2 IsotropicToAnisotropicRoughness(float isotropicRoughness, float anisotropy)
{
  return float2(isotropicRoughness * (1.0 + anisotropy),
                isotropicRoughness * (1.0 - anisotropy));
}

// Inverse: recover anisotropy from per-axis roughness given the isotropic
// reference.
float AnisotropicRoughnessToAnisotropy(float isotropicRoughness, float2 anisotropicRoughness)
{
  if (isotropicRoughness <= 0.0) return 0.0;
  float2 norm = anisotropicRoughness / isotropicRoughness;
  return (norm.x - norm.y) * 0.5;
}

// Full roughness derivation: perceptual roughness + anisotropy → clamped
// isotropic and anisotropic roughness values ready for GGX evaluation.
void CalcRoughness(
    float  perceptualRoughness,
    float  anisotropy,
    out float  isotropicRoughness,
    out float2 anisotropicRoughness)
{
  static const float kMinRoughness = 1e-4;  // matches RTX Remix materialMinimumRoughness

  float rawIso   = PerceptualRoughnessToRoughness(perceptualRoughness);
  float2 rawAniso = IsotropicToAnisotropicRoughness(rawIso, anisotropy);

  isotropicRoughness   = max(rawIso,   kMinRoughness);
  anisotropicRoughness = max(rawAniso, float2(kMinRoughness, kMinRoughness));
}

// -- 3.6e.  Beer-Lambert Attenuation ------------------------------------------
//
// Calculates the extinction coefficient from transmittance color at a known
// distance, and evaluates attenuation at an arbitrary distance.
// [Burley 2015, "Extending the Disney BRDF to a BSDF with Integrated SSS"]
// [RTX Remix, brdf.slangh]

float3 TransmittanceToAttenuationCoefficient(float3 transmittanceColor,
                                             float  measurementDistance)
{
  return -log(max(transmittanceColor, 1e-10)) / max(measurementDistance, 1e-10);
}

float3 EvalBeerLambertAttenuation(float3 attenuationCoefficient, float distance)
{
  return exp(-attenuationCoefficient * distance);
}

// ============================================================================
// 3.7  Anisotropic GGX Specular
// ----------------------------------------------------------------------------
// Ported from NVIDIA RTX Remix (MIT license), adapted to fp32 HLSL.
//
// Extends the existing isotropic GGX with tangent-space anisotropy for
// brushed metals, hair, directional surfaces, etc.
//
// Required inputs beyond the standard N·V / N·L / N·H / V·H:
//   T (tangent), B (bitangent) — orthonormal frame on the surface.
//   T·H, B·H, T·L, B·L, T·V, B·V — dot products with the tangent frame.
//
// [Heitz 2014, "Understanding the Masking-Shadowing Function in
//  Microfacet-Based BRDFs"]
// ============================================================================

// -- 3.7a.  Anisotropic GGX Normal Distribution Function (D) -----------------
//
// D_GGX_aniso = 1 / (π · αx · αy · ((TdotH/αx)² + (BdotH/αy)² + NdotH²)²)
//
// Uses the algebraically restructured form from Google Filament / RTX Remix
// to minimize runtime divisions at the cost of extra multiplications.
// Full fp32 precision is used throughout because small roughness values
// (<= 0.01) produce very small intermediate quantities.
//
float GGX_NDF_Anisotropic(
    float2 anisotropicRoughness,
    float  TdotH, float BdotH, float NdotH)
{
  float ax = anisotropicRoughness.x;
  float ay = anisotropicRoughness.y;
  float roughnessProduct = ax * ay;

  float3 denomVec = float3(ay * TdotH, ax * BdotH, roughnessProduct * NdotH);
  float denomDot  = dot(denomVec, denomVec);
  float body      = ::renodx::math::DivideSafe(roughnessProduct, denomDot, 1e-30);

  return (1.0 / 3.14159265) * roughnessProduct * body * body;
}

// -- 3.7b.  Anisotropic Height-Correlated GGX Visibility (V) -----------------
//
// V = G2 / (4 · NdotL · NdotV)
//
// Combines the shadowing/masking function with the microfacet BRDF
// denominator, just like the isotropic SmithGGX_Visibility above.
//
// [Heitz 2014]
//
float SmithGGX_Visibility_Anisotropic(
    float2 anisotropicRoughness,
    float  TdotV, float BdotV, float NdotV,
    float  TdotL, float BdotL, float NdotL)
{
  float ax = anisotropicRoughness.x;
  float ay = anisotropicRoughness.y;

  float lambdaV = NdotL * length(float3(ax * TdotV, ay * BdotV, NdotV));
  float lambdaL = NdotV * length(float3(ax * TdotL, ay * BdotL, NdotL));

  return 0.5 / max(lambdaV + lambdaL, 1e-7);
}

// -- 3.7c.  Anisotropic GGX Specular Evaluation ------------------------------
//
// Full D * V * F for a single anisotropic GGX lobe.
//
// Parameters:
//   anisotropicRoughness – float2(αx, αy) from IsotropicToAnisotropicRoughness
//   TdotH, BdotH, NdotH — half-vector projected onto tangent frame
//   TdotV, BdotV, NdotV — view direction projected onto tangent frame
//   TdotL, BdotL, NdotL — light direction projected onto tangent frame
//   VdotH                — view dot half-vector (for Fresnel)
//   F0                   — reflectance at normal incidence
//
// Returns:  specular radiance contribution (pre-NdotL).
//
float3 GGX_Specular_Anisotropic(
    float2 anisotropicRoughness,
    float  TdotH, float BdotH, float NdotH,
    float  TdotV, float BdotV, float NdotV,
    float  TdotL, float BdotL, float NdotL,
    float  VdotH,
    float3 F0)
{
  float  D = GGX_NDF_Anisotropic(anisotropicRoughness, TdotH, BdotH, NdotH);
  float  V = SmithGGX_Visibility_Anisotropic(anisotropicRoughness,
               TdotV, BdotV, NdotV, TdotL, BdotL, NdotL);
  float3 F = SchlickFresnel(F0, VdotH);

  return D * V * F;
}

// -- 3.7d.  Anisotropic Dual-Lobe GGX Specular (Callisto-compatible) ---------
//
// Two anisotropic GGX lobes combined with a secondary weight, matching the
// dual-lobe pattern from the Callisto BRDF but with full tangent-space
// anisotropy support.
//
float3 DualLobeGGX_Anisotropic(
    float2 anisoRoughness1,
    float2 anisoRoughness2,
    float  TdotH, float BdotH, float NdotH,
    float  TdotV, float BdotV, float NdotV,
    float  TdotL, float BdotL, float NdotL,
    float  VdotH,
    float3 F0_1, float3 F0_2,
    float  secondaryWeight = 0.5)
{
  float3 lobe1 = GGX_Specular_Anisotropic(anisoRoughness1,
      TdotH, BdotH, NdotH, TdotV, BdotV, NdotV, TdotL, BdotL, NdotL, VdotH, F0_1);
  float3 lobe2 = GGX_Specular_Anisotropic(anisoRoughness2,
      TdotH, BdotH, NdotH, TdotV, BdotV, NdotV, TdotL, BdotL, NdotL, VdotH, F0_2);
  return lobe1 + lobe2 * secondaryWeight;
}

// ============================================================================
// 3.8  Thin Film Iridescence Fresnel
// ----------------------------------------------------------------------------
// Ported from NVIDIA RTX Remix (MIT license), adapted to fp32 HLSL.
//
// Simulates wave interference in a thin dielectric film coating a surface,
// producing view-angle-dependent color shifts (iridescence / soap bubbles /
// oil films / coated metals).
//
// The model evaluates Fresnel amplitude coefficients for S and P polarized
// light at each interface (air→film, film→substrate), then combines them
// with a phase term based on optical path difference through the film,
// evaluated at the center wavelengths of the sRGB primaries.
//
// [Gamedev.net, "Thin Film Interference for Computer Graphics"]
// [RTX Remix, brdf.slangh]
// ============================================================================

// Approximate center wavelengths (in nanometers) for sRGB primaries.
static const float3 kSRGBPrimaryWavelengths = float3(630.0, 532.0, 467.0);

// -- 3.8a.  Fresnel Amplitude Coefficients -----------------------------------
// https://en.wikipedia.org/wiki/Fresnel_equations

float FresnelAmplitude_RS(
    float n1, float n2,
    float cosI, float cosT)
{
  float x = n1 * cosI;
  float y = n2 * cosT;
  return (x - y) / (x + y);
}

float FresnelAmplitude_RP(
    float n1, float n2,
    float cosI, float cosT)
{
  float x = n2 * cosI;
  float y = n1 * cosT;
  return (x - y) / (x + y);
}

float FresnelAmplitude_TS(
    float n1, float n2,
    float cosI, float cosT)
{
  float x = n1 * cosI;
  float y = n2 * cosT;
  return (2.0 * x) / (x + y);
}

float FresnelAmplitude_TP(
    float n1, float n2,
    float cosI, float cosT)
{
  float x = n1 * cosI;
  float y = n2 * cosI;
  float z = n1 * cosT;
  return (2.0 * x) / (y + z);
}

// -- 3.8b.  Refraction Cosine Angle ------------------------------------------
//
// Given a relative refractive index and incident cosine, computes the cosine
// of the refracted angle via Snell's law.  Returns false on total internal
// reflection (TIR).
//
bool RefractionCosineAngle(float relativeIoR, float cosIncident, out float cosRefracted)
{
  float sinSq = relativeIoR * relativeIoR * (1.0 - cosIncident * cosIncident);
  cosRefracted = sqrt(max(1.0 - sinSq, 0.0));
  return sinSq <= 1.0;
}

// -- 3.8c.  TIR-Aware Schlick Fresnel ----------------------------------------
//
// Schlick Fresnel for translucent dielectrics that handles total internal
// reflection when entering from a denser medium.
// [RTX Remix, brdf.slangh]
//
float TranslucentSchlickFresnel(float baseReflectivity, float VdotH)
{
  float oneMinusVdotH = 1.0 - VdotH;
  float pow5 = oneMinusVdotH * oneMinusVdotH;
  pow5 *= pow5 * oneMinusVdotH;
  return baseReflectivity + (1.0 - baseReflectivity) * pow5;
}

float TranslucentSchlickFresnelTIR(
    float baseReflectivity,
    float relativeIoR,
    float VdotH)
{
  float modifiedVdotH = VdotH;

  if (relativeIoR > 1.0)
  {
    float cosRefracted;
    if (!RefractionCosineAngle(relativeIoR, VdotH, cosRefracted))
      return 1.0;  // total internal reflection
    modifiedVdotH = cosRefracted;
  }

  return TranslucentSchlickFresnel(baseReflectivity, modifiedVdotH);
}

// -- 3.8d.  Thin Film Fresnel ------------------------------------------------
//
// Evaluates the reflectance of a thin dielectric film with wave interference.
//
// Parameters:
//   outsideIoR  – refractive index of the exterior medium (1.0 for air)
//   layerIoR    – refractive index of the thin film layer (~1.5 typical)
//   insideIoR   – refractive index of the substrate beneath the film
//   thickness   – film thickness in nanometers
//   VdotH       – cos(θ) between view direction and microfacet normal
//
// Returns:  per-channel (R,G,B) Fresnel reflectance with iridescence.
//
float3 ThinFilmFresnel(
    float outsideIoR,
    float layerIoR,
    float insideIoR,
    float thickness,
    float VdotH)
{
  // Early out for parallel viewing angles
  if (VdotH <= 0.0) return float3(1, 1, 1);

  // Relative refractive indices
  float outsideRelIoR = outsideIoR / layerIoR;
  float layerRelIoR   = layerIoR   / insideIoR;

  // Refracted cosines at each interface via Snell's law
  float cosRefractedOutside;
  if (!RefractionCosineAngle(outsideRelIoR, VdotH, cosRefractedOutside))
    return float3(0, 0, 0);  // TIR at outer interface

  float cosRefractedLayer;
  if (!RefractionCosineAngle(outsideRelIoR, cosRefractedOutside, cosRefractedLayer))
    return float3(0, 0, 0);  // TIR at inner interface

  // ---- Fresnel amplitude coefficients at each interface -------------------

  // Reflection amplitudes (film ↔ outside, film ↔ inside)
  float alphaS = FresnelAmplitude_RS(layerIoR, outsideIoR, cosRefractedOutside, VdotH)
               * FresnelAmplitude_RS(layerIoR, insideIoR,  cosRefractedOutside, cosRefractedLayer);
  float alphaP = FresnelAmplitude_RP(layerIoR, outsideIoR, cosRefractedOutside, VdotH)
               * FresnelAmplitude_RP(layerIoR, insideIoR,  cosRefractedOutside, cosRefractedLayer);

  // Transmission amplitudes (outside → film → inside)
  float betaS  = FresnelAmplitude_TS(outsideIoR, layerIoR, VdotH, cosRefractedOutside)
               * FresnelAmplitude_TS(layerIoR,   insideIoR, cosRefractedOutside, cosRefractedLayer);
  float betaP  = FresnelAmplitude_TP(outsideIoR, layerIoR, VdotH, cosRefractedOutside)
               * FresnelAmplitude_TP(layerIoR,   insideIoR, cosRefractedOutside, cosRefractedLayer);

  // ---- Wave phase (optical path difference through the thin film) ---------

  // Phase shift: π when reflecting off a denser medium, 0 otherwise
  float phaseShift = 0.0;
  phaseShift += (layerIoR > outsideIoR) ? 0.0 : 3.14159265;
  phaseShift += (layerIoR > insideIoR)  ? 0.0 : 3.14159265;

  // Optical path difference → per-wavelength phase
  float OPD = 2.0 * layerIoR * thickness * cosRefractedOutside;
  float3 phase = (6.28318530 / kSRGBPrimaryWavelengths) * OPD + float3(phaseShift, phaseShift, phaseShift);

  // ---- Wave-interfered transmission per sRGB primary ----------------------

  float alphaSsq = alphaS * alphaS;
  float alphaPsq = alphaP * alphaP;
  float betaSsq  = betaS  * betaS;
  float betaPsq  = betaP  * betaP;

  float3 cosPhase = cos(phase);

  float3 transS = betaSsq / (alphaSsq - 2.0 * alphaS * cosPhase + 1.0);
  float3 transP = betaPsq / (alphaPsq - 2.0 * alphaP * cosPhase + 1.0);

  // ---- Beam geometry change + unpolarized combination ---------------------

  float beamRatio = (insideIoR * cosRefractedLayer) / (outsideIoR * VdotH);
  float3 transmission = beamRatio * (transS + transP) * 0.5;

  return saturate(1.0 - transmission);
}

// -- 3.8e.  Thin Surface Geometric Series ------------------------------------
//
// Evaluate the infinite series of internal reflections in a thin surface.
// [Kulla 2017, "Revisiting Physically Based Shading at Imageworks"]
// [RTX Remix, brdf.slangh]
//
float3 ThinReflectionGeometricSeries(
    float outsideFresnel, float insideFresnel, float3 attenuation)
{
  float3 attSq = attenuation * attenuation;
  float3 geomSeries = 1.0 / (1.0 - attSq * insideFresnel * insideFresnel);
  return outsideFresnel
       + insideFresnel * attSq
         * (1.0 - outsideFresnel) * (1.0 - insideFresnel)
         * geomSeries;
}

float3 ThinTransmissionGeometricSeries(
    float outsideFresnel, float insideFresnel, float3 attenuation)
{
  float3 geomSeries = 1.0 / (1.0 - attenuation * attenuation * insideFresnel * insideFresnel);
  return attenuation
       * (1.0 - outsideFresnel) * (1.0 - insideFresnel)
       * geomSeries;
}

// ============================================================================
// 3.9  Volumetric & Phase Function Helpers
// ----------------------------------------------------------------------------
// Ported from NVIDIA RTX Remix (MIT license), adapted to fp32 HLSL.
// ============================================================================

// -- 3.9a.  Henyey-Greenstein Phase Function ---------------------------------
//
// Evaluates the angular distribution of scattered light in a participating
// medium.  The anisotropy parameter g controls forward/backward bias:
//   g =  0  — isotropic scattering
//   g → +1  — strongly forward-scattering
//   g → -1  — strongly backward-scattering
//
// [Henyey & Greenstein 1941, "Diffuse Radiation in the Galaxy"]
// [RTX Remix, brdf.slangh]
//
float HenyeyGreensteinPhase(float anisotropy, float VdotL)
{
  float g2    = anisotropy * anisotropy;
  float num   = 1.0 - g2;
  float denom = pow(1.0 + g2 - 2.0 * anisotropy * VdotL, 1.5);
  return (1.0 / (4.0 * 3.14159265)) * ::renodx::math::DivideSafe(num, denom, 1.0);
}

// -- 3.9b.  Normal Blending (Reoriented Normal Mapping) ----------------------
//
// Blends two normal vectors in tangent space using reoriented normal mapping.
// Produces better results than simple normal averaging for detail normal maps.
//
// [Barré-Brisebois & Hill 2012, "Blending in Detail"]
// [RTX Remix, brdf.slangh]
//
float3 NormalBlendRNM(float3 baseNormal, float3 detailNormal)
{
  float3 n1 = baseNormal + float3(0, 0, 1);
  float3 n2 = detailNormal * float3(-1, -1, 1);
  return normalize(n1 * ::renodx::math::DivideSafe(dot(n1, n2), n1.z, 1.0) - n2);
}

// ============================================================================
// 3.10  RDX BRDF — Unified Rasterisation BRDF Package
// ----------------------------------------------------------------------------
// Single entry point that combines every rasterisation BRDF component in
// this file into one ready-to-call function:
//
//   Diffuse:   Hammon 2017 multi-scatter energy × Proxima 2023 distance-stability
//   Specular:  Dual-lobe GGX  (isotropic or anisotropic)
//              × Callisto 2023 modified Fresnel  (or thin film iridescence)
//              × Kulla-Conty multi-scatter energy compensation
//   Framework: Callisto c₁ (Fresnel/retroreflection) + c₂ (smooth terminator)
//   Material:  Metallic-workflow F0 derivation  (or explicit F0 override)
//
// Two calling conventions are provided:
//
//   ● Minimal — one line, returns combined float3 directly:
//       float3 color = RDX_BRDF(N, V, L, albedo, roughness, metallic);
//
//   ● Full control — configure every parameter through RDX_BRDFParams:
//       RDX_BRDFParams p = RDX_DefaultParams();
//       p.N = normal;  p.V = viewDir;  p.L = lightDir;
//       p.albedo = baseColor;  p.roughness = rough;  p.metallic = metal;
//       p.anisotropy = 0.5;
//       p.enableThinFilm = 1.0;  p.thinFilmThickness = 500.0;
//       RDX_BRDFResult r = RDX_BRDF(p);
//       output = r.combined * lightColor;
//
// Output struct fields:
//   .diffuse  — diffuse contribution  (NdotL pre-applied, pre-c₂)
//   .specular — specular contribution (NdotL pre-applied, pre-c₂)
//   .combined — (diffuse + specular) × c₂   (multiply by lightColor)
// ============================================================================

// -- 3.10a.  Parameter & Result Structs --------------------------------------

struct RDX_BRDFParams {
  // ---- Geometry (required — must be set by caller) ----
  float3 N;          // Surface normal (normalised)
  float3 V;          // View direction (normalised, toward camera)
  float3 L;          // Light direction (normalised, toward light)
  float3 T;          // Tangent  (normalised, for anisotropy; default +X)
  float3 B;          // Bitangent (normalised, for anisotropy; default +Y)

  // ---- Material ----
  float3 albedo;     // Base colour (linear RGB)
  float  roughness;  // Perceptual roughness [0, 1]
  float  metallic;   // Metallic [0, 1]
  float  anisotropy; // Anisotropy [-1, 1], 0 = isotropic
  float  opacity;    // Opacity [0, 1], 1 = fully opaque

  // ---- F0 Override (optional) ----
  float  useCustomF0; // 0 = metallic workflow, > 0 = use customF0 field
  float3 customF0;    // Custom base reflectivity (only when useCustomF0 > 0)

  // ---- Callisto: Base Tier (slide 98) ----
  float  rho_f;      // Diffuse Fresnel intensity         [0, 256]
  float  rho_r;      // Retroreflection intensity          [0, 256]
  float  n_f;        // Diffuse Fresnel falloff            [0, 1]
  float  n_r;        // Retroreflection falloff            [0, 1]
  float  o;          // Smooth terminator intensity        [-1, 1]

  // ---- Callisto: Advanced Tier ----
  float  n_s;                    // Specular Fresnel falloff     [0, 1]
  float  dualSpecRoughnessScale; // 2nd lobe roughness mult.    [> 0]
  float  dualSpecOpacity;        // 2nd lobe blend weight        [0, 1]

  // ---- Callisto: Full Tier ----
  float  m_f;        // Diffuse Fresnel tangent falloff    [0, 1]
  float  m_r;        // Retroreflection tangent falloff    [0, 1]
  float  p;          // Smooth terminator length           [0, 1]

  // ---- Thin Film Iridescence (optional) ----
  float  enableThinFilm;      // 0 = off, > 0 = on
  float  thinFilmThickness;   // Film thickness (nm)
  float  thinFilmOutsideIoR;  // Exterior medium IoR (1.0 = air)
  float  thinFilmLayerIoR;    // Film layer IoR (~1.5 typical)
  float  thinFilmInsideIoR;   // Substrate IoR

  // ---- RT-only: Subsurface Scattering (ignored by raster RDX_BRDF) ----
  float  enableSSS;                  // 0 = off, > 0 = on
  float3 sssAttenuationCoefficient;  // Absorption per unit distance
  float  sssMeasurementDistance;     // Nominal slab thickness
  float3 sssSingleScatterAlbedo;     // Scattering albedo
  float  sssVolumetricAnisotropy;    // HG phase g [-1, 1]
  float  sssNegNdotL;               // dot(-N, L) for back-face transmission

  // ---- RT-only: VNDF options ----
  float  useBoundedVNDF;  // 0 = standard VNDF, > 0 = Eto 2023 bounded
};

struct RDX_BRDFResult {
  float3 diffuse;    // Diffuse radiance  (NdotL pre-applied, pre-c₂)
  float3 specular;   // Specular radiance (NdotL pre-applied, pre-c₂)
  float3 combined;   // (diffuse + specular) × c₂
};

// -- 3.10b.  Default Parameter Factory ----------------------------------------
//
// Returns an RDX_BRDFParams with sensible defaults for all fields.
// The caller MUST set N, V, L, albedo, roughness, and metallic at minimum.
//
RDX_BRDFParams RDX_DefaultParams()
{
  RDX_BRDFParams p;

  // Geometry — placeholders, must be overwritten
  p.N = float3(0, 0, 1);
  p.V = float3(0, 0, 1);
  p.L = float3(0, 0, 1);
  p.T = float3(1, 0, 0);
  p.B = float3(0, 1, 0);

  // Material
  p.albedo     = float3(0.5, 0.5, 0.5);
  p.roughness  = 0.5;
  p.metallic   = 0.0;
  p.anisotropy = 0.0;
  p.opacity    = 1.0;

  // F0 override
  p.useCustomF0 = 0.0;
  p.customF0    = float3(0.04, 0.04, 0.04);

  // Callisto Base
  p.rho_f = 1.0;
  p.rho_r = 1.0;
  p.n_f   = 0.75;
  p.n_r   = 0.75;
  p.o     = 0.0;

  // Callisto Advanced
  p.n_s                    = 0.5;
  p.dualSpecRoughnessScale = 2.0;
  p.dualSpecOpacity        = 1.0;

  // Callisto Full
  p.m_f = 0.75;
  p.m_r = 0.75;
  p.p   = 0.5;

  // Thin Film
  p.enableThinFilm     = 0.0;
  p.thinFilmThickness  = 400.0;
  p.thinFilmOutsideIoR = 1.0;
  p.thinFilmLayerIoR   = 1.5;
  p.thinFilmInsideIoR  = 1.0;

  // RT: SSS
  p.enableSSS                 = 0.0;
  p.sssAttenuationCoefficient = float3(1, 1, 1);
  p.sssMeasurementDistance    = 0.1;
  p.sssSingleScatterAlbedo   = float3(0.8, 0.8, 0.8);
  p.sssVolumetricAnisotropy  = 0.0;
  p.sssNegNdotL              = 0.0;

  // RT: VNDF
  p.useBoundedVNDF = 0.0;

  return p;
}

// -- 3.10c.  RDX BRDF Evaluation (full) --------------------------------------

RDX_BRDFResult RDX_BRDF(RDX_BRDFParams params)
{
  // ---- Dot products -------------------------------------------------------
  float3 H     = normalize(params.V + params.L);
  float  NdotL = dot(params.N, params.L);
  float  NdotV = max(dot(params.N, params.V), 1e-5);
  float  NdotH = saturate(dot(params.N, H));
  float  VdotH = saturate(dot(params.V, H));
  float  VdotL = dot(params.V, params.L);

  float sNdotL     = max(NdotL, 0.0);
  float sNdotLSpec = max(sNdotL, 1e-5);

  // ---- Material derivation ------------------------------------------------
  float3 F0;
  if (params.useCustomF0 > 0.0)
    F0 = params.customF0;
  else
    F0 = CalcBaseReflectivity(params.albedo, params.metallic, params.opacity);

  float3 adjustedAlbedo = AlbedoToAdjustedAlbedo(
      params.albedo, params.metallic, params.opacity);

  // ---- Roughness ----------------------------------------------------------
  float  isoRoughness;     // linear α  = perceptual²
  float2 anisoRoughness;   // (αx, αy)
  CalcRoughness(params.roughness, params.anisotropy,
                isoRoughness, anisoRoughness);

  // ---- Callisto framework -------------------------------------------------
  float c2 = CallistoSmoothTerminator(NdotL, VdotH, NdotH, params.o, params.p);
  float c1 = CallistoDiffuseC1(
      VdotH, NdotH,
      params.rho_f, params.n_f, params.m_f,
      params.rho_r, params.n_r, params.m_r);

  // ---- Diffuse: Hammon + Proxima (NdotL pre-applied) ----------------------
  // HammonProximaDiffuse expects perceptual roughness.
  float3 diffuse = HammonProximaDiffuse(
      sNdotL, NdotV, NdotH, VdotH, VdotL,
      params.roughness, adjustedAlbedo);

  // ---- Fresnel: Callisto Schlick or thin film iridescence -----------------
  float3 F_spec;
  if (params.enableThinFilm > 0.0) {
    F_spec = ThinFilmFresnel(
        params.thinFilmOutsideIoR, params.thinFilmLayerIoR,
        params.thinFilmInsideIoR,  params.thinFilmThickness, VdotH);
  } else {
    F_spec = CallistoSpecularFresnel(F0, VdotH, params.n_s);
  }

  // ---- Specular: dual-lobe (isotropic or anisotropic) ---------------------
  float3 spec1, spec2;

  // Secondary-lobe perceptual roughness (for multi-scatter + alpha)
  float percRough2 = saturate(params.roughness * params.dualSpecRoughnessScale);

  if (abs(params.anisotropy) > 1e-4) {
    // Tangent-frame dot products
    float TdotH = dot(params.T, H);
    float BdotH = dot(params.B, H);
    float TdotV = dot(params.T, params.V);
    float BdotV = dot(params.B, params.V);
    float TdotL = dot(params.T, params.L);
    float BdotL = dot(params.B, params.L);

    // Primary lobe
    float  D1 = GGX_NDF_Anisotropic(anisoRoughness, TdotH, BdotH, NdotH);
    float  V1 = SmithGGX_Visibility_Anisotropic(
                    anisoRoughness,
                    TdotV, BdotV, NdotV, TdotL, BdotL, sNdotLSpec);
    spec1 = D1 * V1 * F_spec;

    // Secondary lobe
    float  alpha2 = percRough2 * percRough2;
    float2 anisoR2 = IsotropicToAnisotropicRoughness(alpha2, params.anisotropy);
    anisoR2 = max(anisoR2, float2(1e-4, 1e-4));
    float  D2 = GGX_NDF_Anisotropic(anisoR2, TdotH, BdotH, NdotH);
    float  V2 = SmithGGX_Visibility_Anisotropic(
                    anisoR2,
                    TdotV, BdotV, NdotV, TdotL, BdotL, sNdotLSpec);
    spec2 = D2 * V2 * F_spec;
  } else {
    // Primary lobe (isotropic)
    float alpha1 = max(isoRoughness, 5e-5);
    float  D1 = GGX_NDF(NdotH, alpha1);
    float  V1 = SmithGGX_Visibility(NdotV, sNdotLSpec, alpha1);
    spec1 = D1 * V1 * F_spec;

    // Secondary lobe
    float alpha2 = max(percRough2 * percRough2, 5e-5);
    float  D2 = GGX_NDF(NdotH, alpha2);
    float  V2 = SmithGGX_Visibility(NdotV, sNdotLSpec, alpha2);
    spec2 = D2 * V2 * F_spec;
  }

  // ---- Multi-scatter compensation (perceptual roughness) ------------------
  spec1 *= MultiScatterCompensation(NdotV, sNdotLSpec, params.roughness, F0);
  spec2 *= MultiScatterCompensation(NdotV, sNdotLSpec, percRough2, F0);

  float3 specular = spec1 + spec2 * params.dualSpecOpacity;

  // ---- Compose ------------------------------------------------------------
  RDX_BRDFResult result;
  result.diffuse  = c1 * diffuse;
  result.specular = specular * sNdotL;
  result.combined = (result.diffuse + result.specular) * c2;

  return result;
}

// -- 3.10d.  RDX BRDF Convenience Overload ------------------------------------
//
// Minimal one-line replacement for a game's existing BRDF:
//   float3 color = RDX_BRDF(N, V, L, albedo, roughness, metallic);
//
// Uses default Callisto parameters, no anisotropy, no thin film.
// Multiply the return value by lightColor × lightIntensity.
//
float3 RDX_BRDF(
    float3 N, float3 V, float3 L,
    float3 albedo, float roughness, float metallic)
{
  RDX_BRDFParams p = RDX_DefaultParams();
  p.N = N;  p.V = V;  p.L = L;
  p.albedo    = albedo;
  p.roughness = roughness;
  p.metallic  = metallic;

  return RDX_BRDF(p).combined;
}

// ============================================================================
// 3.11  Diffraction on Rough Surfaces
// ----------------------------------------------------------------------------
// Reference: "A Practical Real-Time Model for Diffraction on Rough Surfaces"
//            Werner et al., JCGT Vol. 13, No. 1, 2024
//            https://jcgt.org/published/0013/01/01/
//
// Wave-optics phenomena have a significant impact on the appearance of rough
// conductive surfaces even under partially coherent lighting.  Standard
// Cook-Torrance GGX ignores wave interference entirely, making metallic
// surfaces look "plasticky".  This model adds two effects on top of the
// existing specular term at minimal cost:
//
//   • Spectral shift — angle-dependent colour fringing caused by diffraction.
//     The reflected highlight tints toward red or blue depending on the
//     microfacet angle θ_m = acos(dot(N, H)).  Governed by per-material
//     parameters (w, h) fitted from measured data (Clausen et al. 2023).
//
//   • Speckle pattern — coherent interference between wavelets reflecting
//     off different microfacets creates a granular noise overlay on the
//     specular highlight.  Generated with 4D simplex noise parameterised
//     by UV position and polar-encoded half vector, then shaped by a
//     Cholesky-decomposed covariance matrix that encodes the statistical
//     distribution of the interference pattern.
//
// The result is a float3 modifier that multiplies the standard specular:
//   finalSpecular = standardSpecular * (shift + speckle)
//
// Cost:  shift only ≈ 1 cosine per channel (nearly free)
//        full model ≈ +3 simplex-noise evaluations (~0.1 ms at 1080p)
//
// Most visible on:
//   • Brushed / machined metals (steel, aluminium, titanium)
//   • Rough conductors under point / directional lights
//   • Any metallic surface viewed at grazing angles
//
// VR-specific features (paper §5.4):
//   • Highlight disparity parameter H — offsets the speckle between left
//     and right eye for correct binocular depth perception of glints.
//   • Built-in minification anti-aliasing via ddx/ddy (paper §5.3).
//
// Sub-sections
//   11a  DiffractionParams struct + factory presets
//   11b  Spectral shift function
//   11c  Covariance model
//   11d  Cartesian-to-polar conversion
//   11e  3D simplex noise (Gustavson)
//   11f  Speckle noise sampling with minification
//   11g  Combined diffraction modifier
//   11h  Shift-only fast path (no speckle)
// ============================================================================

// ---------------------------------------------------------------------------
// 3.11a  Diffraction Material Parameters
// ---------------------------------------------------------------------------
// Material-specific constants that control the diffraction appearance.
// Ideally measured from real surfaces (macro photography + covariance
// analysis) but can also be interpolated from GGX roughness α.
//
// See the paper §5.1 for detailed descriptions of each parameter.
// ---------------------------------------------------------------------------
struct DiffractionParams
{
  // Surface roughness α (GGX alpha, NOT perceptual roughness).
  float alpha;

  // Spectral shift parameters (from Clausen et al. 2023 fitting).
  //   w: x-axis scaling of the shift cosine.  Larger → smoother surface.
  //      Rough (α≈0.39): w = 2.3394    Smooth (α≈0.14): w = 6.4455
  //   h: y-axis tilt of the shift.  Controls red/blue fringing strength.
  //      Rough (α≈0.39): h = 0.001025  Smooth (α≈0.14): h = 0.00077
  float w;
  float h;

  // RGB shift factors for the spectral shift function.
  // Encode wavelength-dependent shift magnitude per channel.
  // (r_s, g_s, b_s): scattering shift factors
  // (r_I, g_I, b_I): intensity shift factors
  // Pre-fitted from measured data — constant per colour space.
  float3 shiftScatter;   // (r_s, g_s, b_s)
  float3 shiftIntensity; // (r_I, g_I, b_I)

  // Initial covariance matrix (Cholesky-decomposed, 3×3).
  // Controls the statistical shape of the speckle pattern:
  //   • Elongation (brushed vs isotropic)
  //   • Orientation (brush direction)
  //   • Correlation between colour channels
  // Measured from macro photography or simulated.
  // For isotropic rough metal use identity × scale.
  float3x3 covInit;

  // UV scaling factors for speckle spatial frequency.
  // Control the physical size of individual speckles.
  // Larger → smaller speckles.  Recommended: target ~1 mm speckle size.
  float2 uvScale;  // (S_x, S_y)

  // Pattern shift factor M.
  // Scales polar-angle differences between half vector and normal
  // to create view/light-dependent pattern variation.
  // Default: 7.0
  float patternShift;

  // Convergence threshold T for minification.
  // When this many speckles fall within a pixel the pattern converges
  // to just the shift value (no noise).  Should equal multisampling rate.
  // Default: 7.0
  float convergenceThreshold;

  // Highlight disparity H for VR (offset between left/right eye).
  // 0 = disabled, 0.5 = recommended for comfortable stereo glints.
  // Ignored for non-VR rendering.
  float highlightDisparity;

  // Amplitude reduction falloff A_R_F.
  // Controls how quickly speckle amplitude diminishes during
  // minification.  Paper default: 1.0  (Listing 2).
  float amplitudeReductionFalloff;
};

// ---------------------------------------------------------------------------
// Factory: rough metal defaults (α ≈ 0.39, brushed steel-like)
// ---------------------------------------------------------------------------
DiffractionParams DiffractionParamsRoughMetal()
{
  DiffractionParams p;
  p.alpha = 0.3922;
  p.w     = 2.3394;
  p.h     = 0.001025;

  // Default RGB shift factors (fitted to sRGB primaries).
  p.shiftScatter   = float3(1.0, 0.88, 0.76);
  p.shiftIntensity = float3(0.95, 1.0, 1.05);

  // Isotropic covariance (identity × scale) — no preferred brush direction.
  p.covInit = float3x3(
    0.5, 0.0, 0.0,
    0.0, 0.5, 0.0,
    0.0, 0.0, 0.5
  );

  p.uvScale                   = float2(500.0, 500.0);
  p.patternShift              = 7.0;
  p.convergenceThreshold      = 7.0;
  p.highlightDisparity        = 0.0;
  p.amplitudeReductionFalloff = 1.0;
  return p;
}

// ---------------------------------------------------------------------------
// Factory: smooth metal defaults (α ≈ 0.14, polished aluminium-like)
// ---------------------------------------------------------------------------
DiffractionParams DiffractionParamsSmoothMetal()
{
  DiffractionParams p;
  p.alpha = 0.14033;
  p.w     = 6.4455;
  p.h     = 0.00077;

  p.shiftScatter   = float3(1.0, 0.88, 0.76);
  p.shiftIntensity = float3(0.95, 1.0, 1.05);

  p.covInit = float3x3(
    0.3, 0.0, 0.0,
    0.0, 0.3, 0.0,
    0.0, 0.0, 0.3
  );

  p.uvScale                   = float2(800.0, 800.0);
  p.patternShift              = 7.0;
  p.convergenceThreshold      = 7.0;
  p.highlightDisparity        = 0.0;
  p.amplitudeReductionFalloff = 1.0;
  return p;
}

// ---------------------------------------------------------------------------
// Factory: interpolate parameters from roughness (no measured data)
// ---------------------------------------------------------------------------
// When material-specific measurements aren't available, linearly
// interpolate between the rough and smooth presets based on α.
// This is an approximation but produces plausible results.
//
// Parameters:
//   alpha – GGX roughness α (linear, NOT perceptual)
//
// Returns: interpolated DiffractionParams.
// ---------------------------------------------------------------------------
DiffractionParams DiffractionParamsFromRoughness(float alpha)
{
  DiffractionParams rough  = DiffractionParamsRoughMetal();
  DiffractionParams smooth = DiffractionParamsSmoothMetal();

  // Interpolation factor: 0 at α=0.3922 (rough), 1 at α=0.14033 (smooth).
  float t = saturate((0.3922 - alpha) / (0.3922 - 0.14033));

  DiffractionParams p;
  p.alpha = alpha;
  p.w     = lerp(rough.w, smooth.w, t);
  p.h     = lerp(rough.h, smooth.h, t);

  p.shiftScatter   = lerp(rough.shiftScatter,   smooth.shiftScatter,   t);
  p.shiftIntensity = lerp(rough.shiftIntensity, smooth.shiftIntensity, t);

  // Interpolate covariance diagonal (simplified — assumes isotropic).
  float covScale = lerp(0.5, 0.3, t);
  p.covInit = float3x3(
    covScale, 0.0, 0.0,
    0.0, covScale, 0.0,
    0.0, 0.0, covScale
  );

  p.uvScale                   = lerp(rough.uvScale, smooth.uvScale, t);
  p.patternShift              = 7.0;
  p.convergenceThreshold      = 7.0;
  p.highlightDisparity        = 0.0;
  p.amplitudeReductionFalloff = 1.0;
  return p;
}

// ---------------------------------------------------------------------------
// 3.11b  Spectral Shift Function
// ---------------------------------------------------------------------------
// Computes the wavelength-dependent spectral shift per RGB channel.
//
// This is the core of the diffraction colour effect — it shifts the
// reflected spectrum based on the microfacet angle θ_m (angle between
// the half vector and the surface normal).
//
// The shift function (from Clausen et al. 2023):
//   shift_c = shiftScatter_c × cos(w × θ_m) × h + shiftIntensity_c
//
// At normal incidence (θ_m ≈ 0): shift ≈ shiftScatter × h + shiftIntensity
// At grazing (θ_m → π/2): shift oscillates, producing colour fringing.
//
// Parameters:
//   thetaM – microfacet angle = acos(saturate(dot(N, H)))
//   params – DiffractionParams
//
// Returns: float3 RGB shift factor.  Multiply with (F × D × G).
// ---------------------------------------------------------------------------
float3 DiffractionShift(float thetaM, DiffractionParams params)
{
  float cosWT = cos(params.w * thetaM);
  return params.shiftScatter * cosWT * params.h + params.shiftIntensity;
}

// ---------------------------------------------------------------------------
// 3.11c  Covariance Model
// ---------------------------------------------------------------------------
// Computes a scaling factor for the covariance matrix based on the
// microfacet angle and the w parameter.
//
// As θ_m increases the effective roughness changes, modifying the
// speckle pattern distribution.  This scaling ensures the noise
// covariance matches the expected statistical properties at each angle.
//
// Parameters:
//   thetaM – microfacet angle
//   w      – shift function w parameter
//
// Returns: scalar covariance scaling factor.  Apply as:
//          covDecomp = sqrt(covFactor) × covInit
// ---------------------------------------------------------------------------
float DiffractionCovarianceFactor(float thetaM, float w)
{
  // The covariance scales with the cosine of the shift — when the shift
  // is large the speckle pattern spreads; when small it contracts.
  // This approximation is from the paper's Equation (12).
  float cosWT = cos(w * thetaM);
  return max(0.0, 1.0 - cosWT * cosWT);
}

// ---------------------------------------------------------------------------
// 3.11d  Cartesian to Polar Conversion
// ---------------------------------------------------------------------------
// Converts a 3D direction vector to polar (azimuth, elevation, radius).
// Used to compute the 4D noise lookup coordinates from the half vector
// and surface normal (paper §5.2).
//
// Returns: float3(azimuth, elevation, radius)
//   azimuth   ∈ [−π, π]
//   elevation ∈ [−π/2, π/2]
//   radius    = length of input (typically 1 for normalised vectors)
// ---------------------------------------------------------------------------
float3 DiffractionCartesian2Polar(float3 v)
{
  float r   = length(v);
  float azi = atan2(v.y, v.x);
  float ele = asin(clamp(v.z / max(r, 1e-7), -1.0, 1.0));
  return float3(azi, ele, r);
}

// ---------------------------------------------------------------------------
// 3.11e  3D Simplex Noise (Gustavson)
// ---------------------------------------------------------------------------
// Standard 3D simplex noise implementation for the speckle pattern.
// Based on Stefan Gustavson's webgl-noise:
//   https://github.com/stegu/webgl-noise
//
// The paper uses 4D simplex noise (2D UV + 2D polar H).  We implement
// this as 3D simplex noise with the polar coordinates folded into the
// third dimension, which is the approach suggested in the paper's
// implementation notes.
//
// Returns: float in [−1, 1].
// ---------------------------------------------------------------------------

// Internal helpers — permutation polynomial (mod 289).
float3 _diffraction_permute3(float3 x) {
  return fmod((x * 34.0 + 1.0) * x, 289.0);
}
float4 _diffraction_permute4(float4 x) {
  return fmod((x * 34.0 + 1.0) * x, 289.0);
}
float4 _diffraction_taylorInvSqrt(float4 r) {
  return 1.79284291400159 - 0.85373472095314 * r;
}

float DiffractionSimplexNoise3D(float3 v)
{
  static const float2 C = float2(1.0 / 6.0, 1.0 / 3.0);

  // First corner.
  float3 i  = floor(v + dot(v, C.yyy));
  float3 x0 = v - i + dot(i, C.xxx);

  // Other corners.
  float3 g  = step(x0.yzx, x0.xyz);
  float3 l  = 1.0 - g;
  float3 i1 = min(g, l.zxy);
  float3 i2 = max(g, l.zxy);

  float3 x1 = x0 - i1 + C.xxx;
  float3 x2 = x0 - i2 + C.yyy;
  float3 x3 = x0 - 0.5;

  // Permutations.
  i = fmod(i, 289.0);
  float4 p = _diffraction_permute4(
    _diffraction_permute4(
      _diffraction_permute4(
        i.z + float4(0.0, i1.z, i2.z, 1.0))
      + i.y + float4(0.0, i1.y, i2.y, 1.0))
    + i.x + float4(0.0, i1.x, i2.x, 1.0));

  // Gradients: 7×7 grid mapped to sphere.
  float4 j  = p - 49.0 * floor(p / 49.0);
  float4 x_ = floor(j / 7.0);
  float4 y_ = floor(j - 7.0 * x_);
  float4 gx = x_ / 7.0 + 1.0 / 14.0 - 0.5;
  float4 gy = y_ / 7.0 + 1.0 / 14.0 - 0.5;
  float4 gz = 1.0 - abs(gx) - abs(gy);
  float4 b0 = float4(gx.xy, gy.xy);
  float4 b1 = float4(gx.zw, gy.zw);

  float4 s0 = floor(b0) * 2.0 + 1.0;
  float4 s1 = floor(b1) * 2.0 + 1.0;
  float4 sh = -step(gz, 0.0);

  float4 a0 = b0.xzyw + s0.xzyw * sh.xxyy;
  float4 a1 = b1.xzyw + s1.xzyw * sh.zzww;

  float3 g0 = float3(a0.xy, gz.x);
  float3 g1 = float3(a0.zw, gz.y);
  float3 g2 = float3(a1.xy, gz.z);
  float3 g3 = float3(a1.zw, gz.w);

  // Normalise.
  float4 norm = _diffraction_taylorInvSqrt(float4(
      dot(g0, g0), dot(g1, g1), dot(g2, g2), dot(g3, g3)));
  g0 *= norm.x;  g1 *= norm.y;  g2 *= norm.z;  g3 *= norm.w;

  // Mix contributions.
  float4 m = max(0.6 - float4(dot(x0, x0), dot(x1, x1),
                               dot(x2, x2), dot(x3, x3)), 0.0);
  m = m * m;
  return 42.0 * dot(m * m, float4(dot(g0, x0), dot(g1, x1),
                                   dot(g2, x2), dot(g3, x3)));
}

// ---------------------------------------------------------------------------
// 3.11f  Speckle Noise Sampling with Minification Anti-Aliasing
// ---------------------------------------------------------------------------
// Samples the diffraction speckle pattern with distance-aware amplitude
// reduction and optional multisampling for anti-aliasing.
//
// Implements the paper's Listing 2 (SampleNoise function).
//
// Parameters:
//   uv      – surface UV coordinates (pre-scaled by params.uvScale)
//   halfVec – half vector  H = normalize(L + V)
//   normal  – surface normal N
//   params  – DiffractionParams
//
// Returns: float3 RGB noise value (mean ≈ 0, to be added to the shift).
//          Covariance transform is already applied.
// ---------------------------------------------------------------------------
float3 DiffractionSpeckle(
    float2 uv,
    float3 halfVec,
    float3 normal,
    DiffractionParams params)
{
  static const float UV_TO_SPECKLE_FACTOR = 0.5;

  float2 scaledUV = uv * params.uvScale;

  // Screen-space derivative for minification detection.
  float2 duvdx = ddx(scaledUV);
  float2 duvdy = ddy(scaledUV);
  float  delta_uv = max(length(duvdx), length(duvdy));

  // How many speckles fit within one pixel.
  float sqrt_speckles_per_pixel = delta_uv / UV_TO_SPECKLE_FACTOR;

  // Amplitude reduction: fade speckle as multiple fall within pixel.
  float A_R_F = params.amplitudeReductionFalloff;
  float amplitude_modulation =
      1.0 - min(max(sqrt_speckles_per_pixel - 1.0, 0.0) / A_R_F, 1.0);

  // Polar encoding of half vector and normal for pattern variation.
  float3 h_polar = DiffractionCartesian2Polar(halfVec);
  float3 n_polar = DiffractionCartesian2Polar(normal);
  float  h_a     = (h_polar.x - n_polar.x) * params.patternShift;
  float  h_p     = (h_polar.y - n_polar.y) * params.patternShift;

  // Sample noise — three evaluations for RGB channels with offset.
  float3 filtered_noise = float3(0.0, 0.0, 0.0);

  if (sqrt_speckles_per_pixel <= 1.0) {
    // Full speckle — one sample per channel with slight offset
    // to decorrelate the per-channel patterns.
    filtered_noise.r = DiffractionSimplexNoise3D(float3(scaledUV, h_a));
    filtered_noise.g = DiffractionSimplexNoise3D(float3(scaledUV + 17.3, h_a + 7.1));
    filtered_noise.b = DiffractionSimplexNoise3D(float3(scaledUV + 31.7, h_p));
  }
  else if (sqrt_speckles_per_pixel <= (1.0 + A_R_F)) {
    // Transition zone — multisample for anti-aliasing.
    // Average multiple noise samples within the pixel footprint.
    static const int   MS_COUNT = 4;
    static const float2 MS_OFFSETS[4] = {
      float2(-0.25, -0.25), float2( 0.25, -0.25),
      float2(-0.25,  0.25), float2( 0.25,  0.25)
    };

    float3 accum = float3(0.0, 0.0, 0.0);
    [unroll]
    for (int s = 0; s < MS_COUNT; s++) {
      float2 sampleUV = scaledUV + MS_OFFSETS[s] * delta_uv;
      accum.r += DiffractionSimplexNoise3D(float3(sampleUV, h_a));
      accum.g += DiffractionSimplexNoise3D(float3(sampleUV + 17.3, h_a + 7.1));
      accum.b += DiffractionSimplexNoise3D(float3(sampleUV + 31.7, h_p));
    }
    filtered_noise = accum / (float)MS_COUNT;
  }
  // else: converged — filtered_noise stays zero, only shift remains.

  // Apply covariance transform.
  float thetaM    = acos(saturate(dot(normal, halfVec)));
  float covFactor = DiffractionCovarianceFactor(thetaM, params.w);
  float3x3 covDecomp = sqrt(max(covFactor, 0.0)) * params.covInit;
  filtered_noise = mul(covDecomp, filtered_noise);

  return amplitude_modulation * filtered_noise;
}

// ---------------------------------------------------------------------------
// 3.11g  Combined Diffraction BRDF Modifier
// ---------------------------------------------------------------------------
// Computes the complete diffraction modifier (shift + speckle) that
// multiplies the standard Cook-Torrance specular term.
//
// Usage:
//   float3 standardSpec = F * D * G / (4 * NdotL * NdotV);
//   float3 diffMod      = DiffractionModifier(uv, H, N, params);
//   float3 finalSpec    = standardSpec * diffMod;
//
// Parameters:
//   uv      – surface UV coordinates
//   halfVec – half vector  H = normalize(L + V)
//   normal  – surface normal N
//   params  – DiffractionParams
//
// Returns: float3 RGB modifier to multiply into specular.
//          Values near 1.0 with subtle colour variation.
// ---------------------------------------------------------------------------
float3 DiffractionModifier(
    float2 uv,
    float3 halfVec,
    float3 normal,
    DiffractionParams params)
{
  float thetaM = acos(saturate(dot(normal, halfVec)));

  float3 shift   = DiffractionShift(thetaM, params);
  float3 speckle = DiffractionSpeckle(uv, halfVec, normal, params);

  return shift + speckle;
}

// ---------------------------------------------------------------------------
// 3.11h  Shift-Only Fast Path (No Speckle)
// ---------------------------------------------------------------------------
// When only the spectral colour shift is desired (no speckle noise)
// this provides the diffraction effect at near-zero cost.
//
// Suitable for:
//   • Distant metallic objects (speckle is sub-pixel anyway)
//   • Performance-constrained scenarios
//   • Subtle material differentiation without noise
//
// Parameters:
//   NdotH     – saturate(dot(N, H))
//   roughness – GGX alpha (linear roughness)
//
// Returns: float3 RGB shift modifier to multiply into specular.
// ---------------------------------------------------------------------------
float3 DiffractionShiftOnly(float NdotH, float roughness)
{
  DiffractionParams params = DiffractionParamsFromRoughness(roughness);
  float thetaM = acos(NdotH);
  return DiffractionShift(thetaM, params);
}

// ############################################################################
//
//   PART IV — RAY TRACING / PATH TRACING BRDF
//
//   Functions in this section require stochastic ray generation or Monte
//   Carlo integration.  They are NOT usable in standard rasterisation
//   pipelines — only in ray tracing / path tracing renderers.
//
//   Ported from NVIDIA RTX Remix (MIT license), adapted to fp32 HLSL.
//
// ############################################################################

// ============================================================================
// 4.1  Standalone GGX Shadowing (G1) — Smith Anisotropic
// ----------------------------------------------------------------------------
// The single-direction GGX shadowing function, used as a building block for:
//   • VNDF evaluation  (D_v = G1 * max(VdotH,0) * D / NdotV)
//   • VNDF PDF         (pdf = D_v / (4 * VdotH))
//
// This differs from the *combined* height-correlated G2/(4·NdotV·NdotL)
// visibility in section 3.7b which is designed for rasterisation-side
// specular evaluation.
//
// [Heitz 2014, "Understanding the Masking-Shadowing Function in Microfacet
//  Based BRDFs"]
//
// Augmented with a lower-bound scaling factor `k` for bounded VNDF sampling
// [Eto 2023, "Bounded VNDF Sampling for Smith-GGX Reflections"]
//
// Parameters:
//   anisotropicRoughness  – float2(alphaX, alphaY)
//   tangentDotDir         – dot(tangent, direction)
//   bitangentDotDir       – dot(bitangent, direction)
//   normalDotDir          – dot(normal, direction)
//   k                     – bounded VNDF scalar (1.0 = standard, no bound)
//
// Returns: G1(direction) — unitless fraction in [0, 2].
// ============================================================================

float GGX_Shadowing_G1(
    float2 anisotropicRoughness,
    float  tangentDotDir,
    float  bitangentDotDir,
    float  normalDotDir,
    float  k = 1.0)
{
  float3 denominatorVector = float3(
      normalDotDir,
      anisotropicRoughness.x * tangentDotDir,
      anisotropicRoughness.y * bitangentDotDir);
  float sqrtDenominator = length(denominatorVector);

  // Bounded VNDF lower-bound logic [Eto 2023, Listing 2]:
  // When k=1 (default), b = normalDotDir and function reduces to standard G1.
  float b = (normalDotDir > 0.0) ? (k * normalDotDir) : normalDotDir;

  return ::renodx::math::DivideSafe(
      2.0 * normalDotDir,
      b + sqrtDenominator,
      5e-5);
}

// ============================================================================
// 4.2  Bounded VNDF Lower-Bound Scalar
// ----------------------------------------------------------------------------
// Computes the scaling parameter `k` used to tighten the bounding hemisphere
// for bounded VNDF sampling.  Reduces wasted samples at grazing angles.
//
// [Eto 2023, "Bounded VNDF Sampling for Smith-GGX Reflections", Listing 1]
//
// NOTE: RTX Remix's exact implementation of calcBoundedVNDFLowerBoundScalar
// resides outside brdf.slangh
// This implementation is derived from the Eto 2023 paper itself and produces
// the correct qualitative behaviour (k = 1 at normal incidence, k < 1 at
// grazing), but the precise formula may differ from Remix's version.
//
// Parameters:
//   anisotropicRoughness – float2(alphaX, alphaY)
//   viewTS               – view direction in tangent space (t, b, n)
//
// Returns: scalar k ∈ (0,1] for use in G1 / VNDF PDF.
// ============================================================================

float BoundedVNDF_LowerBoundScalar(
    float2 anisotropicRoughness,
    float3 viewTS)
{
  // Stretch the view into the roughness-scaled ellipsoid space
  float3 stretched = float3(
      anisotropicRoughness.x * viewTS.x,
      anisotropicRoughness.y * viewTS.y,
      viewTS.z);
  float lenSq = dot(stretched, stretched);
  float len   = sqrt(lenSq);

  // k = 2·viewTS.z / (len + viewTS.z)
  // Gives k ≈ 1 at normal incidence, k < 1 at grazing angles.
  float a = len + viewTS.z;
  return ::renodx::math::DivideSafe(2.0 * viewTS.z, a, 1.0);
}

// ============================================================================
// 4.3  GGX Visible Normal Distribution (D_v)
// ----------------------------------------------------------------------------
// Evaluates the VNDF — the microfacet normal distribution *visible* from the
// output (view) direction.  This is the ideal importance-sampling distribution
// for GGX specular in a path tracer.
//
// D_v(h) = G1(v) · max(VdotH, 0) · D(h) / NdotV
//
// [Heitz 2014, "Importance Sampling Microfacet-Based BSDFs Using the
//  Distribution of Visible Normals"]
//
// Parameters:
//   anisotropicRoughness – float2(alphaX, alphaY)
//   TdotV, BdotV, NdotV – tangent-frame dot products with view direction
//   TdotH, BdotH, NdotH – tangent-frame dot products with half-vector
//   VdotH                – dot(view, halfVec)
//   k                    – bounded VNDF scalar (default 1.0)
//
// Returns:  D_v(h) — probability density per steradian on the hemisphere.
// ============================================================================

float GGX_VisibleNormalDistribution(
    float2 anisotropicRoughness,
    float  TdotV, float BdotV, float NdotV,
    float  TdotH, float BdotH, float NdotH,
    float  VdotH,
    float  k = 1.0)
{
  // G1 * max(VdotH, 0)
  float g1 = GGX_Shadowing_G1(anisotropicRoughness,
      TdotV, BdotV, NdotV, k);

  // Anisotropic GGX NDF — reuses §3.7a pattern but inlined for precision
  float axay = anisotropicRoughness.x * anisotropicRoughness.y;
  float3 dVec = float3(anisotropicRoughness.y * TdotH,
                        anisotropicRoughness.x * BdotH,
                        axay * NdotH);
  float dDot = dot(dVec, dVec);
  float body = ::renodx::math::DivideSafe(axay, dDot, 1e-30);
  float D = (1.0 / 3.14159265) * axay * body * body;

  float numerator = g1 * max(0.0, VdotH) * D;
  return ::renodx::math::DivideSafe(numerator, NdotV, 5e-5);
}

// ============================================================================
// 4.4  VNDF Reflection PDF
// ----------------------------------------------------------------------------
// Computes the probability density of sampling a reflected direction via VNDF
// importance sampling of GGX microfacets.
//
// pdf = D_v(h) / (4 · VdotH)
//
// This is the correct PDF for Monte Carlo weighting when the *half-vector*
// is sampled from the VNDF and then reflected to obtain the light direction.
//
// [Heitz 2014, "Importance Sampling Microfacet-Based BSDFs Using the
//  Distribution of Visible Normals"]
//
// Parameters:  same as GGX_VisibleNormalDistribution, plus optional k.
//
// Returns:  PDF value (probability per steradian in reflected-direction space).
// ============================================================================

float GGX_VNDF_ReflectionPdf(
    float2 anisotropicRoughness,
    float  TdotV, float BdotV, float NdotV,
    float  TdotH, float BdotH, float NdotH,
    float  VdotH,
    float  k = 1.0)
{
  float Dv = GGX_VisibleNormalDistribution(
      anisotropicRoughness,
      TdotV, BdotV, NdotV,
      TdotH, BdotH, NdotH,
      VdotH, k);

  return ::renodx::math::DivideSafe(Dv, 4.0 * VdotH, 5e-5);
}

// ============================================================================
// 4.5  Bounded VNDF Reflection PDF
// ----------------------------------------------------------------------------
// Same as §4.4 but automatically computes k from the view direction in
// tangent space for bounded VNDF sampling.
//
// [Eto 2023, "Bounded VNDF Sampling for Smith-GGX Reflections"]
//
// Parameters:
//   anisotropicRoughness – float2(alphaX, alphaY)
//   TdotV, BdotV, NdotV – tangent-frame view dots
//   TdotH, BdotH, NdotH – tangent-frame half-vector dots
//   VdotH                – dot(view, halfVec)
//
// Returns:  PDF value for bounded VNDF sampling.
// ============================================================================

float GGX_BoundedVNDF_ReflectionPdf(
    float2 anisotropicRoughness,
    float  TdotV, float BdotV, float NdotV,
    float  TdotH, float BdotH, float NdotH,
    float  VdotH)
{
  float k = BoundedVNDF_LowerBoundScalar(
      anisotropicRoughness,
      float3(TdotV, BdotV, NdotV));

  return GGX_VNDF_ReflectionPdf(
      anisotropicRoughness,
      TdotV, BdotV, NdotV,
      TdotH, BdotH, NdotH,
      VdotH, k);
}

// ============================================================================
// 4.6  Hanrahan Single-Scattering Diffuse Transmission
// ----------------------------------------------------------------------------
// First-order forward-scattering approximation for thin opaque surfaces.
// Models diffuse light transmission through a single virtual volume layer
// using Beer-Lambert attenuation and the Henyey-Greenstein phase function.
//
// Useful for thin translucent materials (skin, leaves, paper, wax) in a
// path tracer where rays can exit the opposite side of a thin surface.
//
// NOT usable in rasterization — requires knowledge of the transmitted ray
// direction, per-surface attenuation distance, and stochastic evaluation.
//
// [P. Hanrahan 1993, "Reflection from Layered Surfaces due to Subsurface
//  Scattering", Chapter 5.1]
//
// Parameters:
//   baseReflectivity       – F0 (Fresnel at normal incidence, RGB)
//   attenuationCoefficient – absorption per unit distance (RGB)
//   measurementDistance     – nominal thickness for attenuation (scalar)
//   singleScatterAlbedo    – scattering albedo of the volume (RGB)
//   volumetricAnisotropy   – Henyey-Greenstein g parameter [-1,1]
//   NdotV                  – dot(normal, viewDir)                 (positive)
//   negNdotL               – dot(-normal, lightDir)  [= NdotL on back face] (positive)
//   VdotL                  – dot(view, light)
//
// Returns:  RGB throughput for the single-scatter transmission path.
// ============================================================================

float3 HanrahanSingleScatterDiffuseTransmission(
    float3 baseReflectivity,
    float3 attenuationCoefficient,
    float  measurementDistance,
    float3 singleScatterAlbedo,
    float  volumetricAnisotropy,
    float  NdotV,
    float  negNdotL,
    float  VdotL)
{
  // Derive IoR from luminance of base reflectivity
  float baseReflLum = dot(baseReflectivity, float3(0.2126, 0.7152, 0.0722));
  float ior = BaseReflectivityToIoR(1.0, baseReflLum);
  float insideRelativeIoR = ior;  // ior / 1.0 (vacuum)

  // Fresnel terms for outside and inside interfaces
  // Outside: viewing from air into surface — no TIR possible, use simple Schlick
  float outsideFresnel = TranslucentSchlickFresnel(baseReflLum, NdotV);
  // Inside: exiting from denser medium — TIR is possible
  float insideFresnel  = TranslucentSchlickFresnelTIR(baseReflLum, insideRelativeIoR, negNdotL);

  // Attenuation through the thin slab from both sides
  float attDist = measurementDistance * measurementDistance;
  float3 firstAtten  = EvalBeerLambertAttenuation(attenuationCoefficient,
      attDist * ::renodx::math::DivideSafe(1.0, NdotV, 5e-5));
  float3 secondAtten = EvalBeerLambertAttenuation(attenuationCoefficient,
      attDist * ::renodx::math::DivideSafe(1.0, negNdotL, 5e-5));

  // Early out: backface or total internal reflection
  if (negNdotL < 5e-5 || insideFresnel >= 1.0)
    return float3(0.0, 0.0, 0.0);

  float phase = HenyeyGreensteinPhase(volumetricAnisotropy, VdotL);

  if ((NdotV - negNdotL) >= 5e-5)
  {
    // Standard first-order forward-scatter equation
    return singleScatterAlbedo * (1.0 - outsideFresnel) * (1.0 - insideFresnel)
         * ::renodx::math::DivideSafe(
               NdotV,
               NdotV - negNdotL,
               5e-5)
         * phase * (firstAtten - secondAtten);
  }
  else
  {
    // Derivative form: handles singularity when NdotV ≈ negNdotL
    return singleScatterAlbedo * (1.0 - outsideFresnel) * (1.0 - insideFresnel)
         * ::renodx::math::DivideSafe(
               attenuationCoefficient * attDist,
               negNdotL,
               5e-5)
         * phase * secondAtten;
  }
}

// ============================================================================
// 4.7  RDX BRDF RT — Unified Ray Tracing / Path Tracing BRDF Package
// ----------------------------------------------------------------------------
// Extends the rasterisation RDX BRDF (§3.10) with ray-tracing-specific
// outputs that require stochastic evaluation:
//
//   specularPdf  — VNDF probability density for Monte Carlo weighting
//   transmission — Hanrahan single-scatter diffuse transmission (SSS)
//
// Uses the same RDX_BRDFParams input as the raster version; the RT-specific
// fields (enableSSS, useBoundedVNDF, sss*, etc.) are read here but ignored
// by the rasterisation RDX_BRDF in §3.10.
//
// Usage:
//   RDX_BRDFParams p = RDX_DefaultParams();
//   p.N = normal;  p.V = viewDir;  p.L = lightDir;
//   p.albedo = baseColor;  p.roughness = rough;  p.metallic = metal;
//   p.useBoundedVNDF = 1.0;
//   p.enableSSS = 1.0;
//   p.sssAttenuationCoefficient = float3(0.5, 0.3, 0.1);
//   p.sssMeasurementDistance = 0.05;
//   p.sssNegNdotL = max(dot(-normal, lightDir), 0.0);
//   RDX_BRDFResult_RT r = RDX_BRDF_RT(p);
//   output = r.combined * lightColor + r.transmission * lightColor;
//
// Output fields:
//   .diffuse      — same as raster output
//   .specular     — same as raster output
//   .combined     — same as raster output
//   .specularPdf  — VNDF PDF for importance-sampled specular weighting
//   .transmission — Hanrahan SSS throughput (float3(0) when SSS disabled)
// ============================================================================

// -- 4.7a.  RT Result Struct -------------------------------------------------

struct RDX_BRDFResult_RT {
  float3 diffuse;       // Diffuse radiance  (NdotL pre-applied, pre-c₂)
  float3 specular;      // Specular radiance (NdotL pre-applied, pre-c₂)
  float3 combined;      // (diffuse + specular) × c₂
  float  specularPdf;   // VNDF probability density for MC weighting
  float3 transmission;  // Hanrahan SSS throughput (0 if disabled)
};

// -- 4.7b.  RDX BRDF RT Evaluation -------------------------------------------

RDX_BRDFResult_RT RDX_BRDF_RT(RDX_BRDFParams params)
{
  // ---- Run the full rasterisation BRDF first ------------------------------
  RDX_BRDFResult raster = RDX_BRDF(params);

  RDX_BRDFResult_RT result;
  result.diffuse  = raster.diffuse;
  result.specular = raster.specular;
  result.combined = raster.combined;

  // ---- Recompute dot products needed for RT outputs -----------------------
  float3 H     = normalize(params.V + params.L);
  float  NdotV = max(dot(params.N, params.V), 1e-5);
  float  NdotH = saturate(dot(params.N, H));
  float  VdotH = saturate(dot(params.V, H));

  float TdotH = dot(params.T, H);
  float BdotH = dot(params.B, H);
  float TdotV = dot(params.T, params.V);
  float BdotV = dot(params.B, params.V);

  // Roughness (same as raster evaluation)
  float  isoRoughness;
  float2 anisoRoughness;
  CalcRoughness(params.roughness, params.anisotropy,
                isoRoughness, anisoRoughness);

  // ---- Specular VNDF PDF --------------------------------------------------
  if (params.useBoundedVNDF > 0.0) {
    result.specularPdf = GGX_BoundedVNDF_ReflectionPdf(
        anisoRoughness,
        TdotV, BdotV, NdotV,
        TdotH, BdotH, NdotH,
        VdotH);
  } else {
    result.specularPdf = GGX_VNDF_ReflectionPdf(
        anisoRoughness,
        TdotV, BdotV, NdotV,
        TdotH, BdotH, NdotH,
        VdotH);
  }

  // ---- SSS Transmission ---------------------------------------------------
  if (params.enableSSS > 0.0) {
    float3 F0;
    if (params.useCustomF0 > 0.0)
      F0 = params.customF0;
    else
      F0 = CalcBaseReflectivity(params.albedo, params.metallic, params.opacity);

    result.transmission = HanrahanSingleScatterDiffuseTransmission(
        F0,
        params.sssAttenuationCoefficient,
        params.sssMeasurementDistance,
        params.sssSingleScatterAlbedo,
        params.sssVolumetricAnisotropy,
        NdotV,
        params.sssNegNdotL,
        dot(params.V, params.L));
  } else {
    result.transmission = float3(0.0, 0.0, 0.0);
  }

  return result;
}

// ============================================================================
// 4.8  EON — Energy-Preserving Oren–Nayar Diffuse BRDF
// ----------------------------------------------------------------------------
// Portsmouth, Kutz & Hill 2025 — "EON: A Practical Energy-Preserving
// Rough Diffuse BRDF"
//
// An analytically energy-compensated Oren–Nayar model that replaces Lambert
// (albedo / PI) for rough diffuse surfaces.  Compared to Hammon 2017 (§3.1):
//
//   • Exact energy preservation via multi-scatter geometric series
//   • Oren–Nayar backscattering peak at grazing configurations
//   • Directional albedo function E_EON for furnace-test balance
//   • CLTC importance sampling for efficient path tracing (§4.8e–g)
//
// The model operates in tangent space where z = surface normal.  All
// direction vectors (wi, wo) must be in this local frame.
//
// Placement in Part IV because the CLTC importance sampling is designed
// for Monte Carlo / path tracing.  The evaluation functions (§4.8a–c)
// can also be used in rasterisation if tangent-space directions are
// available.
// ============================================================================

// -- Constants for Fujii Oren–Nayar (FON) base model -------------------------
static const float EON_CONSTANT1_FON = 0.5 - 2.0 / (3.0 * 3.14159265);
static const float EON_CONSTANT2_FON = 2.0 / 3.0 - 28.0 / (15.0 * 3.14159265);

// -- 4.8a.  FON Directional Albedo — Exact ------------------------------------
//
// Computes the directional albedo of the Fujii Oren–Nayar (FON) base
// model using the exact closed-form expression.
//
// Parameters:
//   mu – cos(theta), i.e. the z-component of the direction vector
//   r  – roughness [0,1]
//
// Returns:  FON directional albedo E_FON(mu, r).

float EON_E_FON_Exact(float mu, float r)
{
  float AF = 1.0 / (1.0 + EON_CONSTANT1_FON * r);
  float BF = r * AF;
  float Si = sqrt(1.0 - mu * mu);
  float G  = Si * (acos(clamp(mu, -1.0, 1.0)) - Si * mu)
           + (2.0 / 3.0) * ((Si / max(mu, 1e-7)) * (1.0 - Si * Si * Si) - Si);
  return AF + (BF * (1.0 / 3.14159265)) * G;
}

// -- 4.8b.  FON Directional Albedo — Fast Approximation -----------------------
//
// Polynomial fit to E_FON.  ~4× cheaper than the exact version.
// Max error < 0.003 over the full (mu, r) domain.

float EON_E_FON_Approx(float mu, float r)
{
  float mucomp = 1.0 - mu;
  static const float g1 = 0.0571085289;
  static const float g2 = 0.491881867;
  static const float g3 = -0.332181442;
  static const float g4 = 0.0714429953;
  float GoverPi = mucomp * (g1 + mucomp * (g2 + mucomp * (g3 + mucomp * g4)));
  return (1.0 + r * GoverPi) / (1.0 + EON_CONSTANT1_FON * r);
}

// -- 4.8c.  EON BRDF Evaluation -----------------------------------------------
//
// Evaluates the full EON BRDF value (single-scatter + multi-scatter).
//
// Parameters:
//   rho       – single-scattering albedo (base colour, linear RGB)
//   r         – roughness [0,1]
//   wi_local  – incident direction in tangent space (z = normal)
//   wo_local  – outgoing direction in tangent space (z = normal)
//   useExact  – true = exact E_FON, false = fast polynomial approximation
//
// Returns:  BRDF value f(wi, wo) as float3.
//           Multiply by NdotL * lightColor externally.

float3 EON_BRDF(
    float3 rho,
    float  r,
    float3 wi_local,
    float3 wo_local,
    bool   useExact = false)
{
  float mu_i = wi_local.z;
  float mu_o = wo_local.z;

  // QON s term: azimuthal / planar component of the dot product
  float s = dot(wi_local, wo_local) - mu_i * mu_o;

  // FON s/t ratio
  float sovertF = (s > 0.0) ? (s / max(mu_i, mu_o)) : s;

  // FON A coefficient
  float AF = 1.0 / (1.0 + EON_CONSTANT1_FON * r);

  // Single-scatter lobe
  float3 f_ss = (rho * (1.0 / 3.14159265)) * AF * (1.0 + r * sovertF);

  // Directional albedos
  float EFo = useExact ? EON_E_FON_Exact(mu_o, r) : EON_E_FON_Approx(mu_o, r);
  float EFi = useExact ? EON_E_FON_Exact(mu_i, r) : EON_E_FON_Approx(mu_i, r);

  // Average albedo
  float avgEF = AF * (1.0 + EON_CONSTANT2_FON * r);

  // Multi-scatter albedo (geometric series for infinite inter-reflections)
  float3 rho_ms = (rho * rho) * avgEF / (1.0 - rho * (1.0 - avgEF));

  // Multi-scatter lobe
  static const float eps = 1e-7;
  float3 f_ms = (rho_ms * (1.0 / 3.14159265))
              * max(eps, 1.0 - EFo)
              * max(eps, 1.0 - EFi)
              / max(eps, 1.0 - avgEF);

  return f_ss + f_ms;
}

// -- 4.8d.  EON Directional Albedo --------------------------------------------
//
// Computes the directional albedo E_EON(wi) — the hemispherical integral
// of the EON BRDF over all outgoing directions.  Useful for:
//   • Furnace tests (should return rho for energy conservation)
//   • Balancing diffuse vs. specular energy in a unified BRDF
//   • Pre-integrated diffuse for split-sum IBL
//
// Parameters:
//   rho       – single-scattering albedo
//   r         – roughness [0,1]
//   wi_local  – incident direction in tangent space
//   useExact  – true = exact, false = approx
//
// Returns:  directional albedo E(wi) as float3.

float3 EON_DirectionalAlbedo(
    float3 rho,
    float  r,
    float3 wi_local,
    bool   useExact = false)
{
  float mu_i = wi_local.z;
  float AF   = 1.0 / (1.0 + EON_CONSTANT1_FON * r);
  float EF   = useExact ? EON_E_FON_Exact(mu_i, r) : EON_E_FON_Approx(mu_i, r);
  float avgEF = AF * (1.0 + EON_CONSTANT2_FON * r);
  float3 rho_ms = (rho * rho) * avgEF / (1.0 - rho * (1.0 - avgEF));
  return rho * EF + rho_ms * (1.0 - EF);
}

// -- 4.8e.  LTC Lobe Coefficients for CLTC Sampling ---------------------------
//
// Fitted coefficients a, b, c, d of the Linearly Transformed Cosine (LTC)
// matrix M that approximates the EON BRDF lobe shape for importance sampling.
//
// Parameters:
//   mu – cos(theta) of the outgoing direction
//   r  – roughness [0,1]
//
// Outputs (by reference):
//   a, b, c, d – matrix coefficients for M = {{a, 0, b}, {0, c, 0}, {d, 0, 1}}

void EON_LTC_Coefficients(
    float mu, float r,
    out float a, out float b, out float c, out float d)
{
  a = 1.0 + r * (0.303392 + (-0.518982 + 0.111709 * mu) * mu
          + (-0.276266 + 0.335918 * mu) * r);
  b = r * (-1.16407 + 1.15859 * mu + (0.150815 - 0.150105 * mu) * r)
      / (mu * mu * mu - 1.43545);
  c = 1.0 + r * (0.20013 + (-0.506373 + 0.261777 * mu) * mu);
  d = r * (0.540852 + (-1.01625 + 0.475392 * mu) * mu)
      / (-1.0743 + (0.0725628 + mu) * mu);
}

// -- 4.8f.  CLTC Importance Sampling ------------------------------------------
//
// Samples an incident direction wi from the Clipped Linearly Transformed
// Cosine (CLTC) lobe fitted to the EON BRDF.  This provides dramatically
// lower variance than cosine-weighted sampling at grazing angles (>100×).
//
// Parameters:
//   wo_local – outgoing direction in tangent space (z = normal)
//   r        – roughness [0,1]
//   u1, u2   – uniform random numbers in [0, 1]
//
// Returns:  float4(wi_local.xyz, pdf)
//           wi_local = sampled incident direction in tangent space
//           pdf = probability density of the sample

// Helper: orthonormal basis aligned with the azimuthal direction of w
float3x3 EON_OrthonormalBasisLTC(float3 w)
{
  float lenSqr = dot(w.xy, w.xy);
  float3 X = (lenSqr > 0.0)
           ? float3(w.x, w.y, 0.0) * rsqrt(lenSqr)
           : float3(1, 0, 0);
  float3 Y = float3(-X.y, X.x, 0.0);  // cross(Z, X)
  return float3x3(X, Y, float3(0, 0, 1));
}

// CLTC sample from the LTC lobe
float4 EON_CLTC_Sample(float3 wo_local, float r, float u1, float u2)
{
  float a, b, c, d;
  EON_LTC_Coefficients(wo_local.z, r, a, b, c, d);

  // CLTC sampling on the clipped cosine hemisphere
  float R   = sqrt(u1);
  float phi = 2.0 * 3.14159265 * u2;
  float x   = R * cos(phi);
  float y   = R * sin(phi);

  float vz = 1.0 / sqrt(d * d + 1.0);
  float s  = 0.5 * (1.0 + vz);
  x = -lerp(sqrt(1.0 - y * y), x, s);

  // Hemispherical sample wH
  float3 wh = float3(x, y, sqrt(max(1.0 - (x * x + y * y), 0.0)));
  float pdf_wh = wh.z / (3.14159265 * s);

  // Apply LTC matrix M to get wi (unnormalized)
  float3 wi = float3(a * wh.x + b * wh.z,
                     c * wh.y,
                     d * wh.x + wh.z);
  float len  = length(wi);
  float detM = c * (a - b * d);
  float pdf_wi = pdf_wh * len * len * len / detM;

  // Transform from LTC space to tangent space.
  // HLSL float3x3(X,Y,Z) stores X,Y,Z as rows (vs GLSL columns), so
  // mul(v, M) = v.x*X + v.y*Y + v.z*Z = the fromLTC (reconstruction) direction.
  float3x3 fromLTC = EON_OrthonormalBasisLTC(wo_local);
  wi = normalize(mul(wi, fromLTC));

  return float4(wi, pdf_wi);
}

// CLTC PDF evaluation for a given wi direction
float EON_CLTC_Pdf(float3 wo_local, float3 wi_local, float r)
{
  // HLSL float3x3(X,Y,Z) stores X,Y,Z as rows, so mul(M, v) = [dot(X,v), dot(Y,v), dot(Z,v)]
  // which is the toLTC (projection onto axes) direction — no transpose needed.
  float3 wi = mul(EON_OrthonormalBasisLTC(wo_local), wi_local);

  float a, b, c, d;
  EON_LTC_Coefficients(wo_local.z, r, a, b, c, d);

  float detM = c * (a - b * d);

  // adj(M) * wi  (inverse direction mapping)
  float3 wh = float3(
      c * (wi.x - b * wi.z),
      (a - b * d) * wi.y,
      -c * (d * wi.x - a * wi.z));
  float lenSqr = dot(wh, wh);

  float vz = 1.0 / sqrt(d * d + 1.0);
  float s  = 0.5 * (1.0 + vz);

  return detM * detM / (lenSqr * lenSqr) * max(wh.z, 0.0) / (3.14159265 * s);
}

// -- 4.8g.  EON Importance Sampling (MIS: CLTC + Uniform) ---------------------
//
// Mixed importance sampling strategy that combines CLTC sampling (efficient
// for the peaked lobe) with uniform hemisphere sampling (catches the diffuse
// tail).  Uses fitted probability weights for optimal MIS.
//
// Parameters:
//   wo_local – outgoing direction in tangent space
//   r        – roughness [0,1]
//   u1, u2   – uniform random numbers in [0, 1]
//
// Returns:  float4(wi_local.xyz, pdf)

// Helper: uniform hemisphere sample
float3 EON_UniformLobeSample(float u1, float u2)
{
  float sinTheta = sqrt(1.0 - u1 * u1);
  float phi = 2.0 * 3.14159265 * u2;
  return float3(sinTheta * cos(phi), sinTheta * sin(phi), u1);
}

float4 EON_Sample(
    float3 wo_local,
    float  r,
    float  u1,
    float  u2)
{
  float mu = wo_local.z;

  // Fitted probability of choosing the uniform lobe
  float P_u = pow(r, 0.1)
            * (0.162925 + (-0.372058 + (0.538233 - 0.290822 * mu) * mu) * mu);
  float P_c = 1.0 - P_u;

  float4 wi;
  float  pdf_c;

  if (u1 <= P_u) {
    // Sample from uniform hemisphere lobe
    u1 = u1 / P_u;
    wi = float4(EON_UniformLobeSample(u1, u2), 0.0);
    pdf_c = EON_CLTC_Pdf(wo_local, wi.xyz, r);
  } else {
    // Sample from CLTC lobe
    u1 = (u1 - P_u) / P_c;
    wi = EON_CLTC_Sample(wo_local, r, u1, u2);
    pdf_c = wi.w;
  }

  static const float pdf_u = 1.0 / (2.0 * 3.14159265);
  wi.w = P_u * pdf_u + P_c * pdf_c;  // MIS combined PDF
  return wi;
}

// -- 4.8h.  EON Sampling PDF --------------------------------------------------
//
// Evaluates the PDF of the MIS sampling strategy for a given direction pair.
// Use this when the sample was generated by another strategy (e.g. light
// sampling) and you need the EON PDF for MIS weighting.
//
// Parameters:
//   wo_local – outgoing direction in tangent space
//   wi_local – incident direction in tangent space
//   r        – roughness [0,1]
//
// Returns:  PDF value (probability per steradian).

float EON_SamplingPdf(
    float3 wo_local,
    float3 wi_local,
    float  r)
{
  float mu = wo_local.z;
  float P_u = pow(r, 0.1)
            * (0.162925 + (-0.372058 + (0.538233 - 0.290822 * mu) * mu) * mu);
  float P_c = 1.0 - P_u;
  float pdf_c = EON_CLTC_Pdf(wo_local, wi_local, r);
  static const float pdf_u = 1.0 / (2.0 * 3.14159265);
  return P_u * pdf_u + P_c * pdf_c;
}

}  // namespace rendering
}  // namespace renodx

#endif  // SRC_SHADERS_RENDERING_HLSL_
