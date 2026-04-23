#include "../tonemap.hlsli"

struct PostProcessGhost_CDStruct {
  float _ghostFXRatio;
  uint _ghostNoiseTex;
  float _ghostNoiseIntensity;
  float _ghostFXColorInnerBrightness;
  uint _ghostFXColor1;
  uint _ghostFXColor2;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t44, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t33, space36);

Texture2D<uint> __3__36__0__0__g_depthOpaque : register(t16, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t38, space36);

Texture2D<float4> __3__36__0__0__g_CustomRenderPassDepth : register(t66, space36);

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

ConstantBuffer<PostProcessGhost_CDStruct> BindlessParameters_PostProcessGhost_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _22[36];
  float4 _31 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  int _35 = WaveReadLaneFirst(_materialIndex);
  float _154;
  float _155;
  float _156;
  float _170;
  float _416;
  float _417;
  float _418;
  float _538;
  float _539;
  float _540;
  float _561;
  float _562;
  float _563;
  float _596;
  float _597;
  float _598;
  float _612;
  float _613;
  float _614;
  if (!(!(WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_35 < (uint)170000), _35, 0)) + 0u))]._ghostFXRatio) >= 0.0010000000474974513f))) {
    float _47 = 4.0f / (_srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y);
    int _54 = WaveReadLaneFirst(_materialIndex);
    int _62 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_54 < (uint)170000), _54, 0)) + 0u))]._ghostNoiseTex);
    float4 _69 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_62 < (uint)65000), _62, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((TEXCOORD.x * 3.0f) * _47), ((_time.x * 0.30000001192092896f) + (_47 * TEXCOORD.y))));
    int _71 = WaveReadLaneFirst(_materialIndex);
    int _80 = WaveReadLaneFirst(_materialIndex);
    float _90 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_80 < (uint)170000), _80, 0)) + 0u))]._ghostNoiseIntensity) * (WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_71 < (uint)170000), _71, 0)) + 0u))]._ghostFXRatio) * _69.y);
    float _93 = (_90 * 0.009999999776482582f) + TEXCOORD.x;
    float _94 = (_90 * 0.05000000074505806f) + TEXCOORD.y;
    float4 _103 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * _93), int(_customRenderPassSizeInvSize.y * _94), 0));
    uint _113 = __3__36__0__0__g_depthOpaque.Load(int3((int)(uint(_bufferSizeAndInvSize.x * _93)), (int)(uint(_bufferSizeAndInvSize.y * _94)), 0));
    int _128 = WaveReadLaneFirst(_materialIndex);
    float _137 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_128 < (uint)170000), _128, 0)) + 0u))]._ghostFXRatio) * saturate(ceil(((_nearFarProj.x / max(1.0000000116860974e-07f, (float((uint)((uint)(_113.x & 16777215))) * 5.960465188081798e-08f))) + 0.05000000074505806f) - (_nearFarProj.x / max(1.0000000116860974e-07f, _103.x))));
    float4 _140 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    _154 = (lerp(_31.x, _140.x, _137));
    _155 = (lerp(_31.y, _140.y, _137));
    _156 = (lerp(_31.z, _140.z, _137));
  } else {
    _154 = _31.x;
    _155 = _31.y;
    _156 = _31.z;
  }
  uint _157 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _164 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_157), 0));
    _170 = (float((uint)((uint)(_164.x & 127))) + 0.5f);
  } else {
    _170 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_154, _155, _156));
    _538 = output_color.x;
    _539 = output_color.y;
    _540 = output_color.z;
  } else {
    _538 = _154;
    _539 = _155;
    _540 = _156;
  }
  if (_etcParams.y > 1.0f) {
    float _551 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _552 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _556 = saturate(1.0f - (dot(float2(_551, _552), float2(_551, _552)) * saturate(_etcParams.y + -1.0f)));
    _561 = (_556 * _538);
    _562 = (_556 * _539);
    _563 = (_556 * _540);
  } else {
    _561 = _538;
    _562 = _539;
    _563 = _540;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _596 = select((_561 <= 0.0031308000907301903f), (_561 * 12.920000076293945f), (((pow(_561, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _597 = select((_562 <= 0.0031308000907301903f), (_562 * 12.920000076293945f), (((pow(_562, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _598 = select((_563 <= 0.0031308000907301903f), (_563 * 12.920000076293945f), (((pow(_563, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _596 = _561;
    _597 = _562;
    _598 = _563;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _603 = float((uint)_157);
    if (!(_603 < _viewDir.w)) {
      if (!(_603 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _612 = _596;
        _613 = _597;
        _614 = _598;
      } else {
        _612 = 0.0f;
        _613 = 0.0f;
        _614 = 0.0f;
      }
    } else {
      _612 = 0.0f;
      _613 = 0.0f;
      _614 = 0.0f;
    }
  } else {
    _612 = _596;
    _613 = _597;
    _614 = _598;
  }
  SV_Target.x = _612;
  SV_Target.y = _613;
  SV_Target.z = _614;
  SV_Target.w = _170;
  return SV_Target;
}

