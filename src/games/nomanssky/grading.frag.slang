#include "./tonemapping.hlsl"
#version 450

/*
 * No Man's Sky's FX-combine grading pass.
 *
 * The shader combines scene and auxiliary buffers, converts the result into
 * the game's logarithmic LUT domain, blends several 3D grading LUTs, converts
 * the result back to linear RGB, and limits out-of-gamut chroma in an
 * Oklab-like space. The resulting linear RGB feeds the later display-output
 * stage.
 */

const float _939[48] = float[](1.33379995822906494140625, 1.33379995822906494140625, 1.3329999446868896484375, 1.3292000293731689453125, 1.3229999542236328125, 1.1856000423431396484375, 1.1981999874114990234375, 1.20850002765655517578125, 1.21730005741119384765625, 1.225100040435791015625, 1.2323000431060791015625, 1.23919999599456787109375, 1.246099948883056640625, 1.25310003757476806640625, 1.26059997081756591796875, 1.26890003681182861328125, 1.2783000469207763671875, 1.28960001468658447265625, 1.31149995326995849609375, 2.0102999210357666015625, 2.2688999176025390625, 2.2688999176025390625, 2.2578999996185302734375, 2.263000011444091796875, 2.27519989013671875, 2.2918999195098876953125, 2.3145000934600830078125, 2.3452999591827392578125, 2.3891999721527099609375, 2.45720005035400390625, 2.5799999237060546875, 2.9124000072479248046875, 4.04979991912841796875, 4.04979991912841796875, 3.3297998905181884765625, 2.4605000019073486328125, 1.56589996814727783203125, 1.11860001087188720703125, 1.14090001583099365234375, 1.1663000583648681640625, 1.19430005550384521484375, 1.22399997711181640625, 1.2539999485015869140625, 1.28170001506805419921875, 1.304399967193603515625, 1.32050001621246337890625, 1.33000004291534423828125, 1.33360004425048828125);

// The 48-entry table above stores hue-dependent gamut boundary values for the
// final chroma limiter.
// Full game UBO mirror. Member order preserves the offsets used by the pass.
struct PerFrameUniforms
{
  mat4 gViewProjectionMat4;
  mat4 gViewMat4;
  mat4 gCameraMat4;
  mat4 gCameraNoHeadTrackingMat4;
  mat4 gPrevViewProjectionMat4;
  mat4 gInverseViewProjectionMat4;
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
  float gfTime;
  vec3 gVREyeInfoVec3;
  float gfPrevTime;
  vec4 gClipPlanesVec4;
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
  int giDisableAmbientAllowed;
  int giFrameIndex;
  uint guSpotlightsCountIn;
  uint guSpotlightsCountOut;
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
  vec4 gCompressCoordsOffsetVec4;
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
  float gfLifetimeValue;
  uint guLightId;
  uint guSkinMatrixRowOffset;
  uint guNumSkinMatRows;
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
} _1230;

// Four 3D LUTs provide the base, far-space, storm, and effect grades.
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

float EncodeSceneGradeLUTComponent(float input_color)
{
  if (input_color <= 0.0078125)
  {
    return fma(input_color, 10.5402374267578125, 0.072905533015727996826171875);
  }
  return (log2(input_color) + 9.72000026702880859375) * 0.057077623903751373291015625;
}

vec3 EncodeSceneGradeLUT(vec3 input_color)
{
  return vec3(
      EncodeSceneGradeLUTComponent(input_color.x),
      EncodeSceneGradeLUTComponent(input_color.y),
      EncodeSceneGradeLUTComponent(input_color.z))
      * 0.96969699859619140625
      + vec3(0.01515151560306549072265625);
}

float DecodeSceneGradeLUTComponent(float lut_color)
{
  if (lut_color <= 0.15525114536285400390625)
  {
    return (lut_color - 0.072905533015727996826171875)
           * 0.094874523580074310302734375;
  }
  return min(
      exp2(lut_color * 17.520000457763671875 - 9.72000026702880859375),
      65504.0);
}

vec3 DecodeSceneGradeLUT(vec3 lut_color)
{
  return vec3(
      DecodeSceneGradeLUTComponent(lut_color.x),
      DecodeSceneGradeLUTComponent(lut_color.y),
      DecodeSceneGradeLUTComponent(lut_color.z));
}

vec3 SampleSceneGradeLUT(
    vec3 lut_uv,
    float far_selector,
    float storm_selector,
    float effect_selector)
{
  const float far_strength = _1230.lUniforms.mpCustomPerMesh.gColourLUTStrengthsVec4.x;
  const float storm_strength = _1230.lUniforms.mpCustomPerMesh.gColourLUTStrengthsVec4.y;
  const float effect_strength = _1230.lUniforms.mpCustomPerMesh.gColourLUTStrengthsVec4.z;

  vec3 base_lut = textureLod(gColourLUTBase, lut_uv, 0.0).xyz;
  vec3 far_lut = vec3(0.0);
  vec3 storm_lut = vec3(0.0);
  vec3 effect_lut = vec3(0.0);
  if (far_selector > 0.0030000000260770320892333984375)
  {
    far_lut = textureLod(gColourLUTFar, lut_uv, 0.0).xyz;
  }
  if (storm_selector > 0.0030000000260770320892333984375)
  {
    storm_lut = textureLod(gColourLUTStorm, lut_uv, 0.0).xyz;
  }
  if (effect_selector > 0.0030000000260770320892333984375)
  {
    effect_lut = textureLod(gColourLUTEffect, lut_uv, 0.0).xyz;
  }

  const float base_weight =
      (1.0 - (far_strength + storm_strength + effect_strength))
      + effect_strength * (1.0 - effect_selector)
      + far_strength * (1.0 - far_selector)
      + storm_strength * (1.0 - storm_selector);
  return base_lut * base_weight
         + far_lut * (far_selector * far_strength)
         + storm_lut * (storm_selector * storm_strength)
         + effect_lut * (effect_selector * effect_strength);
}

void main()
{
  // Scene color and the grading validity/mask source.
  vec3 _1194 = textureLod(gBufferMap, In.mTexCoordsVec2, 0.0).xyz;
  vec4 _1211 = textureLod(gBuffer3Map, In.mTexCoordsVec2, 0.0);
  float _1212 = _1211.x;
  vec4 _1890 = texture(gBuffer5Map, vec2(0.25));
  vec4 _1893 = texture(gBuffer5Map, vec2(0.75, 0.25));
  vec4 _1898 = texture(gBuffer5Map, vec2(0.25, 0.75));
  vec4 _1903 = texture(gBuffer5Map, vec2(0.75));

    // A time-varying neighboring sample stabilizes valid scene pixels. The
    // color-difference test selects matching channels from the neighboring RGB.
  vec3 _3074;
  if (_1230.lUniforms.mpPerFrame.gFoVValuesVec4.z != 2.0)
    {
    vec3 _3075;
    if (_1212 >= 1.0)
        {
      vec2 _1932 = In.mTexCoordsVec2 + vec2(fract(_1230.lUniforms.mpPerFrame.gfTime));
      vec2 _1942 = fma(floor(fma(vec2(fract(sin(dot(_1932, vec2(12.98980045318603515625, 78.233001708984375))) * 43758.546875), fract(cos(mod(123456792.0, fma(256.0, dot(vec2(23.1406917572021484375, 2.6651442050933837890625), _1932), 1.0000000116860974230803549289703e-07))))), vec2(31.0), vec2(-15.0))), _1230.lUniforms.mpPerFrame.gFrameBufferSizeVec4.zw, In.mTexCoordsVec2);
      vec3 _3076;
      if (textureLod(gBuffer3Map, _1942, 0.0).x >= 1.0)
            {
        vec3 _1953 = textureLod(gBufferMap, _1942, 0.0).xyz;
        vec3 _1957 = abs(_1194 - _1953);
        _3076 = mix(_1194, _1953, bvec3(((_1957.x + _1957.y) + _1957.z) < 0.02745098061859607696533203125));
      }
            else
            {
        _3076 = _1194;
      }
      _3075 = _3076;
    }
        else
        {
      _3075 = _1194;
    }
    _3074 = _3075;
  }
    else
    {
    _3074 = _1194;
  }

    // Combine scene color, the auxiliary color buffer, and the four-tap factor
    // stored in gBuffer5.
  vec3 _1378 = (_3074 + textureLod(gBuffer2Map, In.mTexCoordsVec2, 0.0).xyz) + (textureLod(gBuffer1Map, In.mTexCoordsVec2, 0.0).xyz * (((_1890.x + _1893.x) + _1898.x) + _1903.x));

    // Shape the linear color into the logarithmic coordinate system used by the
    // grading LUTs. The linear branch forms the toe below 1/128; the log2 branch
    // covers the higher luminance range.
  float _2041 = _1378.x;
  float _3077;
  if (_2041 <= 0.0078125)
    {
    _3077 = fma(_2041, 10.5402374267578125, 0.072905533015727996826171875);
  }
    else
    {
    _3077 = (log2(_2041) + 9.72000026702880859375) * 0.057077623903751373291015625;
  }
  float _2044 = _1378.y;
  float _3078;
  if (_2044 <= 0.0078125)
    {
    _3078 = fma(_2044, 10.5402374267578125, 0.072905533015727996826171875);
  }
    else
    {
    _3078 = (log2(_2044) + 9.72000026702880859375) * 0.057077623903751373291015625;
  }
  float _2047 = _1378.z;
  float _3079;
  if (_2047 <= 0.0078125)
    {
    _3079 = fma(_2047, 10.5402374267578125, 0.072905533015727996826171875);
  }
    else
    {
    _3079 = (log2(_2047) + 9.72000026702880859375) * 0.057077623903751373291015625;
  }
  vec3 _2009 = (vec3(_3077, _3078, _3079) * 0.96969699859619140625) + vec3(0.01515151560306549072265625);

  // Scale LUT selectors by the scene validity value and the frame clip-plane
  // parameter. The effect selector also uses the inverse gBuffer4 mask.
  float _2255 = _1212 * _1230.lUniforms.mpPerFrame.gClipPlanesVec4.y;
  float _2124 = clamp(_1230.lUniforms.mpCustomPerMesh.gColourLUTParamsVec4.x * _2255, 0.0, 1.0);
  float _2129 = clamp(_1230.lUniforms.mpCustomPerMesh.gColourLUTParamsVec4.y * _2255, 0.0, 1.0);
  float _2134 = clamp(_1230.lUniforms.mpCustomPerMesh.gColourLUTParamsVec4.z * _2255, 0.0, 1.0);
  float _2136 = 1.0 - textureLod(gBuffer4Map, In.mTexCoordsVec2, 0.0).x;
  float _2137 = _2134 * _2136;

  // Fetch alternate LUT grades only when their corresponding selector has
  // meaningful strength.
  vec3 _3080;
  if (_2124 > 0.0030000000260770320892333984375)
    {
    _3080 = vec3(textureLod(gColourLUTFar, _2009, 0.0).xyz);
  }
    else
    {
    _3080 = vec3(0.0);
  }
  vec3 _3081;
  if (_2129 > 0.0030000000260770320892333984375)
    {
    _3081 = vec3(textureLod(gColourLUTStorm, _2009, 0.0).xyz);
  }
    else
    {
    _3081 = vec3(0.0);
  }
  vec3 _3082;
  if (_2137 > 0.0030000000260770320892333984375)
    {
    _3082 = vec3(textureLod(gColourLUTEffect, _2009, 0.0).xyz);
  }
    else
    {
    _3082 = vec3(0.0);
  }
  vec3 _2246 = (((vec3(textureLod(gColourLUTBase, _2009, 0.0).xyz) * ((1.0 - ((_1230.lUniforms.mpCustomPerMesh.gColourLUTStrengthsVec4.x + _1230.lUniforms.mpCustomPerMesh.gColourLUTStrengthsVec4.y) + _1230.lUniforms.mpCustomPerMesh.gColourLUTStrengthsVec4.z)) + fma(_1230.lUniforms.mpCustomPerMesh.gColourLUTStrengthsVec4.z, fma(-_2134, _2136, 1.0), fma(_1230.lUniforms.mpCustomPerMesh.gColourLUTStrengthsVec4.x, 1.0 - _2124, _1230.lUniforms.mpCustomPerMesh.gColourLUTStrengthsVec4.y * (1.0 - _2129))))) + ((_3080 * _2124) * _1230.lUniforms.mpCustomPerMesh.gColourLUTStrengthsVec4.x)) + ((_3081 * _2129) * _1230.lUniforms.mpCustomPerMesh.gColourLUTStrengthsVec4.y)) + ((_3082 * _2137) * _1230.lUniforms.mpCustomPerMesh.gColourLUTStrengthsVec4.z);

  // Blend the base, far, storm, and effect LUT results. The strength vector
  // controls each alternate grade while the base grade fills the remainder.

  // Decode each LUT channel back into the linear luminance domain. The toe
  // branch reverses the linear segment; the exponential branch reverses log2.
  float _2262 = _2246.x;
  float _3089;
  if (_2262 <= 0.15525114536285400390625)
    {
    _3089 = (_2262 - 0.072905533015727996826171875) * 0.094874523580074310302734375;
  }
    else
    {
    _3089 = min(exp2(fma(_2262, 17.520000457763671875, -9.72000026702880859375)), 65504.0);
  }
  float _2265 = _2246.y;
  float _3090;
  if (_2265 <= 0.15525114536285400390625)
    {
    _3090 = (_2265 - 0.072905533015727996826171875) * 0.094874523580074310302734375;
  }
    else
    {
    _3090 = min(exp2(fma(_2265, 17.520000457763671875, -9.72000026702880859375)), 65504.0);
  }
  float _2268 = _2246.z;
  float _3091;
  if (_2268 <= 0.15525114536285400390625)
    {
    _3091 = (_2268 - 0.072905533015727996826171875) * 0.094874523580074310302734375;
  }
    else
    {
    _3091 = min(exp2(fma(_2268, 17.520000457763671875, -9.72000026702880859375)), 65504.0);
  }

    // The LUTs operate in a log-shaped AP1 domain. Sample black and mid through
    // the same active LUT blend, then remove the raised black floor with the
    // recovered per-channel gamma correction before returning to BT.709 and
    // gamut-limiting the grade.
    vec3 lut_linear = max(vec3(0.0), vec3(_3089, _3090, _3091));
    if (SCENE_GRADE_LUT_SCALING > 0.0 || SCENE_GRADE_LUT_STRENGTH < 1.0)
    {
      const vec3 lut_black = DecodeSceneGradeLUT(SampleSceneGradeLUT(
          EncodeSceneGradeLUT(vec3(0.0)),
          _2124,
          _2129,
          _2137));
      const vec3 lut_mid = DecodeSceneGradeLUT(SampleSceneGradeLUT(
          EncodeSceneGradeLUT(saturate(lut_black)),
          _2124,
          _2129,
          _2137));
      lut_linear = ApplySceneGradeLUT(
          _1378,
          lut_linear,
          lut_black,
          lut_mid);
    }

    vec3 _2029 = lut_linear * mat3(vec3(1.70477974414825439453125, -0.621693134307861328125, -0.083245433866977691650390625), vec3(-0.13025949895381927490234375, 1.14083111286163330078125, -0.01054871082305908203125), vec3(-0.02400906570255756378173828125, -0.12899999320507049560546875, 1.1532490253448486328125));

  // Convert the reconstructed RGB into the working color space used by the
  // Oklab-style gamut limiter.
  // Convert the reconstructed color into an Oklab-style representation and
  // reduce chroma when the color reaches the RGB gamut boundary.
  vec3 _3110;
  do
    {
    float _2436 = _2029.x;
    float _2438 = _2029.y;
    float _2440 = _2029.z;
    float _2443 = fma(0.4122214615345001220703125, _2436, fma(0.536332547664642333984375, _2438, 0.0514459945261478424072265625 * _2440));
    float _2452 = fma(0.21190349757671356201171875, _2436, fma(0.680699527263641357421875, _2438, 0.10739696025848388671875 * _2440));
    float _2461 = fma(0.0883024632930755615234375, _2436, fma(0.28171885013580322265625, _2438, 0.629978716373443603515625 * _2440));
    float _2496 = ((_2443 > 0.0) ? 1.0 : (-1.0)) * pow(max(abs(_2443), 0.0), 0.3333333432674407958984375);
    float _2506 = ((_2452 > 0.0) ? 1.0 : (-1.0)) * pow(max(abs(_2452), 0.0), 0.3333333432674407958984375);
    float _2516 = ((_2461 > 0.0) ? 1.0 : (-1.0)) * pow(max(abs(_2461), 0.0), 0.3333333432674407958984375);
    float _2473 = fma(0.2104542553424835205078125, _2496, fma(0.793617784976959228515625, _2506, (-0.004072046838700771331787109375) * _2516));
    float _2479 = fma(1.9779984951019287109375, _2496, fma(-2.428592205047607421875, _2506, 0.4505937099456787109375 * _2516));
    float _2485 = fma(0.025904037058353424072265625, _2496, fma(0.782771766185760498046875, _2506, (-0.8086757659912109375) * _2516));
    if (_2473 <= 9.9999999747524270787835121154785e-07)
        {
      _3110 = max(_2029, vec3(0.0));
      break;
    }
    vec2 _2363 = vec3(_2473, _2479, _2485).yz;
    float _2366 = dot(_2363, _2363);
    if (_2366 <= 1.000000016862383526387164645044e-16)
        {
      _3110 = _2029;
      break;
    }
    float _2373 = inversesqrt(_2366);
    float _2380 = _2479 * _2373;
    float _2384 = _2485 * _2373;
    float _3092;
    float _3094;
    float _3096;
    float _3098;
    float _3100;
    float _3102;
    float _3104;
    float _3106;
    if (fma(-1.88170325756072998046875, _2380, _2384 * (-0.80936491489410400390625)) > 1.0)
        {
      _3106 = 0.2309699356555938720703125;
      _3104 = -3.30771160125732421875;
      _3102 = 4.076741695404052734375;
      _3100 = 1.19086277484893798828125;
      _3098 = 1.7657673358917236328125;
      _3096 = 0.59662640094757080078125;
      _3094 = 0.7551519870758056640625;
      _3092 = 0.56771242618560791015625;
    }
        else
        {
      bool _2559 = fma(1.81444108486175537109375, _2380, _2384 * (-1.194452762603759765625)) > 1.0;
      _3106 = _2559 ? (-0.341319382190704345703125) : 1.7076146602630615234375;
      _3104 = _2559 ? 2.60975742340087890625 : (-0.70341861248016357421875);
      _3102 = _2559 ? (-1.26843798160552978515625) : (-0.0041960864327847957611083984375);
      _3100 = _2559 ? 0.7395651340484619140625 : 1.357336521148681640625;
      _3098 = _2559 ? (-0.4595440328121185302734375) : (-0.009157990105450153350830078125);
      _3096 = _2559 ? 0.08285427093505859375 : (-1.1513020992279052734375);
      _3094 = _2559 ? 0.1254107058048248291015625 : (-0.50559604167938232421875);
      _3092 = _2559 ? 0.14503203332424163818359375 : 0.0069216699339449405670166015625;
    }
    float _2580 = fma(_3092, _2380 * _2384, fma(_3094, _2380 * _2380, fma(_3096, _2384, fma(_3098, _2380, _3100))));
    float _2584 = fma(0.3963377773761749267578125, _2380, 0.21580375730991363525390625 * _2384);
    float _2588 = fma(-0.1055613458156585693359375, _2380, (-0.06385417282581329345703125) * _2384);
    float _2592 = fma(-0.089484177529811859130859375, _2380, (-1.2914855480194091796875) * _2384);
    float _2595 = fma(_2580, _2584, 1.0);
    float _2598 = fma(_2580, _2588, 1.0);
    float _2601 = fma(_2580, _2592, 1.0);
    float _2661 = fma(_3102, (_2595 * _2595) * _2595, fma(_3104, (_2598 * _2598) * _2598, _3106 * ((_2601 * _2601) * _2601)));
    float _2670 = fma(_3102, ((3.0 * _2584) * _2595) * _2595, fma(_3104, ((3.0 * _2588) * _2598) * _2598, _3106 * (((3.0 * _2592) * _2601) * _2601)));
    float _2692 = fma(_2661, (-_2670) / fma(_2670, _2670, ((-0.5) * _2661) * fma(_3102, ((6.0 * _2584) * _2584) * _2595, fma(_3104, ((6.0 * _2588) * _2588) * _2598, _3106 * (((6.0 * _2592) * _2592) * _2601)))), _2580);
    float _2392 = (_2366 * _2373) / (_2473 * _2692);
    bool _2394 = _2392 <= 0.89999997615814208984375;
    if (_2394)
        {
      _3110 = _2029;
      break;
    }
    // Use the hue angle to interpolate the matching entries in the 48-sector
    // gamut-boundary table.
    float _2705 = fract(atan(_2485, _2479) * 0.159154951572418212890625);
    int _2709 = int(floor(_2705 * 48.0));
    int _3108;
    if (_2709 == 47)
        {
      _3108 = 0;
    }
        else
        {
      _3108 = _2709 + 1;
    }
    float _3109;
    do
        {
      if (_2394)
            {
        _3109 = _2392;
        break;
      }
      float _2752 = 0.100000001490116119384765625 * inversesqrt(max(min(mix(_939[_2709], _939[_3108], fma(_2705, 48.0, -float(_2709))), 2.5), 1.00100004673004150390625) - 1.0);
      float _2755 = _2752 * _2752;
      _3109 = min(fma(_2752, sqrt(fma(0.25, _2755, _2392 - 0.89999997615814208984375)), fma(-0.5, _2755, 0.89999997615814208984375)), 1.0);
      break;
    } while (false);
    float _2412 = (_3109 * _2692) * _2473;
    float _2416 = _2412 * _2380;
    float _2419 = _2412 * _2384;
    float _2784 = fma(0.3963377773761749267578125, _2416, fma(0.21580375730991363525390625, _2419, _2473));
    float _2792 = fma(-0.1055613458156585693359375, _2416, fma(-0.06385417282581329345703125, _2419, _2473));
    float _2800 = fma(-0.089484177529811859130859375, _2416, fma(-1.2914855480194091796875, _2419, _2473));
    float _2805 = (_2784 * _2784) * _2784;
    float _2810 = (_2792 * _2792) * _2792;
    float _2815 = (_2800 * _2800) * _2800;
    _3110 = vec3(fma(4.076741695404052734375, _2805, fma(-3.30771160125732421875, _2810, 0.2309699356555938720703125 * _2815)), fma(-1.26843798160552978515625, _2805, fma(2.60975742340087890625, _2810, (-0.341319382190704345703125) * _2815)), fma(-0.0041960864327847957611083984375, _2805, fma(-0.70341861248016357421875, _2810, 1.7076146602630615234375 * _2815)));
    break;
  } while (false);
  // Write the nonnegative reconstructed RGB color for the next display stage.
  out_color0 = vec4(max(vec3(0.0), _3110), 1.0);
}

