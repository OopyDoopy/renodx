struct PostProcessDirectionalBlurStruct {
  float _intensity;
  float _noiseStrength;
  float _direction;
  float _noiseScale;
  uint _noiseTexture;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

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

ConstantBuffer<PostProcessDirectionalBlurStruct> BindlessParameters_PostProcessDirectionalBlur[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  int _18 = WaveReadLaneFirst(_materialIndex);
  float _26 = WaveReadLaneFirst(BindlessParameters_PostProcessDirectionalBlur[((int)((uint)(select(((uint)_18 < (uint)170000), _18, 0)) + 0u))]._noiseScale);
  int _29 = WaveReadLaneFirst(_materialIndex);
  int _37 = WaveReadLaneFirst(BindlessParameters_PostProcessDirectionalBlur[((int)((uint)(select(((uint)_29 < (uint)170000), _29, 0)) + 0u))]._noiseTexture);
  float4 _44 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_37 < (uint)65000), _37, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_26 * TEXCOORD.x), (_26 * TEXCOORD.y)));
  int _46 = WaveReadLaneFirst(_materialIndex);
  float _54 = WaveReadLaneFirst(BindlessParameters_PostProcessDirectionalBlur[((int)((uint)(select(((uint)_46 < (uint)170000), _46, 0)) + 0u))]._direction);
  int _58 = WaveReadLaneFirst(_materialIndex);
  int _67 = WaveReadLaneFirst(_materialIndex);
  float _77;
  float _78;
  float _79;
  int _80;
  float _202;
  float _407;
  float _408;
  float _409;
  float _502;
  float _503;
  float _504;
  float _558;
  float _559;
  float _560;
  float _579;
  float _580;
  float _581;
  float _611;
  float _612;
  float _613;
  float _627;
  float _628;
  float _629;
  _77 = 0.0f;
  _78 = 0.0f;
  _79 = 0.0f;
  _80 = 1;
  while(true) {
    float _83 = (WaveReadLaneFirst(BindlessParameters_PostProcessDirectionalBlur[((int)((uint)(select(((uint)_58 < (uint)170000), _58, 0)) + 0u))]._intensity) * 0.03125f) * float((int)(_80));
    float _84 = WaveReadLaneFirst(BindlessParameters_PostProcessDirectionalBlur[((int)((uint)(select(((uint)_67 < (uint)170000), _67, 0)) + 0u))]._noiseStrength) * _44.x;
    float _87 = _83 * (_84 + (-0.0f - sin(_54)));
    float _88 = _83 * (_84 + cos(_54));
    float4 _93 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2((_87 + TEXCOORD.x), (_88 + TEXCOORD.y)));
    float _103 = (pow(_93.x, 0.012683313339948654f));
    float _104 = (pow(_93.y, 0.012683313339948654f));
    float _105 = (pow(_93.z, 0.012683313339948654f));
    float4 _132 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2((TEXCOORD.x - _87), (TEXCOORD.y - _88)));
    float _142 = (pow(_132.x, 0.012683313339948654f));
    float _143 = (pow(_132.y, 0.012683313339948654f));
    float _144 = (pow(_132.z, 0.012683313339948654f));
    float _171 = ((exp2(log2(max(0.0f, (_142 + -0.8359375f)) / (18.8515625f - (_142 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_103 + -0.8359375f)) / (18.8515625f - (_103 * 18.6875f))) * 6.277394771575928f)) * 10000.0f) + _77;
    float _174 = ((exp2(log2(max(0.0f, (_143 + -0.8359375f)) / (18.8515625f - (_143 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_104 + -0.8359375f)) / (18.8515625f - (_104 * 18.6875f))) * 6.277394771575928f)) * 10000.0f) + _78;
    float _177 = ((exp2(log2(max(0.0f, (_144 + -0.8359375f)) / (18.8515625f - (_144 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_105 + -0.8359375f)) / (18.8515625f - (_105 * 18.6875f))) * 6.277394771575928f)) * 10000.0f) + _79;
    bool __defer_76_626 = false;
    if (!((_80 + 1) == 33)) {
      _77 = _171;
      _78 = _174;
      _79 = _177;
      _80 = (_80 + 1);
      continue;
    }
    if (__defer_76_626) {
      float _639 = exp2(log2(_627 * 9.999999747378752e-05f) * 0.1593017578125f);
      float _640 = exp2(log2(_628 * 9.999999747378752e-05f) * 0.1593017578125f);
      float _641 = exp2(log2(_629 * 9.999999747378752e-05f) * 0.1593017578125f);
      SV_Target.x = exp2(log2((1.0f / ((_639 * 18.6875f) + 1.0f)) * ((_639 * 18.8515625f) + 0.8359375f)) * 78.84375f);
      SV_Target.y = exp2(log2((1.0f / ((_640 * 18.6875f) + 1.0f)) * ((_640 * 18.8515625f) + 0.8359375f)) * 78.84375f);
      SV_Target.z = exp2(log2((1.0f / ((_641 * 18.6875f) + 1.0f)) * ((_641 * 18.8515625f) + 0.8359375f)) * 78.84375f);
      SV_Target.w = _202;
    }
    uint _189 = uint(SV_Position.y);
    if (_etcParams.y == 1.0f) {
      uint2 _196 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_189), 0));
      _202 = (float((uint)((uint)(_196.x & 127))) + 0.5f);
    } else {
      _202 = _postProcessParams.x;
    }
    bool _205 = (_localToneMappingParams.w > 0.0f);
    if (_205) {
      float3 output_color = TonemapReplacer(float3(_171, _174, _177));
      _558 = output_color.x;
      _559 = output_color.y;
      _560 = output_color.z;
    } else {
      _558 = (_171 * 0.015625f);
      _559 = (_174 * 0.015625f);
      _560 = (_177 * 0.015625f);
    }
    if (_etcParams.y > 1.0f) {
      float _569 = abs((TEXCOORD.x * 2.0f) + -1.0f);
      float _570 = abs((TEXCOORD.y * 2.0f) + -1.0f);
      float _574 = saturate(1.0f - (dot(float2(_569, _570), float2(_569, _570)) * saturate(_etcParams.y + -1.0f)));
      _579 = (_574 * _558);
      _580 = (_574 * _559);
      _581 = (_574 * _560);
    } else {
      _579 = _558;
      _580 = _559;
      _581 = _560;
    }
    if ((_205) && ((_etcParams.z > 0.0f))) {
      _611 = select((_579 <= 0.0031308000907301903f), (_579 * 12.920000076293945f), (((pow(_579, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
      _612 = select((_580 <= 0.0031308000907301903f), (_580 * 12.920000076293945f), (((pow(_580, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
      _613 = select((_581 <= 0.0031308000907301903f), (_581 * 12.920000076293945f), (((pow(_581, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    } else {
      _611 = _579;
      _612 = _580;
      _613 = _581;
    }
    if (!(!(_etcParams.y >= 1.0f))) {
      float _618 = float((uint)_189);
      if (!(_618 < _viewDir.w)) {
        if (!(_618 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
          _627 = _611;
          _628 = _612;
          _629 = _613;
        } else {
          _627 = 0.0f;
          _628 = 0.0f;
          _629 = 0.0f;
        }
      } else {
        _627 = 0.0f;
        _628 = 0.0f;
        _629 = 0.0f;
      }
    } else {
      _627 = _611;
      _628 = _612;
      _629 = _613;
    }
    float _639 = exp2(log2(_627 * 9.999999747378752e-05f) * 0.1593017578125f);
    float _640 = exp2(log2(_628 * 9.999999747378752e-05f) * 0.1593017578125f);
    float _641 = exp2(log2(_629 * 9.999999747378752e-05f) * 0.1593017578125f);
    SV_Target.x = exp2(log2((1.0f / ((_639 * 18.6875f) + 1.0f)) * ((_639 * 18.8515625f) + 0.8359375f)) * 78.84375f);
    SV_Target.y = exp2(log2((1.0f / ((_640 * 18.6875f) + 1.0f)) * ((_640 * 18.8515625f) + 0.8359375f)) * 78.84375f);
    SV_Target.z = exp2(log2((1.0f / ((_641 * 18.6875f) + 1.0f)) * ((_641 * 18.8515625f) + 0.8359375f)) * 78.84375f);
    SV_Target.w = _202;
    break;
  }
  return SV_Target;
}