cbuffer _14_16 : register(b1, space0)
{
    float4 _16_m0[14] : packoffset(c0);
};

Texture2D<float4> _8 : register(t0, space0);
Texture2D<float4> _9 : register(t1, space0);
SamplerState _19 : register(s3, space0);
SamplerState _20 : register(s4, space0);
SamplerState _21 : register(s5, space0);
SamplerState _22 : register(s10, space0);
SamplerState _23 : register(s11, space0);

static float4 gl_FragCoord;
static float2 TEXCOORD;
static float4 COLOR;
static float4 SV_Target;

struct SPIRV_Cross_Input
{
    float2 TEXCOORD : TEXCOORD1;
    float4 COLOR : TEXCOORD2;
    float4 gl_FragCoord : SV_Position;
};

struct SPIRV_Cross_Output
{
    float4 SV_Target : SV_Target0;
};

static bool discard_state;

void discard_exit()
{
    if (discard_state)
    {
        discard;
    }
}

void frag_main()
{
    discard_state = false;
    uint4 _64 = asuint(_16_m0[2u]);
    float _124;
    float _128;
    float _132;
    float _136;
    if (_64.z == 0u)
    {
        float frontier_phi_3_1_ladder;
        float frontier_phi_3_1_ladder_1;
        float frontier_phi_3_1_ladder_2;
        float frontier_phi_3_1_ladder_3;
        if (asuint(_16_m0[0u]).x == 0u)
        {
            frontier_phi_3_1_ladder = COLOR.w;
            frontier_phi_3_1_ladder_1 = COLOR.z;
            frontier_phi_3_1_ladder_2 = COLOR.y;
            frontier_phi_3_1_ladder_3 = COLOR.x;
        }
        else
        {
            bool _151 = _64.y == 0u;
            bool _153 = _64.x == 0u;
            float _389;
            float _391;
            float _393;
            float _395;
            if (_16_m0[12u].w > 0.0f)
            {
                float _196 = _16_m0[13u].x + TEXCOORD.x;
                float _197 = _16_m0[13u].y + TEXCOORD.y;
                float _383;
                float _384;
                float _385;
                float _386;
                if (_151)
                {
                    float frontier_phi_37_17_ladder;
                    float frontier_phi_37_17_ladder_1;
                    float frontier_phi_37_17_ladder_2;
                    float frontier_phi_37_17_ladder_3;
                    if (_153)
                    {
                        float4 _275 = _8.Sample(_21, float2(_196, _197));
                        frontier_phi_37_17_ladder = _275.w;
                        frontier_phi_37_17_ladder_1 = _275.x;
                        frontier_phi_37_17_ladder_2 = _275.y;
                        frontier_phi_37_17_ladder_3 = _275.z;
                    }
                    else
                    {
                        float4 _282 = _8.Sample(_20, float2(_196, _197));
                        frontier_phi_37_17_ladder = _282.w;
                        frontier_phi_37_17_ladder_1 = _282.x;
                        frontier_phi_37_17_ladder_2 = _282.y;
                        frontier_phi_37_17_ladder_3 = _282.z;
                    }
                    _383 = frontier_phi_37_17_ladder_1;
                    _384 = frontier_phi_37_17_ladder_2;
                    _385 = frontier_phi_37_17_ladder_3;
                    _386 = frontier_phi_37_17_ladder;
                }
                else
                {
                    float frontier_phi_37_18_ladder;
                    float frontier_phi_37_18_ladder_1;
                    float frontier_phi_37_18_ladder_2;
                    float frontier_phi_37_18_ladder_3;
                    if (_153)
                    {
                        float4 _289 = _8.Sample(_23, float2(_196, _197));
                        frontier_phi_37_18_ladder = _289.w;
                        frontier_phi_37_18_ladder_1 = _289.x;
                        frontier_phi_37_18_ladder_2 = _289.y;
                        frontier_phi_37_18_ladder_3 = _289.z;
                    }
                    else
                    {
                        float4 _296 = _8.Sample(_22, float2(_196, _197));
                        frontier_phi_37_18_ladder = _296.w;
                        frontier_phi_37_18_ladder_1 = _296.x;
                        frontier_phi_37_18_ladder_2 = _296.y;
                        frontier_phi_37_18_ladder_3 = _296.z;
                    }
                    _383 = frontier_phi_37_18_ladder_1;
                    _384 = frontier_phi_37_18_ladder_2;
                    _385 = frontier_phi_37_18_ladder_3;
                    _386 = frontier_phi_37_18_ladder;
                }
                bool _388 = _64.x == 0u;
                float _515;
                float _516;
                float _517;
                float _518;
                if (_151)
                {
                    float frontier_phi_57_42_ladder;
                    float frontier_phi_57_42_ladder_1;
                    float frontier_phi_57_42_ladder_2;
                    float frontier_phi_57_42_ladder_3;
                    if (_388)
                    {
                        float4 _476 = _8.Sample(_21, float2(TEXCOORD.x, TEXCOORD.y));
                        frontier_phi_57_42_ladder = _476.w;
                        frontier_phi_57_42_ladder_1 = _476.z;
                        frontier_phi_57_42_ladder_2 = _476.y;
                        frontier_phi_57_42_ladder_3 = _476.x;
                    }
                    else
                    {
                        float4 _483 = _8.Sample(_20, float2(TEXCOORD.x, TEXCOORD.y));
                        frontier_phi_57_42_ladder = _483.w;
                        frontier_phi_57_42_ladder_1 = _483.z;
                        frontier_phi_57_42_ladder_2 = _483.y;
                        frontier_phi_57_42_ladder_3 = _483.x;
                    }
                    _515 = frontier_phi_57_42_ladder_3;
                    _516 = frontier_phi_57_42_ladder_2;
                    _517 = frontier_phi_57_42_ladder_1;
                    _518 = frontier_phi_57_42_ladder;
                }
                else
                {
                    float frontier_phi_57_43_ladder;
                    float frontier_phi_57_43_ladder_1;
                    float frontier_phi_57_43_ladder_2;
                    float frontier_phi_57_43_ladder_3;
                    if (_388)
                    {
                        float4 _490 = _8.Sample(_23, float2(TEXCOORD.x, TEXCOORD.y));
                        frontier_phi_57_43_ladder = _490.w;
                        frontier_phi_57_43_ladder_1 = _490.z;
                        frontier_phi_57_43_ladder_2 = _490.y;
                        frontier_phi_57_43_ladder_3 = _490.x;
                    }
                    else
                    {
                        float4 _497 = _8.Sample(_22, float2(TEXCOORD.x, TEXCOORD.y));
                        frontier_phi_57_43_ladder = _497.w;
                        frontier_phi_57_43_ladder_1 = _497.z;
                        frontier_phi_57_43_ladder_2 = _497.y;
                        frontier_phi_57_43_ladder_3 = _497.x;
                    }
                    _515 = frontier_phi_57_43_ladder_3;
                    _516 = frontier_phi_57_43_ladder_2;
                    _517 = frontier_phi_57_43_ladder_1;
                    _518 = frontier_phi_57_43_ladder;
                }
                _389 = ((_383 - _515) * _16_m0[12u].w) + _515;
                _391 = ((_384 - _516) * _16_m0[12u].w) + _516;
                _393 = ((_385 - _517) * _16_m0[12u].w) + _517;
                _395 = ((_386 - _518) * _16_m0[12u].w) + _518;
            }
            else
            {
                float frontier_phi_38_10_ladder;
                float frontier_phi_38_10_ladder_1;
                float frontier_phi_38_10_ladder_2;
                float frontier_phi_38_10_ladder_3;
                if (_151)
                {
                    float frontier_phi_38_10_ladder_19_ladder;
                    float frontier_phi_38_10_ladder_19_ladder_1;
                    float frontier_phi_38_10_ladder_19_ladder_2;
                    float frontier_phi_38_10_ladder_19_ladder_3;
                    if (_153)
                    {
                        float4 _303 = _8.Sample(_21, float2(TEXCOORD.x, TEXCOORD.y));
                        frontier_phi_38_10_ladder_19_ladder = _303.z;
                        frontier_phi_38_10_ladder_19_ladder_1 = _303.w;
                        frontier_phi_38_10_ladder_19_ladder_2 = _303.y;
                        frontier_phi_38_10_ladder_19_ladder_3 = _303.x;
                    }
                    else
                    {
                        float4 _310 = _8.Sample(_20, float2(TEXCOORD.x, TEXCOORD.y));
                        frontier_phi_38_10_ladder_19_ladder = _310.z;
                        frontier_phi_38_10_ladder_19_ladder_1 = _310.w;
                        frontier_phi_38_10_ladder_19_ladder_2 = _310.y;
                        frontier_phi_38_10_ladder_19_ladder_3 = _310.x;
                    }
                    frontier_phi_38_10_ladder = frontier_phi_38_10_ladder_19_ladder;
                    frontier_phi_38_10_ladder_1 = frontier_phi_38_10_ladder_19_ladder_1;
                    frontier_phi_38_10_ladder_2 = frontier_phi_38_10_ladder_19_ladder_2;
                    frontier_phi_38_10_ladder_3 = frontier_phi_38_10_ladder_19_ladder_3;
                }
                else
                {
                    float frontier_phi_38_10_ladder_20_ladder;
                    float frontier_phi_38_10_ladder_20_ladder_1;
                    float frontier_phi_38_10_ladder_20_ladder_2;
                    float frontier_phi_38_10_ladder_20_ladder_3;
                    if (_153)
                    {
                        float4 _317 = _8.Sample(_23, float2(TEXCOORD.x, TEXCOORD.y));
                        frontier_phi_38_10_ladder_20_ladder = _317.z;
                        frontier_phi_38_10_ladder_20_ladder_1 = _317.w;
                        frontier_phi_38_10_ladder_20_ladder_2 = _317.y;
                        frontier_phi_38_10_ladder_20_ladder_3 = _317.x;
                    }
                    else
                    {
                        float4 _324 = _8.Sample(_22, float2(TEXCOORD.x, TEXCOORD.y));
                        frontier_phi_38_10_ladder_20_ladder = _324.z;
                        frontier_phi_38_10_ladder_20_ladder_1 = _324.w;
                        frontier_phi_38_10_ladder_20_ladder_2 = _324.y;
                        frontier_phi_38_10_ladder_20_ladder_3 = _324.x;
                    }
                    frontier_phi_38_10_ladder = frontier_phi_38_10_ladder_20_ladder;
                    frontier_phi_38_10_ladder_1 = frontier_phi_38_10_ladder_20_ladder_1;
                    frontier_phi_38_10_ladder_2 = frontier_phi_38_10_ladder_20_ladder_2;
                    frontier_phi_38_10_ladder_3 = frontier_phi_38_10_ladder_20_ladder_3;
                }
                _389 = frontier_phi_38_10_ladder_3;
                _391 = frontier_phi_38_10_ladder_2;
                _393 = frontier_phi_38_10_ladder;
                _395 = frontier_phi_38_10_ladder_1;
            }
            float _398 = max(max(_389, _391), _393);
            float _422;
            float _425;
            if (_398 > 0.0f)
            {
                float _419 = _398 - min(min(_389, _391), _393);
                float _420 = _419 / _398;
                float frontier_phi_45_44_ladder;
                float frontier_phi_45_44_ladder_1;
                if (_420 > 0.0f)
                {
                    float _542;
                    if (_389 == _398)
                    {
                        _542 = (_391 - _393) / _419;
                    }
                    else
                    {
                        float frontier_phi_61_59_ladder;
                        if (_391 == _398)
                        {
                            frontier_phi_61_59_ladder = ((_393 - _389) / _419) + 2.0f;
                        }
                        else
                        {
                            frontier_phi_61_59_ladder = ((_389 - _391) / _419) + 4.0f;
                        }
                        _542 = frontier_phi_61_59_ladder;
                    }
                    float _424 = _542 * 0.16666667163372039794921875f;
                    float frontier_phi_45_44_ladder_61_ladder;
                    float frontier_phi_45_44_ladder_61_ladder_1;
                    if (_424 < 0.0f)
                    {
                        frontier_phi_45_44_ladder_61_ladder = _420;
                        frontier_phi_45_44_ladder_61_ladder_1 = _424 + 1.0f;
                    }
                    else
                    {
                        frontier_phi_45_44_ladder_61_ladder = _420;
                        frontier_phi_45_44_ladder_61_ladder_1 = _424;
                    }
                    frontier_phi_45_44_ladder = frontier_phi_45_44_ladder_61_ladder;
                    frontier_phi_45_44_ladder_1 = frontier_phi_45_44_ladder_61_ladder_1;
                }
                else
                {
                    frontier_phi_45_44_ladder = _420;
                    frontier_phi_45_44_ladder_1 = 0.0f;
                }
                _422 = frontier_phi_45_44_ladder_1;
                _425 = frontier_phi_45_44_ladder;
            }
            else
            {
                _422 = 0.0f;
                _425 = 0.0f;
            }

            //float _435 = clamp((_16_m0[11u].w * clamp(_425, 0.0f, 1.0f)) + _16_m0[12u].x, 0.0f, 1.0f);
            //float _440 = clamp((_16_m0[12u].y * clamp(_398, 0.0f, 1.0f)) + _16_m0[12u].z, 0.0f, 1.0f);
            float _435 = (_16_m0[11u].w * _425) + _16_m0[12u].x;
            float _440 = (_16_m0[12u].y * _398) + _16_m0[12u].z;

            float _504;
            float _508;
            float _509;
            if (_440 == 0.0f)
            {
                _504 = 0.0f;
                _508 = 0.0f;
                _509 = 0.0f;
            }
            else
            {
                float frontier_phi_53_54_ladder;
                float frontier_phi_53_54_ladder_1;
                float frontier_phi_53_54_ladder_2;
                if (_435 == 0.0f)
                {
                    frontier_phi_53_54_ladder = _440;
                    frontier_phi_53_54_ladder_1 = _440;
                    frontier_phi_53_54_ladder_2 = _440;
                }
                else
                {
                  // float _530 = clamp(_422, 0.0f, 1.0f) * 6.0f;
                  float _530 = _422 * 6.0f;

                    uint _533 = uint(int(floor(_530)));
                    float _535 = _530 - float(int(_533));
                    float _506 = _440 * (1.0f - _435);
                    float _507 = (1.0f - (_535 * _435)) * _440;
                    float _505 = (1.0f - ((1.0f - _535) * _435)) * _440;
                    float frontier_phi_53_54_ladder_switch_merge;
                    float frontier_phi_53_54_ladder_switch_merge_1;
                    float frontier_phi_53_54_ladder_switch_merge_2;
                    switch (_533)
                    {
                        case 1u:
                        {
                            frontier_phi_53_54_ladder_switch_merge = _506;
                            frontier_phi_53_54_ladder_switch_merge_1 = _440;
                            frontier_phi_53_54_ladder_switch_merge_2 = _507;
                            break;
                        }
                        case 2u:
                        {
                            frontier_phi_53_54_ladder_switch_merge = _505;
                            frontier_phi_53_54_ladder_switch_merge_1 = _440;
                            frontier_phi_53_54_ladder_switch_merge_2 = _506;
                            break;
                        }
                        case 3u:
                        {
                            frontier_phi_53_54_ladder_switch_merge = _440;
                            frontier_phi_53_54_ladder_switch_merge_1 = _507;
                            frontier_phi_53_54_ladder_switch_merge_2 = _506;
                            break;
                        }
                        case 4u:
                        {
                            frontier_phi_53_54_ladder_switch_merge = _440;
                            frontier_phi_53_54_ladder_switch_merge_1 = _506;
                            frontier_phi_53_54_ladder_switch_merge_2 = _505;
                            break;
                        }
                        default:
                        {
                            frontier_phi_53_54_ladder_switch_merge = _507;
                            frontier_phi_53_54_ladder_switch_merge_1 = _506;
                            frontier_phi_53_54_ladder_switch_merge_2 = _440;
                            break;
                        }
                        case 0u:
                        {
                            frontier_phi_53_54_ladder_switch_merge = _506;
                            frontier_phi_53_54_ladder_switch_merge_1 = _505;
                            frontier_phi_53_54_ladder_switch_merge_2 = _440;
                            break;
                        }
                    }
                    frontier_phi_53_54_ladder = frontier_phi_53_54_ladder_switch_merge;
                    frontier_phi_53_54_ladder_1 = frontier_phi_53_54_ladder_switch_merge_1;
                    frontier_phi_53_54_ladder_2 = frontier_phi_53_54_ladder_switch_merge_2;
                }
                _504 = frontier_phi_53_54_ladder_2;
                _508 = frontier_phi_53_54_ladder_1;
                _509 = frontier_phi_53_54_ladder;
            }
            frontier_phi_3_1_ladder = _395 * COLOR.w;
            // frontier_phi_3_1_ladder_1 = clamp(_509, 0.0f, 1.0f) * COLOR.z;
            // frontier_phi_3_1_ladder_2 = clamp(_508, 0.0f, 1.0f) * COLOR.y;
            // frontier_phi_3_1_ladder_3 = clamp(_504, 0.0f, 1.0f) * COLOR.x;
            frontier_phi_3_1_ladder_1 = _509 * COLOR.z;
            frontier_phi_3_1_ladder_2 = _508 * COLOR.y;
            frontier_phi_3_1_ladder_3 = _504 * COLOR.x;
        }
        _124 = frontier_phi_3_1_ladder_3;
        _128 = frontier_phi_3_1_ladder_2;
        _132 = frontier_phi_3_1_ladder_1;
        _136 = frontier_phi_3_1_ladder;
    }
    else
    {
        float _80 = ddx_coarse(_16_m0[7u].x * TEXCOORD.x);
        float _81 = ddx_coarse(_16_m0[7u].y * TEXCOORD.y);
        float _105 = _16_m0[6u].x * COLOR.w;
        float _106 = _16_m0[6u].y * COLOR.w;
        float _107 = _16_m0[6u].z * COLOR.w;
        float4 _121 = _8.Sample(_20, float2(TEXCOORD.x, TEXCOORD.y));
        float _123 = _121.x;
        float _154;
        float _156;
        if (asuint(_16_m0[10u]).z == 0u)
        {
            _154 = _123;
            _156 = _123;
        }
        else
        {
            float _170 = _121.y;
            _154 = max(min(_123, _170), min(max(_123, _170), _121.z));
            _156 = _121.w;
        }
        // float _164 = clamp(_16_m0[8u].z * sqrt((_81 * _81) + (_80 * _80)), 0.0f, 1.0f);
        float _164 = _16_m0[8u].z * sqrt((_81 * _81) + (_80 * _80));

        uint4 _167 = asuint(_16_m0[9u]);
        float _264;
        if (_167.z == 0u)
        {
            _264 = float(_154 >= _16_m0[9u].x);
        }
        else
        {
          // float _201 = clamp(_16_m0[9u].x - _164, 0.0f, 1.0f);
          float _201 = _16_m0[9u].x - _164;

            // float _207 = clamp((_154 - _201) / (clamp(_164 + _16_m0[9u].x, 0.0f, 1.0f) - _201), 0.0f, 1.0f);
            float _207 = (_154 - _201) / (clamp(_164 + _16_m0[9u].x, 0.0f, 1.0f) - _201);

            _264 = (_207 * _207) * (3.0f - (_207 * 2.0f));
        }
        float _127;
        float _131;
        float _135;
        float _139;
        if (_167.w == 0u)
        {
            _127 = COLOR.x;
            _131 = COLOR.y;
            _135 = COLOR.z;
            _139 = _264 * COLOR.w;
        }
        else
        {
          ///float _336 = clamp((_156 - _16_m0[7u].z) / (_16_m0[7u].w - _16_m0[7u].z), 0.0f, 1.0f);
          float _336 = (_156 - _16_m0[7u].z) / (_16_m0[7u].w - _16_m0[7u].z);

            float _342 = ((_336 * _336) * (_16_m0[6u].w * COLOR.w)) * (3.0f - (_336 * 2.0f));
            _127 = (((_16_m0[8u].w * COLOR.x) - _105) * _264) + _105;
            _131 = (((_16_m0[8u].w * COLOR.y) - _106) * _264) + _106;
            _135 = (((_16_m0[8u].w * COLOR.z) - _107) * _264) + _107;
            _139 = (((_16_m0[8u].w * COLOR.w) - _342) * _264) + _342;
        }
        float frontier_phi_3_39_ladder;
        float frontier_phi_3_39_ladder_1;
        float frontier_phi_3_39_ladder_2;
        float frontier_phi_3_39_ladder_3;
        if (_167.y == 0u)
        {
            frontier_phi_3_39_ladder = _139;
            frontier_phi_3_39_ladder_1 = _135;
            frontier_phi_3_39_ladder_2 = _131;
            frontier_phi_3_39_ladder_3 = _127;
        }
        else
        {
            float _443 = _16_m0[8u].y + _16_m0[9u].x;

            // float _450 = clamp(((_154 - _16_m0[8u].x) - _443) / ((-0.0f) - _164), 0.0f, 1.0f);
            float _450 = ((_154 - _16_m0[8u].x) - _443) / ((-0.0f) - _164);

            // float _458 = clamp(((_154 - _443) + _16_m0[8u].x) / _164, 0.0f, 1.0f);
            float _458 = ((_154 - _443) + _16_m0[8u].x) / _164;

            float _465 = (((_450 * _450) * (3.0f - (_450 * 2.0f))) + (-1.0f)) + ((_458 * _458) * (3.0f - (_458 * 2.0f)));
            frontier_phi_3_39_ladder = (_465 * ((_16_m0[5u].w * COLOR.w) - _139)) + _139;
            frontier_phi_3_39_ladder_1 = (_465 * ((_16_m0[5u].z * COLOR.w) - _135)) + _135;
            frontier_phi_3_39_ladder_2 = (_465 * ((_16_m0[5u].y * COLOR.w) - _131)) + _131;
            frontier_phi_3_39_ladder_3 = (_465 * ((_16_m0[5u].x * COLOR.w) - _127)) + _127;
        }
        _124 = frontier_phi_3_39_ladder_3;
        _128 = frontier_phi_3_39_ladder_2;
        _132 = frontier_phi_3_39_ladder_1;
        _136 = frontier_phi_3_39_ladder;
    }
    float _175;
    if (asuint(_16_m0[0u]).y == 0u)
    {
        _175 = _136;
    }
    else
    {
        float _183 = gl_FragCoord.x - _16_m0[1u].z;
        float _184 = gl_FragCoord.y - _16_m0[1u].w;
        float _188 = sqrt((_183 * _183) + (_184 * _184));
        float _273;
        if (_188 < _16_m0[1u].y)
        {
            //_273 = clamp((_188 - _16_m0[1u].x) / max(_16_m0[1u].y - _16_m0[1u].x, 0.00999999977648258209228515625f), 0.0f, 1.0f);
            _273 = (_188 - _16_m0[1u].x) / max(_16_m0[1u].y - _16_m0[1u].x, 0.00999999977648258209228515625f);
        }
        else
        {
          //_273 = 1.0f - clamp((_188 - _16_m0[0u].z) / max(_16_m0[0u].w - _16_m0[0u].z, 0.00999999977648258209228515625f), 0.0f, 1.0f);
          _273 = 1.0f - (_188 - _16_m0[0u].z) / max(_16_m0[0u].w - _16_m0[0u].z, 0.00999999977648258209228515625f);
        }
        _175 = _273 * _136;
    }
    float _214;
    if (_64.w == 0u)
    {
        _214 = _175;
    }
    else
    {
        float _228 = gl_FragCoord.x - _16_m0[3u].x;
        float _229 = gl_FragCoord.y - _16_m0[3u].y;
        float _242 = _16_m0[3u].z * ((_16_m0[10u].y * _229) + (_228 * _16_m0[10u].x));
        float _243 = ((_16_m0[10u].x * _229) - (_16_m0[10u].y * _228)) * _16_m0[3u].w;
        if ((_242 < 0.0f) || (_242 > 1.0f))
        {
            discard_state = true;
        }
        if ((_243 < 0.0f) || (_243 > 1.0f))
        {
            discard_state = true;
        }
        float4 _374 = _9.Sample(_19, float2(((_16_m0[4u].z - _16_m0[4u].x) * _242) + _16_m0[4u].x, ((_16_m0[4u].w - _16_m0[4u].y) * _243) + _16_m0[4u].y));
        float _376 = _374.x;
        float _402;
        if (asuint(_16_m0[11u]).x == 0u)
        {
            _402 = _376;
        }
        else
        {
            float _408 = _16_m0[11u].z * 0.5f;
            float _411 = _16_m0[11u].y - _408;
            float frontier_phi_40_41_ladder;
            if (_16_m0[11u].y == 1.0f)
            {
                frontier_phi_40_41_ladder = 0.0f;
            }
            else
            {
                float frontier_phi_40_41_ladder_47_ladder;
                if (_16_m0[11u].z == 0.0f)
                {
                    frontier_phi_40_41_ladder_47_ladder = (_376 < _16_m0[11u].y) ? 0.0f : 1.0f;
                }
                else
                {
                    frontier_phi_40_41_ladder_47_ladder = (min(max(_376, _411), _16_m0[11u].y + _408) - _411) / _16_m0[11u].z;
                }
                frontier_phi_40_41_ladder = frontier_phi_40_41_ladder_47_ladder;
            }
            _402 = frontier_phi_40_41_ladder;
        }
        _214 = _402 * _175;
    }
    SV_Target.x = _214 * _124;
    SV_Target.y = _214 * _128;
    SV_Target.z = _214 * _132;
    SV_Target.w = 1.0f;
    discard_exit();
}

SPIRV_Cross_Output main(SPIRV_Cross_Input stage_input)
{
    gl_FragCoord = stage_input.gl_FragCoord;
    gl_FragCoord.w = 1.0 / gl_FragCoord.w;
    TEXCOORD = stage_input.TEXCOORD;
    COLOR = stage_input.COLOR;
    frag_main();
    SPIRV_Cross_Output stage_output;

    stage_output.SV_Target = SV_Target;
    //stage_output.SV_Target = stage_input.COLOR;

    return stage_output;
}
