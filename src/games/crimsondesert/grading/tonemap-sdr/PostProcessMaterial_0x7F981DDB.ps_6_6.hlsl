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

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t32, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t40, space36);

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

ConstantBuffer<PostProcessBerserk_CDStruct> BindlessParameters_PostProcessBerserk_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _38 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float4 _41 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  uint2 _53 = __3__36__0__0__g_stencil.Load(int3((int)(uint(_bufferSizeAndInvSize.x * TEXCOORD.x)), (int)(uint(_bufferSizeAndInvSize.y * TEXCOORD.y)), 0));
  float _56 = TEXCOORD.x + -0.5f;
  float _57 = TEXCOORD.y + -0.5f;
  float _58 = abs(_56);
  float _59 = abs(_57);
  float _63 = min(_58, _59) / max(max(_58, _59), 9.99999993922529e-09f);
  float _64 = _63 * _63;
  float _71 = ((_64 * _63) * (((0.15931421518325806f - (_64 * 0.046496473252773285f)) * _64) + -0.32762277126312256f)) + _63;
  float _74 = select((_59 > _58), (1.5707963705062866f - _71), _71);
  float _77 = select((_56 < 0.0f), (3.1415927410125732f - _74), _74);
  float _85 = select((_57 < 0.0f), (-0.0f - _77), _77) * 0.9549295902252197f;
  float _171;
  float _370;
  float _371;
  float _372;
  float _465;
  float _466;
  float _467;
  float _521;
  float _522;
  float _523;
  float _542;
  float _543;
  float _544;
  float _574;
  float _575;
  float _576;
  float _590;
  float _591;
  float _592;
  float _97 = select(((uint)((_53.x & 127) + -53) < (uint)15), 0.0f, (saturate(1.0f - saturate((pow(_38.x, 0.5f)) * 6.5f)) * (1.0f / max(9.999999747378752e-05f, _exposure0.x))));
  int _98 = WaveReadLaneFirst(_materialIndex);
  int _106 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_98 < (uint)170000), _98, 0)) + 0u))]._noiseTex2);
  float _109 = (sqrt((_57 * _57) + (_56 * _56)) * 2.0f) - (_time.x * 0.699999988079071f);
  float _112 = _time.x * 0.030000001192092896f;
  float _113 = _112 + _85;
  float _114 = _112 + _109;
  float4 _133 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_106 < (uint)65000), _106, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(frac(_113), frac(_114)));
  float4 _139 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_106 < (uint)65000), _106, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(frac((_85 + 0.4180000126361847f) - _112), frac((_109 + 0.35499998927116394f) - _112)));
  float4 _145 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_106 < (uint)65000), _106, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(frac((_85 + 0.8550000190734863f) - _112), frac(_114 + 0.14800000190734863f)));
  float4 _151 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_106 < (uint)65000), _106, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(frac(_113 + 0.6510000228881836f), frac((_109 + 0.7519999742507935f) - _112)));
  float _157 = dot(float3(_41.x, _41.y, _41.z), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
  uint _158 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _165 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_158), 0));
    _171 = (float((uint)((uint)(_165.x & 127))) + 0.5f);
  } else {
    _171 = saturate(((_139.w + _133.w) + _145.w) + _151.w);
  }
  bool _174 = (_localToneMappingParams.w > 0.0f);
  if (_174) {
    float3 output_color = TonemapReplacer(float3(_97, _157, 0.0f));
    _521 = output_color.x;
    _522 = output_color.y;
    _523 = output_color.z;
  } else {
    _521 = _97;
    _522 = _157;
    _523 = 0.0f;
  }
  if (_etcParams.y > 1.0f) {
    float _532 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _533 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _537 = saturate(1.0f - (dot(float2(_532, _533), float2(_532, _533)) * saturate(_etcParams.y + -1.0f)));
    _542 = (_537 * _521);
    _543 = (_537 * _522);
    _544 = (_537 * _523);
  } else {
    _542 = _521;
    _543 = _522;
    _544 = _523;
  }
  if ((_174) && ((_etcParams.z > 0.0f))) {
    _574 = select((_542 <= 0.0031308000907301903f), (_542 * 12.920000076293945f), (((pow(_542, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _575 = select((_543 <= 0.0031308000907301903f), (_543 * 12.920000076293945f), (((pow(_543, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _576 = select((_544 <= 0.0031308000907301903f), (_544 * 12.920000076293945f), (((pow(_544, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _574 = _542;
    _575 = _543;
    _576 = _544;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _581 = float((uint)_158);
    if (!(_581 < _viewDir.w)) {
      if (!(_581 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _590 = _574;
        _591 = _575;
        _592 = _576;
      } else {
        _590 = 0.0f;
        _591 = 0.0f;
        _592 = 0.0f;
      }
    } else {
      _590 = 0.0f;
      _591 = 0.0f;
      _592 = 0.0f;
    }
  } else {
    _590 = _574;
    _591 = _575;
    _592 = _576;
  }
  SV_Target.x = _590;
  SV_Target.y = _591;
  SV_Target.z = _592;
  SV_Target.w = _171;
  return SV_Target;
}