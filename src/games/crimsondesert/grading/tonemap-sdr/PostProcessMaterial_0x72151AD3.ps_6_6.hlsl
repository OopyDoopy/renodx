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

Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t69, space36);

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

ConstantBuffer<PostProcessWeatherBlendStruct> BindlessParameters_PostProcessWeatherBlend[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float4 _42 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
  int _46 = WaveReadLaneFirst(_materialIndex);
  float _54 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_46 < (uint)170000), _46, 0)) + 0u))]._blendRatio);
  int _55 = WaveReadLaneFirst(_materialIndex);
  float _343;
  float _344;
  float _345;
  float _359;
  float _564;
  float _565;
  float _566;
  float _659;
  float _660;
  float _661;
  float _715;
  float _716;
  float _717;
  float _736;
  float _737;
  float _738;
  float _768;
  float _769;
  float _770;
  float _784;
  float _785;
  float _786;
  if (((_54 >= 0.009999999776482582f)) && ((WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_55 < (uint)170000), _55, 0)) + 0u))]._enableBlend) > 0.009999999776482582f))) {
    int _74 = WaveReadLaneFirst(_materialIndex);
    int _82 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_74 < (uint)170000), _74, 0)) + 0u))]._noiseTex);
    float4 _89 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_82 < (uint)65000), _82, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, ((_time.x * 0.20000000298023224f) + TEXCOORD.y)));
    float4 _96 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    float _107 = ((_96.x - _42.x) * _96.w) + _42.x;
    float _108 = ((_96.y - _42.y) * _96.w) + _42.y;
    float _109 = ((_96.z - _42.z) * _96.w) + _42.z;
    float _110 = TEXCOORD.x + -0.5f;
    float _111 = TEXCOORD.y + -0.5f;
    float _113 = atan(_111 / _110);
    bool _116 = (_110 < 0.0f);
    bool _117 = (_110 == 0.0f);
    bool _118 = (_111 >= 0.0f);
    bool _119 = (_111 < 0.0f);
    float _128 = select(((_117) && (_118)), 0.5f, select(((_117) && (_119)), -0.5f, (select(((_116) && (_119)), (_113 + -3.1415927410125732f), select(((_116) && (_118)), (_113 + 3.1415927410125732f), _113)) * 0.31830987334251404f)));
    float _132 = sqrt((_111 * _111) + (_110 * _110));
    int _147 = WaveReadLaneFirst(_materialIndex);
    int _155 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_147 < (uint)170000), _147, 0)) + 0u))]._noiseTex);
    float4 _162 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_155 < (uint)65000), _155, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_time.x * -0.20000000298023224f) - ((_89.z + -0.5f) * 0.5f)) + (_128 * 15.0f)), (((_132 * 2.0f) - ((_89.w + -0.5f) * 0.5f)) - (_time.x * 1.5f))));
    float _167 = (1.75f - saturate(_54 * 1.4285714626312256f)) * 0.5f;
    float _170 = max((abs(_110) - _167), 0.0f);
    float _171 = max((abs(_111) - _167), 0.0f);
    int _190 = WaveReadLaneFirst(_materialIndex);
    int _198 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_190 < (uint)170000), _190, 0)) + 0u))]._borderEdgeNoiseTexture);
    float4 _205 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_198 < (uint)65000), _198, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_128 * 9.0f) + (_89.x * 0.05000000074505806f)) - (_162.x * 0.10000000149011612f)), ((_132 + (_89.y * 0.05000000074505806f)) - ((_time.x + _162.x) * 0.10000000149011612f))));
    int _207 = WaveReadLaneFirst(_materialIndex);
    int _215 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_207 < (uint)170000), _207, 0)) + 0u))]._berserkColor);
    float _218 = float((uint)((uint)(((uint)((uint)(_215)) >> 16) & 255)));
    float _221 = float((uint)((uint)(((uint)((uint)(_215)) >> 8) & 255)));
    float _223 = float((uint)((uint)(_215 & 255)));
    float _253 = max(0.0010000000474974513f, _exposure0.x);
    float _259 = ((_205.y * _205.y) * saturate(sqrt((_171 * _171) + (_170 * _170)) * 6.666666507720947f)) * _205.y;
    float _266 = (((select(((_218 * 0.003921568859368563f) < 0.040449999272823334f), (_218 * 0.0003035269910469651f), exp2(log2((_218 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _253) - _107) * _259) + _107;
    float _267 = (((select(((_221 * 0.003921568859368563f) < 0.040449999272823334f), (_221 * 0.0003035269910469651f), exp2(log2((_221 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _253) - _108) * _259) + _108;
    float _268 = (((select(((_223 * 0.003921568859368563f) < 0.040449999272823334f), (_223 * 0.0003035269910469651f), exp2(log2((_223 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _253) - _109) * _259) + _109;
    int _269 = WaveReadLaneFirst(_materialIndex);
    int _277 = WaveReadLaneFirst(BindlessParameters_PostProcessWeatherBlend[((int)((uint)(select(((uint)_269 < (uint)170000), _269, 0)) + 0u))]._berserkEndColor);
    float _280 = float((uint)((uint)(((uint)((uint)(_277)) >> 16) & 255)));
    float _283 = float((uint)((uint)(((uint)((uint)(_277)) >> 8) & 255)));
    float _285 = float((uint)((uint)(_277 & 255)));
    float _315 = max(0.0010000000474974513f, _exposure0.x);
    float _320 = select((_54 > 0.699999988079071f), 1.0f, 0.0f);
    float _327 = (((select(((_280 * 0.003921568859368563f) < 0.040449999272823334f), (_280 * 0.0003035269910469651f), exp2(log2((_280 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _315) - _266) * _320) + _266;
    float _328 = (((select(((_283 * 0.003921568859368563f) < 0.040449999272823334f), (_283 * 0.0003035269910469651f), exp2(log2((_283 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _315) - _267) * _320) + _267;
    float _329 = (((select(((_285 * 0.003921568859368563f) < 0.040449999272823334f), (_285 * 0.0003035269910469651f), exp2(log2((_285 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) / _315) - _268) * _320) + _268;
    float _332 = saturate((_54 + -0.800000011920929f) * 5.0f);
    _343 = (lerp(_327, _42.x, _332));
    _344 = (lerp(_328, _42.y, _332));
    _345 = (lerp(_329, _42.z, _332));
  } else {
    _343 = _42.x;
    _344 = _42.y;
    _345 = _42.z;
  }
  uint _346 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _353 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_346), 0));
    _359 = (float((uint)((uint)(_353.x & 127))) + 0.5f);
  } else {
    _359 = 1.0f;
  }
  bool _362 = (_localToneMappingParams.w > 0.0f);
  if (_362) {
    float3 output_color = TonemapReplacer(float3(_343, _344, _345));
    _715 = output_color.x;
    _716 = output_color.y;
    _717 = output_color.z;
  } else {
    _715 = _343;
    _716 = _344;
    _717 = _345;
  }
  if (_etcParams.y > 1.0f) {
    float _726 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _727 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _731 = saturate(1.0f - (dot(float2(_726, _727), float2(_726, _727)) * saturate(_etcParams.y + -1.0f)));
    _736 = (_731 * _715);
    _737 = (_731 * _716);
    _738 = (_731 * _717);
  } else {
    _736 = _715;
    _737 = _716;
    _738 = _717;
  }
  if ((_362) && ((_etcParams.z > 0.0f))) {
    _768 = select((_736 <= 0.0031308000907301903f), (_736 * 12.920000076293945f), (((pow(_736, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _769 = select((_737 <= 0.0031308000907301903f), (_737 * 12.920000076293945f), (((pow(_737, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _770 = select((_738 <= 0.0031308000907301903f), (_738 * 12.920000076293945f), (((pow(_738, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _768 = _736;
    _769 = _737;
    _770 = _738;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _775 = float((uint)_346);
    if (!(_775 < _viewDir.w)) {
      if (!(_775 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _784 = _768;
        _785 = _769;
        _786 = _770;
      } else {
        _784 = 0.0f;
        _785 = 0.0f;
        _786 = 0.0f;
      }
    } else {
      _784 = 0.0f;
      _785 = 0.0f;
      _786 = 0.0f;
    }
  } else {
    _784 = _768;
    _785 = _769;
    _786 = _770;
  }
  SV_Target.x = _784;
  SV_Target.y = _785;
  SV_Target.z = _786;
  SV_Target.w = _359;
  return SV_Target;
}