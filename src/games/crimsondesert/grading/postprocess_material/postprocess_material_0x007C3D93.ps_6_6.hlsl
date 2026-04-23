#include "../tonemap.hlsli"

struct PostProcessActionStruct {
  float _contrast;
  float3 _saturation;
  float _gaussianBlurIntensity;
  float2 _gaussianBlurPosition;
  float _gaussianBlurClampInnerRadius;
  float _gaussianBlurClampHardness;
  float2 _radialBlurPosition;
  float _radialBlurIntensity;
  float _radialBlurClampInnerRadius;
  float _radialBlurClampHardness;
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
};


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

cbuffer __3__1__0__0__PostProcessSizeConstant : register(b1, space1) {
  float4 _srcTargetSizeAndInv : packoffset(c000.x);
  float4 _destTargetSizAndInv : packoffset(c001.x);
};

cbuffer __3__1__0__0__PostProcessMaterialIndex : register(b2, space1) {
  int _materialIndex : packoffset(c000.x);
  int _passIndex : packoffset(c000.y);
};

ConstantBuffer<PostProcessActionStruct> BindlessParameters_PostProcessAction[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _19[36];
  float4 _24 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _31 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  int _32 = WaveReadLaneFirst(_materialIndex);
  int _41 = WaveReadLaneFirst(_materialIndex);
  int _50 = WaveReadLaneFirst(_materialIndex);
  bool _59 = (WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_32 < (uint)170000), _32, 0)) + 0u))]._gaussianBlurIntensity) > 0.0f);
  bool _60 = (WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_50 < (uint)170000), _50, 0)) + 0u))]._borderRatio) > 0.0f);
  float _71;
  float _72;
  float _73;
  float _74;
  float _120;
  float _121;
  float _122;
  float _214;
  float _215;
  float _216;
  float _217;
  float _218;
  float _219;
  int _220;
  float _240;
  float _241;
  float _242;
  float _366;
  float _367;
  float _368;
  float _382;
  float _628;
  float _629;
  float _630;
  float _750;
  float _751;
  float _752;
  float _773;
  float _774;
  float _775;
  float _808;
  float _809;
  float _810;
  float _824;
  float _825;
  float _826;
  if ((_59) || (_60)) {
    float4 _65 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    _71 = _65.x;
    _72 = _65.y;
    _73 = _65.z;
    _74 = _65.w;
  } else {
    _71 = 0.0f;
    _72 = 0.0f;
    _73 = 0.0f;
    _74 = 0.0f;
  }
  if (_59) {
    int _76 = WaveReadLaneFirst(_materialIndex);
    int _85 = WaveReadLaneFirst(_materialIndex);
    float _97 = (TEXCOORD.x - WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_85 < (uint)170000), _85, 0)) + 0u))]._gaussianBlurPosition.x)) * _31;
    float _98 = TEXCOORD.y - WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_85 < (uint)170000), _85, 0)) + 0u))]._gaussianBlurPosition.y);
    float _109 = saturate((1.0f - ((1.0f / max(9.999999747378752e-06f, WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_41 < (uint)170000), _41, 0)) + 0u))]._gaussianBlurClampInnerRadius))) * sqrt(dot(float2(_97, _98), float2(_97, _98))))) * (1.0f / max((1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_76 < (uint)170000), _76, 0)) + 0u))]._gaussianBlurClampHardness)), 9.999999747378752e-06f)));
    _120 = ((_109 * (_24.x - _71)) + _71);
    _121 = ((_109 * (_24.y - _72)) + _72);
    _122 = ((_109 * (_24.z - _73)) + _73);
  } else {
    _120 = _24.x;
    _121 = _24.y;
    _122 = _24.z;
  }
  int _128 = WaveReadLaneFirst(_materialIndex);
  float _136 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_128 < (uint)170000), _128, 0)) + 0u))]._radialBlurIntensity);
  if (_136 > 0.0f) {
    int _139 = WaveReadLaneFirst(_materialIndex);
    float _148 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_139 < (uint)170000), _139, 0)) + 0u))]._radialBlurPosition.x);
    float _149 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_139 < (uint)170000), _139, 0)) + 0u))]._radialBlurPosition.y);
    float _153 = (_srcTargetSizeAndInv.x * TEXCOORD.x) / _srcTargetSizeAndInv.x;
    float _154 = (_srcTargetSizeAndInv.y * TEXCOORD.y) / _srcTargetSizeAndInv.y;
    float4 _157 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_153, _154));
    float _163 = 32.0f / _136;
    _214 = _153;
    _215 = _154;
    _216 = _157.x;
    _217 = _157.y;
    _218 = _157.z;
    _219 = 1.0f;
    _220 = 0;
    while(true) {
      float _221 = _214 + (((_148 - _153) / _163) * 0.10000000149011612f);
      float _222 = _215 + (((_149 - _154) / _163) * 0.10000000149011612f);
      float4 _225 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_221, _222));
      float _229 = _219 * 0.8999999761581421f;
      float _233 = (_225.x * _229) + _216;
      float _234 = (_225.y * _229) + _217;
      float _235 = (_225.z * _229) + _218;
      if (!((_220 + 1) == 10)) {
        _214 = _221;
        _215 = _222;
        _216 = _233;
        _217 = _234;
        _218 = _235;
        _219 = (_219 * 0.9900000095367432f);
        _220 = (_220 + 1);
        continue;
      }
      float _169 = _233 * 0.10000000149011612f;
      float _170 = _234 * 0.10000000149011612f;
      float _171 = _235 * 0.10000000149011612f;
      int _172 = WaveReadLaneFirst(_materialIndex);
      int _181 = WaveReadLaneFirst(_materialIndex);
      float _191 = (TEXCOORD.x - _148) * _31;
      float _192 = TEXCOORD.y - _149;
      float _203 = saturate((1.0f - ((1.0f / max(9.999999747378752e-06f, WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_172 < (uint)170000), _172, 0)) + 0u))]._radialBlurClampInnerRadius))) * sqrt(dot(float2(_191, _192), float2(_191, _192))))) * (1.0f / max((1.0f - WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_181 < (uint)170000), _181, 0)) + 0u))]._radialBlurClampHardness)), 9.999999747378752e-06f)));
      _240 = ((_203 * (_120 - _169)) + _169);
      _241 = ((_203 * (_121 - _170)) + _170);
      _242 = ((_203 * (_122 - _171)) + _171);
      break;
    }
  } else {
    _240 = _120;
    _241 = _121;
    _242 = _122;
  }
  int _243 = WaveReadLaneFirst(_materialIndex);
  float _253 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_243 < (uint)170000), _243, 0)) + 0u))]._saturation.x);
  float _254 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_243 < (uint)170000), _243, 0)) + 0u))]._saturation.y);
  float _255 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_243 < (uint)170000), _243, 0)) + 0u))]._saturation.z);
  float _259 = (1.0f - _253) * 0.3086000084877014f;
  float _261 = (1.0f - _254) * 0.6093999743461609f;
  float _263 = (1.0f - _255) * 0.0820000022649765f;
  float _268 = _259 * _240;
  int _285 = WaveReadLaneFirst(_materialIndex);
  float _294 = max(WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_285 < (uint)170000), _285, 0)) + 0u))]._contrast), 0.0f);
  float _301 = max(0.0f, ((_294 * (mad(_242, _263, mad(_241, _261, ((_259 + _253) * _240))) + -0.5f)) + 0.5f));
  float _302 = max(0.0f, ((_294 * (mad(_242, _263, mad(_241, (_261 + _254), _268)) + -0.5f)) + 0.5f));
  float _303 = max(0.0f, ((_294 * (mad(_242, (_263 + _255), mad(_241, _261, _268)) + -0.5f)) + 0.5f));
  if (_60) {
    int _305 = WaveReadLaneFirst(_materialIndex);
    int _313 = WaveReadLaneFirst(BindlessParameters_PostProcessAction[((int)((uint)(select(((uint)_305 < (uint)170000), _305, 0)) + 0u))]._borderColor);
    float _316 = float((uint)((uint)(((uint)((uint)(_313)) >> 16) & 255)));
    float _319 = float((uint)((uint)(((uint)((uint)(_313)) >> 8) & 255)));
    float _321 = float((uint)((uint)(_313 & 255)));
    float _352 = 1.0f / max(0.0010000000474974513f, _exposure0.x);
    _366 = ((((_352 * select(((_316 * 0.003921568859368563f) < 0.040449999272823334f), (_316 * 0.0003035269910469651f), exp2(log2((_316 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) - _301) * _74) + _301);
    _367 = ((((_352 * select(((_319 * 0.003921568859368563f) < 0.040449999272823334f), (_319 * 0.0003035269910469651f), exp2(log2((_319 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) - _302) * _74) + _302);
    _368 = ((((_352 * select(((_321 * 0.003921568859368563f) < 0.040449999272823334f), (_321 * 0.0003035269910469651f), exp2(log2((_321 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))) - _303) * _74) + _303);
  } else {
    _366 = _301;
    _367 = _302;
    _368 = _303;
  }
  uint _369 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _376 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_369), 0));
    _382 = (float((uint)((uint)(_376.x & 127))) + 0.5f);
  } else {
    _382 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_366, _367, _368));
    _750 = output_color.x;
    _751 = output_color.y;
    _752 = output_color.z;
  } else {
    _750 = _366;
    _751 = _367;
    _752 = _368;
  }
  if (_etcParams.y > 1.0f) {
    float _763 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _764 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _768 = saturate(1.0f - (dot(float2(_763, _764), float2(_763, _764)) * saturate(_etcParams.y + -1.0f)));
    _773 = (_768 * _750);
    _774 = (_768 * _751);
    _775 = (_768 * _752);
  } else {
    _773 = _750;
    _774 = _751;
    _775 = _752;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _808 = select((_773 <= 0.0031308000907301903f), (_773 * 12.920000076293945f), (((pow(_773, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _809 = select((_774 <= 0.0031308000907301903f), (_774 * 12.920000076293945f), (((pow(_774, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _810 = select((_775 <= 0.0031308000907301903f), (_775 * 12.920000076293945f), (((pow(_775, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _808 = _773;
    _809 = _774;
    _810 = _775;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _815 = float((uint)_369);
    if (!(_815 < _viewDir.w)) {
      if (!(_815 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _824 = _808;
        _825 = _809;
        _826 = _810;
      } else {
        _824 = 0.0f;
        _825 = 0.0f;
        _826 = 0.0f;
      }
    } else {
      _824 = 0.0f;
      _825 = 0.0f;
      _826 = 0.0f;
    }
  } else {
    _824 = _808;
    _825 = _809;
    _826 = _810;
  }
  SV_Target.x = _824;
  SV_Target.y = _825;
  SV_Target.z = _826;
  SV_Target.w = _382;
  return SV_Target;
}

