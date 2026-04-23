#include "../tonemap.hlsli"

struct PostProcessSubspace_CDStruct {
  float _subspaceRatio;
  float4 _subspaceInfo;
  uint _subspaceTex;
  float _subspaceColorBlendRatio;
  uint _subspaceColor;
  uint _subspaceBlendColor;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t33, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t75, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t38, space36);

Texture2D<float4> __3__36__0__0__g_specularAO : register(t63, space36);

Texture2D<uint4> __3__36__0__0__g_gbufferBaseColor : register(t77, space36);

Texture2D<float4> __3__36__0__0__g_gbufferNormal : register(t64, space36);

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

ConstantBuffer<PostProcessSubspace_CDStruct> BindlessParameters_PostProcessSubspace_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _23[36];
  float _29 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  float4 _32 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _36 = TEXCOORD.x * 2.0f;
  float _38 = TEXCOORD.y * 2.0f;
  int _43 = WaveReadLaneFirst(_materialIndex);
  int _51 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_43 < (uint)170000), _43, 0)) + 0u))]._subspaceTex);
  float4 _58 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_51 < (uint)65000), _51, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_29 * _36), ((_time.x * 0.10000000149011612f) + _38)));
  int _62 = WaveReadLaneFirst(_materialIndex);
  float _73 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_62 < (uint)170000), _62, 0)) + 0u))]._subspaceInfo.x);
  float _74 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_62 < (uint)170000), _62, 0)) + 0u))]._subspaceInfo.y);
  float _75 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_62 < (uint)170000), _62, 0)) + 0u))]._subspaceInfo.z);
  int _77 = WaveReadLaneFirst(_materialIndex);
  int _92 = WaveReadLaneFirst(_materialIndex);
  float _101 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_92 < (uint)170000), _92, 0)) + 0u))]._subspaceRatio) * WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_77 < (uint)170000), _77, 0)) + 0u))]._subspaceInfo.w);
  float _106 = _73 - _viewPos.x;
  float _107 = _74 - _viewPos.y;
  float _108 = _75 - _viewPos.z;
  float _136 = mad((_viewProjRelative[3].z), _108, mad((_viewProjRelative[3].y), _107, ((_viewProjRelative[3].x) * _106))) + (_viewProjRelative[3].w);
  float _137 = (mad((_viewProjRelative[0].z), _108, mad((_viewProjRelative[0].y), _107, ((_viewProjRelative[0].x) * _106))) + (_viewProjRelative[0].w)) / _136;
  float _141 = 0.5f - (((mad((_viewProjRelative[1].z), _108, mad((_viewProjRelative[1].y), _107, ((_viewProjRelative[1].x) * _106))) + (_viewProjRelative[1].w)) / _136) * 0.5f);
  float _151 = ((_view[0].x) * _101) + _106;
  float _152 = ((_view[0].y) * _101) + _107;
  float _153 = ((_view[0].z) * _101) + _108;
  float _165 = mad((_viewProjRelative[3].z), _153, mad((_viewProjRelative[3].y), _152, (_151 * (_viewProjRelative[3].x)))) + (_viewProjRelative[3].w);
  float _171 = (0.5f - (((mad((_viewProjRelative[1].z), _153, mad((_viewProjRelative[1].y), _152, (_151 * (_viewProjRelative[1].x)))) + (_viewProjRelative[1].w)) / _165) * 0.5f)) - _141;
  float _173 = (_29 * 0.5f) * (((mad((_viewProjRelative[0].z), _153, mad((_viewProjRelative[0].y), _152, (_151 * (_viewProjRelative[0].x)))) + (_viewProjRelative[0].w)) / _165) - _137);
  float _180 = TEXCOORD.y - _141;
  float _181 = ((TEXCOORD.x + -0.5f) - (_137 * 0.5f)) * _29;
  float _199 = float((bool)(uint)(dot(float3(_106, _107, _108), float3(_viewDir.x, _viewDir.y, _viewDir.z)) > 0.0f)) * saturate((1.0f - saturate(sqrt((_180 * _180) + (_181 * _181)) / max(0.0010000000474974513f, sqrt((_171 * _171) + (_173 * _173))))) * 5.0f);
  float _530;
  float _531;
  float _532;
  float _543;
  float _544;
  float _545;
  float _546;
  float _569;
  float _815;
  float _816;
  float _817;
  float _937;
  float _938;
  float _939;
  float _958;
  float _959;
  float _960;
  float _993;
  float _994;
  float _995;
  float _1009;
  float _1010;
  float _1011;
  if (_199 > 0.0f) {
    float _204 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    float _206 = _36 + -1.0f;
    float _207 = 1.0f - _38;
    float _208 = max(1.0000000116860974e-07f, _204.x);
    float _244 = mad((_invViewProj[3].z), _208, mad((_invViewProj[3].y), _207, ((_invViewProj[3].x) * _206))) + (_invViewProj[3].w);
    float _245 = (mad((_invViewProj[0].z), _208, mad((_invViewProj[0].y), _207, ((_invViewProj[0].x) * _206))) + (_invViewProj[0].w)) / _244;
    float _246 = (mad((_invViewProj[1].z), _208, mad((_invViewProj[1].y), _207, ((_invViewProj[1].x) * _206))) + (_invViewProj[1].w)) / _244;
    float _247 = (mad((_invViewProj[2].z), _208, mad((_invViewProj[2].y), _207, ((_invViewProj[2].x) * _206))) + (_invViewProj[2].w)) / _244;
    uint _253 = uint(_bufferSizeAndInvSize.x * TEXCOORD.x);
    uint _254 = uint(_bufferSizeAndInvSize.y * TEXCOORD.y);
    uint4 _256 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_253), (int)(_254), 0));
    float4 _259 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_253), (int)(_254), 0));
    float _277 = (saturate(_259.x * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _278 = (saturate(_259.y * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _279 = (saturate(_259.z * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _281 = rsqrt(dot(float3(_277, _278, _279), float3(_277, _278, _279)));
    float _282 = _281 * _277;
    float _283 = _281 * _278;
    float _284 = _279 * _281;
    float _287 = (float((uint)((uint)(((uint)((uint)(_256.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
    float _288 = (float((uint)((uint)(_256.w & 255))) * 0.007843137718737125f) + -1.0f;
    float _291 = (_287 + _288) * 0.5f;
    float _292 = (_287 - _288) * 0.5f;
    float _296 = (1.0f - abs(_291)) - abs(_292);
    float _298 = rsqrt(dot(float3(_291, _292, _296), float3(_291, _292, _296)));
    float _299 = _298 * _291;
    float _300 = _298 * _292;
    float _301 = _298 * _296;
    float _303 = select((_284 >= 0.0f), 1.0f, -1.0f);
    float _306 = -0.0f - (1.0f / (_303 + _284));
    float _307 = _283 * _306;
    float _308 = _307 * _282;
    float _309 = _303 * _282;
    float _318 = mad(_301, _282, mad(_300, _308, ((((_309 * _282) * _306) + 1.0f) * _299)));
    float _322 = mad(_301, _283, mad(_300, (_303 + (_307 * _283)), ((_299 * _303) * _308)));
    float _326 = mad(_301, _284, mad(_300, (-0.0f - _283), (-0.0f - (_309 * _299))));
    float _328 = rsqrt(dot(float3(_318, _322, _326), float3(_318, _322, _326)));
    float _338 = _245 - _viewPos.x;
    float _339 = _246 - _viewPos.y;
    float _340 = _247 - _viewPos.z;
    float _356 = 1.0f - saturate(dot(float3((_328 * _318), (_328 * _322), (_328 * _326)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
    float _357 = _73 - _245;
    float _358 = _74 - _246;
    float _359 = _75 - _247;
    float _365 = sqrt(((_358 * _358) + (_357 * _357)) + (_359 * _359));
    float _377 = exp2((2.0f - (saturate(saturate(1.0f - (_365 / max(0.0010000000474974513f, (_101 * 3.0f)))) * 2.0f) * 1.7999999523162842f)) * log2(_356));
    int _382 = WaveReadLaneFirst(_materialIndex);
    int _390 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_382 < (uint)170000), _382, 0)) + 0u))]._subspaceColor);
    float _393 = float((uint)((uint)(((uint)((uint)(_390)) >> 16) & 255)));
    float _396 = float((uint)((uint)(((uint)((uint)(_390)) >> 8) & 255)));
    float _398 = float((uint)((uint)(_390 & 255)));
    float _423 = select(((_393 * 0.003921568859368563f) < 0.040449999272823334f), (_393 * 0.0003035269910469651f), exp2(log2((_393 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _424 = select(((_396 * 0.003921568859368563f) < 0.040449999272823334f), (_396 * 0.0003035269910469651f), exp2(log2((_396 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _425 = select(((_398 * 0.003921568859368563f) < 0.040449999272823334f), (_398 * 0.0003035269910469651f), exp2(log2((_398 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    int _426 = WaveReadLaneFirst(_materialIndex);
    int _434 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_426 < (uint)170000), _426, 0)) + 0u))]._subspaceBlendColor);
    float _437 = float((uint)((uint)(((uint)((uint)(_434)) >> 16) & 255)));
    float _440 = float((uint)((uint)(((uint)((uint)(_434)) >> 8) & 255)));
    float _442 = float((uint)((uint)(_434 & 255)));
    int _470 = WaveReadLaneFirst(_materialIndex);
    float _478 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_470 < (uint)170000), _470, 0)) + 0u))]._subspaceColorBlendRatio);
    float _491 = saturate(1.0f - (_365 / max(0.0010000000474974513f, _101)));
    float _494 = saturate((_491 * _491) * 2.0f);
    uint2 _503 = __3__36__0__0__g_stencil.Load(int3((int)(uint(_bufferSizeAndInvSize.x * TEXCOORD.x)), (int)(uint(_bufferSizeAndInvSize.y * TEXCOORD.y)), 0));
    if ((uint)((_503.x & 127) + -53) < (uint)15) {
      float _512 = (_356 * _356) * ((_494 * 0.44999998807907104f) + 0.05000000074505806f);
      _530 = _512;
      _531 = _512;
      _532 = _512;
    } else {
      if (((_204.x < 1.0000000116860974e-07f)) || ((_204.x == 1.0f))) {
        _530 = (_58.x * 0.10000000149011612f);
        _531 = (_58.y * 0.10000000149011612f);
        _532 = (_58.z * 0.10000000149011612f);
      } else {
        float4 _524 = __3__36__0__0__g_specularAO.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y), 0.0f);
        float _528 = _524.w * ((_494 * 0.8999999761581421f) + 0.10000000149011612f);
        _530 = _528;
        _531 = _528;
        _532 = _528;
      }
    }
    float _538 = max(0.0010000000474974513f, _exposure0.x);
    _543 = ((_530 * ((_478 * (select(((_437 * 0.003921568859368563f) < 0.040449999272823334f), (_437 * 0.0003035269910469651f), exp2(log2((_437 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _423)) + _423)) / _538);
    _544 = ((_531 * ((_478 * (select(((_440 * 0.003921568859368563f) < 0.040449999272823334f), (_440 * 0.0003035269910469651f), exp2(log2((_440 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _424)) + _424)) / _538);
    _545 = ((_532 * ((_478 * (select(((_442 * 0.003921568859368563f) < 0.040449999272823334f), (_442 * 0.0003035269910469651f), exp2(log2((_442 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _425)) + _425)) / _538);
    _546 = ((((1.0f - _377) * saturate(((_101 - sqrt(((_106 * _106) + (_107 * _107)) + (_108 * _108))) + sqrt(((_339 * _339) + (_338 * _338)) + (_340 * _340))) * 5.0f)) + _377) * _199);
  } else {
    _543 = 0.0f;
    _544 = 0.0f;
    _545 = 0.0f;
    _546 = _199;
  }
  float _553 = (_546 * (_543 - _32.x)) + _32.x;
  float _554 = (_546 * (_544 - _32.y)) + _32.y;
  float _555 = (_546 * (_545 - _32.z)) + _32.z;
  uint _556 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _563 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_556), 0));
    _569 = (float((uint)((uint)(_563.x & 127))) + 0.5f);
  } else {
    _569 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_553, _554, _555));
    _937 = output_color.x;
    _938 = output_color.y;
    _939 = output_color.z;
  } else {
    _937 = _553;
    _938 = _554;
    _939 = _555;
  }
  if (_etcParams.y > 1.0f) {
    float _948 = abs(_36 + -1.0f);
    float _949 = abs(_38 + -1.0f);
    float _953 = saturate(1.0f - (dot(float2(_948, _949), float2(_948, _949)) * saturate(_etcParams.y + -1.0f)));
    _958 = (_953 * _937);
    _959 = (_953 * _938);
    _960 = (_953 * _939);
  } else {
    _958 = _937;
    _959 = _938;
    _960 = _939;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _993 = select((_958 <= 0.0031308000907301903f), (_958 * 12.920000076293945f), (((pow(_958, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _994 = select((_959 <= 0.0031308000907301903f), (_959 * 12.920000076293945f), (((pow(_959, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _995 = select((_960 <= 0.0031308000907301903f), (_960 * 12.920000076293945f), (((pow(_960, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _993 = _958;
    _994 = _959;
    _995 = _960;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _1000 = float((uint)_556);
    if (!(_1000 < _viewDir.w)) {
      if (!(_1000 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _1009 = _993;
        _1010 = _994;
        _1011 = _995;
      } else {
        _1009 = 0.0f;
        _1010 = 0.0f;
        _1011 = 0.0f;
      }
    } else {
      _1009 = 0.0f;
      _1010 = 0.0f;
      _1011 = 0.0f;
    }
  } else {
    _1009 = _993;
    _1010 = _994;
    _1011 = _995;
  }
  SV_Target.x = _1009;
  SV_Target.y = _1010;
  SV_Target.z = _1011;
  SV_Target.w = _569;
  return SV_Target;
}

