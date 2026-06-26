struct PostProcessDamageStruct {
  uint _bloodColor;
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
  float _isBloodEffect;
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

ConstantBuffer<PostProcessDamageStruct> BindlessParameters_PostProcessDamage[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  int _22 = WaveReadLaneFirst(_materialIndex);
  int _30 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_22 < (uint)170000), _22, 0)) + 0u))]._waterNormalTexture);
  float4 _37 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_30 < (uint)65000), _30, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  int _40 = WaveReadLaneFirst(_materialIndex);
  int _48 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_40 < (uint)170000), _40, 0)) + 0u))]._waterMaskTexture);
  float4 _55 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_48 < (uint)65000), _48, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  int _59 = WaveReadLaneFirst(_materialIndex);
  int _68 = WaveReadLaneFirst(_materialIndex);
  int _77 = WaveReadLaneFirst(_materialIndex);
  float _86 = dot(float3(_55.x, _55.y, _55.z), float3(WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_59 < (uint)170000), _59, 0)) + 0u))]._waterRatio1), WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_68 < (uint)170000), _68, 0)) + 0u))]._waterRatio2), WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_77 < (uint)170000), _77, 0)) + 0u))]._waterRatio3)));
  float4 _99 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(abs((_86 * ((_37.x * 0.20000000298023224f) + -0.09960784763097763f)) + TEXCOORD.x), abs(TEXCOORD.y - (_86 * ((_37.y * 0.20000000298023224f) + -0.09960784763097763f)))));
  float _109 = (pow(_99.x, 0.012683313339948654f));
  float _110 = (pow(_99.y, 0.012683313339948654f));
  float _111 = (pow(_99.z, 0.012683313339948654f));
  float _136 = exp2(log2(max(0.0f, (_109 + -0.8359375f)) / (18.8515625f - (_109 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _137 = exp2(log2(max(0.0f, (_110 + -0.8359375f)) / (18.8515625f - (_110 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _138 = exp2(log2(max(0.0f, (_111 + -0.8359375f)) / (18.8515625f - (_111 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  int _139 = WaveReadLaneFirst(_materialIndex);
  float _147 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_139 < (uint)170000), _139, 0)) + 0u))]._isDead);
  float _148 = dot(float3(_136, _137, _138), float3(0.26269999146461487f, 0.6779999732971191f, 0.059300001710653305f));
  float _155 = ((_148 - _136) * _147) + _136;
  float _156 = ((_148 - _137) * _147) + _137;
  float _157 = ((_148 - _138) * _147) + _138;
  float _160 = abs((TEXCOORD.x * 2.0f) + -1.0f);
  float _163 = abs((TEXCOORD.y * 2.0f) + -1.0f);
  int _167 = WaveReadLaneFirst(_materialIndex);
  int _175 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_167 < (uint)170000), _167, 0)) + 0u))]._bloodColor);
  float _178 = float((uint)((uint)(((uint)((uint)(_175)) >> 16) & 255)));
  float _181 = float((uint)((uint)(((uint)((uint)(_175)) >> 8) & 255)));
  float _183 = float((uint)((uint)(_175 & 255)));
  float _208 = select(((_178 * 0.003921568859368563f) < 0.040449999272823334f), (_178 * 0.0003035269910469651f), exp2(log2((_178 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
  int _211 = WaveReadLaneFirst(_materialIndex);
  bool _225 = ((WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_211 < (uint)170000), _211, 0)) + 0u))]._isBloodEffect) > 0.0010000000474974513f)) && (((_isPhotosensitiveMode_isAllolwBlood & 1) == 0));
  float _226 = _208 * 0.4000000059604645f;
  int _230 = WaveReadLaneFirst(_materialIndex);
  int _238 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_230 < (uint)170000), _230, 0)) + 0u))]._dirtTexture);
  float4 _245 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_238 < (uint)65000), _238, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  int _250 = WaveReadLaneFirst(_materialIndex);
  int _258 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_250 < (uint)170000), _250, 0)) + 0u))]._dirtMaskTexture);
  float4 _265 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_258 < (uint)65000), _258, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  int _269 = WaveReadLaneFirst(_materialIndex);
  int _278 = WaveReadLaneFirst(_materialIndex);
  int _287 = WaveReadLaneFirst(_materialIndex);
  float _297 = dot(float3(_265.x, _265.y, _265.z), float3(WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_269 < (uint)170000), _269, 0)) + 0u))]._dirtRatio1), WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_278 < (uint)170000), _278, 0)) + 0u))]._dirtRatio2), WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_287 < (uint)170000), _287, 0)) + 0u))]._dirtRatio3))) * _245.w;
  float _304 = (_297 * (_245.x - _155)) + _155;
  float _305 = (_297 * (_245.y - _156)) + _156;
  float _306 = (_297 * (_245.z - _157)) + _157;
  int _307 = WaveReadLaneFirst(_materialIndex);
  float _316 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_307 < (uint)170000), _307, 0)) + 0u))]._bloodRatio) * max((_160 * _160), (_163 * _163));
  float _326 = _304 - ((_304 * (1.0f - select(_225, _226, _208))) * _316);
  float _327 = _305 - ((_305 * (1.0f - select(_225, _226, select(((_181 * 0.003921568859368563f) < 0.040449999272823334f), (_181 * 0.0003035269910469651f), exp2(log2((_181 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))))) * _316);
  float _328 = _306 - ((_306 * (1.0f - select(_225, _226, select(((_183 * 0.003921568859368563f) < 0.040449999272823334f), (_183 * 0.0003035269910469651f), exp2(log2((_183 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))))) * _316);
  uint _329 = uint(SV_Position.y);
  float _343;
  float _548;
  float _549;
  float _550;
  float _643;
  float _644;
  float _645;
  float _699;
  float _700;
  float _701;
  float _714;
  float _715;
  float _716;
  float _746;
  float _747;
  float _748;
  float _762;
  float _763;
  float _764;
  if (_etcParams.y == 1.0f) {
    uint2 _337 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_329), 0));
    _343 = (float((uint)((uint)(_337.x & 127))) + 0.5f);
  } else {
    _343 = _postProcessParams.x;
  }
  bool _346 = (_localToneMappingParams.w > 0.0f);
  if (_346) {
    float3 output_color = TonemapReplacer(float3(_326, _327, _328));
    _699 = output_color.x;
    _700 = output_color.y;
    _701 = output_color.z;
  } else {
    _699 = _326;
    _700 = _327;
    _701 = _328;
  }
  if (_etcParams.y > 1.0f) {
    float _709 = saturate(1.0f - (dot(float2(_160, _163), float2(_160, _163)) * saturate(_etcParams.y + -1.0f)));
    _714 = (_709 * _699);
    _715 = (_709 * _700);
    _716 = (_709 * _701);
  } else {
    _714 = _699;
    _715 = _700;
    _716 = _701;
  }
  if ((_346) && ((_etcParams.z > 0.0f))) {
    _746 = select((_714 <= 0.0031308000907301903f), (_714 * 12.920000076293945f), (((pow(_714, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _747 = select((_715 <= 0.0031308000907301903f), (_715 * 12.920000076293945f), (((pow(_715, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _748 = select((_716 <= 0.0031308000907301903f), (_716 * 12.920000076293945f), (((pow(_716, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _746 = _714;
    _747 = _715;
    _748 = _716;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _753 = float((uint)_329);
    if (!(_753 < _viewDir.w)) {
      if (!(_753 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _762 = _746;
        _763 = _747;
        _764 = _748;
      } else {
        _762 = 0.0f;
        _763 = 0.0f;
        _764 = 0.0f;
      }
    } else {
      _762 = 0.0f;
      _763 = 0.0f;
      _764 = 0.0f;
    }
  } else {
    _762 = _746;
    _763 = _747;
    _764 = _748;
  }
  float _774 = exp2(log2(_762 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _775 = exp2(log2(_763 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _776 = exp2(log2(_764 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_774 * 18.6875f) + 1.0f)) * ((_774 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_775 * 18.6875f) + 1.0f)) * ((_775 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_776 * 18.6875f) + 1.0f)) * ((_776 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _343;
  return SV_Target;
}