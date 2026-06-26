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
  float _42 = (pow(_32.x, 0.012683313339948654f));
  float _43 = (pow(_32.y, 0.012683313339948654f));
  float _44 = (pow(_32.z, 0.012683313339948654f));
  float _66 = exp2(log2(max(0.0f, (_42 + -0.8359375f)) / (18.8515625f - (_42 * 18.6875f))) * 6.277394771575928f);
  float _67 = exp2(log2(max(0.0f, (_43 + -0.8359375f)) / (18.8515625f - (_43 * 18.6875f))) * 6.277394771575928f);
  float _68 = exp2(log2(max(0.0f, (_44 + -0.8359375f)) / (18.8515625f - (_44 * 18.6875f))) * 6.277394771575928f);
  float _69 = _66 * 10000.0f;
  float _70 = _67 * 10000.0f;
  float _71 = _68 * 10000.0f;
  int _72 = WaveReadLaneFirst(_materialIndex);
  float _225;
  float _226;
  float _227;
  float _241;
  float _446;
  float _447;
  float _448;
  float _541;
  float _542;
  float _543;
  float _597;
  float _598;
  float _599;
  float _618;
  float _619;
  float _620;
  float _650;
  float _651;
  float _652;
  float _666;
  float _667;
  float _668;
  if (!(!(WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_72 < (uint)170000), _72, 0)) + 0u))]._ghostFXRatio) >= 0.0010000000474974513f))) {
    float _84 = 4.0f / (_srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y);
    int _91 = WaveReadLaneFirst(_materialIndex);
    int _99 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_91 < (uint)170000), _91, 0)) + 0u))]._ghostNoiseTex);
    float4 _106 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_99 < (uint)65000), _99, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((TEXCOORD.x * 3.0f) * _84), ((_time.x * 0.30000001192092896f) + (_84 * TEXCOORD.y))));
    int _108 = WaveReadLaneFirst(_materialIndex);
    int _117 = WaveReadLaneFirst(_materialIndex);
    float _127 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_117 < (uint)170000), _117, 0)) + 0u))]._ghostNoiseIntensity) * (WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_108 < (uint)170000), _108, 0)) + 0u))]._ghostFXRatio) * _106.y);
    float _130 = (_127 * 0.009999999776482582f) + TEXCOORD.x;
    float _131 = (_127 * 0.05000000074505806f) + TEXCOORD.y;
    float4 _140 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * _130), int(_customRenderPassSizeInvSize.y * _131), 0));
    uint _150 = __3__36__0__0__g_depthOpaque.Load(int3((int)(uint(_bufferSizeAndInvSize.x * _130)), (int)(uint(_bufferSizeAndInvSize.y * _131)), 0));
    int _165 = WaveReadLaneFirst(_materialIndex);
    float4 _176 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    float _186 = (pow(_176.x, 0.012683313339948654f));
    float _187 = (pow(_176.y, 0.012683313339948654f));
    float _188 = (pow(_176.z, 0.012683313339948654f));
    float _217 = (saturate(ceil(((_nearFarProj.x / max(1.0000000116860974e-07f, (float((uint)((uint)(_150.x & 16777215))) * 5.960465188081798e-08f))) + 0.05000000074505806f) - (_nearFarProj.x / max(1.0000000116860974e-07f, _140.x)))) * 10000.0f) * WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_165 < (uint)170000), _165, 0)) + 0u))]._ghostFXRatio);
    _225 = (((exp2(log2(max(0.0f, (_186 + -0.8359375f)) / (18.8515625f - (_186 * 18.6875f))) * 6.277394771575928f) - _66) * _217) + _69);
    _226 = (((exp2(log2(max(0.0f, (_187 + -0.8359375f)) / (18.8515625f - (_187 * 18.6875f))) * 6.277394771575928f) - _67) * _217) + _70);
    _227 = (((exp2(log2(max(0.0f, (_188 + -0.8359375f)) / (18.8515625f - (_188 * 18.6875f))) * 6.277394771575928f) - _68) * _217) + _71);
  } else {
    _225 = _69;
    _226 = _70;
    _227 = _71;
  }
  uint _228 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _235 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_228), 0));
    _241 = (float((uint)((uint)(_235.x & 127))) + 0.5f);
  } else {
    _241 = 1.0f;
  }
  bool _244 = (_localToneMappingParams.w > 0.0f);
  if (_244) {
    float3 output_color = TonemapReplacer(float3(_225, _226, _227));
    _597 = output_color.x;
    _598 = output_color.y;
    _599 = output_color.z;
  } else {
    _597 = _225;
    _598 = _226;
    _599 = _227;
  }
  if (_etcParams.y > 1.0f) {
    float _608 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _609 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _613 = saturate(1.0f - (dot(float2(_608, _609), float2(_608, _609)) * saturate(_etcParams.y + -1.0f)));
    _618 = (_613 * _597);
    _619 = (_613 * _598);
    _620 = (_613 * _599);
  } else {
    _618 = _597;
    _619 = _598;
    _620 = _599;
  }
  if ((_244) && ((_etcParams.z > 0.0f))) {
    _650 = select((_618 <= 0.0031308000907301903f), (_618 * 12.920000076293945f), (((pow(_618, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _651 = select((_619 <= 0.0031308000907301903f), (_619 * 12.920000076293945f), (((pow(_619, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _652 = select((_620 <= 0.0031308000907301903f), (_620 * 12.920000076293945f), (((pow(_620, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _650 = _618;
    _651 = _619;
    _652 = _620;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _657 = float((uint)_228);
    if (!(_657 < _viewDir.w)) {
      if (!(_657 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _666 = _650;
        _667 = _651;
        _668 = _652;
      } else {
        _666 = 0.0f;
        _667 = 0.0f;
        _668 = 0.0f;
      }
    } else {
      _666 = 0.0f;
      _667 = 0.0f;
      _668 = 0.0f;
    }
  } else {
    _666 = _650;
    _667 = _651;
    _668 = _652;
  }
  float _678 = exp2(log2(_666 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _679 = exp2(log2(_667 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _680 = exp2(log2(_668 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_678 * 18.6875f) + 1.0f)) * ((_678 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_679 * 18.6875f) + 1.0f)) * ((_679 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_680 * 18.6875f) + 1.0f)) * ((_680 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _241;
  return SV_Target;
}