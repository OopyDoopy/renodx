struct PostProcessVHSNoiseStruct {
  float _VHSNoiseProgress;
  float _timeSpeed;
  float _largeNoiseThreshold;
  float _largeNoiseDarkness;
  float _smallNoiseAmplitude;
  float _randomJitterThreshold;
  float _scanlineDarkness;
  float _vignetteRatio;
  float _vignetteWidth;
  float3 _slopeRGB;
  float _saturationRatio;
  float _chromaticAberrationRatio;
  uint _noiseTexture;
};


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

ConstantBuffer<PostProcessVHSNoiseStruct> BindlessParameters_PostProcessVHSNoise[] : register(b0, space100);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  int _18 = WaveReadLaneFirst(_materialIndex);
  float _554;
  float _555;
  float _556;
  float _557;
  float _571;
  float _776;
  float _777;
  float _778;
  float _871;
  float _872;
  float _873;
  float _927;
  float _928;
  float _929;
  float _948;
  float _949;
  float _950;
  float _980;
  float _981;
  float _982;
  float _996;
  float _997;
  float _998;
  [branch]
  if (!(WaveReadLaneFirst(BindlessParameters_PostProcessVHSNoise[((int)((uint)(select(((uint)_18 < (uint)170000), _18, 0)) + 0u))]._VHSNoiseProgress) < 0.0010000000474974513f)) {
    int _31 = WaveReadLaneFirst(_materialIndex);
    float _40 = WaveReadLaneFirst(BindlessParameters_PostProcessVHSNoise[((int)((uint)(select(((uint)_31 < (uint)170000), _31, 0)) + 0u))]._timeSpeed) * _time.x;
    int _44 = WaveReadLaneFirst(_materialIndex);
    float _52 = WaveReadLaneFirst(BindlessParameters_PostProcessVHSNoise[((int)((uint)(select(((uint)_44 < (uint)170000), _44, 0)) + 0u))]._largeNoiseThreshold);
    float _54 = _40 * 0.10000000149011612f;
    float _61 = (_40 * 0.5f) - (((sin(_54 + 7.130000114440918f) * 0.5f) + 1.0f) * sin(_54));
    float _62 = TEXCOORD.y * 4.800000190734863f;
    float _63 = dot(float2(_61, _62), float2(0.3660254180431366f, 0.3660254180431366f));
    float _66 = floor(_61 + _63);
    float _67 = floor(_63 + _62);
    float _70 = dot(float2(_66, _67), float2(0.21132487058639526f, 0.21132487058639526f));
    float _71 = (_61 - _66) + _70;
    float _72 = (_62 - _67) + _70;
    bool _73 = (_71 > _72);
    float _74 = select(_73, 1.0f, 0.0f);
    float _75 = select(_73, 0.0f, 1.0f);
    float _78 = _71 + -0.5773502588272095f;
    float _79 = _72 + -0.5773502588272095f;
    float _80 = (_71 + 0.21132487058639526f) - _74;
    float _81 = (_72 + 0.21132487058639526f) - _75;
    float _88 = _66 - (floor(_66 * 0.0034602077212184668f) * 289.0f);
    float _89 = _67 - (floor(_67 * 0.0034602077212184668f) * 289.0f);
    float _90 = _89 + _75;
    float _91 = _89 + 1.0f;
    float _98 = ((_89 * 34.0f) + 1.0f) * _89;
    float _99 = ((_90 * 34.0f) + 1.0f) * _90;
    float _100 = ((_91 * 34.0f) + 1.0f) * _91;
    float _111 = (_98 - (floor(_98 * 0.0034602077212184668f) * 289.0f)) + _88;
    float _114 = ((_74 + _88) - (floor(_99 * 0.0034602077212184668f) * 289.0f)) + _99;
    float _117 = ((_88 + 1.0f) - (floor(_100 * 0.0034602077212184668f) * 289.0f)) + _100;
    float _124 = ((_111 * 34.0f) + 1.0f) * _111;
    float _125 = ((_114 * 34.0f) + 1.0f) * _114;
    float _126 = ((_117 * 34.0f) + 1.0f) * _117;
    float _145 = max((0.5f - dot(float2(_71, _72), float2(_71, _72))), 0.0f);
    float _146 = max((0.5f - dot(float2(_80, _81), float2(_80, _81))), 0.0f);
    float _147 = max((0.5f - dot(float2(_78, _79), float2(_78, _79))), 0.0f);
    float _148 = _145 * _145;
    float _149 = _146 * _146;
    float _150 = _147 * _147;
    float _160 = frac((_124 - (floor(_124 * 0.0034602077212184668f) * 289.0f)) * 0.024390242993831635f) * 2.0f;
    float _161 = frac((_125 - (floor(_125 * 0.0034602077212184668f) * 289.0f)) * 0.024390242993831635f) * 2.0f;
    float _162 = frac((_126 - (floor(_126 * 0.0034602077212184668f) * 289.0f)) * 0.024390242993831635f) * 2.0f;
    float _163 = _160 + -1.0f;
    float _164 = _161 + -1.0f;
    float _165 = _162 + -1.0f;
    float _169 = abs(_163) + -0.5f;
    float _170 = abs(_164) + -0.5f;
    float _171 = abs(_165) + -0.5f;
    float _178 = _163 - floor(_160 + -0.5f);
    float _179 = _164 - floor(_161 + -0.5f);
    float _180 = _165 - floor(_162 + -0.5f);
    float _216 = _40 * 1.7000000476837158f;
    float _217 = floor(_216);
    float _219 = frac(_216);
    float _227 = frac(sin(dot(float2(13.0f, _217), float2(127.0999984741211f, 311.70001220703125f))) * 437.5450134277344f);
    float _237 = ((((((_219 * _219) * (3.0f - (_219 * 2.0f))) * (frac(sin(dot(float2(13.0f, (_217 + 1.0f)), float2(127.0999984741211f, 311.70001220703125f))) * 437.5450134277344f) - _227)) + _227) * 0.3700000047683716f) + _40) * 0.8999999761581421f;
    float _238 = floor(_237);
    float _240 = frac(_237);
    float _248 = frac(sin(dot(float2(31.0f, _238), float2(127.0999984741211f, 311.70001220703125f))) * 437.5450134277344f);
    float _258 = _bufferSizeAndInvSize.y * TEXCOORD.y;
    float _260 = floor(_258 * 0.5f);
    float _262 = floor(_40 * 0.30000001192092896f);
    float _264 = floor(_40 * -0.699999988079071f);
    float _279 = saturate((frac(sin(dot(float2((_260 * 1.7300000190734863f), (_262 + 71.0f)), float2(127.0999984741211f, 311.70001220703125f))) * 437.5450134277344f) + -0.8999999761581421f) * 9.999998092651367f);
    float _282 = saturate((frac(sin(dot(float2((_260 * 2.4100000858306885f), (_264 + 137.0f)), float2(127.0999984741211f, 311.70001220703125f))) * 437.5450134277344f) + -0.8700000047683716f) * 9.999998092651367f);
    float _285 = _279 * _282;
    float _305 = _40 * 20.0f;
    float _306 = _258 * 2.0f;
    float _307 = dot(float2(_305, _306), float2(0.3660254180431366f, 0.3660254180431366f));
    float _310 = floor(_307 + _305);
    float _311 = floor(_307 + _306);
    float _314 = dot(float2(_310, _311), float2(0.21132487058639526f, 0.21132487058639526f));
    float _315 = _314 + (_305 - _310);
    float _316 = (_306 - _311) + _314;
    bool _317 = (_315 > _316);
    float _318 = select(_317, 1.0f, 0.0f);
    float _319 = select(_317, 0.0f, 1.0f);
    float _322 = _315 + -0.5773502588272095f;
    float _323 = _316 + -0.5773502588272095f;
    float _324 = (_315 + 0.21132487058639526f) - _318;
    float _325 = (_316 + 0.21132487058639526f) - _319;
    float _332 = _310 - (floor(_310 * 0.0034602077212184668f) * 289.0f);
    float _333 = _311 - (floor(_311 * 0.0034602077212184668f) * 289.0f);
    float _334 = _333 + _319;
    float _335 = _333 + 1.0f;
    float _342 = ((_333 * 34.0f) + 1.0f) * _333;
    float _343 = ((_334 * 34.0f) + 1.0f) * _334;
    float _344 = ((_335 * 34.0f) + 1.0f) * _335;
    float _355 = (_342 - (floor(_342 * 0.0034602077212184668f) * 289.0f)) + _332;
    float _358 = ((_318 + _332) - (floor(_343 * 0.0034602077212184668f) * 289.0f)) + _343;
    float _361 = ((_332 + 1.0f) - (floor(_344 * 0.0034602077212184668f) * 289.0f)) + _344;
    float _368 = ((_355 * 34.0f) + 1.0f) * _355;
    float _369 = ((_358 * 34.0f) + 1.0f) * _358;
    float _370 = ((_361 * 34.0f) + 1.0f) * _361;
    float _389 = max((0.5f - dot(float2(_315, _316), float2(_315, _316))), 0.0f);
    float _390 = max((0.5f - dot(float2(_324, _325), float2(_324, _325))), 0.0f);
    float _391 = max((0.5f - dot(float2(_322, _323), float2(_322, _323))), 0.0f);
    float _392 = _389 * _389;
    float _393 = _390 * _390;
    float _394 = _391 * _391;
    float _404 = frac((_368 - (floor(_368 * 0.0034602077212184668f) * 289.0f)) * 0.024390242993831635f) * 2.0f;
    float _405 = frac((_369 - (floor(_369 * 0.0034602077212184668f) * 289.0f)) * 0.024390242993831635f) * 2.0f;
    float _406 = frac((_370 - (floor(_370 * 0.0034602077212184668f) * 289.0f)) * 0.024390242993831635f) * 2.0f;
    float _407 = _404 + -1.0f;
    float _408 = _405 + -1.0f;
    float _409 = _406 + -1.0f;
    float _413 = abs(_407) + -0.5f;
    float _414 = abs(_408) + -0.5f;
    float _415 = abs(_409) + -0.5f;
    float _422 = _407 - floor(_404 + -0.5f);
    float _423 = _408 - floor(_405 + -0.5f);
    float _424 = _409 - floor(_406 + -0.5f);
    int _455 = WaveReadLaneFirst(_materialIndex);
    int _466 = WaveReadLaneFirst(_materialIndex);
    float _477 = _bufferSizeAndInvSize.y * 0.017999999225139618f;
    float _479 = floor(_477 * TEXCOORD.y);
    float _488 = floor((_40 * 0.699999988079071f) * ((frac(sin(dot(float2(_479, 11.0f), float2(127.0999984741211f, 311.70001220703125f))) * 437.5450134277344f) * 3.9000000953674316f) + 0.10000000149011612f));
    int _524 = WaveReadLaneFirst(_materialIndex);
    float _546 = floor(frac(_time.x) * 30.0f) * 0.24423667788505554f;
    _554 = ((1.0f / max(9.999999747378752e-05f, (1.0f - _52))) * max(0.0f, ((dot(float3(((_148 * _148) * (1.7928428649902344f - (((_178 * _178) + (_169 * _169)) * 0.8537347316741943f))), ((_149 * _149) * (1.7928428649902344f - (((_179 * _179) + (_170 * _170)) * 0.8537347316741943f))), ((_150 * _150) * (1.7928428649902344f - (((_180 * _180) + (_171 * _171)) * 0.8537347316741943f)))), float3(((_178 * _71) + (_169 * _72)), ((_179 * _80) + (_170 * _81)), ((_180 * _78) + (_171 * _79)))) * 130.0f) - _52)));
    _555 = select((WaveReadLaneFirst(BindlessParameters_PostProcessVHSNoise[((int)((uint)(select(((uint)_466 < (uint)170000), _466, 0)) + 0u))]._smallNoiseAmplitude) < 0.0010000000474974513f), 0.0f, (((((((frac(sin(dot(float2((_260 * 3.1700000762939453f), ((_262 + 211.0f) + (_264 * 0.5f))), float2(127.0999984741211f, 311.70001220703125f))) * 437.5450134277344f) * 5.0f) + 0.5f) * saturate(((3.0f - (_282 * 2.0f)) * (12.0f - (_279 * 8.0f))) * (_285 * _285))) + 1.0f) * ((((((_240 * _240) * (3.0f - (_240 * 2.0f))) * (frac(sin(dot(float2(31.0f, (_238 + 1.0f)), float2(127.0999984741211f, 311.70001220703125f))) * 437.5450134277344f) - _248)) + _248) * 0.8999999761581421f) + 0.3499999940395355f)) * ((dot(float3(((_392 * _392) * (1.7928428649902344f - (((_422 * _422) + (_413 * _413)) * 0.8537347316741943f))), ((_393 * _393) * (1.7928428649902344f - (((_423 * _423) + (_414 * _414)) * 0.8537347316741943f))), ((_394 * _394) * (1.7928428649902344f - (((_424 * _424) + (_415 * _415)) * 0.8537347316741943f)))), float3(((_422 * _315) + (_413 * _316)), ((_423 * _324) + (_414 * _325)), ((_424 * _322) + (_415 * _323)))) * 130.0f) + -0.5f)) * WaveReadLaneFirst(BindlessParameters_PostProcessVHSNoise[((int)((uint)(select(((uint)_455 < (uint)170000), _455, 0)) + 0u))]._smallNoiseAmplitude)));
    _556 = select((frac(sin(dot(float2(_479, (_488 + 17.0f)), float2(127.0999984741211f, 311.70001220703125f))) * 437.5450134277344f) < WaveReadLaneFirst(BindlessParameters_PostProcessVHSNoise[((int)((uint)(select(((uint)_524 < (uint)170000), _524, 0)) + 0u))]._randomJitterThreshold)), 0.0f, ((((frac(sin(dot(float2(_479, (_488 + 59.0f)), float2(127.0999984741211f, 311.70001220703125f))) * 437.5450134277344f) * 2.0f) + -1.0f) * ((frac(sin(dot(float2(_479, (_488 + 43.0f)), float2(127.0999984741211f, 311.70001220703125f))) * 437.5450134277344f) * 0.75f) + 0.25f)) * select((((frac(sin(dot(float2(_479, (_488 + 29.0f)), float2(127.0999984741211f, 311.70001220703125f))) * 437.5450134277344f) * 0.800000011920929f) + 0.20000000298023224f) < frac(((_time.x * 0.009999999776482582f) + TEXCOORD.y) * _477)), 0.0f, 1.0f)));
    _557 = frac(sin(dot(float2((_546 + (floor(_bufferSizeAndInvSize.x * TEXCOORD.x) / _bufferSizeAndInvSize.x)), (_546 + (floor(_258) / _bufferSizeAndInvSize.y))), float2(127.0999984741211f, 311.70001220703125f))) * 437.5450134277344f);
  } else {
    _554 = 0.0f;
    _555 = 0.0f;
    _556 = 0.0f;
    _557 = 1.0f;
  }
  uint _558 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    uint2 _565 = __3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), (int)(_558), 0));
    _571 = (float((uint)((uint)(_565.x & 127))) + 0.5f);
  } else {
    _571 = _557;
  }
  bool _574 = (_localToneMappingParams.w > 0.0f);
  if (_574) {
    float3 output_color = TonemapReplacer(float3(_554, _555, _556));
    _927 = output_color.x;
    _928 = output_color.y;
    _929 = output_color.z;
  } else {
    _927 = _554;
    _928 = _555;
    _929 = _556;
  }
  if (_etcParams.y > 1.0f) {
    float _938 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    float _939 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    float _943 = saturate(1.0f - (dot(float2(_938, _939), float2(_938, _939)) * saturate(_etcParams.y + -1.0f)));
    _948 = (_943 * _927);
    _949 = (_943 * _928);
    _950 = (_943 * _929);
  } else {
    _948 = _927;
    _949 = _928;
    _950 = _929;
  }
  if ((_574) && ((_etcParams.z > 0.0f))) {
    _980 = select((_948 <= 0.0031308000907301903f), (_948 * 12.920000076293945f), (((pow(_948, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _981 = select((_949 <= 0.0031308000907301903f), (_949 * 12.920000076293945f), (((pow(_949, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _982 = select((_950 <= 0.0031308000907301903f), (_950 * 12.920000076293945f), (((pow(_950, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _980 = _948;
    _981 = _949;
    _982 = _950;
  }
  if (!(!(_etcParams.y >= 1.0f))) {
    float _987 = float((uint)_558);
    if (!(_987 < _viewDir.w)) {
      if (!(_987 >= (_screenSizeAndInvSize.y - _viewDir.w))) {
        _996 = _980;
        _997 = _981;
        _998 = _982;
      } else {
        _996 = 0.0f;
        _997 = 0.0f;
        _998 = 0.0f;
      }
    } else {
      _996 = 0.0f;
      _997 = 0.0f;
      _998 = 0.0f;
    }
  } else {
    _996 = _980;
    _997 = _981;
    _998 = _982;
  }
  SV_Target.x = _996;
  SV_Target.y = _997;
  SV_Target.z = _998;
  SV_Target.w = _571;
  return SV_Target;
}