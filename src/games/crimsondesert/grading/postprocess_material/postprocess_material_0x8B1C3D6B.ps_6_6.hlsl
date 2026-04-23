#include "../tonemap.hlsli"

struct PostProcessAbyssCommon_CDStruct {
  float _fogDepth;
  float _chromaticShiftValue;
  uint _noiseTex;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t44, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t33, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t75, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t38, space36);

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

cbuffer __3__1__0__0__PostProcessMaterialIndex : register(b2, space1) {
  int _materialIndex : packoffset(c000.x);
  int _passIndex : packoffset(c000.y);
};

ConstantBuffer<PostProcessAbyssCommon_CDStruct> BindlessParameters_PostProcessAbyssCommon_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _17[36];
  float _21 = (TEXCOORD.x * 2.0f) + -1.0f;
  float _22 = TEXCOORD.y * 2.0f;
  float _23 = 1.0f - _22;
  float _26 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _28 = max(1.0000000116860974e-07f, _26.x);
  float _64 = mad((_invViewProjRelative[3].z), _28, mad((_invViewProjRelative[3].y), _23, ((_invViewProjRelative[3].x) * _21))) + (_invViewProjRelative[3].w);
  float _68 = -0.0f - ((mad((_invViewProjRelative[0].z), _28, mad((_invViewProjRelative[0].y), _23, ((_invViewProjRelative[0].x) * _21))) + (_invViewProjRelative[0].w)) / _64);
  float _69 = -0.0f - ((mad((_invViewProjRelative[1].z), _28, mad((_invViewProjRelative[1].y), _23, ((_invViewProjRelative[1].x) * _21))) + (_invViewProjRelative[1].w)) / _64);
  float _70 = -0.0f - ((mad((_invViewProjRelative[2].z), _28, mad((_invViewProjRelative[2].y), _23, ((_invViewProjRelative[2].x) * _21))) + (_invViewProjRelative[2].w)) / _64);
  float _72 = rsqrt(dot(float3(_68, _69, _70), float3(_68, _69, _70)));
  float _73 = _72 * _68;
  float _74 = _72 * _69;
  float _75 = _72 * _70;
  int _76 = WaveReadLaneFirst(_materialIndex);
  int _84 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssCommon_CD[((int)((uint)(select(((uint)_76 < (uint)170000), _76, 0)) + 0u))]._noiseTex);
  float4 _91 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_84 < (uint)65000), _84, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_75, _73));
  int _98 = WaveReadLaneFirst(_materialIndex);
  int _106 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssCommon_CD[((int)((uint)(select(((uint)_98 < (uint)170000), _98, 0)) + 0u))]._noiseTex);
  float4 _113 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_106 < (uint)65000), _106, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_75, ((_time.x * 0.05000000074505806f) + _74)));
  int _122 = WaveReadLaneFirst(_materialIndex);
  int _130 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssCommon_CD[((int)((uint)(select(((uint)_122 < (uint)170000), _122, 0)) + 0u))]._noiseTex);
  float4 _137 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_130 < (uint)65000), _130, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_75 * 2.0f), ((_74 - (_time.x * 0.10000000149011612f)) * 2.0f)));
  float _140 = _137.x + _113.x;
  float _141 = _137.y + _113.y;
  int _146 = WaveReadLaneFirst(_materialIndex);
  int _154 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssCommon_CD[((int)((uint)(select(((uint)_146 < (uint)170000), _146, 0)) + 0u))]._noiseTex);
  float4 _161 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_154 < (uint)65000), _154, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((_time.x * 0.12999999523162842f) + _74), _73));
  int _170 = WaveReadLaneFirst(_materialIndex);
  int _178 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssCommon_CD[((int)((uint)(select(((uint)_170 < (uint)170000), _170, 0)) + 0u))]._noiseTex);
  float4 _185 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_178 < (uint)65000), _178, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((((_time.x * 0.10000000149011612f) + _74) * 2.0f), (_73 * 2.0f)));
  float _191 = abs(dot(float3(_73, _74, _75), float3(0.0f, 1.0f, 0.0f)));
  float _193 = abs(dot(float3(_73, _74, _75), float3(0.0f, 0.0f, 1.0f)));
  float _198 = (_191 * (_91.x - _140)) + _140;
  float _199 = (_191 * (_91.y - _141)) + _141;
  float _204 = (((_185.x + _161.x) - _198) * _193) + _198;
  float _205 = (((_185.y + _161.y) - _199) * _193) + _199;
  float _207 = saturate(_26.x * 35.0f);
  int _214 = WaveReadLaneFirst(_materialIndex);
  int _222 = WaveReadLaneFirst(BindlessParameters_PostProcessAbyssCommon_CD[((int)((uint)(select(((uint)_214 < (uint)170000), _214, 0)) + 0u))]._noiseTex);
  float4 _229 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_222 < (uint)65000), _222, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((TEXCOORD.x - (_time.x * 0.009999999776482582f)), ((_time.x * 0.10000000149011612f) + TEXCOORD.y)));
  float _236 = ((_229.x - _204) * _207) + _204;
  float4 _246 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(((TEXCOORD.x + -0.0019921569619327784f) + (_236 * 0.004000000189989805f)), ((TEXCOORD.y + -0.0019921569619327784f) + ((lerp(_205, _229.y, _207)) * 0.004000000189989805f))));
  float _259 = float((int)(int((_bufferSizeAndInvSize.x + -1.0f) * saturate(TEXCOORD.x))));
  float _260 = float((int)(int((_bufferSizeAndInvSize.y + -1.0f) * saturate(TEXCOORD.y))));
  float4 _269 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_259 * _customRenderPassSizeInvSize.x), int(_260 * _customRenderPassSizeInvSize.y), 0));
  float _298 = mad((_projToPrevProj[3].z), _269.x, mad((_projToPrevProj[3].y), _23, ((_projToPrevProj[3].x) * _21))) + (_projToPrevProj[3].w);
  float _313 = _236 + -0.4000000059604645f;
  float _317 = min(max(((_313 * 6.6666669845581055f) + -1.0f), -1.0f), 1.0f);
  float _320 = (_313 * 0.020000001415610313f) + -0.003000000026077032f;
  float _330;
  float _331;
  float _332;
  float _333;
  float _334;
  int _335;
  float _389;
  float _635;
  float _636;
  float _637;
  float _757;
  float _758;
  float _759;
  float _777;
  float _778;
  float _779;
  float _812;
  float _813;
  float _814;
  float _828;
  float _829;
  float _830;
  _330 = _320;
  _331 = _320;
  _332 = 0.0f;
  _333 = 0.0f;
  _334 = 0.0f;
  _335 = 1;
  while(true) {
    float _336 = float((int)(_335));
    float4 _345 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - ((_330 * (((((((mad((_projToPrevProj[0].z), _269.x, mad((_projToPrevProj[0].y), _23, ((_projToPrevProj[0].x) * _21))) + (_projToPrevProj[0].w)) / _298) - _21) * 2.5f) + -0.5f) + frac(frac(dot(float2(_259, _260), float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f)) - (_317 * 8.742277657347586e-08f))) * _336)), (TEXCOORD.y - ((_331 * (((((((mad((_projToPrevProj[1].z), _269.x, mad((_projToPrevProj[1].y), _23, ((_projToPrevProj[1].x) * _21))) + (_projToPrevProj[1].w)) / _298) - _23) * 2.5f) + -0.5f) + frac(frac(dot(float2((_259 + 32.665000915527344f), (_260 + 11.8149995803833f)), float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f)) - _317)) * _336))));
    float _352 = (_345.x * 0.125f) + _332;
    float _353 = (_345.y * 0.125f) + _333;
    float _354 = (_345.z * 0.125f) + _334;
    bool __defer_329_827 = false;
    if (!((_335 + 1) == 8)) {
      _330 = (_330 * 0.8999999761581421f);
      _331 = (_331 * 0.8999999761581421f);
      _332 = _352;
      _333 = _353;
      _334 = _354;
      _335 = (_335 + 1);
      continue;
    }
    if (__defer_329_827) {
      SV_Target.x = _828;
      SV_Target.y = _829;
      SV_Target.z = _830;
      SV_Target.w = _389;
    }
    float _366 = dot(float3(_246.x, _246.y, _246.z), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f)) * 0.30000001192092896f;
    float _373 = ((_366 - _352) * 0.20000000298023224f) + _352;
    float _374 = ((_366 - _353) * 0.20000000298023224f) + _353;
    float _375 = ((_366 - _354) * 0.20000000298023224f) + _354;
    uint _376 = uint(SV_Position.y);
    if (_etcParams.y == 1.0f) {
      uint2 _383 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_376), 0));
      _389 = (float((uint)((uint)(_383.x & 127))) + 0.5f);
    } else {
      _389 = 0.0f;
    }
    if (_localToneMappingParams.w > 0.0f) {
      float3 output_color = TonemapReplacer(float3(_373, _374, _375));
      _757 = output_color.x;
      _758 = output_color.y;
      _759 = output_color.z;
    } else {
      _757 = _373;
      _758 = _374;
      _759 = _375;
    }
    if (_etcParams.y > 1.0f) {
      float _767 = abs(_21);
      float _768 = abs(_22 + -1.0f);
      float _772 = saturate(1.0f - (dot(float2(_767, _768), float2(_767, _768)) * saturate(_etcParams.y + -1.0f)));
      _777 = (_772 * _757);
      _778 = (_772 * _758);
      _779 = (_772 * _759);
    } else {
      _777 = _757;
      _778 = _758;
      _779 = _759;
    }
    if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
      _812 = select((_777 <= 0.0031308000907301903f), (_777 * 12.920000076293945f), (((pow(_777, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
      _813 = select((_778 <= 0.0031308000907301903f), (_778 * 12.920000076293945f), (((pow(_778, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
      _814 = select((_779 <= 0.0031308000907301903f), (_779 * 12.920000076293945f), (((pow(_779, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    } else {
      _812 = _777;
      _813 = _778;
      _814 = _779;
    }
    if (!(!(_etcParams.y >= 1.0f))) {
      float _819 = float((uint)_376);
      if (!(_819 < _viewDir.w)) {
        if (!(_819 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
          _828 = _812;
          _829 = _813;
          _830 = _814;
        } else {
          _828 = 0.0f;
          _829 = 0.0f;
          _830 = 0.0f;
        }
      } else {
        _828 = 0.0f;
        _829 = 0.0f;
        _830 = 0.0f;
      }
    } else {
      _828 = _812;
      _829 = _813;
      _830 = _814;
    }
    SV_Target.x = _828;
    SV_Target.y = _829;
    SV_Target.z = _830;
    SV_Target.w = _389;
    break;
  }
  return SV_Target;
}

