#include "../shared.h"

Texture3D<float4> __3__36__0__0__g_texFroxel : register(t133, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t32, space36);

Texture2D<float4> __3__36__0__0__g_depth : register(t20, space36);

Texture2D<float2> __3__36__0__0__g_velocity : register(t22, space36);

Texture2D<float4> __3__36__0__0__g_velocityTile : register(t35, space36);

Texture2D<float4> __3__36__0__0__g_glareResult : register(t37, space36);

Texture2D<float4> __3__36__0__0__g_distortionOffsetHalf : register(t38, space36);

Texture2D<float4> __3__36__0__0__g_distortionOffsetQuarter : register(t39, space36);

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

cbuffer __3__35__0__0__ExposureConstantBuffer : register(b30, space35) {
  float4 _exposure0 : packoffset(c000.x);
  float4 _exposure1 : packoffset(c001.x);
  float4 _exposure2 : packoffset(c002.x);
  float4 _exposure3 : packoffset(c003.x);
  float4 _exposure4 : packoffset(c004.x);
};

cbuffer __3__1__0__0__GlobalPushConstants : register(b0, space1) {
  float4 _textureSizeAndInvSize : packoffset(c000.x);
  float4 _tileSizeAndInvSize : packoffset(c001.x);
  float4 _motionBlurParam : packoffset(c002.x);
  float4 _backgroundBlurParam0 : packoffset(c003.x);
  float4 _backgroundBlurParam1 : packoffset(c004.x);
  float4 _renderParam : packoffset(c005.x);
  uint4 _colorCorrectionColor : packoffset(c006.x);
  float4 _colorCorrectionIntensity : packoffset(c007.x);
  float4 _volumeSize : packoffset(c008.x);
};

cbuffer __3__35__0__0__AutoWhiteBalanceColorConstantBuffer : register(b44, space35) {
  float4 _autoWhiteBalanceColor : packoffset(c000.x);
  float4 _adaptationTintColor : packoffset(c001.x);
};

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

SamplerState __0__4__0__0__g_staticBilinearBlackBorder : register(s4, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

SamplerState __0__4__0__0__g_staticPointBlackBorder : register(s11, space4);

static const float offset[12] = { -1.0f, -1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, -1.0f, 1.0f, -1.0f, 1.0f, 1.0f };

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  uint _25 = uint(SV_Position.x);
  uint _26 = uint(SV_Position.y);
  float _30 = float((uint)_25);
  float _31 = float((uint)_26);
  float _35 = frac(frac(dot(float2(_30, _31), float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f);
  float4 _47 = __3__36__0__0__g_sceneColor.Load(int3((int)(_25), (int)(_26), 0));
  float _53 = min(_motionBlurParam.y, 1000.0f);
  float _56 = (TEXCOORD.x * 2.0f) + -1.0f;
  float _57 = 1.0f - (TEXCOORD.y * 2.0f);
  float4 _60 = __3__36__0__0__g_depth.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y), 0.0f);
  float4 _78 = __3__36__0__0__g_velocityTile.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(saturate(_tileSizeAndInvSize.z * min(((_tileSizeAndInvSize.x * TEXCOORD.x) + ((_35 + -0.5f) * 0.5f)), _tileSizeAndInvSize.x)), saturate(min(((_tileSizeAndInvSize.y * TEXCOORD.y) + ((frac(frac(dot(float2((_30 + 32.665000915527344f), (_31 + 11.8149995803833f)), float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f) + -0.5f) * 0.5f)), _tileSizeAndInvSize.y) * _tileSizeAndInvSize.w)), 0.0f);
  float _86 = _textureSizeAndInvSize.y / _textureSizeAndInvSize.x;
  float _87 = _86 * _78.w;
  float _91 = max(_temporalReprojectionParams.x, _temporalReprojectionParams.w);
  float _94 = _78.z - (_91 * _78.z);
  float _95 = (_91 * _87) - _87;
  float _96 = _86 * _78.y;
  float _99 = _78.x - (_91 * _78.x);
  float _100 = (_91 * _96) - _96;
  float _104 = sqrt((_94 * _94) + (_95 * _95));
  float _105 = abs(_95);
  float _106 = abs(_94);
  float _109 = min(_106, _105) / max(_106, _105);
  float _110 = _109 * _109;
  float _115 = ((((_110 * 0.08729290217161179f) + -0.30189499258995056f) * _110) + 1.0f) * _109;
  float _118 = select((_105 > _106), (1.5707963705062866f - _115), _115);
  float _121 = select((_94 < 0.0f), (3.1415927410125732f - _118), _118);
  float _124 = select((_95 < 0.0f), (-0.0f - _121), _121);
  bool _127 = (isnan(_104)) || (isnan(_124));
  float _129 = select(_127, 0.0f, _124);
  float _133 = min((_textureSizeAndInvSize.x * 0.0002604166802484542f), (_textureSizeAndInvSize.y * 0.00046296295477077365f)) * 0.03999999910593033f;
  float _134 = min(select(_127, 0.0f, _104), _133);
  float _137 = cos(_129) * _134;
  float _138 = sin(_129) * _134;
  float _142 = sqrt((_99 * _99) + (_100 * _100));
  float _143 = abs(_100);
  float _144 = abs(_99);
  float _147 = min(_144, _143) / max(_144, _143);
  float _148 = _147 * _147;
  float _153 = ((((_148 * 0.08729290217161179f) + -0.30189499258995056f) * _148) + 1.0f) * _147;
  float _156 = select((_143 > _144), (1.5707963705062866f - _153), _153);
  float _159 = select((_99 < 0.0f), (3.1415927410125732f - _156), _156);
  float _162 = select((_100 < 0.0f), (-0.0f - _159), _159);
  bool _165 = (isnan(_142)) || (isnan(_162));
  float _167 = select(_165, 0.0f, _162);
  float _171 = _137 * _53;
  float _172 = _138 * _53;
  float _173 = min(select(_165, 0.0f, _142), _133) * _53;
  float _174 = cos(_167) * _173;
  float _175 = _173 * sin(_167);
  float _187 = max(0.0f, (min(sqrt((_171 * _171) + (_172 * _172)), _motionBlurParam.z) + -1.0f));
  float _189 = max(0.0f, (min(sqrt((_174 * _174) + (_175 * _175)), _motionBlurParam.z) + -1.0f));
  float _192 = max(1.0000000116860974e-07f, _60.x);
  float _193 = _nearFarProj.x / _192;
  float _273;
  float _274;
  float _275;
  float _276;
  int _277;
  int _278;
  float _347;
  float _348;
  float _349;
  float _350;
  float _587;
  float _588;
  float _600;
  float _870;
  float _871;
  float _889;
  float _890;
  float _988;
  float _989;
  float _1005;
  float _1006;
  float _1100;
  float _1101;
  float _1117;
  float _1118;
  float _1234;
  float _1235;
  float _1251;
  float _1252;
  float _1339;
  float _1340;
  float _1356;
  float _1357;
  float _1473;
  float _1474;
  float _1490;
  float _1491;
  float _1578;
  float _1579;
  float _1595;
  float _1596;
  float _1712;
  float _1713;
  float _1729;
  float _1730;
  float _1817;
  float _1818;
  float _1834;
  float _1835;
  float _1949;
  float _1950;
  float _1951;
  float _2171;
  float _2172;
  float _2184;
  float _2251;
  float _2252;
  float _2253;
  if (_backgroundBlurParam1.z > 0.5f) {
    float _233 = mad((_invViewProjRelative[3].z), _192, mad((_invViewProjRelative[3].y), _57, ((_invViewProjRelative[3].x) * _56))) + (_invViewProjRelative[3].w);
    float _234 = (mad((_invViewProjRelative[0].z), _192, mad((_invViewProjRelative[0].y), _57, ((_invViewProjRelative[0].x) * _56))) + (_invViewProjRelative[0].w)) / _233;
    float _235 = (mad((_invViewProjRelative[1].z), _192, mad((_invViewProjRelative[1].y), _57, ((_invViewProjRelative[1].x) * _56))) + (_invViewProjRelative[1].w)) / _233;
    float _236 = (mad((_invViewProjRelative[2].z), _192, mad((_invViewProjRelative[2].y), _57, ((_invViewProjRelative[2].x) * _56))) + (_invViewProjRelative[2].w)) / _233;
    float4 _254 = __3__36__0__0__g_texFroxel.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(TEXCOORD.x, TEXCOORD.y, (max(0.0f, (log2((max(0.0f, sqrt(((_235 * _235) + (_234 * _234)) + (_236 * _236))) * 0.04351966083049774f) + 1.0f) * 17.673004150390625f)) / _volumeSize.z)), 0.0f);
    if (_254.w < 0.8999999761581421f) {
      float _265 = min((((saturate(_193 * 9.999999747378752e-06f) * 98.0f) + 2.0f) * (1.0f - sqrt(_254.w))), 2.200000047683716f);
      _273 = _47.x;
      _274 = _47.y;
      _275 = _47.z;
      _276 = _47.w;
      _277 = ((int)(uint)((int)(((_60.x < 1.0000000116860974e-07f)) || ((_60.x == 1.0f)))));
      _278 = 0;
      while(true) {
        float _294 = (((offset[((int)(0u + (_278 * 3)))]) * _265) * _textureSizeAndInvSize.z) + TEXCOORD.x;
        float _295 = (((offset[((int)(1u + (_278 * 3)))]) * _265) * _textureSizeAndInvSize.w) + TEXCOORD.y;
        float4 _298 = __3__36__0__0__g_depth.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_294, _295), 0.0f);
        float _302 = saturate((_298.x - _60.x) * 10000.0f);
        float _306 = offset[((int)(2u + (_278 * 3)))];
        float4 _309 = __3__36__0__0__g_sceneColor.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_294, _295), 0.0f);
        float _314 = _309.x * _306;
        float _315 = _309.y * _306;
        float _316 = _309.z * _306;
        float _317 = _309.w * _306;
        float _327 = (_314 + _273) + ((_47.x - _314) * _302);
        float _329 = (_315 + _274) + ((_47.y - _315) * _302);
        float _331 = (_316 + _275) + ((_47.z - _316) * _302);
        float _333 = (_317 + _276) + ((_47.w - _317) * _302);
        int _338 = ((int)(uint)((int)(((_298.x < 1.0000000116860974e-07f)) || ((_298.x == 1.0f))))) & _277;
        if (!((_278 + 1) == 4)) {
          _273 = _327;
          _274 = _329;
          _275 = _331;
          _276 = _333;
          _277 = _338;
          _278 = (_278 + 1);
          continue;
        }
        if (_338 == 0) {
          _347 = (_327 * 0.20000000298023224f);
          _348 = (_329 * 0.20000000298023224f);
          _349 = (_331 * 0.20000000298023224f);
          _350 = (_333 * 0.20000000298023224f);
        } else {
          _347 = _47.x;
          _348 = _47.y;
          _349 = _47.z;
          _350 = _47.w;
        }
        break;
      }
    } else {
      _347 = _47.x;
      _348 = _47.y;
      _349 = _47.z;
      _350 = _47.w;
    }
  } else {
    _347 = _47.x;
    _348 = _47.y;
    _349 = _47.z;
    _350 = _47.w;
  }
  float _351 = _187 * _187;
  if (_351 < 0.25f) {
    float4 _358 = __3__36__0__0__g_glareResult.SampleLevel(__0__4__0__0__g_staticBilinearBlackBorder, float2(TEXCOORD.x, TEXCOORD.y), 0.0f);
    float4 _363 = __3__36__0__0__g_glareResult.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(TEXCOORD.x, TEXCOORD.y), 0.0f);
    // RenoDX: Decode bloom using slow filtered exposure to match the encode
    // path in Histogram AWB
    float _bloomDecodeExp = (IMPROVED_AUTO_EXPOSURE >= 1) ? max(_exposure4.z, 0.001f) : _exposure0.x;
    float _368 = (_363.z + _358.z) / _bloomDecodeExp;
    float _371 = (_363.y + _358.y) / _bloomDecodeExp;
    float _374 = (_363.x + _358.x) / _bloomDecodeExp;

    // RenoDX: Bloom strength control
    {
      float _bloomScale = BLOOM_STRENGTH;
      _368 *= _bloomScale;
      _371 *= _bloomScale;
      _374 *= _bloomScale;
    }
    float _379 = ((((_371 * 0.3395099937915802f) + (_374 * 0.6131200194358826f)) + (_368 * 0.047370001673698425f)) * 0.5f) + _347;
    float _386 = ((((_371 * 0.9163600206375122f) + (_374 * 0.07020000368356705f)) + (_368 * 0.013450000435113907f)) * 0.5f) + _348;
    float _393 = ((((_371 * 0.10958000272512436f) + (_374 * 0.02061999961733818f)) + (_368 * 0.8697999715805054f)) * 0.5f) + _349;
    float _398 = float((uint)((uint)(((uint)((uint)(_colorCorrectionColor.w)) >> 16) & 255)));
    float _401 = float((uint)((uint)(((uint)((uint)(_colorCorrectionColor.w)) >> 8) & 255)));
    float _403 = float((uint)((uint)(_colorCorrectionColor.w & 255)));
    float _434 = _379 / max(9.999999747378752e-06f, select(((_398 * 0.003921568859368563f) < 0.040449999272823334f), (_398 * 0.0003035269910469651f), exp2(log2((_398 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)));
    float _435 = _386 / max(9.999999747378752e-06f, select(((_401 * 0.003921568859368563f) < 0.040449999272823334f), (_401 * 0.0003035269910469651f), exp2(log2((_401 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)));
    float _436 = _393 / max(9.999999747378752e-06f, select(((_403 * 0.003921568859368563f) < 0.040449999272823334f), (_403 * 0.0003035269910469651f), exp2(log2((_403 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)));
    float _464 = (_colorCorrectionIntensity.w * ((_379 - _434) + (((_379 / max(9.999999747378752e-06f, _autoWhiteBalanceColor.x)) - _379) * 0.75f))) + _434;
    float _465 = (_colorCorrectionIntensity.w * ((_386 - _435) + (((_386 / max(9.999999747378752e-06f, _autoWhiteBalanceColor.y)) - _386) * 0.75f))) + _435;
    float _466 = (((_393 - _436) + (((_393 / max(9.999999747378752e-06f, _autoWhiteBalanceColor.z)) - _393) * 0.75f)) * _colorCorrectionIntensity.w) + _436;
    float _492 = select((_adaptationTintColor.x <= 0.0031308000907301903f), (_adaptationTintColor.x * 12.920000076293945f), (((pow(_adaptationTintColor.x, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    float _493 = select((_adaptationTintColor.y <= 0.0031308000907301903f), (_adaptationTintColor.y * 12.920000076293945f), (((pow(_adaptationTintColor.y, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    float _494 = select((_adaptationTintColor.z <= 0.0031308000907301903f), (_adaptationTintColor.z * 12.920000076293945f), (((pow(_adaptationTintColor.z, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    float _507 = ((_493 * 0.3395099937915802f) + (_492 * 0.6131200194358826f)) + (_494 * 0.047370001673698425f);
    float _508 = ((_493 * 0.9163600206375122f) + (_492 * 0.07020000368356705f)) + (_494 * 0.013450000435113907f);
    float _509 = ((_493 * 0.10958000272512436f) + (_492 * 0.02061999961733818f)) + (_494 * 0.8697999715805054f);
    float _514 = max(dot(float3(_507, _508, _509), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)), 9.999999747378752e-05f);
    float _515 = (_507 * _464) / _514;
    float _516 = (_508 * _465) / _514;
    float _517 = (_509 * _466) / _514;
    float _519 = saturate(_adaptationTintColor.w);
    float _520 = dot(float3(_464, _465, _466), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
    float _525 = max(dot(float3(_515, _516, _517), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)), 9.999999747378752e-05f);
    float _546 = -0.0f - min(0.0f, (-0.0f - (_464 + ((((_520 * _515) / _525) - _464) * _519))));
    float _547 = -0.0f - min(0.0f, (-0.0f - (_465 + ((((_520 * _516) / _525) - _465) * _519))));
    float _548 = -0.0f - min(0.0f, (-0.0f - (_466 + ((((_520 * _517) / _525) - _466) * _519))));
    float _570 = min(max((9000.0f - (5000.0f / (exp2(exp2(log2(abs((_time.w * 0.11666666716337204f) + -1.399999976158142f)) * 8.0f) * -1.4426950216293335f) + 1.0f))), 1000.0f), 40000.0f) * 0.009999999776482582f;
    if (!(_570 <= 66.0f)) {
      float _578 = log2(_570 + -60.0f);
      _587 = (exp2(_578 * -0.07551484555006027f) * 1.1298909187316895f);
      _588 = saturate(exp2(_578 * -0.13320475816726685f) * 1.2929362058639526f);
    } else {
      _587 = ((log2(_570) * 0.27038395404815674f) + -0.6318414211273193f);
      _588 = 1.0f;
    }
    float _589 = saturate(_587);
    if (!(_570 >= 66.0f)) {
      if (!(_570 <= 19.0f)) {
        _600 = saturate((log2(_570 + -10.0f) * 0.3765222728252411f) + -1.1962541341781616f);
      } else {
        _600 = 0.0f;
      }
    } else {
      _600 = 1.0f;
    }
    float _622 = select((_588 < 0.040449999272823334f), (_588 * 0.07739938050508499f), exp2(log2((_588 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f));
    float _623 = select((_589 < 0.040449999272823334f), (_589 * 0.07739938050508499f), exp2(log2((_589 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f));
    float _624 = select((_600 < 0.040449999272823334f), (_600 * 0.07739938050508499f), exp2(log2((_600 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f));
    float _652 = _546 / max(9.999999747378752e-06f, ((((((_622 * 0.6131200194358826f) + -1.0f) + (_623 * 0.3395099937915802f)) + (_624 * 0.047370001673698425f)) * _renderParam.y) + 1.0f));
    float _653 = _547 / max(9.999999747378752e-06f, ((((((_622 * 0.07020000368356705f) + -1.0f) + (_623 * 0.9163600206375122f)) + (_624 * 0.013450000435113907f)) * _renderParam.y) + 1.0f));
    float _654 = _548 / max(9.999999747378752e-06f, ((((((_622 * 0.02061999961733818f) + -1.0f) + (_623 * 0.10958000272512436f)) + (_624 * 0.8697999715805054f)) * _renderParam.y) + 1.0f));
    float _662 = ((max(max(_546, _547), _548) + min(min(_546, _547), _548)) * 0.5f) / max(9.999999747378752e-06f, ((max(max(_652, _653), _654) + min(min(_652, _653), _654)) * 0.5f));
    _2251 = (_662 * _652);
    _2252 = (_662 * _653);
    _2253 = (_662 * _654);
  } else {
    float _670 = _textureSizeAndInvSize.z * 0.5f;
    float _671 = _textureSizeAndInvSize.w * 0.5f;
    float _676 = (_textureSizeAndInvSize.x + -0.5f) * _textureSizeAndInvSize.z;
    float _677 = (_textureSizeAndInvSize.y + -0.5f) * _textureSizeAndInvSize.w;
    float _678 = _textureSizeAndInvSize.z * _171;
    float _679 = _textureSizeAndInvSize.w * _172;
    float _680 = -0.0f - _678;
    float _681 = -0.0f - _679;
    float4 _683 = __3__36__0__0__g_glareResult.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y), 0.0f);
    // RenoDX: Decode bloom using slow filtered exposure (same as low motion path)
    float _bloomDecodeExp2 = (IMPROVED_AUTO_EXPOSURE >= 1) ? max(_exposure4.z, 0.001f) : _exposure0.x;
    float _687 = _683.x / _bloomDecodeExp2;
    float _688 = _683.y / _bloomDecodeExp2;
    float _689 = _683.z / _bloomDecodeExp2;

    // RenoDX: Bloom strength control
    {
      float _bloomScale2 = BLOOM_STRENGTH;
      _687 *= _bloomScale2;
      _688 *= _bloomScale2;
      _689 *= _bloomScale2;
    }
    if ((_189 * _189) > (_351 * 0.4000000059604645f)) {
      float _704 = _35 * 0.25f;
      float _705 = (1.0f - _35) * 0.25f;
      float4 _723 = __3__36__0__0__g_sceneColor.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(min(max(((_678 * _704) + TEXCOORD.x), _670), _676), min(max(((_679 * _704) + TEXCOORD.y), _671), _677)), 0.0f);
      float4 _727 = __3__36__0__0__g_sceneColor.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(min(max(((_705 * _680) + TEXCOORD.x), _670), _676), min(max(((_705 * _681) + TEXCOORD.y), _671), _677)), 0.0f);
      float _736 = (_35 + 1.0f) * 0.25f;
      float _737 = (2.0f - _35) * 0.25f;
      float4 _754 = __3__36__0__0__g_sceneColor.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(min(max(((_678 * _736) + TEXCOORD.x), _670), _676), min(max(((_679 * _736) + TEXCOORD.y), _671), _677)), 0.0f);
      float4 _761 = __3__36__0__0__g_sceneColor.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(min(max(((_737 * _680) + TEXCOORD.x), _670), _676), min(max(((_737 * _681) + TEXCOORD.y), _671), _677)), 0.0f);
      float _770 = (_35 + 2.0f) * 0.25f;
      float _771 = (3.0f - _35) * 0.25f;
      float4 _788 = __3__36__0__0__g_sceneColor.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(min(max(((_678 * _770) + TEXCOORD.x), _670), _676), min(max(((_679 * _770) + TEXCOORD.y), _671), _677)), 0.0f);
      float4 _795 = __3__36__0__0__g_sceneColor.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(min(max(((_771 * _680) + TEXCOORD.x), _670), _676), min(max(((_771 * _681) + TEXCOORD.y), _671), _677)), 0.0f);
      float _804 = (_35 + 3.0f) * 0.25f;
      float _805 = (4.0f - _35) * 0.25f;
      float4 _822 = __3__36__0__0__g_sceneColor.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(min(max(((_678 * _804) + TEXCOORD.x), _670), _676), min(max(((_679 * _804) + TEXCOORD.y), _671), _677)), 0.0f);
      float4 _829 = __3__36__0__0__g_sceneColor.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(min(max(((_805 * _680) + TEXCOORD.x), _670), _676), min(max(((_805 * _681) + TEXCOORD.y), _671), _677)), 0.0f);
      _1949 = ((((((((_727.x + _723.x) + _754.x) + _761.x) + _788.x) + _795.x) + _822.x) + _829.x) * 0.125f);
      _1950 = ((((((((_727.y + _723.y) + _754.y) + _761.y) + _788.y) + _795.y) + _822.y) + _829.y) * 0.125f);
      _1951 = ((((((((_727.z + _723.z) + _754.z) + _761.z) + _788.z) + _795.z) + _822.z) + _829.z) * 0.125f);
    } else {
      uint _842 = uint(_textureSizeAndInvSize.x * TEXCOORD.x);
      uint _843 = uint(_textureSizeAndInvSize.y * TEXCOORD.y);
      float2 _845 = __3__36__0__0__g_velocity.Load(int3((int)(_842), (int)(_843), 0));
      float _848 = _845.x * _motionBlurParam.x;
      float _850 = (_textureSizeAndInvSize.y / _textureSizeAndInvSize.x) * _motionBlurParam.x;
      uint _854 = uint(_backgroundBlurParam1.w);
      bool _856 = (((int)(_854) & 1) == 0);
      if (!_856) {
        float4 _865 = __3__36__0__0__g_distortionOffsetHalf.Load(int3((int)(uint(float((uint)_842) * 0.5f)), (int)(uint(float((uint)_843) * 0.5f)), 0));
        _870 = (_865.x + _848);
        _871 = _865.y;
      } else {
        _870 = _848;
        _871 = -0.0f;
      }
      float _872 = _871 - (_850 * _845.y);
      bool _874 = (((int)(_854) & 2) == 0);
      if (!_874) {
        float4 _883 = __3__36__0__0__g_distortionOffsetQuarter.Load(int3((int)(uint(float((uint)_842) * 0.25f)), (int)(uint(float((uint)_843) * 0.25f)), 0));
        _889 = (_883.x + _870);
        _890 = (_883.y + _872);
      } else {
        _889 = _870;
        _890 = _872;
      }
      float _895 = -0.0f - max(_temporalReprojectionParams.x, _temporalReprojectionParams.w);
      float _898 = (_889 * _895) + _889;
      float _899 = (_890 * _895) + _890;
      float _903 = sqrt((_898 * _898) + (_899 * _899));
      float _904 = abs(_899);
      float _905 = abs(_898);
      float _908 = min(_905, _904) / max(_905, _904);
      float _909 = _908 * _908;
      float _914 = ((((_909 * 0.08729290217161179f) + -0.30189499258995056f) * _909) + 1.0f) * _908;
      float _917 = select((_904 > _905), (1.5707963705062866f - _914), _914);
      float _920 = select((_898 < 0.0f), (3.1415927410125732f - _917), _917);
      float _923 = select((_899 < 0.0f), (-0.0f - _920), _920);
      bool _926 = (isnan(_903)) || (isnan(_923));
      float _928 = select(_926, 0.0f, _923);
      float _932 = min((_textureSizeAndInvSize.x * 0.0002604166802484542f), (_textureSizeAndInvSize.y * 0.00046296295477077365f)) * 0.03999999910593033f;
      float _933 = min(select(_926, 0.0f, _903), _932);
      float _936 = cos(_928) * _933;
      float _937 = sin(_928) * _933;
      float _946 = 4.0f / _187;
      float _948 = _35 * 0.25f;
      float _949 = (1.0f - _35) * 0.25f;
      float _960 = min(max(((_678 * _948) + TEXCOORD.x), _670), _676);
      float _961 = min(max(((_679 * _948) + TEXCOORD.y), _671), _677);
      float _964 = min(max(((_949 * _680) + TEXCOORD.x), _670), _676);
      float _965 = min(max(((_949 * _681) + TEXCOORD.y), _671), _677);
      uint _968 = uint(_960 * _textureSizeAndInvSize.x);
      uint _969 = uint(_961 * _textureSizeAndInvSize.y);
      float2 _970 = __3__36__0__0__g_velocity.Load(int3((int)(_968), (int)(_969), 0));
      float _973 = _970.x * _motionBlurParam.x;
      if (!_856) {
        float4 _983 = __3__36__0__0__g_distortionOffsetHalf.Load(int3((int)(uint(float((uint)_968) * 0.5f)), (int)(uint(float((uint)_969) * 0.5f)), 0));
        _988 = (_983.x + _973);
        _989 = _983.y;
      } else {
        _988 = _973;
        _989 = -0.0f;
      }
      float _990 = _989 - (_850 * _970.y);
      if (!_874) {
        float4 _999 = __3__36__0__0__g_distortionOffsetQuarter.Load(int3((int)(uint(float((uint)_968) * 0.25f)), (int)(uint(float((uint)_969) * 0.25f)), 0));
        _1005 = (_999.x + _988);
        _1006 = (_999.y + _990);
      } else {
        _1005 = _988;
        _1006 = _990;
      }
      float _1009 = (_1005 * _895) + _1005;
      float _1010 = (_1006 * _895) + _1006;
      float _1014 = sqrt((_1010 * _1010) + (_1009 * _1009));
      float _1015 = abs(_1010);
      float _1016 = abs(_1009);
      float _1019 = min(_1016, _1015) / max(_1016, _1015);
      float _1020 = _1019 * _1019;
      float _1025 = ((((_1020 * 0.08729290217161179f) + -0.30189499258995056f) * _1020) + 1.0f) * _1019;
      float _1028 = select((_1015 > _1016), (1.5707963705062866f - _1025), _1025);
      float _1031 = select((_1009 < 0.0f), (3.1415927410125732f - _1028), _1028);
      float _1034 = select((_1010 < 0.0f), (-0.0f - _1031), _1031);
      bool _1037 = (isnan(_1014)) || (isnan(_1034));
      float _1039 = select(_1037, 0.0f, _1034);
      float _1040 = min(select(_1037, 0.0f, _1014), _932);
      float _1043 = cos(_1039) * _1040;
      float _1044 = sin(_1039) * _1040;
      float _1050 = min((sqrt((_1043 * _1043) + (_1044 * _1044)) * _53), _motionBlurParam.z);
      float4 _1053 = __3__36__0__0__g_depth.SampleLevel(__0__4__0__0__g_staticPointBlackBorder, float2(_960, _961), 0.0f);
      float _1058 = _nearFarProj.x / max(1.0000000116860974e-07f, _1053.x);
      float4 _1060 = __3__36__0__0__g_sceneColor.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_960, _961), 0.0f);
      float _1064 = _1058 - _193;
      float _1069 = _946 * max(0.0f, (min((sqrt((_936 * _936) + (_937 * _937)) * _53), _motionBlurParam.z) + -1.0f));
      float _1072 = max((_35 + -1.0f), 0.0f);
      float _1075 = saturate(_1069 - _1072);
      uint _1080 = uint(_964 * _textureSizeAndInvSize.x);
      uint _1081 = uint(_965 * _textureSizeAndInvSize.y);
      float2 _1082 = __3__36__0__0__g_velocity.Load(int3((int)(_1080), (int)(_1081), 0));
      float _1085 = _1082.x * _motionBlurParam.x;
      if (!_856) {
        float4 _1095 = __3__36__0__0__g_distortionOffsetHalf.Load(int3((int)(uint(float((uint)_1080) * 0.5f)), (int)(uint(float((uint)_1081) * 0.5f)), 0));
        _1100 = (_1095.x + _1085);
        _1101 = _1095.y;
      } else {
        _1100 = _1085;
        _1101 = -0.0f;
      }
      float _1102 = _1101 - (_850 * _1082.y);
      if (!_874) {
        float4 _1111 = __3__36__0__0__g_distortionOffsetQuarter.Load(int3((int)(uint(float((uint)_1080) * 0.25f)), (int)(uint(float((uint)_1081) * 0.25f)), 0));
        _1117 = (_1111.x + _1100);
        _1118 = (_1111.y + _1102);
      } else {
        _1117 = _1100;
        _1118 = _1102;
      }
      float _1121 = (_1117 * _895) + _1117;
      float _1122 = (_1118 * _895) + _1118;
      float _1126 = sqrt((_1122 * _1122) + (_1121 * _1121));
      float _1127 = abs(_1122);
      float _1128 = abs(_1121);
      float _1131 = min(_1128, _1127) / max(_1128, _1127);
      float _1132 = _1131 * _1131;
      float _1137 = ((((_1132 * 0.08729290217161179f) + -0.30189499258995056f) * _1132) + 1.0f) * _1131;
      float _1140 = select((_1127 > _1128), (1.5707963705062866f - _1137), _1137);
      float _1143 = select((_1121 < 0.0f), (3.1415927410125732f - _1140), _1140);
      float _1146 = select((_1122 < 0.0f), (-0.0f - _1143), _1143);
      bool _1149 = (isnan(_1126)) || (isnan(_1146));
      float _1151 = select(_1149, 0.0f, _1146);
      float _1152 = min(select(_1149, 0.0f, _1126), _932);
      float _1155 = cos(_1151) * _1152;
      float _1156 = sin(_1151) * _1152;
      float _1162 = min((sqrt((_1155 * _1155) + (_1156 * _1156)) * _53), _motionBlurParam.z);
      float4 _1163 = __3__36__0__0__g_depth.SampleLevel(__0__4__0__0__g_staticPointBlackBorder, float2(_964, _965), 0.0f);
      float _1166 = _nearFarProj.x / max(1.0000000116860974e-07f, _1163.x);
      float4 _1167 = __3__36__0__0__g_sceneColor.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_964, _965), 0.0f);
      float _1171 = _1166 - _193;
      float _1179 = dot(float2(saturate(_1171 + 0.5f), saturate(0.5f - _1171)), float2(_1075, saturate((_1162 * _946) - _1072)));
      bool _1180 = (_1058 > _1166);
      bool _1181 = (_1162 > _1050);
      float _1183 = select(((_1181) && (_1180)), _1179, dot(float2(saturate(_1064 + 0.5f), saturate(0.5f - _1064)), float2(_1075, saturate((_1050 * _946) - _1072))));
      float _1185 = select(((_1181) || (_1180)), _1179, _1183);
      float _1192 = _35 + 1.0f;
      float _1194 = _1192 * 0.25f;
      float _1195 = (2.0f - _35) * 0.25f;
      float _1206 = min(max(((_678 * _1194) + TEXCOORD.x), _670), _676);
      float _1207 = min(max(((_679 * _1194) + TEXCOORD.y), _671), _677);
      float _1210 = min(max(((_1195 * _680) + TEXCOORD.x), _670), _676);
      float _1211 = min(max(((_1195 * _681) + TEXCOORD.y), _671), _677);
      uint _1214 = uint(_1206 * _textureSizeAndInvSize.x);
      uint _1215 = uint(_1207 * _textureSizeAndInvSize.y);
      float2 _1216 = __3__36__0__0__g_velocity.Load(int3((int)(_1214), (int)(_1215), 0));
      float _1219 = _1216.x * _motionBlurParam.x;
      if (!_856) {
        float4 _1229 = __3__36__0__0__g_distortionOffsetHalf.Load(int3((int)(uint(float((uint)_1214) * 0.5f)), (int)(uint(float((uint)_1215) * 0.5f)), 0));
        _1234 = (_1229.x + _1219);
        _1235 = _1229.y;
      } else {
        _1234 = _1219;
        _1235 = -0.0f;
      }
      float _1236 = _1235 - (_850 * _1216.y);
      if (!_874) {
        float4 _1245 = __3__36__0__0__g_distortionOffsetQuarter.Load(int3((int)(uint(float((uint)_1214) * 0.25f)), (int)(uint(float((uint)_1215) * 0.25f)), 0));
        _1251 = (_1245.x + _1234);
        _1252 = (_1245.y + _1236);
      } else {
        _1251 = _1234;
        _1252 = _1236;
      }
      float _1255 = (_1251 * _895) + _1251;
      float _1256 = (_1252 * _895) + _1252;
      float _1260 = sqrt((_1256 * _1256) + (_1255 * _1255));
      float _1261 = abs(_1256);
      float _1262 = abs(_1255);
      float _1265 = min(_1262, _1261) / max(_1262, _1261);
      float _1266 = _1265 * _1265;
      float _1271 = ((((_1266 * 0.08729290217161179f) + -0.30189499258995056f) * _1266) + 1.0f) * _1265;
      float _1274 = select((_1261 > _1262), (1.5707963705062866f - _1271), _1271);
      float _1277 = select((_1255 < 0.0f), (3.1415927410125732f - _1274), _1274);
      float _1280 = select((_1256 < 0.0f), (-0.0f - _1277), _1277);
      bool _1283 = (isnan(_1260)) || (isnan(_1280));
      float _1285 = select(_1283, 0.0f, _1280);
      float _1286 = min(select(_1283, 0.0f, _1260), _932);
      float _1289 = cos(_1285) * _1286;
      float _1290 = sin(_1285) * _1286;
      float _1296 = min((sqrt((_1289 * _1289) + (_1290 * _1290)) * _53), _motionBlurParam.z);
      float4 _1297 = __3__36__0__0__g_depth.SampleLevel(__0__4__0__0__g_staticPointBlackBorder, float2(_1206, _1207), 0.0f);
      float _1300 = _nearFarProj.x / max(1.0000000116860974e-07f, _1297.x);
      float4 _1301 = __3__36__0__0__g_sceneColor.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_1206, _1207), 0.0f);
      float _1305 = _1300 - _193;
      float _1311 = max(_35, 0.0f);
      float _1314 = saturate(_1069 - _1311);
      uint _1319 = uint(_1210 * _textureSizeAndInvSize.x);
      uint _1320 = uint(_1211 * _textureSizeAndInvSize.y);
      float2 _1321 = __3__36__0__0__g_velocity.Load(int3((int)(_1319), (int)(_1320), 0));
      float _1324 = _1321.x * _motionBlurParam.x;
      if (!_856) {
        float4 _1334 = __3__36__0__0__g_distortionOffsetHalf.Load(int3((int)(uint(float((uint)_1319) * 0.5f)), (int)(uint(float((uint)_1320) * 0.5f)), 0));
        _1339 = (_1334.x + _1324);
        _1340 = _1334.y;
      } else {
        _1339 = _1324;
        _1340 = -0.0f;
      }
      float _1341 = _1340 - (_850 * _1321.y);
      if (!_874) {
        float4 _1350 = __3__36__0__0__g_distortionOffsetQuarter.Load(int3((int)(uint(float((uint)_1319) * 0.25f)), (int)(uint(float((uint)_1320) * 0.25f)), 0));
        _1356 = (_1350.x + _1339);
        _1357 = (_1350.y + _1341);
      } else {
        _1356 = _1339;
        _1357 = _1341;
      }
      float _1360 = (_1356 * _895) + _1356;
      float _1361 = (_1357 * _895) + _1357;
      float _1365 = sqrt((_1361 * _1361) + (_1360 * _1360));
      float _1366 = abs(_1361);
      float _1367 = abs(_1360);
      float _1370 = min(_1367, _1366) / max(_1367, _1366);
      float _1371 = _1370 * _1370;
      float _1376 = ((((_1371 * 0.08729290217161179f) + -0.30189499258995056f) * _1371) + 1.0f) * _1370;
      float _1379 = select((_1366 > _1367), (1.5707963705062866f - _1376), _1376);
      float _1382 = select((_1360 < 0.0f), (3.1415927410125732f - _1379), _1379);
      float _1385 = select((_1361 < 0.0f), (-0.0f - _1382), _1382);
      bool _1388 = (isnan(_1365)) || (isnan(_1385));
      float _1390 = select(_1388, 0.0f, _1385);
      float _1391 = min(select(_1388, 0.0f, _1365), _932);
      float _1394 = cos(_1390) * _1391;
      float _1395 = sin(_1390) * _1391;
      float _1401 = min((sqrt((_1394 * _1394) + (_1395 * _1395)) * _53), _motionBlurParam.z);
      float4 _1402 = __3__36__0__0__g_depth.SampleLevel(__0__4__0__0__g_staticPointBlackBorder, float2(_1210, _1211), 0.0f);
      float _1405 = _nearFarProj.x / max(1.0000000116860974e-07f, _1402.x);
      float4 _1406 = __3__36__0__0__g_sceneColor.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_1210, _1211), 0.0f);
      float _1410 = _1405 - _193;
      float _1418 = dot(float2(saturate(_1410 + 0.5f), saturate(0.5f - _1410)), float2(_1314, saturate((_1401 * _946) - _1311)));
      bool _1419 = (_1300 > _1405);
      bool _1420 = (_1401 > _1296);
      float _1422 = select(((_1420) && (_1419)), _1418, dot(float2(saturate(_1305 + 0.5f), saturate(0.5f - _1305)), float2(_1314, saturate((_1296 * _946) - _1311))));
      float _1424 = select(((_1420) || (_1419)), _1418, _1422);
      float _1431 = _35 + 2.0f;
      float _1433 = _1431 * 0.25f;
      float _1434 = (3.0f - _35) * 0.25f;
      float _1445 = min(max(((_678 * _1433) + TEXCOORD.x), _670), _676);
      float _1446 = min(max(((_679 * _1433) + TEXCOORD.y), _671), _677);
      float _1449 = min(max(((_1434 * _680) + TEXCOORD.x), _670), _676);
      float _1450 = min(max(((_1434 * _681) + TEXCOORD.y), _671), _677);
      uint _1453 = uint(_1445 * _textureSizeAndInvSize.x);
      uint _1454 = uint(_1446 * _textureSizeAndInvSize.y);
      float2 _1455 = __3__36__0__0__g_velocity.Load(int3((int)(_1453), (int)(_1454), 0));
      float _1458 = _1455.x * _motionBlurParam.x;
      if (!_856) {
        float4 _1468 = __3__36__0__0__g_distortionOffsetHalf.Load(int3((int)(uint(float((uint)_1453) * 0.5f)), (int)(uint(float((uint)_1454) * 0.5f)), 0));
        _1473 = (_1468.x + _1458);
        _1474 = _1468.y;
      } else {
        _1473 = _1458;
        _1474 = -0.0f;
      }
      float _1475 = _1474 - (_850 * _1455.y);
      if (!_874) {
        float4 _1484 = __3__36__0__0__g_distortionOffsetQuarter.Load(int3((int)(uint(float((uint)_1453) * 0.25f)), (int)(uint(float((uint)_1454) * 0.25f)), 0));
        _1490 = (_1484.x + _1473);
        _1491 = (_1484.y + _1475);
      } else {
        _1490 = _1473;
        _1491 = _1475;
      }
      float _1494 = (_1490 * _895) + _1490;
      float _1495 = (_1491 * _895) + _1491;
      float _1499 = sqrt((_1495 * _1495) + (_1494 * _1494));
      float _1500 = abs(_1495);
      float _1501 = abs(_1494);
      float _1504 = min(_1501, _1500) / max(_1501, _1500);
      float _1505 = _1504 * _1504;
      float _1510 = ((((_1505 * 0.08729290217161179f) + -0.30189499258995056f) * _1505) + 1.0f) * _1504;
      float _1513 = select((_1500 > _1501), (1.5707963705062866f - _1510), _1510);
      float _1516 = select((_1494 < 0.0f), (3.1415927410125732f - _1513), _1513);
      float _1519 = select((_1495 < 0.0f), (-0.0f - _1516), _1516);
      bool _1522 = (isnan(_1499)) || (isnan(_1519));
      float _1524 = select(_1522, 0.0f, _1519);
      float _1525 = min(select(_1522, 0.0f, _1499), _932);
      float _1528 = cos(_1524) * _1525;
      float _1529 = sin(_1524) * _1525;
      float _1535 = min((sqrt((_1528 * _1528) + (_1529 * _1529)) * _53), _motionBlurParam.z);
      float4 _1536 = __3__36__0__0__g_depth.SampleLevel(__0__4__0__0__g_staticPointBlackBorder, float2(_1445, _1446), 0.0f);
      float _1539 = _nearFarProj.x / max(1.0000000116860974e-07f, _1536.x);
      float4 _1540 = __3__36__0__0__g_sceneColor.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_1445, _1446), 0.0f);
      float _1544 = _1539 - _193;
      float _1550 = max(_1192, 0.0f);
      float _1553 = saturate(_1069 - _1550);
      uint _1558 = uint(_1449 * _textureSizeAndInvSize.x);
      uint _1559 = uint(_1450 * _textureSizeAndInvSize.y);
      float2 _1560 = __3__36__0__0__g_velocity.Load(int3((int)(_1558), (int)(_1559), 0));
      float _1563 = _1560.x * _motionBlurParam.x;
      if (!_856) {
        float4 _1573 = __3__36__0__0__g_distortionOffsetHalf.Load(int3((int)(uint(float((uint)_1558) * 0.5f)), (int)(uint(float((uint)_1559) * 0.5f)), 0));
        _1578 = (_1573.x + _1563);
        _1579 = _1573.y;
      } else {
        _1578 = _1563;
        _1579 = -0.0f;
      }
      float _1580 = _1579 - (_850 * _1560.y);
      if (!_874) {
        float4 _1589 = __3__36__0__0__g_distortionOffsetQuarter.Load(int3((int)(uint(float((uint)_1558) * 0.25f)), (int)(uint(float((uint)_1559) * 0.25f)), 0));
        _1595 = (_1589.x + _1578);
        _1596 = (_1589.y + _1580);
      } else {
        _1595 = _1578;
        _1596 = _1580;
      }
      float _1599 = (_1595 * _895) + _1595;
      float _1600 = (_1596 * _895) + _1596;
      float _1604 = sqrt((_1600 * _1600) + (_1599 * _1599));
      float _1605 = abs(_1600);
      float _1606 = abs(_1599);
      float _1609 = min(_1606, _1605) / max(_1606, _1605);
      float _1610 = _1609 * _1609;
      float _1615 = ((((_1610 * 0.08729290217161179f) + -0.30189499258995056f) * _1610) + 1.0f) * _1609;
      float _1618 = select((_1605 > _1606), (1.5707963705062866f - _1615), _1615);
      float _1621 = select((_1599 < 0.0f), (3.1415927410125732f - _1618), _1618);
      float _1624 = select((_1600 < 0.0f), (-0.0f - _1621), _1621);
      bool _1627 = (isnan(_1604)) || (isnan(_1624));
      float _1629 = select(_1627, 0.0f, _1624);
      float _1630 = min(select(_1627, 0.0f, _1604), _932);
      float _1633 = cos(_1629) * _1630;
      float _1634 = sin(_1629) * _1630;
      float _1640 = min((sqrt((_1633 * _1633) + (_1634 * _1634)) * _53), _motionBlurParam.z);
      float4 _1641 = __3__36__0__0__g_depth.SampleLevel(__0__4__0__0__g_staticPointBlackBorder, float2(_1449, _1450), 0.0f);
      float _1644 = _nearFarProj.x / max(1.0000000116860974e-07f, _1641.x);
      float4 _1645 = __3__36__0__0__g_sceneColor.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_1449, _1450), 0.0f);
      float _1649 = _1644 - _193;
      float _1657 = dot(float2(saturate(_1649 + 0.5f), saturate(0.5f - _1649)), float2(_1553, saturate((_1640 * _946) - _1550)));
      bool _1658 = (_1539 > _1644);
      bool _1659 = (_1640 > _1535);
      float _1661 = select(((_1659) && (_1658)), _1657, dot(float2(saturate(_1544 + 0.5f), saturate(0.5f - _1544)), float2(_1553, saturate((_1535 * _946) - _1550))));
      float _1663 = select(((_1659) || (_1658)), _1657, _1661);
      float _1672 = (_35 + 3.0f) * 0.25f;
      float _1673 = (4.0f - _35) * 0.25f;
      float _1684 = min(max(((_678 * _1672) + TEXCOORD.x), _670), _676);
      float _1685 = min(max(((_679 * _1672) + TEXCOORD.y), _671), _677);
      float _1688 = min(max(((_1673 * _680) + TEXCOORD.x), _670), _676);
      float _1689 = min(max(((_1673 * _681) + TEXCOORD.y), _671), _677);
      uint _1692 = uint(_1684 * _textureSizeAndInvSize.x);
      uint _1693 = uint(_1685 * _textureSizeAndInvSize.y);
      float2 _1694 = __3__36__0__0__g_velocity.Load(int3((int)(_1692), (int)(_1693), 0));
      float _1697 = _1694.x * _motionBlurParam.x;
      if (!_856) {
        float4 _1707 = __3__36__0__0__g_distortionOffsetHalf.Load(int3((int)(uint(float((uint)_1692) * 0.5f)), (int)(uint(float((uint)_1693) * 0.5f)), 0));
        _1712 = (_1707.x + _1697);
        _1713 = _1707.y;
      } else {
        _1712 = _1697;
        _1713 = -0.0f;
      }
      float _1714 = _1713 - (_850 * _1694.y);
      if (!_874) {
        float4 _1723 = __3__36__0__0__g_distortionOffsetQuarter.Load(int3((int)(uint(float((uint)_1692) * 0.25f)), (int)(uint(float((uint)_1693) * 0.25f)), 0));
        _1729 = (_1723.x + _1712);
        _1730 = (_1723.y + _1714);
      } else {
        _1729 = _1712;
        _1730 = _1714;
      }
      float _1733 = (_1729 * _895) + _1729;
      float _1734 = (_1730 * _895) + _1730;
      float _1738 = sqrt((_1734 * _1734) + (_1733 * _1733));
      float _1739 = abs(_1734);
      float _1740 = abs(_1733);
      float _1743 = min(_1740, _1739) / max(_1740, _1739);
      float _1744 = _1743 * _1743;
      float _1749 = ((((_1744 * 0.08729290217161179f) + -0.30189499258995056f) * _1744) + 1.0f) * _1743;
      float _1752 = select((_1739 > _1740), (1.5707963705062866f - _1749), _1749);
      float _1755 = select((_1733 < 0.0f), (3.1415927410125732f - _1752), _1752);
      float _1758 = select((_1734 < 0.0f), (-0.0f - _1755), _1755);
      bool _1761 = (isnan(_1738)) || (isnan(_1758));
      float _1763 = select(_1761, 0.0f, _1758);
      float _1764 = min(select(_1761, 0.0f, _1738), _932);
      float _1767 = cos(_1763) * _1764;
      float _1768 = sin(_1763) * _1764;
      float _1774 = min((sqrt((_1767 * _1767) + (_1768 * _1768)) * _53), _motionBlurParam.z);
      float4 _1775 = __3__36__0__0__g_depth.SampleLevel(__0__4__0__0__g_staticPointBlackBorder, float2(_1684, _1685), 0.0f);
      float _1778 = _nearFarProj.x / max(1.0000000116860974e-07f, _1775.x);
      float4 _1779 = __3__36__0__0__g_sceneColor.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_1684, _1685), 0.0f);
      float _1783 = _1778 - _193;
      float _1789 = max(_1431, 0.0f);
      float _1792 = saturate(_1069 - _1789);
      uint _1797 = uint(_1688 * _textureSizeAndInvSize.x);
      uint _1798 = uint(_1689 * _textureSizeAndInvSize.y);
      float2 _1799 = __3__36__0__0__g_velocity.Load(int3((int)(_1797), (int)(_1798), 0));
      float _1802 = _1799.x * _motionBlurParam.x;
      if (!_856) {
        float4 _1812 = __3__36__0__0__g_distortionOffsetHalf.Load(int3((int)(uint(float((uint)_1797) * 0.5f)), (int)(uint(float((uint)_1798) * 0.5f)), 0));
        _1817 = (_1812.x + _1802);
        _1818 = _1812.y;
      } else {
        _1817 = _1802;
        _1818 = -0.0f;
      }
      float _1819 = _1818 - (_850 * _1799.y);
      if (!_874) {
        float4 _1828 = __3__36__0__0__g_distortionOffsetQuarter.Load(int3((int)(uint(float((uint)_1797) * 0.25f)), (int)(uint(float((uint)_1798) * 0.25f)), 0));
        _1834 = (_1828.x + _1817);
        _1835 = (_1828.y + _1819);
      } else {
        _1834 = _1817;
        _1835 = _1819;
      }
      float _1838 = (_1834 * _895) + _1834;
      float _1839 = (_1835 * _895) + _1835;
      float _1843 = sqrt((_1839 * _1839) + (_1838 * _1838));
      float _1844 = abs(_1839);
      float _1845 = abs(_1838);
      float _1848 = min(_1845, _1844) / max(_1845, _1844);
      float _1849 = _1848 * _1848;
      float _1854 = ((((_1849 * 0.08729290217161179f) + -0.30189499258995056f) * _1849) + 1.0f) * _1848;
      float _1857 = select((_1844 > _1845), (1.5707963705062866f - _1854), _1854);
      float _1860 = select((_1838 < 0.0f), (3.1415927410125732f - _1857), _1857);
      float _1863 = select((_1839 < 0.0f), (-0.0f - _1860), _1860);
      bool _1866 = (isnan(_1843)) || (isnan(_1863));
      float _1868 = select(_1866, 0.0f, _1863);
      float _1869 = min(select(_1866, 0.0f, _1843), _932);
      float _1872 = cos(_1868) * _1869;
      float _1873 = sin(_1868) * _1869;
      float _1879 = min((sqrt((_1872 * _1872) + (_1873 * _1873)) * _53), _motionBlurParam.z);
      float4 _1880 = __3__36__0__0__g_depth.SampleLevel(__0__4__0__0__g_staticPointBlackBorder, float2(_1688, _1689), 0.0f);
      float _1883 = _nearFarProj.x / max(1.0000000116860974e-07f, _1880.x);
      float4 _1884 = __3__36__0__0__g_sceneColor.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_1688, _1689), 0.0f);
      float _1888 = _1883 - _193;
      float _1896 = dot(float2(saturate(_1888 + 0.5f), saturate(0.5f - _1888)), float2(_1792, saturate((_1879 * _946) - _1789)));
      bool _1897 = (_1778 > _1883);
      bool _1898 = (_1879 > _1774);
      float _1900 = select(((_1898) && (_1897)), _1896, dot(float2(saturate(_1783 + 0.5f), saturate(0.5f - _1783)), float2(_1792, saturate((_1774 * _946) - _1789))));
      float _1902 = select(((_1898) || (_1897)), _1896, _1900);
      float _1941 = 1.0f - ((((((((_1185 + _1183) + _1422) + _1424) + _1661) + _1663) + _1900) + _1902) * 0.125f);
      _1949 = ((_1941 * _347) + (((((((((_1185 * _1167.x) + (_1183 * _1060.x)) + (_1422 * _1301.x)) + (_1424 * _1406.x)) + (_1661 * _1540.x)) + (_1663 * _1645.x)) + (_1900 * _1779.x)) + (_1902 * _1884.x)) * 0.125f));
      _1950 = ((_1941 * _348) + (((((((((_1185 * _1167.y) + (_1183 * _1060.y)) + (_1422 * _1301.y)) + (_1424 * _1406.y)) + (_1661 * _1540.y)) + (_1663 * _1645.y)) + (_1900 * _1779.y)) + (_1902 * _1884.y)) * 0.125f));
      _1951 = ((_1941 * _349) + (((((((((_1185 * _1167.z) + (_1183 * _1060.z)) + (_1422 * _1301.z)) + (_1424 * _1406.z)) + (_1661 * _1540.z)) + (_1663 * _1645.z)) + (_1900 * _1779.z)) + (_1902 * _1884.z)) * 0.125f));
    }
    float _1952 = _137 * 2.0f;
    float _1953 = _138 * 2.0f;
    float _1959 = saturate(sqrt((_1952 * _1952) + (_1953 * _1953)) * 25.0f);
    float _1969 = ((((_687 * 0.6131200194358826f) + _347) + (_688 * 0.3395099937915802f)) + (_689 * 0.047370001673698425f)) + (_1959 * (_1949 - _347));
    float _1973 = ((((_687 * 0.07020000368356705f) + _348) + (_688 * 0.9163600206375122f)) + (_689 * 0.013450000435113907f)) + (_1959 * (_1950 - _348));
    float _1977 = ((((_687 * 0.02061999961733818f) + _349) + (_688 * 0.10958000272512436f)) + (_689 * 0.8697999715805054f)) + (_1959 * (_1951 - _349));
    float _1982 = float((uint)((uint)(((uint)((uint)(_colorCorrectionColor.w)) >> 16) & 255)));
    float _1985 = float((uint)((uint)(((uint)((uint)(_colorCorrectionColor.w)) >> 8) & 255)));
    float _1987 = float((uint)((uint)(_colorCorrectionColor.w & 255)));
    float _2018 = _1969 / max(9.999999747378752e-06f, select(((_1982 * 0.003921568859368563f) < 0.040449999272823334f), (_1982 * 0.0003035269910469651f), exp2(log2((_1982 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)));
    float _2019 = _1973 / max(9.999999747378752e-06f, select(((_1985 * 0.003921568859368563f) < 0.040449999272823334f), (_1985 * 0.0003035269910469651f), exp2(log2((_1985 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)));
    float _2020 = _1977 / max(9.999999747378752e-06f, select(((_1987 * 0.003921568859368563f) < 0.040449999272823334f), (_1987 * 0.0003035269910469651f), exp2(log2((_1987 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)));
    float _2048 = (_colorCorrectionIntensity.w * ((_1969 - _2018) + (((_1969 / max(9.999999747378752e-06f, _autoWhiteBalanceColor.x)) - _1969) * 0.75f))) + _2018;
    float _2049 = (_colorCorrectionIntensity.w * ((_1973 - _2019) + (((_1973 / max(9.999999747378752e-06f, _autoWhiteBalanceColor.y)) - _1973) * 0.75f))) + _2019;
    float _2050 = (((_1977 - _2020) + (((_1977 / max(9.999999747378752e-06f, _autoWhiteBalanceColor.z)) - _1977) * 0.75f)) * _colorCorrectionIntensity.w) + _2020;
    float _2076 = select((_adaptationTintColor.x <= 0.0031308000907301903f), (_adaptationTintColor.x * 12.920000076293945f), (((pow(_adaptationTintColor.x, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    float _2077 = select((_adaptationTintColor.y <= 0.0031308000907301903f), (_adaptationTintColor.y * 12.920000076293945f), (((pow(_adaptationTintColor.y, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    float _2078 = select((_adaptationTintColor.z <= 0.0031308000907301903f), (_adaptationTintColor.z * 12.920000076293945f), (((pow(_adaptationTintColor.z, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    float _2091 = ((_2077 * 0.3395099937915802f) + (_2076 * 0.6131200194358826f)) + (_2078 * 0.047370001673698425f);
    float _2092 = ((_2077 * 0.9163600206375122f) + (_2076 * 0.07020000368356705f)) + (_2078 * 0.013450000435113907f);
    float _2093 = ((_2077 * 0.10958000272512436f) + (_2076 * 0.02061999961733818f)) + (_2078 * 0.8697999715805054f);
    float _2098 = max(dot(float3(_2091, _2092, _2093), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)), 9.999999747378752e-05f);
    float _2099 = (_2091 * _2048) / _2098;
    float _2100 = (_2092 * _2049) / _2098;
    float _2101 = (_2093 * _2050) / _2098;
    float _2103 = saturate(_adaptationTintColor.w);
    float _2104 = dot(float3(_2048, _2049, _2050), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
    float _2109 = max(dot(float3(_2099, _2100, _2101), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)), 9.999999747378752e-05f);
    float _2130 = -0.0f - min(0.0f, (-0.0f - (_2048 + ((((_2104 * _2099) / _2109) - _2048) * _2103))));
    float _2131 = -0.0f - min(0.0f, (-0.0f - (_2049 + ((((_2104 * _2100) / _2109) - _2049) * _2103))));
    float _2132 = -0.0f - min(0.0f, (-0.0f - (_2050 + ((((_2104 * _2101) / _2109) - _2050) * _2103))));
    float _2154 = min(max((9000.0f - (5000.0f / (exp2(exp2(log2(abs((_time.w * 0.11666666716337204f) + -1.399999976158142f)) * 8.0f) * -1.4426950216293335f) + 1.0f))), 1000.0f), 40000.0f) * 0.009999999776482582f;
    if (!(_2154 <= 66.0f)) {
      float _2162 = log2(_2154 + -60.0f);
      _2171 = (exp2(_2162 * -0.07551484555006027f) * 1.1298909187316895f);
      _2172 = saturate(exp2(_2162 * -0.13320475816726685f) * 1.2929362058639526f);
    } else {
      _2171 = ((log2(_2154) * 0.27038395404815674f) + -0.6318414211273193f);
      _2172 = 1.0f;
    }
    float _2173 = saturate(_2171);
    if (!(_2154 >= 66.0f)) {
      if (!(_2154 <= 19.0f)) {
        _2184 = saturate((log2(_2154 + -10.0f) * 0.3765222728252411f) + -1.1962541341781616f);
      } else {
        _2184 = 0.0f;
      }
    } else {
      _2184 = 1.0f;
    }
    float _2206 = select((_2172 < 0.040449999272823334f), (_2172 * 0.07739938050508499f), exp2(log2((_2172 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f));
    float _2207 = select((_2173 < 0.040449999272823334f), (_2173 * 0.07739938050508499f), exp2(log2((_2173 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f));
    float _2208 = select((_2184 < 0.040449999272823334f), (_2184 * 0.07739938050508499f), exp2(log2((_2184 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f));
    float _2236 = _2130 / max(9.999999747378752e-06f, ((((((_2206 * 0.6131200194358826f) + -1.0f) + (_2207 * 0.3395099937915802f)) + (_2208 * 0.047370001673698425f)) * _renderParam.y) + 1.0f));
    float _2237 = _2131 / max(9.999999747378752e-06f, ((((((_2206 * 0.07020000368356705f) + -1.0f) + (_2207 * 0.9163600206375122f)) + (_2208 * 0.013450000435113907f)) * _renderParam.y) + 1.0f));
    float _2238 = _2132 / max(9.999999747378752e-06f, ((((((_2206 * 0.02061999961733818f) + -1.0f) + (_2207 * 0.10958000272512436f)) + (_2208 * 0.8697999715805054f)) * _renderParam.y) + 1.0f));
    float _2246 = ((max(max(_2130, _2131), _2132) + min(min(_2130, _2131), _2132)) * 0.5f) / max(9.999999747378752e-06f, ((max(max(_2236, _2237), _2238) + min(min(_2236, _2237), _2238)) * 0.5f));
    _2251 = (_2246 * _2236);
    _2252 = (_2246 * _2237);
    _2253 = (_2246 * _2238);
  }
  SV_Target.x = _2251;
  SV_Target.y = _2252;
  SV_Target.z = _2253;
  SV_Target.w = _350;
  return SV_Target;
}
