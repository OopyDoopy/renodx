#include "../shared.h"
#include "../lighting/diffuse_brdf.hlsli"

struct ManyLightsData {
  float4 _position;
  float4 _color;
  uint2 _up;
  uint2 _look;
};


Texture2D<float4> __3__36__0__0__g_puddleMask : register(t124, space36);

Texture2D<float> __3__36__0__0__g_lightProfile : register(t40, space36);

Texture2D<float4> __3__36__0__0__g_blueNoise : register(t85, space36);

Texture2D<float4> __3__36__0__0__g_character : register(t41, space36);

Texture2D<float2> __3__36__0__0__g_iblBrdfLookup : register(t155, space36);

Texture2D<float2> __3__36__0__0__g_hairBrdfLookup : register(t157, space36);

StructuredBuffer<ManyLightsData> __3__37__0__0__g_manyLightsDataBuffer : register(t1, space37);

Texture2D<uint2> __3__36__0__0__g_manyLightsHitData : register(t10, space36);

Texture2D<uint> __3__36__0__0__g_tiledManyLightsMasks : register(t11, space36);

Texture2D<uint4> __3__36__0__0__g_baseColor : register(t15, space36);

Texture2D<float4> __3__36__0__0__g_normal : register(t16, space36);

Texture2D<uint> __3__36__0__0__g_depthStencil : register(t43, space36);

RWTexture2D<float4> __3__38__0__1__g_sceneDiffuseUAV : register(u9, space38);

RWTexture2D<float4> __3__38__0__1__g_specularResultUAV : register(u5, space38);

cbuffer __3__35__0__0__SceneConstantBuffer : register(b18, space35) {
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

cbuffer __3__35__0__0__ExposureConstantBuffer : register(b32, space35) {
  float4 _exposure0 : packoffset(c000.x);
  float4 _exposure1 : packoffset(c001.x);
  float4 _exposure2 : packoffset(c002.x);
  float4 _exposure3 : packoffset(c003.x);
  float4 _exposure4 : packoffset(c004.x);
};

cbuffer __3__35__0__0__TileConstantBuffer : register(b31, space35) {
  uint4 g_tileIndex[4096] : packoffset(c000.x);
};

cbuffer __3__35__0__0__MaterialParameterPresetTableConstantBuffer : register(b40, space35) {
  float4 _clothLightingCategory : packoffset(c000.x);
  float4 _clothLightingParameter[8] : packoffset(c001.x);
  float4 _colorPresetInfo : packoffset(c009.x);
  uint4 _colorPresetParameter[16] : packoffset(c010.x);
  float4 _debugOption : packoffset(c026.x);
};

cbuffer __3__1__0__0__RenderVoxelConstants : register(b0, space1) {
  float4 _lightingParams : packoffset(c000.x);
  float4 _tiledRadianceCacheParams : packoffset(c001.x);
};

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

[numthreads(16, 16, 1)]
void main(
  uint3 SV_DispatchThreadID : SV_DispatchThreadID,
  uint3 SV_GroupID : SV_GroupID,
  uint3 SV_GroupThreadID : SV_GroupThreadID,
  uint SV_GroupIndex : SV_GroupIndex
) {
  int _22[4];
  int _30 = (int)(SV_GroupID.x) & 3;
  int _31 = (uint)((uint)(_30)) >> 1;
  _22[0] = ((g_tileIndex[(SV_GroupID.x) >> 5]).x);
  _22[1] = ((g_tileIndex[(SV_GroupID.x) >> 5]).y);
  _22[2] = ((g_tileIndex[(SV_GroupID.x) >> 5]).z);
  _22[3] = ((g_tileIndex[(SV_GroupID.x) >> 5]).w);
  int _49 = _22[(((uint)(SV_GroupID.x) >> 3) & 3)];
  int _53 = select((((int)(SV_GroupID.x) & 4) == 0), _49, ((uint)((uint)(_49)) >> 16));
  uint _65 = __3__36__0__0__g_tiledManyLightsMasks.Load(int3(((uint)((((uint)((_30 - (_31 << 1)) << 4)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_53) << 5)) & 8160))) >> 5), ((uint)((((uint)(_31 << 4)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_53)) >> 3) & 8160))) >> 5), 0));
  half _337;
  half _341;
  bool _342;
  bool _347;
  half _348;
  bool _351;
  half _352;
  bool _353;
  half _389;
  half _390;
  half _391;
  float _392;
  float _393;
  float _412;
  float _413;
  half _420;
  half _421;
  half _422;
  float _423;
  float _424;
  float _425;
  float _434;
  int _440;
  int _462;
  int _463;
  float _464;
  float _465;
  float _466;
  float _490;
  int _491;
  float _492;
  float _498;
  int _499;
  half _500;
  float _503;
  int _504;
  half _505;
  float _562;
  int _563;
  half _564;
  float _565;
  float _566;
  float _567;
  float _568;
  half _582;
  float _635;
  float _636;
  float _637;
  float _757;
  float _758;
  float _759;
  float _1220;
  float _1221;
  float _1222;
  float _1223;
  float _1277;
  float _1278;
  float _1279;
  float _1280;
  float _1281;
  float _1282;
  float _1283;
  half _1311;
  float _1312;
  float _1313;
  float _1314;
  float _1336;
  float _1369;
  float _1370;
  float _1371;
  float _1413;
  float _1414;
  float _1546;
  float _1547;
  float _1548;
  float _1563;
  float _1564;
  float _1565;
  [branch]
  if (!((_65.x & 1) == 0)) {
    if (_lightingParams.z > 0.0f) {
      uint _76 = __3__36__0__0__g_depthStencil.Load(int3(((int)((((uint)((_30 - (_31 << 1)) << 4)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_53) << 5)) & 8160)))), ((int)((((uint)(_31 << 4)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_53)) >> 3) & 8160)))), 0));
      float _80 = float((uint)((uint)(_76.x & 16777215))) * 5.960465188081798e-08f;
      if (!(((_80 < 1.0000000116860974e-07f)) || ((_80 == 1.0f)))) {
        int _85 = (uint)((uint)(_76.x)) >> 24;
        int _86 = _85 & 127;
        float _89 = max(1.0000000116860974e-07f, _80);
        float _91 = float((uint)((((uint)((_30 - (_31 << 1)) << 4)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_53) << 5)) & 8160))));
        float _92 = float((uint)((((uint)(_31 << 4)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_53)) >> 3) & 8160))));
        float _98 = _bufferSizeAndInvSize.z * (_91 + 0.5f);
        float _99 = _bufferSizeAndInvSize.w * (_92 + 0.5f);
        float _101 = (_98 * 2.0f) + -1.0f;
        float _103 = 1.0f - (_99 * 2.0f);
        float _139 = mad((_invViewProjRelative[3].z), _89, mad((_invViewProjRelative[3].y), _103, (_101 * (_invViewProjRelative[3].x)))) + (_invViewProjRelative[3].w);
        float _140 = (mad((_invViewProjRelative[0].z), _89, mad((_invViewProjRelative[0].y), _103, (_101 * (_invViewProjRelative[0].x)))) + (_invViewProjRelative[0].w)) / _139;
        float _141 = (mad((_invViewProjRelative[1].z), _89, mad((_invViewProjRelative[1].y), _103, (_101 * (_invViewProjRelative[1].x)))) + (_invViewProjRelative[1].w)) / _139;
        float _142 = (mad((_invViewProjRelative[2].z), _89, mad((_invViewProjRelative[2].y), _103, (_101 * (_invViewProjRelative[2].x)))) + (_invViewProjRelative[2].w)) / _139;
        float _148 = sqrt(((_141 * _141) + (_140 * _140)) + (_142 * _142));
        float _149 = 1.0f / _148;
        uint4 _151 = __3__36__0__0__g_baseColor.Load(int3(((int)((((uint)((_30 - (_31 << 1)) << 4)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_53) << 5)) & 8160)))), ((int)((((uint)(_31 << 4)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_53)) >> 3) & 8160)))), 0));
        float4 _157 = __3__36__0__0__g_normal.Load(int3(((int)((((uint)((_30 - (_31 << 1)) << 4)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_53) << 5)) & 8160)))), ((int)((((uint)(_31 << 4)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_53)) >> 3) & 8160)))), 0));
        half _166 = half(float((uint)((uint)(((uint)((uint)(_151.x)) >> 8) & 255))) * 0.003921568859368563f);
        half _170 = half(float((uint)((uint)(_151.x & 255))) * 0.003921568859368563f);
        half _175 = half(float((uint)((uint)(((uint)((uint)(_151.y)) >> 8) & 255))) * 0.003921568859368563f);
        half _184 = half(float((uint)((uint)(((uint)((uint)(_151.z)) >> 8) & 255))) * 0.003921568859368563f);
        uint _200 = uint((_157.w * 3.0f) + 0.5f);
        bool _202 = ((int)(_200) == 3);
        float _212 = (saturate(_157.x * 1.0009784698486328f) * 2.0f) + -1.0f;
        float _213 = (saturate(_157.y * 1.0009784698486328f) * 2.0f) + -1.0f;
        float _214 = (saturate(_157.z * 1.0009784698486328f) * 2.0f) + -1.0f;
        float _216 = rsqrt(dot(float3(_212, _213, _214), float3(_212, _213, _214)));
        half _220 = half(_216 * _212);
        half _221 = half(_216 * _213);
        half _222 = half(_214 * _216);
        half _225 = (half(float((uint)((uint)(((uint)((uint)(_151.w)) >> 8) & 255))) * 0.003921568859368563f) * 2.0h) + -1.0h;
        half _226 = (half(float((uint)((uint)(_151.w & 255))) * 0.003921568859368563f) * 2.0h) + -1.0h;
        float _231 = float(_225 + _226) * 0.5f;
        float _232 = float(_225 - _226) * 0.5f;
        float _236 = (1.0f - abs(_231)) - abs(_232);
        float _238 = rsqrt(dot(float3(_231, _232, _236), float3(_231, _232, _236)));
        float _245 = float(_220);
        float _246 = float(_221);
        float _247 = float(_222);
        float _249 = select((_222 >= 0.0h), 1.0f, -1.0f);
        float _252 = -0.0f - (1.0f / (_249 + _247));
        float _253 = _246 * _252;
        float _254 = _253 * _245;
        float _255 = _249 * _245;
        float _262 = float(half(_238 * _231));
        float _263 = float(half(_238 * _232));
        float _264 = float(half(_238 * _236));
        half _276 = half(mad(_264, _245, mad(_263, _254, (_262 * (((_255 * _245) * _252) + 1.0f)))));
        half _277 = half(mad(_264, _246, mad(_263, ((_253 * _246) + _249), ((_262 * _249) * _254))));
        half _278 = half(mad(_264, _247, mad(_263, (-0.0f - _246), (-0.0f - (_255 * _262)))));
        half _280 = rsqrt(dot(half3(_276, _277, _278), half3(_276, _277, _278)));
        half _281 = _280 * _276;
        half _282 = _280 * _277;
        half _283 = _280 * _278;
        half _287 = saturate(_166 * _166);
        half _288 = saturate(_170 * _170);
        half _289 = saturate(_175 * _175);
        half _308 = saturate(saturate(((_288 * 0.3395996h) + (_287 * 0.61328125h)) + (_289 * 0.04736328h)));
        half _309 = saturate(saturate(((_288 * 0.9165039h) + (_287 * 0.07019043h)) + (_289 * 0.013450623h)));
        half _310 = saturate(saturate(((_288 * 0.109558105h) + (_287 * 0.020614624h)) + (_289 * 0.8696289h)));
        half _311 = max(0.020004272h, _184);
        half _312 = saturate(half(float((uint)((uint)(_151.y & 255))) * 0.003921568859368563f));
        int _314 = _85 & 126;
        if ((uint)_86 > (uint)10) {
          half _319 = select(((((uint)_86 < (uint)20)) || ((_86 == 107))), 0.0h, _312);
          bool __defer_315_336 = false;
          if (!(((_314 == 96)) || ((_86 == 98)))) {
            if ((uint)(_86 + -105) < (uint)2) {
              if ((int)(_200) == 1) {
                _337 = 0.0h;
              } else {
                _337 = _319;
              }
              __defer_315_336 = true;
            } else {
              if (_86 == 65) {
                _337 = 0.0h;
                __defer_315_336 = true;
              } else {
                if (((_86 == 24)) || ((_86 == 29))) {
                  _341 = 0.0h;
                  _342 = (_86 == 19);
                  if (!(((_314 == 26)) || ((_86 == 28)))) {
                    _347 = _342;
                    _348 = _341;
                    _351 = _347;
                    _352 = _348;
                    _353 = (_86 == 107);
                  } else {
                    _351 = _342;
                    _352 = _341;
                    _353 = true;
                  }
                } else {
                  _337 = _319;
                  __defer_315_336 = true;
                }
              }
            }
          } else {
            _337 = 0.0h;
            __defer_315_336 = true;
          }
          if (__defer_315_336) {
            bool _338 = (_86 == 19);
            if (!((uint)(_86 + -105) < (uint)2)) {
              _341 = _337;
              _342 = _338;
              if (!(((_314 == 26)) || ((_86 == 28)))) {
                _347 = _342;
                _348 = _341;
                _351 = _347;
                _352 = _348;
                _353 = (_86 == 107);
              } else {
                _351 = _342;
                _352 = _341;
                _353 = true;
              }
            } else {
              _351 = _338;
              _352 = _337;
              _353 = true;
            }
          }
        } else {
          _347 = false;
          _348 = _312;
          _351 = _347;
          _352 = _348;
          _353 = (_86 == 107);
        }
        bool _355 = (_86 == 33);
        bool _356 = (_86 == 55);
        bool _357 = (_355) || (_356);
        bool _359 = (_86 == 65);
        bool _360 = (_314 == 64);
        bool _361 = (_314 == 66);
        bool __defer_350_388 = false;
        bool __branch_chain_350;
        half _375;
        half _376;
        half _377;
        float _378;
        float _379;
        if (!(((((_86 == 54)) || (_360))) || (((_357) || (_361))))) {
          _389 = 0.0h;
          _390 = 0.0h;
          _391 = 0.0h;
          _392 = 0.0f;
          _393 = 0.0f;
          __branch_chain_350 = true;
        } else {
          float4 _368 = __3__36__0__0__g_character.Load(int3(((int)((((uint)((_30 - (_31 << 1)) << 4)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_53) << 5)) & 8160)))), ((int)((((uint)(_31 << 4)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_53)) >> 3) & 8160)))), 0));
          _375 = half(saturate(_368.x));
          _376 = half(saturate(_368.y));
          _377 = half(saturate(_368.z));
          _378 = float(_375);
          _379 = float(_376);
          if (!_361) {
            _389 = _375;
            _390 = _376;
            _391 = _377;
            _392 = _378;
            _393 = _379;
            __branch_chain_350 = true;
          } else {
            __branch_chain_350 = false;
          }
        }
        if (__branch_chain_350) {
          __defer_350_388 = true;
        } else {
          _420 = _375;
          _421 = _376;
          _422 = _377;
          _423 = ((_378 * 2.0f) + -1.0f);
          _424 = ((_379 * 2.0f) + -1.0f);
          _425 = ((float(_377) * 2.0f) + -1.0f);
        }
        if (__defer_350_388) {
          float _396 = (_392 * 2.0f) + -1.0f;
          float _397 = (_393 * 2.0f) + -1.0f;
          float _399 = 1.0f - abs(_396);
          float _400 = abs(_397);
          float _401 = _399 - _400;
          if (!(_401 >= 0.0f)) {
            _412 = ((1.0f - _400) * select((_396 >= 0.0f), 1.0f, -1.0f));
            _413 = (select((_397 >= 0.0f), 1.0f, -1.0f) * _399);
          } else {
            _412 = _396;
            _413 = _397;
          }
          float _415 = rsqrt(dot(float3(_412, _413, _401), float3(_412, _413, _401)));
          _420 = _389;
          _421 = _390;
          _422 = _391;
          _423 = (_415 * _412);
          _424 = (_415 * _413);
          _425 = (_415 * _401);
        }
        bool _427 = (_lightingParams.x > 0.5f);
        if (_427) {
          float4 _431 = __3__36__0__0__g_puddleMask.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_98, _99), 0.0f);
          _434 = _431.y;
        } else {
          _434 = 0.0f;
        }
        [branch]
        if (_357) {
          bool __defer_435_443 = false;
          if (_356) {
            if (_422 < 0.0010004044h) {
              _440 = 53;
              _462 = _440;
              _463 = ((int)(uint)((int)(_440 == 55)));
              _464 = 0.0f;
              _465 = 0.0f;
              _466 = 0.0f;
            } else {
              __defer_435_443 = true;
            }
          } else {
            if (_355) {
              __defer_435_443 = true;
            } else {
              _440 = _86;
              _462 = _440;
              _463 = ((int)(uint)((int)(_440 == 55)));
              _464 = 0.0f;
              _465 = 0.0f;
              _466 = 0.0f;
            }
          }
          if (__defer_435_443) {
            uint _447 = uint((float(_422) * 255.0f) + 0.5f);
            int _449 = ((uint)(_447) >> 4) & 7;
            if (!(_449 == 0)) {
              _462 = _86;
              _463 = 1;
              _464 = min((1.0f - ((_clothLightingParameter[_449]).y)), ((_clothLightingParameter[_449]).x));
              _465 = (float((uint)((uint)((int)(_447) & 15))) * 0.06666667014360428f);
              _466 = ((_clothLightingParameter[_449]).x);
            } else {
              _462 = _86;
              _463 = 1;
              _464 = 0.0f;
              _465 = 0.0f;
              _466 = 0.0f;
            }
          }
        } else {
          _462 = _86;
          _463 = ((int)(uint)((int)(_357)));
          _464 = 0.0f;
          _465 = 0.0f;
          _466 = 0.0f;
        }
        float _467 = float(_352);
        bool __defer_461_502 = false;
        if (_462 == 66) {
          _503 = _467;
          _504 = 66;
          _505 = 0.0h;
          __defer_461_502 = true;
        } else {
          bool __defer_469_497 = false;
          bool __defer_469_489 = false;
          if (((_462 == 67)) || ((_462 == 54))) {
            float _478 = float((uint)((uint)(((int)(_frameNumber.x * 73)) & 127)));
            if (_467 > (frac(frac(dot(float2(((_478 * 32.665000915527344f) + _91), ((_478 * 11.8149995803833f) + _92)), float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f) * 0.20000000298023224f)) {
              _490 = 1.0f;
              _491 = 53;
              _492 = 0.0f;
              __defer_469_489 = true;
            } else {
              bool __branch_chain_494;
              if ((_462 & -2) == 66) {
                _503 = 1.0f;
                _504 = _462;
                _505 = 0.0h;
                __branch_chain_494 = true;
              } else {
                _498 = 1.0f;
                _499 = _462;
                _500 = 0.0h;
                if (_499 == 54) {
                  _503 = _498;
                  _504 = 54;
                  _505 = _500;
                  __branch_chain_494 = true;
                } else {
                  _562 = _498;
                  _563 = _499;
                  _564 = _500;
                  _565 = 0.0f;
                  _566 = 0.0f;
                  _567 = 0.0f;
                  _568 = 0.0f;
                  __branch_chain_494 = false;
                }
              }
              if (__branch_chain_494) {
                __defer_461_502 = true;
              }
            }
          } else {
            _490 = 0.0f;
            _491 = _462;
            _492 = _467;
            __defer_469_489 = true;
          }
          if (__defer_469_497) {
            if (_499 == 54) {
              _503 = _498;
              _504 = 54;
              _505 = _500;
              __defer_461_502 = true;
            } else {
              _562 = _498;
              _563 = _499;
              _564 = _500;
              _565 = 0.0f;
              _566 = 0.0f;
              _567 = 0.0f;
              _568 = 0.0f;
            }
          }
          if (__defer_469_489) {
            _498 = _490;
            _499 = _491;
            _500 = half(_492);
            __defer_469_497 = true;
          }
        }
        if (__defer_461_502) {
          float _520 = (_148 * 2.0f) + 1.0f;
          float _524 = (_503 * 7.0f) + 1.0f;
          float4 _529 = __3__36__0__0__g_blueNoise.SampleLevel(__0__4__0__0__g_staticBilinearWrap, float2((((dot(float3(_140, _141, _142), float3(((_425 * _246) - (_424 * _247)), ((_423 * _247) - (_425 * _245)), ((_424 * _245) - (_423 * _246)))) * 2.0f) / _520) * _524), (((dot(float3(_140, _141, _142), float3(_423, _424, _425)) * 0.5f) / _520) * _524)), 0.0f);
          float _533 = _503 * 0.5f;
          float _534 = _529.x * 2.0f;
          float _535 = _529.y * 2.0f;
          float _536 = _529.z * 2.0f;
          float _543 = ((1.0f - _534) * _533) + _534;
          float _544 = ((1.0f - _535) * _533) + _535;
          float _545 = ((1.0f - _536) * _533) + _536;
          if (_504 == 54) {
            _562 = _503;
            _563 = 54;
            _564 = _505;
            _565 = _543;
            _566 = _544;
            _567 = _545;
            _568 = (((asfloat(_globalLightParams.z) * float(_311)) + _bevelParams.y) + (asfloat(_globalLightParams.w) * float(half(float((uint)((uint)(_151.z & 255))) * 0.003921568859368563f))));
          } else {
            _562 = _503;
            _563 = _504;
            _564 = _505;
            _565 = _543;
            _566 = _544;
            _567 = _545;
            _568 = _bevelParams.y;
          }
        }
        float _572 = float(select(_359, _220, _281));
        float _573 = float(select(_359, _221, _282));
        float _574 = float(select(_359, _222, _283));
        if (_563 == 53) {
          _582 = saturate(((_309 + _308) + _310) * 1.2001953h);
        } else {
          _582 = 1.0h;
        }
        half _588 = (0.7001953h / min(max(max(max(_308, _309), _310), 0.010002136h), 0.7001953h)) * _582;
        float _601 = float((((_588 * _308) + -0.040008545h) * _564) + 0.040008545h);
        float _602 = float((((_588 * _309) + -0.040008545h) * _564) + 0.040008545h);
        float _603 = float((((_588 * _310) + -0.040008545h) * _564) + 0.040008545h);
        float _604 = float(_281);
        float _605 = float(_282);
        float _606 = float(_283);
        if (_427) {
          float _615 = float(saturate(rsqrt(dot(half3(_220, _221, _222), half3(_220, _221, _222))) * _221));
          float _616 = _615 * _615;
          float _617 = _616 * _616;
          float _618 = _617 * _617;
          float _621 = (_618 * _618) * (_434 * select((((_86 == 29)) || (((_351) || (_353)))), 0.0f, 1.0f));
          float _626 = _604 - (_621 * _604);
          float _627 = (_621 * (1.0f - _605)) + _605;
          float _628 = _606 - (_621 * _606);
          float _630 = rsqrt(dot(float3(_626, _627, _628), float3(_626, _627, _628)));
          _635 = (_626 * _630);
          _636 = (_627 * _630);
          _637 = (_628 * _630);
        } else {
          _635 = _604;
          _636 = _605;
          _637 = _606;
        }
        float _638 = float(_311);
        float _639 = _638 * _638;
        float _640 = _639 * _639;
        float _642 = float(_311 * 0.60009766h);
        float _643 = _642 * _642;
        float _644 = _643 * _643;
        uint2 _646 = __3__36__0__0__g_manyLightsHitData.Load(int3(((int)((((uint)((_30 - (_31 << 1)) << 4)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_53) << 5)) & 8160)))), ((int)((((uint)(_31 << 4)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_53)) >> 3) & 8160)))), 0));
        int _656 = select(((_646.x | _646.y) != 0), (((uint)((uint)(_646.x)) >> 16) & 32767), 32767);
        float _659 = __3__37__0__0__g_manyLightsDataBuffer[_656]._position.x;
        float _660 = __3__37__0__0__g_manyLightsDataBuffer[_656]._position.y;
        float _661 = __3__37__0__0__g_manyLightsDataBuffer[_656]._position.z;
        float _663 = __3__37__0__0__g_manyLightsDataBuffer[_656]._color.x;
        float _664 = __3__37__0__0__g_manyLightsDataBuffer[_656]._color.y;
        float _665 = __3__37__0__0__g_manyLightsDataBuffer[_656]._color.z;
        float _666 = __3__37__0__0__g_manyLightsDataBuffer[_656]._color.w;
        int _668 = __3__37__0__0__g_manyLightsDataBuffer[_656]._up.x;
        int _669 = __3__37__0__0__g_manyLightsDataBuffer[_656]._up.y;
        int _671 = __3__37__0__0__g_manyLightsDataBuffer[_656]._look.x;
        int _672 = __3__37__0__0__g_manyLightsDataBuffer[_656]._look.y;
        float _674 = float((bool)(uint)((float((uint)((uint)(_646.x & 65535))) * 0.015609979629516602f) >= 1000.0f));
        float _675 = _659 - _140;
        float _676 = _660 - _141;
        float _677 = _661 - _142;
        float _683 = sqrt(((_675 * _675) + (_676 * _676)) + (_677 * _677));
        float _684 = 1.0f / _683;
        float _685 = _684 * _675;
        float _686 = _684 * _676;
        float _687 = _684 * _677;
        float _692 = f16tof32(((uint)(_668 & 65535)));
        float _693 = f16tof32(((uint)((uint)((uint)(_668)) >> 16)));
        float _694 = f16tof32(((uint)(_669 & 65535)));
        float _695 = f16tof32(((uint)((uint)((uint)(_669)) >> 16)));
        float _697 = rsqrt(dot(float3(_692, _693, _694), float3(_692, _693, _694)));
        float _701 = f16tof32(((uint)(_671 & 65535)));
        float _702 = f16tof32(((uint)((uint)((uint)(_671)) >> 16)));
        float _703 = f16tof32(((uint)(_672 & 65535)));
        float _705 = rsqrt(dot(float3(_701, _702, _703), float3(_701, _702, _703)));
        float _706 = _705 * _701;
        float _707 = _705 * _702;
        float _708 = _705 * _703;
        if (!(!(_695 >= 0.0f))) {
          float _718 = mad(_687, (_697 * _694), mad(_686, (_697 * _693), ((_685 * _692) * _697)));
          float _721 = mad(_687, _708, mad(_686, _707, (_706 * _685)));
          float _729 = atan((-0.0f - _721) / (-0.0f - _718));
          bool _732 = (_718 > -0.0f);
          bool _733 = (_718 == -0.0f);
          bool _734 = (_721 <= -0.0f);
          bool _735 = (_721 > -0.0f);
          float _751 = __3__36__0__0__g_lightProfile.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(((asin(dot(float3(_685, _686, _687), float3(_706, _707, _708))) * 0.31830987334251404f) + 0.5f), ((saturate(abs(select(((_733) && (_734)), 0.5f, select(((_733) && (_735)), -0.5f, (select(((_732) && (_735)), (_729 + -3.1415927410125732f), select(((_732) && (_734)), (_729 + 3.1415927410125732f), _729)) * 0.31830987334251404f))))) * f16tof32(((uint)((uint)((uint)(_672)) >> 16)))) + _695)), 0.0f);
          _757 = (_751.x * _663);
          _758 = (_751.x * _664);
          _759 = (_751.x * _665);
        } else {
          _757 = _663;
          _758 = _664;
          _759 = _665;
        }
        float _760 = abs(_666);
        float _769 = _149 * _140;
        float _770 = _149 * _141;
        float _771 = _149 * _142;
        float _772 = _685 * _683;
        float _773 = _686 * _683;
        float _774 = _687 * _683;
        float _775 = -0.0f - _769;
        float _776 = -0.0f - _770;
        float _777 = -0.0f - _771;
        float _779 = dot(float3(_775, _776, _777), float3(_572, _573, _574)) * 2.0f;
        float _783 = _775 - (_779 * _572);
        float _784 = _776 - (_779 * _573);
        float _785 = _777 - (_779 * _574);
        float _786 = dot(float3(_772, _773, _774), float3(_783, _784, _785));
        float _790 = (_783 * _786) - _772;
        float _791 = (_784 * _786) - _773;
        float _792 = (_785 * _786) - _774;
        float _800 = saturate(_760 / sqrt(((_790 * _790) + (_791 * _791)) + (_792 * _792)));
        float _804 = (_790 * _800) + _772;
        float _805 = (_791 * _800) + _773;
        float _806 = (_792 * _800) + _774;
        float _808 = rsqrt(dot(float3(_804, _805, _806), float3(_804, _805, _806)));
        float _809 = _804 * _808;
        float _810 = _805 * _808;
        float _811 = _806 * _808;
        float _812 = _809 - _769;
        float _813 = _810 - _770;
        float _814 = _811 - _771;
        float _816 = rsqrt(dot(float3(_812, _813, _814), float3(_812, _813, _814)));
        float _817 = _812 * _816;
        float _818 = _813 * _816;
        float _819 = _814 * _816;
        float _820 = dot(float3(_572, _573, _574), float3(_809, _810, _811));
        float _821 = dot(float3(_635, _636, _637), float3(_809, _810, _811));
        float _823 = saturate(dot(float3(_572, _573, _574), float3(_775, _776, _777)));
        float _825 = saturate(dot(float3(_635, _636, _637), float3(_817, _818, _819)));
        float _826 = dot(float3(_775, _776, _777), float3(_817, _818, _819));
        int _827 = _563 & -2;
        bool _830 = ((_563 == 54)) || ((_827 == 66));
        if (_830) {
          float _832 = float(_308);
          float _833 = float(_309);
          float _834 = float(_310);
          float _836 = dot(float3(_423, _424, _425), float3(_809, _810, _811));
          float _837 = dot(float3(_423, _424, _425), float3(_775, _776, _777));
          float _843 = cos(abs(asin(_837) - asin(_836)) * 0.5f);
          float _847 = _809 - (_836 * _423);
          float _848 = _810 - (_836 * _424);
          float _849 = _811 - (_836 * _425);
          float _853 = _775 - (_837 * _423);
          float _854 = _776 - (_837 * _424);
          float _855 = _777 - (_837 * _425);
          float _862 = rsqrt((dot(float3(_853, _854, _855), float3(_853, _854, _855)) * dot(float3(_847, _848, _849), float3(_847, _848, _849))) + 9.999999747378752e-05f) * dot(float3(_847, _848, _849), float3(_853, _854, _855));
          float _866 = sqrt(saturate((_862 * 0.5f) + 0.5f));
          float _873 = min(max(_638, 0.09803921729326248f), 1.0f);
          float _874 = _873 * _873;
          float _875 = _874 * 0.5f;
          float _876 = _874 * 2.0f;
          float _877 = _837 + _836;
          float _878 = _877 + (_568 * 2.0f);
          float _880 = (_866 * 1.4142135381698608f) * _874;
          float _894 = 1.0f - sqrt(saturate((dot(float3(_775, _776, _777), float3(_809, _810, _811)) * 0.5f) + 0.5f));
          float _895 = _894 * _894;
          float _902 = _877 - _568;
          float _911 = 1.0f / ((1.190000057220459f / _843) + (_843 * 0.36000001430511475f));
          float _916 = ((_911 * (0.6000000238418579f - (_862 * 0.800000011920929f))) + 1.0f) * _866;
          float _922 = 1.0f - (sqrt(saturate(1.0f - (_916 * _916))) * _843);
          float _923 = _922 * _922;
          float _927 = 0.9534794092178345f - ((_923 * _923) * (_922 * 0.9534794092178345f));
          float _928 = _911 * _916;
          float _933 = (sqrt(1.0f - (_928 * _928)) * 0.5f) / _843;
          float _934 = log2(_832);
          float _935 = log2(_833);
          float _936 = log2(_834);
          float _948 = ((_927 * _927) * (exp2((((_902 * _902) * -0.5f) / (_875 * _875)) * 1.4426950216293335f) / (_874 * 1.2533141374588013f))) * exp2(-5.741926193237305f - (_862 * 5.2658371925354f));
          float _952 = _877 - (_568 * 4.0f);
          float _962 = 1.0f - (_843 * 0.5f);
          float _963 = _962 * _962;
          float _967 = (_963 * _963) * (0.9534794092178345f - (_843 * 0.47673970460891724f));
          float _969 = 0.9534794092178345f - _967;
          float _970 = 0.800000011920929f / _843;
          float _983 = (((_969 * _969) * (_967 + 0.04652056470513344f)) * (exp2((((_952 * _952) * -0.5f) / (_876 * _876)) * 1.4426950216293335f) / (_874 * 5.013256549835205f))) * exp2((_862 * 24.525815963745117f) + -24.208423614501953f);
          float _990 = saturate(_821);
          float _991 = (((_866 * 0.25f) * (exp2((((_878 * _878) * -0.5f) / (_880 * _880)) * 1.4426950216293335f) / (_880 * 2.5066282749176025f))) * (((_895 * _895) * (_894 * 0.9534794092178345f)) + 0.04652056470513344f)) * _990;
          float _1004 = -0.0f - _990;
          float _1015 = saturate((_821 + 1.0f) * 0.25f);
          float _1020 = max(0.0010000000474974513f, dot(float3(_832, _833, _834), float3(0.30000001192092896f, 0.5899999737739563f, 0.10999999940395355f)));
          float _1021 = 1.0f - _674;
          float _1037 = ((((1.0f - abs(_821)) - _1015) * 0.33000001311302185f) + _1015) * 0.039788734167814255f;
          _1277 = (((exp2(log2(_832 / _1020) * _1021) * _1037) * sqrt(_832)) - min(0.0f, (((_983 * exp2(_970 * _934)) + (_948 * exp2(_934 * _933))) * _1004)));
          _1278 = (((exp2(log2(_833 / _1020) * _1021) * _1037) * sqrt(_833)) - min(0.0f, (((_983 * exp2(_970 * _935)) + (_948 * exp2(_935 * _933))) * _1004)));
          _1279 = (((exp2(log2(_834 / _1020) * _1021) * _1037) * sqrt(_834)) - min(0.0f, (((_983 * exp2(_970 * _936)) + (_948 * exp2(_936 * _933))) * _1004)));
          _1280 = (-0.0f - min(0.0f, (-0.0f - (_565 * _991))));
          _1281 = (-0.0f - min(0.0f, (-0.0f - (_566 * _991))));
          _1282 = (-0.0f - min(0.0f, (-0.0f - (_567 * _991))));
          _1283 = 0.0f;
        } else {
          if (_463 == 0) {
            if (!(_820 <= 0.0f)) {
              float _1177 = saturate(1.0f - _826);
              float _1178 = _1177 * _1177;
              float _1180 = (_1178 * _1178) * _1177;
              float _1183 = _1180 * saturate(_602 * 50.0f);
              float _1184 = 1.0f - _1180;
              float _1192 = saturate(_821);
              float _1193 = 1.0f - _639;
              float _1205 = (((_825 * _640) - _825) * _825) + 1.0f;
              float _1209 = (_640 / ((_1205 * _1205) * 3.1415927410125732f)) * (0.5f / ((((_823 * _1193) + _639) * _821) + (_823 * ((_821 * _1193) + _639))));
              _1220 = (max((((_1184 * _601) + _1183) * _1209), 0.0f) * _1192);
              _1221 = (max((((_1184 * _602) + _1183) * _1209), 0.0f) * _1192);
              _1222 = (max((((_1184 * _603) + _1183) * _1209), 0.0f) * _1192);
              if (DIFFUSE_BRDF_MODE >= 2.0f) {
                float _rndx_sNdotL = saturate(_820);
                float _rndx_LdotV = dot(float3(_809, _810, _811), float3(_775, _776, _777));
                _1223 = _rndx_sNdotL * EON_DiffuseScalar(_rndx_sNdotL, _823, _rndx_LdotV, _606);
              } else if (DIFFUSE_BRDF_MODE >= 1.0f) {
                float _rndx_sNdotL = saturate(_820);
                _1223 = _rndx_sNdotL * HammonDiffuseScalar(_rndx_sNdotL, _823, _825, _826, _606);
              } else {
                _1223 = (_820 * 0.31830987334251404f);
              }
            } else {
              _1220 = 0.0f;
              _1221 = 0.0f;
              _1222 = 0.0f;
              _1223 = 0.0f;
            }
            if ((_360) && ((_563 != 65))) {
              float _1231 = saturate(1.0f - _826);
              float _1232 = _1231 * _1231;
              float _1234 = (_1232 * _1232) * _1231;
              float _1237 = _1234 * saturate(_602 * 50.0f);
              float _1238 = 1.0f - _1234;
              float _1246 = 1.0f - _643;
              float _1258 = (((_825 * _644) - _825) * _825) + 1.0f;
              float _1262 = (_644 / ((_1258 * _1258) * 3.1415927410125732f)) * (0.5f / ((((_823 * _1246) + _643) * _821) + (_823 * ((_821 * _1246) + _643))));
              float _1269 = saturate(_821) * 0.39990234375f;
              _1277 = 0.0f;
              _1278 = 0.0f;
              _1279 = 0.0f;
              _1280 = ((max((((_1238 * _601) + _1237) * _1262), 0.0f) * _1269) + (_1220 * 0.60009765625f));
              _1281 = ((max((((_1238 * _602) + _1237) * _1262), 0.0f) * _1269) + (_1221 * 0.60009765625f));
              _1282 = ((max((((_1238 * _603) + _1237) * _1262), 0.0f) * _1269) + (_1222 * 0.60009765625f));
              _1283 = _1223;
            } else {
              _1277 = 0.0f;
              _1278 = 0.0f;
              _1279 = 0.0f;
              _1280 = _1220;
              _1281 = _1221;
              _1282 = _1222;
              _1283 = _1223;
            }
          } else {
            float _1050 = float(_308);
            float _1051 = float(_309);
            float _1052 = float(_310);
            float _1068 = max(dot(float3(_1050, _1051, _1052), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)), 0.03999999910593033f);
            float _1072 = sqrt(_1050) - _1068;
            float _1073 = sqrt(_1051) - _1068;
            float _1074 = sqrt(_1052) - _1068;
            float _1081 = saturate(1.0f - (pow(_823, 4.0f)));
            float _1094 = (((_1073 * _464) + _1068) + ((_1073 * (_466 - _464)) * _1081)) * _465;
            float _1097 = saturate(1.0f - saturate(_826));
            float _1098 = _1097 * _1097;
            float _1100 = (_1098 * _1098) * _1097;
            float _1103 = _1100 * saturate(_1094 * 50.0f);
            float _1104 = 1.0f - _1100;
            float _1105 = _1104 * _465;
            float _1109 = (_1105 * (((_1072 * _464) + _1068) + (_1081 * (_1072 * (_466 - _464))))) + _1103;
            float _1110 = (_1104 * _1094) + _1103;
            float _1111 = (_1105 * (((_1074 * _464) + _1068) + ((_1074 * (_466 - _464)) * _1081))) + _1103;
            float _1112 = min(_825, 0.9998999834060669f);
            float _1113 = _1112 * _1112;
            float _1114 = 1.0f - _1113;
            float _1126 = (((exp2(((-0.0f - _1113) / (_1114 * _640)) * 1.4426950216293335f) * 4.0f) / (_1114 * _1114)) + 1.0f) / ((_640 * 12.566370964050293f) + 3.1415927410125732f);
            float _1130 = ((_823 + _821) - (_823 * _821)) * 4.0f;
            float _1134 = (_1109 * _1126) / _1130;
            float _1135 = (_1110 * _1126) / _1130;
            float _1136 = (_1111 * _1126) / _1130;
            float _1137 = 1.0f - _639;
            float _1149 = (((_825 * _640) - _825) * _825) + 1.0f;
            float _1153 = (_640 / ((_1149 * _1149) * 3.1415927410125732f)) * (0.5f / ((((_823 * _1137) + _639) * _820) + (_823 * ((_820 * _1137) + _639))));
            float _1169 = saturate(_821);
            _1277 = 0.0f;
            _1278 = 0.0f;
            _1279 = 0.0f;
            _1280 = ((((max((_1153 * _1109), 0.0f) - _1134) * _464) + _1134) * _1169);
            _1281 = ((((max((_1153 * _1110), 0.0f) - _1135) * _464) + _1135) * _1169);
            _1282 = ((((max((_1153 * _1111), 0.0f) - _1136) * _464) + _1136) * _1169);
            float _rndx_velvet_mod = (((saturate(1.0f - _effectiveMetallicForVelvet) + -1.0f) * _466) + 1.0f);
            if (DIFFUSE_BRDF_MODE >= 2.0f) {
              float _rndx_sNdotL2 = saturate(_820);
              float _rndx_LdotV2 = dot(float3(_809, _810, _811), float3(_775, _776, _777));
              _1283 = (_rndx_sNdotL2 * EON_DiffuseScalar(_rndx_sNdotL2, _823, _rndx_LdotV2, _606)) * _rndx_velvet_mod;
            } else if (DIFFUSE_BRDF_MODE >= 1.0f) {
              float _rndx_sNdotL2 = saturate(_820);
              _1283 = (_rndx_sNdotL2 * HammonDiffuseScalar(_rndx_sNdotL2, _823, _825, _826, _606)) * _rndx_velvet_mod;
            } else {
              _1283 = (saturate(_820) * 0.31830987334251404f) * _rndx_velvet_mod;
            }
          }
        }
        if (DIFFRACTION > 0.0f && float(_564) > 0.0f) {
          float3 _rndx_dShift = DiffractionShiftAndSpeckleCS(
              _825, _823, _606,
              float2(_98, _99), (_nearFarProj.x / _89),
              float3(_817, _818, _819),
              float3(_635, _636, _637),
              float3(_601, _602, _603));
          float3 _rndx_dMod = lerp(1.0f, _rndx_dShift, DIFFRACTION * float(_564));
          _1280 *= _rndx_dMod.x;
          _1281 *= _rndx_dMod.y;
          _1282 *= _rndx_dMod.z;
        }
        if (SMOOTH_TERMINATOR > 0.0f) {
          float _rndx_st = CallistoSmoothTerminator(_820, _826, _825, SMOOTH_TERMINATOR, 0.5f);
          _1283 *= _rndx_st;
          _1280 *= _rndx_st;
          _1281 *= _rndx_st;
          _1282 *= _rndx_st;
        }
        float _1285 = saturate(select((_760 > 99999.0f), 1.0f, (1.0f / max((_760 * _760), (_683 * _683))))) * (_674 * asfloat(_646.y));
        float _1286 = _1285 * _757;
        float _1287 = _1285 * _758;
        float _1288 = _1285 * _759;
        if (_830) {
          half _1299 = (_420 * 2.0h) + -1.0h;
          half _1300 = (_421 * 2.0h) + -1.0h;
          half _1301 = (_422 * 2.0h) + -1.0h;
          half _1303 = rsqrt(dot(half3(_1299, _1300, _1301), half3(_1299, _1300, _1301)));
          _1311 = 0.0h;
          _1312 = float(_1303 * _1299);
          _1313 = float(_1303 * _1300);
          _1314 = float(_1303 * _1301);
        } else {
          _1311 = _564;
          _1312 = 0.0f;
          _1313 = 1.0f;
          _1314 = 0.0f;
        }
        float _1315 = float(_184);
        bool _1316 = (_827 == 64);
        if ((((int)(uint)((int)(_1316))) & (((int)(uint)((int)(_202))) ^ 1)) == 0) {
          _1336 = saturate(exp2((_1315 * _1315) * ((_nearFarProj.x / _89) * -0.005770780146121979f)));
        } else {
          _1336 = select((_cavityParams.z > 0.0f), select(_202, 0.0f, float(_421)), 1.0f);
        }
        float _1340 = select((_cavityParams.x == 0.0f), 1.0f, _1336);
        float _1341 = float(_1311);
        float _1342 = float(_308);
        float _1343 = float(_309);
        float _1344 = float(_310);
        float _1346 = saturate(dot(float3(_775, _776, _777), float3(_635, _636, _637)));
        float _1351 = 0.699999988079071f / min(max(max(max(_1342, _1343), _1344), 0.009999999776482582f), 0.699999988079071f);
        float _1361 = (((_1351 * _1342) + -0.03999999910593033f) * _1341) + 0.03999999910593033f;
        float _1362 = (((_1351 * _1343) + -0.03999999910593033f) * _1341) + 0.03999999910593033f;
        float _1363 = (((_1351 * _1344) + -0.03999999910593033f) * _1341) + 0.03999999910593033f;
        if (_1316) {
          _1369 = (_1361 * _1340);
          _1370 = (_1362 * _1340);
          _1371 = (_1363 * _1340);
        } else {
          _1369 = _1361;
          _1370 = _1362;
          _1371 = _1363;
        }
        if (_830) {
          float2 _1383 = __3__36__0__0__g_hairBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(min(0.9900000095367432f, (1.0f - saturate(abs(dot(float3(_1312, _1313, _1314), float3(_769, _770, _771)))))), (1.0f - max(0.75f, (_638 * 2.0f)))), 0.0f);
          float2 _1389 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(min(0.9900000095367432f, _1346), (1.0f - _638)), 0.0f);
          float _1399 = (lerp(_1383.y, _1389.y, _562)) + ((lerp(_1383.x, _1389.x, _562)) * 0.009999999776482582f);
          _1563 = _1399;
          _1564 = _1399;
          _1565 = _1399;
        } else {
          if ((uint)(_563 + -97) < (uint)2) {
            if (!(abs(_246) > 0.9900000095367432f)) {
              float _1407 = -0.0f - _247;
              float _1409 = rsqrt(dot(float3(_1407, 0.0f, _245), float3(_1407, 0.0f, _245)));
              _1413 = (_1409 * _1407);
              _1414 = (_1409 * _245);
            } else {
              _1413 = 1.0f;
              _1414 = 0.0f;
            }
            float _1416 = -0.0f - (_246 * _1414);
            float _1419 = (_1414 * _245) - (_1413 * _247);
            float _1420 = _1413 * _246;
            float _1422 = rsqrt(dot(float3(_1416, _1419, _1420), float3(_1416, _1419, _1420)));
            float _1430 = _viewPos.x + _140;
            float _1431 = _viewPos.y + _141;
            float _1432 = _viewPos.z + _142;
            float4 _1437 = __3__36__0__0__g_blueNoise.SampleLevel(__0__4__0__0__g_staticBilinearWrap, float2(dot(float3(_1413, 0.0f, _1414), float3(_1430, _1431, _1432)), dot(float3((_1422 * _1416), (_1419 * _1422), (_1422 * _1420)), float3(_1430, _1431, _1432))), 0.0f);
            float _1441 = _1437.x + -0.5f;
            float _1442 = _1437.y + -0.5f;
            float _1443 = _1437.z + -0.5f;
            float _1445 = rsqrt(dot(float3(_1441, _1442, _1443), float3(_1441, _1442, _1443)));
            float _1449 = (_1441 * _1445) + _635;
            float _1450 = (_1442 * _1445) + _636;
            float _1451 = (_1443 * _1445) + _637;
            float _1453 = rsqrt(dot(float3(_1449, _1450, _1451), float3(_1449, _1450, _1451)));
            float2 _1466 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(min(0.9900000095367432f, _1346), (1.0f - _638)), 0.0f);
            float _1473 = _1466.y + (exp2(log2(saturate(dot(float3(_775, _776, _777), float3((_1449 * _1453), (_1450 * _1453), (_1451 * _1453))))) * 512.0f) * 20.0f);
            _1563 = (_1473 + (_1466.x * _1369));
            _1564 = (_1473 + (_1466.x * _1370));
            _1565 = (_1473 + (_1466.x * _1371));
          } else {
            if (_1316) {
              if (_563 == 65) {
                _1546 = _1369;
                _1547 = _1370;
                _1548 = _1371;
                float2 _1553 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(min(0.9900000095367432f, _1346), (1.0f - _638)), 0.0f);
                _1563 = ((_1553.x * _1546) + _1553.y);
                _1564 = ((_1553.x * _1547) + _1553.y);
                _1565 = ((_1553.x * _1548) + _1553.y);
              } else {
                float _1483 = min(0.9900000095367432f, _1346);
                float2 _1488 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_1483, saturate(1.0f - (_638 * 1.3300000429153442f))), 0.0f);
                float2 _1493 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_1483, saturate(1.0f - (_638 * 0.47998046875f))), 0.0f);
                float _1497 = (_1493.x + _1488.x) * 0.5f;
                float _1499 = (_1493.y + _1488.y) * 0.5f;
                _1563 = ((_1497 * _1369) + _1499);
                _1564 = ((_1497 * _1370) + _1499);
                _1565 = ((_1497 * _1371) + _1499);
              }
            } else {
              if (((_563 == 33)) || ((_563 == 55))) {
                float _1516 = max(dot(float3(_1342, _1343, _1344), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)), 0.03999999910593033f);
                float _1520 = sqrt(_1342) - _1516;
                float _1521 = sqrt(_1343) - _1516;
                float _1522 = sqrt(_1344) - _1516;
                float _1529 = saturate(1.0f - (pow(_1346, 4.0f)));
                _1546 = ((((_1520 * _464) + _1516) + (_1529 * (_1520 * (_466 - _464)))) * _465);
                _1547 = ((((_1521 * _464) + _1516) + ((_1521 * (_466 - _464)) * _1529)) * _465);
                _1548 = ((((_1522 * _464) + _1516) + ((_1522 * (_466 - _464)) * _1529)) * _465);
              } else {
                _1546 = _1369;
                _1547 = _1370;
                _1548 = _1371;
              }
              float2 _1553 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(min(0.9900000095367432f, _1346), (1.0f - _638)), 0.0f);
              _1563 = ((_1553.x * _1546) + _1553.y);
              _1564 = ((_1553.x * _1547) + _1553.y);
              _1565 = ((_1553.x * _1548) + _1553.y);
            }
          }
        }
        float _1569 = (_1280 * _1286) / max(0.009999999776482582f, _1563);
        float _1570 = (_1281 * _1287) / max(0.009999999776482582f, _1564);
        float _1571 = (_1282 * _1288) / max(0.009999999776482582f, _1565);
        float _1572 = dot(float3(_1569, _1570, _1571), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
        float _1578 = min((_exposure3.w * 8192.0f), _1572) / max(9.999999974752427e-07f, _1572);
        float _1593 = min(30000.0f, (-0.0f - min(0.0f, (-0.0f - (_1569 * _1578)))));
        float _1594 = min(30000.0f, (-0.0f - min(0.0f, (-0.0f - (_1570 * _1578)))));
        float _1595 = min(30000.0f, (-0.0f - min(0.0f, (-0.0f - (_1571 * _1578)))));
        float _1611 = min(30000.0f, (-0.0f - min(0.0f, (-0.0f - ((_1286 * (_1283 + _1277)) * _exposure4.x)))));
        float _1612 = min(30000.0f, (-0.0f - min(0.0f, (-0.0f - ((_1287 * (_1283 + _1278)) * _exposure4.x)))));
        float _1613 = min(30000.0f, (-0.0f - min(0.0f, (-0.0f - ((_1288 * (_1283 + _1279)) * _exposure4.x)))));
        float _1615 = dot(float3(_1611, _1612, _1613), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)) / _exposure4.x;
        __3__38__0__1__g_sceneDiffuseUAV[int2(((int)((((uint)((_30 - (_31 << 1)) << 4)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_53) << 5)) & 8160)))), ((int)((((uint)(_31 << 4)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_53)) >> 3) & 8160)))))] = float4(_1611, _1612, _1613, 0.0f);
        [branch]
        if (((((((_1593 > 0.0f)) || ((_1594 > 0.0f)))) || ((_1595 > 0.0f)))) || ((_1615 > 0.0f))) {
          __3__38__0__1__g_specularResultUAV[int2(((int)((((uint)((_30 - (_31 << 1)) << 4)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_53) << 5)) & 8160)))), ((int)((((uint)(_31 << 4)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_53)) >> 3) & 8160)))))] = float4(_1593, _1594, _1595, _1615);
        }
      }
    }
  }
}
