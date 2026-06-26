struct PostProcessGrayscaleStruct {
  float _ratio;
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

ConstantBuffer<PostProcessGrayscaleStruct> BindlessParameters_PostProcessGrayscale[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float4 _23 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y));
  int _27 = WaveReadLaneFirst(_materialIndex);
  float _35 = WaveReadLaneFirst(BindlessParameters_PostProcessGrayscale[((int)((uint)(select(((uint)_27 < (uint)170000), _27, 0)) + 0u))]._ratio);
  float _36 = dot(float3(_23.x, _23.y, _23.z), float3(0.26269999146461487f, 0.6779999732971191f, 0.059300001710653305f));
  float _43 = ((_36 - _23.x) * _35) + _23.x;
  float _44 = ((_36 - _23.y) * _35) + _23.y;
  float _45 = ((_36 - _23.z) * _35) + _23.z;
  uint _46 = uint(SV_Position.y);
  float _60;
  float _265;
  float _266;
  float _267;
  float _360;
  float _361;
  float _362;
  float _416;
  float _417;
  float _418;
  float _437;
  float _438;
  float _439;
  float _469;
  float _470;
  float _471;
  float _485;
  float _486;
  float _487;
  if (_etcParams.y == 1.0f) {
    uint2 _54 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_46), 0));
    _60 = (float((uint)((uint)(_54.x & 127))) + 0.5f);
  } else {
    _60 = _postProcessParams.x;
  }
  bool _63 = (_localToneMappingParams.w > 0.0f);
  if (_63) {
    float3 output_color = TonemapReplacer(float3(_43, _44, _45));
    _416 = output_color.x;
    _417 = output_color.y;
    _418 = output_color.z;
  } else {
    _416 = _43;
    _417 = _44;
    _418 = _45;
  }
  if (_etcParams.y > 1.0f) {
    float _427 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _428 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _432 = saturate(1.0f - (dot(float2(_427, _428), float2(_427, _428)) * saturate(_etcParams.y + -1.0f)));
    _437 = (_432 * _416);
    _438 = (_432 * _417);
    _439 = (_432 * _418);
  } else {
    _437 = _416;
    _438 = _417;
    _439 = _418;
  }
  if ((_63) && ((_etcParams.z > 0.0f))) {
    _469 = select((_437 <= 0.0031308000907301903f), (_437 * 12.920000076293945f), (((pow(_437, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _470 = select((_438 <= 0.0031308000907301903f), (_438 * 12.920000076293945f), (((pow(_438, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _471 = select((_439 <= 0.0031308000907301903f), (_439 * 12.920000076293945f), (((pow(_439, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _469 = _437;
    _470 = _438;
    _471 = _439;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _476 = float((uint)_46);
    if (!(_476 < _viewDir.w)) {
      if (!(_476 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _485 = _469;
        _486 = _470;
        _487 = _471;
      } else {
        _485 = 0.0f;
        _486 = 0.0f;
        _487 = 0.0f;
      }
    } else {
      _485 = 0.0f;
      _486 = 0.0f;
      _487 = 0.0f;
    }
  } else {
    _485 = _469;
    _486 = _470;
    _487 = _471;
  }
  SV_Target.x = _485;
  SV_Target.y = _486;
  SV_Target.z = _487;
  SV_Target.w = _60;
  return SV_Target;
}