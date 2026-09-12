#include "./tonemapping.hlsl"

#version 450

/*
 * No Man's Sky's retained HDR combine tonemap pass.
 *
 * Processing flow:
 *   tone-map type 0: original decompiled path unchanged
 *   tone-map type 1: source RGB
 *     -> runtime toe calibration from the live curve
 *     -> Prism anchored tone map and grading
 *     -> signed dual-gamma encoding
 *
 * The shader writes the gamma-shaped RGB value consumed by the following
 * display-output stages.
 */

// Full game UBO mirror. Member order and padding preserve the offsets used by
// the postprocess parameters read by this shader.
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
  // Entries 0-2 describe the curve boundaries and linear segments. Entries
  // 3-8 contain cubic control values for the two middle intervals.
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

// The no-AA route reads the HDR combine texture and emits one RGB target.
layout(set = 0, binding = 0, std140) uniform lUniforms_BLK
{
  UniformBuffer lUniforms;
} _171;

// HDR combine texture used as the source for this fullscreen pass.
layout(set = 1, binding = 0) uniform sampler2D gBufferMap;

layout(location = 0) in VertexBlock
{
  vec2 mTexCoordsVec2;
} In;

layout(location = 0) out vec4 out_color0;

const float NOAA_LOG10_TWO = 0.3010300099849700927734375;

struct NoaaCurveReference
{
  float anchor_in;
  float anchor_out;
  float toe_slope;
  float power_contrast;
};

// Evaluate the game's scalar curve in its log10 domain. The live shader uses
// the X coefficient set for the first cubic interval and the Y coefficient
// set for the second interval.
float EvaluateNoaaCurveLog10(float log_input)
{
  float curve_output;
  if (log_input <= _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y)
  {
    curve_output = fma(
        log_input,
        _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].x,
        fma(
            -_171.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].x,
            _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y,
            _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].z));
  }
  else if (log_input < _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y)
  {
    float segment =
        3.0 * (log_input - _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y)
        / (_171.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y
           - _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y);
    int segment_index = int(segment);
    float segment_position = segment - float(segment_index);
    curve_output = dot(
        vec3(segment_position * segment_position, segment_position, 1.0),
        mat3(
            vec3(0.5, -1.0, 0.5),
            vec3(-1.0, 1.0, 0.5),
            vec3(0.5, 0.0, 0.0))
        * vec3(
            _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[segment_index + 3].x,
            _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[segment_index + 4].x,
            _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[segment_index + 5].x));
  }
  else if (log_input < _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].y)
  {
    float segment =
        3.0 * (log_input - _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y)
        / (_171.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].y
           - _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y);
    int segment_index = int(segment);
    float segment_position = segment - float(segment_index);
    curve_output = dot(
        vec3(segment_position * segment_position, segment_position, 1.0),
        mat3(
            vec3(0.5, -1.0, 0.5),
            vec3(-1.0, 1.0, 0.5),
            vec3(0.5, 0.0, 0.0))
        * vec3(
            _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[segment_index + 3].y,
            _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[segment_index + 4].y,
            _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[segment_index + 5].y));
  }
  else
  {
    curve_output = fma(
        log_input,
        _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].x,
        fma(
            -_171.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].x,
            _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].y,
            _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].z));
  }
  return curve_output;
}

// Evaluate the complete neutral RGB vanilla path. The factor of 10, inverse-
// log transform, fixed color matrices, and 1/300 output normalization match
// the active decompiled shader; gamma encoding is intentionally excluded.
float3 EvaluateVanillaTonemapRGB(float input)
{
  const vec3 working = input.xxx * mat3(
    vec3(0.613194942474365234375, 0.3395153582096099853515625, 0.0473681651055812835693359375),
    vec3(0.070204980671405792236328125, 0.916332781314849853515625, 0.013449150137603282928466796875),
    vec3(0.02061890624463558197021484375, 0.10956728458404541015625, 0.869605958461761474609375));
  const vec3 curve_input = working * 10.0;
  const vec3 curve_output = vec3(
    pow(10.0, EvaluateNoaaCurveLog10(
      log2(max(curve_input.x, 6.099999882280826568603515625e-05))
      * NOAA_LOG10_TWO)),
    pow(10.0, EvaluateNoaaCurveLog10(
      log2(max(curve_input.y, 6.099999882280826568603515625e-05))
      * NOAA_LOG10_TWO)),
    pow(10.0, EvaluateNoaaCurveLog10(
      log2(max(curve_input.z, 6.099999882280826568603515625e-05))
      * NOAA_LOG10_TWO)));

  return curve_output * mat3(
    vec3(1.70477974414825439453125, -0.621693134307861328125, -0.083245433866977691650390625),
    vec3(-0.13025949895381927490234375, 1.14083111286163330078125, -0.01054871082305908203125),
    vec3(-0.02400906570255756378173828125, -0.12899999320507049560546875, 1.1532490253448486328125))
     * 0.0033333333333333333333333333333333333;
}

float EvaluateVanillaTonemap(float input)
{
  return renodx::color::y::from::BT709(EvaluateVanillaTonemapRGB(input));
}

// Prism's power contrast uses the log-slope x*f'(x)/f(x) as its exponent.
// Metro Exodus cuts its SDR curve at a stable scene point, preserves the
// curve value there, and extends its tangent into HDR. Use the same pattern
// with the complete runtime curve instead of anchoring to its tiny toe output.
NoaaCurveReference ResolveNoaaCurveReference()
{
  NoaaCurveReference reference;
  reference.anchor_in = 0.18;
  reference.anchor_out = max(
      EvaluateVanillaTonemap(reference.anchor_in),
      renodx::math::FLT_MIN);

  // Match Metro's tangent slope at the cut point. The central difference is
  // taken over the complete piecewise curve, including either cubic interval
  // and the fixed NMS input/output normalization.
  const float delta = max(0.0001, reference.anchor_in * 0.001);
  const float lower = EvaluateVanillaTonemap(reference.anchor_in - delta);
  const float upper = EvaluateVanillaTonemap(reference.anchor_in + delta);
  const float slope = renodx::math::DivideSafe(
      upper - lower,
      2.0 * delta,
      0.0);
  reference.toe_slope = renodx::math::DivideSafe(
      reference.anchor_in * slope,
      reference.anchor_out,
      1.0);
  reference.power_contrast = clamp(
      reference.toe_slope,
      0.05,
      4.0);
  return reference;
}

void main()
{
  // Prism replaces only type 1. Type 0 begins immediately below this branch
  // and retains the original decompiled implementation.
  if (RENODX_TONE_MAP_TYPE == 1.0)
  {
    const vec3 untonemapped = texture(gBufferMap, In.mTexCoordsVec2).xyz;
    //const NoaaCurveReference curve_reference = ResolveNoaaCurveReference();

    const bool is_hdr = LAST_IS_HDR == 1.0;
    const float diffuse_white_nits = is_hdr
        ? max(RENODX_DIFFUSE_WHITE_NITS, 1.0)
        : 100.0;
    const float peak_value = is_hdr
        ? max(
            RENODX_PEAK_WHITE_NITS / diffuse_white_nits,
            0.0002)
        : 1.0;

    const float curve_anchor_in = RENODX_TONE_MAP_CURVE == 0.f
                      ? 0.18f
                      : RENODX_TONE_MAP_MID_GRAY_IN;
    const float curve_anchor_out = RENODX_TONE_MAP_CURVE == 0.f
                       ? 0.18f
                       : RENODX_TONE_MAP_MID_GRAY_OUT;
    const float curve_power_contrast = RENODX_TONE_MAP_CURVE == 0.f
                         ? 1.2f
                         : RENODX_TONE_MAP_CONTRAST;

    vec3 prism_color = ApplyPrismToneMap(
        untonemapped,
        peak_value,
        diffuse_white_nits,
      curve_anchor_in,
      curve_anchor_out,
      curve_power_contrast);
    prism_color = renodx::effects::ApplyFilmGrain(
        prism_color,
        In.mTexCoordsVec2,
        CUSTOM_RANDOM,
        CUSTOM_FILM_GRAIN_STRENGTH * 0.03);

    prism_color = min(prism_color, peak_value);
    // The final pass is scaled in UI-white units. Convert the Prism scene
    // result from game-white units so ToneMapGameNits remains effective.
    prism_color = CustomIntermediate(prism_color);
    out_color0 = vec4(CustomGammaEncode(prism_color), 1.0);
    return;
  }

  // Sample the HDR combine result at the current fullscreen UV.
  // Read the combined scene color at the current pixel.
  vec4 _396 = texture(gBufferMap, In.mTexCoordsVec2);
  // Copy the RGB channels into the curve's working vector.
  vec4 _1607 = _396;
  _1607.x = _396.x;
  _1607.y = _396.y;
  _1607.z = _396.z;
  // Move the sampled RGB into the curve's working color space with the
  // game's fixed 3x3 matrix.
  vec3 _420 = _1607.xyz * mat3(vec3(0.613194942474365234375, 0.3395153582096099853515625, 0.0473681651055812835693359375), vec3(0.070204980671405792236328125, 0.916332781314849853515625, 0.013449150137603282928466796875), vec3(0.02061890624463558197021484375, 0.10956728458404541015625, 0.869605958461761474609375));
  vec4 _1613 = _1607;
  _1613.x = _420.x;
  _1613.y = _420.y;
  _1613.z = _420.z;
  // Scale the working RGB before taking logarithms.
  vec3 _429 = _1613.xyz * 10.0;
  // Convert red to log10 space: log2(x) multiplied by log10(2), then apply
  // the parameterized piecewise curve.
  float _1100 = log2(max(_429.x, 6.099999882280826568603515625e-05));
  float _1101 = _1100 * 0.3010300099849700927734375;
  float _1729;
  if (_1101 <= _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y)
    {
    // First curve segment: linear evaluation using the first slope and
    // intercept parameters.
    _1729 = fma(_1101, _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].x, fma(-_171.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].x, _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y, _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].z));
  }
    else
    {
    bool _978 = _1101 > _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y;
    bool _985;
    if (_978)
        {
      _985 = _1101 < _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y;
    }
        else
        {
      _985 = _978;
    }
    float _1730;
    if (_985)
        {
      // Middle curve segment: select a cubic interval and evaluate it with
      // the Catmull-Rom basis matrix and the stored curve coefficients.
      float _997 = (3.0 * fma(_1100, 0.3010300099849700927734375, -_171.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y)) / (_171.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y - _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y);
      int _999 = int(_997);
      float _1003 = _997 - float(_999);
      _1730 = dot(vec3(_1003 * _1003, _1003, 1.0), mat3(vec3(0.5, -1.0, 0.5), vec3(-1.0, 1.0, 0.5), vec3(0.5, 0.0, 0.0)) * vec3(_171.lUniforms.mpCustomPerMesh.gAcesCurveParams[_999 + 3].x, _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[_999 + 4].x, _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[_999 + 5].x));
    }
        else
        {
      bool _1030 = _1101 >= _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y;
      bool _1037;
      if (_1030)
            {
        _1037 = _1101 < _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].y;
      }
            else
            {
        _1037 = _1030;
      }
      float _1731;
      if (_1037)
            {
        // Second middle interval uses the Y coefficient set in each curve
        // control vector.
        float _1049 = (3.0 * fma(_1100, 0.3010300099849700927734375, -_171.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y)) / (_171.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].y - _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y);
        int _1051 = int(_1049);
        float _1055 = _1049 - float(_1051);
        _1731 = dot(vec3(_1055 * _1055, _1055, 1.0), mat3(vec3(0.5, -1.0, 0.5), vec3(-1.0, 1.0, 0.5), vec3(0.5, 0.0, 0.0)) * vec3(_171.lUniforms.mpCustomPerMesh.gAcesCurveParams[_1051 + 3].y, _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[_1051 + 4].y, _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[_1051 + 5].y));
      }
            else
            {
          // Final curve segment: linear continuation after the cubic intervals.
        _1731 = fma(_1101, _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].x, fma(-_171.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].x, _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].y, _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].z));
      }
      _1730 = _1731;
    }
    _1729 = _1730;
  }

  // Apply the same log-domain curve independently to green.
  float _1292 = log2(max(_429.y, 6.099999882280826568603515625e-05));
  float _1293 = _1292 * 0.3010300099849700927734375;
  float _1738;
  if (_1293 <= _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y)
    {
    _1738 = fma(_1293, _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].x, fma(-_171.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].x, _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y, _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].z));
  }
    else
    {
    bool _1170 = _1293 > _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y;
    bool _1177;
    if (_1170)
        {
      _1177 = _1293 < _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y;
    }
        else
        {
      _1177 = _1170;
    }
    float _1739;
    if (_1177)
        {
      float _1189 = (3.0 * fma(_1292, 0.3010300099849700927734375, -_171.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y)) / (_171.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y - _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y);
      int _1191 = int(_1189);
      float _1195 = _1189 - float(_1191);
      _1739 = dot(vec3(_1195 * _1195, _1195, 1.0), mat3(vec3(0.5, -1.0, 0.5), vec3(-1.0, 1.0, 0.5), vec3(0.5, 0.0, 0.0)) * vec3(_171.lUniforms.mpCustomPerMesh.gAcesCurveParams[_1191 + 3].x, _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[_1191 + 4].x, _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[_1191 + 5].x));
    }
        else
        {
      bool _1222 = _1293 >= _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y;
      bool _1229;
      if (_1222)
            {
        _1229 = _1293 < _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].y;
      }
            else
            {
        _1229 = _1222;
      }
      float _1740;
      if (_1229)
            {
        float _1241 = (3.0 * fma(_1292, 0.3010300099849700927734375, -_171.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y)) / (_171.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].y - _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y);
        int _1243 = int(_1241);
        float _1247 = _1241 - float(_1243);
        _1740 = dot(vec3(_1247 * _1247, _1247, 1.0), mat3(vec3(0.5, -1.0, 0.5), vec3(-1.0, 1.0, 0.5), vec3(0.5, 0.0, 0.0)) * vec3(_171.lUniforms.mpCustomPerMesh.gAcesCurveParams[_1243 + 3].y, _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[_1243 + 4].y, _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[_1243 + 5].y));
      }
            else
            {
        _1740 = fma(_1293, _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].x, fma(-_171.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].x, _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].y, _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].z));
      }
      _1739 = _1740;
    }
    _1738 = _1739;
  }

  // Apply the same log-domain curve independently to blue.
  float _1484 = log2(max(_429.z, 6.099999882280826568603515625e-05));
  float _1485 = _1484 * 0.3010300099849700927734375;
  float _1746;
  if (_1485 <= _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y)
    {
    _1746 = fma(_1485, _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].x, fma(-_171.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].x, _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y, _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].z));
  }
    else
    {
    bool _1362 = _1485 > _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y;
    bool _1369;
    if (_1362)
        {
      _1369 = _1485 < _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y;
    }
        else
        {
      _1369 = _1362;
    }
    float _1747;
    if (_1369)
        {
      float _1381 = (3.0 * fma(_1484, 0.3010300099849700927734375, -_171.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y)) / (_171.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y - _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y);
      int _1383 = int(_1381);
      float _1387 = _1381 - float(_1383);
      _1747 = dot(vec3(_1387 * _1387, _1387, 1.0), mat3(vec3(0.5, -1.0, 0.5), vec3(-1.0, 1.0, 0.5), vec3(0.5, 0.0, 0.0)) * vec3(_171.lUniforms.mpCustomPerMesh.gAcesCurveParams[_1383 + 3].x, _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[_1383 + 4].x, _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[_1383 + 5].x));
    }
        else
        {
      bool _1414 = _1485 >= _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y;
      bool _1421;
      if (_1414)
            {
        _1421 = _1485 < _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].y;
      }
            else
            {
        _1421 = _1414;
      }
      float _1748;
      if (_1421)
            {
        float _1433 = (3.0 * fma(_1484, 0.3010300099849700927734375, -_171.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y)) / (_171.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].y - _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y);
        int _1435 = int(_1433);
        float _1439 = _1433 - float(_1435);
        _1748 = dot(vec3(_1439 * _1439, _1439, 1.0), mat3(vec3(0.5, -1.0, 0.5), vec3(-1.0, 1.0, 0.5), vec3(0.5, 0.0, 0.0)) * vec3(_171.lUniforms.mpCustomPerMesh.gAcesCurveParams[_1435 + 3].y, _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[_1435 + 4].y, _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[_1435 + 5].y));
      }
            else
            {
        _1748 = fma(_1485, _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].x, fma(-_171.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].x, _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].y, _171.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].z));
      }
      _1747 = _1748;
    }
    _1746 = _1747;
  }

  // Return the three curve results from log10 space to linear RGB.
  // Convert the three curve outputs from log10 values back to linear RGB.
  _1613.x = pow(10.0, _1729);
  _1613.y = pow(10.0, _1738);
  _1613.z = pow(10.0, _1746);
  // Convert the curve result into the output working color space.
  vec3 _519 = _1613.xyz * mat3(vec3(1.70477974414825439453125, -0.621693134307861328125, -0.083245433866977691650390625), vec3(-0.13025949895381927490234375, 1.14083111286163330078125, -0.01054871082305908203125), vec3(-0.02400906570255756378173828125, -0.12899999320507049560546875, 1.1532490253448486328125));
  vec4 _1697 = _1613;
  _1697.x = _519.x;
  _1697.y = _519.y;
  _1697.z = _519.z;
  vec3 _529 = _1697.xyz * 0.00999999977648258209228515625;
  vec4 _1703 = _1697;
  _1703.x = _529.x;
  _1703.y = _529.y;
  _1703.z = _529.z;
  // Apply the game's output scale before gamma encoding.
  vec3 _539 = _1703.xyz * 0.3333333432674407958984375;

  // Encode each channel with the game's dual-gamma response while preserving
  // the sign of intermediate color values.
  float _541 = _539.x;
  float _543 = _539.y;
  float _545 = _539.z;
  float _1525 = (_541 < 0.0) ? (-1.0) : 1.0;
  float _1528 = _541 * _1525;
  float _1769;
  if (_1528 < 1.0)
    {
    _1769 = pow(max(_1528, 0.0), 0.4545454680919647216796875);
  }
    else
    {
    float _1770;
    if (_1528 > 0.0)
        {
      _1770 = pow(max(_1528, 0.0), 0.4166666567325592041015625);
    }
        else
        {
      _1770 = _1528;
    }
    _1769 = _1770;
  }
  float _1554 = (_543 < 0.0) ? (-1.0) : 1.0;
  float _1557 = _543 * _1554;
  float _1788;
  if (_1557 < 1.0)
    {
    _1788 = pow(max(_1557, 0.0), 0.4545454680919647216796875);
  }
    else
    {
    float _1789;
    if (_1557 > 0.0)
        {
      _1789 = pow(max(_1557, 0.0), 0.4166666567325592041015625);
    }
        else
        {
      _1789 = _1557;
    }
    _1788 = _1789;
  }
  float _1583 = (_545 < 0.0) ? (-1.0) : 1.0;
  float _1586 = _545 * _1583;
  float _1792;
  if (_1586 < 1.0)
    {
    _1792 = pow(max(_1586, 0.0), 0.4545454680919647216796875);
  }
    else
    {
    float _1793;
    if (_1586 > 0.0)
        {
      _1793 = pow(max(_1586, 0.0), 0.4166666567325592041015625);
    }
        else
        {
      _1793 = _1586;
    }
    _1792 = _1793;
  }
  vec4 _1724 = _1703;
  _1724.x = _1769 * _1525;
  _1724.y = _1788 * _1554;
  _1724.z = _1792 * _1583;
  // Store the encoded RGB result with the pass alpha value.
  out_color0 = _1724;
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
//     float _padding0;
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
//     vec4 gSkyUpperParamsVec4;
//     vec4 gLightShaftColourBottomVec4;
//     vec4 gLightShaftColourTopVec4;
//     vec4 gAcesCurveParams[9];
//     vec4 gHDRParams2Vec4;
// };

// struct CommonPerMeshUniforms
// {
//     mat4 gWorldMat4;
//     mat4 gWorldNormalMat4;
//     float fdFadeValueDummy;
//     uint guContextVariant;
//     int giLodIndex;
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

// layout(set = 0, binding = 0, std140) uniform lUniforms_BLK
// {
//     UniformBuffer lUniforms;
// } _151;

// layout(set = 1, binding = 0) uniform sampler2D gBufferMap;

// layout(location = 0) in VertexBlock
// {
//     vec2 mTexCoordsVec2;
// } In;

// layout(location = 0) out vec4 out_color0;

// void main()
// {
//     vec4 _376 = texture(gBufferMap, In.mTexCoordsVec2);

//     vec4 outputColor = _376;

//     if (RENODX_TONE_MAP_TYPE < 1) {
//         vec4 _1563 = _376;
//         _1563.x = _376.x;
//         _1563.y = _376.y;
//         _1563.z = _376.z;
//         vec3 _406 = _1563.xyz * mat3(vec3(0.785552442073822021484375, 0.2073709070682525634765625, 0.0070768860168755054473876953125), vec3(0.049646966159343719482421875, 0.9488914012908935546875, 0.001461360021494328975677490234375), vec3(0.00373999332077801227569580078125, 0.0392914749681949615478515625, 0.956968486309051513671875));
//         vec4 _1569 = _1563;
//         _1569.x = _406.x;
//         _1569.y = _406.y;
//         _1569.z = _406.z;
//         vec3 _415 = _1569.xyz * 10.0;
//         vec4 _1575 = _1569;
//         _1575.x = _415.x;
//         _1575.y = _415.y;
//         _1575.z = _415.z;
//         vec3 _425 = _1575.xyz * 0.75;
//         float _1062 = log2(max(_425.x, 6.099999882280826568603515625e-05));
//         float _1063 = _1062 * 0.3010300099849700927734375;
//         float _1697;
//         if (_1063 <= _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y)
//         {
//             _1697 = fma(_1063, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].x, fma(-_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].x, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].z));
//         }
//         else
//         {
//             bool _926 = _1063 > _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y;
//             bool _933;
//             if (_926)
//             {
//                 _933 = _1063 < _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y;
//             }
//             else
//             {
//                 _933 = _926;
//             }
//             float _1698;
//             if (_933)
//             {
//                 float _1012 = (3.0 * fma(_1062, 0.3010300099849700927734375, -_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y)) / (_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y - _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y);
//                 int _1014 = int(_1012);
//                 float _1018 = _1012 - float(_1014);
//                 _1698 = dot(vec3(_1018 * _1018, _1018, 1.0), mat3(vec3(0.5, -1.0, 0.5), vec3(-1.0, 1.0, 0.5), vec3(0.5, 0.0, 0.0)) * vec3(_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[_1014 + 3].x, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[_1014 + 4].x, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[_1014 + 5].x));
//             }
//             else
//             {
//                 bool _938 = _1063 >= _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y;
//                 bool _945;
//                 if (_938)
//                 {
//                     _945 = _1063 < _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].y;
//                 }
//                 else
//                 {
//                     _945 = _938;
//                 }
//                 float _1699;
//                 if (_945)
//                 {
//                     float _971 = (3.0 * fma(_1062, 0.3010300099849700927734375, -_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y)) / (_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].y - _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y);
//                     int _973 = int(_971);
//                     float _977 = _971 - float(_973);
//                     _1699 = dot(vec3(_977 * _977, _977, 1.0), mat3(vec3(0.5, -1.0, 0.5), vec3(-1.0, 1.0, 0.5), vec3(0.5, 0.0, 0.0)) * vec3(_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[_973 + 3].y, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[_973 + 4].y, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[_973 + 5].y));
//                 }
//                 else
//                 {
//                     _1699 = fma(_1063, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].x, fma(-_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].x, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].y, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].z));
//                 }
//                 _1698 = _1699;
//             }
//             _1697 = _1698;
//         }
//         float _1254 = log2(max(_425.y, 6.099999882280826568603515625e-05));
//         float _1255 = _1254 * 0.3010300099849700927734375;
//         float _1706;
//         if (_1255 <= _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y)
//         {
//             _1706 = fma(_1255, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].x, fma(-_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].x, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].z));
//         }
//         else
//         {
//             bool _1118 = _1255 > _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y;
//             bool _1125;
//             if (_1118)
//             {
//                 _1125 = _1255 < _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y;
//             }
//             else
//             {
//                 _1125 = _1118;
//             }
//             float _1707;
//             if (_1125)
//             {
//                 float _1204 = (3.0 * fma(_1254, 0.3010300099849700927734375, -_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y)) / (_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y - _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y);
//                 int _1206 = int(_1204);
//                 float _1210 = _1204 - float(_1206);
//                 _1707 = dot(vec3(_1210 * _1210, _1210, 1.0), mat3(vec3(0.5, -1.0, 0.5), vec3(-1.0, 1.0, 0.5), vec3(0.5, 0.0, 0.0)) * vec3(_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[_1206 + 3].x, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[_1206 + 4].x, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[_1206 + 5].x));
//             }
//             else
//             {
//                 bool _1130 = _1255 >= _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y;
//                 bool _1137;
//                 if (_1130)
//                 {
//                     _1137 = _1255 < _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].y;
//                 }
//                 else
//                 {
//                     _1137 = _1130;
//                 }
//                 float _1708;
//                 if (_1137)
//                 {
//                     float _1163 = (3.0 * fma(_1254, 0.3010300099849700927734375, -_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y)) / (_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].y - _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y);
//                     int _1165 = int(_1163);
//                     float _1169 = _1163 - float(_1165);
//                     _1708 = dot(vec3(_1169 * _1169, _1169, 1.0), mat3(vec3(0.5, -1.0, 0.5), vec3(-1.0, 1.0, 0.5), vec3(0.5, 0.0, 0.0)) * vec3(_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[_1165 + 3].y, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[_1165 + 4].y, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[_1165 + 5].y));
//                 }
//                 else
//                 {
//                     _1708 = fma(_1255, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].x, fma(-_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].x, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].y, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].z));
//                 }
//                 _1707 = _1708;
//             }
//             _1706 = _1707;
//         }
//         float _1446 = log2(max(_425.z, 6.099999882280826568603515625e-05));
//         float _1447 = _1446 * 0.3010300099849700927734375;
//         float _1714;
//         if (_1447 <= _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y)
//         {
//             _1714 = fma(_1447, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].x, fma(-_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].x, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].z));
//         }
//         else
//         {
//             bool _1310 = _1447 > _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y;
//             bool _1317;
//             if (_1310)
//             {
//                 _1317 = _1447 < _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y;
//             }
//             else
//             {
//                 _1317 = _1310;
//             }
//             float _1715;
//             if (_1317)
//             {
//                 float _1396 = (3.0 * fma(_1446, 0.3010300099849700927734375, -_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y)) / (_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y - _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[0].y);
//                 int _1398 = int(_1396);
//                 float _1402 = _1396 - float(_1398);
//                 _1715 = dot(vec3(_1402 * _1402, _1402, 1.0), mat3(vec3(0.5, -1.0, 0.5), vec3(-1.0, 1.0, 0.5), vec3(0.5, 0.0, 0.0)) * vec3(_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[_1398 + 3].x, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[_1398 + 4].x, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[_1398 + 5].x));
//             }
//             else
//             {
//                 bool _1322 = _1447 >= _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y;
//                 bool _1329;
//                 if (_1322)
//                 {
//                     _1329 = _1447 < _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].y;
//                 }
//                 else
//                 {
//                     _1329 = _1322;
//                 }
//                 float _1716;
//                 if (_1329)
//                 {
//                     float _1355 = (3.0 * fma(_1446, 0.3010300099849700927734375, -_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y)) / (_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].y - _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[1].y);
//                     int _1357 = int(_1355);
//                     float _1361 = _1355 - float(_1357);
//                     _1716 = dot(vec3(_1361 * _1361, _1361, 1.0), mat3(vec3(0.5, -1.0, 0.5), vec3(-1.0, 1.0, 0.5), vec3(0.5, 0.0, 0.0)) * vec3(_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[_1357 + 3].y, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[_1357 + 4].y, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[_1357 + 5].y));
//                 }
//                 else
//                 {
//                     _1716 = fma(_1447, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].x, fma(-_151.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].x, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].y, _151.lUniforms.mpCustomPerMesh.gAcesCurveParams[2].z));
//                 }
//                 _1715 = _1716;
//             }
//             _1714 = _1715;
//         }
//         _1575.x = pow(10.0, _1697);
//         _1575.y = pow(10.0, _1706);
//         _1575.z = pow(10.0, _1714);
//         vec3 _607 = _1575.xyz * mat3(vec3(1.69192218780517578125, -0.605636894702911376953125, -0.086444489657878875732421875), vec3(-0.1286521852016448974609375, 1.13804304599761962890625, -0.009367738850414752960205078125), vec3(-0.0240197293460369110107421875, -0.12613250315189361572265625, 1.15039217472076416015625));
//         vec4 _1659 = _1575;
//         _1659.x = _607.x;
//         _1659.y = _607.y;
//         _1659.z = _607.z;
//         vec3 _617 = _1659.xyz * 0.00999999977648258209228515625;
//         vec4 _1665 = _1659;
//         _1665.x = _617.x;
//         _1665.y = _617.y;
//         _1665.z = _617.z;
//         vec3 _627 = _1665.xyz * 0.25;
//         vec4 _1671 = _1665;
//         _1671.x = _627.x;
//         _1671.y = _627.y;
//         _1671.z = _627.z;
//         vec3 _637 = _1671.xyz * 1.33333337306976318359375;
//         float _639 = _637.x;
//         float _641 = _637.y;
//         float _643 = _637.z;
//         float _1487 = (_639 < 0.0) ? (-1.0) : 1.0;
//         float _1490 = _639 * _1487;
//         float _1737;
//         if (_1490 < 1.0)
//         {
//             _1737 = pow(_1490, 0.4545454680919647216796875);
//         }
//         else
//         {
//             float _1738;
//             if (_1490 > 0.0)
//             {
//                 _1738 = pow(_1490, 0.4166666567325592041015625);
//             }
//             else
//             {
//                 _1738 = _1490;
//             }
//             _1737 = _1738;
//         }
//         float _1514 = (_641 < 0.0) ? (-1.0) : 1.0;
//         float _1517 = _641 * _1514;
//         float _1756;
//         if (_1517 < 1.0)
//         {
//             _1756 = pow(_1517, 0.4545454680919647216796875);
//         }
//         else
//         {
//             float _1757;
//             if (_1517 > 0.0)
//             {
//                 _1757 = pow(_1517, 0.4166666567325592041015625);
//             }
//             else
//             {
//                 _1757 = _1517;
//             }
//             _1756 = _1757;
//         }
//         float _1541 = (_643 < 0.0) ? (-1.0) : 1.0;
//         float _1544 = _643 * _1541;
//         float _1760;
//         if (_1544 < 1.0)
//         {
//             _1760 = pow(_1544, 0.4545454680919647216796875);
//         }
//         else
//         {
//             float _1761;
//             if (_1544 > 0.0)
//             {
//                 _1761 = pow(_1544, 0.4166666567325592041015625);
//             }
//             else
//             {
//                 _1761 = _1544;
//             }
//             _1760 = _1761;
//         }
//         vec4 _1692 = _1671;
//         _1692.x = _1737 * _1487;
//         _1692.y = _1756 * _1514;
//         _1692.z = _1760 * _1541;
//         outputColor = _1692;
//     } else {
//         outputColor.xyz = CustomTonemap(outputColor.xyz, In.mTexCoordsVec2);
//         outputColor.xyz = CustomGammaEncode(outputColor.xyz);
//     }

//     out_color0 = outputColor;
// }