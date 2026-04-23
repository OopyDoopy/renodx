#include "../tonemap.hlsli"

struct PostProcessBerserk_CDStruct {
  float _scanRadius;
  float _fishEyeIntensity;
  float _bloodLineIntensity;
  float _auraIntensity;
  float _centerMaskWidth;
  float _fireIntensity;
  float _sphereMaskRatio;
  float _fogIntensity;
  float _scanRadiusEnd;
  float _ringMaskRadius;
  float _ringMaskIntensity;
  float _radialBlurIntensity;
  uint _noiseTex;
  uint _noiseTex2;
  uint _distortionTex;
  uint _marbleCrackTex;
  float _sphereMaskEndRatio;
  float _sphereMaskEndNoiseIntensity;
  float _sceneColorDistortionIntensity;
  float _characterMaskIntensity;
  uint _enemyGradientTex;
  uint _enemyMaskColor;
  float _flashRatio;
  uint _paperTex;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t33, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t75, space36);

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

ConstantBuffer<PostProcessBerserk_CDStruct> BindlessParameters_PostProcessBerserk_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _17[36];
  float _37 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float4 _40 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _50 = (pow(_40.x, 0.012683313339948654f));
  float _51 = (pow(_40.y, 0.012683313339948654f));
  float _52 = (pow(_40.z, 0.012683313339948654f));
  uint2 _88 = __3__36__0__0__g_stencil.Load(int3((int)(uint(_bufferSizeAndInvSize.x * TEXCOORD.x)), (int)(uint(_bufferSizeAndInvSize.y * TEXCOORD.y)), 0));
  float _91 = TEXCOORD.x + -0.5f;
  float _92 = TEXCOORD.y + -0.5f;
  float _93 = abs(_91);
  float _94 = abs(_92);
  float _98 = min(_93, _94) / max(max(_93, _94), 9.99999993922529e-09f);
  float _99 = _98 * _98;
  float _106 = ((_99 * _98) * (((0.15931421518325806f - (_99 * 0.046496473252773285f)) * _99) + -0.32762277126312256f)) + _98;
  float _109 = select((_94 > _93), (1.5707963705062866f - _106), _106);
  float _112 = select((_91 < 0.0f), (3.1415927410125732f - _109), _109);
  float _120 = select((_92 < 0.0f), (-0.0f - _112), _112) * 0.9549295902252197f;
  float _206;
  float _446;
  float _447;
  float _448;
  float _568;
  float _569;
  float _570;
  float _591;
  float _592;
  float _593;
  float _626;
  float _627;
  float _628;
  float _642;
  float _643;
  float _644;
  float _132 = select(((uint)((_88.x & 127) + -53) < (uint)15), 0.0f, (saturate(1.0f - saturate((pow(_37.x, 0.5f)) * 6.5f)) * (1.0f / max(9.999999747378752e-05f, _exposure0.x))));
  int _133 = WaveReadLaneFirst(_materialIndex);
  int _141 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_133 < (uint)170000), _133, 0)) + 0u))]._noiseTex2);
  float _144 = (sqrt((_92 * _92) + (_91 * _91)) * 2.0f) - (_time.x * 0.699999988079071f);
  float _147 = _time.x * 0.030000001192092896f;
  float _148 = _147 + _120;
  float _149 = _147 + _144;
  float4 _168 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_141 < (uint)65000), _141, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(frac(_148), frac(_149)));
  float4 _174 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_141 < (uint)65000), _141, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(frac((_120 + 0.4180000126361847f) - _147), frac((_144 + 0.35499998927116394f) - _147)));
  float4 _180 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_141 < (uint)65000), _141, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(frac((_120 + 0.8550000190734863f) - _147), frac(_149 + 0.14800000190734863f)));
  float4 _186 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_141 < (uint)65000), _141, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(frac(_148 + 0.6510000228881836f), frac((_144 + 0.7519999742507935f) - _147)));
  float _192 = dot(float3((exp2(log2(max(0.0f, (_50 + -0.8359375f)) / (18.8515625f - (_50 * 18.6875f))) * 6.277394771575928f) * 10000.0f), (exp2(log2(max(0.0f, (_51 + -0.8359375f)) / (18.8515625f - (_51 * 18.6875f))) * 6.277394771575928f) * 10000.0f), (exp2(log2(max(0.0f, (_52 + -0.8359375f)) / (18.8515625f - (_52 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
  uint _193 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _200 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_193), 0));
    _206 = (float((uint)((uint)(_200.x & 127))) + 0.5f);
  } else {
    _206 = saturate(((_174.w + _168.w) + _180.w) + _186.w);
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_132, _192, 0.0f));
    _568 = output_color.x;
    _569 = output_color.y;
    _570 = output_color.z;
  } else {
    _568 = _132;
    _569 = _192;
    _570 = 0.0f;
  }
  if (_etcParams.y > 1.0f) {
    float _581 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _582 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _586 = saturate(1.0f - (dot(float2(_581, _582), float2(_581, _582)) * saturate(_etcParams.y + -1.0f)));
    _591 = (_586 * _568);
    _592 = (_586 * _569);
    _593 = (_586 * _570);
  } else {
    _591 = _568;
    _592 = _569;
    _593 = _570;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _626 = select((_591 <= 0.0031308000907301903f), (_591 * 12.920000076293945f), (((pow(_591, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _627 = select((_592 <= 0.0031308000907301903f), (_592 * 12.920000076293945f), (((pow(_592, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _628 = select((_593 <= 0.0031308000907301903f), (_593 * 12.920000076293945f), (((pow(_593, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _626 = _591;
    _627 = _592;
    _628 = _593;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _633 = float((uint)_193);
    if (!(_633 < _viewDir.w)) {
      if (!(_633 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _642 = _626;
        _643 = _627;
        _644 = _628;
      } else {
        _642 = 0.0f;
        _643 = 0.0f;
        _644 = 0.0f;
      }
    } else {
      _642 = 0.0f;
      _643 = 0.0f;
      _644 = 0.0f;
    }
  } else {
    _642 = _626;
    _643 = _627;
    _644 = _628;
  }
  float _654 = exp2(log2(_642 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _655 = exp2(log2(_643 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _656 = exp2(log2(_644 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_654 * 18.6875f) + 1.0f)) * ((_654 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_655 * 18.6875f) + 1.0f)) * ((_655 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_656 * 18.6875f) + 1.0f)) * ((_656 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _206;
  return SV_Target;
}

