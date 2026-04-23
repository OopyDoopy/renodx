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
  float _326;
  float _572;
  float _573;
  float _574;
  float _694;
  float _695;
  float _696;
  float _717;
  float _718;
  float _719;
  float _752;
  float _753;
  float _754;
  float _768;
  float _769;
  float _770;
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
  int _127 = WaveReadLaneFirst(_materialIndex);
  float _135 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_127 < (uint)170000), _127, 0)) + 0u))]._isDead);
  float _136 = dot(float3(_123.x, _123.y, _123.z), float3(0.26269999146461487f, 0.6779999732971191f, 0.059300001710653305f));
  int _146 = WaveReadLaneFirst(_materialIndex);
  int _154 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_146 < (uint)170000), _146, 0)) + 0u))]._bloodTexture);
  float4 _161 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_154 < (uint)65000), _154, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(_115, _118));
  int _166 = WaveReadLaneFirst(_materialIndex);
  int _174 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_166 < (uint)170000), _166, 0)) + 0u))]._dirtTexture);
  float4 _181 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_174 < (uint)65000), _174, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(_115, _118));
  int _186 = WaveReadLaneFirst(_materialIndex);
  int _194 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_186 < (uint)170000), _186, 0)) + 0u))]._dirtMaskTexture);
  float4 _201 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_194 < (uint)65000), _194, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(_115, _118));
  float _215 = (dot(float3(_viewDir.x, _viewDir.y, _viewDir.z), float3(_sunDirection.x, _sunDirection.y, _sunDirection.z)) * 25.0f) + 25.0f;
  int _222 = WaveReadLaneFirst(_materialIndex);
  float _233 = exp2(log2((((_51 * 15.0f) * (1.0f - _51)) * _52) * (1.0f - _52)) * WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_222 < (uint)170000), _222, 0)) + 0u))]._vignettFalloff));
  float _234 = _233 * (lerp(_123.x, _136, _135));
  float _235 = _233 * (lerp(_123.y, _136, _135));
  float _236 = _233 * (lerp(_123.z, _136, _135));
  int _237 = WaveReadLaneFirst(_materialIndex);
  int _246 = WaveReadLaneFirst(_materialIndex);
  int _255 = WaveReadLaneFirst(_materialIndex);
  float _265 = dot(float3(_201.x, _201.y, _201.z), float3(WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_237 < (uint)170000), _237, 0)) + 0u))]._dirtRatio1), WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_246 < (uint)170000), _246, 0)) + 0u))]._dirtRatio2), WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_255 < (uint)170000), _255, 0)) + 0u))]._dirtRatio3))) * _181.w;
  float _272 = (_265 * (_181.x - _234)) + _234;
  float _273 = (_265 * (_181.y - _235)) + _235;
  float _274 = (_265 * (_181.z - _236)) + _236;
  int _275 = WaveReadLaneFirst(_materialIndex);
  float _284 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_275 < (uint)170000), _275, 0)) + 0u))]._bloodRatio) * _161.w;
  int _297 = WaveReadLaneFirst(_materialIndex);
  float _310 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_297 < (uint)170000), _297, 0)) + 0u))]._mulColor.x) * ((_284 * ((_215 * _161.x) - _272)) + _272);
  float _311 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_297 < (uint)170000), _297, 0)) + 0u))]._mulColor.y) * ((_284 * ((_215 * _161.y) - _273)) + _273);
  float _312 = WaveReadLaneFirst(BindlessParameters_PostProcessDamageTest[((int)((uint)(select(((uint)_297 < (uint)170000), _297, 0)) + 0u))]._mulColor.z) * ((_284 * ((_215 * _161.z) - _274)) + _274);
  uint _313 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _320 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_313), 0));
    _326 = (float((uint)((uint)(_320.x & 127))) + 0.5f);
  } else {
    _326 = _postProcessParams.x;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_310, _311, _312));
    _694 = output_color.x;
    _695 = output_color.y;
    _696 = output_color.z;
  } else {
    _694 = _310;
    _695 = _311;
    _696 = _312;
  }
  if (_etcParams.y > 1.0f) {
    float _707 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _708 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _712 = saturate(1.0f - (dot(float2(_707, _708), float2(_707, _708)) * saturate(_etcParams.y + -1.0f)));
    _717 = (_712 * _694);
    _718 = (_712 * _695);
    _719 = (_712 * _696);
  } else {
    _717 = _694;
    _718 = _695;
    _719 = _696;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _752 = select((_717 <= 0.0031308000907301903f), (_717 * 12.920000076293945f), (((pow(_717, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _753 = select((_718 <= 0.0031308000907301903f), (_718 * 12.920000076293945f), (((pow(_718, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _754 = select((_719 <= 0.0031308000907301903f), (_719 * 12.920000076293945f), (((pow(_719, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _752 = _717;
    _753 = _718;
    _754 = _719;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _759 = float((uint)_313);
    if (!(_759 < _viewDir.w)) {
      if (!(_759 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _768 = _752;
        _769 = _753;
        _770 = _754;
      } else {
        _768 = 0.0f;
        _769 = 0.0f;
        _770 = 0.0f;
      }
    } else {
      _768 = 0.0f;
      _769 = 0.0f;
      _770 = 0.0f;
    }
  } else {
    _768 = _752;
    _769 = _753;
    _770 = _754;
  }
  SV_Target.x = _768;
  SV_Target.y = _769;
  SV_Target.z = _770;
  SV_Target.w = _326;
  return SV_Target;
}

