struct PostProcessTransition_CDStruct {
  uint _chapterNoiseTex;
  uint _chapterCardTex;
  uint _lensDirtTex;
  float _chapterTransition;
  uint _sceneTintColor;
  uint _chapterCardColor;
  uint _chapterBackgroundColor;
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

ConstantBuffer<PostProcessTransition_CDStruct> BindlessParameters_PostProcessTransition_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _25 = _screenSizeAndInvSize.x / _screenSizeAndInvSize.y;
  float4 _28 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  int _32 = WaveReadLaneFirst(_materialIndex);
  float _40 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_32 < (uint)170000), _32, 0)) + 0u))]._chapterTransition);
  bool _41 = (_40 > 0.5f);
  float _42 = _40 * 2.0f;
  float _44 = select(_41, (2.0f - _42), _42);
  float _143;
  float _216;
  float _289;
  float _536;
  float _619;
  float _858;
  float _859;
  float _860;
  float _925;
  float _926;
  float _927;
  float _941;
  float _1146;
  float _1147;
  float _1148;
  float _1241;
  float _1242;
  float _1243;
  float _1297;
  float _1298;
  float _1299;
  float _1318;
  float _1319;
  float _1320;
  float _1350;
  float _1351;
  float _1352;
  float _1366;
  float _1367;
  float _1368;
  if (_44 > 0.0f) {
    float _47 = _25 * TEXCOORD.x;
    int _55 = WaveReadLaneFirst(_materialIndex);
    int _63 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_55 < (uint)170000), _55, 0)) + 0u))]._chapterNoiseTex);
    float4 _70 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_63 < (uint)65000), _63, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((_47 * 4.0f) - ((_44 * TEXCOORD.x) * rsqrt(TEXCOORD.x * TEXCOORD.x))), (TEXCOORD.y * 4.0f)));
    float _74 = (_70.x * 0.009999999776482582f) + -0.004980391822755337f;
    float _76 = (_70.y * 0.009999999776482582f) + -0.004980391822755337f;
    float _78 = (_70.y * 0.03999999910593033f) + -0.019921567291021347f;
    float _79 = saturate(_44);
    float _81 = saturate(_79 * 2.0f);
    float _85 = TEXCOORD.x + -0.5f;
    float _86 = select(_41, -1.0f, 1.0f) + _85;
    float _88 = TEXCOORD.y + -0.5f;
    float _89 = (_74 * _81) + _88;
    float _90 = ((_78 * _81) + _86) * _25;
    float _91 = _90 * 32.0f;
    float _92 = _89 * 32.0f;
    float _102 = frac(sin(dot(float2((ceil(_91 + 0.5f) * 0.125f), (ceil(_92 + 0.5f) * 0.125f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.546875f);
    float _103 = round(_91);
    float _104 = round(_92);
    float _114 = saturate(((0.25f - (_79 * 3.0f)) + (sqrt((_104 * _104) + (_103 * _103)) * 0.03125f)) * 0.800000011920929f);
    float _115 = 1.0f - _114;
    if (!(!(_115 >= 0.0010000000474974513f))) {
      float _118 = _115 * -9.6875f;
      float _130 = _114 * 0.1666666716337204f;
      float _131 = _115 * 0.3125f;
      _143 = float((bool)((uint)(((abs((_131 * ((_90 * (_118 + 32.0f)) - _103)) * (1.0f - frac(_102 * 7.0f))) < _130)) && ((abs((_131 * ((_89 * (_118 + 32.0f)) - _104)) * frac(_102 * 3.0f)) < _130)))));
    } else {
      _143 = 1.0f;
    }
    float _152 = saturate(1.0f - abs((saturate(_115 - ((_102 + -0.5f) * 0.125f)) * 3.0f) + -2.0f));
    float _153 = _152 * _152;
    float _154 = _153 * _153;
    float _156 = saturate(_44 + -0.0833333358168602f);
    float _158 = saturate(_156 * 2.0f);
    float _162 = (_158 * _74) + _88;
    float _163 = ((_158 * _78) + _86) * _25;
    float _164 = _163 * 16.0f;
    float _165 = _162 * 16.0f;
    float _175 = frac(sin(dot(float2((ceil(_164 + 0.5f) * 0.25f), (ceil(_165 + 0.5f) * 0.25f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.546875f);
    float _176 = round(_164);
    float _177 = round(_165);
    float _187 = saturate(((0.25f - (_156 * 3.0f)) + (sqrt((_177 * _177) + (_176 * _176)) * 0.0625f)) * 0.800000011920929f);
    float _188 = 1.0f - _187;
    if (!(!(_188 >= 0.0010000000474974513f))) {
      float _191 = _188 * -4.6875f;
      float _203 = _187 * 0.1666666716337204f;
      float _204 = _188 * 0.3125f;
      _216 = float((bool)((uint)(((abs((_204 * ((_163 * (_191 + 16.0f)) - _176)) * (1.0f - frac(_175 * 7.0f))) < _203)) && ((abs((_204 * ((_162 * (_191 + 16.0f)) - _177)) * frac(_175 * 3.0f)) < _203)))));
    } else {
      _216 = 1.0f;
    }
    float _225 = saturate(1.0f - abs((saturate(_188 - ((_175 + -0.5f) * 0.125f)) * 3.0f) + -2.0f));
    float _226 = _225 * _225;
    float _227 = _226 * _226;
    float _229 = saturate(_44 + -0.1666666716337204f);
    float _231 = saturate(_229 * 2.0f);
    float _235 = (_231 * _74) + _88;
    float _236 = ((_231 * _78) + _86) * _25;
    float _237 = _236 * 10.666666984558105f;
    float _238 = _235 * 10.666666984558105f;
    float _248 = frac(sin(dot(float2((ceil(_237 + 0.5f) * 0.375f), (ceil(_238 + 0.5f) * 0.375f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.546875f);
    float _249 = round(_237);
    float _250 = round(_238);
    float _260 = saturate(((0.25f - (_229 * 3.0f)) + (sqrt((_250 * _250) + (_249 * _249)) * 0.09375f)) * 0.800000011920929f);
    float _261 = 1.0f - _260;
    if (!(!(_261 >= 0.0010000000474974513f))) {
      float _264 = _261 * -3.0208334922790527f;
      float _276 = _260 * 0.1666666716337204f;
      float _277 = _261 * 0.3125f;
      _289 = float((bool)((uint)(((abs((_277 * ((_236 * (_264 + 10.666666984558105f)) - _249)) * (1.0f - frac(_248 * 7.0f))) < _276)) && ((abs((_277 * ((_235 * (_264 + 10.666666984558105f)) - _250)) * frac(_248 * 3.0f)) < _276)))));
    } else {
      _289 = 1.0f;
    }
    float _298 = saturate(1.0f - abs((saturate(_261 - ((_248 + -0.5f) * 0.125f)) * 3.0f) + -2.0f));
    float _299 = _298 * _298;
    float _300 = _299 * _299;
    int _301 = WaveReadLaneFirst(_materialIndex);
    int _309 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_301 < (uint)170000), _301, 0)) + 0u))]._chapterBackgroundColor);
    float _312 = float((uint)((uint)(((uint)((uint)(_309)) >> 16) & 255)));
    float _315 = float((uint)((uint)(((uint)((uint)(_309)) >> 8) & 255)));
    float _317 = float((uint)((uint)(_309 & 255)));
    float _342 = select(((_312 * 0.003921568859368563f) < 0.040449999272823334f), (_312 * 0.0003035269910469651f), exp2(log2((_312 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _343 = select(((_315 * 0.003921568859368563f) < 0.040449999272823334f), (_315 * 0.0003035269910469651f), exp2(log2((_315 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _344 = select(((_317 * 0.003921568859368563f) < 0.040449999272823334f), (_317 * 0.0003035269910469651f), exp2(log2((_317 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    int _345 = WaveReadLaneFirst(_materialIndex);
    int _353 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_345 < (uint)170000), _345, 0)) + 0u))]._chapterCardColor);
    float _356 = float((uint)((uint)(((uint)((uint)(_353)) >> 16) & 255)));
    float _359 = float((uint)((uint)(((uint)((uint)(_353)) >> 8) & 255)));
    float _361 = float((uint)((uint)(_353 & 255)));
    float _386 = select(((_356 * 0.003921568859368563f) < 0.040449999272823334f), (_356 * 0.0003035269910469651f), exp2(log2((_356 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _387 = select(((_359 * 0.003921568859368563f) < 0.040449999272823334f), (_359 * 0.0003035269910469651f), exp2(log2((_359 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _388 = select(((_361 * 0.003921568859368563f) < 0.040449999272823334f), (_361 * 0.0003035269910469651f), exp2(log2((_361 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    int _389 = WaveReadLaneFirst(_materialIndex);
    int _397 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_389 < (uint)170000), _389, 0)) + 0u))]._sceneTintColor);
    float _400 = float((uint)((uint)(((uint)((uint)(_397)) >> 16) & 255)));
    float _403 = float((uint)((uint)(((uint)((uint)(_397)) >> 8) & 255)));
    float _405 = float((uint)((uint)(_397 & 255)));
    float _430 = select(((_400 * 0.003921568859368563f) < 0.040449999272823334f), (_400 * 0.0003035269910469651f), exp2(log2((_400 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _431 = select(((_403 * 0.003921568859368563f) < 0.040449999272823334f), (_403 * 0.0003035269910469651f), exp2(log2((_403 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _432 = select(((_405 * 0.003921568859368563f) < 0.040449999272823334f), (_405 * 0.0003035269910469651f), exp2(log2((_405 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float4 _437 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_74 + TEXCOORD.x), (_76 + TEXCOORD.y)));
    float _454 = saturate(_44 * 4.0f);
    if (_44 > 0.20000000298023224f) {
      float _463 = _25 * _85;
      float _471 = ((((0.5f - TEXCOORD.y) + _463) * 0.7071067690849304f) + _78) + _74;
      float _473 = (((_463 + _88) * 0.7071067690849304f) + _74) + _76;
      float _474 = _471 * 16.0f;
      float _475 = _473 * 16.0f;
      float _485 = frac(sin(dot(float2((ceil(_474 + 0.5f) * 0.25f), (ceil(_475 + 0.5f) * 0.25f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.546875f);
      float _486 = round(_474);
      float _487 = round(_475);
      float _496 = saturate(((0.800000011920929f - (_44 * 0.800000011920929f)) + (sqrt((_487 * _487) + (_486 * _486)) * 0.0625f)) * 1.25f);
      float _497 = 1.0f - _496;
      if (!(!(_497 >= 0.0010000000474974513f))) {
        float _504 = sin((_time.x * _485) + 0.800000011920929f);
        bool _506 = (frac(_485) > 0.5f);
        float _509 = _497 * -3.0f;
        float _523 = _496 * 0.1666666716337204f;
        float _524 = _497 * 0.20000000298023224f;
        _536 = float((bool)((uint)(((abs(((1.0f - frac(_485 * 7.0f)) * _524) * (((_471 * (_509 + 16.0f)) - _486) + select(_506, _504, 0.0f))) < _523)) && ((abs((frac(_485 * 3.0f) * _524) * (((_473 * (_509 + 16.0f)) - _487) + select(_506, 0.0f, _504))) < _523)))));
      } else {
        _536 = 1.0f;
      }
      float _545 = saturate(1.0f - abs((saturate(_497 - ((_485 + -0.5f) * 0.125f)) * 3.0f) + -2.0f));
      float _546 = _545 * _545;
      float _549 = (_536 * 0.2999999523162842f) * (_546 * _546);
      float _553 = (_549 * _342) + _342;
      float _554 = (_549 * _343) + _343;
      float _555 = (_549 * _344) + _344;
      float _557 = _471 * 8.0f;
      float _558 = _473 * 8.0f;
      float _568 = frac(sin(dot(float2((ceil(_557 + 0.5f) * 0.5f), (ceil(_558 + 0.5f) * 0.5f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.546875f);
      float _569 = round(_557);
      float _570 = round(_558);
      float _579 = saturate(((1.25f - (_44 * 1.4249999523162842f)) + (sqrt((_570 * _570) + (_569 * _569)) * 0.125f)) * 0.800000011920929f);
      float _580 = 1.0f - _579;
      if (!(!(_580 >= 0.0010000000474974513f))) {
        float _587 = sin((_time.x * _568) + 1.25f);
        bool _589 = (frac(_568) > 0.5f);
        float _592 = _580 * -2.1875f;
        float _606 = _579 * 0.1666666716337204f;
        float _607 = _580 * 0.3125f;
        _619 = float((bool)((uint)(((abs(((1.0f - frac(_568 * 7.0f)) * _607) * (((_471 * (_592 + 8.0f)) - _569) + select(_589, _587, 0.0f))) < _606)) && ((abs((frac(_568 * 3.0f) * _607) * (((_473 * (_592 + 8.0f)) - _570) + select(_589, 0.0f, _587))) < _606)))));
      } else {
        _619 = 1.0f;
      }
      float _628 = saturate(1.0f - abs((saturate(_580 - ((_568 + -0.5f) * 0.125f)) * 3.0f) + -2.0f));
      float _629 = _628 * _628;
      float _632 = (_619 * 0.6000000238418579f) * (_629 * _629);
      float _640 = _88 * _88;
      float _647 = 1.0f - (exp2(log2(sqrt((_463 * _463) + _640)) * 1.5f) * 0.75f);
      float _648 = ((_632 * _553) + _553) * _647;
      float _649 = ((_632 * _554) + _554) * _647;
      float _650 = ((_632 * _555) + _555) * _647;
      float _653 = saturate((_44 + -0.5f) * 2.0f);
      float _657 = (_time.x * 0.015707964077591896f) + 0.7853981852531433f;
      float _664 = saturate((exp2(log2(1.0f - _653) * 2.5f) + -0.05000000074505806f) * 1.1111111640930176f);
      float _668 = (_664 * _664) * (3.0f - (_664 * 2.0f));
      float _669 = _668 * 0.5f;
      float _670 = 1.0f - _669;
      float _673 = _668 * -0.25f;
      float _676 = (_25 + -1.0f) * 0.5f;
      float _680 = ((-0.5f - _673) + (_670 * _47)) - (_670 * _676);
      float _681 = cos(_657);
      float _683 = ((_670 * TEXCOORD.y) - _673) + -0.5f;
      float _684 = sin(_657);
      float _693 = (_time.x * 0.03141592815518379f) + 1.5707963705062866f;
      float _694 = 0.6000000238418579f - _669;
      float _697 = _668 * 0.25f;
      float _703 = ((_697 + -0.30000001192092896f) + (_694 * _47)) - (_694 * _676);
      float _704 = cos(_693);
      float _706 = ((_694 * TEXCOORD.y) - (-0.20000000298023224f - _697)) + -0.5f;
      float _707 = sin(_693);
      float _709 = (_703 * _704) - (_706 * _707);
      float _712 = (_703 * _707) + (_706 * _704);
      int _715 = WaveReadLaneFirst(_materialIndex);
      int _723 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_715 < (uint)170000), _715, 0)) + 0u))]._chapterCardTex);
      float4 _730 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_723 < (uint)65000), _723, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(((0.5f - (_683 * _684)) + (_680 * _681)), (((_683 * _681) + 0.5f) + (_680 * _684))));
      int _732 = WaveReadLaneFirst(_materialIndex);
      int _740 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_732 < (uint)170000), _732, 0)) + 0u))]._chapterCardTex);
      float4 _747 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_740 < (uint)65000), _740, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2((_709 + 0.5f), (_712 + 0.5f)));
      float _749 = abs(_709);
      float _750 = _749 * 120.0f;
      float _756 = abs(_712);
      float _761 = _756 * 120.0f;
      float _775 = saturate((saturate(((saturate(_761 + -56.0f) * saturate(60.0f - _761)) * saturate(10.0f - (_749 * 20.0f))) + ((saturate(_750 + -54.0f) * saturate(58.0f - _750)) * saturate(10.0f - (_756 * 20.0f)))) * 0.5f) + _747.x);
      float _777 = (_730.x * _730.x) * _653;
      float _784 = (_777 * (_386 - _648)) + _648;
      float _785 = (_777 * (_387 - _649)) + _649;
      float _786 = (_777 * (_388 - _650)) + _650;
      float _787 = _775 * _653;
      float _797 = abs(_85);
      float _799 = 1.0f - (_797 * 0.800000011920929f);
      int _803 = WaveReadLaneFirst(_materialIndex);
      int _811 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_803 < (uint)170000), _803, 0)) + 0u))]._lensDirtTex);
      float4 _818 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_811 < (uint)65000), _811, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_47, TEXCOORD.y));
      float _831 = saturate(_797 * 2.0f) * exp2(log2(saturate(sqrt(_640 + (_85 * _85)))) * 6.0f);
      float _838 = saturate(((_619 + _536) + _730.x) + _775);
      float _853 = max(0.0010000000474974513f, _exposure0.x);
      _858 = ((((((((_787 * (_386 - _784)) + _784) * _799) - _342) + (_831 * _818.x)) * _838) + _342) / _853);
      _859 = ((((((((_787 * (_387 - _785)) + _785) * _799) - _343) + (_831 * _818.y)) * _838) + _343) / _853);
      _860 = ((((((((_787 * (_388 - _786)) + _786) * _799) - _344) + (_831 * _818.z)) * _838) + _344) / _853);
    } else {
      _858 = _342;
      _859 = _343;
      _860 = _344;
    }
    float _876 = 1.0f - ((_300 * _300) * (_289 * 0.5f));
    float _877 = ((((_437.x * _430) - _858) * _289) + _858) * _876;
    float _878 = ((((_437.y * _431) - _859) * _289) + _859) * _876;
    float _879 = ((((_437.z * _432) - _860) * _289) + _860) * _876;
    float _892 = 1.0f - ((_227 * _227) * (_216 * 0.5f));
    float _893 = ((((_437.x * (((_430 + -1.0f) * 0.5f) + 1.0f)) - _877) * _216) + _877) * _892;
    float _894 = ((((_437.y * (((_431 + -1.0f) * 0.5f) + 1.0f)) - _878) * _216) + _878) * _892;
    float _895 = ((((_437.z * (((_432 + -1.0f) * 0.5f) + 1.0f)) - _879) * _216) + _879) * _892;
    float _899 = 1.0f - ((_154 * _154) * (_143 * 0.5f));
    float _909 = (((((_454 * _28.x) + _28.x) * _899) - _893) * _143) + _893;
    float _910 = (((((_454 * _28.y) + _28.y) * _899) - _894) * _143) + _894;
    float _911 = (((((_454 * _28.z) + _28.z) * _899) - _895) * _143) + _895;
    float _914 = saturate((_44 * 15.0f) + -14.0f);
    _925 = (lerp(_909, _858, _914));
    _926 = (lerp(_910, _859, _914));
    _927 = (lerp(_911, _860, _914));
  } else {
    _925 = _28.x;
    _926 = _28.y;
    _927 = _28.z;
  }
  uint _928 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _935 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_928), 0));
    _941 = (float((uint)((uint)(_935.x & 127))) + 0.5f);
  } else {
    _941 = 1.0f;
  }
  bool _944 = (_localToneMappingParams.w > 0.0f);
  if (_944) {
    float3 output_color = TonemapReplacer(float3(_925, _926, _927));
    _1297 = output_color.x;
    _1298 = output_color.y;
    _1299 = output_color.z;
  } else {
    _1297 = _925;
    _1298 = _926;
    _1299 = _927;
  }
  if (_etcParams.y > 1.0f) {
    float _1308 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _1309 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _1313 = saturate(1.0f - (dot(float2(_1308, _1309), float2(_1308, _1309)) * saturate(_etcParams.y + -1.0f)));
    _1318 = (_1313 * _1297);
    _1319 = (_1313 * _1298);
    _1320 = (_1313 * _1299);
  } else {
    _1318 = _1297;
    _1319 = _1298;
    _1320 = _1299;
  }
  if ((_944) && ((_etcParams.z > 0.0f))) {
    _1350 = select((_1318 <= 0.0031308000907301903f), (_1318 * 12.920000076293945f), (((pow(_1318, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1351 = select((_1319 <= 0.0031308000907301903f), (_1319 * 12.920000076293945f), (((pow(_1319, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1352 = select((_1320 <= 0.0031308000907301903f), (_1320 * 12.920000076293945f), (((pow(_1320, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1350 = _1318;
    _1351 = _1319;
    _1352 = _1320;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _1357 = float((uint)_928);
    if (!(_1357 < _viewDir.w)) {
      if (!(_1357 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _1366 = _1350;
        _1367 = _1351;
        _1368 = _1352;
      } else {
        _1366 = 0.0f;
        _1367 = 0.0f;
        _1368 = 0.0f;
      }
    } else {
      _1366 = 0.0f;
      _1367 = 0.0f;
      _1368 = 0.0f;
    }
  } else {
    _1366 = _1350;
    _1367 = _1351;
    _1368 = _1352;
  }
  SV_Target.x = _1366;
  SV_Target.y = _1367;
  SV_Target.z = _1368;
  SV_Target.w = _941;
  return SV_Target;
}