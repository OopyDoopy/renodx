#version 450
#include "./shared.h"
#include "./macleod_boynton.hlsli"
#ifndef USE_MOVE_TONEMAP
#define USE_MOVE_TONEMAP 0
#endif
#ifndef USE_FX
#define USE_FX 1
#endif
#ifndef USE_LUT
#define USE_LUT 0
#endif
#ifndef USE_WOODED_TONEMAP
#define USE_WOODED_TONEMAP 0
#endif
#ifndef USE_SUB_TONEMAP
#define USE_SUB_TONEMAP 0
#endif
#ifndef USE_FLY_TONEMAP
#define USE_FLY_TONEMAP 0
#endif
#ifndef USE_DESERT
#define USE_DESERT 0
#endif
#ifndef USE_BEACH_TONEMAP
#define USE_BEACH_TONEMAP 0
#endif
#ifndef USE_MOON_TONEMAP
#define USE_MOON_TONEMAP 0
#endif
#ifndef HARD_BLOOM
#define HARD_BLOOM false
#endif
#ifndef USE_TONEMAP_OUTPUT1
#define USE_TONEMAP_OUTPUT1 1
#endif

#if USE_MOVE_TONEMAP

layout(set = 0, binding = 22, std140) uniform fp_c3 {
  vec4 _m0[4096];
}
fp_c3_1;
#endif

layout(set = 0, binding = 23, std140) uniform fp_c4 {
  vec4 _m0[4096];
}
fp_c4_1;

#if USE_MOON_TONEMAP
layout(set = 0, binding = 20, std140) uniform fp_c1 {
  vec4 _m0[4096];
}
fp_c1_1;
#endif

#if USE_WOODED_TONEMAP || USE_FLY_TONEMAP || USE_MOON_TONEMAP
layout(set = 2, binding = 128) uniform sampler2D fp_t_tcb_E;
#if USE_WOODED_TONEMAP && USE_MOVE_TONEMAP
layout(set = 2, binding = 129) uniform sampler2D fp_t_tcb_10;
layout(set = 2, binding = 130) uniform sampler2D fp_t_tcb_12;
layout(set = 2, binding = 131) uniform sampler2D fp_t_tcb_1E;
layout(set = 2, binding = 132) uniform sampler2D fp_t_tcb_8;
 #if USE_LUT
layout(set = 2, binding = 133) uniform sampler3D fp_t_tcb_C;
 #endif
#else
layout(set = 2, binding = 129) uniform sampler2D fp_t_tcb_12;
layout(set = 2, binding = 130) uniform sampler2D fp_t_tcb_10;
layout(set = 2, binding = 131) uniform sampler2D fp_t_tcb_8;
#if USE_LUT
layout(set = 2, binding = 132) uniform sampler3D fp_t_tcb_C;
#endif
#endif

#elif USE_MOVE_TONEMAP
layout(set = 2, binding = 128) uniform sampler2D fp_t_tcb_1E;
layout(set = 2, binding = 129) uniform sampler2D fp_t_tcb_10;
layout(set = 2, binding = 130) uniform sampler2D fp_t_tcb_8;
#if USE_FX
layout(set = 2, binding = 131) uniform sampler2D fp_t_tcb_18;
#endif
#if USE_LUT
#if USE_FX
layout(set = 2, binding = 132) uniform sampler3D fp_t_tcb_C;
#else
layout(set = 2, binding = 131) uniform sampler3D fp_t_tcb_C;
#endif
#endif

#else
layout(set = 2, binding = 128) uniform sampler2D fp_t_tcb_10;
layout(set = 2, binding = 129) uniform sampler2D fp_t_tcb_8;
#if USE_FX
layout(set = 2, binding = 130) uniform sampler2D fp_t_tcb_18;
#endif
#if USE_LUT
#if USE_FX
layout(set = 2, binding = 131) uniform sampler3D fp_t_tcb_C;
#else
layout(set = 2, binding = 130) uniform sampler3D fp_t_tcb_C;
#endif
#endif

#endif

layout(location = 0) in vec4 v0;
layout(location = 1) in vec4 v1;
#if USE_WOODED_TONEMAP || USE_FLY_TONEMAP || USE_MOON_TONEMAP
layout(location = 2) in vec4 v2;
#endif
layout(location = 0) out vec4 oColor0;
// #if USE_TONEMAP_OUTPUT1
layout(location = 1) out vec4 oColor1;
//#endif

static const float kHueTransferChromaStart = 0.02;
static const float kHueTransferChromaEnd = 0.12;

void main() {
  vec2 uv = v0.xy;
  vec4 raw = texture(fp_t_tcb_8, uv);
  vec3 key = raw.xyz;
  vec3 out_rgb = raw.xyz;

#if USE_WOODED_TONEMAP
  vec2 uv_e = v1.xy;
  float blend_weight = v2.w;

  vec3 tex_e = texture(fp_t_tcb_E, uv_e).xyz;
  vec3 tex_10 = texture(fp_t_tcb_10, uv).xyz;
  vec3 tex_12 = texture(fp_t_tcb_12, uv).xyz;

  vec3 e_scaled = fma(tex_e, vec3(fp_c4_1._m0[1].z), vec3(fp_c4_1._m0[1].y));
  vec3 mixed = fma(e_scaled, tex_12, tex_10);

#if USE_MOVE_TONEMAP
  vec4 c3_2 = fp_c3_1._m0[2];
  vec4 c3_3 = fp_c3_1._m0[3];

  float lod_depth = fma(c3_3.z, c3_2.z, -c3_2.z) + 1.0;
  float lod_log = log2(lod_depth);
  float radial_norm = 1.0 / (1.0 - c3_2.y);

  vec2 radial_offset = uv - c3_3.xy;
  float radial_dist = length(radial_offset);
  float radial_gate = clamp(fma(radial_dist, 2.0, -c3_2.y), 0.0, 1.0);
  float radial_mix = clamp(radial_gate * radial_norm, 0.0, 1.0);

  float lod_scale = min(lod_log, c3_2.w) * c3_3.w;
  float lod_level = radial_mix * lod_scale;
  vec3 motion = textureLod(fp_t_tcb_1E, uv, lod_level).xyz;

  float motion_gate = clamp(fma(radial_mix, clamp(lod_scale + 1.0, 0.0, 1.0), radial_gate * c3_2.x), 0.0, 1.0);
  vec3 blended = mix(raw.xyz, motion, vec3(motion_gate));
  vec3 woodkey = blend_weight * (blended + mixed);
  float scale = 1;
  if (RENODX_TONE_MAP_TYPE != 0) scale = renodx::tonemap::neutwo::ComputeMaxChannelScale(woodkey);
  woodkey *= scale;

  vec3 exp_rgb = exp2(woodkey * -log2(fp_c4_1._m0[6].xyz));
  vec2 lut_scale_bias = fp_c4_1._m0[5].zw;
  vec3 lut_coord = fma(exp_rgb, vec3(-lut_scale_bias.x), vec3(lut_scale_bias.x + lut_scale_bias.y));
#else
  vec3 woodkey = blend_weight * (raw.xyz + mixed);

  float scale = 1;
  if (RENODX_TONE_MAP_TYPE != 0) scale = renodx::tonemap::neutwo::ComputeMaxChannelScale(woodkey);
  woodkey *= scale;
  vec3 log_scale = log2(fp_c4_1._m0[6].xyz);
  vec3 exp_rgb = exp2(woodkey * -log_scale);

  vec2 lut_scale_bias = fp_c4_1._m0[5].zw;
  vec3 lut_coord = fma(exp_rgb, vec3(-lut_scale_bias.x), vec3(lut_scale_bias.x + lut_scale_bias.y));
#endif

#if USE_LUT
  if (RENODX_TONE_MAP_TYPE == 0) woodkey = renodx::tonemap::ExponentialRollOff(woodkey);
  out_rgb = lerp(woodkey, texture(fp_t_tcb_C, lut_coord).xyz, LUT_STRENGTH);
  out_rgb /= scale;
#else
  out_rgb = lut_coord /= scale;
#endif
  key = out_rgb;
  out_rgb = renodx::tonemap::ExponentialRollOff(key);

#elif USE_FLY_TONEMAP
  vec2 uv_e = v1.xy;
  float blend_weight = v2.w;

  vec3 tex_e = texture(fp_t_tcb_E, uv_e).xyz;
  vec3 tex_12 = texture(fp_t_tcb_12, uv).xyz;
  vec3 tex_10 = texture(fp_t_tcb_10, uv).xyz;

  vec3 e_scaled = fma(tex_e, vec3(fp_c4_1._m0[1].z), vec3(fp_c4_1._m0[1].y));
  key = blend_weight * (raw.xyz + fma(e_scaled, tex_12, tex_10));

  float threshold = fp_c4_1._m0[10].y;
  bvec3 use_params11 = lessThan(key, vec3(threshold));

  vec4 tone_params_low = fp_c4_1._m0[11];
  vec4 tone_params_high = fp_c4_1._m0[12];

  vec3 num_slope = mix(vec3(tone_params_high.x), vec3(tone_params_low.x), use_params11);
  vec3 den_slope = mix(vec3(tone_params_high.y), vec3(tone_params_low.y), use_params11);
  vec3 num_offset = mix(vec3(tone_params_high.z), vec3(tone_params_low.z), use_params11);
  vec3 den_offset = mix(vec3(tone_params_high.w), vec3(tone_params_low.w), use_params11);

  out_rgb = (key * num_slope + num_offset) / (key * den_slope + den_offset);

#elif USE_MOON_TONEMAP
  vec2 uv_e = v1.xy;
  float blend_weight = v2.w;

  vec3 tex_e = texture(fp_t_tcb_E, uv_e).xyz;
  vec3 tex_12 = texture(fp_t_tcb_12, uv).xyz;
  vec3 tex_10 = texture(fp_t_tcb_10, uv).xyz;

  vec3 e_scaled = fma(tex_e, vec3(fp_c4_1._m0[1].z), vec3(fp_c4_1._m0[1].y));
  vec3 mixed = fma(e_scaled, tex_12, tex_10);

  // Moon path keeps channel-swizzled packing before rational curve/LUT.
  float key_r = blend_weight * (raw.x + mixed.x);
  float key_g = blend_weight * (raw.y + mixed.y);
  float key_b = blend_weight * (raw.z + mixed.z);
  vec3 moon_key = vec3(key_r, key_g, key_b);

  float threshold = fp_c4_1._m0[10].y;
  bvec3 use_low = lessThan(moon_key, vec3(threshold));

  vec4 tone_params_low = fp_c4_1._m0[11];
  vec4 tone_params_high = fp_c4_1._m0[12];

  vec3 num_slope = mix(vec3(tone_params_high.x), vec3(tone_params_low.x), use_low);
  vec3 den_slope = mix(vec3(tone_params_high.y), vec3(tone_params_low.y), use_low);
  vec3 num_offset = mix(vec3(tone_params_high.z), vec3(tone_params_low.z), use_low);
  vec3 den_offset = mix(vec3(tone_params_high.w), vec3(tone_params_low.w), use_low);

  vec3 ratio = (moon_key * num_slope + num_offset) / (moon_key * den_slope + den_offset);

#if USE_LUT
  vec2 moon_lut_scale_bias = fp_c4_1._m0[5].zw;
  vec3 moon_lut_coord = fma(ratio, vec3(moon_lut_scale_bias.x), vec3(moon_lut_scale_bias.y));
  vec3 lut_rgb = texture(fp_t_tcb_C, moon_lut_coord).xyz;

  float moon_luma = dot(lut_rgb, vec3(0.298911988735198974609375, fp_c1_1._m0[0].x, fp_c1_1._m0[0].y));

  float ramp_y = clamp((moon_luma - fp_c4_1._m0[7].y) / fp_c4_1._m0[8].y, 0.0, 1.0);
  float ramp_x = clamp((moon_luma - fp_c4_1._m0[7].x) / fp_c4_1._m0[8].x, 0.0, 1.0);
  float ramp_z = clamp((moon_luma - fp_c4_1._m0[7].z) / fp_c4_1._m0[8].z, 0.0, 1.0);

  float smooth_y = ramp_y * ramp_y * (3.0 - 2.0 * ramp_y);
  float smooth_x = ramp_x * ramp_x * (3.0 - 2.0 * ramp_x);
  float smooth_z = ramp_z * ramp_z * (3.0 - 2.0 * ramp_z);

  float moon_gate = clamp((smooth_y + smooth_x + smooth_z) * 0.3333300054073333740234375, 0.0, 1.0);
  moon_gate = max(moon_gate, clamp(1.0 - fp_c4_1._m0[6].w, 0.0, 1.0));

  vec3 pow4 = lut_rgb * lut_rgb * lut_rgb * lut_rgb;
  out_rgb = lerp(pow4, lut_rgb, moon_gate);
#else
  out_rgb = ratio;
#endif
  key = out_rgb;

#else
  float blend_weight = v1.w;

#if USE_BEACH_TONEMAP
  vec3 glow = texture(fp_t_tcb_10, uv).xyz;
  vec3 packed = blend_weight * (raw.xyz + glow);
  bool scale = false;
  if (RENODX_TONE_MAP_TYPE != 0) scale = true;

#if USE_LUT
  out_rgb = lerp(packed, lut(packed, scale), LUT_STRENGTH);
#else
  out_rgb = packed;
#endif
  key = out_rgb;
  out_rgb = lerp(renodx::tonemap::ExponentialRollOff(packed), lut(packed), LUT_STRENGTH);

#elif USE_DESERT && USE_FX
  vec3 glow = texture(fp_t_tcb_10, uv).xyz;
  vec4 effects = texture(fp_t_tcb_18, uv);
  vec3 packed = blend_weight * (raw.xyz + glow);

  vec3 exp_rgb = exp2(-packed * log2(fp_c4_1._m0[6].xyz));
  out_rgb = effects.xyz + effects.w * (RENODX_TONE_MAP_TYPE == 0 ? 1 - exp_rgb : packed);
  key = out_rgb;

#elif USE_SUB_TONEMAP
  vec3 glow = texture(fp_t_tcb_10, uv).xyz;
  out_rgb = blend_weight * (raw.xyz + glow);
  if (RENODX_TONE_MAP_TYPE == 0) out_rgb = 1.0 - exp(-out_rgb);
  key = out_rgb;
  out_rgb = renodx::tonemap::ExponentialRollOff(key);
#else

  float bloom_scale = HARD_BLOOM ? 1.0 : CUSTOM_BLOOM;
  vec3 glow = texture(fp_t_tcb_10, uv).xyz * bloom_scale;
#if USE_FX
  vec4 effects = texture(fp_t_tcb_18, uv);
#endif

  key = blend_weight * (raw.xyz + glow);
#if USE_MOVE_TONEMAP
  vec4 c3_2 = fp_c3_1._m0[2];
  vec4 c3_3 = fp_c3_1._m0[3];

  float lod_depth = fma(c3_3.z, c3_2.z, -c3_2.z) + 1.0;
  float lod_log = log2(lod_depth);
  float radial_norm = 1.0 / (1.0 - c3_2.y);

  vec2 radial_offset = uv - c3_3.xy;
  float radial_dist = length(radial_offset);
  float radial_gate = clamp(fma(radial_dist, 2.0, -c3_2.y), 0.0, 1.0);
  float radial_mix = clamp(radial_gate * radial_norm, 0.0, 1.0);

  float lod_scale = min(lod_log, c3_2.w) * c3_3.w;
  float lod_level = radial_mix * lod_scale;

  vec3 motion = textureLod(fp_t_tcb_1E, uv, lod_level).xyz;

  float motion_gate = clamp(fma(radial_mix, clamp(lod_scale + 1.0, 0.0, 1.0), radial_gate * c3_2.x), 0.0, 1.0);
  vec3 blended = mix(raw.xyz, motion, vec3(motion_gate));
  key = blend_weight * (blended + glow);
#endif

  float threshold = fp_c4_1._m0[10].y;
  bvec3 use_params11 = lessThan(key, vec3(threshold));

  vec4 tone_params_low = fp_c4_1._m0[11];
  vec4 tone_params_high = fp_c4_1._m0[12];

  vec3 num_slope = mix(vec3(tone_params_high.x), vec3(tone_params_low.x), use_params11);
  vec3 den_slope = mix(vec3(tone_params_high.y), vec3(tone_params_low.y), use_params11);
  vec3 num_offset = mix(vec3(tone_params_high.z), vec3(tone_params_low.z), use_params11);
  vec3 den_offset = mix(vec3(tone_params_high.w), vec3(tone_params_low.w), use_params11);

  vec3 ratio = (key * num_slope + num_offset) / (key * den_slope + den_offset);
  out_rgb = ratio;

#endif

#endif

  //#if USE_TONEMAP_OUTPUT1
  float luma = dot(out_rgb, fp_c4_1._m0[13].xyz);
  //#endif

  float hue_transfer_strength = RENODX_COLOR_GRADE_STRENGTH * ComputeHueTransferStrength(out_rgb);
  key = CorrectHueAndPurityMBBT709WithBT2020(key, out_rgb, hue_transfer_strength, RENODX_TONE_MAP_BLOWOUT);
  if (RENODX_TONE_MAP_TYPE != 0) out_rgb = key.xyz;

#if USE_FX
#if !USE_WOODED_TONEMAP && !USE_SUB_TONEMAP && !USE_FLY_TONEMAP && !USE_DESERT
  out_rgb = out_rgb * effects.w + effects.xyz;
#endif
#endif
#if USE_LUT
#if !USE_WOODED_TONEMAP && !USE_BEACH_TONEMAP && !USE_MOON_TONEMAP
  float scale = 1;
  if (RENODX_TONE_MAP_TYPE != 0) scale = renodx::tonemap::neutwo::ComputeMaxChannelScale(out_rgb);
  out_rgb *= scale;
  vec2 lut_scale_bias = fp_c4_1._m0[5].zw;
  vec3 lut_coord = fma(out_rgb, vec3(lut_scale_bias.x), vec3(lut_scale_bias.y));
  vec3 out_lut = texture(fp_t_tcb_C, lut_coord).xyz;
  out_rgb = lerp(out_rgb, out_lut, LUT_STRENGTH) / scale;
#endif
#endif
  out_rgb = renodx::color::bt2020::from::BT709(out_rgb);
  out_rgb = colourGrade(out_rgb);
  float peak = RENODX_PEAK_WHITE_NITS / RENODX_DIFFUSE_WHITE_NITS;
  if (RENODX_GAMMA_CORRECTION == 1.0) {
    peak = renodx::color::correct::GammaSafe(peak, true);
  }
  if (RENODX_GAMMA_CORRECTION == 2.0) {
    peak = renodx::color::correct::GammaSafe(peak, true, 2.4);
  }

  out_rgb = renodx::tonemap::neutwo::PerChannel(out_rgb, peak);
  out_rgb = renodx::color::bt709::from::BT2020(out_rgb);

  out_rgb = renodx::draw::RenderIntermediatePass(out_rgb);
  oColor0 = vec4(out_rgb, raw.w);
//   #if USE_TONEMAP_OUTPUT1
  oColor1 = vec4(luma, 0.0, 0.0, 0.0);
//   #endif
}

float ComputeHueTransferStrength(float3 donor) {
  float donor_max = max(donor.r, max(donor.g, donor.b));
  float donor_min = min(donor.r, min(donor.g, donor.b));
  float donor_chroma = renodx::math::DivideSafe(donor_max - donor_min, donor_max, 0.f);
  return smoothstep(kHueTransferChromaStart, kHueTransferChromaEnd, donor_chroma);
}

vec3 colourGrade(vec3 colour) {
  // colour grade (stupid)
  renodx::draw::Config config = renodx::draw::BuildConfig();
  config.tone_map_exposure = RENODX_TONE_MAP_EXPOSURE;
  config.tone_map_highlights = RENODX_TONE_MAP_HIGHLIGHTS;
  config.tone_map_shadows = RENODX_TONE_MAP_SHADOWS;
  config.tone_map_contrast = RENODX_TONE_MAP_CONTRAST;
  config.tone_map_saturation = RENODX_TONE_MAP_SATURATION;
  config.tone_map_blowout = RENODX_TONE_MAP_HIGHLIGHT_SATURATION;
  config.tone_map_type = 1;
  // config.highlights = RENODX_TONE_MAP_HIGHLIGHT_SATURATION;
  config.tone_map_flare = 0.10f * pow(RENODX_TONE_MAP_FLARE, 10.f);

  return renodx::draw::ToneMapPass(colour, config);
}

#if USE_BEACH_TONEMAP
vec3 lut(vec3 input, bool scale = false) {
  float lutScale = 1;
  if (scale) lutScale = renodx::tonemap::neutwo::ComputeMaxChannelScale(input);
  input *= lutScale;

  vec3 exp_rgb = exp2(input * vec3(-1.44269502162933349609375));
  vec2 lut_scale_bias = fp_c4_1._m0[5].zw;
  vec3 lut_coord = fma(exp_rgb, vec3(-lut_scale_bias.x), vec3(lut_scale_bias.x + lut_scale_bias.y));
  return texture(fp_t_tcb_C, lut_coord).xyz / lutScale;
}
#endif