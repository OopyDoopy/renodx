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
  int _31 = WaveReadLaneFirst(_materialIndex);
  float _39 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_31 < (uint)170000), _31, 0)) + 0u))]._chapterTransition);
  bool _40 = (_39 > 0.5f);
  float _41 = _39 * 2.0f;
  float _43 = select(_40, (2.0f - _41), _41);
  float _142;
  float _215;
  float _288;
  float _535;
  float _618;
  float _857;
  float _858;
  float _859;
  float _924;
  float _925;
  float _926;
  float _940;
  float _1186;
  float _1187;
  float _1188;
  float _1308;
  float _1309;
  float _1310;
  float _1331;
  float _1332;
  float _1333;
  float _1366;
  float _1367;
  float _1368;
  float _1382;
  float _1383;
  float _1384;
  if (_43 > 0.0f) {
    float _46 = _24 * TEXCOORD.x;
    int _54 = WaveReadLaneFirst(_materialIndex);
    int _62 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_54 < (uint)170000), _54, 0)) + 0u))]._chapterNoiseTex);
    float4 _69 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_62 < (uint)65000), _62, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((_46 * 4.0f) - ((_43 * TEXCOORD.x) * rsqrt(TEXCOORD.x * TEXCOORD.x))), (TEXCOORD.y * 4.0f)));
    float _73 = (_69.x * 0.009999999776482582f) + -0.004980391822755337f;
    float _75 = (_69.y * 0.009999999776482582f) + -0.004980391822755337f;
    float _77 = (_69.y * 0.03999999910593033f) + -0.019921567291021347f;
    float _78 = saturate(_43);
    float _80 = saturate(_78 * 2.0f);
    float _84 = TEXCOORD.x + -0.5f;
    float _85 = select(_40, -1.0f, 1.0f) + _84;
    float _87 = TEXCOORD.y + -0.5f;
    float _88 = (_73 * _80) + _87;
    float _89 = ((_77 * _80) + _85) * _24;
    float _90 = _89 * 32.0f;
    float _91 = _88 * 32.0f;
    float _101 = frac(sin(dot(float2((ceil(_90 + 0.5f) * 0.125f), (ceil(_91 + 0.5f) * 0.125f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.546875f);
    float _102 = round(_90);
    float _103 = round(_91);
    float _113 = saturate(((0.25f - (_78 * 3.0f)) + (sqrt((_103 * _103) + (_102 * _102)) * 0.03125f)) * 0.800000011920929f);
    float _114 = 1.0f - _113;
    if (!(!(_114 >= 0.0010000000474974513f))) {
      float _117 = _114 * -9.6875f;
      float _129 = _113 * 0.1666666716337204f;
      float _130 = _114 * 0.3125f;
      _142 = float((bool)((uint)(((abs((_130 * ((_89 * (_117 + 32.0f)) - _102)) * (1.0f - frac(_101 * 7.0f))) < _129)) && ((abs((_130 * ((_88 * (_117 + 32.0f)) - _103)) * frac(_101 * 3.0f)) < _129)))));
    } else {
      _142 = 1.0f;
    }
    float _151 = saturate(1.0f - abs((saturate(_114 - ((_101 + -0.5f) * 0.125f)) * 3.0f) + -2.0f));
    float _152 = _151 * _151;
    float _153 = _152 * _152;
    float _155 = saturate(_43 + -0.0833333358168602f);
    float _157 = saturate(_155 * 2.0f);
    float _161 = (_157 * _73) + _87;
    float _162 = ((_157 * _77) + _85) * _24;
    float _163 = _162 * 16.0f;
    float _164 = _161 * 16.0f;
    float _174 = frac(sin(dot(float2((ceil(_163 + 0.5f) * 0.25f), (ceil(_164 + 0.5f) * 0.25f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.546875f);
    float _175 = round(_163);
    float _176 = round(_164);
    float _186 = saturate(((0.25f - (_155 * 3.0f)) + (sqrt((_176 * _176) + (_175 * _175)) * 0.0625f)) * 0.800000011920929f);
    float _187 = 1.0f - _186;
    if (!(!(_187 >= 0.0010000000474974513f))) {
      float _190 = _187 * -4.6875f;
      float _202 = _186 * 0.1666666716337204f;
      float _203 = _187 * 0.3125f;
      _215 = float((bool)((uint)(((abs((_203 * ((_162 * (_190 + 16.0f)) - _175)) * (1.0f - frac(_174 * 7.0f))) < _202)) && ((abs((_203 * ((_161 * (_190 + 16.0f)) - _176)) * frac(_174 * 3.0f)) < _202)))));
    } else {
      _215 = 1.0f;
    }
    float _224 = saturate(1.0f - abs((saturate(_187 - ((_174 + -0.5f) * 0.125f)) * 3.0f) + -2.0f));
    float _225 = _224 * _224;
    float _226 = _225 * _225;
    float _228 = saturate(_43 + -0.1666666716337204f);
    float _230 = saturate(_228 * 2.0f);
    float _234 = (_230 * _73) + _87;
    float _235 = ((_230 * _77) + _85) * _24;
    float _236 = _235 * 10.666666984558105f;
    float _237 = _234 * 10.666666984558105f;
    float _247 = frac(sin(dot(float2((ceil(_236 + 0.5f) * 0.375f), (ceil(_237 + 0.5f) * 0.375f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.546875f);
    float _248 = round(_236);
    float _249 = round(_237);
    float _259 = saturate(((0.25f - (_228 * 3.0f)) + (sqrt((_249 * _249) + (_248 * _248)) * 0.09375f)) * 0.800000011920929f);
    float _260 = 1.0f - _259;
    if (!(!(_260 >= 0.0010000000474974513f))) {
      float _263 = _260 * -3.0208334922790527f;
      float _275 = _259 * 0.1666666716337204f;
      float _276 = _260 * 0.3125f;
      _288 = float((bool)((uint)(((abs((_276 * ((_235 * (_263 + 10.666666984558105f)) - _248)) * (1.0f - frac(_247 * 7.0f))) < _275)) && ((abs((_276 * ((_234 * (_263 + 10.666666984558105f)) - _249)) * frac(_247 * 3.0f)) < _275)))));
    } else {
      _288 = 1.0f;
    }
    float _297 = saturate(1.0f - abs((saturate(_260 - ((_247 + -0.5f) * 0.125f)) * 3.0f) + -2.0f));
    float _298 = _297 * _297;
    float _299 = _298 * _298;
    int _300 = WaveReadLaneFirst(_materialIndex);
    int _308 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_300 < (uint)170000), _300, 0)) + 0u))]._chapterBackgroundColor);
    float _311 = float((uint)((uint)(((uint)((uint)(_308)) >> 16) & 255)));
    float _314 = float((uint)((uint)(((uint)((uint)(_308)) >> 8) & 255)));
    float _316 = float((uint)((uint)(_308 & 255)));
    float _341 = select(((_311 * 0.003921568859368563f) < 0.040449999272823334f), (_311 * 0.0003035269910469651f), exp2(log2((_311 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _342 = select(((_314 * 0.003921568859368563f) < 0.040449999272823334f), (_314 * 0.0003035269910469651f), exp2(log2((_314 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _343 = select(((_316 * 0.003921568859368563f) < 0.040449999272823334f), (_316 * 0.0003035269910469651f), exp2(log2((_316 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    int _344 = WaveReadLaneFirst(_materialIndex);
    int _352 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_344 < (uint)170000), _344, 0)) + 0u))]._chapterCardColor);
    float _355 = float((uint)((uint)(((uint)((uint)(_352)) >> 16) & 255)));
    float _358 = float((uint)((uint)(((uint)((uint)(_352)) >> 8) & 255)));
    float _360 = float((uint)((uint)(_352 & 255)));
    float _385 = select(((_355 * 0.003921568859368563f) < 0.040449999272823334f), (_355 * 0.0003035269910469651f), exp2(log2((_355 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _386 = select(((_358 * 0.003921568859368563f) < 0.040449999272823334f), (_358 * 0.0003035269910469651f), exp2(log2((_358 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _387 = select(((_360 * 0.003921568859368563f) < 0.040449999272823334f), (_360 * 0.0003035269910469651f), exp2(log2((_360 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    int _388 = WaveReadLaneFirst(_materialIndex);
    int _396 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_388 < (uint)170000), _388, 0)) + 0u))]._sceneTintColor);
    float _399 = float((uint)((uint)(((uint)((uint)(_396)) >> 16) & 255)));
    float _402 = float((uint)((uint)(((uint)((uint)(_396)) >> 8) & 255)));
    float _404 = float((uint)((uint)(_396 & 255)));
    float _429 = select(((_399 * 0.003921568859368563f) < 0.040449999272823334f), (_399 * 0.0003035269910469651f), exp2(log2((_399 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _430 = select(((_402 * 0.003921568859368563f) < 0.040449999272823334f), (_402 * 0.0003035269910469651f), exp2(log2((_402 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float _431 = select(((_404 * 0.003921568859368563f) < 0.040449999272823334f), (_404 * 0.0003035269910469651f), exp2(log2((_404 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    float4 _436 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_73 + TEXCOORD.x), (_75 + TEXCOORD.y)));
    float _453 = saturate(_43 * 4.0f);
    if (_43 > 0.20000000298023224f) {
      float _462 = _24 * _84;
      float _470 = ((((0.5f - TEXCOORD.y) + _462) * 0.7071067690849304f) + _77) + _73;
      float _472 = (((_462 + _87) * 0.7071067690849304f) + _73) + _75;
      float _473 = _470 * 16.0f;
      float _474 = _472 * 16.0f;
      float _484 = frac(sin(dot(float2((ceil(_473 + 0.5f) * 0.25f), (ceil(_474 + 0.5f) * 0.25f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.546875f);
      float _485 = round(_473);
      float _486 = round(_474);
      float _495 = saturate(((0.800000011920929f - (_43 * 0.800000011920929f)) + (sqrt((_486 * _486) + (_485 * _485)) * 0.0625f)) * 1.25f);
      float _496 = 1.0f - _495;
      if (!(!(_496 >= 0.0010000000474974513f))) {
        float _503 = sin((_time.x * _484) + 0.800000011920929f);
        bool _505 = (frac(_484) > 0.5f);
        float _508 = _496 * -3.0f;
        float _522 = _495 * 0.1666666716337204f;
        float _523 = _496 * 0.20000000298023224f;
        _535 = float((bool)((uint)(((abs(((1.0f - frac(_484 * 7.0f)) * _523) * (((_470 * (_508 + 16.0f)) - _485) + select(_505, _503, 0.0f))) < _522)) && ((abs((frac(_484 * 3.0f) * _523) * (((_472 * (_508 + 16.0f)) - _486) + select(_505, 0.0f, _503))) < _522)))));
      } else {
        _535 = 1.0f;
      }
      float _544 = saturate(1.0f - abs((saturate(_496 - ((_484 + -0.5f) * 0.125f)) * 3.0f) + -2.0f));
      float _545 = _544 * _544;
      float _548 = (_535 * 0.2999999523162842f) * (_545 * _545);
      float _552 = (_548 * _341) + _341;
      float _553 = (_548 * _342) + _342;
      float _554 = (_548 * _343) + _343;
      float _556 = _470 * 8.0f;
      float _557 = _472 * 8.0f;
      float _567 = frac(sin(dot(float2((ceil(_556 + 0.5f) * 0.5f), (ceil(_557 + 0.5f) * 0.5f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.546875f);
      float _568 = round(_556);
      float _569 = round(_557);
      float _578 = saturate(((1.25f - (_43 * 1.4249999523162842f)) + (sqrt((_569 * _569) + (_568 * _568)) * 0.125f)) * 0.800000011920929f);
      float _579 = 1.0f - _578;
      if (!(!(_579 >= 0.0010000000474974513f))) {
        float _586 = sin((_time.x * _567) + 1.25f);
        bool _588 = (frac(_567) > 0.5f);
        float _591 = _579 * -2.1875f;
        float _605 = _578 * 0.1666666716337204f;
        float _606 = _579 * 0.3125f;
        _618 = float((bool)((uint)(((abs(((1.0f - frac(_567 * 7.0f)) * _606) * (((_470 * (_591 + 8.0f)) - _568) + select(_588, _586, 0.0f))) < _605)) && ((abs((frac(_567 * 3.0f) * _606) * (((_472 * (_591 + 8.0f)) - _569) + select(_588, 0.0f, _586))) < _605)))));
      } else {
        _618 = 1.0f;
      }
      float _627 = saturate(1.0f - abs((saturate(_579 - ((_567 + -0.5f) * 0.125f)) * 3.0f) + -2.0f));
      float _628 = _627 * _627;
      float _631 = (_618 * 0.6000000238418579f) * (_628 * _628);
      float _639 = _87 * _87;
      float _646 = 1.0f - (exp2(log2(sqrt((_462 * _462) + _639)) * 1.5f) * 0.75f);
      float _647 = ((_631 * _552) + _552) * _646;
      float _648 = ((_631 * _553) + _553) * _646;
      float _649 = ((_631 * _554) + _554) * _646;
      float _652 = saturate((_43 + -0.5f) * 2.0f);
      float _656 = (_time.x * 0.015707964077591896f) + 0.7853981852531433f;
      float _663 = saturate((exp2(log2(1.0f - _652) * 2.5f) + -0.05000000074505806f) * 1.1111111640930176f);
      float _667 = (_663 * _663) * (3.0f - (_663 * 2.0f));
      float _668 = _667 * 0.5f;
      float _669 = 1.0f - _668;
      float _672 = _667 * -0.25f;
      float _675 = (_24 + -1.0f) * 0.5f;
      float _679 = ((-0.5f - _672) + (_669 * _46)) - (_669 * _675);
      float _680 = cos(_656);
      float _682 = ((_669 * TEXCOORD.y) - _672) + -0.5f;
      float _683 = sin(_656);
      float _692 = (_time.x * 0.03141592815518379f) + 1.5707963705062866f;
      float _693 = 0.6000000238418579f - _668;
      float _696 = _667 * 0.25f;
      float _702 = ((_696 + -0.30000001192092896f) + (_693 * _46)) - (_693 * _675);
      float _703 = cos(_692);
      float _705 = ((_693 * TEXCOORD.y) - (-0.20000000298023224f - _696)) + -0.5f;
      float _706 = sin(_692);
      float _708 = (_702 * _703) - (_705 * _706);
      float _711 = (_702 * _706) + (_705 * _703);
      int _714 = WaveReadLaneFirst(_materialIndex);
      int _722 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_714 < (uint)170000), _714, 0)) + 0u))]._chapterCardTex);
      float4 _729 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_722 < (uint)65000), _722, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(((0.5f - (_682 * _683)) + (_679 * _680)), (((_682 * _680) + 0.5f) + (_679 * _683))));
      int _731 = WaveReadLaneFirst(_materialIndex);
      int _739 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_731 < (uint)170000), _731, 0)) + 0u))]._chapterCardTex);
      float4 _746 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_739 < (uint)65000), _739, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2((_708 + 0.5f), (_711 + 0.5f)));
      float _748 = abs(_708);
      float _749 = _748 * 120.0f;
      float _755 = abs(_711);
      float _760 = _755 * 120.0f;
      float _774 = saturate((saturate(((saturate(_760 + -56.0f) * saturate(60.0f - _760)) * saturate(10.0f - (_748 * 20.0f))) + ((saturate(_749 + -54.0f) * saturate(58.0f - _749)) * saturate(10.0f - (_755 * 20.0f)))) * 0.5f) + _746.x);
      float _776 = (_729.x * _729.x) * _652;
      float _783 = (_776 * (_385 - _647)) + _647;
      float _784 = (_776 * (_386 - _648)) + _648;
      float _785 = (_776 * (_387 - _649)) + _649;
      float _786 = _774 * _652;
      float _796 = abs(_84);
      float _798 = 1.0f - (_796 * 0.800000011920929f);
      int _802 = WaveReadLaneFirst(_materialIndex);
      int _810 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_802 < (uint)170000), _802, 0)) + 0u))]._lensDirtTex);
      float4 _817 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_810 < (uint)65000), _810, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_46, TEXCOORD.y));
      float _830 = saturate(_796 * 2.0f) * exp2(log2(saturate(sqrt(_639 + (_84 * _84)))) * 6.0f);
      float _837 = saturate(((_618 + _535) + _729.x) + _774);
      float _852 = max(0.0010000000474974513f, _exposure0.x);
      _857 = ((((((((_786 * (_385 - _783)) + _783) * _798) - _341) + (_830 * _817.x)) * _837) + _341) / _852);
      _858 = ((((((((_786 * (_386 - _784)) + _784) * _798) - _342) + (_830 * _817.y)) * _837) + _342) / _852);
      _859 = ((((((((_786 * (_387 - _785)) + _785) * _798) - _343) + (_830 * _817.z)) * _837) + _343) / _852);
    } else {
      _857 = _341;
      _858 = _342;
      _859 = _343;
    }
    float _875 = 1.0f - ((_299 * _299) * (_288 * 0.5f));
    float _876 = ((((_436.x * _429) - _857) * _288) + _857) * _875;
    float _877 = ((((_436.y * _430) - _858) * _288) + _858) * _875;
    float _878 = ((((_436.z * _431) - _859) * _288) + _859) * _875;
    float _891 = 1.0f - ((_226 * _226) * (_215 * 0.5f));
    float _892 = ((((_436.x * (((_429 + -1.0f) * 0.5f) + 1.0f)) - _876) * _215) + _876) * _891;
    float _893 = ((((_436.y * (((_430 + -1.0f) * 0.5f) + 1.0f)) - _877) * _215) + _877) * _891;
    float _894 = ((((_436.z * (((_431 + -1.0f) * 0.5f) + 1.0f)) - _878) * _215) + _878) * _891;
    float _898 = 1.0f - ((_153 * _153) * (_142 * 0.5f));
    float _908 = (((((_453 * _27.x) + _27.x) * _898) - _892) * _142) + _892;
    float _909 = (((((_453 * _27.y) + _27.y) * _898) - _893) * _142) + _893;
    float _910 = (((((_453 * _27.z) + _27.z) * _898) - _894) * _142) + _894;
    float _913 = saturate((_43 * 15.0f) + -14.0f);
    _924 = (lerp(_908, _857, _913));
    _925 = (lerp(_909, _858, _913));
    _926 = (lerp(_910, _859, _913));
  } else {
    _924 = _27.x;
    _925 = _27.y;
    _926 = _27.z;
  }
  uint _927 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _934 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_927), 0));
    _940 = (float((uint)((uint)(_934.x & 127))) + 0.5f);
  } else {
    _940 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_924, _925, _926));
    _1308 = output_color.x;
    _1309 = output_color.y;
    _1310 = output_color.z;
  } else {
    _1308 = _924;
    _1309 = _925;
    _1310 = _926;
  }
  if (_etcParams.y > 1.0f) {
    float _1321 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _1322 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _1326 = saturate(1.0f - (dot(float2(_1321, _1322), float2(_1321, _1322)) * saturate(_etcParams.y + -1.0f)));
    _1331 = (_1326 * _1308);
    _1332 = (_1326 * _1309);
    _1333 = (_1326 * _1310);
  } else {
    _1331 = _1308;
    _1332 = _1309;
    _1333 = _1310;
  }
  if (((_localToneMappingParams.w > 0.0f)) && ((_etcParams.z > 0.0f))) {
    _1366 = select((_1331 <= 0.0031308000907301903f), (_1331 * 12.920000076293945f), (((pow(_1331, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1367 = select((_1332 <= 0.0031308000907301903f), (_1332 * 12.920000076293945f), (((pow(_1332, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1368 = select((_1333 <= 0.0031308000907301903f), (_1333 * 12.920000076293945f), (((pow(_1333, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1366 = _1331;
    _1367 = _1332;
    _1368 = _1333;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _1373 = float((uint)_927);
    if (!(_1373 < _viewDir.w)) {
      if (!(_1373 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _1382 = _1366;
        _1383 = _1367;
        _1384 = _1368;
      } else {
        _1382 = 0.0f;
        _1383 = 0.0f;
        _1384 = 0.0f;
      }
    } else {
      _1382 = 0.0f;
      _1383 = 0.0f;
      _1384 = 0.0f;
    }
  } else {
    _1382 = _1366;
    _1383 = _1367;
    _1384 = _1368;
  }
  SV_Target.x = _1382;
  SV_Target.y = _1383;
  SV_Target.z = _1384;
  SV_Target.w = _940;
  return SV_Target;
}

