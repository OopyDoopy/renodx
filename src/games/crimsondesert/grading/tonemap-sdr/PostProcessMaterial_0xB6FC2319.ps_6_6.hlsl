struct PostProcessAbyssEnterIntro_CDStruct {
  float _cubeScale;
  float _cameraSpeed;
  float _cameraSinIntensity;
  float3 _screenFadeColor;
  float _screenFadeRatio;
  float3 _fogColor;
  float3 _ambientColor;
  float3 _mainTintColor;
  float3 _waveColor;
  float3 _globalColor;
  float3 _lightColor;
  float3 _centerGlowColor;
  float _centerGlowRadius;
  float _stardustIntensity;
  float _stardustDensity;
  float _particleIntensity;
  float _particleEmissionWidth;
  float _anamorphicIntensity;
  float _anamorphicWidth;
  float _largeHalo;
  float _largeHaloIntensity;
  float _middleHaloIntensity;
  float _blubIntensity;
  float _streakGlowIntensity;
  float _centerpoint;
  float _tunnelTotal;
  float _cameraFov;
  float _cubeDistance;
  uint _screenWarpTex;
  float _screenWarpRatio;
  float _edgeFlowSpeed;
  float _cubeMinScale;
  float _borderRatio;
  float _borderWidth;
  float _borderSmoothness;
  uint _borderColor;
  float _fadeRatio;
};


Texture2D<float4> __3__36__0__0__g_sceneColor : register(t32, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t33, space36);

cbuffer __3__35__0__0__SceneConstantBuffer : register(b15, space35) {
  float4 _time;
  float4 _timeNoScale;
  uint4 _frameNumber;
  float4 _screenSizeAndInvSize;
  float4 _bufferSizeAndInvSize;
  float4 _hiZUVScaleAndInvScale;
  float4 _resolutionScale;
  float4 _temporalReprojectionParams;
  float4 _viewPos;
  float4 _viewDir;
  column_major float4x4 _viewProj;
  column_major float4x4 _viewProjNoJitter;
  column_major float4x4 _viewProjRelative;
  column_major float4x4 _viewProjRelativeNoJitter;
  column_major float4x4 _invViewProj;
  column_major float4x4 _invViewProjRelative;
  column_major float4x4 _invViewProjRelativeNoJitter;
  column_major float4x4 _viewProjRelativeOrtho;
  float4 _sunDirection;
  float4 _moonDirection;
  float4 _moonRight;
  float4 _moonUp;
  float4 _ssaoRandomDirection[16];
  column_major float4x4 _view;
  column_major float4x4 _viewRelative;
  column_major float4x4 _viewRelativePrev;
  column_major float4x4 _proj;
  column_major float4x4 _projNoJitter;
  float4 _viewPosPrev;
  column_major float4x4 _viewProjNoJitterPrev;
  column_major float4x4 _viewProjRelativePrev;
  column_major float4x4 _viewProjRelativeNoJitterPrev;
  column_major float4x4 _invViewProjPrev;
  column_major float4x4 _invViewProjRelativePrev;
  column_major float4x4 _projToPrevProj;
  column_major float4x4 _projToPrevProjNoTranslation;
  column_major float4x4 _viewProjectionTexScale;
  float4 _temporalAAJitter;
  float4 _temporalAAJitterParams;
  float4 _frustumPlanes[6];
  float4 _frustumPlanesPrev[6];
  float4 _frustumCornerDirs[4];
  float4 _screenPercentage;
  float4 _nearFarProj;
  float4 _renderingOriginPos;
  float4 _renderingOriginPosPrev;
  float4 _lodMaskRenderRate;
  float4 _terrainNormalParams;
  int4 _hiZMapInfo;
  int4 _hiZMapInfoCurrent;
  float4 _treeParams;
  uint4 _clusterSize;
  uint4 _globalLightParams;
  float4 _bevelParams;
  float4 _variableRateShadingParams;
  float4 _cavityParams;
  float4 _customRenderPassSizeInvSize;
  uint4 _impostorParams;
  float4 _clusterDecalSizeAndInvSize;
  uint4 _globalWindParams;
  float4 _windFluidVolumeParams;
  float4 _windFluidTextureParams;
  float4 _raytracingAccelerationStructureOrigin;
  float4 _debugBaseColor;
  float4 _debugNormal;
  float4 _debugMaterial;
  float4 _debugMultiplier;
  half4 _debugBaseColor16;
  half4 _debugNormal16;
  half4 _debugMaterial16;
  half4 _debugMultiplier16;
  float4 _debugCursorWorldPos;
  uint4 _debugRenderToggle01;
  uint4 _debugTreeShapeVariation;
  float4 _positionBasedDynamicsParameter;
  float _effectiveMetallicForVelvet;
  float _debugCharacterSnowRate;
  uint _systemRandomSeed;
  uint _skinnedMeshDebugFlag;
  float4 _viewPosShifted;
  float4 _viewPosShiftedPrev;
  float4 _viewTileRelativePos;
  float4 _viewTileRelativePosPrev;
  int2 _viewTileIndex;
  int2 _viewTileIndexPrev;
  float4 _worldVolume;
  float3 _diffViewPosAccurate;
  uint _isPhotosensitiveMode_isAllolwBlood;
};

#define RENODX_TONEMAP_EXTERNAL_SCENE_CONSTANT_BUFFER 1
#define RENODX_TONEMAP_SCENE_TIME_W _time.w
#include "../tonemap.hlsli"



#if 0 // Provided by tonemap.hlsli
cbuffer __3__35__0__0__ExposureConstantBuffer : register(b30, space35) {
  float4 _exposure0 : packoffset(c000.x);
  float4 _exposure1 : packoffset(c001.x);
  float4 _exposure2 : packoffset(c002.x);
  float4 _exposure3 : packoffset(c003.x);
  float4 _exposure4 : packoffset(c004.x);
};
#endif

#if 0 // Provided by tonemap.hlsli
cbuffer __3__1__0__0__GlobalPushConstants : register(b0, space1) {
  float4 _postProcessParams : packoffset(c000.x);
  float4 _postProcessParams1 : packoffset(c001.x);
  float4 _toneMapParams0 : packoffset(c002.x);
  float4 _toneMapParams1 : packoffset(c003.x);
  float4 _colorGradingParams : packoffset(c004.x);
  float4 _colorCorrectionParams : packoffset(c005.x);
  float4 _localToneMappingParams : packoffset(c006.x);
  float4 _etcParams : packoffset(c007.x);
  float4 _userImageAdjust : packoffset(c008.x);
  float4 _slopeParams : packoffset(c009.x);
  float4 _offsetParams : packoffset(c010.x);
  float4 _powerParams : packoffset(c011.x);
  int _nightToneParm : packoffset(c012.x);
  int3 _padding : packoffset(c012.y);
};
#endif

cbuffer __3__1__0__0__PostProcessSizeConstant : register(b1, space1) {
  float4 _srcTargetSizeAndInv : packoffset(c000.x);
  float4 _destTargetSizAndInv : packoffset(c001.x);
};

cbuffer __3__1__0__0__PostProcessMaterialIndex : register(b2, space1) {
  int _materialIndex : packoffset(c000.x);
  int _passIndex : packoffset(c000.y);
};

#if 0 // Provided by tonemap.hlsli
cbuffer __3__35__0__0__ColorBlindConstantBuffer : register(b46, space35) {
  float4 _colorBlind0 : packoffset(c000.x);
  float4 _colorBlind1 : packoffset(c001.x);
  float4 _colorBlind2 : packoffset(c002.x);
};
#endif

ConstantBuffer<PostProcessAbyssEnterIntro_CDStruct> BindlessParameters_PostProcessAbyssEnterIntro_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _24 = _srcTargetSizeAndInv.x * TEXCOORD.x;
  float _26 = _srcTargetSizeAndInv.y * TEXCOORD.y;
  float4 _29 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  int _42 = WaveReadLaneFirst(_materialIndex);
  int _51 = WaveReadLaneFirst(_materialIndex);
  float _59 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_51 < (uint)170000), _51, 0)) + 0u))]._cameraSinIntensity);
  int _60 = WaveReadLaneFirst(_materialIndex);
  float _80 = _time.x * WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_42 < (uint)170000), _42, 0)) + 0u))]._cameraSpeed);
  float _81 = _80 + -1.0f;
  float _83 = sin(_time.x * 0.10000000149011612f);
  float _85 = (_83 + 3.0f) + _80;
  float _86 = _80 * 0.13089969754219055f;
  float _88 = sin(_86 + 1.7000000476837158f);
  float _93 = _81 * 0.13089969754219055f;
  float _95 = sin(_93 + 1.7000000476837158f);
  float _96 = _95 * _59;
  float _99 = _96 * 2.0f;
  float _100 = (cos(_93) * _59) * _96;
  float _101 = _85 * 0.13089969754219055f;
  float _104 = sin(_101 + 1.7000000476837158f) * _59;
  float _110 = _104 - sin(_time.x * 0.0010000000474974513f);
  float _112 = ((cos(_101) * _59) * _104) + -1.0f;
  float _113 = 3.1415927410125732f / WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_60 < (uint)170000), _60, 0)) + 0u))]._cameraFov);
  float _116 = (_59 * 2.0f) * (_88 - _95);
  float _117 = (((_59 * _59) * _88) * cos(_86)) - _100;
  float _119 = rsqrt(dot(float3(_116, _117, 1.0f), float3(_116, _117, 1.0f)));
  float _120 = _119 * _116;
  float _121 = _119 * _117;
  float _122 = -0.0f - _120;
  float _124 = rsqrt(dot(float3(_119, 0.0f, _122), float3(_119, 0.0f, _122)));
  float _125 = _124 * _119;
  float _126 = _124 * _122;
  float _130 = _113 * ((_24 - (_srcTargetSizeAndInv.x * 0.5f)) / _srcTargetSizeAndInv.y);
  float _135 = _113 * ((_26 - (_srcTargetSizeAndInv.y * 0.5f)) / _srcTargetSizeAndInv.y);
  float _136 = _121 * _135;
  float _140 = ((_125 * _130) + _120) + (_126 * _136);
  float _141 = (((_125 * _119) - (_126 * _120)) * _135) + _121;
  float _142 = ((_126 * _130) + _119) - (_125 * _136);
  float _144 = rsqrt(dot(float3(_140, _141, _142), float3(_140, _141, _142)));
  float _145 = _140 * _144;
  float _146 = _141 * _144;
  float _147 = _142 * _144;
  float _150 = sin(-0.0f - _96) * 0.4000000059604645f;
  float _151 = cos(_150);
  float _152 = sin(_150);
  float _154 = mad(_152, _146, (_145 * _151));
  float _157 = mad(_151, _146, (-0.0f - (_152 * _145)));
  int _158 = WaveReadLaneFirst(_materialIndex);
  float _166 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_158 < (uint)170000), _158, 0)) + 0u))]._stardustDensity);
  float _167 = _96 * 2.6666667461395264f;
  float _168 = _100 * 1.3333333730697632f;
  float _169 = _81 * 1.3333333730697632f;
  float _170 = floor(_167);
  float _171 = floor(_168);
  float _172 = floor(_169);
  float _173 = 1.0f / _154;
  float _174 = 1.0f / _157;
  float _175 = 1.0f / _147;
  float _191 = float((int)(((int)(uint)((int)(_154 > 0.0f))) - ((int)(uint)((int)(_154 < 0.0f)))));
  float _192 = float((int)(((int)(uint)((int)(_157 > 0.0f))) - ((int)(uint)((int)(_157 < 0.0f)))));
  float _193 = float((int)(((int)(uint)((int)(_147 > 0.0f))) - ((int)(uint)((int)(_147 < 0.0f)))));
  float _194 = _166 * 30.0f;
  float _196 = _191 * 0.5f;
  float _197 = _192 * 0.5f;
  float _198 = _193 * 0.5f;
  float _213;
  float _214;
  float _215;
  float _216;
  float _217;
  float _218;
  float _219;
  float _220;
  float _221;
  float _222;
  float _223;
  float _224;
  float _225;
  int _226;
  float _323;
  float _324;
  float _325;
  float _326;
  float _327;
  float _328;
  float _329;
  float _361;
  float _362;
  float _363;
  float _365;
  float _366;
  float _367;
  float _420;
  float _421;
  float _422;
  float _423;
  float _424;
  float _425;
  int _426;
  float _501;
  float _833;
  float _834;
  float _835;
  float _836;
  float _837;
  float _838;
  int _839;
  float _914;
  float _1016;
  float _1225;
  float _1226;
  float _1227;
  float _1228;
  float _1351;
  float _1412;
  float _1413;
  float _1414;
  float _2085;
  float _2290;
  float _2291;
  float _2292;
  float _2385;
  float _2386;
  float _2387;
  float _2441;
  float _2442;
  float _2443;
  float _2462;
  float _2463;
  float _2464;
  float _2494;
  float _2495;
  float _2496;
  float _2510;
  float _2511;
  float _2512;
  if (_194 > 0.0f) {
    _213 = _170;
    _214 = _171;
    _215 = _172;
    _216 = (_173 * (((0.5f - _167) + _196) + _170));
    _217 = (_174 * (((0.5f - _168) + _197) + _171));
    _218 = (_175 * (((0.5f - _169) + _198) + _172));
    _219 = 0.0f;
    _220 = 0.0f;
    _221 = 0.0f;
    _222 = 0.0f;
    _223 = 0.0f;
    _224 = 0.0f;
    _225 = 0.0f;
    _226 = 0;
    while(true) {
      float _236 = frac(sin(dot(float3(_213, _214, _215), float3(127.0999984741211f, 311.70001220703125f, 74.69999694824219f))) * 43758.546875f);
      float _237 = frac(sin(dot(float3(_213, _214, _215), float3(269.5f, 183.3000030517578f, 246.10000610351562f))) * 43758.546875f);
      float _238 = frac(sin(dot(float3(_213, _214, _215), float3(113.5f, 271.8999938964844f, 124.5999984741211f))) * 43758.546875f);
      float _241 = _time.x * _236;
      float _261 = (_213 - _167) + min(max(((cos(_241 + _236) * 0.10000000149011612f) + _236), 0.014999999664723873f), 0.9850000143051147f);
      float _263 = (_214 - _168) + min(max(((cos(_241 + _237) * 0.10000000149011612f) + _237), 0.014999999664723873f), 0.9850000143051147f);
      float _265 = (_215 - _169) + min(max(((cos(_241 + _238) * 0.10000000149011612f) + _238), 0.014999999664723873f), 0.9850000143051147f);
      float _266 = dot(float3(_261, _263, _265), float3(_154, _157, _147));
      float _270 = _261 - (_266 * _154);
      float _271 = _263 - (_266 * _157);
      float _272 = _265 - (_266 * _147);
      bool __branch_chain_212;
      if (!(((_266 > 0.0f)) && (((_266 * 0.75f) < 50.0f)))) {
        _323 = _219;
        _324 = _220;
        _325 = _221;
        _326 = _222;
        _327 = _223;
        _328 = _224;
        _329 = _225;
        __branch_chain_212 = true;
      } else {
        float _292 = saturate((sqrt(((_270 * _270) + (_271 * _271)) + (_272 * _272)) + -0.007499999832361937f) * 133.33334350585938f);
        float _297 = 1.0f - ((_292 * _292) * (3.0f - (_292 * 2.0f)));
        float _301 = saturate((_266 - _194) / (-0.0f - _194));
        float _306 = ((_301 * _301) * (3.0f - (_301 * 2.0f))) * _297;
        float _308 = _297 * (_306 / _266);
        float _309 = _308 * ((_219 * 0.4000000059604645f) + 0.6000000238418579f);
        float _310 = _308 * ((_220 * 0.4000000059604645f) + 0.6000000238418579f);
        float _311 = _308 * ((_221 * 0.4000000059604645f) + 0.6000000238418579f);
        float _312 = 1.0f - _225;
        float _317 = (_309 * _312) + _222;
        float _318 = (_310 * _312) + _223;
        float _319 = (_311 * _312) + _224;
        float _320 = (_306 * _312) + _225;
        if (!(_320 > 0.9900000095367432f)) {
          _323 = _309;
          _324 = _310;
          _325 = _311;
          _326 = _317;
          _327 = _318;
          _328 = _319;
          _329 = _320;
          __branch_chain_212 = true;
        } else {
          _361 = _317;
          _362 = _318;
          _363 = _319;
          __branch_chain_212 = false;
        }
      }
      if (__branch_chain_212) {
        _323 = _219;
        _324 = _220;
        _325 = _221;
        _326 = _222;
        _327 = _223;
        _328 = _224;
        _329 = _225;
      }
      float _343 = (select((_217 < _216), 0.0f, 1.0f) * _191) * select((_218 < _216), 0.0f, 1.0f);
      float _345 = (select((_216 < _217), 0.0f, 1.0f) * _192) * select((_218 < _217), 0.0f, 1.0f);
      float _347 = (select((_216 < _218), 0.0f, 1.0f) * _193) * select((_217 < _218), 0.0f, 1.0f);
      if (float((int)(_226 + 1)) < _194) {
        _213 = (_343 + _213);
        _214 = (_345 + _214);
        _215 = (_347 + _215);
        _216 = ((_343 * _173) + _216);
        _217 = ((_345 * _174) + _217);
        _218 = ((_347 * _175) + _218);
        _219 = _323;
        _220 = _324;
        _221 = _325;
        _222 = _326;
        _223 = _327;
        _224 = _328;
        _225 = _329;
        _226 = (_226 + 1);
        continue;
      } else {
        _361 = _326;
        _362 = _327;
        _363 = _328;
      }
      _365 = _361;
      _366 = _362;
      _367 = _363;
      break;
    }
  } else {
    _365 = 0.0f;
    _366 = 0.0f;
    _367 = 0.0f;
  }
  int _368 = WaveReadLaneFirst(_materialIndex);
  int _377 = WaveReadLaneFirst(_materialIndex);
  float _385 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_377 < (uint)170000), _377, 0)) + 0u))]._cubeScale);
  int _386 = WaveReadLaneFirst(_materialIndex);
  float _394 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_386 < (uint)170000), _386, 0)) + 0u))]._cubeDistance);
  int _395 = WaveReadLaneFirst(_materialIndex);
  float _404 = floor(_99);
  float _405 = floor(_100);
  float _406 = floor(_81);
  _420 = _404;
  _421 = _405;
  _422 = _406;
  _423 = ((((0.5f - _99) + _196) + _404) * _173);
  _424 = ((((0.5f - _100) + _197) + _405) * _174);
  _425 = ((((1.5f - _80) + _198) + _406) * _175);
  _426 = 0;
  while(true) {
    float _427 = _420 * 0.3499999940395355f;
    float _428 = _421 * 0.3499999940395355f;
    float _429 = _422 * 0.3499999940395355f;
    float _443 = (_420 + -0.5f) + frac(sin(dot(float3(_427, _428, _429), float3(127.0999984741211f, 311.70001220703125f, 74.69999694824219f))) * 43758.546875f);
    float _445 = (_421 + -0.5f) + frac(sin(dot(float3(_427, _428, _429), float3(269.5f, 183.3000030517578f, 246.10000610351562f))) * 43758.546875f);
    float _447 = (_422 + -0.5f) + frac(sin(dot(float3(_427, _428, _429), float3(113.5f, 271.8999938964844f, 124.5999984741211f))) * 43758.546875f);
    float _451 = frac(_443 * 0.1031000018119812f);
    float _452 = frac(_445 * 0.1031000018119812f);
    float _453 = frac(_447 * 0.1031000018119812f);
    float _457 = dot(float3(_451, _452, _453), float3((_452 + 19.190000534057617f), (_453 + 19.190000534057617f), (_451 + 19.190000534057617f)));
    float _463 = frac(((_452 + _451) + (_457 * 2.0f)) * (_457 + _453));
    float _464 = _447 * 0.13089969754219055f;
    float _467 = sin(_464 + 1.7000000476837158f) * _59;
    float _472 = _443 - (_467 * 2.0f);
    float _473 = _445 - ((cos(_464) * _59) * _467);
    bool __defer_419_630 = false;
    if (!(abs(select((_473 < 0.0f), 0.5f, 0.0f) + _473) > 0.3499999940395355f) || ((abs(select((_473 < 0.0f), 0.5f, 0.0f) + _473) > 0.3499999940395355f) && (!(sqrt((_473 * _473) + (_472 * _472)) > (_394 - ((_463 * 6.0f) * exp2(log2(saturate(_425 * 0.015625f)) * 2.200000047683716f))))))) {
      __defer_419_630 = true;
    } else {
      bool _494 = (_463 < 0.3499999940395355f);
      if (!_494) {
        _501 = ((_463 + _422) + _time.x);
      } else {
        _501 = 0.0f;
      }
      float _504 = select(_494, 0.0f, ((_501 * 2.0f) + _421));
      float _505 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_395 < (uint)170000), _395, 0)) + 0u))]._cubeMinScale) * 0.25f;
      float _508 = min(max((_463 * 0.4000000059604645f), _505), _385);
      float _510 = (_99 + -0.5f) - _443;
      float _512 = (_100 + -0.5f) - _445;
      float _514 = (_80 + -1.5f) - _447;
      float _515 = cos(_501);
      float _516 = sin(_501);
      float _518 = mad(_516, _512, (_515 * _514));
      float _523 = mad(_516, _157, (_515 * _147));
      float _526 = mad(_515, _157, (-0.0f - (_147 * _516)));
      float _527 = cos(_504);
      float _528 = sin(_504);
      float _535 = mad(_528, _523, (_527 * _154));
      float _538 = mad(_527, _523, (-0.0f - (_154 * _528)));
      float _539 = 1.0f / _535;
      float _540 = 1.0f / _526;
      float _541 = 1.0f / _538;
      float _542 = _539 * mad(_528, _518, (_527 * _510));
      float _543 = _540 * mad(_515, _512, (-0.0f - (_514 * _516)));
      float _544 = _541 * mad(_527, _518, (-0.0f - (_510 * _528)));
      float _548 = abs(_539) * _508;
      float _549 = abs(_540) * _508;
      float _550 = abs(_541) * _508;
      float _554 = (-0.0f - _542) - _548;
      float _555 = (-0.0f - _543) - _549;
      float _556 = (-0.0f - _544) - _550;
      float _561 = max(max(_554, _555), _556);
      float _563 = min(min((_548 - _542), (_549 - _543)), (_550 - _544));
      float _596 = (select((_554 < _555), 0.0f, 1.0f) * float((int)(((int)(uint)((int)(_535 < 0.0f))) - ((int)(uint)((int)(_535 > 0.0f)))))) * select((_554 < _556), 0.0f, 1.0f);
      float _598 = (select((_555 < _554), 0.0f, 1.0f) * float((int)(((int)(uint)((int)(_526 < 0.0f))) - ((int)(uint)((int)(_526 > 0.0f)))))) * select((_555 < _556), 0.0f, 1.0f);
      float _599 = (select((_556 < _554), 0.0f, 1.0f) * float((int)(((int)(uint)((int)(_538 < 0.0f))) - ((int)(uint)((int)(_538 > 0.0f)))))) * select((_556 < _555), 0.0f, 1.0f);
      float _600 = -0.0f - _501;
      float _601 = cos(_600);
      float _602 = sin(_600);
      float _604 = mad(_602, _598, (_599 * _601));
      float _605 = -0.0f - _602;
      float _607 = mad(_601, _598, (_599 * _605));
      float _609 = mad(_602, _607, (_604 * _601));
      float _611 = mad(_601, _607, (_604 * _605));
      float _612 = -0.0f - _504;
      float _613 = cos(_612);
      float _614 = sin(_612);
      float _616 = mad(_614, _609, (_613 * _596));
      float _619 = mad(_613, _609, (-0.0f - (_596 * _614)));
      float _621 = mad(_614, _619, (_616 * _613));
      float _624 = mad(_613, _619, (-0.0f - (_614 * _616)));
      float _628 = select((((_561 > _563)) || ((_563 < 0.0f))), 0.0f, _561);
      if (_628 > 0.0f) {
        float _664 = (_628 * _154) + _99;
        float _665 = (_628 * _157) + _100;
        float _666 = (_628 * _147) + _81;
        int _667 = WaveReadLaneFirst(_materialIndex);
        float _677 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_667 < (uint)170000), _667, 0)) + 0u))]._lightColor.x);
        float _678 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_667 < (uint)170000), _667, 0)) + 0u))]._lightColor.y);
        float _679 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_667 < (uint)170000), _667, 0)) + 0u))]._lightColor.z);
        float _681 = rsqrt(dot(float3(_677, _678, _679), float3(_677, _678, _679)));
        float _687 = max(dot(float3((_681 * _677), (_681 * _678), (_681 * _679)), float3(_621, _611, _624)), 0.05000000074505806f) * 0.009999999776482582f;
        int _688 = WaveReadLaneFirst(_materialIndex);
        float _698 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_688 < (uint)170000), _688, 0)) + 0u))]._ambientColor.x);
        float _699 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_688 < (uint)170000), _688, 0)) + 0u))]._ambientColor.y);
        float _700 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_688 < (uint)170000), _688, 0)) + 0u))]._ambientColor.z);
        float _725 = max(0.0f, _611);
        float _729 = (_110 * 2.0f) - _664;
        float _730 = _112 - _665;
        float _731 = _85 - _666;
        float _733 = rsqrt(dot(float3(_729, _730, _731), float3(_729, _730, _731)));
        float _734 = _733 * _729;
        float _735 = _733 * _730;
        float _736 = _733 * _731;
        float _742 = sqrt(((_729 * _729) + (_730 * _730)) + (_731 * _731));
        float _743 = _742 * _742;
        float _750 = -0.0f - _734;
        float _751 = -0.0f - _735;
        float _752 = -0.0f - _736;
        float _754 = dot(float3(_750, _751, _752), float3(_621, _611, _624)) * 2.0f;
        float _779 = ((_time.x * 8.0f) + _666) * 0.02500000037252903f;
        float _783 = frac(abs(_779));
        float _790 = _664 - (_154 * 0.009999999776482582f);
        float _791 = _665 - (_157 * 0.009999999776482582f);
        float _792 = _666 - (_147 * 0.009999999776482582f);
        float _793 = floor(_790);
        float _794 = floor(_791);
        float _795 = floor(_792);
        float _796 = 1.0f / _734;
        float _797 = 1.0f / _735;
        float _798 = 1.0f / _736;
        float _814 = float((int)(((int)(uint)((int)(_734 > 0.0f))) - ((int)(uint)((int)(_734 < 0.0f)))));
        float _815 = float((int)(((int)(uint)((int)(_735 > 0.0f))) - ((int)(uint)((int)(_735 < 0.0f)))));
        float _816 = float((int)(((int)(uint)((int)(_736 > 0.0f))) - ((int)(uint)((int)(_736 < 0.0f)))));
        _833 = _793;
        _834 = _794;
        _835 = _795;
        _836 = (_796 * (((0.5f - _790) + (_814 * 0.5f)) + _793));
        _837 = (_797 * (((0.5f - _791) + (_815 * 0.5f)) + _794));
        _838 = (_798 * (((0.5f - _792) + (_816 * 0.5f)) + _795));
        _839 = 0;
        while(true) {
          float _840 = _833 * 0.3499999940395355f;
          float _841 = _834 * 0.3499999940395355f;
          float _842 = _835 * 0.3499999940395355f;
          float _856 = (_833 + -0.5f) + frac(sin(dot(float3(_840, _841, _842), float3(127.0999984741211f, 311.70001220703125f, 74.69999694824219f))) * 43758.546875f);
          float _858 = (_834 + -0.5f) + frac(sin(dot(float3(_840, _841, _842), float3(269.5f, 183.3000030517578f, 246.10000610351562f))) * 43758.546875f);
          float _860 = (_835 + -0.5f) + frac(sin(dot(float3(_840, _841, _842), float3(113.5f, 271.8999938964844f, 124.5999984741211f))) * 43758.546875f);
          float _864 = frac(_856 * 0.1031000018119812f);
          float _865 = frac(_858 * 0.1031000018119812f);
          float _866 = frac(_860 * 0.1031000018119812f);
          float _870 = dot(float3(_864, _865, _866), float3((_865 + 19.190000534057617f), (_866 + 19.190000534057617f), (_864 + 19.190000534057617f)));
          float _876 = frac(((_865 + _864) + (_870 * 2.0f)) * (_870 + _866));
          float _877 = _860 * 0.13089969754219055f;
          float _880 = sin(_877 + 1.7000000476837158f) * _59;
          float _885 = _856 - (_880 * 2.0f);
          float _886 = _858 - ((cos(_877) * _59) * _880);
          bool __defer_832_981 = false;
          if (!(abs(select((_886 < 0.0f), 0.5f, 0.0f) + _886) > 0.3499999940395355f) || ((abs(select((_886 < 0.0f), 0.5f, 0.0f) + _886) > 0.3499999940395355f) && (!(sqrt((_886 * _886) + (_885 * _885)) > (_394 - ((_876 * 6.0f) * exp2(log2(saturate(_838 * 0.015625f)) * 2.200000047683716f))))))) {
            __defer_832_981 = true;
          } else {
            bool _907 = (_876 < 0.3499999940395355f);
            if (!_907) {
              _914 = ((_876 + _835) + _time.x);
            } else {
              _914 = 0.0f;
            }
            float _917 = select(_907, 0.0f, ((_914 * 2.0f) + _834));
            float _920 = min(max((_876 * 0.4000000059604645f), _505), _385);
            float _922 = (_790 + -0.5f) - _856;
            float _924 = (_791 + -0.5f) - _858;
            float _926 = (_792 + -0.5f) - _860;
            float _927 = cos(_914);
            float _928 = sin(_914);
            float _930 = mad(_928, _924, (_927 * _926));
            float _935 = mad(_928, _735, (_927 * _736));
            float _939 = cos(_917);
            float _940 = sin(_917);
            float _951 = 1.0f / mad(_940, _935, (_939 * _734));
            float _952 = 1.0f / mad(_927, _735, (-0.0f - (_736 * _928)));
            float _953 = 1.0f / mad(_939, _935, (-0.0f - (_734 * _940)));
            float _954 = _951 * mad(_940, _930, (_939 * _922));
            float _955 = _952 * mad(_927, _924, (-0.0f - (_926 * _928)));
            float _956 = _953 * mad(_939, _930, (-0.0f - (_922 * _940)));
            float _960 = abs(_951) * _920;
            float _961 = abs(_952) * _920;
            float _962 = abs(_953) * _920;
            float _973 = max(max(((-0.0f - _954) - _960), ((-0.0f - _955) - _961)), ((-0.0f - _956) - _962));
            float _975 = min(min((_960 - _954), (_961 - _955)), (_962 - _956));
            float _979 = select((((_973 > _975)) || ((_975 < 0.0f))), 0.0f, _973);
            if (_979 > 0.0f) {
              _1016 = select((_979 < _742), 0.0f, 1.0f);
            } else {
              __defer_832_981 = true;
            }
          }
          if (__defer_832_981) {
            float _995 = (select((_837 < _836), 0.0f, 1.0f) * _814) * select((_838 < _836), 0.0f, 1.0f);
            float _997 = (select((_836 < _837), 0.0f, 1.0f) * _815) * select((_838 < _837), 0.0f, 1.0f);
            float _999 = (select((_836 < _838), 0.0f, 1.0f) * _816) * select((_837 < _838), 0.0f, 1.0f);
            if ((int)(_839 + 1) < (int)64) {
              _833 = (_995 + _833);
              _834 = (_997 + _834);
              _835 = (_999 + _835);
              _836 = ((_995 * _796) + _836);
              _837 = ((_997 * _797) + _837);
              _838 = ((_999 * _798) + _838);
              _839 = (_839 + 1);
              continue;
            } else {
              _1016 = 1.0f;
            }
          }
          int _1017 = WaveReadLaneFirst(_materialIndex);
          float _1027 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1017 < (uint)170000), _1017, 0)) + 0u))]._globalColor.x);
          float _1028 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1017 < (uint)170000), _1017, 0)) + 0u))]._globalColor.y);
          float _1029 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1017 < (uint)170000), _1017, 0)) + 0u))]._globalColor.z);
          float _1054 = dot(float3(_734, _735, _736), float3(_621, _611, _624));
          float _1056 = max(_1054, 0.05000000074505806f) * (1.0f / ((_743 * 0.05000000074505806f) + 1.0f));
          float _1062 = 1.0f / ((_743 * 0.10000000149011612f) + 1.0f);
          int _1063 = WaveReadLaneFirst(_materialIndex);
          float _1073 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1063 < (uint)170000), _1063, 0)) + 0u))]._mainTintColor.x);
          float _1074 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1063 < (uint)170000), _1063, 0)) + 0u))]._mainTintColor.y);
          float _1075 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1063 < (uint)170000), _1063, 0)) + 0u))]._mainTintColor.z);
          float _1100 = max(_1054, 0.009999999776482582f);
          float _1101 = _1100 * _1062;
          int _1111 = WaveReadLaneFirst(_materialIndex);
          float _1121 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1111 < (uint)170000), _1111, 0)) + 0u))]._mainTintColor.x);
          float _1122 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1111 < (uint)170000), _1111, 0)) + 0u))]._mainTintColor.y);
          float _1123 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1111 < (uint)170000), _1111, 0)) + 0u))]._mainTintColor.z);
          float _1148 = _1062 * exp2(log2(max(dot(float3((_750 - (_754 * _621)), (_751 - (_754 * _611)), (_752 - (_754 * _624))), float3((-0.0f - _154), (-0.0f - _157), (-0.0f - _147))), 0.0f)) * 100.0f);
          int _1152 = WaveReadLaneFirst(_materialIndex);
          float _1162 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1152 < (uint)170000), _1152, 0)) + 0u))]._waveColor.x);
          float _1163 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1152 < (uint)170000), _1152, 0)) + 0u))]._waveColor.y);
          float _1164 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1152 < (uint)170000), _1152, 0)) + 0u))]._waveColor.z);
          float _1190 = _1100 * (_1062 * 2.0f);
          float _1197 = exp2(log2(_1148 * 0.3185468018054962f) * 0.8333333134651184f);
          float _1202 = select(((select((_779 >= (-0.0f - _779)), _783, (-0.0f - _783)) * 40.0f) > 4.0f), 0.0f, 1.0f);
          float _1207 = (_628 * 0.10000000149011612f) + 1.0f;
          _1225 = (((((_725 * select((_698 < 0.040449999272823334f), (_698 * 0.07739938050508499f), exp2(log2((_698 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f))) + _687) + (((_1101 * select((_1073 < 0.040449999272823334f), (_1073 * 0.07739938050508499f), exp2(log2((_1073 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f))) + (_1056 * select((_1027 < 0.040449999272823334f), (_1027 * 0.07739938050508499f), exp2(log2((_1027 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)))) * _1016)) + (select((_1121 < 0.040449999272823334f), (_1121 * 0.07739938050508499f), exp2(log2((_1121 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)) * _1148)) + (((_1197 + (_1190 * select((_1162 < 0.040449999272823334f), (_1162 * 0.07739938050508499f), exp2(log2((_1162 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)))) * _1202) / _1207));
          _1226 = (((((_725 * select((_699 < 0.040449999272823334f), (_699 * 0.07739938050508499f), exp2(log2((_699 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f))) + _687) + (((_1101 * select((_1074 < 0.040449999272823334f), (_1074 * 0.07739938050508499f), exp2(log2((_1074 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f))) + (_1056 * select((_1028 < 0.040449999272823334f), (_1028 * 0.07739938050508499f), exp2(log2((_1028 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)))) * _1016)) + (select((_1122 < 0.040449999272823334f), (_1122 * 0.07739938050508499f), exp2(log2((_1122 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)) * _1148)) + (((_1197 + (_1190 * select((_1163 < 0.040449999272823334f), (_1163 * 0.07739938050508499f), exp2(log2((_1163 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)))) * _1202) / _1207));
          _1227 = (((((select((_700 < 0.040449999272823334f), (_700 * 0.07739938050508499f), exp2(log2((_700 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)) * _725) + _687) + (((_1101 * select((_1075 < 0.040449999272823334f), (_1075 * 0.07739938050508499f), exp2(log2((_1075 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f))) + (_1056 * select((_1029 < 0.040449999272823334f), (_1029 * 0.07739938050508499f), exp2(log2((_1029 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)))) * _1016)) + (select((_1123 < 0.040449999272823334f), (_1123 * 0.07739938050508499f), exp2(log2((_1123 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)) * _1148)) + ((((_1190 * select((_1164 < 0.040449999272823334f), (_1164 * 0.07739938050508499f), exp2(log2((_1164 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f))) + _1197) * _1202) / _1207));
          _1228 = _628;
          break;
        }
      } else {
        __defer_419_630 = true;
      }
    }
    if (__defer_419_630) {
      float _644 = (select((_424 < _423), 0.0f, 1.0f) * _191) * select((_425 < _423), 0.0f, 1.0f);
      float _646 = (select((_423 < _424), 0.0f, 1.0f) * _192) * select((_425 < _424), 0.0f, 1.0f);
      float _648 = (select((_423 < _425), 0.0f, 1.0f) * _193) * select((_424 < _425), 0.0f, 1.0f);
      if ((int)(_426 + 1) < (int)64) {
        _420 = (_644 + _420);
        _421 = (_646 + _421);
        _422 = (_648 + _422);
        _423 = ((_644 * _173) + _423);
        _424 = ((_646 * _174) + _424);
        _425 = ((_648 * _175) + _425);
        _426 = (_426 + 1);
        continue;
      } else {
        _1225 = 0.0f;
        _1226 = 0.0f;
        _1227 = 0.0f;
        _1228 = 50.0f;
      }
    }
    int _1229 = WaveReadLaneFirst(_materialIndex);
    float _1239 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1229 < (uint)170000), _1229, 0)) + 0u))]._fogColor.x);
    float _1240 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1229 < (uint)170000), _1229, 0)) + 0u))]._fogColor.y);
    float _1241 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1229 < (uint)170000), _1229, 0)) + 0u))]._fogColor.z);
    float _1269 = exp2(log2(_1228 * 0.019999999552965164f) * 6.0f);
    float _1279 = ((_1269 * (select((_1239 < 0.040449999272823334f), (_1239 * 0.07739938050508499f), exp2(log2((_1239 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)) - _1225)) + _1225) * 1.2000000476837158f;
    float _1280 = ((_1269 * (select((_1240 < 0.040449999272823334f), (_1240 * 0.07739938050508499f), exp2(log2((_1240 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)) - _1226)) + _1226) * 1.2000000476837158f;
    float _1281 = ((_1269 * (select((_1241 < 0.040449999272823334f), (_1241 * 0.07739938050508499f), exp2(log2((_1241 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)) - _1227)) + _1227) * 1.2000000476837158f;
    int _1282 = WaveReadLaneFirst(_materialIndex);
    float _1292 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1282 < (uint)170000), _1282, 0)) + 0u))]._centerGlowColor.x);
    float _1293 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1282 < (uint)170000), _1282, 0)) + 0u))]._centerGlowColor.y);
    float _1294 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1282 < (uint)170000), _1282, 0)) + 0u))]._centerGlowColor.z);
    int _1325 = WaveReadLaneFirst(_materialIndex);
    float _1334 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1325 < (uint)170000), _1325, 0)) + 0u))]._centerGlowRadius) * ((sin(_time.x * 5.0f) * 0.050000011920928955f) + 0.949999988079071f);
    float _1336 = (_96 - _110) * 2.0f;
    float _1337 = _100 - _112;
    float _1338 = -4.0f - _83;
    float _1339 = dot(float3(_1336, _1337, _1338), float3(_154, _157, _147));
    float _1344 = (_1339 * _1339) - (dot(float3(_1336, _1337, _1338), float3(_1336, _1337, _1338)) - (_1334 * _1334));
    if (!(_1344 < 0.0f)) {
      _1351 = ((-0.0f - _1339) - sqrt(_1344));
    } else {
      _1351 = 0.0f;
    }
    if (((_1351 > 0.0f)) && ((_1351 < _1228))) {
      float _1356 = 50.0f / _1334;
      float _1357 = _1336 / _1334;
      float _1358 = _1337 / _1334;
      float _1359 = _1338 / _1334;
      float _1360 = dot(float3(_154, _157, _147), float3(_1357, _1358, _1359));
      float _1362 = dot(float3(_1357, _1358, _1359), float3(_1357, _1358, _1359)) + -1.0f;
      float _1364 = (_1360 * _1360) - _1362;
      if (!(_1364 < 0.0f)) {
        float _1367 = sqrt(_1364);
        float _1369 = (-0.0f - _1360) - _1367;
        float _1370 = _1367 - _1360;
        if (!(((_1370 < 0.0f)) || ((_1369 > _1356)))) {
          float _1375 = max(_1369, 0.0f);
          float _1376 = min(_1370, _1356);
          float _1389 = ((((-0.0f - _1362) - (_1376 * _1360)) + ((_1376 * _1376) * -0.3333333432674408f)) * _1376) + (((((_1375 * 0.3333333432674408f) + _1360) * _1375) + _1362) * _1375);
          float _1390 = _1389 * 0.75f;
          if (_1390 > 0.0f) {
            float _1393 = _1390 * _1390;
            float _1395 = _1390 * (_1393 * _1393);
            float _1396 = _1395 * _1395;
            float _1398 = (_1396 * _1396) * 5.0f;
            float _1402 = _1390 * _1389;
            float _1404 = _1402 * 0.22500000894069672f;
            _1412 = (((_1398 * select((_1292 < 0.040449999272823334f), (_1292 * 0.07739938050508499f), exp2(log2((_1292 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f))) + _1279) + (_1402 * 0.07500000298023224f));
            _1413 = (((_1398 * select((_1293 < 0.040449999272823334f), (_1293 * 0.07739938050508499f), exp2(log2((_1293 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f))) + _1280) + _1404);
            _1414 = (((_1398 * select((_1294 < 0.040449999272823334f), (_1294 * 0.07739938050508499f), exp2(log2((_1294 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f))) + _1281) + _1404);
          } else {
            _1412 = _1279;
            _1413 = _1280;
            _1414 = _1281;
          }
        } else {
          _1412 = _1279;
          _1413 = _1280;
          _1414 = _1281;
        }
      } else {
        _1412 = _1279;
        _1413 = _1280;
        _1414 = _1281;
      }
    } else {
      _1412 = _1279;
      _1413 = _1280;
      _1414 = _1281;
    }
    int _1418 = WaveReadLaneFirst(_materialIndex);
    float _1426 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1418 < (uint)170000), _1418, 0)) + 0u))]._tunnelTotal);
    float _1430 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_368 < (uint)170000), _368, 0)) + 0u))]._stardustIntensity) * _166;
    float _1465 = (_24 - (_srcTargetSizeAndInv.x * 0.5f)) / _srcTargetSizeAndInv.y;
    float _1466 = (_26 - (_srcTargetSizeAndInv.y * 0.5f)) / _srcTargetSizeAndInv.y;
    float _1467 = _1465 * 1.5f;
    float _1468 = _1466 * 1.5f;
    float _1472 = sqrt((_1468 * _1468) + (_1467 * _1467));
    float _1484 = frac((sin((_1466 * 0.15000000596046448f) + (_1465 * 25.5f)) * 10000.0f) * (abs(sin((_1466 * 19.5f) + _1467)) + 0.10000000149011612f));
    float _1489 = _time.x * 0.5f;
    float _1490 = _1489 + (_1465 * 22.5f);
    float _1491 = _1489 + (_1466 * 22.5f);
    float _1492 = floor(_1490);
    float _1493 = floor(_1491);
    float _1494 = frac(_1490);
    float _1495 = frac(_1491);
    float _1496 = _1492 * 17.0f;
    float _1497 = _1493 * 0.10000000149011612f;
    float _1501 = _1493 * 13.0f;
    float _1507 = frac((sin(_1497 + _1496) * 10000.0f) * (abs(sin(_1501 + _1492)) + 0.10000000149011612f));
    float _1508 = _1492 + 1.0f;
    float _1509 = _1508 * 17.0f;
    float _1518 = frac((sin(_1509 + _1497) * 10000.0f) * (abs(sin(_1501 + _1508)) + 0.10000000149011612f));
    float _1519 = _1493 + 1.0f;
    float _1520 = _1519 * 0.10000000149011612f;
    float _1524 = _1519 * 13.0f;
    float _1546 = (_1494 * _1494) * (3.0f - (_1494 * 2.0f));
    float _1558 = (lerp(_1507, _1518, _1546)) + (((_1495 * _1495) * (3.0f - (_1495 * 2.0f))) * (((frac((sin(_1520 + _1509) * 10000.0f) * (abs(sin(_1524 + _1508)) + 0.10000000149011612f)) - _1518) * _1546) + ((frac((sin(_1520 + _1496) * 10000.0f) * (abs(sin(_1524 + _1492)) + 0.10000000149011612f)) - _1507) * (1.0f - _1546))));
    int _1559 = WaveReadLaneFirst(_materialIndex);
    float _1567 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1559 < (uint)170000), _1559, 0)) + 0u))]._anamorphicWidth);
    float _1569 = (_1567 * 0.8999999761581421f) + 0.10999999940395355f;
    float _1573 = saturate((_1472 - _1569) / (-0.0f - _1569));
    float _1579 = saturate((cos(_1467) * 0.4000000059604645f) + -1.0f);
    float _1583 = (_1579 * _1579) * (3.0f - (_1579 * 2.0f));
    float _1591 = saturate(((abs(_1583 + _1468) + -0.03999999910593033f) + abs(_1468 - _1583)) * -25.0f);
    float _1594 = _1573 * _1591;
    float _1597 = ((3.0f - (_1591 * 2.0f)) * (3.0f - (_1573 * 2.0f))) * (_1594 * _1594);
    float _1599 = (_1567 * 0.5f) + 0.11999999731779099f;
    float _1600 = _1467 + -0.07999999821186066f;
    float _1601 = _1468 + 0.004999999888241291f;
    float _1609 = saturate((sqrt((_1601 * _1601) + (_1600 * _1600)) - _1599) / (-0.0f - _1599));
    float _1615 = saturate((cos(_1600) * 0.4000000059604645f) + -1.0f);
    float _1619 = (_1615 * _1615) * (3.0f - (_1615 * 2.0f));
    float _1627 = saturate(((abs(_1619 + _1601) + -0.017999999225139618f) + abs(_1601 - _1619)) * -55.55555725097656f);
    float _1630 = _1609 * _1627;
    float _1633 = ((3.0f - (_1627 * 2.0f)) * (3.0f - (_1609 * 2.0f))) * (_1630 * _1630);
    float _1635 = (_1567 * 0.699999988079071f) + 0.12999999523162842f;
    float _1636 = _1467 + 0.09000000357627869f;
    float _1637 = _1468 + -0.004999999888241291f;
    float _1645 = saturate((sqrt((_1637 * _1637) + (_1636 * _1636)) - _1635) / (-0.0f - _1635));
    float _1651 = saturate((cos(_1636) * 0.4000000059604645f) + -1.0f);
    float _1655 = (_1651 * _1651) * (3.0f - (_1651 * 2.0f));
    float _1663 = saturate(((abs(_1655 + _1637) + -0.014299999922513962f) + abs(_1637 - _1655)) * -69.93006896972656f);
    float _1666 = _1645 * _1663;
    float _1670 = _1465 * 2.25f;
    float _1671 = _1466 * 2.25f;
    float _1674 = (_1558 * 0.07999999821186066f) + 0.15000000596046448f;
    float _1678 = saturate((abs(_1671) - _1674) / (-0.0f - _1674));
    float _1682 = sqrt((_1671 * _1671) + (_1670 * _1670));
    float _1685 = saturate((_1682 + -0.800000011920929f) * -0.7692307829856873f);
    float _1701 = max(0.8999999761581421f, frac(frac((sin(_time.x * 8.550000190734863f) * 10000.0f) * (abs(sin(_time.x * 7.0f)) + 0.10000000149011612f)))) * 0.07999999821186066f;
    float _1706 = saturate(((_1682 + -0.10000000149011612f) - _1701) / (-0.12000000476837158f - _1701));
    float _1717 = saturate(((abs(_1670) * abs(_1466 * 1.6875f)) + -0.07000000029802322f) * -5.882352828979492f);
    float _1721 = (_1678 * _1685) * _1717;
    float _1727 = (((3.0f - (_1685 * 2.0f)) * (15.0f - (_1678 * 10.0f))) * (3.0f - (_1717 * 2.0f))) * (_1721 * _1721);
    float _1731 = _1558 * -0.014999999664723873f;
    float _1732 = _1731 + (_1465 * 2.8499999046325684f);
    float _1733 = _1731 + (_1466 * 2.8499999046325684f);
    float _1737 = sqrt((_1732 * _1732) + (_1733 * _1733));
    float _1740 = saturate((_1737 + -1.0f) * -1.4285714626312256f);
    float _1748 = saturate(((((_1740 * _1740) * _1737) * (3.0f - (_1740 * 2.0f))) + -0.10000000149011612f) * 2.5f);
    float _1751 = abs(_1467);
    float _1753 = atan(_1468 / _1751);
    bool _1756 = (_1751 < 0.0f);
    bool _1757 = (_1751 == 0.0f);
    bool _1758 = (_1468 >= 0.0f);
    bool _1759 = (_1468 < 0.0f);
    float _1772 = abs(-0.0f - _1467);
    float _1774 = atan(_1468 / _1772);
    bool _1777 = (_1772 < 0.0f);
    bool _1778 = (_1772 == 0.0f);
    float _1794 = saturate(-0.0f - (_1472 + -1.0f));
    int _1799 = WaveReadLaneFirst(_materialIndex);
    int _1820 = WaveReadLaneFirst(_materialIndex);
    float _1831 = (((lerp(_1484, 1.0f, 0.9700000286102295f)) * 0.8999999761581421f) * exp2(log2(((abs(sin(select(((_1758) && (_1778)), 1.2566370964050293f, select(((_1759) && (_1778)), -1.2566370964050293f, (select(((_1759) && (_1777)), (_1774 + -3.1415927410125732f), select(((_1758) && (_1777)), (_1774 + 3.1415927410125732f), _1774)) * 0.800000011920929f))))) + abs(sin(select(((_1758) && (_1757)), 1.0995573997497559f, select(((_1759) && (_1757)), -1.0995573997497559f, (select(((_1759) && (_1756)), (_1753 + -3.1415927410125732f), select(((_1758) && (_1756)), (_1753 + 3.1415927410125732f), _1753)) * 0.699999988079071f)))))) * 0.5f) * (((_1794 * _1794) * (3.0f - (_1794 * 2.0f))) - ((((_1748 * _1748) * 0.4000000059604645f) * (3.0f - (_1748 * 2.0f))) * WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1799 < (uint)170000), _1799, 0)) + 0u))]._blubIntensity)))) * 2.5f)) * WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1820 < (uint)170000), _1820, 0)) + 0u))]._middleHaloIntensity);
    int _1853 = WaveReadLaneFirst(_materialIndex);
    int _1862 = WaveReadLaneFirst(_materialIndex);
    float _1871 = (_1727 * _1727) * WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1862 < (uint)170000), _1862, 0)) + 0u))]._streakGlowIntensity);
    float _1874 = ((_1706 * _1706) * (3.0f - (_1706 * 2.0f))) * WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1853 < (uint)170000), _1853, 0)) + 0u))]._centerpoint);
    float _1880 = exp2(log2(_1874 * 1.2000000476837158f) * 5.0f);
    float _1885 = exp2(log2(_1874 * 1.100000023841858f) * 24.0f);
    float _1895 = _1880 + (_1874 * 0.20000000298023224f);
    float _1897 = (_1871 * 0.04965713247656822f) + (_1597 * 0.010022826492786407f);
    float _1903 = (((3.0f - (_1663 * 2.0f)) * (3.0f - (_1645 * 2.0f))) * (_1666 * _1666)) + _1633;
    int _1925 = WaveReadLaneFirst(_materialIndex);
    float _1933 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1925 < (uint)170000), _1925, 0)) + 0u))]._anamorphicIntensity);
    float _1943 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
    float _1947 = max(0.0f, (_1943 * (((_1426 * saturate(_1412)) + ((_365 * 5.0f) * _1430)) + (_1933 * exp2(log2(((((_1897 + (_1633 * 0.033104754984378815f)) + (((_1831 * 0.16689524054527283f) + 0.033104754984378815f) * _1831)) + _1885) + (_1895 * 0.07323896884918213f)) * 2.0f))))));
    float _1948 = max(0.0f, (_1943 * (((_1426 * saturate(_1413)) + ((_366 * 7.0f) * _1430)) + (_1933 * exp2(log2(((((_1897 + (_1903 * 0.033104754984378815f)) + ((0.07323896884918213f - (_1831 * 0.02323896810412407f)) * _1831)) + _1885) + (_1895 * 0.21404112875461578f)) * 2.0f))))));
    float _1949 = max(0.0f, (_1943 * (((_1426 * saturate(_1414)) + ((_367 * 9.0f) * _1430)) + (_1933 * exp2(log2((((((((_1903 * 0.07323896884918213f) + (_1597 * 0.033104754984378815f)) + ((0.13286834955215454f - (_1831 * 0.08286835253238678f)) * _1831)) + (_1874 * 0.06370936334133148f)) + (_1871 * 0.1098584532737732f)) + (_1880 * 0.6038274168968201f)) + _1885) * 2.0f))))));
    int _1950 = WaveReadLaneFirst(_materialIndex);
    int _1959 = WaveReadLaneFirst(_materialIndex);
    float _1973 = (1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1959 < (uint)170000), _1959, 0)) + 0u))]._borderWidth)) * 0.5f;
    float _1976 = max((abs(TEXCOORD.x + -0.5f) - _1973), 0.0f);
    float _1977 = max((abs(TEXCOORD.y + -0.5f) - _1973), 0.0f);
    int _1984 = WaveReadLaneFirst(_materialIndex);
    int _1992 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1984 < (uint)170000), _1984, 0)) + 0u))]._borderColor);
    float _1995 = float((uint)((uint)(((uint)((uint)(_1992)) >> 16) & 255)));
    float _1998 = float((uint)((uint)(((uint)((uint)(_1992)) >> 8) & 255)));
    float _2000 = float((uint)((uint)(_1992 & 255)));
    float _2030 = max(0.0010000000474974513f, _exposure0.x);
    int _2034 = WaveReadLaneFirst(_materialIndex);
    float _2043 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_2034 < (uint)170000), _2034, 0)) + 0u))]._borderRatio) * saturate(sqrt((_1977 * _1977) + (_1976 * _1976)) / WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1950 < (uint)170000), _1950, 0)) + 0u))]._borderSmoothness));
    float _2050 = (_2043 * ((select(((_1995 * 0.003921568859368563f) < 0.040449999272823334f), (_1995 * 0.0003035269910469651f), exp2(log2((_1995 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _2030) - _1947)) + _1947;
    float _2051 = (_2043 * ((select(((_1998 * 0.003921568859368563f) < 0.040449999272823334f), (_1998 * 0.0003035269910469651f), exp2(log2((_1998 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _2030) - _1948)) + _1948;
    float _2052 = (_2043 * ((select(((_2000 * 0.003921568859368563f) < 0.040449999272823334f), (_2000 * 0.0003035269910469651f), exp2(log2((_2000 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _2030) - _1949)) + _1949;
    int _2053 = WaveReadLaneFirst(_materialIndex);
    float _2062 = saturate(WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_2053 < (uint)170000), _2053, 0)) + 0u))]._fadeRatio));
    float _2069 = (_2062 * (_29.x - _2050)) + _2050;
    float _2070 = (_2062 * (_29.y - _2051)) + _2051;
    float _2071 = (_2062 * (_29.z - _2052)) + _2052;
    uint _2072 = uint(SV_Position.y);
    if (_etcParams.y == 1.0f) {
      uint2 _2079 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_2072), 0));
      _2085 = (float((uint)((uint)(_2079.x & 127))) + 0.5f);
    } else {
      _2085 = 1.0f;
    }
    bool _2088 = (_localToneMappingParams.w > 0.0f);
    if (_2088) {
      float3 output_color = TonemapReplacer(float3(_2069, _2070, _2071));
      _2441 = output_color.x;
      _2442 = output_color.y;
      _2443 = output_color.z;
    } else {
      _2441 = _2069;
      _2442 = _2070;
      _2443 = _2071;
    }
    if (_etcParams.y > 1.0f) {
      float _2452 = abs((TEXCOORD.x * 2.0f) + -1.0f);
      float _2453 = abs((TEXCOORD.y * 2.0f) + -1.0f);
      float _2457 = saturate(1.0f - (dot(float2(_2452, _2453), float2(_2452, _2453)) * saturate(_etcParams.y + -1.0f)));
      _2462 = (_2457 * _2441);
      _2463 = (_2457 * _2442);
      _2464 = (_2457 * _2443);
    } else {
      _2462 = _2441;
      _2463 = _2442;
      _2464 = _2443;
    }
    if ((_2088) && ((_etcParams.z > 0.0f))) {
      _2494 = select((_2462 <= 0.0031308000907301903f), (_2462 * 12.920000076293945f), (((pow(_2462, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
      _2495 = select((_2463 <= 0.0031308000907301903f), (_2463 * 12.920000076293945f), (((pow(_2463, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
      _2496 = select((_2464 <= 0.0031308000907301903f), (_2464 * 12.920000076293945f), (((pow(_2464, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    } else {
      _2494 = _2462;
      _2495 = _2463;
      _2496 = _2464;
    }
    if (!(!(_etcParams.y >= 1.0f))) {
      float _2501 = float((uint)_2072);
      if (!(_2501 < _viewDir.w)) {
        if (!(_2501 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
          _2510 = _2494;
          _2511 = _2495;
          _2512 = _2496;
        } else {
          _2510 = 0.0f;
          _2511 = 0.0f;
          _2512 = 0.0f;
        }
      } else {
        _2510 = 0.0f;
        _2511 = 0.0f;
        _2512 = 0.0f;
      }
    } else {
      _2510 = _2494;
      _2511 = _2495;
      _2512 = _2496;
    }
    SV_Target.x = _2510;
    SV_Target.y = _2511;
    SV_Target.z = _2512;
    SV_Target.w = _2085;
    break;
  }
  return SV_Target;
}