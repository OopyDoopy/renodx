#include "./shared.h"

// ---- Created with 3Dmigoto v1.3.16 on Thu Feb 06 06:17:01 2025
Texture3D<float4> t3 : register(t3);

Texture2D<float4> t2 : register(t2);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s3_s : register(s3);

SamplerState s2_s : register(s2);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

cbuffer cb0 : register(b0)
{
  float4 cb0[37];
}




// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD1,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t2.Sample(s2_s, v1.xy).xyzw;
  r1.xyzw = t1.Sample(s1_s, w1.xy).xyzw;
  r1.xyz = r1.xyz * r0.xxx;
  r0.xyzw = cb0[36].zzzz * r1.xyzw;

  float3 untonemapped = r0.rgb;

  //linear to log
  r0.xyz = r0.xyz * float3(5.55555582,5.55555582,5.55555582) + float3(0.0479959995,0.0479959995,0.0479959995);
  o0.w = r0.w;
  r0.xyz = log2(r0.xyz);

  // lut sampling + tonemapping ???

  // r0.xyz = saturate(r0.xyz * float3(0.0734997839,0.0734997839,0.0734997839) + float3(0.386036009,0.386036009,0.386036009));
  r0.xyz = r0.xyz * float3(0.0734997839, 0.0734997839, 0.0734997839) + float3(0.386036009, 0.386036009, 0.386036009);

  r0.xyz = cb0[36].yyy * r0.xyz;
  r0.w = 0.5 * cb0[36].x;
  r0.xyz = r0.xyz * cb0[36].xxx + r0.www;
  r0.xyzw = t3.Sample(s3_s, r0.xyz).xyzw;		// this is LUT color

  float3 tonemapped_bt709 = o0.rgb;
  
  // Linear to SRGB (for dithering)
  r1.xyz = max(float3(1.1920929e-007,1.1920929e-007,1.1920929e-007), abs(r0.xyz));
  r1.xyz = log2(r1.xyz);
  r1.xyz = float3(0.416666657,0.416666657,0.416666657) * r1.xyz;
  r1.xyz = exp2(r1.xyz);
  r1.xyz = r1.xyz * float3(1.05499995,1.05499995,1.05499995) + float3(-0.0549999997,-0.0549999997,-0.0549999997);
  r2.xyz = float3(12.9200001,12.9200001,12.9200001) * r0.xyz;
  r0.xyz = cmp(float3(0.00313080009,0.00313080009,0.00313080009) >= r0.xyz);
  r0.xyz = r0.xyz ? r2.xyz : r1.xyz;
  // Dithering
  r1.xy = v1.xy * cb0[30].xy + cb0[30].zw;
  r1.xyzw = t0.Sample(s0_s, r1.xy).xyzw;
  r0.w = r1.w * 2 + -1;
  r1.x = 1 + -abs(r0.w);

  // r0.w = saturate(r0.w * 3.40282347e+038 + 0.5);
  r0.w = r0.w * 3.40282347e+038 + 0.5;

  r0.w = r0.w * 2 + -1;
  r1.x = sqrt(r1.x);
  r1.x = 1 + -r1.x;
  r0.w = r1.x * r0.w;		// Dithering "Strength" (for a slider eventually)
  r0.xyz = r0.www * float3(0.00392156886,0.00392156886,0.00392156886) + r0.xyz;
  
  // SRGB to Linear
  r1.xyz = float3(0.0549999997,0.0549999997,0.0549999997) + r0.xyz;
  r1.xyz = float3(0.947867334,0.947867334,0.947867334) * r1.xyz;
  r1.xyz = max(float3(1.1920929e-007,1.1920929e-007,1.1920929e-007), abs(r1.xyz));
  r1.xyz = log2(r1.xyz);
  r1.xyz = float3(2.4000001,2.4000001,2.4000001) * r1.xyz;
  r1.xyz = exp2(r1.xyz);
  r2.xyz = float3(0.0773993805,0.0773993805,0.0773993805) * r0.xyz;
  r0.xyz = cmp(float3(0.0404499993,0.0404499993,0.0404499993) >= r0.xyz);
  o0.xyz = r0.xyz ? r2.xyz : r1.xyz;

 

  // renodx::lut::Config lut_config = renodx::lut::config::Create();
  // lut_config.lut_sampler = s3_s;
  // lut_config.strength = CUSTOM_LUT_STRENGTH;
  // lut_config.scaling = CUSTOM_LUT_SCALING;
  // lut_config.precompute = cb0[36].xyz;
  // lut_config.tetrahedral = CUSTOM_LUT_TETRAHEDRAL == 1.f;
  // lut_config.type_input = renodx::lut::config::type::ARRI_C1000_NO_CUT;
  // lut_config.type_output = renodx::lut::config::type::LINEAR;

  // float3 outputColor;
  // if (RENODX_TONE_MAP_TYPE == 0.f) {
  //   outputColor = tonemapped_bt709;
  // } else {
  //   // outputColor = renodx::draw::ToneMapPass(
  //   //     untonemapped,
  //   //     renodx::lut::Sample(
  //   //         renodx::tonemap::renodrt::NeutralSDR(untonemapped),
  //   //         lut_config,
  //   //         t3));
  //   outputColor = renodx::draw::ToneMapPass(untonemapped);
  // }

  o0.rgb = renodx::draw::RenderIntermediatePass(o0.rgb);
  return;
}