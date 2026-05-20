#include "../common.hlsl"

cbuffer cb3 : register(b3) {
  float cbUIGlobal_000 : packoffset(c000.x);  // ui_paper_white
  float cbUIGlobal_004 : packoffset(c000.y);
  float cbUIGlobal_008 : packoffset(c000.z);
  float cbUIGlobal_012 : packoffset(c000.w);
  float cbUIGlobal_016 : packoffset(c001.x);  // sdr_gamma
  float cbUIGlobal_020 : packoffset(c001.y);  // hdr_enabled
  float cbUIGlobal_024 : packoffset(c001.z);
  float cbUIGlobal_028 : packoffset(c001.w);  // hdr_gamma
  float2 cbUIGlobal_032 : packoffset(c002.x);
  float2 cbUIGlobal_040 : packoffset(c002.z);
};

static const float UI_PAPER_WHITE = cbUIGlobal_000;
static const float SDR_GAMMA = cbUIGlobal_016;
static const float HDR_ENABLED = cbUIGlobal_020;
static const float HDR_GAMMA = cbUIGlobal_028;

void LinearizeUIAndEncodePQ(float r_in, float g_in, float b_in, float gamma, float ui_paper_white, inout float r_out, inout float g_out, inout float b_out) {
  float3 color = float3(r_in, g_in, b_in);
  //   color = renodx::color::gamma::Decode(abs(color), gamma);
  color = renodx::color::gamma::DecodeSafe(color, 2.2f);
  color = renodx::color::bt2020::from::BT709(color);

  color = min(1, color);
  color = renodx::color::pq::EncodeSafe(color, ui_paper_white);

  r_out = color.r, g_out = color.g, b_out = color.b;
  return;
}

void ClampUIBrightness(inout float r, inout float g, inout float b, float ui_paper_white) {
  float3 color = float3(r, g, b);
  color = min(color, renodx::color::pq::Encode(1, ui_paper_white));
  r = color.r, g = color.g, b = color.b;
  return;
}

float4 GenerateUIOutputColor(float r, float g, float b, float ui_alpha) {
  float3 color = float3(r, g, b);

  if (HDR_ENABLED != 0.f) {  // modified HDR path
    color = saturate(color);
    color = renodx::color::gamma::Decode(color, 2.2f);
    color = renodx::color::bt2020::from::BT709(color);
    color = renodx::color::pq::Encode(color, UI_PAPER_WHITE);

    color *= ui_alpha;
    color = min(color, renodx::color::pq::Encode(1, UI_PAPER_WHITE));
  } else {  // original SDR path
    color = pow(color, SDR_GAMMA);

    color *= ui_alpha;
  }

  return float4(color, ui_alpha);
}
