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
#if USE_MOVE_TONEMAP
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
#if USE_TONEMAP_OUTPUT1
layout(location = 1) out vec4 oColor1;
#endif

static const float kHueTransferChromaStart = 0.02;
static const float kHueTransferChromaEnd = 0.12;
static const float kLnToLog2 = 1.44269502162933349609375;

vec3 TonemapVanilla(vec3 key) {
  float threshold = fp_c4_1._m0[10].y;
  bvec3 use_low = lessThan(key, vec3(threshold));

  vec4 params_low = fp_c4_1._m0[11];
  vec4 params_high = fp_c4_1._m0[12];

  vec3 num_slope = mix(vec3(params_high.x), vec3(params_low.x), use_low);
  vec3 den_slope = mix(vec3(params_high.y), vec3(params_low.y), use_low);
  vec3 num_offset = mix(vec3(params_high.z), vec3(params_low.z), use_low);
  vec3 den_offset = mix(vec3(params_high.w), vec3(params_low.w), use_low);

  return (key * num_slope + num_offset) / (key * den_slope + den_offset);
}

float TonemapVanillaScalar(float x) {
  bool use_low = x < fp_c4_1._m0[10].y;
  vec4 params = use_low ? fp_c4_1._m0[11] : fp_c4_1._m0[12];
  return (x * params.x + params.z) / (x * params.y + params.w);
}

float TonemapVanillaScalarSlope(float x) {
  bool use_low = x < fp_c4_1._m0[10].y;
  vec4 params = use_low ? fp_c4_1._m0[11] : fp_c4_1._m0[12];
  float den = x * params.y + params.w;
  return (params.x * params.w - params.y * params.z) / (den * den);
}

vec3 TonemapHdrShoulder(vec3 key, vec3 vanilla) {
  float max_channel = renodx::math::Max(key);
  if (max_channel <= 1.0) {
    return vanilla;
  }

  vec3 normalized = key / max(max_channel, 1e-6);
  vec3 extended = TonemapVanilla(normalized) * max_channel;

  float highlight_blend = smoothstep(1.0, 2.0, max_channel);
  return lerp(vanilla, extended, highlight_blend);
}

vec3 Tonemap(vec3 key) {
  vec3 vanilla = TonemapVanilla(key);
  if (RENODX_TONE_MAP_TYPE == 0) {
    return vanilla;
  }
  return TonemapHdrShoulder(key, vanilla);
}

#if USE_LUT
float ComputeLutScale(vec3 input_rgb, bool enable_hdr_max_scale) {
  if (enable_hdr_max_scale) {
    return renodx::tonemap::neutwo::ComputeMaxChannelScale(input_rgb);
  }
  return 1.0;
}

vec3 EncodeLinearLutCoord(vec3 scaled_input_rgb) {
  vec2 lut_scale_bias = fp_c4_1._m0[5].zw;
  return fma(scaled_input_rgb, vec3(lut_scale_bias.x), vec3(lut_scale_bias.y));
}

vec3 EncodeExpLutCoord(vec3 scaled_input_rgb, vec3 exp2_coeff) {
  vec3 exp_rgb = exp2(scaled_input_rgb * exp2_coeff);
  vec2 lut_scale_bias = fp_c4_1._m0[5].zw;
  return fma(exp_rgb, vec3(-lut_scale_bias.x), vec3(lut_scale_bias.x + lut_scale_bias.y));
}

vec3 SampleScaledLut(vec3 lut_coord, float lut_scale) {
  return texture(fp_t_tcb_C, lut_coord).xyz / lut_scale;
}

vec3 SampleLinearLut(vec3 input_rgb, bool enable_hdr_max_scale) {
  float lut_scale = ComputeLutScale(input_rgb, enable_hdr_max_scale);
  vec3 scaled_input = input_rgb * lut_scale;
  return SampleScaledLut(EncodeLinearLutCoord(scaled_input), lut_scale);
}

vec3 SampleExpLut(vec3 input_rgb, vec3 exp2_coeff, bool enable_hdr_max_scale) {
  float lut_scale = ComputeLutScale(input_rgb, enable_hdr_max_scale);
  vec3 scaled_input = input_rgb * lut_scale;
  return SampleScaledLut(EncodeExpLutCoord(scaled_input, exp2_coeff), lut_scale);
}

vec3 ApplyGenericLut(vec3 input_rgb) {
  vec3 out_lut = SampleLinearLut(input_rgb, true);
  return lerp(input_rgb, out_lut, LUT_STRENGTH);
}

vec3 ComputeLutMbtTarget(vec3 original_rgb, vec3 unscaled_lut_rgb) {
  vec3 original_exp = renodx::tonemap::ExponentialRollOff(original_rgb);
  return lerp(original_exp, unscaled_lut_rgb, LUT_STRENGTH);
}
#endif

#if USE_BEACH_TONEMAP
vec3 SampleBeachLut(vec3 input_rgb, bool enable_hdr_max_scale = false) {
  return SampleExpLut(input_rgb, vec3(-kLnToLog2), enable_hdr_max_scale);
}
#endif

#if USE_MOON_TONEMAP
vec3 ApplyMoonLutShaping(vec3 lut_rgb) {
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
  return lerp(pow4, lut_rgb, moon_gate);
}
#endif

vec3 ApplyRenodxTail(vec3 hdr, vec3 sdr_target) {
  float hue_transfer_strength = RENODX_COLOR_GRADE_STRENGTH * ComputeHueTransferStrength(sdr_target);
  hdr = CorrectHueAndPurityMBBT709WithBT2020(hdr, sdr_target, hue_transfer_strength, RENODX_TONE_MAP_BLOWOUT);
  if (RENODX_TONE_MAP_TYPE != 0) {
    sdr_target = hdr.xyz;
  }
  vec3 out_rgb = sdr_target;

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
  return renodx::draw::RenderIntermediatePass(out_rgb);
}

#if USE_MOVE_TONEMAP
vec3 ComputeMoveBlendedKey(vec2 uv, vec3 raw_rgb, float blend_weight, vec3 additive) {
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
  vec3 blended = mix(raw_rgb, motion, vec3(motion_gate));
  return blend_weight * (blended + additive);
}
#endif

void main() {
  vec2 uv = v0.xy;
  vec4 raw = texture(fp_t_tcb_8, uv);
  vec3 key = raw.xyz;
  vec3 out_rgb = raw.xyz;
  vec3 mbt_target = out_rgb;

#if USE_WOODED_TONEMAP
  vec2 uv_e = v1.xy;
  float blend_weight = v2.w;

  vec3 tex_e = texture(fp_t_tcb_E, uv_e).xyz;
  vec3 tex_10 = texture(fp_t_tcb_10, uv).xyz;
  vec3 tex_12 = texture(fp_t_tcb_12, uv).xyz;

  vec3 e_scaled = fma(tex_e, vec3(fp_c4_1._m0[1].z), vec3(fp_c4_1._m0[1].y));
  vec3 mixed = fma(e_scaled, tex_12, tex_10);
  vec3 woodkey;

#if USE_MOVE_TONEMAP
  woodkey = ComputeMoveBlendedKey(uv, raw.xyz, blend_weight, mixed);
#else
  woodkey = blend_weight * (raw.xyz + mixed);
#endif

  float wood_lut_scale = ComputeLutScale(woodkey, true);
  vec3 wood_lut_coord = EncodeExpLutCoord(woodkey * wood_lut_scale, -log2(fp_c4_1._m0[6].xyz));

#if USE_LUT
  vec3 wood_base = woodkey;
  if (RENODX_TONE_MAP_TYPE == 0) {
    wood_base = renodx::tonemap::ExponentialRollOff(wood_base);
  }
  vec3 wood_lut = SampleScaledLut(wood_lut_coord, wood_lut_scale);
  vec3 wood_lut_unscaled = SampleExpLut(woodkey, -log2(fp_c4_1._m0[6].xyz), false);
  out_rgb = lerp(wood_base, wood_lut, LUT_STRENGTH);
  mbt_target = wood_lut_unscaled;
#else
  out_rgb = wood_lut_coord / wood_lut_scale;
#endif
  key = out_rgb;
  out_rgb = renodx::tonemap::ExponentialRollOff(key);
#if !USE_LUT
  mbt_target = out_rgb;
#endif

#elif USE_FLY_TONEMAP
  vec2 uv_e = v1.xy;
  float blend_weight = v2.w;

  vec3 tex_e = texture(fp_t_tcb_E, uv_e).xyz;
  vec3 tex_12 = texture(fp_t_tcb_12, uv).xyz;
  vec3 tex_10 = texture(fp_t_tcb_10, uv).xyz;

  vec3 e_scaled = fma(tex_e, vec3(fp_c4_1._m0[1].z), vec3(fp_c4_1._m0[1].y));
  key = blend_weight * (raw.xyz + fma(e_scaled, tex_12, tex_10));

  out_rgb = TonemapVanilla(key);
  mbt_target = out_rgb;
  key = Tonemap(key);

#elif USE_MOON_TONEMAP
  vec2 uv_e = v1.xy;
  float blend_weight = v2.w;

  vec3 tex_e = texture(fp_t_tcb_E, uv_e).xyz;
  vec3 tex_12 = texture(fp_t_tcb_12, uv).xyz;
  vec3 tex_10 = texture(fp_t_tcb_10, uv).xyz;

  vec3 e_scaled = fma(tex_e, vec3(fp_c4_1._m0[1].z), vec3(fp_c4_1._m0[1].y));
  vec3 mixed = fma(e_scaled, tex_12, tex_10);
  vec3 moon_key_base;

#if USE_MOVE_TONEMAP
  moon_key_base = ComputeMoveBlendedKey(uv, raw.xyz, blend_weight, mixed);
#else
  moon_key_base = blend_weight * (raw.xyz + mixed);
#endif

  // Moon path keeps channel-swizzled packing before rational curve/LUT.
  float key_r = moon_key_base.x;
  float key_g = moon_key_base.y;
  float key_b = moon_key_base.z;
  vec3 moon_key = vec3(key_r, key_g, key_b);

  vec3 ratio = Tonemap(moon_key);

#if USE_LUT
  vec3 lut_rgb = SampleLinearLut(ratio, true);
  vec3 moon_lut_unscaled = SampleLinearLut(ratio, false);
  out_rgb = ApplyMoonLutShaping(lut_rgb);
  mbt_target = ApplyMoonLutShaping(moon_lut_unscaled);
#else
  out_rgb = ratio;
#endif
  key = out_rgb;
#if !USE_LUT
  mbt_target = out_rgb;
#endif

#else
  float blend_weight = v1.w;

#if USE_BEACH_TONEMAP
  vec3 glow = texture(fp_t_tcb_10, uv).xyz;
  vec3 packed = blend_weight * (raw.xyz + glow);

#if USE_LUT
  out_rgb = lerp(packed, SampleBeachLut(packed, RENODX_TONE_MAP_TYPE != 0), LUT_STRENGTH);
  mbt_target = lerp(renodx::tonemap::ExponentialRollOff(packed), SampleBeachLut(packed), LUT_STRENGTH);
#else
  out_rgb = packed;
  mbt_target = out_rgb;
#endif
  key = out_rgb;

#elif USE_DESERT && USE_FX
  vec3 glow = texture(fp_t_tcb_10, uv).xyz;
  vec4 effects = texture(fp_t_tcb_18, uv);
  vec3 packed = blend_weight * (raw.xyz + glow);

  vec3 exp_rgb = exp2(-packed * log2(fp_c4_1._m0[6].xyz));
  out_rgb = effects.xyz + effects.w * (RENODX_TONE_MAP_TYPE == 0 ? 1 - exp_rgb : packed);
  key = out_rgb;
  mbt_target = effects.xyz + effects.w * (1 - exp_rgb);

#elif USE_SUB_TONEMAP
  vec3 glow = texture(fp_t_tcb_10, uv).xyz;
  vec3 sub_rgb = blend_weight * (raw.xyz + glow);
  vec3 sub_sdr = renodx::tonemap::ExponentialRollOff(sub_rgb);

  out_rgb = sub_sdr;
  mbt_target = sub_sdr;
  key = sub_rgb;
#else

  float bloom_scale = HARD_BLOOM ? 1.0 : CUSTOM_BLOOM;
  vec3 glow = texture(fp_t_tcb_10, uv).xyz * bloom_scale;
#if USE_FX
  vec4 effects = texture(fp_t_tcb_18, uv);
#endif
  key = blend_weight * (raw.xyz + glow);
#if USE_MOVE_TONEMAP
  key = ComputeMoveBlendedKey(uv, raw.xyz, blend_weight, glow);
#endif
  out_rgb = key;
  mbt_target = key;
  out_rgb = TonemapVanilla(out_rgb);
  mbt_target = TonemapVanilla(mbt_target);
  key = Tonemap(key);
#endif
#endif
#if USE_TONEMAP_OUTPUT1
  float luma = dot(out_rgb, fp_c4_1._m0[13].xyz);
#endif

  

#if USE_FX
#if !USE_WOODED_TONEMAP && !USE_SUB_TONEMAP && !USE_FLY_TONEMAP && !USE_DESERT
  out_rgb = out_rgb * effects.w + effects.xyz;
  key = key * effects.w + effects.xyz;
  mbt_target = mbt_target * effects.w + effects.xyz;
#endif
#endif
#if USE_LUT
#if !USE_WOODED_TONEMAP && !USE_BEACH_TONEMAP && !USE_MOON_TONEMAP
  vec3 lut_input = mbt_target;
  vec3 lut_unscaled = SampleLinearLut(lut_input, false);
  vec3 lut_sdr = lerp(lut_input, lut_unscaled, LUT_STRENGTH);

  mbt_target = lut_sdr;
  if (RENODX_TONE_MAP_TYPE == 0) {
    key = lut_sdr;
  } else {
    float hdr_lut_scale = renodx::tonemap::neutwo::ComputeMaxChannelScale(key);
    vec3 hdr_lut = SampleLinearLut(TonemapVanilla(key * hdr_lut_scale), false) / hdr_lut_scale;
    key = lerp(key, hdr_lut, LUT_STRENGTH);
  }
#endif
#endif
  out_rgb = ApplyRenodxTail(key, mbt_target);
  oColor0 = vec4(out_rgb, raw.w);
#if USE_TONEMAP_OUTPUT1
  oColor1 = vec4(luma, 0.0, 0.0, 0.0);
#endif
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