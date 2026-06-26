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
  float _37 = TEXCOORD.x * 2.0f;
  float _39 = TEXCOORD.y * 2.0f;
  int _44 = WaveReadLaneFirst(_materialIndex);
  int _52 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_44 < (uint)170000), _44, 0)) + 0u))]._subspaceTex);
  float4 _59 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_52 < (uint)65000), _52, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_30 * _37), ((_time.x * 0.10000000149011612f) + _39)));
  int _63 = WaveReadLaneFirst(_materialIndex);
  float _74 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_63 < (uint)170000), _63, 0)) + 0u))]._subspaceInfo.x);
  float _75 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_63 < (uint)170000), _63, 0)) + 0u))]._subspaceInfo.y);
  float _76 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_63 < (uint)170000), _63, 0)) + 0u))]._subspaceInfo.z);
  int _78 = WaveReadLaneFirst(_materialIndex);
  int _93 = WaveReadLaneFirst(_materialIndex);
  float _102 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_93 < (uint)170000), _93, 0)) + 0u))]._subspaceRatio) * WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_78 < (uint)170000), _78, 0)) + 0u))]._subspaceInfo.w);
  float _107 = _74 - _viewPos.x;
  float _108 = _75 - _viewPos.y;
  float _109 = _76 - _viewPos.z;
  float _137 = mad((_viewProjRelative[3].z), _109, mad((_viewProjRelative[3].y), _108, ((_viewProjRelative[3].x) * _107))) + (_viewProjRelative[3].w);
  float _138 = (mad((_viewProjRelative[0].z), _109, mad((_viewProjRelative[0].y), _108, ((_viewProjRelative[0].x) * _107))) + (_viewProjRelative[0].w)) / _137;
  float _142 = 0.5f - (((mad((_viewProjRelative[1].z), _109, mad((_viewProjRelative[1].y), _108, ((_viewProjRelative[1].x) * _107))) + (_viewProjRelative[1].w)) / _137) * 0.5f);
  float _152 = ((_view[0].x) * _102) + _107;
  float _153 = ((_view[0].y) * _102) + _108;
  float _154 = ((_view[0].z) * _102) + _109;
  float _166 = mad((_viewProjRelative[3].z), _154, mad((_viewProjRelative[3].y), _153, (_152 * (_viewProjRelative[3].x)))) + (_viewProjRelative[3].w);
  float _172 = (0.5f - (((mad((_viewProjRelative[1].z), _154, mad((_viewProjRelative[1].y), _153, (_152 * (_viewProjRelative[1].x)))) + (_viewProjRelative[1].w)) / _166) * 0.5f)) - _142;
  float _174 = (_30 * 0.5f) * (((mad((_viewProjRelative[0].z), _154, mad((_viewProjRelative[0].y), _153, (_152 * (_viewProjRelative[0].x)))) + (_viewProjRelative[0].w)) / _166) - _138);
  float _181 = TEXCOORD.y - _142;
  float _182 = ((TEXCOORD.x + -0.5f) - (_138 * 0.5f)) * _30;
  float _200 = float((bool)(uint)(dot(float3(_107, _108, _109), float3(_viewDir.x, _viewDir.y, _viewDir.z)) > 0.0f)) * saturate((1.0f - saturate(sqrt((_181 * _181) + (_182 * _182)) / max(0.0010000000474974513f, sqrt((_172 * _172) + (_174 * _174))))) * 5.0f);
  float _531;
  float _532;
  float _533;
  float _544;
  float _545;
  float _546;
  float _547;
  float _570;
  float _775;
  float _776;
  float _777;
  float _870;
  float _871;
  float _872;
  float _926;
  float _927;
  float _928;
  float _945;
  float _946;
  float _947;
  float _977;
  float _978;
  float _979;
  float _993;
  float _994;
  float _995;
  if (_200 > 0.0f) {
    float _205 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    float _207 = _37 + -1.0f;
    float _208 = 1.0f - _39;
    float _209 = max(1.0000000116860974e-07f, _205.x);
    float _245 = mad((_invViewProj[3].z), _209, mad((_invViewProj[3].y), _208, ((_invViewProj[3].x) * _207))) + (_invViewProj[3].w);
    float _246 = (mad((_invViewProj[0].z), _209, mad((_invViewProj[0].y), _208, ((_invViewProj[0].x) * _207))) + (_invViewProj[0].w)) / _245;
    float _247 = (mad((_invViewProj[1].z), _209, mad((_invViewProj[1].y), _208, ((_invViewProj[1].x) * _207))) + (_invViewProj[1].w)) / _245;
    float _248 = (mad((_invViewProj[2].z), _209, mad((_invViewProj[2].y), _208, ((_invViewProj[2].x) * _207))) + (_invViewProj[2].w)) / _245;
    uint _254 = uint(_bufferSizeAndInvSize.x * TEXCOORD.x);
    uint _255 = uint(_bufferSizeAndInvSize.y * TEXCOORD.y);
    uint4 _257 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_254), (int)(_255), 0));
    float4 _260 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_254), (int)(_255), 0));
    float _278 = (saturate(_260.x * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _279 = (saturate(_260.y * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _280 = (saturate(_260.z * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _282 = rsqrt(dot(float3(_278, _279, _280), float3(_278, _279, _280)));
    float _283 = _282 * _278;
    float _284 = _282 * _279;
    float _285 = _280 * _282;
    float _288 = (float((uint)((uint)(((uint)((uint)(_257.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
    float _289 = (float((uint)((uint)(_257.w & 255))) * 0.007843137718737125f) + -1.0f;
    float _292 = (_288 + _289) * 0.5f;
    float _293 = (_288 - _289) * 0.5f;
    float _297 = (1.0f - abs(_292)) - abs(_293);
    float _299 = rsqrt(dot(float3(_292, _293, _297), float3(_292, _293, _297)));
    float _300 = _299 * _292;
    float _301 = _299 * _293;
    float _302 = _299 * _297;
    float _304 = select((_285 >= 0.0f), 1.0f, -1.0f);
    float _307 = -0.0f - (1.0f / (_304 + _285));
    float _308 = _284 * _307;
    float _309 = _308 * _283;
    float _310 = _304 * _283;
    float _319 = mad(_302, _283, mad(_301, _309, ((((_310 * _283) * _307) + 1.0f) * _300)));
    float _323 = mad(_302, _284, mad(_301, (_304 + (_308 * _284)), ((_300 * _304) * _309)));
    float _327 = mad(_302, _285, mad(_301, (-0.0f - _284), (-0.0f - (_310 * _300))));
    float _329 = rsqrt(dot(float3(_319, _323, _327), float3(_319, _323, _327)));
    float _339 = _246 - _viewPos.x;
    float _340 = _247 - _viewPos.y;
    float _341 = _248 - _viewPos.z;
    float _357 = 1.0f - saturate(dot(float3((_329 * _319), (_329 * _323), (_329 * _327)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
    float _358 = _74 - _246;
    float _359 = _75 - _247;
    float _360 = _76 - _248;
    float _366 = sqrt(((_359 * _359) + (_358 * _358)) + (_360 * _360));
    float _378 = exp2((2.0f - (saturate(saturate(1.0f - (_366 / max(0.0010000000474974513f, (_102 * 3.0f)))) * 2.0f) * 1.7999999523162842f)) * log2(_357));
    int _383 = WaveReadLaneFirst(_materialIndex);
    int _391 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_383 < (uint)170000), _383, 0)) + 0u))]._subspaceColor);
    float _394 = float((uint)((uint)(((uint)((uint)(_391)) >> 16) & 255)));
    float _397 = float((uint)((uint)(((uint)((uint)(_391)) >> 8) & 255)));
    float _399 = float((uint)((uint)(_391 & 255)));
    float _424 = select(((_394 * 0.003921568859368563f) < 0.040449999272823334f), (_394 * 0.0003035269910469651f), exp2(log2((_394 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _425 = select(((_397 * 0.003921568859368563f) < 0.040449999272823334f), (_397 * 0.0003035269910469651f), exp2(log2((_397 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _426 = select(((_399 * 0.003921568859368563f) < 0.040449999272823334f), (_399 * 0.0003035269910469651f), exp2(log2((_399 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    int _427 = WaveReadLaneFirst(_materialIndex);
    int _435 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_427 < (uint)170000), _427, 0)) + 0u))]._subspaceBlendColor);
    float _438 = float((uint)((uint)(((uint)((uint)(_435)) >> 16) & 255)));
    float _441 = float((uint)((uint)(((uint)((uint)(_435)) >> 8) & 255)));
    float _443 = float((uint)((uint)(_435 & 255)));
    int _471 = WaveReadLaneFirst(_materialIndex);
    float _479 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_471 < (uint)170000), _471, 0)) + 0u))]._subspaceColorBlendRatio);
    float _492 = saturate(1.0f - (_366 / max(0.0010000000474974513f, _102)));
    float _495 = saturate((_492 * _492) * 2.0f);
    uint2 _504 = __3__36__0__0__g_stencil.Load(int3((int)(uint(_bufferSizeAndInvSize.x * TEXCOORD.x)), (int)(uint(_bufferSizeAndInvSize.y * TEXCOORD.y)), 0));
    if ((uint)((_504.x & 127) + -53) < (uint)15) {
      float _513 = (_357 * _357) * ((_495 * 0.44999998807907104f) + 0.05000000074505806f);
      _531 = _513;
      _532 = _513;
      _533 = _513;
    } else {
      if (((_205.x < 1.0000000116860974e-07f)) || ((_205.x == 1.0f))) {
        _531 = (_59.x * 0.10000000149011612f);
        _532 = (_59.y * 0.10000000149011612f);
        _533 = (_59.z * 0.10000000149011612f);
      } else {
        float4 _525 = __3__36__0__0__g_specularAO.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y), 0.0f);
        float _529 = _525.w * ((_495 * 0.8999999761581421f) + 0.10000000149011612f);
        _531 = _529;
        _532 = _529;
        _533 = _529;
      }
    }
    float _539 = max(0.0010000000474974513f, _exposure0.x);
    _544 = ((_531 * ((_479 * (select(((_438 * 0.003921568859368563f) < 0.040449999272823334f), (_438 * 0.0003035269910469651f), exp2(log2((_438 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _424)) + _424)) / _539);
    _545 = ((_532 * ((_479 * (select(((_441 * 0.003921568859368563f) < 0.040449999272823334f), (_441 * 0.0003035269910469651f), exp2(log2((_441 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _425)) + _425)) / _539);
    _546 = ((_533 * ((_479 * (select(((_443 * 0.003921568859368563f) < 0.040449999272823334f), (_443 * 0.0003035269910469651f), exp2(log2((_443 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _426)) + _426)) / _539);
    _547 = ((((1.0f - _378) * saturate(((_102 - sqrt(((_107 * _107) + (_108 * _108)) + (_109 * _109))) + sqrt(((_340 * _340) + (_339 * _339)) + (_341 * _341))) * 5.0f)) + _378) * _200);
  } else {
    _544 = 0.0f;
    _545 = 0.0f;
    _546 = 0.0f;
    _547 = _200;
  }
  float _554 = (_547 * (_544 - _33.x)) + _33.x;
  float _555 = (_547 * (_545 - _33.y)) + _33.y;
  float _556 = (_547 * (_546 - _33.z)) + _33.z;
  uint _557 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _564 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_557), 0));
    _570 = (float((uint)((uint)(_564.x & 127))) + 0.5f);
  } else {
    _570 = 1.0f;
  }
  bool _573 = (_localToneMappingParams.w > 0.0f);
  if (_573) {
    float3 output_color = TonemapReplacer(float3(_554, _555, _556));
    _926 = output_color.x;
    _927 = output_color.y;
    _928 = output_color.z;
  } else {
    _926 = _554;
    _927 = _555;
    _928 = _556;
  }
  if (_etcParams.y > 1.0f) {
    float _935 = abs(_37 + -1.0f);
    float _936 = abs(_39 + -1.0f);
    float _940 = saturate(1.0f - (dot(float2(_935, _936), float2(_935, _936)) * saturate(_etcParams.y + -1.0f)));
    _945 = (_940 * _926);
    _946 = (_940 * _927);
    _947 = (_940 * _928);
  } else {
    _945 = _926;
    _946 = _927;
    _947 = _928;
  }
  if ((_573) && ((_etcParams.z > 0.0f))) {
    _977 = select((_945 <= 0.0031308000907301903f), (_945 * 12.920000076293945f), (((pow(_945, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _978 = select((_946 <= 0.0031308000907301903f), (_946 * 12.920000076293945f), (((pow(_946, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _979 = select((_947 <= 0.0031308000907301903f), (_947 * 12.920000076293945f), (((pow(_947, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _977 = _945;
    _978 = _946;
    _979 = _947;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _984 = float((uint)_557);
    if (!(_984 < _viewDir.w)) {
      if (!(_984 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _993 = _977;
        _994 = _978;
        _995 = _979;
      } else {
        _993 = 0.0f;
        _994 = 0.0f;
        _995 = 0.0f;
      }
    } else {
      _993 = 0.0f;
      _994 = 0.0f;
      _995 = 0.0f;
    }
  } else {
    _993 = _977;
    _994 = _978;
    _995 = _979;
  }
  SV_Target.x = _993;
  SV_Target.y = _994;
  SV_Target.z = _995;
  SV_Target.w = _570;
  return SV_Target;
}