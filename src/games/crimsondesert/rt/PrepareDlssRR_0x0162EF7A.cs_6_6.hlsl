#include "../shared.h"

Texture2D<uint4> __3__36__0__0__g_baseColor : register(t12, space36);

Texture2D<float4> __3__36__0__0__g_normal : register(t13, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t29, space36);

Texture2D<float4> __3__36__0__0__g_normalRoughnessOpaque : register(t36, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t37, space36);

Texture2D<float4> __3__36__0__0__g_sceneColorBeforeSSS : register(t14, space36);

RWTexture2D<float4> __3__38__0__1__g_diffuseAlbedoUAV : register(u24, space38);

RWTexture2D<float4> __3__38__0__1__g_specularAlbedoUAV : register(u25, space38);

RWTexture2D<float4> __3__38__0__1__g_normalRoughnessUAV : register(u26, space38);

RWTexture2D<float> __3__38__0__1__g_subsurfaceScatteringGuideUAV : register(u28, space38);

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

cbuffer __3__1__0__0__GlobalPushConstants : register(b0, space1) {
  float4 _postProcessParameters : packoffset(c000.x);
  float4 _additionalParameters : packoffset(c001.x);
  uint4 _crosshairInfo : packoffset(c002.x);
  column_major float4x4 _nearFiledShadowViewRelative : packoffset(c003.x);
};

[numthreads(8, 8, 1)]
void main(
  uint3 SV_DispatchThreadID : SV_DispatchThreadID,
  uint3 SV_GroupID : SV_GroupID,
  uint3 SV_GroupThreadID : SV_GroupThreadID,
  uint SV_GroupIndex : SV_GroupIndex
) {
  float _17 = float((uint)SV_DispatchThreadID.x);
  float _18 = float((uint)SV_DispatchThreadID.y);
  float _19 = _17 + 0.5f;
  float _20 = _18 + 0.5f;
  float _24 = _19 * 2.0f;
  float _25 = _24 * _bufferSizeAndInvSize.z;
  float _26 = _25 + -1.0f;
  float _27 = _bufferSizeAndInvSize.w * 2.0f;
  float _28 = _27 * _20;
  float _29 = 1.0f - _28;
  uint2 _31 = __3__36__0__0__g_stencil.Load(int3((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y), 0));
  int _33 = _31.y & 127;
  int _34 = _31.y & 24;
  bool _37 = (((uint)_34 > (uint)23) && (_33 != 29));
  bool _210;
  float _225;
  float _233;
  float _266;
  float _267;
  float _268;
  float _269;
  float _350;
  if (!_37) {
    uint4 _40 = __3__36__0__0__g_baseColor.Load(int3((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y), 0));
    float4 _46 = __3__36__0__0__g_normal.Load(int3((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y), 0));
    int _50 = (uint)((uint)(_40.x)) >> 8;
    int _51 = _50 & 255;
    float _52 = float((uint)(uint)(_51));
    float _53 = _52 * 0.003921568859368563f;
    int _54 = _40.x & 255;
    float _55 = float((uint)(uint)(_54));
    float _56 = _55 * 0.003921568859368563f;
    int _57 = (uint)((uint)(_40.y)) >> 8;
    int _58 = _57 & 255;
    float _59 = float((uint)(uint)(_58));
    float _60 = _59 * 0.003921568859368563f;
    int _61 = _40.y & 255;
    float _62 = float((uint)(uint)(_61));
    float _63 = _62 * 0.003921568859368563f;
    int _64 = (uint)((uint)(_40.z)) >> 8;
    int _65 = _64 & 255;
    float _66 = float((uint)(uint)(_65));
    float _67 = _66 * 0.003921568859368563f;
    int _68 = (uint)((uint)(_40.w)) >> 8;
    int _69 = _68 & 255;
    float _70 = float((uint)(uint)(_69));
    int _71 = _40.w & 255;
    float _72 = float((uint)(uint)(_71));
    float _73 = _46.x * 1.0009784698486328f;
    float _74 = _46.y * 1.0009784698486328f;
    float _75 = _46.z * 1.0009784698486328f;
    float _76 = saturate(_73);
    float _77 = saturate(_74);
    float _78 = saturate(_75);
    float _79 = _76 * 2.0f;
    float _80 = _77 * 2.0f;
    float _81 = _78 * 2.0f;
    float _82 = _79 + -1.0f;
    float _83 = _80 + -1.0f;
    float _84 = _81 + -1.0f;
    float _85 = dot(float3(_82, _83, _84), float3(_82, _83, _84));
    float _86 = rsqrt(_85);
    float _87 = _86 * _82;
    float _88 = _86 * _83;
    float _89 = _84 * _86;
    float _90 = _70 * 0.007843137718737125f;
    float _91 = _72 * 0.007843137718737125f;
    float _92 = _90 + -1.0f;
    float _93 = _91 + -1.0f;
    float _94 = _92 + _93;
    float _95 = _92 - _93;
    float _96 = _94 * 0.5f;
    float _97 = _95 * 0.5f;
    float _98 = abs(_96);
    float _99 = 1.0f - _98;
    float _100 = abs(_97);
    float _101 = _99 - _100;
    float _102 = dot(float3(_96, _97, _101), float3(_96, _97, _101));
    float _103 = rsqrt(_102);
    float _104 = _103 * _96;
    float _105 = _103 * _97;
    float _106 = _103 * _101;
    bool _107 = (_89 >= 0.0f);
    float _108 = select(_107, 1.0f, -1.0f);
    float _109 = _108 + _89;
    float _110 = 1.0f / _109;
    float _111 = -0.0f - _110;
    float _112 = _88 * _111;
    float _113 = _112 * _87;
    float _114 = _108 * _87;
    float _115 = _114 * _87;
    float _116 = _115 * _111;
    float _117 = _116 + 1.0f;
    float _118 = _112 * _88;
    float _119 = _108 + _118;
    float _120 = -0.0f - _88;
    float _121 = _117 * _104;
    float _122 = mad(_105, _113, _121);
    float _123 = mad(_106, _87, _122);
    float _124 = _104 * _108;
    float _125 = _124 * _113;
    float _126 = mad(_105, _119, _125);
    float _127 = mad(_106, _88, _126);
    float _128 = _114 * _104;
    float _129 = -0.0f - _128;
    float _130 = mad(_105, _120, _129);
    float _131 = mad(_106, _89, _130);
    float _132 = dot(float3(_123, _127, _131), float3(_123, _127, _131));
    float _133 = rsqrt(_132);
    float _134 = _133 * _123;
    float _135 = _133 * _127;
    float _136 = _133 * _131;
    float _137 = _53 * _53;
    float _138 = _56 * _56;
    float _139 = _60 * _60;
    float _140 = saturate(_137);
    float _141 = saturate(_138);
    float _142 = saturate(_139);
    float _143 = _140 * 0.6131200194358826f;
    float _144 = _140 * 0.07020000368356705f;
    float _145 = _140 * 0.02061999961733818f;
    float _146 = _141 * 0.3395099937915802f;
    float _147 = _141 * 0.9163600206375122f;
    float _148 = _141 * 0.10958000272512436f;
    float _149 = _146 + _143;
    float _150 = _147 + _144;
    float _151 = _148 + _145;
    float _152 = _142 * 0.047370001673698425f;
    float _153 = _142 * 0.013450000435113907f;
    float _154 = _142 * 0.8697999715805054f;
    float _155 = _149 + _152;
    float _156 = _150 + _153;
    float _157 = _151 + _154;
    float _158 = saturate(_155);
    float _159 = saturate(_156);
    float _160 = saturate(_157);
    float _181 = (_invViewProjRelative[0].x) * _26;
    float _182 = mad((_invViewProjRelative[0].y), _29, _181);
    float _183 = _182 + (_invViewProjRelative[0].z);
    float _184 = _183 + (_invViewProjRelative[0].w);
    float _185 = (_invViewProjRelative[1].x) * _26;
    float _186 = mad((_invViewProjRelative[1].y), _29, _185);
    float _187 = (_invViewProjRelative[1].w) + (_invViewProjRelative[1].z);
    float _188 = _187 + _186;
    float _189 = (_invViewProjRelative[2].x) * _26;
    float _190 = mad((_invViewProjRelative[2].y), _29, _189);
    float _191 = (_invViewProjRelative[2].w) + (_invViewProjRelative[2].z);
    float _192 = _191 + _190;
    float _193 = (_invViewProjRelative[3].x) * _26;
    float _194 = mad((_invViewProjRelative[3].y), _29, _193);
    float _195 = (_invViewProjRelative[3].w) + (_invViewProjRelative[3].z);
    float _196 = _195 + _194;
    float _197 = _184 / _196;
    float _198 = _188 / _196;
    float _199 = _192 / _196;
    float _200 = dot(float3(_197, _198, _199), float3(_197, _198, _199));
    float _201 = rsqrt(_200);
    bool _202 = (_33 == 96);
    bool _203 = ((uint)_33 > (uint)11);
    bool __defer_38_209 = false;
    if (_203) {
      bool _207 = ((uint)_33 < (uint)19);
      bool _208 = ((uint)_33 < (uint)20);
      if (_208) {
        _225 = 0.0f;
      } else {
        _210 = _207;
        bool _211 = (_33 == 107);
        bool _212 = (_211) || (_202);
        bool _213 = (_212) || (_210);
        bool _215 = ((uint)(_33 + -65) < (uint)3);
        bool _216 = (_215) || (_213);
        bool _217 = (_33 == 54);
        bool _218 = (_217) || (_216);
        bool _219 = (_33 == 24);
        bool _220 = (_219) || (_218);
        bool _221 = (_33 == 29);
        bool _222 = (_221) || (_220);
        if (_222) {
          _225 = 0.0f;
        } else {
          _225 = _63;
        }
      }
    } else {
      bool _205 = ((uint)_33 > (uint)10);
      if (_205) {
        _225 = 0.0f;
      } else {
        _210 = false;
        bool _211 = (_33 == 107);
        bool _212 = (_211) || (_202);
        bool _213 = (_212) || (_210);
        bool _215 = ((uint)(_33 + -65) < (uint)3);
        bool _216 = (_215) || (_213);
        bool _217 = (_33 == 54);
        bool _218 = (_217) || (_216);
        bool _219 = (_33 == 24);
        bool _220 = (_219) || (_218);
        bool _221 = (_33 == 29);
        bool _222 = (_221) || (_220);
        if (_222) {
          _225 = 0.0f;
        } else {
          _225 = _63;
        }
      }
    }
    if (__defer_38_209) {
      bool _211 = (_33 == 107);
      bool _212 = (_211) || (_202);
      bool _213 = (_212) || (_210);
      bool _215 = ((uint)(_33 + -65) < (uint)3);
      bool _216 = (_215) || (_213);
      bool _217 = (_33 == 54);
      bool _218 = (_217) || (_216);
      bool _219 = (_33 == 24);
      bool _220 = (_219) || (_218);
      bool _221 = (_33 == 29);
      bool _222 = (_221) || (_220);
      if (_222) {
      } else {
        _225 = _63;
      }
    }
    bool _226 = (_33 == 53);
    if (_226) {
      float _228 = _159 + _158;
      float _229 = _228 + _160;
      float _230 = _229 * 1.2000000476837158f;
      float _231 = saturate(_230);
      _233 = _231;
    } else {
      _233 = 1.0f;
    }
    float _234 = max(_158, _159);
    float _235 = max(_234, _160);
    float _236 = max(_235, 0.009999999776482582f);
    float _237 = min(_236, 0.699999988079071f);
    float _238 = 0.699999988079071f / _237;
    float _239 = _238 * _233;
    float _240 = _239 * _158;
    float _241 = _239 * _159;
    float _242 = _239 * _160;
    float _243 = _240 + -0.03999999910593033f;
    float _244 = _241 + -0.03999999910593033f;
    float _245 = _242 + -0.03999999910593033f;
    float _246 = _243 * _225;
    float _247 = _244 * _225;
    float _248 = _245 * _225;
    float _249 = _246 + 0.03999999910593033f;
    float _250 = _247 + 0.03999999910593033f;
    float _251 = _248 + 0.03999999910593033f;
    bool _252 = (_33 == 29);
    if (!_252) {
      float4 _255 = __3__36__0__0__g_normalRoughnessOpaque.Load(int3((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y), 0));
      float _260 = dot(float3(_255.x, _255.y, _255.z), float3(_255.x, _255.y, _255.z));
      float _261 = rsqrt(_260);
      float _262 = _261 * _255.x;
      float _263 = _261 * _255.y;
      float _264 = _261 * _255.z;
      _266 = _262;
      _267 = _263;
      _268 = _264;
      _269 = _255.w;
    } else {
      _266 = _134;
      _267 = _135;
      _268 = _136;
      _269 = _67;
    }
    __3__38__0__1__g_diffuseAlbedoUAV[int2((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y))] = float4(_158, _159, _160, 1.0f);
    float _271 = _197 * _201;
    float _272 = -0.0f - _271;
    float _273 = _198 * _201;
    float _274 = -0.0f - _273;
    float _275 = _199 * _201;
    float _276 = -0.0f - _275;
    float _277 = dot(float3(_266, _267, _268), float3(_272, _274, _276));
    float _278 = _269 * _269;
    float _279 = abs(_277);
    float _280 = _279 * _279;
    float _281 = _280 * _279;
    float _282 = _278 * _278;
    float _283 = _282 * _278;
    float _284 = mad(-1.285140037536621f, _279, 0.9904400110244751f);
    float _285 = mad(-0.7559069991111755f, _279, 1.296779990196228f);
    float _286 = dot(float2(_284, _285), float2(1.0f, _278));
    float _287 = mad(2.923379898071289f, _279, 1.0f);
    float _288 = mad(59.418800354003906f, _281, _287);
    float _289 = mad(-27.03019905090332f, _279, 20.322500228881836f);
    float _290 = mad(222.5919952392578f, _281, _289);
    float _291 = mad(626.1300048828125f, _279, 121.56300354003906f);
    float _292 = mad(316.62701416015625f, _281, _291);
    float _293 = dot(float3(_288, _290, _292), float3(1.0f, _278, _283));
    float _294 = 1.0f / _293;
    float _295 = _294 * _286;
    float _296 = mad(3.3270699977874756f, _279, 0.03654630109667778f);
    float _297 = mad(-9.04755973815918f, _279, 9.063199996948242f);
    float _298 = dot(float2(_296, _297), float2(1.0f, _278));
    float _299 = mad(3.5968499183654785f, _280, 1.0f);
    float _300 = mad(-1.3677200078964233f, _281, _299);
    float _301 = mad(-16.317399978637695f, _280, 9.044010162353516f);
    float _302 = mad(9.229490280151367f, _281, _301);
    float _303 = mad(19.78860092163086f, _280, 5.565889835357666f);
    float _304 = mad(-20.212299346923828f, _281, _303);
    float _305 = dot(float3(_300, _302, _304), float3(1.0f, _278, _283));
    float _306 = 1.0f / _305;
    float _307 = _306 * _298;
    float _308 = _250 * 50.0f;
    float _309 = saturate(_308);
    float _310 = _295 * _309;
    float _311 = max(0.0f, _310);
    float _312 = max(0.0f, _307);
    float _313 = mad(_249, _312, _311);
    float _314 = mad(_250, _312, _311);
    float _315 = mad(_251, _312, _311);
    __3__38__0__1__g_specularAlbedoUAV[int2((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y))] = float4(_313, _314, _315, 1.0f);
    __3__38__0__1__g_normalRoughnessUAV[int2((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y))] = float4(_266, _267, _268, _269);
    bool _320 = (_postProcessParameters.x > 0.0f);
    if (_320) {
      float4 _323 = __3__36__0__0__g_sceneColor.Load(int3((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y), 0));
      float4 _328 = __3__36__0__0__g_sceneColorBeforeSSS.Load(int3((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y), 0));
      int _332 = _31.y & 126;
      bool _335 = ((_332 == 66) || (_33 == 54));
      float _336 = select(_335, 1.0f, _158);
      float _337 = select(_335, 1.0f, _160);
      float _338 = _323.x - _328.x;
      float _339 = _323.y - _328.y;
      float _340 = _323.z - _328.z;
      float _341 = _338 * _336;
      float _342 = _340 * _337;
      float _343 = _159 * 2.0f;
      float _344 = select(_335, 2.0f, _343);
      float _345 = _339 * _344;
      float _346 = _342 + _341;
      float _347 = _346 + _345;
      float _348 = _347 * 0.25f;
      _350 = _348;
    } else {
      _350 = 0.0f;
    }
    __3__38__0__1__g_subsurfaceScatteringGuideUAV[int2((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y))] = _350;
  }
}