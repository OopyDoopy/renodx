#ifndef SRC_CRIMSONDESERT_SHARED_H_
#define SRC_CRIMSONDESERT_SHARED_H_

#define RENODX_TONE_MAP_TYPE                   shader_injection.tone_map_type
#define RENODX_PEAK_WHITE_NITS                 shader_injection.peak_white_nits
#define RENODX_DIFFUSE_WHITE_NITS              shader_injection.diffuse_white_nits
#define RENODX_GRAPHICS_WHITE_NITS             shader_injection.graphics_white_nits
#define RENODX_GAMMA_CORRECTION               0 // shader_injection.gamma_correction

#define RENODX_TONE_MAP_HUE_RESTORE            shader_injection.tone_map_hue_restore
#define RENODX_TONE_MAP_BLOWOUT                shader_injection.tone_map_blowout
#define RENODX_COLOR_GRADE_STRENGTH            1.f

#define RENODX_TONE_MAP_EXPOSURE               shader_injection.tone_map_exposure
#define RENODX_TONE_MAP_HIGHLIGHTS             shader_injection.tone_map_highlights
#define RENODX_TONE_MAP_SHADOWS                shader_injection.tone_map_shadows
#define RENODX_TONE_MAP_CONTRAST               shader_injection.tone_map_contrast
#define RENODX_TONE_MAP_SATURATION             shader_injection.tone_map_saturation
#define RENODX_TONE_MAP_ADAPTATION_CONTRAST    shader_injection.tone_map_adaptation_contrast

#define CUSTOM_FILM_GRAIN_TYPE                 shader_injection.custom_film_grain_type
#define CUSTOM_FILM_GRAIN_STRENGTH             shader_injection.custom_film_grain
#define CUSTOM_RANDOM                          shader_injection.custom_random
#define CUSTOM_CHROMATIC_ABERRATION            shader_injection.custom_chromatic_aberration
#define CUSTOM_SHARPENING                      shader_injection.custom_sharpening
#define LENS_FLARE_STRENGTH                    shader_injection.lens_flare_strength
#define BLOOM_STRENGTH                         shader_injection.bloom_strength

#define SHADOW_DEBUG_MODE                      shader_injection.shadow_debug_mode
#define SHADOW_DISABLE_LAYER                   shader_injection.shadow_disable_layer
#define CONTACT_SHADOW_QUALITY                 shader_injection.contact_shadow_quality
#define SHADOW_QUALITY                         shader_injection.shadow_quality
#define RT_QUALITY                             shader_injection.rt_quality
#define DIFFUSE_BRDF_MODE                      shader_injection.diffuse_brdf_mode
#define SMOOTH_TERMINATOR                      shader_injection.smooth_terminator
#define SPECULAR_AA                            shader_injection.specular_aa
#define DIFFRACTION                            shader_injection.diffraction
#define LOCAL_LIGHT_HUE_CORRECTION             shader_injection.local_light_hue_correction
#define LOCAL_LIGHT_SATURATION                 shader_injection.local_light_saturation
#define DISABLE_AWB                            shader_injection.disable_awb
#define DISABLE_HERO_LIGHTS                    shader_injection.disable_hero_lights
#define IMPROVED_AUTO_EXPOSURE                 shader_injection.improved_auto_exposure
#define SUN_MOON_ADJUSTMENTS                   shader_injection.sun_moon_adjustments
#define MOON_DISK_SIZE                         shader_injection.moon_disk_size
#define SKY_SCATTERING                         shader_injection.sky_scattering

// Auto exposure tuning
#define AE_DARK_POWER_OUTDOOR                  shader_injection.ae_dark_power_outdoor
#define AE_DARK_POWER_INDOOR                   shader_injection.ae_dark_power_indoor
#define AE_BRIGHT_POWER_OUTDOOR                shader_injection.ae_bright_power_outdoor
#define AE_BRIGHT_POWER_INDOOR                 shader_injection.ae_bright_power_indoor
#define AE_ADAPT_SPEED_BOOST                   shader_injection.ae_adapt_speed_boost
#define AE_EV_BIAS                             shader_injection.ae_ev_bias
// Luminance clamp overrides — locks out per-region/weather dynamic adjustments
#define AE_MIN_LUM                             shader_injection.ae_min_lum
#define AE_MAX_LUM                             shader_injection.ae_max_lum
// Tonemap highlight dimming (hardcoded defaults)
#define AE_TRANSITION_THRESHOLD                0.0f
#define AE_KNEE_ADAPTED                        0.0f
#define AE_KNEE_TRANSITION                     0.0f
#define AE_COMPRESS_MAX                        0.0f

//#define TONEMAP_UNDER_UI                      shader_injection.tonemap_under_ui

// Must be 32bit aligned
// Should be 4x32
struct ShaderInjectData {
  float peak_white_nits;
  float diffuse_white_nits;
  float graphics_white_nits;
  float tone_map_type;

  float tone_map_hue_restore;
  float tone_map_blowout;
  float color_grade_strength;

  float tone_map_exposure;
  float tone_map_highlights;
  float tone_map_shadows;
  float tone_map_contrast;
  float tone_map_saturation;
  float tone_map_adaptation_contrast;

  float custom_film_grain_type;
  float custom_film_grain;
  float custom_random;
  float custom_chromatic_aberration;
  float custom_sharpening;
  float shadow_debug_mode;
  float shadow_disable_layer;
  float contact_shadow_quality;
  float shadow_quality;
  float rt_quality;
  float diffuse_brdf_mode;
  float smooth_terminator;
  float specular_aa;
  float diffraction;
  float local_light_hue_correction;
  float local_light_saturation;
  float disable_awb;
  float disable_hero_lights;
  float improved_auto_exposure;
  float sun_moon_adjustments;
  float moon_disk_size;
  float sky_scattering;
  float lens_flare_strength;
  float bloom_strength;

  float ae_dark_power_outdoor;
  float ae_dark_power_indoor;
  float ae_bright_power_outdoor;
  float ae_bright_power_indoor;
  float ae_adapt_speed_boost;
  float ae_ev_bias;
  float ae_min_lum;
  float ae_max_lum;
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
