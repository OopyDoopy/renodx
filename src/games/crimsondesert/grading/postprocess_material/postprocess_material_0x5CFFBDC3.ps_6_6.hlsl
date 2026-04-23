#include "../tonemap.hlsli"

struct PostProcessCameraLensRainStruct {
  float _rainSpeed;
  float _rainUTiling;
  float _rainVTiling;
  float _streakUTiling;
  float _streakVTiling;
  uint _rainNormalTexture;
  uint _rainMaskTexture;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

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

cbuffer __3__1__0__0__PostProcessMaterialIndex : register(b2, space1) {
  int _materialIndex : packoffset(c000.x);
  int _passIndex : packoffset(c000.y);
};

ConstantBuffer<PostProcessCameraLensRainStruct> BindlessParameters_PostProcessCameraLensRain[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _16[36];
  int _21 = WaveReadLaneFirst(_materialIndex);
  float _32 = _time.x * WaveReadLaneFirst(BindlessParameters_PostProcessCameraLensRain[((int)((uint)(select(((uint)_21 < (uint)170000), _21, 0)) + 0u))]._rainSpeed);
  int _33 = WaveReadLaneFirst(_materialIndex);
  int _42 = WaveReadLaneFirst(_materialIndex);
  float _51 = WaveReadLaneFirst(BindlessParameters_PostProcessCameraLensRain[((int)((uint)(select(((uint)_33 < (uint)170000), _33, 0)) + 0u))]._streakUTiling) * TEXCOORD.x;
  float _52 = WaveReadLaneFirst(BindlessParameters_PostProcessCameraLensRain[((int)((uint)(select(((uint)_42 < (uint)170000), _42, 0)) + 0u))]._streakVTiling) * TEXCOORD.y;
  int _59 = WaveReadLaneFirst(_materialIndex);
  int _67 = WaveReadLaneFirst(BindlessParameters_PostProcessCameraLensRain[((int)((uint)(select(((uint)_59 < (uint)170000), _59, 0)) + 0u))]._rainMaskTexture);
  float4 _74 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_67 < (uint)65000), _67, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_51, (_52 - frac(_32))));
  float _79 = saturate((abs(_74.z) + -0.009999999776482582f) * 1.1235954761505127f);
  float _83 = (_79 * _79) * (3.0f - (_79 * 2.0f));
  int _84 = WaveReadLaneFirst(_materialIndex);
  int _92 = WaveReadLaneFirst(BindlessParameters_PostProcessCameraLensRain[((int)((uint)(select(((uint)_84 < (uint)170000), _84, 0)) + 0u))]._rainMaskTexture);
  float4 _99 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_92 < (uint)65000), _92, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_51, ((_52 * 1.2000000476837158f) - frac(_32 * 1.5f))));
  float _104 = saturate((abs(_99.z) + -0.03999999910593033f) * 50.0f);
  int _112 = WaveReadLaneFirst(_materialIndex);
  int _121 = WaveReadLaneFirst(_materialIndex);
  float _130 = WaveReadLaneFirst(BindlessParameters_PostProcessCameraLensRain[((int)((uint)(select(((uint)_112 < (uint)170000), _112, 0)) + 0u))]._rainUTiling) * TEXCOORD.x;
  float _131 = WaveReadLaneFirst(BindlessParameters_PostProcessCameraLensRain[((int)((uint)(select(((uint)_121 < (uint)170000), _121, 0)) + 0u))]._rainVTiling) * TEXCOORD.y;
  int _132 = WaveReadLaneFirst(_materialIndex);
  int _140 = WaveReadLaneFirst(BindlessParameters_PostProcessCameraLensRain[((int)((uint)(select(((uint)_132 < (uint)170000), _132, 0)) + 0u))]._rainMaskTexture);
  float4 _147 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_140 < (uint)65000), _140, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_130, _131));
  int _150 = WaveReadLaneFirst(_materialIndex);
  int _158 = WaveReadLaneFirst(BindlessParameters_PostProcessCameraLensRain[((int)((uint)(select(((uint)_150 < (uint)170000), _150, 0)) + 0u))]._rainNormalTexture);
  float4 _165 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_158 < (uint)65000), _158, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_130, (1.0f - _131)));
  float _172 = saturate((2.5f - TEXCOORD.y) * 0.3333333432674408f);
  float _186 = saturate(saturate(_147.y) - saturate(((((((_104 * _104) * (3.0f - (_104 * 2.0f))) - _83) * 0.5f) + _83) - saturate(exp2(log2((_172 * _172) * (3.0f - (_172 * 2.0f))) * 1.100000023841858f))) * 5.0f));
  float _194 = dot(float3(_186, _186, _186), float3(1.0f, 1.0f, 1.0f)) * 0.09000000357627869f;
  float4 _203 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(abs((_194 * ((_186 * ((_165.x * 2.0f) + -1.4960784912109375f)) + 0.5f)) + TEXCOORD.x), abs(TEXCOORD.y - (_194 * ((_186 * ((_165.y * 2.0f) + -1.4960784912109375f)) + 0.5f)))));
  float _213 = (pow(_203.x, 0.012683313339948654f));
  float _214 = (pow(_203.y, 0.012683313339948654f));
  float _215 = (pow(_203.z, 0.012683313339948654f));
  float _237 = exp2(log2(max(0.0f, (_213 + -0.8359375f)) / (18.8515625f - (_213 * 18.6875f))) * 6.277394771575928f);
  float _238 = exp2(log2(max(0.0f, (_214 + -0.8359375f)) / (18.8515625f - (_214 * 18.6875f))) * 6.277394771575928f);
  float _239 = exp2(log2(max(0.0f, (_215 + -0.8359375f)) / (18.8515625f - (_215 * 18.6875f))) * 6.277394771575928f);
  uint _247 = uint(SV_Position.y);
  float _261;
  float _507;
  float _508;
  float _509;
  float _629;
  float _630;
  float _631;
  float _652;
  float _653;
  float _654;
  float _687;
  float _688;
  float _689;
  float _703;
  float _704;
  float _705;
  if (_etcParams.y == 1.0f) {
    uint2 _255 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_247), 0));
    _261 = (float((uint)((uint)(_255.x & 127))) + 0.5f);
  } else {
    _261 = select(isnan(_postProcessParams.x), 0.0f, _postProcessParams.x);
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_237, _238, _239));
    _629 = output_color.x;
    _630 = output_color.y;
    _631 = output_color.z;
  } else {
    _629 = _237;
    _630 = _238;
    _631 = _239;
  }
  if (_etcParams.y > 1.0f) {
    float _642 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _643 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _647 = saturate(1.0f - (dot(float2(_642, _643), float2(_642, _643)) * saturate(_etcParams.y + -1.0f)));
    _652 = (_647 * _629);
    _653 = (_647 * _630);
    _654 = (_647 * _631);
  } else {
    _652 = _629;
    _653 = _630;
    _654 = _631;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _687 = select((_652 <= 0.0031308000907301903f), (_652 * 12.920000076293945f), (((pow(_652, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _688 = select((_653 <= 0.0031308000907301903f), (_653 * 12.920000076293945f), (((pow(_653, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _689 = select((_654 <= 0.0031308000907301903f), (_654 * 12.920000076293945f), (((pow(_654, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _687 = _652;
    _688 = _653;
    _689 = _654;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _694 = float((uint)_247);
    if (!(_694 < _viewDir.w)) {
      if (!(_694 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _703 = _687;
        _704 = _688;
        _705 = _689;
      } else {
        _703 = 0.0f;
        _704 = 0.0f;
        _705 = 0.0f;
      }
    } else {
      _703 = 0.0f;
      _704 = 0.0f;
      _705 = 0.0f;
    }
  } else {
    _703 = _687;
    _704 = _688;
    _705 = _689;
  }
  float _715 = exp2(log2(_703 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _716 = exp2(log2(_704 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _717 = exp2(log2(_705 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_715 * 18.6875f) + 1.0f)) * ((_715 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_716 * 18.6875f) + 1.0f)) * ((_716 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_717 * 18.6875f) + 1.0f)) * ((_717 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _261;
  return SV_Target;
}

