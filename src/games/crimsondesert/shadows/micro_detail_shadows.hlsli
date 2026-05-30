// -------------------------Depth Bias Micro Detail Shadows --------------------
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
//   - Perspective correction depth comparison is done in
//     linearised space so thickness is consistent regardless of distance
//
// v2: 32 steps, extended range (120 units), perspective corrected depth
// -----------------------------------------------------------------------------
// Contact Micro Shadows: shared helper included by shadow remaps only through the
// quality gate below, so Off keeps the native shader path.

// Stencil IDs that must NOT receive micro detail contact shadows
//
//  2        = Sky/background geometry
//  3        = Unknown (vanilla always zeroes contact shadow for this)
//  6        = Waterfalls / minor VFX (translucent, ray march hits geometry behind)
//  7        = SSS/VFX (vanilla reduces 6-7 to 1% shadow via _2888 & -2 == 6)
//  10       = Sky
//  21, 22   = Special effect materials (vanilla zeroes cross-stencil contact for these)
//  33, 55   = Cloth / velvet (vanilla reduces to 1% shadow)

static const int MICRO_STEPS = 32;

#ifndef CONTACT_MICRO_DETAIL_STRENGTH_ACTIVE
#define CONTACT_MICRO_DETAIL_STRENGTH_ACTIVE CONTACT_MICRO_DETAIL_STRENGTH
#endif

#ifndef CONTACT_MICRO_DISTANCE_FADE_ACTIVE
#define CONTACT_MICRO_DISTANCE_FADE_ACTIVE CONTACT_MICRO_DISTANCE_FADE
#endif

#ifndef CONTACT_MICRO_RANGE_NEAR_ACTIVE
#define CONTACT_MICRO_RANGE_NEAR_ACTIVE CONTACT_MICRO_RANGE_NEAR
#endif

#ifndef CONTACT_MICRO_RANGE_FAR_ACTIVE
#define CONTACT_MICRO_RANGE_FAR_ACTIVE CONTACT_MICRO_RANGE_FAR
#endif

#ifndef CONTACT_MICRO_THICKNESS_MULTIPLIER_ACTIVE
#define CONTACT_MICRO_THICKNESS_MULTIPLIER_ACTIVE CONTACT_MICRO_THICKNESS_MULTIPLIER
#endif

#ifndef CONTACT_MICRO_OCCLUSION_SCALE_ACTIVE
#define CONTACT_MICRO_OCCLUSION_SCALE_ACTIVE CONTACT_MICRO_OCCLUSION_SCALE
#endif

#ifndef CONTACT_MICRO_SELF_REJECT_PIXELS_ACTIVE
#define CONTACT_MICRO_SELF_REJECT_PIXELS_ACTIVE CONTACT_MICRO_SELF_REJECT_PIXELS
#endif

#ifndef CONTACT_MICRO_SELF_FADE_PIXELS_ACTIVE
#define CONTACT_MICRO_SELF_FADE_PIXELS_ACTIVE 2.0f
#endif

#ifndef CONTACT_MICRO_FOLIAGE_THICKNESS_BOOST_ACTIVE
#define CONTACT_MICRO_FOLIAGE_THICKNESS_BOOST_ACTIVE 1.0f
#endif

#ifndef CONTACT_MICRO_FOLIAGE_OCCLUSION_BOOST_ACTIVE
#define CONTACT_MICRO_FOLIAGE_OCCLUSION_BOOST_ACTIVE 1.0f
#endif

if (MICRO_SHADOW_QUALITY > MICRO_SHADOW_QUALITY_OFF
    && CONTACT_MICRO_DETAIL_STRENGTH_ACTIVE > 0.f
    && MICRO_STENCIL != 2
    && MICRO_STENCIL != 3
    && MICRO_STENCIL != 6
    && MICRO_STENCIL != 7
    && MICRO_STENCIL != 10
    && MICRO_STENCIL != 21
    && MICRO_STENCIL != 22
    && MICRO_STENCIL != 33
    && MICRO_STENCIL != 55
) {
  float _microLinDepth = MICRO_LINEAR_DEPTH;

  float _microDistFade = CONTACT_MICRO_DISTANCE_FADE_ACTIVE;

  [branch]
  if (_microDistFade > 0.01f) {
    float _microRange = lerp(CONTACT_MICRO_RANGE_NEAR_ACTIVE, CONTACT_MICRO_RANGE_FAR_ACTIVE, saturate(_microLinDepth / 100.0f));
    float _microStep  = _microRange / (float)MICRO_STEPS;

    // Perspective corrected thickness
    float _microWorldThick = _microStep * CONTACT_MICRO_THICKNESS_MULTIPLIER_ACTIVE;
    _microWorldThick = max(_microWorldThick, lerp(0.005f, 0.04f, saturate(_microLinDepth / 80.0f)));

    // Keep the 1.08-style march deterministic under RR; temporal jitter
    // can make reconstructed shadows look camera-attached in 1.09.
    float _microJitter = 0.0f;

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
      float _microSelfDist = max(_mPixelDist.x, _mPixelDist.y);
      float _microSelfFade = saturate((_microSelfDist - CONTACT_MICRO_SELF_REJECT_PIXELS_ACTIVE) / CONTACT_MICRO_SELF_FADE_PIXELS_ACTIVE);
      _microSelfFade = _microSelfFade * _microSelfFade * (3.0f - (2.0f * _microSelfFade));
      if (_microSelfFade <= 0.0f) continue;

      float _mRayDepth = _mcz * _rcpW;
      int2 _mpx = int2((int)(_muv.x * _bufferSizeAndInvSize.x),
                        (int)(_muv.y * _bufferSizeAndInvSize.y));
      uint _mdr = __3__36__0__0__g_depthStencil.Load(int3(_mpx, 0)).x;
      uint _mst = (_mdr >> 24) & 127u;
      if (_mst == 2u
          || _mst == 3u
          || _mst == 6u
          || _mst == 7u
          || _mst == 10u
          || _mst == 21u
          || _mst == 22u
          || _mst == 33u
          || _mst == 55u) continue;

      float _microFoliageSample = (((_mst >= 11u && _mst <= 19u) || _mst == 66u || _mst == 107u) ? 1.0f : 0.0f);
      float _microSampleThick = _microWorldThick * lerp(1.0f, CONTACT_MICRO_FOLIAGE_THICKNESS_BOOST_ACTIVE, _microFoliageSample);
      float _microSampleOcclusionScale = CONTACT_MICRO_OCCLUSION_SCALE_ACTIVE * lerp(1.0f, CONTACT_MICRO_FOLIAGE_OCCLUSION_BOOST_ACTIVE, _microFoliageSample);

      float _msd = float(_mdr & 0xFFFFFF) * 5.960465188081798e-08f;

      if (_msd < 1e-7f || _msd >= 1.0f) continue;

      // Perspective corrected depth comparison
      float _mLinScene = _nearFarProj.x / max(1e-7f, _msd);
      float _mLinRay   = _nearFarProj.x / max(1e-7f, _mRayDepth);
      float _mLinDelta = _mLinRay - _mLinScene;

      // Scene must be closer than ray (positive delta = scene in front of ray)
      // and within the thickness window
      if (_mLinDelta >= 0.0f && _mLinDelta <= _microSampleThick) {
        float _mocc = saturate(_mLinDelta / _microSampleThick * _microSampleOcclusionScale) * _microSelfFade;
        _microShadow = min(_microShadow, 1.0f - _mocc);
      }
    }

    float _microResult = lerp(1.0f, _microShadow, saturate(_microDistFade * CONTACT_MICRO_DETAIL_STRENGTH_ACTIVE));
    MICRO_CONTACT_SHADOW = min(MICRO_CONTACT_SHADOW, _microResult);
  }
}
