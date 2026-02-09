#version 450

#include "./tonemapping.hlsl"

struct PerFrameUniforms
{
    mat4 gViewProjectionMat4;
    mat4 gCameraMat4;
    mat4 gCameraNoHeadTrackingMat4;
    mat4 gPrevViewProjectionMat4;
    mat4 gInverseViewProjectionMat4;
    mat4 gViewMat4;
    mat4 gProjectionMat4;
    mat4 gInverseProjectionMat4;
    mat4 gThisToPrevViewProjectionMat4;
    mat4 gInverseViewMat4;
    mat4 gInverseProjectionSCMat4;
    mat4 gInverseViewProjectionSCMat4;
    mat4 gProjectionNoJitterMat4;
    mat4 gViewProjectionNoJitterMat4;
    mat4 gInverseViewProjectionNoJitterMat4;
    mat4 gPrevViewProjectionNoJitterMat4;
    mat4 gPrevInverseViewProjectionNoJitterMat4;
    mat4 gPrevInverseViewProjectionSCMat4;
    vec3 gPrevViewPositionVec3;
    int giAntiAliasingIndex;
    vec4 gMBlurSettingsVec4;
    vec4 gTaaSettingsVec4;
    vec4 gTessSettingsVec4;
    vec4 gShellsSettingsVec4;
    vec4 gFoVValuesVec4;
    mat4 gInverseWorldUpMat4;
    vec3 gViewPositionVec3;
    vec3 gVREyeInfoVec3;
    vec4 gClipPlanesVec4;
    float gfTime;
    float gfPrevTime;
    int giDisableAmbientAllowed;
    int giFrameIndex;
    vec4 gDeJitterVec4;
    vec4 gFrameBufferSizeVec4;
    vec4 gShadowSizeVec4;
    vec3 gShadowProjScaleVec3;
    vec4 gShadowFadeParamVec4;
    vec4 gHeroLightColourVec4;
    vec4 gHeroLightPositionVec4;
    vec4 gHeroLightDirectionVec4;
    vec3 gRenderOffsetVec3;
    float _padding0;
};

struct CustomPerMeshUniforms
{
    vec4 gDoFParamsVec4;
    vec4 gHDRParamsVec4;
    vec4 gHBAOParamsVec4;
    vec4 gThresholdParamsVec4;
    vec4 gCustomParamsVec4;
    vec4 gBlurParamsVec4;
    vec4 gColourLUTParamsVec4;
    vec4 gColourLUTStrengthsVec4;
    vec4 gTextureSizeMipLevelVec4;
    vec4 gSkyUpperParamsVec4;
    vec4 gLightShaftColourBottomVec4;
    vec4 gLightShaftColourTopVec4;
    vec4 gAcesCurveParams[9];
    vec4 gHDRParams2Vec4;
};

struct CommonPerMeshUniforms
{
    mat4 gWorldMat4;
    mat4 gWorldNormalMat4;
    float fdFadeValueDummy;
    uint guContextVariant;
    int giLodIndex;
    vec4 gPlanetPositionVec4;
    vec4 gScanParamsPosVec4;
    vec4 gScanParamsCfg1Vec4;
    vec4 gScanParamsCfg2Vec4;
    vec4 gScanParamsCfg3Vec4;
    vec4 gScanColourVec4;
    mat4 gaShadowMat4[3];
    vec4 gLightColourVec4;
    vec4 gLightCustomParamsVec4;
    mat4 gWorldMotionMat4;
    mat4 gInverseModelMat4Dummy;
    vec4 gUserDataVec4;
    vec4 gLightPositionVec4;
    vec4 gLightDirectionVec4;
    vec4 gLightOriginVec4;
};

struct UniformBuffer
{
    PerFrameUniforms mpPerFrame;
    CustomPerMeshUniforms mpCustomPerMesh;
    CommonPerMeshUniforms mpCommonPerMesh;
};

layout(set = 0, binding = 0, std140) uniform lUniforms_BLK
{
    UniformBuffer lUniforms;
} _151;

layout(set = 1, binding = 0) uniform sampler2D gBufferMap;

layout(location = 0) in VertexBlock
{
    vec2 mTexCoordsVec2;
} In;

layout(location = 0) out vec4 out_color0;

void main()
{
    vec4 _376 = texture(gBufferMap, In.mTexCoordsVec2);

    float4 outputColor = _376;

    if (RENODX_TONE_MAP_TYPE < 2) {

    
    vec4 _1563 = _376;
    _1563.x = _376.x;
    _1563.y = _376.y;
    _1563.z = _376.z;
    vec3 _406 = _1563.xyz * mat3(vec3(0.785552442073822021484375, 0.2073709070682525634765625, 0.0070768860168755054473876953125), vec3(0.049646966159343719482421875, 0.9488914012908935546875, 0.001461360021494328975677490234375), vec3(0.00373999332077801227569580078125, 0.0392914749681949615478515625, 0.956968486309051513671875));
    vec4 _1569 = _1563;
    _1569.x = _406.x;
    _1569.y = _406.y;
    _1569.z = _406.z;
    vec3 _415 = _1569.xyz * 10.0;
    vec4 _1575 = _1569;
    _1575.x = _415.x;
    _1575.y = _415.y;
    _1575.z = _415.z;
    vec3 _425 = _1575.xyz * 0.75;
    float _1062 = log2(max(_425.x, 6.099999882280826568603515625e-05));
    float _1063 = _1062 * 0.3010300099849700927734375;
    float _1697;
    if (_1063 <= _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y)
    {
        _1697 = fma(_1063, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].x, fma(-_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].x, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].z));
    }
    else
    {
        bool _926 = _1063 > _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y;
        bool _933;
        if (_926)
        {
            _933 = _1063 < _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y;
        }
        else
        {
            _933 = _926;
        }
        float _1698;
        if (_933)
        {
            float _1012 = (3.0 * fma(_1062, 0.3010300099849700927734375, -_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y)) / (_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y - _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y);
            int _1014 = int(_1012);
            float _1018 = _1012 - float(_1014);
            _1698 = dot(vec3(_1018 * _1018, _1018, 1.0), mat3(vec3(0.5, -1.0, 0.5), vec3(-1.0, 1.0, 0.5), vec3(0.5, 0.0, 0.0)) * vec3(_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[_1014 + 3].x, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[_1014 + 4].x, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[_1014 + 5].x));
        }
        else
        {
            bool _938 = _1063 >= _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y;
            bool _945;
            if (_938)
            {
                _945 = _1063 < _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].y;
            }
            else
            {
                _945 = _938;
            }
            float _1699;
            if (_945)
            {
                float _971 = (3.0 * fma(_1062, 0.3010300099849700927734375, -_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y)) / (_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].y - _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y);
                int _973 = int(_971);
                float _977 = _971 - float(_973);
                _1699 = dot(vec3(_977 * _977, _977, 1.0), mat3(vec3(0.5, -1.0, 0.5), vec3(-1.0, 1.0, 0.5), vec3(0.5, 0.0, 0.0)) * vec3(_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[_973 + 3].y, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[_973 + 4].y, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[_973 + 5].y));
            }
            else
            {
                _1699 = fma(_1063, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].x, fma(-_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].x, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].y, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].z));
            }
            _1698 = _1699;
        }
        _1697 = _1698;
    }
    float _1254 = log2(max(_425.y, 6.099999882280826568603515625e-05));
    float _1255 = _1254 * 0.3010300099849700927734375;
    float _1706;
    if (_1255 <= _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y)
    {
        _1706 = fma(_1255, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].x, fma(-_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].x, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].z));
    }
    else
    {
        bool _1118 = _1255 > _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y;
        bool _1125;
        if (_1118)
        {
            _1125 = _1255 < _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y;
        }
        else
        {
            _1125 = _1118;
        }
        float _1707;
        if (_1125)
        {
            float _1204 = (3.0 * fma(_1254, 0.3010300099849700927734375, -_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y)) / (_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y - _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y);
            int _1206 = int(_1204);
            float _1210 = _1204 - float(_1206);
            _1707 = dot(vec3(_1210 * _1210, _1210, 1.0), mat3(vec3(0.5, -1.0, 0.5), vec3(-1.0, 1.0, 0.5), vec3(0.5, 0.0, 0.0)) * vec3(_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[_1206 + 3].x, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[_1206 + 4].x, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[_1206 + 5].x));
        }
        else
        {
            bool _1130 = _1255 >= _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y;
            bool _1137;
            if (_1130)
            {
                _1137 = _1255 < _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].y;
            }
            else
            {
                _1137 = _1130;
            }
            float _1708;
            if (_1137)
            {
                float _1163 = (3.0 * fma(_1254, 0.3010300099849700927734375, -_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y)) / (_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].y - _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y);
                int _1165 = int(_1163);
                float _1169 = _1163 - float(_1165);
                _1708 = dot(vec3(_1169 * _1169, _1169, 1.0), mat3(vec3(0.5, -1.0, 0.5), vec3(-1.0, 1.0, 0.5), vec3(0.5, 0.0, 0.0)) * vec3(_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[_1165 + 3].y, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[_1165 + 4].y, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[_1165 + 5].y));
            }
            else
            {
                _1708 = fma(_1255, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].x, fma(-_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].x, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].y, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].z));
            }
            _1707 = _1708;
        }
        _1706 = _1707;
    }
    float _1446 = log2(max(_425.z, 6.099999882280826568603515625e-05));
    float _1447 = _1446 * 0.3010300099849700927734375;
    float _1714;
    if (_1447 <= _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y)
    {
        _1714 = fma(_1447, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].x, fma(-_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].x, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].z));
    }
    else
    {
        bool _1310 = _1447 > _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y;
        bool _1317;
        if (_1310)
        {
            _1317 = _1447 < _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y;
        }
        else
        {
            _1317 = _1310;
        }
        float _1715;
        if (_1317)
        {
            float _1396 = (3.0 * fma(_1446, 0.3010300099849700927734375, -_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y)) / (_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y - _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y);
            int _1398 = int(_1396);
            float _1402 = _1396 - float(_1398);
            _1715 = dot(vec3(_1402 * _1402, _1402, 1.0), mat3(vec3(0.5, -1.0, 0.5), vec3(-1.0, 1.0, 0.5), vec3(0.5, 0.0, 0.0)) * vec3(_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[_1398 + 3].x, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[_1398 + 4].x, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[_1398 + 5].x));
        }
        else
        {
            bool _1322 = _1447 >= _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y;
            bool _1329;
            if (_1322)
            {
                _1329 = _1447 < _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].y;
            }
            else
            {
                _1329 = _1322;
            }
            float _1716;
            if (_1329)
            {
                float _1355 = (3.0 * fma(_1446, 0.3010300099849700927734375, -_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y)) / (_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].y - _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y);
                int _1357 = int(_1355);
                float _1361 = _1355 - float(_1357);
                _1716 = dot(vec3(_1361 * _1361, _1361, 1.0), mat3(vec3(0.5, -1.0, 0.5), vec3(-1.0, 1.0, 0.5), vec3(0.5, 0.0, 0.0)) * vec3(_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[_1357 + 3].y, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[_1357 + 4].y, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[_1357 + 5].y));
            }
            else
            {
                _1716 = fma(_1447, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].x, fma(-_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].x, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].y, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].z));
            }
            _1715 = _1716;
        }
        _1714 = _1715;
    }
    _1575.x = pow(10.0, _1697);
    _1575.y = pow(10.0, _1706);
    _1575.z = pow(10.0, _1714);
    vec3 _607 = _1575.xyz * mat3(vec3(1.69192218780517578125, -0.605636894702911376953125, -0.086444489657878875732421875), vec3(-0.1286521852016448974609375, 1.13804304599761962890625, -0.009367738850414752960205078125), vec3(-0.0240197293460369110107421875, -0.12613250315189361572265625, 1.15039217472076416015625));
    vec4 _1659 = _1575;
    _1659.x = _607.x;
    _1659.y = _607.y;
    _1659.z = _607.z;
    vec3 _617 = _1659.xyz * 0.00999999977648258209228515625;
    vec4 _1665 = _1659;
    _1665.x = _617.x;
    _1665.y = _617.y;
    _1665.z = _617.z;
    vec3 _627 = _1665.xyz * 0.25;
    vec4 _1671 = _1665;
    _1671.x = _627.x;
    _1671.y = _627.y;
    _1671.z = _627.z;
    vec3 _637 = _1671.xyz * 1.33333337306976318359375;
    float _639 = _637.x;
    float _641 = _637.y;
    float _643 = _637.z;
    float _1487 = (_639 < 0.0) ? (-1.0) : 1.0;
    float _1490 = _639 * _1487;
    float _1737;
    if (_1490 < 1.0)
    {
        _1737 = pow(_1490, 0.4545454680919647216796875);
    }
    else
    {
        float _1738;
        if (_1490 > 0.0)
        {
            _1738 = pow(_1490, 0.4166666567325592041015625);
        }
        else
        {
            _1738 = _1490;
        }
        _1737 = _1738;
    }
    float _1514 = (_641 < 0.0) ? (-1.0) : 1.0;
    float _1517 = _641 * _1514;
    float _1756;
    if (_1517 < 1.0)
    {
        _1756 = pow(_1517, 0.4545454680919647216796875);
    }
    else
    {
        float _1757;
        if (_1517 > 0.0)
        {
            _1757 = pow(_1517, 0.4166666567325592041015625);
        }
        else
        {
            _1757 = _1517;
        }
        _1756 = _1757;
    }
    float _1541 = (_643 < 0.0) ? (-1.0) : 1.0;
    float _1544 = _643 * _1541;
    float _1760;
    if (_1544 < 1.0)
    {
        _1760 = pow(_1544, 0.4545454680919647216796875);
    }
    else
    {
        float _1761;
        if (_1544 > 0.0)
        {
            _1761 = pow(_1544, 0.4166666567325592041015625);
        }
        else
        {
            _1761 = _1544;
        }
        _1760 = _1761;
    }
    vec4 _1692 = _1671;
    _1692.x = _1737 * _1487;
    _1692.y = _1756 * _1514;
    _1692.z = _1760 * _1541;
    outputColor = _1692;
    } else {
      outputColor.xyz = Uncharted2Extended(outputColor.xyz);
      outputColor.xyz = CustomTonemap(outputColor.xyz, In.mTexCoordsVec2);
      outputColor.xyz = CustomGammaEncode(outputColor.xyz);
    }



    out_color0 = outputColor;
}

