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

RWByteAddressBuffer __3__39__0__1__g_structureCounterBufferUAV : register(u5, space39);

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

cbuffer __3__35__0__0__ExposureConstantBuffer : register(b21, space35) {
  float4 _exposure0 : packoffset(c000.x);
  float4 _exposure1 : packoffset(c001.x);
  float4 _exposure2 : packoffset(c002.x);
  float4 _exposure3 : packoffset(c003.x);
  float4 _exposure4 : packoffset(c004.x);
};

cbuffer __3__35__0__0__LightProfileConstantBuffer : register(b3, space35) {
  float4 _lightProfileInfos[4096] : packoffset(c000.x);
};

cbuffer __3__1__0__0__GenerateVoxelConstants : register(b0, space1) {
  int4 _srcStartIndex : packoffset(c000.x);
  int4 _dstStartIndex : packoffset(c001.x);
  int4 _customParams : packoffset(c002.x);
  float4 _clearColor : packoffset(c003.x);
  float4 _generateParams : packoffset(c004.x);
  float4 _generateParams2 : packoffset(c005.x);
  column_major float4x4 _viewProjRelativeMainView : packoffset(c006.x);
  uint4 _lightGroupParams : packoffset(c010.x);
  uint _clearVoxelFlag : packoffset(c011.x);
};

[numthreads(256, 1, 1)]
void main(
  uint3 SV_DispatchThreadID : SV_DispatchThreadID,
  uint3 SV_GroupID : SV_GroupID,
  uint3 SV_GroupThreadID : SV_GroupThreadID,
  uint SV_GroupIndex : SV_GroupIndex
) {
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
  bool _34 = ((uint)((int)(SV_DispatchThreadID.x << 2)) < (uint)41);
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
  int _store_addr_0 = ((int)(SV_DispatchThreadID.x << 2));
  if (_34) {
    __3__39__0__1__g_structureCounterBufferUAV.Store(_store_addr_0, asuint(_15[SV_DispatchThreadID.x]));
  } else {
    bool _40 = ((uint)(_store_addr_0) < (uint)297);
    if (_40) {
      __3__39__0__1__g_structureCounterBufferUAV.Store(_store_addr_0, asuint(0));
    }
  }
  bool _44 = ((uint)(int)(SV_DispatchThreadID.x) < (uint)_srcStartIndex.x);
  if (_44) {
    bool _46 = ((uint)(int)(SV_DispatchThreadID.x) < (uint)_srcStartIndex.z);
    [branch]
    if (_46) {
      float _50 = __3__37__0__0__g_globalLightDataBuffer[(int)(SV_DispatchThreadID.x)]._position.x;
      float _51 = __3__37__0__0__g_globalLightDataBuffer[(int)(SV_DispatchThreadID.x)]._position.y;
      float _52 = __3__37__0__0__g_globalLightDataBuffer[(int)(SV_DispatchThreadID.x)]._position.z;
      float _54 = __3__37__0__0__g_globalLightDataBuffer[(int)(SV_DispatchThreadID.x)]._color.x;
      float _55 = __3__37__0__0__g_globalLightDataBuffer[(int)(SV_DispatchThreadID.x)]._color.y;
      float _56 = __3__37__0__0__g_globalLightDataBuffer[(int)(SV_DispatchThreadID.x)]._color.z;
      float _57 = __3__37__0__0__g_globalLightDataBuffer[(int)(SV_DispatchThreadID.x)]._color.w;
      int _59 = __3__37__0__0__g_globalLightDataBuffer[(int)(SV_DispatchThreadID.x)]._up.x;
      int _60 = __3__37__0__0__g_globalLightDataBuffer[(int)(SV_DispatchThreadID.x)]._up.y;
      int _62 = __3__37__0__0__g_globalLightDataBuffer[(int)(SV_DispatchThreadID.x)]._look.x;
      int _63 = __3__37__0__0__g_globalLightDataBuffer[(int)(SV_DispatchThreadID.x)]._look.y;
      int _65 = __3__37__0__0__g_globalLightDataBuffer[(int)(SV_DispatchThreadID.x)]._shadowParam.y;
      int _66 = __3__37__0__0__g_globalLightDataBuffer[(int)(SV_DispatchThreadID.x)]._shadowParam.w;
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
      uint _68 = SV_DispatchThreadID.x - (uint)(_srcStartIndex.z);
      float _71 = __3__37__0__0__g_lightInjectDataBuffer[(int)(_68)]._position.x;
      float _72 = __3__37__0__0__g_lightInjectDataBuffer[(int)(_68)]._position.y;
      float _73 = __3__37__0__0__g_lightInjectDataBuffer[(int)(_68)]._position.z;
      float _75 = __3__37__0__0__g_lightInjectDataBuffer[(int)(_68)]._color.x;
      float _76 = __3__37__0__0__g_lightInjectDataBuffer[(int)(_68)]._color.y;
      float _77 = __3__37__0__0__g_lightInjectDataBuffer[(int)(_68)]._color.z;
      float _78 = __3__37__0__0__g_lightInjectDataBuffer[(int)(_68)]._color.w;
      int _80 = __3__37__0__0__g_lightInjectDataBuffer[(int)(_68)]._up.x;
      int _81 = __3__37__0__0__g_lightInjectDataBuffer[(int)(_68)]._up.y;
      int _83 = __3__37__0__0__g_lightInjectDataBuffer[(int)(_68)]._look.x;
      int _84 = __3__37__0__0__g_lightInjectDataBuffer[(int)(_68)]._look.y;
      int _86 = __3__37__0__0__g_lightInjectDataBuffer[(int)(_68)]._shadowParam.y;
      int _87 = __3__37__0__0__g_lightInjectDataBuffer[(int)(_68)]._shadowParam.w;
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
    bool _102 = (_95 < 0.0f);
    bool _103 = (_96 < 0.0f);
    bool _106 = ((_102) || (_103) || (_97 < 0.0f));
    if (_106) {
      float _112 = _99 - _viewPos.x;
      float _113 = _100 - _viewPos.y;
      float _114 = _101 - _viewPos.z;
      float _121 = dot(float3((_view[0].x), (_view[0].y), (_view[0].z)), float3(_112, _113, _114));
      float _125 = dot(float3((_view[1].x), (_view[1].y), (_view[1].z)), float3(_112, _113, _114));
      _127 = _121;
      _128 = _125;
    } else {
      _127 = _99;
      _128 = _100;
    }
    int _129 = _90 & 1;
    uint _130 = _90 >> 1;
    int _131 = (uint)((uint)(_89)) >> 2;
    _9[0] = ((_lightProfileInfos[_131]).x);
    _9[1] = ((_lightProfileInfos[_131]).y);
    _9[2] = ((_lightProfileInfos[_131]).z);
    _9[3] = ((_lightProfileInfos[_131]).w);
    bool _141 = (_89 == -1);
    if (!_141) {
      int _143 = _89 & 3;
      float _145 = _9[_143];
      float _146 = min(3.1415927410125732f, _145);
      _148 = _146;
    } else {
      _148 = 3.1415927410125732f;
    }
    float _151 = max(9.999999747378752e-05f, _exposure0.x);
    float _152 = 1.0f / _151;
    bool _153 = ((int)(_130) == 1);
    if (_153) {
      float _155 = max(0.009999999776482582f, _152);
      float _156 = _152 * 0.009999999776482582f;
      float _157 = saturate(_156);
      float _158 = _157 * 9.899999618530273f;
      float _159 = _158 + 0.10000000149011612f;
      float _160 = min(_159, _155);
      _165 = _160;
    } else {
      float _162 = max(_152, 0.05000000074505806f);
      float _163 = min(_162, 150.0f);
      _165 = _163;
    }
    float _166 = select(_46, 1e+06f, _98);
    bool _167 = (_129 != 0);
    float _168 = -0.0f - _166;
    float _169 = select(_167, _168, _166);
    float _170 = float((uint)_130);
    float _171 = saturate(_170);
    float _172 = _165 * _95;
    float _173 = _165 * _96;
    float _174 = _165 * _97;
    float _175 = _172 - _95;
    float _176 = _173 - _96;
    float _177 = _174 - _97;
    float _178 = _175 * _171;
    float _179 = _176 * _171;
    float _180 = _177 * _171;
    float _181 = _178 + _95;
    float _182 = _179 + _96;
    float _183 = _180 + _97;
    int _186 = _isPhotosensitiveMode_isAllolwBlood & 2;
    bool _187 = (_186 != 0);
    float _188 = select(_187, 0.10000000149011612f, 1.0f);
    float _189 = _188 * _181;
    float _190 = _188 * _182;
    float _191 = _188 * _183;

    // RenoDX: Disable hero lights at source — zero colour for negative raw colour lights
    // Hero/rim lights are encoded with negative raw RGB that only become positive after
    // the AWB color matrix is applied. _106 is true when any raw color channel is negative,
    // which is the actual distinguishing characteristic of hero lights — not the exposure
    // compensation mode (_130 == 0), which other normal lights can also use.
    if (DISABLE_HERO_LIGHTS > 0.5f && _106) {
      _189 = 0.0f;
      _190 = 0.0f;
      _191 = 0.0f;
    }

    ManyLightsData __struct_store_0;
    __struct_store_0._position = float4(_127, _128, _101, _148);
    __struct_store_0._color = float4(_189, _190, _191, _169);
    __struct_store_0._up = int2(_93, _94);
    __struct_store_0._look = int2(_91, _92);
    __3__39__0__1__g_manyLightsDataBufferUAV[(int)(SV_DispatchThreadID.x)] = __struct_store_0;
  }
}