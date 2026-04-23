#include "../tonemap.hlsli"

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

cbuffer __3__1__0__0__PostProcessMaterialIndex : register(b2, space1) {
  int _materialIndex : packoffset(c000.x);
  int _passIndex : packoffset(c000.y);
};

ConstantBuffer<PostProcessDamageStruct> BindlessParameters_PostProcessDamage[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _16[36];
  int _21 = WaveReadLaneFirst(_materialIndex);
  int _29 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_21 < (uint)170000), _21, 0)) + 0u))]._waterNormalTexture);
  float4 _36 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_29 < (uint)65000), _29, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  int _39 = WaveReadLaneFirst(_materialIndex);
  int _47 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_39 < (uint)170000), _39, 0)) + 0u))]._waterMaskTexture);
  float4 _54 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_47 < (uint)65000), _47, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  int _58 = WaveReadLaneFirst(_materialIndex);
  int _67 = WaveReadLaneFirst(_materialIndex);
  int _76 = WaveReadLaneFirst(_materialIndex);
  float _85 = dot(float3(_54.x, _54.y, _54.z), float3(WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_58 < (uint)170000), _58, 0)) + 0u))]._waterRatio1), WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_67 < (uint)170000), _67, 0)) + 0u))]._waterRatio2), WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_76 < (uint)170000), _76, 0)) + 0u))]._waterRatio3)));
  float4 _98 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(abs((_85 * ((_36.x * 0.20000000298023224f) + -0.09960784763097763f)) + TEXCOORD.x), abs(TEXCOORD.y - (_85 * ((_36.y * 0.20000000298023224f) + -0.09960784763097763f)))));
  int _102 = WaveReadLaneFirst(_materialIndex);
  float _110 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_102 < (uint)170000), _102, 0)) + 0u))]._isDead);
  float _111 = dot(float3(_98.x, _98.y, _98.z), float3(0.26269999146461487f, 0.6779999732971191f, 0.059300001710653305f));
  float _118 = ((_111 - _98.x) * _110) + _98.x;
  float _119 = ((_111 - _98.y) * _110) + _98.y;
  float _120 = ((_111 - _98.z) * _110) + _98.z;
  float _123 = abs((TEXCOORD.x * 2.0f) + -1.0f);
  float _126 = abs((TEXCOORD.y * 2.0f) + -1.0f);
  int _130 = WaveReadLaneFirst(_materialIndex);
  int _138 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_130 < (uint)170000), _130, 0)) + 0u))]._bloodColor);
  float _141 = float((uint)((uint)(((uint)((uint)(_138)) >> 16) & 255)));
  float _144 = float((uint)((uint)(((uint)((uint)(_138)) >> 8) & 255)));
  float _146 = float((uint)((uint)(_138 & 255)));
  float _171 = select(((_141 * 0.003921568859368563f) < 0.040449999272823334f), (_141 * 0.0003035269910469651f), exp2(log2((_141 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
  int _174 = WaveReadLaneFirst(_materialIndex);
  bool _188 = ((WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_174 < (uint)170000), _174, 0)) + 0u))]._isBloodEffect) > 0.0010000000474974513f)) && (((_isPhotosensitiveMode_isAllolwBlood & 1) == 0));
  float _189 = _171 * 0.4000000059604645f;
  int _193 = WaveReadLaneFirst(_materialIndex);
  int _201 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_193 < (uint)170000), _193, 0)) + 0u))]._dirtTexture);
  float4 _208 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_201 < (uint)65000), _201, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  int _213 = WaveReadLaneFirst(_materialIndex);
  int _221 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_213 < (uint)170000), _213, 0)) + 0u))]._dirtMaskTexture);
  float4 _228 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_221 < (uint)65000), _221, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  int _232 = WaveReadLaneFirst(_materialIndex);
  int _241 = WaveReadLaneFirst(_materialIndex);
  int _250 = WaveReadLaneFirst(_materialIndex);
  float _260 = dot(float3(_228.x, _228.y, _228.z), float3(WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_232 < (uint)170000), _232, 0)) + 0u))]._dirtRatio1), WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_241 < (uint)170000), _241, 0)) + 0u))]._dirtRatio2), WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_250 < (uint)170000), _250, 0)) + 0u))]._dirtRatio3))) * _208.w;
  float _267 = (_260 * (_208.x - _118)) + _118;
  float _268 = (_260 * (_208.y - _119)) + _119;
  float _269 = (_260 * (_208.z - _120)) + _120;
  int _270 = WaveReadLaneFirst(_materialIndex);
  float _279 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_270 < (uint)170000), _270, 0)) + 0u))]._bloodRatio) * max((_123 * _123), (_126 * _126));
  float _289 = _267 - ((_267 * (1.0f - select(_188, _189, _171))) * _279);
  float _290 = _268 - ((_268 * (1.0f - select(_188, _189, select(((_144 * 0.003921568859368563f) < 0.040449999272823334f), (_144 * 0.0003035269910469651f), exp2(log2((_144 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))))) * _279);
  float _291 = _269 - ((_269 * (1.0f - select(_188, _189, select(((_146 * 0.003921568859368563f) < 0.040449999272823334f), (_146 * 0.0003035269910469651f), exp2(log2((_146 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))))) * _279);
  uint _292 = uint(SV_Position.y);
  float _306;
  float _552;
  float _553;
  float _554;
  float _674;
  float _675;
  float _676;
  float _691;
  float _692;
  float _693;
  float _726;
  float _727;
  float _728;
  float _742;
  float _743;
  float _744;
  if (_etcParams.y == 1.0f) {
    uint2 _300 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_292), 0));
    _306 = (float((uint)((uint)(_300.x & 127))) + 0.5f);
  } else {
    _306 = _postProcessParams.x;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_289, _290, _291));
    _674 = output_color.x;
    _675 = output_color.y;
    _676 = output_color.z;
  } else {
    _674 = _289;
    _675 = _290;
    _676 = _291;
  }
  if (_etcParams.y > 1.0f) {
    float _686 = saturate(1.0f - (dot(float2(_123, _126), float2(_123, _126)) * saturate(_etcParams.y + -1.0f)));
    _691 = (_686 * _674);
    _692 = (_686 * _675);
    _693 = (_686 * _676);
  } else {
    _691 = _674;
    _692 = _675;
    _693 = _676;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _726 = select((_691 <= 0.0031308000907301903f), (_691 * 12.920000076293945f), (((pow(_691, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _727 = select((_692 <= 0.0031308000907301903f), (_692 * 12.920000076293945f), (((pow(_692, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _728 = select((_693 <= 0.0031308000907301903f), (_693 * 12.920000076293945f), (((pow(_693, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _726 = _691;
    _727 = _692;
    _728 = _693;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _733 = float((uint)_292);
    if (!(_733 < _viewDir.w)) {
      if (!(_733 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _742 = _726;
        _743 = _727;
        _744 = _728;
      } else {
        _742 = 0.0f;
        _743 = 0.0f;
        _744 = 0.0f;
      }
    } else {
      _742 = 0.0f;
      _743 = 0.0f;
      _744 = 0.0f;
    }
  } else {
    _742 = _726;
    _743 = _727;
    _744 = _728;
  }
  SV_Target.x = _742;
  SV_Target.y = _743;
  SV_Target.z = _744;
  SV_Target.w = _306;
  return SV_Target;
}

