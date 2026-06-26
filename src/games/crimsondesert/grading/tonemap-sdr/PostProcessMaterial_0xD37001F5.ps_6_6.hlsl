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
  float _38 = (pow(_28.x, 0.012683313339948654f));
  float _39 = (pow(_28.y, 0.012683313339948654f));
  float _40 = (pow(_28.z, 0.012683313339948654f));
  float _62 = exp2(log2(max(0.0f, (_38 + -0.8359375f)) / (18.8515625f - (_38 * 18.6875f))) * 6.277394771575928f);
  float _63 = exp2(log2(max(0.0f, (_39 + -0.8359375f)) / (18.8515625f - (_39 * 18.6875f))) * 6.277394771575928f);
  float _64 = exp2(log2(max(0.0f, (_40 + -0.8359375f)) / (18.8515625f - (_40 * 18.6875f))) * 6.277394771575928f);
  int _68 = WaveReadLaneFirst(_materialIndex);
  float _76 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_68 < (uint)170000), _68, 0)) + 0u))]._chapterTransition);
  bool _77 = (_76 > 0.5f);
  float _78 = _76 * 2.0f;
  float _80 = select(_77, (2.0f - _78), _78);
  float _179;
  float _252;
  float _325;
  float _604;
  float _687;
  float _926;
  float _927;
  float _928;
  float _994;
  float _995;
  float _996;
  float _1010;
  float _1215;
  float _1216;
  float _1217;
  float _1310;
  float _1311;
  float _1312;
  float _1366;
  float _1367;
  float _1368;
  float _1387;
  float _1388;
  float _1389;
  float _1419;
  float _1420;
  float _1421;
  float _1435;
  float _1436;
  float _1437;
  if (_80 > 0.0f) {
    float _83 = _25 * TEXCOORD.x;
    int _91 = WaveReadLaneFirst(_materialIndex);
    int _99 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_91 < (uint)170000), _91, 0)) + 0u))]._chapterNoiseTex);
    float4 _106 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_99 < (uint)65000), _99, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((_83 * 4.0f) - ((_80 * TEXCOORD.x) * rsqrt(TEXCOORD.x * TEXCOORD.x))), (TEXCOORD.y * 4.0f)));
    float _110 = (_106.x * 0.009999999776482582f) + -0.004980391822755337f;
    float _112 = (_106.y * 0.009999999776482582f) + -0.004980391822755337f;
    float _114 = (_106.y * 0.03999999910593033f) + -0.019921567291021347f;
    float _115 = saturate(_80);
    float _117 = saturate(_115 * 2.0f);
    float _121 = TEXCOORD.x + -0.5f;
    float _122 = select(_77, -1.0f, 1.0f) + _121;
    float _124 = TEXCOORD.y + -0.5f;
    float _125 = (_110 * _117) + _124;
    float _126 = ((_114 * _117) + _122) * _25;
    float _127 = _126 * 32.0f;
    float _128 = _125 * 32.0f;
    float _138 = frac(sin(dot(float2((ceil(_127 + 0.5f) * 0.125f), (ceil(_128 + 0.5f) * 0.125f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.546875f);
    float _139 = round(_127);
    float _140 = round(_128);
    float _150 = saturate(((0.25f - (_115 * 3.0f)) + (sqrt((_140 * _140) + (_139 * _139)) * 0.03125f)) * 0.800000011920929f);
    float _151 = 1.0f - _150;
    if (!(!(_151 >= 0.0010000000474974513f))) {
      float _154 = _151 * -9.6875f;
      float _166 = _150 * 0.1666666716337204f;
      float _167 = _151 * 0.3125f;
      _179 = float((bool)((uint)(((abs((_167 * ((_126 * (_154 + 32.0f)) - _139)) * (1.0f - frac(_138 * 7.0f))) < _166)) && ((abs((_167 * ((_125 * (_154 + 32.0f)) - _140)) * frac(_138 * 3.0f)) < _166)))));
    } else {
      _179 = 1.0f;
    }
    float _188 = saturate(1.0f - abs((saturate(_151 - ((_138 + -0.5f) * 0.125f)) * 3.0f) + -2.0f));
    float _189 = _188 * _188;
    float _190 = _189 * _189;
    float _192 = saturate(_80 + -0.0833333358168602f);
    float _194 = saturate(_192 * 2.0f);
    float _198 = (_194 * _110) + _124;
    float _199 = ((_194 * _114) + _122) * _25;
    float _200 = _199 * 16.0f;
    float _201 = _198 * 16.0f;
    float _211 = frac(sin(dot(float2((ceil(_200 + 0.5f) * 0.25f), (ceil(_201 + 0.5f) * 0.25f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.546875f);
    float _212 = round(_200);
    float _213 = round(_201);
    float _223 = saturate(((0.25f - (_192 * 3.0f)) + (sqrt((_213 * _213) + (_212 * _212)) * 0.0625f)) * 0.800000011920929f);
    float _224 = 1.0f - _223;
    if (!(!(_224 >= 0.0010000000474974513f))) {
      float _227 = _224 * -4.6875f;
      float _239 = _223 * 0.1666666716337204f;
      float _240 = _224 * 0.3125f;
      _252 = float((bool)((uint)(((abs((_240 * ((_199 * (_227 + 16.0f)) - _212)) * (1.0f - frac(_211 * 7.0f))) < _239)) && ((abs((_240 * ((_198 * (_227 + 16.0f)) - _213)) * frac(_211 * 3.0f)) < _239)))));
    } else {
      _252 = 1.0f;
    }
    float _261 = saturate(1.0f - abs((saturate(_224 - ((_211 + -0.5f) * 0.125f)) * 3.0f) + -2.0f));
    float _262 = _261 * _261;
    float _263 = _262 * _262;
    float _265 = saturate(_80 + -0.1666666716337204f);
    float _267 = saturate(_265 * 2.0f);
    float _271 = (_267 * _110) + _124;
    float _272 = ((_267 * _114) + _122) * _25;
    float _273 = _272 * 10.666666984558105f;
    float _274 = _271 * 10.666666984558105f;
    float _284 = frac(sin(dot(float2((ceil(_273 + 0.5f) * 0.375f), (ceil(_274 + 0.5f) * 0.375f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.546875f);
    float _285 = round(_273);
    float _286 = round(_274);
    float _296 = saturate(((0.25f - (_265 * 3.0f)) + (sqrt((_286 * _286) + (_285 * _285)) * 0.09375f)) * 0.800000011920929f);
    float _297 = 1.0f - _296;
    if (!(!(_297 >= 0.0010000000474974513f))) {
      float _300 = _297 * -3.0208334922790527f;
      float _312 = _296 * 0.1666666716337204f;
      float _313 = _297 * 0.3125f;
      _325 = float((bool)((uint)(((abs((_313 * ((_272 * (_300 + 10.666666984558105f)) - _285)) * (1.0f - frac(_284 * 7.0f))) < _312)) && ((abs((_313 * ((_271 * (_300 + 10.666666984558105f)) - _286)) * frac(_284 * 3.0f)) < _312)))));
    } else {
      _325 = 1.0f;
    }
    float _334 = saturate(1.0f - abs((saturate(_297 - ((_284 + -0.5f) * 0.125f)) * 3.0f) + -2.0f));
    float _335 = _334 * _334;
    float _336 = _335 * _335;
    int _337 = WaveReadLaneFirst(_materialIndex);
    int _345 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_337 < (uint)170000), _337, 0)) + 0u))]._chapterBackgroundColor);
    float _348 = float((uint)((uint)(((uint)((uint)(_345)) >> 16) & 255)));
    float _351 = float((uint)((uint)(((uint)((uint)(_345)) >> 8) & 255)));
    float _353 = float((uint)((uint)(_345 & 255)));
    float _378 = select(((_348 * 0.003921568859368563f) < 0.040449999272823334f), (_348 * 0.0003035269910469651f), exp2(log2((_348 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _379 = select(((_351 * 0.003921568859368563f) < 0.040449999272823334f), (_351 * 0.0003035269910469651f), exp2(log2((_351 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _380 = select(((_353 * 0.003921568859368563f) < 0.040449999272823334f), (_353 * 0.0003035269910469651f), exp2(log2((_353 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    int _381 = WaveReadLaneFirst(_materialIndex);
    int _389 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_381 < (uint)170000), _381, 0)) + 0u))]._chapterCardColor);
    float _392 = float((uint)((uint)(((uint)((uint)(_389)) >> 16) & 255)));
    float _395 = float((uint)((uint)(((uint)((uint)(_389)) >> 8) & 255)));
    float _397 = float((uint)((uint)(_389 & 255)));
    float _422 = select(((_392 * 0.003921568859368563f) < 0.040449999272823334f), (_392 * 0.0003035269910469651f), exp2(log2((_392 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _423 = select(((_395 * 0.003921568859368563f) < 0.040449999272823334f), (_395 * 0.0003035269910469651f), exp2(log2((_395 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _424 = select(((_397 * 0.003921568859368563f) < 0.040449999272823334f), (_397 * 0.0003035269910469651f), exp2(log2((_397 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    int _425 = WaveReadLaneFirst(_materialIndex);
    int _433 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_425 < (uint)170000), _425, 0)) + 0u))]._sceneTintColor);
    float _436 = float((uint)((uint)(((uint)((uint)(_433)) >> 16) & 255)));
    float _439 = float((uint)((uint)(((uint)((uint)(_433)) >> 8) & 255)));
    float _441 = float((uint)((uint)(_433 & 255)));
    float _466 = select(((_436 * 0.003921568859368563f) < 0.040449999272823334f), (_436 * 0.0003035269910469651f), exp2(log2((_436 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _467 = select(((_439 * 0.003921568859368563f) < 0.040449999272823334f), (_439 * 0.0003035269910469651f), exp2(log2((_439 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _468 = select(((_441 * 0.003921568859368563f) < 0.040449999272823334f), (_441 * 0.0003035269910469651f), exp2(log2((_441 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float4 _473 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_110 + TEXCOORD.x), (_112 + TEXCOORD.y)));
    float _483 = (pow(_473.x, 0.012683313339948654f));
    float _484 = (pow(_473.y, 0.012683313339948654f));
    float _485 = (pow(_473.z, 0.012683313339948654f));
    float _510 = exp2(log2(max(0.0f, (_483 + -0.8359375f)) / (18.8515625f - (_483 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    float _511 = exp2(log2(max(0.0f, (_484 + -0.8359375f)) / (18.8515625f - (_484 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    float _512 = exp2(log2(max(0.0f, (_485 + -0.8359375f)) / (18.8515625f - (_485 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    if (_80 > 0.20000000298023224f) {
      float _531 = _25 * _121;
      float _539 = ((((0.5f - TEXCOORD.y) + _531) * 0.7071067690849304f) + _114) + _110;
      float _541 = (((_531 + _124) * 0.7071067690849304f) + _110) + _112;
      float _542 = _539 * 16.0f;
      float _543 = _541 * 16.0f;
      float _553 = frac(sin(dot(float2((ceil(_542 + 0.5f) * 0.25f), (ceil(_543 + 0.5f) * 0.25f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.546875f);
      float _554 = round(_542);
      float _555 = round(_543);
      float _564 = saturate(((0.800000011920929f - (_80 * 0.800000011920929f)) + (sqrt((_555 * _555) + (_554 * _554)) * 0.0625f)) * 1.25f);
      float _565 = 1.0f - _564;
      if (!(!(_565 >= 0.0010000000474974513f))) {
        float _572 = sin((_time.x * _553) + 0.800000011920929f);
        bool _574 = (frac(_553) > 0.5f);
        float _577 = _565 * -3.0f;
        float _591 = _564 * 0.1666666716337204f;
        float _592 = _565 * 0.20000000298023224f;
        _604 = float((bool)((uint)(((abs(((1.0f - frac(_553 * 7.0f)) * _592) * (((_539 * (_577 + 16.0f)) - _554) + select(_574, _572, 0.0f))) < _591)) && ((abs((frac(_553 * 3.0f) * _592) * (((_541 * (_577 + 16.0f)) - _555) + select(_574, 0.0f, _572))) < _591)))));
      } else {
        _604 = 1.0f;
      }
      float _613 = saturate(1.0f - abs((saturate(_565 - ((_553 + -0.5f) * 0.125f)) * 3.0f) + -2.0f));
      float _614 = _613 * _613;
      float _617 = (_604 * 0.2999999523162842f) * (_614 * _614);
      float _621 = (_617 * _378) + _378;
      float _622 = (_617 * _379) + _379;
      float _623 = (_617 * _380) + _380;
      float _625 = _539 * 8.0f;
      float _626 = _541 * 8.0f;
      float _636 = frac(sin(dot(float2((ceil(_625 + 0.5f) * 0.5f), (ceil(_626 + 0.5f) * 0.5f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.546875f);
      float _637 = round(_625);
      float _638 = round(_626);
      float _647 = saturate(((1.25f - (_80 * 1.4249999523162842f)) + (sqrt((_638 * _638) + (_637 * _637)) * 0.125f)) * 0.800000011920929f);
      float _648 = 1.0f - _647;
      if (!(!(_648 >= 0.0010000000474974513f))) {
        float _655 = sin((_time.x * _636) + 1.25f);
        bool _657 = (frac(_636) > 0.5f);
        float _660 = _648 * -2.1875f;
        float _674 = _647 * 0.1666666716337204f;
        float _675 = _648 * 0.3125f;
        _687 = float((bool)((uint)(((abs(((1.0f - frac(_636 * 7.0f)) * _675) * (((_539 * (_660 + 8.0f)) - _637) + select(_657, _655, 0.0f))) < _674)) && ((abs((frac(_636 * 3.0f) * _675) * (((_541 * (_660 + 8.0f)) - _638) + select(_657, 0.0f, _655))) < _674)))));
      } else {
        _687 = 1.0f;
      }
      float _696 = saturate(1.0f - abs((saturate(_648 - ((_636 + -0.5f) * 0.125f)) * 3.0f) + -2.0f));
      float _697 = _696 * _696;
      float _700 = (_687 * 0.6000000238418579f) * (_697 * _697);
      float _708 = _124 * _124;
      float _715 = 1.0f - (exp2(log2(sqrt((_531 * _531) + _708)) * 1.5f) * 0.75f);
      float _716 = ((_700 * _621) + _621) * _715;
      float _717 = ((_700 * _622) + _622) * _715;
      float _718 = ((_700 * _623) + _623) * _715;
      float _721 = saturate((_80 + -0.5f) * 2.0f);
      float _725 = (_time.x * 0.015707964077591896f) + 0.7853981852531433f;
      float _732 = saturate((exp2(log2(1.0f - _721) * 2.5f) + -0.05000000074505806f) * 1.1111111640930176f);
      float _736 = (_732 * _732) * (3.0f - (_732 * 2.0f));
      float _737 = _736 * 0.5f;
      float _738 = 1.0f - _737;
      float _741 = _736 * -0.25f;
      float _744 = (_25 + -1.0f) * 0.5f;
      float _748 = ((-0.5f - _741) + (_738 * _83)) - (_738 * _744);
      float _749 = cos(_725);
      float _751 = ((_738 * TEXCOORD.y) - _741) + -0.5f;
      float _752 = sin(_725);
      float _761 = (_time.x * 0.03141592815518379f) + 1.5707963705062866f;
      float _762 = 0.6000000238418579f - _737;
      float _765 = _736 * 0.25f;
      float _771 = ((_765 + -0.30000001192092896f) + (_762 * _83)) - (_762 * _744);
      float _772 = cos(_761);
      float _774 = ((_762 * TEXCOORD.y) - (-0.20000000298023224f - _765)) + -0.5f;
      float _775 = sin(_761);
      float _777 = (_771 * _772) - (_774 * _775);
      float _780 = (_771 * _775) + (_774 * _772);
      int _783 = WaveReadLaneFirst(_materialIndex);
      int _791 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_783 < (uint)170000), _783, 0)) + 0u))]._chapterCardTex);
      float4 _798 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_791 < (uint)65000), _791, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(((0.5f - (_751 * _752)) + (_748 * _749)), (((_751 * _749) + 0.5f) + (_748 * _752))));
      int _800 = WaveReadLaneFirst(_materialIndex);
      int _808 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_800 < (uint)170000), _800, 0)) + 0u))]._chapterCardTex);
      float4 _815 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_808 < (uint)65000), _808, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2((_777 + 0.5f), (_780 + 0.5f)));
      float _817 = abs(_777);
      float _818 = _817 * 120.0f;
      float _824 = abs(_780);
      float _829 = _824 * 120.0f;
      float _843 = saturate((saturate(((saturate(_829 + -56.0f) * saturate(60.0f - _829)) * saturate(10.0f - (_817 * 20.0f))) + ((saturate(_818 + -54.0f) * saturate(58.0f - _818)) * saturate(10.0f - (_824 * 20.0f)))) * 0.5f) + _815.x);
      float _845 = (_798.x * _798.x) * _721;
      float _852 = (_845 * (_422 - _716)) + _716;
      float _853 = (_845 * (_423 - _717)) + _717;
      float _854 = (_845 * (_424 - _718)) + _718;
      float _855 = _843 * _721;
      float _865 = abs(_121);
      float _867 = 1.0f - (_865 * 0.800000011920929f);
      int _871 = WaveReadLaneFirst(_materialIndex);
      int _879 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_871 < (uint)170000), _871, 0)) + 0u))]._lensDirtTex);
      float4 _886 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_879 < (uint)65000), _879, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_83, TEXCOORD.y));
      float _899 = saturate(_865 * 2.0f) * exp2(log2(saturate(sqrt(_708 + (_121 * _121)))) * 6.0f);
      float _906 = saturate(((_687 + _604) + _798.x) + _843);
      float _921 = max(0.0010000000474974513f, _exposure0.x);
      _926 = ((((((((_855 * (_422 - _852)) + _852) * _867) - _378) + (_899 * _886.x)) * _906) + _378) / _921);
      _927 = ((((((((_855 * (_423 - _853)) + _853) * _867) - _379) + (_899 * _886.y)) * _906) + _379) / _921);
      _928 = ((((((((_855 * (_424 - _854)) + _854) * _867) - _380) + (_899 * _886.z)) * _906) + _380) / _921);
    } else {
      _926 = _378;
      _927 = _379;
      _928 = _380;
    }
    float _944 = 1.0f - ((_336 * _336) * (_325 * 0.5f));
    float _945 = ((((_510 * _466) - _926) * _325) + _926) * _944;
    float _946 = ((((_511 * _467) - _927) * _325) + _927) * _944;
    float _947 = ((((_512 * _468) - _928) * _325) + _928) * _944;
    float _960 = 1.0f - ((_263 * _263) * (_252 * 0.5f));
    float _961 = ((((_510 * (((_466 + -1.0f) * 0.5f) + 1.0f)) - _945) * _252) + _945) * _960;
    float _962 = ((((_511 * (((_467 + -1.0f) * 0.5f) + 1.0f)) - _946) * _252) + _946) * _960;
    float _963 = ((((_512 * (((_468 + -1.0f) * 0.5f) + 1.0f)) - _947) * _252) + _947) * _960;
    float _968 = ((saturate(_80 * 4.0f) * 10000.0f) + 10000.0f) * (1.0f - ((_190 * _190) * (_179 * 0.5f)));
    float _978 = (((_968 * _62) - _961) * _179) + _961;
    float _979 = (((_968 * _63) - _962) * _179) + _962;
    float _980 = (((_968 * _64) - _963) * _179) + _963;
    float _983 = saturate((_80 * 15.0f) + -14.0f);
    _994 = (lerp(_978, _926, _983));
    _995 = (lerp(_979, _927, _983));
    _996 = (lerp(_980, _928, _983));
  } else {
    _994 = (_62 * 10000.0f);
    _995 = (_63 * 10000.0f);
    _996 = (_64 * 10000.0f);
  }
  uint _997 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _1004 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_997), 0));
    _1010 = (float((uint)((uint)(_1004.x & 127))) + 0.5f);
  } else {
    _1010 = 1.0f;
  }
  bool _1013 = (_localToneMappingParams.w > 0.0f);
  if (_1013) {
    float3 output_color = TonemapReplacer(float3(_994, _995, _996));
    _1366 = output_color.x;
    _1367 = output_color.y;
    _1368 = output_color.z;
  } else {
    _1366 = _994;
    _1367 = _995;
    _1368 = _996;
  }
  if (_etcParams.y > 1.0f) {
    float _1377 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _1378 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _1382 = saturate(1.0f - (dot(float2(_1377, _1378), float2(_1377, _1378)) * saturate(_etcParams.y + -1.0f)));
    _1387 = (_1382 * _1366);
    _1388 = (_1382 * _1367);
    _1389 = (_1382 * _1368);
  } else {
    _1387 = _1366;
    _1388 = _1367;
    _1389 = _1368;
  }
  if ((_1013) && ((_etcParams.z > 0.0f))) {
    _1419 = select((_1387 <= 0.0031308000907301903f), (_1387 * 12.920000076293945f), (((pow(_1387, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1420 = select((_1388 <= 0.0031308000907301903f), (_1388 * 12.920000076293945f), (((pow(_1388, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1421 = select((_1389 <= 0.0031308000907301903f), (_1389 * 12.920000076293945f), (((pow(_1389, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1419 = _1387;
    _1420 = _1388;
    _1421 = _1389;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _1426 = float((uint)_997);
    if (!(_1426 < _viewDir.w)) {
      if (!(_1426 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _1435 = _1419;
        _1436 = _1420;
        _1437 = _1421;
      } else {
        _1435 = 0.0f;
        _1436 = 0.0f;
        _1437 = 0.0f;
      }
    } else {
      _1435 = 0.0f;
      _1436 = 0.0f;
      _1437 = 0.0f;
    }
  } else {
    _1435 = _1419;
    _1436 = _1420;
    _1437 = _1421;
  }
  float _1447 = exp2(log2(_1435 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1448 = exp2(log2(_1436 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1449 = exp2(log2(_1437 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_1447 * 18.6875f) + 1.0f)) * ((_1447 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_1448 * 18.6875f) + 1.0f)) * ((_1448 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_1449 * 18.6875f) + 1.0f)) * ((_1449 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _1010;
  return SV_Target;
}