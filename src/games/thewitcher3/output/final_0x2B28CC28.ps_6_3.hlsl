#include "./final_common.hlsli"

Texture2D<float4> t0 : register(t0);
Texture2D<float4> t1 : register(t1);
Texture2D<float4> t2 : register(t2);

SamplerState s0 : register(s1);

struct OutputSignature {
  float4 SV_Target : SV_Target;
  float4 SV_Target_1 : SV_Target1;
};

OutputSignature main(
    noperspective float4 SV_Position : SV_Position,
    linear float2 TEXCOORD : TEXCOORD) {
  const float gamma = 2.2f;
  int2 pixel = int2(SV_Position.xy - CustomPixelConsts_016.xy);
  float4 ui_sample = t1.Load(int3(pixel, 0));
  float4 scene_sample = t0.SampleLevel(s0, TEXCOORD, 0.f);

  float3 linear_scene = renodx::color::gamma::DecodeSafe(scene_sample.rgb, gamma);
  linear_scene = ApplyFinalSceneEffects(linear_scene, TEXCOORD, t0, s0, true);
  float3 linear_ui = renodx::color::gamma::DecodeSafe(ui_sample.rgb, gamma);

  float4 secondary_output;
  secondary_output.rgb = lerp(linear_scene, linear_ui, ui_sample.a);
  secondary_output.a = renodx::math::SafePow(
      lerp(scene_sample.a, ui_sample.a, ui_sample.a),
      1.f / gamma);
  secondary_output.rgb = renodx::color::gamma::EncodeSafe(secondary_output.rgb, gamma);

  float4 output_color = IsFinalOverlayPixel(pixel)
                            ? LoadFinalOverlay(pixel, t2, s0, gamma)
                            : HandleUICompositing(
                                  float4(linear_ui, ui_sample.a),
                                  float4(linear_scene, scene_sample.a));
  output_color.rgb = renodx::draw::SwapChainPass(output_color.rgb);

  OutputSignature output = {output_color, secondary_output};
  return output;
}