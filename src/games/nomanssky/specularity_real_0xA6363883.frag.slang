#version 450

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
    vec4 gCustomParamsVec4;
    vec4 gHBAOParamsVec4;
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
} _1615;

layout(set = 1, binding = 1) uniform usampler2D gBuffer0uMap;
layout(set = 1, binding = 2) uniform usampler2D gBuffer1uMap;
layout(set = 1, binding = 3) uniform usampler2D gBuffer2uMap;
layout(set = 1, binding = 0) uniform sampler2D gBuffer0Map;

layout(location = 0) out uint out_var0;

void main()
{
    ivec2 _1595 = ivec2(uvec2(gl_FragCoord.xy));
    uint _5865;
    do
    {
        vec2 _1762 = vec2(textureSize(gBuffer1uMap, 0));
        vec2 _1764 = vec2(_1595);
        vec2 _1773 = texelFetch(gBuffer0Map, _1595, 0).xy;
        vec2 _1786 = ((((_1764 + vec2(0.5)) / _1615.lUniforms.mpPerFrame.gFrameBufferSizeVec4.xy) + _1773) + vec2(_1615.lUniforms.mpPerFrame.gDeJitterVec4.z, -_1615.lUniforms.mpPerFrame.gDeJitterVec4.w)) - vec2(_1615.lUniforms.mpPerFrame.gDeJitterVec4.x, -_1615.lUniforms.mpPerFrame.gDeJitterVec4.y);
        uvec4 _1790 = texelFetch(gBuffer2uMap, _1595, 0);
        uint _1791 = _1790.x;
        uint _1793 = _1791 & 65535u;
        uint _1795 = _1791 >> uint(16);
        uvec4 _2086 = texelFetch(gBuffer0uMap, _1595, 0);
        uint _2087 = _2086.x;
        vec2 _2094 = _1764 / _1615.lUniforms.mpPerFrame.gFrameBufferSizeVec4.xy;
        uvec4 _2098 = textureGatherOffset(gBuffer0uMap, _2094, ivec2(-1, 0)).wzxy * (uvec4(_1793 >> uint(0), _1793 >> uint(1), _1793 >> uint(2), _1793 >> uint(3)) & uvec4(1u));
        uvec4 _2109 = textureGatherOffset(gBuffer0uMap, _2094, ivec2(1, -1)).wzxy * (uvec4(_1793 >> uint(4), _1793 >> uint(5), _1793 >> uint(6), _1793 >> uint(7)) & uvec4(1u));
        uvec4 _2120 = textureGatherOffset(gBuffer0uMap, _2094, ivec2(2, 1)).wzxy * (uvec4(_1793 >> uint(8), _1793 >> uint(9), _1793 >> uint(10), _1793 >> uint(11)) & uvec4(1u));
        uvec4 _2131 = textureGatherOffset(gBuffer0uMap, _2094, ivec2(0, 2)).wzxy * (uvec4(_1793 >> uint(12), _1793 >> uint(13), _1793 >> uint(14), _1793 >> uint(15)) & uvec4(1u));
        uvec4 _5870 = uvec4(_2087 & 255u, (_2087 >> uint(8)) & 255u, (_2087 >> uint(16)) & 255u, _2087 >> uint(24));
        uint _2143 = _2098.x;
        uvec4 _5871 = uvec4(_2143 & 255u, (_2143 >> uint(8)) & 255u, (_2143 >> uint(16)) & 255u, _2143 >> uint(24));
        uint _2148 = _2098.y;
        uvec4 _5872 = uvec4(_2148 & 255u, (_2148 >> uint(8)) & 255u, (_2148 >> uint(16)) & 255u, _2148 >> uint(24));
        uint _2153 = _2098.z;
        uvec4 _5873 = uvec4(_2153 & 255u, (_2153 >> uint(8)) & 255u, (_2153 >> uint(16)) & 255u, _2153 >> uint(24));
        uint _2185 = _2109.x;
        uvec4 _5874 = uvec4(_2185 & 255u, (_2185 >> uint(8)) & 255u, (_2185 >> uint(16)) & 255u, _2185 >> uint(24));
        uint _2190 = _2109.y;
        uvec4 _5875 = uvec4(_2190 & 255u, (_2190 >> uint(8)) & 255u, (_2190 >> uint(16)) & 255u, _2190 >> uint(24));
        uint _2195 = _2109.z;
        uvec4 _5876 = uvec4(_2195 & 255u, (_2195 >> uint(8)) & 255u, (_2195 >> uint(16)) & 255u, _2195 >> uint(24));
        uint _2227 = _2120.x;
        uvec4 _5877 = uvec4(_2227 & 255u, (_2227 >> uint(8)) & 255u, (_2227 >> uint(16)) & 255u, _2227 >> uint(24));
        uint _2232 = _2120.y;
        uvec4 _5878 = uvec4(_2232 & 255u, (_2232 >> uint(8)) & 255u, (_2232 >> uint(16)) & 255u, _2232 >> uint(24));
        uint _2237 = _2120.z;
        uvec4 _5879 = uvec4(_2237 & 255u, (_2237 >> uint(8)) & 255u, (_2237 >> uint(16)) & 255u, _2237 >> uint(24));
        uint _2269 = _2131.x;
        uvec4 _5880 = uvec4(_2269 & 255u, (_2269 >> uint(8)) & 255u, (_2269 >> uint(16)) & 255u, _2269 >> uint(24));
        uint _2274 = _2131.y;
        uvec4 _5881 = uvec4(_2274 & 255u, (_2274 >> uint(8)) & 255u, (_2274 >> uint(16)) & 255u, _2274 >> uint(24));
        uint _2279 = _2131.z;
        uvec4 _5882 = uvec4(_2279 & 255u, (_2279 >> uint(8)) & 255u, (_2279 >> uint(16)) & 255u, _2279 >> uint(24));
        uint _2311 = _2098.w;
        uvec4 _5883 = uvec4(_2311 & 255u, (_2311 >> uint(8)) & 255u, (_2311 >> uint(16)) & 255u, _2311 >> uint(24));
        uint _2316 = _2109.w;
        uvec4 _5884 = uvec4(_2316 & 255u, (_2316 >> uint(8)) & 255u, (_2316 >> uint(16)) & 255u, _2316 >> uint(24));
        uint _2321 = _2120.w;
        uvec4 _5885 = uvec4(_2321 & 255u, (_2321 >> uint(8)) & 255u, (_2321 >> uint(16)) & 255u, _2321 >> uint(24));
        uint _2326 = _2131.w;
        uvec4 _5886 = uvec4(_2326 & 255u, (_2326 >> uint(8)) & 255u, (_2326 >> uint(16)) & 255u, _2326 >> uint(24));
        vec4 _2397 = vec4(1.0 + float(uint(bitCount(_1793))));
        vec4 _2398 = (vec4((((((((((((((((_5870 + _5871) + _5872) + _5873) + _5874) + _5875) + _5876) + _5877) + _5878) + _5879) + _5880) + _5881) + _5882) + _5883) + _5884) + _5885) + _5886) * vec4(0.0123199708759784698486328125, 0.0039215688593685626983642578125, 0.0039215688593685626983642578125, 0.0039215688593685626983642578125)) / _2397;
        bool _1815 = _1795 == 0u;
        bool _1822;
        if (!_1815)
        {
            _1822 = _1786.x > 1.0;
        }
        else
        {
            _1822 = _1815;
        }
        bool _1829;
        if (!_1822)
        {
            _1829 = _1786.y > 1.0;
        }
        else
        {
            _1829 = _1822;
        }
        bool _1836;
        if (!_1829)
        {
            _1836 = _1786.x < 0.0;
        }
        else
        {
            _1836 = _1829;
        }
        bool _1843;
        if (!_1836)
        {
            _1843 = _1786.y < 0.0;
        }
        else
        {
            _1843 = _1836;
        }
        if (_1843)
        {
            _5865 = ((uint(fma(clamp(_2398.x, 0.0, 1.0), 255.0, 0.5)) | (uint(fma(clamp(_2398.y, 0.0, 1.0), 255.0, 0.5)) << uint(8))) | (uint(fma(clamp(_2398.z, 0.0, 1.0), 255.0, 0.5)) << uint(16))) | (uint(fma(clamp(_2398.w, 0.0, 1.0), 255.0, 0.5)) << uint(24));
            break;
        }
        vec2 _3415 = floor(_1786 * _1762);
        vec2 _3419 = _3415 / _1762;
        uvec4 _3422 = textureGather(gBuffer1uMap, _3419);
        uvec4 _3426 = textureGatherOffset(gBuffer1uMap, _3419, ivec2(1));
        uvec4 _3430 = textureGatherOffset(gBuffer1uMap, _3419, ivec2(1, 0));
        uint _3431 = _3430.z;
        uvec4 _3434 = textureGatherOffset(gBuffer1uMap, _3419, ivec2(0, 1));
        uint _3435 = _3434.x;
        vec2 _3445 = fma(_1786, _1762, vec2(-0.5)) - _3415;
        float _3450 = _3445.x;
        float _3451 = _3450 + 1.0;
        float _3956 = fma(_3451, _3451, abs(_3451) * (-2.5)) + 1.5;
        float _3968 = fma(_3450 * (-2.0), _3450, 1.0);
        float _3460 = _3450 - 1.0;
        float _3986 = fma(_3460, _3460, abs(_3460) * (-2.5)) + 1.5;
        float _3465 = _3445.y;
        float _3466 = _3465 + 1.0;
        float _4004 = fma(_3466, _3466, abs(_3466) * (-2.5)) + 1.5;
        float _4016 = fma(_3465 * (-2.0), _3465, 1.0);
        float _3475 = _3465 - 1.0;
        float _4034 = fma(_3475, _3475, abs(_3475) * (-2.5)) + 1.5;
        uint _3486 = (_1795 >> uint(0)) & 1u;
        float _3487 = float(_3486);
        uint _3496 = (_1795 >> uint(1)) & 1u;
        float _3497 = float(_3496);
        uint _3507 = (_1795 >> uint(2)) & 1u;
        float _3508 = float(_3507);
        uint _3518 = (_1795 >> uint(3)) & 1u;
        float _3519 = float(_3518);
        uint _3529 = (_1795 >> uint(4)) & 1u;
        float _3530 = float(_3529);
        uint _3540 = (_1795 >> uint(5)) & 1u;
        float _3541 = float(_3540);
        uint _3551 = (_1795 >> uint(6)) & 1u;
        float _3552 = float(_3551);
        uint _3562 = (_1795 >> uint(7)) & 1u;
        float _3563 = float(_3562);
        uint _3573 = (_1795 >> uint(8)) & 1u;
        float _3574 = float(_3573);
        float _3576 = fma(_3986 * _4034, _3574, fma(_3968 * _4034, _3563, fma(_3956 * _4034, _3552, fma(_3986 * _4016, _3541, fma(_3968 * _4016, _3530, fma(_3956 * _4016, _3519, fma(_3986 * _4004, _3508, fma(_3956 * _4004, _3487, (_3968 * _4004) * _3497))))))));
        uint _3578 = _3422.w;
        vec4 _5898 = vec4(float(_3578 & 255u) * 0.0039215688593685626983642578125, float((_3578 >> uint(8)) & 255u) * 0.0039215688593685626983642578125, float((_3578 >> uint(16)) & 255u) * 0.0039215688593685626983642578125, float(_3578 >> uint(24)) * 0.0039215688593685626983642578125);
        uint _3592 = _3422.z;
        vec4 _5899 = vec4(float(_3592 & 255u) * 0.0039215688593685626983642578125, float((_3592 >> uint(8)) & 255u) * 0.0039215688593685626983642578125, float((_3592 >> uint(16)) & 255u) * 0.0039215688593685626983642578125, float(_3592 >> uint(24)) * 0.0039215688593685626983642578125);
        vec4 _5900 = vec4(float(_3431 & 255u) * 0.0039215688593685626983642578125, float((_3431 >> uint(8)) & 255u) * 0.0039215688593685626983642578125, float((_3431 >> uint(16)) & 255u) * 0.0039215688593685626983642578125, float(_3431 >> uint(24)) * 0.0039215688593685626983642578125);
        uint _3619 = _3422.x;
        vec4 _5901 = vec4(float(_3619 & 255u) * 0.0039215688593685626983642578125, float((_3619 >> uint(8)) & 255u) * 0.0039215688593685626983642578125, float((_3619 >> uint(16)) & 255u) * 0.0039215688593685626983642578125, float(_3619 >> uint(24)) * 0.0039215688593685626983642578125);
        uint _3633 = _3422.y;
        vec4 _5902 = vec4(float(_3633 & 255u) * 0.0039215688593685626983642578125, float((_3633 >> uint(8)) & 255u) * 0.0039215688593685626983642578125, float((_3633 >> uint(16)) & 255u) * 0.0039215688593685626983642578125, float(_3633 >> uint(24)) * 0.0039215688593685626983642578125);
        uint _3647 = _3426.z;
        vec4 _5903 = vec4(float(_3647 & 255u) * 0.0039215688593685626983642578125, float((_3647 >> uint(8)) & 255u) * 0.0039215688593685626983642578125, float((_3647 >> uint(16)) & 255u) * 0.0039215688593685626983642578125, float(_3647 >> uint(24)) * 0.0039215688593685626983642578125);
        vec4 _5904 = vec4(float(_3435 & 255u) * 0.0039215688593685626983642578125, float((_3435 >> uint(8)) & 255u) * 0.0039215688593685626983642578125, float((_3435 >> uint(16)) & 255u) * 0.0039215688593685626983642578125, float(_3435 >> uint(24)) * 0.0039215688593685626983642578125);
        uint _3674 = _3426.x;
        vec4 _5905 = vec4(float(_3674 & 255u) * 0.0039215688593685626983642578125, float((_3674 >> uint(8)) & 255u) * 0.0039215688593685626983642578125, float((_3674 >> uint(16)) & 255u) * 0.0039215688593685626983642578125, float(_3674 >> uint(24)) * 0.0039215688593685626983642578125);
        uint _3688 = _3426.y;
        vec4 _5906 = vec4(float(_3688 & 255u) * 0.0039215688593685626983642578125, float((_3688 >> uint(8)) & 255u) * 0.0039215688593685626983642578125, float((_3688 >> uint(16)) & 255u) * 0.0039215688593685626983642578125, float(_3688 >> uint(24)) * 0.0039215688593685626983642578125);
        bvec4 _5919 = bvec4(_3486 > 0u);
        bvec4 _5921 = bvec4(_3496 > 0u);
        bvec4 _5923 = bvec4(_3507 > 0u);
        bvec4 _5925 = bvec4(_3518 > 0u);
        bvec4 _5927 = bvec4(_3529 > 0u);
        bvec4 _5929 = bvec4(_3540 > 0u);
        bvec4 _5931 = bvec4(_3551 > 0u);
        bvec4 _5933 = bvec4(_3562 > 0u);
        bvec4 _5935 = bvec4(_3573 > 0u);
        vec4 _4518 = min(min(mix(vec4(1.0), _5898, _5919), min(mix(vec4(1.0), _5899, _5921), mix(vec4(1.0), _5900, _5923))), min(min(mix(vec4(1.0), _5901, _5925), min(mix(vec4(1.0), _5902, _5927), mix(vec4(1.0), _5903, _5929))), min(mix(vec4(1.0), _5904, _5931), min(mix(vec4(1.0), _5905, _5933), mix(vec4(1.0), _5906, _5935)))));
        vec4 _4768 = max(max(mix(vec4(0.0), _5898, _5919), max(mix(vec4(0.0), _5899, _5921), mix(vec4(0.0), _5900, _5923))), max(max(mix(vec4(0.0), _5901, _5925), max(mix(vec4(0.0), _5902, _5927), mix(vec4(0.0), _5903, _5929))), max(mix(vec4(0.0), _5904, _5931), max(mix(vec4(0.0), _5905, _5933), mix(vec4(0.0), _5906, _5935)))));
        vec4 _5841;
        if (_3576 == 0.0)
        {
            _5841 = (_4518 * 0.5) + (_4768 * 0.5);
        }
        else
        {
            _5841 = clamp((((((((((((_5898 * _3956) * _4004) * _3487) + (((_5899 * _3968) * _4004) * _3497)) + (((_5900 * _3986) * _4004) * _3508)) + (((_5901 * _3956) * _4016) * _3519)) + (((_5902 * _3968) * _4016) * _3530)) + (((_5903 * _3986) * _4016) * _3541)) + (((_5904 * _3956) * _4034) * _3552)) + (((_5905 * _3968) * _4034) * _3563)) + (((_5906 * _3986) * _4034) * _3574)) / vec4(_3576), _4518, _4768);
        }
        float _1860 = clamp(length(_1773) * 8.0, 0.0, 1.0);
        float _1865 = pow(float(uint(bitCount(_1795))) * 0.111111111938953399658203125, 2.0);
        float _1866 = 1.0 - _1865;
        float _1880 = pow(clamp(fma(max(abs(0.5 - _1786.x), abs(0.5 - _1786.y)), 2.0, -0.75) * 4.0, 0.0, 1.0), 4.0);
        float _1884 = clamp(fma(_1860, 4.0, 0.25), 0.0, 1.0);
        float _1885 = _1880 * _1884;
        vec4 _1911 = sqrt(max(vec4(0.0), fma(-_2398, _2398, (vec4(((((((((((((((((_5870 * _5870) + (_5871 * _5871)) + (_5872 * _5872)) + (_5873 * _5873)) + (_5874 * _5874)) + (_5875 * _5875)) + (_5876 * _5876)) + (_5877 * _5877)) + (_5878 * _5878)) + (_5879 * _5879)) + (_5880 * _5880)) + (_5881 * _5881)) + (_5882 * _5882)) + (_5883 * _5883)) + (_5884 * _5884)) + (_5885 * _5885)) + (_5886 * _5886)) * vec4(0.00015178168541751801967620849609375, 1.5378702300949953496456146240234e-05, 1.5378702300949953496456146240234e-05, 1.5378702300949953496456146240234e-05)) / _2397))) * fma(-_1880, _1884, _1865 + 1.5);
        vec4 _1933 = mix(mix(clamp(_5841, _2398 - _1911, _2398 + _1911), _5841, vec4(fma(-_1885, 0.125, fma(_1860, 0.125, fma(-0.375, _1866, 0.5))))), mix(vec4(_5870) * vec4(0.0123199708759784698486328125, 0.0039215688593685626983642578125, 0.0039215688593685626983642578125, 0.0039215688593685626983642578125), _2398, vec4(_1860)), vec4(fma(0.25, _1885, fma(0.012500000186264514923095703125, _1866, 0.0500000007450580596923828125))));
        _5865 = ((uint(fma(clamp(_1933.x, 0.0, 1.0), 255.0, 0.5)) | (uint(fma(clamp(_1933.y, 0.0, 1.0), 255.0, 0.5)) << uint(8))) | (uint(fma(clamp(_1933.z, 0.0, 1.0), 255.0, 0.5)) << uint(16))) | (uint(fma(clamp(_1933.w, 0.0, 1.0), 255.0, 0.5)) << uint(24));
        break;
    } while(false);
    out_var0 = _5865;
}

