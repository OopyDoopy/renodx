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
  int _103 = WaveReadLaneFirst(_materialIndex);
  float _111 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_103 < (uint)170000), _103, 0)) + 0u))]._isDead);
  float _112 = dot(float3(_99.x, _99.y, _99.z), float3(0.26269999146461487f, 0.6779999732971191f, 0.059300001710653305f));
  float _119 = ((_112 - _99.x) * _111) + _99.x;
  float _120 = ((_112 - _99.y) * _111) + _99.y;
  float _121 = ((_112 - _99.z) * _111) + _99.z;
  float _124 = abs((TEXCOORD.x * 2.0f) + -1.0f);
  float _127 = abs((TEXCOORD.y * 2.0f) + -1.0f);
  int _131 = WaveReadLaneFirst(_materialIndex);
  int _139 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_131 < (uint)170000), _131, 0)) + 0u))]._bloodColor);
  float _142 = float((uint)((uint)(((uint)((uint)(_139)) >> 16) & 255)));
  float _145 = float((uint)((uint)(((uint)((uint)(_139)) >> 8) & 255)));
  float _147 = float((uint)((uint)(_139 & 255)));
  float _172 = select(((_142 * 0.003921568859368563f) < 0.040449999272823334f), (_142 * 0.0003035269910469651f), exp2(log2((_142 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
  int _175 = WaveReadLaneFirst(_materialIndex);
  bool _189 = ((WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_175 < (uint)170000), _175, 0)) + 0u))]._isBloodEffect) > 0.0010000000474974513f)) && (((_isPhotosensitiveMode_isAllolwBlood & 1) == 0));
  float _190 = _172 * 0.4000000059604645f;
  int _194 = WaveReadLaneFirst(_materialIndex);
  int _202 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_194 < (uint)170000), _194, 0)) + 0u))]._dirtTexture);
  float4 _209 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_202 < (uint)65000), _202, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  int _214 = WaveReadLaneFirst(_materialIndex);
  int _222 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_214 < (uint)170000), _214, 0)) + 0u))]._dirtMaskTexture);
  float4 _229 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_222 < (uint)65000), _222, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  int _233 = WaveReadLaneFirst(_materialIndex);
  int _242 = WaveReadLaneFirst(_materialIndex);
  int _251 = WaveReadLaneFirst(_materialIndex);
  float _261 = dot(float3(_229.x, _229.y, _229.z), float3(WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_233 < (uint)170000), _233, 0)) + 0u))]._dirtRatio1), WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_242 < (uint)170000), _242, 0)) + 0u))]._dirtRatio2), WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_251 < (uint)170000), _251, 0)) + 0u))]._dirtRatio3))) * _209.w;
  float _268 = (_261 * (_209.x - _119)) + _119;
  float _269 = (_261 * (_209.y - _120)) + _120;
  float _270 = (_261 * (_209.z - _121)) + _121;
  int _271 = WaveReadLaneFirst(_materialIndex);
  float _280 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_271 < (uint)170000), _271, 0)) + 0u))]._bloodRatio) * max((_124 * _124), (_127 * _127));
  float _290 = _268 - ((_268 * (1.0f - select(_189, _190, _172))) * _280);
  float _291 = _269 - ((_269 * (1.0f - select(_189, _190, select(((_145 * 0.003921568859368563f) < 0.040449999272823334f), (_145 * 0.0003035269910469651f), exp2(log2((_145 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))))) * _280);
  float _292 = _270 - ((_270 * (1.0f - select(_189, _190, select(((_147 * 0.003921568859368563f) < 0.040449999272823334f), (_147 * 0.0003035269910469651f), exp2(log2((_147 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))))) * _280);
  uint _293 = uint(SV_Position.y);
  float _307;
  float _512;
  float _513;
  float _514;
  float _607;
  float _608;
  float _609;
  float _663;
  float _664;
  float _665;
  float _678;
  float _679;
  float _680;
  float _710;
  float _711;
  float _712;
  float _726;
  float _727;
  float _728;
  if (_etcParams.y == 1.0f) {
    uint2 _301 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_293), 0));
    _307 = (float((uint)((uint)(_301.x & 127))) + 0.5f);
  } else {
    _307 = _postProcessParams.x;
  }
  bool _310 = (_localToneMappingParams.w > 0.0f);
  if (_310) {
    float3 output_color = TonemapReplacer(float3(_290, _291, _292));
    _663 = output_color.x;
    _664 = output_color.y;
    _665 = output_color.z;
  } else {
    _663 = _290;
    _664 = _291;
    _665 = _292;
  }
  if (_etcParams.y > 1.0f) {
    float _673 = saturate(1.0f - (dot(float2(_124, _127), float2(_124, _127)) * saturate(_etcParams.y + -1.0f)));
    _678 = (_673 * _663);
    _679 = (_673 * _664);
    _680 = (_673 * _665);
  } else {
    _678 = _663;
    _679 = _664;
    _680 = _665;
  }
  if ((_310) && ((_etcParams.z > 0.0f))) {
    _710 = select((_678 <= 0.0031308000907301903f), (_678 * 12.920000076293945f), (((pow(_678, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _711 = select((_679 <= 0.0031308000907301903f), (_679 * 12.920000076293945f), (((pow(_679, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _712 = select((_680 <= 0.0031308000907301903f), (_680 * 12.920000076293945f), (((pow(_680, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _710 = _678;
    _711 = _679;
    _712 = _680;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _717 = float((uint)_293);
    if (!(_717 < _viewDir.w)) {
      if (!(_717 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _726 = _710;
        _727 = _711;
        _728 = _712;
      } else {
        _726 = 0.0f;
        _727 = 0.0f;
        _728 = 0.0f;
      }
    } else {
      _726 = 0.0f;
      _727 = 0.0f;
      _728 = 0.0f;
    }
  } else {
    _726 = _710;
    _727 = _711;
    _728 = _712;
  }
  SV_Target.x = _726;
  SV_Target.y = _727;
  SV_Target.z = _728;
  SV_Target.w = _307;
  return SV_Target;
}