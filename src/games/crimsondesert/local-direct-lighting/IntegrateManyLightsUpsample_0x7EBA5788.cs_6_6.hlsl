#include "../shared.h"
#include "../local-direct-lighting/local_light_common.hlsl"
#include "../lighting/diffuse_brdf.hlsli"

struct ManyLightsData {
  float4 _position;
  float4 _color;
  uint2 _up;
  uint2 _look;
};


Texture2D<float4> __3__36__0__0__g_puddleMask : register(t135, space36);

Texture2D<float> __3__36__0__0__g_lightProfile : register(t48, space36);

Texture2D<float2> __3__36__0__0__g_iblBrdfLookup : register(t152, space36);

StructuredBuffer<ManyLightsData> __3__37__0__0__g_manyLightsDataBuffer : register(t4, space37);

Texture2D<uint2> __3__36__0__0__g_manyLightsHitData : register(t178, space36);

Texture2D<uint> __3__36__0__0__g_tiledManyLightsMasks : register(t15, space36);

Texture2D<uint4> __3__36__0__0__g_baseColor : register(t19, space36);

Texture2D<float4> __3__36__0__0__g_normal : register(t20, space36);

Texture2D<uint> __3__36__0__0__g_depthStencil : register(t52, space36);

RWTexture2D<float4> __3__38__0__1__g_sceneDiffuseUAV : register(u3, space38);

RWTexture2D<float4> __3__38__0__1__g_specularResultUAV : register(u12, space38);

cbuffer __3__35__0__0__SceneConstantBuffer : register(b13, space35) {
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

cbuffer __3__35__0__0__ExposureConstantBuffer : register(b17, space35) {
  float4 _exposure0 : packoffset(c000.x);
  float4 _exposure1 : packoffset(c001.x);
  float4 _exposure2 : packoffset(c002.x);
  float4 _exposure3 : packoffset(c003.x);
  float4 _exposure4 : packoffset(c004.x);
};

cbuffer __3__35__0__0__TileConstantBuffer : register(b44, space35) {
  uint4 g_tileIndex[4096] : packoffset(c000.x);
};

cbuffer __3__1__0__0__RenderVoxelConstants : register(b0, space1) {
  float4 _lightingParams : packoffset(c000.x);
  float4 _tiledRadianceCacheParams : packoffset(c001.x);
};

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

[numthreads(16, 16, 1)]
void main(
  uint3 SV_DispatchThreadID : SV_DispatchThreadID,
  uint3 SV_GroupID : SV_GroupID,
  uint3 SV_GroupThreadID : SV_GroupThreadID,
  uint SV_GroupIndex : SV_GroupIndex
) {
  int _17[4];
  int _24 = (int)(SV_GroupID.x) & 3;
  int _25 = (uint)((uint)(_24)) >> 1;
  _17[0] = ((g_tileIndex[(SV_GroupID.x) >> 5]).x);
  _17[1] = ((g_tileIndex[(SV_GroupID.x) >> 5]).y);
  _17[2] = ((g_tileIndex[(SV_GroupID.x) >> 5]).z);
  _17[3] = ((g_tileIndex[(SV_GroupID.x) >> 5]).w);
  int _43 = _17[(((uint)(SV_GroupID.x) >> 3) & 3)];
  int _47 = select((((int)(SV_GroupID.x) & 4) == 0), _43, ((uint)((uint)(_43)) >> 16));
  uint _59 = __3__36__0__0__g_tiledManyLightsMasks.Load(int3(((uint)((((uint)((_24 - (_25 << 1)) << 4)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_47) << 5)) & 8160))) >> 5), ((uint)((((uint)(_25 << 4)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_47)) >> 3) & 8160))) >> 5), 0));
  half _326;
  half _330;
  bool _331;
  bool _336;
  half _337;
  bool _340;
  half _341;
  bool _342;
  float _353;
  half _364;
  float _414;
  float _415;
  float _416;
  float _536;
  float _537;
  float _538;
  float _652;
  float _653;
  float _654;
  float _655;
  float _709;
  float _710;
  float _711;
  float _735;
  float _768;
  float _769;
  float _770;
  [branch]
  if (!((_59.x & 1) == 0)) {
    if (_lightingParams.z > 0.0f) {
      uint _70 = __3__36__0__0__g_depthStencil.Load(int3(((int)((((uint)((_24 - (_25 << 1)) << 4)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_47) << 5)) & 8160)))), ((int)((((uint)(_25 << 4)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_47)) >> 3) & 8160)))), 0));
      float _74 = float((uint)((uint)(_70.x & 16777215))) * 5.960465188081798e-08f;
      if (!(((_74 < 1.0000000116860974e-07f)) || ((_74 == 1.0f)))) {
        int _79 = (uint)((uint)(_70.x)) >> 24;
        int _80 = _79 & 127;
        float _83 = max(1.0000000116860974e-07f, _74);
        float _92 = _bufferSizeAndInvSize.z * (float((uint)((((uint)((_24 - (_25 << 1)) << 4)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_47) << 5)) & 8160)))) + 0.5f);
        float _93 = _bufferSizeAndInvSize.w * (float((uint)((((uint)(_25 << 4)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_47)) >> 3) & 8160)))) + 0.5f);
        float _95 = (_92 * 2.0f) + -1.0f;
        float _97 = 1.0f - (_93 * 2.0f);
        float _133 = mad((_invViewProjRelative[3].z), _83, mad((_invViewProjRelative[3].y), _97, (_95 * (_invViewProjRelative[3].x)))) + (_invViewProjRelative[3].w);
        float _134 = (mad((_invViewProjRelative[0].z), _83, mad((_invViewProjRelative[0].y), _97, (_95 * (_invViewProjRelative[0].x)))) + (_invViewProjRelative[0].w)) / _133;
        float _135 = (mad((_invViewProjRelative[1].z), _83, mad((_invViewProjRelative[1].y), _97, (_95 * (_invViewProjRelative[1].x)))) + (_invViewProjRelative[1].w)) / _133;
        float _136 = (mad((_invViewProjRelative[2].z), _83, mad((_invViewProjRelative[2].y), _97, (_95 * (_invViewProjRelative[2].x)))) + (_invViewProjRelative[2].w)) / _133;
        float _143 = 1.0f / sqrt(((_135 * _135) + (_134 * _134)) + (_136 * _136));
        uint4 _145 = __3__36__0__0__g_baseColor.Load(int3(((int)((((uint)((_24 - (_25 << 1)) << 4)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_47) << 5)) & 8160)))), ((int)((((uint)(_25 << 4)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_47)) >> 3) & 8160)))), 0));
        float4 _151 = __3__36__0__0__g_normal.Load(int3(((int)((((uint)((_24 - (_25 << 1)) << 4)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_47) << 5)) & 8160)))), ((int)((((uint)(_25 << 4)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_47)) >> 3) & 8160)))), 0));
        half _160 = half(float((uint)((uint)(((uint)((uint)(_145.x)) >> 8) & 255))) * 0.003921568859368563f);
        half _164 = half(float((uint)((uint)(_145.x & 255))) * 0.003921568859368563f);
        half _169 = half(float((uint)((uint)(((uint)((uint)(_145.y)) >> 8) & 255))) * 0.003921568859368563f);
        half _178 = half(float((uint)((uint)(((uint)((uint)(_145.z)) >> 8) & 255))) * 0.003921568859368563f);
        uint _190 = uint((_151.w * 3.0f) + 0.5f);
        float _201 = (saturate(_151.x * 1.0009784698486328f) * 2.0f) + -1.0f;
        float _202 = (saturate(_151.y * 1.0009784698486328f) * 2.0f) + -1.0f;
        float _203 = (saturate(_151.z * 1.0009784698486328f) * 2.0f) + -1.0f;
        float _205 = rsqrt(dot(float3(_201, _202, _203), float3(_201, _202, _203)));
        half _209 = half(_205 * _201);
        half _210 = half(_205 * _202);
        half _211 = half(_203 * _205);
        half _214 = (half(float((uint)((uint)(((uint)((uint)(_145.w)) >> 8) & 255))) * 0.003921568859368563f) * 2.0h) + -1.0h;
        half _215 = (half(float((uint)((uint)(_145.w & 255))) * 0.003921568859368563f) * 2.0h) + -1.0h;
        float _220 = float(_214 + _215) * 0.5f;
        float _221 = float(_214 - _215) * 0.5f;
        float _225 = (1.0f - abs(_220)) - abs(_221);
        float _227 = rsqrt(dot(float3(_220, _221, _225), float3(_220, _221, _225)));
        float _234 = float(_209);
        float _235 = float(_210);
        float _236 = float(_211);
        float _238 = select((_211 >= 0.0h), 1.0f, -1.0f);
        float _241 = -0.0f - (1.0f / (_238 + _236));
        float _242 = _235 * _241;
        float _243 = _242 * _234;
        float _244 = _238 * _234;
        float _251 = float(half(_227 * _220));
        float _252 = float(half(_227 * _221));
        float _253 = float(half(_227 * _225));
        half _265 = half(mad(_253, _234, mad(_252, _243, (_251 * (((_244 * _234) * _241) + 1.0f)))));
        half _266 = half(mad(_253, _235, mad(_252, ((_242 * _235) + _238), ((_251 * _238) * _243))));
        half _267 = half(mad(_253, _236, mad(_252, (-0.0f - _235), (-0.0f - (_244 * _251)))));
        half _269 = rsqrt(dot(half3(_265, _266, _267), half3(_265, _266, _267)));
        half _276 = saturate(_160 * _160);
        half _277 = saturate(_164 * _164);
        half _278 = saturate(_169 * _169);
        half _297 = saturate(saturate(((_277 * 0.3395996h) + (_276 * 0.61328125h)) + (_278 * 0.04736328h)));
        half _298 = saturate(saturate(((_277 * 0.9165039h) + (_276 * 0.07019043h)) + (_278 * 0.013450623h)));
        half _299 = saturate(saturate(((_277 * 0.109558105h) + (_276 * 0.020614624h)) + (_278 * 0.8696289h)));
        half _300 = max(0.020004272h, _178);
        half _301 = saturate(half(float((uint)((uint)(_145.y & 255))) * 0.003921568859368563f));
        int _303 = _79 & 126;
        if ((uint)_80 > (uint)10) {
          half _308 = select(((((uint)_80 < (uint)20)) || ((_80 == 107))), 0.0h, _301);
          bool __defer_304_325 = false;
          if (!(((_303 == 96)) || ((_80 == 98)))) {
            if ((uint)(_80 + -105) < (uint)2) {
              if ((int)(_190) == 1) {
                _326 = 0.0h;
              } else {
                _326 = _308;
              }
              __defer_304_325 = true;
            } else {
              if (_80 == 65) {
                _326 = 0.0h;
                __defer_304_325 = true;
              } else {
                if (((_80 == 24)) || ((_80 == 29))) {
                  _330 = 0.0h;
                  _331 = (_80 == 19);
                  if (!(((_303 == 26)) || ((_80 == 28)))) {
                    _336 = _331;
                    _337 = _330;
                    _340 = _336;
                    _341 = _337;
                    _342 = (_80 == 107);
                  } else {
                    _340 = _331;
                    _341 = _330;
                    _342 = true;
                  }
                } else {
                  _326 = _308;
                  __defer_304_325 = true;
                }
              }
            }
          } else {
            _326 = 0.0h;
            __defer_304_325 = true;
          }
          if (__defer_304_325) {
            bool _327 = (_80 == 19);
            if (!((uint)(_80 + -105) < (uint)2)) {
              _330 = _326;
              _331 = _327;
              if (!(((_303 == 26)) || ((_80 == 28)))) {
                _336 = _331;
                _337 = _330;
                _340 = _336;
                _341 = _337;
                _342 = (_80 == 107);
              } else {
                _340 = _331;
                _341 = _330;
                _342 = true;
              }
            } else {
              _340 = _327;
              _341 = _326;
              _342 = true;
            }
          }
        } else {
          _336 = false;
          _337 = _301;
          _340 = _336;
          _341 = _337;
          _342 = (_80 == 107);
        }
        bool _344 = (_303 == 64);
        bool _346 = (_lightingParams.x > 0.5f);
        if (_346) {
          float4 _350 = __3__36__0__0__g_puddleMask.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_92, _93), 0.0f);
          _353 = _350.y;
        } else {
          _353 = 0.0f;
        }
        float _354 = float(_269 * _265);
        float _355 = float(_269 * _266);
        float _356 = float(_269 * _267);
        if (_80 == 53) {
          _364 = saturate(((_298 + _297) + _299) * 1.2001953h);
        } else {
          _364 = 1.0h;
        }
        half _370 = (0.7001953h / min(max(max(max(_297, _298), _299), 0.010002136h), 0.7001953h)) * _364;
        float _383 = float((((_370 * _297) + -0.040008545h) * _341) + 0.040008545h);
        float _384 = float((((_370 * _298) + -0.040008545h) * _341) + 0.040008545h);
        float _385 = float((((_370 * _299) + -0.040008545h) * _341) + 0.040008545h);
        if (_346) {
          float _394 = float(saturate(rsqrt(dot(half3(_209, _210, _211), half3(_209, _210, _211))) * _210));
          float _395 = _394 * _394;
          float _396 = _395 * _395;
          float _397 = _396 * _396;
          float _400 = (_397 * _397) * (_353 * select((((_80 == 29)) || (((_340) || (_342)))), 0.0f, 1.0f));
          float _405 = _354 - (_400 * _354);
          float _406 = (_400 * (1.0f - _355)) + _355;
          float _407 = _356 - (_400 * _356);
          float _409 = rsqrt(dot(float3(_405, _406, _407), float3(_405, _406, _407)));
          _414 = (_405 * _409);
          _415 = (_406 * _409);
          _416 = (_407 * _409);
        } else {
          _414 = _354;
          _415 = _355;
          _416 = _356;
        }
        float _417 = float(_300);
        float _418 = _417 * _417;
        float _419 = _418 * _418;
        float _421 = float(_300 * 0.60009766h);
        float _422 = _421 * _421;
        float _423 = _422 * _422;
        uint2 _425 = __3__36__0__0__g_manyLightsHitData.Load(int3(((int)((((uint)((_24 - (_25 << 1)) << 4)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_47) << 5)) & 8160)))), ((int)((((uint)(_25 << 4)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_47)) >> 3) & 8160)))), 0));
        int _435 = select(((_425.x | _425.y) != 0), (((uint)((uint)(_425.x)) >> 16) & 32767), 32767);
        float _438 = __3__37__0__0__g_manyLightsDataBuffer[_435]._position.x;
        float _439 = __3__37__0__0__g_manyLightsDataBuffer[_435]._position.y;
        float _440 = __3__37__0__0__g_manyLightsDataBuffer[_435]._position.z;
        float _442 = __3__37__0__0__g_manyLightsDataBuffer[_435]._color.x;
        float _443 = __3__37__0__0__g_manyLightsDataBuffer[_435]._color.y;
        float _444 = __3__37__0__0__g_manyLightsDataBuffer[_435]._color.z;
        {
          float3 _corrected_color = ApplyLocalLightHueCorrection(
              float3(_442, _443, _444),
              LOCAL_LIGHT_HUE_CORRECTION,
              LOCAL_LIGHT_SATURATION);
          _442 = _corrected_color.x;
          _443 = _corrected_color.y;
          _444 = _corrected_color.z;
        }
        float _445 = __3__37__0__0__g_manyLightsDataBuffer[_435]._color.w;
        int _447 = __3__37__0__0__g_manyLightsDataBuffer[_435]._up.x;
        int _448 = __3__37__0__0__g_manyLightsDataBuffer[_435]._up.y;
        int _450 = __3__37__0__0__g_manyLightsDataBuffer[_435]._look.x;
        int _451 = __3__37__0__0__g_manyLightsDataBuffer[_435]._look.y;
        float _454 = _438 - _134;
        float _455 = _439 - _135;
        float _456 = _440 - _136;
        float _462 = sqrt(((_454 * _454) + (_455 * _455)) + (_456 * _456));
        float _463 = 1.0f / _462;
        float _464 = _463 * _454;
        float _465 = _463 * _455;
        float _466 = _463 * _456;
        float _471 = f16tof32(((uint)(_447 & 65535)));
        float _472 = f16tof32(((uint)((uint)((uint)(_447)) >> 16)));
        float _473 = f16tof32(((uint)(_448 & 65535)));
        float _474 = f16tof32(((uint)((uint)((uint)(_448)) >> 16)));
        float _476 = rsqrt(dot(float3(_471, _472, _473), float3(_471, _472, _473)));
        float _480 = f16tof32(((uint)(_450 & 65535)));
        float _481 = f16tof32(((uint)((uint)((uint)(_450)) >> 16)));
        float _482 = f16tof32(((uint)(_451 & 65535)));
        float _484 = rsqrt(dot(float3(_480, _481, _482), float3(_480, _481, _482)));
        float _485 = _484 * _480;
        float _486 = _484 * _481;
        float _487 = _484 * _482;
        if (!(!(_474 >= 0.0f))) {
          float _497 = mad(_466, (_476 * _473), mad(_465, (_476 * _472), ((_464 * _471) * _476)));
          float _500 = mad(_466, _487, mad(_465, _486, (_485 * _464)));
          float _508 = atan((-0.0f - _500) / (-0.0f - _497));
          bool _511 = (_497 > -0.0f);
          bool _512 = (_497 == -0.0f);
          bool _513 = (_500 <= -0.0f);
          bool _514 = (_500 > -0.0f);
          float _530 = __3__36__0__0__g_lightProfile.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(((asin(dot(float3(_464, _465, _466), float3(_485, _486, _487))) * 0.31830987334251404f) + 0.5f), ((saturate(abs(select(((_512) && (_513)), 0.5f, select(((_512) && (_514)), -0.5f, (select(((_511) && (_514)), (_508 + -3.1415927410125732f), select(((_511) && (_513)), (_508 + 3.1415927410125732f), _508)) * 0.31830987334251404f))))) * f16tof32(((uint)((uint)((uint)(_451)) >> 16)))) + _474)), 0.0f);
          _536 = (_530.x * _442);
          _537 = (_530.x * _443);
          _538 = (_530.x * _444);
        } else {
          _536 = _442;
          _537 = _443;
          _538 = _444;
        }
        float _539 = abs(_445);
        float _548 = _143 * _134;
        float _549 = _143 * _135;
        float _550 = _143 * _136;
        float _551 = _464 * _462;
        float _552 = _465 * _462;
        float _553 = _466 * _462;
        float _554 = -0.0f - _548;
        float _555 = -0.0f - _549;
        float _556 = -0.0f - _550;
        float _558 = dot(float3(_554, _555, _556), float3(_354, _355, _356)) * 2.0f;
        float _562 = _554 - (_558 * _354);
        float _563 = _555 - (_558 * _355);
        float _564 = _556 - (_558 * _356);
        float _565 = dot(float3(_551, _552, _553), float3(_562, _563, _564));
        float _569 = (_562 * _565) - _551;
        float _570 = (_563 * _565) - _552;
        float _571 = (_564 * _565) - _553;
        float _579 = saturate(_539 / sqrt(((_569 * _569) + (_570 * _570)) + (_571 * _571)));
        float _583 = (_569 * _579) + _551;
        float _584 = (_570 * _579) + _552;
        float _585 = (_571 * _579) + _553;
        float _587 = rsqrt(dot(float3(_583, _584, _585), float3(_583, _584, _585)));
        float _588 = _583 * _587;
        float _589 = _584 * _587;
        float _590 = _585 * _587;
        float _591 = _588 - _548;
        float _592 = _589 - _549;
        float _593 = _590 - _550;
        float _595 = rsqrt(dot(float3(_591, _592, _593), float3(_591, _592, _593)));
        float _596 = _591 * _595;
        float _597 = _592 * _595;
        float _598 = _593 * _595;
        float _599 = dot(float3(_354, _355, _356), float3(_588, _589, _590));
        float _600 = dot(float3(_414, _415, _416), float3(_588, _589, _590));
        float _602 = saturate(dot(float3(_354, _355, _356), float3(_554, _555, _556)));
        float _604 = saturate(dot(float3(_414, _415, _416), float3(_596, _597, _598)));
        float _605 = dot(float3(_554, _555, _556), float3(_596, _597, _598));
        if (!(_599 <= 0.0f)) {
          float _609 = saturate(1.0f - _605);
          float _610 = _609 * _609;
          float _612 = (_610 * _610) * _609;
          float _615 = _612 * saturate(_384 * 50.0f);
          float _616 = 1.0f - _612;
          float _624 = saturate(_600);
          float _625 = 1.0f - _418;
          float _637 = (((_604 * _419) - _604) * _604) + 1.0f;
          float _641 = (_419 / ((_637 * _637) * 3.1415927410125732f)) * (0.5f / ((((_602 * _625) + _418) * _600) + (_602 * ((_600 * _625) + _418))));
          _652 = (max((((_616 * _383) + _615) * _641), 0.0f) * _624);
          _653 = (max((((_616 * _384) + _615) * _641), 0.0f) * _624);
          _654 = (max((((_616 * _385) + _615) * _641), 0.0f) * _624);
          // Material Improvements: optional diffuse BRDF replacement, otherwise vanilla diffuse.
          if (DIFFUSE_BRDF_MODE >= 2.0f) {
            float _rndx_sNdotL = saturate(_599);
            float _rndx_LdotV = dot(float3(_588, _589, _590), float3(_554, _555, _556));
            _655 = _rndx_sNdotL * EON_DiffuseScalar(_rndx_sNdotL, _602, _rndx_LdotV, _417);
          } else if (DIFFUSE_BRDF_MODE >= 1.0f) {
            float _rndx_sNdotL = saturate(_599);
            _655 = _rndx_sNdotL * HammonDiffuseScalar(_rndx_sNdotL, _602, _604, _605, _417);
          } else {
            _655 = (_599 * 0.31830987334251404f);
          }
        } else {
          _652 = 0.0f;
          _653 = 0.0f;
          _654 = 0.0f;
          _655 = 0.0f;
        }
        if (((_80 != 65)) && (_344)) {
          float _663 = saturate(1.0f - _605);
          float _664 = _663 * _663;
          float _666 = (_664 * _664) * _663;
          float _669 = _666 * saturate(_384 * 50.0f);
          float _670 = 1.0f - _666;
          float _678 = 1.0f - _422;
          float _690 = (((_604 * _423) - _604) * _604) + 1.0f;
          float _694 = (_423 / ((_690 * _690) * 3.1415927410125732f)) * (0.5f / ((((_602 * _678) + _422) * _600) + (_602 * ((_600 * _678) + _422))));
          float _701 = saturate(_600) * 0.39990234375f;
          _709 = ((max((((_670 * _383) + _669) * _694), 0.0f) * _701) + (_652 * 0.60009765625f));
          _710 = ((max((((_670 * _384) + _669) * _694), 0.0f) * _701) + (_653 * 0.60009765625f));
          _711 = ((max((((_670 * _385) + _669) * _694), 0.0f) * _701) + (_654 * 0.60009765625f));
        } else {
          _709 = _652;
          _710 = _653;
          _711 = _654;
        }
        // Material Improvements: diffraction tint is disabled unless the material gate is on.
        if (DIFFRACTION > 0.0f && float(_341) > 0.0f) {
          float3 _rndx_dShift = DiffractionShiftAndSpeckleCS(
              _604, _602, _417,
              float2(_92, _93), (_nearFarProj.x / _83),
              float3(_596, _597, _598),
              float3(_414, _415, _416),
              float3(_383, _384, _385));
          float3 _rndx_dMod = lerp(1.0f, _rndx_dShift, DIFFRACTION * float(_341));
          _709 *= _rndx_dMod.x;
          _710 *= _rndx_dMod.y;
          _711 *= _rndx_dMod.z;
        }
        // Material Improvements: smooth terminator is gated separately and defaults off.
        if (SMOOTH_TERMINATOR > 0.0f) {
          float _rndx_st = CallistoSmoothTerminator(_599, _605, _604, SMOOTH_TERMINATOR, 0.5f);
          _655 *= _rndx_st;
          _709 *= _rndx_st;
          _710 *= _rndx_st;
          _711 *= _rndx_st;
        }
        float _713 = saturate(select((_539 > 99999.0f), 1.0f, (1.0f / max((_539 * _539), (_462 * _462))))) * (float((bool)(uint)((float((uint)((uint)(_425.x & 65535))) * 0.015609979629516602f) >= 1000.0f)) * asfloat(_425.y));
        float _714 = _713 * _536;
        float _715 = _713 * _537;
        float _716 = _713 * _538;
        float _720 = float(_178);
        if ((((int)(_190) != 3)) && (_344)) {
          _735 = select((_cavityParams.z > 0.0f), 0.0f, 1.0f);
        } else {
          _735 = saturate(exp2((_720 * _720) * ((_nearFarProj.x / _83) * -0.005770780146121979f)));
        }
        float _739 = select((_cavityParams.x == 0.0f), 1.0f, _735);
        float _740 = float(_341);
        float _741 = float(_297);
        float _742 = float(_298);
        float _743 = float(_299);
        float _750 = 0.699999988079071f / min(max(max(max(_741, _742), _743), 0.009999999776482582f), 0.699999988079071f);
        float _760 = (((_750 * _741) + -0.03999999910593033f) * _740) + 0.03999999910593033f;
        float _761 = (((_750 * _742) + -0.03999999910593033f) * _740) + 0.03999999910593033f;
        float _762 = (((_750 * _743) + -0.03999999910593033f) * _740) + 0.03999999910593033f;
        if (_344) {
          _768 = (_760 * _739);
          _769 = (_761 * _739);
          _770 = (_762 * _739);
        } else {
          _768 = _760;
          _769 = _761;
          _770 = _762;
        }
        float2 _775 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(min(0.9900000095367432f, saturate(dot(float3(_554, _555, _556), float3(_414, _415, _416)))), (1.0f - _417)), 0.0f);
        float _787 = (_709 * _714) / max(0.009999999776482582f, ((_775.x * _768) + _775.y));
        float _788 = (_710 * _715) / max(0.009999999776482582f, ((_775.x * _769) + _775.y));
        float _789 = (_711 * _716) / max(0.009999999776482582f, ((_775.x * _770) + _775.y));
        float _790 = dot(float3(_787, _788, _789), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
        float _796 = min((_exposure3.w * 8192.0f), _790) / max(9.999999974752427e-07f, _790);
        float _799 = _exposure4.x * _655;
        float _812 = min(30000.0f, (-0.0f - min(0.0f, (-0.0f - (_787 * _796)))));
        float _813 = min(30000.0f, (-0.0f - min(0.0f, (-0.0f - (_788 * _796)))));
        float _814 = min(30000.0f, (-0.0f - min(0.0f, (-0.0f - (_789 * _796)))));
        float _827 = min(30000.0f, (-0.0f - min(0.0f, (-0.0f - (_714 * _799)))));
        float _828 = min(30000.0f, (-0.0f - min(0.0f, (-0.0f - (_715 * _799)))));
        float _829 = min(30000.0f, (-0.0f - min(0.0f, (-0.0f - (_716 * _799)))));
        float _831 = dot(float3(_827, _828, _829), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)) / _exposure4.x;
        __3__38__0__1__g_sceneDiffuseUAV[int2(((int)((((uint)((_24 - (_25 << 1)) << 4)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_47) << 5)) & 8160)))), ((int)((((uint)(_25 << 4)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_47)) >> 3) & 8160)))))] = float4(_827, _828, _829, 0.0f);
        [branch]
        if (((((((_812 > 0.0f)) || ((_813 > 0.0f)))) || ((_814 > 0.0f)))) || ((_831 > 0.0f))) {
          __3__38__0__1__g_specularResultUAV[int2(((int)((((uint)((_24 - (_25 << 1)) << 4)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_47) << 5)) & 8160)))), ((int)((((uint)(_25 << 4)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_47)) >> 3) & 8160)))))] = float4(_812, _813, _814, _831);
        }
      }
    }
  }
}
