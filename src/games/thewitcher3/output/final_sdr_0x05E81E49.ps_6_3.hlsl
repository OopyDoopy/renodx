#include "./final_common.hlsli"

Texture2D<float4> t0 : register(t0);
Texture2D<float4> t1 : register(t1);

SamplerState s1 : register(s1);

float4 main(
    noperspective float4 SV_Position : SV_Position,
    linear float2 TEXCOORD : TEXCOORD) : SV_Target {
  int2 pixel = int2(SV_Position.xy - CustomPixelConsts_016.xy);
  float4 ui_sample = t1.Load(int3(pixel, 0));
  float4 scene_sample = t0.SampleLevel(s1, TEXCOORD, 0.f);

  float3 linear_scene = renodx::color::gamma::Decode(scene_sample.rgb);
  linear_scene = ApplyFinalSceneEffects(linear_scene, TEXCOORD, t0, s1, false);
  float3 linear_ui = renodx::color::gamma::Decode(ui_sample.rgb);

  float4 output_color = HandleUICompositing(
      float4(linear_ui, ui_sample.a),
      float4(linear_scene, scene_sample.a));
  output_color.rgb = renodx::color::gamma::Encode(output_color.rgb);
  return output_color;
}