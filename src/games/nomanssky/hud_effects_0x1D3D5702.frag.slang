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
    vec4 gUIColourVec4;
    vec4 gUIDeformVec4;
    vec4 gVignetteVec4;
    vec4 gUILowHealthVignetteVec4;
    vec4 gWashParamsVec4;
    vec4 gCriticalHitPointsVec4;
    vec4 gFrontendFlashColourVec4;
    vec4 gUINoiseDistortionParamsVec4;
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

float _4789;

layout(set = 0, binding = 0, std140) uniform lUniforms_BLK
{
    UniformBuffer lUniforms;
} _1192;

layout(set = 1, binding = 0) uniform sampler2D gBufferMap;
layout(set = 1, binding = 2) uniform sampler2D gUIFullscreenNormal;
layout(set = 1, binding = 1) uniform sampler2D gUIFullscreenEffect;
layout(set = 1, binding = 5) uniform sampler2D gUIFullScreenRefraction;
layout(set = 1, binding = 3) uniform sampler2D gUICamoEffect;
layout(set = 1, binding = 4) uniform sampler2D gUICamoNormal;

layout(location = 0) in VertexBlock
{
    vec2 mTexCoordsVec2;
} In;

layout(location = 0) out vec4 out_color0;

void main()
{
    float _2378 = 1.0 - In.mTexCoordsVec2.y;
    vec2 _2379 = vec2(In.mTexCoordsVec2.x, _2378);
    bool _1201 = (_1192.lUniforms.mpCustomPerMesh.gUIDeformVec4.w > (-0.5)) ? true : false;
    bool _1209;
    if (_1201)
    {
        _1209 = _1192.lUniforms.mpPerFrame.gFoVValuesVec4.z == 1.0;
    }
    else
    {
        _1209 = _1201;
    }
    bool _1221;
    if (!_1209)
    {
        _1221 = (_1192.lUniforms.mpCustomPerMesh.gUIDeformVec4.w < (-1.0)) ? true : false;
    }
    else
    {
        _1221 = _1209;
    }
    bool _1228;
    if (_1221)
    {
        _1228 = _1192.lUniforms.mpPerFrame.gFoVValuesVec4.z != 2.0;
    }
    else
    {
        _1228 = _1221;
    }
    vec3 _2410 = textureLod(gBufferMap, In.mTexCoordsVec2, 0.0).xyz;

    float3 untonemapped = _2410;

    float _2417 = clamp(_1192.lUniforms.mpCustomPerMesh.gWashParamsVec4.y * 10.0, 0.0, 1.0);
    float _2421 = In.mTexCoordsVec2.x * 12.0;
    float _4747 = -In.mTexCoordsVec2.y;
    float _2459 = 1.0 - pow(fma(-(clamp(_2421, 0.0, 1.0) - clamp(fma(In.mTexCoordsVec2.x - 1.0, 12.0, 1.0), 0.0, 1.0)), clamp(_2378 * 12.0, 0.0, 1.0) - clamp(fma(_4747, 12.0, 1.0), 0.0, 1.0), 1.0), 2.0);
    vec3 _4666;
    if (_1192.lUniforms.mpCustomPerMesh.gWashParamsVec4.y < 1.0)
    {
        float _4750 = -_1192.lUniforms.mpCustomPerMesh.gWashParamsVec4.x;
        vec2 _4753 = vec2(fma(sin(fma(_1192.lUniforms.mpCustomPerMesh.gWashParamsVec4.x, 3.5, fma(In.mTexCoordsVec2.x, 18.0, In.mTexCoordsVec2.y * 16.0))), 0.25, fma(sin(fma(_4750, 1.5, fma(_4747, 4.0, In.mTexCoordsVec2.x))), 0.25, cos(fma(_1192.lUniforms.mpCustomPerMesh.gWashParamsVec4.x, 4.19999980926513671875, fma(In.mTexCoordsVec2.y, 8.0, In.mTexCoordsVec2.x * (-12.0)))) * 0.5)), _4789);
        _4753.y = fma(sin(fma(_1192.lUniforms.mpCustomPerMesh.gWashParamsVec4.x, 4.5, fma(In.mTexCoordsVec2.x, 22.0, In.mTexCoordsVec2.y * (-24.0)))), 0.25, fma(sin(fma(In.mTexCoordsVec2.x, 9.0, _1192.lUniforms.mpCustomPerMesh.gWashParamsVec4.x * 2.5)), 0.25, cos(fma(_4750, 2.5, fma(In.mTexCoordsVec2.y, 6.0, _2421))) * 0.5));
        vec2 _2554 = _4753 * _2459;
        vec3 _2586 = mix(vec3(textureLod(gBufferMap, In.mTexCoordsVec2 - (_2554 * 0.00200000009499490261077880859375), 0.0).x, textureLod(gBufferMap, In.mTexCoordsVec2 - (_2554 * 0.0030000000260770320892333984375), 0.0).y, textureLod(gBufferMap, In.mTexCoordsVec2 - (_2554 * 0.0040000001899898052215576171875), 0.0).z), _2410, vec3(_2417));
        vec3 _4667;
        if ((_2459 > 0.0) && (_2417 > 0.0))
        {
            vec3 _2606 = vec3(fma(_2379, vec2(14.22222232818603515625, 2.88000011444091796875), vec2(0.0, _1192.lUniforms.mpCustomPerMesh.gWashParamsVec4.x * 1.2000000476837158203125)), fma(_1192.lUniforms.mpCustomPerMesh.gWashParamsVec4.x, 0.20000000298023223876953125, 1.0));
            vec3 _2763 = floor(_2606 + vec3(dot(_2606, vec3(0.3333333432674407958984375))));
            vec3 _2772 = (_2606 - _2763) + vec3(dot(_2763, vec3(0.16666667163372039794921875)));
            vec3 _2776 = step(_2772.yzx, _2772);
            vec3 _2782 = (vec3(1.0) - _2776).zxy;
            vec3 _2783 = min(_2776, _2782);
            vec3 _2787 = max(_2776, _2782);
            vec3 _2793 = (_2772 - _2783) + vec3(0.16666667163372039794921875);
            vec3 _2799 = (_2772 - _2787) + vec3(0.3333333432674407958984375);
            vec3 _2803 = _2772 - vec3(0.5);
            vec3 _3037 = _2763 - (floor(_2763 * 0.00346020772121846675872802734375) * 289.0);
            vec4 _2814 = vec4(_3037.z) + vec4(0.0, _2783.z, _2787.z, 1.0);
            vec4 _3044 = (_2814 * 34.0) + vec4(1.0);
            vec4 _2825 = (fma(_3044, _2814, -(floor((_3044 * _2814) * 0.00346020772121846675872802734375) * 289.0)) + vec4(_3037.y)) + vec4(0.0, _2783.y, _2787.y, 1.0);
            vec4 _3062 = (_2825 * 34.0) + vec4(1.0);
            vec4 _2836 = (fma(_3062, _2825, -(floor((_3062 * _2825) * 0.00346020772121846675872802734375) * 289.0)) + vec4(_3037.x)) + vec4(0.0, _2783.x, _2787.x, 1.0);
            vec4 _3080 = (_2836 * 34.0) + vec4(1.0);
            vec4 _3091 = fma(_3080, _2836, -(floor((_3080 * _2836) * 0.00346020772121846675872802734375) * 289.0));
            vec4 _2855 = _3091 - (floor((_3091 * 0.14285714924335479736328125) * 0.14285714924335479736328125) * 49.0);
            vec4 _2860 = floor(_2855 * 0.14285714924335479736328125);
            vec4 _2872 = (_2860 * 0.2857142984867095947265625) + vec4(-0.928571403026580810546875);
            vec4 _2879 = (floor(_2855 - (_2860 * 7.0)) * 0.2857142984867095947265625) + vec4(-0.928571403026580810546875);
            vec4 _2886 = (vec4(1.0) - abs(_2872)) - abs(_2879);
            vec4 _2895 = vec4(_2872.xy, _2879.xy);
            vec4 _2904 = vec4(_2872.zw, _2879.zw);
            vec4 _2917 = -step(_2886, vec4(0.0));
            vec4 _2925 = fma(((floor(_2895) * 2.0) + vec4(1.0)).xzyw, _2917.xxyy, _2895.xzyw);
            vec4 _2933 = fma(((floor(_2904) * 2.0) + vec4(1.0)).xzyw, _2917.zzww, _2904.xzyw);
            vec3 _2940 = vec3(_2925.xy, _2886.x);
            vec3 _2947 = vec3(_2925.zw, _2886.y);
            vec3 _2954 = vec3(_2933.xy, _2886.z);
            vec3 _2961 = vec3(_2933.zw, _2886.w);
            vec4 _3097 = vec4(1.792842864990234375) - (vec4(dot(_2940, _2940), dot(_2947, _2947), dot(_2954, _2954), dot(_2961, _2961)) * 0.8537347316741943359375);
            vec4 _3008 = max(vec4(0.60000002384185791015625) - vec4(dot(_2772, _2772), dot(_2793, _2793), dot(_2799, _2799), dot(_2803, _2803)), vec4(0.0));
            vec4 _3011 = _3008 * _3008;
            vec3 _2624 = vec3(fma(_2379, vec2(1.06666672229766845703125, 0.4000000059604644775390625), vec2(0.0, _1192.lUniforms.mpCustomPerMesh.gWashParamsVec4.x * 0.5)), fma(_1192.lUniforms.mpCustomPerMesh.gWashParamsVec4.x, 0.300000011920928955078125, 3.0));
            vec3 _3145 = floor(_2624 + vec3(dot(_2624, vec3(0.3333333432674407958984375))));
            vec3 _3154 = (_2624 - _3145) + vec3(dot(_3145, vec3(0.16666667163372039794921875)));
            vec3 _3158 = step(_3154.yzx, _3154);
            vec3 _3164 = (vec3(1.0) - _3158).zxy;
            vec3 _3165 = min(_3158, _3164);
            vec3 _3169 = max(_3158, _3164);
            vec3 _3175 = (_3154 - _3165) + vec3(0.16666667163372039794921875);
            vec3 _3181 = (_3154 - _3169) + vec3(0.3333333432674407958984375);
            vec3 _3185 = _3154 - vec3(0.5);
            vec3 _3419 = _3145 - (floor(_3145 * 0.00346020772121846675872802734375) * 289.0);
            vec4 _3196 = vec4(_3419.z) + vec4(0.0, _3165.z, _3169.z, 1.0);
            vec4 _3426 = (_3196 * 34.0) + vec4(1.0);
            vec4 _3207 = (fma(_3426, _3196, -(floor((_3426 * _3196) * 0.00346020772121846675872802734375) * 289.0)) + vec4(_3419.y)) + vec4(0.0, _3165.y, _3169.y, 1.0);
            vec4 _3444 = (_3207 * 34.0) + vec4(1.0);
            vec4 _3218 = (fma(_3444, _3207, -(floor((_3444 * _3207) * 0.00346020772121846675872802734375) * 289.0)) + vec4(_3419.x)) + vec4(0.0, _3165.x, _3169.x, 1.0);
            vec4 _3462 = (_3218 * 34.0) + vec4(1.0);
            vec4 _3473 = fma(_3462, _3218, -(floor((_3462 * _3218) * 0.00346020772121846675872802734375) * 289.0));
            vec4 _3237 = _3473 - (floor((_3473 * 0.14285714924335479736328125) * 0.14285714924335479736328125) * 49.0);
            vec4 _3242 = floor(_3237 * 0.14285714924335479736328125);
            vec4 _3254 = (_3242 * 0.2857142984867095947265625) + vec4(-0.928571403026580810546875);
            vec4 _3261 = (floor(_3237 - (_3242 * 7.0)) * 0.2857142984867095947265625) + vec4(-0.928571403026580810546875);
            vec4 _3268 = (vec4(1.0) - abs(_3254)) - abs(_3261);
            vec4 _3277 = vec4(_3254.xy, _3261.xy);
            vec4 _3286 = vec4(_3254.zw, _3261.zw);
            vec4 _3299 = -step(_3268, vec4(0.0));
            vec4 _3307 = fma(((floor(_3277) * 2.0) + vec4(1.0)).xzyw, _3299.xxyy, _3277.xzyw);
            vec4 _3315 = fma(((floor(_3286) * 2.0) + vec4(1.0)).xzyw, _3299.zzww, _3286.xzyw);
            vec3 _3322 = vec3(_3307.xy, _3268.x);
            vec3 _3329 = vec3(_3307.zw, _3268.y);
            vec3 _3336 = vec3(_3315.xy, _3268.z);
            vec3 _3343 = vec3(_3315.zw, _3268.w);
            vec4 _3479 = vec4(1.792842864990234375) - (vec4(dot(_3322, _3322), dot(_3329, _3329), dot(_3336, _3336), dot(_3343, _3343)) * 0.8537347316741943359375);
            vec4 _3390 = max(vec4(0.60000002384185791015625) - vec4(dot(_3154, _3154), dot(_3175, _3175), dot(_3181, _3181), dot(_3185, _3185)), vec4(0.0));
            vec4 _3393 = _3390 * _3390;
            float _2635 = fma(fma(dot(_3011 * _3011, vec4(dot(_2940 * _3097.x, _2772), dot(_2947 * _3097.y, _2793), dot(_2954 * _3097.z, _2799), dot(_2961 * _3097.w, _2803))), 10.5, dot(_3393 * _3393, vec4(dot(_3322 * _3479.x, _3154), dot(_3329 * _3479.y, _3175), dot(_3336 * _3479.z, _3181), dot(_3343 * _3479.w, _3185))) * 31.5), 0.5, 0.5);
            float _2638 = clamp(smoothstep(0.0199999995529651641845703125 + _1192.lUniforms.mpCustomPerMesh.gWashParamsVec4.y, 0.02999999932944774627685546875 + _1192.lUniforms.mpCustomPerMesh.gWashParamsVec4.y, _2635), 0.0, 1.0);
            vec3 _4668;
            if (_2638 > 0.0)
            {
                vec2 _2660 = _2379 + vec2(pow(clamp(clamp(smoothstep(_1192.lUniforms.mpCustomPerMesh.gWashParamsVec4.y, 0.5 + _1192.lUniforms.mpCustomPerMesh.gWashParamsVec4.y, _2635), 0.0, 1.0), 0.0, 1.0), 0.100000001490116119384765625) * 3.0);
                vec2 _2673 = vec2(dFdx(_2660).x, dFdy(_2660).y) * _2459;
                _4668 = mix(_2586, vec3(textureLod(gBufferMap, In.mTexCoordsVec2 - (_2673 * 1.2000000476837158203125), 0.0).x, textureLod(gBufferMap, In.mTexCoordsVec2 - (_2673 * 1.2999999523162841796875), 0.0).y, textureLod(gBufferMap, In.mTexCoordsVec2 - (_2673 * 1.5), 0.0).z), vec3(_2638 * _2417));
            }
            else
            {
                _4668 = _2586;
            }
            _4667 = _4668;
        }
        else
        {
            _4667 = _2586;
        }
        _4666 = _4667;
    }
    else
    {
        _4666 = _2410;
    }
    vec4 _2715 = vec4(_4666, 1.0);
    vec3 _1457 = _2715.xyz;
    vec2 _3486 = (In.mTexCoordsVec2 * 2.0) - vec2(1.0);
    float _3488 = _3486.y;
    float _3490 = _3486.x;
    vec2 _4537 = _3486;
    _4537.y = fma(_3488, mix(1.0, 1.10000002384185791015625, sin(1.57079994678497314453125 * (_3490 + 1.0))), -0.02999999932944774627685546875);
    vec2 _3504 = (_4537 + vec2(1.0)) * 0.5;
    vec2 _4675;
    if (_1192.lUniforms.mpCustomPerMesh.gUIDeformVec4.x > 0.0)
    {
        vec2 _4541 = _3504;
        _4541.x = fma((fma(_1192.lUniforms.mpCustomPerMesh.gUIDeformVec4.y, 0.100000001490116119384765625, 2.0 * (max(sin(_1192.lUniforms.mpPerFrame.gfTime + sin(_1192.lUniforms.mpPerFrame.gfTime * 113.0)), 0.980000019073486328125) - 0.980000019073486328125)) * 0.0500000007450580596923828125) * sin((113.0 * _1192.lUniforms.mpPerFrame.gfTime) * sin(_3504.y * 827.0)), _1192.lUniforms.mpCustomPerMesh.gUIDeformVec4.x, _3504.x);
        _4675 = _4541;
    }
    else
    {
        _4675 = _3504;
    }
    vec3 _4693;
    if (_1209)
    {
        float _1543 = 1.0 - clamp(_4675.y * 4.5, 0.0, 1.0);
        vec3 _4694;
        if (_1543 > 0.0030000000260770320892333984375)
        {
            vec3 _1549 = _2715.xzy;
            vec2 _1561 = mix(_2715.xz, vec2(textureLod(gBufferMap, vec2(In.mTexCoordsVec2.x + 0.0023437500931322574615478515625, In.mTexCoordsVec2.y), 0.0).x, textureLod(gBufferMap, vec2(In.mTexCoordsVec2.x - 0.0023437500931322574615478515625, In.mTexCoordsVec2.y), 0.0).z), vec2(_1543));
            _1549.x = _1561.x;
            _1549.y = _1561.y;
            float _3552 = fma(((16.0 * In.mTexCoordsVec2.x) * _2378) * (1.0 - In.mTexCoordsVec2.x), In.mTexCoordsVec2.y, 0.85000002384185791015625);
            // Fixed: Clamp negative values to prevent artifacts from color multiplication
            _4694 = mix(_1549.xzy, (max(vec3(0.0), _1549.xzy) * ((vec3(0.949999988079071044921875, 1.0499999523162841796875, 0.949999988079071044921875) * fma(0.0500000007450580596923828125, sin(fma(10.0, _1192.lUniforms.mpPerFrame.gfTime, _4675.y * 1280.0)), 0.949999988079071044921875)) * fma(0.004999999888241291046142578125, sin(110.0 * _1192.lUniforms.mpPerFrame.gfTime), 0.99500000476837158203125))) * clamp(_3552 * _3552, 0.0, 1.0), vec3(_1543));
        }
        else
        {
            _4694 = _1457;
        }
        _4693 = _4694;
    }
    else
    {
        _4693 = _1457;
    }
    float _1598 = distance(_2379, vec2(0.5));
    vec3 _4697;
    if (_1228)
    {
        float _4691;
        if (_2378 >= 0.5)
        {
            _4691 = _1598;
        }
        else
        {
            _4691 = distance(In.mTexCoordsVec2.x, 0.5);
        }
        _4697 = _4693 * (1.0 - smoothstep(_1192.lUniforms.mpCustomPerMesh.gVignetteVec4.x, _1192.lUniforms.mpCustomPerMesh.gVignetteVec4.y, _4691));
    }
    else
    {
        _4697 = _4693;
    }
    float _1632 = clamp(_1192.lUniforms.mpCustomPerMesh.gVignetteVec4.z - 1.0, 0.0, 1.0);
    float _1635 = mix(clamp(1.0 - _1192.lUniforms.mpCustomPerMesh.gVignetteVec4.z, 0.0, 1.0), 0.0, _1632);
    vec3 _4711;
    if (_1635 < 1.0)
    {
        vec2 _4695;
        if (_1192.lUniforms.mpCustomPerMesh.gUINoiseDistortionParamsVec4.z > 0.0030000000260770320892333984375)
        {
            vec3 _1665 = vec3(In.mTexCoordsVec2 * _1192.lUniforms.mpCustomPerMesh.gUINoiseDistortionParamsVec4.x, _1192.lUniforms.mpPerFrame.gfTime * _1192.lUniforms.mpCustomPerMesh.gUINoiseDistortionParamsVec4.y);
            vec3 _3628 = floor(_1665 + vec3(dot(_1665, vec3(0.3333333432674407958984375))));
            vec3 _3637 = (_1665 - _3628) + vec3(dot(_3628, vec3(0.16666667163372039794921875)));
            vec3 _3641 = step(_3637.yzx, _3637);
            vec3 _3647 = (vec3(1.0) - _3641).zxy;
            vec3 _3648 = min(_3641, _3647);
            vec3 _3652 = max(_3641, _3647);
            vec3 _3658 = (_3637 - _3648) + vec3(0.16666667163372039794921875);
            vec3 _3664 = (_3637 - _3652) + vec3(0.3333333432674407958984375);
            vec3 _3668 = _3637 - vec3(0.5);
            vec3 _3902 = _3628 - (floor(_3628 * 0.00346020772121846675872802734375) * 289.0);
            vec4 _3679 = vec4(_3902.z) + vec4(0.0, _3648.z, _3652.z, 1.0);
            vec4 _3909 = (_3679 * 34.0) + vec4(1.0);
            vec4 _3690 = (fma(_3909, _3679, -(floor((_3909 * _3679) * 0.00346020772121846675872802734375) * 289.0)) + vec4(_3902.y)) + vec4(0.0, _3648.y, _3652.y, 1.0);
            vec4 _3927 = (_3690 * 34.0) + vec4(1.0);
            vec4 _3701 = (fma(_3927, _3690, -(floor((_3927 * _3690) * 0.00346020772121846675872802734375) * 289.0)) + vec4(_3902.x)) + vec4(0.0, _3648.x, _3652.x, 1.0);
            vec4 _3945 = (_3701 * 34.0) + vec4(1.0);
            vec4 _3956 = fma(_3945, _3701, -(floor((_3945 * _3701) * 0.00346020772121846675872802734375) * 289.0));
            vec4 _3720 = _3956 - (floor((_3956 * 0.14285714924335479736328125) * 0.14285714924335479736328125) * 49.0);
            vec4 _3725 = floor(_3720 * 0.14285714924335479736328125);
            vec4 _3737 = (_3725 * 0.2857142984867095947265625) + vec4(-0.928571403026580810546875);
            vec4 _3744 = (floor(_3720 - (_3725 * 7.0)) * 0.2857142984867095947265625) + vec4(-0.928571403026580810546875);
            vec4 _3751 = (vec4(1.0) - abs(_3737)) - abs(_3744);
            vec4 _3760 = vec4(_3737.xy, _3744.xy);
            vec4 _3769 = vec4(_3737.zw, _3744.zw);
            vec4 _3782 = -step(_3751, vec4(0.0));
            vec4 _3790 = fma(((floor(_3760) * 2.0) + vec4(1.0)).xzyw, _3782.xxyy, _3760.xzyw);
            vec4 _3798 = fma(((floor(_3769) * 2.0) + vec4(1.0)).xzyw, _3782.zzww, _3769.xzyw);
            vec3 _3805 = vec3(_3790.xy, _3751.x);
            vec3 _3812 = vec3(_3790.zw, _3751.y);
            vec3 _3819 = vec3(_3798.xy, _3751.z);
            vec3 _3826 = vec3(_3798.zw, _3751.w);
            vec4 _3962 = vec4(1.792842864990234375) - (vec4(dot(_3805, _3805), dot(_3812, _3812), dot(_3819, _3819), dot(_3826, _3826)) * 0.8537347316741943359375);
            vec4 _3873 = max(vec4(0.60000002384185791015625) - vec4(dot(_3637, _3637), dot(_3658, _3658), dot(_3664, _3664), dot(_3668, _3668)), vec4(0.0));
            vec4 _3876 = _3873 * _3873;
            vec2 _1685 = abs((_2379 * 2.0) - vec2(1.0));
            _4695 = In.mTexCoordsVec2 + ((((vec2(42.0 * dot(_3876 * _3876, vec4(dot(_3805 * _3962.x, _3637), dot(_3812 * _3962.y, _3658), dot(_3819 * _3962.z, _3664), dot(_3826 * _3962.w, _3668)))) * vec2(-_3488, _3490)) * _1192.lUniforms.mpCustomPerMesh.gUINoiseDistortionParamsVec4.z) * smoothstep(0.0, 0.0500000007450580596923828125, 1.0 - max(_1685.x, _1685.y))) * smoothstep(0.17499999701976776123046875, 0.2750000059604644775390625, _1598));
        }
        else
        {
            _4695 = In.mTexCoordsVec2;
        }
        vec4 _1716 = texture(gUIFullscreenNormal, _4695);
        vec2 _3968 = (_1716.xy * 1.9921875) - vec2(1.0);
        float _3970 = _3968.x;
        float _3972 = _3968.y;
        vec3 _3987 = vec3(_3970, _3972, sqrt(max(fma(-_3972, _3972, fma(-_3970, _3970, 1.0)), 0.0)));
        vec2 _1727 = _4695 + (_3987.xy * 0.0500000007450580596923828125);
        vec4 _1742 = textureLod(gUIFullscreenEffect, _4695 + (_3968 * 0.0500000007450580596923828125), 0.0);
        float _1746 = smoothstep(0.300000011920928955078125, 1.0, _1598 * 2.0);
        float _1755 = _1742.w;
        float _1781 = mix(clamp(mix((clamp(_1755 - _1635, 0.0, 1.0) * mix(_1746, 1.0, _1632)) * clamp(1.0 / (1.0 - _1635), 0.0, 1.0), 1.0, _1632) * step(_1635, _1755), 0.0, 1.0), 1.0, _1632);
        vec3 _4712;
        if (_1781 > 0.0030000000260770320892333984375)
        {
            // Original: float _4034 = intBitsToFloat(1597463174 - (floatBitsToInt(_4697.x) >> 1));
            // Original: float _4077 = intBitsToFloat(1597463174 - (floatBitsToInt(_4697.y) >> 1));
            // Original: float _4120 = intBitsToFloat(1597463174 - (floatBitsToInt(_4697.z) >> 1));
            // Fixed: Replace fast inverse sqrt with negative-safe version
            float _4034 = inversesqrt(max(_4697.x, 1e-6));
            float _4077 = inversesqrt(max(_4697.y, 1e-6));
            float _4120 = inversesqrt(max(_4697.z, 1e-6));
            vec4 _1797 = texture(gUIFullScreenRefraction, In.mTexCoordsVec2);
            vec3 _1829 = (vec3(_4697.x * (_4034 * fma(_4697.x * (-0.5), _4034 * _4034, 1.5)), _4697.y * (_4077 * fma(_4697.y * (-0.5), _4077 * _4077, 1.5)), _4697.z * (_4120 * fma(_4697.z * (-0.5), _4120 * _4120, 1.5))) * (1.0 - _1781)) + (vec3(_1797.y * pow(clamp(dot(reflect(vec3(0.0, 0.0, 1.0), _3987), normalize(vec3(_1192.lUniforms.mpPerFrame.gCameraNoHeadTrackingMat4[2].xy, -1.0))), 0.0, 1.0), 256.0)) * _1781);
            vec3 _4710;
            if (_1192.lUniforms.mpCustomPerMesh.gUINoiseDistortionParamsVec4.w > 0.0030000000260770320892333984375)
            {
                vec3 _1838 = _1829.xzy;
                float _4137 = _1727.x;
                float _4141 = _1727.y;
                vec2 _1853 = mix(_1829.xz, vec2(textureLod(gBufferMap, vec2(_4137 + 0.0023437500931322574615478515625, _4141), 0.0).x, textureLod(gBufferMap, vec2(_4137 - 0.0023437500931322574615478515625, _4141), 0.0).z), vec2(clamp(_1598 * 8.0, 0.0, 1.0) * _1781));
                _1838.x = _1853.x;
                _1838.y = _1853.y;
                _4710 = _1838.xzy;
            }
            else
            {
                _4710 = _1829;
            }
            vec4 _1863 = textureLod(gBufferMap, _1727, 0.0);
            // Original: vec3 _1896 = _4710 + (mix(vec3(intBitsToFloat(532487669 + (floatBitsToInt(_1863.x) >> 1)), intBitsToFloat(532487669 + (floatBitsToInt(_1863.y) >> 1)), intBitsToFloat(532487669 + (floatBitsToInt(_1863.z) >> 1))) * fma(-_1746, _1632, 1.0), _1742.xyz * ((vec3(intBitsToFloat(532487669 + (floatBitsToInt(_1192.lUniforms.mpCommonPerMesh.gLightColourVec4.x) >> 1)), intBitsToFloat(532487669 + (floatBitsToInt(_1192.lUniforms.mpCommonPerMesh.gLightColourVec4.y) >> 1)), intBitsToFloat(532487669 + (floatBitsToInt(_1192.lUniforms.mpCommonPerMesh.gLightColourVec4.z) >> 1))) * 0.5) + vec3(0.5)), vec3(_1797.x)) * _1781);
            // Fixed: Replace fast sqrt with negative-safe version
            vec3 _1896 = _4710 + (mix(vec3(sqrt(max(_1863.x, 0.0)), sqrt(max(_1863.y, 0.0)), sqrt(max(_1863.z, 0.0))) * fma(-_1746, _1632, 1.0), _1742.xyz * ((vec3(sqrt(max(_1192.lUniforms.mpCommonPerMesh.gLightColourVec4.x, 0.0)), sqrt(max(_1192.lUniforms.mpCommonPerMesh.gLightColourVec4.y, 0.0)), sqrt(max(_1192.lUniforms.mpCommonPerMesh.gLightColourVec4.z, 0.0))) * 0.5) + vec3(0.5)), vec3(_1797.x)) * _1781);
            // Fixed: Clamp before squaring to prevent negative artifacts
            _4712 = max(vec3(0.0), _1896) * max(vec3(0.0), _1896);
        }
        else
        {
            _4712 = _4697;
        }
        _4711 = _4712;
    }
    else
    {
        _4711 = _4697;
    }
    vec3 _4722;
    if (_1192.lUniforms.mpCustomPerMesh.gUILowHealthVignetteVec4.w > 0.0)
    {
        _4722 = mix(_4711, vec3(dot(_4711, vec3(0.2989999949932098388671875, 0.58700001239776611328125, 0.114000000059604644775390625))), vec3(_1192.lUniforms.mpCustomPerMesh.gUILowHealthVignetteVec4.w * smoothstep(0.300000011920928955078125, 1.0, _1598)));
    }
    else
    {
        _4722 = _4711;
    }
    float _1926 = abs(_1192.lUniforms.mpCustomPerMesh.gUILowHealthVignetteVec4.z);
    float _1932 = fma(-abs(_1926 - 0.5), 2.0, 1.0);
    vec3 _4723;
    if (_1932 > 0.0)
    {
        float _1941 = sign(_1192.lUniforms.mpCustomPerMesh.gUILowHealthVignetteVec4.z);
        float _4302 = _4675.y - fma(0.5, cos(mod(_1926 * 6.283199787139892578125, 6.280000209808349609375) * 0.5), 0.5);
        float _4779 = -clamp(pow(abs(_4675.x), 3.0) + pow(abs(1.0 - _4675.x), 3.0), 0.0, 1.0);
        _4723 = (_4722 + ((vec3(0.0, 0.800000011920928955078125, 1.0) * clamp(fma(_4779, 0.20000000298023223876953125, 1.0 / (_4302 * (_1941 * 25.0))), 0.0, 0.20000000298023223876953125)) * _1932)) + ((vec3(3.0) * clamp(fma(_4779, 0.20000000298023223876953125, 1.0 / (_4302 * (_1941 * 250.0))), 0.0, 0.20000000298023223876953125)) * _1932);
    }
    else
    {
        _4723 = _4722;
    }
    vec3 _1990 = mix(_4723, vec3(dot(_4723, vec3(0.2989999949932098388671875, 0.58700001239776611328125, 0.114000000059604644775390625))) * 0.800000011920928955078125, vec3(_1192.lUniforms.mpCustomPerMesh.gCriticalHitPointsVec4.y));
    vec3 _4727;
    if (_1192.lUniforms.mpCustomPerMesh.gCriticalHitPointsVec4.w > 0.0)
    {
        vec4 _1999 = textureLod(gUICamoEffect, In.mTexCoordsVec2, 0.0);
        vec4 _2004 = texture(gUICamoNormal, In.mTexCoordsVec2);
        float _4724;
        vec4 _4726;
        if (_1192.lUniforms.mpCustomPerMesh.gCriticalHitPointsVec4.w < 1.0)
        {
            float _2022 = clamp(fma(_1192.lUniforms.mpCustomPerMesh.gCriticalHitPointsVec4.w, 1.07000005245208740234375, _1999.w - 1.0) * 14.28571414947509765625, 0.0, 1.0);
            _4726 = vec4(0.20000000298023223876953125, 0.25, 1.0, _1999.x * _2022);
            _4724 = _2022;
        }
        else
        {
            _4726 = _1999;
            _4724 = 0.0;
        }
        _4727 = mix(mix(_1990, textureLod(gBufferMap, In.mTexCoordsVec2 + ((vec3((_2004.xy * 1.9921875) - vec2(1.0), _4789).xy * 0.0500000007450580596923828125) * _4724), 0.0).xyz, vec3(_1192.lUniforms.mpCustomPerMesh.gCriticalHitPointsVec4.w)), _4726.xyz, vec3(_4726.w));
    }
    else
    {
        _4727 = _1990;
    }
    vec3 _4728;
    if (_1192.lUniforms.mpCustomPerMesh.gCriticalHitPointsVec4.x > 0.0)
    {
        vec3 _4662 = _4727;
        _4662.x = mix(_4727.x, 0.800000011920928955078125, _1192.lUniforms.mpCustomPerMesh.gCriticalHitPointsVec4.x * 0.4000000059604644775390625);
        _4728 = _4662;
    }
    else
    {
        _4728 = _4727;
    }
    vec3 _4729;
    if (_1192.lUniforms.mpCustomPerMesh.gUILowHealthVignetteVec4.x > 0.0)
    {
        vec3 _4665 = _4728;
        _4665.x = fma(fma(_1192.lUniforms.mpCustomPerMesh.gVignetteVec4.y, 0.699999988079071044921875, 0.300000011920928955078125 * max(0.0, sin(_1192.lUniforms.mpPerFrame.gfTime * _1192.lUniforms.mpCustomPerMesh.gUILowHealthVignetteVec4.y))) * _1192.lUniforms.mpCustomPerMesh.gUILowHealthVignetteVec4.x, smoothstep(0.0500000007450580596923828125, 1.0, _1598), _4728.x);
        _4729 = _4665;
    }
    else
    {
        _4729 = _4728;
    }
    //_4729 = max(0, _4729);
    out_color0 = vec4(mix(_4729, _1192.lUniforms.mpCustomPerMesh.gFrontendFlashColourVec4.xyz, vec3(_1192.lUniforms.mpCustomPerMesh.gFrontendFlashColourVec4.w)), 1.0);

    //out_color0 = vec4(untonemapped, 1.0);
}



// #version 450

// struct PerFrameUniforms
// {
//     mat4 gViewProjectionMat4;
//     mat4 gCameraMat4;
//     mat4 gCameraNoHeadTrackingMat4;
//     mat4 gPrevViewProjectionMat4;
//     mat4 gInverseViewProjectionMat4;
//     mat4 gViewMat4;
//     mat4 gProjectionMat4;
//     mat4 gInverseProjectionMat4;
//     mat4 gThisToPrevViewProjectionMat4;
//     mat4 gInverseViewMat4;
//     mat4 gInverseProjectionSCMat4;
//     mat4 gInverseViewProjectionSCMat4;
//     mat4 gProjectionNoJitterMat4;
//     mat4 gViewProjectionNoJitterMat4;
//     mat4 gInverseViewProjectionNoJitterMat4;
//     mat4 gPrevViewProjectionNoJitterMat4;
//     mat4 gPrevInverseViewProjectionNoJitterMat4;
//     mat4 gPrevInverseViewProjectionSCMat4;
//     vec3 gPrevViewPositionVec3;
//     int giAntiAliasingIndex;
//     vec4 gMBlurSettingsVec4;
//     vec4 gTaaSettingsVec4;
//     vec4 gTessSettingsVec4;
//     vec4 gShellsSettingsVec4;
//     vec4 gFoVValuesVec4;
//     mat4 gInverseWorldUpMat4;
//     vec3 gViewPositionVec3;
//     vec3 gVREyeInfoVec3;
//     vec4 gClipPlanesVec4;
//     float gfTime;
//     float gfPrevTime;
//     int giDisableAmbientAllowed;
//     int giFrameIndex;
//     vec4 gDeJitterVec4;
//     vec4 gFrameBufferSizeVec4;
//     vec4 gShadowSizeVec4;
//     vec3 gShadowProjScaleVec3;
//     vec4 gShadowFadeParamVec4;
//     vec4 gHeroLightColourVec4;
//     vec4 gHeroLightPositionVec4;
//     vec4 gHeroLightDirectionVec4;
//     vec3 gRenderOffsetVec3;
// };

// struct CustomPerMeshUniforms
// {
//     vec4 gDoFParamsVec4;
//     vec4 gHDRParamsVec4;
//     vec4 gHBAOParamsVec4;
//     vec4 gThresholdParamsVec4;
//     vec4 gCustomParamsVec4;
//     vec4 gBlurParamsVec4;
//     vec4 gColourLUTParamsVec4;
//     vec4 gColourLUTStrengthsVec4;
//     vec4 gTextureSizeMipLevelVec4;
//     vec4 gUIColourVec4;
//     vec4 gUIDeformVec4;
//     vec4 gVignetteVec4;
//     vec4 gUILowHealthVignetteVec4;
//     vec4 gWashParamsVec4;
//     vec4 gCriticalHitPointsVec4;
//     vec4 gFrontendFlashColourVec4;
//     vec4 gUINoiseDistortionParamsVec4;
//     vec4 gHDRParams2Vec4;
// };

// struct CommonPerMeshUniforms
// {
//     mat4 gWorldMat4;
//     mat4 gWorldNormalMat4;
//     float fdFadeValueDummy;
//     uint guContextVariant;
//     int giLodIndex;
//     float gfLifetimeValue;
//     vec4 gPlanetPositionVec4;
//     vec4 gScanParamsPosVec4;
//     vec4 gScanParamsCfg1Vec4;
//     vec4 gScanParamsCfg2Vec4;
//     vec4 gScanParamsCfg3Vec4;
//     vec4 gScanColourVec4;
//     mat4 gaShadowMat4[3];
//     vec4 gLightColourVec4;
//     vec4 gLightCustomParamsVec4;
//     mat4 gWorldMotionMat4;
//     mat4 gInverseModelMat4Dummy;
//     vec4 gUserDataVec4;
//     vec4 gLightPositionVec4;
//     vec4 gLightDirectionVec4;
//     vec4 gLightOriginVec4;
// };

// struct UniformBuffer
// {
//     PerFrameUniforms mpPerFrame;
//     CustomPerMeshUniforms mpCustomPerMesh;
//     CommonPerMeshUniforms mpCommonPerMesh;
// };

// float _4792;

// layout(set = 0, binding = 0, std140) uniform lUniforms_BLK
// {
//     UniformBuffer lUniforms;
// } _1196;

// layout(set = 1, binding = 0) uniform sampler2D gBufferMap;
// layout(set = 1, binding = 2) uniform sampler2D gUIFullscreenNormal;
// layout(set = 1, binding = 1) uniform sampler2D gUIFullscreenEffect;
// layout(set = 1, binding = 5) uniform sampler2D gUIFullScreenRefraction;
// layout(set = 1, binding = 3) uniform sampler2D gUICamoEffect;
// layout(set = 1, binding = 4) uniform sampler2D gUICamoNormal;

// layout(location = 0) in VertexBlock
// {
//     vec2 mTexCoordsVec2;
// } In;

// layout(location = 0) out vec4 out_color0;

// void main()
// {
//     float _2381 = 1.0 - In.mTexCoordsVec2.y;
//     vec2 _2382 = vec2(In.mTexCoordsVec2.x, _2381);
//     bool _1205 = (_1196.lUniforms.mpCustomPerMesh.gUIDeformVec4.w > (-0.5)) ? true : false;
//     bool _1213;
//     if (_1205)
//     {
//         _1213 = _1196.lUniforms.mpPerFrame.gFoVValuesVec4.z == 1.0;
//     }
//     else
//     {
//         _1213 = _1205;
//     }
//     bool _1225;
//     if (!_1213)
//     {
//         _1225 = (_1196.lUniforms.mpCustomPerMesh.gUIDeformVec4.w < (-1.0)) ? true : false;
//     }
//     else
//     {
//         _1225 = _1213;
//     }
//     bool _1232;
//     if (_1225)
//     {
//         _1232 = _1196.lUniforms.mpPerFrame.gFoVValuesVec4.z != 2.0;
//     }
//     else
//     {
//         _1232 = _1225;
//     }
//     vec3 _2413 = textureLod(gBufferMap, In.mTexCoordsVec2, 0.0).xyz;
//     float _2420 = clamp(_1196.lUniforms.mpCustomPerMesh.gWashParamsVec4.y * 10.0, 0.0, 1.0);
//     float _2424 = In.mTexCoordsVec2.x * 12.0;
//     float _4750 = -In.mTexCoordsVec2.y;
//     float _2462 = 1.0 - pow(fma(-(clamp(_2424, 0.0, 1.0) - clamp(fma(In.mTexCoordsVec2.x - 1.0, 12.0, 1.0), 0.0, 1.0)), clamp(_2381 * 12.0, 0.0, 1.0) - clamp(fma(_4750, 12.0, 1.0), 0.0, 1.0), 1.0), 2.0);
//     vec3 _4669;
//     if (_1196.lUniforms.mpCustomPerMesh.gWashParamsVec4.y < 1.0)
//     {
//         float _4753 = -_1196.lUniforms.mpCustomPerMesh.gWashParamsVec4.x;
//         vec2 _4756 = vec2(fma(sin(fma(_1196.lUniforms.mpCustomPerMesh.gWashParamsVec4.x, 3.5, fma(In.mTexCoordsVec2.x, 18.0, In.mTexCoordsVec2.y * 16.0))), 0.25, fma(sin(fma(_4753, 1.5, fma(_4750, 4.0, In.mTexCoordsVec2.x))), 0.25, cos(fma(_1196.lUniforms.mpCustomPerMesh.gWashParamsVec4.x, 4.19999980926513671875, fma(In.mTexCoordsVec2.y, 8.0, In.mTexCoordsVec2.x * (-12.0)))) * 0.5)), _4792);
//         _4756.y = fma(sin(fma(_1196.lUniforms.mpCustomPerMesh.gWashParamsVec4.x, 4.5, fma(In.mTexCoordsVec2.x, 22.0, In.mTexCoordsVec2.y * (-24.0)))), 0.25, fma(sin(fma(In.mTexCoordsVec2.x, 9.0, _1196.lUniforms.mpCustomPerMesh.gWashParamsVec4.x * 2.5)), 0.25, cos(fma(_4753, 2.5, fma(In.mTexCoordsVec2.y, 6.0, _2424))) * 0.5));
//         vec2 _2557 = _4756 * _2462;
//         vec3 _2589 = mix(vec3(textureLod(gBufferMap, In.mTexCoordsVec2 - (_2557 * 0.00200000009499490261077880859375), 0.0).x, textureLod(gBufferMap, In.mTexCoordsVec2 - (_2557 * 0.0030000000260770320892333984375), 0.0).y, textureLod(gBufferMap, In.mTexCoordsVec2 - (_2557 * 0.0040000001899898052215576171875), 0.0).z), _2413, vec3(_2420));
//         vec3 _4670;
//         if ((_2462 > 0.0) && (_2420 > 0.0))
//         {
//             vec3 _2609 = vec3(fma(_2382, vec2(14.22222232818603515625, 2.88000011444091796875), vec2(0.0, _1196.lUniforms.mpCustomPerMesh.gWashParamsVec4.x * 1.2000000476837158203125)), fma(_1196.lUniforms.mpCustomPerMesh.gWashParamsVec4.x, 0.20000000298023223876953125, 1.0));
//             vec3 _2766 = floor(_2609 + vec3(dot(_2609, vec3(0.3333333432674407958984375))));
//             vec3 _2775 = (_2609 - _2766) + vec3(dot(_2766, vec3(0.16666667163372039794921875)));
//             vec3 _2779 = step(_2775.yzx, _2775);
//             vec3 _2785 = (vec3(1.0) - _2779).zxy;
//             vec3 _2786 = min(_2779, _2785);
//             vec3 _2790 = max(_2779, _2785);
//             vec3 _2796 = (_2775 - _2786) + vec3(0.16666667163372039794921875);
//             vec3 _2802 = (_2775 - _2790) + vec3(0.3333333432674407958984375);
//             vec3 _2806 = _2775 - vec3(0.5);
//             vec3 _3040 = _2766 - (floor(_2766 * 0.00346020772121846675872802734375) * 289.0);
//             vec4 _2817 = vec4(_3040.z) + vec4(0.0, _2786.z, _2790.z, 1.0);
//             vec4 _3047 = (_2817 * 34.0) + vec4(1.0);
//             vec4 _2828 = (fma(_3047, _2817, -(floor((_3047 * _2817) * 0.00346020772121846675872802734375) * 289.0)) + vec4(_3040.y)) + vec4(0.0, _2786.y, _2790.y, 1.0);
//             vec4 _3065 = (_2828 * 34.0) + vec4(1.0);
//             vec4 _2839 = (fma(_3065, _2828, -(floor((_3065 * _2828) * 0.00346020772121846675872802734375) * 289.0)) + vec4(_3040.x)) + vec4(0.0, _2786.x, _2790.x, 1.0);
//             vec4 _3083 = (_2839 * 34.0) + vec4(1.0);
//             vec4 _3094 = fma(_3083, _2839, -(floor((_3083 * _2839) * 0.00346020772121846675872802734375) * 289.0));
//             vec4 _2858 = _3094 - (floor((_3094 * 0.14285714924335479736328125) * 0.14285714924335479736328125) * 49.0);
//             vec4 _2863 = floor(_2858 * 0.14285714924335479736328125);
//             vec4 _2875 = (_2863 * 0.2857142984867095947265625) + vec4(-0.928571403026580810546875);
//             vec4 _2882 = (floor(_2858 - (_2863 * 7.0)) * 0.2857142984867095947265625) + vec4(-0.928571403026580810546875);
//             vec4 _2889 = (vec4(1.0) - abs(_2875)) - abs(_2882);
//             vec4 _2898 = vec4(_2875.xy, _2882.xy);
//             vec4 _2907 = vec4(_2875.zw, _2882.zw);
//             vec4 _2920 = -step(_2889, vec4(0.0));
//             vec4 _2928 = fma(((floor(_2898) * 2.0) + vec4(1.0)).xzyw, _2920.xxyy, _2898.xzyw);
//             vec4 _2936 = fma(((floor(_2907) * 2.0) + vec4(1.0)).xzyw, _2920.zzww, _2907.xzyw);
//             vec3 _2943 = vec3(_2928.xy, _2889.x);
//             vec3 _2950 = vec3(_2928.zw, _2889.y);
//             vec3 _2957 = vec3(_2936.xy, _2889.z);
//             vec3 _2964 = vec3(_2936.zw, _2889.w);
//             vec4 _3100 = vec4(1.792842864990234375) - (vec4(dot(_2943, _2943), dot(_2950, _2950), dot(_2957, _2957), dot(_2964, _2964)) * 0.8537347316741943359375);
//             vec4 _3011 = max(vec4(0.60000002384185791015625) - vec4(dot(_2775, _2775), dot(_2796, _2796), dot(_2802, _2802), dot(_2806, _2806)), vec4(0.0));
//             vec4 _3014 = _3011 * _3011;
//             vec3 _2627 = vec3(fma(_2382, vec2(1.06666672229766845703125, 0.4000000059604644775390625), vec2(0.0, _1196.lUniforms.mpCustomPerMesh.gWashParamsVec4.x * 0.5)), fma(_1196.lUniforms.mpCustomPerMesh.gWashParamsVec4.x, 0.300000011920928955078125, 3.0));
//             vec3 _3148 = floor(_2627 + vec3(dot(_2627, vec3(0.3333333432674407958984375))));
//             vec3 _3157 = (_2627 - _3148) + vec3(dot(_3148, vec3(0.16666667163372039794921875)));
//             vec3 _3161 = step(_3157.yzx, _3157);
//             vec3 _3167 = (vec3(1.0) - _3161).zxy;
//             vec3 _3168 = min(_3161, _3167);
//             vec3 _3172 = max(_3161, _3167);
//             vec3 _3178 = (_3157 - _3168) + vec3(0.16666667163372039794921875);
//             vec3 _3184 = (_3157 - _3172) + vec3(0.3333333432674407958984375);
//             vec3 _3188 = _3157 - vec3(0.5);
//             vec3 _3422 = _3148 - (floor(_3148 * 0.00346020772121846675872802734375) * 289.0);
//             vec4 _3199 = vec4(_3422.z) + vec4(0.0, _3168.z, _3172.z, 1.0);
//             vec4 _3429 = (_3199 * 34.0) + vec4(1.0);
//             vec4 _3210 = (fma(_3429, _3199, -(floor((_3429 * _3199) * 0.00346020772121846675872802734375) * 289.0)) + vec4(_3422.y)) + vec4(0.0, _3168.y, _3172.y, 1.0);
//             vec4 _3447 = (_3210 * 34.0) + vec4(1.0);
//             vec4 _3221 = (fma(_3447, _3210, -(floor((_3447 * _3210) * 0.00346020772121846675872802734375) * 289.0)) + vec4(_3422.x)) + vec4(0.0, _3168.x, _3172.x, 1.0);
//             vec4 _3465 = (_3221 * 34.0) + vec4(1.0);
//             vec4 _3476 = fma(_3465, _3221, -(floor((_3465 * _3221) * 0.00346020772121846675872802734375) * 289.0));
//             vec4 _3240 = _3476 - (floor((_3476 * 0.14285714924335479736328125) * 0.14285714924335479736328125) * 49.0);
//             vec4 _3245 = floor(_3240 * 0.14285714924335479736328125);
//             vec4 _3257 = (_3245 * 0.2857142984867095947265625) + vec4(-0.928571403026580810546875);
//             vec4 _3264 = (floor(_3240 - (_3245 * 7.0)) * 0.2857142984867095947265625) + vec4(-0.928571403026580810546875);
//             vec4 _3271 = (vec4(1.0) - abs(_3257)) - abs(_3264);
//             vec4 _3280 = vec4(_3257.xy, _3264.xy);
//             vec4 _3289 = vec4(_3257.zw, _3264.zw);
//             vec4 _3302 = -step(_3271, vec4(0.0));
//             vec4 _3310 = fma(((floor(_3280) * 2.0) + vec4(1.0)).xzyw, _3302.xxyy, _3280.xzyw);
//             vec4 _3318 = fma(((floor(_3289) * 2.0) + vec4(1.0)).xzyw, _3302.zzww, _3289.xzyw);
//             vec3 _3325 = vec3(_3310.xy, _3271.x);
//             vec3 _3332 = vec3(_3310.zw, _3271.y);
//             vec3 _3339 = vec3(_3318.xy, _3271.z);
//             vec3 _3346 = vec3(_3318.zw, _3271.w);
//             vec4 _3482 = vec4(1.792842864990234375) - (vec4(dot(_3325, _3325), dot(_3332, _3332), dot(_3339, _3339), dot(_3346, _3346)) * 0.8537347316741943359375);
//             vec4 _3393 = max(vec4(0.60000002384185791015625) - vec4(dot(_3157, _3157), dot(_3178, _3178), dot(_3184, _3184), dot(_3188, _3188)), vec4(0.0));
//             vec4 _3396 = _3393 * _3393;
//             float _2638 = fma(fma(dot(_3014 * _3014, vec4(dot(_2943 * _3100.x, _2775), dot(_2950 * _3100.y, _2796), dot(_2957 * _3100.z, _2802), dot(_2964 * _3100.w, _2806))), 10.5, dot(_3396 * _3396, vec4(dot(_3325 * _3482.x, _3157), dot(_3332 * _3482.y, _3178), dot(_3339 * _3482.z, _3184), dot(_3346 * _3482.w, _3188))) * 31.5), 0.5, 0.5);
//             float _2641 = clamp(smoothstep(0.0199999995529651641845703125 + _1196.lUniforms.mpCustomPerMesh.gWashParamsVec4.y, 0.02999999932944774627685546875 + _1196.lUniforms.mpCustomPerMesh.gWashParamsVec4.y, _2638), 0.0, 1.0);
//             vec3 _4671;
//             if (_2641 > 0.0)
//             {
//                 vec2 _2663 = _2382 + vec2(pow(clamp(clamp(smoothstep(_1196.lUniforms.mpCustomPerMesh.gWashParamsVec4.y, 0.5 + _1196.lUniforms.mpCustomPerMesh.gWashParamsVec4.y, _2638), 0.0, 1.0), 0.0, 1.0), 0.100000001490116119384765625) * 3.0);
//                 vec2 _2676 = vec2(dFdx(_2663).x, dFdy(_2663).y) * _2462;
//                 _4671 = mix(_2589, vec3(textureLod(gBufferMap, In.mTexCoordsVec2 - (_2676 * 1.2000000476837158203125), 0.0).x, textureLod(gBufferMap, In.mTexCoordsVec2 - (_2676 * 1.2999999523162841796875), 0.0).y, textureLod(gBufferMap, In.mTexCoordsVec2 - (_2676 * 1.5), 0.0).z), vec3(_2641 * _2420));
//             }
//             else
//             {
//                 _4671 = _2589;
//             }
//             _4670 = _4671;
//         }
//         else
//         {
//             _4670 = _2589;
//         }
//         _4669 = _4670;
//     }
//     else
//     {
//         _4669 = _2413;
//     }
//     vec4 _2718 = vec4(_4669, 1.0);
//     vec3 _1460 = _2718.xyz;
//     vec2 _3489 = (In.mTexCoordsVec2 * 2.0) - vec2(1.0);
//     float _3491 = _3489.y;
//     float _3493 = _3489.x;
//     vec2 _4540 = _3489;
//     _4540.y = fma(_3491, mix(1.0, 1.10000002384185791015625, sin(1.57079994678497314453125 * (_3493 + 1.0))), -0.02999999932944774627685546875);
//     vec2 _3507 = (_4540 + vec2(1.0)) * 0.5;
//     vec2 _4678;
//     if (_1196.lUniforms.mpCustomPerMesh.gUIDeformVec4.x > 0.0)
//     {
//         vec2 _4544 = _3507;
//         _4544.x = fma((fma(_1196.lUniforms.mpCustomPerMesh.gUIDeformVec4.y, 0.100000001490116119384765625, 2.0 * (max(sin(_1196.lUniforms.mpPerFrame.gfTime + sin(_1196.lUniforms.mpPerFrame.gfTime * 113.0)), 0.980000019073486328125) - 0.980000019073486328125)) * 0.0500000007450580596923828125) * sin((113.0 * _1196.lUniforms.mpPerFrame.gfTime) * sin(_3507.y * 827.0)), _1196.lUniforms.mpCustomPerMesh.gUIDeformVec4.x, _3507.x);
//         _4678 = _4544;
//     }
//     else
//     {
//         _4678 = _3507;
//     }
//     vec3 _4696;
//     if (_1213)
//     {
//         float _1546 = 1.0 - clamp(_4678.y * 4.5, 0.0, 1.0);
//         vec3 _4697;
//         if (_1546 > 0.0030000000260770320892333984375)
//         {
//             vec3 _1552 = _2718.xzy;
//             vec2 _1564 = mix(_2718.xz, vec2(textureLod(gBufferMap, vec2(In.mTexCoordsVec2.x + 0.0023437500931322574615478515625, In.mTexCoordsVec2.y), 0.0).x, textureLod(gBufferMap, vec2(In.mTexCoordsVec2.x - 0.0023437500931322574615478515625, In.mTexCoordsVec2.y), 0.0).z), vec2(_1546));
//             _1552.x = _1564.x;
//             _1552.y = _1564.y;
//             float _3555 = fma(((16.0 * In.mTexCoordsVec2.x) * _2381) * (1.0 - In.mTexCoordsVec2.x), In.mTexCoordsVec2.y, 0.85000002384185791015625);
//             _4697 = mix(_1552.xzy, (_1552.xzy * ((vec3(0.949999988079071044921875, 1.0499999523162841796875, 0.949999988079071044921875) * fma(0.0500000007450580596923828125, sin(fma(10.0, _1196.lUniforms.mpPerFrame.gfTime, _4678.y * 1280.0)), 0.949999988079071044921875)) * fma(0.004999999888241291046142578125, sin(110.0 * _1196.lUniforms.mpPerFrame.gfTime), 0.99500000476837158203125))) * clamp(_3555 * _3555, 0.0, 1.0), vec3(_1546));
//         }
//         else
//         {
//             _4697 = _1460;
//         }
//         _4696 = _4697;
//     }
//     else
//     {
//         _4696 = _1460;
//     }
//     float _1601 = distance(_2382, vec2(0.5));
//     vec3 _4700;
//     if (_1232)
//     {
//         float _4694;
//         if (_2381 >= 0.5)
//         {
//             _4694 = _1601;
//         }
//         else
//         {
//             _4694 = distance(In.mTexCoordsVec2.x, 0.5);
//         }
//         _4700 = _4696 * (1.0 - smoothstep(_1196.lUniforms.mpCustomPerMesh.gVignetteVec4.x, _1196.lUniforms.mpCustomPerMesh.gVignetteVec4.y, _4694));
//     }
//     else
//     {
//         _4700 = _4696;
//     }
//     float _1635 = clamp(_1196.lUniforms.mpCustomPerMesh.gVignetteVec4.z - 1.0, 0.0, 1.0);
//     float _1638 = mix(clamp(1.0 - _1196.lUniforms.mpCustomPerMesh.gVignetteVec4.z, 0.0, 1.0), 0.0, _1635);
//     vec3 _4714;
//     if (_1638 < 1.0)
//     {
//         vec2 _4698;
//         if (_1196.lUniforms.mpCustomPerMesh.gUINoiseDistortionParamsVec4.z > 0.0030000000260770320892333984375)
//         {
//             vec3 _1668 = vec3(In.mTexCoordsVec2 * _1196.lUniforms.mpCustomPerMesh.gUINoiseDistortionParamsVec4.x, _1196.lUniforms.mpPerFrame.gfTime * _1196.lUniforms.mpCustomPerMesh.gUINoiseDistortionParamsVec4.y);
//             vec3 _3631 = floor(_1668 + vec3(dot(_1668, vec3(0.3333333432674407958984375))));
//             vec3 _3640 = (_1668 - _3631) + vec3(dot(_3631, vec3(0.16666667163372039794921875)));
//             vec3 _3644 = step(_3640.yzx, _3640);
//             vec3 _3650 = (vec3(1.0) - _3644).zxy;
//             vec3 _3651 = min(_3644, _3650);
//             vec3 _3655 = max(_3644, _3650);
//             vec3 _3661 = (_3640 - _3651) + vec3(0.16666667163372039794921875);
//             vec3 _3667 = (_3640 - _3655) + vec3(0.3333333432674407958984375);
//             vec3 _3671 = _3640 - vec3(0.5);
//             vec3 _3905 = _3631 - (floor(_3631 * 0.00346020772121846675872802734375) * 289.0);
//             vec4 _3682 = vec4(_3905.z) + vec4(0.0, _3651.z, _3655.z, 1.0);
//             vec4 _3912 = (_3682 * 34.0) + vec4(1.0);
//             vec4 _3693 = (fma(_3912, _3682, -(floor((_3912 * _3682) * 0.00346020772121846675872802734375) * 289.0)) + vec4(_3905.y)) + vec4(0.0, _3651.y, _3655.y, 1.0);
//             vec4 _3930 = (_3693 * 34.0) + vec4(1.0);
//             vec4 _3704 = (fma(_3930, _3693, -(floor((_3930 * _3693) * 0.00346020772121846675872802734375) * 289.0)) + vec4(_3905.x)) + vec4(0.0, _3651.x, _3655.x, 1.0);
//             vec4 _3948 = (_3704 * 34.0) + vec4(1.0);
//             vec4 _3959 = fma(_3948, _3704, -(floor((_3948 * _3704) * 0.00346020772121846675872802734375) * 289.0));
//             vec4 _3723 = _3959 - (floor((_3959 * 0.14285714924335479736328125) * 0.14285714924335479736328125) * 49.0);
//             vec4 _3728 = floor(_3723 * 0.14285714924335479736328125);
//             vec4 _3740 = (_3728 * 0.2857142984867095947265625) + vec4(-0.928571403026580810546875);
//             vec4 _3747 = (floor(_3723 - (_3728 * 7.0)) * 0.2857142984867095947265625) + vec4(-0.928571403026580810546875);
//             vec4 _3754 = (vec4(1.0) - abs(_3740)) - abs(_3747);
//             vec4 _3763 = vec4(_3740.xy, _3747.xy);
//             vec4 _3772 = vec4(_3740.zw, _3747.zw);
//             vec4 _3785 = -step(_3754, vec4(0.0));
//             vec4 _3793 = fma(((floor(_3763) * 2.0) + vec4(1.0)).xzyw, _3785.xxyy, _3763.xzyw);
//             vec4 _3801 = fma(((floor(_3772) * 2.0) + vec4(1.0)).xzyw, _3785.zzww, _3772.xzyw);
//             vec3 _3808 = vec3(_3793.xy, _3754.x);
//             vec3 _3815 = vec3(_3793.zw, _3754.y);
//             vec3 _3822 = vec3(_3801.xy, _3754.z);
//             vec3 _3829 = vec3(_3801.zw, _3754.w);
//             vec4 _3965 = vec4(1.792842864990234375) - (vec4(dot(_3808, _3808), dot(_3815, _3815), dot(_3822, _3822), dot(_3829, _3829)) * 0.8537347316741943359375);
//             vec4 _3876 = max(vec4(0.60000002384185791015625) - vec4(dot(_3640, _3640), dot(_3661, _3661), dot(_3667, _3667), dot(_3671, _3671)), vec4(0.0));
//             vec4 _3879 = _3876 * _3876;
//             vec2 _1688 = abs((_2382 * 2.0) - vec2(1.0));
//             _4698 = In.mTexCoordsVec2 + ((((vec2(42.0 * dot(_3879 * _3879, vec4(dot(_3808 * _3965.x, _3640), dot(_3815 * _3965.y, _3661), dot(_3822 * _3965.z, _3667), dot(_3829 * _3965.w, _3671)))) * vec2(-_3491, _3493)) * _1196.lUniforms.mpCustomPerMesh.gUINoiseDistortionParamsVec4.z) * smoothstep(0.0, 0.0500000007450580596923828125, 1.0 - max(_1688.x, _1688.y))) * smoothstep(0.17499999701976776123046875, 0.2750000059604644775390625, _1601));
//         }
//         else
//         {
//             _4698 = In.mTexCoordsVec2;
//         }
//         vec4 _1719 = texture(gUIFullscreenNormal, _4698);
//         vec2 _3971 = (_1719.xy * 1.9921875) - vec2(1.0);
//         float _3973 = _3971.x;
//         float _3975 = _3971.y;
//         vec3 _3990 = vec3(_3973, _3975, sqrt(max(fma(-_3975, _3975, fma(-_3973, _3973, 1.0)), 0.0)));
//         vec2 _1730 = _4698 + (_3990.xy * 0.0500000007450580596923828125);
//         vec4 _1745 = textureLod(gUIFullscreenEffect, _4698 + (_3971 * 0.0500000007450580596923828125), 0.0);
//         float _1749 = smoothstep(0.300000011920928955078125, 1.0, _1601 * 2.0);
//         float _1758 = _1745.w;
//         float _1784 = mix(clamp(mix((clamp(_1758 - _1638, 0.0, 1.0) * mix(_1749, 1.0, _1635)) * clamp(1.0 / (1.0 - _1638), 0.0, 1.0), 1.0, _1635) * step(_1638, _1758), 0.0, 1.0), 1.0, _1635);
//         vec3 _4715;
//         if (_1784 > 0.0030000000260770320892333984375)
//         {
//             float _4037 = intBitsToFloat(1597463174 - (floatBitsToInt(_4700.x) >> 1));
//             float _4080 = intBitsToFloat(1597463174 - (floatBitsToInt(_4700.y) >> 1));
//             float _4123 = intBitsToFloat(1597463174 - (floatBitsToInt(_4700.z) >> 1));
//             vec4 _1800 = texture(gUIFullScreenRefraction, In.mTexCoordsVec2);
//             vec3 _1832 = (vec3(_4700.x * (_4037 * fma(_4700.x * (-0.5), _4037 * _4037, 1.5)), _4700.y * (_4080 * fma(_4700.y * (-0.5), _4080 * _4080, 1.5)), _4700.z * (_4123 * fma(_4700.z * (-0.5), _4123 * _4123, 1.5))) * (1.0 - _1784)) + (vec3(_1800.y * pow(clamp(dot(reflect(vec3(0.0, 0.0, 1.0), _3990), normalize(vec3(_1196.lUniforms.mpPerFrame.gCameraNoHeadTrackingMat4[2].xy, -1.0))), 0.0, 1.0), 256.0)) * _1784);
//             vec3 _4713;
//             if (_1196.lUniforms.mpCustomPerMesh.gUINoiseDistortionParamsVec4.w > 0.0030000000260770320892333984375)
//             {
//                 vec3 _1841 = _1832.xzy;
//                 float _4140 = _1730.x;
//                 float _4144 = _1730.y;
//                 vec2 _1856 = mix(_1832.xz, vec2(textureLod(gBufferMap, vec2(_4140 + 0.0023437500931322574615478515625, _4144), 0.0).x, textureLod(gBufferMap, vec2(_4140 - 0.0023437500931322574615478515625, _4144), 0.0).z), vec2(clamp(_1601 * 8.0, 0.0, 1.0) * _1784));
//                 _1841.x = _1856.x;
//                 _1841.y = _1856.y;
//                 _4713 = _1841.xzy;
//             }
//             else
//             {
//                 _4713 = _1832;
//             }
//             vec4 _1866 = textureLod(gBufferMap, _1730, 0.0);
//             vec3 _1899 = _4713 + (mix(vec3(intBitsToFloat(532487669 + (floatBitsToInt(_1866.x) >> 1)), intBitsToFloat(532487669 + (floatBitsToInt(_1866.y) >> 1)), intBitsToFloat(532487669 + (floatBitsToInt(_1866.z) >> 1))) * fma(-_1749, _1635, 1.0), _1745.xyz * ((vec3(intBitsToFloat(532487669 + (floatBitsToInt(_1196.lUniforms.mpCommonPerMesh.gLightColourVec4.x) >> 1)), intBitsToFloat(532487669 + (floatBitsToInt(_1196.lUniforms.mpCommonPerMesh.gLightColourVec4.y) >> 1)), intBitsToFloat(532487669 + (floatBitsToInt(_1196.lUniforms.mpCommonPerMesh.gLightColourVec4.z) >> 1))) * 0.5) + vec3(0.5)), vec3(_1800.x)) * _1784);
//             _4715 = _1899 * _1899;
//         }
//         else
//         {
//             _4715 = _4700;
//         }
//         _4714 = _4715;
//     }
//     else
//     {
//         _4714 = _4700;
//     }
//     vec3 _4725;
//     if (_1196.lUniforms.mpCustomPerMesh.gUILowHealthVignetteVec4.w > 0.0)
//     {
//         _4725 = mix(_4714, vec3(dot(_4714, vec3(0.2989999949932098388671875, 0.58700001239776611328125, 0.114000000059604644775390625))), vec3(_1196.lUniforms.mpCustomPerMesh.gUILowHealthVignetteVec4.w * smoothstep(0.300000011920928955078125, 1.0, _1601)));
//     }
//     else
//     {
//         _4725 = _4714;
//     }
//     float _1929 = abs(_1196.lUniforms.mpCustomPerMesh.gUILowHealthVignetteVec4.z);
//     float _1935 = fma(-abs(_1929 - 0.5), 2.0, 1.0);
//     vec3 _4726;
//     if (_1935 > 0.0)
//     {
//         float _1944 = sign(_1196.lUniforms.mpCustomPerMesh.gUILowHealthVignetteVec4.z);
//         float _4305 = _4678.y - fma(0.5, cos(mod(_1929 * 6.283199787139892578125, 6.280000209808349609375) * 0.5), 0.5);
//         float _4782 = -clamp(pow(abs(_4678.x), 3.0) + pow(abs(1.0 - _4678.x), 3.0), 0.0, 1.0);
//         _4726 = (_4725 + ((vec3(0.0, 0.800000011920928955078125, 1.0) * clamp(fma(_4782, 0.20000000298023223876953125, 1.0 / (_4305 * (_1944 * 25.0))), 0.0, 0.20000000298023223876953125)) * _1935)) + ((vec3(3.0) * clamp(fma(_4782, 0.20000000298023223876953125, 1.0 / (_4305 * (_1944 * 250.0))), 0.0, 0.20000000298023223876953125)) * _1935);
//     }
//     else
//     {
//         _4726 = _4725;
//     }
//     vec3 _1993 = mix(_4726, vec3(dot(_4726, vec3(0.2989999949932098388671875, 0.58700001239776611328125, 0.114000000059604644775390625))) * 0.800000011920928955078125, vec3(_1196.lUniforms.mpCustomPerMesh.gCriticalHitPointsVec4.y));
//     vec3 _4730;
//     if (_1196.lUniforms.mpCustomPerMesh.gCriticalHitPointsVec4.w > 0.0)
//     {
//         vec4 _2002 = textureLod(gUICamoEffect, In.mTexCoordsVec2, 0.0);
//         vec4 _2007 = texture(gUICamoNormal, In.mTexCoordsVec2);
//         float _4727;
//         vec4 _4729;
//         if (_1196.lUniforms.mpCustomPerMesh.gCriticalHitPointsVec4.w < 1.0)
//         {
//             float _2025 = clamp(fma(_1196.lUniforms.mpCustomPerMesh.gCriticalHitPointsVec4.w, 1.07000005245208740234375, _2002.w - 1.0) * 14.28571414947509765625, 0.0, 1.0);
//             _4729 = vec4(0.20000000298023223876953125, 0.25, 1.0, _2002.x * _2025);
//             _4727 = _2025;
//         }
//         else
//         {
//             _4729 = _2002;
//             _4727 = 0.0;
//         }
//         _4730 = mix(mix(_1993, textureLod(gBufferMap, In.mTexCoordsVec2 + ((vec3((_2007.xy * 1.9921875) - vec2(1.0), _4792).xy * 0.0500000007450580596923828125) * _4727), 0.0).xyz, vec3(_1196.lUniforms.mpCustomPerMesh.gCriticalHitPointsVec4.w)), _4729.xyz, vec3(_4729.w));
//     }
//     else
//     {
//         _4730 = _1993;
//     }
//     vec3 _4731;
//     if (_1196.lUniforms.mpCustomPerMesh.gCriticalHitPointsVec4.x > 0.0)
//     {
//         vec3 _4665 = _4730;
//         _4665.x = mix(_4730.x, 0.800000011920928955078125, _1196.lUniforms.mpCustomPerMesh.gCriticalHitPointsVec4.x * 0.4000000059604644775390625);
//         _4731 = _4665;
//     }
//     else
//     {
//         _4731 = _4730;
//     }
//     vec3 _4732;
//     if (_1196.lUniforms.mpCustomPerMesh.gUILowHealthVignetteVec4.x > 0.0)
//     {
//         vec3 _4668 = _4731;
//         _4668.x = fma(fma(_1196.lUniforms.mpCustomPerMesh.gVignetteVec4.y, 0.699999988079071044921875, 0.300000011920928955078125 * max(0.0, sin(_1196.lUniforms.mpPerFrame.gfTime * _1196.lUniforms.mpCustomPerMesh.gUILowHealthVignetteVec4.y))) * _1196.lUniforms.mpCustomPerMesh.gUILowHealthVignetteVec4.x, smoothstep(0.0500000007450580596923828125, 1.0, _1601), _4731.x);
//         _4732 = _4668;
//     }
//     else
//     {
//         _4732 = _4731;
//     }
//     out_color0 = vec4(mix(_4732, _1196.lUniforms.mpCustomPerMesh.gFrontendFlashColourVec4.xyz, vec3(_1196.lUniforms.mpCustomPerMesh.gFrontendFlashColourVec4.w)), 1.0);
// }

