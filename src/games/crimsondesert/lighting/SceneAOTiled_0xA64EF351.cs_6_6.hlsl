#include "../shared.h"

Texture2D<uint> __3__36__0__0__g_depthStencilHalf : register(t125, space36);

Texture2D<uint2> __3__36__0__0__g_normalDepth : register(t64, space36);

RWTexture2D<float2> __3__38__0__1__g_sceneAOResultUAV : register(u38, space38);

RWTexture2D<float4> __3__38__0__1__g_bentConeResultUAV : register(u39, space38);

cbuffer __3__35__0__0__SceneConstantBuffer : register(b13, space35) {
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

cbuffer __3__35__0__0__TileConstantBuffer : register(b44, space35) {
  struct {
    uint4 g_tileIndex[4096];
  } __3__35__0__0__TileConstantBuffer_view : packoffset(c000.x);

  // Raw views preserve dynamic cbufferLoadLegacy.f32/i32 access.
  float4 __3__35__0__0__TileConstantBuffer_raw[4096] : packoffset(c0);
  uint4 __3__35__0__0__TileConstantBuffer_raw_uint[4096] : packoffset(c0);
};

cbuffer __3__1__0__0__GlobalPushConstants : register(b0, space1) {
  float4 _shadowAOParams : packoffset(c000.x);
  float4 _tiledRadianceCacheParams : packoffset(c001.x);
};

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

[numthreads(16, 16, 1)]
void main(
  uint3 SV_DispatchThreadID : SV_DispatchThreadID,
  uint3 SV_GroupID : SV_GroupID,
  uint3 SV_GroupThreadID : SV_GroupThreadID,
  uint SV_GroupIndex : SV_GroupIndex
) {
  int4 _17;
  int _27;
  int _31;
  uint _36;
  uint _37;
  int _54;
  int _55;
  uint2 _57;
  int _60;
  float _63;
  int _64;
  float _79;
  float _80;
  float _81;
  float _83;
  float _84;
  float _85;
  float _86;
  float _89;
  float _92;
  bool _94;
  float _209;
  float _218;
  float _242;
  float _243;
  float _244;
  int _388;
  float _399;
  float _414;
  float _415;
  float _416;
  float _417;
  float _418;
  float _419;
  int _420;
  float _421;
  float _422;
  float _423;
  int _424;
  int _425;
  float _595;
  float _596;
  float _597;
  float _598;
  float _599;
  int _600;
  int _601;
  float _602;
  int _644;
  int _662;
  float _663;
  float _683;
  bool _705;
  int _708;
  float _709;
  int _724;
  float _740;
  float _785;
  float _786;
  float _787;
  float _802;
  float _803;
  float _804;
  float _813;
  float _826;
  float _827;
  float _97;
  float _102;
  float _103;
  float _139;
  float _140;
  float _141;
  float _142;
  float _144;
  int _148;
  bool _149;
  bool _151;
  float _154;
  float _155;
  float _156;
  float _157;
  float _158;
  float _169;
  float _170;
  float _175;
  bool _181;
  bool _182;
  bool _191;
  int _192;
  int _193;
  float _198;
  int _210;
  float _235;
  float _237;
  uint _255;
  uint _263;
  uint _271;
  uint _279;
  uint _287;
  uint _295;
  uint _303;
  uint _311;
  uint _319;
  uint _327;
  uint _335;
  uint _343;
  uint _351;
  uint _359;
  uint _367;
  uint _375;
  uint _389;
  float _395;
  float _400;
  float _404;
  float _411;
  int _428;
  float _440;
  float _441;
  float _444;
  float _447;
  float _448;
  float _450;
  float _453;
  float _454;
  float _455;
  float _456;
  float _465;
  float _469;
  float _473;
  uint _474;
  float _510;
  float _514;
  float _518;
  float _519;
  float _520;
  float _536;
  float _537;
  float _538;
  float _539;
  float _543;
  float _544;
  float _547;
  float _556;
  float _557;
  float _574;
  float _576;
  float _578;
  float _579;
  float _586;
  uint _608;
  float _613;
  int _614;
  float _616;
  float _618;
  float _622;
  float _623;
  float _626;
  float _628;
  bool _641;
  int _642;
  float _654;
  int _713;
  float _717;
  float _718;
  float _719;
  float _720;
  int _721;
  float _725;
  float _726;
  float _727;
  float _730;
  float _734;
  float _741;
  bool _744;
  float _746;
  float _750;
  float _751;
  float _752;
  float _753;
  float _754;
  float _755;
  float _756;
  float _758;
  float _763;
  float _766;
  float _768;
  float _770;
  float _771;
  bool _774;
  int _775;
  int _776;
  float _780;
  float _793;
  int __loop_jump_target = -1;
  int _8[4];
  _17 = asint(__3__35__0__0__TileConstantBuffer_raw_uint[((int)((uint)(SV_GroupID.x) >> 3))]);
  _8[0] = _17.x;
  _8[1] = _17.y;
  _8[2] = _17.z;
  _8[3] = _17.w;
  _27 = _8[min((uint)((((uint)(SV_GroupID.x) >> 1) & 3)), 3u)];
  _31 = select((((int)(SV_GroupID.x) & 1) == 0), _27, ((uint)(_27) >> 16));
  _36 = ((uint)(((int)(_31 << 4)) & 4080)) + SV_GroupThreadID.x;
  _37 = ((uint)(((uint)(_31) >> 4) & 4080)) + SV_GroupThreadID.y;
  _54 = _36 & 2147483647;
  _55 = _37 & 2147483647;
  _57 = __3__36__0__0__g_normalDepth.Load(int3(_54, _55, 0));  // [sem: _3__36__0__0__g_normalDepth_load]
  _60 = (uint)((uint)(_57.y)) >> 24;  // [sem: _3__36__0__0__g_normalDepth_load_derived]
  _63 = ((float)((uint)((uint)(_57.y & 16777215)))) * 5.960465188081798e-08f;  // [sem: _3__36__0__0__g_normalDepth_load_derived]
  _64 = _60 & 127;
  _79 = min(1.0f, ((((float)((uint)((uint)(_57.x & 1023)))) * 0.001956947147846222f) + -1.0f));  // [sem: _3__36__0__0__g_normalDepth_load_derived]
  _80 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_57.x)) >> 10) & 1023)))) * 0.001956947147846222f) + -1.0f));  // [sem: _3__36__0__0__g_normalDepth_load_derived]
  _81 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_57.x)) >> 20) & 1023)))) * 0.001956947147846222f) + -1.0f));  // [sem: _3__36__0__0__g_normalDepth_load_derived]
  _83 = rsqrt(dot(float3(_79, _80, _81), float3(_79, _80, _81)));  // [sem: invLength]
  _84 = _83 * _79;
  _85 = _83 * _80;
  _86 = _83 * _81;
  _89 = ((_bufferSizeAndInvSize.z * 2.0f) * (((float)((uint)((uint)(((int)(_36 << 1)) | (_frameNumber.x & 1))))) + 0.5f)) + -1.0f;
  _92 = 1.0f - ((_bufferSizeAndInvSize.w * 2.0f) * (((float)((uint)((uint)(((int)(_37 << 1)) | (((uint)((uint)(_frameNumber.x)) >> 1) & 1))))) + 0.5f));
  _94 = (_63 == 1.0f);
  if ((_63 < 1.0000000116860974e-07f) || _94) {
    _97 = select(_94, 0.0f, 1.0f);
    _826 = _97;
    _827 = _97;
  } else {
    _102 = max(1.0000000116860974e-07f, _63);
    _103 = _nearFarProj.x / _102;
    _139 = mad((_invViewProjRelative[2].w), _102, mad((_invViewProjRelative[1].w), _92, ((_invViewProjRelative[0].w) * _89))) + (_invViewProjRelative[3].w);
    _140 = (mad((_invViewProjRelative[2].x), _102, mad((_invViewProjRelative[1].x), _92, ((_invViewProjRelative[0].x) * _89))) + (_invViewProjRelative[3].x)) / _139;
    _141 = (mad((_invViewProjRelative[2].y), _102, mad((_invViewProjRelative[1].y), _92, ((_invViewProjRelative[0].y) * _89))) + (_invViewProjRelative[3].y)) / _139;
    _142 = (mad((_invViewProjRelative[2].z), _102, mad((_invViewProjRelative[1].z), _92, ((_invViewProjRelative[0].z) * _89))) + (_invViewProjRelative[3].z)) / _139;
    _144 = rsqrt(dot(float3(_140, _141, _142), float3(_140, _141, _142)));  // [sem: invLength]
    _148 = _64 + -53;
    _149 = ((uint)_148 < (uint)15);
    _151 = (_64 == 57) || _149;
    _154 = _bufferSizeAndInvSize.x * 0.5f;
    _155 = _bufferSizeAndInvSize.y * 0.5f;
    _156 = (float)((uint)_54);
    _157 = (float)((uint)_55);
    _158 = (float)((uint)(uint)(_frameNumber.x));
    _169 = (frac((_156 + (_158 * 92.0f)) * 0.0078125f) * 128.0f) + -64.34062194824219f;
    _170 = (frac((_157 + (_158 * 71.0f)) * 0.0078125f) * 128.0f) + -72.46562194824219f;
    _175 = frac(dot(float3((_169 * _169), (_170 * _170), (_170 * _169)), float3(20.390625f, 60.703125f, 2.4281208515167236f)));
    _181 = _151 && (_103 < 4.0f);
    _182 = (_64 == 65);
    _191 = (_shadowAOParams.z == 0.0f);
    _192 = select(_191, 4, select(_182, 32, select(_181, 8, 4)));
    _193 = select(_191, 5, select(_151, 8, 6));
    _198 = ((_bufferSizeAndInvSize.z * 16.0f) * _103) * _screenPercentage.x;
    if (_151) {
      _209 = max(0.05000000074505806f, (_198 * 4.0f));
    } else {
      _209 = (max(((_103 * 0.03125f) + 0.10000000149011612f), (_198 * 16.0f)) * 2.0f);
    }
    _210 = _60 & 126;
    if (((_60 & 124) == 64) || (_64 == 54)) {
      _218 = max(0.019999999552965164f, _209);
    } else {
      _218 = _209;
    }
    if (((_64 == 107) || ((_64 == 18) || ((_210 == 16) || ((_210 == 12) || ((uint)(_64 + -19) < (uint)2))))) && (!_151)) {
      _235 = saturate(_103 * 0.019999999552965164f) + _85;
      _237 = rsqrt(dot(float3(_84, _235, _86), float3(_84, _235, _86)));  // [sem: invLength]
      _242 = (_237 * _84);
      _243 = (_237 * _235);
      _244 = (_237 * _86);
    } else {
      _242 = _84;
      _243 = _85;
      _244 = _86;
    }
    _255 = uint((_154 * _157) + _156) + ((uint)((((int)((_frameNumber.x << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)));
    _263 = ((uint)((((int)((_255 << 4) + (uint)(-1383041155))) ^ ((int)(_255 + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(_255) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x);
    _271 = ((uint)((((int)((_263 << 4) + (uint)(-1556008596))) ^ ((int)(_263 + 1013904242u))) ^ (((uint)(_263) >> 5) + -939442524))) + _255;
    _279 = ((uint)((((int)((_271 << 4) + (uint)(-1383041155))) ^ ((int)(_271 + 1013904242u))) ^ ((int)(((uint)((uint)(_271) >> 5)) + 2123724318u)))) + _263;
    _287 = ((uint)((((int)((_279 << 4) + (uint)(-1556008596))) ^ ((int)(_279 + (uint)(-626627285)))) ^ (((uint)(_279) >> 5) + -939442524))) + _271;
    _295 = ((uint)((((int)((_287 << 4) + (uint)(-1383041155))) ^ ((int)(_287 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_287) >> 5)) + 2123724318u)))) + _279;
    _303 = ((uint)((((int)((_295 << 4) + (uint)(-1556008596))) ^ ((int)(_295 + 2027808484u))) ^ (((uint)(_295) >> 5) + -939442524))) + _287;
    _311 = ((uint)((((int)((_303 << 4) + (uint)(-1383041155))) ^ ((int)(_303 + 2027808484u))) ^ ((int)(((uint)((uint)(_303) >> 5)) + 2123724318u)))) + _295;
    _319 = ((uint)((((int)((_311 << 4) + (uint)(-1556008596))) ^ ((int)(_311 + 387276957u))) ^ (((uint)(_311) >> 5) + -939442524))) + _303;
    _327 = ((uint)((((int)((_319 << 4) + (uint)(-1383041155))) ^ ((int)(_319 + 387276957u))) ^ ((int)(((uint)((uint)(_319) >> 5)) + 2123724318u)))) + _311;
    _335 = ((uint)((((int)((_327 << 4) + (uint)(-1556008596))) ^ ((int)(_327 + (uint)(-1253254570)))) ^ (((uint)(_327) >> 5) + -939442524))) + _319;
    _343 = ((uint)((((int)((_335 << 4) + (uint)(-1383041155))) ^ ((int)(_335 + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(_335) >> 5)) + 2123724318u)))) + _327;
    _351 = ((uint)((((int)((_343 << 4) + (uint)(-1556008596))) ^ ((int)(_343 + 1401181199u))) ^ (((uint)(_343) >> 5) + -939442524))) + _335;
    _359 = ((uint)((((int)((_351 << 4) + (uint)(-1383041155))) ^ ((int)(_351 + 1401181199u))) ^ ((int)(((uint)((uint)(_351) >> 5)) + 2123724318u)))) + _343;
    _367 = ((uint)((((int)((_359 << 4) + (uint)(-1556008596))) ^ ((int)(_359 + (uint)(-239350328)))) ^ (((uint)(_359) >> 5) + -939442524))) + _351;
    _375 = ((uint)((((int)((_367 << 4) + (uint)(-1383041155))) ^ ((int)(_367 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_367) >> 5)) + 2123724318u)))) + _359;
    if ((_367 & 16777215) == 0) {
      _388 = ((int)(((uint)((((int)((_375 << 4) + (uint)(-1556008596))) ^ ((int)(_375 + (uint)(-1879881855)))) ^ (((uint)(_375) >> 5) + -939442524))) + _367));
    } else {
      _388 = _367;
    }
    _389 = _388 * 48271;
    if (!_149) {
      _395 = (float)((uint)_193);
      _399 = (_395 / (_395 + -1.5f));
    } else {
      _399 = 1.0f;
    }
    _400 = _399 * select(_182, 0.019999999552965164f, _218);
    _414 = 0.0f;
    _415 = 0.0f;
    _416 = 0.0f;
    _417 = 0.0f;
    _418 = 0.0f;
    _419 = 0.0f;
    _420 = _389;
    _421 = 0.0f;
    _422 = 0.0f;
    _423 = 0.0f;
    _424 = 0;
    _425 = 0;
    while(true) {
      _428 = ((int)((_425 * ((int)max((uint)(1), (uint)(select(_182, 0, select(_181, 3, 7)))))) + uint(((float)((uint)((uint)(_389 & 16777215)))) * 1.5258193343470339e-05f))) & 31;
      _440 = frac((((float)((uint)_428)) * 0.03125f) + (((float)((uint)((uint)((int)(uint(_175 * 51540816.0f)) & 65535)))) * 1.52587890625e-05f)) * 6.2831854820251465f;
      _441 = sqrt(((float)((uint)((uint)(reversebits(_428) ^ (int)(uint(_175 * 287478368.0f)))))) * 2.3283064365386963e-10f);
      _444 = sqrt(1.0f - (_441 * _441));
      _447 = cos(_440) * _444;
      _448 = sin(_440) * _444;
      _450 = select((_244 >= 0.0f), 1.0f, -1.0f);
      _453 = -0.0f - (1.0f / (_450 + _244));
      _454 = _243 * _453;
      _455 = _454 * _242;
      _456 = _450 * _242;
      _465 = mad(_441, _242, mad(_448, _455, ((((_456 * _242) * _453) + 1.0f) * _447)));
      _469 = mad(_441, _243, mad(_448, (_450 + (_454 * _243)), ((_447 * _450) * _455)));
      _473 = mad(_441, _244, mad(_448, (-0.0f - _243), (-0.0f - (_456 * _447))));
      _474 = _420 * 48271;
      _510 = mad((_viewProjRelative[2].z), _142, mad((_viewProjRelative[1].z), _141, ((_viewProjRelative[0].z) * _140))) + (_viewProjRelative[3].z);
      _514 = mad((_viewProjRelative[2].w), _142, mad((_viewProjRelative[1].w), _141, ((_viewProjRelative[0].w) * _140))) + (_viewProjRelative[3].w);
      _518 = (_465 * _400) + _140;
      _519 = (_469 * _400) + _141;
      _520 = (_473 * _400) + _142;
      _536 = mad((_viewProjRelative[2].w), _520, mad((_viewProjRelative[1].w), _519, ((_viewProjRelative[0].w) * _518))) + (_viewProjRelative[3].w);
      _537 = (mad((_viewProjRelative[2].x), _142, mad((_viewProjRelative[1].x), _141, ((_viewProjRelative[0].x) * _140))) + (_viewProjRelative[3].x)) / _514;
      _538 = (mad((_viewProjRelative[2].y), _142, mad((_viewProjRelative[1].y), _141, ((_viewProjRelative[0].y) * _140))) + (_viewProjRelative[3].y)) / _514;
      _539 = _510 / _514;
      _543 = ((mad((_viewProjRelative[2].x), _520, mad((_viewProjRelative[1].x), _519, ((_viewProjRelative[0].x) * _518))) + (_viewProjRelative[3].x)) / _536) - _537;
      _544 = ((mad((_viewProjRelative[2].y), _520, mad((_viewProjRelative[1].y), _519, ((_viewProjRelative[0].y) * _518))) + (_viewProjRelative[3].y)) / _536) - _538;
      _547 = 1.0f / ((float)((uint)_193));
      _556 = max(_547, (1.0f / min(1.0f, (max((abs(_543) * _154), (abs(_544) * _155)) * _547))));
      _557 = _556 * (((mad((_viewProjRelative[2].z), _520, mad((_viewProjRelative[1].z), _519, ((_viewProjRelative[0].z) * _518))) + (_viewProjRelative[3].z)) / _536) - _539);
      _574 = _556 * _547;
      _576 = (_543 * 0.5f) * _574;
      _578 = (_544 * -0.5f) * _574;
      _579 = _557 * _547;
      _586 = max(((((float)((uint)((uint)(_474 & 16777215)))) * 1.4901161193847656e-08f) + 0.009999999776482582f), (1.0f / max((abs(_576) * _154), (abs(_578) * _155))));
      _595 = (((_537 * 0.5f) + 0.5f) + (_586 * _576));
      _596 = ((0.5f - (_538 * 0.5f)) + (_586 * _578));
      _597 = ((_586 * _579) + _539);
      _598 = 0.0f;
      _599 = 0.25f;
      _600 = 0;
      _601 = 0;
      _602 = 0.0f;
      while(true) {
        _608 = __3__36__0__0__g_depthStencilHalf.Load(int3(int(_595 * _154), int(_596 * _155), 0));  // [sem: _3__36__0__0__g_depthStencilHalf_load]
        _613 = ((float)((uint)((uint)(_608.x & 16777215)))) * 5.960465188081798e-08f;  // [sem: _3__36__0__0__g_depthStencilHalf_load_derived]
        _614 = ((uint)((uint)(_608.x)) >> 24) & 127;  // [sem: _3__36__0__0__g_depthStencilHalf_load_derived]
        _616 = select((_600 == 2), 1.2000000476837158f, _599);
        _618 = _597 - _613;
        _622 = _nearFarProj.x / max(1.0000000116860974e-07f, _613);
        _623 = (_547 * _400) * _616;
        _626 = _622 - (_nearFarProj.x / max(1.0000000116860974e-07f, _597));
        _628 = (max(abs(_557), (_539 - ((mad((_proj[2].z), _103, 0.0f) + _510) / (mad((_proj[2].w), _103, 0.0f) + _514)))) * 0.3400000035762787f) * max(0.0625f, _547);
        bool __branch_chain_594;
        if (!(abs(_618 + _628) < _628)) {
          _644 = 0;
          __branch_chain_594 = true;
        } else {
          _641 = (_626 > select((_614 == 5), -0.07999999821186066f, (-0.0f - max(0.029999999329447746f, min((_622 * 0.5f), ((_622 * _622) * 0.009999999776482582f))))));
          _642 = (int)(uint)(_641);
          if (!_641) {
            _644 = _642;
            __branch_chain_594 = true;
          } else {
            _662 = _642;
            _663 = _598;
            __branch_chain_594 = false;
          }
        }
        if (__branch_chain_594) {
          if ((_598 == 0.0f) && (_618 < 0.0f)) {
            _662 = _644;
            _663 = (-0.0f - _626);
          } else {
            if (_598 > 0.0f) {
              _654 = _623 * 1.5f;
              if ((_598 < _654) || (_618 > 0.0f)) {
                _662 = ((int)(uint)((int)((_598 - _654) < 0.0f)));
                _663 = 0.0f;
              } else {
                _662 = _644;
                _663 = _598;
              }
            } else {
              _662 = _644;
              _663 = _598;
            }
          }
        }
        if (!(_662 == 0)) {
          if ((_614 == 19) || (_614 == 107)) {
            _683 = max(0.10000000149011612f, (1.0f - (_622 * 0.009999999776482582f)));
          } else {
            _683 = 1.0f;
          }
          if (_601 == 0) {
            _705 = ((_614 == 57) || ((uint)(_614 + -53) < (uint)15));
          } else {
            _705 = true;
          }
          _708 = ((int)(uint)(_705));
          float _aoDistFade = 1.0f - saturate(max((_622 + -100.0f), 0.0f) * 0.05000000074505806f);
          // RenoDX: >>> [Patch: FoliageAORange] [Version: 1.10-family]
          // Description: SceneAOTiled_CS 0xA64EF351 native HBAO distance fade drops foliage occlusion too early, causing distant grass and leaf cards to look detached from surrounding terrain. When foliage AO is enabled, extend only foliage stencil AO reach so the generated scene AO remains visible farther into the mid distance without changing non-foliage materials.
          if (FOLIAGE_AO_STRENGTH > 0.0f && ((uint)(_64 - 12) < 7u)) {
            _aoDistFade = 1.0f - saturate(max((_622 + -200.0f), 0.0f) * 0.005f);
          }
          // RenoDX: <<< [Patch: FoliageAORange]
          _709 = saturate((saturate(1.0f - exp2(log2(select((_terrainNormalParams.z > 0.0f), 0.20000000298023224f, 0.6000000238418579f)) * max(_683, (((_623 * 20.0f) * _aoDistFade) / ((_622 * 0.20000000298023224f) + 1.0f))))) * (1.0f - _602)) + _602);
        } else {
          _708 = _601;
          _709 = _602;  // [sem: expr_sat]
        }
        [branch]
        if (!(_709 > 0.75f)) {
          _713 = (int)(uint)((int)(_708 != 0));
          _717 = (_616 * _576) + _595;
          _718 = (_616 * _578) + _596;
          _719 = (_616 * _579) + _597;
          _720 = _616 * 1.100000023841858f;
          _721 = _600 + 1;
          if ((uint)_721 < (uint)_193) {
            _595 = _717;
            _596 = _718;
            _597 = _719;
            _598 = _663;
            _599 = _720;
            _600 = _721;
            _601 = _713;
            _602 = _709;
            continue;
          } else {
            _724 = 0;
          }
        } else {
          _724 = _614;
        }
        _725 = _465 + _417;
        _726 = _469 + _418;
        _727 = _473 + _419;
        _730 = saturate(saturate(_709 * 1.100000023841858f));  // [sem: expr_sat]
        _734 = select(((uint)(_724 + -97) < (uint)2), (_730 * 0.33000001311302185f), _730);
        if (_64 == 15) {
          _740 = saturate(_734 * 2.0f);  // [sem: expr_sat]
        } else {
          _740 = _734;  // [sem: expr_sat]
        }
        _741 = 1.0f - _740;
        _744 = ((uint)(_724 + -53) < (uint)15);
        _746 = select((((uint)_148 > (uint)14) && _744), 0.30000001192092896f, _741);
        _750 = (_746 * _465) + _414;
        _751 = (_746 * _469) + _415;
        _752 = (_746 * _473) + _416;
        _753 = _421 + 1.0f;
        _754 = _465 - (_144 * _140);
        _755 = _469 - (_144 * _141);
        _756 = _473 - (_144 * _142);
        _758 = rsqrt(dot(float3(_754, _755, _756), float3(_754, _755, _756)));  // [sem: invLength]
        _763 = saturate(dot(float3(_242, _243, _244), float3((_758 * _754), (_758 * _755), (_758 * _756))));  // [sem: expr_sat]
        _766 = 1.0f - ((_763 * _763) * 0.35999995470046997f);
        _768 = 0.20371833443641663f / (_766 * _766);
        _770 = (_768 * _741) + _422;
        _771 = _768 + _423;
        _774 = ((_708 | _424) != 0) || _744;
        _775 = (int)(uint)(_774);
        _776 = _425 + 1;
        if ((uint)_776 < (uint)_192) {
          _414 = _750;
          _415 = _751;
          _416 = _752;
          _417 = _725;
          _418 = _726;
          _419 = _727;
          _420 = _474;
          _421 = _753;
          _422 = _770;
          _423 = _771;
          _424 = _775;
          _425 = _776;
          __loop_jump_target = 413;
          break;
        }
        while(true) {
          _404 = saturate(_770 / max(9.999999974752427e-07f, _771));  // [sem: expr_sat]
          _411 = sqrt(((_726 * _726) + (_725 * _725)) + (_727 * _727)) * _753;
          if (!(_411 == 0.0f)) {
            _780 = ((float)((uint)_192)) / _411;
            _785 = (_780 * _750);
            _786 = (_780 * _751);
            _787 = (_780 * _752);
          } else {
            _785 = _750;
            _786 = _751;
            _787 = _752;
          }
          _793 = sqrt(((_786 * _786) + (_785 * _785)) + (_787 * _787));
          if (!(_793 == 0.0f)) {
            _802 = (_785 / _793);
            _803 = (_786 / _793);
            _804 = (_787 / _793);
          } else {
            _802 = _242;
            _803 = _243;
            _804 = _244;
          }
          if (!_151) {
            _813 = (1.0f - (saturate(select(_774, 0.0f, 1.0f)) * saturate(1.0f - _404)));
          } else {
            _813 = 1.0f;
          }
          __3__38__0__1__g_bentConeResultUAV[int2(_54, _55)] = float4(((_802 * 0.5f) + 0.5f), ((_803 * 0.5f) + 0.5f), ((_804 * 0.5f) + 0.5f), saturate(1.0f - _793));
          _826 = ((_813 + _shadowAOParams.w) - (_813 * _shadowAOParams.w));
          // RenoDX: >>> [Patch: FoliageAOBentConeVisibility] [Version: 1.10-family]
          // Description: SceneAOTiled_CS 0xA64EF351 native global AO strength blend can wash out foliage bent-cone visibility after the AO solve. When foliage AO is enabled, blend foliage stencil pixels back toward the unsoftened bent-cone visibility so downstream diffuse lighting receives stronger leaf and grass occlusion while non-foliage AO remains native.
          if (FOLIAGE_AO_STRENGTH > 0.0f && ((uint)(_64 - 12) < 7u)) {
            _826 = lerp(_826, _813, FOLIAGE_AO_STRENGTH);
          }
          // RenoDX: <<< [Patch: FoliageAOBentConeVisibility]
          _827 = _404;
          break;
        }
        break;
      }
      if (__loop_jump_target == 413) {
        __loop_jump_target = -1;
        continue;
      }
      if (__loop_jump_target != -1) {
        break;
      }
      break;
    }
  }
  __3__38__0__1__g_sceneAOResultUAV[int2(_36, _37)] = float2(_826, _827);
}
