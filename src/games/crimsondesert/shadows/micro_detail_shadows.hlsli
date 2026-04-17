// -------------------------Depth-Bias Micro Detail Shadows --------------------
//
// Bend Studio style SSS
//
// Uses a continuous depth bias instead of binary hit/miss like in base shader
//
//   - Depth deltas within a configurable thickness window produce
//     graduated shadows
//
//   - Deltas outside the window are ignored
//
// -----------------------------------------------------------------------------

static const int MICRO_STEPS = 16;

if (CONTACT_SHADOW_QUALITY == 1.f) {
  float _microLinDepth = MICRO_LINEAR_DEPTH;
  float _microDistFade = saturate(mad(-0.1f, _microLinDepth, 4.0f));

  [branch]
  if (_microDistFade > 0.01f) {
    float _microRange = lerp(0.12f, 0.30f, saturate(_microLinDepth / 30.0f));
    float _microStep  = _microRange / (float)MICRO_STEPS;
    float _microThick = _microStep *
      _nearFarProj.x / max(1.0f, _microLinDepth * _microLinDepth);
    _microThick = clamp(_microThick, 0.00005f, 0.005f);

    // Temporal jitter
    float _microJitter = frac(
      mad(float(int4(_frameNumber).x & 0xFF), 0.38196601f,
      mad(MICRO_PIXEL_X_FLOAT, 0.7548776f,
          MICRO_PIXEL_Y_FLOAT * 0.5698402f))) * 0.5f;

    float3 _microPos = float3(MICRO_WORLD_POS_X, MICRO_WORLD_POS_Y, MICRO_WORLD_POS_Z);
    float3 _microDir = float3(MICRO_LIGHT_DIR_X, MICRO_LIGHT_DIR_Y, MICRO_LIGHT_DIR_Z);

    // Slightly different push constants (_shadowAOParams.z) for both
    // SceneShadow shaders + micro shadow ray march self shadowing itself
    // was causing square tile mismatching. Only visible at dawn/dusk
    // but fixed now regardless
    float2 _microOriginUV = float2(
      (MICRO_PIXEL_X_FLOAT + 0.5f) * _bufferSizeAndInvSize.z,
      (MICRO_PIXEL_Y_FLOAT + 0.5f) * _bufferSizeAndInvSize.w);

    float _microShadow = 1.0f;

    [loop]
    for (int _mi = 0; _mi < MICRO_STEPS; _mi++) {
      float _mt = mad((float)_mi + 0.5f, _microStep, _microJitter * _microStep);
      float3 _msp = mad(_microDir, _mt, _microPos);

      float _mcx = mad(_viewProjRelative[0].z, _msp.z,
                    mad(_viewProjRelative[0].y, _msp.y,
                        _viewProjRelative[0].x * _msp.x)) + _viewProjRelative[0].w;
      float _mcy = mad(_viewProjRelative[1].z, _msp.z,
                    mad(_viewProjRelative[1].y, _msp.y,
                        _viewProjRelative[1].x * _msp.x)) + _viewProjRelative[1].w;
      float _mcz = mad(_viewProjRelative[2].z, _msp.z,
                    mad(_viewProjRelative[2].y, _msp.y,
                        _viewProjRelative[2].x * _msp.x)) + _viewProjRelative[2].w;
      float _mcw = mad(_viewProjRelative[3].z, _msp.z,
                    mad(_viewProjRelative[3].y, _msp.y,
                        _viewProjRelative[3].x * _msp.x)) + _viewProjRelative[3].w;

      if (_mcw <= 0.0f) continue;

      float _rcpW = rcp(_mcw);
      float2 _muv = float2(mad(_mcx, _rcpW, 1.0f) * 0.5f,
                            mad(-_mcy, _rcpW, 1.0f) * 0.5f);
      if (any(_muv < 0.0f) || any(_muv > 1.0f)) continue;

      // Self shadow rejection
      float2 _mPixelDist = abs(_muv - _microOriginUV) * _bufferSizeAndInvSize.xy;
      if (_mPixelDist.x < 1.5f && _mPixelDist.y < 1.5f) continue;

      float _mRayDepth = _mcz * _rcpW;
      int2 _mpx = int2((int)(_muv.x * _bufferSizeAndInvSize.x),
                        (int)(_muv.y * _bufferSizeAndInvSize.y));
      uint _mdr = __3__36__0__0__g_depthStencil.Load(int3(_mpx, 0)).x;
      float _msd = float(_mdr & 0xFFFFFF) * 5.960465188081798e-08f;

      if (_msd < 1e-7f || _msd >= 1.0f) continue;

      float _mdelta = _msd - _mRayDepth;
      if (_mdelta >= 0.0f && _mdelta <= _microThick) {
        float _mocc = saturate(_mdelta / _microThick * 2.5f);
        _microShadow = min(_microShadow, 1.0f - _mocc);
      }
    }

    float _microResult = lerp(1.0f, _microShadow, _microDistFade);
    MICRO_CONTACT_SHADOW = min(MICRO_CONTACT_SHADOW, _microResult);
  }
}
