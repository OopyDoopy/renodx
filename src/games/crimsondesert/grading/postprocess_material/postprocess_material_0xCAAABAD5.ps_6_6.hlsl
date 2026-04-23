#include "../tonemap.hlsli"

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

cbuffer __3__1__0__0__PostProcessMaterialIndex : register(b2, space1) {
  int _materialIndex : packoffset(c000.x);
  int _passIndex : packoffset(c000.y);
};

ConstantBuffer<PostProcessTransition_CDStruct> BindlessParameters_PostProcessTransition_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _18[36];
  float _24 = _screenSizeAndInvSize.x / _screenSizeAndInvSize.y;
  float4 _27 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  float _37 = (pow(_27.x, 0.012683313339948654f));
  float _38 = (pow(_27.y, 0.012683313339948654f));
  float _39 = (pow(_27.z, 0.012683313339948654f));
  float _61 = exp2(log2(max(0.0f, (_37 + -0.8359375f)) / (18.8515625f - (_37 * 18.6875f))) * 6.277394771575928f);
  float _62 = exp2(log2(max(0.0f, (_38 + -0.8359375f)) / (18.8515625f - (_38 * 18.6875f))) * 6.277394771575928f);
  float _63 = exp2(log2(max(0.0f, (_39 + -0.8359375f)) / (18.8515625f - (_39 * 18.6875f))) * 6.277394771575928f);
  int _67 = WaveReadLaneFirst(_materialIndex);
  float _75 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_67 < (uint)170000), _67, 0)) + 0u))]._chapterTransition);
  bool _76 = (_75 > 0.5f);
  float _77 = _75 * 2.0f;
  float _79 = select(_76, (2.0f - _77), _77);
  float _178;
  float _251;
  float _324;
  float _603;
  float _686;
  float _925;
  float _926;
  float _927;
  float _993;
  float _994;
  float _995;
  float _1009;
  float _1255;
  float _1256;
  float _1257;
  float _1377;
  float _1378;
  float _1379;
  float _1400;
  float _1401;
  float _1402;
  float _1435;
  float _1436;
  float _1437;
  float _1451;
  float _1452;
  float _1453;
  if (_79 > 0.0f) {
    float _82 = _24 * TEXCOORD.x;
    int _90 = WaveReadLaneFirst(_materialIndex);
    int _98 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_90 < (uint)170000), _90, 0)) + 0u))]._chapterNoiseTex);
    float4 _105 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_98 < (uint)65000), _98, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((_82 * 4.0f) - ((_79 * TEXCOORD.x) * rsqrt(TEXCOORD.x * TEXCOORD.x))), (TEXCOORD.y * 4.0f)));
    float _109 = (_105.x * 0.009999999776482582f) + -0.004980391822755337f;
    float _111 = (_105.y * 0.009999999776482582f) + -0.004980391822755337f;
    float _113 = (_105.y * 0.03999999910593033f) + -0.019921567291021347f;
    float _114 = saturate(_79);
    float _116 = saturate(_114 * 2.0f);
    float _120 = TEXCOORD.x + -0.5f;
    float _121 = select(_76, -1.0f, 1.0f) + _120;
    float _123 = TEXCOORD.y + -0.5f;
    float _124 = (_109 * _116) + _123;
    float _125 = ((_113 * _116) + _121) * _24;
    float _126 = _125 * 32.0f;
    float _127 = _124 * 32.0f;
    float _137 = frac(sin(dot(float2((ceil(_126 + 0.5f) * 0.125f), (ceil(_127 + 0.5f) * 0.125f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.546875f);
    float _138 = round(_126);
    float _139 = round(_127);
    float _149 = saturate(((0.25f - (_114 * 3.0f)) + (sqrt((_139 * _139) + (_138 * _138)) * 0.03125f)) * 0.800000011920929f);
    float _150 = 1.0f - _149;
    if (!(!(_150 >= 0.0010000000474974513f))) {
      float _153 = _150 * -9.6875f;
      float _165 = _149 * 0.1666666716337204f;
      float _166 = _150 * 0.3125f;
      _178 = float((bool)((uint)(((abs((_166 * ((_125 * (_153 + 32.0f)) - _138)) * (1.0f - frac(_137 * 7.0f))) < _165)) && ((abs((_166 * ((_124 * (_153 + 32.0f)) - _139)) * frac(_137 * 3.0f)) < _165)))));
    } else {
      _178 = 1.0f;
    }
    float _187 = saturate(1.0f - abs((saturate(_150 - ((_137 + -0.5f) * 0.125f)) * 3.0f) + -2.0f));
    float _188 = _187 * _187;
    float _189 = _188 * _188;
    float _191 = saturate(_79 + -0.0833333358168602f);
    float _193 = saturate(_191 * 2.0f);
    float _197 = (_193 * _109) + _123;
    float _198 = ((_193 * _113) + _121) * _24;
    float _199 = _198 * 16.0f;
    float _200 = _197 * 16.0f;
    float _210 = frac(sin(dot(float2((ceil(_199 + 0.5f) * 0.25f), (ceil(_200 + 0.5f) * 0.25f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.546875f);
    float _211 = round(_199);
    float _212 = round(_200);
    float _222 = saturate(((0.25f - (_191 * 3.0f)) + (sqrt((_212 * _212) + (_211 * _211)) * 0.0625f)) * 0.800000011920929f);
    float _223 = 1.0f - _222;
    if (!(!(_223 >= 0.0010000000474974513f))) {
      float _226 = _223 * -4.6875f;
      float _238 = _222 * 0.1666666716337204f;
      float _239 = _223 * 0.3125f;
      _251 = float((bool)((uint)(((abs((_239 * ((_198 * (_226 + 16.0f)) - _211)) * (1.0f - frac(_210 * 7.0f))) < _238)) && ((abs((_239 * ((_197 * (_226 + 16.0f)) - _212)) * frac(_210 * 3.0f)) < _238)))));
    } else {
      _251 = 1.0f;
    }
    float _260 = saturate(1.0f - abs((saturate(_223 - ((_210 + -0.5f) * 0.125f)) * 3.0f) + -2.0f));
    float _261 = _260 * _260;
    float _262 = _261 * _261;
    float _264 = saturate(_79 + -0.1666666716337204f);
    float _266 = saturate(_264 * 2.0f);
    float _270 = (_266 * _109) + _123;
    float _271 = ((_266 * _113) + _121) * _24;
    float _272 = _271 * 10.666666984558105f;
    float _273 = _270 * 10.666666984558105f;
    float _283 = frac(sin(dot(float2((ceil(_272 + 0.5f) * 0.375f), (ceil(_273 + 0.5f) * 0.375f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.546875f);
    float _284 = round(_272);
    float _285 = round(_273);
    float _295 = saturate(((0.25f - (_264 * 3.0f)) + (sqrt((_285 * _285) + (_284 * _284)) * 0.09375f)) * 0.800000011920929f);
    float _296 = 1.0f - _295;
    if (!(!(_296 >= 0.0010000000474974513f))) {
      float _299 = _296 * -3.0208334922790527f;
      float _311 = _295 * 0.1666666716337204f;
      float _312 = _296 * 0.3125f;
      _324 = float((bool)((uint)(((abs((_312 * ((_271 * (_299 + 10.666666984558105f)) - _284)) * (1.0f - frac(_283 * 7.0f))) < _311)) && ((abs((_312 * ((_270 * (_299 + 10.666666984558105f)) - _285)) * frac(_283 * 3.0f)) < _311)))));
    } else {
      _324 = 1.0f;
    }
    float _333 = saturate(1.0f - abs((saturate(_296 - ((_283 + -0.5f) * 0.125f)) * 3.0f) + -2.0f));
    float _334 = _333 * _333;
    float _335 = _334 * _334;
    int _336 = WaveReadLaneFirst(_materialIndex);
    int _344 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_336 < (uint)170000), _336, 0)) + 0u))]._chapterBackgroundColor);
    float _347 = float((uint)((uint)(((uint)((uint)(_344)) >> 16) & 255)));
    float _350 = float((uint)((uint)(((uint)((uint)(_344)) >> 8) & 255)));
    float _352 = float((uint)((uint)(_344 & 255)));
    float _377 = select(((_347 * 0.003921568859368563f) < 0.040449999272823334f), (_347 * 0.0003035269910469651f), exp2(log2((_347 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _378 = select(((_350 * 0.003921568859368563f) < 0.040449999272823334f), (_350 * 0.0003035269910469651f), exp2(log2((_350 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _379 = select(((_352 * 0.003921568859368563f) < 0.040449999272823334f), (_352 * 0.0003035269910469651f), exp2(log2((_352 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    int _380 = WaveReadLaneFirst(_materialIndex);
    int _388 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_380 < (uint)170000), _380, 0)) + 0u))]._chapterCardColor);
    float _391 = float((uint)((uint)(((uint)((uint)(_388)) >> 16) & 255)));
    float _394 = float((uint)((uint)(((uint)((uint)(_388)) >> 8) & 255)));
    float _396 = float((uint)((uint)(_388 & 255)));
    float _421 = select(((_391 * 0.003921568859368563f) < 0.040449999272823334f), (_391 * 0.0003035269910469651f), exp2(log2((_391 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _422 = select(((_394 * 0.003921568859368563f) < 0.040449999272823334f), (_394 * 0.0003035269910469651f), exp2(log2((_394 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _423 = select(((_396 * 0.003921568859368563f) < 0.040449999272823334f), (_396 * 0.0003035269910469651f), exp2(log2((_396 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    int _424 = WaveReadLaneFirst(_materialIndex);
    int _432 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_424 < (uint)170000), _424, 0)) + 0u))]._sceneTintColor);
    float _435 = float((uint)((uint)(((uint)((uint)(_432)) >> 16) & 255)));
    float _438 = float((uint)((uint)(((uint)((uint)(_432)) >> 8) & 255)));
    float _440 = float((uint)((uint)(_432 & 255)));
    float _465 = select(((_435 * 0.003921568859368563f) < 0.040449999272823334f), (_435 * 0.0003035269910469651f), exp2(log2((_435 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _466 = select(((_438 * 0.003921568859368563f) < 0.040449999272823334f), (_438 * 0.0003035269910469651f), exp2(log2((_438 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _467 = select(((_440 * 0.003921568859368563f) < 0.040449999272823334f), (_440 * 0.0003035269910469651f), exp2(log2((_440 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float4 _472 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_109 + TEXCOORD.x), (_111 + TEXCOORD.y)));
    float _482 = (pow(_472.x, 0.012683313339948654f));
    float _483 = (pow(_472.y, 0.012683313339948654f));
    float _484 = (pow(_472.z, 0.012683313339948654f));
    float _509 = exp2(log2(max(0.0f, (_482 + -0.8359375f)) / (18.8515625f - (_482 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    float _510 = exp2(log2(max(0.0f, (_483 + -0.8359375f)) / (18.8515625f - (_483 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    float _511 = exp2(log2(max(0.0f, (_484 + -0.8359375f)) / (18.8515625f - (_484 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    if (_79 > 0.20000000298023224f) {
      float _530 = _24 * _120;
      float _538 = ((((0.5f - TEXCOORD.y) + _530) * 0.7071067690849304f) + _113) + _109;
      float _540 = (((_530 + _123) * 0.7071067690849304f) + _109) + _111;
      float _541 = _538 * 16.0f;
      float _542 = _540 * 16.0f;
      float _552 = frac(sin(dot(float2((ceil(_541 + 0.5f) * 0.25f), (ceil(_542 + 0.5f) * 0.25f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.546875f);
      float _553 = round(_541);
      float _554 = round(_542);
      float _563 = saturate(((0.800000011920929f - (_79 * 0.800000011920929f)) + (sqrt((_554 * _554) + (_553 * _553)) * 0.0625f)) * 1.25f);
      float _564 = 1.0f - _563;
      if (!(!(_564 >= 0.0010000000474974513f))) {
        float _571 = sin((_time.x * _552) + 0.800000011920929f);
        bool _573 = (frac(_552) > 0.5f);
        float _576 = _564 * -3.0f;
        float _590 = _563 * 0.1666666716337204f;
        float _591 = _564 * 0.20000000298023224f;
        _603 = float((bool)((uint)(((abs(((1.0f - frac(_552 * 7.0f)) * _591) * (((_538 * (_576 + 16.0f)) - _553) + select(_573, _571, 0.0f))) < _590)) && ((abs((frac(_552 * 3.0f) * _591) * (((_540 * (_576 + 16.0f)) - _554) + select(_573, 0.0f, _571))) < _590)))));
      } else {
        _603 = 1.0f;
      }
      float _612 = saturate(1.0f - abs((saturate(_564 - ((_552 + -0.5f) * 0.125f)) * 3.0f) + -2.0f));
      float _613 = _612 * _612;
      float _616 = (_603 * 0.2999999523162842f) * (_613 * _613);
      float _620 = (_616 * _377) + _377;
      float _621 = (_616 * _378) + _378;
      float _622 = (_616 * _379) + _379;
      float _624 = _538 * 8.0f;
      float _625 = _540 * 8.0f;
      float _635 = frac(sin(dot(float2((ceil(_624 + 0.5f) * 0.5f), (ceil(_625 + 0.5f) * 0.5f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.546875f);
      float _636 = round(_624);
      float _637 = round(_625);
      float _646 = saturate(((1.25f - (_79 * 1.4249999523162842f)) + (sqrt((_637 * _637) + (_636 * _636)) * 0.125f)) * 0.800000011920929f);
      float _647 = 1.0f - _646;
      if (!(!(_647 >= 0.0010000000474974513f))) {
        float _654 = sin((_time.x * _635) + 1.25f);
        bool _656 = (frac(_635) > 0.5f);
        float _659 = _647 * -2.1875f;
        float _673 = _646 * 0.1666666716337204f;
        float _674 = _647 * 0.3125f;
        _686 = float((bool)((uint)(((abs(((1.0f - frac(_635 * 7.0f)) * _674) * (((_538 * (_659 + 8.0f)) - _636) + select(_656, _654, 0.0f))) < _673)) && ((abs((frac(_635 * 3.0f) * _674) * (((_540 * (_659 + 8.0f)) - _637) + select(_656, 0.0f, _654))) < _673)))));
      } else {
        _686 = 1.0f;
      }
      float _695 = saturate(1.0f - abs((saturate(_647 - ((_635 + -0.5f) * 0.125f)) * 3.0f) + -2.0f));
      float _696 = _695 * _695;
      float _699 = (_686 * 0.6000000238418579f) * (_696 * _696);
      float _707 = _123 * _123;
      float _714 = 1.0f - (exp2(log2(sqrt((_530 * _530) + _707)) * 1.5f) * 0.75f);
      float _715 = ((_699 * _620) + _620) * _714;
      float _716 = ((_699 * _621) + _621) * _714;
      float _717 = ((_699 * _622) + _622) * _714;
      float _720 = saturate((_79 + -0.5f) * 2.0f);
      float _724 = (_time.x * 0.015707964077591896f) + 0.7853981852531433f;
      float _731 = saturate((exp2(log2(1.0f - _720) * 2.5f) + -0.05000000074505806f) * 1.1111111640930176f);
      float _735 = (_731 * _731) * (3.0f - (_731 * 2.0f));
      float _736 = _735 * 0.5f;
      float _737 = 1.0f - _736;
      float _740 = _735 * -0.25f;
      float _743 = (_24 + -1.0f) * 0.5f;
      float _747 = ((-0.5f - _740) + (_737 * _82)) - (_737 * _743);
      float _748 = cos(_724);
      float _750 = ((_737 * TEXCOORD.y) - _740) + -0.5f;
      float _751 = sin(_724);
      float _760 = (_time.x * 0.03141592815518379f) + 1.5707963705062866f;
      float _761 = 0.6000000238418579f - _736;
      float _764 = _735 * 0.25f;
      float _770 = ((_764 + -0.30000001192092896f) + (_761 * _82)) - (_761 * _743);
      float _771 = cos(_760);
      float _773 = ((_761 * TEXCOORD.y) - (-0.20000000298023224f - _764)) + -0.5f;
      float _774 = sin(_760);
      float _776 = (_770 * _771) - (_773 * _774);
      float _779 = (_770 * _774) + (_773 * _771);
      int _782 = WaveReadLaneFirst(_materialIndex);
      int _790 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_782 < (uint)170000), _782, 0)) + 0u))]._chapterCardTex);
      float4 _797 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_790 < (uint)65000), _790, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(((0.5f - (_750 * _751)) + (_747 * _748)), (((_750 * _748) + 0.5f) + (_747 * _751))));
      int _799 = WaveReadLaneFirst(_materialIndex);
      int _807 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_799 < (uint)170000), _799, 0)) + 0u))]._chapterCardTex);
      float4 _814 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_807 < (uint)65000), _807, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2((_776 + 0.5f), (_779 + 0.5f)));
      float _816 = abs(_776);
      float _817 = _816 * 120.0f;
      float _823 = abs(_779);
      float _828 = _823 * 120.0f;
      float _842 = saturate((saturate(((saturate(_828 + -56.0f) * saturate(60.0f - _828)) * saturate(10.0f - (_816 * 20.0f))) + ((saturate(_817 + -54.0f) * saturate(58.0f - _817)) * saturate(10.0f - (_823 * 20.0f)))) * 0.5f) + _814.x);
      float _844 = (_797.x * _797.x) * _720;
      float _851 = (_844 * (_421 - _715)) + _715;
      float _852 = (_844 * (_422 - _716)) + _716;
      float _853 = (_844 * (_423 - _717)) + _717;
      float _854 = _842 * _720;
      float _864 = abs(_120);
      float _866 = 1.0f - (_864 * 0.800000011920929f);
      int _870 = WaveReadLaneFirst(_materialIndex);
      int _878 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_870 < (uint)170000), _870, 0)) + 0u))]._lensDirtTex);
      float4 _885 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_878 < (uint)65000), _878, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_82, TEXCOORD.y));
      float _898 = saturate(_864 * 2.0f) * exp2(log2(saturate(sqrt(_707 + (_120 * _120)))) * 6.0f);
      float _905 = saturate(((_686 + _603) + _797.x) + _842);
      float _920 = max(0.0010000000474974513f, _exposure0.x);
      _925 = ((((((((_854 * (_421 - _851)) + _851) * _866) - _377) + (_898 * _885.x)) * _905) + _377) / _920);
      _926 = ((((((((_854 * (_422 - _852)) + _852) * _866) - _378) + (_898 * _885.y)) * _905) + _378) / _920);
      _927 = ((((((((_854 * (_423 - _853)) + _853) * _866) - _379) + (_898 * _885.z)) * _905) + _379) / _920);
    } else {
      _925 = _377;
      _926 = _378;
      _927 = _379;
    }
    float _943 = 1.0f - ((_335 * _335) * (_324 * 0.5f));
    float _944 = ((((_509 * _465) - _925) * _324) + _925) * _943;
    float _945 = ((((_510 * _466) - _926) * _324) + _926) * _943;
    float _946 = ((((_511 * _467) - _927) * _324) + _927) * _943;
    float _959 = 1.0f - ((_262 * _262) * (_251 * 0.5f));
    float _960 = ((((_509 * (((_465 + -1.0f) * 0.5f) + 1.0f)) - _944) * _251) + _944) * _959;
    float _961 = ((((_510 * (((_466 + -1.0f) * 0.5f) + 1.0f)) - _945) * _251) + _945) * _959;
    float _962 = ((((_511 * (((_467 + -1.0f) * 0.5f) + 1.0f)) - _946) * _251) + _946) * _959;
    float _967 = ((saturate(_79 * 4.0f) * 10000.0f) + 10000.0f) * (1.0f - ((_189 * _189) * (_178 * 0.5f)));
    float _977 = (((_967 * _61) - _960) * _178) + _960;
    float _978 = (((_967 * _62) - _961) * _178) + _961;
    float _979 = (((_967 * _63) - _962) * _178) + _962;
    float _982 = saturate((_79 * 15.0f) + -14.0f);
    _993 = (lerp(_977, _925, _982));
    _994 = (lerp(_978, _926, _982));
    _995 = (lerp(_979, _927, _982));
  } else {
    _993 = (_61 * 10000.0f);
    _994 = (_62 * 10000.0f);
    _995 = (_63 * 10000.0f);
  }
  uint _996 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _1003 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_996), 0));
    _1009 = (float((uint)((uint)(_1003.x & 127))) + 0.5f);
  } else {
    _1009 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_993, _994, _995));
    _1377 = output_color.x;
    _1378 = output_color.y;
    _1379 = output_color.z;
  } else {
    _1377 = _993;
    _1378 = _994;
    _1379 = _995;
  }
  if (_etcParams.y > 1.0f) {
    float _1390 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _1391 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _1395 = saturate(1.0f - (dot(float2(_1390, _1391), float2(_1390, _1391)) * saturate(_etcParams.y + -1.0f)));
    _1400 = (_1395 * _1377);
    _1401 = (_1395 * _1378);
    _1402 = (_1395 * _1379);
  } else {
    _1400 = _1377;
    _1401 = _1378;
    _1402 = _1379;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _1435 = select((_1400 <= 0.0031308000907301903f), (_1400 * 12.920000076293945f), (((pow(_1400, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1436 = select((_1401 <= 0.0031308000907301903f), (_1401 * 12.920000076293945f), (((pow(_1401, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1437 = select((_1402 <= 0.0031308000907301903f), (_1402 * 12.920000076293945f), (((pow(_1402, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1435 = _1400;
    _1436 = _1401;
    _1437 = _1402;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _1442 = float((uint)_996);
    if (!(_1442 < _viewDir.w)) {
      if (!(_1442 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _1451 = _1435;
        _1452 = _1436;
        _1453 = _1437;
      } else {
        _1451 = 0.0f;
        _1452 = 0.0f;
        _1453 = 0.0f;
      }
    } else {
      _1451 = 0.0f;
      _1452 = 0.0f;
      _1453 = 0.0f;
    }
  } else {
    _1451 = _1435;
    _1452 = _1436;
    _1453 = _1437;
  }
  float _1463 = exp2(log2(_1451 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1464 = exp2(log2(_1452 * 9.999999747378752e-05f) * 0.1593017578125f);
  float _1465 = exp2(log2(_1453 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_1463 * 18.6875f) + 1.0f)) * ((_1463 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_1464 * 18.6875f) + 1.0f)) * ((_1464 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_1465 * 18.6875f) + 1.0f)) * ((_1465 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _1009;
  return SV_Target;
}

