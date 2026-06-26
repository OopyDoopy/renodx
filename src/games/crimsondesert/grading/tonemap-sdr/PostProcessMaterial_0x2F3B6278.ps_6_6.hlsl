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
  float _725;
  float _726;
  float _727;
  float _741;
  float _946;
  float _947;
  float _948;
  float _1041;
  float _1042;
  float _1043;
  float _1097;
  float _1098;
  float _1099;
  float _1118;
  float _1119;
  float _1120;
  float _1150;
  float _1151;
  float _1152;
  float _1166;
  float _1167;
  float _1168;
  if (_passIndex == 0) {
    int2 _29; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_29.x, _29.y);
    uint _44 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_29.x))))) + 0.5f) * TEXCOORD.x), int((float((int)(int(float((int)(_29.y))))) + 0.5f) * TEXCOORD.y), 0));
    float4 _55 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * TEXCOORD.x), int(_customRenderPassSizeInvSize.y * TEXCOORD.y), 0));
    bool _57 = ((_44.x & 255) == 30);
    float _59 = select(_57, _55.x, 0.0f);
    _725 = select(_57, 1.0f, 0.0f);
    _726 = _59;
    _727 = _59;
  } else {
    if (_passIndex == 1) {
      int _66 = WaveReadLaneFirst(_materialIndex);
      float4 _77 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
      float _84 = (pow(_77.x, 0.012683313339948654f));
      float _85 = (pow(_77.y, 0.012683313339948654f));
      float _103 = WaveReadLaneFirst(BindlessParameters_PostProcessOutlineExample[((int)((uint)(select(((uint)_66 < (uint)170000), _66, 0)) + 0u))]._outlineSize) * (1.0f / _destTargetSizAndInv.x);
      float _104 = _103 * 1.384615421295166f;
      float4 _106 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_104 + TEXCOORD.x), TEXCOORD.y));
      float _113 = (pow(_106.x, 0.012683313339948654f));
      float _114 = (pow(_106.y, 0.012683313339948654f));
      float4 _133 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _104), TEXCOORD.y));
      float _140 = (pow(_133.x, 0.012683313339948654f));
      float _141 = (pow(_133.y, 0.012683313339948654f));
      float _159 = _103 * 3.230769157409668f;
      float4 _161 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_159 + TEXCOORD.x), TEXCOORD.y));
      float _168 = (pow(_161.x, 0.012683313339948654f));
      float _169 = (pow(_161.y, 0.012683313339948654f));
      float4 _188 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _159), TEXCOORD.y));
      float _195 = (pow(_188.x, 0.012683313339948654f));
      float _196 = (pow(_188.y, 0.012683313339948654f));
      _725 = ((((exp2(log2(max(0.0f, (_140 + -0.8359375f)) / (18.8515625f - (_140 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_113 + -0.8359375f)) / (18.8515625f - (_113 * 18.6875f))) * 6.277394771575928f)) * 3162.162353515625f) + (exp2(log2(max(0.0f, (_84 + -0.8359375f)) / (18.8515625f - (_84 * 18.6875f))) * 6.277394771575928f) * 2270.270263671875f)) + ((exp2(log2(max(0.0f, (_195 + -0.8359375f)) / (18.8515625f - (_195 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_168 + -0.8359375f)) / (18.8515625f - (_168 * 18.6875f))) * 6.277394771575928f)) * 702.7026977539062f));
      _726 = max(max(max(max(max(0.0f, (exp2(log2(max(0.0f, (_85 + -0.8359375f)) / (18.8515625f - (_85 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_114 + -0.8359375f)) / (18.8515625f - (_114 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_141 + -0.8359375f)) / (18.8515625f - (_141 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_169 + -0.8359375f)) / (18.8515625f - (_169 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_196 + -0.8359375f)) / (18.8515625f - (_196 * 18.6875f))) * 6.277394771575928f) * 10000.0f));
      _727 = 0.0f;
    } else {
      if (_passIndex == 2) {
        int _232 = WaveReadLaneFirst(_materialIndex);
        float4 _243 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
        float _250 = (pow(_243.x, 0.012683313339948654f));
        float _251 = (pow(_243.y, 0.012683313339948654f));
        float _269 = WaveReadLaneFirst(BindlessParameters_PostProcessOutlineExample[((int)((uint)(select(((uint)_232 < (uint)170000), _232, 0)) + 0u))]._outlineSize) * (1.0f / _destTargetSizAndInv.y);
        float _270 = _269 * 1.384615421295166f;
        float4 _272 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (_270 + TEXCOORD.y)));
        float _279 = (pow(_272.x, 0.012683313339948654f));
        float _280 = (pow(_272.y, 0.012683313339948654f));
        float4 _299 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (TEXCOORD.y - _270)));
        float _306 = (pow(_299.x, 0.012683313339948654f));
        float _307 = (pow(_299.y, 0.012683313339948654f));
        float _325 = _269 * 3.230769157409668f;
        float4 _327 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (_325 + TEXCOORD.y)));
        float _334 = (pow(_327.x, 0.012683313339948654f));
        float _335 = (pow(_327.y, 0.012683313339948654f));
        float4 _354 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (TEXCOORD.y - _325)));
        float _361 = (pow(_354.x, 0.012683313339948654f));
        float _362 = (pow(_354.y, 0.012683313339948654f));
        _725 = ((((exp2(log2(max(0.0f, (_306 + -0.8359375f)) / (18.8515625f - (_306 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_279 + -0.8359375f)) / (18.8515625f - (_279 * 18.6875f))) * 6.277394771575928f)) * 3162.162353515625f) + (exp2(log2(max(0.0f, (_250 + -0.8359375f)) / (18.8515625f - (_250 * 18.6875f))) * 6.277394771575928f) * 2270.270263671875f)) + ((exp2(log2(max(0.0f, (_361 + -0.8359375f)) / (18.8515625f - (_361 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_334 + -0.8359375f)) / (18.8515625f - (_334 * 18.6875f))) * 6.277394771575928f)) * 702.7026977539062f));
        _726 = max(max(max(max(max(0.0f, (exp2(log2(max(0.0f, (_251 + -0.8359375f)) / (18.8515625f - (_251 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_280 + -0.8359375f)) / (18.8515625f - (_280 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_307 + -0.8359375f)) / (18.8515625f - (_307 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_335 + -0.8359375f)) / (18.8515625f - (_335 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_362 + -0.8359375f)) / (18.8515625f - (_362 * 18.6875f))) * 6.277394771575928f) * 10000.0f));
        _727 = 0.0f;
      } else {
        if (_passIndex == 3) {
          int _398 = WaveReadLaneFirst(_materialIndex);
          float4 _409 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
          float _416 = (pow(_409.x, 0.012683313339948654f));
          float _417 = (pow(_409.y, 0.012683313339948654f));
          float _435 = WaveReadLaneFirst(BindlessParameters_PostProcessOutlineExample[((int)((uint)(select(((uint)_398 < (uint)170000), _398, 0)) + 0u))]._outlineSize) * (1.0f / _destTargetSizAndInv.x);
          float _436 = _435 * 1.384615421295166f;
          float4 _438 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_436 + TEXCOORD.x), TEXCOORD.y));
          float _445 = (pow(_438.x, 0.012683313339948654f));
          float _446 = (pow(_438.y, 0.012683313339948654f));
          float4 _465 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _436), TEXCOORD.y));
          float _472 = (pow(_465.x, 0.012683313339948654f));
          float _473 = (pow(_465.y, 0.012683313339948654f));
          float _491 = _435 * 3.230769157409668f;
          float4 _493 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_491 + TEXCOORD.x), TEXCOORD.y));
          float _500 = (pow(_493.x, 0.012683313339948654f));
          float _501 = (pow(_493.y, 0.012683313339948654f));
          float4 _520 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _491), TEXCOORD.y));
          float _527 = (pow(_520.x, 0.012683313339948654f));
          float _528 = (pow(_520.y, 0.012683313339948654f));
          _725 = ((((exp2(log2(max(0.0f, (_472 + -0.8359375f)) / (18.8515625f - (_472 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_445 + -0.8359375f)) / (18.8515625f - (_445 * 18.6875f))) * 6.277394771575928f)) * 3162.162353515625f) + (exp2(log2(max(0.0f, (_416 + -0.8359375f)) / (18.8515625f - (_416 * 18.6875f))) * 6.277394771575928f) * 2270.270263671875f)) + ((exp2(log2(max(0.0f, (_527 + -0.8359375f)) / (18.8515625f - (_527 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_500 + -0.8359375f)) / (18.8515625f - (_500 * 18.6875f))) * 6.277394771575928f)) * 702.7026977539062f));
          _726 = max(max(max(max(max(0.0f, (exp2(log2(max(0.0f, (_417 + -0.8359375f)) / (18.8515625f - (_417 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_446 + -0.8359375f)) / (18.8515625f - (_446 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_473 + -0.8359375f)) / (18.8515625f - (_473 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_501 + -0.8359375f)) / (18.8515625f - (_501 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_528 + -0.8359375f)) / (18.8515625f - (_528 * 18.6875f))) * 6.277394771575928f) * 10000.0f));
          _727 = 0.0f;
        } else {
          if (_passIndex == 4) {
            int _564 = WaveReadLaneFirst(_materialIndex);
            float4 _575 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
            float _582 = (pow(_575.x, 0.012683313339948654f));
            float _583 = (pow(_575.y, 0.012683313339948654f));
            float _601 = WaveReadLaneFirst(BindlessParameters_PostProcessOutlineExample[((int)((uint)(select(((uint)_564 < (uint)170000), _564, 0)) + 0u))]._outlineSize) * (1.0f / _destTargetSizAndInv.y);
            float _602 = _601 * 1.384615421295166f;
            float4 _604 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (_602 + TEXCOORD.y)));
            float _611 = (pow(_604.x, 0.012683313339948654f));
            float _612 = (pow(_604.y, 0.012683313339948654f));
            float4 _631 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (TEXCOORD.y - _602)));
            float _638 = (pow(_631.x, 0.012683313339948654f));
            float _639 = (pow(_631.y, 0.012683313339948654f));
            float _657 = _601 * 3.230769157409668f;
            float4 _659 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (_657 + TEXCOORD.y)));
            float _666 = (pow(_659.x, 0.012683313339948654f));
            float _667 = (pow(_659.y, 0.012683313339948654f));
            float4 _686 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (TEXCOORD.y - _657)));
            float _693 = (pow(_686.x, 0.012683313339948654f));
            float _694 = (pow(_686.y, 0.012683313339948654f));
            _725 = ((((exp2(log2(max(0.0f, (_638 + -0.8359375f)) / (18.8515625f - (_638 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_611 + -0.8359375f)) / (18.8515625f - (_611 * 18.6875f))) * 6.277394771575928f)) * 3162.162353515625f) + (exp2(log2(max(0.0f, (_582 + -0.8359375f)) / (18.8515625f - (_582 * 18.6875f))) * 6.277394771575928f) * 2270.270263671875f)) + ((exp2(log2(max(0.0f, (_693 + -0.8359375f)) / (18.8515625f - (_693 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_666 + -0.8359375f)) / (18.8515625f - (_666 * 18.6875f))) * 6.277394771575928f)) * 702.7026977539062f));
            _726 = max(max(max(max(max(0.0f, (exp2(log2(max(0.0f, (_583 + -0.8359375f)) / (18.8515625f - (_583 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_612 + -0.8359375f)) / (18.8515625f - (_612 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_639 + -0.8359375f)) / (18.8515625f - (_639 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_667 + -0.8359375f)) / (18.8515625f - (_667 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_694 + -0.8359375f)) / (18.8515625f - (_694 * 18.6875f))) * 6.277394771575928f) * 10000.0f));
            _727 = 0.0f;
          } else {
            _725 = 0.0f;
            _726 = 0.0f;
            _727 = 0.0f;
          }
        }
      }
    }
  }
  uint _728 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _735 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_728), 0));
    _741 = (float((uint)((uint)(_735.x & 127))) + 0.5f);
  } else {
    _741 = 1.0f;
  }
  bool _744 = (_localToneMappingParams.w > 0.0f);
  if (_744) {
    float3 output_color = TonemapReplacer(float3(_725, _726, _727));
    _1097 = output_color.x;
    _1098 = output_color.y;
    _1099 = output_color.z;
  } else {
    _1097 = _725;
    _1098 = _726;
    _1099 = _727;
  }
  if (_etcParams.y > 1.0f) {
    float _1108 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _1109 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _1113 = saturate(1.0f - (dot(float2(_1108, _1109), float2(_1108, _1109)) * saturate(_etcParams.y + -1.0f)));
    _1118 = (_1113 * _1097);
    _1119 = (_1113 * _1098);
    _1120 = (_1113 * _1099);
  } else {
    _1118 = _1097;
    _1119 = _1098;
    _1120 = _1099;
  }
  if ((_744) && ((_etcParams.z > 0.0f))) {
    _1150 = select((_1118 <= 0.0031308000907301903f), (_1118 * 12.920000076293945f), (((pow(_1118, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1151 = select((_1119 <= 0.0031308000907301903f), (_1119 * 12.920000076293945f), (((pow(_1119, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1152 = select((_1120 <= 0.0031308000907301903f), (_1120 * 12.920000076293945f), (((pow(_1120, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1150 = _1118;
    _1151 = _1119;
    _1152 = _1120;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _1157 = float((uint)_728);
    if (!(_1157 < _viewDir.w)) {
      if (!(_1157 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _1166 = _1150;
        _1167 = _1151;
        _1168 = _1152;
      } else {
        _1166 = 0.0f;
        _1167 = 0.0f;
        _1168 = 0.0f;
      }
    } else {
      _1166 = 0.0f;
      _1167 = 0.0f;
      _1168 = 0.0f;
    }
  } else {
    _1166 = _1150;
    _1167 = _1151;
    _1168 = _1152;
  }
  float _1178 = exp2(log2(_1166 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1179 = exp2(log2(_1167 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1180 = exp2(log2(_1168 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_1178 * 18.6875f) + 1.0f)) * ((_1178 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_1179 * 18.6875f) + 1.0f)) * ((_1179 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_1180 * 18.6875f) + 1.0f)) * ((_1180 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _741;
  return SV_Target;
}