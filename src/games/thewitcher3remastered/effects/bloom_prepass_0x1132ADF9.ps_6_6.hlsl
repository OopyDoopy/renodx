Texture2D<float4> t0 : register(t0);
Texture2D<float4> t1 : register(t1);

cbuffer cb12 : register(b12) {
  float cb12_022x : packoffset(c022.x);
  float cb12_022y : packoffset(c022.y);
  float cb12_287x : packoffset(c287.x);
};

float4 main(noperspective float4 SV_Position : SV_Position) : SV_Target {
  uint2 pixel = uint2(SV_Position.xy);
  uint2 mask_pixel = uint2(cb12_287x * float2(pixel));
  float mask_depth = t1.Load(int3(mask_pixel, 0)).x;
  float4 source = t0.Load(int3(pixel, 0));
  float mask = cb12_022x * mask_depth + cb12_022y >= 1.0f ? 1.0f : 0.0f;
  float3 output_rgb = source.rgb * mask;

  // R11G11B10 has no alpha channel, so carry the peak in red at the metadata pixel.
  if (pixel.x == 0 && pixel.y == 0) {
    output_rgb.r = source.a;
  }

  return float4(output_rgb, 1.0f);
}