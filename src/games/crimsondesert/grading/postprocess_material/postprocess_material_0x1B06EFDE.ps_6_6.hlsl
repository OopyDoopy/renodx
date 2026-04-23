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
  uint2 _52 = __3__36__0__0__g_stencil.Load(int3((int)(uint(_bufferSizeAndInvSize.x * TEXCOORD.x)), (int)(uint(_bufferSizeAndInvSize.y * TEXCOORD.y)), 0));
  float _55 = TEXCOORD.x + -0.5f;
  float _56 = TEXCOORD.y + -0.5f;
  float _57 = abs(_55);
  float _58 = abs(_56);
  float _62 = min(_57, _58) / max(max(_57, _58), 9.99999993922529e-09f);
  float _63 = _62 * _62;
  float _70 = ((_63 * _62) * (((0.15931421518325806f - (_63 * 0.046496473252773285f)) * _63) + -0.32762277126312256f)) + _62;
  float _73 = select((_58 > _57), (1.5707963705062866f - _70), _70);
  float _76 = select((_55 < 0.0f), (3.1415927410125732f - _73), _73);
  float _84 = select((_56 < 0.0f), (-0.0f - _76), _76) * 0.9549295902252197f;
  float _170;
  float _410;
  float _411;
  float _412;
  float _532;
  float _533;
  float _534;
  float _555;
  float _556;
  float _557;
  float _590;
  float _591;
  float _592;
  float _606;
  float _607;
  float _608;
  float _96 = select(((uint)((_52.x & 127) + -53) < (uint)15), 0.0f, (saturate(1.0f - saturate((pow(_37.x, 0.5f)) * 6.5f)) * (1.0f / max(9.999999747378752e-05f, _exposure0.x))));
  int _97 = WaveReadLaneFirst(_materialIndex);
  int _105 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_97 < (uint)170000), _97, 0)) + 0u))]._noiseTex2);
  float _108 = (sqrt((_56 * _56) + (_55 * _55)) * 2.0f) - (_time.x * 0.699999988079071f);
  float _111 = _time.x * 0.030000001192092896f;
  float _112 = _111 + _84;
  float _113 = _111 + _108;
  float4 _132 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_105 < (uint)65000), _105, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(frac(_112), frac(_113)));
  float4 _138 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_105 < (uint)65000), _105, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(frac((_84 + 0.4180000126361847f) - _111), frac((_108 + 0.35499998927116394f) - _111)));
  float4 _144 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_105 < (uint)65000), _105, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(frac((_84 + 0.8550000190734863f) - _111), frac(_113 + 0.14800000190734863f)));
  float4 _150 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_105 < (uint)65000), _105, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(frac(_112 + 0.6510000228881836f), frac((_108 + 0.7519999742507935f) - _111)));
  float _156 = dot(float3(_40.x, _40.y, _40.z), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
  uint _157 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _164 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_157), 0));
    _170 = (float((uint)((uint)(_164.x & 127))) + 0.5f);
  } else {
    _170 = saturate(((_138.w + _132.w) + _144.w) + _150.w);
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_96, _156, 0.0f));
    _532 = output_color.x;
    _533 = output_color.y;
    _534 = output_color.z;
  } else {
    _532 = _96;
    _533 = _156;
    _534 = 0.0f;
  }
  if (_etcParams.y > 1.0f) {
    float _545 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _546 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _550 = saturate(1.0f - (dot(float2(_545, _546), float2(_545, _546)) * saturate(_etcParams.y + -1.0f)));
    _555 = (_550 * _532);
    _556 = (_550 * _533);
    _557 = (_550 * _534);
  } else {
    _555 = _532;
    _556 = _533;
    _557 = _534;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _590 = select((_555 <= 0.0031308000907301903f), (_555 * 12.920000076293945f), (((pow(_555, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _591 = select((_556 <= 0.0031308000907301903f), (_556 * 12.920000076293945f), (((pow(_556, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _592 = select((_557 <= 0.0031308000907301903f), (_557 * 12.920000076293945f), (((pow(_557, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _590 = _555;
    _591 = _556;
    _592 = _557;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _597 = float((uint)_157);
    if (!(_597 < _viewDir.w)) {
      if (!(_597 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _606 = _590;
        _607 = _591;
        _608 = _592;
      } else {
        _606 = 0.0f;
        _607 = 0.0f;
        _608 = 0.0f;
      }
    } else {
      _606 = 0.0f;
      _607 = 0.0f;
      _608 = 0.0f;
    }
  } else {
    _606 = _590;
    _607 = _591;
    _608 = _592;
  }
  SV_Target.x = _606;
  SV_Target.y = _607;
  SV_Target.z = _608;
  SV_Target.w = _170;
  return SV_Target;
}

