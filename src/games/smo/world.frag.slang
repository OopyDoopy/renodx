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

layout(set = 0, binding = 23, std140) uniform fp_c4
{
    vec4 _m0[4096];
} fp_c4_1;

layout(set = 2, binding = 128) uniform sampler2D fp_t_tcb_10;
layout(set = 2, binding = 129) uniform sampler2D fp_t_tcb_8;
layout(set = 2, binding = 130) uniform sampler2D fp_t_tcb_18;
layout(set = 2, binding = 131) uniform sampler3D fp_t_tcb_C;

layout(location = 0) in vec4 _38;
layout(location = 1) in vec4 _40;
layout(location = 0) out vec4 _43;
layout(location = 1) out vec4 _45;

void main()
{
    float _52 = gl_FragCoord.w;
    precise float _264 = 1.0 / _52;
    float _54 = _264;
    float _56 = _38.x;
    float _58 = _38.y;
    vec3 _62 = texture(fp_t_tcb_10, vec2(_56, _58)).xyz;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    vec4 _71 = texture(fp_t_tcb_8, vec2(_56, _58)).xyzw;
    float _73 = _71.x;
    float _75 = _71.y;
    float _77 = _71.z;
    float _79 = _71.w;
    vec4 _81 = texture(fp_t_tcb_18, vec2(_56, _58)).xyzw;
    float _83 = _81.x;
    float _85 = _81.y;
    float _87 = _81.z;
    float _89 = _81.w;
    float _91 = _40.w;
    precise float _316 = _64 * _91;
    float _93 = _316;
    precise float _319 = _68 * _91;
    float _95 = _319;
    float _97 = fma(_91, _73, _93);
    float _99 = fma(_91, _77, _95);
    precise float _331 = _66 * _91;
    float _101 = _331;
    bool _105 = _97 < fp_c4_1._m0[10].y;
    bool _107 = _99 < fp_c4_1._m0[10].y;
    float _109 = fma(_91, _75, _101);
    float _111 = _93;
    float _113 = _95;
    float _115 = _101;
    float _117 = _56;
    float _119 = _91;
    float _121 = _58;
    float _123 = _54;
    float _125 = _99;
    if (_105)
    {
        _111 = fp_c4_1._m0[11].x;
    }
    float _127 = _111;
    float _129 = _127;
    if (_105)
    {
        _113 = fp_c4_1._m0[11].z;
    }
    float _131 = _113;
    float _133 = _131;
    if (_105)
    {
        _115 = fp_c4_1._m0[11].y;
    }
    float _135 = _115;
    float _137 = _135;
    if (_105)
    {
        _117 = fp_c4_1._m0[11].w;
    }
    float _139 = _117;
    float _141 = _139;
    if (!_105)
    {
        _129 = fp_c4_1._m0[12].x;
    }
    float _143 = _129;
    if (!_105)
    {
        _133 = fp_c4_1._m0[12].z;
    }
    float _145 = _133;
    float _147 = _145;
    if (!_105)
    {
        _137 = fp_c4_1._m0[12].y;
    }
    float _149 = _137;
    if (!_105)
    {
        _141 = fp_c4_1._m0[12].w;
    }
    float _151 = _141;
    bool _153 = _109 < fp_c4_1._m0[10].y;
    float _155 = _151;
    if (_107)
    {
        _119 = fp_c4_1._m0[11].x;
    }
    float _157 = _119;
    float _159 = _157;
    if (_107)
    {
        _121 = fp_c4_1._m0[11].z;
    }
    float _161 = _121;
    float _163 = _161;
    if (!_107)
    {
        _159 = fp_c4_1._m0[12].x;
    }
    float _165 = _159;
    float _167 = _165;
    if (!_107)
    {
        _163 = fp_c4_1._m0[12].z;
    }
    float _169 = _163;
    float _171 = fma(_97, _143, _145);
    float _173 = fma(_97, _149, _151);
    if (_107)
    {
        _147 = fp_c4_1._m0[11].y;
    }
    float _175 = _147;
    precise float _463 = 1.0 / _173;
    float _177 = _463;
    float _179 = _175;
    if (_107)
    {
        _123 = fp_c4_1._m0[11].w;
    }
    float _181 = _123;
    float _183 = fma(_99, _165, _169);
    float _185 = _181;
    if (!_107)
    {
        _179 = fp_c4_1._m0[12].y;
    }
    float _187 = _179;
    if (!_107)
    {
        _185 = fp_c4_1._m0[12].w;
    }
    float _189 = _185;
    if (_153)
    {
        _167 = fp_c4_1._m0[11].y;
    }
    float _191 = _167;
    float _193 = _191;
    if (_153)
    {
        _155 = fp_c4_1._m0[11].w;
    }
    float _195 = _155;
    float _197 = _195;
    if (!_153)
    {
        _193 = fp_c4_1._m0[12].y;
    }
    float _199 = _193;
    float _201 = _199;
    if (!_153)
    {
        _197 = fp_c4_1._m0[12].w;
    }
    float _203 = _197;
    float _205 = fma(_99, _187, _189);
    if (_153)
    {
        _125 = fp_c4_1._m0[11].x;
    }
    float _207 = _125;
    precise float _530 = 1.0 / _205;
    float _209 = _530;
    float _211 = fma(_109, _199, _203);
    float _213 = _207;
    if (_153)
    {
        _201 = fp_c4_1._m0[11].z;
    }
    float _215 = _201;
    precise float _543 = 1.0 / _211;
    float _217 = _543;
    float _219 = _215;
    if (!_153)
    {
        _213 = fp_c4_1._m0[12].x;
    }
    float _221 = _213;
    if (!_153)
    {
        _219 = fp_c4_1._m0[12].z;
    }
    float _223 = _219;
    float _225 = fma(_109, _221, _223);
    precise float _565 = _183 * _209;
    float _227 = _565;
    precise float _568 = _171 * _177;
    float _229 = _568;
    precise float _571 = _225 * _217;
    float _231 = _571;
    float _233 = fma(_227, _89, _87);
    float _235 = fma(_229, _89, _83);
    float _237 = fma(_231, _89, _85);
    float _239 = fma(_233, fp_c4_1._m0[5].z, fp_c4_1._m0[5].w);
    float _241 = fma(_235, fp_c4_1._m0[5].z, fp_c4_1._m0[5].w);
    float _243 = fma(_237, fp_c4_1._m0[5].z, fp_c4_1._m0[5].w);
    vec3 _245 = texture(fp_t_tcb_C, vec3(_241, _243, _239)).xyz;
    float _247 = _245.x;
    float _249 = _245.y;
    float _251 = _245.z;
    precise float _620 = _249 * fp_c4_1._m0[13].y;
    float _253 = _620;
    float _255 = fma(_247, fp_c4_1._m0[13].x, _253);
    float _257 = fma(_251, fp_c4_1._m0[13].z, _255);
    _43.x = _247;
    _43.y = _249;
    _43.z = _251;
    _43.w = _79;
    _45.x = _257;
    _45.y = 0.0;
    _45.z = 0.0;
    _45.w = 0.0;
}

