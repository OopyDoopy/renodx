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
  float _363;
  float _568;
  float _569;
  float _570;
  float _663;
  float _664;
  float _665;
  float _719;
  float _720;
  float _721;
  float _740;
  float _741;
  float _742;
  float _772;
  float _773;
  float _774;
  float _788;
  float _789;
  float _790;
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
  float _134 = (pow(_124.x, 0.012683313339948654f));
  float _135 = (pow(_124.y, 0.012683313339948654f));
  float _136 = (pow(_124.z, 0.012683313339948654f));
  float _161 = exp2(log2(max(0.0f, (_134 + -0.8359375f)) / (18.8515625f - (_134 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _162 = exp2(log2(max(0.0f, (_135 + -0.8359375f)) / (18.8515625f - (_135 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _163 = exp2(log2(max(0.0f, (_136 + -0.8359375f)) / (18.8515625f - (_136 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  int _164 = WaveReadLaneFirst(_materialIndex);
  float _172 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_164 < (uint)170000), _164, 0)) + 0u))]._isDead);
  float _173 = dot(float3(_161, _162, _163), float3(0.26269999146461487f, 0.6779999732971191f, 0.059300001710653305f));
  int _183 = WaveReadLaneFirst(_materialIndex);
  int _191 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_183 < (uint)170000), _183, 0)) + 0u))]._bloodTexture);
  float4 _198 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_191 < (uint)65000), _191, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(_116, _119));
  int _203 = WaveReadLaneFirst(_materialIndex);
  int _211 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_203 < (uint)170000), _203, 0)) + 0u))]._dirtTexture);
  float4 _218 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_211 < (uint)65000), _211, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(_116, _119));
  int _223 = WaveReadLaneFirst(_materialIndex);
  int _231 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_223 < (uint)170000), _223, 0)) + 0u))]._dirtMaskTexture);
  float4 _238 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_231 < (uint)65000), _231, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(_116, _119));
  float _252 = (dot(float3(_viewDir.x, _viewDir.y, _viewDir.z), float3(_sunDirection.x, _sunDirection.y, _sunDirection.z)) * 25.0f) + 25.0f;
  int _259 = WaveReadLaneFirst(_materialIndex);
  float _270 = exp2(log2((((_52 * 15.0f) * (1.0f - _52)) * _53) * (1.0f - _53)) * WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_259 < (uint)170000), _259, 0)) + 0u))]._vignettFalloff));
  float _271 = _270 * (lerp(_161, _173, _172));
  float _272 = _270 * (lerp(_162, _173, _172));
  float _273 = _270 * (lerp(_163, _173, _172));
  int _274 = WaveReadLaneFirst(_materialIndex);
  int _283 = WaveReadLaneFirst(_materialIndex);
  int _292 = WaveReadLaneFirst(_materialIndex);
  float _302 = dot(float3(_238.x, _238.y, _238.z), float3(WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_274 < (uint)170000), _274, 0)) + 0u))]._dirtRatio1), WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_283 < (uint)170000), _283, 0)) + 0u))]._dirtRatio2), WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_292 < (uint)170000), _292, 0)) + 0u))]._dirtRatio3))) * _218.w;
  float _309 = (_302 * (_218.x - _271)) + _271;
  float _310 = (_302 * (_218.y - _272)) + _272;
  float _311 = (_302 * (_218.z - _273)) + _273;
  int _312 = WaveReadLaneFirst(_materialIndex);
  float _321 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_312 < (uint)170000), _312, 0)) + 0u))]._bloodRatio) * _198.w;
  int _334 = WaveReadLaneFirst(_materialIndex);
  float _347 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_334 < (uint)170000), _334, 0)) + 0u))]._mulColor.x) * ((_321 * ((_252 * _198.x) - _309)) + _309);
  float _348 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_334 < (uint)170000), _334, 0)) + 0u))]._mulColor.y) * ((_321 * ((_252 * _198.y) - _310)) + _310);
  float _349 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_334 < (uint)170000), _334, 0)) + 0u))]._mulColor.z) * ((_321 * ((_252 * _198.z) - _311)) + _311);
  uint _350 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _357 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_350), 0));
    _363 = (float((uint)((uint)(_357.x & 127))) + 0.5f);
  } else {
    _363 = _postProcessParams.x;
  }
  bool _366 = (_localToneMappingParams.w > 0.0f);
  if (_366) {
    float3 output_color = TonemapReplacer(float3(_347, _348, _349));
    _719 = output_color.x;
    _720 = output_color.y;
    _721 = output_color.z;
  } else {
    _719 = _347;
    _720 = _348;
    _721 = _349;
  }
  if (_etcParams.y > 1.0f) {
    float _730 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _731 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _735 = saturate(1.0f - (dot(float2(_730, _731), float2(_730, _731)) * saturate(_etcParams.y + -1.0f)));
    _740 = (_735 * _719);
    _741 = (_735 * _720);
    _742 = (_735 * _721);
  } else {
    _740 = _719;
    _741 = _720;
    _742 = _721;
  }
  if ((_366) && ((_etcParams.z > 0.0f))) {
    _772 = select((_740 <= 0.0031308000907301903f), (_740 * 12.920000076293945f), (((pow(_740, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _773 = select((_741 <= 0.0031308000907301903f), (_741 * 12.920000076293945f), (((pow(_741, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _774 = select((_742 <= 0.0031308000907301903f), (_742 * 12.920000076293945f), (((pow(_742, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _772 = _740;
    _773 = _741;
    _774 = _742;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _779 = float((uint)_350);
    if (!(_779 < _viewDir.w)) {
      if (!(_779 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _788 = _772;
        _789 = _773;
        _790 = _774;
      } else {
        _788 = 0.0f;
        _789 = 0.0f;
        _790 = 0.0f;
      }
    } else {
      _788 = 0.0f;
      _789 = 0.0f;
      _790 = 0.0f;
    }
  } else {
    _788 = _772;
    _789 = _773;
    _790 = _774;
  }
  float _800 = exp2(log2(_788 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _801 = exp2(log2(_789 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _802 = exp2(log2(_790 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_800 * 18.6875f) + 1.0f)) * ((_800 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_801 * 18.6875f) + 1.0f)) * ((_801 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_802 * 18.6875f) + 1.0f)) * ((_802 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _363;
  return SV_Target;
}