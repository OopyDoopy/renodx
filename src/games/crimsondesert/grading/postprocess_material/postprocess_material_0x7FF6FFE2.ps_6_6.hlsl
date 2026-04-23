#include "../tonemap.hlsli"

struct PostProcessOutlineStruct {
  float _outlineColorR;
  float _outlineColorG;
  float _outlineColorB;
};


Texture2D<uint2> __3__36__0__0__g_stencil : register(t38, space36);

Texture2D<uint> __3__36__0__0__g_CustomRenderPassValue : register(t65, space36);

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

ConstantBuffer<PostProcessOutlineStruct> BindlessParameters_PostProcessOutline[] : register(b0, space100);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _15[36];
  int2 _28; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_28.x, _28.y);
  uint _43 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_28.x))))) + 0.5f) * float((int)(int(_bufferSizeAndInvSize.x * TEXCOORD.x)))), int((float((int)(int(float((int)(_28.y))))) + 0.5f) * float((int)(int(_bufferSizeAndInvSize.y * TEXCOORD.y)))), 0));
  float _76;
  float _77;
  float _78;
  float _92;
  float _338;
  float _339;
  float _340;
  float _460;
  float _461;
  float _462;
  float _483;
  float _484;
  float _485;
  float _518;
  float _519;
  float _520;
  float _534;
  float _535;
  float _536;
  if ((_43.x & 255) == 30) {
    int _48 = WaveReadLaneFirst(_materialIndex);
    int _57 = WaveReadLaneFirst(_materialIndex);
    int _66 = WaveReadLaneFirst(_materialIndex);
    _76 = WaveReadLaneFirst(BindlessParameters_PostProcessOutline[((int)((uint)(select(((uint)_48 < (uint)170000), _48, 0)) + 0u))]._outlineColorR);
    _77 = WaveReadLaneFirst(BindlessParameters_PostProcessOutline[((int)((uint)(select(((uint)_57 < (uint)170000), _57, 0)) + 0u))]._outlineColorB);
    _78 = WaveReadLaneFirst(BindlessParameters_PostProcessOutline[((int)((uint)(select(((uint)_66 < (uint)170000), _66, 0)) + 0u))]._outlineColorG);
  } else {
    _76 = 0.0f;
    _77 = 0.0f;
    _78 = 0.0f;
  }
  uint _79 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _86 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_79), 0));
    _92 = (float((uint)((uint)(_86.x & 127))) + 0.5f);
  } else {
    _92 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_76, _77, _78));
    _460 = output_color.x;
    _461 = output_color.y;
    _462 = output_color.z;
  } else {
    _460 = _76;
    _461 = _77;
    _462 = _78;
  }
  if (_etcParams.y > 1.0f) {
    float _473 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _474 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _478 = saturate(1.0f - (dot(float2(_473, _474), float2(_473, _474)) * saturate(_etcParams.y + -1.0f)));
    _483 = (_478 * _460);
    _484 = (_478 * _461);
    _485 = (_478 * _462);
  } else {
    _483 = _460;
    _484 = _461;
    _485 = _462;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _518 = select((_483 <= 0.0031308000907301903f), (_483 * 12.920000076293945f), (((pow(_483, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _519 = select((_484 <= 0.0031308000907301903f), (_484 * 12.920000076293945f), (((pow(_484, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _520 = select((_485 <= 0.0031308000907301903f), (_485 * 12.920000076293945f), (((pow(_485, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _518 = _483;
    _519 = _484;
    _520 = _485;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _525 = float((uint)_79);
    if (!(_525 < _viewDir.w)) {
      if (!(_525 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _534 = _518;
        _535 = _519;
        _536 = _520;
      } else {
        _534 = 0.0f;
        _535 = 0.0f;
        _536 = 0.0f;
      }
    } else {
      _534 = 0.0f;
      _535 = 0.0f;
      _536 = 0.0f;
    }
  } else {
    _534 = _518;
    _535 = _519;
    _536 = _520;
  }
  float _546 = exp2(log2(_534 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _547 = exp2(log2(_535 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _548 = exp2(log2(_536 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_546 * 18.6875f) + 1.0f)) * ((_546 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_547 * 18.6875f) + 1.0f)) * ((_547 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_548 * 18.6875f) + 1.0f)) * ((_548 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _92;
  return SV_Target;
}

