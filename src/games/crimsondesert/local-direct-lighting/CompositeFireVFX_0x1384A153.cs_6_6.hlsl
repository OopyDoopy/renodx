#include "../shared.h"
#include "local_light_common.hlsl"

Texture2D<float4> __3__36__0__0__g_inputSceneColor : register(t4, space36);

Texture2D<float> __3__36__0__0__g_sceneDepth : register(t5, space36);

Texture2D<float> __3__36__0__0__g_atmosphericScatteringDepth : register(t6, space36);

Texture2D<float4> __3__36__0__0__g_offScreenParticleAlphaBlend : register(t7, space36);

Texture2D<float2> __3__36__0__0__g_offscreenParticleDepth : register(t9, space36);

Texture2D<float2> __3__36__0__0__g_offscreenParticleDepthQuarter : register(t10, space36);

Texture2D<uint> __3__36__0__0__g_effectTileCoords : register(t12, space36);

RWTexture2D<float4> __3__38__0__1__g_sceneColorUAV : register(u0, space38);

RWTexture2D<uint> __3__38__0__1__g_materialIdUAV : register(u10, space38);

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

cbuffer __3__1__0__0__EffectOffScreenParticleConstants : register(b0, space1) {
  int2 _effectTileDataSize : packoffset(c000.x);
  float2 _effectTileDataSizeInv : packoffset(c000.z);
  int2 _renderTargetSize : packoffset(c001.x);
  float2 _renderTargetSizeInv : packoffset(c001.z);
  int2 _inputTextureSizeForTileData : packoffset(c002.x);
  int _isRenderedOffscreenParticlesHalf : packoffset(c002.z);
  int _isRenderedOffscreenParticlesQuarter : packoffset(c002.w);
  float _compositeAlphaRangeMax : packoffset(c003.x);
};

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

[numthreads(16, 16, 1)]
void main(
  uint3 SV_DispatchThreadID : SV_DispatchThreadID,
  uint3 SV_GroupID : SV_GroupID,
  uint3 SV_GroupThreadID : SV_GroupThreadID,
  uint SV_GroupIndex : SV_GroupIndex
) {
  uint _21;
  int _22;
  uint _24;
  int _26;
  int _27;
  uint _28;
  int _29;
  uint _30;
  uint _31;
  bool _34;
  float _67;
  int _68;
  float _69;
  float _70;
  float _71;
  float _72;
  float _73;
  float _177;
  bool _207;
  bool _237;
  float _238;
  float _239;
  float _240;
  float _241;
  bool _37;
  float _39;
  float _40;
  float _41;
  float _42;
  float _46;
  float _47;
  float _50;
  float _54;
  float _55;
  float _56;
  float _57;
  float _58;
  float _59;
  int _60;
  int _61;
  int _62;
  int _63;
  int _64;
  int _65;
  int _74;
  float _75;
  float _76;
  float _77;
  float _80;
  float _84;
  float _85;
  float _86;
  float _87;
  bool _88;
  float _89;
  float _90;
  float _91;
  float _92;
  float _93;
  float _94;
  bool _95;
  float _96;
  float _97;
  float _98;
  float _99;
  float _100;
  float _101;
  float _103;
  float _104;
  float _105;
  float _106;
  bool _107;
  float _108;
  float _109;
  float _110;
  float _111;
  float _112;
  float _113;
  bool _114;
  float _115;
  float _116;
  bool _117;
  float _118;
  int _119;
  bool _120;
  float4 _124;
  float4 _129;
  float2 _135;
  float2 _137;
  float2 _140;
  float2 _142;
  float _144;
  float _145;
  float _146;
  float _147;
  int _148;
  int _149;
  float2 _150;
  float _152;
  float _153;
  bool _154;
  float _155;
  float _156;
  bool _157;
  bool _158;
  float _160;
  float _162;
  float _163;
  float _164;
  float _165;
  float _166;
  float _167;
  float _168;
  float _169;
  float _170;
  float _171;
  float _172;
  float _173;
  float _174;
  float _175;
  float _178;
  float _179;
  float _180;
  float _181;
  float _182;
  float _183;
  float _184;
  float _185;
  float _186;
  float _187;
  float _188;
  float _189;
  float _190;
  bool _191;
  bool _192;
  bool _193;
  bool _194;
  bool _195;
  bool _196;
  bool _197;
  bool _199;
  bool _200;
  bool _201;
  bool _202;
  bool _203;
  bool _204;
  bool _205;
  float _208;
  float _209;
  float _210;
  float _211;
  bool _212;
  bool _213;
  bool _214;
  bool _215;
  bool _216;
  bool _217;
  bool _218;
  bool _219;
  bool _220;
  bool _221;
  bool _222;
  float4 _224;
  bool _229;
  float4 _232;
  float _242;
  float _243;
  float _244;
  float _245;
  float _246;
  float _247;
  float _248;
  float _249;
  float _250;
  float _251;
  float _252;
  float _253;
  float _254;
  float _255;
  int _258;
  int _259;
  int _260;
  int _261;
  bool _262;
  bool _263;
  bool _264;
  uint _267;
  int _269;
  int _270;
  _21 = (uint)(SV_GroupID.x) % _effectTileDataSize.x;
  _22 = (uint)(SV_GroupID.x) / _effectTileDataSize.x;
  _24 = __3__36__0__0__g_effectTileCoords.Load(int3(_21, _22, 0));
  _26 = (uint)((int)(_24.x)) >> 16;
  _27 = _26 << 4;
  _28 = _24.x << 4;
  _29 = _28 & 1048560;
  _30 = _27 + SV_GroupThreadID.x;
  _31 = _29 + SV_GroupThreadID.y;
  _34 = ((uint)_renderTargetSize.x > (uint)_30);
  if (_34) {
    _37 = ((uint)_renderTargetSize.y > (uint)_31);
    if (_37) {
      _39 = float((uint)_30);
      _40 = float((uint)_31);
      _41 = _39 + 0.5f;
      _42 = _40 + 0.5f;
      _46 = _renderTargetSizeInv.x * _41;
      _47 = _renderTargetSizeInv.y * _42;
      _50 = __3__36__0__0__g_sceneDepth.Sample(__0__4__0__0__g_staticPointClamp, float2(_46, _47));
      _54 = max(1.0000000116860974e-07f, _50.x);
      _55 = _nearFarProj.x / _54;
      _56 = float((int)(_renderTargetSize.x));
      _57 = float((int)(_renderTargetSize.y));
      _58 = 2.0f / _56;
      _59 = 2.0f / _57;
      _60 = _30 % 2;
      _61 = _31 % 2;
      _62 = _60 << 1;
      _63 = _61 << 1;
      _64 = _62 + -1;
      _65 = _63 + -1;
      _67 = _55;
      _68 = 0;
      _69 = _55;
      _70 = _55;
      _71 = 0.0f;
      _72 = _46;
      _73 = _47;
      bool _loop_break_0 = false;
      while(true) {
        _74 = _68 * _65;
        _75 = float((int)(_74));
        _76 = _75 * _59;
        _77 = _76 + _47;
        _80 = __3__36__0__0__g_atmosphericScatteringDepth.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_46, _77), 0.0f);
        _84 = max(1.0000000116860974e-07f, _80.x);
        _85 = _nearFarProj.x / _84;
        _86 = min(_69, _85);
        _87 = max(_70, _85);
        _88 = (_87 > 0.0f);
        _89 = _87 - _86;
        _90 = _89 / _87;
        _91 = select(_88, _90, 0.0f);
        _92 = max(_71, _91);
        _93 = _85 - _55;
        _94 = abs(_93);
        _95 = (_94 < _67);
        _96 = select(_95, _94, _67);
        _97 = select(_95, _46, _72);
        _98 = float((int)(_64));
        _99 = _98 * _58;
        _100 = _99 + _46;
        _101 = __3__36__0__0__g_atmosphericScatteringDepth.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_100, _77), 0.0f);
        _103 = max(1.0000000116860974e-07f, _101.x);
        _104 = _nearFarProj.x / _103;
        _105 = min(_86, _104);
        _106 = max(_87, _104);
        _107 = (_106 > 0.0f);
        _108 = _106 - _105;
        _109 = _108 / _106;
        _110 = select(_107, _109, 0.0f);
        _111 = max(_92, _110);
        _112 = _104 - _55;
        _113 = abs(_112);
        _114 = (_113 < _96);
        _115 = select(_114, _113, _96);
        _116 = select(_114, _100, _97);
        _117 = _114 || _95;
        _118 = select(_117, _77, _73);
        _119 = _68 + 1;
        _120 = (_119 == 2);
        bool __defer_66_236 = false;
        do {
          if (!(_120)) {
            _67 = _115;
            _68 = _119;
            _69 = _105;
            _70 = _106;
            _71 = _111;
            _72 = _116;
            _73 = _118;
            _loop_break_0 = true;
            break;
          }
          if (!__defer_66_236) {
            _124 = __3__36__0__0__g_offScreenParticleAlphaBlend.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_46, _47), 0.0f);
            _129 = __3__36__0__0__g_offScreenParticleAlphaBlend.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_116, _118), 0.0f);
            _135 = __3__36__0__0__g_offscreenParticleDepth.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_46, _47), 0.0f);
            _137 = __3__36__0__0__g_offscreenParticleDepth.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_116, _118), 0.0f);
            _140 = __3__36__0__0__g_offscreenParticleDepthQuarter.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_46, _47), 0.0f);
            _142 = __3__36__0__0__g_offscreenParticleDepth.Load(int3(_30, _31, 0));
            _144 = _56 * 0.5f;
            _145 = _144 * _116;
            _146 = _57 * 0.5f;
            _147 = _146 * _118;
            _148 = int(_145);
            _149 = int(_147);
            _150 = __3__36__0__0__g_offscreenParticleDepthQuarter.Load(int3(_148, _149, 0));
            _152 = max(_142.x, _150.x);
            _153 = _nearFarProj.x * 1e+07f;
            _154 = (_153 <= _106);
            _155 = max(1.0000000116860974e-07f, _152);
            _156 = _nearFarProj.x / _155;
            _157 = (_105 < _156);
            _158 = _154 || _157;
            do {
              if (_158) {
                _160 = _111 * 100.0f;
                _177 = _160;
              } else {
                _162 = _124.w - _129.w;
                _163 = abs(_162);
                _164 = _163 * _111;
                _165 = log2(_164);
                _166 = _165 * 0.5f;
                _167 = exp2(_166);
                _168 = _167 * 4.0f;
                _169 = _106 * -0.014426949433982372f;
                _170 = exp2(_169);
                _171 = saturate(_170);
                _172 = 1.0f - _129.w;
                _173 = _172 + _171;
                _174 = saturate(_173);
                _175 = _168 * _174;
                _177 = _175;
              }
              _178 = saturate(_177);
              _179 = _129.x - _124.x;
              _180 = _129.y - _124.y;
              _181 = _129.z - _124.z;
              _182 = _129.w - _124.w;
              _183 = _178 * _179;
              _184 = _178 * _180;
              _185 = _178 * _181;
              _186 = _178 * _182;
              _187 = _183 + _124.x;
              _188 = _184 + _124.y;
              _189 = _185 + _124.z;
              _190 = _186 + _124.w;
              _191 = !(_187 == 0.0f);
              _192 = !(_188 == 0.0f);
              _193 = !(_189 == 0.0f);
              _194 = !(_190 == 1.0f);
              _195 = _191 || _192;
              _196 = _193 || _195;
              _197 = _194 || _196;
              do {
                _207 = false;
                if (_197) {
                  _199 = !(_129.x == 0.0f);
                  _200 = !(_129.y == 0.0f);
                  _201 = !(_129.z == 0.0f);
                  _202 = !(_129.w == 1.0f);
                  _203 = _199 || _200;
                  _204 = _201 || _203;
                  _205 = _202 || _204;
                  _207 = _205;
                }
                _208 = select(_207, _187, 0.0f);
                _209 = select(_207, _188, 0.0f);
                _210 = select(_207, _189, 0.0f);
                _211 = select(_207, _190, 1.0f);

                // RenoDX: Apply MB hue correction to flame VFX colour
                if (LOCAL_LIGHT_HUE_CORRECTION > 0.f || abs(LOCAL_LIGHT_SATURATION - 1.f) > 1e-6f) {
                  float3 _vfx_corrected = ApplyLocalLightHueCorrection(
                      float3(_208, _209, _210),
                      LOCAL_LIGHT_HUE_CORRECTION,
                      LOCAL_LIGHT_SATURATION);
                  _208 = _vfx_corrected.x;
                  _209 = _vfx_corrected.y;
                  _210 = _vfx_corrected.z;
                }

                _212 = (_135.y == 27.0f);
                _213 = (_137.y == 27.0f);
                _214 = _212 || _213;
                _215 = (_135.y == 28.0f);
                _216 = (_137.y == 28.0f);
                _217 = _215 || _216;
                _218 = (_140.y == 28.0f);
                _219 = _217 || _218;
                _220 = (_135.y == 0.0f);
                _221 = (_140.y == 0.0f);
                _222 = _220 && _221;
                _224 = __3__36__0__0__g_inputSceneColor.Load(int3(_30, _31, 0));
                _229 = (_224.w == 0.0f);
                do {
                  _237 = true;
                  _238 = _224.x;
                  _239 = _224.y;
                  _240 = _224.z;
                  _241 = _224.w;
                  if (_229) {
                    _232 = __3__38__0__1__g_sceneColorUAV.Load(int2(_30, _31));
                    _237 = _207;
                    _238 = _232.x;
                    _239 = _232.y;
                    _240 = _232.z;
                    _241 = 0.0f;
                  }
                  __defer_66_236 = true;
                } while (false);
                if (_loop_break_0) break;
              } while (false);
              if (_loop_break_0) break;
            } while (false);
            if (_loop_break_0) break;
          }
        } while (false);
        if (_loop_break_0) { _loop_break_0 = false; continue; }
        if (__defer_66_236) {
          _242 = _238 * _211;
          _243 = _239 * _211;
          _244 = _240 * _211;
          _245 = _242 + _208;
          _246 = _243 + _209;
          _247 = _244 + _210;
          _248 = 1.0f - _241;
          _249 = saturate(_248);
          _250 = dot(float3(_208, _209, _210), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
          _251 = _250 * 0.10000000149011612f;
          _252 = 1.0f - _251;
          _253 = saturate(_252);
          _254 = min(_211, _253);
          _255 = _254 * _249;
          __3__38__0__1__g_sceneColorUAV[int2(_30, _31)] = float4(_245, _246, _247, _255);
          if (_237) {
            _258 = select(_214, 27, 26);
            _259 = select(_219, 28, _258);
            _260 = select(_222, 0, _259);
            _261 = _260 + -27;
            _262 = ((uint)_261 > (uint)1);
            _263 = (_260 != 26);
            _264 = _263 && _262;
            if (!(_264)) {
              _267 = __3__38__0__1__g_materialIdUAV.Load(int2(_30, _31));
              _269 = _267.x & 128;
              _270 = _269 | _260;
              __3__38__0__1__g_materialIdUAV[int2(_30, _31)] = _270;
            }
          }
        }
        break;
      }
    }
  }
}
