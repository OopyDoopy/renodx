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
  float _51 = (pow(_41.x, 0.012683313339948654f));
  float _52 = (pow(_41.y, 0.012683313339948654f));
  float _53 = (pow(_41.z, 0.012683313339948654f));
  uint2 _89 = __3__36__0__0__g_stencil.Load(int3((int)(uint(_bufferSizeAndInvSize.x * TEXCOORD.x)), (int)(uint(_bufferSizeAndInvSize.y * TEXCOORD.y)), 0));
  float _92 = TEXCOORD.x + -0.5f;
  float _93 = TEXCOORD.y + -0.5f;
  float _94 = abs(_92);
  float _95 = abs(_93);
  float _99 = min(_94, _95) / max(max(_94, _95), 9.99999993922529e-09f);
  float _100 = _99 * _99;
  float _107 = ((_100 * _99) * (((0.15931421518325806f - (_100 * 0.046496473252773285f)) * _100) + -0.32762277126312256f)) + _99;
  float _110 = select((_95 > _94), (1.5707963705062866f - _107), _107);
  float _113 = select((_92 < 0.0f), (3.1415927410125732f - _110), _110);
  float _121 = select((_93 < 0.0f), (-0.0f - _113), _113) * 0.9549295902252197f;
  float _207;
  float _406;
  float _407;
  float _408;
  float _501;
  float _502;
  float _503;
  float _557;
  float _558;
  float _559;
  float _578;
  float _579;
  float _580;
  float _610;
  float _611;
  float _612;
  float _626;
  float _627;
  float _628;
  float _133 = select(((uint)((_89.x & 127) + -53) < (uint)15), 0.0f, (saturate(1.0f - saturate((pow(_38.x, 0.5f)) * 6.5f)) * (1.0f / max(9.999999747378752e-05f, _exposure0.x))));
  int _134 = WaveReadLaneFirst(_materialIndex);
  int _142 = WaveReadLaneFirst(BindlessParameters_PostProcessBerserk_CD[((int)((uint)(select(((uint)_134 < (uint)170000), _134, 0)) + 0u))]._noiseTex2);
  float _145 = (sqrt((_93 * _93) + (_92 * _92)) * 2.0f) - (_time.x * 0.699999988079071f);
  float _148 = _time.x * 0.030000001192092896f;
  float _149 = _148 + _121;
  float _150 = _148 + _145;
  float4 _169 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_142 < (uint)65000), _142, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(frac(_149), frac(_150)));
  float4 _175 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_142 < (uint)65000), _142, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(frac((_121 + 0.4180000126361847f) - _148), frac((_145 + 0.35499998927116394f) - _148)));
  float4 _181 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_142 < (uint)65000), _142, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(frac((_121 + 0.8550000190734863f) - _148), frac(_150 + 0.14800000190734863f)));
  float4 _187 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_142 < (uint)65000), _142, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(frac(_149 + 0.6510000228881836f), frac((_145 + 0.7519999742507935f) - _148)));
  float _193 = dot(float3((exp2(log2(max(0.0f, (_51 + -0.8359375f)) / (18.8515625f - (_51 * 18.6875f))) * 6.277394771575928f) * 10000.0f), (exp2(log2(max(0.0f, (_52 + -0.8359375f)) / (18.8515625f - (_52 * 18.6875f))) * 6.277394771575928f) * 10000.0f), (exp2(log2(max(0.0f, (_53 + -0.8359375f)) / (18.8515625f - (_53 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
  uint _194 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _201 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_194), 0));
    _207 = (float((uint)((uint)(_201.x & 127))) + 0.5f);
  } else {
    _207 = saturate(((_175.w + _169.w) + _181.w) + _187.w);
  }
  bool _210 = (_localToneMappingParams.w > 0.0f);
  if (_210) {
    float3 output_color = TonemapReplacer(float3(_133, _193, 0.0f));
    _557 = output_color.x;
    _558 = output_color.y;
    _559 = output_color.z;
  } else {
    _557 = _133;
    _558 = _193;
    _559 = 0.0f;
  }
  if (_etcParams.y > 1.0f) {
    float _568 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _569 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _573 = saturate(1.0f - (dot(float2(_568, _569), float2(_568, _569)) * saturate(_etcParams.y + -1.0f)));
    _578 = (_573 * _557);
    _579 = (_573 * _558);
    _580 = (_573 * _559);
  } else {
    _578 = _557;
    _579 = _558;
    _580 = _559;
  }
  if ((_210) && ((_etcParams.z > 0.0f))) {
    _610 = select((_578 <= 0.0031308000907301903f), (_578 * 12.920000076293945f), (((pow(_578, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _611 = select((_579 <= 0.0031308000907301903f), (_579 * 12.920000076293945f), (((pow(_579, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _612 = select((_580 <= 0.0031308000907301903f), (_580 * 12.920000076293945f), (((pow(_580, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _610 = _578;
    _611 = _579;
    _612 = _580;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _617 = float((uint)_194);
    if (!(_617 < _viewDir.w)) {
      if (!(_617 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _626 = _610;
        _627 = _611;
        _628 = _612;
      } else {
        _626 = 0.0f;
        _627 = 0.0f;
        _628 = 0.0f;
      }
    } else {
      _626 = 0.0f;
      _627 = 0.0f;
      _628 = 0.0f;
    }
  } else {
    _626 = _610;
    _627 = _611;
    _628 = _612;
  }
  float _638 = exp2(log2(_626 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _639 = exp2(log2(_627 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _640 = exp2(log2(_628 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_638 * 18.6875f) + 1.0f)) * ((_638 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_639 * 18.6875f) + 1.0f)) * ((_639 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_640 * 18.6875f) + 1.0f)) * ((_640 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _207;
  return SV_Target;
}