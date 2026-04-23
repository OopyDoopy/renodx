#include "../tonemap.hlsli"

struct PostProcessAbyssEnter_CDStruct {
  float _scanRadius;
  float _startFade;
  uint _noiseTex;
  uint _noiseTex2;
  uint _effectType;
  float _ppAbyssEnterRatio;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t44, space36);

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

ConstantBuffer<PostProcessAbyssEnter_CDStruct> BindlessParameters_PostProcessAbyssEnter_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _20[36];
  int _37 = WaveReadLaneFirst(_materialIndex);
  float _82;
  float _83;
  float _84;
  float _85;
  float _113;
  float _114;
  float _115;
  float _116;
  float _117;
  float _118;
  float _231;
  float _232;
  float _233;
  float _234;
  float _235;
  float _236;
  float _283;
  float _284;
  float _285;
  float _299;
  float _545;
  float _546;
  float _547;
  float _667;
  float _668;
  float _669;
  float _690;
  float _691;
  float _692;
  float _725;
  float _726;
  float _727;
  float _741;
  float _742;
  float _743;
  if (WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnter_CD[((int)((uint)(select(((uint)_37 < (uint)170000), _37, 0)) + 0u))]._effectType) == 0) {
    float _48 = 4.0f / (_srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y);
    int _57 = WaveReadLaneFirst(_materialIndex);
    int _65 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnter_CD[((int)((uint)(select(((uint)_57 < (uint)170000), _57, 0)) + 0u))]._noiseTex);
    float4 _72 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_65 < (uint)65000), _65, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((_48 * TEXCOORD.x) - (_time.x * 0.2199999988079071f)), ((_48 * TEXCOORD.y) - (_time.x * 0.18000000715255737f))));
    float _75 = _72.x + -0.30000001192092896f;
    float _77 = ((_72.x + -0.4000000059604645f) * 10.471975326538086f) + -1.5707963705062866f;
    float _78 = sin(_77);
    float _79 = cos(_77);
    float _80 = _75 * 0.029999999329447746f;
    _82 = _80;
    _83 = _80;
    _84 = 0.0f;
    _85 = -1.0f;
    while(true) {
      float4 _94 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - ((_82 * _78) * _85)), (TEXCOORD.y - ((_83 * _79) * _85))));
      float _97 = (_94.w * 0.20000000298023224f) + _84;
      float _101 = _85 + 0.20000000298023224f;
      if (!(!(_101 <= 1.0f))) {
        _82 = (_82 * 1.0099999904632568f);
        _83 = (_83 * 1.0099999904632568f);
        _84 = (_97 * 0.8999999761581421f);
        _85 = _101;
        continue;
      }
      float4 _106 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
      if ((_97 * 0.5400000214576721f) > 0.0f) {
        _113 = _80;
        _114 = _80;
        _115 = 0.0f;
        _116 = 0.0f;
        _117 = 0.0f;
        _118 = -1.0f;
        while(true) {
          float _123 = TEXCOORD.x - ((_113 * _78) * _118);
          float _124 = TEXCOORD.y - ((_114 * _79) * _118);
          float _125 = _123 + -0.5f;
          float _126 = _124 + -0.5f;
          float _135 = rsqrt(dot(float2(_125, _126), float2(_125, _126))) * ((_75 * 0.05999999865889549f) * sqrt((_125 * _125) + (_126 * _126)));
          float _136 = _135 * _125;
          float _138 = _135 * _126;
          float4 _144 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_123 - _136), (_124 - _138)));
          float4 _146 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_123, _124));
          float4 _148 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_136 + _123), (_138 + _124)));
          float _153 = (_144.x * 0.20000000298023224f) + _115;
          float _154 = (_146.y * 0.20000000298023224f) + _116;
          float _155 = (_148.z * 0.20000000298023224f) + _117;
          float _161 = _118 + 0.20000000298023224f;
          if (!(!(_161 <= 1.0f))) {
            _113 = (_113 * 1.0099999904632568f);
            _114 = (_114 * 1.0099999904632568f);
            _115 = (_153 * 0.8999999761581421f);
            _116 = (_154 * 0.8999999761581421f);
            _117 = (_155 * 0.8999999761581421f);
            _118 = _161;
            continue;
          }
          float _166 = 0.5400000214576721f / max(0.0010000000474974513f, _exposure0.x);
          int _173 = WaveReadLaneFirst(_materialIndex);
          float _182 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnter_CD[((int)((uint)(select(((uint)_173 < (uint)170000), _173, 0)) + 0u))]._ppAbyssEnterRatio) * saturate(_97 * 1.0800000429153442f);
          _283 = ((_182 * ((_153 * _166) - _106.x)) + _106.x);
          _284 = ((_182 * ((_154 * _166) - _106.y)) + _106.y);
          _285 = ((_182 * ((_155 * _166) - _106.z)) + _106.z);
          break;
        }
      } else {
        _283 = _106.x;
        _284 = _106.y;
        _285 = _106.z;
      }
      break;
    }
  } else {
    int _190 = WaveReadLaneFirst(_materialIndex);
    if (WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnter_CD[((int)((uint)(select(((uint)_190 < (uint)170000), _190, 0)) + 0u))]._effectType) == 1) {
      float4 _203 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
      float _205 = _203.w + -0.4000000059604645f;
      float _209 = float((uint)uint(_srcTargetSizeAndInv.x * TEXCOORD.x));
      float _210 = float((uint)uint(_srcTargetSizeAndInv.y * TEXCOORD.y));
      float _224 = min(max(((_205 * 6.6666669845581055f) + -1.0f), -1.0f), 1.0f);
      float _229 = (_205 * 0.020000001415610313f) + -0.003000000026077032f;
      _231 = _229;
      _232 = _229;
      _233 = 0.0f;
      _234 = 0.0f;
      _235 = 0.0f;
      _236 = -1.0f;
      while(true) {
        float _241 = TEXCOORD.x - ((_231 * ((frac(frac(dot(float2(_209, _210), float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f) + -0.5f) - (_224 * 8.742277657347586e-08f))) * _236);
        float _242 = TEXCOORD.y - ((_232 * ((frac(frac(dot(float2((_209 + 32.665000915527344f), (_210 + 11.8149995803833f)), float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f) + -0.5f) - _224)) * _236);
        float _243 = _241 + -0.5f;
        float _244 = _242 + -0.5f;
        float _253 = rsqrt(dot(float2(_243, _244), float2(_243, _244))) * (((_203.w + -0.30000001192092896f) * 0.0010000000474974513f) * sqrt((_243 * _243) + (_244 * _244)));
        float _254 = _253 * _243;
        float _256 = _253 * _244;
        float4 _262 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_241 - _254), (_242 - _256)));
        float4 _264 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_241, _242));
        float4 _266 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_254 + _241), (_256 + _242)));
        float _274 = ((_262.x * 0.20000000298023224f) + _233) * 0.5f;
        float _275 = ((_264.y * 0.20000000298023224f) + _234) * 0.5f;
        float _276 = ((_266.z * 0.20000000298023224f) + _235) * 0.5f;
        float _279 = _236 + 0.20000000298023224f;
        if (!(!(_279 <= 1.0f))) {
          _231 = (_231 * 0.20000000298023224f);
          _232 = (_232 * 0.20000000298023224f);
          _233 = _274;
          _234 = _275;
          _235 = _276;
          _236 = _279;
          continue;
        }
        _283 = _274;
        _284 = _275;
        _285 = _276;
        break;
      }
    } else {
      _283 = 0.0f;
      _284 = 0.0f;
      _285 = 0.0f;
    }
  }
  uint _286 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _293 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_286), 0));
    _299 = (float((uint)((uint)(_293.x & 127))) + 0.5f);
  } else {
    _299 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_283, _284, _285));
    _667 = output_color.x;
    _668 = output_color.y;
    _669 = output_color.z;
  } else {
    _667 = _283;
    _668 = _284;
    _669 = _285;
  }
  if (_etcParams.y > 1.0f) {
    float _680 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _681 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _685 = saturate(1.0f - (dot(float2(_680, _681), float2(_680, _681)) * saturate(_etcParams.y + -1.0f)));
    _690 = (_685 * _667);
    _691 = (_685 * _668);
    _692 = (_685 * _669);
  } else {
    _690 = _667;
    _691 = _668;
    _692 = _669;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _725 = select((_690 <= 0.0031308000907301903f), (_690 * 12.920000076293945f), (((pow(_690, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _726 = select((_691 <= 0.0031308000907301903f), (_691 * 12.920000076293945f), (((pow(_691, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _727 = select((_692 <= 0.0031308000907301903f), (_692 * 12.920000076293945f), (((pow(_692, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _725 = _690;
    _726 = _691;
    _727 = _692;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _732 = float((uint)_286);
    if (!(_732 < _viewDir.w)) {
      if (!(_732 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _741 = _725;
        _742 = _726;
        _743 = _727;
      } else {
        _741 = 0.0f;
        _742 = 0.0f;
        _743 = 0.0f;
      }
    } else {
      _741 = 0.0f;
      _742 = 0.0f;
      _743 = 0.0f;
    }
  } else {
    _741 = _725;
    _742 = _726;
    _743 = _727;
  }
  SV_Target.x = _741;
  SV_Target.y = _742;
  SV_Target.z = _743;
  SV_Target.w = _299;
  return SV_Target;
}

