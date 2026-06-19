#include "../shared.h"

struct LightDataEncoded {
  float4 _position;
  float4 _color;
  uint2 _up;
  uint2 _look;
  int4 _shadowParam;
};

struct ManyLightsData {
  float4 _position;
  float4 _color;
  uint2 _up;
  uint2 _look;
};


StructuredBuffer<LightDataEncoded> __3__37__0__0__g_globalLightDataBuffer : register(t6, space37);

StructuredBuffer<LightDataEncoded> __3__37__0__0__g_lightInjectDataBuffer : register(t14, space37);

RWByteAddressBuffer __3__39__0__1__g_structureCounterBufferUAV : register(u3, space39);

RWStructuredBuffer<ManyLightsData> __3__39__0__1__g_manyLightsDataBufferUAV : register(u12, space39);

cbuffer __3__35__0__0__SceneConstantBuffer : register(b4, space35) {
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

cbuffer __3__35__0__0__ExposureConstantBuffer : register(b21, space35) {
  float4 _exposure0 : packoffset(c000.x);
  float4 _exposure1 : packoffset(c001.x);
  float4 _exposure2 : packoffset(c002.x);
  float4 _exposure3 : packoffset(c003.x);
  float4 _exposure4 : packoffset(c004.x);
};

cbuffer __3__35__0__0__LightProfileConstantBuffer : register(b3, space35) {
  struct {
    float4 _lightProfileInfos[4096];
  } __3__35__0__0__LightProfileConstantBuffer_view : packoffset(c000.x);

  // Raw views preserve dynamic cbufferLoadLegacy.f32/i32 access.
  float4 __3__35__0__0__LightProfileConstantBuffer_raw[4096] : packoffset(c0);
  uint4 __3__35__0__0__LightProfileConstantBuffer_raw_uint[4096] : packoffset(c0);
};

cbuffer __3__1__0__0__GenerateVoxelConstants : register(b0, space1) {
  int4 _srcStartIndex : packoffset(c000.x);
  int4 _dstStartIndex : packoffset(c001.x);
  int4 _customParams : packoffset(c002.x);
  float4 _clearColor : packoffset(c003.x);
  float4 _generateParams : packoffset(c004.x);
  float4 _generateParams2 : packoffset(c005.x);
  row_major float4x4 _viewProjRelativeMainView : packoffset(c006.x);
  uint4 _lightGroupParams : packoffset(c010.x);
  uint _clearVoxelFlag : packoffset(c011.x);
};

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

[numthreads(256, 1, 1)]
void main(
  uint3 SV_DispatchThreadID : SV_DispatchThreadID,
  uint3 SV_GroupID : SV_GroupID,
  uint3 SV_GroupThreadID : SV_GroupThreadID,
  uint SV_GroupIndex : SV_GroupIndex
) {
  uint _33;
  int _89;
  int _90;
  int _91;
  int _92;
  int _93;
  int _94;
  float _95;
  float _96;
  float _97;
  float _98;
  float _99;
  float _100;
  float _101;
  float _127;
  float _128;
  float _148;
  float _165;
  bool _46;
  float _50;
  float _51;
  float _52;
  float _54;
  float _55;
  float _56;
  float _57;
  int _59;
  int _60;
  int _62;
  int _63;
  int _65;
  int _66;
  uint _68;
  float _71;
  float _72;
  float _73;
  float _75;
  float _76;
  float _77;
  float _78;
  int _80;
  int _81;
  int _83;
  int _84;
  int _86;
  int _87;
  float _112;
  float _113;
  float _114;
  int _130;
  float4 _132;
  float _152;
  float _166;
  float _171;
  float _188;
  float _9[4];
  int _15[11];
  _15[0] = ((int)((uint)(_srcStartIndex.z) + (uint)(_srcStartIndex.y)));
  _15[1] = _srcStartIndex.z;
  _15[2] = _srcStartIndex.z;
  _15[3] = -1;
  _15[4] = -1;
  _15[5] = -1;
  _15[6] = 0;
  _15[7] = 0;
  _15[8] = 0;
  _15[9] = 0;
  _15[10] = 0;
  _33 = (int)(SV_DispatchThreadID.x) << 2;
  if ((uint)_33 < (uint)41) {
    __3__39__0__1__g_structureCounterBufferUAV.Store(_33, asuint((_15[min((uint)((int)(SV_DispatchThreadID.x)), 10u)])));
  } else {
    if ((uint)_33 < (uint)297) {
      __3__39__0__1__g_structureCounterBufferUAV.Store(_33, asuint(0));
    }
  }
  if ((uint)(int)(SV_DispatchThreadID.x) < (uint)_srcStartIndex.x) {
    _46 = ((uint)(int)(SV_DispatchThreadID.x) < (uint)_srcStartIndex.z);
    [branch]
    if (_46) {
      _50 = __3__37__0__0__g_globalLightDataBuffer[(int)(SV_DispatchThreadID.x)]._position.x;
      _51 = __3__37__0__0__g_globalLightDataBuffer[(int)(SV_DispatchThreadID.x)]._position.y;
      _52 = __3__37__0__0__g_globalLightDataBuffer[(int)(SV_DispatchThreadID.x)]._position.z;
      _54 = __3__37__0__0__g_globalLightDataBuffer[(int)(SV_DispatchThreadID.x)]._color.x;
      _55 = __3__37__0__0__g_globalLightDataBuffer[(int)(SV_DispatchThreadID.x)]._color.y;
      _56 = __3__37__0__0__g_globalLightDataBuffer[(int)(SV_DispatchThreadID.x)]._color.z;
      _57 = __3__37__0__0__g_globalLightDataBuffer[(int)(SV_DispatchThreadID.x)]._color.w;
      _59 = __3__37__0__0__g_globalLightDataBuffer[(int)(SV_DispatchThreadID.x)]._up.x;
      _60 = __3__37__0__0__g_globalLightDataBuffer[(int)(SV_DispatchThreadID.x)]._up.y;
      _62 = __3__37__0__0__g_globalLightDataBuffer[(int)(SV_DispatchThreadID.x)]._look.x;
      _63 = __3__37__0__0__g_globalLightDataBuffer[(int)(SV_DispatchThreadID.x)]._look.y;
      _65 = __3__37__0__0__g_globalLightDataBuffer[(int)(SV_DispatchThreadID.x)]._shadowParam.y;
      _66 = __3__37__0__0__g_globalLightDataBuffer[(int)(SV_DispatchThreadID.x)]._shadowParam.w;
      _89 = _65;
      _90 = _66;
      _91 = _62;
      _92 = _63;
      _93 = _59;
      _94 = _60;
      _95 = _54;
      _96 = _55;
      _97 = _56;
      _98 = _57;
      _99 = _50;
      _100 = _51;
      _101 = _52;
    } else {
      _68 = SV_DispatchThreadID.x - (uint)(_srcStartIndex.z);
      _71 = __3__37__0__0__g_lightInjectDataBuffer[_68]._position.x;
      _72 = __3__37__0__0__g_lightInjectDataBuffer[_68]._position.y;
      _73 = __3__37__0__0__g_lightInjectDataBuffer[_68]._position.z;
      _75 = __3__37__0__0__g_lightInjectDataBuffer[_68]._color.x;
      _76 = __3__37__0__0__g_lightInjectDataBuffer[_68]._color.y;
      _77 = __3__37__0__0__g_lightInjectDataBuffer[_68]._color.z;
      _78 = __3__37__0__0__g_lightInjectDataBuffer[_68]._color.w;
      _80 = __3__37__0__0__g_lightInjectDataBuffer[_68]._up.x;
      _81 = __3__37__0__0__g_lightInjectDataBuffer[_68]._up.y;
      _83 = __3__37__0__0__g_lightInjectDataBuffer[_68]._look.x;
      _84 = __3__37__0__0__g_lightInjectDataBuffer[_68]._look.y;
      _86 = __3__37__0__0__g_lightInjectDataBuffer[_68]._shadowParam.y;
      _87 = __3__37__0__0__g_lightInjectDataBuffer[_68]._shadowParam.w;
      _89 = _86;
      _90 = _87;
      _91 = _83;
      _92 = _84;
      _93 = _80;
      _94 = _81;
      _95 = _75;
      _96 = _76;
      _97 = _77;
      _98 = _78;
      _99 = _71;
      _100 = _72;
      _101 = _73;
    }
    bool _rndx_is_hero_light = ((_95 < 0.0f) || (_96 < 0.0f)) || (_97 < 0.0f);
    if (_rndx_is_hero_light) {
      _112 = _99 - _viewPos.x;
      _113 = _100 - _viewPos.y;
      _114 = _101 - _viewPos.z;
      _127 = dot(float3((_view[0].x), (_view[1].x), (_view[2].x)), float3(_112, _113, _114));
      _128 = dot(float3((_view[0].y), (_view[1].y), (_view[2].y)), float3(_112, _113, _114));
    } else {
      _127 = _99;
      _128 = _100;
    }
    _130 = (int)(_90) >> 1;
    _132 = __3__35__0__0__LightProfileConstantBuffer_raw[((int)((uint)(_89) >> 2))];
    _9[0] = _132.x;
    _9[1] = _132.y;
    _9[2] = _132.z;
    _9[3] = _132.w;
    if (!(_89 == -1)) {
      _148 = min(3.1415927410125732f, (_9[min((uint)((_89 & 3)), 3u)]));
    } else {
      _148 = 3.1415927410125732f;
    }
    _152 = 1.0f / max(9.999999747378752e-05f, _exposure0.x);
    if (_130 == 1) {
      _165 = min(((saturate(_152 * 0.009999999776482582f) * 9.899999618530273f) + 0.10000000149011612f), max(0.009999999776482582f, _152));
    } else {
      _165 = min(max(_152, 0.05000000074505806f), 150.0f);
    }
    _166 = select(_46, 1e+06f, _98);
    _171 = saturate((float)((uint)_130));  // [sem: expr_sat]
    _188 = select(((_isPhotosensitiveMode_isAllolwBlood & 2) != 0), 0.10000000149011612f, 1.0f);
    float _189 = _188 * ((((_165 * _95) - _95) * _171) + _95);
    float _190 = _188 * ((((_165 * _96) - _96) * _171) + _96);
    float _191 = _188 * ((((_165 * _97) - _97) * _171) + _97);
    // RenoDX: >>> [Patch: DisableHeroLights] [Version: 1.10]
    // Description: Crimson Desert encodes hero-local light injections with negative color components, then converts them into many-lights entries. This patch preserves the vanilla identification path but zeros those encoded light colors when the existing hero-light suppression setting is enabled, matching the shipped 1.09 behavior on the 1.10 successor shader.
    if (DISABLE_HERO_LIGHTS > 0.5f && _rndx_is_hero_light) {
      _189 = 0.0f;
      _190 = 0.0f;
      _191 = 0.0f;
    }
    // RenoDX: <<< [Patch: DisableHeroLights]
    ManyLightsData __struct_store_0;
    __struct_store_0._position = float4(_127, _128, _101, _148);
    __struct_store_0._color = float4(_189, _190, _191, select(((_90 & 1) != 0), (-0.0f - _166), _166));
    __struct_store_0._up = int2(_93, _94);
    __struct_store_0._look = int2(_91, _92);
    __3__39__0__1__g_manyLightsDataBufferUAV[(int)(SV_DispatchThreadID.x)] = __struct_store_0;
  }
}
