Texture2D<float4> _8 : register(t0, space0);

static float4 gl_FragCoord;
static float SV_Target;

struct SPIRV_Cross_Input
{
    float4 gl_FragCoord : SV_Position;
};

struct SPIRV_Cross_Output
{
    float SV_Target : SV_Target0;
};

void frag_main()
{
    uint _25 = uint(int(gl_FragCoord.x)) << 1u;
    uint _26 = uint(int(gl_FragCoord.y)) << 1u;
    uint _31 = _25 | 1u;
    uint _35 = _26 | 1u;
    SV_Target = min(min(_8.Load(int3(uint2(_25, _26), 0u)).x, _8.Load(int3(uint2(_31, _26), 0u)).x), min(_8.Load(int3(uint2(_31, _35), 0u)).x, _8.Load(int3(uint2(_25, _35), 0u)).x));
}

SPIRV_Cross_Output main(SPIRV_Cross_Input stage_input)
{
    gl_FragCoord = stage_input.gl_FragCoord;
    gl_FragCoord.w = 1.0 / gl_FragCoord.w;
    frag_main();
    SPIRV_Cross_Output stage_output;
    stage_output.SV_Target = SV_Target;
    return stage_output;
}
