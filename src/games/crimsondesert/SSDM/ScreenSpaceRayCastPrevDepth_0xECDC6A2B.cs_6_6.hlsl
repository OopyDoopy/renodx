struct ContentScreenSpaceRayCastCommand {
  float4 _rayOrigin;
  float4 _rayDirection;
  uint3 _userData;
};

struct ContentScreenSpaceRayCastResult {
  float3 _rayOrigin;
  float3 _intersectedWorldPosition;
  uint3 _userData;
};


StructuredBuffer<ContentScreenSpaceRayCastCommand> __3__37__0__0__g_screenSpaceRayCastParameterBuffer : register(t0, space37);

Texture2D<float> __3__36__0__0__g_depth : register(t1, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t2, space36);

RWStructuredBuffer<ContentScreenSpaceRayCastResult> __3__39__0__1__g_outIntersectedBuffer : register(u1, space39);

cbuffer __3__35__0__0__SceneConstantBuffer : register(b0, space35) {
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
  uint _isAllowBlood;
};

cbuffer __3__1__0__0__GlobalPushConstants : register(b0, space1) {
  uint _count : packoffset(c000.x);
  uint _parameterOffset : packoffset(c000.y);
  uint _outputOffset : packoffset(c000.z);
  uint _flag : packoffset(c000.w);
  uint _isPrevGBufferCharacter : packoffset(c001.x);
};

[numthreads(16, 1, 1)]
void main(
  uint3 SV_DispatchThreadID : SV_DispatchThreadID,
  uint3 SV_GroupID : SV_GroupID,
  uint3 SV_GroupThreadID : SV_GroupThreadID,
  uint SV_GroupIndex : SV_GroupIndex
) {
  int _110;
  int _211;
  int _214;
  int _217;
  bool _218;
  int _316;
  int _319;
  int _322;
  bool _323;
  float _327;
  float _328;
  int _329;
  int _387;
  int _390;
  float _548;
  float _549;
  float _550;
  int _551;
  int _552;
  int _553;
  bool _566;
  bool _595;
  if ((uint)_count > (uint)(int)(SV_DispatchThreadID.x)) {
    float _19 = __3__37__0__0__g_screenSpaceRayCastParameterBuffer[((int)((uint)(_parameterOffset) + SV_DispatchThreadID.x))]._rayOrigin.x;
    float _20 = __3__37__0__0__g_screenSpaceRayCastParameterBuffer[((int)((uint)(_parameterOffset) + SV_DispatchThreadID.x))]._rayOrigin.y;
    float _21 = __3__37__0__0__g_screenSpaceRayCastParameterBuffer[((int)((uint)(_parameterOffset) + SV_DispatchThreadID.x))]._rayOrigin.z;
    float _22 = __3__37__0__0__g_screenSpaceRayCastParameterBuffer[((int)((uint)(_parameterOffset) + SV_DispatchThreadID.x))]._rayOrigin.w;
    float _24 = __3__37__0__0__g_screenSpaceRayCastParameterBuffer[((int)((uint)(_parameterOffset) + SV_DispatchThreadID.x))]._rayDirection.x;
    float _25 = __3__37__0__0__g_screenSpaceRayCastParameterBuffer[((int)((uint)(_parameterOffset) + SV_DispatchThreadID.x))]._rayDirection.y;
    float _26 = __3__37__0__0__g_screenSpaceRayCastParameterBuffer[((int)((uint)(_parameterOffset) + SV_DispatchThreadID.x))]._rayDirection.z;
    float _27 = __3__37__0__0__g_screenSpaceRayCastParameterBuffer[((int)((uint)(_parameterOffset) + SV_DispatchThreadID.x))]._rayDirection.w;
    int _29 = __3__37__0__0__g_screenSpaceRayCastParameterBuffer[((int)((uint)(_parameterOffset) + SV_DispatchThreadID.x))]._userData.x;
    int _30 = __3__37__0__0__g_screenSpaceRayCastParameterBuffer[((int)((uint)(_parameterOffset) + SV_DispatchThreadID.x))]._userData.y;
    int _31 = __3__37__0__0__g_screenSpaceRayCastParameterBuffer[((int)((uint)(_parameterOffset) + SV_DispatchThreadID.x))]._userData.z;
    float _56 = _19 - _viewPos.x;
    float _57 = _20 - _viewPos.y;
    float _58 = _21 - _viewPos.z;
    float _74 = mad((_viewProjRelative[3].z), _58, mad((_viewProjRelative[3].y), _57, (_56 * (_viewProjRelative[3].x)))) + (_viewProjRelative[3].w);
    float _77 = rsqrt(dot(float3(_24, _25, _26), float3(_24, _25, _26))) * _27;
    float _81 = (_77 * _24) + _56;
    float _82 = (_77 * _25) + _57;
    float _83 = (_77 * _26) + _58;
    float _99 = mad((_viewProjRelative[3].z), _83, mad((_viewProjRelative[3].y), _82, (_81 * (_viewProjRelative[3].x)))) + (_viewProjRelative[3].w);
    float _100 = (mad((_viewProjRelative[0].z), _58, mad((_viewProjRelative[0].y), _57, (_56 * (_viewProjRelative[0].x)))) + (_viewProjRelative[0].w)) / _74;
    float _101 = (mad((_viewProjRelative[1].z), _58, mad((_viewProjRelative[1].y), _57, (_56 * (_viewProjRelative[1].x)))) + (_viewProjRelative[1].w)) / _74;
    float _102 = (mad((_viewProjRelative[2].z), _58, mad((_viewProjRelative[2].y), _57, (_56 * (_viewProjRelative[2].x)))) + (_viewProjRelative[2].w)) / _74;
    if ((_31 & 4) == 0) {
      _110 = 0;
      while(true) {
        float _111 = float((int)(_110));
        float _112 = _111 * 0.125f;
        float _113 = ((mad((_viewProjRelative[0].z), _83, mad((_viewProjRelative[0].y), _82, (_81 * (_viewProjRelative[0].x)))) + (_viewProjRelative[0].w)) / _99) - _100;
        float _114 = ((mad((_viewProjRelative[1].z), _83, mad((_viewProjRelative[1].y), _82, (_81 * (_viewProjRelative[1].x)))) + (_viewProjRelative[1].w)) / _99) - _101;
        float _115 = ((mad((_viewProjRelative[2].z), _83, mad((_viewProjRelative[2].y), _82, (_81 * (_viewProjRelative[2].x)))) + (_viewProjRelative[2].w)) / _99) - _102;
        float _121 = (_112 * _115) + _102;
        float _124 = (((_112 * _113) + _100) * 0.5f) + 0.5f;
        float _125 = 0.5f - (((_112 * _114) + _101) * 0.5f);
        if (!(((_125 > 1.0f)) || ((((_125 < 0.0f)) || ((((_124 < 0.0f)) || ((_124 > 1.0f)))))))) {
          float _137 = _bufferSizeAndInvSize.x * _124;
          float _138 = _bufferSizeAndInvSize.y * _125;
          int _139 = int(_137);
          int _140 = int(_138);
          uint2 _144 = __3__36__0__0__g_stencil.Load(int3(((int)((uint)(_139) + (uint)(-1))), ((int)((uint)(_140) + (uint)(-1))), 0));
          uint2 _147 = __3__36__0__0__g_stencil.Load(int3(((int)((uint)(_139) + 1u)), ((int)((uint)(_140) + (uint)(-1))), 0));
          uint2 _150 = __3__36__0__0__g_stencil.Load(int3(((int)((uint)(_139) + (uint)(-1))), ((int)((uint)(_140) + 1u)), 0));
          uint2 _152 = __3__36__0__0__g_stencil.Load(int3(((int)((uint)(_139) + 1u)), ((int)((uint)(_140) + 1u)), 0));
          uint2 _158 = __3__36__0__0__g_stencil.Load(int3(_139, _140, 0));
          int _160 = _158.x & 127;
          if (!((((_152.x & 127) == 0)) || (((((_150.x & 127) == 0)) || (((((_147.x & 127) == 0)) || (((((_144.x & 127) == 0)) || ((_160 == 0)))))))))) {
            float _174 = __3__36__0__0__g_depth.Load(int3((int)(uint(_137)), (int)(uint(_138)), 0));
            int _177 = (int)(uint)((int)(_121 < _174.x));
            if (_22 > 0.0f) {
              float _180 = _22 / _bufferSizeAndInvSize.x;
              float _181 = _22 / _bufferSizeAndInvSize.y;
              uint _186 = uint((_180 + _124) * _bufferSizeAndInvSize.x);
              uint _187 = uint((_181 + _125) * _bufferSizeAndInvSize.y);
              float _188 = __3__36__0__0__g_depth.Load(int3((int)(_186), (int)(_187), 0));
              if (!(_121 < _188.x)) {
                uint _194 = uint((_125 - _181) * _bufferSizeAndInvSize.y);
                float _195 = __3__36__0__0__g_depth.Load(int3((int)(_186), (int)(_194), 0));
                if (!(_121 < _195.x)) {
                  uint _201 = uint((_124 - _180) * _bufferSizeAndInvSize.x);
                  float _202 = __3__36__0__0__g_depth.Load(int3((int)(_201), (int)(_187), 0));
                  if (!(_121 < _202.x)) {
                    float _206 = __3__36__0__0__g_depth.Load(int3((int)(_201), (int)(_194), 0));
                    if (!(_121 < _206.x)) {
                      _211 = 0;
                    } else {
                      _211 = 1;
                    }
                  } else {
                    _211 = 1;
                  }
                } else {
                  _211 = 1;
                }
              } else {
                _211 = 1;
              }
              _214 = (_211 & _177);
            } else {
              _214 = _177;
            }
            _217 = _160;
            _218 = (_214 != 0);
          } else {
            _217 = _160;
            _218 = false;
          }
        } else {
          _217 = 0;
          _218 = false;
        }
        float _220 = (_111 + 1.0f) * 0.125f;
        float _226 = (_220 * _115) + _102;
        float _229 = (((_220 * _113) + _100) * 0.5f) + 0.5f;
        float _230 = 0.5f - (((_220 * _114) + _101) * 0.5f);
        if (!(((_230 > 1.0f)) || ((((_230 < 0.0f)) || ((((_229 < 0.0f)) || ((_229 > 1.0f)))))))) {
          float _242 = _bufferSizeAndInvSize.x * _229;
          float _243 = _bufferSizeAndInvSize.y * _230;
          int _244 = int(_242);
          int _245 = int(_243);
          uint2 _249 = __3__36__0__0__g_stencil.Load(int3(((int)((uint)(_244) + (uint)(-1))), ((int)((uint)(_245) + (uint)(-1))), 0));
          uint2 _252 = __3__36__0__0__g_stencil.Load(int3(((int)((uint)(_244) + 1u)), ((int)((uint)(_245) + (uint)(-1))), 0));
          uint2 _255 = __3__36__0__0__g_stencil.Load(int3(((int)((uint)(_244) + (uint)(-1))), ((int)((uint)(_245) + 1u)), 0));
          uint2 _257 = __3__36__0__0__g_stencil.Load(int3(((int)((uint)(_244) + 1u)), ((int)((uint)(_245) + 1u)), 0));
          uint2 _263 = __3__36__0__0__g_stencil.Load(int3(_244, _245, 0));
          int _265 = _263.x & 127;
          if (!((((_257.x & 127) == 0)) || (((((_255.x & 127) == 0)) || (((((_252.x & 127) == 0)) || (((((_249.x & 127) == 0)) || ((_265 == 0)))))))))) {
            float _279 = __3__36__0__0__g_depth.Load(int3((int)(uint(_242)), (int)(uint(_243)), 0));
            int _282 = (int)(uint)((int)(_226 < _279.x));
            if (_22 > 0.0f) {
              float _285 = _22 / _bufferSizeAndInvSize.x;
              float _286 = _22 / _bufferSizeAndInvSize.y;
              uint _291 = uint((_285 + _229) * _bufferSizeAndInvSize.x);
              uint _292 = uint((_286 + _230) * _bufferSizeAndInvSize.y);
              float _293 = __3__36__0__0__g_depth.Load(int3((int)(_291), (int)(_292), 0));
              if (!(_226 < _293.x)) {
                uint _299 = uint((_230 - _286) * _bufferSizeAndInvSize.y);
                float _300 = __3__36__0__0__g_depth.Load(int3((int)(_291), (int)(_299), 0));
                if (!(_226 < _300.x)) {
                  uint _306 = uint((_229 - _285) * _bufferSizeAndInvSize.x);
                  float _307 = __3__36__0__0__g_depth.Load(int3((int)(_306), (int)(_292), 0));
                  if (!(_226 < _307.x)) {
                    float _311 = __3__36__0__0__g_depth.Load(int3((int)(_306), (int)(_299), 0));
                    if (!(_226 < _311.x)) {
                      _316 = 0;
                    } else {
                      _316 = 1;
                    }
                  } else {
                    _316 = 1;
                  }
                } else {
                  _316 = 1;
                }
              } else {
                _316 = 1;
              }
              _319 = (_316 & _282);
            } else {
              _319 = _282;
            }
            _322 = _265;
            _323 = (_319 != 0);
          } else {
            _322 = _265;
            _323 = false;
          }
        } else {
          _322 = 0;
          _323 = false;
        }
        if ((_218) || (_323)) {
          _327 = _220;
          _328 = _112;
          _329 = 0;
          while(true) {
            float _331 = (_328 + _327) * 0.5f;
            float _337 = (_331 * _115) + _102;
            float _340 = (((_331 * _113) + _100) * 0.5f) + 0.5f;
            float _341 = 0.5f - (((_331 * _114) + _101) * 0.5f);
            float _350 = __3__36__0__0__g_depth.Load(int3((int)(uint(_340 * _bufferSizeAndInvSize.x)), (int)(uint(_341 * _bufferSizeAndInvSize.y)), 0));
            int _353 = (int)(uint)((int)(_337 < _350.x));
            if (_22 > 0.0f) {
              float _356 = _22 / _bufferSizeAndInvSize.x;
              float _357 = _22 / _bufferSizeAndInvSize.y;
              uint _362 = uint((_356 + _340) * _bufferSizeAndInvSize.x);
              uint _363 = uint((_357 + _341) * _bufferSizeAndInvSize.y);
              float _364 = __3__36__0__0__g_depth.Load(int3((int)(_362), (int)(_363), 0));
              if (!(_337 < _364.x)) {
                uint _370 = uint((_341 - _357) * _bufferSizeAndInvSize.y);
                float _371 = __3__36__0__0__g_depth.Load(int3((int)(_362), (int)(_370), 0));
                if (!(_337 < _371.x)) {
                  uint _377 = uint((_340 - _356) * _bufferSizeAndInvSize.x);
                  float _378 = __3__36__0__0__g_depth.Load(int3((int)(_377), (int)(_363), 0));
                  if (!(_337 < _378.x)) {
                    float _382 = __3__36__0__0__g_depth.Load(int3((int)(_377), (int)(_370), 0));
                    if (!(_337 < _382.x)) {
                      _387 = 0;
                    } else {
                      _387 = 1;
                    }
                  } else {
                    _387 = 1;
                  }
                } else {
                  _387 = 1;
                }
              } else {
                _387 = 1;
              }
              _390 = (_387 | _353);
            } else {
              _390 = _353;
            }
            bool _391 = (_390 != 0);
            float _392 = select(_391, _331, _327);
            if (!((_329 + 1) == 8)) {
              _327 = _392;
              _328 = select(_391, _328, _331);
              _329 = (_329 + 1);
              continue;
            }
            float _401 = (_392 * _113) + _100;
            float _402 = (_392 * _114) + _101;
            float _403 = max(1.0000000116860974e-07f, ((_392 * _115) + _102));
            float _425 = mad((_invViewProjRelative[0].y), _402, ((_invViewProjRelative[0].x) * _401));
            float _429 = mad((_invViewProjRelative[1].y), _402, ((_invViewProjRelative[1].x) * _401));
            float _433 = mad((_invViewProjRelative[2].y), _402, ((_invViewProjRelative[2].x) * _401));
            float _437 = mad((_invViewProjRelative[3].y), _402, ((_invViewProjRelative[3].x) * _401));
            float _439 = mad((_invViewProjRelative[3].z), _403, _437) + (_invViewProjRelative[3].w);
            float _440 = (mad((_invViewProjRelative[0].z), _403, _425) + (_invViewProjRelative[0].w)) / _439;
            float _441 = (mad((_invViewProjRelative[1].z), _403, _429) + (_invViewProjRelative[1].w)) / _439;
            float _442 = (mad((_invViewProjRelative[2].z), _403, _433) + (_invViewProjRelative[2].w)) / _439;
            float _443 = _440 - _56;
            float _444 = _441 - _57;
            float _445 = _442 - _58;
            bool _452 = (sqrt(((_444 * _444) + (_443 * _443)) + (_445 * _445)) < _27);
            if (_452) {
              float _463 = __3__36__0__0__g_depth.Load(int3((int)(uint(((_401 * 0.5f) + 0.5f) * _bufferSizeAndInvSize.x)), (int)(uint((0.5f - (_402 * 0.5f)) * _bufferSizeAndInvSize.y)), 0));
              float _465 = max(1.0000000116860974e-07f, _463.x);
              float _473 = mad((_invViewProjRelative[3].z), _465, _437) + (_invViewProjRelative[3].w);
              float _477 = ((mad((_invViewProjRelative[0].z), _465, _425) + (_invViewProjRelative[0].w)) / _473) - _440;
              float _478 = ((mad((_invViewProjRelative[1].z), _465, _429) + (_invViewProjRelative[1].w)) / _473) - _441;
              float _479 = ((mad((_invViewProjRelative[2].z), _465, _433) + (_invViewProjRelative[2].w)) / _473) - _442;
              _548 = _440;
              _549 = _441;
              _550 = _442;
              _551 = ((int)(uint)((int)(sqrt(((_478 * _478) + (_477 * _477)) + (_479 * _479)) < 0.20000000298023224f)));
              _552 = _217;
              _553 = _322;
            } else {
              _548 = _440;
              _549 = _441;
              _550 = _442;
              _551 = ((int)(uint)((int)(_452)));
              _552 = _217;
              _553 = _322;
            }
            break;
          }
        } else {
          if ((int)_110 > (int)7) {
            _548 = 0.0f;
            _549 = 0.0f;
            _550 = 0.0f;
            _551 = 0;
            _552 = _217;
            _553 = _322;
          } else {
            _110 = (_110 + 1);
            continue;
          }
        }
        break;
      }
    } else {
      float _504 = __3__36__0__0__g_depth.Load(int3((int)(uint(_bufferSizeAndInvSize.x * ((_100 * 0.5f) + 0.5f))), (int)(uint(_bufferSizeAndInvSize.y * (0.5f - (_101 * 0.5f)))), 0));
      float _506 = max(1.0000000116860974e-07f, _504.x);
      float _542 = mad((_invViewProjRelative[3].z), _506, mad((_invViewProjRelative[3].y), _101, ((_invViewProjRelative[3].x) * _100))) + (_invViewProjRelative[3].w);
      _548 = ((mad((_invViewProjRelative[0].z), _506, mad((_invViewProjRelative[0].y), _101, ((_invViewProjRelative[0].x) * _100))) + (_invViewProjRelative[0].w)) / _542);
      _549 = ((mad((_invViewProjRelative[1].z), _506, mad((_invViewProjRelative[1].y), _101, ((_invViewProjRelative[1].x) * _100))) + (_invViewProjRelative[1].w)) / _542);
      _550 = ((mad((_invViewProjRelative[2].z), _506, mad((_invViewProjRelative[2].y), _101, ((_invViewProjRelative[2].x) * _100))) + (_invViewProjRelative[2].w)) / _542);
      _551 = 1;
      _552 = 0;
      _553 = 0;
    }
    if (!(((_552 == 97)) || ((_553 == 97)))) {
      if (!(((_552 == 98)) || ((_553 == 98)))) {
        _566 = (((_552 == 21)) || ((_553 == 21)));
      } else {
        _566 = true;
      }
    } else {
      _566 = true;
    }
    if (!(((_552 == 19)) || ((_553 == 19)))) {
      if (!(((_552 == 20)) || ((_553 == 20)))) {
        if (!(((_552 == 11)) || ((_553 == 11)))) {
          if (!(((_552 == 12)) || ((_553 == 12)))) {
            if (!(((_552 == 13)) || ((_553 == 13)))) {
              if (!(((_552 == 14)) || ((_553 == 14)))) {
                _595 = (((_552 == 15)) || ((_553 == 15)));
              } else {
                _595 = true;
              }
            } else {
              _595 = true;
            }
          } else {
            _595 = true;
          }
        } else {
          _595 = true;
        }
      } else {
        _595 = true;
      }
    } else {
      _595 = true;
    }
    ContentScreenSpaceRayCastResult __struct_store_0;
    __struct_store_0._rayOrigin = float3(_19, _20, _21);
    __struct_store_0._intersectedWorldPosition = float3((_548 + _viewPos.x), (_549 + _viewPos.y), (_550 + _viewPos.z));
    __struct_store_0._userData = int3(_29, _30, (((_551 | ((int)((uint)(_31) << 8))) | (((int)(uint)((int)(_566))) << 1)) | (((int)(uint)((int)(_595))) << 2)));
    __3__39__0__1__g_outIntersectedBuffer[((int)((uint)(_outputOffset) + SV_DispatchThreadID.x))] = __struct_store_0;
  }
}