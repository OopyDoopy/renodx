#include "../tonemap.hlsli"

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

cbuffer __3__1__0__0__PostProcessSizeConstant : register(b1, space1) {
  float4 _srcTargetSizeAndInv : packoffset(c000.x);
  float4 _destTargetSizAndInv : packoffset(c001.x);
};

cbuffer __3__1__0__0__PostProcessMaterialIndex : register(b2, space1) {
  int _materialIndex : packoffset(c000.x);
  int _passIndex : packoffset(c000.y);
};

ConstantBuffer<PostProcessDamageTestStruct> BindlessParameters_PostProcessDamageTest[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _19[36];
  float _50 = _destTargetSizAndInv.y * (1.0f - TEXCOORD.y);
  float _51 = (_destTargetSizAndInv.x * TEXCOORD.x) / _srcTargetSizeAndInv.x;
  float _52 = _50 / _srcTargetSizeAndInv.y;
  float _53 = _50 / _srcTargetSizeAndInv.x;
  float _54 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  float _55 = 0.5f / _54;
  float _56 = _51 + -0.5f;
  float _57 = _53 - _55;
  float _58 = dot(float2(_56, _57), float2(_56, _57));
  float _59 = sqrt(_58);
  int _60 = WaveReadLaneFirst(_materialIndex);
  float _68 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_60 < (uint)170000), _60, 0)) + 0u))]._maxPower);
  bool _69 = (_68 > 0.0f);
  float _77;
  float _115;
  float _116;
  float _362;
  float _608;
  float _609;
  float _610;
  float _730;
  float _731;
  float _732;
  float _753;
  float _754;
  float _755;
  float _788;
  float _789;
  float _790;
  float _804;
  float _805;
  float _806;
  if (_69) {
    _77 = sqrt(dot(float2(0.5f, _55), float2(0.5f, _55)));
  } else {
    if (!(_54 < 1.0f)) {
      _77 = _55;
    } else {
      _77 = 0.5f;
    }
  }
  if (_69) {
    float _79 = rsqrt(_58);
    float _81 = tan(_68 * _59);
    float _89 = tan(_77 * _68);
    _115 = (((((_77 * _56) * _79) * _81) / _89) + 0.5f);
    _116 = (((((_77 * _57) * _79) * _81) / _89) + _55);
  } else {
    if (_68 < 0.0f) {
      float _97 = rsqrt(_58);
      float _100 = atan((_68 * _59) * -10.0f);
      float _109 = atan((_68 * -10.0f) * _77);
      _115 = (((((_77 * _56) * _97) * _100) / _109) + 0.5f);
      _116 = (((((_77 * _57) * _97) * _100) / _109) + _55);
    } else {
      _115 = _51;
      _116 = _53;
    }
  }
  float _118 = 1.0f - (_116 * _54);
  float4 _123 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticPointClamp, float2(abs(_115), abs(_118)));
  float _133 = (pow(_123.x, 0.012683313339948654f));
  float _134 = (pow(_123.y, 0.012683313339948654f));
  float _135 = (pow(_123.z, 0.012683313339948654f));
  float _160 = exp2(log2(max(0.0f, (_133 + -0.8359375f)) / (18.8515625f - (_133 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _161 = exp2(log2(max(0.0f, (_134 + -0.8359375f)) / (18.8515625f - (_134 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _162 = exp2(log2(max(0.0f, (_135 + -0.8359375f)) / (18.8515625f - (_135 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  int _163 = WaveReadLaneFirst(_materialIndex);
  float _171 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_163 < (uint)170000), _163, 0)) + 0u))]._isDead);
  float _172 = dot(float3(_160, _161, _162), float3(0.26269999146461487f, 0.6779999732971191f, 0.059300001710653305f));
  int _182 = WaveReadLaneFirst(_materialIndex);
  int _190 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_182 < (uint)170000), _182, 0)) + 0u))]._bloodTexture);
  float4 _197 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_190 < (uint)65000), _190, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(_115, _118));
  int _202 = WaveReadLaneFirst(_materialIndex);
  int _210 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_202 < (uint)170000), _202, 0)) + 0u))]._dirtTexture);
  float4 _217 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_210 < (uint)65000), _210, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(_115, _118));
  int _222 = WaveReadLaneFirst(_materialIndex);
  int _230 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_222 < (uint)170000), _222, 0)) + 0u))]._dirtMaskTexture);
  float4 _237 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_230 < (uint)65000), _230, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(_115, _118));
  float _251 = (dot(float3(_viewDir.x, _viewDir.y, _viewDir.z), float3(_sunDirection.x, _sunDirection.y, _sunDirection.z)) * 25.0f) + 25.0f;
  int _258 = WaveReadLaneFirst(_materialIndex);
  float _269 = exp2(log2((((_51 * 15.0f) * (1.0f - _51)) * _52) * (1.0f - _52)) * WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_258 < (uint)170000), _258, 0)) + 0u))]._vignettFalloff));
  float _270 = _269 * (lerp(_160, _172, _171));
  float _271 = _269 * (lerp(_161, _172, _171));
  float _272 = _269 * (lerp(_162, _172, _171));
  int _273 = WaveReadLaneFirst(_materialIndex);
  int _282 = WaveReadLaneFirst(_materialIndex);
  int _291 = WaveReadLaneFirst(_materialIndex);
  float _301 = dot(float3(_237.x, _237.y, _237.z), float3(WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_273 < (uint)170000), _273, 0)) + 0u))]._dirtRatio1), WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_282 < (uint)170000), _282, 0)) + 0u))]._dirtRatio2), WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_291 < (uint)170000), _291, 0)) + 0u))]._dirtRatio3))) * _217.w;
  float _308 = (_301 * (_217.x - _270)) + _270;
  float _309 = (_301 * (_217.y - _271)) + _271;
  float _310 = (_301 * (_217.z - _272)) + _272;
  int _311 = WaveReadLaneFirst(_materialIndex);
  float _320 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_311 < (uint)170000), _311, 0)) + 0u))]._bloodRatio) * _197.w;
  int _333 = WaveReadLaneFirst(_materialIndex);
  float _346 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_333 < (uint)170000), _333, 0)) + 0u))]._mulColor.x) * ((_320 * ((_251 * _197.x) - _308)) + _308);
  float _347 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_333 < (uint)170000), _333, 0)) + 0u))]._mulColor.y) * ((_320 * ((_251 * _197.y) - _309)) + _309);
  float _348 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_333 < (uint)170000), _333, 0)) + 0u))]._mulColor.z) * ((_320 * ((_251 * _197.z) - _310)) + _310);
  uint _349 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _356 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_349), 0));
    _362 = (float((uint)((uint)(_356.x & 127))) + 0.5f);
  } else {
    _362 = _postProcessParams.x;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_346, _347, _348));
    _730 = output_color.x;
    _731 = output_color.y;
    _732 = output_color.z;
  } else {
    _730 = _346;
    _731 = _347;
    _732 = _348;
  }
  if (_etcParams.y > 1.0f) {
    float _743 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _744 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _748 = saturate(1.0f - (dot(float2(_743, _744), float2(_743, _744)) * saturate(_etcParams.y + -1.0f)));
    _753 = (_748 * _730);
    _754 = (_748 * _731);
    _755 = (_748 * _732);
  } else {
    _753 = _730;
    _754 = _731;
    _755 = _732;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _788 = select((_753 <= 0.0031308000907301903f), (_753 * 12.920000076293945f), (((pow(_753, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _789 = select((_754 <= 0.0031308000907301903f), (_754 * 12.920000076293945f), (((pow(_754, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _790 = select((_755 <= 0.0031308000907301903f), (_755 * 12.920000076293945f), (((pow(_755, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _788 = _753;
    _789 = _754;
    _790 = _755;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _795 = float((uint)_349);
    if (!(_795 < _viewDir.w)) {
      if (!(_795 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _804 = _788;
        _805 = _789;
        _806 = _790;
      } else {
        _804 = 0.0f;
        _805 = 0.0f;
        _806 = 0.0f;
      }
    } else {
      _804 = 0.0f;
      _805 = 0.0f;
      _806 = 0.0f;
    }
  } else {
    _804 = _788;
    _805 = _789;
    _806 = _790;
  }
  float _816 = exp2(log2(_804 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _817 = exp2(log2(_805 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _818 = exp2(log2(_806 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_816 * 18.6875f) + 1.0f)) * ((_816 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_817 * 18.6875f) + 1.0f)) * ((_817 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_818 * 18.6875f) + 1.0f)) * ((_818 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _362;
  return SV_Target;
}

