#include "../tonemap.hlsli"

struct PostProcessAbyssEnterIntro_CDStruct {
  float _cubeScale;
  float _cameraSpeed;
  float _cameraSinIntensity;
  float3 _screenFadeColor;
  float _screenFadeRatio;
  float3 _fogColor;
  float3 _ambientColor;
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


Texture2D<float4> __3__36__0__0__g_sceneColor : register(t33, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t38, space36);

cbuffer __3__35__0__0__SceneConstantBuffer : register(b14, space35) {
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

#if 0
cbuffer __3__35__0__0__ExposureConstantBuffer : register(b29, space35) {
  float4 _exposure0 : packoffset(c000.x);
  float4 _exposure1 : packoffset(c001.x);
  float4 _exposure2 : packoffset(c002.x);
  float4 _exposure3 : packoffset(c003.x);
  float4 _exposure4 : packoffset(c004.x);
};

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
  int _colorBlindParam : packoffset(c012.x);
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

ConstantBuffer<PostProcessAbyssEnterIntro_CDStruct> BindlessParameters_PostProcessAbyssEnterIntro_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _18[36];
  float _23 = _srcTargetSizeAndInv.x * TEXCOORD.x;
  float _25 = _srcTargetSizeAndInv.y * TEXCOORD.y;
  float4 _28 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  int _41 = WaveReadLaneFirst(_materialIndex);
  int _50 = WaveReadLaneFirst(_materialIndex);
  float _58 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_50 < (uint)170000), _50, 0)) + 0u))]._cameraSinIntensity);
  int _59 = WaveReadLaneFirst(_materialIndex);
  float _79 = _time.x * WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_41 < (uint)170000), _41, 0)) + 0u))]._cameraSpeed);
  float _80 = _79 + -1.0f;
  float _82 = sin(_time.x * 0.10000000149011612f);
  float _84 = (_82 + 3.0f) + _79;
  float _85 = _79 * 0.13089969754219055f;
  float _87 = sin(_85 + 1.7000000476837158f);
  float _92 = _80 * 0.13089969754219055f;
  float _94 = sin(_92 + 1.7000000476837158f);
  float _95 = _94 * _58;
  float _98 = _95 * 2.0f;
  float _99 = (cos(_92) * _58) * _95;
  float _100 = _84 * 0.13089969754219055f;
  float _103 = sin(_100 + 1.7000000476837158f) * _58;
  float _109 = _103 - sin(_time.x * 0.0010000000474974513f);
  float _111 = ((cos(_100) * _58) * _103) + -1.0f;
  float _112 = 3.1415927410125732f / WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_59 < (uint)170000), _59, 0)) + 0u))]._cameraFov);
  float _115 = (_58 * 2.0f) * (_87 - _94);
  float _116 = (((_58 * _58) * _87) * cos(_85)) - _99;
  float _118 = rsqrt(dot(float3(_115, _116, 1.0f), float3(_115, _116, 1.0f)));
  float _119 = _118 * _115;
  float _120 = _118 * _116;
  float _121 = -0.0f - _119;
  float _123 = rsqrt(dot(float3(_118, 0.0f, _121), float3(_118, 0.0f, _121)));
  float _124 = _123 * _118;
  float _125 = _123 * _121;
  float _129 = _112 * ((_23 - (_srcTargetSizeAndInv.x * 0.5f)) / _srcTargetSizeAndInv.y);
  float _134 = _112 * ((_25 - (_srcTargetSizeAndInv.y * 0.5f)) / _srcTargetSizeAndInv.y);
  float _135 = _120 * _134;
  float _139 = ((_124 * _129) + _119) + (_125 * _135);
  float _140 = (((_124 * _118) - (_125 * _119)) * _134) + _120;
  float _141 = ((_125 * _129) + _118) - (_124 * _135);
  float _143 = rsqrt(dot(float3(_139, _140, _141), float3(_139, _140, _141)));
  float _144 = _139 * _143;
  float _145 = _140 * _143;
  float _146 = _141 * _143;
  float _149 = sin(-0.0f - _95) * 0.4000000059604645f;
  float _150 = cos(_149);
  float _151 = sin(_149);
  float _153 = mad(_151, _145, (_144 * _150));
  float _156 = mad(_150, _145, (-0.0f - (_151 * _144)));
  int _157 = WaveReadLaneFirst(_materialIndex);
  float _165 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_157 < (uint)170000), _157, 0)) + 0u))]._stardustDensity);
  float _166 = _95 * 2.6666667461395264f;
  float _167 = _99 * 1.3333333730697632f;
  float _168 = _80 * 1.3333333730697632f;
  float _169 = floor(_166);
  float _170 = floor(_167);
  float _171 = floor(_168);
  float _172 = 1.0f / _153;
  float _173 = 1.0f / _156;
  float _174 = 1.0f / _146;
  float _190 = float((int)(((int)(uint)((int)(_153 > 0.0f))) - ((int)(uint)((int)(_153 < 0.0f)))));
  float _191 = float((int)(((int)(uint)((int)(_156 > 0.0f))) - ((int)(uint)((int)(_156 < 0.0f)))));
  float _192 = float((int)(((int)(uint)((int)(_146 > 0.0f))) - ((int)(uint)((int)(_146 < 0.0f)))));
  float _193 = _165 * 30.0f;
  float _195 = _190 * 0.5f;
  float _196 = _191 * 0.5f;
  float _197 = _192 * 0.5f;
  float _212;
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
  int _225;
  float _322;
  float _323;
  float _324;
  float _325;
  float _326;
  float _327;
  float _328;
  float _360;
  float _361;
  float _362;
  float _364;
  float _365;
  float _366;
  float _419;
  float _420;
  float _421;
  float _422;
  float _423;
  float _424;
  int _425;
  float _500;
  float _832;
  float _833;
  float _834;
  float _835;
  float _836;
  float _837;
  int _838;
  float _913;
  float _1015;
  float _1103;
  float _1104;
  float _1105;
  float _1106;
  float _1229;
  float _1290;
  float _1291;
  float _1292;
  float _1963;
  float _2209;
  float _2210;
  float _2211;
  float _2331;
  float _2332;
  float _2333;
  float _2354;
  float _2355;
  float _2356;
  float _2389;
  float _2390;
  float _2391;
  float _2405;
  float _2406;
  float _2407;
  if (_193 > 0.0f) {
    _212 = _169;
    _213 = _170;
    _214 = _171;
    _215 = (_172 * (((0.5f - _166) + _195) + _169));
    _216 = (_173 * (((0.5f - _167) + _196) + _170));
    _217 = (_174 * (((0.5f - _168) + _197) + _171));
    _218 = 0.0f;
    _219 = 0.0f;
    _220 = 0.0f;
    _221 = 0.0f;
    _222 = 0.0f;
    _223 = 0.0f;
    _224 = 0.0f;
    _225 = 0;
    while(true) {
      float _235 = frac(sin(dot(float3(_212, _213, _214), float3(127.0999984741211f, 311.70001220703125f, 74.69999694824219f))) * 43758.546875f);
      float _236 = frac(sin(dot(float3(_212, _213, _214), float3(269.5f, 183.3000030517578f, 246.10000610351562f))) * 43758.546875f);
      float _237 = frac(sin(dot(float3(_212, _213, _214), float3(113.5f, 271.8999938964844f, 124.5999984741211f))) * 43758.546875f);
      float _240 = _time.x * _235;
      float _260 = (_212 - _166) + min(max(((cos(_240 + _235) * 0.10000000149011612f) + _235), 0.014999999664723873f), 0.9850000143051147f);
      float _262 = (_213 - _167) + min(max(((cos(_240 + _236) * 0.10000000149011612f) + _236), 0.014999999664723873f), 0.9850000143051147f);
      float _264 = (_214 - _168) + min(max(((cos(_240 + _237) * 0.10000000149011612f) + _237), 0.014999999664723873f), 0.9850000143051147f);
      float _265 = dot(float3(_260, _262, _264), float3(_153, _156, _146));
      float _269 = _260 - (_265 * _153);
      float _270 = _262 - (_265 * _156);
      float _271 = _264 - (_265 * _146);
      bool __branch_chain_211;
      if (!(((_265 > 0.0f)) && (((_265 * 0.75f) < 50.0f)))) {
        _322 = _218;
        _323 = _219;
        _324 = _220;
        _325 = _221;
        _326 = _222;
        _327 = _223;
        _328 = _224;
        __branch_chain_211 = true;
      } else {
        float _291 = saturate((sqrt(((_269 * _269) + (_270 * _270)) + (_271 * _271)) + -0.007499999832361937f) * 133.33334350585938f);
        float _296 = 1.0f - ((_291 * _291) * (3.0f - (_291 * 2.0f)));
        float _300 = saturate((_265 - _193) / (-0.0f - _193));
        float _305 = ((_300 * _300) * (3.0f - (_300 * 2.0f))) * _296;
        float _307 = _296 * (_305 / _265);
        float _308 = _307 * ((_218 * 0.4000000059604645f) + 0.6000000238418579f);
        float _309 = _307 * ((_219 * 0.4000000059604645f) + 0.6000000238418579f);
        float _310 = _307 * ((_220 * 0.4000000059604645f) + 0.6000000238418579f);
        float _311 = 1.0f - _224;
        float _316 = (_308 * _311) + _221;
        float _317 = (_309 * _311) + _222;
        float _318 = (_310 * _311) + _223;
        float _319 = (_305 * _311) + _224;
        if (!(_319 > 0.9900000095367432f)) {
          _322 = _308;
          _323 = _309;
          _324 = _310;
          _325 = _316;
          _326 = _317;
          _327 = _318;
          _328 = _319;
          __branch_chain_211 = true;
        } else {
          _360 = _316;
          _361 = _317;
          _362 = _318;
          __branch_chain_211 = false;
        }
      }
      if (__branch_chain_211) {
        _322 = _218;
        _323 = _219;
        _324 = _220;
        _325 = _221;
        _326 = _222;
        _327 = _223;
        _328 = _224;
      }
      float _342 = (select((_216 < _215), 0.0f, 1.0f) * _190) * select((_217 < _215), 0.0f, 1.0f);
      float _344 = (select((_215 < _216), 0.0f, 1.0f) * _191) * select((_217 < _216), 0.0f, 1.0f);
      float _346 = (select((_215 < _217), 0.0f, 1.0f) * _192) * select((_216 < _217), 0.0f, 1.0f);
      if (float((int)(_225 + 1)) < _193) {
        _212 = (_342 + _212);
        _213 = (_344 + _213);
        _214 = (_346 + _214);
        _215 = ((_342 * _172) + _215);
        _216 = ((_344 * _173) + _216);
        _217 = ((_346 * _174) + _217);
        _218 = _322;
        _219 = _323;
        _220 = _324;
        _221 = _325;
        _222 = _326;
        _223 = _327;
        _224 = _328;
        _225 = (_225 + 1);
        continue;
      } else {
        _360 = _325;
        _361 = _326;
        _362 = _327;
      }
      _364 = _360;
      _365 = _361;
      _366 = _362;
      break;
    }
  } else {
    _364 = 0.0f;
    _365 = 0.0f;
    _366 = 0.0f;
  }
  int _367 = WaveReadLaneFirst(_materialIndex);
  int _376 = WaveReadLaneFirst(_materialIndex);
  float _384 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_376 < (uint)170000), _376, 0)) + 0u))]._cubeScale);
  int _385 = WaveReadLaneFirst(_materialIndex);
  float _393 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_385 < (uint)170000), _385, 0)) + 0u))]._cubeDistance);
  int _394 = WaveReadLaneFirst(_materialIndex);
  float _403 = floor(_98);
  float _404 = floor(_99);
  float _405 = floor(_80);
  _419 = _403;
  _420 = _404;
  _421 = _405;
  _422 = ((((0.5f - _98) + _195) + _403) * _172);
  _423 = ((((0.5f - _99) + _196) + _404) * _173);
  _424 = ((((1.5f - _79) + _197) + _405) * _174);
  _425 = 0;
  while(true) {
    float _426 = _419 * 0.3499999940395355f;
    float _427 = _420 * 0.3499999940395355f;
    float _428 = _421 * 0.3499999940395355f;
    float _442 = (_419 + -0.5f) + frac(sin(dot(float3(_426, _427, _428), float3(127.0999984741211f, 311.70001220703125f, 74.69999694824219f))) * 43758.546875f);
    float _444 = (_420 + -0.5f) + frac(sin(dot(float3(_426, _427, _428), float3(269.5f, 183.3000030517578f, 246.10000610351562f))) * 43758.546875f);
    float _446 = (_421 + -0.5f) + frac(sin(dot(float3(_426, _427, _428), float3(113.5f, 271.8999938964844f, 124.5999984741211f))) * 43758.546875f);
    float _450 = frac(_442 * 0.1031000018119812f);
    float _451 = frac(_444 * 0.1031000018119812f);
    float _452 = frac(_446 * 0.1031000018119812f);
    float _456 = dot(float3(_450, _451, _452), float3((_451 + 19.190000534057617f), (_452 + 19.190000534057617f), (_450 + 19.190000534057617f)));
    float _462 = frac(((_451 + _450) + (_456 * 2.0f)) * (_456 + _452));
    float _463 = _446 * 0.13089969754219055f;
    float _466 = sin(_463 + 1.7000000476837158f) * _58;
    float _471 = _442 - (_466 * 2.0f);
    float _472 = _444 - ((cos(_463) * _58) * _466);
    bool __defer_418_629 = false;
    if (!(abs(select((_472 < 0.0f), 0.5f, 0.0f) + _472) > 0.3499999940395355f) || ((abs(select((_472 < 0.0f), 0.5f, 0.0f) + _472) > 0.3499999940395355f) && (!(sqrt((_472 * _472) + (_471 * _471)) > (_393 - ((_462 * 6.0f) * exp2(log2(saturate(_424 * 0.015625f)) * 2.200000047683716f))))))) {
      __defer_418_629 = true;
    } else {
      bool _493 = (_462 < 0.3499999940395355f);
      if (!_493) {
        _500 = ((_462 + _421) + _time.x);
      } else {
        _500 = 0.0f;
      }
      float _503 = select(_493, 0.0f, ((_500 * 2.0f) + _420));
      float _504 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_394 < (uint)170000), _394, 0)) + 0u))]._cubeMinScale) * 0.25f;
      float _507 = min(max((_462 * 0.4000000059604645f), _504), _384);
      float _509 = (_98 + -0.5f) - _442;
      float _511 = (_99 + -0.5f) - _444;
      float _513 = (_79 + -1.5f) - _446;
      float _514 = cos(_500);
      float _515 = sin(_500);
      float _517 = mad(_515, _511, (_514 * _513));
      float _522 = mad(_515, _156, (_514 * _146));
      float _525 = mad(_514, _156, (-0.0f - (_146 * _515)));
      float _526 = cos(_503);
      float _527 = sin(_503);
      float _534 = mad(_527, _522, (_526 * _153));
      float _537 = mad(_526, _522, (-0.0f - (_153 * _527)));
      float _538 = 1.0f / _534;
      float _539 = 1.0f / _525;
      float _540 = 1.0f / _537;
      float _541 = _538 * mad(_527, _517, (_526 * _509));
      float _542 = _539 * mad(_514, _511, (-0.0f - (_513 * _515)));
      float _543 = _540 * mad(_526, _517, (-0.0f - (_509 * _527)));
      float _547 = abs(_538) * _507;
      float _548 = abs(_539) * _507;
      float _549 = abs(_540) * _507;
      float _553 = (-0.0f - _541) - _547;
      float _554 = (-0.0f - _542) - _548;
      float _555 = (-0.0f - _543) - _549;
      float _560 = max(max(_553, _554), _555);
      float _562 = min(min((_547 - _541), (_548 - _542)), (_549 - _543));
      float _595 = (select((_553 < _554), 0.0f, 1.0f) * float((int)(((int)(uint)((int)(_534 < 0.0f))) - ((int)(uint)((int)(_534 > 0.0f)))))) * select((_553 < _555), 0.0f, 1.0f);
      float _597 = (select((_554 < _553), 0.0f, 1.0f) * float((int)(((int)(uint)((int)(_525 < 0.0f))) - ((int)(uint)((int)(_525 > 0.0f)))))) * select((_554 < _555), 0.0f, 1.0f);
      float _598 = (select((_555 < _553), 0.0f, 1.0f) * float((int)(((int)(uint)((int)(_537 < 0.0f))) - ((int)(uint)((int)(_537 > 0.0f)))))) * select((_555 < _554), 0.0f, 1.0f);
      float _599 = -0.0f - _500;
      float _600 = cos(_599);
      float _601 = sin(_599);
      float _603 = mad(_601, _597, (_598 * _600));
      float _604 = -0.0f - _601;
      float _606 = mad(_600, _597, (_598 * _604));
      float _608 = mad(_601, _606, (_603 * _600));
      float _610 = mad(_600, _606, (_603 * _604));
      float _611 = -0.0f - _503;
      float _612 = cos(_611);
      float _613 = sin(_611);
      float _615 = mad(_613, _608, (_612 * _595));
      float _618 = mad(_612, _608, (-0.0f - (_595 * _613)));
      float _620 = mad(_613, _618, (_615 * _612));
      float _623 = mad(_612, _618, (-0.0f - (_613 * _615)));
      float _627 = select((((_560 > _562)) || ((_562 < 0.0f))), 0.0f, _560);
      if (_627 > 0.0f) {
        float _663 = (_627 * _153) + _98;
        float _664 = (_627 * _156) + _99;
        float _665 = (_627 * _146) + _80;
        int _666 = WaveReadLaneFirst(_materialIndex);
        float _676 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_666 < (uint)170000), _666, 0)) + 0u))]._lightColor.x);
        float _677 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_666 < (uint)170000), _666, 0)) + 0u))]._lightColor.y);
        float _678 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_666 < (uint)170000), _666, 0)) + 0u))]._lightColor.z);
        float _680 = rsqrt(dot(float3(_676, _677, _678), float3(_676, _677, _678)));
        float _686 = max(dot(float3((_680 * _676), (_680 * _677), (_680 * _678)), float3(_620, _610, _623)), 0.05000000074505806f) * 0.009999999776482582f;
        int _687 = WaveReadLaneFirst(_materialIndex);
        float _697 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_687 < (uint)170000), _687, 0)) + 0u))]._ambientColor.x);
        float _698 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_687 < (uint)170000), _687, 0)) + 0u))]._ambientColor.y);
        float _699 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_687 < (uint)170000), _687, 0)) + 0u))]._ambientColor.z);
        float _724 = max(0.0f, _610);
        float _728 = (_109 * 2.0f) - _663;
        float _729 = _111 - _664;
        float _730 = _84 - _665;
        float _732 = rsqrt(dot(float3(_728, _729, _730), float3(_728, _729, _730)));
        float _733 = _732 * _728;
        float _734 = _732 * _729;
        float _735 = _732 * _730;
        float _741 = sqrt(((_728 * _728) + (_729 * _729)) + (_730 * _730));
        float _742 = _741 * _741;
        float _749 = -0.0f - _733;
        float _750 = -0.0f - _734;
        float _751 = -0.0f - _735;
        float _753 = dot(float3(_749, _750, _751), float3(_620, _610, _623)) * 2.0f;
        float _778 = ((_time.x * 8.0f) + _665) * 0.02500000037252903f;
        float _782 = frac(abs(_778));
        float _789 = _663 - (_153 * 0.009999999776482582f);
        float _790 = _664 - (_156 * 0.009999999776482582f);
        float _791 = _665 - (_146 * 0.009999999776482582f);
        float _792 = floor(_789);
        float _793 = floor(_790);
        float _794 = floor(_791);
        float _795 = 1.0f / _733;
        float _796 = 1.0f / _734;
        float _797 = 1.0f / _735;
        float _813 = float((int)(((int)(uint)((int)(_733 > 0.0f))) - ((int)(uint)((int)(_733 < 0.0f)))));
        float _814 = float((int)(((int)(uint)((int)(_734 > 0.0f))) - ((int)(uint)((int)(_734 < 0.0f)))));
        float _815 = float((int)(((int)(uint)((int)(_735 > 0.0f))) - ((int)(uint)((int)(_735 < 0.0f)))));
        _832 = _792;
        _833 = _793;
        _834 = _794;
        _835 = (_795 * (((0.5f - _789) + (_813 * 0.5f)) + _792));
        _836 = (_796 * (((0.5f - _790) + (_814 * 0.5f)) + _793));
        _837 = (_797 * (((0.5f - _791) + (_815 * 0.5f)) + _794));
        _838 = 0;
        while(true) {
          float _839 = _832 * 0.3499999940395355f;
          float _840 = _833 * 0.3499999940395355f;
          float _841 = _834 * 0.3499999940395355f;
          float _855 = (_832 + -0.5f) + frac(sin(dot(float3(_839, _840, _841), float3(127.0999984741211f, 311.70001220703125f, 74.69999694824219f))) * 43758.546875f);
          float _857 = (_833 + -0.5f) + frac(sin(dot(float3(_839, _840, _841), float3(269.5f, 183.3000030517578f, 246.10000610351562f))) * 43758.546875f);
          float _859 = (_834 + -0.5f) + frac(sin(dot(float3(_839, _840, _841), float3(113.5f, 271.8999938964844f, 124.5999984741211f))) * 43758.546875f);
          float _863 = frac(_855 * 0.1031000018119812f);
          float _864 = frac(_857 * 0.1031000018119812f);
          float _865 = frac(_859 * 0.1031000018119812f);
          float _869 = dot(float3(_863, _864, _865), float3((_864 + 19.190000534057617f), (_865 + 19.190000534057617f), (_863 + 19.190000534057617f)));
          float _875 = frac(((_864 + _863) + (_869 * 2.0f)) * (_869 + _865));
          float _876 = _859 * 0.13089969754219055f;
          float _879 = sin(_876 + 1.7000000476837158f) * _58;
          float _884 = _855 - (_879 * 2.0f);
          float _885 = _857 - ((cos(_876) * _58) * _879);
          bool __defer_831_980 = false;
          if (!(abs(select((_885 < 0.0f), 0.5f, 0.0f) + _885) > 0.3499999940395355f) || ((abs(select((_885 < 0.0f), 0.5f, 0.0f) + _885) > 0.3499999940395355f) && (!(sqrt((_885 * _885) + (_884 * _884)) > (_393 - ((_875 * 6.0f) * exp2(log2(saturate(_837 * 0.015625f)) * 2.200000047683716f))))))) {
            __defer_831_980 = true;
          } else {
            bool _906 = (_875 < 0.3499999940395355f);
            if (!_906) {
              _913 = ((_875 + _834) + _time.x);
            } else {
              _913 = 0.0f;
            }
            float _916 = select(_906, 0.0f, ((_913 * 2.0f) + _833));
            float _919 = min(max((_875 * 0.4000000059604645f), _504), _384);
            float _921 = (_789 + -0.5f) - _855;
            float _923 = (_790 + -0.5f) - _857;
            float _925 = (_791 + -0.5f) - _859;
            float _926 = cos(_913);
            float _927 = sin(_913);
            float _929 = mad(_927, _923, (_926 * _925));
            float _934 = mad(_927, _734, (_926 * _735));
            float _938 = cos(_916);
            float _939 = sin(_916);
            float _950 = 1.0f / mad(_939, _934, (_938 * _733));
            float _951 = 1.0f / mad(_926, _734, (-0.0f - (_735 * _927)));
            float _952 = 1.0f / mad(_938, _934, (-0.0f - (_733 * _939)));
            float _953 = _950 * mad(_939, _929, (_938 * _921));
            float _954 = _951 * mad(_926, _923, (-0.0f - (_925 * _927)));
            float _955 = _952 * mad(_938, _929, (-0.0f - (_921 * _939)));
            float _959 = abs(_950) * _919;
            float _960 = abs(_951) * _919;
            float _961 = abs(_952) * _919;
            float _972 = max(max(((-0.0f - _953) - _959), ((-0.0f - _954) - _960)), ((-0.0f - _955) - _961));
            float _974 = min(min((_959 - _953), (_960 - _954)), (_961 - _955));
            float _978 = select((((_972 > _974)) || ((_974 < 0.0f))), 0.0f, _972);
            if (_978 > 0.0f) {
              _1015 = select((_978 < _741), 0.0f, 1.0f);
            } else {
              __defer_831_980 = true;
            }
          }
          if (__defer_831_980) {
            float _994 = (select((_836 < _835), 0.0f, 1.0f) * _813) * select((_837 < _835), 0.0f, 1.0f);
            float _996 = (select((_835 < _836), 0.0f, 1.0f) * _814) * select((_837 < _836), 0.0f, 1.0f);
            float _998 = (select((_835 < _837), 0.0f, 1.0f) * _815) * select((_836 < _837), 0.0f, 1.0f);
            if ((int)(_838 + 1) < (int)64) {
              _832 = (_994 + _832);
              _833 = (_996 + _833);
              _834 = (_998 + _834);
              _835 = ((_994 * _795) + _835);
              _836 = ((_996 * _796) + _836);
              _837 = ((_998 * _797) + _837);
              _838 = (_838 + 1);
              continue;
            } else {
              _1015 = 1.0f;
            }
          }
          int _1016 = WaveReadLaneFirst(_materialIndex);
          float _1026 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1016 < (uint)170000), _1016, 0)) + 0u))]._globalColor.x);
          float _1027 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1016 < (uint)170000), _1016, 0)) + 0u))]._globalColor.y);
          float _1028 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1016 < (uint)170000), _1016, 0)) + 0u))]._globalColor.z);
          float _1053 = dot(float3(_733, _734, _735), float3(_620, _610, _623));
          float _1055 = max(_1053, 0.05000000074505806f) * (1.0f / ((_742 * 0.05000000074505806f) + 1.0f));
          float _1061 = 1.0f / ((_742 * 0.10000000149011612f) + 1.0f);
          float _1063 = max(_1053, 0.009999999776482582f) * _1061;
          float _1064 = _1063 * 0.07323896884918213f;
          float _1072 = _1061 * exp2(log2(max(dot(float3((_749 - (_753 * _620)), (_750 - (_753 * _610)), (_751 - (_753 * _623))), float3((-0.0f - _153), (-0.0f - _156), (-0.0f - _146))), 0.0f)) * 100.0f);
          float _1074 = _1072 * 0.3185468018054962f;
          float _1079 = (pow(_1074, 0.8333333134651184f));
          float _1083 = select(((select((_778 >= (-0.0f - _778)), _782, (-0.0f - _782)) * 40.0f) > 4.0f), 0.0f, 1.0f);
          float _1087 = (_627 * 0.10000000149011612f) + 1.0f;
          float _1088 = ((_1079 + (_1063 * 0.14647793769836426f)) * _1083) / _1087;
          float _1090 = (_1072 * 0.07323896884918213f) + _686;
          _1103 = (((_1090 + (_724 * select((_697 < 0.040449999272823334f), (_697 * 0.07739938050508499f), exp2(log2((_697 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)))) + ((_1064 + (_1055 * select((_1026 < 0.040449999272823334f), (_1026 * 0.07739938050508499f), exp2(log2((_1026 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)))) * _1015)) + _1088);
          _1104 = (((_1090 + (_724 * select((_698 < 0.040449999272823334f), (_698 * 0.07739938050508499f), exp2(log2((_698 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)))) + ((_1064 + (_1055 * select((_1027 < 0.040449999272823334f), (_1027 * 0.07739938050508499f), exp2(log2((_1027 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)))) * _1015)) + _1088);
          _1105 = (((((select((_699 < 0.040449999272823334f), (_699 * 0.07739938050508499f), exp2(log2((_699 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)) * _724) + _686) + _1074) + (((_1063 * 0.21404112875461578f) + (_1055 * select((_1028 < 0.040449999272823334f), (_1028 * 0.07739938050508499f), exp2(log2((_1028 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)))) * _1015)) + (((_1079 + (_1063 * 0.8959768414497375f)) * _1083) / _1087));
          _1106 = _627;
          break;
        }
      } else {
        __defer_418_629 = true;
      }
    }
    if (__defer_418_629) {
      float _643 = (select((_423 < _422), 0.0f, 1.0f) * _190) * select((_424 < _422), 0.0f, 1.0f);
      float _645 = (select((_422 < _423), 0.0f, 1.0f) * _191) * select((_424 < _423), 0.0f, 1.0f);
      float _647 = (select((_422 < _424), 0.0f, 1.0f) * _192) * select((_423 < _424), 0.0f, 1.0f);
      if ((int)(_425 + 1) < (int)64) {
        _419 = (_643 + _419);
        _420 = (_645 + _420);
        _421 = (_647 + _421);
        _422 = ((_643 * _172) + _422);
        _423 = ((_645 * _173) + _423);
        _424 = ((_647 * _174) + _424);
        _425 = (_425 + 1);
        continue;
      } else {
        _1103 = 0.0f;
        _1104 = 0.0f;
        _1105 = 0.0f;
        _1106 = 50.0f;
      }
    }
    int _1107 = WaveReadLaneFirst(_materialIndex);
    float _1117 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1107 < (uint)170000), _1107, 0)) + 0u))]._fogColor.x);
    float _1118 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1107 < (uint)170000), _1107, 0)) + 0u))]._fogColor.y);
    float _1119 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1107 < (uint)170000), _1107, 0)) + 0u))]._fogColor.z);
    float _1147 = exp2(log2(_1106 * 0.019999999552965164f) * 6.0f);
    float _1157 = ((_1147 * (select((_1117 < 0.040449999272823334f), (_1117 * 0.07739938050508499f), exp2(log2((_1117 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)) - _1103)) + _1103) * 1.2000000476837158f;
    float _1158 = ((_1147 * (select((_1118 < 0.040449999272823334f), (_1118 * 0.07739938050508499f), exp2(log2((_1118 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)) - _1104)) + _1104) * 1.2000000476837158f;
    float _1159 = ((_1147 * (select((_1119 < 0.040449999272823334f), (_1119 * 0.07739938050508499f), exp2(log2((_1119 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)) - _1105)) + _1105) * 1.2000000476837158f;
    int _1160 = WaveReadLaneFirst(_materialIndex);
    float _1170 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1160 < (uint)170000), _1160, 0)) + 0u))]._centerGlowColor.x);
    float _1171 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1160 < (uint)170000), _1160, 0)) + 0u))]._centerGlowColor.y);
    float _1172 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1160 < (uint)170000), _1160, 0)) + 0u))]._centerGlowColor.z);
    int _1203 = WaveReadLaneFirst(_materialIndex);
    float _1212 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1203 < (uint)170000), _1203, 0)) + 0u))]._centerGlowRadius) * ((sin(_time.x * 5.0f) * 0.050000011920928955f) + 0.949999988079071f);
    float _1214 = (_95 - _109) * 2.0f;
    float _1215 = _99 - _111;
    float _1216 = -4.0f - _82;
    float _1217 = dot(float3(_1214, _1215, _1216), float3(_153, _156, _146));
    float _1222 = (_1217 * _1217) - (dot(float3(_1214, _1215, _1216), float3(_1214, _1215, _1216)) - (_1212 * _1212));
    if (!(_1222 < 0.0f)) {
      _1229 = ((-0.0f - _1217) - sqrt(_1222));
    } else {
      _1229 = 0.0f;
    }
    if (((_1229 > 0.0f)) && ((_1229 < _1106))) {
      float _1234 = 50.0f / _1212;
      float _1235 = _1214 / _1212;
      float _1236 = _1215 / _1212;
      float _1237 = _1216 / _1212;
      float _1238 = dot(float3(_153, _156, _146), float3(_1235, _1236, _1237));
      float _1240 = dot(float3(_1235, _1236, _1237), float3(_1235, _1236, _1237)) + -1.0f;
      float _1242 = (_1238 * _1238) - _1240;
      if (!(_1242 < 0.0f)) {
        float _1245 = sqrt(_1242);
        float _1247 = (-0.0f - _1238) - _1245;
        float _1248 = _1245 - _1238;
        if (!(((_1248 < 0.0f)) || ((_1247 > _1234)))) {
          float _1253 = max(_1247, 0.0f);
          float _1254 = min(_1248, _1234);
          float _1267 = ((((-0.0f - _1240) - (_1254 * _1238)) + ((_1254 * _1254) * -0.3333333432674408f)) * _1254) + (((((_1253 * 0.3333333432674408f) + _1238) * _1253) + _1240) * _1253);
          float _1268 = _1267 * 0.75f;
          if (_1268 > 0.0f) {
            float _1271 = _1268 * _1268;
            float _1273 = _1268 * (_1271 * _1271);
            float _1274 = _1273 * _1273;
            float _1276 = (_1274 * _1274) * 5.0f;
            float _1280 = _1268 * _1267;
            float _1282 = _1280 * 0.22500000894069672f;
            _1290 = (((_1276 * select((_1170 < 0.040449999272823334f), (_1170 * 0.07739938050508499f), exp2(log2((_1170 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f))) + _1157) + (_1280 * 0.07500000298023224f));
            _1291 = (((_1276 * select((_1171 < 0.040449999272823334f), (_1171 * 0.07739938050508499f), exp2(log2((_1171 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f))) + _1158) + _1282);
            _1292 = (((_1276 * select((_1172 < 0.040449999272823334f), (_1172 * 0.07739938050508499f), exp2(log2((_1172 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f))) + _1159) + _1282);
          } else {
            _1290 = _1157;
            _1291 = _1158;
            _1292 = _1159;
          }
        } else {
          _1290 = _1157;
          _1291 = _1158;
          _1292 = _1159;
        }
      } else {
        _1290 = _1157;
        _1291 = _1158;
        _1292 = _1159;
      }
    } else {
      _1290 = _1157;
      _1291 = _1158;
      _1292 = _1159;
    }
    int _1296 = WaveReadLaneFirst(_materialIndex);
    float _1304 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1296 < (uint)170000), _1296, 0)) + 0u))]._tunnelTotal);
    float _1308 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_367 < (uint)170000), _367, 0)) + 0u))]._stardustIntensity) * _165;
    float _1343 = (_23 - (_srcTargetSizeAndInv.x * 0.5f)) / _srcTargetSizeAndInv.y;
    float _1344 = (_25 - (_srcTargetSizeAndInv.y * 0.5f)) / _srcTargetSizeAndInv.y;
    float _1345 = _1343 * 1.5f;
    float _1346 = _1344 * 1.5f;
    float _1350 = sqrt((_1346 * _1346) + (_1345 * _1345));
    float _1362 = frac((sin((_1344 * 0.15000000596046448f) + (_1343 * 25.5f)) * 10000.0f) * (abs(sin((_1344 * 19.5f) + _1345)) + 0.10000000149011612f));
    float _1367 = _time.x * 0.5f;
    float _1368 = _1367 + (_1343 * 22.5f);
    float _1369 = _1367 + (_1344 * 22.5f);
    float _1370 = floor(_1368);
    float _1371 = floor(_1369);
    float _1372 = frac(_1368);
    float _1373 = frac(_1369);
    float _1374 = _1370 * 17.0f;
    float _1375 = _1371 * 0.10000000149011612f;
    float _1379 = _1371 * 13.0f;
    float _1385 = frac((sin(_1375 + _1374) * 10000.0f) * (abs(sin(_1379 + _1370)) + 0.10000000149011612f));
    float _1386 = _1370 + 1.0f;
    float _1387 = _1386 * 17.0f;
    float _1396 = frac((sin(_1387 + _1375) * 10000.0f) * (abs(sin(_1379 + _1386)) + 0.10000000149011612f));
    float _1397 = _1371 + 1.0f;
    float _1398 = _1397 * 0.10000000149011612f;
    float _1402 = _1397 * 13.0f;
    float _1424 = (_1372 * _1372) * (3.0f - (_1372 * 2.0f));
    float _1436 = (lerp(_1385, _1396, _1424)) + (((_1373 * _1373) * (3.0f - (_1373 * 2.0f))) * (((frac((sin(_1398 + _1387) * 10000.0f) * (abs(sin(_1402 + _1386)) + 0.10000000149011612f)) - _1396) * _1424) + ((frac((sin(_1398 + _1374) * 10000.0f) * (abs(sin(_1402 + _1370)) + 0.10000000149011612f)) - _1385) * (1.0f - _1424))));
    int _1437 = WaveReadLaneFirst(_materialIndex);
    float _1445 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1437 < (uint)170000), _1437, 0)) + 0u))]._anamorphicWidth);
    float _1447 = (_1445 * 0.8999999761581421f) + 0.10999999940395355f;
    float _1451 = saturate((_1350 - _1447) / (-0.0f - _1447));
    float _1457 = saturate((cos(_1345) * 0.4000000059604645f) + -1.0f);
    float _1461 = (_1457 * _1457) * (3.0f - (_1457 * 2.0f));
    float _1469 = saturate(((abs(_1461 + _1346) + -0.03999999910593033f) + abs(_1346 - _1461)) * -25.0f);
    float _1472 = _1451 * _1469;
    float _1475 = ((3.0f - (_1469 * 2.0f)) * (3.0f - (_1451 * 2.0f))) * (_1472 * _1472);
    float _1477 = (_1445 * 0.5f) + 0.11999999731779099f;
    float _1478 = _1345 + -0.07999999821186066f;
    float _1479 = _1346 + 0.004999999888241291f;
    float _1487 = saturate((sqrt((_1479 * _1479) + (_1478 * _1478)) - _1477) / (-0.0f - _1477));
    float _1493 = saturate((cos(_1478) * 0.4000000059604645f) + -1.0f);
    float _1497 = (_1493 * _1493) * (3.0f - (_1493 * 2.0f));
    float _1505 = saturate(((abs(_1497 + _1479) + -0.017999999225139618f) + abs(_1479 - _1497)) * -55.55555725097656f);
    float _1508 = _1487 * _1505;
    float _1511 = ((3.0f - (_1505 * 2.0f)) * (3.0f - (_1487 * 2.0f))) * (_1508 * _1508);
    float _1513 = (_1445 * 0.699999988079071f) + 0.12999999523162842f;
    float _1514 = _1345 + 0.09000000357627869f;
    float _1515 = _1346 + -0.004999999888241291f;
    float _1523 = saturate((sqrt((_1515 * _1515) + (_1514 * _1514)) - _1513) / (-0.0f - _1513));
    float _1529 = saturate((cos(_1514) * 0.4000000059604645f) + -1.0f);
    float _1533 = (_1529 * _1529) * (3.0f - (_1529 * 2.0f));
    float _1541 = saturate(((abs(_1533 + _1515) + -0.014299999922513962f) + abs(_1515 - _1533)) * -69.93006896972656f);
    float _1544 = _1523 * _1541;
    float _1548 = _1343 * 2.25f;
    float _1549 = _1344 * 2.25f;
    float _1552 = (_1436 * 0.07999999821186066f) + 0.15000000596046448f;
    float _1556 = saturate((abs(_1549) - _1552) / (-0.0f - _1552));
    float _1560 = sqrt((_1549 * _1549) + (_1548 * _1548));
    float _1563 = saturate((_1560 + -0.800000011920929f) * -0.7692307829856873f);
    float _1579 = max(0.8999999761581421f, frac(frac((sin(_time.x * 8.550000190734863f) * 10000.0f) * (abs(sin(_time.x * 7.0f)) + 0.10000000149011612f)))) * 0.07999999821186066f;
    float _1584 = saturate(((_1560 + -0.10000000149011612f) - _1579) / (-0.12000000476837158f - _1579));
    float _1595 = saturate(((abs(_1548) * abs(_1344 * 1.6875f)) + -0.07000000029802322f) * -5.882352828979492f);
    float _1599 = (_1556 * _1563) * _1595;
    float _1605 = (((3.0f - (_1563 * 2.0f)) * (15.0f - (_1556 * 10.0f))) * (3.0f - (_1595 * 2.0f))) * (_1599 * _1599);
    float _1609 = _1436 * -0.014999999664723873f;
    float _1610 = _1609 + (_1343 * 2.8499999046325684f);
    float _1611 = _1609 + (_1344 * 2.8499999046325684f);
    float _1615 = sqrt((_1610 * _1610) + (_1611 * _1611));
    float _1618 = saturate((_1615 + -1.0f) * -1.4285714626312256f);
    float _1626 = saturate(((((_1618 * _1618) * _1615) * (3.0f - (_1618 * 2.0f))) + -0.10000000149011612f) * 2.5f);
    float _1629 = abs(_1345);
    float _1631 = atan(_1346 / _1629);
    bool _1634 = (_1629 < 0.0f);
    bool _1635 = (_1629 == 0.0f);
    bool _1636 = (_1346 >= 0.0f);
    bool _1637 = (_1346 < 0.0f);
    float _1650 = abs(-0.0f - _1345);
    float _1652 = atan(_1346 / _1650);
    bool _1655 = (_1650 < 0.0f);
    bool _1656 = (_1650 == 0.0f);
    float _1672 = saturate(-0.0f - (_1350 + -1.0f));
    int _1677 = WaveReadLaneFirst(_materialIndex);
    int _1698 = WaveReadLaneFirst(_materialIndex);
    float _1709 = (((lerp(_1362, 1.0f, 0.9700000286102295f)) * 0.8999999761581421f) * exp2(log2(((abs(sin(select(((_1636) && (_1656)), 1.2566370964050293f, select(((_1637) && (_1656)), -1.2566370964050293f, (select(((_1637) && (_1655)), (_1652 + -3.1415927410125732f), select(((_1636) && (_1655)), (_1652 + 3.1415927410125732f), _1652)) * 0.800000011920929f))))) + abs(sin(select(((_1636) && (_1635)), 1.0995573997497559f, select(((_1637) && (_1635)), -1.0995573997497559f, (select(((_1637) && (_1634)), (_1631 + -3.1415927410125732f), select(((_1636) && (_1634)), (_1631 + 3.1415927410125732f), _1631)) * 0.699999988079071f)))))) * 0.5f) * (((_1672 * _1672) * (3.0f - (_1672 * 2.0f))) - ((((_1626 * _1626) * 0.4000000059604645f) * (3.0f - (_1626 * 2.0f))) * WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1677 < (uint)170000), _1677, 0)) + 0u))]._blubIntensity)))) * 2.5f)) * WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1698 < (uint)170000), _1698, 0)) + 0u))]._middleHaloIntensity);
    int _1731 = WaveReadLaneFirst(_materialIndex);
    int _1740 = WaveReadLaneFirst(_materialIndex);
    float _1749 = (_1605 * _1605) * WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1740 < (uint)170000), _1740, 0)) + 0u))]._streakGlowIntensity);
    float _1752 = ((_1584 * _1584) * (3.0f - (_1584 * 2.0f))) * WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1731 < (uint)170000), _1731, 0)) + 0u))]._centerpoint);
    float _1758 = exp2(log2(_1752 * 1.2000000476837158f) * 5.0f);
    float _1763 = exp2(log2(_1752 * 1.100000023841858f) * 24.0f);
    float _1773 = _1758 + (_1752 * 0.20000000298023224f);
    float _1775 = (_1749 * 0.04965713247656822f) + (_1475 * 0.010022826492786407f);
    float _1781 = (((3.0f - (_1541 * 2.0f)) * (3.0f - (_1523 * 2.0f))) * (_1544 * _1544)) + _1511;
    int _1803 = WaveReadLaneFirst(_materialIndex);
    float _1811 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1803 < (uint)170000), _1803, 0)) + 0u))]._anamorphicIntensity);
    float _1821 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
    float _1825 = max(0.0f, (_1821 * (((_1304 * saturate(_1290)) + ((_364 * 5.0f) * _1308)) + (_1811 * exp2(log2(((((_1775 + (_1511 * 0.033104754984378815f)) + (((_1709 * 0.16689524054527283f) + 0.033104754984378815f) * _1709)) + _1763) + (_1773 * 0.07323896884918213f)) * 2.0f))))));
    float _1826 = max(0.0f, (_1821 * (((_1304 * saturate(_1291)) + ((_365 * 7.0f) * _1308)) + (_1811 * exp2(log2(((((_1775 + (_1781 * 0.033104754984378815f)) + ((0.07323896884918213f - (_1709 * 0.02323896810412407f)) * _1709)) + _1763) + (_1773 * 0.21404112875461578f)) * 2.0f))))));
    float _1827 = max(0.0f, (_1821 * (((_1304 * saturate(_1292)) + ((_366 * 9.0f) * _1308)) + (_1811 * exp2(log2((((((((_1781 * 0.07323896884918213f) + (_1475 * 0.033104754984378815f)) + ((0.13286834955215454f - (_1709 * 0.08286835253238678f)) * _1709)) + (_1752 * 0.06370936334133148f)) + (_1749 * 0.1098584532737732f)) + (_1758 * 0.6038274168968201f)) + _1763) * 2.0f))))));
    int _1828 = WaveReadLaneFirst(_materialIndex);
    int _1837 = WaveReadLaneFirst(_materialIndex);
    float _1851 = (1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1837 < (uint)170000), _1837, 0)) + 0u))]._borderWidth)) * 0.5f;
    float _1854 = max((abs(TEXCOORD.x + -0.5f) - _1851), 0.0f);
    float _1855 = max((abs(TEXCOORD.y + -0.5f) - _1851), 0.0f);
    int _1862 = WaveReadLaneFirst(_materialIndex);
    int _1870 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1862 < (uint)170000), _1862, 0)) + 0u))]._borderColor);
    float _1873 = float((uint)((uint)(((uint)((uint)(_1870)) >> 16) & 255)));
    float _1876 = float((uint)((uint)(((uint)((uint)(_1870)) >> 8) & 255)));
    float _1878 = float((uint)((uint)(_1870 & 255)));
    float _1908 = max(0.0010000000474974513f, _exposure0.x);
    int _1912 = WaveReadLaneFirst(_materialIndex);
    float _1921 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1912 < (uint)170000), _1912, 0)) + 0u))]._borderRatio) * saturate(sqrt((_1855 * _1855) + (_1854 * _1854)) / WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1828 < (uint)170000), _1828, 0)) + 0u))]._borderSmoothness));
    float _1928 = (_1921 * ((select(((_1873 * 0.003921568859368563f) < 0.040449999272823334f), (_1873 * 0.0003035269910469651f), exp2(log2((_1873 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _1908) - _1825)) + _1825;
    float _1929 = (_1921 * ((select(((_1876 * 0.003921568859368563f) < 0.040449999272823334f), (_1876 * 0.0003035269910469651f), exp2(log2((_1876 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _1908) - _1826)) + _1826;
    float _1930 = (_1921 * ((select(((_1878 * 0.003921568859368563f) < 0.040449999272823334f), (_1878 * 0.0003035269910469651f), exp2(log2((_1878 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _1908) - _1827)) + _1827;
    int _1931 = WaveReadLaneFirst(_materialIndex);
    float _1940 = saturate(WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1931 < (uint)170000), _1931, 0)) + 0u))]._fadeRatio));
    float _1947 = (_1940 * (_28.x - _1928)) + _1928;
    float _1948 = (_1940 * (_28.y - _1929)) + _1929;
    float _1949 = (_1940 * (_28.z - _1930)) + _1930;
    uint _1950 = uint(SV_Position.y);
    if (_etcParams.y == 1.0f) {
      uint2 _1957 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_1950), 0));
      _1963 = (float((uint)((uint)(_1957.x & 127))) + 0.5f);
    } else {
      _1963 = 1.0f;
    }
    if (_localToneMappingParams.w > 0.0f) {
      float3 output_color = TonemapReplacer(float3(_1947, _1948, _1949));
      _2331 = output_color.x;
      _2332 = output_color.y;
      _2333 = output_color.z;
    } else {
      _2331 = _1947;
      _2332 = _1948;
      _2333 = _1949;
    }
    if (_etcParams.y > 1.0f) {
      float _2344 = abs((TEXCOORD.x * 2.0f) + -1.0f);
      float _2345 = abs((TEXCOORD.y * 2.0f) + -1.0f);
      float _2349 = saturate(1.0f - (dot(float2(_2344, _2345), float2(_2344, _2345)) * saturate(_etcParams.y + -1.0f)));
      _2354 = (_2349 * _2331);
      _2355 = (_2349 * _2332);
      _2356 = (_2349 * _2333);
    } else {
      _2354 = _2331;
      _2355 = _2332;
      _2356 = _2333;
    }
    if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
      _2389 = select((_2354 <= 0.0031308000907301903f), (_2354 * 12.920000076293945f), (((pow(_2354, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
      _2390 = select((_2355 <= 0.0031308000907301903f), (_2355 * 12.920000076293945f), (((pow(_2355, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
      _2391 = select((_2356 <= 0.0031308000907301903f), (_2356 * 12.920000076293945f), (((pow(_2356, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    } else {
      _2389 = _2354;
      _2390 = _2355;
      _2391 = _2356;
    }
    if (!(!(_etcParams.y >= 1.0f))) {
      float _2396 = float((uint)_1950);
      if (!(_2396 < _viewDir.w)) {
        if (!(_2396 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
          _2405 = _2389;
          _2406 = _2390;
          _2407 = _2391;
        } else {
          _2405 = 0.0f;
          _2406 = 0.0f;
          _2407 = 0.0f;
        }
      } else {
        _2405 = 0.0f;
        _2406 = 0.0f;
        _2407 = 0.0f;
      }
    } else {
      _2405 = _2389;
      _2406 = _2390;
      _2407 = _2391;
    }
    SV_Target.x = _2405;
    SV_Target.y = _2406;
    SV_Target.z = _2407;
    SV_Target.w = _1963;
    break;
  }
  return SV_Target;
}

