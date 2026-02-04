#include "./tonemapping.hlsl"

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
} _781;

layout(set = 1, binding = 6) uniform sampler3D gColourLUTBase;
layout(set = 1, binding = 7) uniform sampler3D gColourLUTFar;
layout(set = 1, binding = 8) uniform sampler3D gColourLUTStorm;
layout(set = 1, binding = 9) uniform sampler3D gColourLUTEffect;
layout(set = 1, binding = 0) uniform sampler2D gBufferMap;
layout(set = 1, binding = 1) uniform sampler2D gBuffer1Map;
layout(set = 1, binding = 2) uniform sampler2D gBuffer2Map;
layout(set = 1, binding = 3) uniform sampler2D gBuffer3Map;
layout(set = 1, binding = 4) uniform sampler2D gBuffer4Map;
layout(set = 1, binding = 5) uniform sampler2D gBuffer5Map;

layout(location = 0) in VertexBlock
{
    vec2 mTexCoordsVec2;
} In;

layout(location = 0) out vec4 out_color0;

void main()
{
  vec3 _745 = textureLod(gBufferMap, In.mTexCoordsVec2, 0.0).xyz;

  float3 test = _745;

    vec4 _762 = textureLod(gBuffer3Map, In.mTexCoordsVec2, 0.0);
    float _763 = _762.x;
    vec4 _1293 = texture(gBuffer5Map, vec2(0.25));
    vec4 _1296 = texture(gBuffer5Map, vec2(0.75, 0.25));
    vec4 _1301 = texture(gBuffer5Map, vec2(0.25, 0.75));
    vec4 _1306 = texture(gBuffer5Map, vec2(0.75));
    vec3 _2049;
    if (_781.lUniforms.mpPerFrame.gFoVValuesVec4.z != 2.0)
    {
        vec3 _2050;
        if (_763 >= 1.0)
        {
            vec2 _1335 = In.mTexCoordsVec2 + vec2(fract(_781.lUniforms.mpPerFrame.gfTime));
            vec2 _1345 = fma(floor(fma(vec2(fract(sin(dot(_1335, vec2(12.98980045318603515625, 78.233001708984375))) * 43758.546875), fract(cos(mod(123456792.0, fma(256.0, dot(vec2(23.1406917572021484375, 2.6651442050933837890625), _1335), 1.0000000116860974230803549289703e-07))))), vec2(31.0), vec2(-15.0))), _781.lUniforms.mpPerFrame.gFrameBufferSizeVec4.zw, In.mTexCoordsVec2);
            vec3 _2051;
            if (textureLod(gBuffer3Map, _1345, 0.0).x >= 1.0)
            {
                vec3 _1356 = textureLod(gBufferMap, _1345, 0.0).xyz;
                vec3 _1360 = abs(_745 - _1356);
                _2051 = mix(_745, _1356, bvec3(((_1360.x + _1360.y) + _1360.z) < 0.02745098061859607696533203125));
            }
            else
            {
                _2051 = _745;
            }
            _2050 = _2051;
        }
        else
        {
            _2050 = _745;
        }
        _2049 = _2050;
    }
    else
    {
        _2049 = _745;
    }

    //_2049 = lerp(_745, _2049, CUSTOM_COLOR_GRADING); // color grading sometimes?

    // vec3 _1414 = max(vec3(0.0), ((_2049 + textureLod(gBuffer2Map, In.mTexCoordsVec2, 0.0).xyz) + (textureLod(gBuffer1Map, In.mTexCoordsVec2, 0.0).xyz * (((_1293.x + _1296.x) + _1301.x) + _1306.x))) * mat3(vec3(1.298702239990234375, -0.227224647998809814453125, -0.07163621485233306884765625), vec3(-0.0445976443588733673095703125, 1.05283248424530029296875, -0.0082119889557361602783203125), vec3(-0.0208283849060535430908203125, -0.079466454684734344482421875, 1.10053479671478271484375)));
    vec3 _1414 = ((_2049 + textureLod(gBuffer2Map, In.mTexCoordsVec2, 0.0).xyz) + (textureLod(gBuffer1Map, In.mTexCoordsVec2, 0.0).xyz * (((_1293.x + _1296.x) + _1301.x) + _1306.x))) * mat3(vec3(1.298702239990234375, -0.227224647998809814453125, -0.07163621485233306884765625), vec3(-0.0445976443588733673095703125, 1.05283248424530029296875, -0.0082119889557361602783203125), vec3(-0.0208283849060535430908203125, -0.079466454684734344482421875, 1.10053479671478271484375));

    float3 untonemapped_ap1 = _1414;
    float3 untonemapped_bt709 = renodx::color::bt709::from::AP1(untonemapped_ap1);

    vec3 _1440;
    vec3 sdr_color_bt709;
    float _1427;
    if (RENODX_TONE_MAP_TYPE < 2) {
      _1414 = max(0, _1414);
      float _1423 = max(9.9999999747524270787835121154785e-07, max(_1414.x, max(_1414.y, _1414.z)));
      float _2052;
      if (abs(1.0 - _1423) < 0.125)
      {
          _2052 = fma(_1423, fma(-_1423, 8.0, 18.0), -6.125) * 0.25;
      }
      else
      {
          _2052 = clamp(_1423, 0.0, 1.0);
      }
      _1427 = _2052 / _1423;
      vec3 _1430 = _1414 * _1427;
      vec3 _1498 = _1430 * 0.2199999988079071044921875;
      vec3 _1433 = ((fma(_1430, _1498 + vec3(0.0300000011920928955078125), vec3(0.00200000009499490261077880859375)) / fma(_1430, _1498 + vec3(0.300000011920928955078125), vec3(0.060000002384185791015625))) - vec3(0.0333333313465118408203125)) * 2.4928367137908935546875;
      _1440 = vec3(pow(_1433.x, 0.4545454680919647216796875), pow(_1433.y, 0.4545454680919647216796875), pow(_1433.z, 0.4545454680919647216796875));
    }
    else {
      vec3 sdr_color_ap1 = CustomGradingSDRTonemap(untonemapped_ap1);
      sdr_color_bt709 = renodx::color::bt709::from::AP1(sdr_color_ap1);
      _1440 = renodx::color::gamma::EncodeSafe(sdr_color_ap1);
    }



    float _1702 = _763 * _781.lUniforms.mpPerFrame.gClipPlanesVec4.y;
    float _1571 = clamp(_781.lUniforms.mpCustomPerMesh.gColourLUTParamsVec4.x * _1702, 0.0, 1.0);
    float _1576 = clamp(_781.lUniforms.mpCustomPerMesh.gColourLUTParamsVec4.y * _1702, 0.0, 1.0);
    float _1581 = clamp(_781.lUniforms.mpCustomPerMesh.gColourLUTParamsVec4.z * _1702, 0.0, 1.0);
    float _1583 = 1.0 - textureLod(gBuffer4Map, In.mTexCoordsVec2, 0.0).x;
    float _1584 = _1581 * _1583;
    vec3 _2059;
    if (_1571 > 0.0030000000260770320892333984375)
    {
        _2059 = vec3(textureLod(gColourLUTFar, _1440, 0.0).xyz);
    }
    else
    {
        _2059 = vec3(0.0);
    }
    vec3 _2060;
    if (_1576 > 0.0030000000260770320892333984375)
    {
        _2060 = vec3(textureLod(gColourLUTStorm, _1440, 0.0).xyz);
    }
    else
    {
        _2060 = vec3(0.0);
    }
    vec3 _2061;
    if (_1584 > 0.0030000000260770320892333984375)
    {
        _2061 = vec3(textureLod(gColourLUTEffect, _1440, 0.0).xyz);
    }
    else
    {
        _2061 = vec3(0.0);
    }
    vec3 _1693 = (((vec3(textureLod(gColourLUTBase, _1440, 0.0).xyz) * ((1.0 - ((_781.lUniforms.mpCustomPerMesh.gColourLUTStrengthsVec4.x + _781.lUniforms.mpCustomPerMesh.gColourLUTStrengthsVec4.y) + _781.lUniforms.mpCustomPerMesh.gColourLUTStrengthsVec4.z)) + fma(_781.lUniforms.mpCustomPerMesh.gColourLUTStrengthsVec4.z, fma(-_1581, _1583, 1.0), fma(_781.lUniforms.mpCustomPerMesh.gColourLUTStrengthsVec4.x, 1.0 - _1571, _781.lUniforms.mpCustomPerMesh.gColourLUTStrengthsVec4.y * (1.0 - _1576))))) + ((_2059 * _1571) * _781.lUniforms.mpCustomPerMesh.gColourLUTStrengthsVec4.x)) + ((_2060 * _1576) * _781.lUniforms.mpCustomPerMesh.gColourLUTStrengthsVec4.y)) + ((_2061 * _1584) * _781.lUniforms.mpCustomPerMesh.gColourLUTStrengthsVec4.z);
    float3 hdr_color_graded;
    if (RENODX_TONE_MAP_TYPE < 2) {
      vec3 _1453 = (_1693 * fma(_1693, (_1693 * 0.305306017398834228515625) + vec3(0.6821711063385009765625), vec3(0.01252287812530994415283203125))) * 0.4011494219303131103515625;
      vec3 _1743 = _1453 * 0.0900000035762786865234375;
      vec3 _1757 = ((_1453 * 0.300000011920928955078125) + vec3(-0.290000021457672119140625)) * 0.439999997615814208984375;
      vec3 _1775 = vec3(-0.0060000005178153514862060546875) + _1743;
      hdr_color_graded = (((vec3(0.0060000005178153514862060546875) - _1743) / _1757) - (sqrt(fma(_1775, _1775, -((_1453 * 0.072000004351139068603515625) * ((_1453 * 0.06599999964237213134765625) + vec3(-0.063799999654293060302734375))))) / _1757)) / vec3(_1427);
    }
    else {
      float3 sdr_color_graded = renodx::color::gamma::DecodeSafe(_1693);
      hdr_color_graded = CustomUpgradeGrading(untonemapped_bt709, sdr_color_bt709, sdr_color_graded);
    }
    out_color0 = vec4(hdr_color_graded, 1.0);
    //out_color0 = vec4(untonemapped_bt709, 1.f);
    //out_color0 = vec4(_1458, 1.0);
    //out_color0 = vec4(untonemapped, 1.0);
}

