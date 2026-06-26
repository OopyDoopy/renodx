struct PostProcessSubspace_CDStruct {
  float _subspaceRatio;
  float4 _subspaceInfo;
  uint _subspaceTex;
  float _subspaceColorBlendRatio;
  uint _subspaceColor;
  uint _subspaceBlendColor;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t32, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t40, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t33, space36);

Texture2D<float4> __3__36__0__0__g_specularAO : register(t76, space36);

Texture2D<uint4> __3__36__0__0__g_gbufferBaseColor : register(t77, space36);

Texture2D<float4> __3__36__0__0__g_gbufferNormal : register(t78, space36);

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

ConstantBuffer<PostProcessSubspace_CDStruct> BindlessParameters_PostProcessSubspace_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _30 = _srcTargetSizeAndInv.x / _srcTargetSizeAndInv.y;
  float4 _33 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _43 = (pow(_33.x, 0.012683313339948654f));
  float _44 = (pow(_33.y, 0.012683313339948654f));
  float _45 = (pow(_33.z, 0.012683313339948654f));
  float _70 = exp2(log2(max(0.0f, (_43 + -0.8359375f)) / (18.8515625f - (_43 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _71 = exp2(log2(max(0.0f, (_44 + -0.8359375f)) / (18.8515625f - (_44 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _72 = exp2(log2(max(0.0f, (_45 + -0.8359375f)) / (18.8515625f - (_45 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _73 = TEXCOORD.x * 2.0f;
  float _75 = TEXCOORD.y * 2.0f;
  int _80 = WaveReadLaneFirst(_materialIndex);
  int _88 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_80 < (uint)170000), _80, 0)) + 0u))]._subspaceTex);
  float4 _95 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_88 < (uint)65000), _88, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_30 * _73), ((_time.x * 0.10000000149011612f) + _75)));
  int _99 = WaveReadLaneFirst(_materialIndex);
  float _110 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_99 < (uint)170000), _99, 0)) + 0u))]._subspaceInfo.x);
  float _111 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_99 < (uint)170000), _99, 0)) + 0u))]._subspaceInfo.y);
  float _112 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_99 < (uint)170000), _99, 0)) + 0u))]._subspaceInfo.z);
  int _114 = WaveReadLaneFirst(_materialIndex);
  int _129 = WaveReadLaneFirst(_materialIndex);
  float _138 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_129 < (uint)170000), _129, 0)) + 0u))]._subspaceRatio) * WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_114 < (uint)170000), _114, 0)) + 0u))]._subspaceInfo.w);
  float _143 = _110 - _viewPos.x;
  float _144 = _111 - _viewPos.y;
  float _145 = _112 - _viewPos.z;
  float _173 = mad((_viewProjRelative[3].z), _145, mad((_viewProjRelative[3].y), _144, ((_viewProjRelative[3].x) * _143))) + (_viewProjRelative[3].w);
  float _174 = (mad((_viewProjRelative[0].z), _145, mad((_viewProjRelative[0].y), _144, ((_viewProjRelative[0].x) * _143))) + (_viewProjRelative[0].w)) / _173;
  float _178 = 0.5f - (((mad((_viewProjRelative[1].z), _145, mad((_viewProjRelative[1].y), _144, ((_viewProjRelative[1].x) * _143))) + (_viewProjRelative[1].w)) / _173) * 0.5f);
  float _188 = ((_view[0].x) * _138) + _143;
  float _189 = ((_view[0].y) * _138) + _144;
  float _190 = ((_view[0].z) * _138) + _145;
  float _202 = mad((_viewProjRelative[3].z), _190, mad((_viewProjRelative[3].y), _189, (_188 * (_viewProjRelative[3].x)))) + (_viewProjRelative[3].w);
  float _208 = (0.5f - (((mad((_viewProjRelative[1].z), _190, mad((_viewProjRelative[1].y), _189, (_188 * (_viewProjRelative[1].x)))) + (_viewProjRelative[1].w)) / _202) * 0.5f)) - _178;
  float _210 = (_30 * 0.5f) * (((mad((_viewProjRelative[0].z), _190, mad((_viewProjRelative[0].y), _189, (_188 * (_viewProjRelative[0].x)))) + (_viewProjRelative[0].w)) / _202) - _174);
  float _217 = TEXCOORD.y - _178;
  float _218 = ((TEXCOORD.x + -0.5f) - (_174 * 0.5f)) * _30;
  float _236 = float((bool)(uint)(dot(float3(_143, _144, _145), float3(_viewDir.x, _viewDir.y, _viewDir.z)) > 0.0f)) * saturate((1.0f - saturate(sqrt((_217 * _217) + (_218 * _218)) / max(0.0010000000474974513f, sqrt((_208 * _208) + (_210 * _210))))) * 5.0f);
  float _567;
  float _568;
  float _569;
  float _580;
  float _581;
  float _582;
  float _583;
  float _606;
  float _811;
  float _812;
  float _813;
  float _906;
  float _907;
  float _908;
  float _962;
  float _963;
  float _964;
  float _981;
  float _982;
  float _983;
  float _1013;
  float _1014;
  float _1015;
  float _1029;
  float _1030;
  float _1031;
  if (_236 > 0.0f) {
    float _241 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    float _243 = _73 + -1.0f;
    float _244 = 1.0f - _75;
    float _245 = max(1.0000000116860974e-07f, _241.x);
    float _281 = mad((_invViewProj[3].z), _245, mad((_invViewProj[3].y), _244, ((_invViewProj[3].x) * _243))) + (_invViewProj[3].w);
    float _282 = (mad((_invViewProj[0].z), _245, mad((_invViewProj[0].y), _244, ((_invViewProj[0].x) * _243))) + (_invViewProj[0].w)) / _281;
    float _283 = (mad((_invViewProj[1].z), _245, mad((_invViewProj[1].y), _244, ((_invViewProj[1].x) * _243))) + (_invViewProj[1].w)) / _281;
    float _284 = (mad((_invViewProj[2].z), _245, mad((_invViewProj[2].y), _244, ((_invViewProj[2].x) * _243))) + (_invViewProj[2].w)) / _281;
    uint _290 = uint(_bufferSizeAndInvSize.x * TEXCOORD.x);
    uint _291 = uint(_bufferSizeAndInvSize.y * TEXCOORD.y);
    uint4 _293 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_290), (int)(_291), 0));
    float4 _296 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_290), (int)(_291), 0));
    float _314 = (saturate(_296.x * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _315 = (saturate(_296.y * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _316 = (saturate(_296.z * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _318 = rsqrt(dot(float3(_314, _315, _316), float3(_314, _315, _316)));
    float _319 = _318 * _314;
    float _320 = _318 * _315;
    float _321 = _316 * _318;
    float _324 = (float((uint)((uint)(((uint)((uint)(_293.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
    float _325 = (float((uint)((uint)(_293.w & 255))) * 0.007843137718737125f) + -1.0f;
    float _328 = (_324 + _325) * 0.5f;
    float _329 = (_324 - _325) * 0.5f;
    float _333 = (1.0f - abs(_328)) - abs(_329);
    float _335 = rsqrt(dot(float3(_328, _329, _333), float3(_328, _329, _333)));
    float _336 = _335 * _328;
    float _337 = _335 * _329;
    float _338 = _335 * _333;
    float _340 = select((_321 >= 0.0f), 1.0f, -1.0f);
    float _343 = -0.0f - (1.0f / (_340 + _321));
    float _344 = _320 * _343;
    float _345 = _344 * _319;
    float _346 = _340 * _319;
    float _355 = mad(_338, _319, mad(_337, _345, ((((_346 * _319) * _343) + 1.0f) * _336)));
    float _359 = mad(_338, _320, mad(_337, (_340 + (_344 * _320)), ((_336 * _340) * _345)));
    float _363 = mad(_338, _321, mad(_337, (-0.0f - _320), (-0.0f - (_346 * _336))));
    float _365 = rsqrt(dot(float3(_355, _359, _363), float3(_355, _359, _363)));
    float _375 = _282 - _viewPos.x;
    float _376 = _283 - _viewPos.y;
    float _377 = _284 - _viewPos.z;
    float _393 = 1.0f - saturate(dot(float3((_365 * _355), (_365 * _359), (_365 * _363)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
    float _394 = _110 - _282;
    float _395 = _111 - _283;
    float _396 = _112 - _284;
    float _402 = sqrt(((_395 * _395) + (_394 * _394)) + (_396 * _396));
    float _414 = exp2((2.0f - (saturate(saturate(1.0f - (_402 / max(0.0010000000474974513f, (_138 * 3.0f)))) * 2.0f) * 1.7999999523162842f)) * log2(_393));
    int _419 = WaveReadLaneFirst(_materialIndex);
    int _427 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_419 < (uint)170000), _419, 0)) + 0u))]._subspaceColor);
    float _430 = float((uint)((uint)(((uint)((uint)(_427)) >> 16) & 255)));
    float _433 = float((uint)((uint)(((uint)((uint)(_427)) >> 8) & 255)));
    float _435 = float((uint)((uint)(_427 & 255)));
    float _460 = select(((_430 * 0.003921568859368563f) < 0.040449999272823334f), (_430 * 0.0003035269910469651f), exp2(log2((_430 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _461 = select(((_433 * 0.003921568859368563f) < 0.040449999272823334f), (_433 * 0.0003035269910469651f), exp2(log2((_433 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _462 = select(((_435 * 0.003921568859368563f) < 0.040449999272823334f), (_435 * 0.0003035269910469651f), exp2(log2((_435 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    int _463 = WaveReadLaneFirst(_materialIndex);
    int _471 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_463 < (uint)170000), _463, 0)) + 0u))]._subspaceBlendColor);
    float _474 = float((uint)((uint)(((uint)((uint)(_471)) >> 16) & 255)));
    float _477 = float((uint)((uint)(((uint)((uint)(_471)) >> 8) & 255)));
    float _479 = float((uint)((uint)(_471 & 255)));
    int _507 = WaveReadLaneFirst(_materialIndex);
    float _515 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_507 < (uint)170000), _507, 0)) + 0u))]._subspaceColorBlendRatio);
    float _528 = saturate(1.0f - (_402 / max(0.0010000000474974513f, _138)));
    float _531 = saturate((_528 * _528) * 2.0f);
    uint2 _540 = __3__36__0__0__g_stencil.Load(int3((int)(uint(_bufferSizeAndInvSize.x * TEXCOORD.x)), (int)(uint(_bufferSizeAndInvSize.y * TEXCOORD.y)), 0));
    if ((uint)((_540.x & 127) + -53) < (uint)15) {
      float _549 = (_393 * _393) * ((_531 * 0.44999998807907104f) + 0.05000000074505806f);
      _567 = _549;
      _568 = _549;
      _569 = _549;
    } else {
      if (((_241.x < 1.0000000116860974e-07f)) || ((_241.x == 1.0f))) {
        _567 = (_95.x * 0.10000000149011612f);
        _568 = (_95.y * 0.10000000149011612f);
        _569 = (_95.z * 0.10000000149011612f);
      } else {
        float4 _561 = __3__36__0__0__g_specularAO.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y), 0.0f);
        float _565 = _561.w * ((_531 * 0.8999999761581421f) + 0.10000000149011612f);
        _567 = _565;
        _568 = _565;
        _569 = _565;
      }
    }
    float _575 = max(0.0010000000474974513f, _exposure0.x);
    _580 = ((_567 * ((_515 * (select(((_474 * 0.003921568859368563f) < 0.040449999272823334f), (_474 * 0.0003035269910469651f), exp2(log2((_474 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _460)) + _460)) / _575);
    _581 = ((_568 * ((_515 * (select(((_477 * 0.003921568859368563f) < 0.040449999272823334f), (_477 * 0.0003035269910469651f), exp2(log2((_477 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _461)) + _461)) / _575);
    _582 = ((_569 * ((_515 * (select(((_479 * 0.003921568859368563f) < 0.040449999272823334f), (_479 * 0.0003035269910469651f), exp2(log2((_479 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _462)) + _462)) / _575);
    _583 = ((((1.0f - _414) * saturate(((_138 - sqrt(((_143 * _143) + (_144 * _144)) + (_145 * _145))) + sqrt(((_376 * _376) + (_375 * _375)) + (_377 * _377))) * 5.0f)) + _414) * _236);
  } else {
    _580 = 0.0f;
    _581 = 0.0f;
    _582 = 0.0f;
    _583 = _236;
  }
  float _590 = (_583 * (_580 - _70)) + _70;
  float _591 = (_583 * (_581 - _71)) + _71;
  float _592 = (_583 * (_582 - _72)) + _72;
  uint _593 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _600 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_593), 0));
    _606 = (float((uint)((uint)(_600.x & 127))) + 0.5f);
  } else {
    _606 = 1.0f;
  }
  bool _609 = (_localToneMappingParams.w > 0.0f);
  if (_609) {
    float3 output_color = TonemapReplacer(float3(_590, _591, _592));
    _962 = output_color.x;
    _963 = output_color.y;
    _964 = output_color.z;
  } else {
    _962 = _590;
    _963 = _591;
    _964 = _592;
  }
  if (_etcParams.y > 1.0f) {
    float _971 = abs(_73 + -1.0f);
    float _972 = abs(_75 + -1.0f);
    float _976 = saturate(1.0f - (dot(float2(_971, _972), float2(_971, _972)) * saturate(_etcParams.y + -1.0f)));
    _981 = (_976 * _962);
    _982 = (_976 * _963);
    _983 = (_976 * _964);
  } else {
    _981 = _962;
    _982 = _963;
    _983 = _964;
  }
  if ((_609) && ((_etcParams.z > 0.0f))) {
    _1013 = select((_981 <= 0.0031308000907301903f), (_981 * 12.920000076293945f), (((pow(_981, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1014 = select((_982 <= 0.0031308000907301903f), (_982 * 12.920000076293945f), (((pow(_982, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1015 = select((_983 <= 0.0031308000907301903f), (_983 * 12.920000076293945f), (((pow(_983, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1013 = _981;
    _1014 = _982;
    _1015 = _983;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _1020 = float((uint)_593);
    if (!(_1020 < _viewDir.w)) {
      if (!(_1020 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _1029 = _1013;
        _1030 = _1014;
        _1031 = _1015;
      } else {
        _1029 = 0.0f;
        _1030 = 0.0f;
        _1031 = 0.0f;
      }
    } else {
      _1029 = 0.0f;
      _1030 = 0.0f;
      _1031 = 0.0f;
    }
  } else {
    _1029 = _1013;
    _1030 = _1014;
    _1031 = _1015;
  }
  float _1041 = exp2(log2(_1029 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1042 = exp2(log2(_1030 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1043 = exp2(log2(_1031 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_1041 * 18.6875f) + 1.0f)) * ((_1041 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_1042 * 18.6875f) + 1.0f)) * ((_1042 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_1043 * 18.6875f) + 1.0f)) * ((_1043 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _606;
  return SV_Target;
}