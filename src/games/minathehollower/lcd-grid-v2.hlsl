// Port of RetroArch handheld/shaders/lcd-cgwg/lcd-grid-v2.slang to HLSL.
// Ported with AI

static const float kOutGamma = 2.2f;

#ifndef LCD_GRID_V2_HELPERS_ONLY
cbuffer LCDGridV2Params : register(b0) {
  float RSUBPIX_R;
  float RSUBPIX_G;
  float RSUBPIX_B;
  float GSUBPIX_R;
  float GSUBPIX_G;
  float GSUBPIX_B;
  float BSUBPIX_R;
  float BSUBPIX_G;
  float BSUBPIX_B;
  float gain;
  float gamma;
  float blacklevel;
  float ambient;
  float BGR;
};

cbuffer LCDGridV2Globals : register(b1) {
  float4x4 MVP;
  float4 OutputSize;
  float4 OriginalSize;
  float4 SourceSize;
};

Texture2D<float4> Source : register(t0);
#endif

struct LCDGridV2Settings {
  float3 redSubpixelColor;
  float3 greenSubpixelColor;
  float3 blueSubpixelColor;
  float gain;
  float gamma;
  float blacklevel;
  float ambient;
  float BGR;
};

struct VSInput {
  float4 position : POSITION;
  float2 texcoord : TEXCOORD0;
};

struct VSOutput {
  float4 position : SV_POSITION;
  float2 texcoord : TEXCOORD0;
};

static const float coeffsX[7] = {
  1.0f,
  -2.0f / 3.0f,
  -1.0f / 5.0f,
  4.0f / 7.0f,
  -1.0f / 9.0f,
  -2.0f / 11.0f,
  1.0f / 13.0f,
};

static const float coeffsY[7] = {
  1.0f,
  0.0f,
  -4.0f / 5.0f,
  2.0f / 7.0f,
  4.0f / 9.0f,
  -4.0f / 11.0f,
  1.0f / 13.0f,
};

float IntSmearFunc(float z, const float coeffs[7]) {
  float z2 = z * z;
  float zn = z;
  float value = 0.0f;

  [unroll]
  for (int i = 0; i < 7; ++i) {
    value += zn * coeffs[i];
    zn *= z2;
  }

  return value;
}

float IntSmear(float x, float dx, float d, const float coeffs[7]) {
  float zl = clamp((x - dx * 0.5f) / d, -1.0f, 1.0f);
  float zh = clamp((x + dx * 0.5f) / d, -1.0f, 1.0f);
  return d * (IntSmearFunc(zh, coeffs) - IntSmearFunc(zl, coeffs)) / dx;
}

float3 FetchOffset(Texture2D<float4> sourceTexture, int2 coord, int2 offset, LCDGridV2Settings settings) {
  float3 sourceColor = sourceTexture.Load(int3(coord + offset, 0)).rgb;
  return pow(settings.gain.xxx * sourceColor + settings.blacklevel.xxx, settings.gamma.xxx) + settings.ambient.xxx;
}

float3 FetchOffsetPrescaled(Texture2D<float4> sourceTexture, int2 logicalCoord, int2 offset, float2 prescale, LCDGridV2Settings settings) {
  float2 prescaledCoord = ((float2(logicalCoord + offset) + 0.5f.xx) * prescale) - 0.5f.xx;
  float3 sourceColor = sourceTexture.Load(int3(int2(round(prescaledCoord)), 0)).rgb;
  return pow(settings.gain.xxx * sourceColor + settings.blacklevel.xxx, settings.gamma.xxx) + settings.ambient.xxx;
}

#ifdef LCD_GRID_V2_CUSTOM_SETTINGS
LCDGridV2Settings GetLCDGridV2Settings();
#else
LCDGridV2Settings GetLCDGridV2Settings() {
  LCDGridV2Settings settings;
  // Match the defaults from `handheld/lcd-grid-v2.slangp`, which overrides the shader pragma defaults.
  settings.redSubpixelColor = float3(0.75f, 0.0f, 0.0f);
  settings.greenSubpixelColor = float3(0.0f, 0.75f, 0.0f);
  settings.blueSubpixelColor = float3(0.0f, 0.0f, 0.75f);
  settings.gain = 1.5f;
  settings.gamma = 2.2f;
  settings.blacklevel = 0.00f;
  settings.ambient = 0.00f;
  settings.BGR = 0.0f;
  return settings;
}
#endif

#ifndef LCD_GRID_V2_HELPERS_ONLY
LCDGridV2Settings GetLCDGridV2Settings() {
  LCDGridV2Settings settings;
  settings.redSubpixelColor = float3(RSUBPIX_R, RSUBPIX_G, RSUBPIX_B);
  settings.greenSubpixelColor = float3(GSUBPIX_R, GSUBPIX_G, GSUBPIX_B);
  settings.blueSubpixelColor = float3(BSUBPIX_R, BSUBPIX_G, BSUBPIX_B);
  settings.gain = gain;
  settings.gamma = gamma;
  settings.blacklevel = blacklevel;
  settings.ambient = ambient;
  settings.BGR = BGR;
  return settings;
}
#endif

float3 ApplyLCDGridV2(Texture2D<float4> sourceTexture, float2 uv, float2 outputTexelSize, float2 sourceTexelSize,
                      LCDGridV2Settings settings) {
  float3 cred = pow(settings.redSubpixelColor, kOutGamma.xxx);
  float3 cgreen = pow(settings.greenSubpixelColor, kOutGamma.xxx);
  float3 cblue = pow(settings.blueSubpixelColor, kOutGamma.xxx);

  int2 tli = int2(floor(uv / sourceTexelSize - 0.4999f.xx));

  float subpix = (uv.x / sourceTexelSize.x - 0.4999f - (float)tli.x) * 3.0f;
  float rsubpix = outputTexelSize.x / sourceTexelSize.x * 3.0f;

  float3 lcol = float3(
      IntSmear(subpix + 1.0f, rsubpix, 1.5f, coeffsX),
      IntSmear(subpix, rsubpix, 1.5f, coeffsX),
      IntSmear(subpix - 1.0f, rsubpix, 1.5f, coeffsX));

  float3 rcol = float3(
      IntSmear(subpix - 2.0f, rsubpix, 1.5f, coeffsX),
      IntSmear(subpix - 3.0f, rsubpix, 1.5f, coeffsX),
      IntSmear(subpix - 4.0f, rsubpix, 1.5f, coeffsX));

  if (settings.BGR > 0.5f) {
    lcol = lcol.bgr;
    rcol = rcol.bgr;
  }

  subpix = uv.y / sourceTexelSize.y - 0.4999f - (float)tli.y;
  rsubpix = outputTexelSize.y / sourceTexelSize.y;
  float tcol = IntSmear(subpix, rsubpix, 0.63f, coeffsY);
  float bcol = IntSmear(subpix - 1.0f, rsubpix, 0.63f, coeffsY);

  float3 topLeftColor = FetchOffset(sourceTexture, tli, int2(0, 0), settings) * lcol * tcol;
  float3 bottomRightColor = FetchOffset(sourceTexture, tli, int2(1, 1), settings) * rcol * bcol;
  float3 bottomLeftColor = FetchOffset(sourceTexture, tli, int2(0, 1), settings) * lcol * bcol;
  float3 topRightColor = FetchOffset(sourceTexture, tli, int2(1, 0), settings) * rcol * tcol;

  float3 averageColor = topLeftColor + bottomRightColor + bottomLeftColor + topRightColor;
  averageColor = averageColor.x * cred + averageColor.y * cgreen + averageColor.z * cblue;

  return pow(averageColor, (1.0f / kOutGamma).xxx);
}

float3 ApplyLCDGridV2Prescaled(Texture2D<float4> sourceTexture, float2 uv, float2 outputTexelSize, float2 prescaledTextureSize,
                               float2 logicalSourceSize, LCDGridV2Settings settings) {
  float2 prescale = max(round(prescaledTextureSize / logicalSourceSize), 1.0f.xx);
  float2 sourceTexelSize = 1.0f.xx / logicalSourceSize;

  float3 cred = pow(settings.redSubpixelColor, kOutGamma.xxx);
  float3 cgreen = pow(settings.greenSubpixelColor, kOutGamma.xxx);
  float3 cblue = pow(settings.blueSubpixelColor, kOutGamma.xxx);

  int2 tli = int2(floor(uv / sourceTexelSize - 0.4999f.xx));

  float subpix = (uv.x / sourceTexelSize.x - 0.4999f - (float)tli.x) * 3.0f;
  float rsubpix = outputTexelSize.x / sourceTexelSize.x * 3.0f;

  float3 lcol = float3(
      IntSmear(subpix + 1.0f, rsubpix, 1.5f, coeffsX),
      IntSmear(subpix, rsubpix, 1.5f, coeffsX),
      IntSmear(subpix - 1.0f, rsubpix, 1.5f, coeffsX));

  float3 rcol = float3(
      IntSmear(subpix - 2.0f, rsubpix, 1.5f, coeffsX),
      IntSmear(subpix - 3.0f, rsubpix, 1.5f, coeffsX),
      IntSmear(subpix - 4.0f, rsubpix, 1.5f, coeffsX));

  if (settings.BGR > 0.5f) {
    lcol = lcol.bgr;
    rcol = rcol.bgr;
  }

  subpix = uv.y / sourceTexelSize.y - 0.4999f - (float)tli.y;
  rsubpix = outputTexelSize.y / sourceTexelSize.y;
  float tcol = IntSmear(subpix, rsubpix, 0.63f, coeffsY);
  float bcol = IntSmear(subpix - 1.0f, rsubpix, 0.63f, coeffsY);

  float3 topLeftColor = FetchOffsetPrescaled(sourceTexture, tli, int2(0, 0), prescale, settings) * lcol * tcol;
  float3 bottomRightColor = FetchOffsetPrescaled(sourceTexture, tli, int2(1, 1), prescale, settings) * rcol * bcol;
  float3 bottomLeftColor = FetchOffsetPrescaled(sourceTexture, tli, int2(0, 1), prescale, settings) * lcol * bcol;
  float3 topRightColor = FetchOffsetPrescaled(sourceTexture, tli, int2(1, 0), prescale, settings) * rcol * tcol;

  float3 averageColor = topLeftColor + bottomRightColor + bottomLeftColor + topRightColor;
  averageColor = averageColor.x * cred + averageColor.y * cgreen + averageColor.z * cblue;

  return pow(averageColor, (1.0f / kOutGamma).xxx);
}

#ifndef LCD_GRID_V2_HELPERS_ONLY
VSOutput LCDGridV2VS(VSInput input) {
  VSOutput output;
  output.position = mul(MVP, input.position);
  output.texcoord = input.texcoord;
  return output;
}

float4 LCDGridV2PS(VSOutput input) : SV_TARGET {
  LCDGridV2Settings settings = GetLCDGridV2Settings();
  float3 color = ApplyLCDGridV2(Source, input.texcoord, OutputSize.zw, SourceSize.zw, settings);
  return float4(color, 0.0f);
}
#endif
