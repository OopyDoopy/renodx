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

ConstantBuffer<PostProcessCameraLensRainStruct> BindlessParameters_PostProcessCameraLensRain[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  int _22 = WaveReadLaneFirst(_materialIndex);
  float _33 = _time.x * WaveReadLaneFirst(BindlessParameters_PostProcessCameraLensRain[((int)((uint)(select(((uint)_22 < (uint)170000), _22, 0)) + 0u))]._rainSpeed);
  int _34 = WaveReadLaneFirst(_materialIndex);
  int _43 = WaveReadLaneFirst(_materialIndex);
  float _52 = WaveReadLaneFirst(BindlessParameters_PostProcessCameraLensRain[((int)((uint)(select(((uint)_34 < (uint)170000), _34, 0)) + 0u))]._streakUTiling) * TEXCOORD.x;
  float _53 = WaveReadLaneFirst(BindlessParameters_PostProcessCameraLensRain[((int)((uint)(select(((uint)_43 < (uint)170000), _43, 0)) + 0u))]._streakVTiling) * TEXCOORD.y;
  int _60 = WaveReadLaneFirst(_materialIndex);
  int _68 = WaveReadLaneFirst(BindlessParameters_PostProcessCameraLensRain[((int)((uint)(select(((uint)_60 < (uint)170000), _60, 0)) + 0u))]._rainMaskTexture);
  float4 _75 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_68 < (uint)65000), _68, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_52, (_53 - frac(_33))));
  float _80 = saturate((abs(_75.z) + -0.009999999776482582f) * 1.1235954761505127f);
  float _84 = (_80 * _80) * (3.0f - (_80 * 2.0f));
  int _85 = WaveReadLaneFirst(_materialIndex);
  int _93 = WaveReadLaneFirst(BindlessParameters_PostProcessCameraLensRain[((int)((uint)(select(((uint)_85 < (uint)170000), _85, 0)) + 0u))]._rainMaskTexture);
  float4 _100 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_93 < (uint)65000), _93, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_52, ((_53 * 1.2000000476837158f) - frac(_33 * 1.5f))));
  float _105 = saturate((abs(_100.z) + -0.03999999910593033f) * 50.0f);
  int _113 = WaveReadLaneFirst(_materialIndex);
  int _122 = WaveReadLaneFirst(_materialIndex);
  float _131 = WaveReadLaneFirst(BindlessParameters_PostProcessCameraLensRain[((int)((uint)(select(((uint)_113 < (uint)170000), _113, 0)) + 0u))]._rainUTiling) * TEXCOORD.x;
  float _132 = WaveReadLaneFirst(BindlessParameters_PostProcessCameraLensRain[((int)((uint)(select(((uint)_122 < (uint)170000), _122, 0)) + 0u))]._rainVTiling) * TEXCOORD.y;
  int _133 = WaveReadLaneFirst(_materialIndex);
  int _141 = WaveReadLaneFirst(BindlessParameters_PostProcessCameraLensRain[((int)((uint)(select(((uint)_133 < (uint)170000), _133, 0)) + 0u))]._rainMaskTexture);
  float4 _148 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_141 < (uint)65000), _141, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_131, _132));
  int _151 = WaveReadLaneFirst(_materialIndex);
  int _159 = WaveReadLaneFirst(BindlessParameters_PostProcessCameraLensRain[((int)((uint)(select(((uint)_151 < (uint)170000), _151, 0)) + 0u))]._rainNormalTexture);
  float4 _166 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_159 < (uint)65000), _159, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_131, (1.0f - _132)));
  float _173 = saturate((2.5f - TEXCOORD.y) * 0.3333333432674408f);
  float _187 = saturate(saturate(_148.y) - saturate(((((((_105 * _105) * (3.0f - (_105 * 2.0f))) - _84) * 0.5f) + _84) - saturate(exp2(log2((_173 * _173) * (3.0f - (_173 * 2.0f))) * 1.100000023841858f))) * 5.0f));
  float _195 = dot(float3(_187, _187, _187), float3(1.0f, 1.0f, 1.0f)) * 0.09000000357627869f;
  float4 _204 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(abs((_195 * ((_187 * ((_166.x * 2.0f) + -1.4960784912109375f)) + 0.5f)) + TEXCOORD.x), abs(TEXCOORD.y - (_195 * ((_187 * ((_166.y * 2.0f) + -1.4960784912109375f)) + 0.5f)))));
  float _214 = (pow(_204.x, 0.012683313339948654f));
  float _215 = (pow(_204.y, 0.012683313339948654f));
  float _216 = (pow(_204.z, 0.012683313339948654f));
  float _238 = exp2(log2(max(0.0f, (_214 + -0.8359375f)) / (18.8515625f - (_214 * 18.6875f))) * 6.277394771575928f);
  float _239 = exp2(log2(max(0.0f, (_215 + -0.8359375f)) / (18.8515625f - (_215 * 18.6875f))) * 6.277394771575928f);
  float _240 = exp2(log2(max(0.0f, (_216 + -0.8359375f)) / (18.8515625f - (_216 * 18.6875f))) * 6.277394771575928f);
  uint _248 = uint(SV_Position.y);
  float _262;
  float _467;
  float _468;
  float _469;
  float _562;
  float _563;
  float _564;
  float _618;
  float _619;
  float _620;
  float _639;
  float _640;
  float _641;
  float _671;
  float _672;
  float _673;
  float _687;
  float _688;
  float _689;
  if (_etcParams.y == 1.0f) {
    uint2 _256 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_248), 0));
    _262 = (float((uint)((uint)(_256.x & 127))) + 0.5f);
  } else {
    _262 = select(isnan(_postProcessParams.x), 0.0f, _postProcessParams.x);
  }
  bool _265 = (_localToneMappingParams.w > 0.0f);
  if (_265) {
    float3 output_color = TonemapReplacer(float3(_238, _239, _240));
    _618 = output_color.x;
    _619 = output_color.y;
    _620 = output_color.z;
  } else {
    _618 = (_238 * 10000.0f);
    _619 = (_239 * 10000.0f);
    _620 = (_240 * 10000.0f);
  }
  if (_etcParams.y > 1.0f) {
    float _629 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _630 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _634 = saturate(1.0f - (dot(float2(_629, _630), float2(_629, _630)) * saturate(_etcParams.y + -1.0f)));
    _639 = (_634 * _618);
    _640 = (_634 * _619);
    _641 = (_634 * _620);
  } else {
    _639 = _618;
    _640 = _619;
    _641 = _620;
  }
  if ((_265) && ((_etcParams.z > 0.0f))) {
    _671 = select((_639 <= 0.0031308000907301903f), (_639 * 12.920000076293945f), (((pow(_639, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _672 = select((_640 <= 0.0031308000907301903f), (_640 * 12.920000076293945f), (((pow(_640, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _673 = select((_641 <= 0.0031308000907301903f), (_641 * 12.920000076293945f), (((pow(_641, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _671 = _639;
    _672 = _640;
    _673 = _641;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _678 = float((uint)_248);
    if (!(_678 < _viewDir.w)) {
      if (!(_678 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _687 = _671;
        _688 = _672;
        _689 = _673;
      } else {
        _687 = 0.0f;
        _688 = 0.0f;
        _689 = 0.0f;
      }
    } else {
      _687 = 0.0f;
      _688 = 0.0f;
      _689 = 0.0f;
    }
  } else {
    _687 = _671;
    _688 = _672;
    _689 = _673;
  }
  float _699 = exp2(log2(_687 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _700 = exp2(log2(_688 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _701 = exp2(log2(_689 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_699 * 18.6875f) + 1.0f)) * ((_699 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_700 * 18.6875f) + 1.0f)) * ((_700 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_701 * 18.6875f) + 1.0f)) * ((_701 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _262;
  return SV_Target;
}