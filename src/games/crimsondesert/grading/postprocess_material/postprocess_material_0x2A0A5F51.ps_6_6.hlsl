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
  float _108 = (pow(_98.x, 0.012683313339948654f));
  float _109 = (pow(_98.y, 0.012683313339948654f));
  float _110 = (pow(_98.z, 0.012683313339948654f));
  float _135 = exp2(log2(max(0.0f, (_108 + -0.8359375f)) / (18.8515625f - (_108 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _136 = exp2(log2(max(0.0f, (_109 + -0.8359375f)) / (18.8515625f - (_109 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _137 = exp2(log2(max(0.0f, (_110 + -0.8359375f)) / (18.8515625f - (_110 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  int _138 = WaveReadLaneFirst(_materialIndex);
  float _146 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_138 < (uint)170000), _138, 0)) + 0u))]._isDead);
  float _147 = dot(float3(_135, _136, _137), float3(0.26269999146461487f, 0.6779999732971191f, 0.059300001710653305f));
  float _154 = ((_147 - _135) * _146) + _135;
  float _155 = ((_147 - _136) * _146) + _136;
  float _156 = ((_147 - _137) * _146) + _137;
  float _159 = abs((TEXCOORD.x * 2.0f) + -1.0f);
  float _162 = abs((TEXCOORD.y * 2.0f) + -1.0f);
  int _166 = WaveReadLaneFirst(_materialIndex);
  int _174 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_166 < (uint)170000), _166, 0)) + 0u))]._bloodColor);
  float _177 = float((uint)((uint)(((uint)((uint)(_174)) >> 16) & 255)));
  float _180 = float((uint)((uint)(((uint)((uint)(_174)) >> 8) & 255)));
  float _182 = float((uint)((uint)(_174 & 255)));
  float _207 = select(((_177 * 0.003921568859368563f) < 0.040449999272823334f), (_177 * 0.0003035269910469651f), exp2(log2((_177 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
  int _210 = WaveReadLaneFirst(_materialIndex);
  bool _224 = ((WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_210 < (uint)170000), _210, 0)) + 0u))]._isBloodEffect) > 0.0010000000474974513f)) && (((_isPhotosensitiveMode_isAllolwBlood & 1) == 0));
  float _225 = _207 * 0.4000000059604645f;
  int _229 = WaveReadLaneFirst(_materialIndex);
  int _237 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_229 < (uint)170000), _229, 0)) + 0u))]._dirtTexture);
  float4 _244 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_237 < (uint)65000), _237, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  int _249 = WaveReadLaneFirst(_materialIndex);
  int _257 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_249 < (uint)170000), _249, 0)) + 0u))]._dirtMaskTexture);
  float4 _264 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_257 < (uint)65000), _257, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  int _268 = WaveReadLaneFirst(_materialIndex);
  int _277 = WaveReadLaneFirst(_materialIndex);
  int _286 = WaveReadLaneFirst(_materialIndex);
  float _296 = dot(float3(_264.x, _264.y, _264.z), float3(WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_268 < (uint)170000), _268, 0)) + 0u))]._dirtRatio1), WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_277 < (uint)170000), _277, 0)) + 0u))]._dirtRatio2), WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_286 < (uint)170000), _286, 0)) + 0u))]._dirtRatio3))) * _244.w;
  float _303 = (_296 * (_244.x - _154)) + _154;
  float _304 = (_296 * (_244.y - _155)) + _155;
  float _305 = (_296 * (_244.z - _156)) + _156;
  int _306 = WaveReadLaneFirst(_materialIndex);
  float _315 = WaveReadLaneFirst(BindlessParameters_PostProcessDamage[((int)((uint)(select(((uint)_306 < (uint)170000), _306, 0)) + 0u))]._bloodRatio) * max((_159 * _159), (_162 * _162));
  float _325 = _303 - ((_303 * (1.0f - select(_224, _225, _207))) * _315);
  float _326 = _304 - ((_304 * (1.0f - select(_224, _225, select(((_180 * 0.003921568859368563f) < 0.040449999272823334f), (_180 * 0.0003035269910469651f), exp2(log2((_180 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))))) * _315);
  float _327 = _305 - ((_305 * (1.0f - select(_224, _225, select(((_182 * 0.003921568859368563f) < 0.040449999272823334f), (_182 * 0.0003035269910469651f), exp2(log2((_182 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f))))) * _315);
  uint _328 = uint(SV_Position.y);
  float _342;
  float _588;
  float _589;
  float _590;
  float _710;
  float _711;
  float _712;
  float _727;
  float _728;
  float _729;
  float _762;
  float _763;
  float _764;
  float _778;
  float _779;
  float _780;
  if (_etcParams.y == 1.0f) {
    uint2 _336 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_328), 0));
    _342 = (float((uint)((uint)(_336.x & 127))) + 0.5f);
  } else {
    _342 = _postProcessParams.x;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_325, _326, _327));
    _710 = output_color.x;
    _711 = output_color.y;
    _712 = output_color.z;
  } else {
    _710 = _325;
    _711 = _326;
    _712 = _327;
  }
  if (_etcParams.y > 1.0f) {
    float _722 = saturate(1.0f - (dot(float2(_159, _162), float2(_159, _162)) * saturate(_etcParams.y + -1.0f)));
    _727 = (_722 * _710);
    _728 = (_722 * _711);
    _729 = (_722 * _712);
  } else {
    _727 = _710;
    _728 = _711;
    _729 = _712;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _762 = select((_727 <= 0.0031308000907301903f), (_727 * 12.920000076293945f), (((pow(_727, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _763 = select((_728 <= 0.0031308000907301903f), (_728 * 12.920000076293945f), (((pow(_728, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _764 = select((_729 <= 0.0031308000907301903f), (_729 * 12.920000076293945f), (((pow(_729, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _762 = _727;
    _763 = _728;
    _764 = _729;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _769 = float((uint)_328);
    if (!(_769 < _viewDir.w)) {
      if (!(_769 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _778 = _762;
        _779 = _763;
        _780 = _764;
      } else {
        _778 = 0.0f;
        _779 = 0.0f;
        _780 = 0.0f;
      }
    } else {
      _778 = 0.0f;
      _779 = 0.0f;
      _780 = 0.0f;
    }
  } else {
    _778 = _762;
    _779 = _763;
    _780 = _764;
  }
  float _790 = exp2(log2(_778 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _791 = exp2(log2(_779 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _792 = exp2(log2(_780 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_790 * 18.6875f) + 1.0f)) * ((_790 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_791 * 18.6875f) + 1.0f)) * ((_791 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_792 * 18.6875f) + 1.0f)) * ((_792 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _342;
  return SV_Target;
}

