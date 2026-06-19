#include "../shared.h"

struct IndirectDrawParameters {
  uint16_t _vertexBufferViewIndex;
  uint16_t _staticMeshDataViewIndex;
  uint16_t _staticMeshDataIndex;
  uint16_t _lodData;
  uint _baseVertexLocation;
  uint _bindlessMaterialParametersViewIndex;
  uint _windParams;
};

struct MassPlacementInstanceData {
  row_major float4x4 _transform;
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

struct SceneCaptureTransform {
  row_major float4x4 _captureMatrix;
  row_major float4x4 _captureMatrixInv;
  row_major float4x4 _captureMatrixTexScale;
  row_major float4x4 _captureMatrixInvTexScale;
  row_major float4x4 _captureMatrixRelative;
  row_major float4x4 _captureMatrixRelativePrev;
  row_major float4x4 _captureMatrixRelativeTexScale;
  row_major float4x4 _captureMatrixRelativeInvTexScale;
  float4 _captureMatrixRelativePosition;
  float4 _captureMatrixRelativePositionPrev;
  float4 _captureFrustumPlanes[6];
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


StructuredBuffer<IndirectDrawParameters> __3__37__0__0__g_indirectDrawParametersBuffer : register(t21, space37);

Texture2D<float4> __3__36__0__0__g_textureTrailInteraction : register(t58, space36);

Texture2D<float4> __3__36__0__0__g_textureTrailInteractionPrev : register(t75, space36);

Texture2D<float2> __3__36__0__0__g_textureTrailHeight : register(t39, space36);

Texture3D<float4> __3__36__0__0__g_windFluidInteractionVelocityHistory : register(t131, space36);

Texture3D<float4> __3__36__0__0__g_windFluidInteractionVelocityHistoryPrev : register(t132, space36);

Texture2D<float> __3__36__0__0__g_topDownTerrainDepth : register(t83, space36);

Texture2D<uint4> __3__36__0__0__g_topDownTerrainNormal : register(t84, space36);

Texture2D<float> __3__36__0__0__g_topDownTerrainObjectDepth : register(t76, space36);

Texture2D<uint4> __3__36__0__0__g_topDownTerrainObjectNormal : register(t85, space36);

Texture2D<float> __3__36__0__0__g_topDownClippingSpace : register(t86, space36);

StructuredBuffer<SpeedTreeDataForBuffer> __3__37__0__0__g_treeWindDataBuffer : register(t29, space37);

StructuredBuffer<MassPlacementInstanceData> __3__37__0__0__g_massPlacementInstanceBuffer : register(t25, space37);

StructuredBuffer<StaticMeshData> __3__37__0__0__g_staticMeshData : register(t3, space37);

StructuredBuffer<VertexDataTree> __0__103__0__0__g_bindlessVertexBuffersTree[] : register(t0, space103);

RWByteAddressBuffer __3__39__0__1__g_treeSurfacePositionsCounterBufferUAV : register(u7, space39);

RWStructuredBuffer<TreeSurfacePositionData> __3__39__0__1__g_treeSurfacePositionsBufferUAV : register(u15, space39);

cbuffer __3__1__0__0__IndirectCommandConstants : register(b2, space1) {
  uint _drawIndex : packoffset(c000.x);
};

cbuffer __3__35__0__0__SceneConstantBuffer : register(b16, space35) {
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

cbuffer __3__35__0__0__SceneTrailInteractionConstantBuffer : register(b27, space35) {
  SceneTrailTransforms _currSceneTrailInteraction : packoffset(c000.x);
  SceneTrailTransforms _prevSceneTrailInteraction : packoffset(c013.x);
  float4 _trailInteractionTextureSizeAndInvSize : packoffset(c026.x);
};

cbuffer __3__35__0__0__TopDownCaptureConstantBuffer : register(b28, space35) {
  SceneCaptureTransform _sceneCaptureTopDown[2] : packoffset(c000.x);
};

cbuffer __3__35__0__0__ClippingSpaceCaptureConstantBuffer : register(b29, space35) {
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

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

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
  int _36;
  int16_t _39;
  int16_t _41;
  int _43;
  int _44;
  float _47;
  float _48;
  float _49;
  float _51;
  float _52;
  float _53;
  int _55;
  uint _60;
  int16_t _68;
  int16_t _69;
  int16_t _70;
  int16_t _71;
  int _73;
  half _75;
  half _76;
  half _77;
  half _78;
  half _80;
  half _81;
  half _82;
  half _83;
  half _85;
  half _86;
  float _96;
  float _97;
  float _98;
  float _102;
  float _103;
  float _104;
  float _105;
  float _106;
  float _107;
  float _108;
  float _109;
  int _112;
  int _115;
  float _118;
  float _120;
  float _122;
  float _124;
  float _126;
  float _128;
  float _130;
  float _132;
  float _134;
  float _136;
  float _138;
  float _140;
  int _141;
  int _142;
  float _149;
  float _151;
  float _152;
  float _153;
  float _158;
  float _159;
  float _160;
  float _172;
  float _173;
  float _174;
  float _179;
  float _182;
  float _185;
  float _187;
  float _189;
  float _191;
  float _193;
  float _197;
  float _199;
  float _297;
  float _468;
  float _469;
  float _470;
  float _471;
  float _519;
  float _520;
  float _521;
  float _522;
  float _560;
  float _561;
  float _562;
  float _563;
  float _564;
  float _565;
  float _566;
  float _567;
  float _698;
  float _699;
  float _700;
  float _1093;
  float _1094;
  float _1095;
  float _1096;
  float _1097;
  float _1098;
  float _1507;
  float _1508;
  float _1509;
  float _1522;
  float _1523;
  float _1524;
  float _1525;
  float _1526;
  float _1527;
  float _1528;
  float _1529;
  float _1530;
  float _1741;
  float _1742;
  float _1763;
  int _1886;
  int _1919;
  int _1922;
  float _2038;
  float _2039;
  float _2040;
  int _2085;
  int _2118;
  int _2121;
  float _2237;
  float _2238;
  float _2239;
  float _2247;
  float _2248;
  float _2249;
  float _2250;
  float _2251;
  float _2252;
  int _2345;
  int _2379;
  float _2548;
  float _2549;
  float _2550;
  int _2605;
  int _2639;
  float _2808;
  float _2809;
  float _2810;
  float _2818;
  float _2819;
  float _2820;
  float _2821;
  float _2822;
  float _2823;
  float _2945;
  float _2946;
  float _2947;
  float _2948;
  float _2949;
  half _2950;
  half _2951;
  half _2952;
  half _2953;
  int _2954;
  float _2955;
  int _2956;
  float _2957;
  float _2958;
  float _2959;
  float _2960;
  float _221;
  float _222;
  float _223;
  float _239;
  float _243;
  uint2 _245;
  float _263;
  float _293;
  float _303;
  float _309;
  int _313;
  float _322;
  float _323;
  float _324;
  float _325;
  float _327;
  float _328;
  float _329;
  float _331;
  float _332;
  float _333;
  float _334;
  float _336;
  float _337;
  float _338;
  float _340;
  float _341;
  float _343;
  float _344;
  float _345;
  float _347;
  float _348;
  float _349;
  float _350;
  float _352;
  float _353;
  float _354;
  float _355;
  float _357;
  float _358;
  float _360;
  float _361;
  float _362;
  float _364;
  float _365;
  float _366;
  float _367;
  float _369;
  float _370;
  float _371;
  float _373;
  float _374;
  float _375;
  float _376;
  float _378;
  float _379;
  float _380;
  float _382;
  float _383;
  float _385;
  float _386;
  float _387;
  float _389;
  float _390;
  float _391;
  float _392;
  float _394;
  float _395;
  float _396;
  float _397;
  float _399;
  float _400;
  float _402;
  float _403;
  float _404;
  float _419;
  float _420;
  float _421;
  float _429;
  float _433;
  float _434;
  float _435;
  float4 _450;
  float _455;
  float _461;
  float _484;
  float _485;
  float _486;
  float4 _501;
  float _506;
  float _512;
  float _523;
  float _530;
  float _531;
  float _532;
  float _534;
  float _541;
  float _548;
  float _549;
  float _550;
  float _552;
  float _570;
  float _573;
  float _576;
  float _578;
  float _579;
  float _580;
  float _581;
  float _593;
  float _595;
  float _603;
  float _604;
  float _616;
  float _619;
  float _626;
  float _631;
  float _632;
  float _633;
  float _634;
  float _635;
  float _637;
  float _638;
  float _639;
  float _640;
  float _642;
  float _643;
  float _644;
  float _645;
  float _646;
  float _651;
  float _654;
  float _657;
  float _660;
  float _663;
  float _664;
  float _665;
  float _666;
  float _667;
  float _670;
  float _671;
  float _673;
  float _674;
  float _675;
  float _681;
  float _682;
  float _712;
  float _713;
  float _714;
  float _717;
  float _718;
  float _719;
  float _733;
  float _734;
  float _735;
  float _752;
  bool _753;
  float _755;
  float _756;
  float _759;
  float _772;
  float _773;
  float _774;
  float _776;
  float _778;
  bool _781;
  float _790;
  float _799;
  float _815;
  float _816;
  float _817;
  float _822;
  float _850;
  float _851;
  float _852;
  float _854;
  float _855;
  float _856;
  float _857;
  float _859;
  float _869;
  float _870;
  float _881;
  float _882;
  float _883;
  float _884;
  float _885;
  float _894;
  float _896;
  float _897;
  float _898;
  float _899;
  float _900;
  float _901;
  float _904;
  float _910;
  float _913;
  float _914;
  float _926;
  float _938;
  float _939;
  float _950;
  float _967;
  float _969;
  float _970;
  float _971;
  float _972;
  float _973;
  float _988;
  float _991;
  float _994;
  float _997;
  float _998;
  float _999;
  float _1000;
  float _1013;
  float _1014;
  float _1015;
  float _1017;
  float _1051;
  float _1052;
  float _1053;
  float _1055;
  float _1074;
  float _1075;
  float _1076;
  float _1079;
  float _1112;
  float _1115;
  float _1118;
  float _1120;
  float _1121;
  float _1122;
  float _1123;
  float _1143;
  float _1144;
  float _1156;
  float _1159;
  float _1166;
  float _1171;
  float _1177;
  float _1178;
  float _1192;
  float _1193;
  float _1194;
  float _1211;
  bool _1212;
  float _1214;
  float _1215;
  float _1218;
  float _1230;
  float _1242;
  float _1251;
  float _1267;
  float _1268;
  float _1269;
  float _1274;
  float _1302;
  float _1303;
  float _1304;
  float _1306;
  float _1307;
  float _1308;
  float _1309;
  float _1311;
  float _1321;
  float _1322;
  float _1333;
  float _1334;
  float _1335;
  float _1336;
  float _1337;
  float _1346;
  float _1348;
  float _1349;
  float _1350;
  float _1351;
  float _1352;
  float _1353;
  float _1356;
  float _1362;
  float _1365;
  float _1366;
  float _1378;
  float _1390;
  float _1391;
  float _1402;
  float _1419;
  float _1421;
  float _1422;
  float _1423;
  float _1424;
  float _1425;
  float _1440;
  float _1443;
  float _1446;
  float _1449;
  float _1450;
  float _1451;
  float _1452;
  float _1465;
  float _1466;
  float _1467;
  float _1469;
  float _1488;
  float _1489;
  float _1490;
  float _1493;
  float _1533;
  float _1536;
  float _1539;
  float _1543;
  float _1544;
  float _1545;
  float _1551;
  float _1558;
  float _1559;
  float _1560;
  float _1563;
  float _1566;
  float _1569;
  float _1578;
  float _1581;
  float _1584;
  float _1588;
  float _1589;
  float _1590;
  bool _1591;
  float _1596;
  float _1599;
  float _1611;
  float _1614;
  uint2 _1618;
  float _1625;
  float _1626;
  float _1663;
  uint2 _1681;
  float _1688;
  float _1689;
  float _1726;
  int _1747;
  float _1778;
  float _1779;
  float _1780;
  float _1782;
  float _1783;
  float _1784;
  float _1785;
  float _1788;
  float _1791;
  float _1794;
  float _1796;
  float _1797;
  float _1798;
  float _1799;
  float _1806;
  int _1813;
  float _1823;
  float _1824;
  float _1825;
  float _1841;
  float _1845;
  bool _1847;
  float2 _1854;
  float _1932;
  float _1933;
  float _1934;
  float _1950;
  float _1954;
  float4 _1963;
  float _1969;
  float _1970;
  float _1972;
  float _1973;
  float _1974;
  float _1975;
  float _1979;
  float _1984;
  float _1987;
  float _1988;
  float _1990;
  float _1991;
  float _1992;
  float _1993;
  float _1995;
  float _2001;
  float _2005;
  float _2006;
  float _2007;
  float _2008;
  float _2009;
  float _2010;
  float _2020;
  float _2021;
  float2 _2053;
  float _2131;
  float _2132;
  float _2133;
  float _2149;
  float _2153;
  float4 _2162;
  float _2168;
  float _2169;
  float _2171;
  float _2172;
  float _2173;
  float _2174;
  float _2178;
  float _2183;
  float _2186;
  float _2187;
  float _2189;
  float _2190;
  float _2191;
  float _2192;
  float _2194;
  float _2200;
  float _2204;
  float _2205;
  float _2206;
  float _2207;
  float _2208;
  float _2209;
  float _2219;
  float _2220;
  float _2255;
  float _2256;
  float _2257;
  float _2258;
  float _2270;
  float _2271;
  float _2272;
  float _2288;
  float _2292;
  uint2 _2294;
  bool _2296;
  float2 _2312;
  float _2389;
  float _2390;
  float _2391;
  float _2407;
  float _2411;
  float4 _2420;
  float _2426;
  float _2427;
  float _2429;
  float _2430;
  float _2431;
  float _2432;
  float _2445;
  float _2451;
  float _2456;
  float _2459;
  float _2460;
  float _2462;
  float _2463;
  float _2464;
  float _2465;
  float _2470;
  float _2473;
  float _2477;
  float _2478;
  float _2479;
  float _2480;
  float _2481;
  float _2482;
  float _2492;
  float _2493;
  float _2503;
  float _2506;
  float _2515;
  float _2516;
  float _2517;
  float _2525;
  float _2526;
  float _2530;
  float2 _2572;
  float _2649;
  float _2650;
  float _2651;
  float _2667;
  float _2671;
  float4 _2680;
  float _2686;
  float _2687;
  float _2689;
  float _2690;
  float _2691;
  float _2692;
  float _2705;
  float _2711;
  float _2716;
  float _2719;
  float _2720;
  float _2722;
  float _2723;
  float _2724;
  float _2725;
  float _2730;
  float _2733;
  float _2737;
  float _2738;
  float _2739;
  float _2740;
  float _2741;
  float _2742;
  float _2752;
  float _2753;
  float _2763;
  float _2766;
  float _2775;
  float _2776;
  float _2777;
  float _2785;
  float _2786;
  float _2790;
  float _2847;
  float _2851;
  float _2855;
  float _2859;
  float _2883;
  float _2887;
  float _2891;
  float _2895;
  float _2897;
  half _2901;
  half _2902;
  half _2903;
  half _2906;
  int _2907;
  int _2911;
  int _2926;
  _36 = WaveReadLaneFirst(_drawIndex);
  _39 = __3__37__0__0__g_indirectDrawParametersBuffer[_36]._vertexBufferViewIndex;
  _41 = __3__37__0__0__g_indirectDrawParametersBuffer[_36]._staticMeshDataIndex;
  _43 = __3__37__0__0__g_indirectDrawParametersBuffer[_36]._baseVertexLocation;
  _44 = (int)(min16uint)(_41);
  _47 = __3__37__0__0__g_staticMeshData[_44]._aabbMin.x;
  _48 = __3__37__0__0__g_staticMeshData[_44]._aabbMin.y;
  _49 = __3__37__0__0__g_staticMeshData[_44]._aabbMin.z;
  _51 = __3__37__0__0__g_staticMeshData[_44]._aabbMax.x;
  _52 = __3__37__0__0__g_staticMeshData[_44]._aabbMax.y;
  _53 = __3__37__0__0__g_staticMeshData[_44]._aabbMax.z;
  _55 = __3__37__0__0__g_staticMeshData[_44]._flag;
  _60 = _43 + (uint)(SV_VertexID);
  _68 = __0__103__0__0__g_bindlessVertexBuffersTree[((int)((uint)(select(((uint)_39 < (uint)50000u), ((int)(min16uint)(_39)), 0)) + 0u))][_60]._position.x;
  _69 = __0__103__0__0__g_bindlessVertexBuffersTree[((int)((uint)(select(((uint)_39 < (uint)50000u), ((int)(min16uint)(_39)), 0)) + 0u))][_60]._position.y;
  _70 = __0__103__0__0__g_bindlessVertexBuffersTree[((int)((uint)(select(((uint)_39 < (uint)50000u), ((int)(min16uint)(_39)), 0)) + 0u))][_60]._position.z;
  _71 = __0__103__0__0__g_bindlessVertexBuffersTree[((int)((uint)(select(((uint)_39 < (uint)50000u), ((int)(min16uint)(_39)), 0)) + 0u))][_60]._position.w;
  _73 = __0__103__0__0__g_bindlessVertexBuffersTree[((int)((uint)(select(((uint)_39 < (uint)50000u), ((int)(min16uint)(_39)), 0)) + 0u))][_60]._normal;
  _75 = __0__103__0__0__g_bindlessVertexBuffersTree[((int)((uint)(select(((uint)_39 < (uint)50000u), ((int)(min16uint)(_39)), 0)) + 0u))][_60]._diffuseTex.x;
  _76 = __0__103__0__0__g_bindlessVertexBuffersTree[((int)((uint)(select(((uint)_39 < (uint)50000u), ((int)(min16uint)(_39)), 0)) + 0u))][_60]._diffuseTex.y;
  _77 = __0__103__0__0__g_bindlessVertexBuffersTree[((int)((uint)(select(((uint)_39 < (uint)50000u), ((int)(min16uint)(_39)), 0)) + 0u))][_60]._diffuseTex.z;
  _78 = __0__103__0__0__g_bindlessVertexBuffersTree[((int)((uint)(select(((uint)_39 < (uint)50000u), ((int)(min16uint)(_39)), 0)) + 0u))][_60]._diffuseTex.w;
  _80 = __0__103__0__0__g_bindlessVertexBuffersTree[((int)((uint)(select(((uint)_39 < (uint)50000u), ((int)(min16uint)(_39)), 0)) + 0u))][_60]._windNonBranch.x;
  _81 = __0__103__0__0__g_bindlessVertexBuffersTree[((int)((uint)(select(((uint)_39 < (uint)50000u), ((int)(min16uint)(_39)), 0)) + 0u))][_60]._windNonBranch.y;
  _82 = __0__103__0__0__g_bindlessVertexBuffersTree[((int)((uint)(select(((uint)_39 < (uint)50000u), ((int)(min16uint)(_39)), 0)) + 0u))][_60]._windNonBranch.z;
  _83 = __0__103__0__0__g_bindlessVertexBuffersTree[((int)((uint)(select(((uint)_39 < (uint)50000u), ((int)(min16uint)(_39)), 0)) + 0u))][_60]._windNonBranch.w;
  _85 = __0__103__0__0__g_bindlessVertexBuffersTree[((int)((uint)(select(((uint)_39 < (uint)50000u), ((int)(min16uint)(_39)), 0)) + 0u))][_60]._windBranch.x;
  _86 = __0__103__0__0__g_bindlessVertexBuffersTree[((int)((uint)(select(((uint)_39 < (uint)50000u), ((int)(min16uint)(_39)), 0)) + 0u))][_60]._windBranch.y;
  _96 = (((_51 - _47) * 1.5259021893143654e-05f) * ((float)((uint16_t)_68))) + _47;
  _97 = (((_53 - _49) * 1.5259021893143654e-05f) * ((float)((uint16_t)_69))) + _49;
  _98 = (((_52 - _48) * 1.5259021893143654e-05f) * ((float)((uint16_t)_70))) + _48;
  _102 = float(_77);
  _103 = float(_78);
  _104 = float(_80);
  _105 = float(_81);
  _106 = float(_82);
  _107 = float(_83);
  _108 = float(_85);
  _109 = float(_86);
  _112 = WaveReadLaneFirst(_drawIndex);
  _115 = __3__37__0__0__g_indirectDrawParametersBuffer[_112]._windParams;
  _118 = __3__37__0__0__g_massPlacementInstanceBuffer[BLENDINDICES]._transform[0].x;
  _120 = __3__37__0__0__g_massPlacementInstanceBuffer[BLENDINDICES]._transform[0].y;
  _122 = __3__37__0__0__g_massPlacementInstanceBuffer[BLENDINDICES]._transform[0].z;
  _124 = __3__37__0__0__g_massPlacementInstanceBuffer[BLENDINDICES]._transform[1].x;
  _126 = __3__37__0__0__g_massPlacementInstanceBuffer[BLENDINDICES]._transform[1].y;
  _128 = __3__37__0__0__g_massPlacementInstanceBuffer[BLENDINDICES]._transform[1].z;
  _130 = __3__37__0__0__g_massPlacementInstanceBuffer[BLENDINDICES]._transform[2].x;
  _132 = __3__37__0__0__g_massPlacementInstanceBuffer[BLENDINDICES]._transform[2].z;
  _134 = __3__37__0__0__g_massPlacementInstanceBuffer[BLENDINDICES]._transform[3].x;
  _136 = __3__37__0__0__g_massPlacementInstanceBuffer[BLENDINDICES]._transform[3].y;
  _138 = __3__37__0__0__g_massPlacementInstanceBuffer[BLENDINDICES]._transform[3].z;
  _140 = __3__37__0__0__g_massPlacementInstanceBuffer[BLENDINDICES]._transform[3].w;
  _141 = asint(_132);
  _142 = (uint)(_141) >> 30;
  _149 = -0.0f - _viewPos.y;
  _151 = _134 - _viewPos.x;
  _152 = _136 - _viewPos.y;
  _153 = _138 - _viewPos.z;
  _158 = _134 - _viewPosPrev.x;
  _159 = _136 - _viewPosPrev.y;
  _160 = _138 - _viewPosPrev.z;
  _172 = (((float)((uint)((uint)(_73 & 255)))) * 0.007843120023608208f) + -1.0f;
  _173 = (((float)((uint)((uint)(((uint)(_73) >> 16) & 255)))) * 0.007843120023608208f) + -1.0f;
  _174 = (((float)((uint)((uint)(((uint)(_73) >> 8) & 255)))) * 0.007843120023608208f) + -1.0f;
  _179 = (_126 * _122) - (_128 * _120);
  _182 = (_128 * _118) - (_124 * _122);
  _185 = (_124 * _120) - (_126 * _118);
  _187 = rsqrt(dot(float3(_179, _182, _185), float3(_179, _182, _185)));  // [sem: invLength]
  _189 = -0.0f - (_179 * _187);
  _191 = -0.0f - (_182 * _187);
  _193 = -0.0f - (_185 * _187);
  _197 = max((f16tof32(((uint)((uint)(_115) >> 16))) * _140), 0.009999999776482582f);
  _199 = saturate(1.0f / _197);  // [sem: expr_sat]
  if ((int)_55 > (int)-1) {
    _221 = ((mad(_189, _103, mad(_124, _107, (_118 * _102))) * _140) + _134) - _clippingSpaceMatrixRelativePosition.x;
    _222 = ((mad(_191, _103, mad(_126, _107, (_120 * _102))) * _140) + _136) - _clippingSpaceMatrixRelativePosition.y;
    _223 = ((mad(_193, _103, mad(_128, _107, (_122 * _102))) * _140) + _138) - _clippingSpaceMatrixRelativePosition.z;
    _239 = mad((_clippingSpaceMatrixRelativeTexScale[2].x), _223, mad((_clippingSpaceMatrixRelativeTexScale[1].x), _222, ((_clippingSpaceMatrixRelativeTexScale[0].x) * _221))) + (_clippingSpaceMatrixRelativeTexScale[3].x);
    _243 = mad((_clippingSpaceMatrixRelativeTexScale[2].y), _223, mad((_clippingSpaceMatrixRelativeTexScale[1].y), _222, ((_clippingSpaceMatrixRelativeTexScale[0].y) * _221))) + (_clippingSpaceMatrixRelativeTexScale[3].y);
    __3__36__0__0__g_topDownClippingSpace.GetDimensions(_245.x, _245.y);
    if (saturate(_239) == _239) {
      if (((saturate(_243) == _243) && (_239 > (1.0f / float((int)((int)(_245.x)))))) && (_243 > (1.0f / float((int)((int)(_245.y)))))) {
  // [sem: _3__36__0__0__g_topDownClippingSpace_sampleLod]
        _263 = __3__36__0__0__g_topDownClippingSpace.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_239, _243), 0.0f);
        if (_263.x > 0.0f) {
          _293 = (max(((_clippingSpaceMatrixRelativePosition.y - _136) + ((mad((_clippingSpaceMatrixRelativeInvTexScale[2].y), _263.x, mad((_clippingSpaceMatrixRelativeInvTexScale[1].y), _243, ((_clippingSpaceMatrixRelativeInvTexScale[0].y) * _239))) + (_clippingSpaceMatrixRelativeInvTexScale[3].y)) / (mad((_clippingSpaceMatrixRelativeInvTexScale[2].w), _263.x, mad((_clippingSpaceMatrixRelativeInvTexScale[1].w), _243, ((_clippingSpaceMatrixRelativeInvTexScale[0].w) * _239))) + (_clippingSpaceMatrixRelativeInvTexScale[3].w)))), 0.0f) - (_140 * _98)) + 0.3499999940395355f;
          _297 = select((_293 < -5.0f), 1.0f, _293);
        } else {
          _297 = 1.0f;
        }
      } else {
        _297 = 1.0f;
      }
    } else {
      _297 = 1.0f;
    }
  } else {
    _297 = 1.0f;
  }
  _303 = dot(float3(_viewDir.x, _viewDir.y, _viewDir.z), float3(_151, _152, _153));
  _309 = 1.0f - saturate(((_199 * 12.0f) + -15.0f) + (_303 * 0.0625f));
  if (_303 < (256.0f - (_199 * 192.0f))) {
    _313 = ((uint)(_115) >> 4) & 4095;
    if ((_313 != 4095) && (_treeParams.x > 0.0f)) {
      _322 = __3__37__0__0__g_treeWindDataBuffer[_313]._curr._windVector.x;
      _323 = __3__37__0__0__g_treeWindDataBuffer[_313]._curr._windVector.y;
      _324 = __3__37__0__0__g_treeWindDataBuffer[_313]._curr._windVector.z;
      _325 = __3__37__0__0__g_treeWindDataBuffer[_313]._curr._windVector.w;
      _327 = __3__37__0__0__g_treeWindDataBuffer[_313]._curr._windGlobal.x;
      _328 = __3__37__0__0__g_treeWindDataBuffer[_313]._curr._windGlobal.z;
      _329 = __3__37__0__0__g_treeWindDataBuffer[_313]._curr._windGlobal.w;
      _331 = __3__37__0__0__g_treeWindDataBuffer[_313]._curr._windGlobalData0.x;
      _332 = __3__37__0__0__g_treeWindDataBuffer[_313]._curr._windGlobalData0.y;
      _333 = __3__37__0__0__g_treeWindDataBuffer[_313]._curr._windGlobalData0.z;
      _334 = __3__37__0__0__g_treeWindDataBuffer[_313]._curr._windGlobalData0.w;
      _336 = __3__37__0__0__g_treeWindDataBuffer[_313]._curr._windBranchAndTwitch.x;
      _337 = __3__37__0__0__g_treeWindDataBuffer[_313]._curr._windBranchAndTwitch.z;
      _338 = __3__37__0__0__g_treeWindDataBuffer[_313]._curr._windBranchAndTwitch.w;
      _340 = __3__37__0__0__g_treeWindDataBuffer[_313]._curr._windBranchData0.x;
      _341 = __3__37__0__0__g_treeWindDataBuffer[_313]._curr._windBranchData0.y;
      _343 = __3__37__0__0__g_treeWindDataBuffer[_313]._curr._windLeaf1Data0.x;
      _344 = __3__37__0__0__g_treeWindDataBuffer[_313]._curr._windLeaf1Data0.z;
      _345 = __3__37__0__0__g_treeWindDataBuffer[_313]._curr._windLeaf1Data0.w;
      _347 = __3__37__0__0__g_treeWindDataBuffer[_313]._curr._windLeaf1Data1.x;
      _348 = __3__37__0__0__g_treeWindDataBuffer[_313]._curr._windLeaf1Data1.y;
      _349 = __3__37__0__0__g_treeWindDataBuffer[_313]._curr._windLeaf1Data1.z;
      _350 = __3__37__0__0__g_treeWindDataBuffer[_313]._curr._windLeaf1Data1.w;
      _352 = __3__37__0__0__g_treeWindDataBuffer[_313]._curr._windLeaf1Data2.x;
      _353 = __3__37__0__0__g_treeWindDataBuffer[_313]._curr._windLeaf1Data2.y;
      _354 = __3__37__0__0__g_treeWindDataBuffer[_313]._curr._windLeaf1Data2.z;
      _355 = __3__37__0__0__g_treeWindDataBuffer[_313]._curr._windLeaf1Data2.w;
      _357 = __3__37__0__0__g_treeWindDataBuffer[_313]._curr._windLeaf1Data3.x;
      _358 = __3__37__0__0__g_treeWindDataBuffer[_313]._curr._windLeaf1Data3.y;
      _360 = __3__37__0__0__g_treeWindDataBuffer[_313]._curr._windLeaf1Data4.x;
      _361 = __3__37__0__0__g_treeWindDataBuffer[_313]._curr._windLeaf1Data4.y;
      _362 = __3__37__0__0__g_treeWindDataBuffer[_313]._curr._windLeaf1Data4.z;
      _364 = __3__37__0__0__g_treeWindDataBuffer[_313]._prev._windVector.x;
      _365 = __3__37__0__0__g_treeWindDataBuffer[_313]._prev._windVector.y;
      _366 = __3__37__0__0__g_treeWindDataBuffer[_313]._prev._windVector.z;
      _367 = __3__37__0__0__g_treeWindDataBuffer[_313]._prev._windVector.w;
      _369 = __3__37__0__0__g_treeWindDataBuffer[_313]._prev._windGlobal.x;
      _370 = __3__37__0__0__g_treeWindDataBuffer[_313]._prev._windGlobal.z;
      _371 = __3__37__0__0__g_treeWindDataBuffer[_313]._prev._windGlobal.w;
      _373 = __3__37__0__0__g_treeWindDataBuffer[_313]._prev._windGlobalData0.x;
      _374 = __3__37__0__0__g_treeWindDataBuffer[_313]._prev._windGlobalData0.y;
      _375 = __3__37__0__0__g_treeWindDataBuffer[_313]._prev._windGlobalData0.z;
      _376 = __3__37__0__0__g_treeWindDataBuffer[_313]._prev._windGlobalData0.w;
      _378 = __3__37__0__0__g_treeWindDataBuffer[_313]._prev._windBranchAndTwitch.x;
      _379 = __3__37__0__0__g_treeWindDataBuffer[_313]._prev._windBranchAndTwitch.z;
      _380 = __3__37__0__0__g_treeWindDataBuffer[_313]._prev._windBranchAndTwitch.w;
      _382 = __3__37__0__0__g_treeWindDataBuffer[_313]._prev._windBranchData0.x;
      _383 = __3__37__0__0__g_treeWindDataBuffer[_313]._prev._windBranchData0.y;
      _385 = __3__37__0__0__g_treeWindDataBuffer[_313]._prev._windLeaf1Data0.x;
      _386 = __3__37__0__0__g_treeWindDataBuffer[_313]._prev._windLeaf1Data0.z;
      _387 = __3__37__0__0__g_treeWindDataBuffer[_313]._prev._windLeaf1Data0.w;
      _389 = __3__37__0__0__g_treeWindDataBuffer[_313]._prev._windLeaf1Data1.x;
      _390 = __3__37__0__0__g_treeWindDataBuffer[_313]._prev._windLeaf1Data1.y;
      _391 = __3__37__0__0__g_treeWindDataBuffer[_313]._prev._windLeaf1Data1.z;
      _392 = __3__37__0__0__g_treeWindDataBuffer[_313]._prev._windLeaf1Data1.w;
      _394 = __3__37__0__0__g_treeWindDataBuffer[_313]._prev._windLeaf1Data2.x;
      _395 = __3__37__0__0__g_treeWindDataBuffer[_313]._prev._windLeaf1Data2.y;
      _396 = __3__37__0__0__g_treeWindDataBuffer[_313]._prev._windLeaf1Data2.z;
      _397 = __3__37__0__0__g_treeWindDataBuffer[_313]._prev._windLeaf1Data2.w;
      _399 = __3__37__0__0__g_treeWindDataBuffer[_313]._prev._windLeaf1Data3.x;
      _400 = __3__37__0__0__g_treeWindDataBuffer[_313]._prev._windLeaf1Data3.y;
      _402 = __3__37__0__0__g_treeWindDataBuffer[_313]._prev._windLeaf1Data4.x;
      _403 = __3__37__0__0__g_treeWindDataBuffer[_313]._prev._windLeaf1Data4.y;
      _404 = __3__37__0__0__g_treeWindDataBuffer[_313]._prev._windLeaf1Data4.z;
      if (_303 < 64.0f) {
        _419 = (floor(_windFluidVolumeParams.z * _viewPos.x) + 0.5f) * _windFluidVolumeParams.y;
        _420 = (floor(_windFluidVolumeParams.z * _viewPos.y) + 0.5f) * _windFluidVolumeParams.y;
        _421 = (floor(_windFluidVolumeParams.z * _viewPos.z) + 0.5f) * _windFluidVolumeParams.y;
        _429 = _windFluidVolumeParams.x * 0.5f;
        _433 = (((_134 - _419) * _windFluidVolumeParams.z) + _429) / _windFluidVolumeParams.x;
        _434 = (((_136 - _420) * _windFluidVolumeParams.z) + _429) / _windFluidVolumeParams.x;
        _435 = (((_138 - _421) * _windFluidVolumeParams.z) + _429) / _windFluidVolumeParams.x;
        if (!(((_433 < 0.0f) || (_434 < 0.0f)) || (_435 < 0.0f))) {
          if (!(((_433 > 1.0f) || (_434 > 1.0f)) || (_435 > 1.0f))) {
  // [sem: _3__36__0__0__g_windFluidInteractionVelocityHistory_sampleLod]
            _450 = __3__36__0__0__g_windFluidInteractionVelocityHistory.SampleLevel(__0__95__0__0__g_samplerAnisotropicWrap, float3(_433, _434, _435), 0.0f);
            _455 = rsqrt(dot(float3(_450.x, _450.y, _450.z), float3(_450.x, _450.y, _450.z)));  // [sem: invLength]
            _461 = sqrt(((_450.x * _450.x) + (_450.y * _450.y)) + (_450.z * _450.z));
            if (!(_461 < 0.0010000000474974513f)) {
              _468 = (_455 * _450.x);
              _469 = (_455 * _450.y);
              _470 = (_455 * _450.z);
              _471 = _461;
            } else {
              _468 = 0.0f;
              _469 = 0.0f;
              _470 = 0.0f;
              _471 = 0.0f;
            }
          } else {
            _468 = 0.0f;
            _469 = 0.0f;
            _470 = 0.0f;
            _471 = 0.0f;
          }
        } else {
          _468 = 0.0f;
          _469 = 0.0f;
          _470 = 0.0f;
          _471 = 0.0f;
        }
        _484 = ((((_158 + _viewPos.x) - _419) * _windFluidVolumeParams.z) + _429) / _windFluidVolumeParams.x;
        _485 = ((((_159 + _viewPos.y) - _420) * _windFluidVolumeParams.z) + _429) / _windFluidVolumeParams.x;
        _486 = ((((_160 + _viewPos.z) - _421) * _windFluidVolumeParams.z) + _429) / _windFluidVolumeParams.x;
        if (!(((_484 < 0.0f) || (_485 < 0.0f)) || (_486 < 0.0f))) {
          if (!(((_484 > 1.0f) || (_485 > 1.0f)) || (_486 > 1.0f))) {
  // [sem: _3__36__0__0__g_windFluidInteractionVelocityHistoryPrev_sampleLod]
            _501 = __3__36__0__0__g_windFluidInteractionVelocityHistoryPrev.SampleLevel(__0__95__0__0__g_samplerAnisotropicWrap, float3(_484, _485, _486), 0.0f);
            _506 = rsqrt(dot(float3(_501.x, _501.y, _501.z), float3(_501.x, _501.y, _501.z)));  // [sem: invLength]
            _512 = sqrt(((_501.x * _501.x) + (_501.y * _501.y)) + (_501.z * _501.z));
            if (!(_512 < 0.0010000000474974513f)) {
              _519 = (_506 * _501.x);
              _520 = (_506 * _501.y);
              _521 = (_506 * _501.z);
              _522 = _512;
            } else {
              _519 = 0.0f;
              _520 = 0.0f;
              _521 = 0.0f;
              _522 = 0.0f;
            }
          } else {
            _519 = 0.0f;
            _520 = 0.0f;
            _521 = 0.0f;
            _522 = 0.0f;
          }
        } else {
          _519 = 0.0f;
          _520 = 0.0f;
          _521 = 0.0f;
          _522 = 0.0f;
        }
        _523 = saturate(_471);  // [sem: _471_sat]
        _530 = (_523 * (_468 - _322)) + _322;
        _531 = (_523 * (_469 - _323)) + _323;
        _532 = (_523 * (_470 - _324)) + _324;
        _534 = rsqrt(dot(float3(_530, _531, _532), float3(_530, _531, _532)));  // [sem: invLength]
        _541 = saturate(_522);  // [sem: _522_sat]
        _548 = (_541 * (_519 - _364)) + _364;
        _549 = (_541 * (_520 - _365)) + _365;
        _550 = (_541 * (_521 - _366)) + _366;
        _552 = rsqrt(dot(float3(_548, _549, _550), float3(_548, _549, _550)));  // [sem: invLength]
        _560 = (_548 * _552);
        _561 = (_549 * _552);
        _562 = (_550 * _552);
        _563 = ((_541 * (1.0f - _367)) + _367);
        _564 = (_530 * _534);
        _565 = (_531 * _534);
        _566 = (_532 * _534);
        _567 = ((_523 * (1.0f - _325)) + _325);
      } else {
        _560 = _364;
        _561 = _365;
        _562 = _366;
        _563 = _367;
        _564 = _322;
        _565 = _323;
        _566 = _324;
        _567 = _325;
      }
      _570 = mad(_122, _566, mad(_120, _565, (_564 * _118)));
      _573 = mad(_128, _566, mad(_126, _565, (_564 * _124)));
      _576 = mad(_193, _566, mad(_191, _565, (_564 * _189)));
      _578 = rsqrt(dot(float3(_570, _573, _576), float3(_570, _573, _576)));  // [sem: invLength]
      _579 = _578 * _570;
      _580 = _578 * _573;
      _581 = _578 * _576;
      _593 = _134 + 0.5f;
      _595 = _136 + 0.5f;
      _603 = abs((frac(_327 + _593) * 2.0f) + -1.0f);
      _604 = abs((frac((_327 * 0.800000011920929f) + _595) * 2.0f) + -1.0f);
      _616 = (((_604 * _604) * (3.0f - (_604 * 2.0f))) + -0.5f) * 2.0f;
      _619 = saturate(_567);  // [sem: _567_sat]
      _626 = (_619 * (_334 - _333)) + _333;
      _631 = (exp2(log2(saturate((_328 * 100.0f) * max((_98 - (0.0024999999441206455f / _328)), 0.0f))) * _329) * 0.009999999776482582f) * ((((_616 * _616) + ((((_603 * _603) * (3.0f - (_603 * 2.0f))) + -0.5f) * 2.0f)) * ((_619 * (_332 - _331)) + _331)) + select((!(_328 == 0.0f)), (_626 / _328), _626));
      _632 = _631 * _579;
      _633 = _631 * _581;
      _634 = _632 + _96;
      _635 = _633 + _97;
      _637 = rsqrt(dot(float3(_96, _98, _97), float3(_96, _98, _97)));  // [sem: invLength]
      _638 = _637 * _96;
      _639 = _637 * _98;
      _640 = _637 * _97;
      _642 = rsqrt(dot(float3(_634, _98, _635), float3(_634, _98, _635)));  // [sem: invLength]
      _643 = _634 * _642;
      _644 = _642 * _98;
      _645 = _635 * _642;
      _646 = dot(float3(_643, _644, _645), float3(_638, _639, _640));
      _651 = ((-0.8726646304130554f - ((_646 * _646) * 0.6981316804885864f)) * _646) + 1.5707963705062866f;
      if (_651 > 0.009999999776482582f) {
        _654 = _651 * 3.0f;
        _657 = (_644 * _640) - (_645 * _639);
        _660 = (_645 * _638) - (_643 * _640);
        _663 = (_643 * _639) - (_644 * _638);
        _664 = sin(_654);
        _665 = cos(_654);
        _666 = 1.0f - _665;
        _667 = _666 * _657;
        _670 = _667 * _660;
        _671 = _664 * _663;
        _673 = _666 * _663;
        _674 = _673 * _657;
        _675 = _664 * _660;
        _681 = _673 * _660;
        _682 = _664 * _657;
        _698 = mad(_174, (_674 - _675), mad(_173, (_670 + _671), ((_665 + (_667 * _657)) * _172)));
        _699 = mad(_174, (_681 + _682), mad(_173, (_665 + ((_660 * _660) * _666)), ((_670 - _671) * _172)));
        _700 = mad(_174, (_665 + (_673 * _663)), mad(_173, (_681 - _682), ((_674 + _675) * _172)));
      } else {
        _698 = _172;
        _699 = _173;
        _700 = _174;
      }
      _712 = (frac(_109 * 0.0625f) * 2.0f) + -1.0f;
      _713 = (frac(_109) * 2.0f) + -1.0f;
      _714 = (frac(_109 * 16.0f) * 2.0f) + -1.0f;
      _717 = _134 + _109;
      _718 = _336 + _717;
      _719 = _718 * _338;
      _733 = abs((frac(_718 + 0.5f) * 2.0f) + -1.0f);
      _734 = abs((frac(_719 + 0.5f) * 2.0f) + -1.0f);
      _735 = abs((frac((_719 * 0.5f) + 0.5f) * 2.0f) + -1.0f);
      _752 = ((((_734 * _734) * (3.0f - (_734 * 2.0f))) + -0.5f) * 4.0f) * (((_735 * _735) * (3.0f - (_735 * 2.0f))) + -0.5f);
      _753 = (_752 < 0.0f);
      _755 = select(_753, -1.0f, 1.0f);
      _756 = select(_753, (-0.0f - _752), _752);
      _759 = ((_755 - _752) * _756) + _752;
      _772 = rsqrt(dot(float3(_712, _713, _714), float3(_712, _713, _714))) * (_108 * 0.009999999776482582f);  // [sem: invLength]
      _773 = _772 * _712;
      _774 = ((((1.0f - _567) * _337) * (lerp(_759, _755, _756))) + (((1.0f - _337) * 2.0f) * (((_733 * _733) * (3.0f - (_733 * 2.0f))) + -0.5f))) * max(((_619 * (_341 - _340)) + _340), 1.0f);
      _776 = _772 * _714;
      _778 = _772 * _713;
      _781 = ((_115 & 14) == 2);
      if (_781) {
        _790 = dot(float3(((_134 * 0.009999999776482582f) + _102), ((_136 * 0.009999999776482582f) + _107), ((_138 * 0.009999999776482582f) + _103)), float3(10.0f, 10.0f, 10.0f));
        _799 = abs((frac((_343 + 0.5f) + dot(float3(_96, _98, _97), float3(10.0f, 10.0f, 10.0f))) * 2.0f) + -1.0f);
        _815 = (frac(_106 * 0.0625f) * 2.0f) + -1.0f;
        _816 = (frac(_106) * 2.0f) + -1.0f;
        _817 = (frac(_106 * 16.0f) * 2.0f) + -1.0f;
        _822 = (((((_567 * (_348 - _347)) + _347) * 2.0f) * (((_799 * _799) * (3.0f - (_799 * 2.0f))) + -0.5f)) * rsqrt(dot(float3(_815, _816, _817), float3(_815, _816, _817)))) * (_104 * 0.009999999776482582f);
        _850 = (frac(_105 * 0.0625f) * 2.0f) + -1.0f;
        _851 = (frac(_105) * 2.0f) + -1.0f;
        _852 = (frac(_105 * 16.0f) * 2.0f) + -1.0f;
        _854 = rsqrt(dot(float3(_850, _851, _852), float3(_850, _851, _852)));  // [sem: invLength]
        _855 = _854 * _850;
        _856 = _854 * _851;
        _857 = _852 * _854;
        _859 = _790 + 0.5f;
        _869 = abs((frac(_859 + _344) * 2.0f) + -1.0f);
        _870 = abs((frac(((_344 * 0.75f) + 0.5f) - _790) * 2.0f) + -1.0f);
        _881 = (((_869 * _869) * (3.0f - (_869 * 2.0f))) + -0.5f) * 2.0f;
        _882 = (((_870 * _870) * (3.0f - (_870 * 2.0f))) + -0.5f) * 2.0f;
        _883 = _96 - _102;
        _884 = _98 - _107;
        _885 = _97 - _103;
        _894 = _104 * 0.5f;
        _896 = (((_567 * (_353 - _352)) + _352) * _894) * ((_882 * _882) + _881);
        _897 = sin(_896);
        _898 = cos(_896);
        _899 = _897 * _855;
        _900 = _897 * _857;
        _901 = _897 * _856;
        _904 = (_857 * _581) - (_856 * _580);
        _910 = (_855 * _580) - (_857 * _579);
        _913 = min(max(dot(float3(_579, _580, _581), float3(_855, _857, _856)), -1.0f), 1.0f);
        _914 = _913 + ((_856 * _579) - (_855 * _581));
        _926 = _790 + (_345 * 0.009999999776482582f);
        _938 = abs((frac(((_790 * _790) + 0.5f) + _926) * 2.0f) + -1.0f);
        _939 = abs((frac((_926 * 0.8700000047683716f) + _859) * 2.0f) + -1.0f);
        _950 = (((_939 * _939) * (3.0f - (_939 * 2.0f))) + -0.5f) * 2.0f;
        _967 = ((((((-0.8726646304130554f - ((_913 * _913) * 0.6981316804885864f)) * _913) + 1.5707963705062866f) * ((_567 * (_355 - _354)) + _354)) + ((_882 - (_881 * _881)) * ((_567 * (_350 - _349)) + _349))) + ((((_567 * (_358 - _357)) + _357) * 0.009999999776482582f) * exp2(((_362 * 0.09999999403953552f) * (1.0f / ((_567 * (_361 - _360)) + _360))) * log2(saturate((((_950 * _950) * ((((_938 * _938) * (3.0f - (_938 * 2.0f))) + -0.5f) * 2.0f)) + 1.0f) * 0.5f))))) * _894;
        _969 = cos(_967);
        _970 = sin(_967) * rsqrt(dot(float3(_904, _914, _910), float3(_904, _914, _910)));
        _971 = _970 * _904;
        _972 = _970 * _914;
        _973 = _970 * _910;
        _988 = (((_969 * _899) - (_972 * _901)) + (_973 * _900)) + (_971 * _898);
        _991 = (((_969 * _900) - (_973 * _899)) + (_971 * _901)) + (_972 * _898);
        _994 = (((_969 * _901) - (_971 * _900)) + (_972 * _899)) + (_973 * _898);
        _997 = (_969 * _898) - dot(float3(_899, _900, _901), float3(_971, _972, _973));
        _998 = -0.0f - _988;
        _999 = -0.0f - _991;
        _1000 = -0.0f - _994;
        _1013 = ((_699 * _1000) - (_700 * _999)) + (_997 * _698);
        _1014 = ((_700 * _998) - (_698 * _1000)) + (_997 * _699);
        _1015 = ((_698 * _999) - (_699 * _998)) + (_997 * _700);
        _1017 = -0.0f - dot(float3(_698, _699, _700), float3(_998, _999, _1000));
        _1051 = ((_884 * _1000) - (_885 * _999)) + (_997 * _883);
        _1052 = ((_885 * _998) - (_883 * _1000)) + (_997 * _884);
        _1053 = ((_883 * _999) - (_884 * _998)) + (_997 * _885);
        _1055 = -0.0f - dot(float3(_883, _884, _885), float3(_998, _999, _1000));
        _1074 = ((_1051 * _997) + (_988 * _1055)) + ((_1053 * _991) - (_1052 * _994));
        _1075 = ((_1052 * _997) + (_991 * _1055)) + ((_1051 * _994) - (_1053 * _988));
        _1076 = ((_1053 * _997) + (_994 * _1055)) + ((_1052 * _988) - (_1051 * _991));
  // [sem: invLength]
        _1079 = rsqrt(dot(float3(_1074, _1075, _1076), float3(_1074, _1075, _1076))) * sqrt(((_885 * _885) + (_883 * _883)) + (_884 * _884));
        _1093 = (((_102 - _96) + (_822 * _815)) + (_1074 * _1079));
        _1094 = (((_107 - _98) + (_822 * _817)) + (_1075 * _1079));
        _1095 = (((_103 - _97) + (_822 * _816)) + (_1076 * _1079));
        _1096 = ((((_1013 * _997) + (_988 * _1017)) - (_1014 * _994)) + (_1015 * _991));
        _1097 = ((((_1014 * _997) + (_991 * _1017)) - (_1015 * _988)) + (_1013 * _994));
        _1098 = ((((_1015 * _997) + (_994 * _1017)) - (_1013 * _991)) + (_1014 * _988));
      } else {
        _1093 = 0.0f;
        _1094 = 0.0f;
        _1095 = 0.0f;
        _1096 = _698;
        _1097 = _699;
        _1098 = _700;
      }
      _1112 = mad(_122, _562, mad(_120, _561, (_560 * _118)));
      _1115 = mad(_128, _562, mad(_126, _561, (_560 * _124)));
      _1118 = mad(_193, _562, mad(_191, _561, (_560 * _189)));
      _1120 = rsqrt(dot(float3(_1112, _1115, _1118), float3(_1112, _1115, _1118)));  // [sem: invLength]
      _1121 = _1120 * _1112;
      _1122 = _1120 * _1115;
      _1123 = _1120 * _1118;
      _1143 = abs((frac(_369 + _593) * 2.0f) + -1.0f);
      _1144 = abs((frac((_369 * 0.800000011920929f) + _595) * 2.0f) + -1.0f);
      _1156 = (((_1144 * _1144) * (3.0f - (_1144 * 2.0f))) + -0.5f) * 2.0f;
      _1159 = saturate(_563);  // [sem: _563_sat]
      _1166 = (_1159 * (_376 - _375)) + _375;
      _1171 = (exp2(log2(saturate((_370 * 100.0f) * max((_98 - (0.0024999999441206455f / _370)), 0.0f))) * _371) * 0.009999999776482582f) * ((((_1156 * _1156) + ((((_1143 * _1143) * (3.0f - (_1143 * 2.0f))) + -0.5f) * 2.0f)) * ((_1159 * (_374 - _373)) + _373)) + select((!(_370 == 0.0f)), (_1166 / _370), _1166));
      _1177 = _378 + _717;
      _1178 = _1177 * _380;
      _1192 = abs((frac(_1177 + 0.5f) * 2.0f) + -1.0f);
      _1193 = abs((frac(_1178 + 0.5f) * 2.0f) + -1.0f);
      _1194 = abs((frac((_1178 * 0.5f) + 0.5f) * 2.0f) + -1.0f);
      _1211 = ((((_1193 * _1193) * (3.0f - (_1193 * 2.0f))) + -0.5f) * 4.0f) * (((_1194 * _1194) * (3.0f - (_1194 * 2.0f))) + -0.5f);
      _1212 = (_1211 < 0.0f);
      _1214 = select(_1212, -1.0f, 1.0f);
      _1215 = select(_1212, (-0.0f - _1211), _1211);
      _1218 = ((_1214 - _1211) * _1215) + _1211;
      _1230 = ((((1.0f - _563) * _379) * (lerp(_1218, _1214, _1215))) + (((1.0f - _379) * 2.0f) * (((_1192 * _1192) * (3.0f - (_1192 * 2.0f))) + -0.5f))) * max(((_1159 * (_383 - _382)) + _382), 1.0f);
      if (_781) {
        _1242 = dot(float3(((_134 * 0.009999999776482582f) + _102), ((_136 * 0.009999999776482582f) + _107), ((_138 * 0.009999999776482582f) + _103)), float3(10.0f, 10.0f, 10.0f));
        _1251 = abs((frac((_385 + 0.5f) + dot(float3(_96, _98, _97), float3(10.0f, 10.0f, 10.0f))) * 2.0f) + -1.0f);
        _1267 = (frac(_106 * 0.0625f) * 2.0f) + -1.0f;
        _1268 = (frac(_106) * 2.0f) + -1.0f;
        _1269 = (frac(_106 * 16.0f) * 2.0f) + -1.0f;
        _1274 = (((((_563 * (_390 - _389)) + _389) * 2.0f) * (((_1251 * _1251) * (3.0f - (_1251 * 2.0f))) + -0.5f)) * rsqrt(dot(float3(_1267, _1268, _1269), float3(_1267, _1268, _1269)))) * (_104 * 0.009999999776482582f);
        _1302 = (frac(_105 * 0.0625f) * 2.0f) + -1.0f;
        _1303 = (frac(_105) * 2.0f) + -1.0f;
        _1304 = (frac(_105 * 16.0f) * 2.0f) + -1.0f;
        _1306 = rsqrt(dot(float3(_1302, _1303, _1304), float3(_1302, _1303, _1304)));  // [sem: invLength]
        _1307 = _1306 * _1302;
        _1308 = _1306 * _1303;
        _1309 = _1304 * _1306;
        _1311 = _1242 + 0.5f;
        _1321 = abs((frac(_1311 + _386) * 2.0f) + -1.0f);
        _1322 = abs((frac(((_386 * 0.75f) + 0.5f) - _1242) * 2.0f) + -1.0f);
        _1333 = (((_1321 * _1321) * (3.0f - (_1321 * 2.0f))) + -0.5f) * 2.0f;
        _1334 = (((_1322 * _1322) * (3.0f - (_1322 * 2.0f))) + -0.5f) * 2.0f;
        _1335 = _96 - _102;
        _1336 = _98 - _107;
        _1337 = _97 - _103;
        _1346 = _104 * 0.5f;
        _1348 = (((_563 * (_395 - _394)) + _394) * _1346) * ((_1334 * _1334) + _1333);
        _1349 = sin(_1348);
        _1350 = cos(_1348);
        _1351 = _1349 * _1307;
        _1352 = _1349 * _1309;
        _1353 = _1349 * _1308;
        _1356 = (_1309 * _1123) - (_1308 * _1122);
        _1362 = (_1307 * _1122) - (_1309 * _1121);
        _1365 = min(max(dot(float3(_1121, _1122, _1123), float3(_1307, _1309, _1308)), -1.0f), 1.0f);
        _1366 = _1365 + ((_1308 * _1121) - (_1307 * _1123));
        _1378 = _1242 + (_387 * 0.009999999776482582f);
        _1390 = abs((frac(((_1242 * _1242) + 0.5f) + _1378) * 2.0f) + -1.0f);
        _1391 = abs((frac((_1378 * 0.8700000047683716f) + _1311) * 2.0f) + -1.0f);
        _1402 = (((_1391 * _1391) * (3.0f - (_1391 * 2.0f))) + -0.5f) * 2.0f;
        _1419 = ((((((-0.8726646304130554f - ((_1365 * _1365) * 0.6981316804885864f)) * _1365) + 1.5707963705062866f) * ((_563 * (_397 - _396)) + _396)) + ((_1334 - (_1333 * _1333)) * ((_563 * (_392 - _391)) + _391))) + ((((_563 * (_400 - _399)) + _399) * 0.009999999776482582f) * exp2(((_404 * 0.09999999403953552f) * (1.0f / ((_563 * (_403 - _402)) + _402))) * log2(saturate((((_1402 * _1402) * ((((_1390 * _1390) * (3.0f - (_1390 * 2.0f))) + -0.5f) * 2.0f)) + 1.0f) * 0.5f))))) * _1346;
        _1421 = cos(_1419);
        _1422 = sin(_1419) * rsqrt(dot(float3(_1356, _1366, _1362), float3(_1356, _1366, _1362)));
        _1423 = _1422 * _1356;
        _1424 = _1422 * _1366;
        _1425 = _1422 * _1362;
        _1440 = (((_1421 * _1351) - (_1424 * _1353)) + (_1425 * _1352)) + (_1423 * _1350);
        _1443 = (((_1421 * _1352) - (_1425 * _1351)) + (_1423 * _1353)) + (_1424 * _1350);
        _1446 = (((_1421 * _1353) - (_1423 * _1352)) + (_1424 * _1351)) + (_1425 * _1350);
        _1449 = (_1421 * _1350) - dot(float3(_1351, _1352, _1353), float3(_1423, _1424, _1425));
        _1450 = -0.0f - _1440;
        _1451 = -0.0f - _1443;
        _1452 = -0.0f - _1446;
        _1465 = ((_1336 * _1452) - (_1337 * _1451)) + (_1449 * _1335);
        _1466 = ((_1337 * _1450) - (_1335 * _1452)) + (_1449 * _1336);
        _1467 = ((_1335 * _1451) - (_1336 * _1450)) + (_1449 * _1337);
        _1469 = -0.0f - dot(float3(_1335, _1336, _1337), float3(_1450, _1451, _1452));
        _1488 = ((_1465 * _1449) + (_1440 * _1469)) + ((_1467 * _1443) - (_1466 * _1446));
        _1489 = ((_1466 * _1449) + (_1443 * _1469)) + ((_1465 * _1446) - (_1467 * _1440));
        _1490 = ((_1467 * _1449) + (_1446 * _1469)) + ((_1466 * _1440) - (_1465 * _1443));
  // [sem: invLength]
        _1493 = rsqrt(dot(float3(_1488, _1489, _1490), float3(_1488, _1489, _1490))) * sqrt(((_1337 * _1337) + (_1335 * _1335)) + (_1336 * _1336));
        _1507 = (((_102 - _96) + (_1274 * _1267)) + (_1488 * _1493));
        _1508 = (((_107 - _98) + (_1274 * _1269)) + (_1489 * _1493));
        _1509 = (((_103 - _97) + (_1274 * _1268)) + (_1490 * _1493));
      } else {
        _1507 = 0.0f;
        _1508 = 0.0f;
        _1509 = 0.0f;
      }
      _1522 = (((((_774 * _773) + _632) + _1093) * _309) + _96);
      _1523 = (((_1094 + (_774 * _776)) * _309) + _98);
      _1524 = (((((_774 * _778) + _633) + _1095) * _309) + _97);
      _1525 = (((((_1230 * _773) + (_1171 * _1121)) + _1507) * _309) + _96);
      _1526 = (((_1508 + (_1230 * _776)) * _309) + _98);
      _1527 = (((((_1230 * _778) + (_1171 * _1123)) + _1509) * _309) + _97);
      _1528 = _1096;
      _1529 = _1097;
      _1530 = _1098;
    } else {
      _1522 = _96;
      _1523 = _98;
      _1524 = _97;
      _1525 = _96;
      _1526 = _98;
      _1527 = _97;
      _1528 = _172;
      _1529 = _173;
      _1530 = _174;
    }
  } else {
    _1522 = _96;
    _1523 = _98;
    _1524 = _97;
    _1525 = _96;
    _1526 = _98;
    _1527 = _97;
    _1528 = _172;
    _1529 = _173;
    _1530 = _174;
  }
  // RenoDX: >>> [Patch: FoliageSpeedTreeWindCoherence] [Version: 1.09]
  // Description: Fixes Ultra/Cinematic foliage SpeedTree shadow flicker by falling back when current and previous winded positions diverge by 1+ unit; the coherence comparison also fails for NaN deltas.
  if (FOLIAGE_SPEEDTREE_WIND_COHERENCE == 1.f) {
    const float3 _renodxGrassBasePosition = float3(_96, _98, _97);
    const float3 _renodxGrassBaseNormal = float3(_172, _173, _174);
    const float3 _renodxGrassCurrentPosition = float3(_1522, _1523, _1524);
    const float3 _renodxGrassPreviousPosition = float3(_1525, _1526, _1527);
    const float3 _renodxGrassWindDelta = _renodxGrassCurrentPosition - _renodxGrassPreviousPosition;
    const bool _renodxGrassWindCoherent = dot(_renodxGrassWindDelta, _renodxGrassWindDelta) < 1.0f;
    if (!_renodxGrassWindCoherent) {
      _1522 = _renodxGrassBasePosition.x;
      _1523 = _renodxGrassBasePosition.y;
      _1524 = _renodxGrassBasePosition.z;
      _1525 = _renodxGrassBasePosition.x;
      _1526 = _renodxGrassBasePosition.y;
      _1527 = _renodxGrassBasePosition.z;
      _1528 = _renodxGrassBaseNormal.x;
      _1529 = _renodxGrassBaseNormal.y;
      _1530 = _renodxGrassBaseNormal.z;
    }
  }
  // RenoDX: <<< [Patch: FoliageSpeedTreeWindCoherence]
  _1533 = mad(_189, _1524, mad(_124, _1523, (_1522 * _118)));
  _1536 = mad(_191, _1524, mad(_126, _1523, (_1522 * _120)));
  _1539 = mad(_193, _1524, mad(_128, _1523, (_1522 * _122)));
  _1543 = (_1533 * _140) + _151;
  _1544 = (_1536 * _140) + _152;
  _1545 = (_1539 * _140) + _153;
  _1551 = mad(_191, _1527, mad(_126, _1526, (_1525 * _120)));
  _1558 = (mad(_189, _1527, mad(_124, _1526, (_1525 * _118))) * _140) + _158;
  _1559 = (_1551 * _140) + _159;
  _1560 = (mad(_193, _1527, mad(_128, _1526, (_1525 * _122))) * _140) + _160;
  _1563 = mad(_189, _1530, mad(_124, _1529, (_1528 * _118)));
  _1566 = mad(_191, _1530, mad(_126, _1529, (_1528 * _120)));
  _1569 = mad(_193, _1530, mad(_128, _1529, (_1528 * _122)));
  if ((_303 < 64.0f) && (_treeParams.z > 0.0f)) {
    _1578 = mad(_189, _103, mad(_124, _107, (_118 * _102)));
    _1581 = mad(_191, _103, mad(_126, _107, (_120 * _102)));
    _1584 = mad(_193, _103, mad(_128, _107, (_122 * _102)));
    _1588 = (_1578 * _140) + _151;
    _1589 = (_1581 * _140) + _152;
    _1590 = (_1584 * _140) + _153;
    _1591 = ((_141 & 1) == 0);
    if (!_1591) {
      _1596 = (_viewPos.x - (_sceneCaptureTopDown[0]._captureMatrixRelativePosition.x)) + _1588;
      _1599 = (_viewPos.z - (_sceneCaptureTopDown[0]._captureMatrixRelativePosition.z)) + _1590;
      _1611 = (_sceneCaptureTopDown[0]._captureMatrixRelativeTexScale[3].x) + mad((_sceneCaptureTopDown[0]._captureMatrixRelativeTexScale[2].x), _1599, (_1596 * (_sceneCaptureTopDown[0]._captureMatrixRelativeTexScale[0].x)));
      _1614 = mad((_sceneCaptureTopDown[0]._captureMatrixRelativeTexScale[2].y), _1599, (_1596 * (_sceneCaptureTopDown[0]._captureMatrixRelativeTexScale[0].y))) + (_sceneCaptureTopDown[0]._captureMatrixRelativeTexScale[3].y);
      if (_142 == 0) {
        __3__36__0__0__g_topDownTerrainNormal.GetDimensions(_1618.x, _1618.y);
        _1625 = float((int)(int(float((int)((int)(_1618.x))))));
        _1626 = float((int)(int(float((int)((int)(_1618.y))))));
        if (!(((((uint4)(__3__36__0__0__g_topDownTerrainNormal.Load(int3(int(_1625 * _1611), int(_1626 * _1614), 0)))).z) & 1023) == 0) | !(saturate(_1611) == _1611) | !(((saturate(_1614) == _1614) && (_1611 > (1.0f / _1625))) && (_1614 > (1.0f / _1626)))) {
          _1663 = mad((_sceneCaptureTopDown[0]._captureMatrixInv[2].y), ((__3__36__0__0__g_topDownTerrainDepth.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_1611, _1614), 0.0f)).x), mad((_sceneCaptureTopDown[0]._captureMatrixInv[1].y), _1614, ((_sceneCaptureTopDown[0]._captureMatrixInv[0].y) * _1611))) + (_sceneCaptureTopDown[0]._captureMatrixInv[3].y);
          if (!(abs((_149 - _1589) + _1663) > 1.0f)) {
            _1741 = ((((_1536 - _1581) * _140) - _viewPos.y) + _1663);
            _1742 = ((((_1551 - _1581) * _140) - _viewPosPrev.y) + _1663);
            if (_303 < 48.0f) {
              _1747 = __3__37__0__0__g_indirectDrawParametersBuffer[_drawIndex]._bindlessMaterialParametersViewIndex;
              if (!(((BindlessParameters_MaterialOverrideParametersTree[NonUniformResourceIndex(((int)((uint)(select(((uint)_1747 < (uint)170000), _1747, 0)) + 0u)))].BindlessParameters_MaterialOverrideParametersTree._materialInfo) & 512) == 0)) {
                _1763 = (saturate(_treeParams.y) * 0.9424778819084167f);
              } else {
                _1763 = 0.9424778819084167f;
              }
              if ((uint)((_115 & 15) + -1) < (uint)2) {
                _1778 = (frac(_105 * 0.0625f) * 2.0f) + -1.0f;
                _1779 = (frac(_105) * 2.0f) + -1.0f;
                _1780 = (frac(_105 * 16.0f) * 2.0f) + -1.0f;
                _1782 = rsqrt(dot(float3(_1778, _1779, _1780), float3(_1778, _1779, _1780)));  // [sem: invLength]
                _1783 = _1782 * _1778;
                _1784 = _1782 * _1779;
                _1785 = _1780 * _1782;
                _1788 = mad(_189, _1784, mad(_124, _1785, (_1783 * _118)));
                _1791 = mad(_191, _1784, mad(_126, _1785, (_1783 * _120)));
                _1794 = mad(_193, _1784, mad(_128, _1785, (_1783 * _122)));
                _1796 = rsqrt(dot(float3(_1788, _1791, _1794), float3(_1788, _1791, _1794)));  // [sem: invLength]
                _1797 = _1796 * _1788;
                _1798 = _1796 * _1791;
                _1799 = _1796 * _1794;
                _1806 = _renderingOriginPos.y - _viewPos.y;
                _1813 = (int)(uint)((int)(((_1806 + -2.0f) < _1589) && ((_renderingOriginPos.w == 0.0f) && ((_1806 + 1.0f) > _1589))));
                _1823 = (_viewPos.x - _currSceneTrailHeight._trailUpdatedPosition.x) + _1588;
                _1824 = (_viewPos.y - _currSceneTrailHeight._trailUpdatedPosition.y) + _1589;
                _1825 = (_viewPos.z - _currSceneTrailHeight._trailUpdatedPosition.z) + _1590;
                _1841 = mad((_currSceneTrailHeight._trailViewProjTexScale[2].x), _1825, mad((_currSceneTrailHeight._trailViewProjTexScale[1].x), _1824, (_1823 * (_currSceneTrailHeight._trailViewProjTexScale[0].x)))) + (_currSceneTrailHeight._trailViewProjTexScale[3].x);
                _1845 = mad((_currSceneTrailHeight._trailViewProjTexScale[2].y), _1825, mad((_currSceneTrailHeight._trailViewProjTexScale[1].y), _1824, (_1823 * (_currSceneTrailHeight._trailViewProjTexScale[0].y)))) + (_currSceneTrailHeight._trailViewProjTexScale[3].y);
                _1847 = (saturate(_1841) == _1841);
                if (_1847) {
                  [branch]
                  if (saturate(_1845) == _1845) {
  // [sem: _3__36__0__0__g_textureTrailHeight_sampleLod]
                    _1854 = __3__36__0__0__g_textureTrailHeight.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_1841, _1845), 0.0f);
                    if (_1854.x < 1.0f) {
                      _1886 = ((int)(uint)((int)((((_currSceneTrailHeight._trailUpdatedPosition.y + -1.0f) - _viewPos.y) + ((mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].y), _1854.x, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].y), _1845, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].y) * _1841))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].y)) / (mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].w), _1854.x, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].w), _1845, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].w) * _1841))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].w)))) < _1589)));
                    } else {
                      _1886 = 0;
                    }
                    if ((_1854.y < 1.0f) && (_1854.y > 0.0f)) {
                      _1919 = (((int)(uint)((int)((((_currSceneTrailHeight._trailUpdatedPosition.y + 0.20000000298023224f) - _viewPos.y) + ((mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].y), _1854.y, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].y), _1845, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].y) * _1841))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].y)) / (mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].w), _1854.y, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].w), _1845, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].w) * _1841))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].w)))) > _1589))) & _1886);
                    } else {
                      _1919 = 0;
                    }
                    _1922 = (_1919 | _1813);
                  } else {
                    _1922 = _1813;
                  }
                } else {
                  _1922 = _1813;
                }
                if (!(_1922 == 0)) {
                  _1932 = (_viewPos.x + _1588) - _currSceneTrailInteraction._trailUpdatedPosition.x;
                  _1933 = (_viewPos.y + _1589) - _currSceneTrailInteraction._trailUpdatedPosition.y;
                  _1934 = (_viewPos.z + _1590) - _currSceneTrailInteraction._trailUpdatedPosition.z;
                  _1950 = mad((_currSceneTrailInteraction._trailViewProjTexScale[2].x), _1934, mad((_currSceneTrailInteraction._trailViewProjTexScale[1].x), _1933, ((_currSceneTrailInteraction._trailViewProjTexScale[0].x) * _1932))) + (_currSceneTrailInteraction._trailViewProjTexScale[3].x);
                  _1954 = mad((_currSceneTrailInteraction._trailViewProjTexScale[2].y), _1934, mad((_currSceneTrailInteraction._trailViewProjTexScale[1].y), _1933, ((_currSceneTrailInteraction._trailViewProjTexScale[0].y) * _1932))) + (_currSceneTrailInteraction._trailViewProjTexScale[3].y);
                  if (saturate(_1950) == _1950) {
                    [branch]
                    if (saturate(_1954) == _1954) {
  // [sem: _3__36__0__0__g_textureTrailInteraction_sampleLod]
                      _1963 = __3__36__0__0__g_textureTrailInteraction.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_1950, _1954), 0.0f);
                      _1969 = (_1963.x * 2.0f) + -1.0f;
                      _1970 = (_1963.y * 2.0f) + -1.0f;
                      _1972 = rsqrt(dot(float2(_1969, _1970), float2(_1969, _1970)));  // [sem: invLength]
                      _1973 = _1969 * _1972;
                      _1974 = _1970 * _1972;
                      _1975 = saturate(_1963.w);  // [sem: expr_sat]
                      if (_1975 > 0.0f) {
                        _1979 = sin(_time.x * 7.0f);
                        _1984 = -0.0f - (_1798 * _1974);
                        _1987 = (_1974 * _1797) - (_1973 * _1799);
                        _1988 = _1973 * _1798;
                        _1990 = rsqrt(dot(float3(_1984, _1987, _1988), float3(_1984, _1987, _1988)));  // [sem: invLength]
                        _1991 = _1990 * _1984;
                        _1992 = _1990 * _1987;
                        _1993 = _1990 * _1988;
                        _1995 = (_1975 * _1763) * (lerp(_1979, 1.0f, _1975));
                        _2001 = dot(float3(_1991, _1992, _1993), float3(((_1533 - _1578) * _140), (_1741 - _1589), ((_1539 - _1584) * _140)));
                        _2005 = (_1991 * _2001) + _1588;
                        _2006 = (_1992 * _2001) + _1589;
                        _2007 = (_1993 * _2001) + _1590;
                        _2008 = _1543 - _2005;
                        _2009 = _1741 - _2006;
                        _2010 = _1545 - _2007;
                        _2020 = sin(_1995);
                        _2021 = cos(_1995);
                        _2038 = (((_2005 - _1543) + (_2008 * _2021)) + (((_2009 * _1993) - (_2010 * _1992)) * _2020));
                        _2039 = (((_2006 - _1741) + (_2009 * _2021)) + (((_2010 * _1991) - (_2008 * _1993)) * _2020));
                        _2040 = (((_2007 - _1545) + (_2010 * _2021)) + (((_2008 * _1992) - (_2009 * _1991)) * _2020));
                      } else {
                        _2038 = 0.0f;
                        _2039 = 0.0f;
                        _2040 = 0.0f;
                      }
                    } else {
                      _2038 = 0.0f;
                      _2039 = 0.0f;
                      _2040 = 0.0f;
                    }
                  } else {
                    _2038 = 0.0f;
                    _2039 = 0.0f;
                    _2040 = 0.0f;
                  }
                } else {
                  _2038 = 0.0f;
                  _2039 = 0.0f;
                  _2040 = 0.0f;
                }
                if (_1847) {
                  [branch]
                  if (saturate(_1845) == _1845) {
  // [sem: _3__36__0__0__g_textureTrailHeight_sampleLod]
                    _2053 = __3__36__0__0__g_textureTrailHeight.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_1841, _1845), 0.0f);
                    if (_2053.x < 1.0f) {
                      _2085 = ((int)(uint)((int)((((_currSceneTrailHeight._trailUpdatedPosition.y + -1.0f) - _viewPos.y) + ((mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].y), _2053.x, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].y), _1845, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].y) * _1841))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].y)) / (mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].w), _2053.x, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].w), _1845, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].w) * _1841))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].w)))) < _1589)));
                    } else {
                      _2085 = 0;
                    }
                    if ((_2053.y < 1.0f) && (_2053.y > 0.0f)) {
                      _2118 = (((int)(uint)((int)((((_currSceneTrailHeight._trailUpdatedPosition.y + 0.20000000298023224f) - _viewPos.y) + ((mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].y), _2053.y, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].y), _1845, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].y) * _1841))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].y)) / (mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].w), _2053.y, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].w), _1845, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].w) * _1841))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].w)))) > _1589))) & _2085);
                    } else {
                      _2118 = 0;
                    }
                    _2121 = (_2118 | _1813);
                  } else {
                    _2121 = _1813;
                  }
                } else {
                  _2121 = _1813;
                }
                if (!(_2121 == 0)) {
                  _2131 = (_viewPos.x + _1588) - _prevSceneTrailInteraction._trailUpdatedPosition.x;
                  _2132 = (_viewPos.y + _1589) - _prevSceneTrailInteraction._trailUpdatedPosition.y;
                  _2133 = (_viewPos.z + _1590) - _prevSceneTrailInteraction._trailUpdatedPosition.z;
                  _2149 = mad((_prevSceneTrailInteraction._trailViewProjTexScale[2].x), _2133, mad((_prevSceneTrailInteraction._trailViewProjTexScale[1].x), _2132, ((_prevSceneTrailInteraction._trailViewProjTexScale[0].x) * _2131))) + (_prevSceneTrailInteraction._trailViewProjTexScale[3].x);
                  _2153 = mad((_prevSceneTrailInteraction._trailViewProjTexScale[2].y), _2133, mad((_prevSceneTrailInteraction._trailViewProjTexScale[1].y), _2132, ((_prevSceneTrailInteraction._trailViewProjTexScale[0].y) * _2131))) + (_prevSceneTrailInteraction._trailViewProjTexScale[3].y);
                  if (saturate(_2149) == _2149) {
                    [branch]
                    if (saturate(_2153) == _2153) {
  // [sem: _3__36__0__0__g_textureTrailInteractionPrev_sampleLod]
                      _2162 = __3__36__0__0__g_textureTrailInteractionPrev.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_2149, _2153), 0.0f);
                      _2168 = (_2162.x * 2.0f) + -1.0f;
                      _2169 = (_2162.y * 2.0f) + -1.0f;
                      _2171 = rsqrt(dot(float2(_2168, _2169), float2(_2168, _2169)));  // [sem: invLength]
                      _2172 = _2168 * _2171;
                      _2173 = _2169 * _2171;
                      _2174 = saturate(_2162.w);  // [sem: expr_sat]
                      if (_2174 > 0.0f) {
                        _2178 = sin(_time.y * 7.0f);
                        _2183 = -0.0f - (_1798 * _2173);
                        _2186 = (_2173 * _1797) - (_2172 * _1799);
                        _2187 = _2172 * _1798;
                        _2189 = rsqrt(dot(float3(_2183, _2186, _2187), float3(_2183, _2186, _2187)));  // [sem: invLength]
                        _2190 = _2189 * _2183;
                        _2191 = _2189 * _2186;
                        _2192 = _2189 * _2187;
                        _2194 = (_2174 * _1763) * (lerp(_2178, 1.0f, _2174));
                        _2200 = dot(float3(_2190, _2191, _2192), float3(((_1533 - _1578) * _140), (_1741 - _1589), ((_1539 - _1584) * _140)));
                        _2204 = (_2190 * _2200) + _1588;
                        _2205 = (_2191 * _2200) + _1589;
                        _2206 = (_2192 * _2200) + _1590;
                        _2207 = _1543 - _2204;
                        _2208 = _1741 - _2205;
                        _2209 = _1545 - _2206;
                        _2219 = sin(_2194);
                        _2220 = cos(_2194);
                        _2237 = (((_2204 - _1543) + (_2207 * _2220)) + (((_2208 * _2192) - (_2209 * _2191)) * _2219));
                        _2238 = (((_2205 - _1741) + (_2208 * _2220)) + (((_2209 * _2190) - (_2207 * _2192)) * _2219));
                        _2239 = (((_2206 - _1545) + (_2209 * _2220)) + (((_2207 * _2191) - (_2208 * _2190)) * _2219));
                      } else {
                        _2237 = 0.0f;
                        _2238 = 0.0f;
                        _2239 = 0.0f;
                      }
                    } else {
                      _2237 = 0.0f;
                      _2238 = 0.0f;
                      _2239 = 0.0f;
                    }
                  } else {
                    _2237 = 0.0f;
                    _2238 = 0.0f;
                    _2239 = 0.0f;
                  }
                } else {
                  _2237 = 0.0f;
                  _2238 = 0.0f;
                  _2239 = 0.0f;
                }
                _2247 = ((_2237 * _309) + _1558);
                _2248 = ((_2238 * _309) + _1742);
                _2249 = ((_2239 * _309) + _1560);
                _2250 = ((_2038 * _309) + _1543);
                _2251 = ((_2039 * _309) + _1741);
                _2252 = ((_2040 * _309) + _1545);
              } else {
                _2247 = _1558;
                _2248 = _1742;
                _2249 = _1560;
                _2250 = _1543;
                _2251 = _1741;
                _2252 = _1545;
              }
              _2818 = _2250;
              _2819 = _2251;
              _2820 = _2252;
              _2821 = _2247;
              _2822 = _2248;
              _2823 = _2249;
            } else {
              _2818 = _1543;
              _2819 = _1741;
              _2820 = _1545;
              _2821 = _1558;
              _2822 = _1742;
              _2823 = _1560;
            }
            _2847 = mad((_viewProjRelativePrev[2].x), _2823, mad((_viewProjRelativePrev[1].x), _2822, ((_viewProjRelativePrev[0].x) * _2821))) + (_viewProjRelativePrev[3].x);
            _2851 = mad((_viewProjRelativePrev[2].y), _2823, mad((_viewProjRelativePrev[1].y), _2822, ((_viewProjRelativePrev[0].y) * _2821))) + (_viewProjRelativePrev[3].y);
            _2855 = mad((_viewProjRelativePrev[2].z), _2823, mad((_viewProjRelativePrev[1].z), _2822, ((_viewProjRelativePrev[0].z) * _2821))) + (_viewProjRelativePrev[3].z);
            _2859 = mad((_viewProjRelativePrev[2].w), _2823, mad((_viewProjRelativePrev[1].w), _2822, ((_viewProjRelativePrev[0].w) * _2821))) + (_viewProjRelativePrev[3].w);
            _2883 = mad((_viewProjRelative[2].x), _2820, mad((_viewProjRelative[1].x), _2819, ((_viewProjRelative[0].x) * _2818))) + (_viewProjRelative[3].x);
            _2887 = mad((_viewProjRelative[2].y), _2820, mad((_viewProjRelative[1].y), _2819, ((_viewProjRelative[0].y) * _2818))) + (_viewProjRelative[3].y);
            _2891 = mad((_viewProjRelative[2].z), _2820, mad((_viewProjRelative[1].z), _2819, ((_viewProjRelative[0].z) * _2818))) + (_viewProjRelative[3].z);
            _2895 = mad((_viewProjRelative[2].w), _2820, mad((_viewProjRelative[1].w), _2819, ((_viewProjRelative[0].w) * _2818))) + (_viewProjRelative[3].w);
            _2897 = rsqrt(dot(float3(_1563, _1566, _1569), float3(_1563, _1566, _1569)));  // [sem: invLength]
            _2901 = half(_2897 * _1563);
            _2902 = half(_2897 * _1566);
            _2903 = half(_2897 * _1569);
            _2906 = half((((float)((uint16_t)((uint)(_71 & 255)))) * 0.003921568859368563f) * min(2.0f, _140));
            _2907 = _drawIndex | -16777216;
            _2911 = select((_variableRateShadingParams.x > 0.0f), 5, 0);
            if ((SV_VertexID != 0) && (((int)(SV_VertexID % 40)) == 0)) {
              if (sqrt(((_2819 * _2819) + (_2818 * _2818)) + (_2820 * _2820)) < 4.0f) {
                __3__39__0__1__g_treeSurfacePositionsCounterBufferUAV.InterlockedAdd(0, 1, _2926);
                if ((uint)_2926 < (uint)1024) {
                  TreeSurfacePositionData __struct_store_0;
                  __struct_store_0._worldPos = float4((_viewPos.x + _2818), (_viewPos.y + _2819), (_viewPos.z + _2820), 1.0f);
                  __struct_store_0._worldPosPrev = float4((_viewPosPrev.x + _2821), (_viewPosPrev.y + _2822), (_viewPosPrev.z + _2823), 1.0f);
                  __3__39__0__1__g_treeSurfacePositionsBufferUAV[_2926] = __struct_store_0;
                  _2945 = _98;
                  _2946 = _2847;
                  _2947 = _2851;
                  _2948 = _2855;
                  _2949 = _2859;
                  _2950 = _2901;
                  _2951 = _2902;
                  _2952 = _2903;
                  _2953 = _2906;
                  _2954 = _2907;
                  _2955 = _297;
                  _2956 = _2911;
                  _2957 = _2883;
                  _2958 = _2887;
                  _2959 = _2891;
                  _2960 = _2895;
                } else {
                  _2945 = _98;
                  _2946 = _2847;
                  _2947 = _2851;
                  _2948 = _2855;
                  _2949 = _2859;
                  _2950 = _2901;
                  _2951 = _2902;
                  _2952 = _2903;
                  _2953 = _2906;
                  _2954 = _2907;
                  _2955 = _297;
                  _2956 = _2911;
                  _2957 = _2883;
                  _2958 = _2887;
                  _2959 = _2891;
                  _2960 = _2895;
                }
              } else {
                _2945 = _98;
                _2946 = _2847;
                _2947 = _2851;
                _2948 = _2855;
                _2949 = _2859;
                _2950 = _2901;
                _2951 = _2902;
                _2952 = _2903;
                _2953 = _2906;
                _2954 = _2907;
                _2955 = _297;
                _2956 = _2911;
                _2957 = _2883;
                _2958 = _2887;
                _2959 = _2891;
                _2960 = _2895;
              }
            } else {
              _2945 = _98;
              _2946 = _2847;
              _2947 = _2851;
              _2948 = _2855;
              _2949 = _2859;
              _2950 = _2901;
              _2951 = _2902;
              _2952 = _2903;
              _2953 = _2906;
              _2954 = _2907;
              _2955 = _297;
              _2956 = _2911;
              _2957 = _2883;
              _2958 = _2887;
              _2959 = _2891;
              _2960 = _2895;
            }
          } else {
            _2945 = 0.0f;
            _2946 = 0.0f;
            _2947 = 0.0f;
            _2948 = 0.0f;
            _2949 = 0.0f;
            _2950 = 0.0h;
            _2951 = 0.0h;
            _2952 = 0.0h;
            _2953 = 0.0h;
            _2954 = 0;
            _2955 = 0.0f;
            _2956 = 0;
            _2957 = +1.#INF;
            _2958 = +1.#INF;
            _2959 = +1.#INF;
            _2960 = +1.#INF;
          }
        } else {
          _2945 = 0.0f;
          _2946 = 0.0f;
          _2947 = 0.0f;
          _2948 = 0.0f;
          _2949 = 0.0f;
          _2950 = 0.0h;
          _2951 = 0.0h;
          _2952 = 0.0h;
          _2953 = 0.0h;
          _2954 = 0;
          _2955 = 0.0f;
          _2956 = 0;
          _2957 = +1.#INF;
          _2958 = +1.#INF;
          _2959 = +1.#INF;
          _2960 = +1.#INF;
        }
      } else {
        if (_142 == 1) {
          __3__36__0__0__g_topDownTerrainObjectNormal.GetDimensions(_1681.x, _1681.y);
          _1688 = float((int)(int(float((int)((int)(_1681.x))))));
          _1689 = float((int)(int(float((int)((int)(_1681.y))))));
          if (!(((((uint4)(__3__36__0__0__g_topDownTerrainObjectNormal.Load(int3(int(_1688 * _1611), int(_1689 * _1614), 0)))).z) & 1023) == 0) | !(saturate(_1611) == _1611) | !(((saturate(_1614) == _1614) && (_1611 > (1.0f / _1688))) && (_1614 > (1.0f / _1689)))) {
            _1726 = mad((_sceneCaptureTopDown[0]._captureMatrixInv[2].y), ((__3__36__0__0__g_topDownTerrainObjectDepth.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_1611, _1614), 0.0f)).x), mad((_sceneCaptureTopDown[0]._captureMatrixInv[1].y), _1614, ((_sceneCaptureTopDown[0]._captureMatrixInv[0].y) * _1611))) + (_sceneCaptureTopDown[0]._captureMatrixInv[3].y);
            if (!(abs((_149 - _1589) + _1726) > 1.0f)) {
              _1741 = ((((_1536 - _1581) * _140) - _viewPos.y) + _1726);
              _1742 = ((((_1551 - _1581) * _140) - _viewPosPrev.y) + _1726);
              if (_303 < 48.0f) {
                _1747 = __3__37__0__0__g_indirectDrawParametersBuffer[_drawIndex]._bindlessMaterialParametersViewIndex;
                if (!(((BindlessParameters_MaterialOverrideParametersTree[NonUniformResourceIndex(((int)((uint)(select(((uint)_1747 < (uint)170000), _1747, 0)) + 0u)))].BindlessParameters_MaterialOverrideParametersTree._materialInfo) & 512) == 0)) {
                  _1763 = (saturate(_treeParams.y) * 0.9424778819084167f);
                } else {
                  _1763 = 0.9424778819084167f;
                }
                if ((uint)((_115 & 15) + -1) < (uint)2) {
                  _1778 = (frac(_105 * 0.0625f) * 2.0f) + -1.0f;
                  _1779 = (frac(_105) * 2.0f) + -1.0f;
                  _1780 = (frac(_105 * 16.0f) * 2.0f) + -1.0f;
                  _1782 = rsqrt(dot(float3(_1778, _1779, _1780), float3(_1778, _1779, _1780)));  // [sem: invLength]
                  _1783 = _1782 * _1778;
                  _1784 = _1782 * _1779;
                  _1785 = _1780 * _1782;
                  _1788 = mad(_189, _1784, mad(_124, _1785, (_1783 * _118)));
                  _1791 = mad(_191, _1784, mad(_126, _1785, (_1783 * _120)));
                  _1794 = mad(_193, _1784, mad(_128, _1785, (_1783 * _122)));
                  _1796 = rsqrt(dot(float3(_1788, _1791, _1794), float3(_1788, _1791, _1794)));  // [sem: invLength]
                  _1797 = _1796 * _1788;
                  _1798 = _1796 * _1791;
                  _1799 = _1796 * _1794;
                  _1806 = _renderingOriginPos.y - _viewPos.y;
                  _1813 = (int)(uint)((int)(((_1806 + -2.0f) < _1589) && ((_renderingOriginPos.w == 0.0f) && ((_1806 + 1.0f) > _1589))));
                  _1823 = (_viewPos.x - _currSceneTrailHeight._trailUpdatedPosition.x) + _1588;
                  _1824 = (_viewPos.y - _currSceneTrailHeight._trailUpdatedPosition.y) + _1589;
                  _1825 = (_viewPos.z - _currSceneTrailHeight._trailUpdatedPosition.z) + _1590;
                  _1841 = mad((_currSceneTrailHeight._trailViewProjTexScale[2].x), _1825, mad((_currSceneTrailHeight._trailViewProjTexScale[1].x), _1824, (_1823 * (_currSceneTrailHeight._trailViewProjTexScale[0].x)))) + (_currSceneTrailHeight._trailViewProjTexScale[3].x);
                  _1845 = mad((_currSceneTrailHeight._trailViewProjTexScale[2].y), _1825, mad((_currSceneTrailHeight._trailViewProjTexScale[1].y), _1824, (_1823 * (_currSceneTrailHeight._trailViewProjTexScale[0].y)))) + (_currSceneTrailHeight._trailViewProjTexScale[3].y);
                  _1847 = (saturate(_1841) == _1841);
                  if (_1847) {
                    [branch]
                    if (saturate(_1845) == _1845) {
  // [sem: _3__36__0__0__g_textureTrailHeight_sampleLod]
                      _1854 = __3__36__0__0__g_textureTrailHeight.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_1841, _1845), 0.0f);
                      if (_1854.x < 1.0f) {
                        _1886 = ((int)(uint)((int)((((_currSceneTrailHeight._trailUpdatedPosition.y + -1.0f) - _viewPos.y) + ((mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].y), _1854.x, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].y), _1845, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].y) * _1841))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].y)) / (mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].w), _1854.x, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].w), _1845, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].w) * _1841))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].w)))) < _1589)));
                      } else {
                        _1886 = 0;
                      }
                      if ((_1854.y < 1.0f) && (_1854.y > 0.0f)) {
                        _1919 = (((int)(uint)((int)((((_currSceneTrailHeight._trailUpdatedPosition.y + 0.20000000298023224f) - _viewPos.y) + ((mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].y), _1854.y, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].y), _1845, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].y) * _1841))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].y)) / (mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].w), _1854.y, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].w), _1845, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].w) * _1841))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].w)))) > _1589))) & _1886);
                      } else {
                        _1919 = 0;
                      }
                      _1922 = (_1919 | _1813);
                    } else {
                      _1922 = _1813;
                    }
                  } else {
                    _1922 = _1813;
                  }
                  if (!(_1922 == 0)) {
                    _1932 = (_viewPos.x + _1588) - _currSceneTrailInteraction._trailUpdatedPosition.x;
                    _1933 = (_viewPos.y + _1589) - _currSceneTrailInteraction._trailUpdatedPosition.y;
                    _1934 = (_viewPos.z + _1590) - _currSceneTrailInteraction._trailUpdatedPosition.z;
                    _1950 = mad((_currSceneTrailInteraction._trailViewProjTexScale[2].x), _1934, mad((_currSceneTrailInteraction._trailViewProjTexScale[1].x), _1933, ((_currSceneTrailInteraction._trailViewProjTexScale[0].x) * _1932))) + (_currSceneTrailInteraction._trailViewProjTexScale[3].x);
                    _1954 = mad((_currSceneTrailInteraction._trailViewProjTexScale[2].y), _1934, mad((_currSceneTrailInteraction._trailViewProjTexScale[1].y), _1933, ((_currSceneTrailInteraction._trailViewProjTexScale[0].y) * _1932))) + (_currSceneTrailInteraction._trailViewProjTexScale[3].y);
                    if (saturate(_1950) == _1950) {
                      [branch]
                      if (saturate(_1954) == _1954) {
  // [sem: _3__36__0__0__g_textureTrailInteraction_sampleLod]
                        _1963 = __3__36__0__0__g_textureTrailInteraction.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_1950, _1954), 0.0f);
                        _1969 = (_1963.x * 2.0f) + -1.0f;
                        _1970 = (_1963.y * 2.0f) + -1.0f;
                        _1972 = rsqrt(dot(float2(_1969, _1970), float2(_1969, _1970)));  // [sem: invLength]
                        _1973 = _1969 * _1972;
                        _1974 = _1970 * _1972;
                        _1975 = saturate(_1963.w);  // [sem: expr_sat]
                        if (_1975 > 0.0f) {
                          _1979 = sin(_time.x * 7.0f);
                          _1984 = -0.0f - (_1798 * _1974);
                          _1987 = (_1974 * _1797) - (_1973 * _1799);
                          _1988 = _1973 * _1798;
                          _1990 = rsqrt(dot(float3(_1984, _1987, _1988), float3(_1984, _1987, _1988)));  // [sem: invLength]
                          _1991 = _1990 * _1984;
                          _1992 = _1990 * _1987;
                          _1993 = _1990 * _1988;
                          _1995 = (_1975 * _1763) * (lerp(_1979, 1.0f, _1975));
                          _2001 = dot(float3(_1991, _1992, _1993), float3(((_1533 - _1578) * _140), (_1741 - _1589), ((_1539 - _1584) * _140)));
                          _2005 = (_1991 * _2001) + _1588;
                          _2006 = (_1992 * _2001) + _1589;
                          _2007 = (_1993 * _2001) + _1590;
                          _2008 = _1543 - _2005;
                          _2009 = _1741 - _2006;
                          _2010 = _1545 - _2007;
                          _2020 = sin(_1995);
                          _2021 = cos(_1995);
                          _2038 = (((_2005 - _1543) + (_2008 * _2021)) + (((_2009 * _1993) - (_2010 * _1992)) * _2020));
                          _2039 = (((_2006 - _1741) + (_2009 * _2021)) + (((_2010 * _1991) - (_2008 * _1993)) * _2020));
                          _2040 = (((_2007 - _1545) + (_2010 * _2021)) + (((_2008 * _1992) - (_2009 * _1991)) * _2020));
                        } else {
                          _2038 = 0.0f;
                          _2039 = 0.0f;
                          _2040 = 0.0f;
                        }
                      } else {
                        _2038 = 0.0f;
                        _2039 = 0.0f;
                        _2040 = 0.0f;
                      }
                    } else {
                      _2038 = 0.0f;
                      _2039 = 0.0f;
                      _2040 = 0.0f;
                    }
                  } else {
                    _2038 = 0.0f;
                    _2039 = 0.0f;
                    _2040 = 0.0f;
                  }
                  if (_1847) {
                    [branch]
                    if (saturate(_1845) == _1845) {
  // [sem: _3__36__0__0__g_textureTrailHeight_sampleLod]
                      _2053 = __3__36__0__0__g_textureTrailHeight.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_1841, _1845), 0.0f);
                      if (_2053.x < 1.0f) {
                        _2085 = ((int)(uint)((int)((((_currSceneTrailHeight._trailUpdatedPosition.y + -1.0f) - _viewPos.y) + ((mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].y), _2053.x, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].y), _1845, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].y) * _1841))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].y)) / (mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].w), _2053.x, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].w), _1845, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].w) * _1841))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].w)))) < _1589)));
                      } else {
                        _2085 = 0;
                      }
                      if ((_2053.y < 1.0f) && (_2053.y > 0.0f)) {
                        _2118 = (((int)(uint)((int)((((_currSceneTrailHeight._trailUpdatedPosition.y + 0.20000000298023224f) - _viewPos.y) + ((mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].y), _2053.y, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].y), _1845, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].y) * _1841))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].y)) / (mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].w), _2053.y, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].w), _1845, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].w) * _1841))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].w)))) > _1589))) & _2085);
                      } else {
                        _2118 = 0;
                      }
                      _2121 = (_2118 | _1813);
                    } else {
                      _2121 = _1813;
                    }
                  } else {
                    _2121 = _1813;
                  }
                  if (!(_2121 == 0)) {
                    _2131 = (_viewPos.x + _1588) - _prevSceneTrailInteraction._trailUpdatedPosition.x;
                    _2132 = (_viewPos.y + _1589) - _prevSceneTrailInteraction._trailUpdatedPosition.y;
                    _2133 = (_viewPos.z + _1590) - _prevSceneTrailInteraction._trailUpdatedPosition.z;
                    _2149 = mad((_prevSceneTrailInteraction._trailViewProjTexScale[2].x), _2133, mad((_prevSceneTrailInteraction._trailViewProjTexScale[1].x), _2132, ((_prevSceneTrailInteraction._trailViewProjTexScale[0].x) * _2131))) + (_prevSceneTrailInteraction._trailViewProjTexScale[3].x);
                    _2153 = mad((_prevSceneTrailInteraction._trailViewProjTexScale[2].y), _2133, mad((_prevSceneTrailInteraction._trailViewProjTexScale[1].y), _2132, ((_prevSceneTrailInteraction._trailViewProjTexScale[0].y) * _2131))) + (_prevSceneTrailInteraction._trailViewProjTexScale[3].y);
                    if (saturate(_2149) == _2149) {
                      [branch]
                      if (saturate(_2153) == _2153) {
  // [sem: _3__36__0__0__g_textureTrailInteractionPrev_sampleLod]
                        _2162 = __3__36__0__0__g_textureTrailInteractionPrev.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_2149, _2153), 0.0f);
                        _2168 = (_2162.x * 2.0f) + -1.0f;
                        _2169 = (_2162.y * 2.0f) + -1.0f;
                        _2171 = rsqrt(dot(float2(_2168, _2169), float2(_2168, _2169)));  // [sem: invLength]
                        _2172 = _2168 * _2171;
                        _2173 = _2169 * _2171;
                        _2174 = saturate(_2162.w);  // [sem: expr_sat]
                        if (_2174 > 0.0f) {
                          _2178 = sin(_time.y * 7.0f);
                          _2183 = -0.0f - (_1798 * _2173);
                          _2186 = (_2173 * _1797) - (_2172 * _1799);
                          _2187 = _2172 * _1798;
                          _2189 = rsqrt(dot(float3(_2183, _2186, _2187), float3(_2183, _2186, _2187)));  // [sem: invLength]
                          _2190 = _2189 * _2183;
                          _2191 = _2189 * _2186;
                          _2192 = _2189 * _2187;
                          _2194 = (_2174 * _1763) * (lerp(_2178, 1.0f, _2174));
                          _2200 = dot(float3(_2190, _2191, _2192), float3(((_1533 - _1578) * _140), (_1741 - _1589), ((_1539 - _1584) * _140)));
                          _2204 = (_2190 * _2200) + _1588;
                          _2205 = (_2191 * _2200) + _1589;
                          _2206 = (_2192 * _2200) + _1590;
                          _2207 = _1543 - _2204;
                          _2208 = _1741 - _2205;
                          _2209 = _1545 - _2206;
                          _2219 = sin(_2194);
                          _2220 = cos(_2194);
                          _2237 = (((_2204 - _1543) + (_2207 * _2220)) + (((_2208 * _2192) - (_2209 * _2191)) * _2219));
                          _2238 = (((_2205 - _1741) + (_2208 * _2220)) + (((_2209 * _2190) - (_2207 * _2192)) * _2219));
                          _2239 = (((_2206 - _1545) + (_2209 * _2220)) + (((_2207 * _2191) - (_2208 * _2190)) * _2219));
                        } else {
                          _2237 = 0.0f;
                          _2238 = 0.0f;
                          _2239 = 0.0f;
                        }
                      } else {
                        _2237 = 0.0f;
                        _2238 = 0.0f;
                        _2239 = 0.0f;
                      }
                    } else {
                      _2237 = 0.0f;
                      _2238 = 0.0f;
                      _2239 = 0.0f;
                    }
                  } else {
                    _2237 = 0.0f;
                    _2238 = 0.0f;
                    _2239 = 0.0f;
                  }
                  _2247 = ((_2237 * _309) + _1558);
                  _2248 = ((_2238 * _309) + _1742);
                  _2249 = ((_2239 * _309) + _1560);
                  _2250 = ((_2038 * _309) + _1543);
                  _2251 = ((_2039 * _309) + _1741);
                  _2252 = ((_2040 * _309) + _1545);
                } else {
                  _2247 = _1558;
                  _2248 = _1742;
                  _2249 = _1560;
                  _2250 = _1543;
                  _2251 = _1741;
                  _2252 = _1545;
                }
                _2818 = _2250;
                _2819 = _2251;
                _2820 = _2252;
                _2821 = _2247;
                _2822 = _2248;
                _2823 = _2249;
              } else {
                _2818 = _1543;
                _2819 = _1741;
                _2820 = _1545;
                _2821 = _1558;
                _2822 = _1742;
                _2823 = _1560;
              }
              _2847 = mad((_viewProjRelativePrev[2].x), _2823, mad((_viewProjRelativePrev[1].x), _2822, ((_viewProjRelativePrev[0].x) * _2821))) + (_viewProjRelativePrev[3].x);
              _2851 = mad((_viewProjRelativePrev[2].y), _2823, mad((_viewProjRelativePrev[1].y), _2822, ((_viewProjRelativePrev[0].y) * _2821))) + (_viewProjRelativePrev[3].y);
              _2855 = mad((_viewProjRelativePrev[2].z), _2823, mad((_viewProjRelativePrev[1].z), _2822, ((_viewProjRelativePrev[0].z) * _2821))) + (_viewProjRelativePrev[3].z);
              _2859 = mad((_viewProjRelativePrev[2].w), _2823, mad((_viewProjRelativePrev[1].w), _2822, ((_viewProjRelativePrev[0].w) * _2821))) + (_viewProjRelativePrev[3].w);
              _2883 = mad((_viewProjRelative[2].x), _2820, mad((_viewProjRelative[1].x), _2819, ((_viewProjRelative[0].x) * _2818))) + (_viewProjRelative[3].x);
              _2887 = mad((_viewProjRelative[2].y), _2820, mad((_viewProjRelative[1].y), _2819, ((_viewProjRelative[0].y) * _2818))) + (_viewProjRelative[3].y);
              _2891 = mad((_viewProjRelative[2].z), _2820, mad((_viewProjRelative[1].z), _2819, ((_viewProjRelative[0].z) * _2818))) + (_viewProjRelative[3].z);
              _2895 = mad((_viewProjRelative[2].w), _2820, mad((_viewProjRelative[1].w), _2819, ((_viewProjRelative[0].w) * _2818))) + (_viewProjRelative[3].w);
              _2897 = rsqrt(dot(float3(_1563, _1566, _1569), float3(_1563, _1566, _1569)));  // [sem: invLength]
              _2901 = half(_2897 * _1563);
              _2902 = half(_2897 * _1566);
              _2903 = half(_2897 * _1569);
              _2906 = half((((float)((uint16_t)((uint)(_71 & 255)))) * 0.003921568859368563f) * min(2.0f, _140));
              _2907 = _drawIndex | -16777216;
              _2911 = select((_variableRateShadingParams.x > 0.0f), 5, 0);
              if ((SV_VertexID != 0) && (((int)(SV_VertexID % 40)) == 0)) {
                if (sqrt(((_2819 * _2819) + (_2818 * _2818)) + (_2820 * _2820)) < 4.0f) {
                  __3__39__0__1__g_treeSurfacePositionsCounterBufferUAV.InterlockedAdd(0, 1, _2926);
                  if ((uint)_2926 < (uint)1024) {
                    TreeSurfacePositionData __struct_store_1;
                    __struct_store_1._worldPos = float4((_viewPos.x + _2818), (_viewPos.y + _2819), (_viewPos.z + _2820), 1.0f);
                    __struct_store_1._worldPosPrev = float4((_viewPosPrev.x + _2821), (_viewPosPrev.y + _2822), (_viewPosPrev.z + _2823), 1.0f);
                    __3__39__0__1__g_treeSurfacePositionsBufferUAV[_2926] = __struct_store_1;
                    _2945 = _98;
                    _2946 = _2847;
                    _2947 = _2851;
                    _2948 = _2855;
                    _2949 = _2859;
                    _2950 = _2901;
                    _2951 = _2902;
                    _2952 = _2903;
                    _2953 = _2906;
                    _2954 = _2907;
                    _2955 = _297;
                    _2956 = _2911;
                    _2957 = _2883;
                    _2958 = _2887;
                    _2959 = _2891;
                    _2960 = _2895;
                  } else {
                    _2945 = _98;
                    _2946 = _2847;
                    _2947 = _2851;
                    _2948 = _2855;
                    _2949 = _2859;
                    _2950 = _2901;
                    _2951 = _2902;
                    _2952 = _2903;
                    _2953 = _2906;
                    _2954 = _2907;
                    _2955 = _297;
                    _2956 = _2911;
                    _2957 = _2883;
                    _2958 = _2887;
                    _2959 = _2891;
                    _2960 = _2895;
                  }
                } else {
                  _2945 = _98;
                  _2946 = _2847;
                  _2947 = _2851;
                  _2948 = _2855;
                  _2949 = _2859;
                  _2950 = _2901;
                  _2951 = _2902;
                  _2952 = _2903;
                  _2953 = _2906;
                  _2954 = _2907;
                  _2955 = _297;
                  _2956 = _2911;
                  _2957 = _2883;
                  _2958 = _2887;
                  _2959 = _2891;
                  _2960 = _2895;
                }
              } else {
                _2945 = _98;
                _2946 = _2847;
                _2947 = _2851;
                _2948 = _2855;
                _2949 = _2859;
                _2950 = _2901;
                _2951 = _2902;
                _2952 = _2903;
                _2953 = _2906;
                _2954 = _2907;
                _2955 = _297;
                _2956 = _2911;
                _2957 = _2883;
                _2958 = _2887;
                _2959 = _2891;
                _2960 = _2895;
              }
            } else {
              _2945 = 0.0f;
              _2946 = 0.0f;
              _2947 = 0.0f;
              _2948 = 0.0f;
              _2949 = 0.0f;
              _2950 = 0.0h;
              _2951 = 0.0h;
              _2952 = 0.0h;
              _2953 = 0.0h;
              _2954 = 0;
              _2955 = 0.0f;
              _2956 = 0;
              _2957 = +1.#INF;
              _2958 = +1.#INF;
              _2959 = +1.#INF;
              _2960 = +1.#INF;
            }
          } else {
            _2945 = 0.0f;
            _2946 = 0.0f;
            _2947 = 0.0f;
            _2948 = 0.0f;
            _2949 = 0.0f;
            _2950 = 0.0h;
            _2951 = 0.0h;
            _2952 = 0.0h;
            _2953 = 0.0h;
            _2954 = 0;
            _2955 = 0.0f;
            _2956 = 0;
            _2957 = +1.#INF;
            _2958 = +1.#INF;
            _2959 = +1.#INF;
            _2960 = +1.#INF;
          }
        } else {
          _1741 = _1544;
          _1742 = _1559;
          if (_303 < 48.0f) {
            _1747 = __3__37__0__0__g_indirectDrawParametersBuffer[_drawIndex]._bindlessMaterialParametersViewIndex;
            if (!(((BindlessParameters_MaterialOverrideParametersTree[NonUniformResourceIndex(((int)((uint)(select(((uint)_1747 < (uint)170000), _1747, 0)) + 0u)))].BindlessParameters_MaterialOverrideParametersTree._materialInfo) & 512) == 0)) {
              _1763 = (saturate(_treeParams.y) * 0.9424778819084167f);
            } else {
              _1763 = 0.9424778819084167f;
            }
            if ((uint)((_115 & 15) + -1) < (uint)2) {
              _1778 = (frac(_105 * 0.0625f) * 2.0f) + -1.0f;
              _1779 = (frac(_105) * 2.0f) + -1.0f;
              _1780 = (frac(_105 * 16.0f) * 2.0f) + -1.0f;
              _1782 = rsqrt(dot(float3(_1778, _1779, _1780), float3(_1778, _1779, _1780)));  // [sem: invLength]
              _1783 = _1782 * _1778;
              _1784 = _1782 * _1779;
              _1785 = _1780 * _1782;
              _1788 = mad(_189, _1784, mad(_124, _1785, (_1783 * _118)));
              _1791 = mad(_191, _1784, mad(_126, _1785, (_1783 * _120)));
              _1794 = mad(_193, _1784, mad(_128, _1785, (_1783 * _122)));
              _1796 = rsqrt(dot(float3(_1788, _1791, _1794), float3(_1788, _1791, _1794)));  // [sem: invLength]
              _1797 = _1796 * _1788;
              _1798 = _1796 * _1791;
              _1799 = _1796 * _1794;
              _1806 = _renderingOriginPos.y - _viewPos.y;
              _1813 = (int)(uint)((int)(((_1806 + -2.0f) < _1589) && ((_renderingOriginPos.w == 0.0f) && ((_1806 + 1.0f) > _1589))));
              _1823 = (_viewPos.x - _currSceneTrailHeight._trailUpdatedPosition.x) + _1588;
              _1824 = (_viewPos.y - _currSceneTrailHeight._trailUpdatedPosition.y) + _1589;
              _1825 = (_viewPos.z - _currSceneTrailHeight._trailUpdatedPosition.z) + _1590;
              _1841 = mad((_currSceneTrailHeight._trailViewProjTexScale[2].x), _1825, mad((_currSceneTrailHeight._trailViewProjTexScale[1].x), _1824, (_1823 * (_currSceneTrailHeight._trailViewProjTexScale[0].x)))) + (_currSceneTrailHeight._trailViewProjTexScale[3].x);
              _1845 = mad((_currSceneTrailHeight._trailViewProjTexScale[2].y), _1825, mad((_currSceneTrailHeight._trailViewProjTexScale[1].y), _1824, (_1823 * (_currSceneTrailHeight._trailViewProjTexScale[0].y)))) + (_currSceneTrailHeight._trailViewProjTexScale[3].y);
              _1847 = (saturate(_1841) == _1841);
              if (_1847) {
                [branch]
                if (saturate(_1845) == _1845) {
  // [sem: _3__36__0__0__g_textureTrailHeight_sampleLod]
                  _1854 = __3__36__0__0__g_textureTrailHeight.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_1841, _1845), 0.0f);
                  if (_1854.x < 1.0f) {
                    _1886 = ((int)(uint)((int)((((_currSceneTrailHeight._trailUpdatedPosition.y + -1.0f) - _viewPos.y) + ((mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].y), _1854.x, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].y), _1845, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].y) * _1841))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].y)) / (mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].w), _1854.x, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].w), _1845, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].w) * _1841))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].w)))) < _1589)));
                  } else {
                    _1886 = 0;
                  }
                  if ((_1854.y < 1.0f) && (_1854.y > 0.0f)) {
                    _1919 = (((int)(uint)((int)((((_currSceneTrailHeight._trailUpdatedPosition.y + 0.20000000298023224f) - _viewPos.y) + ((mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].y), _1854.y, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].y), _1845, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].y) * _1841))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].y)) / (mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].w), _1854.y, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].w), _1845, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].w) * _1841))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].w)))) > _1589))) & _1886);
                  } else {
                    _1919 = 0;
                  }
                  _1922 = (_1919 | _1813);
                } else {
                  _1922 = _1813;
                }
              } else {
                _1922 = _1813;
              }
              if (!(_1922 == 0)) {
                _1932 = (_viewPos.x + _1588) - _currSceneTrailInteraction._trailUpdatedPosition.x;
                _1933 = (_viewPos.y + _1589) - _currSceneTrailInteraction._trailUpdatedPosition.y;
                _1934 = (_viewPos.z + _1590) - _currSceneTrailInteraction._trailUpdatedPosition.z;
                _1950 = mad((_currSceneTrailInteraction._trailViewProjTexScale[2].x), _1934, mad((_currSceneTrailInteraction._trailViewProjTexScale[1].x), _1933, ((_currSceneTrailInteraction._trailViewProjTexScale[0].x) * _1932))) + (_currSceneTrailInteraction._trailViewProjTexScale[3].x);
                _1954 = mad((_currSceneTrailInteraction._trailViewProjTexScale[2].y), _1934, mad((_currSceneTrailInteraction._trailViewProjTexScale[1].y), _1933, ((_currSceneTrailInteraction._trailViewProjTexScale[0].y) * _1932))) + (_currSceneTrailInteraction._trailViewProjTexScale[3].y);
                if (saturate(_1950) == _1950) {
                  [branch]
                  if (saturate(_1954) == _1954) {
  // [sem: _3__36__0__0__g_textureTrailInteraction_sampleLod]
                    _1963 = __3__36__0__0__g_textureTrailInteraction.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_1950, _1954), 0.0f);
                    _1969 = (_1963.x * 2.0f) + -1.0f;
                    _1970 = (_1963.y * 2.0f) + -1.0f;
                    _1972 = rsqrt(dot(float2(_1969, _1970), float2(_1969, _1970)));  // [sem: invLength]
                    _1973 = _1969 * _1972;
                    _1974 = _1970 * _1972;
                    _1975 = saturate(_1963.w);  // [sem: expr_sat]
                    if (_1975 > 0.0f) {
                      _1979 = sin(_time.x * 7.0f);
                      _1984 = -0.0f - (_1798 * _1974);
                      _1987 = (_1974 * _1797) - (_1973 * _1799);
                      _1988 = _1973 * _1798;
                      _1990 = rsqrt(dot(float3(_1984, _1987, _1988), float3(_1984, _1987, _1988)));  // [sem: invLength]
                      _1991 = _1990 * _1984;
                      _1992 = _1990 * _1987;
                      _1993 = _1990 * _1988;
                      _1995 = (_1975 * _1763) * (lerp(_1979, 1.0f, _1975));
                      _2001 = dot(float3(_1991, _1992, _1993), float3(((_1533 - _1578) * _140), (_1741 - _1589), ((_1539 - _1584) * _140)));
                      _2005 = (_1991 * _2001) + _1588;
                      _2006 = (_1992 * _2001) + _1589;
                      _2007 = (_1993 * _2001) + _1590;
                      _2008 = _1543 - _2005;
                      _2009 = _1741 - _2006;
                      _2010 = _1545 - _2007;
                      _2020 = sin(_1995);
                      _2021 = cos(_1995);
                      _2038 = (((_2005 - _1543) + (_2008 * _2021)) + (((_2009 * _1993) - (_2010 * _1992)) * _2020));
                      _2039 = (((_2006 - _1741) + (_2009 * _2021)) + (((_2010 * _1991) - (_2008 * _1993)) * _2020));
                      _2040 = (((_2007 - _1545) + (_2010 * _2021)) + (((_2008 * _1992) - (_2009 * _1991)) * _2020));
                    } else {
                      _2038 = 0.0f;
                      _2039 = 0.0f;
                      _2040 = 0.0f;
                    }
                  } else {
                    _2038 = 0.0f;
                    _2039 = 0.0f;
                    _2040 = 0.0f;
                  }
                } else {
                  _2038 = 0.0f;
                  _2039 = 0.0f;
                  _2040 = 0.0f;
                }
              } else {
                _2038 = 0.0f;
                _2039 = 0.0f;
                _2040 = 0.0f;
              }
              if (_1847) {
                [branch]
                if (saturate(_1845) == _1845) {
  // [sem: _3__36__0__0__g_textureTrailHeight_sampleLod]
                  _2053 = __3__36__0__0__g_textureTrailHeight.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_1841, _1845), 0.0f);
                  if (_2053.x < 1.0f) {
                    _2085 = ((int)(uint)((int)((((_currSceneTrailHeight._trailUpdatedPosition.y + -1.0f) - _viewPos.y) + ((mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].y), _2053.x, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].y), _1845, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].y) * _1841))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].y)) / (mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].w), _2053.x, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].w), _1845, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].w) * _1841))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].w)))) < _1589)));
                  } else {
                    _2085 = 0;
                  }
                  if ((_2053.y < 1.0f) && (_2053.y > 0.0f)) {
                    _2118 = (((int)(uint)((int)((((_currSceneTrailHeight._trailUpdatedPosition.y + 0.20000000298023224f) - _viewPos.y) + ((mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].y), _2053.y, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].y), _1845, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].y) * _1841))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].y)) / (mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].w), _2053.y, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].w), _1845, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].w) * _1841))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].w)))) > _1589))) & _2085);
                  } else {
                    _2118 = 0;
                  }
                  _2121 = (_2118 | _1813);
                } else {
                  _2121 = _1813;
                }
              } else {
                _2121 = _1813;
              }
              if (!(_2121 == 0)) {
                _2131 = (_viewPos.x + _1588) - _prevSceneTrailInteraction._trailUpdatedPosition.x;
                _2132 = (_viewPos.y + _1589) - _prevSceneTrailInteraction._trailUpdatedPosition.y;
                _2133 = (_viewPos.z + _1590) - _prevSceneTrailInteraction._trailUpdatedPosition.z;
                _2149 = mad((_prevSceneTrailInteraction._trailViewProjTexScale[2].x), _2133, mad((_prevSceneTrailInteraction._trailViewProjTexScale[1].x), _2132, ((_prevSceneTrailInteraction._trailViewProjTexScale[0].x) * _2131))) + (_prevSceneTrailInteraction._trailViewProjTexScale[3].x);
                _2153 = mad((_prevSceneTrailInteraction._trailViewProjTexScale[2].y), _2133, mad((_prevSceneTrailInteraction._trailViewProjTexScale[1].y), _2132, ((_prevSceneTrailInteraction._trailViewProjTexScale[0].y) * _2131))) + (_prevSceneTrailInteraction._trailViewProjTexScale[3].y);
                if (saturate(_2149) == _2149) {
                  [branch]
                  if (saturate(_2153) == _2153) {
  // [sem: _3__36__0__0__g_textureTrailInteractionPrev_sampleLod]
                    _2162 = __3__36__0__0__g_textureTrailInteractionPrev.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_2149, _2153), 0.0f);
                    _2168 = (_2162.x * 2.0f) + -1.0f;
                    _2169 = (_2162.y * 2.0f) + -1.0f;
                    _2171 = rsqrt(dot(float2(_2168, _2169), float2(_2168, _2169)));  // [sem: invLength]
                    _2172 = _2168 * _2171;
                    _2173 = _2169 * _2171;
                    _2174 = saturate(_2162.w);  // [sem: expr_sat]
                    if (_2174 > 0.0f) {
                      _2178 = sin(_time.y * 7.0f);
                      _2183 = -0.0f - (_1798 * _2173);
                      _2186 = (_2173 * _1797) - (_2172 * _1799);
                      _2187 = _2172 * _1798;
                      _2189 = rsqrt(dot(float3(_2183, _2186, _2187), float3(_2183, _2186, _2187)));  // [sem: invLength]
                      _2190 = _2189 * _2183;
                      _2191 = _2189 * _2186;
                      _2192 = _2189 * _2187;
                      _2194 = (_2174 * _1763) * (lerp(_2178, 1.0f, _2174));
                      _2200 = dot(float3(_2190, _2191, _2192), float3(((_1533 - _1578) * _140), (_1741 - _1589), ((_1539 - _1584) * _140)));
                      _2204 = (_2190 * _2200) + _1588;
                      _2205 = (_2191 * _2200) + _1589;
                      _2206 = (_2192 * _2200) + _1590;
                      _2207 = _1543 - _2204;
                      _2208 = _1741 - _2205;
                      _2209 = _1545 - _2206;
                      _2219 = sin(_2194);
                      _2220 = cos(_2194);
                      _2237 = (((_2204 - _1543) + (_2207 * _2220)) + (((_2208 * _2192) - (_2209 * _2191)) * _2219));
                      _2238 = (((_2205 - _1741) + (_2208 * _2220)) + (((_2209 * _2190) - (_2207 * _2192)) * _2219));
                      _2239 = (((_2206 - _1545) + (_2209 * _2220)) + (((_2207 * _2191) - (_2208 * _2190)) * _2219));
                    } else {
                      _2237 = 0.0f;
                      _2238 = 0.0f;
                      _2239 = 0.0f;
                    }
                  } else {
                    _2237 = 0.0f;
                    _2238 = 0.0f;
                    _2239 = 0.0f;
                  }
                } else {
                  _2237 = 0.0f;
                  _2238 = 0.0f;
                  _2239 = 0.0f;
                }
              } else {
                _2237 = 0.0f;
                _2238 = 0.0f;
                _2239 = 0.0f;
              }
              _2247 = ((_2237 * _309) + _1558);
              _2248 = ((_2238 * _309) + _1742);
              _2249 = ((_2239 * _309) + _1560);
              _2250 = ((_2038 * _309) + _1543);
              _2251 = ((_2039 * _309) + _1741);
              _2252 = ((_2040 * _309) + _1545);
            } else {
              _2247 = _1558;
              _2248 = _1742;
              _2249 = _1560;
              _2250 = _1543;
              _2251 = _1741;
              _2252 = _1545;
            }
            _2818 = _2250;
            _2819 = _2251;
            _2820 = _2252;
            _2821 = _2247;
            _2822 = _2248;
            _2823 = _2249;
          } else {
            _2818 = _1543;
            _2819 = _1741;
            _2820 = _1545;
            _2821 = _1558;
            _2822 = _1742;
            _2823 = _1560;
          }
          _2847 = mad((_viewProjRelativePrev[2].x), _2823, mad((_viewProjRelativePrev[1].x), _2822, ((_viewProjRelativePrev[0].x) * _2821))) + (_viewProjRelativePrev[3].x);
          _2851 = mad((_viewProjRelativePrev[2].y), _2823, mad((_viewProjRelativePrev[1].y), _2822, ((_viewProjRelativePrev[0].y) * _2821))) + (_viewProjRelativePrev[3].y);
          _2855 = mad((_viewProjRelativePrev[2].z), _2823, mad((_viewProjRelativePrev[1].z), _2822, ((_viewProjRelativePrev[0].z) * _2821))) + (_viewProjRelativePrev[3].z);
          _2859 = mad((_viewProjRelativePrev[2].w), _2823, mad((_viewProjRelativePrev[1].w), _2822, ((_viewProjRelativePrev[0].w) * _2821))) + (_viewProjRelativePrev[3].w);
          _2883 = mad((_viewProjRelative[2].x), _2820, mad((_viewProjRelative[1].x), _2819, ((_viewProjRelative[0].x) * _2818))) + (_viewProjRelative[3].x);
          _2887 = mad((_viewProjRelative[2].y), _2820, mad((_viewProjRelative[1].y), _2819, ((_viewProjRelative[0].y) * _2818))) + (_viewProjRelative[3].y);
          _2891 = mad((_viewProjRelative[2].z), _2820, mad((_viewProjRelative[1].z), _2819, ((_viewProjRelative[0].z) * _2818))) + (_viewProjRelative[3].z);
          _2895 = mad((_viewProjRelative[2].w), _2820, mad((_viewProjRelative[1].w), _2819, ((_viewProjRelative[0].w) * _2818))) + (_viewProjRelative[3].w);
          _2897 = rsqrt(dot(float3(_1563, _1566, _1569), float3(_1563, _1566, _1569)));  // [sem: invLength]
          _2901 = half(_2897 * _1563);
          _2902 = half(_2897 * _1566);
          _2903 = half(_2897 * _1569);
          _2906 = half((((float)((uint16_t)((uint)(_71 & 255)))) * 0.003921568859368563f) * min(2.0f, _140));
          _2907 = _drawIndex | -16777216;
          _2911 = select((_variableRateShadingParams.x > 0.0f), 5, 0);
          if ((SV_VertexID != 0) && (((int)(SV_VertexID % 40)) == 0)) {
            if (sqrt(((_2819 * _2819) + (_2818 * _2818)) + (_2820 * _2820)) < 4.0f) {
              __3__39__0__1__g_treeSurfacePositionsCounterBufferUAV.InterlockedAdd(0, 1, _2926);
              if ((uint)_2926 < (uint)1024) {
                TreeSurfacePositionData __struct_store_2;
                __struct_store_2._worldPos = float4((_viewPos.x + _2818), (_viewPos.y + _2819), (_viewPos.z + _2820), 1.0f);
                __struct_store_2._worldPosPrev = float4((_viewPosPrev.x + _2821), (_viewPosPrev.y + _2822), (_viewPosPrev.z + _2823), 1.0f);
                __3__39__0__1__g_treeSurfacePositionsBufferUAV[_2926] = __struct_store_2;
                _2945 = _98;
                _2946 = _2847;
                _2947 = _2851;
                _2948 = _2855;
                _2949 = _2859;
                _2950 = _2901;
                _2951 = _2902;
                _2952 = _2903;
                _2953 = _2906;
                _2954 = _2907;
                _2955 = _297;
                _2956 = _2911;
                _2957 = _2883;
                _2958 = _2887;
                _2959 = _2891;
                _2960 = _2895;
              } else {
                _2945 = _98;
                _2946 = _2847;
                _2947 = _2851;
                _2948 = _2855;
                _2949 = _2859;
                _2950 = _2901;
                _2951 = _2902;
                _2952 = _2903;
                _2953 = _2906;
                _2954 = _2907;
                _2955 = _297;
                _2956 = _2911;
                _2957 = _2883;
                _2958 = _2887;
                _2959 = _2891;
                _2960 = _2895;
              }
            } else {
              _2945 = _98;
              _2946 = _2847;
              _2947 = _2851;
              _2948 = _2855;
              _2949 = _2859;
              _2950 = _2901;
              _2951 = _2902;
              _2952 = _2903;
              _2953 = _2906;
              _2954 = _2907;
              _2955 = _297;
              _2956 = _2911;
              _2957 = _2883;
              _2958 = _2887;
              _2959 = _2891;
              _2960 = _2895;
            }
          } else {
            _2945 = _98;
            _2946 = _2847;
            _2947 = _2851;
            _2948 = _2855;
            _2949 = _2859;
            _2950 = _2901;
            _2951 = _2902;
            _2952 = _2903;
            _2953 = _2906;
            _2954 = _2907;
            _2955 = _297;
            _2956 = _2911;
            _2957 = _2883;
            _2958 = _2887;
            _2959 = _2891;
            _2960 = _2895;
          }
        }
      }
    } else {
      _1741 = _1544;
      _1742 = _1559;
      if (_303 < 48.0f) {
        _1747 = __3__37__0__0__g_indirectDrawParametersBuffer[_drawIndex]._bindlessMaterialParametersViewIndex;
        if (!(((BindlessParameters_MaterialOverrideParametersTree[NonUniformResourceIndex(((int)((uint)(select(((uint)_1747 < (uint)170000), _1747, 0)) + 0u)))].BindlessParameters_MaterialOverrideParametersTree._materialInfo) & 512) == 0)) {
          _1763 = (saturate(_treeParams.y) * 0.9424778819084167f);
        } else {
          _1763 = 0.9424778819084167f;
        }
        if ((uint)((_115 & 15) + -1) < (uint)2) {
          _1778 = (frac(_105 * 0.0625f) * 2.0f) + -1.0f;
          _1779 = (frac(_105) * 2.0f) + -1.0f;
          _1780 = (frac(_105 * 16.0f) * 2.0f) + -1.0f;
          _1782 = rsqrt(dot(float3(_1778, _1779, _1780), float3(_1778, _1779, _1780)));  // [sem: invLength]
          _1783 = _1782 * _1778;
          _1784 = _1782 * _1779;
          _1785 = _1780 * _1782;
          _1788 = mad(_189, _1784, mad(_124, _1785, (_1783 * _118)));
          _1791 = mad(_191, _1784, mad(_126, _1785, (_1783 * _120)));
          _1794 = mad(_193, _1784, mad(_128, _1785, (_1783 * _122)));
          _1796 = rsqrt(dot(float3(_1788, _1791, _1794), float3(_1788, _1791, _1794)));  // [sem: invLength]
          _1797 = _1796 * _1788;
          _1798 = _1796 * _1791;
          _1799 = _1796 * _1794;
          _1806 = _renderingOriginPos.y - _viewPos.y;
          _1813 = (int)(uint)((int)(((_1806 + -2.0f) < _1589) && ((_renderingOriginPos.w == 0.0f) && ((_1806 + 1.0f) > _1589))));
          _1823 = (_viewPos.x - _currSceneTrailHeight._trailUpdatedPosition.x) + _1588;
          _1824 = (_viewPos.y - _currSceneTrailHeight._trailUpdatedPosition.y) + _1589;
          _1825 = (_viewPos.z - _currSceneTrailHeight._trailUpdatedPosition.z) + _1590;
          _1841 = mad((_currSceneTrailHeight._trailViewProjTexScale[2].x), _1825, mad((_currSceneTrailHeight._trailViewProjTexScale[1].x), _1824, (_1823 * (_currSceneTrailHeight._trailViewProjTexScale[0].x)))) + (_currSceneTrailHeight._trailViewProjTexScale[3].x);
          _1845 = mad((_currSceneTrailHeight._trailViewProjTexScale[2].y), _1825, mad((_currSceneTrailHeight._trailViewProjTexScale[1].y), _1824, (_1823 * (_currSceneTrailHeight._trailViewProjTexScale[0].y)))) + (_currSceneTrailHeight._trailViewProjTexScale[3].y);
          _1847 = (saturate(_1841) == _1841);
          if (_1847) {
            [branch]
            if (saturate(_1845) == _1845) {
  // [sem: _3__36__0__0__g_textureTrailHeight_sampleLod]
              _1854 = __3__36__0__0__g_textureTrailHeight.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_1841, _1845), 0.0f);
              if (_1854.x < 1.0f) {
                _1886 = ((int)(uint)((int)((((_currSceneTrailHeight._trailUpdatedPosition.y + -1.0f) - _viewPos.y) + ((mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].y), _1854.x, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].y), _1845, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].y) * _1841))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].y)) / (mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].w), _1854.x, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].w), _1845, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].w) * _1841))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].w)))) < _1589)));
              } else {
                _1886 = 0;
              }
              if ((_1854.y < 1.0f) && (_1854.y > 0.0f)) {
                _1919 = (((int)(uint)((int)((((_currSceneTrailHeight._trailUpdatedPosition.y + 0.20000000298023224f) - _viewPos.y) + ((mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].y), _1854.y, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].y), _1845, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].y) * _1841))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].y)) / (mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].w), _1854.y, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].w), _1845, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].w) * _1841))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].w)))) > _1589))) & _1886);
              } else {
                _1919 = 0;
              }
              _1922 = (_1919 | _1813);
            } else {
              _1922 = _1813;
            }
          } else {
            _1922 = _1813;
          }
          if (!(_1922 == 0)) {
            _1932 = (_viewPos.x + _1588) - _currSceneTrailInteraction._trailUpdatedPosition.x;
            _1933 = (_viewPos.y + _1589) - _currSceneTrailInteraction._trailUpdatedPosition.y;
            _1934 = (_viewPos.z + _1590) - _currSceneTrailInteraction._trailUpdatedPosition.z;
            _1950 = mad((_currSceneTrailInteraction._trailViewProjTexScale[2].x), _1934, mad((_currSceneTrailInteraction._trailViewProjTexScale[1].x), _1933, ((_currSceneTrailInteraction._trailViewProjTexScale[0].x) * _1932))) + (_currSceneTrailInteraction._trailViewProjTexScale[3].x);
            _1954 = mad((_currSceneTrailInteraction._trailViewProjTexScale[2].y), _1934, mad((_currSceneTrailInteraction._trailViewProjTexScale[1].y), _1933, ((_currSceneTrailInteraction._trailViewProjTexScale[0].y) * _1932))) + (_currSceneTrailInteraction._trailViewProjTexScale[3].y);
            if (saturate(_1950) == _1950) {
              [branch]
              if (saturate(_1954) == _1954) {
  // [sem: _3__36__0__0__g_textureTrailInteraction_sampleLod]
                _1963 = __3__36__0__0__g_textureTrailInteraction.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_1950, _1954), 0.0f);
                _1969 = (_1963.x * 2.0f) + -1.0f;
                _1970 = (_1963.y * 2.0f) + -1.0f;
                _1972 = rsqrt(dot(float2(_1969, _1970), float2(_1969, _1970)));  // [sem: invLength]
                _1973 = _1969 * _1972;
                _1974 = _1970 * _1972;
                _1975 = saturate(_1963.w);  // [sem: expr_sat]
                if (_1975 > 0.0f) {
                  _1979 = sin(_time.x * 7.0f);
                  _1984 = -0.0f - (_1798 * _1974);
                  _1987 = (_1974 * _1797) - (_1973 * _1799);
                  _1988 = _1973 * _1798;
                  _1990 = rsqrt(dot(float3(_1984, _1987, _1988), float3(_1984, _1987, _1988)));  // [sem: invLength]
                  _1991 = _1990 * _1984;
                  _1992 = _1990 * _1987;
                  _1993 = _1990 * _1988;
                  _1995 = (_1975 * _1763) * (lerp(_1979, 1.0f, _1975));
                  _2001 = dot(float3(_1991, _1992, _1993), float3(((_1533 - _1578) * _140), (_1741 - _1589), ((_1539 - _1584) * _140)));
                  _2005 = (_1991 * _2001) + _1588;
                  _2006 = (_1992 * _2001) + _1589;
                  _2007 = (_1993 * _2001) + _1590;
                  _2008 = _1543 - _2005;
                  _2009 = _1741 - _2006;
                  _2010 = _1545 - _2007;
                  _2020 = sin(_1995);
                  _2021 = cos(_1995);
                  _2038 = (((_2005 - _1543) + (_2008 * _2021)) + (((_2009 * _1993) - (_2010 * _1992)) * _2020));
                  _2039 = (((_2006 - _1741) + (_2009 * _2021)) + (((_2010 * _1991) - (_2008 * _1993)) * _2020));
                  _2040 = (((_2007 - _1545) + (_2010 * _2021)) + (((_2008 * _1992) - (_2009 * _1991)) * _2020));
                } else {
                  _2038 = 0.0f;
                  _2039 = 0.0f;
                  _2040 = 0.0f;
                }
              } else {
                _2038 = 0.0f;
                _2039 = 0.0f;
                _2040 = 0.0f;
              }
            } else {
              _2038 = 0.0f;
              _2039 = 0.0f;
              _2040 = 0.0f;
            }
          } else {
            _2038 = 0.0f;
            _2039 = 0.0f;
            _2040 = 0.0f;
          }
          if (_1847) {
            [branch]
            if (saturate(_1845) == _1845) {
  // [sem: _3__36__0__0__g_textureTrailHeight_sampleLod]
              _2053 = __3__36__0__0__g_textureTrailHeight.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_1841, _1845), 0.0f);
              if (_2053.x < 1.0f) {
                _2085 = ((int)(uint)((int)((((_currSceneTrailHeight._trailUpdatedPosition.y + -1.0f) - _viewPos.y) + ((mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].y), _2053.x, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].y), _1845, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].y) * _1841))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].y)) / (mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].w), _2053.x, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].w), _1845, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].w) * _1841))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].w)))) < _1589)));
              } else {
                _2085 = 0;
              }
              if ((_2053.y < 1.0f) && (_2053.y > 0.0f)) {
                _2118 = (((int)(uint)((int)((((_currSceneTrailHeight._trailUpdatedPosition.y + 0.20000000298023224f) - _viewPos.y) + ((mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].y), _2053.y, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].y), _1845, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].y) * _1841))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].y)) / (mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].w), _2053.y, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].w), _1845, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].w) * _1841))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].w)))) > _1589))) & _2085);
              } else {
                _2118 = 0;
              }
              _2121 = (_2118 | _1813);
            } else {
              _2121 = _1813;
            }
          } else {
            _2121 = _1813;
          }
          if (!(_2121 == 0)) {
            _2131 = (_viewPos.x + _1588) - _prevSceneTrailInteraction._trailUpdatedPosition.x;
            _2132 = (_viewPos.y + _1589) - _prevSceneTrailInteraction._trailUpdatedPosition.y;
            _2133 = (_viewPos.z + _1590) - _prevSceneTrailInteraction._trailUpdatedPosition.z;
            _2149 = mad((_prevSceneTrailInteraction._trailViewProjTexScale[2].x), _2133, mad((_prevSceneTrailInteraction._trailViewProjTexScale[1].x), _2132, ((_prevSceneTrailInteraction._trailViewProjTexScale[0].x) * _2131))) + (_prevSceneTrailInteraction._trailViewProjTexScale[3].x);
            _2153 = mad((_prevSceneTrailInteraction._trailViewProjTexScale[2].y), _2133, mad((_prevSceneTrailInteraction._trailViewProjTexScale[1].y), _2132, ((_prevSceneTrailInteraction._trailViewProjTexScale[0].y) * _2131))) + (_prevSceneTrailInteraction._trailViewProjTexScale[3].y);
            if (saturate(_2149) == _2149) {
              [branch]
              if (saturate(_2153) == _2153) {
  // [sem: _3__36__0__0__g_textureTrailInteractionPrev_sampleLod]
                _2162 = __3__36__0__0__g_textureTrailInteractionPrev.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_2149, _2153), 0.0f);
                _2168 = (_2162.x * 2.0f) + -1.0f;
                _2169 = (_2162.y * 2.0f) + -1.0f;
                _2171 = rsqrt(dot(float2(_2168, _2169), float2(_2168, _2169)));  // [sem: invLength]
                _2172 = _2168 * _2171;
                _2173 = _2169 * _2171;
                _2174 = saturate(_2162.w);  // [sem: expr_sat]
                if (_2174 > 0.0f) {
                  _2178 = sin(_time.y * 7.0f);
                  _2183 = -0.0f - (_1798 * _2173);
                  _2186 = (_2173 * _1797) - (_2172 * _1799);
                  _2187 = _2172 * _1798;
                  _2189 = rsqrt(dot(float3(_2183, _2186, _2187), float3(_2183, _2186, _2187)));  // [sem: invLength]
                  _2190 = _2189 * _2183;
                  _2191 = _2189 * _2186;
                  _2192 = _2189 * _2187;
                  _2194 = (_2174 * _1763) * (lerp(_2178, 1.0f, _2174));
                  _2200 = dot(float3(_2190, _2191, _2192), float3(((_1533 - _1578) * _140), (_1741 - _1589), ((_1539 - _1584) * _140)));
                  _2204 = (_2190 * _2200) + _1588;
                  _2205 = (_2191 * _2200) + _1589;
                  _2206 = (_2192 * _2200) + _1590;
                  _2207 = _1543 - _2204;
                  _2208 = _1741 - _2205;
                  _2209 = _1545 - _2206;
                  _2219 = sin(_2194);
                  _2220 = cos(_2194);
                  _2237 = (((_2204 - _1543) + (_2207 * _2220)) + (((_2208 * _2192) - (_2209 * _2191)) * _2219));
                  _2238 = (((_2205 - _1741) + (_2208 * _2220)) + (((_2209 * _2190) - (_2207 * _2192)) * _2219));
                  _2239 = (((_2206 - _1545) + (_2209 * _2220)) + (((_2207 * _2191) - (_2208 * _2190)) * _2219));
                } else {
                  _2237 = 0.0f;
                  _2238 = 0.0f;
                  _2239 = 0.0f;
                }
              } else {
                _2237 = 0.0f;
                _2238 = 0.0f;
                _2239 = 0.0f;
              }
            } else {
              _2237 = 0.0f;
              _2238 = 0.0f;
              _2239 = 0.0f;
            }
          } else {
            _2237 = 0.0f;
            _2238 = 0.0f;
            _2239 = 0.0f;
          }
          _2247 = ((_2237 * _309) + _1558);
          _2248 = ((_2238 * _309) + _1742);
          _2249 = ((_2239 * _309) + _1560);
          _2250 = ((_2038 * _309) + _1543);
          _2251 = ((_2039 * _309) + _1741);
          _2252 = ((_2040 * _309) + _1545);
        } else {
          _2247 = _1558;
          _2248 = _1742;
          _2249 = _1560;
          _2250 = _1543;
          _2251 = _1741;
          _2252 = _1545;
        }
        _2255 = rsqrt(dot(float3(_124, _126, _128), float3(_124, _126, _128)));  // [sem: invLength]
        _2256 = _2255 * _124;
        _2257 = _2255 * _126;
        _2258 = _2255 * _128;
        _2270 = (_viewPos.x - _currSceneTrailHeight._trailUpdatedPosition.x) + _151;
        _2271 = (_viewPos.y - _currSceneTrailHeight._trailUpdatedPosition.y) + _152;
        _2272 = (_viewPos.z - _currSceneTrailHeight._trailUpdatedPosition.z) + _153;
        _2288 = mad((_currSceneTrailHeight._trailViewProjTexScale[2].x), _2272, mad((_currSceneTrailHeight._trailViewProjTexScale[1].x), _2271, (_2270 * (_currSceneTrailHeight._trailViewProjTexScale[0].x)))) + (_currSceneTrailHeight._trailViewProjTexScale[3].x);
        _2292 = mad((_currSceneTrailHeight._trailViewProjTexScale[2].y), _2272, mad((_currSceneTrailHeight._trailViewProjTexScale[1].y), _2271, (_2270 * (_currSceneTrailHeight._trailViewProjTexScale[0].y)))) + (_currSceneTrailHeight._trailViewProjTexScale[3].y);
        __3__36__0__0__g_textureTrailHeight.GetDimensions(_2294.x, _2294.y);
        _2296 = (saturate(_2288) == _2288);
        if (!(_2296) || ((_2296) && (!(((saturate(_2292) == _2292) && (_2288 > (1.0f / float((int)((int)(_2294.x)))))) && (_2292 > (1.0f / float((int)((int)(_2294.y))))))))) {
          _2389 = (_viewPos.x + _151) - _currSceneTrailInteraction._trailUpdatedPosition.x;
          _2390 = (_viewPos.y + _152) - _currSceneTrailInteraction._trailUpdatedPosition.y;
          _2391 = (_viewPos.z + _153) - _currSceneTrailInteraction._trailUpdatedPosition.z;
          _2407 = mad((_currSceneTrailInteraction._trailViewProjTexScale[2].x), _2391, mad((_currSceneTrailInteraction._trailViewProjTexScale[1].x), _2390, ((_currSceneTrailInteraction._trailViewProjTexScale[0].x) * _2389))) + (_currSceneTrailInteraction._trailViewProjTexScale[3].x);
          _2411 = mad((_currSceneTrailInteraction._trailViewProjTexScale[2].y), _2391, mad((_currSceneTrailInteraction._trailViewProjTexScale[1].y), _2390, ((_currSceneTrailInteraction._trailViewProjTexScale[0].y) * _2389))) + (_currSceneTrailInteraction._trailViewProjTexScale[3].y);
          if (saturate(_2407) == _2407) {
            [branch]
            if (saturate(_2411) == _2411) {
  // [sem: _3__36__0__0__g_textureTrailInteraction_sampleLod]
              _2420 = __3__36__0__0__g_textureTrailInteraction.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_2407, _2411), 0.0f);
              _2426 = (_2420.x * 2.0f) + -1.0f;
              _2427 = (_2420.y * 2.0f) + -1.0f;
              _2429 = rsqrt(dot(float2(_2426, _2427), float2(_2426, _2427)));  // [sem: invLength]
              _2430 = _2426 * _2429;
              _2431 = _2427 * _2429;
              _2432 = saturate(_2420.w);  // [sem: expr_sat]
              if (_2432 > 0.0f) {
                _2445 = _2251 - _152;
                _2451 = sin(_time.x * 7.0f);
                _2456 = -0.0f - (_2257 * _2431);
                _2459 = (_2431 * _2256) - (_2430 * _2258);
                _2460 = _2430 * _2257;
                _2462 = rsqrt(dot(float3(_2456, _2459, _2460), float3(_2456, _2459, _2460)));  // [sem: invLength]
                _2463 = _2462 * _2456;
                _2464 = _2462 * _2459;
                _2465 = _2462 * _2460;
                _2470 = ((((_2432 * 0.9424778819084167f) * (1.0f / exp2(log2(max((_197 + -1.5f), 1.0f)) * 1.7999999523162842f))) * max((_2420.z * 2.0f), 1.0f)) * saturate((abs(_2445) * 0.25f) - (_197 * 0.029999999329447746f))) * (lerp(_2451, 1.0f, _2432));
                _2473 = dot(float3(_2463, _2464, _2465), float3((_2250 - _151), _2445, (_2252 - _153)));
                _2477 = (_2463 * _2473) + _151;
                _2478 = (_2464 * _2473) + _152;
                _2479 = (_2465 * _2473) + _153;
                _2480 = _2250 - _2477;
                _2481 = _2251 - _2478;
                _2482 = _2252 - _2479;
                _2492 = sin(_2470);
                _2493 = cos(_2470);
                _2503 = cos(_time.x * 10.0f);
                _2506 = ((cos(_time.x * 2.0f) - _2503) * _2432) + _2503;
                _2515 = (frac(_109 * 0.0625f) * 2.0f) + -1.0f;
                _2516 = (frac(_109) * 2.0f) + -1.0f;
                _2517 = (frac(_109 * 16.0f) * 2.0f) + -1.0f;
                _2525 = (_2432 * _108) * (0.6000000238418579f - (_2432 * 0.40000003576278687f));
                _2526 = saturate(2.0f / _197) * rsqrt(dot(float3(_2515, _2516, _2517), float3(_2515, _2516, _2517)));  // [sem: expr_sat]
                _2530 = _2506 * _2525;
                _2548 = ((((_2477 - _2250) + (_2480 * _2493)) + (((_2481 * _2465) - (_2482 * _2464)) * _2492)) + (((_2526 * _2525) * _2515) * _2506));
                _2549 = ((((_2478 - _2251) + (_2481 * _2493)) + (((_2482 * _2463) - (_2480 * _2465)) * _2492)) + ((_2526 * _2530) * _2517));
                _2550 = ((((_2479 - _2252) + (_2482 * _2493)) + (((_2480 * _2464) - (_2481 * _2463)) * _2492)) + ((_2526 * _2516) * _2530));
              } else {
                _2548 = 0.0f;
                _2549 = 0.0f;
                _2550 = 0.0f;
              }
            } else {
              _2548 = 0.0f;
              _2549 = 0.0f;
              _2550 = 0.0f;
            }
          } else {
            _2548 = 0.0f;
            _2549 = 0.0f;
            _2550 = 0.0f;
          }
        } else {
  // [sem: _3__36__0__0__g_textureTrailHeight_sampleLod]
          _2312 = __3__36__0__0__g_textureTrailHeight.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_2288, _2292), 0.0f);
          if (_2312.x < 1.0f) {
            _2345 = ((int)(uint)((int)((((_currSceneTrailHeight._trailUpdatedPosition.y + -1.0f) - _viewPos.y) + ((mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].y), _2312.x, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].y), _2292, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].y) * _2288))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].y)) / (mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].w), _2312.x, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].w), _2292, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].w) * _2288))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].w)))) < (_152 + 1.0f))));
          } else {
            _2345 = 1;
          }
          if ((_2312.y < 1.0f) && (_2312.y > 0.0f)) {
            _2379 = (((int)(uint)((int)((((_currSceneTrailHeight._trailUpdatedPosition.y + 0.20000000298023224f) - _viewPos.y) + ((mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].y), _2312.y, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].y), _2292, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].y) * _2288))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].y)) / (mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].w), _2312.y, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].w), _2292, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].w) * _2288))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].w)))) > (_152 + 1.0f)))) & _2345);
          } else {
            _2379 = _2345;
          }
          if (!(_2379 == 0)) {
            _2389 = (_viewPos.x + _151) - _currSceneTrailInteraction._trailUpdatedPosition.x;
            _2390 = (_viewPos.y + _152) - _currSceneTrailInteraction._trailUpdatedPosition.y;
            _2391 = (_viewPos.z + _153) - _currSceneTrailInteraction._trailUpdatedPosition.z;
            _2407 = mad((_currSceneTrailInteraction._trailViewProjTexScale[2].x), _2391, mad((_currSceneTrailInteraction._trailViewProjTexScale[1].x), _2390, ((_currSceneTrailInteraction._trailViewProjTexScale[0].x) * _2389))) + (_currSceneTrailInteraction._trailViewProjTexScale[3].x);
            _2411 = mad((_currSceneTrailInteraction._trailViewProjTexScale[2].y), _2391, mad((_currSceneTrailInteraction._trailViewProjTexScale[1].y), _2390, ((_currSceneTrailInteraction._trailViewProjTexScale[0].y) * _2389))) + (_currSceneTrailInteraction._trailViewProjTexScale[3].y);
            if (saturate(_2407) == _2407) {
              [branch]
              if (saturate(_2411) == _2411) {
  // [sem: _3__36__0__0__g_textureTrailInteraction_sampleLod]
                _2420 = __3__36__0__0__g_textureTrailInteraction.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_2407, _2411), 0.0f);
                _2426 = (_2420.x * 2.0f) + -1.0f;
                _2427 = (_2420.y * 2.0f) + -1.0f;
                _2429 = rsqrt(dot(float2(_2426, _2427), float2(_2426, _2427)));  // [sem: invLength]
                _2430 = _2426 * _2429;
                _2431 = _2427 * _2429;
                _2432 = saturate(_2420.w);  // [sem: expr_sat]
                if (_2432 > 0.0f) {
                  _2445 = _2251 - _152;
                  _2451 = sin(_time.x * 7.0f);
                  _2456 = -0.0f - (_2257 * _2431);
                  _2459 = (_2431 * _2256) - (_2430 * _2258);
                  _2460 = _2430 * _2257;
                  _2462 = rsqrt(dot(float3(_2456, _2459, _2460), float3(_2456, _2459, _2460)));  // [sem: invLength]
                  _2463 = _2462 * _2456;
                  _2464 = _2462 * _2459;
                  _2465 = _2462 * _2460;
                  _2470 = ((((_2432 * 0.9424778819084167f) * (1.0f / exp2(log2(max((_197 + -1.5f), 1.0f)) * 1.7999999523162842f))) * max((_2420.z * 2.0f), 1.0f)) * saturate((abs(_2445) * 0.25f) - (_197 * 0.029999999329447746f))) * (lerp(_2451, 1.0f, _2432));
                  _2473 = dot(float3(_2463, _2464, _2465), float3((_2250 - _151), _2445, (_2252 - _153)));
                  _2477 = (_2463 * _2473) + _151;
                  _2478 = (_2464 * _2473) + _152;
                  _2479 = (_2465 * _2473) + _153;
                  _2480 = _2250 - _2477;
                  _2481 = _2251 - _2478;
                  _2482 = _2252 - _2479;
                  _2492 = sin(_2470);
                  _2493 = cos(_2470);
                  _2503 = cos(_time.x * 10.0f);
                  _2506 = ((cos(_time.x * 2.0f) - _2503) * _2432) + _2503;
                  _2515 = (frac(_109 * 0.0625f) * 2.0f) + -1.0f;
                  _2516 = (frac(_109) * 2.0f) + -1.0f;
                  _2517 = (frac(_109 * 16.0f) * 2.0f) + -1.0f;
                  _2525 = (_2432 * _108) * (0.6000000238418579f - (_2432 * 0.40000003576278687f));
                  _2526 = saturate(2.0f / _197) * rsqrt(dot(float3(_2515, _2516, _2517), float3(_2515, _2516, _2517)));  // [sem: expr_sat]
                  _2530 = _2506 * _2525;
                  _2548 = ((((_2477 - _2250) + (_2480 * _2493)) + (((_2481 * _2465) - (_2482 * _2464)) * _2492)) + (((_2526 * _2525) * _2515) * _2506));
                  _2549 = ((((_2478 - _2251) + (_2481 * _2493)) + (((_2482 * _2463) - (_2480 * _2465)) * _2492)) + ((_2526 * _2530) * _2517));
                  _2550 = ((((_2479 - _2252) + (_2482 * _2493)) + (((_2480 * _2464) - (_2481 * _2463)) * _2492)) + ((_2526 * _2516) * _2530));
                } else {
                  _2548 = 0.0f;
                  _2549 = 0.0f;
                  _2550 = 0.0f;
                }
              } else {
                _2548 = 0.0f;
                _2549 = 0.0f;
                _2550 = 0.0f;
              }
            } else {
              _2548 = 0.0f;
              _2549 = 0.0f;
              _2550 = 0.0f;
            }
          } else {
            _2548 = 0.0f;
            _2549 = 0.0f;
            _2550 = 0.0f;
          }
        }
        if (!(_2296) || ((_2296) && (!(((saturate(_2292) == _2292) && (_2288 > (1.0f / float((int)((int)(_2294.x)))))) && (_2292 > (1.0f / float((int)((int)(_2294.y))))))))) {
          _2649 = (_viewPos.x + _151) - _prevSceneTrailInteraction._trailUpdatedPosition.x;
          _2650 = (_viewPos.y + _152) - _prevSceneTrailInteraction._trailUpdatedPosition.y;
          _2651 = (_viewPos.z + _153) - _prevSceneTrailInteraction._trailUpdatedPosition.z;
          _2667 = mad((_prevSceneTrailInteraction._trailViewProjTexScale[2].x), _2651, mad((_prevSceneTrailInteraction._trailViewProjTexScale[1].x), _2650, ((_prevSceneTrailInteraction._trailViewProjTexScale[0].x) * _2649))) + (_prevSceneTrailInteraction._trailViewProjTexScale[3].x);
          _2671 = mad((_prevSceneTrailInteraction._trailViewProjTexScale[2].y), _2651, mad((_prevSceneTrailInteraction._trailViewProjTexScale[1].y), _2650, ((_prevSceneTrailInteraction._trailViewProjTexScale[0].y) * _2649))) + (_prevSceneTrailInteraction._trailViewProjTexScale[3].y);
          if (saturate(_2667) == _2667) {
            [branch]
            if (saturate(_2671) == _2671) {
  // [sem: _3__36__0__0__g_textureTrailInteractionPrev_sampleLod]
              _2680 = __3__36__0__0__g_textureTrailInteractionPrev.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_2667, _2671), 0.0f);
              _2686 = (_2680.x * 2.0f) + -1.0f;
              _2687 = (_2680.y * 2.0f) + -1.0f;
              _2689 = rsqrt(dot(float2(_2686, _2687), float2(_2686, _2687)));  // [sem: invLength]
              _2690 = _2686 * _2689;
              _2691 = _2687 * _2689;
              _2692 = saturate(_2680.w);  // [sem: expr_sat]
              if (_2692 > 0.0f) {
                _2705 = _2251 - _152;
                _2711 = sin(_time.y * 7.0f);
                _2716 = -0.0f - (_2257 * _2691);
                _2719 = (_2691 * _2256) - (_2690 * _2258);
                _2720 = _2690 * _2257;
                _2722 = rsqrt(dot(float3(_2716, _2719, _2720), float3(_2716, _2719, _2720)));  // [sem: invLength]
                _2723 = _2722 * _2716;
                _2724 = _2722 * _2719;
                _2725 = _2722 * _2720;
                _2730 = ((((_2692 * 0.9424778819084167f) * (1.0f / exp2(log2(max((_197 + -1.5f), 1.0f)) * 1.7999999523162842f))) * max((_2680.z * 2.0f), 1.0f)) * saturate((abs(_2705) * 0.25f) - (_197 * 0.029999999329447746f))) * (lerp(_2711, 1.0f, _2692));
                _2733 = dot(float3(_2723, _2724, _2725), float3((_2250 - _151), _2705, (_2252 - _153)));
                _2737 = (_2723 * _2733) + _151;
                _2738 = (_2724 * _2733) + _152;
                _2739 = (_2725 * _2733) + _153;
                _2740 = _2250 - _2737;
                _2741 = _2251 - _2738;
                _2742 = _2252 - _2739;
                _2752 = sin(_2730);
                _2753 = cos(_2730);
                _2763 = cos(_time.y * 10.0f);
                _2766 = ((cos(_time.y * 2.0f) - _2763) * _2692) + _2763;
                _2775 = (frac(_109 * 0.0625f) * 2.0f) + -1.0f;
                _2776 = (frac(_109) * 2.0f) + -1.0f;
                _2777 = (frac(_109 * 16.0f) * 2.0f) + -1.0f;
                _2785 = (_2692 * _108) * (0.6000000238418579f - (_2692 * 0.40000003576278687f));
                _2786 = saturate(2.0f / _197) * rsqrt(dot(float3(_2775, _2776, _2777), float3(_2775, _2776, _2777)));  // [sem: expr_sat]
                _2790 = _2766 * _2785;
                _2808 = ((((_2737 - _2250) + (_2740 * _2753)) + (((_2741 * _2725) - (_2742 * _2724)) * _2752)) + (((_2786 * _2785) * _2775) * _2766));
                _2809 = ((((_2738 - _2251) + (_2741 * _2753)) + (((_2742 * _2723) - (_2740 * _2725)) * _2752)) + ((_2786 * _2790) * _2777));
                _2810 = ((((_2739 - _2252) + (_2742 * _2753)) + (((_2740 * _2724) - (_2741 * _2723)) * _2752)) + ((_2786 * _2776) * _2790));
              } else {
                _2808 = 0.0f;
                _2809 = 0.0f;
                _2810 = 0.0f;
              }
            } else {
              _2808 = 0.0f;
              _2809 = 0.0f;
              _2810 = 0.0f;
            }
          } else {
            _2808 = 0.0f;
            _2809 = 0.0f;
            _2810 = 0.0f;
          }
        } else {
  // [sem: _3__36__0__0__g_textureTrailHeight_sampleLod]
          _2572 = __3__36__0__0__g_textureTrailHeight.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_2288, _2292), 0.0f);
          if (_2572.x < 1.0f) {
            _2605 = ((int)(uint)((int)((((_currSceneTrailHeight._trailUpdatedPosition.y + -1.0f) - _viewPos.y) + ((mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].y), _2572.x, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].y), _2292, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].y) * _2288))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].y)) / (mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].w), _2572.x, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].w), _2292, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].w) * _2288))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].w)))) < (_152 + 1.0f))));
          } else {
            _2605 = 1;
          }
          if ((_2572.y < 1.0f) && (_2572.y > 0.0f)) {
            _2639 = (((int)(uint)((int)((((_currSceneTrailHeight._trailUpdatedPosition.y + 0.20000000298023224f) - _viewPos.y) + ((mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].y), _2572.y, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].y), _2292, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].y) * _2288))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].y)) / (mad((_currSceneTrailHeight._trailInvViewProjTexScale[2].w), _2572.y, mad((_currSceneTrailHeight._trailInvViewProjTexScale[1].w), _2292, ((_currSceneTrailHeight._trailInvViewProjTexScale[0].w) * _2288))) + (_currSceneTrailHeight._trailInvViewProjTexScale[3].w)))) > (_152 + 1.0f)))) & _2605);
          } else {
            _2639 = _2605;
          }
          if (!(_2639 == 0)) {
            _2649 = (_viewPos.x + _151) - _prevSceneTrailInteraction._trailUpdatedPosition.x;
            _2650 = (_viewPos.y + _152) - _prevSceneTrailInteraction._trailUpdatedPosition.y;
            _2651 = (_viewPos.z + _153) - _prevSceneTrailInteraction._trailUpdatedPosition.z;
            _2667 = mad((_prevSceneTrailInteraction._trailViewProjTexScale[2].x), _2651, mad((_prevSceneTrailInteraction._trailViewProjTexScale[1].x), _2650, ((_prevSceneTrailInteraction._trailViewProjTexScale[0].x) * _2649))) + (_prevSceneTrailInteraction._trailViewProjTexScale[3].x);
            _2671 = mad((_prevSceneTrailInteraction._trailViewProjTexScale[2].y), _2651, mad((_prevSceneTrailInteraction._trailViewProjTexScale[1].y), _2650, ((_prevSceneTrailInteraction._trailViewProjTexScale[0].y) * _2649))) + (_prevSceneTrailInteraction._trailViewProjTexScale[3].y);
            if (saturate(_2667) == _2667) {
              [branch]
              if (saturate(_2671) == _2671) {
  // [sem: _3__36__0__0__g_textureTrailInteractionPrev_sampleLod]
                _2680 = __3__36__0__0__g_textureTrailInteractionPrev.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_2667, _2671), 0.0f);
                _2686 = (_2680.x * 2.0f) + -1.0f;
                _2687 = (_2680.y * 2.0f) + -1.0f;
                _2689 = rsqrt(dot(float2(_2686, _2687), float2(_2686, _2687)));  // [sem: invLength]
                _2690 = _2686 * _2689;
                _2691 = _2687 * _2689;
                _2692 = saturate(_2680.w);  // [sem: expr_sat]
                if (_2692 > 0.0f) {
                  _2705 = _2251 - _152;
                  _2711 = sin(_time.y * 7.0f);
                  _2716 = -0.0f - (_2257 * _2691);
                  _2719 = (_2691 * _2256) - (_2690 * _2258);
                  _2720 = _2690 * _2257;
                  _2722 = rsqrt(dot(float3(_2716, _2719, _2720), float3(_2716, _2719, _2720)));  // [sem: invLength]
                  _2723 = _2722 * _2716;
                  _2724 = _2722 * _2719;
                  _2725 = _2722 * _2720;
                  _2730 = ((((_2692 * 0.9424778819084167f) * (1.0f / exp2(log2(max((_197 + -1.5f), 1.0f)) * 1.7999999523162842f))) * max((_2680.z * 2.0f), 1.0f)) * saturate((abs(_2705) * 0.25f) - (_197 * 0.029999999329447746f))) * (lerp(_2711, 1.0f, _2692));
                  _2733 = dot(float3(_2723, _2724, _2725), float3((_2250 - _151), _2705, (_2252 - _153)));
                  _2737 = (_2723 * _2733) + _151;
                  _2738 = (_2724 * _2733) + _152;
                  _2739 = (_2725 * _2733) + _153;
                  _2740 = _2250 - _2737;
                  _2741 = _2251 - _2738;
                  _2742 = _2252 - _2739;
                  _2752 = sin(_2730);
                  _2753 = cos(_2730);
                  _2763 = cos(_time.y * 10.0f);
                  _2766 = ((cos(_time.y * 2.0f) - _2763) * _2692) + _2763;
                  _2775 = (frac(_109 * 0.0625f) * 2.0f) + -1.0f;
                  _2776 = (frac(_109) * 2.0f) + -1.0f;
                  _2777 = (frac(_109 * 16.0f) * 2.0f) + -1.0f;
                  _2785 = (_2692 * _108) * (0.6000000238418579f - (_2692 * 0.40000003576278687f));
                  _2786 = saturate(2.0f / _197) * rsqrt(dot(float3(_2775, _2776, _2777), float3(_2775, _2776, _2777)));  // [sem: expr_sat]
                  _2790 = _2766 * _2785;
                  _2808 = ((((_2737 - _2250) + (_2740 * _2753)) + (((_2741 * _2725) - (_2742 * _2724)) * _2752)) + (((_2786 * _2785) * _2775) * _2766));
                  _2809 = ((((_2738 - _2251) + (_2741 * _2753)) + (((_2742 * _2723) - (_2740 * _2725)) * _2752)) + ((_2786 * _2790) * _2777));
                  _2810 = ((((_2739 - _2252) + (_2742 * _2753)) + (((_2740 * _2724) - (_2741 * _2723)) * _2752)) + ((_2786 * _2776) * _2790));
                } else {
                  _2808 = 0.0f;
                  _2809 = 0.0f;
                  _2810 = 0.0f;
                }
              } else {
                _2808 = 0.0f;
                _2809 = 0.0f;
                _2810 = 0.0f;
              }
            } else {
              _2808 = 0.0f;
              _2809 = 0.0f;
              _2810 = 0.0f;
            }
          } else {
            _2808 = 0.0f;
            _2809 = 0.0f;
            _2810 = 0.0f;
          }
        }
        _2818 = ((_2548 * _309) + _2250);
        _2819 = ((_2549 * _309) + _2251);
        _2820 = ((_2550 * _309) + _2252);
        _2821 = ((_2808 * _309) + _2247);
        _2822 = ((_2809 * _309) + _2248);
        _2823 = ((_2810 * _309) + _2249);
      } else {
        _2818 = _1543;
        _2819 = _1741;
        _2820 = _1545;
        _2821 = _1558;
        _2822 = _1742;
        _2823 = _1560;
      }
      _2847 = mad((_viewProjRelativePrev[2].x), _2823, mad((_viewProjRelativePrev[1].x), _2822, ((_viewProjRelativePrev[0].x) * _2821))) + (_viewProjRelativePrev[3].x);
      _2851 = mad((_viewProjRelativePrev[2].y), _2823, mad((_viewProjRelativePrev[1].y), _2822, ((_viewProjRelativePrev[0].y) * _2821))) + (_viewProjRelativePrev[3].y);
      _2855 = mad((_viewProjRelativePrev[2].z), _2823, mad((_viewProjRelativePrev[1].z), _2822, ((_viewProjRelativePrev[0].z) * _2821))) + (_viewProjRelativePrev[3].z);
      _2859 = mad((_viewProjRelativePrev[2].w), _2823, mad((_viewProjRelativePrev[1].w), _2822, ((_viewProjRelativePrev[0].w) * _2821))) + (_viewProjRelativePrev[3].w);
      _2883 = mad((_viewProjRelative[2].x), _2820, mad((_viewProjRelative[1].x), _2819, ((_viewProjRelative[0].x) * _2818))) + (_viewProjRelative[3].x);
      _2887 = mad((_viewProjRelative[2].y), _2820, mad((_viewProjRelative[1].y), _2819, ((_viewProjRelative[0].y) * _2818))) + (_viewProjRelative[3].y);
      _2891 = mad((_viewProjRelative[2].z), _2820, mad((_viewProjRelative[1].z), _2819, ((_viewProjRelative[0].z) * _2818))) + (_viewProjRelative[3].z);
      _2895 = mad((_viewProjRelative[2].w), _2820, mad((_viewProjRelative[1].w), _2819, ((_viewProjRelative[0].w) * _2818))) + (_viewProjRelative[3].w);
      _2897 = rsqrt(dot(float3(_1563, _1566, _1569), float3(_1563, _1566, _1569)));  // [sem: invLength]
      _2901 = half(_2897 * _1563);
      _2902 = half(_2897 * _1566);
      _2903 = half(_2897 * _1569);
      _2906 = half((((float)((uint16_t)((uint)(_71 & 255)))) * 0.003921568859368563f) * min(2.0f, _140));
      _2907 = _drawIndex | -16777216;
      _2911 = select((_variableRateShadingParams.x > 0.0f), 5, 0);
      if ((SV_VertexID != 0) && (((int)(SV_VertexID % 40)) == 0)) {
        if (sqrt(((_2819 * _2819) + (_2818 * _2818)) + (_2820 * _2820)) < 4.0f) {
          __3__39__0__1__g_treeSurfacePositionsCounterBufferUAV.InterlockedAdd(0, 1, _2926);
          if ((uint)_2926 < (uint)1024) {
            TreeSurfacePositionData __struct_store_3;
            __struct_store_3._worldPos = float4((_viewPos.x + _2818), (_viewPos.y + _2819), (_viewPos.z + _2820), 1.0f);
            __struct_store_3._worldPosPrev = float4((_viewPosPrev.x + _2821), (_viewPosPrev.y + _2822), (_viewPosPrev.z + _2823), 1.0f);
            __3__39__0__1__g_treeSurfacePositionsBufferUAV[_2926] = __struct_store_3;
            _2945 = _98;
            _2946 = _2847;
            _2947 = _2851;
            _2948 = _2855;
            _2949 = _2859;
            _2950 = _2901;
            _2951 = _2902;
            _2952 = _2903;
            _2953 = _2906;
            _2954 = _2907;
            _2955 = _297;
            _2956 = _2911;
            _2957 = _2883;
            _2958 = _2887;
            _2959 = _2891;
            _2960 = _2895;
          } else {
            _2945 = _98;
            _2946 = _2847;
            _2947 = _2851;
            _2948 = _2855;
            _2949 = _2859;
            _2950 = _2901;
            _2951 = _2902;
            _2952 = _2903;
            _2953 = _2906;
            _2954 = _2907;
            _2955 = _297;
            _2956 = _2911;
            _2957 = _2883;
            _2958 = _2887;
            _2959 = _2891;
            _2960 = _2895;
          }
        } else {
          _2945 = _98;
          _2946 = _2847;
          _2947 = _2851;
          _2948 = _2855;
          _2949 = _2859;
          _2950 = _2901;
          _2951 = _2902;
          _2952 = _2903;
          _2953 = _2906;
          _2954 = _2907;
          _2955 = _297;
          _2956 = _2911;
          _2957 = _2883;
          _2958 = _2887;
          _2959 = _2891;
          _2960 = _2895;
        }
      } else {
        _2945 = _98;
        _2946 = _2847;
        _2947 = _2851;
        _2948 = _2855;
        _2949 = _2859;
        _2950 = _2901;
        _2951 = _2902;
        _2952 = _2903;
        _2953 = _2906;
        _2954 = _2907;
        _2955 = _297;
        _2956 = _2911;
        _2957 = _2883;
        _2958 = _2887;
        _2959 = _2891;
        _2960 = _2895;
      }
    }
  } else {
    _2818 = _1543;
    _2819 = _1544;
    _2820 = _1545;
    _2821 = _1558;
    _2822 = _1559;
    _2823 = _1560;
    _2847 = mad((_viewProjRelativePrev[2].x), _2823, mad((_viewProjRelativePrev[1].x), _2822, ((_viewProjRelativePrev[0].x) * _2821))) + (_viewProjRelativePrev[3].x);
    _2851 = mad((_viewProjRelativePrev[2].y), _2823, mad((_viewProjRelativePrev[1].y), _2822, ((_viewProjRelativePrev[0].y) * _2821))) + (_viewProjRelativePrev[3].y);
    _2855 = mad((_viewProjRelativePrev[2].z), _2823, mad((_viewProjRelativePrev[1].z), _2822, ((_viewProjRelativePrev[0].z) * _2821))) + (_viewProjRelativePrev[3].z);
    _2859 = mad((_viewProjRelativePrev[2].w), _2823, mad((_viewProjRelativePrev[1].w), _2822, ((_viewProjRelativePrev[0].w) * _2821))) + (_viewProjRelativePrev[3].w);
    _2883 = mad((_viewProjRelative[2].x), _2820, mad((_viewProjRelative[1].x), _2819, ((_viewProjRelative[0].x) * _2818))) + (_viewProjRelative[3].x);
    _2887 = mad((_viewProjRelative[2].y), _2820, mad((_viewProjRelative[1].y), _2819, ((_viewProjRelative[0].y) * _2818))) + (_viewProjRelative[3].y);
    _2891 = mad((_viewProjRelative[2].z), _2820, mad((_viewProjRelative[1].z), _2819, ((_viewProjRelative[0].z) * _2818))) + (_viewProjRelative[3].z);
    _2895 = mad((_viewProjRelative[2].w), _2820, mad((_viewProjRelative[1].w), _2819, ((_viewProjRelative[0].w) * _2818))) + (_viewProjRelative[3].w);
    _2897 = rsqrt(dot(float3(_1563, _1566, _1569), float3(_1563, _1566, _1569)));  // [sem: invLength]
    _2901 = half(_2897 * _1563);
    _2902 = half(_2897 * _1566);
    _2903 = half(_2897 * _1569);
    _2906 = half((((float)((uint16_t)((uint)(_71 & 255)))) * 0.003921568859368563f) * min(2.0f, _140));
    _2907 = _drawIndex | -16777216;
    _2911 = select((_variableRateShadingParams.x > 0.0f), 5, 0);
    if ((SV_VertexID != 0) && (((int)(SV_VertexID % 40)) == 0)) {
      if (sqrt(((_2819 * _2819) + (_2818 * _2818)) + (_2820 * _2820)) < 4.0f) {
        __3__39__0__1__g_treeSurfacePositionsCounterBufferUAV.InterlockedAdd(0, 1, _2926);
        if ((uint)_2926 < (uint)1024) {
          TreeSurfacePositionData __struct_store_4;
          __struct_store_4._worldPos = float4((_viewPos.x + _2818), (_viewPos.y + _2819), (_viewPos.z + _2820), 1.0f);
          __struct_store_4._worldPosPrev = float4((_viewPosPrev.x + _2821), (_viewPosPrev.y + _2822), (_viewPosPrev.z + _2823), 1.0f);
          __3__39__0__1__g_treeSurfacePositionsBufferUAV[_2926] = __struct_store_4;
          _2945 = _98;
          _2946 = _2847;
          _2947 = _2851;
          _2948 = _2855;
          _2949 = _2859;
          _2950 = _2901;
          _2951 = _2902;
          _2952 = _2903;
          _2953 = _2906;
          _2954 = _2907;
          _2955 = _297;
          _2956 = _2911;
          _2957 = _2883;
          _2958 = _2887;
          _2959 = _2891;
          _2960 = _2895;
        } else {
          _2945 = _98;
          _2946 = _2847;
          _2947 = _2851;
          _2948 = _2855;
          _2949 = _2859;
          _2950 = _2901;
          _2951 = _2902;
          _2952 = _2903;
          _2953 = _2906;
          _2954 = _2907;
          _2955 = _297;
          _2956 = _2911;
          _2957 = _2883;
          _2958 = _2887;
          _2959 = _2891;
          _2960 = _2895;
        }
      } else {
        _2945 = _98;
        _2946 = _2847;
        _2947 = _2851;
        _2948 = _2855;
        _2949 = _2859;
        _2950 = _2901;
        _2951 = _2902;
        _2952 = _2903;
        _2953 = _2906;
        _2954 = _2907;
        _2955 = _297;
        _2956 = _2911;
        _2957 = _2883;
        _2958 = _2887;
        _2959 = _2891;
        _2960 = _2895;
      }
    } else {
      _2945 = _98;
      _2946 = _2847;
      _2947 = _2851;
      _2948 = _2855;
      _2949 = _2859;
      _2950 = _2901;
      _2951 = _2902;
      _2952 = _2903;
      _2953 = _2906;
      _2954 = _2907;
      _2955 = _297;
      _2956 = _2911;
      _2957 = _2883;
      _2958 = _2887;
      _2959 = _2891;
      _2960 = _2895;
    }
  }
  SV_Position.x = _2957;
  SV_Position.y = _2958;
  SV_Position.z = _2959;
  SV_Position.w = _2960;
  TEXCOORD.x = float(_75);
  TEXCOORD.y = float(_76);
  TEXCOORD.z = _2945;
  TEXCOORD.w = 0.0f;
  TEXCOORD_1.x = _2946;
  TEXCOORD_1.y = _2947;
  TEXCOORD_1.z = _2948;
  TEXCOORD_1.w = _2949;
  NORMAL.x = _2950;
  NORMAL.y = _2951;
  NORMAL.z = _2952;
  NORMAL.w = _2953;
  TEXCOORD_2.x = _2954;
  TEXCOORD_2.y = (uint)(asint(_130));
  SV_ClipDistance = _2955;
  SV_ShadingRate = _2956;
  OutputSignature output_signature = { SV_Position, TEXCOORD, TEXCOORD_1, NORMAL, TEXCOORD_2, SV_ClipDistance, SV_ShadingRate };
  return output_signature;
}
