#include "../tonemap.hlsli"

struct PostProcessWeatherBlendStruct {
  float _blendRatio;
  float _enableBlend;
  uint _noiseTex;
  uint _berserkColor;
  uint _berserkEndColor;
  float _borderRatio;
  float _borderWidth;
  float _borderSmoothness;
  float _borderEdgeNoiseRatio;
  float2 _borderEdgeNoiseOffset;
  float2 _borderEdgeNoiseTile;
  uint _borderColor;
  uint _borderEdgeNoiseTexture;
  float _borderFlickerSpeed;
  float _borderFlickerIntensity;
  float2 _borderFlickerOpacityMinMax;
  float _contrast;
  float3 _saturation;
  float _chromaticAberrationRatio;
  float _chromaticAberrationShiftValue;
  float2 _chromaticAberrationShiftPosition;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t44, space36);

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

ConstantBuffer<PostProcessWeatherBlendStruct> BindlessParameters_PostProcessWeatherBlend[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _18[36];
  float4 _41 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
  int _45 = WaveReadLaneFirst(_materialIndex);
  float _53 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_45 < (uint)170000), _45, 0)) + 0u))]._blendRatio);
  int _54 = WaveReadLaneFirst(_materialIndex);
  float _342;
  float _343;
  float _344;
  float _358;
  float _604;
  float _605;
  float _606;
  float _726;
  float _727;
  float _728;
  float _749;
  float _750;
  float _751;
  float _784;
  float _785;
  float _786;
  float _800;
  float _801;
  float _802;
  if (((_53 >= 0.009999999776482582f)) && ((WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_54 < (uint)170000), _54, 0)) + 0u))]._enableBlend) > 0.009999999776482582f))) {
    int _73 = WaveReadLaneFirst(_materialIndex);
    int _81 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_73 < (uint)170000), _73, 0)) + 0u))]._noiseTex);
    float4 _88 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_81 < (uint)65000), _81, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, ((_time.x * 0.20000000298023224f) + TEXCOORD.y)));
    float4 _95 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    float _106 = ((_95.x - _41.x) * _95.w) + _41.x;
    float _107 = ((_95.y - _41.y) * _95.w) + _41.y;
    float _108 = ((_95.z - _41.z) * _95.w) + _41.z;
    float _109 = TEXCOORD.x + -0.5f;
    float _110 = TEXCOORD.y + -0.5f;
    float _112 = atan(_110 / _109);
    bool _115 = (_109 < 0.0f);
    bool _116 = (_109 == 0.0f);
    bool _117 = (_110 >= 0.0f);
    bool _118 = (_110 < 0.0f);
    float _127 = select(((_116) && (_117)), 0.5f, select(((_116) && (_118)), -0.5f, (select(((_115) && (_118)), (_112 + -3.1415927410125732f), select(((_115) && (_117)), (_112 + 3.1415927410125732f), _112)) * 0.31830987334251404f)));
    float _131 = sqrt((_110 * _110) + (_109 * _109));
    int _146 = WaveReadLaneFirst(_materialIndex);
    int _154 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_146 < (uint)170000), _146, 0)) + 0u))]._noiseTex);
    float4 _161 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_154 < (uint)65000), _154, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_time.x * -0.20000000298023224f) - ((_88.z + -0.5f) * 0.5f)) + (_127 * 15.0f)), (((_131 * 2.0f) - ((_88.w + -0.5f) * 0.5f)) - (_time.x * 1.5f))));
    float _166 = (1.75f - saturate(_53 * 1.4285714626312256f)) * 0.5f;
    float _169 = max((abs(_109) - _166), 0.0f);
    float _170 = max((abs(_110) - _166), 0.0f);
    int _189 = WaveReadLaneFirst(_materialIndex);
    int _197 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_189 < (uint)170000), _189, 0)) + 0u))]._borderEdgeNoiseTexture);
    float4 _204 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_197 < (uint)65000), _197, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_127 * 9.0f) + (_88.x * 0.05000000074505806f)) - (_161.x * 0.10000000149011612f)), ((_131 + (_88.y * 0.05000000074505806f)) - ((_time.x + _161.x) * 0.10000000149011612f))));
    int _206 = WaveReadLaneFirst(_materialIndex);
    int _214 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_206 < (uint)170000), _206, 0)) + 0u))]._berserkColor);
    float _217 = float((uint)((uint)(((uint)((uint)(_214)) >> 16) & 255)));
    float _220 = float((uint)((uint)(((uint)((uint)(_214)) >> 8) & 255)));
    float _222 = float((uint)((uint)(_214 & 255)));
    float _252 = max(0.0010000000474974513f, _exposure0.x);
    float _258 = ((_204.y * _204.y) * saturate(sqrt((_170 * _170) + (_169 * _169)) * 6.666666507720947f)) * _204.y;
    float _265 = (((select(((_217 * 0.003921568859368563f) < 0.040449999272823334f), (_217 * 0.0003035269910469651f), exp2(log2((_217 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _252) - _106) * _258) + _106;
    float _266 = (((select(((_220 * 0.003921568859368563f) < 0.040449999272823334f), (_220 * 0.0003035269910469651f), exp2(log2((_220 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _252) - _107) * _258) + _107;
    float _267 = (((select(((_222 * 0.003921568859368563f) < 0.040449999272823334f), (_222 * 0.0003035269910469651f), exp2(log2((_222 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _252) - _108) * _258) + _108;
    int _268 = WaveReadLaneFirst(_materialIndex);
    int _276 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_268 < (uint)170000), _268, 0)) + 0u))]._berserkEndColor);
    float _279 = float((uint)((uint)(((uint)((uint)(_276)) >> 16) & 255)));
    float _282 = float((uint)((uint)(((uint)((uint)(_276)) >> 8) & 255)));
    float _284 = float((uint)((uint)(_276 & 255)));
    float _314 = max(0.0010000000474974513f, _exposure0.x);
    float _319 = select((_53 > 0.699999988079071f), 1.0f, 0.0f);
    float _326 = (((select(((_279 * 0.003921568859368563f) < 0.040449999272823334f), (_279 * 0.0003035269910469651f), exp2(log2((_279 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _314) - _265) * _319) + _265;
    float _327 = (((select(((_282 * 0.003921568859368563f) < 0.040449999272823334f), (_282 * 0.0003035269910469651f), exp2(log2((_282 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _314) - _266) * _319) + _266;
    float _328 = (((select(((_284 * 0.003921568859368563f) < 0.040449999272823334f), (_284 * 0.0003035269910469651f), exp2(log2((_284 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _314) - _267) * _319) + _267;
    float _331 = saturate((_53 + -0.800000011920929f) * 5.0f);
    _342 = (lerp(_326, _41.x, _331));
    _343 = (lerp(_327, _41.y, _331));
    _344 = (lerp(_328, _41.z, _331));
  } else {
    _342 = _41.x;
    _343 = _41.y;
    _344 = _41.z;
  }
  uint _345 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _352 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_345), 0));
    _358 = (float((uint)((uint)(_352.x & 127))) + 0.5f);
  } else {
    _358 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_342, _343, _344));
    _726 = output_color.x;
    _727 = output_color.y;
    _728 = output_color.z;
  } else {
    _726 = _342;
    _727 = _343;
    _728 = _344;
  }
  if (_etcParams.y > 1.0f) {
    float _739 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _740 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _744 = saturate(1.0f - (dot(float2(_739, _740), float2(_739, _740)) * saturate(_etcParams.y + -1.0f)));
    _749 = (_744 * _726);
    _750 = (_744 * _727);
    _751 = (_744 * _728);
  } else {
    _749 = _726;
    _750 = _727;
    _751 = _728;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _784 = select((_749 <= 0.0031308000907301903f), (_749 * 12.920000076293945f), (((pow(_749, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _785 = select((_750 <= 0.0031308000907301903f), (_750 * 12.920000076293945f), (((pow(_750, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _786 = select((_751 <= 0.0031308000907301903f), (_751 * 12.920000076293945f), (((pow(_751, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _784 = _749;
    _785 = _750;
    _786 = _751;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _791 = float((uint)_345);
    if (!(_791 < _viewDir.w)) {
      if (!(_791 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _800 = _784;
        _801 = _785;
        _802 = _786;
      } else {
        _800 = 0.0f;
        _801 = 0.0f;
        _802 = 0.0f;
      }
    } else {
      _800 = 0.0f;
      _801 = 0.0f;
      _802 = 0.0f;
    }
  } else {
    _800 = _784;
    _801 = _785;
    _802 = _786;
  }
  SV_Target.x = _800;
  SV_Target.y = _801;
  SV_Target.z = _802;
  SV_Target.w = _358;
  return SV_Target;
}

