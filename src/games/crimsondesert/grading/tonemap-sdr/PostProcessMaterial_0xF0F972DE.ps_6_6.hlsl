struct PostProcessGhost_CDStruct {
  float _ghostFXRatio;
  uint _ghostNoiseTex;
  float _ghostNoiseIntensity;
  float _ghostFXColorInnerBrightness;
  uint _ghostFXColor1;
  uint _ghostFXColor2;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t69, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t32, space36);

Texture2D<uint> __3__36__0__0__g_depthOpaque : register(t41, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t33, space36);

Texture2D<float4> __3__36__0__0__g_CustomRenderPassDepth : register(t80, space36);

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

ConstantBuffer<PostProcessGhost_CDStruct> BindlessParameters_PostProcessGhost_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float4 _32 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  int _36 = WaveReadLaneFirst(_materialIndex);
  float _155;
  float _156;
  float _157;
  float _171;
  float _376;
  float _377;
  float _378;
  float _471;
  float _472;
  float _473;
  float _527;
  float _528;
  float _529;
  float _548;
  float _549;
  float _550;
  float _580;
  float _581;
  float _582;
  float _596;
  float _597;
  float _598;
  if (!(!(WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_36 < (uint)170000), _36, 0)) + 0u))]._ghostFXRatio) >= 0.0010000000474974513f))) {
    float _48 = 4.0f / (_srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y);
    int _55 = WaveReadLaneFirst(_materialIndex);
    int _63 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_55 < (uint)170000), _55, 0)) + 0u))]._ghostNoiseTex);
    float4 _70 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_63 < (uint)65000), _63, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((TEXCOORD.x * 3.0f) * _48), ((_time.x * 0.30000001192092896f) + (_48 * TEXCOORD.y))));
    int _72 = WaveReadLaneFirst(_materialIndex);
    int _81 = WaveReadLaneFirst(_materialIndex);
    float _91 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_81 < (uint)170000), _81, 0)) + 0u))]._ghostNoiseIntensity) * (WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_72 < (uint)170000), _72, 0)) + 0u))]._ghostFXRatio) * _70.y);
    float _94 = (_91 * 0.009999999776482582f) + TEXCOORD.x;
    float _95 = (_91 * 0.05000000074505806f) + TEXCOORD.y;
    float4 _104 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * _94), int(_customRenderPassSizeInvSize.y * _95), 0));
    uint _114 = __3__36__0__0__g_depthOpaque.Load(int3((int)(uint(_bufferSizeAndInvSize.x * _94)), (int)(uint(_bufferSizeAndInvSize.y * _95)), 0));
    int _129 = WaveReadLaneFirst(_materialIndex);
    float _138 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_129 < (uint)170000), _129, 0)) + 0u))]._ghostFXRatio) * saturate(ceil(((_nearFarProj.x / max(1.0000000116860974e-07f, (float((uint)((uint)(_114.x & 16777215))) * 5.960465188081798e-08f))) + 0.05000000074505806f) - (_nearFarProj.x / max(1.0000000116860974e-07f, _104.x))));
    float4 _141 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    _155 = (lerp(_32.x, _141.x, _138));
    _156 = (lerp(_32.y, _141.y, _138));
    _157 = (lerp(_32.z, _141.z, _138));
  } else {
    _155 = _32.x;
    _156 = _32.y;
    _157 = _32.z;
  }
  uint _158 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _165 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_158), 0));
    _171 = (float((uint)((uint)(_165.x & 127))) + 0.5f);
  } else {
    _171 = 1.0f;
  }
  bool _174 = (_localToneMappingParams.w > 0.0f);
  if (_174) {
    float3 output_color = TonemapReplacer(float3(_155, _156, _157));
    _527 = output_color.x;
    _528 = output_color.y;
    _529 = output_color.z;
  } else {
    _527 = _155;
    _528 = _156;
    _529 = _157;
  }
  if (_etcParams.y > 1.0f) {
    float _538 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _539 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _543 = saturate(1.0f - (dot(float2(_538, _539), float2(_538, _539)) * saturate(_etcParams.y + -1.0f)));
    _548 = (_543 * _527);
    _549 = (_543 * _528);
    _550 = (_543 * _529);
  } else {
    _548 = _527;
    _549 = _528;
    _550 = _529;
  }
  if ((_174) && ((_etcParams.z > 0.0f))) {
    _580 = select((_548 <= 0.0031308000907301903f), (_548 * 12.920000076293945f), (((pow(_548, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _581 = select((_549 <= 0.0031308000907301903f), (_549 * 12.920000076293945f), (((pow(_549, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _582 = select((_550 <= 0.0031308000907301903f), (_550 * 12.920000076293945f), (((pow(_550, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _580 = _548;
    _581 = _549;
    _582 = _550;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _587 = float((uint)_158);
    if (!(_587 < _viewDir.w)) {
      if (!(_587 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _596 = _580;
        _597 = _581;
        _598 = _582;
      } else {
        _596 = 0.0f;
        _597 = 0.0f;
        _598 = 0.0f;
      }
    } else {
      _596 = 0.0f;
      _597 = 0.0f;
      _598 = 0.0f;
    }
  } else {
    _596 = _580;
    _597 = _581;
    _598 = _582;
  }
  SV_Target.x = _596;
  SV_Target.y = _597;
  SV_Target.z = _598;
  SV_Target.w = _171;
  return SV_Target;
}