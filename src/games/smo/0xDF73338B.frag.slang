#version 450

layout(set = 0, binding = 0, std140) uniform support_buffer
{
    uint _m0;
    uint _m1[8];
    vec4 _m2;
    vec4 _m3;
    int _m4;
    float _m5[73];
    ivec4 _m6;
    int _m7;
} support_buffer_1;

layout(set = 0, binding = 31, std140) uniform fp_c12
{
    vec4 _m0[4096];
} fp_c12_1;

layout(set = 0, binding = 23, std140) uniform fp_c4
{
    vec4 _m0[4096];
} fp_c4_1;

layout(set = 0, binding = 32, std140) uniform fp_c13
{
    vec4 _m0[4096];
} fp_c13_1;

layout(set = 2, binding = 128) uniform sampler2D fp_t_tcb_16;

layout(location = 0) noperspective in vec4 _31;
layout(location = 1) noperspective in vec4 _33;
layout(location = 0) out vec4 _36;

void main()
{
    float _43 = _31.x;
    float _45 = _31.y;
    precise float _189 = _43 + fp_c12_1._m0[1].x;
    float _47 = _189;
    precise float _193 = _45 + fp_c12_1._m0[1].y;
    float _49 = _193;
    float _51 = texture(fp_t_tcb_16, vec2(_47, _49)).x;
    float _53 = _33.x;
    float _55 = _33.y;
    float _57 = fma(_51, fp_c4_1._m0[22].z, fp_c4_1._m0[22].x);
    float _59 = -_53;
    precise float _218 = _57 * _59;
    float _61 = _218;
    float _63 = -_55;
    precise float _223 = _57 * _63;
    float _65 = _223;
    precise float _228 = _61 * fp_c13_1._m0[5].x;
    float _67 = _228;
    float _69 = fma(_65, fp_c13_1._m0[5].y, _67);
    precise float _238 = _61 * fp_c13_1._m0[6].x;
    float _71 = _238;
    float _73 = -fp_c13_1._m0[5].z;
    float _75 = fma(_57, _73, _69);
    precise float _250 = _61 * fp_c13_1._m0[4].x;
    float _77 = _250;
    float _79 = fma(_65, fp_c13_1._m0[6].y, _71);
    precise float _260 = _75 + fp_c13_1._m0[5].w;
    float _81 = _260;
    float _83 = fma(_65, fp_c13_1._m0[4].y, _77);
    float _85 = -fp_c13_1._m0[6].z;
    float _87 = fma(_57, _85, _79);
    bool _91 = _81 <= fp_c13_1._m0[17].w;
    float _93 = float(_91);
    float _95 = -fp_c13_1._m0[4].z;
    float _97 = fma(_57, _95, _83);
    precise float _292 = _87 + fp_c13_1._m0[6].w;
    float _99 = _292;
    precise float _296 = _93 * fp_c13_1._m0[17].w;
    float _101 = _296;
    precise float _300 = _97 + fp_c13_1._m0[4].w;
    float _103 = _300;
    float _105 = abs(_99);
    precise float _305 = _105 + (-0.0);
    float _107 = _305;
    float _109 = -fp_c13_1._m0[17].w;
    float _111 = fma(_101, 2.0, _109);
    float _113 = abs(_103);
    precise float _316 = _113 + (-0.0);
    float _115 = _316;
    float _117 = -fp_c13_1._m0[17].w;
    precise float _322 = _81 + _117;
    float _119 = _322;
    precise float _325 = _111 + 0.5;
    float _121 = _325;
    precise float _327 = _107 * 2.0;
    float _123 = _327;
    float _125 = clamp(_123, 0.0, 1.0);
    precise float _331 = 1.0 / _121;
    float _127 = _331;
    precise float _333 = _115 * 2.0;
    float _129 = _333;
    float _131 = clamp(_129, 0.0, 1.0);
    float _133 = log2(_125);
    float _135 = abs(_119);
    precise float _341 = _135 + (-0.0);
    float _137 = _341;
    float _139 = log2(_131);
    precise float _346 = _127 * _137;
    float _141 = _346;
    float _143 = clamp(_141, 0.0, 1.0);
    float _145 = log2(_143);
    precise float _354 = _133 * fp_c13_1._m0[17].z;
    float _147 = _354;
    precise float _358 = _139 * fp_c13_1._m0[17].x;
    float _149 = _358;
    float _151 = exp2(_147);
    precise float _364 = _145 * fp_c13_1._m0[17].y;
    float _153 = _364;
    float _155 = exp2(_149);
    float _157 = exp2(_153);
    float _159 = -_151;
    precise float _372 = _159 + 1.0;
    float _161 = _372;
    float _163 = -_161;
    float _165 = fma(_155, _163, _161);
    float _167 = -_157;
    float _169 = fma(_165, _167, _165);
    float _171 = clamp(_169, 0.0, 1.0);
    float _173 = -_171;
    float _175 = fma(_171, fp_c13_1._m0[16].x, _173);
    precise float _396 = _175 + 1.0;
    float _177 = _396;
    _36.x = _177;
    _36.y = _177;
    _36.z = 1.0;
    _36.w = 1.0;

    _36.xy = saturate(_36.xy);
}

