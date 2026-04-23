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
  float _149;
  float _150;
  float _151;
  float _152;
  float _153;
  float _154;
  float _267;
  float _268;
  float _269;
  float _270;
  float _271;
  float _272;
  float _319;
  float _320;
  float _321;
  float _335;
  float _581;
  float _582;
  float _583;
  float _703;
  float _704;
  float _705;
  float _726;
  float _727;
  float _728;
  float _761;
  float _762;
  float _763;
  float _777;
  float _778;
  float _779;
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
      float _116 = (pow(_106.x, 0.012683313339948654f));
      float _117 = (pow(_106.y, 0.012683313339948654f));
      float _118 = (pow(_106.z, 0.012683313339948654f));
      float _143 = exp2(log2(max(0.0f, (_116 + -0.8359375f)) / (18.8515625f - (_116 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
      float _144 = exp2(log2(max(0.0f, (_117 + -0.8359375f)) / (18.8515625f - (_117 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
      float _145 = exp2(log2(max(0.0f, (_118 + -0.8359375f)) / (18.8515625f - (_118 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
      if ((_97 * 0.5400000214576721f) > 0.0f) {
        _149 = _80;
        _150 = _80;
        _151 = 0.0f;
        _152 = 0.0f;
        _153 = 0.0f;
        _154 = -1.0f;
        while(true) {
          float _159 = TEXCOORD.x - ((_149 * _78) * _154);
          float _160 = TEXCOORD.y - ((_150 * _79) * _154);
          float _161 = _159 + -0.5f;
          float _162 = _160 + -0.5f;
          float _171 = rsqrt(dot(float2(_161, _162), float2(_161, _162))) * ((_75 * 0.05999999865889549f) * sqrt((_161 * _161) + (_162 * _162)));
          float _172 = _171 * _161;
          float _174 = _171 * _162;
          float4 _180 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_159 - _172), (_160 - _174)));
          float4 _182 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_159, _160));
          float4 _184 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_172 + _159), (_174 + _160)));
          float _189 = (_180.x * 0.20000000298023224f) + _151;
          float _190 = (_182.y * 0.20000000298023224f) + _152;
          float _191 = (_184.z * 0.20000000298023224f) + _153;
          float _197 = _154 + 0.20000000298023224f;
          if (!(!(_197 <= 1.0f))) {
            _149 = (_149 * 1.0099999904632568f);
            _150 = (_150 * 1.0099999904632568f);
            _151 = (_189 * 0.8999999761581421f);
            _152 = (_190 * 0.8999999761581421f);
            _153 = (_191 * 0.8999999761581421f);
            _154 = _197;
            continue;
          }
          float _202 = 0.5400000214576721f / max(0.0010000000474974513f, _exposure0.x);
          int _209 = WaveReadLaneFirst(_materialIndex);
          float _218 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnter_CD[((int)((uint)(select(((uint)_209 < (uint)170000), _209, 0)) + 0u))]._ppAbyssEnterRatio) * saturate(_97 * 1.0800000429153442f);
          _319 = ((_218 * ((_189 * _202) - _143)) + _143);
          _320 = ((_218 * ((_190 * _202) - _144)) + _144);
          _321 = ((_218 * ((_191 * _202) - _145)) + _145);
          break;
        }
      } else {
        _319 = _143;
        _320 = _144;
        _321 = _145;
      }
      break;
    }
  } else {
    int _226 = WaveReadLaneFirst(_materialIndex);
    if (WaveReadLaneFirst(BindlessParameters_PostProcessAbyssEnter_CD[((int)((uint)(select(((uint)_226 < (uint)170000), _226, 0)) + 0u))]._effectType) == 1) {
      float4 _239 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2(TEXCOORD.x, TEXCOORD.y));
      float _241 = _239.w + -0.4000000059604645f;
      float _245 = float((uint)uint(_srcTargetSizeAndInv.x * TEXCOORD.x));
      float _246 = float((uint)uint(_srcTargetSizeAndInv.y * TEXCOORD.y));
      float _260 = min(max(((_241 * 6.6666669845581055f) + -1.0f), -1.0f), 1.0f);
      float _265 = (_241 * 0.020000001415610313f) + -0.003000000026077032f;
      _267 = _265;
      _268 = _265;
      _269 = 0.0f;
      _270 = 0.0f;
      _271 = 0.0f;
      _272 = -1.0f;
      while(true) {
        float _277 = TEXCOORD.x - ((_267 * ((frac(frac(dot(float2(_245, _246), float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f) + -0.5f) - (_260 * 8.742277657347586e-08f))) * _272);
        float _278 = TEXCOORD.y - ((_268 * ((frac(frac(dot(float2((_245 + 32.665000915527344f), (_246 + 11.8149995803833f)), float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f) + -0.5f) - _260)) * _272);
        float _279 = _277 + -0.5f;
        float _280 = _278 + -0.5f;
        float _289 = rsqrt(dot(float2(_279, _280), float2(_279, _280))) * (((_239.w + -0.30000001192092896f) * 0.0010000000474974513f) * sqrt((_279 * _279) + (_280 * _280)));
        float _290 = _289 * _279;
        float _292 = _289 * _280;
        float4 _298 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_277 - _290), (_278 - _292)));
        float4 _300 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(_277, _278));
        float4 _302 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_290 + _277), (_292 + _278)));
        float _310 = ((_298.x * 0.20000000298023224f) + _269) * 0.5f;
        float _311 = ((_300.y * 0.20000000298023224f) + _270) * 0.5f;
        float _312 = ((_302.z * 0.20000000298023224f) + _271) * 0.5f;
        float _315 = _272 + 0.20000000298023224f;
        if (!(!(_315 <= 1.0f))) {
          _267 = (_267 * 0.20000000298023224f);
          _268 = (_268 * 0.20000000298023224f);
          _269 = _310;
          _270 = _311;
          _271 = _312;
          _272 = _315;
          continue;
        }
        _319 = _310;
        _320 = _311;
        _321 = _312;
        break;
      }
    } else {
      _319 = 0.0f;
      _320 = 0.0f;
      _321 = 0.0f;
    }
  }
  uint _322 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _329 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_322), 0));
    _335 = (float((uint)((uint)(_329.x & 127))) + 0.5f);
  } else {
    _335 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_319, _320, _321));
    _703 = output_color.x;
    _704 = output_color.y;
    _705 = output_color.z;
  } else {
    _703 = _319;
    _704 = _320;
    _705 = _321;
  }
  if (_etcParams.y > 1.0f) {
    float _716 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _717 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _721 = saturate(1.0f - (dot(float2(_716, _717), float2(_716, _717)) * saturate(_etcParams.y + -1.0f)));
    _726 = (_721 * _703);
    _727 = (_721 * _704);
    _728 = (_721 * _705);
  } else {
    _726 = _703;
    _727 = _704;
    _728 = _705;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _761 = select((_726 <= 0.0031308000907301903f), (_726 * 12.920000076293945f), (((pow(_726, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _762 = select((_727 <= 0.0031308000907301903f), (_727 * 12.920000076293945f), (((pow(_727, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _763 = select((_728 <= 0.0031308000907301903f), (_728 * 12.920000076293945f), (((pow(_728, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _761 = _726;
    _762 = _727;
    _763 = _728;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _768 = float((uint)_322);
    if (!(_768 < _viewDir.w)) {
      if (!(_768 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _777 = _761;
        _778 = _762;
        _779 = _763;
      } else {
        _777 = 0.0f;
        _778 = 0.0f;
        _779 = 0.0f;
      }
    } else {
      _777 = 0.0f;
      _778 = 0.0f;
      _779 = 0.0f;
    }
  } else {
    _777 = _761;
    _778 = _762;
    _779 = _763;
  }
  float _789 = exp2(log2(_777 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _790 = exp2(log2(_778 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _791 = exp2(log2(_779 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_789 * 18.6875f) + 1.0f)) * ((_789 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_790 * 18.6875f) + 1.0f)) * ((_790 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_791 * 18.6875f) + 1.0f)) * ((_791 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _335;
  return SV_Target;
}

