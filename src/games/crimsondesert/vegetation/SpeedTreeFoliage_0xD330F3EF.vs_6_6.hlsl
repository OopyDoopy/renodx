struct IndirectDrawParameters {
  uint16_t _vertexBufferViewIndex;
  uint16_t _staticMeshDataViewIndex;
  uint16_t _staticMeshDataIndex;
  uint16_t _lodData;
  uint _baseVertexLocation;
  uint _bindlessMaterialParametersViewIndex;
  uint _windParams;
};

struct InstanceData {
  float4 intancingInfo;
  float4 intancingInfo1;
  float4 intancingInfo2;
  float4 intancingInfo3;
};

struct MaterialOverrideParametersTreeStruct {
  uint _baseColorTexture;
  uint _normalTexture;
  uint _materialTexture;
  uint _heightTexture;
  uint _materialInfo;
};

struct PrimitiveBufferView {
  int4 _vertexBufferView;
  int4 _indexBufferView;
};

struct SceneTrailTransforms {
  row_major float4x4 _trailViewProj;
  row_major float4x4 _trailInvViewProjTexScale;
  row_major float4x4 _trailViewProjTexScale;
  float4 _trailUpdatedPosition;
};

struct SpeedTreeData {
  float4 _windVector;
  float4 _windGlobal;
  float4 _windGlobalData0;
  float4 _windBranchAndTwitch;
  float4 _windBranchData0;
  float4 _windLeaf1Data0;
  float4 _windLeaf1Data1;
  float4 _windLeaf1Data2;
  float4 _windLeaf1Data3;
  float4 _windLeaf1Data4;
  float4 _windLeaf2Data0;
  float4 _windLeaf2Data1;
  float4 _windLeaf2Data2;
  float4 _windLeaf2Data3;
  float4 _windLeaf2Data4;
};

struct SpeedTreeDataForBuffer {
  SpeedTreeData _curr;
  SpeedTreeData _prev;
};

struct pa_uint16_array_10_ {
  uint16_t _16[10];
};

struct StaticMeshData {
  PrimitiveBufferView _primitiveBufferView[11];
  uint _vertexBufferViewIndices[11];
  uint _indexBufferPoolEntryIndices[11];
  uint _indexBufferViewStartOffsets[11];
  float3 _aabbMin;
  float3 _aabbMax;
  uint _meshNodeDataStartIndex;
  uint _numPrimitives;
  uint _indexCount;
  uint _vertexCount;
  uint _windParams;
  int _minLodIndex;
  int _maxLodIndex;
  uint _maxNumLodMeshNodes;
  pa_uint16_array_10_ _meshNodeDataOffsetsForLods;
  pa_uint16_array_10_ _numMeshNodesForLods;
  pa_uint16_array_10_ _primitiveEndIndicesForLods;
  float _maxDeviationsForLods[10];
  uint _meshDataId;
  uint _impostorPrimitiveId;
  uint _isImpostorForLods;
  uint _flag;
  uint4 _levelColorPoint0;
  uint4 _levelColorPoint1;
  float3 _levelMaxPos;
  float3 _levelMinPos;
  uint4 _treeShapeVariationParams;
};

struct TerrainHeightFieldRegionInfo {
  uint _regionIndex;
  uint _subLayerTextureSRVIndex;
  float _subLayerTileScale;
  uint _applyTerrainRulesOnObjects;
  uint4 _detailTextureIndex;
  uint4 _detailTextureDiffuseSRVIndex;
  uint4 _detailTextureNormalSRVIndex;
  uint4 _detailTextureMaterialSRVIndex;
  uint4 _detailTextureHeightSRVIndex;
  uint4 _physicsMaterialID;
  uint4 _physicsRepresentColor;
  uint4 _largeScalePlacementId;
  uint4 _smallScalePlacementId;
  float4 _detailHeightCut;
  float4 _detailHeightScale;
  float4 _detailColorLayerHeight;
  float4 _detailColorLayerHeightMin;
  float4 _useExtraRegionTintLayer;
  uint4 _detailTintColor;
  float4 _submaskLayerTextureDisplace;
  float4 _maskLayerTextureDisplace;
  float _deformedAmount;
  float _maskLerpRatio;
  float _baseColorDisplace;
};

struct TerrainLayerTexture {
  uint _heightTerrainTextureLayerSRVIndex;
  uint _normalTerrainTextureLayerSRVIndex;
  uint _regionTerrainTextureLayerSRVIndex;
  uint _maskTerrainTextureLayerSRVIndex;
  float _heightTerrainTextureLayerRange;
  float _heightTerrainTextureLayerOffset;
  uint _extraRegionTerrainTextureLayerSRVIndex;
  uint _padding;
};

struct TreeSurfacePositionData {
  float4 _worldPos;
  float4 _worldPosPrev;
};

struct VertexDataTree {
  uint16_t4 _position;
  uint _normal;
  half4 _diffuseTex;
  half4 _windNonBranch;
  half2 _windBranch;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

StructuredBuffer<TerrainHeightFieldRegionInfo> __3__37__0__0___terrainHeightFieldRegionInfo : register(t9, space37);

StructuredBuffer<StaticMeshData> __0__15__0__0__g_staticMeshDataBindless[] : register(t0, space15);

StructuredBuffer<IndirectDrawParameters> __3__37__0__0__g_indirectDrawParametersBuffer : register(t0, space37);

Texture2D<float4> __3__36__0__0__g_textureTrailInteraction : register(t49, space36);

Texture2D<float4> __3__36__0__0__g_textureTrailInteractionPrev : register(t71, space36);

Texture2D<float2> __3__36__0__0__g_textureTrailHeight : register(t48, space36);

Texture3D<float4> __3__36__0__0__g_windFluidInteractionVelocityHistory : register(t128, space36);

Texture3D<float4> __3__36__0__0__g_windFluidInteractionVelocityHistoryPrev : register(t196, space36);

Texture2D<float> __3__36__0__0__g_topDownClippingSpace : register(t76, space36);

StructuredBuffer<SpeedTreeDataForBuffer> __3__37__0__0__g_treeWindDataBuffer : register(t1048, space37);

StructuredBuffer<VertexDataTree> __0__103__0__0__g_bindlessVertexBuffersTree[] : register(t0, space103);

StructuredBuffer<InstanceData> __0__9__0__0__g_instanceDataBuffer[] : register(t0, space9);

RWByteAddressBuffer __3__39__0__1__g_treeSurfacePositionsCounterBufferUAV : register(u7, space39);

RWStructuredBuffer<TreeSurfacePositionData> __3__39__0__1__g_treeSurfacePositionsBufferUAV : register(u14, space39);

cbuffer __3__1__0__0__IndirectCommandConstants : register(b2, space1) {
  uint _drawIndex : packoffset(c000.x);
};

cbuffer __3__35__0__0__SceneConstantBuffer : register(b18, space35) {
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
  row_major float4x4 _viewProj;
  row_major float4x4 _viewProjNoJitter;
  row_major float4x4 _viewProjRelative;
  row_major float4x4 _viewProjRelativeNoJitter;
  row_major float4x4 _invViewProj;
  row_major float4x4 _invViewProjRelative;
  row_major float4x4 _invViewProjRelativeNoJitter;
  row_major float4x4 _viewProjRelativeOrtho;
  float4 _sunDirection;
  float4 _moonDirection;
  float4 _moonRight;
  float4 _moonUp;
  float4 _ssaoRandomDirection[16];
  row_major float4x4 _view;
  row_major float4x4 _viewRelative;
  row_major float4x4 _viewRelativePrev;
  row_major float4x4 _proj;
  row_major float4x4 _projNoJitter;
  float4 _viewPosPrev;
  row_major float4x4 _viewProjNoJitterPrev;
  row_major float4x4 _viewProjRelativePrev;
  row_major float4x4 _viewProjRelativeNoJitterPrev;
  row_major float4x4 _invViewProjPrev;
  row_major float4x4 _invViewProjRelativePrev;
  row_major float4x4 _projToPrevProj;
  row_major float4x4 _projToPrevProjNoTranslation;
  row_major float4x4 _viewProjectionTexScale;
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
  min16float4 _debugBaseColor16;
  min16float4 _debugNormal16;
  min16float4 _debugMaterial16;
  min16float4 _debugMultiplier16;
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

cbuffer __3__35__0__0__TerrainLayerTextureConstBuffer : register(b7, space35) {
  TerrainLayerTexture _terrainLayerTextures[40][40] : packoffset(c000.x);

  // Raw views preserve dynamic cbufferLoadLegacy.f32/i32 access.
  float4 __3__35__0__0__TerrainLayerTextureConstBuffer_raw[3200] : packoffset(c0);
  uint4 __3__35__0__0__TerrainLayerTextureConstBuffer_raw_uint[3200] : packoffset(c0);
};

cbuffer __3__35__0__0__TerrainCommonConstantBuffer : register(b9, space35) {
  float _regionLayerResolution : packoffset(c000.x);
  float _heightLayerResolution : packoffset(c000.y);
  int _globalWorldRadius : packoffset(c000.z);
  int _globalTextureOnePixelMeter : packoffset(c000.w);
  int _globalRegionMapOnePixelMeter : packoffset(c001.x);
  uint _globalColorMapSRVIndex : packoffset(c001.y);
  uint _globalExtraRegionTintColorMapSRVIndex : packoffset(c001.z);
  uint _globalRegionMapSRVIndex : packoffset(c001.w);
  uint _globalExtraRegionMapSRVIndex : packoffset(c002.x);
  uint _globalSmallScaleGroupMapSRVIndex : packoffset(c002.y);
  float _terrainTopLayerContrast : packoffset(c002.z);
  uint _useSSDM : packoffset(c002.w);
};

struct BindlessParameters_MaterialOverrideParametersTree {
  MaterialOverrideParametersTreeStruct BindlessParameters_MaterialOverrideParametersTree;
};

typedef BindlessParameters_MaterialOverrideParametersTree BindlessParameters_MaterialOverrideParametersTree_t;
ConstantBuffer<BindlessParameters_MaterialOverrideParametersTree_t> BindlessParameters_MaterialOverrideParametersTree[] : register(b0, space101);

cbuffer __3__35__0__0__SceneTrailHeightConstantBuffer : register(b3, space35) {
  SceneTrailTransforms _currSceneTrailHeight : packoffset(c000.x);
  SceneTrailTransforms _prevSceneTrailHeight : packoffset(c013.x);
  float4 _trailHeightTextureSizeAndInvSize : packoffset(c026.x);
};

cbuffer __3__35__0__0__SceneTrailInteractionConstantBuffer : register(b11, space35) {
  SceneTrailTransforms _currSceneTrailInteraction : packoffset(c000.x);
  SceneTrailTransforms _prevSceneTrailInteraction : packoffset(c013.x);
  float4 _trailInteractionTextureSizeAndInvSize : packoffset(c026.x);
};

cbuffer __3__35__0__0__ClippingSpaceCaptureConstantBuffer : register(b32, space35) {
  row_major float4x4 _clippingSpaceMatrixRelative : packoffset(c000.x);
  row_major float4x4 _clippingSpaceMatrixRelativePrev : packoffset(c004.x);
  row_major float4x4 _clippingSpaceMatrixRelativeTexScale : packoffset(c008.x);
  row_major float4x4 _clippingSpaceMatrixRelativeTexScalePrev : packoffset(c012.x);
  row_major float4x4 _clippingSpaceMatrixRelativeInvTexScale : packoffset(c016.x);
  row_major float4x4 _clippingSpaceMatrixRelativeInvTexScalePrev : packoffset(c020.x);
  float4 _clippingSpaceMatrixRelativePosition : packoffset(c024.x);
  float4 _clippingSpaceMatrixRelativePositionPrev : packoffset(c025.x);
};

SamplerState __0__95__0__0__g_samplerAnisotropicWrap : register(s8, space95);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

struct OutputSignature {
  precise noperspective float4 SV_Position : SV_Position;
  linear float4 TEXCOORD : TEXCOORD;
  linear float4 TEXCOORD_1 : TEXCOORD1;
  linear half4 NORMAL : NORMAL;
  nointerpolation uint2 TEXCOORD_2 : TEXCOORD2;
  linear float SV_ClipDistance : SV_ClipDistance;
  nointerpolation uint SV_ShadingRate : SV_ShadingRate;
};

OutputSignature main(
  uint BLENDINDICES : BLENDINDICES,
  uint SV_VertexID : SV_VertexID
) {
  float4 SV_Position;
  float4 TEXCOORD;
  float4 TEXCOORD_1;
  half4 NORMAL;
  uint2 TEXCOORD_2;
  float SV_ClipDistance;
  uint SV_ShadingRate;
  int _33;
  int16_t _36;
  int16_t _38;
  int16_t _40;
  int _42;
  int _46;
  float _51;
  float _52;
  float _53;
  float _55;
  float _56;
  float _57;
  int _59;
  int _61;
  int _62;
  int _63;
  int _64;
  uint _70;
  int16_t _78;
  int16_t _79;
  int16_t _80;
  int16_t _81;
  int _83;
  half _85;
  half _86;
  half _87;
  half _88;
  half _90;
  half _91;
  half _92;
  half _93;
  half _95;
  half _96;
  float _106;
  float _107;
  float _108;
  float _112;
  float _113;
  float _114;
  float _115;
  float _116;
  float _117;
  float _118;
  float _119;
  int _122;
  int _125;
  bool _126;
  int _127;
  int _128;
  int _133;
  float _140;
  float _141;
  float _142;
  float _143;
  float _145;
  float _146;
  float _147;
  float _148;
  float _150;
  float _152;
  float _153;
  float _154;
  float _155;
  int _156;
  int _168;
  float _175;
  float _176;
  float _177;
  float _178;
  float _180;
  float _181;
  float _182;
  float _184;
  float _186;
  float _187;
  float _188;
  float _189;
  bool _193;
  int _200;
  int _201;
  float _312;
  float _313;
  float _314;
  float _395;
  float _579;
  float _580;
  float _581;
  float _582;
  float _630;
  float _631;
  float _632;
  float _633;
  float _671;
  float _672;
  float _673;
  float _674;
  float _675;
  float _676;
  float _677;
  float _678;
  float _815;
  float _816;
  float _817;
  float _1210;
  float _1211;
  float _1212;
  float _1213;
  float _1214;
  float _1215;
  float _1625;
  float _1626;
  float _1627;
  float _1640;
  float _1641;
  float _1642;
  float _1643;
  float _1644;
  float _1645;
  float _1646;
  float _1647;
  float _1648;
  int _1659;
  int _1660;
  int _1661;
  int _1813;
  int _1814;
  float _1884;
  int _2015;
  int _2048;
  int _2051;
  float _2169;
  float _2170;
  float _2171;
  int _2216;
  int _2249;
  int _2252;
  float _2370;
  float _2371;
  float _2372;
  float _2380;
  float _2381;
  float _2382;
  float _2383;
  float _2384;
  float _2385;
  int _2480;
  int _2514;
  float _2684;
  float _2685;
  float _2686;
  int _2741;
  int _2775;
  float _2945;
  float _2946;
  float _2947;
  float _2955;
  float _2956;
  float _2957;
  float _2958;
  float _2959;
  float _2960;
  float _3105;
  float _3106;
  float _3107;
  float _3108;
  float _3109;
  float _3110;
  float _3249;
  float _3250;
  float _3332;
  float _3381;
  float _3382;
  float _3383;
  float _3384;
  int _195;
  float _218;
  float _222;
  float _224;
  float _250;
  float _251;
  float _263;
  float _264;
  float _265;
  float _270;
  float _273;
  float _276;
  float _278;
  float _280;
  float _282;
  float _284;
  float _286;
  float _288;
  float _290;
  float _319;
  float _320;
  float _321;
  float _337;
  float _341;
  uint2 _343;
  float _361;
  float _391;
  float _401;
  float _407;
  int _410;
  bool _413;
  int _415;
  float _424;
  float _425;
  float _426;
  float _427;
  float _429;
  float _430;
  float _431;
  float _433;
  float _434;
  float _435;
  float _436;
  float _438;
  float _439;
  float _440;
  float _442;
  float _443;
  float _445;
  float _446;
  float _447;
  float _449;
  float _450;
  float _451;
  float _452;
  float _454;
  float _455;
  float _456;
  float _457;
  float _459;
  float _460;
  float _462;
  float _463;
  float _464;
  float _466;
  float _467;
  float _468;
  float _469;
  float _471;
  float _472;
  float _473;
  float _475;
  float _476;
  float _477;
  float _478;
  float _480;
  float _481;
  float _482;
  float _484;
  float _485;
  float _487;
  float _488;
  float _489;
  float _491;
  float _492;
  float _493;
  float _494;
  float _496;
  float _497;
  float _498;
  float _499;
  float _501;
  float _502;
  float _504;
  float _505;
  float _506;
  float _507;
  float _508;
  float _527;
  float _528;
  float _529;
  float _540;
  float _544;
  float _545;
  float _546;
  float4 _561;
  float _566;
  float _572;
  float _595;
  float _596;
  float _597;
  float4 _612;
  float _617;
  float _623;
  float _634;
  float _641;
  float _642;
  float _643;
  float _645;
  float _652;
  float _659;
  float _660;
  float _661;
  float _663;
  float _683;
  float _686;
  float _689;
  float _692;
  float _694;
  float _695;
  float _696;
  float _697;
  float _709;
  float _711;
  float _719;
  float _720;
  float _732;
  float _736;
  float _743;
  float _748;
  float _749;
  float _750;
  float _751;
  float _752;
  float _754;
  float _755;
  float _756;
  float _757;
  float _759;
  float _760;
  float _761;
  float _762;
  float _763;
  float _768;
  float _771;
  float _774;
  float _777;
  float _780;
  float _781;
  float _782;
  float _783;
  float _784;
  float _787;
  float _788;
  float _790;
  float _791;
  float _792;
  float _798;
  float _799;
  float _829;
  float _830;
  float _831;
  float _834;
  float _835;
  float _836;
  float _850;
  float _851;
  float _852;
  float _869;
  bool _870;
  float _872;
  float _873;
  float _876;
  float _889;
  float _890;
  float _891;
  float _893;
  float _895;
  bool _898;
  float _907;
  float _916;
  float _932;
  float _933;
  float _934;
  float _939;
  float _967;
  float _968;
  float _969;
  float _971;
  float _972;
  float _973;
  float _974;
  float _976;
  float _986;
  float _987;
  float _998;
  float _999;
  float _1000;
  float _1001;
  float _1002;
  float _1011;
  float _1013;
  float _1014;
  float _1015;
  float _1016;
  float _1017;
  float _1018;
  float _1021;
  float _1027;
  float _1030;
  float _1031;
  float _1043;
  float _1055;
  float _1056;
  float _1067;
  float _1084;
  float _1086;
  float _1087;
  float _1088;
  float _1089;
  float _1090;
  float _1105;
  float _1108;
  float _1111;
  float _1114;
  float _1115;
  float _1116;
  float _1117;
  float _1130;
  float _1131;
  float _1132;
  float _1134;
  float _1168;
  float _1169;
  float _1170;
  float _1172;
  float _1191;
  float _1192;
  float _1193;
  float _1196;
  float _1229;
  float _1232;
  float _1235;
  float _1237;
  float _1238;
  float _1239;
  float _1240;
  float _1260;
  float _1261;
  float _1273;
  float _1277;
  float _1284;
  float _1289;
  float _1295;
  float _1296;
  float _1310;
  float _1311;
  float _1312;
  float _1329;
  bool _1330;
  float _1332;
  float _1333;
  float _1336;
  float _1348;
  float _1360;
  float _1369;
  float _1385;
  float _1386;
  float _1387;
  float _1392;
  float _1420;
  float _1421;
  float _1422;
  float _1424;
  float _1425;
  float _1426;
  float _1427;
  float _1429;
  float _1439;
  float _1440;
  float _1451;
  float _1452;
  float _1453;
  float _1454;
  float _1455;
  float _1464;
  float _1466;
  float _1467;
  float _1468;
  float _1469;
  float _1470;
  float _1471;
  float _1474;
  float _1480;
  float _1483;
  float _1484;
  float _1496;
  float _1508;
  float _1509;
  float _1520;
  float _1537;
  float _1539;
  float _1540;
  float _1541;
  float _1542;
  float _1543;
  float _1558;
  float _1561;
  float _1564;
  float _1567;
  float _1568;
  float _1569;
  float _1570;
  float _1583;
  float _1584;
  float _1585;
  float _1587;
  float _1606;
  float _1607;
  float _1608;
  float _1611;
  float _1650;
  float _1667;
  float _1671;
  float _1676;
  float _1689;
  float _1703;
  float _1704;
  float _1706;
  float _1707;
  float _1709;
  float _1711;
  float _1712;
  float _1713;
  float _1716;
  float _1717;
  float _1718;
  float _1719;
  float _1720;
  float _1721;
  float _1725;
  float _1726;
  float _1730;
  float _1734;
  float _1737;
  float _1738;
  float _1739;
  float _1740;
  float _1741;
  float _1742;
  float _1743;
  float _1750;
  float _1754;
  float _1757;
  float _1758;
  float _1761;
  float _1764;
  float _1767;
  float _1771;
  float _1772;
  float _1773;
  float _1776;
  float _1779;
  float _1782;
  float _1784;
  int _1805;
  int _1808;
  float _1828;
  float _1829;
  float _1832;
  float _1835;
  float _1838;
  float _1841;
  float _1851;
  float _1854;
  float _1857;
  float _1861;
  float _1862;
  float _1863;
  int _1869;
  float _1887;
  float _1889;
  float _1907;
  float _1908;
  float _1909;
  float _1911;
  float _1912;
  float _1913;
  float _1914;
  float _1917;
  float _1920;
  float _1923;
  float _1925;
  float _1926;
  float _1927;
  float _1928;
  float _1935;
  int _1942;
  float _1952;
  float _1953;
  float _1954;
  float _1970;
  float _1974;
  bool _1976;
  float2 _1983;
  float _2061;
  float _2062;
  float _2063;
  float _2079;
  float _2083;
  float4 _2092;
  float _2098;
  float _2099;
  float _2101;
  float _2102;
  float _2103;
  float _2104;
  float _2108;
  float _2113;
  float _2116;
  float _2117;
  float _2119;
  float _2120;
  float _2121;
  float _2122;
  float _2125;
  float _2132;
  float _2136;
  float _2137;
  float _2138;
  float _2139;
  float _2140;
  float _2141;
  float _2151;
  float _2152;
  float2 _2184;
  float _2262;
  float _2263;
  float _2264;
  float _2280;
  float _2284;
  float4 _2293;
  float _2299;
  float _2300;
  float _2302;
  float _2303;
  float _2304;
  float _2305;
  float _2309;
  float _2314;
  float _2317;
  float _2318;
  float _2320;
  float _2321;
  float _2322;
  float _2323;
  float _2326;
  float _2333;
  float _2337;
  float _2338;
  float _2339;
  float _2340;
  float _2341;
  float _2342;
  float _2352;
  float _2353;
  float _2390;
  float _2391;
  float _2392;
  float _2393;
  float _2405;
  float _2406;
  float _2407;
  float _2423;
  float _2427;
  uint2 _2429;
  bool _2431;
  float2 _2447;
  float _2524;
  float _2525;
  float _2526;
  float _2542;
  float _2546;
  float4 _2555;
  float _2561;
  float _2562;
  float _2564;
  float _2565;
  float _2566;
  float _2567;
  float _2580;
  float _2586;
  float _2591;
  float _2594;
  float _2595;
  float _2597;
  float _2598;
  float _2599;
  float _2600;
  float _2606;
  float _2609;
  float _2613;
  float _2614;
  float _2615;
  float _2616;
  float _2617;
  float _2618;
  float _2628;
  float _2629;
  float _2639;
  float _2642;
  float _2651;
  float _2652;
  float _2653;
  float _2661;
  float _2662;
  float _2666;
  float2 _2708;
  float _2785;
  float _2786;
  float _2787;
  float _2803;
  float _2807;
  float4 _2816;
  float _2822;
  float _2823;
  float _2825;
  float _2826;
  float _2827;
  float _2828;
  float _2841;
  float _2847;
  float _2852;
  float _2855;
  float _2856;
  float _2858;
  float _2859;
  float _2860;
  float _2861;
  float _2867;
  float _2870;
  float _2874;
  float _2875;
  float _2876;
  float _2877;
  float _2878;
  float _2879;
  float _2889;
  float _2890;
  float _2900;
  float _2903;
  float _2912;
  float _2913;
  float _2914;
  float _2922;
  float _2923;
  float _2927;
  int _2962;
  int _2965;
  float _2977;
  float _2978;
  float _2986;
  float _2987;
  float _2989;
  float _2990;
  float _2991;
  float _2992;
  float _2995;
  float _3002;
  float _3005;
  float _3006;
  float _3008;
  float _3009;
  float _3010;
  float _3011;
  float _3014;
  float _3015;
  float _3016;
  float _3017;
  float _3018;
  float _3022;
  float _3023;
  float _3024;
  float _3025;
  float _3026;
  float _3027;
  float _3037;
  float _3038;
  float _3052;
  float _3055;
  float _3056;
  float _3058;
  float _3059;
  float _3060;
  float _3061;
  float _3064;
  float _3065;
  float _3069;
  float _3070;
  float _3071;
  float _3072;
  float _3073;
  float _3074;
  float _3084;
  float _3085;
  float _3184;
  int _3218;
  int _3240;
  float _3251;
  float _3252;
  float _3257;
  float _3258;
  float _3264;
  int4 _3274;
  uint2 _3307;
  float _3313;
  int _3338;
  uint2 _3352;
  float _3358;
  float4 _3376;
  _33 = WaveReadLaneFirst(_drawIndex);
  _36 = __3__37__0__0__g_indirectDrawParametersBuffer[_33]._vertexBufferViewIndex;
  _38 = __3__37__0__0__g_indirectDrawParametersBuffer[_33]._staticMeshDataViewIndex;
  _40 = __3__37__0__0__g_indirectDrawParametersBuffer[_33]._staticMeshDataIndex;
  _42 = __3__37__0__0__g_indirectDrawParametersBuffer[_33]._baseVertexLocation;
  _46 = (int)(min16uint)(_40);
  _51 = __0__15__0__0__g_staticMeshDataBindless[((int)((uint)(select(((uint)_38 < (uint)40000u), ((int)(min16uint)(_38)), 0)) + 0u))][_46]._aabbMin.x;
  _52 = __0__15__0__0__g_staticMeshDataBindless[((int)((uint)(select(((uint)_38 < (uint)40000u), ((int)(min16uint)(_38)), 0)) + 0u))][_46]._aabbMin.y;
  _53 = __0__15__0__0__g_staticMeshDataBindless[((int)((uint)(select(((uint)_38 < (uint)40000u), ((int)(min16uint)(_38)), 0)) + 0u))][_46]._aabbMin.z;
  _55 = __0__15__0__0__g_staticMeshDataBindless[((int)((uint)(select(((uint)_38 < (uint)40000u), ((int)(min16uint)(_38)), 0)) + 0u))][_46]._aabbMax.x;
  _56 = __0__15__0__0__g_staticMeshDataBindless[((int)((uint)(select(((uint)_38 < (uint)40000u), ((int)(min16uint)(_38)), 0)) + 0u))][_46]._aabbMax.y;
  _57 = __0__15__0__0__g_staticMeshDataBindless[((int)((uint)(select(((uint)_38 < (uint)40000u), ((int)(min16uint)(_38)), 0)) + 0u))][_46]._aabbMax.z;
  _59 = __0__15__0__0__g_staticMeshDataBindless[((int)((uint)(select(((uint)_38 < (uint)40000u), ((int)(min16uint)(_38)), 0)) + 0u))][_46]._flag;
  _61 = __0__15__0__0__g_staticMeshDataBindless[((int)((uint)(select(((uint)_38 < (uint)40000u), ((int)(min16uint)(_38)), 0)) + 0u))][_46]._treeShapeVariationParams.x;
  _62 = __0__15__0__0__g_staticMeshDataBindless[((int)((uint)(select(((uint)_38 < (uint)40000u), ((int)(min16uint)(_38)), 0)) + 0u))][_46]._treeShapeVariationParams.y;
  _63 = __0__15__0__0__g_staticMeshDataBindless[((int)((uint)(select(((uint)_38 < (uint)40000u), ((int)(min16uint)(_38)), 0)) + 0u))][_46]._treeShapeVariationParams.z;
  _64 = __0__15__0__0__g_staticMeshDataBindless[((int)((uint)(select(((uint)_38 < (uint)40000u), ((int)(min16uint)(_38)), 0)) + 0u))][_46]._treeShapeVariationParams.w;
  _70 = _42 + (uint)(SV_VertexID);
  _78 = __0__103__0__0__g_bindlessVertexBuffersTree[((int)((uint)(select(((uint)_36 < (uint)50000u), ((int)(min16uint)(_36)), 0)) + 0u))][_70]._position.x;
  _79 = __0__103__0__0__g_bindlessVertexBuffersTree[((int)((uint)(select(((uint)_36 < (uint)50000u), ((int)(min16uint)(_36)), 0)) + 0u))][_70]._position.y;
  _80 = __0__103__0__0__g_bindlessVertexBuffersTree[((int)((uint)(select(((uint)_36 < (uint)50000u), ((int)(min16uint)(_36)), 0)) + 0u))][_70]._position.z;
  _81 = __0__103__0__0__g_bindlessVertexBuffersTree[((int)((uint)(select(((uint)_36 < (uint)50000u), ((int)(min16uint)(_36)), 0)) + 0u))][_70]._position.w;
  _83 = __0__103__0__0__g_bindlessVertexBuffersTree[((int)((uint)(select(((uint)_36 < (uint)50000u), ((int)(min16uint)(_36)), 0)) + 0u))][_70]._normal;
  _85 = __0__103__0__0__g_bindlessVertexBuffersTree[((int)((uint)(select(((uint)_36 < (uint)50000u), ((int)(min16uint)(_36)), 0)) + 0u))][_70]._diffuseTex.x;
  _86 = __0__103__0__0__g_bindlessVertexBuffersTree[((int)((uint)(select(((uint)_36 < (uint)50000u), ((int)(min16uint)(_36)), 0)) + 0u))][_70]._diffuseTex.y;
  _87 = __0__103__0__0__g_bindlessVertexBuffersTree[((int)((uint)(select(((uint)_36 < (uint)50000u), ((int)(min16uint)(_36)), 0)) + 0u))][_70]._diffuseTex.z;
  _88 = __0__103__0__0__g_bindlessVertexBuffersTree[((int)((uint)(select(((uint)_36 < (uint)50000u), ((int)(min16uint)(_36)), 0)) + 0u))][_70]._diffuseTex.w;
  _90 = __0__103__0__0__g_bindlessVertexBuffersTree[((int)((uint)(select(((uint)_36 < (uint)50000u), ((int)(min16uint)(_36)), 0)) + 0u))][_70]._windNonBranch.x;
  _91 = __0__103__0__0__g_bindlessVertexBuffersTree[((int)((uint)(select(((uint)_36 < (uint)50000u), ((int)(min16uint)(_36)), 0)) + 0u))][_70]._windNonBranch.y;
  _92 = __0__103__0__0__g_bindlessVertexBuffersTree[((int)((uint)(select(((uint)_36 < (uint)50000u), ((int)(min16uint)(_36)), 0)) + 0u))][_70]._windNonBranch.z;
  _93 = __0__103__0__0__g_bindlessVertexBuffersTree[((int)((uint)(select(((uint)_36 < (uint)50000u), ((int)(min16uint)(_36)), 0)) + 0u))][_70]._windNonBranch.w;
  _95 = __0__103__0__0__g_bindlessVertexBuffersTree[((int)((uint)(select(((uint)_36 < (uint)50000u), ((int)(min16uint)(_36)), 0)) + 0u))][_70]._windBranch.x;
  _96 = __0__103__0__0__g_bindlessVertexBuffersTree[((int)((uint)(select(((uint)_36 < (uint)50000u), ((int)(min16uint)(_36)), 0)) + 0u))][_70]._windBranch.y;
  _106 = (((_55 - _51) * 1.5259021893143654e-05f) * ((float)((uint16_t)_78))) + _51;
  _107 = (((_57 - _53) * 1.5259021893143654e-05f) * ((float)((uint16_t)_79))) + _53;
  _108 = (((_56 - _52) * 1.5259021893143654e-05f) * ((float)((uint16_t)_80))) + _52;
  _112 = float(_87);
  _113 = float(_88);
  _114 = float(_90);
  _115 = float(_91);
  _116 = float(_92);
  _117 = float(_93);
  _118 = float(_95);
  _119 = float(_96);
  _122 = WaveReadLaneFirst(_drawIndex);
  _125 = __3__37__0__0__g_indirectDrawParametersBuffer[_122]._windParams;
  _126 = ((_59 & 536870912) == 0);
  _127 = (uint)((uint)(BLENDINDICES)) >> 16;
  _128 = BLENDINDICES & 65535;
  _133 = ((int)(uint)((int)(_frameNumber.y != 0))) + _127;
  _140 = __0__9__0__0__g_instanceDataBuffer[NonUniformResourceIndex(((int)((uint)(select(((uint)_133 < (uint)65000), _133, 0)) + 0u)))][_128].intancingInfo.x;
  _141 = __0__9__0__0__g_instanceDataBuffer[NonUniformResourceIndex(((int)((uint)(select(((uint)_133 < (uint)65000), _133, 0)) + 0u)))][_128].intancingInfo.y;
  _142 = __0__9__0__0__g_instanceDataBuffer[NonUniformResourceIndex(((int)((uint)(select(((uint)_133 < (uint)65000), _133, 0)) + 0u)))][_128].intancingInfo.z;
  _143 = __0__9__0__0__g_instanceDataBuffer[NonUniformResourceIndex(((int)((uint)(select(((uint)_133 < (uint)65000), _133, 0)) + 0u)))][_128].intancingInfo.w;
  _145 = __0__9__0__0__g_instanceDataBuffer[NonUniformResourceIndex(((int)((uint)(select(((uint)_133 < (uint)65000), _133, 0)) + 0u)))][_128].intancingInfo1.x;
  _146 = __0__9__0__0__g_instanceDataBuffer[NonUniformResourceIndex(((int)((uint)(select(((uint)_133 < (uint)65000), _133, 0)) + 0u)))][_128].intancingInfo1.y;
  _147 = __0__9__0__0__g_instanceDataBuffer[NonUniformResourceIndex(((int)((uint)(select(((uint)_133 < (uint)65000), _133, 0)) + 0u)))][_128].intancingInfo1.z;
  _148 = __0__9__0__0__g_instanceDataBuffer[NonUniformResourceIndex(((int)((uint)(select(((uint)_133 < (uint)65000), _133, 0)) + 0u)))][_128].intancingInfo1.w;
  _150 = __0__9__0__0__g_instanceDataBuffer[NonUniformResourceIndex(((int)((uint)(select(((uint)_133 < (uint)65000), _133, 0)) + 0u)))][_128].intancingInfo2.w;
  _152 = __0__9__0__0__g_instanceDataBuffer[NonUniformResourceIndex(((int)((uint)(select(((uint)_133 < (uint)65000), _133, 0)) + 0u)))][_128].intancingInfo3.x;
  _153 = __0__9__0__0__g_instanceDataBuffer[NonUniformResourceIndex(((int)((uint)(select(((uint)_133 < (uint)65000), _133, 0)) + 0u)))][_128].intancingInfo3.y;
  _154 = __0__9__0__0__g_instanceDataBuffer[NonUniformResourceIndex(((int)((uint)(select(((uint)_133 < (uint)65000), _133, 0)) + 0u)))][_128].intancingInfo3.z;
  _155 = __0__9__0__0__g_instanceDataBuffer[NonUniformResourceIndex(((int)((uint)(select(((uint)_133 < (uint)65000), _133, 0)) + 0u)))][_128].intancingInfo3.w;
  _156 = asint(_150);
  _168 = ((int)(uint)((int)(_frameNumber.y == 0))) + _127;
  _175 = __0__9__0__0__g_instanceDataBuffer[NonUniformResourceIndex(((int)((uint)(select(((uint)_168 < (uint)65000), _168, 0)) + 0u)))][_128].intancingInfo.x;
  _176 = __0__9__0__0__g_instanceDataBuffer[NonUniformResourceIndex(((int)((uint)(select(((uint)_168 < (uint)65000), _168, 0)) + 0u)))][_128].intancingInfo.y;
  _177 = __0__9__0__0__g_instanceDataBuffer[NonUniformResourceIndex(((int)((uint)(select(((uint)_168 < (uint)65000), _168, 0)) + 0u)))][_128].intancingInfo.z;
  _178 = __0__9__0__0__g_instanceDataBuffer[NonUniformResourceIndex(((int)((uint)(select(((uint)_168 < (uint)65000), _168, 0)) + 0u)))][_128].intancingInfo.w;
  _180 = __0__9__0__0__g_instanceDataBuffer[NonUniformResourceIndex(((int)((uint)(select(((uint)_168 < (uint)65000), _168, 0)) + 0u)))][_128].intancingInfo1.x;
  _181 = __0__9__0__0__g_instanceDataBuffer[NonUniformResourceIndex(((int)((uint)(select(((uint)_168 < (uint)65000), _168, 0)) + 0u)))][_128].intancingInfo1.y;
  _182 = __0__9__0__0__g_instanceDataBuffer[NonUniformResourceIndex(((int)((uint)(select(((uint)_168 < (uint)65000), _168, 0)) + 0u)))][_128].intancingInfo1.z;
  _184 = __0__9__0__0__g_instanceDataBuffer[NonUniformResourceIndex(((int)((uint)(select(((uint)_168 < (uint)65000), _168, 0)) + 0u)))][_128].intancingInfo2.w;
  _186 = __0__9__0__0__g_instanceDataBuffer[NonUniformResourceIndex(((int)((uint)(select(((uint)_168 < (uint)65000), _168, 0)) + 0u)))][_128].intancingInfo3.x;
  _187 = __0__9__0__0__g_instanceDataBuffer[NonUniformResourceIndex(((int)((uint)(select(((uint)_168 < (uint)65000), _168, 0)) + 0u)))][_128].intancingInfo3.y;
  _188 = __0__9__0__0__g_instanceDataBuffer[NonUniformResourceIndex(((int)((uint)(select(((uint)_168 < (uint)65000), _168, 0)) + 0u)))][_128].intancingInfo3.z;
  _189 = __0__9__0__0__g_instanceDataBuffer[NonUniformResourceIndex(((int)((uint)(select(((uint)_168 < (uint)65000), _168, 0)) + 0u)))][_128].intancingInfo3.w;
  _193 = ((_156 & 8) == 0);
  if (_193) {
    _195 = asint(_143);
    _200 = ((int)(_195) >> 16);
    _201 = ((int)((int)(_195 << 16)) >> 16);
  } else {
    _200 = 0;
    _201 = 0;
  }
  _218 = _153 - _viewTileRelativePos.y;
  _222 = (_152 - _viewTileRelativePos.x) + float((int)(int(float((int)((int)(_200 - (uint)(_viewTileIndex.x)))) * 1000.0f)));
  _224 = (_154 - _viewTileRelativePos.z) + float((int)(int(float((int)((int)(_201 - (uint)(_viewTileIndex.y)))) * 1000.0f)));
  _250 = (float((int)(_200)) * 1000.0f) + _152;
  _251 = (float((int)(_201)) * 1000.0f) + _154;
  _263 = (((float)((uint)((uint)(_83 & 255)))) * 0.007843120023608208f) + -1.0f;
  _264 = (((float)((uint)((uint)(((uint)(_83) >> 16) & 255)))) * 0.007843120023608208f) + -1.0f;
  _265 = (((float)((uint)((uint)(((uint)(_83) >> 8) & 255)))) * 0.007843120023608208f) + -1.0f;
  _270 = (_146 * _142) - (_147 * _141);
  _273 = (_147 * _140) - (_145 * _142);
  _276 = (_145 * _141) - (_146 * _140);
  _278 = rsqrt(dot(float3(_270, _273, _276), float3(_270, _273, _276)));  // [sem: invLength]
  _280 = -0.0f - (_270 * _278);
  _282 = -0.0f - (_273 * _278);
  _284 = -0.0f - (_276 * _278);
  _286 = f16tof32(((uint)((uint)(_125) >> 16)));
  _288 = max((_286 * _155), 0.009999999776482582f);
  _290 = saturate(1.0f / _288);  // [sem: expr_sat]
  if ((int)_59 > (int)-1) {
    if ((_64 & 16777216) == 0) {
      _312 = ((mad(_280, _113, mad(_145, _117, (_140 * _112))) * _155) + _250);
      _313 = ((mad(_282, _113, mad(_146, _117, (_141 * _112))) * _155) + _153);
      _314 = ((mad(_284, _113, mad(_147, _117, (_142 * _112))) * _155) + _251);
    } else {
      _312 = _250;
      _313 = _153;
      _314 = _251;
    }
    _319 = _312 - _clippingSpaceMatrixRelativePosition.x;
    _320 = _313 - _clippingSpaceMatrixRelativePosition.y;
    _321 = _314 - _clippingSpaceMatrixRelativePosition.z;
    _337 = mad((_clippingSpaceMatrixRelativeTexScale[2].x), _321, mad((_clippingSpaceMatrixRelativeTexScale[1].x), _320, ((_clippingSpaceMatrixRelativeTexScale[0].x) * _319))) + (_clippingSpaceMatrixRelativeTexScale[3].x);
    _341 = mad((_clippingSpaceMatrixRelativeTexScale[2].y), _321, mad((_clippingSpaceMatrixRelativeTexScale[1].y), _320, ((_clippingSpaceMatrixRelativeTexScale[0].y) * _319))) + (_clippingSpaceMatrixRelativeTexScale[3].y);
    __3__36__0__0__g_topDownClippingSpace.GetDimensions(_343.x, _343.y);
    if (saturate(_337) == _337) {
      if (((saturate(_341) == _341) && (_337 > (1.0f / float((int)((int)(_343.x)))))) && (_341 > (1.0f / float((int)((int)(_343.y)))))) {
  // [sem: _3__36__0__0__g_topDownClippingSpace_sampleLod]
        _361 = __3__36__0__0__g_topDownClippingSpace.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_337, _341), 0.0f);
        if (_361.x > 0.0f) {
          _391 = (max(((_clippingSpaceMatrixRelativePosition.y - _153) + ((mad((_clippingSpaceMatrixRelativeInvTexScale[2].y), _361.x, mad((_clippingSpaceMatrixRelativeInvTexScale[1].y), _341, ((_clippingSpaceMatrixRelativeInvTexScale[0].y) * _337))) + (_clippingSpaceMatrixRelativeInvTexScale[3].y)) / (mad((_clippingSpaceMatrixRelativeInvTexScale[2].w), _361.x, mad((_clippingSpaceMatrixRelativeInvTexScale[1].w), _341, ((_clippingSpaceMatrixRelativeInvTexScale[0].w) * _337))) + (_clippingSpaceMatrixRelativeInvTexScale[3].w)))), 0.0f) - (_155 * _108)) + 0.3499999940395355f;
          _395 = select((_391 < -5.0f), 1.0f, _391);
        } else {
          _395 = 1.0f;
        }
      } else {
        _395 = 1.0f;
      }
    } else {
      _395 = 1.0f;
    }
  } else {
    _395 = 1.0f;
  }
  _401 = dot(float3(_viewDir.x, _viewDir.y, _viewDir.z), float3(_222, (_218 + 0.0f), _224));
  _407 = 1.0f - saturate(((_290 * 12.0f) + -15.0f) + (_401 * 0.0625f));
  _410 = asint(_148);
  if (_126 && (_401 < (256.0f - (_290 * 192.0f)))) {
    _413 = ((_410 & 16777216) != 0);
    _415 = ((uint)(_125) >> 4) & 4095;
    if ((_415 != 4095) && (_treeParams.x > 0.0f)) {
      _424 = __3__37__0__0__g_treeWindDataBuffer[_415]._curr._windVector.x;
      _425 = __3__37__0__0__g_treeWindDataBuffer[_415]._curr._windVector.y;
      _426 = __3__37__0__0__g_treeWindDataBuffer[_415]._curr._windVector.z;
      _427 = __3__37__0__0__g_treeWindDataBuffer[_415]._curr._windVector.w;
      _429 = __3__37__0__0__g_treeWindDataBuffer[_415]._curr._windGlobal.x;
      _430 = __3__37__0__0__g_treeWindDataBuffer[_415]._curr._windGlobal.z;
      _431 = __3__37__0__0__g_treeWindDataBuffer[_415]._curr._windGlobal.w;
      _433 = __3__37__0__0__g_treeWindDataBuffer[_415]._curr._windGlobalData0.x;
      _434 = __3__37__0__0__g_treeWindDataBuffer[_415]._curr._windGlobalData0.y;
      _435 = __3__37__0__0__g_treeWindDataBuffer[_415]._curr._windGlobalData0.z;
      _436 = __3__37__0__0__g_treeWindDataBuffer[_415]._curr._windGlobalData0.w;
      _438 = __3__37__0__0__g_treeWindDataBuffer[_415]._curr._windBranchAndTwitch.x;
      _439 = __3__37__0__0__g_treeWindDataBuffer[_415]._curr._windBranchAndTwitch.z;
      _440 = __3__37__0__0__g_treeWindDataBuffer[_415]._curr._windBranchAndTwitch.w;
      _442 = __3__37__0__0__g_treeWindDataBuffer[_415]._curr._windBranchData0.x;
      _443 = __3__37__0__0__g_treeWindDataBuffer[_415]._curr._windBranchData0.y;
      _445 = __3__37__0__0__g_treeWindDataBuffer[_415]._curr._windLeaf1Data0.x;
      _446 = __3__37__0__0__g_treeWindDataBuffer[_415]._curr._windLeaf1Data0.z;
      _447 = __3__37__0__0__g_treeWindDataBuffer[_415]._curr._windLeaf1Data0.w;
      _449 = __3__37__0__0__g_treeWindDataBuffer[_415]._curr._windLeaf1Data1.x;
      _450 = __3__37__0__0__g_treeWindDataBuffer[_415]._curr._windLeaf1Data1.y;
      _451 = __3__37__0__0__g_treeWindDataBuffer[_415]._curr._windLeaf1Data1.z;
      _452 = __3__37__0__0__g_treeWindDataBuffer[_415]._curr._windLeaf1Data1.w;
      _454 = __3__37__0__0__g_treeWindDataBuffer[_415]._curr._windLeaf1Data2.x;
      _455 = __3__37__0__0__g_treeWindDataBuffer[_415]._curr._windLeaf1Data2.y;
      _456 = __3__37__0__0__g_treeWindDataBuffer[_415]._curr._windLeaf1Data2.z;
      _457 = __3__37__0__0__g_treeWindDataBuffer[_415]._curr._windLeaf1Data2.w;
      _459 = __3__37__0__0__g_treeWindDataBuffer[_415]._curr._windLeaf1Data3.x;
      _460 = __3__37__0__0__g_treeWindDataBuffer[_415]._curr._windLeaf1Data3.y;
      _462 = __3__37__0__0__g_treeWindDataBuffer[_415]._curr._windLeaf1Data4.x;
      _463 = __3__37__0__0__g_treeWindDataBuffer[_415]._curr._windLeaf1Data4.y;
      _464 = __3__37__0__0__g_treeWindDataBuffer[_415]._curr._windLeaf1Data4.z;
      _466 = __3__37__0__0__g_treeWindDataBuffer[_415]._prev._windVector.x;
      _467 = __3__37__0__0__g_treeWindDataBuffer[_415]._prev._windVector.y;
      _468 = __3__37__0__0__g_treeWindDataBuffer[_415]._prev._windVector.z;
      _469 = __3__37__0__0__g_treeWindDataBuffer[_415]._prev._windVector.w;
      _471 = __3__37__0__0__g_treeWindDataBuffer[_415]._prev._windGlobal.x;
      _472 = __3__37__0__0__g_treeWindDataBuffer[_415]._prev._windGlobal.z;
      _473 = __3__37__0__0__g_treeWindDataBuffer[_415]._prev._windGlobal.w;
      _475 = __3__37__0__0__g_treeWindDataBuffer[_415]._prev._windGlobalData0.x;
      _476 = __3__37__0__0__g_treeWindDataBuffer[_415]._prev._windGlobalData0.y;
      _477 = __3__37__0__0__g_treeWindDataBuffer[_415]._prev._windGlobalData0.z;
      _478 = __3__37__0__0__g_treeWindDataBuffer[_415]._prev._windGlobalData0.w;
      _480 = __3__37__0__0__g_treeWindDataBuffer[_415]._prev._windBranchAndTwitch.x;
      _481 = __3__37__0__0__g_treeWindDataBuffer[_415]._prev._windBranchAndTwitch.z;
      _482 = __3__37__0__0__g_treeWindDataBuffer[_415]._prev._windBranchAndTwitch.w;
      _484 = __3__37__0__0__g_treeWindDataBuffer[_415]._prev._windBranchData0.x;
      _485 = __3__37__0__0__g_treeWindDataBuffer[_415]._prev._windBranchData0.y;
      _487 = __3__37__0__0__g_treeWindDataBuffer[_415]._prev._windLeaf1Data0.x;
      _488 = __3__37__0__0__g_treeWindDataBuffer[_415]._prev._windLeaf1Data0.z;
      _489 = __3__37__0__0__g_treeWindDataBuffer[_415]._prev._windLeaf1Data0.w;
      _491 = __3__37__0__0__g_treeWindDataBuffer[_415]._prev._windLeaf1Data1.x;
      _492 = __3__37__0__0__g_treeWindDataBuffer[_415]._prev._windLeaf1Data1.y;
      _493 = __3__37__0__0__g_treeWindDataBuffer[_415]._prev._windLeaf1Data1.z;
      _494 = __3__37__0__0__g_treeWindDataBuffer[_415]._prev._windLeaf1Data1.w;
      _496 = __3__37__0__0__g_treeWindDataBuffer[_415]._prev._windLeaf1Data2.x;
      _497 = __3__37__0__0__g_treeWindDataBuffer[_415]._prev._windLeaf1Data2.y;
      _498 = __3__37__0__0__g_treeWindDataBuffer[_415]._prev._windLeaf1Data2.z;
      _499 = __3__37__0__0__g_treeWindDataBuffer[_415]._prev._windLeaf1Data2.w;
      _501 = __3__37__0__0__g_treeWindDataBuffer[_415]._prev._windLeaf1Data3.x;
      _502 = __3__37__0__0__g_treeWindDataBuffer[_415]._prev._windLeaf1Data3.y;
      _504 = __3__37__0__0__g_treeWindDataBuffer[_415]._prev._windLeaf1Data4.x;
      _505 = __3__37__0__0__g_treeWindDataBuffer[_415]._prev._windLeaf1Data4.y;
      _506 = __3__37__0__0__g_treeWindDataBuffer[_415]._prev._windLeaf1Data4.z;
      _507 = select(_413, 0.019999999552965164f, _427);
      _508 = select(_413, 0.019999999552965164f, _469);
      if (_401 < 64.0f) {
        _527 = (floor(_windFluidVolumeParams.z * _viewPos.x) + 0.5f) * _windFluidVolumeParams.y;
        _528 = (floor(_windFluidVolumeParams.z * _viewPos.y) + 0.5f) * _windFluidVolumeParams.y;
        _529 = (floor(_windFluidVolumeParams.z * _viewPos.z) + 0.5f) * _windFluidVolumeParams.y;
        _540 = _windFluidVolumeParams.x * 0.5f;
        _544 = ((((_viewPos.x + _222) - _527) * _windFluidVolumeParams.z) + _540) / _windFluidVolumeParams.x;
        _545 = ((((_viewPos.y + _218) - _528) * _windFluidVolumeParams.z) + _540) / _windFluidVolumeParams.x;
        _546 = ((((_viewPos.z + _224) - _529) * _windFluidVolumeParams.z) + _540) / _windFluidVolumeParams.x;
        if (!(((_544 < 0.0f) || (_545 < 0.0f)) || (_546 < 0.0f))) {
          if (!(((_544 > 1.0f) || (_545 > 1.0f)) || (_546 > 1.0f))) {
  // [sem: _3__36__0__0__g_windFluidInteractionVelocityHistory_sampleLod]
            _561 = __3__36__0__0__g_windFluidInteractionVelocityHistory.SampleLevel(__0__95__0__0__g_samplerAnisotropicWrap, float3(_544, _545, _546), 0.0f);
            _566 = rsqrt(dot(float3(_561.x, _561.y, _561.z), float3(_561.x, _561.y, _561.z)));  // [sem: invLength]
            _572 = sqrt(((_561.x * _561.x) + (_561.y * _561.y)) + (_561.z * _561.z));
            if (!(_572 < 0.0010000000474974513f)) {
              _579 = (_566 * _561.x);
              _580 = (_566 * _561.y);
              _581 = (_566 * _561.z);
              _582 = _572;
            } else {
              _579 = 0.0f;
              _580 = 0.0f;
              _581 = 0.0f;
              _582 = 0.0f;
            }
          } else {
            _579 = 0.0f;
            _580 = 0.0f;
            _581 = 0.0f;
            _582 = 0.0f;
          }
        } else {
          _579 = 0.0f;
          _580 = 0.0f;
          _581 = 0.0f;
          _582 = 0.0f;
        }
        _595 = ((((_viewPos.x + ((_152 - _viewTileRelativePosPrev.x) + float((int)(int(float((int)((int)(_200 - (uint)(_viewTileIndexPrev.x)))) * 1000.0f))))) - _527) * _windFluidVolumeParams.z) + _540) / _windFluidVolumeParams.x;
        _596 = ((((_viewPos.y + (_153 - _viewTileRelativePosPrev.y)) - _528) * _windFluidVolumeParams.z) + _540) / _windFluidVolumeParams.x;
        _597 = ((((_viewPos.z + ((_154 - _viewTileRelativePosPrev.z) + float((int)(int(float((int)((int)(_201 - (uint)(_viewTileIndexPrev.y)))) * 1000.0f))))) - _529) * _windFluidVolumeParams.z) + _540) / _windFluidVolumeParams.x;
        if (!(((_595 < 0.0f) || (_596 < 0.0f)) || (_597 < 0.0f))) {
          if (!(((_595 > 1.0f) || (_596 > 1.0f)) || (_597 > 1.0f))) {
  // [sem: _3__36__0__0__g_windFluidInteractionVelocityHistoryPrev_sampleLod]
            _612 = __3__36__0__0__g_windFluidInteractionVelocityHistoryPrev.SampleLevel(__0__95__0__0__g_samplerAnisotropicWrap, float3(_595, _596, _597), 0.0f);
            _617 = rsqrt(dot(float3(_612.x, _612.y, _612.z), float3(_612.x, _612.y, _612.z)));  // [sem: invLength]
            _623 = sqrt(((_612.x * _612.x) + (_612.y * _612.y)) + (_612.z * _612.z));
            if (!(_623 < 0.0010000000474974513f)) {
              _630 = (_617 * _612.x);
              _631 = (_617 * _612.y);
              _632 = (_617 * _612.z);
              _633 = _623;
            } else {
              _630 = 0.0f;
              _631 = 0.0f;
              _632 = 0.0f;
              _633 = 0.0f;
            }
          } else {
            _630 = 0.0f;
            _631 = 0.0f;
            _632 = 0.0f;
            _633 = 0.0f;
          }
        } else {
          _630 = 0.0f;
          _631 = 0.0f;
          _632 = 0.0f;
          _633 = 0.0f;
        }
        _634 = saturate(_582);  // [sem: _582_sat]
        _641 = (_634 * (_579 - _424)) + _424;
        _642 = (_634 * (_580 - _425)) + _425;
        _643 = (_634 * (_581 - _426)) + _426;
        _645 = rsqrt(dot(float3(_641, _642, _643), float3(_641, _642, _643)));  // [sem: invLength]
        _652 = saturate(_633);  // [sem: _633_sat]
        _659 = (_652 * (_630 - _466)) + _466;
        _660 = (_652 * (_631 - _467)) + _467;
        _661 = (_652 * (_632 - _468)) + _468;
        _663 = rsqrt(dot(float3(_659, _660, _661), float3(_659, _660, _661)));  // [sem: invLength]
        _671 = (_659 * _663);
        _672 = (_660 * _663);
        _673 = (_661 * _663);
        _674 = ((_652 * (1.0f - _508)) + _508);
        _675 = (_641 * _645);
        _676 = (_642 * _645);
        _677 = (_643 * _645);
        _678 = ((_634 * (1.0f - _507)) + _507);
      } else {
        _671 = _466;
        _672 = _467;
        _673 = _468;
        _674 = _469;
        _675 = _424;
        _676 = _425;
        _677 = _426;
        _678 = _427;
      }
      _683 = select((((_156 & 4) != 0) && (_401 < 48.0f)), (((float)((uint)((uint)(((uint)(_156) >> 16) & 255)))) * 0.003921568859368563f), 0.0f);
      _686 = mad(_142, _677, mad(_141, _676, (_675 * _140)));
      _689 = mad(_147, _677, mad(_146, _676, (_675 * _145)));
      _692 = mad(_284, _677, mad(_282, _676, (_675 * _280)));
      _694 = rsqrt(dot(float3(_686, _689, _692), float3(_686, _689, _692)));  // [sem: invLength]
      _695 = _694 * _686;
      _696 = _694 * _689;
      _697 = _694 * _692;
      _709 = _250 + 0.5f;
      _711 = _153 + 0.5f;
      _719 = abs((frac(_429 + _709) * 2.0f) + -1.0f);
      _720 = abs((frac((_429 * 0.800000011920929f) + _711) * 2.0f) + -1.0f);
      _732 = (((_720 * _720) * (3.0f - (_720 * 2.0f))) + -0.5f) * 2.0f;
      _736 = saturate(_678 + _683);  // [sem: expr_sat]
      _743 = (_736 * (_436 - _435)) + _435;
      _748 = (exp2(log2(saturate((_430 * 100.0f) * max((_108 - (0.0024999999441206455f / _430)), 0.0f))) * _431) * 0.009999999776482582f) * ((((_732 * _732) + ((((_719 * _719) * (3.0f - (_719 * 2.0f))) + -0.5f) * 2.0f)) * ((_736 * (_434 - _433)) + _433)) + select((!(_430 == 0.0f)), (_743 / _430), _743));
      _749 = _748 * _695;
      _750 = _748 * _697;
      _751 = _749 + _106;
      _752 = _750 + _107;
      _754 = rsqrt(dot(float3(_106, _108, _107), float3(_106, _108, _107)));  // [sem: invLength]
      _755 = _754 * _106;
      _756 = _754 * _108;
      _757 = _754 * _107;
      _759 = rsqrt(dot(float3(_751, _108, _752), float3(_751, _108, _752)));  // [sem: invLength]
      _760 = _751 * _759;
      _761 = _759 * _108;
      _762 = _752 * _759;
      _763 = dot(float3(_760, _761, _762), float3(_755, _756, _757));
      _768 = ((-0.8726646304130554f - ((_763 * _763) * 0.6981316804885864f)) * _763) + 1.5707963705062866f;
      if (_768 > 0.009999999776482582f) {
        _771 = _768 * 3.0f;
        _774 = (_761 * _757) - (_762 * _756);
        _777 = (_762 * _755) - (_760 * _757);
        _780 = (_760 * _756) - (_761 * _755);
        _781 = sin(_771);
        _782 = cos(_771);
        _783 = 1.0f - _782;
        _784 = _783 * _774;
        _787 = _784 * _777;
        _788 = _781 * _780;
        _790 = _783 * _780;
        _791 = _790 * _774;
        _792 = _781 * _777;
        _798 = _790 * _777;
        _799 = _781 * _774;
        _815 = mad(_265, (_791 - _792), mad(_264, (_787 + _788), ((_782 + (_784 * _774)) * _263)));
        _816 = mad(_265, (_798 + _799), mad(_264, (_782 + ((_777 * _777) * _783)), ((_787 - _788) * _263)));
        _817 = mad(_265, (_782 + (_790 * _780)), mad(_264, (_798 - _799), ((_791 + _792) * _263)));
      } else {
        _815 = _263;
        _816 = _264;
        _817 = _265;
      }
      _829 = (frac(_119 * 0.0625f) * 2.0f) + -1.0f;
      _830 = (frac(_119) * 2.0f) + -1.0f;
      _831 = (frac(_119 * 16.0f) * 2.0f) + -1.0f;
      _834 = _250 + _119;
      _835 = _438 + _834;
      _836 = _835 * _440;
      _850 = abs((frac(_835 + 0.5f) * 2.0f) + -1.0f);
      _851 = abs((frac(_836 + 0.5f) * 2.0f) + -1.0f);
      _852 = abs((frac((_836 * 0.5f) + 0.5f) * 2.0f) + -1.0f);
      _869 = ((((_851 * _851) * (3.0f - (_851 * 2.0f))) + -0.5f) * 4.0f) * (((_852 * _852) * (3.0f - (_852 * 2.0f))) + -0.5f);
      _870 = (_869 < 0.0f);
      _872 = select(_870, -1.0f, 1.0f);
      _873 = select(_870, (-0.0f - _869), _869);
      _876 = ((_872 - _869) * _873) + _869;
      _889 = rsqrt(dot(float3(_829, _830, _831), float3(_829, _830, _831))) * (_118 * 0.009999999776482582f);  // [sem: invLength]
      _890 = _889 * _829;
      _891 = ((((1.0f - _678) * _439) * (lerp(_876, _872, _873))) + (((1.0f - _439) * 2.0f) * (((_850 * _850) * (3.0f - (_850 * 2.0f))) + -0.5f))) * max(((_736 * (_443 - _442)) + _442), 1.0f);
      _893 = _889 * _831;
      _895 = _889 * _830;
      _898 = ((_125 & 14) == 2);
      if (_898) {
        _907 = dot(float3(((_250 * 0.009999999776482582f) + _112), ((_153 * 0.009999999776482582f) + _117), ((_251 * 0.009999999776482582f) + _113)), float3(10.0f, 10.0f, 10.0f));
        _916 = abs((frac((_445 + 0.5f) + dot(float3(_106, _108, _107), float3(10.0f, 10.0f, 10.0f))) * 2.0f) + -1.0f);
        _932 = (frac(_116 * 0.0625f) * 2.0f) + -1.0f;
        _933 = (frac(_116) * 2.0f) + -1.0f;
        _934 = (frac(_116 * 16.0f) * 2.0f) + -1.0f;
        _939 = (((((_678 * (_450 - _449)) + _449) * 2.0f) * (((_916 * _916) * (3.0f - (_916 * 2.0f))) + -0.5f)) * rsqrt(dot(float3(_932, _933, _934), float3(_932, _933, _934)))) * (_114 * 0.009999999776482582f);
        _967 = (frac(_115 * 0.0625f) * 2.0f) + -1.0f;
        _968 = (frac(_115) * 2.0f) + -1.0f;
        _969 = (frac(_115 * 16.0f) * 2.0f) + -1.0f;
        _971 = rsqrt(dot(float3(_967, _968, _969), float3(_967, _968, _969)));  // [sem: invLength]
        _972 = _971 * _967;
        _973 = _971 * _968;
        _974 = _969 * _971;
        _976 = _907 + 0.5f;
        _986 = abs((frac(_976 + _446) * 2.0f) + -1.0f);
        _987 = abs((frac(((_446 * 0.75f) + 0.5f) - _907) * 2.0f) + -1.0f);
        _998 = (((_986 * _986) * (3.0f - (_986 * 2.0f))) + -0.5f) * 2.0f;
        _999 = (((_987 * _987) * (3.0f - (_987 * 2.0f))) + -0.5f) * 2.0f;
        _1000 = _106 - _112;
        _1001 = _108 - _117;
        _1002 = _107 - _113;
        _1011 = _114 * 0.5f;
        _1013 = (((_678 * (_455 - _454)) + _454) * _1011) * ((_999 * _999) + _998);
        _1014 = sin(_1013);
        _1015 = cos(_1013);
        _1016 = _1014 * _972;
        _1017 = _1014 * _974;
        _1018 = _1014 * _973;
        _1021 = (_974 * _697) - (_973 * _696);
        _1027 = (_972 * _696) - (_974 * _695);
        _1030 = min(max(dot(float3(_695, _696, _697), float3(_972, _974, _973)), -1.0f), 1.0f);
        _1031 = _1030 + ((_973 * _695) - (_972 * _697));
        _1043 = _907 + (_447 * 0.009999999776482582f);
        _1055 = abs((frac(((_907 * _907) + 0.5f) + _1043) * 2.0f) + -1.0f);
        _1056 = abs((frac((_1043 * 0.8700000047683716f) + _976) * 2.0f) + -1.0f);
        _1067 = (((_1056 * _1056) * (3.0f - (_1056 * 2.0f))) + -0.5f) * 2.0f;
        _1084 = ((((((-0.8726646304130554f - ((_1030 * _1030) * 0.6981316804885864f)) * _1030) + 1.5707963705062866f) * ((_678 * (_457 - _456)) + _456)) + ((_999 - (_998 * _998)) * ((_678 * (_452 - _451)) + _451))) + ((((_678 * (_460 - _459)) + _459) * 0.009999999776482582f) * exp2(((_464 * 0.09999999403953552f) * (1.0f / ((_678 * (_463 - _462)) + _462))) * log2(saturate((((_1067 * _1067) * ((((_1055 * _1055) * (3.0f - (_1055 * 2.0f))) + -0.5f) * 2.0f)) + 1.0f) * 0.5f))))) * _1011;
        _1086 = cos(_1084);
        _1087 = sin(_1084) * rsqrt(dot(float3(_1021, _1031, _1027), float3(_1021, _1031, _1027)));
        _1088 = _1087 * _1021;
        _1089 = _1087 * _1031;
        _1090 = _1087 * _1027;
        _1105 = (((_1086 * _1016) - (_1089 * _1018)) + (_1090 * _1017)) + (_1088 * _1015);
        _1108 = (((_1086 * _1017) - (_1090 * _1016)) + (_1088 * _1018)) + (_1089 * _1015);
        _1111 = (((_1086 * _1018) - (_1088 * _1017)) + (_1089 * _1016)) + (_1090 * _1015);
        _1114 = (_1086 * _1015) - dot(float3(_1016, _1017, _1018), float3(_1088, _1089, _1090));
        _1115 = -0.0f - _1105;
        _1116 = -0.0f - _1108;
        _1117 = -0.0f - _1111;
        _1130 = ((_816 * _1117) - (_817 * _1116)) + (_1114 * _815);
        _1131 = ((_817 * _1115) - (_815 * _1117)) + (_1114 * _816);
        _1132 = ((_815 * _1116) - (_816 * _1115)) + (_1114 * _817);
        _1134 = -0.0f - dot(float3(_815, _816, _817), float3(_1115, _1116, _1117));
        _1168 = ((_1001 * _1117) - (_1002 * _1116)) + (_1114 * _1000);
        _1169 = ((_1002 * _1115) - (_1000 * _1117)) + (_1114 * _1001);
        _1170 = ((_1000 * _1116) - (_1001 * _1115)) + (_1114 * _1002);
        _1172 = -0.0f - dot(float3(_1000, _1001, _1002), float3(_1115, _1116, _1117));
        _1191 = ((_1168 * _1114) + (_1105 * _1172)) + ((_1170 * _1108) - (_1169 * _1111));
        _1192 = ((_1169 * _1114) + (_1108 * _1172)) + ((_1168 * _1111) - (_1170 * _1105));
        _1193 = ((_1170 * _1114) + (_1111 * _1172)) + ((_1169 * _1105) - (_1168 * _1108));
  // [sem: invLength]
        _1196 = rsqrt(dot(float3(_1191, _1192, _1193), float3(_1191, _1192, _1193))) * sqrt(((_1002 * _1002) + (_1000 * _1000)) + (_1001 * _1001));
        _1210 = (((_112 - _106) + (_939 * _932)) + (_1191 * _1196));
        _1211 = (((_117 - _108) + (_939 * _934)) + (_1192 * _1196));
        _1212 = (((_113 - _107) + (_939 * _933)) + (_1193 * _1196));
        _1213 = ((((_1130 * _1114) + (_1105 * _1134)) - (_1131 * _1111)) + (_1132 * _1108));
        _1214 = ((((_1131 * _1114) + (_1108 * _1134)) - (_1132 * _1105)) + (_1130 * _1111));
        _1215 = ((((_1132 * _1114) + (_1111 * _1134)) - (_1130 * _1108)) + (_1131 * _1105));
      } else {
        _1210 = 0.0f;
        _1211 = 0.0f;
        _1212 = 0.0f;
        _1213 = _815;
        _1214 = _816;
        _1215 = _817;
      }
      _1229 = mad(_142, _673, mad(_141, _672, (_671 * _140)));
      _1232 = mad(_147, _673, mad(_146, _672, (_671 * _145)));
      _1235 = mad(_284, _673, mad(_282, _672, (_671 * _280)));
      _1237 = rsqrt(dot(float3(_1229, _1232, _1235), float3(_1229, _1232, _1235)));  // [sem: invLength]
      _1238 = _1237 * _1229;
      _1239 = _1237 * _1232;
      _1240 = _1237 * _1235;
      _1260 = abs((frac(_471 + _709) * 2.0f) + -1.0f);
      _1261 = abs((frac((_471 * 0.800000011920929f) + _711) * 2.0f) + -1.0f);
      _1273 = (((_1261 * _1261) * (3.0f - (_1261 * 2.0f))) + -0.5f) * 2.0f;
      _1277 = saturate(_674 + _683);  // [sem: expr_sat]
      _1284 = (_1277 * (_478 - _477)) + _477;
      _1289 = (exp2(log2(saturate((_472 * 100.0f) * max((_108 - (0.0024999999441206455f / _472)), 0.0f))) * _473) * 0.009999999776482582f) * ((((_1273 * _1273) + ((((_1260 * _1260) * (3.0f - (_1260 * 2.0f))) + -0.5f) * 2.0f)) * ((_1277 * (_476 - _475)) + _475)) + select((!(_472 == 0.0f)), (_1284 / _472), _1284));
      _1295 = _480 + _834;
      _1296 = _1295 * _482;
      _1310 = abs((frac(_1295 + 0.5f) * 2.0f) + -1.0f);
      _1311 = abs((frac(_1296 + 0.5f) * 2.0f) + -1.0f);
      _1312 = abs((frac((_1296 * 0.5f) + 0.5f) * 2.0f) + -1.0f);
      _1329 = ((((_1311 * _1311) * (3.0f - (_1311 * 2.0f))) + -0.5f) * 4.0f) * (((_1312 * _1312) * (3.0f - (_1312 * 2.0f))) + -0.5f);
      _1330 = (_1329 < 0.0f);
      _1332 = select(_1330, -1.0f, 1.0f);
      _1333 = select(_1330, (-0.0f - _1329), _1329);
      _1336 = ((_1332 - _1329) * _1333) + _1329;
      _1348 = ((((1.0f - _674) * _481) * (lerp(_1336, _1332, _1333))) + (((1.0f - _481) * 2.0f) * (((_1310 * _1310) * (3.0f - (_1310 * 2.0f))) + -0.5f))) * max(((_1277 * (_485 - _484)) + _484), 1.0f);
      if (_898) {
        _1360 = dot(float3(((_250 * 0.009999999776482582f) + _112), ((_153 * 0.009999999776482582f) + _117), ((_251 * 0.009999999776482582f) + _113)), float3(10.0f, 10.0f, 10.0f));
        _1369 = abs((frac((_487 + 0.5f) + dot(float3(_106, _108, _107), float3(10.0f, 10.0f, 10.0f))) * 2.0f) + -1.0f);
        _1385 = (frac(_116 * 0.0625f) * 2.0f) + -1.0f;
        _1386 = (frac(_116) * 2.0f) + -1.0f;
        _1387 = (frac(_116 * 16.0f) * 2.0f) + -1.0f;
        _1392 = (((((_674 * (_492 - _491)) + _491) * 2.0f) * (((_1369 * _1369) * (3.0f - (_1369 * 2.0f))) + -0.5f)) * rsqrt(dot(float3(_1385, _1386, _1387), float3(_1385, _1386, _1387)))) * (_114 * 0.009999999776482582f);
        _1420 = (frac(_115 * 0.0625f) * 2.0f) + -1.0f;
        _1421 = (frac(_115) * 2.0f) + -1.0f;
        _1422 = (frac(_115 * 16.0f) * 2.0f) + -1.0f;
        _1424 = rsqrt(dot(float3(_1420, _1421, _1422), float3(_1420, _1421, _1422)));  // [sem: invLength]
        _1425 = _1424 * _1420;
        _1426 = _1424 * _1421;
        _1427 = _1422 * _1424;
        _1429 = _1360 + 0.5f;
        _1439 = abs((frac(_1429 + _488) * 2.0f) + -1.0f);
        _1440 = abs((frac(((_488 * 0.75f) + 0.5f) - _1360) * 2.0f) + -1.0f);
        _1451 = (((_1439 * _1439) * (3.0f - (_1439 * 2.0f))) + -0.5f) * 2.0f;
        _1452 = (((_1440 * _1440) * (3.0f - (_1440 * 2.0f))) + -0.5f) * 2.0f;
        _1453 = _106 - _112;
        _1454 = _108 - _117;
        _1455 = _107 - _113;
        _1464 = _114 * 0.5f;
        _1466 = (((_674 * (_497 - _496)) + _496) * _1464) * ((_1452 * _1452) + _1451);
        _1467 = sin(_1466);
        _1468 = cos(_1466);
        _1469 = _1467 * _1425;
        _1470 = _1467 * _1427;
        _1471 = _1467 * _1426;
        _1474 = (_1427 * _1240) - (_1426 * _1239);
        _1480 = (_1425 * _1239) - (_1427 * _1238);
        _1483 = min(max(dot(float3(_1238, _1239, _1240), float3(_1425, _1427, _1426)), -1.0f), 1.0f);
        _1484 = _1483 + ((_1426 * _1238) - (_1425 * _1240));
        _1496 = _1360 + (_489 * 0.009999999776482582f);
        _1508 = abs((frac(((_1360 * _1360) + 0.5f) + _1496) * 2.0f) + -1.0f);
        _1509 = abs((frac((_1496 * 0.8700000047683716f) + _1429) * 2.0f) + -1.0f);
        _1520 = (((_1509 * _1509) * (3.0f - (_1509 * 2.0f))) + -0.5f) * 2.0f;
        _1537 = ((((((-0.8726646304130554f - ((_1483 * _1483) * 0.6981316804885864f)) * _1483) + 1.5707963705062866f) * ((_674 * (_499 - _498)) + _498)) + ((_1452 - (_1451 * _1451)) * ((_674 * (_494 - _493)) + _493))) + ((((_674 * (_502 - _501)) + _501) * 0.009999999776482582f) * exp2(((_506 * 0.09999999403953552f) * (1.0f / ((_674 * (_505 - _504)) + _504))) * log2(saturate((((_1520 * _1520) * ((((_1508 * _1508) * (3.0f - (_1508 * 2.0f))) + -0.5f) * 2.0f)) + 1.0f) * 0.5f))))) * _1464;
        _1539 = cos(_1537);
        _1540 = sin(_1537) * rsqrt(dot(float3(_1474, _1484, _1480), float3(_1474, _1484, _1480)));
        _1541 = _1540 * _1474;
        _1542 = _1540 * _1484;
        _1543 = _1540 * _1480;
        _1558 = (((_1539 * _1469) - (_1542 * _1471)) + (_1543 * _1470)) + (_1541 * _1468);
        _1561 = (((_1539 * _1470) - (_1543 * _1469)) + (_1541 * _1471)) + (_1542 * _1468);
        _1564 = (((_1539 * _1471) - (_1541 * _1470)) + (_1542 * _1469)) + (_1543 * _1468);
        _1567 = (_1539 * _1468) - dot(float3(_1469, _1470, _1471), float3(_1541, _1542, _1543));
        _1568 = -0.0f - _1558;
        _1569 = -0.0f - _1561;
        _1570 = -0.0f - _1564;
        _1583 = ((_1454 * _1570) - (_1455 * _1569)) + (_1567 * _1453);
        _1584 = ((_1455 * _1568) - (_1453 * _1570)) + (_1567 * _1454);
        _1585 = ((_1453 * _1569) - (_1454 * _1568)) + (_1567 * _1455);
        _1587 = -0.0f - dot(float3(_1453, _1454, _1455), float3(_1568, _1569, _1570));
        _1606 = ((_1583 * _1567) + (_1558 * _1587)) + ((_1585 * _1561) - (_1584 * _1564));
        _1607 = ((_1584 * _1567) + (_1561 * _1587)) + ((_1583 * _1564) - (_1585 * _1558));
        _1608 = ((_1585 * _1567) + (_1564 * _1587)) + ((_1584 * _1558) - (_1583 * _1561));
  // [sem: invLength]
        _1611 = rsqrt(dot(float3(_1606, _1607, _1608), float3(_1606, _1607, _1608))) * sqrt(((_1455 * _1455) + (_1453 * _1453)) + (_1454 * _1454));
        _1625 = (((_112 - _106) + (_1392 * _1385)) + (_1606 * _1611));
        _1626 = (((_117 - _108) + (_1392 * _1387)) + (_1607 * _1611));
        _1627 = (((_113 - _107) + (_1392 * _1386)) + (_1608 * _1611));
      } else {
        _1625 = 0.0f;
        _1626 = 0.0f;
        _1627 = 0.0f;
      }
      _1640 = (((((_891 * _890) + _749) + _1210) * _407) + _106);
      _1641 = (((_1211 + (_891 * _893)) * _407) + _108);
      _1642 = (((((_891 * _895) + _750) + _1212) * _407) + _107);
      _1643 = (((((_1348 * _890) + (_1289 * _1238)) + _1625) * _407) + _106);
      _1644 = (((_1626 + (_1348 * _893)) * _407) + _108);
      _1645 = (((((_1348 * _895) + (_1289 * _1240)) + _1627) * _407) + _107);
      _1646 = _1213;
      _1647 = _1214;
      _1648 = _1215;
    } else {
      _1640 = _106;
      _1641 = _108;
      _1642 = _107;
      _1643 = _106;
      _1644 = _108;
      _1645 = _107;
      _1646 = _263;
      _1647 = _264;
      _1648 = _265;
    }
  } else {
    _1640 = _106;
    _1641 = _108;
    _1642 = _107;
    _1643 = _106;
    _1644 = _108;
    _1645 = _107;
    _1646 = _263;
    _1647 = _264;
    _1648 = _265;
  }
  _1650 = (float)((uint)((uint)(_410 & 65535)));
  if (!(_debugTreeShapeVariation.w == 0)) {
    _1659 = _debugTreeShapeVariation.x;
    _1660 = _debugTreeShapeVariation.y;
    _1661 = _debugTreeShapeVariation.z;
  } else {
    _1659 = _61;
    _1660 = _62;
    _1661 = _63;
  }
  _1667 = f16tof32(((uint)((uint)(_1660) >> 16)));
  _1671 = f16tof32(((uint)((uint)(_1661) >> 16)));
  _1676 = frac((_1650 * 9.430594218429178e-06f) + 1.1180340051651f);
  _1689 = max((_1641 - (((_1676 * (f16tof32(((uint)(_1659 & 65535))) + -0.009999999776482582f)) + 0.009999999776482582f) * _286)), 0.0f);
  _1703 = (frac((_1650 * 1.1518694009282626e-05f) + 1.2548775672912598f) * 2.0f) + -1.0f;
  _1704 = (frac((_1650 * 8.695204996911343e-06f) + 1.0698401927947998f) * 2.0f) + -1.0f;
  _1706 = rsqrt(dot(float3(_1703, -1.0f, _1704), float3(_1703, -1.0f, _1704)));  // [sem: invLength]
  _1707 = _1706 * _1703;
  _1709 = -0.0f - (_1704 * _1706);
  _1711 = rsqrt(dot(float3(_1709, 0.0f, _1707), float3(_1709, 0.0f, _1707)));  // [sem: invLength]
  _1712 = _1711 * _1709;
  _1713 = _1711 * _1707;
  _1716 = ((_1676 * 3.1415927410125732f) * max(f16tof32(((uint)((uint)(_1659) >> 16))), 0.0f)) * sin((((_1676 * (f16tof32(((uint)(_1660 & 65535))) - _1667)) + _1667) * _1689) / (((_1676 * (f16tof32(((uint)(_1661 & 65535))) - _1671)) + _1671) + (_1689 * 0.20000000298023224f)));
  _1717 = dot(float3(_1712, 0.0f, _1713), float3(_1640, _1641, _1642));
  _1718 = _1712 * _1717;
  _1719 = _1713 * _1717;
  _1720 = _1640 - _1718;
  _1721 = _1642 - _1719;
  _1725 = sin(_1716);
  _1726 = cos(_1716);
  _1730 = _1725 * _1641;
  _1734 = (((_1721 * _1712) - (_1720 * _1713)) * _1725) + (_1726 * _1641);
  _1737 = ((_1730 * _1713) + _1718) + (_1720 * _1726);
  _1738 = ((_1721 * _1726) - (_1730 * _1712)) + _1719;
  _1739 = dot(float3(_1712, 0.0f, _1713), float3(_1643, _1644, _1645));
  _1740 = _1739 * _1712;
  _1741 = _1739 * _1713;
  _1742 = _1643 - _1740;
  _1743 = _1645 - _1741;
  _1750 = _1725 * _1644;
  _1754 = (((_1743 * _1712) - (_1742 * _1713)) * _1725) + (_1726 * _1644);
  _1757 = (_1740 + (_1750 * _1713)) + (_1742 * _1726);
  _1758 = ((_1743 * _1726) - (_1750 * _1712)) + _1741;
  _1761 = mad(_280, _1738, mad(_145, _1734, (_1737 * _140)));
  _1764 = mad(_282, _1738, mad(_146, _1734, (_1737 * _141)));
  _1767 = mad(_284, _1738, mad(_147, _1734, (_1737 * _142)));
  _1771 = (_1761 * _155) + _222;
  _1772 = (_1764 * _155) + _218;
  _1773 = (_1767 * _155) + _224;
  _1776 = (_181 * _177) - (_182 * _176);
  _1779 = (_182 * _175) - (_180 * _177);
  _1782 = (_180 * _176) - (_181 * _175);
  _1784 = rsqrt(dot(float3(_1776, _1779, _1782), float3(_1776, _1779, _1782)));  // [sem: invLength]
  _1805 = ((uint)((uint)(asint(_184))) >> 3) & 1;
  if (_1805 == 0) {
    _1808 = asint(_178);
    _1813 = ((int)(_1808) >> 16);
    _1814 = ((int)((int)(_1808 << 16)) >> 16);
  } else {
    _1813 = 0;
    _1814 = 0;
  }
  _1828 = ((_186 - _viewTileRelativePosPrev.x) + (mad((-0.0f - (_1776 * _1784)), _1758, mad(_180, _1754, (_1757 * _175))) * _189)) + float((int)(int(float((int)((int)(_1813 - (uint)(_viewTileIndexPrev.x)))) * 1000.0f)));
  _1829 = (mad((-0.0f - (_1779 * _1784)), _1758, mad(_181, _1754, (_1757 * _176))) * _189) + (_187 - _viewTileRelativePosPrev.y);
  _1832 = ((_188 - _viewTileRelativePosPrev.z) + (mad((-0.0f - (_1782 * _1784)), _1758, mad(_182, _1754, (_1757 * _177))) * _189)) + float((int)(int(float((int)((int)(_1814 - (uint)(_viewTileIndexPrev.y)))) * 1000.0f)));
  _1835 = mad(_280, _1648, mad(_145, _1647, (_1646 * _140)));
  _1838 = mad(_282, _1648, mad(_146, _1647, (_1646 * _141)));
  _1841 = mad(_284, _1648, mad(_147, _1647, (_1646 * _142)));
  if (_126) {
    if ((_401 < 64.0f) && (_treeParams.z > 0.0f)) {
      _1851 = mad(_280, _113, mad(_145, _117, (_140 * _112)));
      _1854 = mad(_282, _113, mad(_146, _117, (_141 * _112)));
      _1857 = mad(_284, _113, mad(_147, _117, (_142 * _112)));
      _1861 = (_1851 * _155) + _222;
      _1862 = (_1854 * _155) + _218;
      _1863 = (_1857 * _155) + _224;
      if (_401 < 48.0f) {
        _1869 = __3__37__0__0__g_indirectDrawParametersBuffer[_drawIndex]._bindlessMaterialParametersViewIndex;
        if (!(((BindlessParameters_MaterialOverrideParametersTree[NonUniformResourceIndex(((int)((uint)(select(((uint)_1869 < (uint)170000), _1869, 0)) + 0u)))].BindlessParameters_MaterialOverrideParametersTree._materialInfo) & 512) == 0)) {
          _1884 = saturate(_treeParams.y);  // [sem: expr_sat]
        } else {
          _1884 = 1.0f;  // [sem: expr_sat]
        }
        _1887 = select(((_64 & 16711680) == 65536), 2.0f, _1884);
        _1889 = f16tof32(((uint)(_64 & 65535)));
        if ((_156 & 2) == 0) {
          if ((uint)((_125 & 15) + -1) < (uint)2) {
            _1907 = (frac(_115 * 0.0625f) * 2.0f) + -1.0f;
            _1908 = (frac(_115) * 2.0f) + -1.0f;
            _1909 = (frac(_115 * 16.0f) * 2.0f) + -1.0f;
            _1911 = rsqrt(dot(float3(_1907, _1908, _1909), float3(_1907, _1908, _1909)));  // [sem: invLength]
            _1912 = _1911 * _1907;
            _1913 = _1911 * _1908;
            _1914 = _1909 * _1911;
            _1917 = mad(_280, _1913, mad(_145, _1914, (_1912 * _140)));
            _1920 = mad(_282, _1913, mad(_146, _1914, (_1912 * _141)));
            _1923 = mad(_284, _1913, mad(_147, _1914, (_1912 * _142)));
            _1925 = rsqrt(dot(float3(_1917, _1920, _1923), float3(_1917, _1920, _1923)));  // [sem: invLength]
            _1926 = _1925 * _1917;
            _1927 = _1925 * _1920;
            _1928 = _1925 * _1923;
            _1935 = _renderingOriginPos.y - _viewPos.y;
            _1942 = (int)(uint)((int)(((_1935 + -2.0f) < _1862) && ((_renderingOriginPos.w == 0.0f) && ((_1935 + 1.0f) > _1862))));
            _1952 = (_viewPos.x - _currSceneTrailHeight._trailUpdatedPosition.x) + _1861;
            _1953 = (_viewPos.y - _currSceneTrailHeight._trailUpdatedPosition.y) + _1862;
            _1954 = (_viewPos.z - _currSceneTrailHeight._trailUpdatedPosition.z) + _1863;
            _1970 = mad((_currSceneTrailHeight._trailViewProjTexScale[2].x), _1954, mad((_currSceneTrailHeight._trailViewProjTexScale[1].x), _1953, (_1952 * (_currSceneTrailHeight._trailViewProjTexScale[0].x)))) + (_currSceneTrailHeight._trailViewProjTexScale[3].x);
            _1974 = mad((_currSceneTrailHeight._trailViewProjTexScale[2].y), _1954, mad((_currSceneTrailHeight._trailViewProjTexScale[1].y), _1953, (_1952 * (_currSceneTrailHeight._trailViewProjTexScale[0].y)))) + (_currSceneTrailHeight._trailViewProjTexScale[3].y);
            _1976 = (saturate(_1970) == _1970);
            if (_1976) {
              [branch]
              if (saturate(_1974) == _1974) {
  // [sem: _3__36__0__0__g_textureTrailHeight_sampleLod]
                _1983 = __3__36__0__0__g_textureTrailHeight.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_1970, _1974), 0.0f);
                if (_1983.x < 1.0f) {
                  _2015 = ((int)(uint)((int)((((_currSceneTrailHeight._trailUpdatedPosition.y + -1.0f) - _viewPos.y) + ((mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].y), _1983.x, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].y), _1974, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].y) * _1970))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].y)) / (mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].w), _1983.x, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].w), _1974, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].w) * _1970))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].w)))) < _1862)));
                } else {
                  _2015 = 0;
                }
                if ((_1983.y < 1.0f) && (_1983.y > 0.0f)) {
                  _2048 = (((int)(uint)((int)((((_currSceneTrailHeight._trailUpdatedPosition.y + 0.20000000298023224f) - _viewPos.y) + ((mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].y), _1983.y, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].y), _1974, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].y) * _1970))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].y)) / (mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].w), _1983.y, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].w), _1974, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].w) * _1970))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].w)))) > _1862))) & _2015);
                } else {
                  _2048 = 0;
                }
                _2051 = (_2048 | _1942);
              } else {
                _2051 = _1942;
              }
            } else {
              _2051 = _1942;
            }
            if (!(_2051 == 0)) {
              _2061 = (_viewPos.x + _1861) - _currSceneTrailInteraction._trailUpdatedPosition.x;
              _2062 = (_viewPos.y + _1862) - _currSceneTrailInteraction._trailUpdatedPosition.y;
              _2063 = (_viewPos.z + _1863) - _currSceneTrailInteraction._trailUpdatedPosition.z;
              _2079 = mad((_currSceneTrailInteraction._trailViewProjTexScale[2].x), _2063, mad((_currSceneTrailInteraction._trailViewProjTexScale[1].x), _2062, ((_currSceneTrailInteraction._trailViewProjTexScale[0].x) * _2061))) + (_currSceneTrailInteraction._trailViewProjTexScale[3].x);
              _2083 = mad((_currSceneTrailInteraction._trailViewProjTexScale[2].y), _2063, mad((_currSceneTrailInteraction._trailViewProjTexScale[1].y), _2062, ((_currSceneTrailInteraction._trailViewProjTexScale[0].y) * _2061))) + (_currSceneTrailInteraction._trailViewProjTexScale[3].y);
              if (saturate(_2079) == _2079) {
                [branch]
                if (saturate(_2083) == _2083) {
  // [sem: _3__36__0__0__g_textureTrailInteraction_sampleLod]
                  _2092 = __3__36__0__0__g_textureTrailInteraction.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_2079, _2083), 0.0f);
                  _2098 = (_2092.x * 2.0f) + -1.0f;  // [sem: _3__36__0__0__g_textureTrailInteraction_sampleLod_derived]
                  _2099 = (_2092.y * 2.0f) + -1.0f;  // [sem: _3__36__0__0__g_textureTrailInteraction_sampleLod_derived]
                  _2101 = rsqrt(dot(float2(_2098, _2099), float2(_2098, _2099)));  // [sem: invLength]
                  _2102 = _2098 * _2101;
                  _2103 = _2099 * _2101;
                  _2104 = saturate(_2092.w);  // [sem: expr_sat]
                  if (_2104 > 0.0f) {
                    _2108 = sin(_time.x * 7.0f);
                    _2113 = -0.0f - (_1927 * _2103);
                    _2116 = (_2103 * _1926) - (_2102 * _1928);
                    _2117 = _2102 * _1927;
                    _2119 = rsqrt(dot(float3(_2113, _2116, _2117), float3(_2113, _2116, _2117)));  // [sem: invLength]
                    _2120 = _2119 * _2113;
                    _2121 = _2119 * _2116;
                    _2122 = _2119 * _2117;
                    _2125 = ((_1887 * 0.9424778819084167f) * _2104) * (lerp(_2108, 1.0f, _2104));
                    _2132 = dot(float3(_2120, _2121, _2122), float3(((_1761 - _1851) * _155), ((_1764 - _1854) * _155), ((_1767 - _1857) * _155)));
                    _2136 = (_2120 * _2132) + _1861;
                    _2137 = (_2121 * _2132) + _1862;
                    _2138 = (_2122 * _2132) + _1863;
                    _2139 = _1771 - _2136;
                    _2140 = _1772 - _2137;
                    _2141 = _1773 - _2138;
                    _2151 = sin(_2125);
                    _2152 = cos(_2125);
                    _2169 = (((_2136 - _1771) + (_2139 * _2152)) + (((_2140 * _2122) - (_2141 * _2121)) * _2151));
                    _2170 = (((_2137 - _1772) + (_2140 * _2152)) + (((_2141 * _2120) - (_2139 * _2122)) * _2151));
                    _2171 = (((_2138 - _1773) + (_2141 * _2152)) + (((_2139 * _2121) - (_2140 * _2120)) * _2151));
                  } else {
                    _2169 = 0.0f;
                    _2170 = 0.0f;
                    _2171 = 0.0f;
                  }
                } else {
                  _2169 = 0.0f;
                  _2170 = 0.0f;
                  _2171 = 0.0f;
                }
              } else {
                _2169 = 0.0f;
                _2170 = 0.0f;
                _2171 = 0.0f;
              }
            } else {
              _2169 = 0.0f;
              _2170 = 0.0f;
              _2171 = 0.0f;
            }
            if (_1976) {
              [branch]
              if (saturate(_1974) == _1974) {
  // [sem: _3__36__0__0__g_textureTrailHeight_sampleLod]
                _2184 = __3__36__0__0__g_textureTrailHeight.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_1970, _1974), 0.0f);
                if (_2184.x < 1.0f) {
                  _2216 = ((int)(uint)((int)((((_currSceneTrailHeight._trailUpdatedPosition.y + -1.0f) - _viewPos.y) + ((mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].y), _2184.x, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].y), _1974, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].y) * _1970))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].y)) / (mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].w), _2184.x, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].w), _1974, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].w) * _1970))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].w)))) < _1862)));
                } else {
                  _2216 = 0;
                }
                if ((_2184.y < 1.0f) && (_2184.y > 0.0f)) {
                  _2249 = (((int)(uint)((int)((((_currSceneTrailHeight._trailUpdatedPosition.y + 0.20000000298023224f) - _viewPos.y) + ((mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].y), _2184.y, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].y), _1974, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].y) * _1970))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].y)) / (mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].w), _2184.y, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].w), _1974, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].w) * _1970))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].w)))) > _1862))) & _2216);
                } else {
                  _2249 = 0;
                }
                _2252 = (_2249 | _1942);
              } else {
                _2252 = _1942;
              }
            } else {
              _2252 = _1942;
            }
            if (!(_2252 == 0)) {
              _2262 = (_viewPos.x + _1861) - _prevSceneTrailInteraction._trailUpdatedPosition.x;
              _2263 = (_viewPos.y + _1862) - _prevSceneTrailInteraction._trailUpdatedPosition.y;
              _2264 = (_viewPos.z + _1863) - _prevSceneTrailInteraction._trailUpdatedPosition.z;
              _2280 = mad((_prevSceneTrailInteraction._trailViewProjTexScale[2].x), _2264, mad((_prevSceneTrailInteraction._trailViewProjTexScale[1].x), _2263, ((_prevSceneTrailInteraction._trailViewProjTexScale[0].x) * _2262))) + (_prevSceneTrailInteraction._trailViewProjTexScale[3].x);
              _2284 = mad((_prevSceneTrailInteraction._trailViewProjTexScale[2].y), _2264, mad((_prevSceneTrailInteraction._trailViewProjTexScale[1].y), _2263, ((_prevSceneTrailInteraction._trailViewProjTexScale[0].y) * _2262))) + (_prevSceneTrailInteraction._trailViewProjTexScale[3].y);
              if (saturate(_2280) == _2280) {
                [branch]
                if (saturate(_2284) == _2284) {
  // [sem: _3__36__0__0__g_textureTrailInteractionPrev_sampleLod]
                  _2293 = __3__36__0__0__g_textureTrailInteractionPrev.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_2280, _2284), 0.0f);
                  _2299 = (_2293.x * 2.0f) + -1.0f;  // [sem: _3__36__0__0__g_textureTrailInteractionPrev_sampleLod_derived]
                  _2300 = (_2293.y * 2.0f) + -1.0f;  // [sem: _3__36__0__0__g_textureTrailInteractionPrev_sampleLod_derived]
                  _2302 = rsqrt(dot(float2(_2299, _2300), float2(_2299, _2300)));  // [sem: invLength]
                  _2303 = _2299 * _2302;
                  _2304 = _2300 * _2302;
                  _2305 = saturate(_2293.w);  // [sem: expr_sat]
                  if (_2305 > 0.0f) {
                    _2309 = sin(_time.y * 7.0f);
                    _2314 = -0.0f - (_1927 * _2304);
                    _2317 = (_2304 * _1926) - (_2303 * _1928);
                    _2318 = _2303 * _1927;
                    _2320 = rsqrt(dot(float3(_2314, _2317, _2318), float3(_2314, _2317, _2318)));  // [sem: invLength]
                    _2321 = _2320 * _2314;
                    _2322 = _2320 * _2317;
                    _2323 = _2320 * _2318;
                    _2326 = ((_1887 * 0.9424778819084167f) * _2305) * (lerp(_2309, 1.0f, _2305));
                    _2333 = dot(float3(_2321, _2322, _2323), float3(((_1761 - _1851) * _155), ((_1764 - _1854) * _155), ((_1767 - _1857) * _155)));
                    _2337 = (_2321 * _2333) + _1861;
                    _2338 = (_2322 * _2333) + _1862;
                    _2339 = (_2323 * _2333) + _1863;
                    _2340 = _1771 - _2337;
                    _2341 = _1772 - _2338;
                    _2342 = _1773 - _2339;
                    _2352 = sin(_2326);
                    _2353 = cos(_2326);
                    _2370 = (((_2337 - _1771) + (_2340 * _2353)) + (((_2341 * _2323) - (_2342 * _2322)) * _2352));
                    _2371 = (((_2338 - _1772) + (_2341 * _2353)) + (((_2342 * _2321) - (_2340 * _2323)) * _2352));
                    _2372 = (((_2339 - _1773) + (_2342 * _2353)) + (((_2340 * _2322) - (_2341 * _2321)) * _2352));
                  } else {
                    _2370 = 0.0f;
                    _2371 = 0.0f;
                    _2372 = 0.0f;
                  }
                } else {
                  _2370 = 0.0f;
                  _2371 = 0.0f;
                  _2372 = 0.0f;
                }
              } else {
                _2370 = 0.0f;
                _2371 = 0.0f;
                _2372 = 0.0f;
              }
            } else {
              _2370 = 0.0f;
              _2371 = 0.0f;
              _2372 = 0.0f;
            }
            _2380 = ((_2370 * _407) + _1828);
            _2381 = ((_2371 * _407) + _1829);
            _2382 = ((_2372 * _407) + _1832);
            _2383 = ((_2169 * _407) + _1771);
            _2384 = ((_2170 * _407) + _1772);
            _2385 = ((_2171 * _407) + _1773);
          } else {
            _2380 = _1828;
            _2381 = _1829;
            _2382 = _1832;
            _2383 = _1771;
            _2384 = _1772;
            _2385 = _1773;
          }
          if ((_156 & 5) == 0) {
            _2390 = rsqrt(dot(float3(_145, _146, _147), float3(_145, _146, _147)));  // [sem: invLength]
            _2391 = _2390 * _145;
            _2392 = _2390 * _146;
            _2393 = _2390 * _147;
            _2405 = (_viewPos.x - _currSceneTrailHeight._trailUpdatedPosition.x) + _222;
            _2406 = (_viewPos.y - _currSceneTrailHeight._trailUpdatedPosition.y) + _218;
            _2407 = (_viewPos.z - _currSceneTrailHeight._trailUpdatedPosition.z) + _224;
            _2423 = mad((_currSceneTrailHeight._trailViewProjTexScale[2].x), _2407, mad((_currSceneTrailHeight._trailViewProjTexScale[1].x), _2406, (_2405 * (_currSceneTrailHeight._trailViewProjTexScale[0].x)))) + (_currSceneTrailHeight._trailViewProjTexScale[3].x);
            _2427 = mad((_currSceneTrailHeight._trailViewProjTexScale[2].y), _2407, mad((_currSceneTrailHeight._trailViewProjTexScale[1].y), _2406, (_2405 * (_currSceneTrailHeight._trailViewProjTexScale[0].y)))) + (_currSceneTrailHeight._trailViewProjTexScale[3].y);
            __3__36__0__0__g_textureTrailHeight.GetDimensions(_2429.x, _2429.y);
            _2431 = (saturate(_2423) == _2423);
            if (!(_2431) || ((_2431) && (!(((saturate(_2427) == _2427) && (_2423 > (1.0f / float((int)((int)(_2429.x)))))) && (_2427 > (1.0f / float((int)((int)(_2429.y))))))))) {
              _2524 = (_viewPos.x + _222) - _currSceneTrailInteraction._trailUpdatedPosition.x;
              _2525 = (_viewPos.y + _218) - _currSceneTrailInteraction._trailUpdatedPosition.y;
              _2526 = (_viewPos.z + _224) - _currSceneTrailInteraction._trailUpdatedPosition.z;
              _2542 = mad((_currSceneTrailInteraction._trailViewProjTexScale[2].x), _2526, mad((_currSceneTrailInteraction._trailViewProjTexScale[1].x), _2525, ((_currSceneTrailInteraction._trailViewProjTexScale[0].x) * _2524))) + (_currSceneTrailInteraction._trailViewProjTexScale[3].x);
              _2546 = mad((_currSceneTrailInteraction._trailViewProjTexScale[2].y), _2526, mad((_currSceneTrailInteraction._trailViewProjTexScale[1].y), _2525, ((_currSceneTrailInteraction._trailViewProjTexScale[0].y) * _2524))) + (_currSceneTrailInteraction._trailViewProjTexScale[3].y);
              if (saturate(_2542) == _2542) {
                [branch]
                if (saturate(_2546) == _2546) {
  // [sem: _3__36__0__0__g_textureTrailInteraction_sampleLod]
                  _2555 = __3__36__0__0__g_textureTrailInteraction.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_2542, _2546), 0.0f);
                  _2561 = (_2555.x * 2.0f) + -1.0f;
                  _2562 = (_2555.y * 2.0f) + -1.0f;
                  _2564 = rsqrt(dot(float2(_2561, _2562), float2(_2561, _2562)));  // [sem: invLength]
                  _2565 = _2561 * _2564;
                  _2566 = _2562 * _2564;
                  _2567 = saturate(_2555.w);  // [sem: expr_sat]
                  if (_2567 > 0.0f) {
                    _2580 = _2384 - _218;
                    _2586 = sin(_time.x * 7.0f);
                    _2591 = -0.0f - (_2392 * _2566);
                    _2594 = (_2566 * _2391) - (_2565 * _2393);
                    _2595 = _2565 * _2392;
                    _2597 = rsqrt(dot(float3(_2591, _2594, _2595), float3(_2591, _2594, _2595)));  // [sem: invLength]
                    _2598 = _2597 * _2591;
                    _2599 = _2597 * _2594;
                    _2600 = _2597 * _2595;
                    _2606 = (((((_1889 * 0.9424778819084167f) * _2567) * (1.0f / exp2(log2(max((_288 + -1.5f), 1.0f)) * 1.7999999523162842f))) * max((_2555.z * 2.0f), 1.0f)) * saturate((abs(_2580) * 0.25f) - (_288 * 0.029999999329447746f))) * (lerp(_2586, 1.0f, _2567));
                    _2609 = dot(float3(_2598, _2599, _2600), float3((_2383 - _222), _2580, (_2385 - _224)));
                    _2613 = (_2598 * _2609) + _222;
                    _2614 = (_2599 * _2609) + _218;
                    _2615 = (_2600 * _2609) + _224;
                    _2616 = _2383 - _2613;
                    _2617 = _2384 - _2614;
                    _2618 = _2385 - _2615;
                    _2628 = sin(_2606);
                    _2629 = cos(_2606);
                    _2639 = cos(_time.x * 10.0f);
                    _2642 = ((cos(_time.x * 2.0f) - _2639) * _2567) + _2639;
                    _2651 = (frac(_119 * 0.0625f) * 2.0f) + -1.0f;
                    _2652 = (frac(_119) * 2.0f) + -1.0f;
                    _2653 = (frac(_119 * 16.0f) * 2.0f) + -1.0f;
                    _2661 = (_2567 * _118) * (0.6000000238418579f - (_2567 * 0.40000003576278687f));
  // [sem: expr_sat]
                    _2662 = saturate(2.0f / _288) * rsqrt(dot(float3(_2651, _2652, _2653), float3(_2651, _2652, _2653)));
                    _2666 = _2642 * _2661;
                    _2684 = ((((_2613 - _2383) + (_2616 * _2629)) + (((_2617 * _2600) - (_2618 * _2599)) * _2628)) + (((_2662 * _2661) * _2651) * _2642));
                    _2685 = ((((_2614 - _2384) + (_2617 * _2629)) + (((_2618 * _2598) - (_2616 * _2600)) * _2628)) + ((_2662 * _2666) * _2653));
                    _2686 = ((((_2615 - _2385) + (_2618 * _2629)) + (((_2616 * _2599) - (_2617 * _2598)) * _2628)) + ((_2662 * _2652) * _2666));
                  } else {
                    _2684 = 0.0f;
                    _2685 = 0.0f;
                    _2686 = 0.0f;
                  }
                } else {
                  _2684 = 0.0f;
                  _2685 = 0.0f;
                  _2686 = 0.0f;
                }
              } else {
                _2684 = 0.0f;
                _2685 = 0.0f;
                _2686 = 0.0f;
              }
            } else {
  // [sem: _3__36__0__0__g_textureTrailHeight_sampleLod]
              _2447 = __3__36__0__0__g_textureTrailHeight.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_2423, _2427), 0.0f);
              if (_2447.x < 1.0f) {
                _2480 = ((int)(uint)((int)((((_currSceneTrailHeight._trailUpdatedPosition.y + -1.0f) - _viewPos.y) + ((mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].y), _2447.x, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].y), _2427, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].y) * _2423))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].y)) / (mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].w), _2447.x, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].w), _2427, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].w) * _2423))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].w)))) < (_218 + 1.0f))));
              } else {
                _2480 = 1;
              }
              if ((_2447.y < 1.0f) && (_2447.y > 0.0f)) {
                _2514 = (((int)(uint)((int)((((_currSceneTrailHeight._trailUpdatedPosition.y + 0.20000000298023224f) - _viewPos.y) + ((mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].y), _2447.y, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].y), _2427, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].y) * _2423))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].y)) / (mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].w), _2447.y, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].w), _2427, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].w) * _2423))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].w)))) > (_218 + 1.0f)))) & _2480);
              } else {
                _2514 = _2480;
              }
              if (!(_2514 == 0)) {
                _2524 = (_viewPos.x + _222) - _currSceneTrailInteraction._trailUpdatedPosition.x;
                _2525 = (_viewPos.y + _218) - _currSceneTrailInteraction._trailUpdatedPosition.y;
                _2526 = (_viewPos.z + _224) - _currSceneTrailInteraction._trailUpdatedPosition.z;
                _2542 = mad((_currSceneTrailInteraction._trailViewProjTexScale[2].x), _2526, mad((_currSceneTrailInteraction._trailViewProjTexScale[1].x), _2525, ((_currSceneTrailInteraction._trailViewProjTexScale[0].x) * _2524))) + (_currSceneTrailInteraction._trailViewProjTexScale[3].x);
                _2546 = mad((_currSceneTrailInteraction._trailViewProjTexScale[2].y), _2526, mad((_currSceneTrailInteraction._trailViewProjTexScale[1].y), _2525, ((_currSceneTrailInteraction._trailViewProjTexScale[0].y) * _2524))) + (_currSceneTrailInteraction._trailViewProjTexScale[3].y);
                if (saturate(_2542) == _2542) {
                  [branch]
                  if (saturate(_2546) == _2546) {
  // [sem: _3__36__0__0__g_textureTrailInteraction_sampleLod]
                    _2555 = __3__36__0__0__g_textureTrailInteraction.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_2542, _2546), 0.0f);
                    _2561 = (_2555.x * 2.0f) + -1.0f;
                    _2562 = (_2555.y * 2.0f) + -1.0f;
                    _2564 = rsqrt(dot(float2(_2561, _2562), float2(_2561, _2562)));  // [sem: invLength]
                    _2565 = _2561 * _2564;
                    _2566 = _2562 * _2564;
                    _2567 = saturate(_2555.w);  // [sem: expr_sat]
                    if (_2567 > 0.0f) {
                      _2580 = _2384 - _218;
                      _2586 = sin(_time.x * 7.0f);
                      _2591 = -0.0f - (_2392 * _2566);
                      _2594 = (_2566 * _2391) - (_2565 * _2393);
                      _2595 = _2565 * _2392;
                      _2597 = rsqrt(dot(float3(_2591, _2594, _2595), float3(_2591, _2594, _2595)));  // [sem: invLength]
                      _2598 = _2597 * _2591;
                      _2599 = _2597 * _2594;
                      _2600 = _2597 * _2595;
                      _2606 = (((((_1889 * 0.9424778819084167f) * _2567) * (1.0f / exp2(log2(max((_288 + -1.5f), 1.0f)) * 1.7999999523162842f))) * max((_2555.z * 2.0f), 1.0f)) * saturate((abs(_2580) * 0.25f) - (_288 * 0.029999999329447746f))) * (lerp(_2586, 1.0f, _2567));
                      _2609 = dot(float3(_2598, _2599, _2600), float3((_2383 - _222), _2580, (_2385 - _224)));
                      _2613 = (_2598 * _2609) + _222;
                      _2614 = (_2599 * _2609) + _218;
                      _2615 = (_2600 * _2609) + _224;
                      _2616 = _2383 - _2613;
                      _2617 = _2384 - _2614;
                      _2618 = _2385 - _2615;
                      _2628 = sin(_2606);
                      _2629 = cos(_2606);
                      _2639 = cos(_time.x * 10.0f);
                      _2642 = ((cos(_time.x * 2.0f) - _2639) * _2567) + _2639;
                      _2651 = (frac(_119 * 0.0625f) * 2.0f) + -1.0f;
                      _2652 = (frac(_119) * 2.0f) + -1.0f;
                      _2653 = (frac(_119 * 16.0f) * 2.0f) + -1.0f;
                      _2661 = (_2567 * _118) * (0.6000000238418579f - (_2567 * 0.40000003576278687f));
  // [sem: expr_sat]
                      _2662 = saturate(2.0f / _288) * rsqrt(dot(float3(_2651, _2652, _2653), float3(_2651, _2652, _2653)));
                      _2666 = _2642 * _2661;
                      _2684 = ((((_2613 - _2383) + (_2616 * _2629)) + (((_2617 * _2600) - (_2618 * _2599)) * _2628)) + (((_2662 * _2661) * _2651) * _2642));
                      _2685 = ((((_2614 - _2384) + (_2617 * _2629)) + (((_2618 * _2598) - (_2616 * _2600)) * _2628)) + ((_2662 * _2666) * _2653));
                      _2686 = ((((_2615 - _2385) + (_2618 * _2629)) + (((_2616 * _2599) - (_2617 * _2598)) * _2628)) + ((_2662 * _2652) * _2666));
                    } else {
                      _2684 = 0.0f;
                      _2685 = 0.0f;
                      _2686 = 0.0f;
                    }
                  } else {
                    _2684 = 0.0f;
                    _2685 = 0.0f;
                    _2686 = 0.0f;
                  }
                } else {
                  _2684 = 0.0f;
                  _2685 = 0.0f;
                  _2686 = 0.0f;
                }
              } else {
                _2684 = 0.0f;
                _2685 = 0.0f;
                _2686 = 0.0f;
              }
            }
            if (!(_2431) || ((_2431) && (!(((saturate(_2427) == _2427) && (_2423 > (1.0f / float((int)((int)(_2429.x)))))) && (_2427 > (1.0f / float((int)((int)(_2429.y))))))))) {
              _2785 = (_viewPos.x + _222) - _prevSceneTrailInteraction._trailUpdatedPosition.x;
              _2786 = (_viewPos.y + _218) - _prevSceneTrailInteraction._trailUpdatedPosition.y;
              _2787 = (_viewPos.z + _224) - _prevSceneTrailInteraction._trailUpdatedPosition.z;
              _2803 = mad((_prevSceneTrailInteraction._trailViewProjTexScale[2].x), _2787, mad((_prevSceneTrailInteraction._trailViewProjTexScale[1].x), _2786, ((_prevSceneTrailInteraction._trailViewProjTexScale[0].x) * _2785))) + (_prevSceneTrailInteraction._trailViewProjTexScale[3].x);
              _2807 = mad((_prevSceneTrailInteraction._trailViewProjTexScale[2].y), _2787, mad((_prevSceneTrailInteraction._trailViewProjTexScale[1].y), _2786, ((_prevSceneTrailInteraction._trailViewProjTexScale[0].y) * _2785))) + (_prevSceneTrailInteraction._trailViewProjTexScale[3].y);
              if (saturate(_2803) == _2803) {
                [branch]
                if (saturate(_2807) == _2807) {
  // [sem: _3__36__0__0__g_textureTrailInteractionPrev_sampleLod]
                  _2816 = __3__36__0__0__g_textureTrailInteractionPrev.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_2803, _2807), 0.0f);
                  _2822 = (_2816.x * 2.0f) + -1.0f;
                  _2823 = (_2816.y * 2.0f) + -1.0f;
                  _2825 = rsqrt(dot(float2(_2822, _2823), float2(_2822, _2823)));  // [sem: invLength]
                  _2826 = _2822 * _2825;
                  _2827 = _2823 * _2825;
                  _2828 = saturate(_2816.w);  // [sem: expr_sat]
                  if (_2828 > 0.0f) {
                    _2841 = _2384 - _218;
                    _2847 = sin(_time.y * 7.0f);
                    _2852 = -0.0f - (_2392 * _2827);
                    _2855 = (_2827 * _2391) - (_2826 * _2393);
                    _2856 = _2826 * _2392;
                    _2858 = rsqrt(dot(float3(_2852, _2855, _2856), float3(_2852, _2855, _2856)));  // [sem: invLength]
                    _2859 = _2858 * _2852;
                    _2860 = _2858 * _2855;
                    _2861 = _2858 * _2856;
                    _2867 = (((((_1889 * 0.9424778819084167f) * _2828) * (1.0f / exp2(log2(max((_288 + -1.5f), 1.0f)) * 1.7999999523162842f))) * max((_2816.z * 2.0f), 1.0f)) * saturate((abs(_2841) * 0.25f) - (_288 * 0.029999999329447746f))) * (lerp(_2847, 1.0f, _2828));
                    _2870 = dot(float3(_2859, _2860, _2861), float3((_2383 - _222), _2841, (_2385 - _224)));
                    _2874 = (_2859 * _2870) + _222;
                    _2875 = (_2860 * _2870) + _218;
                    _2876 = (_2861 * _2870) + _224;
                    _2877 = _2383 - _2874;
                    _2878 = _2384 - _2875;
                    _2879 = _2385 - _2876;
                    _2889 = sin(_2867);
                    _2890 = cos(_2867);
                    _2900 = cos(_time.y * 10.0f);
                    _2903 = ((cos(_time.y * 2.0f) - _2900) * _2828) + _2900;
                    _2912 = (frac(_119 * 0.0625f) * 2.0f) + -1.0f;
                    _2913 = (frac(_119) * 2.0f) + -1.0f;
                    _2914 = (frac(_119 * 16.0f) * 2.0f) + -1.0f;
                    _2922 = (_2828 * _118) * (0.6000000238418579f - (_2828 * 0.40000003576278687f));
  // [sem: expr_sat]
                    _2923 = saturate(2.0f / _288) * rsqrt(dot(float3(_2912, _2913, _2914), float3(_2912, _2913, _2914)));
                    _2927 = _2903 * _2922;
                    _2945 = ((((_2874 - _2383) + (_2877 * _2890)) + (((_2878 * _2861) - (_2879 * _2860)) * _2889)) + (((_2923 * _2922) * _2912) * _2903));
                    _2946 = ((((_2875 - _2384) + (_2878 * _2890)) + (((_2879 * _2859) - (_2877 * _2861)) * _2889)) + ((_2923 * _2927) * _2914));
                    _2947 = ((((_2876 - _2385) + (_2879 * _2890)) + (((_2877 * _2860) - (_2878 * _2859)) * _2889)) + ((_2923 * _2913) * _2927));
                  } else {
                    _2945 = 0.0f;
                    _2946 = 0.0f;
                    _2947 = 0.0f;
                  }
                } else {
                  _2945 = 0.0f;
                  _2946 = 0.0f;
                  _2947 = 0.0f;
                }
              } else {
                _2945 = 0.0f;
                _2946 = 0.0f;
                _2947 = 0.0f;
              }
            } else {
  // [sem: _3__36__0__0__g_textureTrailHeight_sampleLod]
              _2708 = __3__36__0__0__g_textureTrailHeight.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_2423, _2427), 0.0f);
              if (_2708.x < 1.0f) {
                _2741 = ((int)(uint)((int)((((_currSceneTrailHeight._trailUpdatedPosition.y + -1.0f) - _viewPos.y) + ((mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].y), _2708.x, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].y), _2427, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].y) * _2423))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].y)) / (mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].w), _2708.x, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].w), _2427, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].w) * _2423))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].w)))) < (_218 + 1.0f))));
              } else {
                _2741 = 1;
              }
              if ((_2708.y < 1.0f) && (_2708.y > 0.0f)) {
                _2775 = (((int)(uint)((int)((((_currSceneTrailHeight._trailUpdatedPosition.y + 0.20000000298023224f) - _viewPos.y) + ((mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].y), _2708.y, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].y), _2427, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].y) * _2423))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].y)) / (mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].w), _2708.y, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].w), _2427, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].w) * _2423))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].w)))) > (_218 + 1.0f)))) & _2741);
              } else {
                _2775 = _2741;
              }
              if (!(_2775 == 0)) {
                _2785 = (_viewPos.x + _222) - _prevSceneTrailInteraction._trailUpdatedPosition.x;
                _2786 = (_viewPos.y + _218) - _prevSceneTrailInteraction._trailUpdatedPosition.y;
                _2787 = (_viewPos.z + _224) - _prevSceneTrailInteraction._trailUpdatedPosition.z;
                _2803 = mad((_prevSceneTrailInteraction._trailViewProjTexScale[2].x), _2787, mad((_prevSceneTrailInteraction._trailViewProjTexScale[1].x), _2786, ((_prevSceneTrailInteraction._trailViewProjTexScale[0].x) * _2785))) + (_prevSceneTrailInteraction._trailViewProjTexScale[3].x);
                _2807 = mad((_prevSceneTrailInteraction._trailViewProjTexScale[2].y), _2787, mad((_prevSceneTrailInteraction._trailViewProjTexScale[1].y), _2786, ((_prevSceneTrailInteraction._trailViewProjTexScale[0].y) * _2785))) + (_prevSceneTrailInteraction._trailViewProjTexScale[3].y);
                if (saturate(_2803) == _2803) {
                  [branch]
                  if (saturate(_2807) == _2807) {
  // [sem: _3__36__0__0__g_textureTrailInteractionPrev_sampleLod]
                    _2816 = __3__36__0__0__g_textureTrailInteractionPrev.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_2803, _2807), 0.0f);
                    _2822 = (_2816.x * 2.0f) + -1.0f;
                    _2823 = (_2816.y * 2.0f) + -1.0f;
                    _2825 = rsqrt(dot(float2(_2822, _2823), float2(_2822, _2823)));  // [sem: invLength]
                    _2826 = _2822 * _2825;
                    _2827 = _2823 * _2825;
                    _2828 = saturate(_2816.w);  // [sem: expr_sat]
                    if (_2828 > 0.0f) {
                      _2841 = _2384 - _218;
                      _2847 = sin(_time.y * 7.0f);
                      _2852 = -0.0f - (_2392 * _2827);
                      _2855 = (_2827 * _2391) - (_2826 * _2393);
                      _2856 = _2826 * _2392;
                      _2858 = rsqrt(dot(float3(_2852, _2855, _2856), float3(_2852, _2855, _2856)));  // [sem: invLength]
                      _2859 = _2858 * _2852;
                      _2860 = _2858 * _2855;
                      _2861 = _2858 * _2856;
                      _2867 = (((((_1889 * 0.9424778819084167f) * _2828) * (1.0f / exp2(log2(max((_288 + -1.5f), 1.0f)) * 1.7999999523162842f))) * max((_2816.z * 2.0f), 1.0f)) * saturate((abs(_2841) * 0.25f) - (_288 * 0.029999999329447746f))) * (lerp(_2847, 1.0f, _2828));
                      _2870 = dot(float3(_2859, _2860, _2861), float3((_2383 - _222), _2841, (_2385 - _224)));
                      _2874 = (_2859 * _2870) + _222;
                      _2875 = (_2860 * _2870) + _218;
                      _2876 = (_2861 * _2870) + _224;
                      _2877 = _2383 - _2874;
                      _2878 = _2384 - _2875;
                      _2879 = _2385 - _2876;
                      _2889 = sin(_2867);
                      _2890 = cos(_2867);
                      _2900 = cos(_time.y * 10.0f);
                      _2903 = ((cos(_time.y * 2.0f) - _2900) * _2828) + _2900;
                      _2912 = (frac(_119 * 0.0625f) * 2.0f) + -1.0f;
                      _2913 = (frac(_119) * 2.0f) + -1.0f;
                      _2914 = (frac(_119 * 16.0f) * 2.0f) + -1.0f;
                      _2922 = (_2828 * _118) * (0.6000000238418579f - (_2828 * 0.40000003576278687f));
  // [sem: expr_sat]
                      _2923 = saturate(2.0f / _288) * rsqrt(dot(float3(_2912, _2913, _2914), float3(_2912, _2913, _2914)));
                      _2927 = _2903 * _2922;
                      _2945 = ((((_2874 - _2383) + (_2877 * _2890)) + (((_2878 * _2861) - (_2879 * _2860)) * _2889)) + (((_2923 * _2922) * _2912) * _2903));
                      _2946 = ((((_2875 - _2384) + (_2878 * _2890)) + (((_2879 * _2859) - (_2877 * _2861)) * _2889)) + ((_2923 * _2927) * _2914));
                      _2947 = ((((_2876 - _2385) + (_2879 * _2890)) + (((_2877 * _2860) - (_2878 * _2859)) * _2889)) + ((_2923 * _2913) * _2927));
                    } else {
                      _2945 = 0.0f;
                      _2946 = 0.0f;
                      _2947 = 0.0f;
                    }
                  } else {
                    _2945 = 0.0f;
                    _2946 = 0.0f;
                    _2947 = 0.0f;
                  }
                } else {
                  _2945 = 0.0f;
                  _2946 = 0.0f;
                  _2947 = 0.0f;
                }
              } else {
                _2945 = 0.0f;
                _2946 = 0.0f;
                _2947 = 0.0f;
              }
            }
            _2955 = ((_2684 * _407) + _2383);
            _2956 = ((_2685 * _407) + _2384);
            _2957 = ((_2686 * _407) + _2385);
            _2958 = ((_2945 * _407) + _2380);
            _2959 = ((_2946 * _407) + _2381);
            _2960 = ((_2947 * _407) + _2382);
          } else {
            _2955 = _2383;
            _2956 = _2384;
            _2957 = _2385;
            _2958 = _2380;
            _2959 = _2381;
            _2960 = _2382;
          }
        } else {
          _2955 = _1771;
          _2956 = _1772;
          _2957 = _1773;
          _2958 = _1828;
          _2959 = _1829;
          _2960 = _1832;
        }
      } else {
        _2955 = _1771;
        _2956 = _1772;
        _2957 = _1773;
        _2958 = _1828;
        _2959 = _1829;
        _2960 = _1832;
      }
    } else {
      _2955 = _1771;
      _2956 = _1772;
      _2957 = _1773;
      _2958 = _1828;
      _2959 = _1829;
      _2960 = _1832;
    }
  } else {
    _2955 = _1771;
    _2956 = _1772;
    _2957 = _1773;
    _2958 = _1828;
    _2959 = _1829;
    _2960 = _1832;
  }
  if (!_193) {
    _2962 = asint(_143);
    _2965 = select((_1805 != 0), asint(_178), _2962);
    _2977 = (((float)((uint)((uint)((uint)(_2962) >> 24)))) * 0.007843137718737125f) + -1.0f;
    _2978 = (((float)((uint)((uint)(((uint)(_2962) >> 16) & 255)))) * 0.007843137718737125f) + -1.0f;
    _2986 = (((float)((uint)((uint)((uint)(_2965) >> 24)))) * 0.007843137718737125f) + -1.0f;
    _2987 = (((float)((uint)((uint)(((uint)(_2965) >> 16) & 255)))) * 0.007843137718737125f) + -1.0f;
    _2989 = rsqrt(dot(float3(_145, _146, _147), float3(_145, _146, _147)));  // [sem: invLength]
    _2990 = _2989 * _145;
    _2991 = _2989 * _146;
    _2992 = _2989 * _147;
    _2995 = _2956 - _218;
    _3002 = -0.0f - (_2978 * _2991);
    _3005 = (_2990 * _2978) - (_2992 * _2977);
    _3006 = _2991 * _2977;
    _3008 = rsqrt(dot(float3(_3002, _3005, _3006), float3(_3002, _3005, _3006)));  // [sem: invLength]
    _3009 = _3008 * _3002;
    _3010 = _3008 * _3005;
    _3011 = _3008 * _3006;
    _3014 = max(exp2(log2(max(_2995, 0.0f)) * 0.5f), 0.0f) * _windFluidVolumeParams.w;
    _3015 = _3014 * ((((float)((uint)((uint)(_2962 & 65535)))) * 9.587526437826455e-05f) + -3.1415927410125732f);
    _3016 = _2955 - _222;
    _3017 = _2957 - _224;
    _3018 = dot(float3(_3009, _3010, _3011), float3(_3016, _2995, _3017));
    _3022 = (_3009 * _3018) + _222;
    _3023 = (_3010 * _3018) + _218;
    _3024 = (_3011 * _3018) + _224;
    _3025 = _2955 - _3022;
    _3026 = _2956 - _3023;
    _3027 = _2957 - _3024;
    _3037 = sin(_3015);
    _3038 = cos(_3015);
    _3052 = -0.0f - (_2987 * _2991);
    _3055 = (_2990 * _2987) - (_2992 * _2986);
    _3056 = _2991 * _2986;
    _3058 = rsqrt(dot(float3(_3052, _3055, _3056), float3(_3052, _3055, _3056)));  // [sem: invLength]
    _3059 = _3058 * _3052;
    _3060 = _3058 * _3055;
    _3061 = _3058 * _3056;
    _3064 = _3014 * ((((float)((uint)((uint)(_2965 & 65535)))) * 9.587526437826455e-05f) + -3.1415927410125732f);
    _3065 = dot(float3(_3059, _3060, _3061), float3(_3016, _2995, _3017));
    _3069 = (_3059 * _3065) + _222;
    _3070 = (_3060 * _3065) + _218;
    _3071 = (_3061 * _3065) + _224;
    _3072 = _2955 - _3069;
    _3073 = _2956 - _3070;
    _3074 = _2957 - _3071;
    _3084 = sin(_3064);
    _3085 = cos(_3064);
    _3105 = (((_3025 * _3038) + _3022) + (((_3026 * _3011) - (_3027 * _3010)) * _3037));
    _3106 = (((_3026 * _3038) + _3023) + (((_3027 * _3009) - (_3025 * _3011)) * _3037));
    _3107 = (((_3027 * _3038) + _3024) + (((_3025 * _3010) - (_3026 * _3009)) * _3037));
    _3108 = ((((_2958 - _2955) + _3069) + (_3072 * _3085)) + (((_3073 * _3061) - (_3074 * _3060)) * _3084));
    _3109 = ((((_2959 - _2956) + _3070) + (_3073 * _3085)) + (((_3074 * _3059) - (_3072 * _3061)) * _3084));
    _3110 = ((((_2960 - _2957) + _3071) + (_3074 * _3085)) + (((_3072 * _3060) - (_3073 * _3059)) * _3084));
  } else {
    _3105 = _2955;
    _3106 = _2956;
    _3107 = _2957;
    _3108 = _2958;
    _3109 = _2959;
    _3110 = _2960;
  }
  _3184 = rsqrt(dot(float3(_1835, _1838, _1841), float3(_1835, _1838, _1841)));  // [sem: invLength]
  if ((SV_VertexID != 0) && (((int)(SV_VertexID % 40)) == 0)) {
    if (sqrt(((_3106 * _3106) + (_3105 * _3105)) + (_3107 * _3107)) < 4.0f) {
      __3__39__0__1__g_treeSurfacePositionsCounterBufferUAV.InterlockedAdd(0, 1, _3218);
      if ((uint)_3218 < (uint)1024) {
        TreeSurfacePositionData __struct_store_0;
        __struct_store_0._worldPos = float4((_viewPos.x + _3105), (_viewPos.y + _3106), (_viewPos.z + _3107), 1.0f);
        __struct_store_0._worldPosPrev = float4((_viewPosPrev.x + _3108), (_viewPosPrev.y + _3109), (_viewPosPrev.z + _3110), 1.0f);
        __3__39__0__1__g_treeSurfacePositionsBufferUAV[_3218] = __struct_store_0;
      }
    }
  }
  if ((_156 & 8) == 0) {
    _3240 = asint(_143);
    _3249 = (float((int)((int)(_3240) >> 16)) * 1000.0f);
    _3250 = (float((int)((int)((int)(_3240 << 16)) >> 16)) * 1000.0f);
  } else {
    _3249 = 0.0f;
    _3250 = 0.0f;
  }
  _3251 = _3249 + _152;
  _3252 = _3250 + _154;
  if (_treeParams.w > 0.5f) {
    _3257 = _3251 * 0.0009765625f;
    _3258 = _3252 * 0.0009765625f;
    _3264 = (0.5f / _regionLayerResolution) + 20.0f;
    _3274 = asint(__3__35__0__0__TerrainLayerTextureConstBuffer_raw_uint[((uint)((((int)min((uint)((int)(uint(_3264 + floor(_3258)))), (uint)(39))) << 1) + (((int)min((uint)((int)(uint(_3264 + floor(_3257)))), (uint)(39))) * 80)))]);
    if (_3274.z == 0) {
      __0__7__0__0__g_bindlessTextures[NonUniformResourceIndex(((int)((uint)(select(((uint)_globalRegionMapSRVIndex < (uint)65000), _globalRegionMapSRVIndex, 0)) + 0u)))].GetDimensions(_3307.x, _3307.y);
      _3313 = (float((int)(_globalRegionMapOnePixelMeter)) * 0.5f) * float((int)(int(float((int)((int)(_3307.x))))));
      _3332 = (((float4)(__0__7__0__0__g_bindlessTextures[NonUniformResourceIndex(((int)((uint)(select(((uint)_globalRegionMapSRVIndex < (uint)65000), _globalRegionMapSRVIndex, 0)) + 0u)))].SampleLevel(__0__4__0__0__g_staticPointClamp, float2(saturate(((_3251 / _3313) * 0.5f) + 0.5f), saturate(((_3252 / _3313) * 0.5f) + 0.5f)), 0.0f))).x);
    } else {
      _3332 = (((float4)(__0__7__0__0__g_bindlessTextures[NonUniformResourceIndex(((int)((uint)(select(((uint)_3274.z < (uint)65000), _3274.z, 0)) + 0u)))].SampleLevel(__0__4__0__0__g_staticPointClamp, float2(((floor(frac(_3257) * _regionLayerResolution) + 0.5f) / _regionLayerResolution), (1.0f - ((floor(frac(_3258) * _regionLayerResolution) + 0.5f) / _regionLayerResolution))), 0.0f))).x);
    }
    _3338 = __3__37__0__0___terrainHeightFieldRegionInfo[(int)(uint((_3332 * 255.0f) + 0.5f))]._applyTerrainRulesOnObjects;
    if (!((_3338 & 2) == 0)) {
      __0__7__0__0__g_bindlessTextures[NonUniformResourceIndex(((int)((uint)(select(((uint)_globalColorMapSRVIndex < (uint)65000), _globalColorMapSRVIndex, 0)) + 0u)))].GetDimensions(_3352.x, _3352.y);
      _3358 = (float((int)(_globalTextureOnePixelMeter)) * 0.5f) * float((int)(int(float((int)((int)(_3352.x))))));
      _3376 = __0__7__0__0__g_bindlessTextures[NonUniformResourceIndex(((int)((uint)(select(((uint)_globalColorMapSRVIndex < (uint)65000), _globalColorMapSRVIndex, 0)) + 0u)))].SampleLevel(__0__4__0__0__g_staticBilinearWrap, float2(saturate(((_3251 / _3358) * 0.5f) + 0.5f), (1.0f - saturate(((_3252 / _3358) * 0.5f) + 0.5f))), 0.0f);
      _3381 = _3376.x;
      _3382 = _3376.y;
      _3383 = _3376.z;
      _3384 = 1.0f;
    } else {
      _3381 = 1.0f;
      _3382 = 1.0f;
      _3383 = 1.0f;
      _3384 = 0.0f;
    }
  } else {
    _3381 = 1.0f;
    _3382 = 1.0f;
    _3383 = 1.0f;
    _3384 = 0.0f;
  }
  SV_Position.x = (mad((_viewProjRelative[2].x), _3107, mad((_viewProjRelative[1].x), _3106, ((_viewProjRelative[0].x) * _3105))) + (_viewProjRelative[3].x));
  SV_Position.y = (mad((_viewProjRelative[2].y), _3107, mad((_viewProjRelative[1].y), _3106, ((_viewProjRelative[0].y) * _3105))) + (_viewProjRelative[3].y));
  SV_Position.z = (mad((_viewProjRelative[2].z), _3107, mad((_viewProjRelative[1].z), _3106, ((_viewProjRelative[0].z) * _3105))) + (_viewProjRelative[3].z));
  SV_Position.w = (mad((_viewProjRelative[2].w), _3107, mad((_viewProjRelative[1].w), _3106, ((_viewProjRelative[0].w) * _3105))) + (_viewProjRelative[3].w));
  TEXCOORD.x = float(_85);
  TEXCOORD.y = float(_86);
  TEXCOORD.z = _108;
  TEXCOORD.w = 0.0f;
  TEXCOORD_1.x = (mad((_viewProjRelativePrev[2].x), _3110, mad((_viewProjRelativePrev[1].x), _3109, ((_viewProjRelativePrev[0].x) * _3108))) + (_viewProjRelativePrev[3].x));
  TEXCOORD_1.y = (mad((_viewProjRelativePrev[2].y), _3110, mad((_viewProjRelativePrev[1].y), _3109, ((_viewProjRelativePrev[0].y) * _3108))) + (_viewProjRelativePrev[3].y));
  TEXCOORD_1.z = (mad((_viewProjRelativePrev[2].z), _3110, mad((_viewProjRelativePrev[1].z), _3109, ((_viewProjRelativePrev[0].z) * _3108))) + (_viewProjRelativePrev[3].z));
  TEXCOORD_1.w = (mad((_viewProjRelativePrev[2].w), _3110, mad((_viewProjRelativePrev[1].w), _3109, ((_viewProjRelativePrev[0].w) * _3108))) + (_viewProjRelativePrev[3].w));
  NORMAL.x = (half)(half(_3184 * _1835));
  NORMAL.y = (half)(half(_3184 * _1838));
  NORMAL.z = (half)(half(_3184 * _1841));
  NORMAL.w = (half)(half((((float)((uint16_t)((uint)(_81 & 255)))) * 0.003921568859368563f) * min(2.0f, _155)));
  TEXCOORD_2.x = ((uint)(((int)(((int)min((uint)(255), (uint)((int)(uint(round((float)((uint)((uint)(((uint)(_156) >> 8) & 255))))))))) << 24)) | (_drawIndex & 16777215)));
  TEXCOORD_2.y = ((uint)((((((int)((int)(uint(saturate(_3382) * 255.0f)) << 8)) & 65280) | (((int)((int)(uint(saturate(_3381) * 255.0f)) << 16)) & 16711680)) | ((int)(uint(saturate(_3383) * 255.0f)) & 255)) | ((int)((int)(uint(saturate(_3384) * 255.0f)) << 24))));
  SV_ClipDistance = _395;
  SV_ShadingRate = (uint)(select((_variableRateShadingParams.x > 0.0f), 5, 0));
  OutputSignature output_signature = { SV_Position, TEXCOORD, TEXCOORD_1, NORMAL, TEXCOORD_2, SV_ClipDistance, SV_ShadingRate };
  return output_signature;
}
