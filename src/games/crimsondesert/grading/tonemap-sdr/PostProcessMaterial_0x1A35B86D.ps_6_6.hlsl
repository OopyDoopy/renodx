struct PostProcessOutlineExampleStruct {
  uint _outlineColor;
  float _outlineSize;
};


Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t69, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t33, space36);

Texture2D<uint> __3__36__0__0__g_CustomRenderPassValue : register(t79, space36);

Texture2D<float4> __3__36__0__0__g_CustomRenderPassDepth : register(t80, space36);

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

cbuffer __3__1__0__0__PostProcessSizeConstant : register(b1, space1) {
  float4 _srcTargetSizeAndInv : packoffset(c000.x);
  float4 _destTargetSizAndInv : packoffset(c001.x);
};

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

ConstantBuffer<PostProcessOutlineExampleStruct> BindlessParameters_PostProcessOutlineExample[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _265;
  float _266;
  float _267;
  float _281;
  float _486;
  float _487;
  float _488;
  float _581;
  float _582;
  float _583;
  float _637;
  float _638;
  float _639;
  float _658;
  float _659;
  float _660;
  float _690;
  float _691;
  float _692;
  float _706;
  float _707;
  float _708;
  if (_passIndex == 0) {
    int2 _29; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_29.x, _29.y);
    uint _44 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_29.x))))) + 0.5f) * TEXCOORD.x), int((float((int)(int(float((int)(_29.y))))) + 0.5f) * TEXCOORD.y), 0));
    float4 _55 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * TEXCOORD.x), int(_customRenderPassSizeInvSize.y * TEXCOORD.y), 0));
    bool _57 = ((_44.x & 255) == 30);
    float _59 = select(_57, _55.x, 0.0f);
    _265 = select(_57, 1.0f, 0.0f);
    _266 = _59;
    _267 = _59;
  } else {
    if (_passIndex == 1) {
      int _66 = WaveReadLaneFirst(_materialIndex);
      float4 _77 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
      float _80 = WaveReadLaneFirst(BindlessParameters_PostProcessOutlineExample[((int)((uint)(select(((uint)_66 < (uint)170000), _66, 0)) + 0u))]._outlineSize) * (1.0f / _destTargetSizAndInv.x);
      float _81 = _80 * 1.384615421295166f;
      float4 _83 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_81 + TEXCOORD.x), TEXCOORD.y));
      float4 _87 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _81), TEXCOORD.y));
      float _90 = _80 * 3.230769157409668f;
      float4 _92 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_90 + TEXCOORD.x), TEXCOORD.y));
      float4 _96 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _90), TEXCOORD.y));
      _265 = ((((_87.x + _83.x) * 0.31621623039245605f) + (_77.x * 0.227027028799057f)) + ((_96.x + _92.x) * 0.07027027010917664f));
      _266 = max(max(max(max(max(0.0f, _77.y), _83.y), _87.y), _92.y), _96.y);
      _267 = 0.0f;
    } else {
      if (_passIndex == 2) {
        int _117 = WaveReadLaneFirst(_materialIndex);
        float4 _128 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
        float _131 = WaveReadLaneFirst(BindlessParameters_PostProcessOutlineExample[((int)((uint)(select(((uint)_117 < (uint)170000), _117, 0)) + 0u))]._outlineSize) * (1.0f / _destTargetSizAndInv.y);
        float _132 = _131 * 1.384615421295166f;
        float4 _134 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (_132 + TEXCOORD.y)));
        float4 _138 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (TEXCOORD.y - _132)));
        float _141 = _131 * 3.230769157409668f;
        float4 _143 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (_141 + TEXCOORD.y)));
        float4 _147 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (TEXCOORD.y - _141)));
        _265 = ((((_138.x + _134.x) * 0.31621623039245605f) + (_128.x * 0.227027028799057f)) + ((_147.x + _143.x) * 0.07027027010917664f));
        _266 = max(max(max(max(max(0.0f, _128.y), _134.y), _138.y), _143.y), _147.y);
        _267 = 0.0f;
      } else {
        if (_passIndex == 3) {
          int _168 = WaveReadLaneFirst(_materialIndex);
          float4 _179 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
          float _182 = WaveReadLaneFirst(BindlessParameters_PostProcessOutlineExample[((int)((uint)(select(((uint)_168 < (uint)170000), _168, 0)) + 0u))]._outlineSize) * (1.0f / _destTargetSizAndInv.x);
          float _183 = _182 * 1.384615421295166f;
          float4 _185 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_183 + TEXCOORD.x), TEXCOORD.y));
          float4 _189 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _183), TEXCOORD.y));
          float _192 = _182 * 3.230769157409668f;
          float4 _194 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_192 + TEXCOORD.x), TEXCOORD.y));
          float4 _198 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _192), TEXCOORD.y));
          _265 = ((((_189.x + _185.x) * 0.31621623039245605f) + (_179.x * 0.227027028799057f)) + ((_198.x + _194.x) * 0.07027027010917664f));
          _266 = max(max(max(max(max(0.0f, _179.y), _185.y), _189.y), _194.y), _198.y);
          _267 = 0.0f;
        } else {
          if (_passIndex == 4) {
            int _219 = WaveReadLaneFirst(_materialIndex);
            float4 _230 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
            float _233 = WaveReadLaneFirst(BindlessParameters_PostProcessOutlineExample[((int)((uint)(select(((uint)_219 < (uint)170000), _219, 0)) + 0u))]._outlineSize) * (1.0f / _destTargetSizAndInv.y);
            float _234 = _233 * 1.384615421295166f;
            float4 _236 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (_234 + TEXCOORD.y)));
            float4 _240 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (TEXCOORD.y - _234)));
            float _243 = _233 * 3.230769157409668f;
            float4 _245 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (_243 + TEXCOORD.y)));
            float4 _249 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (TEXCOORD.y - _243)));
            _265 = ((((_240.x + _236.x) * 0.31621623039245605f) + (_230.x * 0.227027028799057f)) + ((_249.x + _245.x) * 0.07027027010917664f));
            _266 = max(max(max(max(max(0.0f, _230.y), _236.y), _240.y), _245.y), _249.y);
            _267 = 0.0f;
          } else {
            _265 = 0.0f;
            _266 = 0.0f;
            _267 = 0.0f;
          }
        }
      }
    }
  }
  uint _268 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _275 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_268), 0));
    _281 = (float((uint)((uint)(_275.x & 127))) + 0.5f);
  } else {
    _281 = 1.0f;
  }
  bool _284 = (_localToneMappingParams.w > 0.0f);
  if (_284) {
    float3 output_color = TonemapReplacer(float3(_265, _266, _267));
    _637 = output_color.x;
    _638 = output_color.y;
    _639 = output_color.z;
  } else {
    _637 = _265;
    _638 = _266;
    _639 = _267;
  }
  if (_etcParams.y > 1.0f) {
    float _648 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _649 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _653 = saturate(1.0f - (dot(float2(_648, _649), float2(_648, _649)) * saturate(_etcParams.y + -1.0f)));
    _658 = (_653 * _637);
    _659 = (_653 * _638);
    _660 = (_653 * _639);
  } else {
    _658 = _637;
    _659 = _638;
    _660 = _639;
  }
  if ((_284) && ((_etcParams.z > 0.0f))) {
    _690 = select((_658 <= 0.0031308000907301903f), (_658 * 12.920000076293945f), (((pow(_658, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _691 = select((_659 <= 0.0031308000907301903f), (_659 * 12.920000076293945f), (((pow(_659, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _692 = select((_660 <= 0.0031308000907301903f), (_660 * 12.920000076293945f), (((pow(_660, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _690 = _658;
    _691 = _659;
    _692 = _660;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _697 = float((uint)_268);
    if (!(_697 < _viewDir.w)) {
      if (!(_697 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _706 = _690;
        _707 = _691;
        _708 = _692;
      } else {
        _706 = 0.0f;
        _707 = 0.0f;
        _708 = 0.0f;
      }
    } else {
      _706 = 0.0f;
      _707 = 0.0f;
      _708 = 0.0f;
    }
  } else {
    _706 = _690;
    _707 = _691;
    _708 = _692;
  }
  SV_Target.x = _706;
  SV_Target.y = _707;
  SV_Target.z = _708;
  SV_Target.w = _281;
  return SV_Target;
}