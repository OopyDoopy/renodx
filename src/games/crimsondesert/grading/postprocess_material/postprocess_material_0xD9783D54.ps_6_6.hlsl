#include "../tonemap.hlsli"

struct PostProcessOutlineExampleStruct {
  uint _outlineColor;
  float _outlineSize;
};


Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t44, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t38, space36);

Texture2D<uint> __3__36__0__0__g_CustomRenderPassValue : register(t65, space36);

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

cbuffer __3__1__0__0__PostProcessSizeConstant : register(b1, space1) {
  float4 _srcTargetSizeAndInv : packoffset(c000.x);
  float4 _destTargetSizAndInv : packoffset(c001.x);
};

cbuffer __3__1__0__0__PostProcessMaterialIndex : register(b2, space1) {
  int _materialIndex : packoffset(c000.x);
  int _passIndex : packoffset(c000.y);
};

ConstantBuffer<PostProcessOutlineExampleStruct> BindlessParameters_PostProcessOutlineExample[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _20[36];
  float _724;
  float _725;
  float _726;
  float _740;
  float _986;
  float _987;
  float _988;
  float _1108;
  float _1109;
  float _1110;
  float _1131;
  float _1132;
  float _1133;
  float _1166;
  float _1167;
  float _1168;
  float _1182;
  float _1183;
  float _1184;
  if (_passIndex == 0) {
    int2 _28; __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_28.x, _28.y);
    uint _43 = __3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)(_28.x))))) + 0.5f) * TEXCOORD.x), int((float((int)(int(float((int)(_28.y))))) + 0.5f) * TEXCOORD.y), 0));
    float4 _54 = __3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(_customRenderPassSizeInvSize.x * TEXCOORD.x), int(_customRenderPassSizeInvSize.y * TEXCOORD.y), 0));
    bool _56 = ((_43.x & 255) == 30);
    float _58 = select(_56, _54.x, 0.0f);
    _724 = select(_56, 1.0f, 0.0f);
    _725 = _58;
    _726 = _58;
  } else {
    if (_passIndex == 1) {
      int _65 = WaveReadLaneFirst(_materialIndex);
      float4 _76 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
      float _83 = (pow(_76.x, 0.012683313339948654f));
      float _84 = (pow(_76.y, 0.012683313339948654f));
      float _102 = WaveReadLaneFirst(BindlessParameters_PostProcessOutlineExample[((int)((uint)(select(((uint)_65 < (uint)170000), _65, 0)) + 0u))]._outlineSize) * (1.0f / _destTargetSizAndInv.x);
      float _103 = _102 * 1.384615421295166f;
      float4 _105 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_103 + TEXCOORD.x), TEXCOORD.y));
      float _112 = (pow(_105.x, 0.012683313339948654f));
      float _113 = (pow(_105.y, 0.012683313339948654f));
      float4 _132 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _103), TEXCOORD.y));
      float _139 = (pow(_132.x, 0.012683313339948654f));
      float _140 = (pow(_132.y, 0.012683313339948654f));
      float _158 = _102 * 3.230769157409668f;
      float4 _160 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_158 + TEXCOORD.x), TEXCOORD.y));
      float _167 = (pow(_160.x, 0.012683313339948654f));
      float _168 = (pow(_160.y, 0.012683313339948654f));
      float4 _187 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _158), TEXCOORD.y));
      float _194 = (pow(_187.x, 0.012683313339948654f));
      float _195 = (pow(_187.y, 0.012683313339948654f));
      _724 = ((((exp2(log2(max(0.0f, (_139 + -0.8359375f)) / (18.8515625f - (_139 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_112 + -0.8359375f)) / (18.8515625f - (_112 * 18.6875f))) * 6.277394771575928f)) * 3162.162353515625f) + (exp2(log2(max(0.0f, (_83 + -0.8359375f)) / (18.8515625f - (_83 * 18.6875f))) * 6.277394771575928f) * 2270.270263671875f)) + ((exp2(log2(max(0.0f, (_194 + -0.8359375f)) / (18.8515625f - (_194 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_167 + -0.8359375f)) / (18.8515625f - (_167 * 18.6875f))) * 6.277394771575928f)) * 702.7026977539062f));
      _725 = max(max(max(max(max(0.0f, (exp2(log2(max(0.0f, (_84 + -0.8359375f)) / (18.8515625f - (_84 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_113 + -0.8359375f)) / (18.8515625f - (_113 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_140 + -0.8359375f)) / (18.8515625f - (_140 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_168 + -0.8359375f)) / (18.8515625f - (_168 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_195 + -0.8359375f)) / (18.8515625f - (_195 * 18.6875f))) * 6.277394771575928f) * 10000.0f));
      _726 = 0.0f;
    } else {
      if (_passIndex == 2) {
        int _231 = WaveReadLaneFirst(_materialIndex);
        float4 _242 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
        float _249 = (pow(_242.x, 0.012683313339948654f));
        float _250 = (pow(_242.y, 0.012683313339948654f));
        float _268 = WaveReadLaneFirst(BindlessParameters_PostProcessOutlineExample[((int)((uint)(select(((uint)_231 < (uint)170000), _231, 0)) + 0u))]._outlineSize) * (1.0f / _destTargetSizAndInv.y);
        float _269 = _268 * 1.384615421295166f;
        float4 _271 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (_269 + TEXCOORD.y)));
        float _278 = (pow(_271.x, 0.012683313339948654f));
        float _279 = (pow(_271.y, 0.012683313339948654f));
        float4 _298 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (TEXCOORD.y - _269)));
        float _305 = (pow(_298.x, 0.012683313339948654f));
        float _306 = (pow(_298.y, 0.012683313339948654f));
        float _324 = _268 * 3.230769157409668f;
        float4 _326 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (_324 + TEXCOORD.y)));
        float _333 = (pow(_326.x, 0.012683313339948654f));
        float _334 = (pow(_326.y, 0.012683313339948654f));
        float4 _353 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (TEXCOORD.y - _324)));
        float _360 = (pow(_353.x, 0.012683313339948654f));
        float _361 = (pow(_353.y, 0.012683313339948654f));
        _724 = ((((exp2(log2(max(0.0f, (_305 + -0.8359375f)) / (18.8515625f - (_305 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_278 + -0.8359375f)) / (18.8515625f - (_278 * 18.6875f))) * 6.277394771575928f)) * 3162.162353515625f) + (exp2(log2(max(0.0f, (_249 + -0.8359375f)) / (18.8515625f - (_249 * 18.6875f))) * 6.277394771575928f) * 2270.270263671875f)) + ((exp2(log2(max(0.0f, (_360 + -0.8359375f)) / (18.8515625f - (_360 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_333 + -0.8359375f)) / (18.8515625f - (_333 * 18.6875f))) * 6.277394771575928f)) * 702.7026977539062f));
        _725 = max(max(max(max(max(0.0f, (exp2(log2(max(0.0f, (_250 + -0.8359375f)) / (18.8515625f - (_250 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_279 + -0.8359375f)) / (18.8515625f - (_279 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_306 + -0.8359375f)) / (18.8515625f - (_306 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_334 + -0.8359375f)) / (18.8515625f - (_334 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_361 + -0.8359375f)) / (18.8515625f - (_361 * 18.6875f))) * 6.277394771575928f) * 10000.0f));
        _726 = 0.0f;
      } else {
        if (_passIndex == 3) {
          int _397 = WaveReadLaneFirst(_materialIndex);
          float4 _408 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
          float _415 = (pow(_408.x, 0.012683313339948654f));
          float _416 = (pow(_408.y, 0.012683313339948654f));
          float _434 = WaveReadLaneFirst(BindlessParameters_PostProcessOutlineExample[((int)((uint)(select(((uint)_397 < (uint)170000), _397, 0)) + 0u))]._outlineSize) * (1.0f / _destTargetSizAndInv.x);
          float _435 = _434 * 1.384615421295166f;
          float4 _437 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_435 + TEXCOORD.x), TEXCOORD.y));
          float _444 = (pow(_437.x, 0.012683313339948654f));
          float _445 = (pow(_437.y, 0.012683313339948654f));
          float4 _464 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _435), TEXCOORD.y));
          float _471 = (pow(_464.x, 0.012683313339948654f));
          float _472 = (pow(_464.y, 0.012683313339948654f));
          float _490 = _434 * 3.230769157409668f;
          float4 _492 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_490 + TEXCOORD.x), TEXCOORD.y));
          float _499 = (pow(_492.x, 0.012683313339948654f));
          float _500 = (pow(_492.y, 0.012683313339948654f));
          float4 _519 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _490), TEXCOORD.y));
          float _526 = (pow(_519.x, 0.012683313339948654f));
          float _527 = (pow(_519.y, 0.012683313339948654f));
          _724 = ((((exp2(log2(max(0.0f, (_471 + -0.8359375f)) / (18.8515625f - (_471 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_444 + -0.8359375f)) / (18.8515625f - (_444 * 18.6875f))) * 6.277394771575928f)) * 3162.162353515625f) + (exp2(log2(max(0.0f, (_415 + -0.8359375f)) / (18.8515625f - (_415 * 18.6875f))) * 6.277394771575928f) * 2270.270263671875f)) + ((exp2(log2(max(0.0f, (_526 + -0.8359375f)) / (18.8515625f - (_526 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_499 + -0.8359375f)) / (18.8515625f - (_499 * 18.6875f))) * 6.277394771575928f)) * 702.7026977539062f));
          _725 = max(max(max(max(max(0.0f, (exp2(log2(max(0.0f, (_416 + -0.8359375f)) / (18.8515625f - (_416 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_445 + -0.8359375f)) / (18.8515625f - (_445 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_472 + -0.8359375f)) / (18.8515625f - (_472 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_500 + -0.8359375f)) / (18.8515625f - (_500 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_527 + -0.8359375f)) / (18.8515625f - (_527 * 18.6875f))) * 6.277394771575928f) * 10000.0f));
          _726 = 0.0f;
        } else {
          if (_passIndex == 4) {
            int _563 = WaveReadLaneFirst(_materialIndex);
            float4 _574 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
            float _581 = (pow(_574.x, 0.012683313339948654f));
            float _582 = (pow(_574.y, 0.012683313339948654f));
            float _600 = WaveReadLaneFirst(BindlessParameters_PostProcessOutlineExample[((int)((uint)(select(((uint)_563 < (uint)170000), _563, 0)) + 0u))]._outlineSize) * (1.0f / _destTargetSizAndInv.y);
            float _601 = _600 * 1.384615421295166f;
            float4 _603 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (_601 + TEXCOORD.y)));
            float _610 = (pow(_603.x, 0.012683313339948654f));
            float _611 = (pow(_603.y, 0.012683313339948654f));
            float4 _630 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (TEXCOORD.y - _601)));
            float _637 = (pow(_630.x, 0.012683313339948654f));
            float _638 = (pow(_630.y, 0.012683313339948654f));
            float _656 = _600 * 3.230769157409668f;
            float4 _658 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (_656 + TEXCOORD.y)));
            float _665 = (pow(_658.x, 0.012683313339948654f));
            float _666 = (pow(_658.y, 0.012683313339948654f));
            float4 _685 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (TEXCOORD.y - _656)));
            float _692 = (pow(_685.x, 0.012683313339948654f));
            float _693 = (pow(_685.y, 0.012683313339948654f));
            _724 = ((((exp2(log2(max(0.0f, (_637 + -0.8359375f)) / (18.8515625f - (_637 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_610 + -0.8359375f)) / (18.8515625f - (_610 * 18.6875f))) * 6.277394771575928f)) * 3162.162353515625f) + (exp2(log2(max(0.0f, (_581 + -0.8359375f)) / (18.8515625f - (_581 * 18.6875f))) * 6.277394771575928f) * 2270.270263671875f)) + ((exp2(log2(max(0.0f, (_692 + -0.8359375f)) / (18.8515625f - (_692 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_665 + -0.8359375f)) / (18.8515625f - (_665 * 18.6875f))) * 6.277394771575928f)) * 702.7026977539062f));
            _725 = max(max(max(max(max(0.0f, (exp2(log2(max(0.0f, (_582 + -0.8359375f)) / (18.8515625f - (_582 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_611 + -0.8359375f)) / (18.8515625f - (_611 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_638 + -0.8359375f)) / (18.8515625f - (_638 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_666 + -0.8359375f)) / (18.8515625f - (_666 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_693 + -0.8359375f)) / (18.8515625f - (_693 * 18.6875f))) * 6.277394771575928f) * 10000.0f));
            _726 = 0.0f;
          } else {
            _724 = 0.0f;
            _725 = 0.0f;
            _726 = 0.0f;
          }
        }
      }
    }
  }
  uint _727 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _734 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_727), 0));
    _740 = (float((uint)((uint)(_734.x & 127))) + 0.5f);
  } else {
    _740 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_724, _725, _726));
    _1108 = output_color.x;
    _1109 = output_color.y;
    _1110 = output_color.z;
  } else {
    _1108 = _724;
    _1109 = _725;
    _1110 = _726;
  }
  if (_etcParams.y > 1.0f) {
    float _1121 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _1122 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _1126 = saturate(1.0f - (dot(float2(_1121, _1122), float2(_1121, _1122)) * saturate(_etcParams.y + -1.0f)));
    _1131 = (_1126 * _1108);
    _1132 = (_1126 * _1109);
    _1133 = (_1126 * _1110);
  } else {
    _1131 = _1108;
    _1132 = _1109;
    _1133 = _1110;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _1166 = select((_1131 <= 0.0031308000907301903f), (_1131 * 12.920000076293945f), (((pow(_1131, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1167 = select((_1132 <= 0.0031308000907301903f), (_1132 * 12.920000076293945f), (((pow(_1132, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1168 = select((_1133 <= 0.0031308000907301903f), (_1133 * 12.920000076293945f), (((pow(_1133, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1166 = _1131;
    _1167 = _1132;
    _1168 = _1133;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _1173 = float((uint)_727);
    if (!(_1173 < _viewDir.w)) {
      if (!(_1173 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _1182 = _1166;
        _1183 = _1167;
        _1184 = _1168;
      } else {
        _1182 = 0.0f;
        _1183 = 0.0f;
        _1184 = 0.0f;
      }
    } else {
      _1182 = 0.0f;
      _1183 = 0.0f;
      _1184 = 0.0f;
    }
  } else {
    _1182 = _1166;
    _1183 = _1167;
    _1184 = _1168;
  }
  float _1194 = exp2(log2(_1182 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1195 = exp2(log2(_1183 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1196 = exp2(log2(_1184 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_1194 * 18.6875f) + 1.0f)) * ((_1194 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_1195 * 18.6875f) + 1.0f)) * ((_1195 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_1196 * 18.6875f) + 1.0f)) * ((_1196 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _740;
  return SV_Target;
}

