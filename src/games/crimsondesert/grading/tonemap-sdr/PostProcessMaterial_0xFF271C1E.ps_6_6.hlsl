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
  float _39 = (pow(_29.x, 0.012683313339948654f));
  float _40 = (pow(_29.y, 0.012683313339948654f));
  float _41 = (pow(_29.z, 0.012683313339948654f));
  int _78 = WaveReadLaneFirst(_materialIndex);
  int _87 = WaveReadLaneFirst(_materialIndex);
  float _95 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_87 < (uint)170000), _87, 0)) + 0u))]._cameraSinIntensity);
  int _96 = WaveReadLaneFirst(_materialIndex);
  float _116 = _time.x * WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_78 < (uint)170000), _78, 0)) + 0u))]._cameraSpeed);
  float _117 = _116 + -1.0f;
  float _119 = sin(_time.x * 0.10000000149011612f);
  float _121 = (_119 + 3.0f) + _116;
  float _122 = _116 * 0.13089969754219055f;
  float _124 = sin(_122 + 1.7000000476837158f);
  float _129 = _117 * 0.13089969754219055f;
  float _131 = sin(_129 + 1.7000000476837158f);
  float _132 = _131 * _95;
  float _135 = _132 * 2.0f;
  float _136 = (cos(_129) * _95) * _132;
  float _137 = _121 * 0.13089969754219055f;
  float _140 = sin(_137 + 1.7000000476837158f) * _95;
  float _146 = _140 - sin(_time.x * 0.0010000000474974513f);
  float _148 = ((cos(_137) * _95) * _140) + -1.0f;
  float _149 = 3.1415927410125732f / WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_96 < (uint)170000), _96, 0)) + 0u))]._cameraFov);
  float _152 = (_95 * 2.0f) * (_124 - _131);
  float _153 = (((_95 * _95) * _124) * cos(_122)) - _136;
  float _155 = rsqrt(dot(float3(_152, _153, 1.0f), float3(_152, _153, 1.0f)));
  float _156 = _155 * _152;
  float _157 = _155 * _153;
  float _158 = -0.0f - _156;
  float _160 = rsqrt(dot(float3(_155, 0.0f, _158), float3(_155, 0.0f, _158)));
  float _161 = _160 * _155;
  float _162 = _160 * _158;
  float _166 = _149 * ((_24 - (_srcTargetSizeAndInv.x * 0.5f)) / _srcTargetSizeAndInv.y);
  float _171 = _149 * ((_26 - (_srcTargetSizeAndInv.y * 0.5f)) / _srcTargetSizeAndInv.y);
  float _172 = _157 * _171;
  float _176 = ((_161 * _166) + _156) + (_162 * _172);
  float _177 = (((_161 * _155) - (_162 * _156)) * _171) + _157;
  float _178 = ((_162 * _166) + _155) - (_161 * _172);
  float _180 = rsqrt(dot(float3(_176, _177, _178), float3(_176, _177, _178)));
  float _181 = _176 * _180;
  float _182 = _177 * _180;
  float _183 = _178 * _180;
  float _186 = sin(-0.0f - _132) * 0.4000000059604645f;
  float _187 = cos(_186);
  float _188 = sin(_186);
  float _190 = mad(_188, _182, (_181 * _187));
  float _193 = mad(_187, _182, (-0.0f - (_188 * _181)));
  int _194 = WaveReadLaneFirst(_materialIndex);
  float _202 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_194 < (uint)170000), _194, 0)) + 0u))]._stardustDensity);
  float _203 = _132 * 2.6666667461395264f;
  float _204 = _136 * 1.3333333730697632f;
  float _205 = _117 * 1.3333333730697632f;
  float _206 = floor(_203);
  float _207 = floor(_204);
  float _208 = floor(_205);
  float _209 = 1.0f / _190;
  float _210 = 1.0f / _193;
  float _211 = 1.0f / _183;
  float _227 = float((int)(((int)(uint)((int)(_190 > 0.0f))) - ((int)(uint)((int)(_190 < 0.0f)))));
  float _228 = float((int)(((int)(uint)((int)(_193 > 0.0f))) - ((int)(uint)((int)(_193 < 0.0f)))));
  float _229 = float((int)(((int)(uint)((int)(_183 > 0.0f))) - ((int)(uint)((int)(_183 < 0.0f)))));
  float _230 = _202 * 30.0f;
  float _232 = _227 * 0.5f;
  float _233 = _228 * 0.5f;
  float _234 = _229 * 0.5f;
  float _249;
  float _250;
  float _251;
  float _252;
  float _253;
  float _254;
  float _255;
  float _256;
  float _257;
  float _258;
  float _259;
  float _260;
  float _261;
  int _262;
  float _359;
  float _360;
  float _361;
  float _362;
  float _363;
  float _364;
  float _365;
  float _397;
  float _398;
  float _399;
  float _401;
  float _402;
  float _403;
  float _456;
  float _457;
  float _458;
  float _459;
  float _460;
  float _461;
  int _462;
  float _537;
  float _869;
  float _870;
  float _871;
  float _872;
  float _873;
  float _874;
  int _875;
  float _950;
  float _1052;
  float _1261;
  float _1262;
  float _1263;
  float _1264;
  float _1387;
  float _1448;
  float _1449;
  float _1450;
  float _2121;
  float _2326;
  float _2327;
  float _2328;
  float _2421;
  float _2422;
  float _2423;
  float _2477;
  float _2478;
  float _2479;
  float _2498;
  float _2499;
  float _2500;
  float _2530;
  float _2531;
  float _2532;
  float _2546;
  float _2547;
  float _2548;
  if (_230 > 0.0f) {
    _249 = _206;
    _250 = _207;
    _251 = _208;
    _252 = (_209 * (((0.5f - _203) + _232) + _206));
    _253 = (_210 * (((0.5f - _204) + _233) + _207));
    _254 = (_211 * (((0.5f - _205) + _234) + _208));
    _255 = 0.0f;
    _256 = 0.0f;
    _257 = 0.0f;
    _258 = 0.0f;
    _259 = 0.0f;
    _260 = 0.0f;
    _261 = 0.0f;
    _262 = 0;
    while(true) {
      float _272 = frac(sin(dot(float3(_249, _250, _251), float3(127.0999984741211f, 311.70001220703125f, 74.69999694824219f))) * 43758.546875f);
      float _273 = frac(sin(dot(float3(_249, _250, _251), float3(269.5f, 183.3000030517578f, 246.10000610351562f))) * 43758.546875f);
      float _274 = frac(sin(dot(float3(_249, _250, _251), float3(113.5f, 271.8999938964844f, 124.5999984741211f))) * 43758.546875f);
      float _277 = _time.x * _272;
      float _297 = (_249 - _203) + min(max(((cos(_277 + _272) * 0.10000000149011612f) + _272), 0.014999999664723873f), 0.9850000143051147f);
      float _299 = (_250 - _204) + min(max(((cos(_277 + _273) * 0.10000000149011612f) + _273), 0.014999999664723873f), 0.9850000143051147f);
      float _301 = (_251 - _205) + min(max(((cos(_277 + _274) * 0.10000000149011612f) + _274), 0.014999999664723873f), 0.9850000143051147f);
      float _302 = dot(float3(_297, _299, _301), float3(_190, _193, _183));
      float _306 = _297 - (_302 * _190);
      float _307 = _299 - (_302 * _193);
      float _308 = _301 - (_302 * _183);
      bool __branch_chain_248;
      if (!(((_302 > 0.0f)) && (((_302 * 0.75f) < 50.0f)))) {
        _359 = _255;
        _360 = _256;
        _361 = _257;
        _362 = _258;
        _363 = _259;
        _364 = _260;
        _365 = _261;
        __branch_chain_248 = true;
      } else {
        float _328 = saturate((sqrt(((_306 * _306) + (_307 * _307)) + (_308 * _308)) + -0.007499999832361937f) * 133.33334350585938f);
        float _333 = 1.0f - ((_328 * _328) * (3.0f - (_328 * 2.0f)));
        float _337 = saturate((_302 - _230) / (-0.0f - _230));
        float _342 = ((_337 * _337) * (3.0f - (_337 * 2.0f))) * _333;
        float _344 = _333 * (_342 / _302);
        float _345 = _344 * ((_255 * 0.4000000059604645f) + 0.6000000238418579f);
        float _346 = _344 * ((_256 * 0.4000000059604645f) + 0.6000000238418579f);
        float _347 = _344 * ((_257 * 0.4000000059604645f) + 0.6000000238418579f);
        float _348 = 1.0f - _261;
        float _353 = (_345 * _348) + _258;
        float _354 = (_346 * _348) + _259;
        float _355 = (_347 * _348) + _260;
        float _356 = (_342 * _348) + _261;
        if (!(_356 > 0.9900000095367432f)) {
          _359 = _345;
          _360 = _346;
          _361 = _347;
          _362 = _353;
          _363 = _354;
          _364 = _355;
          _365 = _356;
          __branch_chain_248 = true;
        } else {
          _397 = _353;
          _398 = _354;
          _399 = _355;
          __branch_chain_248 = false;
        }
      }
      if (__branch_chain_248) {
        _359 = _255;
        _360 = _256;
        _361 = _257;
        _362 = _258;
        _363 = _259;
        _364 = _260;
        _365 = _261;
      }
      float _379 = (select((_253 < _252), 0.0f, 1.0f) * _227) * select((_254 < _252), 0.0f, 1.0f);
      float _381 = (select((_252 < _253), 0.0f, 1.0f) * _228) * select((_254 < _253), 0.0f, 1.0f);
      float _383 = (select((_252 < _254), 0.0f, 1.0f) * _229) * select((_253 < _254), 0.0f, 1.0f);
      if (float((int)(_262 + 1)) < _230) {
        _249 = (_379 + _249);
        _250 = (_381 + _250);
        _251 = (_383 + _251);
        _252 = ((_379 * _209) + _252);
        _253 = ((_381 * _210) + _253);
        _254 = ((_383 * _211) + _254);
        _255 = _359;
        _256 = _360;
        _257 = _361;
        _258 = _362;
        _259 = _363;
        _260 = _364;
        _261 = _365;
        _262 = (_262 + 1);
        continue;
      } else {
        _397 = _362;
        _398 = _363;
        _399 = _364;
      }
      _401 = _397;
      _402 = _398;
      _403 = _399;
      break;
    }
  } else {
    _401 = 0.0f;
    _402 = 0.0f;
    _403 = 0.0f;
  }
  int _404 = WaveReadLaneFirst(_materialIndex);
  int _413 = WaveReadLaneFirst(_materialIndex);
  float _421 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_413 < (uint)170000), _413, 0)) + 0u))]._cubeScale);
  int _422 = WaveReadLaneFirst(_materialIndex);
  float _430 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_422 < (uint)170000), _422, 0)) + 0u))]._cubeDistance);
  int _431 = WaveReadLaneFirst(_materialIndex);
  float _440 = floor(_135);
  float _441 = floor(_136);
  float _442 = floor(_117);
  _456 = _440;
  _457 = _441;
  _458 = _442;
  _459 = ((((0.5f - _135) + _232) + _440) * _209);
  _460 = ((((0.5f - _136) + _233) + _441) * _210);
  _461 = ((((1.5f - _116) + _234) + _442) * _211);
  _462 = 0;
  while(true) {
    float _463 = _456 * 0.3499999940395355f;
    float _464 = _457 * 0.3499999940395355f;
    float _465 = _458 * 0.3499999940395355f;
    float _479 = (_456 + -0.5f) + frac(sin(dot(float3(_463, _464, _465), float3(127.0999984741211f, 311.70001220703125f, 74.69999694824219f))) * 43758.546875f);
    float _481 = (_457 + -0.5f) + frac(sin(dot(float3(_463, _464, _465), float3(269.5f, 183.3000030517578f, 246.10000610351562f))) * 43758.546875f);
    float _483 = (_458 + -0.5f) + frac(sin(dot(float3(_463, _464, _465), float3(113.5f, 271.8999938964844f, 124.5999984741211f))) * 43758.546875f);
    float _487 = frac(_479 * 0.1031000018119812f);
    float _488 = frac(_481 * 0.1031000018119812f);
    float _489 = frac(_483 * 0.1031000018119812f);
    float _493 = dot(float3(_487, _488, _489), float3((_488 + 19.190000534057617f), (_489 + 19.190000534057617f), (_487 + 19.190000534057617f)));
    float _499 = frac(((_488 + _487) + (_493 * 2.0f)) * (_493 + _489));
    float _500 = _483 * 0.13089969754219055f;
    float _503 = sin(_500 + 1.7000000476837158f) * _95;
    float _508 = _479 - (_503 * 2.0f);
    float _509 = _481 - ((cos(_500) * _95) * _503);
    bool __defer_455_666 = false;
    if (!(abs(select((_509 < 0.0f), 0.5f, 0.0f) + _509) > 0.3499999940395355f) || ((abs(select((_509 < 0.0f), 0.5f, 0.0f) + _509) > 0.3499999940395355f) && (!(sqrt((_509 * _509) + (_508 * _508)) > (_430 - ((_499 * 6.0f) * exp2(log2(saturate(_461 * 0.015625f)) * 2.200000047683716f))))))) {
      __defer_455_666 = true;
    } else {
      bool _530 = (_499 < 0.3499999940395355f);
      if (!_530) {
        _537 = ((_499 + _458) + _time.x);
      } else {
        _537 = 0.0f;
      }
      float _540 = select(_530, 0.0f, ((_537 * 2.0f) + _457));
      float _541 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_431 < (uint)170000), _431, 0)) + 0u))]._cubeMinScale) * 0.25f;
      float _544 = min(max((_499 * 0.4000000059604645f), _541), _421);
      float _546 = (_135 + -0.5f) - _479;
      float _548 = (_136 + -0.5f) - _481;
      float _550 = (_116 + -1.5f) - _483;
      float _551 = cos(_537);
      float _552 = sin(_537);
      float _554 = mad(_552, _548, (_551 * _550));
      float _559 = mad(_552, _193, (_551 * _183));
      float _562 = mad(_551, _193, (-0.0f - (_183 * _552)));
      float _563 = cos(_540);
      float _564 = sin(_540);
      float _571 = mad(_564, _559, (_563 * _190));
      float _574 = mad(_563, _559, (-0.0f - (_190 * _564)));
      float _575 = 1.0f / _571;
      float _576 = 1.0f / _562;
      float _577 = 1.0f / _574;
      float _578 = _575 * mad(_564, _554, (_563 * _546));
      float _579 = _576 * mad(_551, _548, (-0.0f - (_550 * _552)));
      float _580 = _577 * mad(_563, _554, (-0.0f - (_546 * _564)));
      float _584 = abs(_575) * _544;
      float _585 = abs(_576) * _544;
      float _586 = abs(_577) * _544;
      float _590 = (-0.0f - _578) - _584;
      float _591 = (-0.0f - _579) - _585;
      float _592 = (-0.0f - _580) - _586;
      float _597 = max(max(_590, _591), _592);
      float _599 = min(min((_584 - _578), (_585 - _579)), (_586 - _580));
      float _632 = (select((_590 < _591), 0.0f, 1.0f) * float((int)(((int)(uint)((int)(_571 < 0.0f))) - ((int)(uint)((int)(_571 > 0.0f)))))) * select((_590 < _592), 0.0f, 1.0f);
      float _634 = (select((_591 < _590), 0.0f, 1.0f) * float((int)(((int)(uint)((int)(_562 < 0.0f))) - ((int)(uint)((int)(_562 > 0.0f)))))) * select((_591 < _592), 0.0f, 1.0f);
      float _635 = (select((_592 < _590), 0.0f, 1.0f) * float((int)(((int)(uint)((int)(_574 < 0.0f))) - ((int)(uint)((int)(_574 > 0.0f)))))) * select((_592 < _591), 0.0f, 1.0f);
      float _636 = -0.0f - _537;
      float _637 = cos(_636);
      float _638 = sin(_636);
      float _640 = mad(_638, _634, (_635 * _637));
      float _641 = -0.0f - _638;
      float _643 = mad(_637, _634, (_635 * _641));
      float _645 = mad(_638, _643, (_640 * _637));
      float _647 = mad(_637, _643, (_640 * _641));
      float _648 = -0.0f - _540;
      float _649 = cos(_648);
      float _650 = sin(_648);
      float _652 = mad(_650, _645, (_649 * _632));
      float _655 = mad(_649, _645, (-0.0f - (_632 * _650)));
      float _657 = mad(_650, _655, (_652 * _649));
      float _660 = mad(_649, _655, (-0.0f - (_650 * _652)));
      float _664 = select((((_597 > _599)) || ((_599 < 0.0f))), 0.0f, _597);
      if (_664 > 0.0f) {
        float _700 = (_664 * _190) + _135;
        float _701 = (_664 * _193) + _136;
        float _702 = (_664 * _183) + _117;
        int _703 = WaveReadLaneFirst(_materialIndex);
        float _713 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_703 < (uint)170000), _703, 0)) + 0u))]._lightColor.x);
        float _714 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_703 < (uint)170000), _703, 0)) + 0u))]._lightColor.y);
        float _715 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_703 < (uint)170000), _703, 0)) + 0u))]._lightColor.z);
        float _717 = rsqrt(dot(float3(_713, _714, _715), float3(_713, _714, _715)));
        float _723 = max(dot(float3((_717 * _713), (_717 * _714), (_717 * _715)), float3(_657, _647, _660)), 0.05000000074505806f) * 0.009999999776482582f;
        int _724 = WaveReadLaneFirst(_materialIndex);
        float _734 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_724 < (uint)170000), _724, 0)) + 0u))]._ambientColor.x);
        float _735 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_724 < (uint)170000), _724, 0)) + 0u))]._ambientColor.y);
        float _736 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_724 < (uint)170000), _724, 0)) + 0u))]._ambientColor.z);
        float _761 = max(0.0f, _647);
        float _765 = (_146 * 2.0f) - _700;
        float _766 = _148 - _701;
        float _767 = _121 - _702;
        float _769 = rsqrt(dot(float3(_765, _766, _767), float3(_765, _766, _767)));
        float _770 = _769 * _765;
        float _771 = _769 * _766;
        float _772 = _769 * _767;
        float _778 = sqrt(((_765 * _765) + (_766 * _766)) + (_767 * _767));
        float _779 = _778 * _778;
        float _786 = -0.0f - _770;
        float _787 = -0.0f - _771;
        float _788 = -0.0f - _772;
        float _790 = dot(float3(_786, _787, _788), float3(_657, _647, _660)) * 2.0f;
        float _815 = ((_time.x * 8.0f) + _702) * 0.02500000037252903f;
        float _819 = frac(abs(_815));
        float _826 = _700 - (_190 * 0.009999999776482582f);
        float _827 = _701 - (_193 * 0.009999999776482582f);
        float _828 = _702 - (_183 * 0.009999999776482582f);
        float _829 = floor(_826);
        float _830 = floor(_827);
        float _831 = floor(_828);
        float _832 = 1.0f / _770;
        float _833 = 1.0f / _771;
        float _834 = 1.0f / _772;
        float _850 = float((int)(((int)(uint)((int)(_770 > 0.0f))) - ((int)(uint)((int)(_770 < 0.0f)))));
        float _851 = float((int)(((int)(uint)((int)(_771 > 0.0f))) - ((int)(uint)((int)(_771 < 0.0f)))));
        float _852 = float((int)(((int)(uint)((int)(_772 > 0.0f))) - ((int)(uint)((int)(_772 < 0.0f)))));
        _869 = _829;
        _870 = _830;
        _871 = _831;
        _872 = (_832 * (((0.5f - _826) + (_850 * 0.5f)) + _829));
        _873 = (_833 * (((0.5f - _827) + (_851 * 0.5f)) + _830));
        _874 = (_834 * (((0.5f - _828) + (_852 * 0.5f)) + _831));
        _875 = 0;
        while(true) {
          float _876 = _869 * 0.3499999940395355f;
          float _877 = _870 * 0.3499999940395355f;
          float _878 = _871 * 0.3499999940395355f;
          float _892 = (_869 + -0.5f) + frac(sin(dot(float3(_876, _877, _878), float3(127.0999984741211f, 311.70001220703125f, 74.69999694824219f))) * 43758.546875f);
          float _894 = (_870 + -0.5f) + frac(sin(dot(float3(_876, _877, _878), float3(269.5f, 183.3000030517578f, 246.10000610351562f))) * 43758.546875f);
          float _896 = (_871 + -0.5f) + frac(sin(dot(float3(_876, _877, _878), float3(113.5f, 271.8999938964844f, 124.5999984741211f))) * 43758.546875f);
          float _900 = frac(_892 * 0.1031000018119812f);
          float _901 = frac(_894 * 0.1031000018119812f);
          float _902 = frac(_896 * 0.1031000018119812f);
          float _906 = dot(float3(_900, _901, _902), float3((_901 + 19.190000534057617f), (_902 + 19.190000534057617f), (_900 + 19.190000534057617f)));
          float _912 = frac(((_901 + _900) + (_906 * 2.0f)) * (_906 + _902));
          float _913 = _896 * 0.13089969754219055f;
          float _916 = sin(_913 + 1.7000000476837158f) * _95;
          float _921 = _892 - (_916 * 2.0f);
          float _922 = _894 - ((cos(_913) * _95) * _916);
          bool __defer_868_1017 = false;
          if (!(abs(select((_922 < 0.0f), 0.5f, 0.0f) + _922) > 0.3499999940395355f) || ((abs(select((_922 < 0.0f), 0.5f, 0.0f) + _922) > 0.3499999940395355f) && (!(sqrt((_922 * _922) + (_921 * _921)) > (_430 - ((_912 * 6.0f) * exp2(log2(saturate(_874 * 0.015625f)) * 2.200000047683716f))))))) {
            __defer_868_1017 = true;
          } else {
            bool _943 = (_912 < 0.3499999940395355f);
            if (!_943) {
              _950 = ((_912 + _871) + _time.x);
            } else {
              _950 = 0.0f;
            }
            float _953 = select(_943, 0.0f, ((_950 * 2.0f) + _870));
            float _956 = min(max((_912 * 0.4000000059604645f), _541), _421);
            float _958 = (_826 + -0.5f) - _892;
            float _960 = (_827 + -0.5f) - _894;
            float _962 = (_828 + -0.5f) - _896;
            float _963 = cos(_950);
            float _964 = sin(_950);
            float _966 = mad(_964, _960, (_963 * _962));
            float _971 = mad(_964, _771, (_963 * _772));
            float _975 = cos(_953);
            float _976 = sin(_953);
            float _987 = 1.0f / mad(_976, _971, (_975 * _770));
            float _988 = 1.0f / mad(_963, _771, (-0.0f - (_772 * _964)));
            float _989 = 1.0f / mad(_975, _971, (-0.0f - (_770 * _976)));
            float _990 = _987 * mad(_976, _966, (_975 * _958));
            float _991 = _988 * mad(_963, _960, (-0.0f - (_962 * _964)));
            float _992 = _989 * mad(_975, _966, (-0.0f - (_958 * _976)));
            float _996 = abs(_987) * _956;
            float _997 = abs(_988) * _956;
            float _998 = abs(_989) * _956;
            float _1009 = max(max(((-0.0f - _990) - _996), ((-0.0f - _991) - _997)), ((-0.0f - _992) - _998));
            float _1011 = min(min((_996 - _990), (_997 - _991)), (_998 - _992));
            float _1015 = select((((_1009 > _1011)) || ((_1011 < 0.0f))), 0.0f, _1009);
            if (_1015 > 0.0f) {
              _1052 = select((_1015 < _778), 0.0f, 1.0f);
            } else {
              __defer_868_1017 = true;
            }
          }
          if (__defer_868_1017) {
            float _1031 = (select((_873 < _872), 0.0f, 1.0f) * _850) * select((_874 < _872), 0.0f, 1.0f);
            float _1033 = (select((_872 < _873), 0.0f, 1.0f) * _851) * select((_874 < _873), 0.0f, 1.0f);
            float _1035 = (select((_872 < _874), 0.0f, 1.0f) * _852) * select((_873 < _874), 0.0f, 1.0f);
            if ((int)(_875 + 1) < (int)64) {
              _869 = (_1031 + _869);
              _870 = (_1033 + _870);
              _871 = (_1035 + _871);
              _872 = ((_1031 * _832) + _872);
              _873 = ((_1033 * _833) + _873);
              _874 = ((_1035 * _834) + _874);
              _875 = (_875 + 1);
              continue;
            } else {
              _1052 = 1.0f;
            }
          }
          int _1053 = WaveReadLaneFirst(_materialIndex);
          float _1063 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1053 < (uint)170000), _1053, 0)) + 0u))]._globalColor.x);
          float _1064 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1053 < (uint)170000), _1053, 0)) + 0u))]._globalColor.y);
          float _1065 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1053 < (uint)170000), _1053, 0)) + 0u))]._globalColor.z);
          float _1090 = dot(float3(_770, _771, _772), float3(_657, _647, _660));
          float _1092 = max(_1090, 0.05000000074505806f) * (1.0f / ((_779 * 0.05000000074505806f) + 1.0f));
          float _1098 = 1.0f / ((_779 * 0.10000000149011612f) + 1.0f);
          int _1099 = WaveReadLaneFirst(_materialIndex);
          float _1109 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1099 < (uint)170000), _1099, 0)) + 0u))]._mainTintColor.x);
          float _1110 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1099 < (uint)170000), _1099, 0)) + 0u))]._mainTintColor.y);
          float _1111 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1099 < (uint)170000), _1099, 0)) + 0u))]._mainTintColor.z);
          float _1136 = max(_1090, 0.009999999776482582f);
          float _1137 = _1136 * _1098;
          int _1147 = WaveReadLaneFirst(_materialIndex);
          float _1157 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1147 < (uint)170000), _1147, 0)) + 0u))]._mainTintColor.x);
          float _1158 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1147 < (uint)170000), _1147, 0)) + 0u))]._mainTintColor.y);
          float _1159 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1147 < (uint)170000), _1147, 0)) + 0u))]._mainTintColor.z);
          float _1184 = _1098 * exp2(log2(max(dot(float3((_786 - (_790 * _657)), (_787 - (_790 * _647)), (_788 - (_790 * _660))), float3((-0.0f - _190), (-0.0f - _193), (-0.0f - _183))), 0.0f)) * 100.0f);
          int _1188 = WaveReadLaneFirst(_materialIndex);
          float _1198 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1188 < (uint)170000), _1188, 0)) + 0u))]._waveColor.x);
          float _1199 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1188 < (uint)170000), _1188, 0)) + 0u))]._waveColor.y);
          float _1200 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1188 < (uint)170000), _1188, 0)) + 0u))]._waveColor.z);
          float _1226 = _1136 * (_1098 * 2.0f);
          float _1233 = exp2(log2(_1184 * 0.3185468018054962f) * 0.8333333134651184f);
          float _1238 = select(((select((_815 >= (-0.0f - _815)), _819, (-0.0f - _819)) * 40.0f) > 4.0f), 0.0f, 1.0f);
          float _1243 = (_664 * 0.10000000149011612f) + 1.0f;
          _1261 = (((((_761 * select((_734 < 0.040449999272823334f), (_734 * 0.07739938050508499f), exp2(log2((_734 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f))) + _723) + (((_1137 * select((_1109 < 0.040449999272823334f), (_1109 * 0.07739938050508499f), exp2(log2((_1109 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f))) + (_1092 * select((_1063 < 0.040449999272823334f), (_1063 * 0.07739938050508499f), exp2(log2((_1063 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)))) * _1052)) + (select((_1157 < 0.040449999272823334f), (_1157 * 0.07739938050508499f), exp2(log2((_1157 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)) * _1184)) + (((_1233 + (_1226 * select((_1198 < 0.040449999272823334f), (_1198 * 0.07739938050508499f), exp2(log2((_1198 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)))) * _1238) / _1243));
          _1262 = (((((_761 * select((_735 < 0.040449999272823334f), (_735 * 0.07739938050508499f), exp2(log2((_735 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f))) + _723) + (((_1137 * select((_1110 < 0.040449999272823334f), (_1110 * 0.07739938050508499f), exp2(log2((_1110 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f))) + (_1092 * select((_1064 < 0.040449999272823334f), (_1064 * 0.07739938050508499f), exp2(log2((_1064 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)))) * _1052)) + (select((_1158 < 0.040449999272823334f), (_1158 * 0.07739938050508499f), exp2(log2((_1158 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)) * _1184)) + (((_1233 + (_1226 * select((_1199 < 0.040449999272823334f), (_1199 * 0.07739938050508499f), exp2(log2((_1199 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)))) * _1238) / _1243));
          _1263 = (((((select((_736 < 0.040449999272823334f), (_736 * 0.07739938050508499f), exp2(log2((_736 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)) * _761) + _723) + (((_1137 * select((_1111 < 0.040449999272823334f), (_1111 * 0.07739938050508499f), exp2(log2((_1111 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f))) + (_1092 * select((_1065 < 0.040449999272823334f), (_1065 * 0.07739938050508499f), exp2(log2((_1065 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)))) * _1052)) + (select((_1159 < 0.040449999272823334f), (_1159 * 0.07739938050508499f), exp2(log2((_1159 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)) * _1184)) + ((((_1226 * select((_1200 < 0.040449999272823334f), (_1200 * 0.07739938050508499f), exp2(log2((_1200 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f))) + _1233) * _1238) / _1243));
          _1264 = _664;
          break;
        }
      } else {
        __defer_455_666 = true;
      }
    }
    if (__defer_455_666) {
      float _680 = (select((_460 < _459), 0.0f, 1.0f) * _227) * select((_461 < _459), 0.0f, 1.0f);
      float _682 = (select((_459 < _460), 0.0f, 1.0f) * _228) * select((_461 < _460), 0.0f, 1.0f);
      float _684 = (select((_459 < _461), 0.0f, 1.0f) * _229) * select((_460 < _461), 0.0f, 1.0f);
      if ((int)(_462 + 1) < (int)64) {
        _456 = (_680 + _456);
        _457 = (_682 + _457);
        _458 = (_684 + _458);
        _459 = ((_680 * _209) + _459);
        _460 = ((_682 * _210) + _460);
        _461 = ((_684 * _211) + _461);
        _462 = (_462 + 1);
        continue;
      } else {
        _1261 = 0.0f;
        _1262 = 0.0f;
        _1263 = 0.0f;
        _1264 = 50.0f;
      }
    }
    int _1265 = WaveReadLaneFirst(_materialIndex);
    float _1275 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1265 < (uint)170000), _1265, 0)) + 0u))]._fogColor.x);
    float _1276 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1265 < (uint)170000), _1265, 0)) + 0u))]._fogColor.y);
    float _1277 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1265 < (uint)170000), _1265, 0)) + 0u))]._fogColor.z);
    float _1305 = exp2(log2(_1264 * 0.019999999552965164f) * 6.0f);
    float _1315 = ((_1305 * (select((_1275 < 0.040449999272823334f), (_1275 * 0.07739938050508499f), exp2(log2((_1275 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)) - _1261)) + _1261) * 1.2000000476837158f;
    float _1316 = ((_1305 * (select((_1276 < 0.040449999272823334f), (_1276 * 0.07739938050508499f), exp2(log2((_1276 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)) - _1262)) + _1262) * 1.2000000476837158f;
    float _1317 = ((_1305 * (select((_1277 < 0.040449999272823334f), (_1277 * 0.07739938050508499f), exp2(log2((_1277 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)) - _1263)) + _1263) * 1.2000000476837158f;
    int _1318 = WaveReadLaneFirst(_materialIndex);
    float _1328 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1318 < (uint)170000), _1318, 0)) + 0u))]._centerGlowColor.x);
    float _1329 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1318 < (uint)170000), _1318, 0)) + 0u))]._centerGlowColor.y);
    float _1330 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1318 < (uint)170000), _1318, 0)) + 0u))]._centerGlowColor.z);
    int _1361 = WaveReadLaneFirst(_materialIndex);
    float _1370 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1361 < (uint)170000), _1361, 0)) + 0u))]._centerGlowRadius) * ((sin(_time.x * 5.0f) * 0.050000011920928955f) + 0.949999988079071f);
    float _1372 = (_132 - _146) * 2.0f;
    float _1373 = _136 - _148;
    float _1374 = -4.0f - _119;
    float _1375 = dot(float3(_1372, _1373, _1374), float3(_190, _193, _183));
    float _1380 = (_1375 * _1375) - (dot(float3(_1372, _1373, _1374), float3(_1372, _1373, _1374)) - (_1370 * _1370));
    if (!(_1380 < 0.0f)) {
      _1387 = ((-0.0f - _1375) - sqrt(_1380));
    } else {
      _1387 = 0.0f;
    }
    if (((_1387 > 0.0f)) && ((_1387 < _1264))) {
      float _1392 = 50.0f / _1370;
      float _1393 = _1372 / _1370;
      float _1394 = _1373 / _1370;
      float _1395 = _1374 / _1370;
      float _1396 = dot(float3(_190, _193, _183), float3(_1393, _1394, _1395));
      float _1398 = dot(float3(_1393, _1394, _1395), float3(_1393, _1394, _1395)) + -1.0f;
      float _1400 = (_1396 * _1396) - _1398;
      if (!(_1400 < 0.0f)) {
        float _1403 = sqrt(_1400);
        float _1405 = (-0.0f - _1396) - _1403;
        float _1406 = _1403 - _1396;
        if (!(((_1406 < 0.0f)) || ((_1405 > _1392)))) {
          float _1411 = max(_1405, 0.0f);
          float _1412 = min(_1406, _1392);
          float _1425 = ((((-0.0f - _1398) - (_1412 * _1396)) + ((_1412 * _1412) * -0.3333333432674408f)) * _1412) + (((((_1411 * 0.3333333432674408f) + _1396) * _1411) + _1398) * _1411);
          float _1426 = _1425 * 0.75f;
          if (_1426 > 0.0f) {
            float _1429 = _1426 * _1426;
            float _1431 = _1426 * (_1429 * _1429);
            float _1432 = _1431 * _1431;
            float _1434 = (_1432 * _1432) * 5.0f;
            float _1438 = _1426 * _1425;
            float _1440 = _1438 * 0.22500000894069672f;
            _1448 = (((_1434 * select((_1328 < 0.040449999272823334f), (_1328 * 0.07739938050508499f), exp2(log2((_1328 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f))) + _1315) + (_1438 * 0.07500000298023224f));
            _1449 = (((_1434 * select((_1329 < 0.040449999272823334f), (_1329 * 0.07739938050508499f), exp2(log2((_1329 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f))) + _1316) + _1440);
            _1450 = (((_1434 * select((_1330 < 0.040449999272823334f), (_1330 * 0.07739938050508499f), exp2(log2((_1330 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f))) + _1317) + _1440);
          } else {
            _1448 = _1315;
            _1449 = _1316;
            _1450 = _1317;
          }
        } else {
          _1448 = _1315;
          _1449 = _1316;
          _1450 = _1317;
        }
      } else {
        _1448 = _1315;
        _1449 = _1316;
        _1450 = _1317;
      }
    } else {
      _1448 = _1315;
      _1449 = _1316;
      _1450 = _1317;
    }
    int _1454 = WaveReadLaneFirst(_materialIndex);
    float _1462 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1454 < (uint)170000), _1454, 0)) + 0u))]._tunnelTotal);
    float _1466 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_404 < (uint)170000), _404, 0)) + 0u))]._stardustIntensity) * _202;
    float _1501 = (_24 - (_srcTargetSizeAndInv.x * 0.5f)) / _srcTargetSizeAndInv.y;
    float _1502 = (_26 - (_srcTargetSizeAndInv.y * 0.5f)) / _srcTargetSizeAndInv.y;
    float _1503 = _1501 * 1.5f;
    float _1504 = _1502 * 1.5f;
    float _1508 = sqrt((_1504 * _1504) + (_1503 * _1503));
    float _1520 = frac((sin((_1502 * 0.15000000596046448f) + (_1501 * 25.5f)) * 10000.0f) * (abs(sin((_1502 * 19.5f) + _1503)) + 0.10000000149011612f));
    float _1525 = _time.x * 0.5f;
    float _1526 = _1525 + (_1501 * 22.5f);
    float _1527 = _1525 + (_1502 * 22.5f);
    float _1528 = floor(_1526);
    float _1529 = floor(_1527);
    float _1530 = frac(_1526);
    float _1531 = frac(_1527);
    float _1532 = _1528 * 17.0f;
    float _1533 = _1529 * 0.10000000149011612f;
    float _1537 = _1529 * 13.0f;
    float _1543 = frac((sin(_1533 + _1532) * 10000.0f) * (abs(sin(_1537 + _1528)) + 0.10000000149011612f));
    float _1544 = _1528 + 1.0f;
    float _1545 = _1544 * 17.0f;
    float _1554 = frac((sin(_1545 + _1533) * 10000.0f) * (abs(sin(_1537 + _1544)) + 0.10000000149011612f));
    float _1555 = _1529 + 1.0f;
    float _1556 = _1555 * 0.10000000149011612f;
    float _1560 = _1555 * 13.0f;
    float _1582 = (_1530 * _1530) * (3.0f - (_1530 * 2.0f));
    float _1594 = (lerp(_1543, _1554, _1582)) + (((_1531 * _1531) * (3.0f - (_1531 * 2.0f))) * (((frac((sin(_1556 + _1545) * 10000.0f) * (abs(sin(_1560 + _1544)) + 0.10000000149011612f)) - _1554) * _1582) + ((frac((sin(_1556 + _1532) * 10000.0f) * (abs(sin(_1560 + _1528)) + 0.10000000149011612f)) - _1543) * (1.0f - _1582))));
    int _1595 = WaveReadLaneFirst(_materialIndex);
    float _1603 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1595 < (uint)170000), _1595, 0)) + 0u))]._anamorphicWidth);
    float _1605 = (_1603 * 0.8999999761581421f) + 0.10999999940395355f;
    float _1609 = saturate((_1508 - _1605) / (-0.0f - _1605));
    float _1615 = saturate((cos(_1503) * 0.4000000059604645f) + -1.0f);
    float _1619 = (_1615 * _1615) * (3.0f - (_1615 * 2.0f));
    float _1627 = saturate(((abs(_1619 + _1504) + -0.03999999910593033f) + abs(_1504 - _1619)) * -25.0f);
    float _1630 = _1609 * _1627;
    float _1633 = ((3.0f - (_1627 * 2.0f)) * (3.0f - (_1609 * 2.0f))) * (_1630 * _1630);
    float _1635 = (_1603 * 0.5f) + 0.11999999731779099f;
    float _1636 = _1503 + -0.07999999821186066f;
    float _1637 = _1504 + 0.004999999888241291f;
    float _1645 = saturate((sqrt((_1637 * _1637) + (_1636 * _1636)) - _1635) / (-0.0f - _1635));
    float _1651 = saturate((cos(_1636) * 0.4000000059604645f) + -1.0f);
    float _1655 = (_1651 * _1651) * (3.0f - (_1651 * 2.0f));
    float _1663 = saturate(((abs(_1655 + _1637) + -0.017999999225139618f) + abs(_1637 - _1655)) * -55.55555725097656f);
    float _1666 = _1645 * _1663;
    float _1669 = ((3.0f - (_1663 * 2.0f)) * (3.0f - (_1645 * 2.0f))) * (_1666 * _1666);
    float _1671 = (_1603 * 0.699999988079071f) + 0.12999999523162842f;
    float _1672 = _1503 + 0.09000000357627869f;
    float _1673 = _1504 + -0.004999999888241291f;
    float _1681 = saturate((sqrt((_1673 * _1673) + (_1672 * _1672)) - _1671) / (-0.0f - _1671));
    float _1687 = saturate((cos(_1672) * 0.4000000059604645f) + -1.0f);
    float _1691 = (_1687 * _1687) * (3.0f - (_1687 * 2.0f));
    float _1699 = saturate(((abs(_1691 + _1673) + -0.014299999922513962f) + abs(_1673 - _1691)) * -69.93006896972656f);
    float _1702 = _1681 * _1699;
    float _1706 = _1501 * 2.25f;
    float _1707 = _1502 * 2.25f;
    float _1710 = (_1594 * 0.07999999821186066f) + 0.15000000596046448f;
    float _1714 = saturate((abs(_1707) - _1710) / (-0.0f - _1710));
    float _1718 = sqrt((_1707 * _1707) + (_1706 * _1706));
    float _1721 = saturate((_1718 + -0.800000011920929f) * -0.7692307829856873f);
    float _1737 = max(0.8999999761581421f, frac(frac((sin(_time.x * 8.550000190734863f) * 10000.0f) * (abs(sin(_time.x * 7.0f)) + 0.10000000149011612f)))) * 0.07999999821186066f;
    float _1742 = saturate(((_1718 + -0.10000000149011612f) - _1737) / (-0.12000000476837158f - _1737));
    float _1753 = saturate(((abs(_1706) * abs(_1502 * 1.6875f)) + -0.07000000029802322f) * -5.882352828979492f);
    float _1757 = (_1714 * _1721) * _1753;
    float _1763 = (((3.0f - (_1721 * 2.0f)) * (15.0f - (_1714 * 10.0f))) * (3.0f - (_1753 * 2.0f))) * (_1757 * _1757);
    float _1767 = _1594 * -0.014999999664723873f;
    float _1768 = _1767 + (_1501 * 2.8499999046325684f);
    float _1769 = _1767 + (_1502 * 2.8499999046325684f);
    float _1773 = sqrt((_1768 * _1768) + (_1769 * _1769));
    float _1776 = saturate((_1773 + -1.0f) * -1.4285714626312256f);
    float _1784 = saturate(((((_1776 * _1776) * _1773) * (3.0f - (_1776 * 2.0f))) + -0.10000000149011612f) * 2.5f);
    float _1787 = abs(_1503);
    float _1789 = atan(_1504 / _1787);
    bool _1792 = (_1787 < 0.0f);
    bool _1793 = (_1787 == 0.0f);
    bool _1794 = (_1504 >= 0.0f);
    bool _1795 = (_1504 < 0.0f);
    float _1808 = abs(-0.0f - _1503);
    float _1810 = atan(_1504 / _1808);
    bool _1813 = (_1808 < 0.0f);
    bool _1814 = (_1808 == 0.0f);
    float _1830 = saturate(-0.0f - (_1508 + -1.0f));
    int _1835 = WaveReadLaneFirst(_materialIndex);
    int _1856 = WaveReadLaneFirst(_materialIndex);
    float _1867 = (((lerp(_1520, 1.0f, 0.9700000286102295f)) * 0.8999999761581421f) * exp2(log2(((abs(sin(select(((_1794) && (_1814)), 1.2566370964050293f, select(((_1795) && (_1814)), -1.2566370964050293f, (select(((_1795) && (_1813)), (_1810 + -3.1415927410125732f), select(((_1794) && (_1813)), (_1810 + 3.1415927410125732f), _1810)) * 0.800000011920929f))))) + abs(sin(select(((_1794) && (_1793)), 1.0995573997497559f, select(((_1795) && (_1793)), -1.0995573997497559f, (select(((_1795) && (_1792)), (_1789 + -3.1415927410125732f), select(((_1794) && (_1792)), (_1789 + 3.1415927410125732f), _1789)) * 0.699999988079071f)))))) * 0.5f) * (((_1830 * _1830) * (3.0f - (_1830 * 2.0f))) - ((((_1784 * _1784) * 0.4000000059604645f) * (3.0f - (_1784 * 2.0f))) * WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1835 < (uint)170000), _1835, 0)) + 0u))]._blubIntensity)))) * 2.5f)) * WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1856 < (uint)170000), _1856, 0)) + 0u))]._middleHaloIntensity);
    int _1889 = WaveReadLaneFirst(_materialIndex);
    int _1898 = WaveReadLaneFirst(_materialIndex);
    float _1907 = (_1763 * _1763) * WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1898 < (uint)170000), _1898, 0)) + 0u))]._streakGlowIntensity);
    float _1910 = ((_1742 * _1742) * (3.0f - (_1742 * 2.0f))) * WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1889 < (uint)170000), _1889, 0)) + 0u))]._centerpoint);
    float _1916 = exp2(log2(_1910 * 1.2000000476837158f) * 5.0f);
    float _1921 = exp2(log2(_1910 * 1.100000023841858f) * 24.0f);
    float _1931 = _1916 + (_1910 * 0.20000000298023224f);
    float _1933 = (_1907 * 0.04965713247656822f) + (_1633 * 0.010022826492786407f);
    float _1939 = (((3.0f - (_1699 * 2.0f)) * (3.0f - (_1681 * 2.0f))) * (_1702 * _1702)) + _1669;
    int _1961 = WaveReadLaneFirst(_materialIndex);
    float _1969 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1961 < (uint)170000), _1961, 0)) + 0u))]._anamorphicIntensity);
    float _1979 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
    float _1983 = max(0.0f, (_1979 * (((_1462 * saturate(_1448)) + ((_401 * 5.0f) * _1466)) + (_1969 * exp2(log2(((((_1933 + (_1669 * 0.033104754984378815f)) + (((_1867 * 0.16689524054527283f) + 0.033104754984378815f) * _1867)) + _1921) + (_1931 * 0.07323896884918213f)) * 2.0f))))));
    float _1984 = max(0.0f, (_1979 * (((_1462 * saturate(_1449)) + ((_402 * 7.0f) * _1466)) + (_1969 * exp2(log2(((((_1933 + (_1939 * 0.033104754984378815f)) + ((0.07323896884918213f - (_1867 * 0.02323896810412407f)) * _1867)) + _1921) + (_1931 * 0.21404112875461578f)) * 2.0f))))));
    float _1985 = max(0.0f, (_1979 * (((_1462 * saturate(_1450)) + ((_403 * 9.0f) * _1466)) + (_1969 * exp2(log2((((((((_1939 * 0.07323896884918213f) + (_1633 * 0.033104754984378815f)) + ((0.13286834955215454f - (_1867 * 0.08286835253238678f)) * _1867)) + (_1910 * 0.06370936334133148f)) + (_1907 * 0.1098584532737732f)) + (_1916 * 0.6038274168968201f)) + _1921) * 2.0f))))));
    int _1986 = WaveReadLaneFirst(_materialIndex);
    int _1995 = WaveReadLaneFirst(_materialIndex);
    float _2009 = (1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1995 < (uint)170000), _1995, 0)) + 0u))]._borderWidth)) * 0.5f;
    float _2012 = max((abs(TEXCOORD.x + -0.5f) - _2009), 0.0f);
    float _2013 = max((abs(TEXCOORD.y + -0.5f) - _2009), 0.0f);
    int _2020 = WaveReadLaneFirst(_materialIndex);
    int _2028 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_2020 < (uint)170000), _2020, 0)) + 0u))]._borderColor);
    float _2031 = float((uint)((uint)(((uint)((uint)(_2028)) >> 16) & 255)));
    float _2034 = float((uint)((uint)(((uint)((uint)(_2028)) >> 8) & 255)));
    float _2036 = float((uint)((uint)(_2028 & 255)));
    float _2066 = max(0.0010000000474974513f, _exposure0.x);
    int _2070 = WaveReadLaneFirst(_materialIndex);
    float _2079 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_2070 < (uint)170000), _2070, 0)) + 0u))]._borderRatio) * saturate(sqrt((_2013 * _2013) + (_2012 * _2012)) / WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1986 < (uint)170000), _1986, 0)) + 0u))]._borderSmoothness));
    float _2086 = (_2079 * ((select(((_2031 * 0.003921568859368563f) < 0.040449999272823334f), (_2031 * 0.0003035269910469651f), exp2(log2((_2031 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _2066) - _1983)) + _1983;
    float _2087 = (_2079 * ((select(((_2034 * 0.003921568859368563f) < 0.040449999272823334f), (_2034 * 0.0003035269910469651f), exp2(log2((_2034 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _2066) - _1984)) + _1984;
    float _2088 = (_2079 * ((select(((_2036 * 0.003921568859368563f) < 0.040449999272823334f), (_2036 * 0.0003035269910469651f), exp2(log2((_2036 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _2066) - _1985)) + _1985;
    int _2089 = WaveReadLaneFirst(_materialIndex);
    float _2098 = saturate(WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_2089 < (uint)170000), _2089, 0)) + 0u))]._fadeRatio));
    float _2105 = (_2098 * ((exp2(log2(max(0.0f, (_39 + -0.8359375f)) / (18.8515625f - (_39 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _2086)) + _2086;
    float _2106 = (_2098 * ((exp2(log2(max(0.0f, (_40 + -0.8359375f)) / (18.8515625f - (_40 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _2087)) + _2087;
    float _2107 = (_2098 * ((exp2(log2(max(0.0f, (_41 + -0.8359375f)) / (18.8515625f - (_41 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _2088)) + _2088;
    uint _2108 = uint(SV_Position.y);
    if (_etcParams.y == 1.0f) {
      uint2 _2115 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_2108), 0));
      _2121 = (float((uint)((uint)(_2115.x & 127))) + 0.5f);
    } else {
      _2121 = 1.0f;
    }
    bool _2124 = (_localToneMappingParams.w > 0.0f);
    if (_2124) {
      float3 output_color = TonemapReplacer(float3(_2105, _2106, _2107));
      _2477 = output_color.x;
      _2478 = output_color.y;
      _2479 = output_color.z;
    } else {
      _2477 = _2105;
      _2478 = _2106;
      _2479 = _2107;
    }
    if (_etcParams.y > 1.0f) {
      float _2488 = abs((TEXCOORD.x * 2.0f) + -1.0f);
      float _2489 = abs((TEXCOORD.y * 2.0f) + -1.0f);
      float _2493 = saturate(1.0f - (dot(float2(_2488, _2489), float2(_2488, _2489)) * saturate(_etcParams.y + -1.0f)));
      _2498 = (_2493 * _2477);
      _2499 = (_2493 * _2478);
      _2500 = (_2493 * _2479);
    } else {
      _2498 = _2477;
      _2499 = _2478;
      _2500 = _2479;
    }
    if ((_2124) && ((_etcParams.z > 0.0f))) {
      _2530 = select((_2498 <= 0.0031308000907301903f), (_2498 * 12.920000076293945f), (((pow(_2498, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
      _2531 = select((_2499 <= 0.0031308000907301903f), (_2499 * 12.920000076293945f), (((pow(_2499, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
      _2532 = select((_2500 <= 0.0031308000907301903f), (_2500 * 12.920000076293945f), (((pow(_2500, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    } else {
      _2530 = _2498;
      _2531 = _2499;
      _2532 = _2500;
    }
    if (!(!(_etcParams.y >= 1.0f))) {
      float _2537 = float((uint)_2108);
      if (!(_2537 < _viewDir.w)) {
        if (!(_2537 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
          _2546 = _2530;
          _2547 = _2531;
          _2548 = _2532;
        } else {
          _2546 = 0.0f;
          _2547 = 0.0f;
          _2548 = 0.0f;
        }
      } else {
        _2546 = 0.0f;
        _2547 = 0.0f;
        _2548 = 0.0f;
      }
    } else {
      _2546 = _2530;
      _2547 = _2531;
      _2548 = _2532;
    }
    float _2558 = exp2(log2(_2546 * 9.999999747378752e-05f) * 0.1593017578125f);
    float _2559 = exp2(log2(_2547 * 9.999999747378752e-05f) * 0.1593017578125f);
    float _2560 = exp2(log2(_2548 * 9.999999747378752e-05f) * 0.1593017578125f);
    SV_Target.x = exp2(log2((1.0f / ((_2558 * 18.6875f) + 1.0f)) * ((_2558 * 18.8515625f) + 0.8359375f)) * 78.84375f);
    SV_Target.y = exp2(log2((1.0f / ((_2559 * 18.6875f) + 1.0f)) * ((_2559 * 18.8515625f) + 0.8359375f)) * 78.84375f);
    SV_Target.z = exp2(log2((1.0f / ((_2560 * 18.6875f) + 1.0f)) * ((_2560 * 18.8515625f) + 0.8359375f)) * 78.84375f);
    SV_Target.w = _2121;
    break;
  }
  return SV_Target;
}