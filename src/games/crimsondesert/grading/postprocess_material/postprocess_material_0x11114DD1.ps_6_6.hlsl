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
  float _38 = (pow(_28.x, 0.012683313339948654f));
  float _39 = (pow(_28.y, 0.012683313339948654f));
  float _40 = (pow(_28.z, 0.012683313339948654f));
  int _77 = WaveReadLaneFirst(_materialIndex);
  int _86 = WaveReadLaneFirst(_materialIndex);
  float _94 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_86 < (uint)170000), _86, 0)) + 0u))]._cameraSinIntensity);
  int _95 = WaveReadLaneFirst(_materialIndex);
  float _115 = _time.x * WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_77 < (uint)170000), _77, 0)) + 0u))]._cameraSpeed);
  float _116 = _115 + -1.0f;
  float _118 = sin(_time.x * 0.10000000149011612f);
  float _120 = (_118 + 3.0f) + _115;
  float _121 = _115 * 0.13089969754219055f;
  float _123 = sin(_121 + 1.7000000476837158f);
  float _128 = _116 * 0.13089969754219055f;
  float _130 = sin(_128 + 1.7000000476837158f);
  float _131 = _130 * _94;
  float _134 = _131 * 2.0f;
  float _135 = (cos(_128) * _94) * _131;
  float _136 = _120 * 0.13089969754219055f;
  float _139 = sin(_136 + 1.7000000476837158f) * _94;
  float _145 = _139 - sin(_time.x * 0.0010000000474974513f);
  float _147 = ((cos(_136) * _94) * _139) + -1.0f;
  float _148 = 3.1415927410125732f / WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_95 < (uint)170000), _95, 0)) + 0u))]._cameraFov);
  float _151 = (_94 * 2.0f) * (_123 - _130);
  float _152 = (((_94 * _94) * _123) * cos(_121)) - _135;
  float _154 = rsqrt(dot(float3(_151, _152, 1.0f), float3(_151, _152, 1.0f)));
  float _155 = _154 * _151;
  float _156 = _154 * _152;
  float _157 = -0.0f - _155;
  float _159 = rsqrt(dot(float3(_154, 0.0f, _157), float3(_154, 0.0f, _157)));
  float _160 = _159 * _154;
  float _161 = _159 * _157;
  float _165 = _148 * ((_23 - (_srcTargetSizeAndInv.x * 0.5f)) / _srcTargetSizeAndInv.y);
  float _170 = _148 * ((_25 - (_srcTargetSizeAndInv.y * 0.5f)) / _srcTargetSizeAndInv.y);
  float _171 = _156 * _170;
  float _175 = ((_160 * _165) + _155) + (_161 * _171);
  float _176 = (((_160 * _154) - (_161 * _155)) * _170) + _156;
  float _177 = ((_161 * _165) + _154) - (_160 * _171);
  float _179 = rsqrt(dot(float3(_175, _176, _177), float3(_175, _176, _177)));
  float _180 = _175 * _179;
  float _181 = _176 * _179;
  float _182 = _177 * _179;
  float _185 = sin(-0.0f - _131) * 0.4000000059604645f;
  float _186 = cos(_185);
  float _187 = sin(_185);
  float _189 = mad(_187, _181, (_180 * _186));
  float _192 = mad(_186, _181, (-0.0f - (_187 * _180)));
  int _193 = WaveReadLaneFirst(_materialIndex);
  float _201 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_193 < (uint)170000), _193, 0)) + 0u))]._stardustDensity);
  float _202 = _131 * 2.6666667461395264f;
  float _203 = _135 * 1.3333333730697632f;
  float _204 = _116 * 1.3333333730697632f;
  float _205 = floor(_202);
  float _206 = floor(_203);
  float _207 = floor(_204);
  float _208 = 1.0f / _189;
  float _209 = 1.0f / _192;
  float _210 = 1.0f / _182;
  float _226 = float((int)(((int)(uint)((int)(_189 > 0.0f))) - ((int)(uint)((int)(_189 < 0.0f)))));
  float _227 = float((int)(((int)(uint)((int)(_192 > 0.0f))) - ((int)(uint)((int)(_192 < 0.0f)))));
  float _228 = float((int)(((int)(uint)((int)(_182 > 0.0f))) - ((int)(uint)((int)(_182 < 0.0f)))));
  float _229 = _201 * 30.0f;
  float _231 = _226 * 0.5f;
  float _232 = _227 * 0.5f;
  float _233 = _228 * 0.5f;
  float _248;
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
  int _261;
  float _358;
  float _359;
  float _360;
  float _361;
  float _362;
  float _363;
  float _364;
  float _396;
  float _397;
  float _398;
  float _400;
  float _401;
  float _402;
  float _455;
  float _456;
  float _457;
  float _458;
  float _459;
  float _460;
  int _461;
  float _536;
  float _868;
  float _869;
  float _870;
  float _871;
  float _872;
  float _873;
  int _874;
  float _949;
  float _1051;
  float _1139;
  float _1140;
  float _1141;
  float _1142;
  float _1265;
  float _1326;
  float _1327;
  float _1328;
  float _1999;
  float _2245;
  float _2246;
  float _2247;
  float _2367;
  float _2368;
  float _2369;
  float _2390;
  float _2391;
  float _2392;
  float _2425;
  float _2426;
  float _2427;
  float _2441;
  float _2442;
  float _2443;
  if (_229 > 0.0f) {
    _248 = _205;
    _249 = _206;
    _250 = _207;
    _251 = (_208 * (((0.5f - _202) + _231) + _205));
    _252 = (_209 * (((0.5f - _203) + _232) + _206));
    _253 = (_210 * (((0.5f - _204) + _233) + _207));
    _254 = 0.0f;
    _255 = 0.0f;
    _256 = 0.0f;
    _257 = 0.0f;
    _258 = 0.0f;
    _259 = 0.0f;
    _260 = 0.0f;
    _261 = 0;
    while(true) {
      float _271 = frac(sin(dot(float3(_248, _249, _250), float3(127.0999984741211f, 311.70001220703125f, 74.69999694824219f))) * 43758.546875f);
      float _272 = frac(sin(dot(float3(_248, _249, _250), float3(269.5f, 183.3000030517578f, 246.10000610351562f))) * 43758.546875f);
      float _273 = frac(sin(dot(float3(_248, _249, _250), float3(113.5f, 271.8999938964844f, 124.5999984741211f))) * 43758.546875f);
      float _276 = _time.x * _271;
      float _296 = (_248 - _202) + min(max(((cos(_276 + _271) * 0.10000000149011612f) + _271), 0.014999999664723873f), 0.9850000143051147f);
      float _298 = (_249 - _203) + min(max(((cos(_276 + _272) * 0.10000000149011612f) + _272), 0.014999999664723873f), 0.9850000143051147f);
      float _300 = (_250 - _204) + min(max(((cos(_276 + _273) * 0.10000000149011612f) + _273), 0.014999999664723873f), 0.9850000143051147f);
      float _301 = dot(float3(_296, _298, _300), float3(_189, _192, _182));
      float _305 = _296 - (_301 * _189);
      float _306 = _298 - (_301 * _192);
      float _307 = _300 - (_301 * _182);
      bool __branch_chain_247;
      if (!(((_301 > 0.0f)) && (((_301 * 0.75f) < 50.0f)))) {
        _358 = _254;
        _359 = _255;
        _360 = _256;
        _361 = _257;
        _362 = _258;
        _363 = _259;
        _364 = _260;
        __branch_chain_247 = true;
      } else {
        float _327 = saturate((sqrt(((_305 * _305) + (_306 * _306)) + (_307 * _307)) + -0.007499999832361937f) * 133.33334350585938f);
        float _332 = 1.0f - ((_327 * _327) * (3.0f - (_327 * 2.0f)));
        float _336 = saturate((_301 - _229) / (-0.0f - _229));
        float _341 = ((_336 * _336) * (3.0f - (_336 * 2.0f))) * _332;
        float _343 = _332 * (_341 / _301);
        float _344 = _343 * ((_254 * 0.4000000059604645f) + 0.6000000238418579f);
        float _345 = _343 * ((_255 * 0.4000000059604645f) + 0.6000000238418579f);
        float _346 = _343 * ((_256 * 0.4000000059604645f) + 0.6000000238418579f);
        float _347 = 1.0f - _260;
        float _352 = (_344 * _347) + _257;
        float _353 = (_345 * _347) + _258;
        float _354 = (_346 * _347) + _259;
        float _355 = (_341 * _347) + _260;
        if (!(_355 > 0.9900000095367432f)) {
          _358 = _344;
          _359 = _345;
          _360 = _346;
          _361 = _352;
          _362 = _353;
          _363 = _354;
          _364 = _355;
          __branch_chain_247 = true;
        } else {
          _396 = _352;
          _397 = _353;
          _398 = _354;
          __branch_chain_247 = false;
        }
      }
      if (__branch_chain_247) {
        _358 = _254;
        _359 = _255;
        _360 = _256;
        _361 = _257;
        _362 = _258;
        _363 = _259;
        _364 = _260;
      }
      float _378 = (select((_252 < _251), 0.0f, 1.0f) * _226) * select((_253 < _251), 0.0f, 1.0f);
      float _380 = (select((_251 < _252), 0.0f, 1.0f) * _227) * select((_253 < _252), 0.0f, 1.0f);
      float _382 = (select((_251 < _253), 0.0f, 1.0f) * _228) * select((_252 < _253), 0.0f, 1.0f);
      if (float((int)(_261 + 1)) < _229) {
        _248 = (_378 + _248);
        _249 = (_380 + _249);
        _250 = (_382 + _250);
        _251 = ((_378 * _208) + _251);
        _252 = ((_380 * _209) + _252);
        _253 = ((_382 * _210) + _253);
        _254 = _358;
        _255 = _359;
        _256 = _360;
        _257 = _361;
        _258 = _362;
        _259 = _363;
        _260 = _364;
        _261 = (_261 + 1);
        continue;
      } else {
        _396 = _361;
        _397 = _362;
        _398 = _363;
      }
      _400 = _396;
      _401 = _397;
      _402 = _398;
      break;
    }
  } else {
    _400 = 0.0f;
    _401 = 0.0f;
    _402 = 0.0f;
  }
  int _403 = WaveReadLaneFirst(_materialIndex);
  int _412 = WaveReadLaneFirst(_materialIndex);
  float _420 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_412 < (uint)170000), _412, 0)) + 0u))]._cubeScale);
  int _421 = WaveReadLaneFirst(_materialIndex);
  float _429 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_421 < (uint)170000), _421, 0)) + 0u))]._cubeDistance);
  int _430 = WaveReadLaneFirst(_materialIndex);
  float _439 = floor(_134);
  float _440 = floor(_135);
  float _441 = floor(_116);
  _455 = _439;
  _456 = _440;
  _457 = _441;
  _458 = ((((0.5f - _134) + _231) + _439) * _208);
  _459 = ((((0.5f - _135) + _232) + _440) * _209);
  _460 = ((((1.5f - _115) + _233) + _441) * _210);
  _461 = 0;
  while(true) {
    float _462 = _455 * 0.3499999940395355f;
    float _463 = _456 * 0.3499999940395355f;
    float _464 = _457 * 0.3499999940395355f;
    float _478 = (_455 + -0.5f) + frac(sin(dot(float3(_462, _463, _464), float3(127.0999984741211f, 311.70001220703125f, 74.69999694824219f))) * 43758.546875f);
    float _480 = (_456 + -0.5f) + frac(sin(dot(float3(_462, _463, _464), float3(269.5f, 183.3000030517578f, 246.10000610351562f))) * 43758.546875f);
    float _482 = (_457 + -0.5f) + frac(sin(dot(float3(_462, _463, _464), float3(113.5f, 271.8999938964844f, 124.5999984741211f))) * 43758.546875f);
    float _486 = frac(_478 * 0.1031000018119812f);
    float _487 = frac(_480 * 0.1031000018119812f);
    float _488 = frac(_482 * 0.1031000018119812f);
    float _492 = dot(float3(_486, _487, _488), float3((_487 + 19.190000534057617f), (_488 + 19.190000534057617f), (_486 + 19.190000534057617f)));
    float _498 = frac(((_487 + _486) + (_492 * 2.0f)) * (_492 + _488));
    float _499 = _482 * 0.13089969754219055f;
    float _502 = sin(_499 + 1.7000000476837158f) * _94;
    float _507 = _478 - (_502 * 2.0f);
    float _508 = _480 - ((cos(_499) * _94) * _502);
    bool __defer_454_665 = false;
    if (!(abs(select((_508 < 0.0f), 0.5f, 0.0f) + _508) > 0.3499999940395355f) || ((abs(select((_508 < 0.0f), 0.5f, 0.0f) + _508) > 0.3499999940395355f) && (!(sqrt((_508 * _508) + (_507 * _507)) > (_429 - ((_498 * 6.0f) * exp2(log2(saturate(_460 * 0.015625f)) * 2.200000047683716f))))))) {
      __defer_454_665 = true;
    } else {
      bool _529 = (_498 < 0.3499999940395355f);
      if (!_529) {
        _536 = ((_498 + _457) + _time.x);
      } else {
        _536 = 0.0f;
      }
      float _539 = select(_529, 0.0f, ((_536 * 2.0f) + _456));
      float _540 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_430 < (uint)170000), _430, 0)) + 0u))]._cubeMinScale) * 0.25f;
      float _543 = min(max((_498 * 0.4000000059604645f), _540), _420);
      float _545 = (_134 + -0.5f) - _478;
      float _547 = (_135 + -0.5f) - _480;
      float _549 = (_115 + -1.5f) - _482;
      float _550 = cos(_536);
      float _551 = sin(_536);
      float _553 = mad(_551, _547, (_550 * _549));
      float _558 = mad(_551, _192, (_550 * _182));
      float _561 = mad(_550, _192, (-0.0f - (_182 * _551)));
      float _562 = cos(_539);
      float _563 = sin(_539);
      float _570 = mad(_563, _558, (_562 * _189));
      float _573 = mad(_562, _558, (-0.0f - (_189 * _563)));
      float _574 = 1.0f / _570;
      float _575 = 1.0f / _561;
      float _576 = 1.0f / _573;
      float _577 = _574 * mad(_563, _553, (_562 * _545));
      float _578 = _575 * mad(_550, _547, (-0.0f - (_549 * _551)));
      float _579 = _576 * mad(_562, _553, (-0.0f - (_545 * _563)));
      float _583 = abs(_574) * _543;
      float _584 = abs(_575) * _543;
      float _585 = abs(_576) * _543;
      float _589 = (-0.0f - _577) - _583;
      float _590 = (-0.0f - _578) - _584;
      float _591 = (-0.0f - _579) - _585;
      float _596 = max(max(_589, _590), _591);
      float _598 = min(min((_583 - _577), (_584 - _578)), (_585 - _579));
      float _631 = (select((_589 < _590), 0.0f, 1.0f) * float((int)(((int)(uint)((int)(_570 < 0.0f))) - ((int)(uint)((int)(_570 > 0.0f)))))) * select((_589 < _591), 0.0f, 1.0f);
      float _633 = (select((_590 < _589), 0.0f, 1.0f) * float((int)(((int)(uint)((int)(_561 < 0.0f))) - ((int)(uint)((int)(_561 > 0.0f)))))) * select((_590 < _591), 0.0f, 1.0f);
      float _634 = (select((_591 < _589), 0.0f, 1.0f) * float((int)(((int)(uint)((int)(_573 < 0.0f))) - ((int)(uint)((int)(_573 > 0.0f)))))) * select((_591 < _590), 0.0f, 1.0f);
      float _635 = -0.0f - _536;
      float _636 = cos(_635);
      float _637 = sin(_635);
      float _639 = mad(_637, _633, (_634 * _636));
      float _640 = -0.0f - _637;
      float _642 = mad(_636, _633, (_634 * _640));
      float _644 = mad(_637, _642, (_639 * _636));
      float _646 = mad(_636, _642, (_639 * _640));
      float _647 = -0.0f - _539;
      float _648 = cos(_647);
      float _649 = sin(_647);
      float _651 = mad(_649, _644, (_648 * _631));
      float _654 = mad(_648, _644, (-0.0f - (_631 * _649)));
      float _656 = mad(_649, _654, (_651 * _648));
      float _659 = mad(_648, _654, (-0.0f - (_649 * _651)));
      float _663 = select((((_596 > _598)) || ((_598 < 0.0f))), 0.0f, _596);
      if (_663 > 0.0f) {
        float _699 = (_663 * _189) + _134;
        float _700 = (_663 * _192) + _135;
        float _701 = (_663 * _182) + _116;
        int _702 = WaveReadLaneFirst(_materialIndex);
        float _712 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_702 < (uint)170000), _702, 0)) + 0u))]._lightColor.x);
        float _713 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_702 < (uint)170000), _702, 0)) + 0u))]._lightColor.y);
        float _714 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_702 < (uint)170000), _702, 0)) + 0u))]._lightColor.z);
        float _716 = rsqrt(dot(float3(_712, _713, _714), float3(_712, _713, _714)));
        float _722 = max(dot(float3((_716 * _712), (_716 * _713), (_716 * _714)), float3(_656, _646, _659)), 0.05000000074505806f) * 0.009999999776482582f;
        int _723 = WaveReadLaneFirst(_materialIndex);
        float _733 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_723 < (uint)170000), _723, 0)) + 0u))]._ambientColor.x);
        float _734 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_723 < (uint)170000), _723, 0)) + 0u))]._ambientColor.y);
        float _735 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_723 < (uint)170000), _723, 0)) + 0u))]._ambientColor.z);
        float _760 = max(0.0f, _646);
        float _764 = (_145 * 2.0f) - _699;
        float _765 = _147 - _700;
        float _766 = _120 - _701;
        float _768 = rsqrt(dot(float3(_764, _765, _766), float3(_764, _765, _766)));
        float _769 = _768 * _764;
        float _770 = _768 * _765;
        float _771 = _768 * _766;
        float _777 = sqrt(((_764 * _764) + (_765 * _765)) + (_766 * _766));
        float _778 = _777 * _777;
        float _785 = -0.0f - _769;
        float _786 = -0.0f - _770;
        float _787 = -0.0f - _771;
        float _789 = dot(float3(_785, _786, _787), float3(_656, _646, _659)) * 2.0f;
        float _814 = ((_time.x * 8.0f) + _701) * 0.02500000037252903f;
        float _818 = frac(abs(_814));
        float _825 = _699 - (_189 * 0.009999999776482582f);
        float _826 = _700 - (_192 * 0.009999999776482582f);
        float _827 = _701 - (_182 * 0.009999999776482582f);
        float _828 = floor(_825);
        float _829 = floor(_826);
        float _830 = floor(_827);
        float _831 = 1.0f / _769;
        float _832 = 1.0f / _770;
        float _833 = 1.0f / _771;
        float _849 = float((int)(((int)(uint)((int)(_769 > 0.0f))) - ((int)(uint)((int)(_769 < 0.0f)))));
        float _850 = float((int)(((int)(uint)((int)(_770 > 0.0f))) - ((int)(uint)((int)(_770 < 0.0f)))));
        float _851 = float((int)(((int)(uint)((int)(_771 > 0.0f))) - ((int)(uint)((int)(_771 < 0.0f)))));
        _868 = _828;
        _869 = _829;
        _870 = _830;
        _871 = (_831 * (((0.5f - _825) + (_849 * 0.5f)) + _828));
        _872 = (_832 * (((0.5f - _826) + (_850 * 0.5f)) + _829));
        _873 = (_833 * (((0.5f - _827) + (_851 * 0.5f)) + _830));
        _874 = 0;
        while(true) {
          float _875 = _868 * 0.3499999940395355f;
          float _876 = _869 * 0.3499999940395355f;
          float _877 = _870 * 0.3499999940395355f;
          float _891 = (_868 + -0.5f) + frac(sin(dot(float3(_875, _876, _877), float3(127.0999984741211f, 311.70001220703125f, 74.69999694824219f))) * 43758.546875f);
          float _893 = (_869 + -0.5f) + frac(sin(dot(float3(_875, _876, _877), float3(269.5f, 183.3000030517578f, 246.10000610351562f))) * 43758.546875f);
          float _895 = (_870 + -0.5f) + frac(sin(dot(float3(_875, _876, _877), float3(113.5f, 271.8999938964844f, 124.5999984741211f))) * 43758.546875f);
          float _899 = frac(_891 * 0.1031000018119812f);
          float _900 = frac(_893 * 0.1031000018119812f);
          float _901 = frac(_895 * 0.1031000018119812f);
          float _905 = dot(float3(_899, _900, _901), float3((_900 + 19.190000534057617f), (_901 + 19.190000534057617f), (_899 + 19.190000534057617f)));
          float _911 = frac(((_900 + _899) + (_905 * 2.0f)) * (_905 + _901));
          float _912 = _895 * 0.13089969754219055f;
          float _915 = sin(_912 + 1.7000000476837158f) * _94;
          float _920 = _891 - (_915 * 2.0f);
          float _921 = _893 - ((cos(_912) * _94) * _915);
          bool __defer_867_1016 = false;
          if (!(abs(select((_921 < 0.0f), 0.5f, 0.0f) + _921) > 0.3499999940395355f) || ((abs(select((_921 < 0.0f), 0.5f, 0.0f) + _921) > 0.3499999940395355f) && (!(sqrt((_921 * _921) + (_920 * _920)) > (_429 - ((_911 * 6.0f) * exp2(log2(saturate(_873 * 0.015625f)) * 2.200000047683716f))))))) {
            __defer_867_1016 = true;
          } else {
            bool _942 = (_911 < 0.3499999940395355f);
            if (!_942) {
              _949 = ((_911 + _870) + _time.x);
            } else {
              _949 = 0.0f;
            }
            float _952 = select(_942, 0.0f, ((_949 * 2.0f) + _869));
            float _955 = min(max((_911 * 0.4000000059604645f), _540), _420);
            float _957 = (_825 + -0.5f) - _891;
            float _959 = (_826 + -0.5f) - _893;
            float _961 = (_827 + -0.5f) - _895;
            float _962 = cos(_949);
            float _963 = sin(_949);
            float _965 = mad(_963, _959, (_962 * _961));
            float _970 = mad(_963, _770, (_962 * _771));
            float _974 = cos(_952);
            float _975 = sin(_952);
            float _986 = 1.0f / mad(_975, _970, (_974 * _769));
            float _987 = 1.0f / mad(_962, _770, (-0.0f - (_771 * _963)));
            float _988 = 1.0f / mad(_974, _970, (-0.0f - (_769 * _975)));
            float _989 = _986 * mad(_975, _965, (_974 * _957));
            float _990 = _987 * mad(_962, _959, (-0.0f - (_961 * _963)));
            float _991 = _988 * mad(_974, _965, (-0.0f - (_957 * _975)));
            float _995 = abs(_986) * _955;
            float _996 = abs(_987) * _955;
            float _997 = abs(_988) * _955;
            float _1008 = max(max(((-0.0f - _989) - _995), ((-0.0f - _990) - _996)), ((-0.0f - _991) - _997));
            float _1010 = min(min((_995 - _989), (_996 - _990)), (_997 - _991));
            float _1014 = select((((_1008 > _1010)) || ((_1010 < 0.0f))), 0.0f, _1008);
            if (_1014 > 0.0f) {
              _1051 = select((_1014 < _777), 0.0f, 1.0f);
            } else {
              __defer_867_1016 = true;
            }
          }
          if (__defer_867_1016) {
            float _1030 = (select((_872 < _871), 0.0f, 1.0f) * _849) * select((_873 < _871), 0.0f, 1.0f);
            float _1032 = (select((_871 < _872), 0.0f, 1.0f) * _850) * select((_873 < _872), 0.0f, 1.0f);
            float _1034 = (select((_871 < _873), 0.0f, 1.0f) * _851) * select((_872 < _873), 0.0f, 1.0f);
            if ((int)(_874 + 1) < (int)64) {
              _868 = (_1030 + _868);
              _869 = (_1032 + _869);
              _870 = (_1034 + _870);
              _871 = ((_1030 * _831) + _871);
              _872 = ((_1032 * _832) + _872);
              _873 = ((_1034 * _833) + _873);
              _874 = (_874 + 1);
              continue;
            } else {
              _1051 = 1.0f;
            }
          }
          int _1052 = WaveReadLaneFirst(_materialIndex);
          float _1062 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1052 < (uint)170000), _1052, 0)) + 0u))]._globalColor.x);
          float _1063 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1052 < (uint)170000), _1052, 0)) + 0u))]._globalColor.y);
          float _1064 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1052 < (uint)170000), _1052, 0)) + 0u))]._globalColor.z);
          float _1089 = dot(float3(_769, _770, _771), float3(_656, _646, _659));
          float _1091 = max(_1089, 0.05000000074505806f) * (1.0f / ((_778 * 0.05000000074505806f) + 1.0f));
          float _1097 = 1.0f / ((_778 * 0.10000000149011612f) + 1.0f);
          float _1099 = max(_1089, 0.009999999776482582f) * _1097;
          float _1100 = _1099 * 0.07323896884918213f;
          float _1108 = _1097 * exp2(log2(max(dot(float3((_785 - (_789 * _656)), (_786 - (_789 * _646)), (_787 - (_789 * _659))), float3((-0.0f - _189), (-0.0f - _192), (-0.0f - _182))), 0.0f)) * 100.0f);
          float _1110 = _1108 * 0.3185468018054962f;
          float _1115 = (pow(_1110, 0.8333333134651184f));
          float _1119 = select(((select((_814 >= (-0.0f - _814)), _818, (-0.0f - _818)) * 40.0f) > 4.0f), 0.0f, 1.0f);
          float _1123 = (_663 * 0.10000000149011612f) + 1.0f;
          float _1124 = ((_1115 + (_1099 * 0.14647793769836426f)) * _1119) / _1123;
          float _1126 = (_1108 * 0.07323896884918213f) + _722;
          _1139 = (((_1126 + (_760 * select((_733 < 0.040449999272823334f), (_733 * 0.07739938050508499f), exp2(log2((_733 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)))) + ((_1100 + (_1091 * select((_1062 < 0.040449999272823334f), (_1062 * 0.07739938050508499f), exp2(log2((_1062 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)))) * _1051)) + _1124);
          _1140 = (((_1126 + (_760 * select((_734 < 0.040449999272823334f), (_734 * 0.07739938050508499f), exp2(log2((_734 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)))) + ((_1100 + (_1091 * select((_1063 < 0.040449999272823334f), (_1063 * 0.07739938050508499f), exp2(log2((_1063 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)))) * _1051)) + _1124);
          _1141 = (((((select((_735 < 0.040449999272823334f), (_735 * 0.07739938050508499f), exp2(log2((_735 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)) * _760) + _722) + _1110) + (((_1099 * 0.21404112875461578f) + (_1091 * select((_1064 < 0.040449999272823334f), (_1064 * 0.07739938050508499f), exp2(log2((_1064 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)))) * _1051)) + (((_1115 + (_1099 * 0.8959768414497375f)) * _1119) / _1123));
          _1142 = _663;
          break;
        }
      } else {
        __defer_454_665 = true;
      }
    }
    if (__defer_454_665) {
      float _679 = (select((_459 < _458), 0.0f, 1.0f) * _226) * select((_460 < _458), 0.0f, 1.0f);
      float _681 = (select((_458 < _459), 0.0f, 1.0f) * _227) * select((_460 < _459), 0.0f, 1.0f);
      float _683 = (select((_458 < _460), 0.0f, 1.0f) * _228) * select((_459 < _460), 0.0f, 1.0f);
      if ((int)(_461 + 1) < (int)64) {
        _455 = (_679 + _455);
        _456 = (_681 + _456);
        _457 = (_683 + _457);
        _458 = ((_679 * _208) + _458);
        _459 = ((_681 * _209) + _459);
        _460 = ((_683 * _210) + _460);
        _461 = (_461 + 1);
        continue;
      } else {
        _1139 = 0.0f;
        _1140 = 0.0f;
        _1141 = 0.0f;
        _1142 = 50.0f;
      }
    }
    int _1143 = WaveReadLaneFirst(_materialIndex);
    float _1153 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1143 < (uint)170000), _1143, 0)) + 0u))]._fogColor.x);
    float _1154 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1143 < (uint)170000), _1143, 0)) + 0u))]._fogColor.y);
    float _1155 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1143 < (uint)170000), _1143, 0)) + 0u))]._fogColor.z);
    float _1183 = exp2(log2(_1142 * 0.019999999552965164f) * 6.0f);
    float _1193 = ((_1183 * (select((_1153 < 0.040449999272823334f), (_1153 * 0.07739938050508499f), exp2(log2((_1153 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)) - _1139)) + _1139) * 1.2000000476837158f;
    float _1194 = ((_1183 * (select((_1154 < 0.040449999272823334f), (_1154 * 0.07739938050508499f), exp2(log2((_1154 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)) - _1140)) + _1140) * 1.2000000476837158f;
    float _1195 = ((_1183 * (select((_1155 < 0.040449999272823334f), (_1155 * 0.07739938050508499f), exp2(log2((_1155 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f)) - _1141)) + _1141) * 1.2000000476837158f;
    int _1196 = WaveReadLaneFirst(_materialIndex);
    float _1206 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1196 < (uint)170000), _1196, 0)) + 0u))]._centerGlowColor.x);
    float _1207 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1196 < (uint)170000), _1196, 0)) + 0u))]._centerGlowColor.y);
    float _1208 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1196 < (uint)170000), _1196, 0)) + 0u))]._centerGlowColor.z);
    int _1239 = WaveReadLaneFirst(_materialIndex);
    float _1248 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1239 < (uint)170000), _1239, 0)) + 0u))]._centerGlowRadius) * ((sin(_time.x * 5.0f) * 0.050000011920928955f) + 0.949999988079071f);
    float _1250 = (_131 - _145) * 2.0f;
    float _1251 = _135 - _147;
    float _1252 = -4.0f - _118;
    float _1253 = dot(float3(_1250, _1251, _1252), float3(_189, _192, _182));
    float _1258 = (_1253 * _1253) - (dot(float3(_1250, _1251, _1252), float3(_1250, _1251, _1252)) - (_1248 * _1248));
    if (!(_1258 < 0.0f)) {
      _1265 = ((-0.0f - _1253) - sqrt(_1258));
    } else {
      _1265 = 0.0f;
    }
    if (((_1265 > 0.0f)) && ((_1265 < _1142))) {
      float _1270 = 50.0f / _1248;
      float _1271 = _1250 / _1248;
      float _1272 = _1251 / _1248;
      float _1273 = _1252 / _1248;
      float _1274 = dot(float3(_189, _192, _182), float3(_1271, _1272, _1273));
      float _1276 = dot(float3(_1271, _1272, _1273), float3(_1271, _1272, _1273)) + -1.0f;
      float _1278 = (_1274 * _1274) - _1276;
      if (!(_1278 < 0.0f)) {
        float _1281 = sqrt(_1278);
        float _1283 = (-0.0f - _1274) - _1281;
        float _1284 = _1281 - _1274;
        if (!(((_1284 < 0.0f)) || ((_1283 > _1270)))) {
          float _1289 = max(_1283, 0.0f);
          float _1290 = min(_1284, _1270);
          float _1303 = ((((-0.0f - _1276) - (_1290 * _1274)) + ((_1290 * _1290) * -0.3333333432674408f)) * _1290) + (((((_1289 * 0.3333333432674408f) + _1274) * _1289) + _1276) * _1289);
          float _1304 = _1303 * 0.75f;
          if (_1304 > 0.0f) {
            float _1307 = _1304 * _1304;
            float _1309 = _1304 * (_1307 * _1307);
            float _1310 = _1309 * _1309;
            float _1312 = (_1310 * _1310) * 5.0f;
            float _1316 = _1304 * _1303;
            float _1318 = _1316 * 0.22500000894069672f;
            _1326 = (((_1312 * select((_1206 < 0.040449999272823334f), (_1206 * 0.07739938050508499f), exp2(log2((_1206 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f))) + _1193) + (_1316 * 0.07500000298023224f));
            _1327 = (((_1312 * select((_1207 < 0.040449999272823334f), (_1207 * 0.07739938050508499f), exp2(log2((_1207 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f))) + _1194) + _1318);
            _1328 = (((_1312 * select((_1208 < 0.040449999272823334f), (_1208 * 0.07739938050508499f), exp2(log2((_1208 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f))) + _1195) + _1318);
          } else {
            _1326 = _1193;
            _1327 = _1194;
            _1328 = _1195;
          }
        } else {
          _1326 = _1193;
          _1327 = _1194;
          _1328 = _1195;
        }
      } else {
        _1326 = _1193;
        _1327 = _1194;
        _1328 = _1195;
      }
    } else {
      _1326 = _1193;
      _1327 = _1194;
      _1328 = _1195;
    }
    int _1332 = WaveReadLaneFirst(_materialIndex);
    float _1340 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1332 < (uint)170000), _1332, 0)) + 0u))]._tunnelTotal);
    float _1344 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_403 < (uint)170000), _403, 0)) + 0u))]._stardustIntensity) * _201;
    float _1379 = (_23 - (_srcTargetSizeAndInv.x * 0.5f)) / _srcTargetSizeAndInv.y;
    float _1380 = (_25 - (_srcTargetSizeAndInv.y * 0.5f)) / _srcTargetSizeAndInv.y;
    float _1381 = _1379 * 1.5f;
    float _1382 = _1380 * 1.5f;
    float _1386 = sqrt((_1382 * _1382) + (_1381 * _1381));
    float _1398 = frac((sin((_1380 * 0.15000000596046448f) + (_1379 * 25.5f)) * 10000.0f) * (abs(sin((_1380 * 19.5f) + _1381)) + 0.10000000149011612f));
    float _1403 = _time.x * 0.5f;
    float _1404 = _1403 + (_1379 * 22.5f);
    float _1405 = _1403 + (_1380 * 22.5f);
    float _1406 = floor(_1404);
    float _1407 = floor(_1405);
    float _1408 = frac(_1404);
    float _1409 = frac(_1405);
    float _1410 = _1406 * 17.0f;
    float _1411 = _1407 * 0.10000000149011612f;
    float _1415 = _1407 * 13.0f;
    float _1421 = frac((sin(_1411 + _1410) * 10000.0f) * (abs(sin(_1415 + _1406)) + 0.10000000149011612f));
    float _1422 = _1406 + 1.0f;
    float _1423 = _1422 * 17.0f;
    float _1432 = frac((sin(_1423 + _1411) * 10000.0f) * (abs(sin(_1415 + _1422)) + 0.10000000149011612f));
    float _1433 = _1407 + 1.0f;
    float _1434 = _1433 * 0.10000000149011612f;
    float _1438 = _1433 * 13.0f;
    float _1460 = (_1408 * _1408) * (3.0f - (_1408 * 2.0f));
    float _1472 = (lerp(_1421, _1432, _1460)) + (((_1409 * _1409) * (3.0f - (_1409 * 2.0f))) * (((frac((sin(_1434 + _1423) * 10000.0f) * (abs(sin(_1438 + _1422)) + 0.10000000149011612f)) - _1432) * _1460) + ((frac((sin(_1434 + _1410) * 10000.0f) * (abs(sin(_1438 + _1406)) + 0.10000000149011612f)) - _1421) * (1.0f - _1460))));
    int _1473 = WaveReadLaneFirst(_materialIndex);
    float _1481 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1473 < (uint)170000), _1473, 0)) + 0u))]._anamorphicWidth);
    float _1483 = (_1481 * 0.8999999761581421f) + 0.10999999940395355f;
    float _1487 = saturate((_1386 - _1483) / (-0.0f - _1483));
    float _1493 = saturate((cos(_1381) * 0.4000000059604645f) + -1.0f);
    float _1497 = (_1493 * _1493) * (3.0f - (_1493 * 2.0f));
    float _1505 = saturate(((abs(_1497 + _1382) + -0.03999999910593033f) + abs(_1382 - _1497)) * -25.0f);
    float _1508 = _1487 * _1505;
    float _1511 = ((3.0f - (_1505 * 2.0f)) * (3.0f - (_1487 * 2.0f))) * (_1508 * _1508);
    float _1513 = (_1481 * 0.5f) + 0.11999999731779099f;
    float _1514 = _1381 + -0.07999999821186066f;
    float _1515 = _1382 + 0.004999999888241291f;
    float _1523 = saturate((sqrt((_1515 * _1515) + (_1514 * _1514)) - _1513) / (-0.0f - _1513));
    float _1529 = saturate((cos(_1514) * 0.4000000059604645f) + -1.0f);
    float _1533 = (_1529 * _1529) * (3.0f - (_1529 * 2.0f));
    float _1541 = saturate(((abs(_1533 + _1515) + -0.017999999225139618f) + abs(_1515 - _1533)) * -55.55555725097656f);
    float _1544 = _1523 * _1541;
    float _1547 = ((3.0f - (_1541 * 2.0f)) * (3.0f - (_1523 * 2.0f))) * (_1544 * _1544);
    float _1549 = (_1481 * 0.699999988079071f) + 0.12999999523162842f;
    float _1550 = _1381 + 0.09000000357627869f;
    float _1551 = _1382 + -0.004999999888241291f;
    float _1559 = saturate((sqrt((_1551 * _1551) + (_1550 * _1550)) - _1549) / (-0.0f - _1549));
    float _1565 = saturate((cos(_1550) * 0.4000000059604645f) + -1.0f);
    float _1569 = (_1565 * _1565) * (3.0f - (_1565 * 2.0f));
    float _1577 = saturate(((abs(_1569 + _1551) + -0.014299999922513962f) + abs(_1551 - _1569)) * -69.93006896972656f);
    float _1580 = _1559 * _1577;
    float _1584 = _1379 * 2.25f;
    float _1585 = _1380 * 2.25f;
    float _1588 = (_1472 * 0.07999999821186066f) + 0.15000000596046448f;
    float _1592 = saturate((abs(_1585) - _1588) / (-0.0f - _1588));
    float _1596 = sqrt((_1585 * _1585) + (_1584 * _1584));
    float _1599 = saturate((_1596 + -0.800000011920929f) * -0.7692307829856873f);
    float _1615 = max(0.8999999761581421f, frac(frac((sin(_time.x * 8.550000190734863f) * 10000.0f) * (abs(sin(_time.x * 7.0f)) + 0.10000000149011612f)))) * 0.07999999821186066f;
    float _1620 = saturate(((_1596 + -0.10000000149011612f) - _1615) / (-0.12000000476837158f - _1615));
    float _1631 = saturate(((abs(_1584) * abs(_1380 * 1.6875f)) + -0.07000000029802322f) * -5.882352828979492f);
    float _1635 = (_1592 * _1599) * _1631;
    float _1641 = (((3.0f - (_1599 * 2.0f)) * (15.0f - (_1592 * 10.0f))) * (3.0f - (_1631 * 2.0f))) * (_1635 * _1635);
    float _1645 = _1472 * -0.014999999664723873f;
    float _1646 = _1645 + (_1379 * 2.8499999046325684f);
    float _1647 = _1645 + (_1380 * 2.8499999046325684f);
    float _1651 = sqrt((_1646 * _1646) + (_1647 * _1647));
    float _1654 = saturate((_1651 + -1.0f) * -1.4285714626312256f);
    float _1662 = saturate(((((_1654 * _1654) * _1651) * (3.0f - (_1654 * 2.0f))) + -0.10000000149011612f) * 2.5f);
    float _1665 = abs(_1381);
    float _1667 = atan(_1382 / _1665);
    bool _1670 = (_1665 < 0.0f);
    bool _1671 = (_1665 == 0.0f);
    bool _1672 = (_1382 >= 0.0f);
    bool _1673 = (_1382 < 0.0f);
    float _1686 = abs(-0.0f - _1381);
    float _1688 = atan(_1382 / _1686);
    bool _1691 = (_1686 < 0.0f);
    bool _1692 = (_1686 == 0.0f);
    float _1708 = saturate(-0.0f - (_1386 + -1.0f));
    int _1713 = WaveReadLaneFirst(_materialIndex);
    int _1734 = WaveReadLaneFirst(_materialIndex);
    float _1745 = (((lerp(_1398, 1.0f, 0.9700000286102295f)) * 0.8999999761581421f) * exp2(log2(((abs(sin(select(((_1672) && (_1692)), 1.2566370964050293f, select(((_1673) && (_1692)), -1.2566370964050293f, (select(((_1673) && (_1691)), (_1688 + -3.1415927410125732f), select(((_1672) && (_1691)), (_1688 + 3.1415927410125732f), _1688)) * 0.800000011920929f))))) + abs(sin(select(((_1672) && (_1671)), 1.0995573997497559f, select(((_1673) && (_1671)), -1.0995573997497559f, (select(((_1673) && (_1670)), (_1667 + -3.1415927410125732f), select(((_1672) && (_1670)), (_1667 + 3.1415927410125732f), _1667)) * 0.699999988079071f)))))) * 0.5f) * (((_1708 * _1708) * (3.0f - (_1708 * 2.0f))) - ((((_1662 * _1662) * 0.4000000059604645f) * (3.0f - (_1662 * 2.0f))) * WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1713 < (uint)170000), _1713, 0)) + 0u))]._blubIntensity)))) * 2.5f)) * WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1734 < (uint)170000), _1734, 0)) + 0u))]._middleHaloIntensity);
    int _1767 = WaveReadLaneFirst(_materialIndex);
    int _1776 = WaveReadLaneFirst(_materialIndex);
    float _1785 = (_1641 * _1641) * WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1776 < (uint)170000), _1776, 0)) + 0u))]._streakGlowIntensity);
    float _1788 = ((_1620 * _1620) * (3.0f - (_1620 * 2.0f))) * WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1767 < (uint)170000), _1767, 0)) + 0u))]._centerpoint);
    float _1794 = exp2(log2(_1788 * 1.2000000476837158f) * 5.0f);
    float _1799 = exp2(log2(_1788 * 1.100000023841858f) * 24.0f);
    float _1809 = _1794 + (_1788 * 0.20000000298023224f);
    float _1811 = (_1785 * 0.04965713247656822f) + (_1511 * 0.010022826492786407f);
    float _1817 = (((3.0f - (_1577 * 2.0f)) * (3.0f - (_1559 * 2.0f))) * (_1580 * _1580)) + _1547;
    int _1839 = WaveReadLaneFirst(_materialIndex);
    float _1847 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1839 < (uint)170000), _1839, 0)) + 0u))]._anamorphicIntensity);
    float _1857 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
    float _1861 = max(0.0f, (_1857 * (((_1340 * saturate(_1326)) + ((_400 * 5.0f) * _1344)) + (_1847 * exp2(log2(((((_1811 + (_1547 * 0.033104754984378815f)) + (((_1745 * 0.16689524054527283f) + 0.033104754984378815f) * _1745)) + _1799) + (_1809 * 0.07323896884918213f)) * 2.0f))))));
    float _1862 = max(0.0f, (_1857 * (((_1340 * saturate(_1327)) + ((_401 * 7.0f) * _1344)) + (_1847 * exp2(log2(((((_1811 + (_1817 * 0.033104754984378815f)) + ((0.07323896884918213f - (_1745 * 0.02323896810412407f)) * _1745)) + _1799) + (_1809 * 0.21404112875461578f)) * 2.0f))))));
    float _1863 = max(0.0f, (_1857 * (((_1340 * saturate(_1328)) + ((_402 * 9.0f) * _1344)) + (_1847 * exp2(log2((((((((_1817 * 0.07323896884918213f) + (_1511 * 0.033104754984378815f)) + ((0.13286834955215454f - (_1745 * 0.08286835253238678f)) * _1745)) + (_1788 * 0.06370936334133148f)) + (_1785 * 0.1098584532737732f)) + (_1794 * 0.6038274168968201f)) + _1799) * 2.0f))))));
    int _1864 = WaveReadLaneFirst(_materialIndex);
    int _1873 = WaveReadLaneFirst(_materialIndex);
    float _1887 = (1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1873 < (uint)170000), _1873, 0)) + 0u))]._borderWidth)) * 0.5f;
    float _1890 = max((abs(TEXCOORD.x + -0.5f) - _1887), 0.0f);
    float _1891 = max((abs(TEXCOORD.y + -0.5f) - _1887), 0.0f);
    int _1898 = WaveReadLaneFirst(_materialIndex);
    int _1906 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1898 < (uint)170000), _1898, 0)) + 0u))]._borderColor);
    float _1909 = float((uint)((uint)(((uint)((uint)(_1906)) >> 16) & 255)));
    float _1912 = float((uint)((uint)(((uint)((uint)(_1906)) >> 8) & 255)));
    float _1914 = float((uint)((uint)(_1906 & 255)));
    float _1944 = max(0.0010000000474974513f, _exposure0.x);
    int _1948 = WaveReadLaneFirst(_materialIndex);
    float _1957 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1948 < (uint)170000), _1948, 0)) + 0u))]._borderRatio) * saturate(sqrt((_1891 * _1891) + (_1890 * _1890)) / WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1864 < (uint)170000), _1864, 0)) + 0u))]._borderSmoothness));
    float _1964 = (_1957 * ((select(((_1909 * 0.003921568859368563f) < 0.040449999272823334f), (_1909 * 0.0003035269910469651f), exp2(log2((_1909 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _1944) - _1861)) + _1861;
    float _1965 = (_1957 * ((select(((_1912 * 0.003921568859368563f) < 0.040449999272823334f), (_1912 * 0.0003035269910469651f), exp2(log2((_1912 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _1944) - _1862)) + _1862;
    float _1966 = (_1957 * ((select(((_1914 * 0.003921568859368563f) < 0.040449999272823334f), (_1914 * 0.0003035269910469651f), exp2(log2((_1914 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _1944) - _1863)) + _1863;
    int _1967 = WaveReadLaneFirst(_materialIndex);
    float _1976 = saturate(WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnterIntro_CD[((int)((uint)(select(((uint)_1967 < (uint)170000), _1967, 0)) + 0u))]._fadeRatio));
    float _1983 = (_1976 * ((exp2(log2(max(0.0f, (_38 + -0.8359375f)) / (18.8515625f - (_38 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _1964)) + _1964;
    float _1984 = (_1976 * ((exp2(log2(max(0.0f, (_39 + -0.8359375f)) / (18.8515625f - (_39 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _1965)) + _1965;
    float _1985 = (_1976 * ((exp2(log2(max(0.0f, (_40 + -0.8359375f)) / (18.8515625f - (_40 * 18.6875f))) * 6.277394771575928f) * 10000.0f) - _1966)) + _1966;
    uint _1986 = uint(SV_Position.y);
    if (_etcParams.y == 1.0f) {
      uint2 _1993 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_1986), 0));
      _1999 = (float((uint)((uint)(_1993.x & 127))) + 0.5f);
    } else {
      _1999 = 1.0f;
    }
    if (_localToneMappingParams.w > 0.0f) {
      float3 output_color = TonemapReplacer(float3(_1983, _1984, _1985));
      _2367 = output_color.x;
      _2368 = output_color.y;
      _2369 = output_color.z;
    } else {
      _2367 = _1983;
      _2368 = _1984;
      _2369 = _1985;
    }
    if (_etcParams.y > 1.0f) {
      float _2380 = abs((TEXCOORD.x * 2.0f) + -1.0f);
      float _2381 = abs((TEXCOORD.y * 2.0f) + -1.0f);
      float _2385 = saturate(1.0f - (dot(float2(_2380, _2381), float2(_2380, _2381)) * saturate(_etcParams.y + -1.0f)));
      _2390 = (_2385 * _2367);
      _2391 = (_2385 * _2368);
      _2392 = (_2385 * _2369);
    } else {
      _2390 = _2367;
      _2391 = _2368;
      _2392 = _2369;
    }
    if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
      _2425 = select((_2390 <= 0.0031308000907301903f), (_2390 * 12.920000076293945f), (((pow(_2390, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
      _2426 = select((_2391 <= 0.0031308000907301903f), (_2391 * 12.920000076293945f), (((pow(_2391, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
      _2427 = select((_2392 <= 0.0031308000907301903f), (_2392 * 12.920000076293945f), (((pow(_2392, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    } else {
      _2425 = _2390;
      _2426 = _2391;
      _2427 = _2392;
    }
    if (!(!(_etcParams.y >= 1.0f))) {
      float _2432 = float((uint)_1986);
      if (!(_2432 < _viewDir.w)) {
        if (!(_2432 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
          _2441 = _2425;
          _2442 = _2426;
          _2443 = _2427;
        } else {
          _2441 = 0.0f;
          _2442 = 0.0f;
          _2443 = 0.0f;
        }
      } else {
        _2441 = 0.0f;
        _2442 = 0.0f;
        _2443 = 0.0f;
      }
    } else {
      _2441 = _2425;
      _2442 = _2426;
      _2443 = _2427;
    }
    float _2453 = exp2(log2(_2441 * 9.999999747378752e-05f) * 0.1593017578125f);
    float _2454 = exp2(log2(_2442 * 9.999999747378752e-05f) * 0.1593017578125f);
    float _2455 = exp2(log2(_2443 * 9.999999747378752e-05f) * 0.1593017578125f);
    SV_Target.x = exp2(log2((1.0f / ((_2453 * 18.6875f) + 1.0f)) * ((_2453 * 18.8515625f) + 0.8359375f)) * 78.84375f);
    SV_Target.y = exp2(log2((1.0f / ((_2454 * 18.6875f) + 1.0f)) * ((_2454 * 18.8515625f) + 0.8359375f)) * 78.84375f);
    SV_Target.z = exp2(log2((1.0f / ((_2455 * 18.6875f) + 1.0f)) * ((_2455 * 18.8515625f) + 0.8359375f)) * 78.84375f);
    SV_Target.w = _1999;
    break;
  }
  return SV_Target;
}

