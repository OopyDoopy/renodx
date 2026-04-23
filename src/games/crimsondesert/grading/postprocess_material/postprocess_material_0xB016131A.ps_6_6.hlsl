#include "../tonemap.hlsli"

struct PostProcessOutlineExampleStruct {
  uint _outlineColor;
  float _outlineSize;
};


Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t44, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t38, space36);

Texture2D<uint> __3__36__0__0__g_CustomRenderPassValue : register(t65, space36);

Texture2D<float4> __3__36__0__0__g_CustomRenderPassDepth : register(t66, space36);

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

ConstantBuffer<PostProcessOutlineExampleStruct> BindlessParameters_PostProcessOutlineExample[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _20[36];
  float _264;
  float _265;
  float _266;
  float _280;
  float _526;
  float _527;
  float _528;
  float _648;
  float _649;
  float _650;
  float _671;
  float _672;
  float _673;
  float _706;
  float _707;
  float _708;
  float _722;
  float _723;
  float _724;
  if (_passIndex == 0) {
    int2 _28; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_28.x, _28.y);
    uint _43 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_28.x))))) + 0.5f) * TEXCOORD.x), int((float((int)(int(float((int)(_28.y))))) + 0.5f) * TEXCOORD.y), 0));
    float4 _54 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * TEXCOORD.x), int(_customRenderPassSizeInvSize.y * TEXCOORD.y), 0));
    bool _56 = ((_43.x & 255) == 30);
    float _58 = select(_56, _54.x, 0.0f);
    _264 = select(_56, 1.0f, 0.0f);
    _265 = _58;
    _266 = _58;
  } else {
    if (_passIndex == 1) {
      int _65 = WaveReadLaneFirst(_materialIndex);
      float4 _76 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
      float _79 = WaveReadLaneFirst(BindlessParameters_PostProcessOutlineExample[((int)((uint)(select(((uint)_65 < (uint)170000), _65, 0)) + 0u))]._outlineSize) * (1.0f / _destTargetSizAndInv.x);
      float _80 = _79 * 1.384615421295166f;
      float4 _82 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_80 + TEXCOORD.x), TEXCOORD.y));
      float4 _86 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _80), TEXCOORD.y));
      float _89 = _79 * 3.230769157409668f;
      float4 _91 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_89 + TEXCOORD.x), TEXCOORD.y));
      float4 _95 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _89), TEXCOORD.y));
      _264 = ((((_86.x + _82.x) * 0.31621623039245605f) + (_76.x * 0.227027028799057f)) + ((_95.x + _91.x) * 0.07027027010917664f));
      _265 = max(max(max(max(max(0.0f, _76.y), _82.y), _86.y), _91.y), _95.y);
      _266 = 0.0f;
    } else {
      if (_passIndex == 2) {
        int _116 = WaveReadLaneFirst(_materialIndex);
        float4 _127 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
        float _130 = WaveReadLaneFirst(BindlessParameters_PostProcessOutlineExample[((int)((uint)(select(((uint)_116 < (uint)170000), _116, 0)) + 0u))]._outlineSize) * (1.0f / _destTargetSizAndInv.y);
        float _131 = _130 * 1.384615421295166f;
        float4 _133 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (_131 + TEXCOORD.y)));
        float4 _137 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (TEXCOORD.y - _131)));
        float _140 = _130 * 3.230769157409668f;
        float4 _142 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (_140 + TEXCOORD.y)));
        float4 _146 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (TEXCOORD.y - _140)));
        _264 = ((((_137.x + _133.x) * 0.31621623039245605f) + (_127.x * 0.227027028799057f)) + ((_146.x + _142.x) * 0.07027027010917664f));
        _265 = max(max(max(max(max(0.0f, _127.y), _133.y), _137.y), _142.y), _146.y);
        _266 = 0.0f;
      } else {
        if (_passIndex == 3) {
          int _167 = WaveReadLaneFirst(_materialIndex);
          float4 _178 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
          float _181 = WaveReadLaneFirst(BindlessParameters_PostProcessOutlineExample[((int)((uint)(select(((uint)_167 < (uint)170000), _167, 0)) + 0u))]._outlineSize) * (1.0f / _destTargetSizAndInv.x);
          float _182 = _181 * 1.384615421295166f;
          float4 _184 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_182 + TEXCOORD.x), TEXCOORD.y));
          float4 _188 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _182), TEXCOORD.y));
          float _191 = _181 * 3.230769157409668f;
          float4 _193 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_191 + TEXCOORD.x), TEXCOORD.y));
          float4 _197 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _191), TEXCOORD.y));
          _264 = ((((_188.x + _184.x) * 0.31621623039245605f) + (_178.x * 0.227027028799057f)) + ((_197.x + _193.x) * 0.07027027010917664f));
          _265 = max(max(max(max(max(0.0f, _178.y), _184.y), _188.y), _193.y), _197.y);
          _266 = 0.0f;
        } else {
          if (_passIndex == 4) {
            int _218 = WaveReadLaneFirst(_materialIndex);
            float4 _229 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
            float _232 = WaveReadLaneFirst(BindlessParameters_PostProcessOutlineExample[((int)((uint)(select(((uint)_218 < (uint)170000), _218, 0)) + 0u))]._outlineSize) * (1.0f / _destTargetSizAndInv.y);
            float _233 = _232 * 1.384615421295166f;
            float4 _235 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (_233 + TEXCOORD.y)));
            float4 _239 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (TEXCOORD.y - _233)));
            float _242 = _232 * 3.230769157409668f;
            float4 _244 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (_242 + TEXCOORD.y)));
            float4 _248 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (TEXCOORD.y - _242)));
            _264 = ((((_239.x + _235.x) * 0.31621623039245605f) + (_229.x * 0.227027028799057f)) + ((_248.x + _244.x) * 0.07027027010917664f));
            _265 = max(max(max(max(max(0.0f, _229.y), _235.y), _239.y), _244.y), _248.y);
            _266 = 0.0f;
          } else {
            _264 = 0.0f;
            _265 = 0.0f;
            _266 = 0.0f;
          }
        }
      }
    }
  }
  uint _267 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _274 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_267), 0));
    _280 = (float((uint)((uint)(_274.x & 127))) + 0.5f);
  } else {
    _280 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_264, _265, _266));
    _648 = output_color.x;
    _649 = output_color.y;
    _650 = output_color.z;
  } else {
    _648 = _264;
    _649 = _265;
    _650 = _266;
  }
  if (_etcParams.y > 1.0f) {
    float _661 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _662 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _666 = saturate(1.0f - (dot(float2(_661, _662), float2(_661, _662)) * saturate(_etcParams.y + -1.0f)));
    _671 = (_666 * _648);
    _672 = (_666 * _649);
    _673 = (_666 * _650);
  } else {
    _671 = _648;
    _672 = _649;
    _673 = _650;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _706 = select((_671 <= 0.0031308000907301903f), (_671 * 12.920000076293945f), (((pow(_671, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _707 = select((_672 <= 0.0031308000907301903f), (_672 * 12.920000076293945f), (((pow(_672, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _708 = select((_673 <= 0.0031308000907301903f), (_673 * 12.920000076293945f), (((pow(_673, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _706 = _671;
    _707 = _672;
    _708 = _673;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _713 = float((uint)_267);
    if (!(_713 < _viewDir.w)) {
      if (!(_713 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _722 = _706;
        _723 = _707;
        _724 = _708;
      } else {
        _722 = 0.0f;
        _723 = 0.0f;
        _724 = 0.0f;
      }
    } else {
      _722 = 0.0f;
      _723 = 0.0f;
      _724 = 0.0f;
    }
  } else {
    _722 = _706;
    _723 = _707;
    _724 = _708;
  }
  SV_Target.x = _722;
  SV_Target.y = _723;
  SV_Target.z = _724;
  SV_Target.w = _280;
  return SV_Target;
}

