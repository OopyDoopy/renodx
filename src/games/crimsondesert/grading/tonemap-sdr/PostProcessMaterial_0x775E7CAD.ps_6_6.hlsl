struct PostProcessDamageTestStruct {
  uint _bloodTexture;
  float _bloodRatio;
  uint _dirtTexture;
  uint _dirtMaskTexture;
  float _dirtRatio1;
  float _dirtRatio2;
  float _dirtRatio3;
  uint _waterNormalTexture;
  uint _waterMaskTexture;
  float _waterRatio1;
  float _waterRatio2;
  float _waterRatio3;
  float _isDead;
  float3 _mulColor;
  float _vignettFalloff;
  float _maxPower;
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

ConstantBuffer<PostProcessDamageTestStruct> BindlessParameters_PostProcessDamageTest[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _51 = _destTargetSizAndInv.y * (1.0f - TEXCOORD.y);
  float _52 = (_destTargetSizAndInv.x * TEXCOORD.x) / _srcTargetSizeAndInv.x;
  float _53 = _51 / _srcTargetSizeAndInv.y;
  float _54 = _51 / _srcTargetSizeAndInv.x;
  float _55 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  float _56 = 0.5f / _55;
  float _57 = _52 + -0.5f;
  float _58 = _54 - _56;
  float _59 = dot(float2(_57, _58), float2(_57, _58));
  float _60 = sqrt(_59);
  int _61 = WaveReadLaneFirst(_materialIndex);
  float _69 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_61 < (uint)170000), _61, 0)) + 0u))]._maxPower);
  bool _70 = (_69 > 0.0f);
  float _78;
  float _116;
  float _117;
  float _327;
  float _532;
  float _533;
  float _534;
  float _627;
  float _628;
  float _629;
  float _683;
  float _684;
  float _685;
  float _704;
  float _705;
  float _706;
  float _736;
  float _737;
  float _738;
  float _752;
  float _753;
  float _754;
  if (_70) {
    _78 = sqrt(dot(float2(0.5f, _56), float2(0.5f, _56)));
  } else {
    if (!(_55 < 1.0f)) {
      _78 = _56;
    } else {
      _78 = 0.5f;
    }
  }
  if (_70) {
    float _80 = rsqrt(_59);
    float _82 = tan(_69 * _60);
    float _90 = tan(_78 * _69);
    _116 = (((((_78 * _57) * _80) * _82) / _90) + 0.5f);
    _117 = (((((_78 * _58) * _80) * _82) / _90) + _56);
  } else {
    if (_69 < 0.0f) {
      float _98 = rsqrt(_59);
      float _101 = atan((_69 * _60) * -10.0f);
      float _110 = atan((_69 * -10.0f) * _78);
      _116 = (((((_78 * _57) * _98) * _101) / _110) + 0.5f);
      _117 = (((((_78 * _58) * _98) * _101) / _110) + _56);
    } else {
      _116 = _52;
      _117 = _54;
    }
  }
  float _119 = 1.0f - (_117 * _55);
  float4 _124 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(abs(_116), abs(_119)));
  int _128 = WaveReadLaneFirst(_materialIndex);
  float _136 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_128 < (uint)170000), _128, 0)) + 0u))]._isDead);
  float _137 = dot(float3(_124.x, _124.y, _124.z), float3(0.26269999146461487f, 0.6779999732971191f, 0.059300001710653305f));
  int _147 = WaveReadLaneFirst(_materialIndex);
  int _155 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_147 < (uint)170000), _147, 0)) + 0u))]._bloodTexture);
  float4 _162 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_155 < (uint)65000), _155, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(_116, _119));
  int _167 = WaveReadLaneFirst(_materialIndex);
  int _175 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_167 < (uint)170000), _167, 0)) + 0u))]._dirtTexture);
  float4 _182 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_175 < (uint)65000), _175, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(_116, _119));
  int _187 = WaveReadLaneFirst(_materialIndex);
  int _195 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_187 < (uint)170000), _187, 0)) + 0u))]._dirtMaskTexture);
  float4 _202 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_195 < (uint)65000), _195, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(_116, _119));
  float _216 = (dot(float3(_viewDir.x, _viewDir.y, _viewDir.z), float3(_sunDirection.x, _sunDirection.y, _sunDirection.z)) * 25.0f) + 25.0f;
  int _223 = WaveReadLaneFirst(_materialIndex);
  float _234 = exp2(log2((((_52 * 15.0f) * (1.0f - _52)) * _53) * (1.0f - _53)) * WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_223 < (uint)170000), _223, 0)) + 0u))]._vignettFalloff));
  float _235 = _234 * (lerp(_124.x, _137, _136));
  float _236 = _234 * (lerp(_124.y, _137, _136));
  float _237 = _234 * (lerp(_124.z, _137, _136));
  int _238 = WaveReadLaneFirst(_materialIndex);
  int _247 = WaveReadLaneFirst(_materialIndex);
  int _256 = WaveReadLaneFirst(_materialIndex);
  float _266 = dot(float3(_202.x, _202.y, _202.z), float3(WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_238 < (uint)170000), _238, 0)) + 0u))]._dirtRatio1), WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_247 < (uint)170000), _247, 0)) + 0u))]._dirtRatio2), WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_256 < (uint)170000), _256, 0)) + 0u))]._dirtRatio3))) * _182.w;
  float _273 = (_266 * (_182.x - _235)) + _235;
  float _274 = (_266 * (_182.y - _236)) + _236;
  float _275 = (_266 * (_182.z - _237)) + _237;
  int _276 = WaveReadLaneFirst(_materialIndex);
  float _285 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_276 < (uint)170000), _276, 0)) + 0u))]._bloodRatio) * _162.w;
  int _298 = WaveReadLaneFirst(_materialIndex);
  float _311 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_298 < (uint)170000), _298, 0)) + 0u))]._mulColor.x) * ((_285 * ((_216 * _162.x) - _273)) + _273);
  float _312 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_298 < (uint)170000), _298, 0)) + 0u))]._mulColor.y) * ((_285 * ((_216 * _162.y) - _274)) + _274);
  float _313 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_298 < (uint)170000), _298, 0)) + 0u))]._mulColor.z) * ((_285 * ((_216 * _162.z) - _275)) + _275);
  uint _314 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _321 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_314), 0));
    _327 = (float((uint)((uint)(_321.x & 127))) + 0.5f);
  } else {
    _327 = _postProcessParams.x;
  }
  bool _330 = (_localToneMappingParams.w > 0.0f);
  if (_330) {
    float3 output_color = TonemapReplacer(float3(_311, _312, _313));
    _683 = output_color.x;
    _684 = output_color.y;
    _685 = output_color.z;
  } else {
    _683 = _311;
    _684 = _312;
    _685 = _313;
  }
  if (_etcParams.y > 1.0f) {
    float _694 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _695 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _699 = saturate(1.0f - (dot(float2(_694, _695), float2(_694, _695)) * saturate(_etcParams.y + -1.0f)));
    _704 = (_699 * _683);
    _705 = (_699 * _684);
    _706 = (_699 * _685);
  } else {
    _704 = _683;
    _705 = _684;
    _706 = _685;
  }
  if ((_330) && ((_etcParams.z > 0.0f))) {
    _736 = select((_704 <= 0.0031308000907301903f), (_704 * 12.920000076293945f), (((pow(_704, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _737 = select((_705 <= 0.0031308000907301903f), (_705 * 12.920000076293945f), (((pow(_705, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _738 = select((_706 <= 0.0031308000907301903f), (_706 * 12.920000076293945f), (((pow(_706, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _736 = _704;
    _737 = _705;
    _738 = _706;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _743 = float((uint)_314);
    if (!(_743 < _viewDir.w)) {
      if (!(_743 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _752 = _736;
        _753 = _737;
        _754 = _738;
      } else {
        _752 = 0.0f;
        _753 = 0.0f;
        _754 = 0.0f;
      }
    } else {
      _752 = 0.0f;
      _753 = 0.0f;
      _754 = 0.0f;
    }
  } else {
    _752 = _736;
    _753 = _737;
    _754 = _738;
  }
  SV_Target.x = _752;
  SV_Target.y = _753;
  SV_Target.z = _754;
  SV_Target.w = _327;
  return SV_Target;
}