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
  float _41 = (pow(_31.x, 0.012683313339948654f));
  float _42 = (pow(_31.y, 0.012683313339948654f));
  float _43 = (pow(_31.z, 0.012683313339948654f));
  float _65 = exp2(log2(max(0.0f, (_41 + -0.8359375f)) / (18.8515625f - (_41 * 18.6875f))) * 6.277394771575928f);
  float _66 = exp2(log2(max(0.0f, (_42 + -0.8359375f)) / (18.8515625f - (_42 * 18.6875f))) * 6.277394771575928f);
  float _67 = exp2(log2(max(0.0f, (_43 + -0.8359375f)) / (18.8515625f - (_43 * 18.6875f))) * 6.277394771575928f);
  float _68 = _65 * 10000.0f;
  float _69 = _66 * 10000.0f;
  float _70 = _67 * 10000.0f;
  int _71 = WaveReadLaneFirst(_materialIndex);
  float _224;
  float _225;
  float _226;
  float _240;
  float _486;
  float _487;
  float _488;
  float _608;
  float _609;
  float _610;
  float _631;
  float _632;
  float _633;
  float _666;
  float _667;
  float _668;
  float _682;
  float _683;
  float _684;
  if (!(!(WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_71 < (uint)170000), _71, 0)) + 0u))]._ghostFXRatio) >= 0.0010000000474974513f))) {
    float _83 = 4.0f / (_srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y);
    int _90 = WaveReadLaneFirst(_materialIndex);
    int _98 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_90 < (uint)170000), _90, 0)) + 0u))]._ghostNoiseTex);
    float4 _105 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_98 < (uint)65000), _98, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((TEXCOORD.x * 3.0f) * _83), ((_time.x * 0.30000001192092896f) + (_83 * TEXCOORD.y))));
    int _107 = WaveReadLaneFirst(_materialIndex);
    int _116 = WaveReadLaneFirst(_materialIndex);
    float _126 = WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_116 < (uint)170000), _116, 0)) + 0u))]._ghostNoiseIntensity) * (WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_107 < (uint)170000), _107, 0)) + 0u))]._ghostFXRatio) * _105.y);
    float _129 = (_126 * 0.009999999776482582f) + TEXCOORD.x;
    float _130 = (_126 * 0.05000000074505806f) + TEXCOORD.y;
    float4 _139 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * _129), int(_customRenderPassSizeInvSize.y * _130), 0));
    uint _149 = __3__36__0__0__g_depthOpaque.Load(int3((int)(uint(_bufferSizeAndInvSize.x * _129)), (int)(uint(_bufferSizeAndInvSize.y * _130)), 0));
    int _164 = WaveReadLaneFirst(_materialIndex);
    float4 _175 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    float _185 = (pow(_175.x, 0.012683313339948654f));
    float _186 = (pow(_175.y, 0.012683313339948654f));
    float _187 = (pow(_175.z, 0.012683313339948654f));
    float _216 = (saturate(ceil(((_nearFarProj.x / max(1.0000000116860974e-07f, (float((uint)((uint)(_149.x & 16777215))) * 5.960465188081798e-08f))) + 0.05000000074505806f) - (_nearFarProj.x / max(1.0000000116860974e-07f, _139.x)))) * 10000.0f) * WaveReadLaneFirst(BindlessParameters_PostProcessGhost_CD[((int)((uint)(select(((uint)_164 < (uint)170000), _164, 0)) + 0u))]._ghostFXRatio);
    _224 = (((exp2(log2(max(0.0f, (_185 + -0.8359375f)) / (18.8515625f - (_185 * 18.6875f))) * 6.277394771575928f) - _65) * _216) + _68);
    _225 = (((exp2(log2(max(0.0f, (_186 + -0.8359375f)) / (18.8515625f - (_186 * 18.6875f))) * 6.277394771575928f) - _66) * _216) + _69);
    _226 = (((exp2(log2(max(0.0f, (_187 + -0.8359375f)) / (18.8515625f - (_187 * 18.6875f))) * 6.277394771575928f) - _67) * _216) + _70);
  } else {
    _224 = _68;
    _225 = _69;
    _226 = _70;
  }
  uint _227 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _234 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_227), 0));
    _240 = (float((uint)((uint)(_234.x & 127))) + 0.5f);
  } else {
    _240 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_224, _225, _226));
    _608 = output_color.x;
    _609 = output_color.y;
    _610 = output_color.z;
  } else {
    _608 = _224;
    _609 = _225;
    _610 = _226;
  }
  if (_etcParams.y > 1.0f) {
    float _621 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _622 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _626 = saturate(1.0f - (dot(float2(_621, _622), float2(_621, _622)) * saturate(_etcParams.y + -1.0f)));
    _631 = (_626 * _608);
    _632 = (_626 * _609);
    _633 = (_626 * _610);
  } else {
    _631 = _608;
    _632 = _609;
    _633 = _610;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _666 = select((_631 <= 0.0031308000907301903f), (_631 * 12.920000076293945f), (((pow(_631, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _667 = select((_632 <= 0.0031308000907301903f), (_632 * 12.920000076293945f), (((pow(_632, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _668 = select((_633 <= 0.0031308000907301903f), (_633 * 12.920000076293945f), (((pow(_633, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _666 = _631;
    _667 = _632;
    _668 = _633;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _673 = float((uint)_227);
    if (!(_673 < _viewDir.w)) {
      if (!(_673 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _682 = _666;
        _683 = _667;
        _684 = _668;
      } else {
        _682 = 0.0f;
        _683 = 0.0f;
        _684 = 0.0f;
      }
    } else {
      _682 = 0.0f;
      _683 = 0.0f;
      _684 = 0.0f;
    }
  } else {
    _682 = _666;
    _683 = _667;
    _684 = _668;
  }
  float _694 = exp2(log2(_682 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _695 = exp2(log2(_683 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _696 = exp2(log2(_684 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_694 * 18.6875f) + 1.0f)) * ((_694 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_695 * 18.6875f) + 1.0f)) * ((_695 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_696 * 18.6875f) + 1.0f)) * ((_696 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _240;
  return SV_Target;
}

