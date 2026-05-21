// #version 450

// layout(set = 0, binding = 0, std140) uniform support_buffer
// {
//     uint _m0;
//     uint _m1[8];
//     vec4 _m2;
//     vec4 _m3;
//     int _m4;
//     float _m5[73];
//     ivec4 _m6;
//     int _m7;
// } support_buffer_1;

// layout(set = 0, binding = 23, std140) uniform fp_c4
// {
//     vec4 _m0[4096];
// } fp_c4_1;

// layout(set = 2, binding = 128) uniform sampler2D fp_t_tcb_10;
// layout(set = 2, binding = 129) uniform sampler2D fp_t_tcb_8;
// layout(set = 2, binding = 130) uniform sampler3D fp_t_tcb_C;

// layout(location = 0) in vec4 v0;
// layout(location = 1) in vec4 v1;
// layout(location = 0) out vec4 oColor0;
// layout(location = 1) out vec4 oColor1;

// void main()
// {
//     vec2 uv = v0.xy;
//     float blend_weight = v1.w;

//     vec3 glow = texture(fp_t_tcb_10, uv).xyz;
//     vec4 raw = texture(fp_t_tcb_8, uv);

//     vec3 key = blend_weight * (raw.xyz + glow);

//     float threshold = fp_c4_1._m0[10].y;
//     bvec3 use_low_curve = lessThan(key, vec3(threshold));

//     vec4 tone_params_low = fp_c4_1._m0[11];
//     vec4 tone_params_high = fp_c4_1._m0[12];

//     vec3 num_slope = mix(vec3(tone_params_high.x), vec3(tone_params_low.x), use_low_curve);
//     vec3 den_slope = mix(vec3(tone_params_high.y), vec3(tone_params_low.y), use_low_curve);
//     vec3 num_offset = mix(vec3(tone_params_high.z), vec3(tone_params_low.z), use_low_curve);
//     vec3 den_offset = mix(vec3(tone_params_high.w), vec3(tone_params_low.w), use_low_curve);

//     vec3 ratio = (key * num_slope + num_offset) / (key * den_slope + den_offset);

//     vec2 lut_scale_bias = fp_c4_1._m0[5].zw;
//     vec3 lut_coord = fma(ratio, vec3(lut_scale_bias.x), vec3(lut_scale_bias.y));
//     vec3 out_rgb = texture(fp_t_tcb_C, lut_coord).xyz;

//     float luma = dot(out_rgb, fp_c4_1._m0[13].xyz);

//     oColor0 = vec4(out_rgb, raw.w);
//     oColor1 = vec4(luma, 0.0, 0.0, 0.0);
// }

#define USE_LUT 1
#define USE_FX 0
#include "./tonemap.frag.slang"