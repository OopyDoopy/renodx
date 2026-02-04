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
} _41;

layout(set = 1, binding = 0) uniform sampler2D gBufferMap;

layout(location = 0) in VertexBlock
{
    noperspective vec2 mTexCoordsVec2;
} In;

layout(location = 0) out vec4 out_color0;

void main()
{
    float _70 = 0.398942291736602783203125 / _41.lUniforms.mpCustomPerMesh.gBlurParamsVec4.z;
    float _78 = exp((-0.5) / (_41.lUniforms.mpCustomPerMesh.gBlurParamsVec4.z * _41.lUniforms.mpCustomPerMesh.gBlurParamsVec4.z));
    float coefficients[4];
    coefficients[0] = _70;
    float _508;
    vec3 _516;
    _516 = vec3(_70, _78, _78 * _78);
    _508 = _70;
    for (int _505 = 1; _505 <= 3; )
    {
        vec2 _109 = _516.yz;
        vec2 _111 = _516.xy;
        vec2 _112 = _111 * _109;
        float _114 = _112.x;
        vec3 _499 = _516;
        _499.x = _114;
        _499.y = _112.y;
        coefficients[_505] = _114;
        _516 = _499;
        _508 = fma(2.0, _114, _508);
        _505++;
        continue;
    }
    float _506;
    vec4 _509;
    _509 = vec4(0.0);
    _506 = -3.0;
    vec4 _214;
    for (; _506 <= 3.0; _509 = _214, _506 += 1.0)
    {
        vec4 _512;
        _512 = textureLod(gBufferMap, fma(_41.lUniforms.mpPerFrame.gFrameBufferSizeVec4.zw * _506, vec2(0.0, 1.0), In.mTexCoordsVec2), 0.0) * coefficients[0];
        for (float _511 = 1.0; _511 <= 3.0; )
        {
            vec2 _170 = vec2(_511, _506);
            int _187 = int(_511);
            _512 = (_512 + (textureLod(gBufferMap, fma(-_170, _41.lUniforms.mpPerFrame.gFrameBufferSizeVec4.zw, In.mTexCoordsVec2), 0.0) * coefficients[_187])) + (textureLod(gBufferMap, fma(_170, _41.lUniforms.mpPerFrame.gFrameBufferSizeVec4.zw, In.mTexCoordsVec2), 0.0) * coefficients[_187]);
            _511 += 1.0;
            continue;
        }
        _214 = _509 + ((_512 / vec4(_508)) * coefficients[int(abs(_506))]);
    }
    out_color0 = vec4((_509 / vec4(_508 * _41.lUniforms.mpCustomPerMesh.gBlurParamsVec4.w)).xyz, 1.0);
}
