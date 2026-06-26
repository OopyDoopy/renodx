struct PostProcessAbyssEnter_CDStruct {
  float _scanRadius;
  float _startFade;
  uint _noiseTex;
  uint _noiseTex2;
  uint _effectType;
  float _ppAbyssEnterRatio;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t69, space36);

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

ConstantBuffer<PostProcessAbyssEnter_CDStruct> BindlessParameters_PostProcessAbyssEnter_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  int _38 = WaveReadLaneFirst(_materialIndex);
  float _83;
  float _84;
  float _85;
  float _86;
  float _114;
  float _115;
  float _116;
  float _117;
  float _118;
  float _119;
  float _232;
  float _233;
  float _234;
  float _235;
  float _236;
  float _237;
  float _284;
  float _285;
  float _286;
  float _300;
  float _505;
  float _506;
  float _507;
  float _600;
  float _601;
  float _602;
  float _656;
  float _657;
  float _658;
  float _677;
  float _678;
  float _679;
  float _709;
  float _710;
  float _711;
  float _725;
  float _726;
  float _727;
  if (WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnter_CD[((int)((uint)(select(((uint)_38 < (uint)170000), _38, 0)) + 0u))]._effectType) == 0) {
    float _49 = 4.0f / (_srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y);
    int _58 = WaveReadLaneFirst(_materialIndex);
    int _66 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnter_CD[((int)((uint)(select(((uint)_58 < (uint)170000), _58, 0)) + 0u))]._noiseTex);
    float4 _73 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_66 < (uint)65000), _66, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((_49 * TEXCOORD.x) - (_time.x * 0.2199999988079071f)), ((_49 * TEXCOORD.y) - (_time.x * 0.18000000715255737f))));
    float _76 = _73.x + -0.30000001192092896f;
    float _78 = ((_73.x + -0.4000000059604645f) * 10.471975326538086f) + -1.5707963705062866f;
    float _79 = sin(_78);
    float _80 = cos(_78);
    float _81 = _76 * 0.029999999329447746f;
    _83 = _81;
    _84 = _81;
    _85 = 0.0f;
    _86 = -1.0f;
    while(true) {
      float4 _95 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - ((_83 * _79) * _86)), (TEXCOORD.y - ((_84 * _80) * _86))));
      float _98 = (_95.w * 0.20000000298023224f) + _85;
      float _102 = _86 + 0.20000000298023224f;
      if (!(!(_102 <= 1.0f))) {
        _83 = (_83 * 1.0099999904632568f);
        _84 = (_84 * 1.0099999904632568f);
        _85 = (_98 * 0.8999999761581421f);
        _86 = _102;
        continue;
      }
      float4 _107 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
      if ((_98 * 0.5400000214576721f) > 0.0f) {
        _114 = _81;
        _115 = _81;
        _116 = 0.0f;
        _117 = 0.0f;
        _118 = 0.0f;
        _119 = -1.0f;
        while(true) {
          float _124 = TEXCOORD.x - ((_114 * _79) * _119);
          float _125 = TEXCOORD.y - ((_115 * _80) * _119);
          float _126 = _124 + -0.5f;
          float _127 = _125 + -0.5f;
          float _136 = rsqrt(dot(float2(_126, _127), float2(_126, _127))) * ((_76 * 0.05999999865889549f) * sqrt((_126 * _126) + (_127 * _127)));
          float _137 = _136 * _126;
          float _139 = _136 * _127;
          float4 _145 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_124 - _137), (_125 - _139)));
          float4 _147 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_124, _125));
          float4 _149 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_137 + _124), (_139 + _125)));
          float _154 = (_145.x * 0.20000000298023224f) + _116;
          float _155 = (_147.y * 0.20000000298023224f) + _117;
          float _156 = (_149.z * 0.20000000298023224f) + _118;
          float _162 = _119 + 0.20000000298023224f;
          if (!(!(_162 <= 1.0f))) {
            _114 = (_114 * 1.0099999904632568f);
            _115 = (_115 * 1.0099999904632568f);
            _116 = (_154 * 0.8999999761581421f);
            _117 = (_155 * 0.8999999761581421f);
            _118 = (_156 * 0.8999999761581421f);
            _119 = _162;
            continue;
          }
          float _167 = 0.5400000214576721f / max(0.0010000000474974513f, _exposure0.x);
          int _174 = WaveReadLaneFirst(_materialIndex);
          float _183 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnter_CD[((int)((uint)(select(((uint)_174 < (uint)170000), _174, 0)) + 0u))]._ppAbyssEnterRatio) * saturate(_98 * 1.0800000429153442f);
          _284 = ((_183 * ((_154 * _167) - _107.x)) + _107.x);
          _285 = ((_183 * ((_155 * _167) - _107.y)) + _107.y);
          _286 = ((_183 * ((_156 * _167) - _107.z)) + _107.z);
          break;
        }
      } else {
        _284 = _107.x;
        _285 = _107.y;
        _286 = _107.z;
      }
      break;
    }
  } else {
    int _191 = WaveReadLaneFirst(_materialIndex);
    if (WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnter_CD[((int)((uint)(select(((uint)_191 < (uint)170000), _191, 0)) + 0u))]._effectType) == 1) {
      float4 _204 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
      float _206 = _204.w + -0.4000000059604645f;
      float _210 = float((uint)uint(_srcTargetSizeAndInv.x * TEXCOORD.x));
      float _211 = float((uint)uint(_srcTargetSizeAndInv.y * TEXCOORD.y));
      float _225 = min(max(((_206 * 6.6666669845581055f) + -1.0f), -1.0f), 1.0f);
      float _230 = (_206 * 0.020000001415610313f) + -0.003000000026077032f;
      _232 = _230;
      _233 = _230;
      _234 = 0.0f;
      _235 = 0.0f;
      _236 = 0.0f;
      _237 = -1.0f;
      while(true) {
        float _242 = TEXCOORD.x - ((_232 * ((frac(frac(dot(float2(_210, _211), float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f) + -0.5f) - (_225 * 8.742277657347586e-08f))) * _237);
        float _243 = TEXCOORD.y - ((_233 * ((frac(frac(dot(float2((_210 + 32.665000915527344f), (_211 + 11.8149995803833f)), float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f) + -0.5f) - _225)) * _237);
        float _244 = _242 + -0.5f;
        float _245 = _243 + -0.5f;
        float _254 = rsqrt(dot(float2(_244, _245), float2(_244, _245))) * (((_204.w + -0.30000001192092896f) * 0.0010000000474974513f) * sqrt((_244 * _244) + (_245 * _245)));
        float _255 = _254 * _244;
        float _257 = _254 * _245;
        float4 _263 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_242 - _255), (_243 - _257)));
        float4 _265 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_242, _243));
        float4 _267 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_255 + _242), (_257 + _243)));
        float _275 = ((_263.x * 0.20000000298023224f) + _234) * 0.5f;
        float _276 = ((_265.y * 0.20000000298023224f) + _235) * 0.5f;
        float _277 = ((_267.z * 0.20000000298023224f) + _236) * 0.5f;
        float _280 = _237 + 0.20000000298023224f;
        if (!(!(_280 <= 1.0f))) {
          _232 = (_232 * 0.20000000298023224f);
          _233 = (_233 * 0.20000000298023224f);
          _234 = _275;
          _235 = _276;
          _236 = _277;
          _237 = _280;
          continue;
        }
        _284 = _275;
        _285 = _276;
        _286 = _277;
        break;
      }
    } else {
      _284 = 0.0f;
      _285 = 0.0f;
      _286 = 0.0f;
    }
  }
  uint _287 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _294 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_287), 0));
    _300 = (float((uint)((uint)(_294.x & 127))) + 0.5f);
  } else {
    _300 = 1.0f;
  }
  bool _303 = (_localToneMappingParams.w > 0.0f);
  if (_303) {
    float3 output_color = TonemapReplacer(float3(_284, _285, _286));
    _656 = output_color.x;
    _657 = output_color.y;
    _658 = output_color.z;
  } else {
    _656 = _284;
    _657 = _285;
    _658 = _286;
  }
  if (_etcParams.y > 1.0f) {
    float _667 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _668 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _672 = saturate(1.0f - (dot(float2(_667, _668), float2(_667, _668)) * saturate(_etcParams.y + -1.0f)));
    _677 = (_672 * _656);
    _678 = (_672 * _657);
    _679 = (_672 * _658);
  } else {
    _677 = _656;
    _678 = _657;
    _679 = _658;
  }
  if ((_303) && ((_etcParams.z > 0.0f))) {
    _709 = select((_677 <= 0.0031308000907301903f), (_677 * 12.920000076293945f), (((pow(_677, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _710 = select((_678 <= 0.0031308000907301903f), (_678 * 12.920000076293945f), (((pow(_678, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _711 = select((_679 <= 0.0031308000907301903f), (_679 * 12.920000076293945f), (((pow(_679, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _709 = _677;
    _710 = _678;
    _711 = _679;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _716 = float((uint)_287);
    if (!(_716 < _viewDir.w)) {
      if (!(_716 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _725 = _709;
        _726 = _710;
        _727 = _711;
      } else {
        _725 = 0.0f;
        _726 = 0.0f;
        _727 = 0.0f;
      }
    } else {
      _725 = 0.0f;
      _726 = 0.0f;
      _727 = 0.0f;
    }
  } else {
    _725 = _709;
    _726 = _710;
    _727 = _711;
  }
  SV_Target.x = _725;
  SV_Target.y = _726;
  SV_Target.z = _727;
  SV_Target.w = _300;
  return SV_Target;
}