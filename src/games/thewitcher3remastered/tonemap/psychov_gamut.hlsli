#ifndef THEWITCHER3REMASTERED_PSYCHOV_GAMUT_HLSLI_
#define THEWITCHER3REMASTERED_PSYCHOV_GAMUT_HLSLI_

// Keep the observer response inside its positive cone domain. Signed RGB is
// valid wide-gamut transport, but a negative LMS component never approaches
// positive peak white through the supplied mapper's abs/sign fallback. This
// produces a flat yellow/green highlight with a white seam where S crosses zero.
float3 WitcherCompressPsychoVConeInput(float3 rgb) {
  const float luminance = renodx::color::y::from::BT709(rgb);
  if (!(luminance > 0.f)) return rgb;
  const float3 relative_lms = mul(
      renodx::tonemap::psychov::PSYCHO30_BT709_TO_LMS_MAT, rgb)
      / renodx::tonemap::psychov::PSYCHO30_D65_WHITE_LMS;
  const float distance = 1.f - renodx::math::Min(relative_lms) / luminance;
  // A narrow, exposure-invariant knee starts before the cone boundary to avoid
  // a seam at zero. Ordinary colours bypass exactly; no BT.709 RGB clamp or
  // display-gamut restriction is introduced. The RGB blend preserves CIE Y.
  const float knee = 0.98f;
  if (distance <= knee) return rgb;
  const float excess = distance - knee;
  const float headroom = 1.f - knee;
  const float compressed = knee + excess * headroom / (excess + headroom);
  return lerp(luminance.xxx, rgb, compressed / distance);
}

// Use a bounded display-channel response as the compression destination.
// Unlike a neutral destination it retains a warm yellow path to peak white.
float3 WitcherCompressPsychoVGamut(
    float3 rgb, float3 source, float peak, float compression, int target, float strength) {
  if (strength <= 0.f) return rgb;
  const float3x3 to_target = target == 3
      ? mul(renodx::color::XYZ_TO_DISPLAYP3_MAT, renodx::color::BT709_TO_XYZ_MAT)
      : (target == 1 ? renodx::color::BT709_TO_BT2020_MAT
                     : float3x3(1, 0, 0, 0, 1, 0, 0, 0, 1));
  const float3x3 from_target = target == 3
      ? mul(renodx::color::XYZ_TO_BT709_MAT, renodx::color::DISPLAYP3_TO_XYZ_MAT)
      : (target == 1 ? renodx::color::BT2020_TO_BT709_MAT
                     : float3x3(1, 0, 0, 0, 1, 0, 0, 0, 1));
  float3 reference = mul(to_target, source);
  const float y = renodx::color::y::from::BT709(source);
  if (!(y > 0.f)) return lerp(rgb, 0.f.xxx, saturate(strength));
  // Lower-bound source gamut fit preserves Y and does not restrict HDR range.
  const float3 low = max(1.f - reference / y, 0.f);
  const float low_support = max(1.f, renodx::math::Max(low));
  const float lower_scale = rcp(low_support) * pow(
      pow(rcp(low_support), 8.f) + dot(pow(low / low_support, 8.f), 1.f.xxx), -0.125f);
  reference = lerp(y.xxx, reference, lower_scale);
  const float background_anchor = min(RENODX_PSYCHOV_BACKGROUND_ANCHOR, peak * 0.99f);
  reference = renodx::tonemap::witcher_psychov_custom31::custom_psycho31_ApplyAnchoredCInfinityShoulder(
      reference * (background_anchor / RENODX_PSYCHOV_ADAPTATION_ANCHOR),
      peak.xxx, background_anchor.xxx, compression,
      mul(renodx::color::BT709_TO_XYZ_MAT[1], from_target)) / peak;
  const float3 normalized = mul(to_target, rgb / peak);
  const float3 delta = normalized - reference;
  const float3 demand_low = max(-delta, 0.f) / max(reference, 1e-7f);
  const float3 demand_high = max(delta, 0.f) / max(1.f - reference, 1e-7f);
  const float support = max(1.f, max(renodx::math::Max(demand_low), renodx::math::Max(demand_high)));
  // A smooth support of all six RGB faces avoids a corner when the limiting
  // channel changes. Scaling by the largest demand prevents squared overflow;
  // it cancels algebraically and introduces no max-channel knee in the result.
  // scale <= 1 / each demand proves the endpoint stays in the target cube.
  const float scale = rcp(support) * rsqrt(
      rcp(support) * rcp(support)
      + dot(demand_low / support, demand_low / support)
      + dot(demand_high / support, demand_high / support));
  return lerp(rgb, mul(from_target, reference + delta * scale) * peak, saturate(strength));
}

#endif
