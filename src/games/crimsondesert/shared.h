#ifndef SRC_CRIMSONDESERT_SHARED_H_
#define SRC_CRIMSONDESERT_SHARED_H_

#ifdef __cplusplus
#include <bit>
#include <cstdint>
#endif

// Feature gates packed into custom_flags. Off states should preserve vanilla behavior.
#define CUSTOM_FLAGS__TONE_MAP_TYPE                     0b0000000000000000001u
#define CUSTOM_FLAGS__SDR_BLACK_CRUSH_FIX               0b0000000000000000010u
#define CUSTOM_FLAGS__IMPROVED_AUTO_EXPOSURE            0b0000000000000000100u
#define CUSTOM_FLAGS__DISABLE_AWB                       0b0000000000000001000u
#define CUSTOM_FLAGS__DISABLE_HERO_LIGHTS               0b0000000000000010000u
#define CUSTOM_FLAGS__FILM_GRAIN_TYPE                   0b0000000000000100000u
#define CUSTOM_FLAGS__SHARPENING_TYPE                   0b0000000000001000000u
#define CUSTOM_FLAGS__SKY_SCATTERING                    0b0000000000010000000u
#define CUSTOM_FLAGS__SUN_IMPROVEMENTS                  0b0000000000100000000u
#define CUSTOM_FLAGS__SUN_MOON_ADJUSTMENTS              CUSTOM_FLAGS__SUN_IMPROVEMENTS
#define CUSTOM_FLAGS__MICRO_SHADOW_QUALITY_BIT0         0b0000000001000000000u
#define CUSTOM_FLAGS__MICRO_SHADOW_QUALITY_BIT1         0b100000000000000000000000000u
#define CUSTOM_FLAGS__RT_QUALITY_BIT0                   0b0000000010000000000u
#define CUSTOM_FLAGS__RT_QUALITY_BIT1                   0b0000000100000000000u
#define CUSTOM_FLAGS__MATERIAL_IMPROVEMENTS             0b0000001000000000000u
#define CUSTOM_FLAGS__IMPROVED_AUTO_EXPOSURE_PERCEPTUAL 0b0000010000000000000u
#define CUSTOM_FLAGS__DAWN_DUSK_IMPROVEMENTS            0b0000100000000000000u
#define CUSTOM_FLAGS__SNOW_FOG_FIX                      0b0001000000000000000u
#define CUSTOM_FLAGS__TONEMAP_DEBUG_BIT0                0b0010000000000000000u
#define CUSTOM_FLAGS__TONEMAP_DEBUG_BIT1                0b0100000000000000000u
#define CUSTOM_FLAGS__RR_ENABLED                        0b1000000000000000000u
#define CUSTOM_FLAGS__AURORA_BOREALIS                   0b10000000000000000000u
#define CUSTOM_FLAGS__NIGHT_SKY_ATTENUATION             0b100000000000000000000u
//#define CUSTOM_FLAGS__D93_WHITE_POINT                 0b1000000000000000000000u
#define CUSTOM_FLAGS__FOLIAGE_IMPROVEMENTS              0b10000000000000000000000u
#define CUSTOM_FLAGS__FOLIAGE_IMPROVEMENTS_BIT1         0b1000000000000000000000u
#define CUSTOM_FLAGS__PURKINJE_EFFECT                   0b100000000000000000000000u
#define CUSTOM_FLAGS__CUSTOM_WEATHER_EDITING            0b1000000000000000000000000u
#define CUSTOM_FLAGS__MOON_ADJUSTMENTS                  0b10000000000000000000000000u
#define CUSTOM_FLAGS__BASIC_POSTPROCESS_FINAL           0b1000000000000000000000000000u
#define CUSTOM_FLAGS__FOLIAGE_SPEEDTREE_WIND_COHERENCE  0b10000000000000000000000000000u
// RenoDX: >>> [Patch: ShadowEdgeNoiseFix] [Version: 1.09]
// Description: Adds the Shadow Edge Noise Fix flag. The contact-shadow pass clamps X samples but not Y samples; the UI toggle can disable the X clamp so left/right edges do not reuse the last depth column.
#define CUSTOM_FLAGS__SHADOW_EDGE_NOISE_FIX             0x20000000u
// RenoDX: <<< [Patch: ShadowEdgeNoiseFix]
// RenoDX: >>> [Patch: MilkyWayAlphaOcclusion] [Version: experimental-20260614]
// Description: Adds an experimental flag for replacement Milky Way textures that intentionally use alpha as sky coverage. When enabled in supported sky shaders, authored alpha attenuates procedural stars and Milky Way sparkle boosts behind opaque custom texture content.
#define CUSTOM_FLAGS__MILKY_WAY_ALPHA_OCCLUSION         0x40000000u
// RenoDX: <<< [Patch: MilkyWayAlphaOcclusion]

#define CUSTOM_FLAGS                               shader_injection.custom_flags

#ifdef __cplusplus
#define CUSTOM_FLAGS_AS_UINT                   (std::bit_cast<uint32_t>(CUSTOM_FLAGS))
#else
#define CUSTOM_FLAGS_AS_UINT                   (asuint(CUSTOM_FLAGS))
#endif

#define RENODX_TONE_MAP_TYPE                   ((CUSTOM_FLAGS_AS_UINT & CUSTOM_FLAGS__TONE_MAP_TYPE) != 0u ? 1.f : 0.f)
#define RENODX_PEAK_WHITE_NITS                 shader_injection.peak_white_nits
#define RENODX_DIFFUSE_WHITE_NITS              shader_injection.diffuse_white_nits
#define RENODX_GRAPHICS_WHITE_NITS             shader_injection.graphics_white_nits
#define RENODX_GAMMA_CORRECTION                0 // shader_injection.gamma_correction
#define CUSTOM_SDR_BLACK_CRUSH_FIX             ((CUSTOM_FLAGS_AS_UINT & CUSTOM_FLAGS__SDR_BLACK_CRUSH_FIX) != 0u ? 1.f : 0.f)

#define RENODX_TONE_MAP_HUE_RESTORE            shader_injection.tone_map_hue_restore
#define RENODX_TONE_MAP_BLOWOUT                shader_injection.tone_map_blowout
#define CUSTOM_TONE_MAP_MIDGRAY_ADJUST         shader_injection.custom_tone_map_midgray_adjust
#define COLOR_TEMP_KELVIN                      shader_injection.color_temp_kelvin
#define RENODX_COLOR_GRADE_STRENGTH            1.f

#define RENODX_TONE_MAP_EXPOSURE               shader_injection.tone_map_exposure
#define RENODX_TONE_MAP_HIGHLIGHTS             shader_injection.tone_map_highlights
#define RENODX_TONE_MAP_SHADOWS                shader_injection.tone_map_shadows
#define RENODX_TONE_MAP_CONTRAST               shader_injection.tone_map_contrast
#define RENODX_TONE_MAP_SATURATION             shader_injection.tone_map_saturation
#define CUSTOM_CONE_RESPONSE                   shader_injection.tone_map_cone_response

#define CUSTOM_FILM_GRAIN_TYPE                 ((CUSTOM_FLAGS_AS_UINT & CUSTOM_FLAGS__FILM_GRAIN_TYPE) != 0u ? 1.f : 0.f)
#define CUSTOM_FILM_GRAIN_STRENGTH             shader_injection.custom_film_grain
#define CUSTOM_RANDOM                          shader_injection.custom_random
#define CUSTOM_CHROMATIC_ABERRATION            shader_injection.custom_chromatic_aberration
#define CUSTOM_SHARPENING_TYPE                 ((CUSTOM_FLAGS_AS_UINT & CUSTOM_FLAGS__SHARPENING_TYPE) != 0u ? 1.f : 0.f)
#define CUSTOM_SHARPENING                      shader_injection.custom_sharpening
#define CUSTOM_VIGNETTE                        shader_injection.custom_vignette
#define LENS_FLARE_STRENGTH                    shader_injection.lens_flare_strength
#define BLOOM_STRENGTH                         shader_injection.bloom_strength
#define CUSTOM_BASIC_POSTPROCESS_FINAL          ((CUSTOM_FLAGS_AS_UINT & CUSTOM_FLAGS__BASIC_POSTPROCESS_FINAL) != 0u ? 1.f : 0.f)

#define MICRO_SHADOW_QUALITY_OFF               0.f
#define MICRO_SHADOW_QUALITY_LOW               1.f
#define MICRO_SHADOW_QUALITY_BALANCED          2.f
#define MICRO_SHADOW_QUALITY_FULL              3.f
// Contact Micro Shadows gate all non-RT detail edits; Off keeps the native march.
#define MICRO_SHADOW_QUALITY                   ((float)((((CUSTOM_FLAGS_AS_UINT & CUSTOM_FLAGS__MICRO_SHADOW_QUALITY_BIT0) != 0u) ? 1u : 0u) | (((CUSTOM_FLAGS_AS_UINT & CUSTOM_FLAGS__MICRO_SHADOW_QUALITY_BIT1) != 0u) ? 2u : 0u)))
#define CONTACT_SHADOW_IS_LOW                  (MICRO_SHADOW_QUALITY == MICRO_SHADOW_QUALITY_LOW)
#define CONTACT_SHADOW_IS_BALANCED             (MICRO_SHADOW_QUALITY == MICRO_SHADOW_QUALITY_BALANCED)
#define CONTACT_SHADOW_IS_FULL                 (MICRO_SHADOW_QUALITY >= MICRO_SHADOW_QUALITY_FULL)
#define CONTACT_SHADOW_DETAIL_PATH             (MICRO_SHADOW_QUALITY > MICRO_SHADOW_QUALITY_OFF ? 1.f : 0.f)
#define CONTACT_SHADOW_MARCH_BLEND             (MICRO_SHADOW_QUALITY == MICRO_SHADOW_QUALITY_LOW ? 0.25f : (MICRO_SHADOW_QUALITY == MICRO_SHADOW_QUALITY_BALANCED ? 0.50f : (MICRO_SHADOW_QUALITY >= MICRO_SHADOW_QUALITY_FULL ? 1.00f : 0.f)))
#define CONTACT_SHADOW_REACH_BLEND             (MICRO_SHADOW_QUALITY == MICRO_SHADOW_QUALITY_LOW ? 0.30f : (MICRO_SHADOW_QUALITY == MICRO_SHADOW_QUALITY_BALANCED ? 0.50f : (MICRO_SHADOW_QUALITY >= MICRO_SHADOW_QUALITY_FULL ? 1.00f : 0.f)))
#define CONTACT_SHADOW_START_BLEND             (MICRO_SHADOW_QUALITY == MICRO_SHADOW_QUALITY_LOW ? 0.35f : (MICRO_SHADOW_QUALITY == MICRO_SHADOW_QUALITY_BALANCED ? 0.50f : (MICRO_SHADOW_QUALITY >= MICRO_SHADOW_QUALITY_FULL ? 1.00f : 0.f)))
#define CONTACT_MICRO_DETAIL_STRENGTH          (MICRO_SHADOW_QUALITY == MICRO_SHADOW_QUALITY_LOW ? 0.45f : (MICRO_SHADOW_QUALITY == MICRO_SHADOW_QUALITY_BALANCED ? 0.65f : (MICRO_SHADOW_QUALITY >= MICRO_SHADOW_QUALITY_FULL ? 1.00f : 0.f)))
#define CONTACT_MICRO_RANGE_NEAR               (CONTACT_SHADOW_IS_FULL ? 0.10f : 0.12f)
#define CONTACT_MICRO_RANGE_FAR                (CONTACT_SHADOW_IS_FULL ? 0.90f : 0.80f)
#define CONTACT_MICRO_THICKNESS_MULTIPLIER     0.50f
#define CONTACT_MICRO_OCCLUSION_SCALE          2.50f
#define CONTACT_MICRO_SELF_REJECT_PIXELS       (CONTACT_SHADOW_IS_FULL ? 0.95f : 1.50f)
#define CONTACT_SHADOW_BASE_TUNING             max(CONTACT_SHADOW_MARCH_BLEND, max(CONTACT_SHADOW_REACH_BLEND, CONTACT_SHADOW_START_BLEND))
#define CONTACT_SHADOW_STABLE_DIRECTION        (max(CONTACT_SHADOW_BASE_TUNING, CONTACT_MICRO_DETAIL_STRENGTH) > 0.f ? 1.f : 0.f)
// RT Sun/Moon contact shadow tuning is separated so RR+SunRT can be stronger without affecting Off.
#define CONTACT_SHADOW_RT_TUNING               (MICRO_SHADOW_QUALITY > MICRO_SHADOW_QUALITY_OFF ? 1.f : 0.f)
#define CONTACT_SHADOW_RT_FULL_MARCH_SAMPLES   24.0f
#define CONTACT_SHADOW_RT_FULL_REACH_TARGET    0.080f
#define CONTACT_SHADOW_RT_FULL_START_TARGET    1.00f
#define CONTACT_SHADOW_RT_FULL_ACCUM_STRENGTH  2.10f
#define CONTACT_SHADOW_RT_FULL_FINAL_STRENGTH  1.50f
#define CONTACT_MICRO_DETAIL_STRENGTH_RT_FULL  1.35f
#define CONTACT_SHADOW_RT_MARCH_SAMPLES        (CONTACT_SHADOW_IS_FULL ? CONTACT_SHADOW_RT_FULL_MARCH_SAMPLES : (CONTACT_SHADOW_IS_BALANCED ? 24.0f : 16.0f))
#define CONTACT_SHADOW_RT_REACH_TARGET         (CONTACT_SHADOW_IS_FULL ? CONTACT_SHADOW_RT_FULL_REACH_TARGET : (CONTACT_SHADOW_IS_BALANCED ? 0.080f : 0.050f))
#define CONTACT_SHADOW_RT_START_TARGET         (CONTACT_SHADOW_IS_FULL ? CONTACT_SHADOW_RT_FULL_START_TARGET : (CONTACT_SHADOW_IS_BALANCED ? 1.00f : 2.00f))
#define CONTACT_SHADOW_RT_ACCUM_STRENGTH       (CONTACT_SHADOW_IS_FULL ? CONTACT_SHADOW_RT_FULL_ACCUM_STRENGTH : (CONTACT_SHADOW_IS_BALANCED ? 1.75f : (CONTACT_SHADOW_IS_LOW ? 1.15f : 1.0f)))
#define CONTACT_SHADOW_RT_FINAL_STRENGTH       (CONTACT_SHADOW_IS_FULL ? CONTACT_SHADOW_RT_FULL_FINAL_STRENGTH : (CONTACT_SHADOW_IS_BALANCED ? 1.35f : (CONTACT_SHADOW_IS_LOW ? 1.10f : 1.0f)))
#define CONTACT_MICRO_DETAIL_STRENGTH_RT       (CONTACT_SHADOW_IS_FULL ? CONTACT_MICRO_DETAIL_STRENGTH_RT_FULL : (CONTACT_SHADOW_IS_BALANCED ? 1.00f : (CONTACT_SHADOW_IS_LOW ? 0.65f : 0.f)))
#define CONTACT_MICRO_RANGE_NEAR_RT            (CONTACT_SHADOW_IS_FULL ? 0.10f : 0.12f)
#define CONTACT_MICRO_RANGE_FAR_RT_FULL        0.80f
#define CONTACT_MICRO_FADE_SLOPE_RT_FULL       -0.019f
#define CONTACT_MICRO_FADE_OFFSET_RT_FULL      3.35f
#define CONTACT_MICRO_THICKNESS_RT_FULL        0.50f
#define CONTACT_MICRO_OCCLUSION_RT_FULL        2.50f
#define CONTACT_MICRO_SELF_REJECT_RT_FULL      1.50f
#define CONTACT_MICRO_SELF_FADE_PIXELS_RT_FULL 2.00f
#define CONTACT_MICRO_RANGE_FAR_RT             (CONTACT_SHADOW_IS_FULL ? CONTACT_MICRO_RANGE_FAR_RT_FULL : (CONTACT_SHADOW_IS_BALANCED ? 0.80f : 0.65f))
#define CONTACT_MICRO_THICKNESS_MULTIPLIER_RT  (CONTACT_SHADOW_IS_FULL ? CONTACT_MICRO_THICKNESS_RT_FULL : 0.50f)
#define CONTACT_MICRO_OCCLUSION_SCALE_RT       (CONTACT_SHADOW_IS_FULL ? CONTACT_MICRO_OCCLUSION_RT_FULL : (CONTACT_SHADOW_IS_BALANCED ? 2.50f : 2.00f))
#define CONTACT_MICRO_SELF_REJECT_PIXELS_RT    (CONTACT_SHADOW_IS_FULL ? CONTACT_MICRO_SELF_REJECT_RT_FULL : 1.50f)
#define CONTACT_MICRO_SELF_FADE_PIXELS_RT      (CONTACT_SHADOW_IS_FULL ? CONTACT_MICRO_SELF_FADE_PIXELS_RT_FULL : 2.00f)
#define CONTACT_MICRO_FOLIAGE_THICKNESS_BOOST_RT 1.80f
#define CONTACT_MICRO_FOLIAGE_OCCLUSION_BOOST_RT 1.40f
// Foliage Improvements read packed UI bits directly; 1.10 SceneAOTiled_CS and RenderDiffuseTiledCS family replacements cover RR and non-RR lanes.
#define FOLIAGE_IMPROVEMENTS                   ((float)((((CUSTOM_FLAGS_AS_UINT & CUSTOM_FLAGS__FOLIAGE_IMPROVEMENTS) != 0u) ? 1u : 0u) | (((CUSTOM_FLAGS_AS_UINT & CUSTOM_FLAGS__FOLIAGE_IMPROVEMENTS_BIT1) != 0u) ? 2u : 0u)))
#define FOLIAGE_TRANSMISSION                   (FOLIAGE_IMPROVEMENTS >= 2.f ? 1.0f : 0.0f)
#define RT_QUALITY                             (RR_ENABLED == 1.f ? (float)((CUSTOM_FLAGS_AS_UINT >> 10u) & 0x3u) : 0.f)
#define RR_ENABLED                             ((CUSTOM_FLAGS_AS_UINT & CUSTOM_FLAGS__RR_ENABLED) != 0u ? 1.f : 0.f)
// RenoDX: >>> [Patch: FoliageSpeedTreeWindCoherenceToggle] [Version: 1.09]
// Description: Exposes the foliage SpeedTree wind-coherence shader fix as a UI checkbox by reading its packed flag directly; vegetation shaders use this gate to fall back when current and previous winded positions diverge.
#define FOLIAGE_SPEEDTREE_WIND_COHERENCE       ((CUSTOM_FLAGS_AS_UINT & CUSTOM_FLAGS__FOLIAGE_SPEEDTREE_WIND_COHERENCE) != 0u ? 1.f : 0.f)
// RenoDX: <<< [Patch: FoliageSpeedTreeWindCoherenceToggle]
// RenoDX: >>> [Patch: ShadowEdgeNoiseFix] [Version: 1.09]
// Description: Vanilla clamps contact-shadow X samples before loading depth, while Y is left unclamped. With the fix on, X is also left unclamped so offscreen side samples cannot stretch the edge depth column.
#define SHADOW_CONTACT_SAMPLE_X(sample_x, half_texel_x) \
  (((CUSTOM_FLAGS_AS_UINT & CUSTOM_FLAGS__SHADOW_EDGE_NOISE_FIX) != 0u) ? (sample_x) : min(max((sample_x), (half_texel_x)), (1.0f - (half_texel_x))))
// RenoDX: <<< [Patch: ShadowEdgeNoiseFix]
#define AURORA_BOREALIS_ENABLED                ((RR_ENABLED == 1.f && (CUSTOM_FLAGS_AS_UINT & CUSTOM_FLAGS__AURORA_BOREALIS) != 0u) ? 1.f : 0.f)
#define RT_GI_KNEE                             2.0f
#define RT_GI_STRENGTH                         0.07f
#define MATERIAL_IMPROVEMENTS                  ((RR_ENABLED == 1.f && (CUSTOM_FLAGS_AS_UINT & CUSTOM_FLAGS__MATERIAL_IMPROVEMENTS) != 0u) ? 1.f : 0.f)
// RenoDX: >>> [Patch: MaterialImprovementFeatureGates] [Version: 1.09]
// Description: Keeps the Material Improvements UI mapped only to shader paths that survived 1.09 live validation. EON diffuse BRDF and spectral diffraction remain parked because enabling them together caused blocky direct/local-light mismatches across tiled lighting regions; smooth terminator and specular anti-aliasing stay RR-gated behind the UI toggle.
#define DIFFUSE_BRDF_MODE                      0.0f
#define SMOOTH_TERMINATOR                      (MATERIAL_IMPROVEMENTS == 1.f ? 1.0f : 0.0f)
#define SPECULAR_AA                            (MATERIAL_IMPROVEMENTS == 1.f ? 1.0f : 0.0f)
#define DIFFRACTION                            0.0f
// RenoDX: <<< [Patch: MaterialImprovementFeatureGates]
#define FOLIAGE_COLOR_CORRECT                  (FOLIAGE_IMPROVEMENTS >= 2.f ? 1.0f : 0.0f)
#define FOLIAGE_DESAT_STRENGTH                 0.55f
#define FOLIAGE_HUE_SHIFT                      0.0f
#define FOLIAGE_CORRECTION_STRENGTH            0.60f
#define FOLIAGE_CHROMA_EXTRA_DESAT             10.0f
#define FOLIAGE_L_REDUCTION                    2.0f
#define FOLIAGE_AO_STRENGTH                    (FOLIAGE_IMPROVEMENTS >= 1.f ? 1.0f : 0.0f)
#define FOLIAGE_TRANSMISSION_STRENGTH          1.0f
#define FOLIAGE_TRANSMISSION_THICKNESS         1.0f
#define FOLIAGE_SC_YELLOW                      1.0f
#define FOLIAGE_SC_YG_BLACK                    1.0f
#define FOLIAGE_SC_GREEN_BLACK                 1.0f
#define LOCAL_LIGHT_HUE_CORRECTION             shader_injection.local_light_hue_correction
#define LOCAL_LIGHT_SATURATION                 shader_injection.local_light_saturation
#define DISABLE_AWB                            ((CUSTOM_FLAGS_AS_UINT & CUSTOM_FLAGS__DISABLE_AWB) != 0u ? 1.f : 0.f)
#define DISABLE_HERO_LIGHTS                    ((CUSTOM_FLAGS_AS_UINT & CUSTOM_FLAGS__DISABLE_HERO_LIGHTS) != 0u ? 1.f : 0.f)
//#define D93_WHITE_POINT                      ((CUSTOM_FLAGS_AS_UINT & CUSTOM_FLAGS__D93_WHITE_POINT) != 0u ? 1.f : 0.f)

#define IMPROVED_AUTO_EXPOSURE                 ((float)((((CUSTOM_FLAGS_AS_UINT & CUSTOM_FLAGS__IMPROVED_AUTO_EXPOSURE) != 0u) ? 1u : 0u) | (((CUSTOM_FLAGS_AS_UINT & CUSTOM_FLAGS__IMPROVED_AUTO_EXPOSURE_PERCEPTUAL) != 0u) ? 2u : 0u)))

// Sun and moon are independent toggles so either disk can return to vanilla.
#define SUN_IMPROVEMENTS                       ((CUSTOM_FLAGS_AS_UINT & CUSTOM_FLAGS__SUN_IMPROVEMENTS) != 0u ? 1.f : 0.f)
#define MOON_ADJUSTMENTS                       ((CUSTOM_FLAGS_AS_UINT & CUSTOM_FLAGS__MOON_ADJUSTMENTS) != 0u ? 1.f : 0.f)
#define SUN_MOON_ADJUSTMENTS                   (((SUN_IMPROVEMENTS == 1.f) || (MOON_ADJUSTMENTS == 1.f)) ? 1.f : 0.f)
#define MOON_DISK_SIZE                         shader_injection.moon_disk_size
#define MOON_PHASE_DRAMA                       shader_injection.moon_phase_drama
#define MOON_BRIGHTNESS                        3.50f
#define MOON_GLOW_STRENGTH                     1.00f
#define MOON_LIMB_DARKENING                    1.00f
#define SKY_SCATTERING                         ((CUSTOM_FLAGS_AS_UINT & CUSTOM_FLAGS__SKY_SCATTERING) != 0u ? 1.f : 0.f)
#define DAWN_DUSK_IMPROVEMENTS                 ((CUSTOM_FLAGS_AS_UINT & CUSTOM_FLAGS__DAWN_DUSK_IMPROVEMENTS) != 0u ? 1.f : 0.f)
#define SNOW_FOG_FIX                           ((CUSTOM_FLAGS_AS_UINT & CUSTOM_FLAGS__SNOW_FOG_FIX) != 0u ? 1.f : 0.f)
#define DAWN_DUSK_GI_ENERGY                    0.7f
#define DAWN_DUSK_WEATHER_SEED                 shader_injection.dawn_dusk_weather_seed
#define DAWN_DUSK_LMS_L                        1.0f
#define DAWN_DUSK_LMS_M                        1.0f
#define DAWN_DUSK_LMS_S                        1.0f
#define CLOUD_REDDENING_STRENGTH               1.0f
#define DAWN_DUSK_WEATHER_BLEND                shader_injection.dawn_dusk_weather_blend
#define AURORA_GI_ENERGY                       1.0f
#define AURORA_BRIGHTNESS                      shader_injection.aurora_brightness
#define AURORA_CHANCE                          shader_injection.aurora_chance
#define AURORA_NIGHT_SEED                      shader_injection.aurora_night_seed
#define MILKY_WAY_LIGHT_INTENSITY              shader_injection.milky_way_light_intensity
// RenoDX: >>> [Patch: MilkyWayAlphaOcclusion] [Version: experimental-20260614]
// Description: Exposes the experimental Milky Way alpha coverage toggle to shaders. Supported sky shaders use this flag to decide whether authored alpha in replacement Milky Way textures should attenuate procedural stars and sparkle boosts.
#define MILKY_WAY_ALPHA_OCCLUSION              ((CUSTOM_FLAGS_AS_UINT & CUSTOM_FLAGS__MILKY_WAY_ALPHA_OCCLUSION) != 0u ? 1.f : 0.f)
// RenoDX: <<< [Patch: MilkyWayAlphaOcclusion]
#define NIGHT_SKY_ATTENUATION                  ((CUSTOM_FLAGS_AS_UINT & CUSTOM_FLAGS__NIGHT_SKY_ATTENUATION) != 0u ? 1.f : 0.f)
#define PURKINJE_EFFECT                        ((RR_ENABLED == 1.f && (CUSTOM_FLAGS_AS_UINT & CUSTOM_FLAGS__PURKINJE_EFFECT) != 0u) ? 1.f : 0.f)
#define CUSTOM_WEATHER_EDITING                 ((RR_ENABLED == 1.f && (CUSTOM_FLAGS_AS_UINT & CUSTOM_FLAGS__CUSTOM_WEATHER_EDITING) != 0u) ? 1.f : 0.f)

// Auto exposure tuning
//#define AE_DARK_POWER_OUTDOOR                shader_injection.ae_dark_power_outdoor
#define AE_DYNAMISM_HIGH                       shader_injection.ae_dynamism_high
#define AE_DYNAMISM_LOW                        shader_injection.ae_dynamism_low
#define AE_SPEED                               shader_injection.ae_speed
#define AE_DARK_TO_LIGHT_TIME                  shader_injection.ae_dark_to_light_time
#define AE_LIGHT_TO_DARK_TIME                  shader_injection.ae_light_to_dark_time
#define AE_ENVIRONMENT_BIAS                    shader_injection.ae_environment_bias
#define AE_PERCEPTUAL_MIN_BRIGHTNESS           shader_injection.ae_perceptual_min_brightness
#define AE_PERCEPTUAL_MAX_BRIGHTNESS           shader_injection.ae_perceptual_max_brightness
#define AE_TARGET_SMOOTHING_TIME               shader_injection.ae_target_smoothing_time
#define CUSTOM_TONEMAP_DEBUG                   0
#define CUSTOM_TONEMAP_DEBUG_GRAPH             ((CUSTOM_FLAGS_AS_UINT & CUSTOM_FLAGS__TONEMAP_DEBUG_BIT0) != 0u ? 1.f : 0.f)
#define CUSTOM_TONEMAP_DEBUG_STATS             ((CUSTOM_FLAGS_AS_UINT & CUSTOM_FLAGS__TONEMAP_DEBUG_BIT1) != 0u ? 1.f : 0.f)
#define FOLIAGE_SHADOW_SENSITIVITY             0
#define AE_DARK_POWER_OUTDOOR                  0.45f
#define AE_DARK_POWER_INDOOR                   0.55f
#define AE_BRIGHT_POWER_OUTDOOR                1.00f
#define AE_BRIGHT_POWER_INDOOR                 1.00f
#define AE_ADAPT_SPEED_BOOST                   3.00f
#define AE_EV_BIAS                             -1.00f
// Luminance clamp overrides — locks out per-region/weather dynamic adjustments
#define AE_MIN_LUM                             0.001f
#define AE_MAX_LUM                             10.00f

// Must be 32bit aligned
// Should be 4x32
//
//// GAME BLOWS UP ONCE THERE'S MORE THAN 45 FLOATS ////
// 
//// AMD BLOWS UP AT 43-44 FLOATS BECASUE OF FSR    ////
//
struct ShaderInjectData {
  float peak_white_nits;
  float diffuse_white_nits;
  float graphics_white_nits;
  float custom_flags;

  float tone_map_hue_restore;
  float tone_map_blowout;
  float custom_tone_map_midgray_adjust;
  float color_temp_kelvin;

  float tone_map_exposure;
  float tone_map_highlights;
  float tone_map_shadows;
  float tone_map_contrast;
  float tone_map_saturation;
  float tone_map_cone_response;

  float custom_film_grain;
  float custom_random;
  float custom_chromatic_aberration;
  float custom_sharpening;
  float custom_vignette;
  float local_light_hue_correction;
  float local_light_saturation;

  //float ae_dark_power_outdoor;
  float ae_dynamism_high;
  float ae_dynamism_low;
  float ae_speed;
  float ae_dark_to_light_time;
  float ae_light_to_dark_time;
  float ae_environment_bias;
  float ae_perceptual_min_brightness;
  float ae_perceptual_max_brightness;
  float ae_target_smoothing_time;

  float moon_disk_size;
  float moon_phase_drama;
  float lens_flare_strength;
  float bloom_strength;
  float aurora_brightness;
  float aurora_chance;
  float aurora_night_seed;
  float dawn_dusk_weather_seed;
  float dawn_dusk_weather_blend;
  float milky_way_light_intensity;
};

#ifndef __cplusplus
#if ((__SHADER_TARGET_MAJOR == 5 && __SHADER_TARGET_MINOR >= 1) || __SHADER_TARGET_MAJOR >= 6)
cbuffer injectedBuffer : register(b13, space50) {
#elif (__SHADER_TARGET_MAJOR < 5) || ((__SHADER_TARGET_MAJOR == 5) && (__SHADER_TARGET_MINOR < 1))
cbuffer injectedBuffer : register(b13) {
#endif
  ShaderInjectData shader_injection : packoffset(c0);
}

#if (__SHADER_TARGET_MAJOR >= 6)
#pragma dxc diagnostic ignored "-Wparentheses-equality"
#endif

#include "../../shaders/renodx.hlsl"
#endif

#endif  // SRC_CRIMSONDESERT_SHARED_H_
