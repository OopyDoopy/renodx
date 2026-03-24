// Bloom improvement helpers for RenoDX
// Provides bicubic B-spline upsampling and Karis firefly suppression.

#ifndef BLOOM_COMMON_HLSL_
#define BLOOM_COMMON_HLSL_

// BT.709 luminance
float BloomLuminance(float3 c) {
  return dot(c, float3(0.2126, 0.7152, 0.0722));
}

// Karis weight: suppresses fireflies by down-weighting bright samples.
// Used at the first mip-chain reduction step so single bright pixels
// cannot dominate an entire mip quadrant and cause shimmer.
float BloomKarisWeight(float3 c) {
  return rcp(1.0 + BloomLuminance(c));
}

// Cubic B-spline basis weights (same as rendering.hlsl §1.8a)
float4 BloomCubicBSplineWeights(float t) {
  float t2 = t * t;
  float t3 = t2 * t;
  float omt = 1.0 - t;
  return float4(
    omt * omt * omt,
    3.0 * t3 - 6.0 * t2 + 4.0,
    -3.0 * t3 + 3.0 * t2 + 3.0 * t + 1.0,
    t3
  ) / 6.0;
}

// Bicubic B-spline sampling — 4 bilinear hardware taps, smooth upsample.
// Replaces the vanilla bilinear SampleLevel when upsampling lower mips,
// eliminating the blocky stairstepping that causes visible pixelation.
float3 BloomSampleBicubic(
    Texture2D<float3> tex,
    SamplerState      samp,
    float2            uv)
{
  uint w, h;
  tex.GetDimensions(w, h);
  float2 texSize = float2(w, h);

  float2 coord  = uv * texSize - 0.5;
  float2 f      = frac(coord);
  float2 icoord = floor(coord) + 0.5;

  float4 wx = BloomCubicBSplineWeights(f.x);
  float4 wy = BloomCubicBSplineWeights(f.y);

  // Group adjacent weight pairs for 4-tap bilinear trick
  float2 g0 = float2(wx.x + wx.y, wy.x + wy.y);
  float2 g1 = float2(wx.z + wx.w, wy.z + wy.w);

  // Compute sub-texel offsets that leverage HW bilinear interpolation
  float2 h0 = float2(-wx.x / g0.x, -wy.x / g0.y);
  float2 h1 = float2((wx.z + 2.0 * wx.w) / g1.x,
                      (wy.z + 2.0 * wy.w) / g1.y);

  float2 texel = 1.0 / texSize;
  float2 p00 = (icoord + float2(h0.x, h0.y)) * texel;
  float2 p10 = (icoord + float2(h1.x, h0.y)) * texel;
  float2 p01 = (icoord + float2(h0.x, h1.y)) * texel;
  float2 p11 = (icoord + float2(h1.x, h1.y)) * texel;

  return g0.x * g0.y * tex.SampleLevel(samp, p00, 0)
       + g1.x * g0.y * tex.SampleLevel(samp, p10, 0)
       + g0.x * g1.y * tex.SampleLevel(samp, p01, 0)
       + g1.x * g1.y * tex.SampleLevel(samp, p11, 0);
}

#endif // BLOOM_COMMON_HLSL_
