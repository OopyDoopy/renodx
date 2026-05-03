#ifndef SRC_CRIMSONDESERT_LIGHTING_PURKINJE_COMMON_HLSLI_
#define SRC_CRIMSONDESERT_LIGHTING_PURKINJE_COMMON_HLSLI_

#include "../shared.h"

// --- Purkinje effect ---
//
// Game renders moonlight with the same warm atmospheric transmittance as
// sunlight, producing a yellowish tint at night.
//
// The scotopic matrix is hand vibe tuned not derived from any specific
// dataset.

float PurkinjeNightFactor(float sunElevation) {
  return smoothstep(0.0f, -0.10f, sunElevation);
}

// --- Game custom colour space ---
// Game's lighting pipeline uses a custom 3x3 color space (not BT.709).
// The directional light colour at the injection point has this matrix baked
// in twice (transmittance -> custom -> custom again).
//
// Forward matrix (game custom -> appears in the decompiled code as the
// 0.6131/0.3396/0.0474 block):
static const float3x3 CUSTOM_CS_MAT = float3x3(
  0.6131200194358826f, 0.3395099937915802f, 0.047370001673698425f,
  0.07020000368356705f, 0.9163600206375122f, 0.013450000435113907f,
  0.02061999961733818f, 0.10958000272512436f, 0.8697999715805054f
);

static const float3x3 CUSTOM_CS_INV = float3x3(
   1.705049991607666f,   -0.6217899918556213f, -0.08325999975204468f,
  -0.13026000559329987f,  1.1407999992370605f,  -0.01054999977350235f,
  -0.024000000208616257f,-0.12896999716758728f,  1.1529699563980103f
);

// scotopic shift matrix for post process (BT.709 space, hand tuned)
// applied to the full composited image, catches GI, fog, ambient.
// tune this independently from the direct moonlight matrix.
static const float3x3 SCOTOPIC_SHIFT_POST = float3x3(
  0.75f, 0.20f, 0.05f,
  0.05f, 0.80f, 0.15f,
  0.02f, 0.28f, 0.70f
);

// --- Direct moonlight shift ---
// Converts custom CS -> BT.709, applies scotopic matrix, converts back.
float3 ApplyPurkinjeShift(float3 lightColor, float sunElevation, bool isMoonActive) {
  float nightFactor = PurkinjeNightFactor(sunElevation);
  float active = renodx::math::Select(
    (PURKINJE_EFFECT == 1.f && isMoonActive && nightFactor > 0.f),
    nightFactor,
    0.f);

  static const float3x3 SCOTOPIC_DIRECT = float3x3(
    -0.35f,  0.375f, 0.975f,
     0.075f, -0.20f, 1.125f,
     0.03f,   0.195f, 0.775f
  );

  float3 bt709 = mul(CUSTOM_CS_INV, lightColor);
  float3 shifted_bt709 = max(0.f, mul(SCOTOPIC_DIRECT, bt709));
  float3 shifted = mul(CUSTOM_CS_MAT, shifted_bt709);

  return lerp(lightColor, shifted, active);
}

// --- Post process shift (full screen, BT.709 input) ---
// catches everything the per light shift misses: ambient GI, fog, voxel GI.
// luminance gated so torches and campfires stay warm but still shift a bit
float3 ApplyPurkinjePostProcess(float3 color_bt709, float sunElevation, float moonElevation, float diffuseWhite) {
  float nightFactor = PurkinjeNightFactor(sunElevation);
  bool isMoonActive = (sunElevation <= 0.f) && (sunElevation <= moonElevation);
  float active = renodx::math::Select(
    (PURKINJE_EFFECT == 1.f && isMoonActive && nightFactor > 0.f),
    nightFactor,
    0.f);

  float y = renodx::color::y::from::BT709(color_bt709);
  float lumBlend = 1.f - smoothstep(0.02f * diffuseWhite, 0.25f * diffuseWhite, y);
  float3 shifted = mul(SCOTOPIC_SHIFT_POST, color_bt709);

  return lerp(color_bt709, shifted, active * lumBlend);
}

#endif  // SRC_CRIMSONDESERT_LIGHTING_PURKINJE_COMMON_HLSLI_
