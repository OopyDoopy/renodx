#include "../shared.h"

Texture2D<uint> __3__36__0__0__g_depthStencil : register(t40, space36);

Texture2D<uint> __3__36__0__0__g_sceneNormal : register(t51, space36);

RWTexture2D<float2> __3__38__0__1__g_sceneAOResultUAV : register(u37, space38);

RWTexture2D<float4> __3__38__0__1__g_bentConeResultUAV : register(u38, space38);

cbuffer __3__35__0__0__SceneConstantBuffer : register(b20, space35) {
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

cbuffer __3__35__0__0__TileConstantBuffer : register(b33, space35) {
  uint4 g_tileIndex[4096] : packoffset(c000.x);
};

cbuffer __3__1__0__0__GlobalPushConstants : register(b0, space1) {
  float4 _shadowAOParams : packoffset(c000.x);
  float4 _tiledRadianceCacheParams : packoffset(c001.x);
};

[numthreads(16, 16, 1)]
void main(
  uint3 SV_DispatchThreadID : SV_DispatchThreadID,
  uint3 SV_GroupID : SV_GroupID,
  uint3 SV_GroupThreadID : SV_GroupThreadID,
  uint SV_GroupIndex : SV_GroupIndex
) {
  int __loop_jump_target = -1;
  int _8[4];
  int _14 = (int)(SV_GroupID.x) & 3;
  int _15 = (uint)((uint)(_14)) >> 1;
  int _17 = _14 - (_15 << 1);
  int _20 = (uint)(SV_GroupID.x) >> 2;
  int _21 = (uint)(SV_GroupID.x) >> 4;
  int _22 = _20 & 3;
  _8[0] = ((g_tileIndex[_21]).x);
  _8[1] = ((g_tileIndex[_21]).y);
  _8[2] = ((g_tileIndex[_21]).z);
  _8[3] = ((g_tileIndex[_21]).w);
  int _33 = _8[_22];
  int _34 = (uint)((uint)(_33)) >> 16;
  int _36 = ((int)((uint)(_33) << 5)) & 2097120;
  float _42 = float((uint)(((uint)(_36) + SV_GroupThreadID.x) + ((uint)(_17 << 4))));
  float _43 = float((uint)((((uint)(_15 << 4)) + SV_GroupThreadID.y) + ((uint)(_34 << 5))));
  float _44 = _42 + 0.5f;
  float _45 = _43 + 0.5f;
  uint _50 = __3__36__0__0__g_depthStencil.Load(int3(((int)(((uint)(_36) + SV_GroupThreadID.x) + ((uint)(_17 << 4)))), ((int)((((uint)(_15 << 4)) + SV_GroupThreadID.y) + ((uint)(_34 << 5)))), 0));
  int _52 = (uint)((uint)(_50.x)) >> 24;
  int _53 = _50.x & 16777215;
  float _54 = float((uint)(uint)(_53));
  float _55 = _54 * 5.960465188081798e-08f;
  int _56 = _52 & 127;
  uint _58 = __3__36__0__0__g_sceneNormal.Load(int3(((int)(((uint)(_36) + SV_GroupThreadID.x) + ((uint)(_17 << 4)))), ((int)((((uint)(_15 << 4)) + SV_GroupThreadID.y) + ((uint)(_34 << 5)))), 0));
  int _60 = (uint)((uint)(_58.x)) >> 10;
  int _61 = (uint)((uint)(_58.x)) >> 20;
  int _62 = _58.x & 1023;
  int _63 = _60 & 1023;
  int _64 = _61 & 1023;
  float _65 = float((uint)(uint)(_62));
  float _66 = float((uint)(uint)(_63));
  float _67 = float((uint)(uint)(_64));
  float _68 = _65 * 0.001956947147846222f;
  float _69 = _66 * 0.001956947147846222f;
  float _70 = _67 * 0.001956947147846222f;
  float _71 = _68 + -1.0f;
  float _72 = _69 + -1.0f;
  float _73 = _70 + -1.0f;
  float _74 = min(1.0f, _71);
  float _75 = min(1.0f, _72);
  float _76 = min(1.0f, _73);
  float _77 = dot(float3(_74, _75, _76), float3(_74, _75, _76));
  float _78 = rsqrt(_77);
  float _79 = _78 * _74;
  float _80 = _78 * _75;
  float _81 = _78 * _76;
  float _82 = _bufferSizeAndInvSize.z * 2.0f;
  float _83 = _82 * _44;
  float _84 = _83 + -1.0f;
  float _85 = _bufferSizeAndInvSize.w * 2.0f;
  float _86 = _85 * _45;
  float _87 = 1.0f - _86;
  bool _88 = (_55 < 1.0000000116860974e-07f);
  bool _89 = (_55 == 1.0f);
  bool _90 = (_88) || (_89);
  float _202;
  float _211;
  float _235;
  float _236;
  float _237;
  int _381;
  float _392;
  float _407;
  float _408;
  float _409;
  float _410;
  float _411;
  float _412;
  int _413;
  float _414;
  float _415;
  float _416;
  int _417;
  int _418;
  float _588;
  float _589;
  float _590;
  float _591;
  float _592;
  int _593;
  int _594;
  float _595;
  int _637;
  int _655;
  float _656;
  float _676;
  bool _698;
  int _701;
  float _702;
  int _717;
  float _733;
  float _778;
  float _779;
  float _780;
  float _795;
  float _796;
  float _797;
  float _806;
  float _819;
  float _820;
  if (_90) {
    float _92 = select(_89, 0.0f, 1.0f);
    _819 = _92;
    _820 = _92;
  } else {
    float _97 = max(1.0000000116860974e-07f, _55);
    float _98 = _nearFarProj.x / _97;
    float _119 = (_invViewProjRelative[0].x) * _84;
    float _120 = mad((_invViewProjRelative[0].y), _87, _119);
    float _121 = mad((_invViewProjRelative[0].z), _97, _120);
    float _122 = _121 + (_invViewProjRelative[0].w);
    float _123 = (_invViewProjRelative[1].x) * _84;
    float _124 = mad((_invViewProjRelative[1].y), _87, _123);
    float _125 = mad((_invViewProjRelative[1].z), _97, _124);
    float _126 = _125 + (_invViewProjRelative[1].w);
    float _127 = (_invViewProjRelative[2].x) * _84;
    float _128 = mad((_invViewProjRelative[2].y), _87, _127);
    float _129 = mad((_invViewProjRelative[2].z), _97, _128);
    float _130 = _129 + (_invViewProjRelative[2].w);
    float _131 = (_invViewProjRelative[3].x) * _84;
    float _132 = mad((_invViewProjRelative[3].y), _87, _131);
    float _133 = mad((_invViewProjRelative[3].z), _97, _132);
    float _134 = _133 + (_invViewProjRelative[3].w);
    float _135 = _122 / _134;
    float _136 = _126 / _134;
    float _137 = _130 / _134;
    float _138 = dot(float3(_135, _136, _137), float3(_135, _136, _137));
    float _139 = rsqrt(_138);
    float _140 = _139 * _135;
    float _141 = _139 * _136;
    float _142 = _139 * _137;
    bool _146 = ((uint)(_56 + -53) < (uint)15);
    bool _147 = (_56 == 57);
    bool _148 = (_147) || (_146);
    float _151 = float((uint)(uint)(_frameNumber.x));
    float _152 = _151 * 92.0f;
    float _153 = _151 * 71.0f;
    float _154 = _152 + _42;
    float _155 = _153 + _43;
    float _156 = _154 * 0.0078125f;
    float _157 = _155 * 0.0078125f;
    float _158 = frac(_156);
    float _159 = frac(_157);
    float _160 = _158 * 128.0f;
    float _161 = _159 * 128.0f;
    float _162 = _160 + -64.34062194824219f;
    float _163 = _161 + -72.46562194824219f;
    float _164 = _162 * _162;
    float _165 = _163 * _163;
    float _166 = _163 * _162;
    float _167 = dot(float3(_164, _165, _166), float3(20.390625f, 60.703125f, 2.4281208515167236f));
    float _168 = frac(_167);
    float _169 = _168 * 51540816.0f;
    float _170 = _168 * 287478368.0f;
    uint _171 = uint(_169);
    uint _172 = uint(_170);
    bool _173 = (_98 < 4.0f);
    bool _174 = (_148) && (_173);
    bool _175 = (_56 == 65);
    int _176 = select(_174, 8, 4);
    int _177 = select(_175, 32, _176);
    int _178 = select(_174, 3, 7);
    int _179 = select(_175, 0, _178);
    uint _180 = max((uint)(1), (uint)(_179));
    int _181 = select(_148, 8, 6);
    bool _184 = (_shadowAOParams.z == 0.0f);
    int _185 = select(_184, 4, _177);
    int _186 = select(_184, 5, _181);
    float _189 = _bufferSizeAndInvSize.z * 16.0f;
    float _190 = _189 * _98;
    float _191 = _190 * _screenPercentage.x;
    if (_148) {
      float _193 = _191 * 4.0f;
      float _194 = max(0.05000000074505806f, _193);
      _202 = _194;
    } else {
      float _196 = _191 * 16.0f;
      float _197 = _98 * 0.03125f;
      float _198 = _197 + 0.10000000149011612f;
      float _199 = max(_198, _196);
      float _200 = _199 * 2.0f;
      _202 = _200;
    }
    int _203 = _52 & 126;
    bool _204 = (_56 == 54);
    int _205 = _52 & 124;
    bool _206 = (_205 == 64);
    bool _207 = (_206) || (_204);
    if (_207) {
      float _209 = max(0.019999999552965164f, _202);
      _211 = _209;
    } else {
      _211 = _202;
    }
    float _212 = select(_175, 0.019999999552965164f, _211);
    bool _222 = ((_56 == 107) || ((_56 == 18) || ((_203 == 16) || ((_203 == 12) || ((uint)(_56 + -19) < (uint)2)))));
    bool _223 = !_148;
    bool _224 = (_222) && (_223);
    if (_224) {
      float _226 = _98 * 0.019999999552965164f;
      float _227 = saturate(_226);
      float _228 = _227 + _80;
      float _229 = dot(float3(_79, _228, _81), float3(_79, _228, _81));
      float _230 = rsqrt(_229);
      float _231 = _230 * _79;
      float _232 = _230 * _228;
      float _233 = _230 * _81;
      _235 = _231;
      _236 = _232;
      _237 = _233;
    } else {
      _235 = _79;
      _236 = _80;
      _237 = _81;
    }
    float _238 = _43 * _bufferSizeAndInvSize.x;
    float _239 = _238 + _42;
    uint _240 = uint(_239);
    int _244 = ((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)));
    int _245 = (uint)((uint)(_frameNumber.x)) >> 5;
    int _247 = _244 ^ (_245 + -939442524);
    int _252 = ((int)((((uint)(_247) + _240) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_247) + _240) + (uint)(-1640531527)));
    int _253 = (uint)((uint)(_247) + _240) >> 5;
    int _255 = _252 ^ ((int)((uint)(_253) + 2123724318u));
    int _260 = ((int)((((uint)(_255) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_255) + (uint)(_frameNumber.x)) + 1013904242u));
    int _261 = (uint)((uint)(_255) + (uint)(_frameNumber.x)) >> 5;
    int _263 = _260 ^ (_261 + -939442524);
    int _268 = ((int)((((uint)(_263) + ((uint)(_247) + _240)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_263) + ((uint)(_247) + _240)) + 1013904242u));
    int _269 = (uint)((uint)(_263) + ((uint)(_247) + _240)) >> 5;
    int _271 = _268 ^ ((int)((uint)(_269) + 2123724318u));
    int _276 = ((int)((((uint)(_271) + ((uint)(_255) + (uint)(_frameNumber.x))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_271) + ((uint)(_255) + (uint)(_frameNumber.x))) + (uint)(-626627285)));
    int _277 = (uint)((uint)(_271) + ((uint)(_255) + (uint)(_frameNumber.x))) >> 5;
    int _279 = _276 ^ (_277 + -939442524);
    int _284 = ((int)((((uint)(_279) + ((uint)(_263) + ((uint)(_247) + _240))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_279) + ((uint)(_263) + ((uint)(_247) + _240))) + (uint)(-626627285)));
    int _285 = (uint)((uint)(_279) + ((uint)(_263) + ((uint)(_247) + _240))) >> 5;
    int _287 = _284 ^ ((int)((uint)(_285) + 2123724318u));
    int _292 = ((int)((((uint)(_287) + ((uint)(_271) + ((uint)(_255) + (uint)(_frameNumber.x)))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_287) + ((uint)(_271) + ((uint)(_255) + (uint)(_frameNumber.x)))) + 2027808484u));
    int _293 = (uint)((uint)(_287) + ((uint)(_271) + ((uint)(_255) + (uint)(_frameNumber.x)))) >> 5;
    int _295 = _292 ^ (_293 + -939442524);
    int _300 = ((int)((((uint)(_295) + ((uint)(_279) + ((uint)(_263) + ((uint)(_247) + _240)))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_295) + ((uint)(_279) + ((uint)(_263) + ((uint)(_247) + _240)))) + 2027808484u));
    int _301 = (uint)((uint)(_295) + ((uint)(_279) + ((uint)(_263) + ((uint)(_247) + _240)))) >> 5;
    int _303 = _300 ^ ((int)((uint)(_301) + 2123724318u));
    int _308 = ((int)((((uint)(_303) + ((uint)(_287) + ((uint)(_271) + ((uint)(_255) + (uint)(_frameNumber.x))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_303) + ((uint)(_287) + ((uint)(_271) + ((uint)(_255) + (uint)(_frameNumber.x))))) + 387276957u));
    int _309 = (uint)((uint)(_303) + ((uint)(_287) + ((uint)(_271) + ((uint)(_255) + (uint)(_frameNumber.x))))) >> 5;
    int _311 = _308 ^ (_309 + -939442524);
    int _316 = ((int)((((uint)(_311) + ((uint)(_295) + ((uint)(_279) + ((uint)(_263) + ((uint)(_247) + _240))))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_311) + ((uint)(_295) + ((uint)(_279) + ((uint)(_263) + ((uint)(_247) + _240))))) + 387276957u));
    int _317 = (uint)((uint)(_311) + ((uint)(_295) + ((uint)(_279) + ((uint)(_263) + ((uint)(_247) + _240))))) >> 5;
    int _319 = _316 ^ ((int)((uint)(_317) + 2123724318u));
    int _324 = ((int)((((uint)(_319) + ((uint)(_303) + ((uint)(_287) + ((uint)(_271) + ((uint)(_255) + (uint)(_frameNumber.x)))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_319) + ((uint)(_303) + ((uint)(_287) + ((uint)(_271) + ((uint)(_255) + (uint)(_frameNumber.x)))))) + (uint)(-1253254570)));
    int _325 = (uint)((uint)(_319) + ((uint)(_303) + ((uint)(_287) + ((uint)(_271) + ((uint)(_255) + (uint)(_frameNumber.x)))))) >> 5;
    int _327 = _324 ^ (_325 + -939442524);
    int _332 = ((int)((((uint)(_327) + ((uint)(_311) + ((uint)(_295) + ((uint)(_279) + ((uint)(_263) + ((uint)(_247) + _240)))))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_327) + ((uint)(_311) + ((uint)(_295) + ((uint)(_279) + ((uint)(_263) + ((uint)(_247) + _240)))))) + (uint)(-1253254570)));
    int _333 = (uint)((uint)(_327) + ((uint)(_311) + ((uint)(_295) + ((uint)(_279) + ((uint)(_263) + ((uint)(_247) + _240)))))) >> 5;
    int _335 = _332 ^ ((int)((uint)(_333) + 2123724318u));
    int _340 = ((int)((((uint)(_335) + ((uint)(_319) + ((uint)(_303) + ((uint)(_287) + ((uint)(_271) + ((uint)(_255) + (uint)(_frameNumber.x))))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_335) + ((uint)(_319) + ((uint)(_303) + ((uint)(_287) + ((uint)(_271) + ((uint)(_255) + (uint)(_frameNumber.x))))))) + 1401181199u));
    int _341 = (uint)((uint)(_335) + ((uint)(_319) + ((uint)(_303) + ((uint)(_287) + ((uint)(_271) + ((uint)(_255) + (uint)(_frameNumber.x))))))) >> 5;
    int _343 = _340 ^ (_341 + -939442524);
    int _348 = ((int)((((uint)(_343) + ((uint)(_327) + ((uint)(_311) + ((uint)(_295) + ((uint)(_279) + ((uint)(_263) + ((uint)(_247) + _240))))))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_343) + ((uint)(_327) + ((uint)(_311) + ((uint)(_295) + ((uint)(_279) + ((uint)(_263) + ((uint)(_247) + _240))))))) + 1401181199u));
    int _349 = (uint)((uint)(_343) + ((uint)(_327) + ((uint)(_311) + ((uint)(_295) + ((uint)(_279) + ((uint)(_263) + ((uint)(_247) + _240))))))) >> 5;
    int _351 = _348 ^ ((int)((uint)(_349) + 2123724318u));
    int _356 = ((int)((((uint)(_351) + ((uint)(_335) + ((uint)(_319) + ((uint)(_303) + ((uint)(_287) + ((uint)(_271) + ((uint)(_255) + (uint)(_frameNumber.x)))))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_351) + ((uint)(_335) + ((uint)(_319) + ((uint)(_303) + ((uint)(_287) + ((uint)(_271) + ((uint)(_255) + (uint)(_frameNumber.x)))))))) + (uint)(-239350328)));
    int _357 = (uint)((uint)(_351) + ((uint)(_335) + ((uint)(_319) + ((uint)(_303) + ((uint)(_287) + ((uint)(_271) + ((uint)(_255) + (uint)(_frameNumber.x)))))))) >> 5;
    int _359 = _356 ^ (_357 + -939442524);
    int _364 = ((int)((((uint)(_359) + ((uint)(_343) + ((uint)(_327) + ((uint)(_311) + ((uint)(_295) + ((uint)(_279) + ((uint)(_263) + ((uint)(_247) + _240)))))))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_359) + ((uint)(_343) + ((uint)(_327) + ((uint)(_311) + ((uint)(_295) + ((uint)(_279) + ((uint)(_263) + ((uint)(_247) + _240)))))))) + (uint)(-239350328)));
    int _365 = (uint)((uint)(_359) + ((uint)(_343) + ((uint)(_327) + ((uint)(_311) + ((uint)(_295) + ((uint)(_279) + ((uint)(_263) + ((uint)(_247) + _240)))))))) >> 5;
    int _367 = _364 ^ ((int)((uint)(_365) + 2123724318u));
    int _369 = ((int)((uint)(_359) + ((uint)(_343) + ((uint)(_327) + ((uint)(_311) + ((uint)(_295) + ((uint)(_279) + ((uint)(_263) + ((uint)(_247) + _240))))))))) & 16777215;
    bool _370 = (_369 == 0);
    if (_370) {
      int _375 = ((int)((((uint)(_367) + ((uint)(_351) + ((uint)(_335) + ((uint)(_319) + ((uint)(_303) + ((uint)(_287) + ((uint)(_271) + ((uint)(_255) + (uint)(_frameNumber.x))))))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_367) + ((uint)(_351) + ((uint)(_335) + ((uint)(_319) + ((uint)(_303) + ((uint)(_287) + ((uint)(_271) + ((uint)(_255) + (uint)(_frameNumber.x))))))))) + (uint)(-1879881855)));
      int _376 = (uint)((uint)(_367) + ((uint)(_351) + ((uint)(_335) + ((uint)(_319) + ((uint)(_303) + ((uint)(_287) + ((uint)(_271) + ((uint)(_255) + (uint)(_frameNumber.x))))))))) >> 5;
      int _378 = _375 ^ (_376 + -939442524);
      _381 = ((int)((uint)(_378) + ((uint)(_359) + ((uint)(_343) + ((uint)(_327) + ((uint)(_311) + ((uint)(_295) + ((uint)(_279) + ((uint)(_263) + ((uint)(_247) + _240))))))))));
    } else {
      _381 = ((int)((uint)(_359) + ((uint)(_343) + ((uint)(_327) + ((uint)(_311) + ((uint)(_295) + ((uint)(_279) + ((uint)(_263) + ((uint)(_247) + _240)))))))));
    }
    uint _382 = _381 * 48271;
    int _383 = (int)(_382) & 16777215;
    float _384 = float((uint)(uint)(_383));
    float _385 = _384 * 1.5258193343470339e-05f;
    uint _386 = uint(_385);
    if (!_146) {
      float _388 = float((uint)(uint)(_186));
      float _389 = _388 + -1.5f;
      float _390 = _388 / _389;
      _392 = _390;
    } else {
      _392 = 1.0f;
    }
    float _393 = _392 * _212;
    _407 = 0.0f;
    _408 = 0.0f;
    _409 = 0.0f;
    _410 = 0.0f;
    _411 = 0.0f;
    _412 = 0.0f;
    _413 = (int)(_382);
    _414 = 0.0f;
    _415 = 0.0f;
    _416 = 0.0f;
    _417 = 0;
    _418 = 0;
    while(true) {
      uint _419 = _418 * (int)(_180);
      int _421 = ((int)(_419 + _386)) & 31;
      float _422 = float((uint)(uint)(_421));
      float _423 = _422 * 0.03125f;
      int _424 = (int)(_171) & 65535;
      float _425 = float((uint)(uint)(_424));
      float _426 = _425 * 1.52587890625e-05f;
      float _427 = _423 + _426;
      float _428 = frac(_427);
      int _429 = reversebits(_421);
      int _430 = _429 ^ (int)(_172);
      float _431 = float((uint)(uint)(_430));
      float _432 = _431 * 2.3283064365386963e-10f;
      float _433 = _428 * 6.2831854820251465f;
      float _434 = sqrt(_432);
      float _435 = _434 * _434;
      float _436 = 1.0f - _435;
      float _437 = sqrt(_436);
      float _438 = sin(_433);
      float _439 = cos(_433);
      float _440 = _439 * _437;
      float _441 = _438 * _437;
      bool _442 = (_237 >= 0.0f);
      float _443 = select(_442, 1.0f, -1.0f);
      float _444 = _443 + _237;
      float _445 = 1.0f / _444;
      float _446 = -0.0f - _445;
      float _447 = _236 * _446;
      float _448 = _447 * _235;
      float _449 = _443 * _235;
      float _450 = _449 * _235;
      float _451 = _450 * _446;
      float _452 = _451 + 1.0f;
      float _453 = _447 * _236;
      float _454 = _443 + _453;
      float _455 = -0.0f - _236;
      float _456 = _452 * _440;
      float _457 = mad(_441, _448, _456);
      float _458 = mad(_434, _235, _457);
      float _459 = _440 * _443;
      float _460 = _459 * _448;
      float _461 = mad(_441, _454, _460);
      float _462 = mad(_434, _236, _461);
      float _463 = _449 * _440;
      float _464 = -0.0f - _463;
      float _465 = mad(_441, _455, _464);
      float _466 = mad(_434, _237, _465);
      uint _467 = _413 * 48271;
      int _468 = (int)(_467) & 16777215;
      float _469 = float((uint)(uint)(_468));
      float _470 = _469 * 1.4901161193847656e-08f;
      float _471 = _470 + 0.009999999776482582f;
      float _492 = (_viewProjRelative[0].x) * _135;
      float _493 = mad((_viewProjRelative[0].y), _136, _492);
      float _494 = mad((_viewProjRelative[0].z), _137, _493);
      float _495 = _494 + (_viewProjRelative[0].w);
      float _496 = (_viewProjRelative[1].x) * _135;
      float _497 = mad((_viewProjRelative[1].y), _136, _496);
      float _498 = mad((_viewProjRelative[1].z), _137, _497);
      float _499 = _498 + (_viewProjRelative[1].w);
      float _500 = (_viewProjRelative[2].x) * _135;
      float _501 = mad((_viewProjRelative[2].y), _136, _500);
      float _502 = mad((_viewProjRelative[2].z), _137, _501);
      float _503 = _502 + (_viewProjRelative[2].w);
      float _504 = (_viewProjRelative[3].x) * _135;
      float _505 = mad((_viewProjRelative[3].y), _136, _504);
      float _506 = mad((_viewProjRelative[3].z), _137, _505);
      float _507 = _506 + (_viewProjRelative[3].w);
      float _508 = _458 * _393;
      float _509 = _462 * _393;
      float _510 = _466 * _393;
      float _511 = _508 + _135;
      float _512 = _509 + _136;
      float _513 = _510 + _137;
      float _514 = (_viewProjRelative[0].x) * _511;
      float _515 = mad((_viewProjRelative[0].y), _512, _514);
      float _516 = mad((_viewProjRelative[0].z), _513, _515);
      float _517 = _516 + (_viewProjRelative[0].w);
      float _518 = (_viewProjRelative[1].x) * _511;
      float _519 = mad((_viewProjRelative[1].y), _512, _518);
      float _520 = mad((_viewProjRelative[1].z), _513, _519);
      float _521 = _520 + (_viewProjRelative[1].w);
      float _522 = (_viewProjRelative[2].x) * _511;
      float _523 = mad((_viewProjRelative[2].y), _512, _522);
      float _524 = mad((_viewProjRelative[2].z), _513, _523);
      float _525 = _524 + (_viewProjRelative[2].w);
      float _526 = (_viewProjRelative[3].x) * _511;
      float _527 = mad((_viewProjRelative[3].y), _512, _526);
      float _528 = mad((_viewProjRelative[3].z), _513, _527);
      float _529 = _528 + (_viewProjRelative[3].w);
      float _530 = _495 / _507;
      float _531 = _499 / _507;
      float _532 = _503 / _507;
      float _533 = _517 / _529;
      float _534 = _521 / _529;
      float _535 = _525 / _529;
      float _536 = _533 - _530;
      float _537 = _534 - _531;
      float _538 = _535 - _532;
      float _539 = float((uint)(uint)(_186));
      float _540 = 1.0f / _539;
      float _541 = abs(_536);
      float _542 = abs(_537);
      float _543 = _541 * _bufferSizeAndInvSize.x;
      float _544 = _542 * _bufferSizeAndInvSize.y;
      float _545 = max(_543, _544);
      float _546 = _545 * _540;
      float _547 = min(1.0f, _546);
      float _548 = 1.0f / _547;
      float _549 = max(_540, _548);
      float _550 = _549 * _538;
      float _551 = _530 * 0.5f;
      float _552 = _531 * 0.5f;
      float _553 = _551 + 0.5f;
      float _554 = 0.5f - _552;
      float _558 = mad((_proj[2].z), _98, 0.0f);
      float _559 = mad((_proj[3].z), _98, 0.0f);
      float _560 = _558 + _503;
      float _561 = _559 + _507;
      float _562 = _560 / _561;
      float _563 = _532 - _562;
      float _564 = abs(_550);
      float _565 = max(_564, _563);
      float _566 = max(0.0625f, _540);
      float _567 = _549 * _540;
      float _568 = _536 * 0.5f;
      float _569 = _568 * _567;
      float _570 = _537 * -0.5f;
      float _571 = _570 * _567;
      float _572 = _550 * _540;
      float _573 = abs(_569);
      float _574 = abs(_571);
      float _575 = _573 * _bufferSizeAndInvSize.x;
      float _576 = _574 * _bufferSizeAndInvSize.y;
      float _577 = max(_575, _576);
      float _578 = 1.0f / _577;
      float _579 = max(_471, _578);
      float _580 = _579 * _569;
      float _581 = _579 * _571;
      float _582 = _579 * _572;
      float _583 = _553 + _580;
      float _584 = _554 + _581;
      float _585 = _582 + _532;
      float _586 = _540 * _393;
      _588 = _583;
      _589 = _584;
      _590 = _585;
      _591 = 0.0f;
      _592 = 0.25f;
      _593 = 0;
      _594 = 0;
      _595 = 0.0f;
      while(true) {
        float _596 = _588 * _bufferSizeAndInvSize.x;
        float _597 = _589 * _bufferSizeAndInvSize.y;
        int _598 = int(_596);
        int _599 = int(_597);
        uint _601 = __3__36__0__0__g_depthStencil.Load(int3(_598, _599, 0));
        int _603 = (uint)((uint)(_601.x)) >> 24;
        int _604 = _601.x & 16777215;
        float _605 = float((uint)(uint)(_604));
        float _606 = _605 * 5.960465188081798e-08f;
        int _607 = _603 & 127;
        bool _608 = (_593 == 2);
        float _609 = select(_608, 1.2000000476837158f, _592);
        bool _610 = (_594 == 0);
        float _611 = _590 - _606;
        float _614 = max(1.0000000116860974e-07f, _606);
        float _615 = _nearFarProj.x / _614;
        float _616 = _586 * _609;
        float _617 = max(1.0000000116860974e-07f, _590);
        float _618 = _nearFarProj.x / _617;
        float _619 = _615 - _618;
        float _620 = _565 * 0.3400000035762787f;
        float _621 = _620 * _566;
        float _622 = _611 + _621;
        float _623 = abs(_622);
        bool _624 = (_623 < _621);
        bool __defer_587_636 = false;
        bool __branch_chain_587;
        if (!_624) {
          _637 = 0;
          __branch_chain_587 = true;
        } else {
          bool _626 = (_607 == 5);
          float _627 = _615 * 0.5f;
          float _628 = _615 * _615;
          float _629 = _628 * 0.009999999776482582f;
          float _630 = min(_627, _629);
          float _631 = max(0.029999999329447746f, _630);
          float _632 = -0.0f - _631;
          float _633 = select(_626, -0.07999999821186066f, _632);
          bool _634 = (_619 > _633);
          int _635 = (int)(uint)((int)(_634));
          if (!_634) {
            _637 = _635;
            __branch_chain_587 = true;
          } else {
            _655 = _635;
            _656 = _591;
            __branch_chain_587 = false;
          }
        }
        if (__branch_chain_587) {
          __defer_587_636 = true;
        }
        if (__defer_587_636) {
          bool _640 = ((_591 == 0.0f) && (_611 < 0.0f));
          if (_640) {
            float _642 = -0.0f - _619;
            _655 = _637;
            _656 = _642;
          } else {
            bool _644 = (_591 > 0.0f);
            if (_644) {
              bool _646 = (_611 > 0.0f);
              float _647 = _616 * 1.5f;
              bool _648 = (_591 < _647);
              bool _649 = (_648) || (_646);
              if (_649) {
                float _651 = _591 - _647;
                bool _652 = (_651 < 0.0f);
                int _653 = (int)(uint)((int)(_652));
                _655 = _653;
                _656 = 0.0f;
              } else {
                _655 = _637;
                _656 = _591;
              }
            } else {
              _655 = _637;
              _656 = _591;
            }
          }
        }
        bool _657 = (_655 == 0);
        if (!_657) {
          // RenoDX: Extend AO distance falloff for foliage stencils (12-18).
          // Vanilla: fades from depth 100 to 120 (0.05 slope). Too aggressive for foliage.
          // Foliage: fades from depth 200 to 400 (0.005 slope). Keeps AO visible at distance.
          float _aoDistFade;
          if (FOLIAGE_AO_STRENGTH > 0.0f && ((uint)(_56 - 12) < 7u)) {
            _aoDistFade = 1.0f - saturate(max((_615 + -200.0f), 0.0f) * 0.005f);
          } else {
            float _659 = _615 + -100.0f;
            float _660 = max(_659, 0.0f);
            float _661 = _660 * 0.05000000074505806f;
            float _662 = saturate(_661);
            _aoDistFade = 1.0f - _662;
          }
          float _663 = _aoDistFade;
          bool _666 = (_terrainNormalParams.z > 0.0f);
          float _667 = select(_666, 0.20000000298023224f, 0.6000000238418579f);
          bool _670 = ((_607 == 19) || (_607 == 107));
          if (_670) {
            float _672 = _615 * 0.009999999776482582f;
            float _673 = 1.0f - _672;
            float _674 = max(0.10000000149011612f, _673);
            _676 = _674;
          } else {
            _676 = 1.0f;
          }
          float _677 = _616 * 20.0f;
          float _678 = _677 * _663;
          float _679 = _615 * 0.20000000298023224f;
          float _680 = _679 + 1.0f;
          float _681 = _678 / _680;
          float _682 = max(_676, _681);
          float _683 = log2(_667);
          float _684 = _683 * _682;
          float _685 = exp2(_684);
          float _686 = 1.0f - _685;
          float _687 = saturate(_686);
          float _688 = 1.0f - _595;
          float _689 = _687 * _688;
          float _690 = _689 + _595;
          float _691 = saturate(_690);
          if (_610) {
            bool _696 = ((_607 == 57) || ((uint)(_607 + -53) < (uint)15));
            _698 = _696;
          } else {
            _698 = true;
          }
          int _699 = (int)(uint)((int)(_698));
          _701 = _699;
          _702 = _691;
        } else {
          _701 = _594;
          _702 = _595;
        }
        bool _703 = (_702 > 0.75f);
        [branch]
        if (!_703) {
          bool _705 = (_701 != 0);
          int _706 = (int)(uint)((int)(_705));
          float _707 = _609 * _569;
          float _708 = _609 * _571;
          float _709 = _609 * _572;
          float _710 = _707 + _588;
          float _711 = _708 + _589;
          float _712 = _709 + _590;
          float _713 = _609 * 1.100000023841858f;
          bool _715 = ((uint)(_593 + 1) < (uint)_186);
          if (_715) {
            _588 = _710;
            _589 = _711;
            _590 = _712;
            _591 = _656;
            _592 = _713;
            _593 = (_593 + 1);
            _594 = _706;
            _595 = _702;
            continue;
          } else {
            _717 = 0;
          }
        } else {
          _717 = _607;
        }
        float _718 = _458 + _410;
        float _719 = _462 + _411;
        float _720 = _466 + _412;
        float _721 = _702 * 1.100000023841858f;
        float _722 = saturate(_721);
        float _723 = saturate(_722);
        bool _725 = ((uint)(_717 + -97) < (uint)2);
        float _726 = _723 * 0.33000001311302185f;
        float _727 = select(_725, _726, _723);
        bool _728 = (_56 == 15);
        if (_728) {
          float _730 = _727 * 2.0f;
          float _731 = saturate(_730);
          _733 = _731;
        } else {
          _733 = _727;
        }
        float _734 = 1.0f - _733;
        bool _735 = ((uint)(_56 + -53) > (uint)14);
        bool _737 = ((uint)(_717 + -53) < (uint)15);
        bool _738 = (_735) && (_737);
        float _739 = select(_738, 0.30000001192092896f, _734);
        float _740 = _739 * _458;
        float _741 = _739 * _462;
        float _742 = _739 * _466;
        float _743 = _740 + _407;
        float _744 = _741 + _408;
        float _745 = _742 + _409;
        float _746 = _414 + 1.0f;
        float _747 = _458 - _140;
        float _748 = _462 - _141;
        float _749 = _466 - _142;
        float _750 = dot(float3(_747, _748, _749), float3(_747, _748, _749));
        float _751 = rsqrt(_750);
        float _752 = _751 * _747;
        float _753 = _751 * _748;
        float _754 = _751 * _749;
        float _755 = dot(float3(_235, _236, _237), float3(_752, _753, _754));
        float _756 = saturate(_755);
        float _757 = _756 * _756;
        float _758 = _757 * 0.35999995470046997f;
        float _759 = 1.0f - _758;
        float _760 = _759 * _759;
        float _761 = 0.20371833443641663f / _760;
        float _762 = _761 * _734;
        float _763 = _762 + _415;
        float _764 = _761 + _416;
        bool _766 = ((_701 | _417) != 0);
        bool _767 = (_766) || (_737);
        int _768 = (int)(uint)((int)(_767));
        bool _770 = ((uint)(_418 + 1) < (uint)_185);
        bool __defer_732_805 = false;
        float _397 = 0.0f;  // hoisted: defined after __defer_732_805 block, used inside it
        float _788 = 0.0f;  // hoisted: defined after __defer_732_805 block, used inside it
        if (_770) {
          _407 = _743;
          _408 = _744;
          _409 = _745;
          _410 = _718;
          _411 = _719;
          _412 = _720;
          _413 = (int)(_467);
          _414 = _746;
          _415 = _763;
          _416 = _764;
          _417 = _768;
          _418 = (_418 + 1);
          __loop_jump_target = 406;
          break;
        }
        if (__defer_732_805) {
          float _808 = _806 * _shadowAOParams.w;
          float _809 = _806 + _shadowAOParams.w;
          float _810 = _809 - _808;
          float _811 = _795 * 0.5f;
          float _812 = _796 * 0.5f;
          float _813 = _797 * 0.5f;
          float _814 = _811 + 0.5f;
          float _815 = _812 + 0.5f;
          float _816 = _813 + 0.5f;
          __3__38__0__1__g_bentConeResultUAV[int2(((int)(((uint)(_36) + SV_GroupThreadID.x) + ((uint)(_17 << 4)))), ((int)((((uint)(_15 << 4)) + SV_GroupThreadID.y) + ((uint)(_34 << 5)))))] = float4(_814, _815, _816, _788);
          _819 = _810;
          _820 = _397;
          break;
        }
        float _395 = max(9.999999974752427e-07f, _764);
        float _396 = _763 / _395;
        _397 = saturate(_396);
        float _398 = _718 * _718;
        float _399 = _719 * _719;
        float _400 = _399 + _398;
        float _401 = _720 * _720;
        float _402 = _400 + _401;
        float _403 = sqrt(_402);
        float _404 = _403 * _746;
        bool _405 = (_404 == 0.0f);
        if (!_405) {
          float _772 = float((uint)(uint)(_185));
          float _773 = _772 / _404;
          float _774 = _773 * _743;
          float _775 = _773 * _744;
          float _776 = _773 * _745;
          _778 = _774;
          _779 = _775;
          _780 = _776;
        } else {
          _778 = _743;
          _779 = _744;
          _780 = _745;
        }
        float _781 = _778 * _778;
        float _782 = _779 * _779;
        float _783 = _782 + _781;
        float _784 = _780 * _780;
        float _785 = _783 + _784;
        float _786 = sqrt(_785);
        float _787 = 1.0f - _786;
        _788 = saturate(_787);
        bool _789 = (_786 == 0.0f);
        if (!_789) {
          float _791 = _778 / _786;
          float _792 = _779 / _786;
          float _793 = _780 / _786;
          _795 = _791;
          _796 = _792;
          _797 = _793;
        } else {
          _795 = _235;
          _796 = _236;
          _797 = _237;
        }
        if (!_148) {
          float _799 = 1.0f - _397;
          float _800 = saturate(_799);
          float _801 = select(_767, 0.0f, 1.0f);
          float _802 = saturate(_801);
          float _803 = _802 * _800;
          float _804 = 1.0f - _803;
          _806 = _804;
        } else {
          _806 = 1.0f;
        }
        float _808 = _806 * _shadowAOParams.w;
        float _809 = _806 + _shadowAOParams.w;
        float _810 = _809 - _808;
        float _811 = _795 * 0.5f;
        float _812 = _796 * 0.5f;
        float _813 = _797 * 0.5f;
        float _814 = _811 + 0.5f;
        float _815 = _812 + 0.5f;
        float _816 = _813 + 0.5f;
        __3__38__0__1__g_bentConeResultUAV[int2(((int)(((uint)(_36) + SV_GroupThreadID.x) + ((uint)(_17 << 4)))), ((int)((((uint)(_15 << 4)) + SV_GroupThreadID.y) + ((uint)(_34 << 5)))))] = float4(_814, _815, _816, _788);
        _819 = _810;
        // RenoDX: Reduce AO screen blend washout for foliage stencils (12-18).
        if (FOLIAGE_AO_STRENGTH > 0.0f && ((uint)(_56 - 12) < 7u)) {
          _819 = lerp(_819, _806, FOLIAGE_AO_STRENGTH);
        }
        _820 = _397;
        break;
      }
      if (__loop_jump_target == 406) {
        __loop_jump_target = -1;
        continue;
      }
      if (__loop_jump_target != -1) {
        break;
      }
      break;
    }
  }
  __3__38__0__1__g_sceneAOResultUAV[int2(((int)(((uint)(_36) + SV_GroupThreadID.x) + ((uint)(_17 << 4)))), ((int)((((uint)(_15 << 4)) + SV_GroupThreadID.y) + ((uint)(_34 << 5)))))] = float2(_819, _820);
}