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
  float _42 = (pow(_32.x, 0.012683313339948654f));
  float _43 = (pow(_32.y, 0.012683313339948654f));
  float _44 = (pow(_32.z, 0.012683313339948654f));
  float _69 = exp2(log2(max(0.0f, (_42 + -0.8359375f)) / (18.8515625f - (_42 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _70 = exp2(log2(max(0.0f, (_43 + -0.8359375f)) / (18.8515625f - (_43 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _71 = exp2(log2(max(0.0f, (_44 + -0.8359375f)) / (18.8515625f - (_44 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
  float _72 = TEXCOORD.x * 2.0f;
  float _74 = TEXCOORD.y * 2.0f;
  int _79 = WaveReadLaneFirst(_materialIndex);
  int _87 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_79 < (uint)170000), _79, 0)) + 0u))]._subspaceTex);
  float4 _94 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_87 < (uint)65000), _87, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2((_29 * _72), ((_time.x * 0.10000000149011612f) + _74)));
  int _98 = WaveReadLaneFirst(_materialIndex);
  float _109 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_98 < (uint)170000), _98, 0)) + 0u))]._subspaceInfo.x);
  float _110 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_98 < (uint)170000), _98, 0)) + 0u))]._subspaceInfo.y);
  float _111 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_98 < (uint)170000), _98, 0)) + 0u))]._subspaceInfo.z);
  int _113 = WaveReadLaneFirst(_materialIndex);
  int _128 = WaveReadLaneFirst(_materialIndex);
  float _137 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_128 < (uint)170000), _128, 0)) + 0u))]._subspaceRatio) * WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_113 < (uint)170000), _113, 0)) + 0u))]._subspaceInfo.w);
  float _142 = _109 - _viewPos.x;
  float _143 = _110 - _viewPos.y;
  float _144 = _111 - _viewPos.z;
  float _172 = mad((_viewProjRelative[3].z), _144, mad((_viewProjRelative[3].y), _143, ((_viewProjRelative[3].x) * _142))) + (_viewProjRelative[3].w);
  float _173 = (mad((_viewProjRelative[0].z), _144, mad((_viewProjRelative[0].y), _143, ((_viewProjRelative[0].x) * _142))) + (_viewProjRelative[0].w)) / _172;
  float _177 = 0.5f - (((mad((_viewProjRelative[1].z), _144, mad((_viewProjRelative[1].y), _143, ((_viewProjRelative[1].x) * _142))) + (_viewProjRelative[1].w)) / _172) * 0.5f);
  float _187 = ((_view[0].x) * _137) + _142;
  float _188 = ((_view[0].y) * _137) + _143;
  float _189 = ((_view[0].z) * _137) + _144;
  float _201 = mad((_viewProjRelative[3].z), _189, mad((_viewProjRelative[3].y), _188, (_187 * (_viewProjRelative[3].x)))) + (_viewProjRelative[3].w);
  float _207 = (0.5f - (((mad((_viewProjRelative[1].z), _189, mad((_viewProjRelative[1].y), _188, (_187 * (_viewProjRelative[1].x)))) + (_viewProjRelative[1].w)) / _201) * 0.5f)) - _177;
  float _209 = (_29 * 0.5f) * (((mad((_viewProjRelative[0].z), _189, mad((_viewProjRelative[0].y), _188, (_187 * (_viewProjRelative[0].x)))) + (_viewProjRelative[0].w)) / _201) - _173);
  float _216 = TEXCOORD.y - _177;
  float _217 = ((TEXCOORD.x + -0.5f) - (_173 * 0.5f)) * _29;
  float _235 = float((bool)(uint)(dot(float3(_142, _143, _144), float3(_viewDir.x, _viewDir.y, _viewDir.z)) > 0.0f)) * saturate((1.0f - saturate(sqrt((_216 * _216) + (_217 * _217)) / max(0.0010000000474974513f, sqrt((_207 * _207) + (_209 * _209))))) * 5.0f);
  float _566;
  float _567;
  float _568;
  float _579;
  float _580;
  float _581;
  float _582;
  float _605;
  float _851;
  float _852;
  float _853;
  float _973;
  float _974;
  float _975;
  float _994;
  float _995;
  float _996;
  float _1029;
  float _1030;
  float _1031;
  float _1045;
  float _1046;
  float _1047;
  if (_235 > 0.0f) {
    float _240 = __3__36__0__0__g_depth.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
    float _242 = _72 + -1.0f;
    float _243 = 1.0f - _74;
    float _244 = max(1.0000000116860974e-07f, _240.x);
    float _280 = mad((_invViewProj[3].z), _244, mad((_invViewProj[3].y), _243, ((_invViewProj[3].x) * _242))) + (_invViewProj[3].w);
    float _281 = (mad((_invViewProj[0].z), _244, mad((_invViewProj[0].y), _243, ((_invViewProj[0].x) * _242))) + (_invViewProj[0].w)) / _280;
    float _282 = (mad((_invViewProj[1].z), _244, mad((_invViewProj[1].y), _243, ((_invViewProj[1].x) * _242))) + (_invViewProj[1].w)) / _280;
    float _283 = (mad((_invViewProj[2].z), _244, mad((_invViewProj[2].y), _243, ((_invViewProj[2].x) * _242))) + (_invViewProj[2].w)) / _280;
    uint _289 = uint(_bufferSizeAndInvSize.x * TEXCOORD.x);
    uint _290 = uint(_bufferSizeAndInvSize.y * TEXCOORD.y);
    uint4 _292 = __3__36__0__0__g_gbufferBaseColor.Load(int3((int)(_289), (int)(_290), 0));
    float4 _295 = __3__36__0__0__g_gbufferNormal.Load(int3((int)(_289), (int)(_290), 0));
    float _313 = (saturate(_295.x * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _314 = (saturate(_295.y * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _315 = (saturate(_295.z * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _317 = rsqrt(dot(float3(_313, _314, _315), float3(_313, _314, _315)));
    float _318 = _317 * _313;
    float _319 = _317 * _314;
    float _320 = _315 * _317;
    float _323 = (float((uint)((uint)(((uint)((uint)(_292.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
    float _324 = (float((uint)((uint)(_292.w & 255))) * 0.007843137718737125f) + -1.0f;
    float _327 = (_323 + _324) * 0.5f;
    float _328 = (_323 - _324) * 0.5f;
    float _332 = (1.0f - abs(_327)) - abs(_328);
    float _334 = rsqrt(dot(float3(_327, _328, _332), float3(_327, _328, _332)));
    float _335 = _334 * _327;
    float _336 = _334 * _328;
    float _337 = _334 * _332;
    float _339 = select((_320 >= 0.0f), 1.0f, -1.0f);
    float _342 = -0.0f - (1.0f / (_339 + _320));
    float _343 = _319 * _342;
    float _344 = _343 * _318;
    float _345 = _339 * _318;
    float _354 = mad(_337, _318, mad(_336, _344, ((((_345 * _318) * _342) + 1.0f) * _335)));
    float _358 = mad(_337, _319, mad(_336, (_339 + (_343 * _319)), ((_335 * _339) * _344)));
    float _362 = mad(_337, _320, mad(_336, (-0.0f - _319), (-0.0f - (_345 * _335))));
    float _364 = rsqrt(dot(float3(_354, _358, _362), float3(_354, _358, _362)));
    float _374 = _281 - _viewPos.x;
    float _375 = _282 - _viewPos.y;
    float _376 = _283 - _viewPos.z;
    float _392 = 1.0f - saturate(dot(float3((_364 * _354), (_364 * _358), (_364 * _362)), float3((-0.0f - _viewDir.x), (-0.0f - _viewDir.y), (-0.0f - _viewDir.z))));
    float _393 = _109 - _281;
    float _394 = _110 - _282;
    float _395 = _111 - _283;
    float _401 = sqrt(((_394 * _394) + (_393 * _393)) + (_395 * _395));
    float _413 = exp2((2.0f - (saturate(saturate(1.0f - (_401 / max(0.0010000000474974513f, (_137 * 3.0f)))) * 2.0f) * 1.7999999523162842f)) * log2(_392));
    int _418 = WaveReadLaneFirst(_materialIndex);
    int _426 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_418 < (uint)170000), _418, 0)) + 0u))]._subspaceColor);
    float _429 = float((uint)((uint)(((uint)((uint)(_426)) >> 16) & 255)));
    float _432 = float((uint)((uint)(((uint)((uint)(_426)) >> 8) & 255)));
    float _434 = float((uint)((uint)(_426 & 255)));
    float _459 = select(((_429 * 0.003921568859368563f) < 0.040449999272823334f), (_429 * 0.0003035269910469651f), exp2(log2((_429 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _460 = select(((_432 * 0.003921568859368563f) < 0.040449999272823334f), (_432 * 0.0003035269910469651f), exp2(log2((_432 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _461 = select(((_434 * 0.003921568859368563f) < 0.040449999272823334f), (_434 * 0.0003035269910469651f), exp2(log2((_434 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    int _462 = WaveReadLaneFirst(_materialIndex);
    int _470 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_462 < (uint)170000), _462, 0)) + 0u))]._subspaceBlendColor);
    float _473 = float((uint)((uint)(((uint)((uint)(_470)) >> 16) & 255)));
    float _476 = float((uint)((uint)(((uint)((uint)(_470)) >> 8) & 255)));
    float _478 = float((uint)((uint)(_470 & 255)));
    int _506 = WaveReadLaneFirst(_materialIndex);
    float _514 = WaveReadLaneFirst(BindlessParameters_PostProcessSubspace_CD[((int)((uint)(select(((uint)_506 < (uint)170000), _506, 0)) + 0u))]._subspaceColorBlendRatio);
    float _527 = saturate(1.0f - (_401 / max(0.0010000000474974513f, _137)));
    float _530 = saturate((_527 * _527) * 2.0f);
    uint2 _539 = __3__36__0__0__g_stencil.Load(int3((int)(uint(_bufferSizeAndInvSize.x * TEXCOORD.x)), (int)(uint(_bufferSizeAndInvSize.y * TEXCOORD.y)), 0));
    if ((uint)((_539.x & 127) + -53) < (uint)15) {
      float _548 = (_392 * _392) * ((_530 * 0.44999998807907104f) + 0.05000000074505806f);
      _566 = _548;
      _567 = _548;
      _568 = _548;
    } else {
      if (((_240.x < 1.0000000116860974e-07f)) || ((_240.x == 1.0f))) {
        _566 = (_94.x * 0.10000000149011612f);
        _567 = (_94.y * 0.10000000149011612f);
        _568 = (_94.z * 0.10000000149011612f);
      } else {
        float4 _560 = __3__36__0__0__g_specularAO.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y), 0.0f);
        float _564 = _560.w * ((_530 * 0.8999999761581421f) + 0.10000000149011612f);
        _566 = _564;
        _567 = _564;
        _568 = _564;
      }
    }
    float _574 = max(0.0010000000474974513f, _exposure0.x);
    _579 = ((_566 * ((_514 * (select(((_473 * 0.003921568859368563f) < 0.040449999272823334f), (_473 * 0.0003035269910469651f), exp2(log2((_473 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _459)) + _459)) / _574);
    _580 = ((_567 * ((_514 * (select(((_476 * 0.003921568859368563f) < 0.040449999272823334f), (_476 * 0.0003035269910469651f), exp2(log2((_476 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _460)) + _460)) / _574);
    _581 = ((_568 * ((_514 * (select(((_478 * 0.003921568859368563f) < 0.040449999272823334f), (_478 * 0.0003035269910469651f), exp2(log2((_478 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) - _461)) + _461)) / _574);
    _582 = ((((1.0f - _413) * saturate(((_137 - sqrt(((_142 * _142) + (_143 * _143)) + (_144 * _144))) + sqrt(((_375 * _375) + (_374 * _374)) + (_376 * _376))) * 5.0f)) + _413) * _235);
  } else {
    _579 = 0.0f;
    _580 = 0.0f;
    _581 = 0.0f;
    _582 = _235;
  }
  float _589 = (_582 * (_579 - _69)) + _69;
  float _590 = (_582 * (_580 - _70)) + _70;
  float _591 = (_582 * (_581 - _71)) + _71;
  uint _592 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _599 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_592), 0));
    _605 = (float((uint)((uint)(_599.x & 127))) + 0.5f);
  } else {
    _605 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_589, _590, _591));
    _973 = output_color.x;
    _974 = output_color.y;
    _975 = output_color.z;
  } else {
    _973 = _589;
    _974 = _590;
    _975 = _591;
  }
  if (_etcParams.y > 1.0f) {
    float _984 = abs(_72 + -1.0f);
    float _985 = abs(_74 + -1.0f);
    float _989 = saturate(1.0f - (dot(float2(_984, _985), float2(_984, _985)) * saturate(_etcParams.y + -1.0f)));
    _994 = (_989 * _973);
    _995 = (_989 * _974);
    _996 = (_989 * _975);
  } else {
    _994 = _973;
    _995 = _974;
    _996 = _975;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _1029 = select((_994 <= 0.0031308000907301903f), (_994 * 12.920000076293945f), (((pow(_994, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1030 = select((_995 <= 0.0031308000907301903f), (_995 * 12.920000076293945f), (((pow(_995, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1031 = select((_996 <= 0.0031308000907301903f), (_996 * 12.920000076293945f), (((pow(_996, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1029 = _994;
    _1030 = _995;
    _1031 = _996;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _1036 = float((uint)_592);
    if (!(_1036 < _viewDir.w)) {
      if (!(_1036 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _1045 = _1029;
        _1046 = _1030;
        _1047 = _1031;
      } else {
        _1045 = 0.0f;
        _1046 = 0.0f;
        _1047 = 0.0f;
      }
    } else {
      _1045 = 0.0f;
      _1046 = 0.0f;
      _1047 = 0.0f;
    }
  } else {
    _1045 = _1029;
    _1046 = _1030;
    _1047 = _1031;
  }
  float _1057 = exp2(log2(_1045 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1058 = exp2(log2(_1046 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1059 = exp2(log2(_1047 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_1057 * 18.6875f) + 1.0f)) * ((_1057 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_1058 * 18.6875f) + 1.0f)) * ((_1058 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_1059 * 18.6875f) + 1.0f)) * ((_1059 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _605;
  return SV_Target;
}

