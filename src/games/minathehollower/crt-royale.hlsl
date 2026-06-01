// Port of Retroarch crt-royale.slang, simplified to be single pass
// Original licensed under GPL V2
// Port created using AI, errors may be present.

#ifndef CRT_ROYALE_HELPERS_ONLY
cbuffer CRTRoyaleParams : register(b0) {
  float crt_gamma;
  float lcd_gamma;
  float levels_contrast;
  float levels_autodim;
  float halation_weight;
  float diffusion_weight;
  float bloom_underestimate_levels;
  float bloom_excess;

  float beam_min_sigma;
  float beam_max_sigma;
  float beam_min_shape;
  float beam_max_shape;
  float beam_spot_power;
  float beam_shape_power;
  float beam_horiz_sigma;
  float scanline_strength;

  float convergence_r_x;
  float convergence_r_y;
  float convergence_g_x;
  float convergence_g_y;
  float convergence_b_x;
  float convergence_b_y;
  float mask_type;
  float mask_triad_size;

  float mask_strength;
  float mask_brightness;
  float border_size;
  float border_darkness;
  float curvature;
  float geom_mode;
  float unused0;
  float unused1;
};

cbuffer CRTRoyaleGlobals : register(b1) {
  float4x4 MVP;
  float4 OutputSize;
  float4 OriginalSize;
  float4 SourceSize;
};

Texture2D<float4> Source : register(t0);
SamplerState SourceSampler : register(s0);
#endif

struct CRTRoyaleSettings {
  float crtGamma;
  float lcdGamma;
  float levelsContrast;
  float levelsAutodim;
  float halationWeight;
  float diffusionWeight;
  float bloomUnderestimateLevels;
  float bloomExcess;
  float beamMinSigma;
  float beamMaxSigma;
  float beamMinShape;
  float beamMaxShape;
  float beamSpotPower;
  float beamShapePower;
  float beamHorizSigma;
  float scanlineStrength;
  float2 convergenceR;
  float2 convergenceG;
  float2 convergenceB;
  float maskType;
  float maskTriadSize;
  float maskStrength;
  float maskBrightness;
  float borderSize;
  float borderDarkness;
  float curvature;
  float geomMode;
};

struct CRTRoyaleVSInput {
  float4 position : POSITION;
  float2 texcoord : TEXCOORD0;
};

struct CRTRoyaleVSOutput {
  float4 position : SV_POSITION;
  float2 texcoord : TEXCOORD0;
};

#ifdef CRT_ROYALE_CUSTOM_SETTINGS
CRTRoyaleSettings GetCRTRoyaleSettings();
#else
CRTRoyaleSettings GetCRTRoyaleSettings() {
  CRTRoyaleSettings settings;
  settings.crtGamma = 2.5f;
  settings.lcdGamma = 2.2f;
  settings.levelsContrast = 1.0f;
  settings.levelsAutodim = 0.5f;
  settings.halationWeight = 0.0f;
  settings.diffusionWeight = 0.075f;
  settings.bloomUnderestimateLevels = 0.8f;
  settings.bloomExcess = 0.0f;
  settings.beamMinSigma = 0.02f;
  settings.beamMaxSigma = 0.3f;
  settings.beamMinShape = 2.0f;
  settings.beamMaxShape = 4.0f;
  settings.beamSpotPower = 1.0f / 3.0f;
  settings.beamShapePower = 1.0f / 4.0f;
  settings.beamHorizSigma = 0.35f;
  settings.scanlineStrength = 1.0f;
  settings.convergenceR = float2(0.1f, 0.2f);
  settings.convergenceG = float2(0.3f, 0.4f);
  settings.convergenceB = float2(0.5f, 0.6f);
  settings.maskType = 1.0f;      // slot mask default
  settings.maskTriadSize = 3.0f; // 24/8 from user-settings.h
  settings.maskStrength = 1.0f;
  settings.maskBrightness = 46.0f / 255.0f;
  settings.borderSize = 0.015f;
  settings.borderDarkness = 2.0f;
  settings.curvature = 0.0f;     // preset default geometry mode is flat
  settings.geomMode = 0.0f;
  return settings;
}
#endif

#ifndef CRT_ROYALE_HELPERS_ONLY
CRTRoyaleSettings GetCRTRoyaleSettings() {
  CRTRoyaleSettings settings;
  settings.crtGamma = crt_gamma;
  settings.lcdGamma = lcd_gamma;
  settings.levelsContrast = levels_contrast;
  settings.levelsAutodim = levels_autodim;
  settings.halationWeight = halation_weight;
  settings.diffusionWeight = diffusion_weight;
  settings.bloomUnderestimateLevels = bloom_underestimate_levels;
  settings.bloomExcess = bloom_excess;
  settings.beamMinSigma = beam_min_sigma;
  settings.beamMaxSigma = beam_max_sigma;
  settings.beamMinShape = beam_min_shape;
  settings.beamMaxShape = beam_max_shape;
  settings.beamSpotPower = beam_spot_power;
  settings.beamShapePower = beam_shape_power;
  settings.beamHorizSigma = beam_horiz_sigma;
  settings.scanlineStrength = scanline_strength;
  settings.convergenceR = float2(convergence_r_x, convergence_r_y);
  settings.convergenceG = float2(convergence_g_x, convergence_g_y);
  settings.convergenceB = float2(convergence_b_x, convergence_b_y);
  settings.maskType = mask_type;
  settings.maskTriadSize = mask_triad_size;
  settings.maskStrength = mask_strength;
  settings.maskBrightness = mask_brightness;
  settings.borderSize = border_size;
  settings.borderDarkness = border_darkness;
  settings.curvature = curvature;
  settings.geomMode = geom_mode;
  return settings;
}
#endif

float3 CRTRoyaleLinearize(float3 color, float crtGamma) {
  return pow(saturate(color), crtGamma.xxx);
}

float3 CRTRoyaleEncode(float3 color, float lcdGamma) {
  return pow(max(color, 0.0f.xxx), (1.0f / max(lcdGamma, 1e-4f)).xxx);
}

float CRTRoyaleGaussian(float x, float sigma) {
  float s = max(sigma, 1e-4f);
  return exp(-0.5f * (x * x) / (s * s));
}

float CRTRoyaleGeneralizedGaussian(float x, float sigma, float shape) {
  float s = max(sigma, 1e-4f);
  float p = max(shape, 1.0f);
  return exp(-pow(abs(x) / s, p));
}

float2 CRTRoyalePrescale(float2 prescaledTextureSize, float2 logicalSourceSize) {
  return max(round(prescaledTextureSize / logicalSourceSize), 1.0f.xx);
}

float2 CRTRoyaleCurve(float2 uv, float curvature) {
  if (curvature <= 0.0f) return uv;
  uv -= 0.5f.xx;
  uv *= curvature;
  uv.x *= 1.0f + pow(abs(uv.y) / 3.5f, 2.0f);
  uv.y *= 1.0f + pow(abs(uv.x) / 3.0f, 2.0f);
  uv /= curvature;
  uv += 0.5f.xx;
  return uv * 0.96f.xx + 0.02f.xx;
}

float3 CRTRoyaleFetchLogicalPrescaled(Texture2D<float4> sourceTexture, int2 logicalCoord, int2 offset,
                                      float2 prescale, CRTRoyaleSettings settings) {
  float2 prescaledCoord = ((float2(logicalCoord + offset) + 0.5f.xx) * prescale) - 0.5f.xx;
  float3 sourceColor = sourceTexture.Load(int3(int2(round(prescaledCoord)), 0)).rgb;
  return CRTRoyaleLinearize(sourceColor, settings.crtGamma) * settings.levelsAutodim;
}

float3 CRTRoyaleSampleHorizontal(float3 leftColor, float3 rightColor, float fracX, CRTRoyaleSettings settings) {
  if (settings.beamHorizSigma > 0.0f && settings.beamHorizSigma < 1e9f) {
    float weightLeft = CRTRoyaleGaussian(fracX, settings.beamHorizSigma);
    float weightRight = CRTRoyaleGaussian(1.0f - fracX, settings.beamHorizSigma);
    float total = max(weightLeft + weightRight, 1e-6f);
    float3 gaussianSample = (leftColor * weightLeft + rightColor * weightRight) / total;

    float quilezFrac = fracX * fracX * (3.0f - 2.0f * fracX);
    float3 quilezSample = lerp(leftColor, rightColor, quilezFrac);

    return lerp(quilezSample, gaussianSample, step(0.5f, settings.beamHorizSigma));
  }

  float quilezFrac = fracX * fracX * (3.0f - 2.0f * fracX);
  return lerp(leftColor, rightColor, quilezFrac);
}

float3 CRTRoyaleScanlineContrib(float distance, float3 color, CRTRoyaleSettings settings) {
  float3 sigma = lerp(settings.beamMinSigma.xxx, settings.beamMaxSigma.xxx,
                      pow(saturate(color), settings.beamSpotPower.xxx));
  float3 shape = lerp(settings.beamMinShape.xxx, settings.beamMaxShape.xxx,
                      pow(saturate(color), settings.beamShapePower.xxx));

  return color * exp(-pow(abs(distance).xxx / max(sigma, 1e-4f.xxx), shape));
}

float3 CRTRoyaleBeamSample(Texture2D<float4> sourceTexture, float2 uv, float2 prescaledTextureSize,
                           float2 logicalSourceSize, float2 convergence, CRTRoyaleSettings settings) {
  float2 prescale = CRTRoyalePrescale(prescaledTextureSize, logicalSourceSize);
  float2 logicalUv = uv * logicalSourceSize - 0.5f.xx + convergence;
  int2 logicalBase = int2(floor(logicalUv));
  float2 fracPos = frac(logicalUv);

  float3 accum = 0.0f.xxx;

  [unroll]
  for (int y = -1; y <= 1; ++y) {
    float3 leftColor = CRTRoyaleFetchLogicalPrescaled(sourceTexture, logicalBase, int2(0, y), prescale, settings);
    float3 rightColor = CRTRoyaleFetchLogicalPrescaled(sourceTexture, logicalBase, int2(1, y), prescale, settings);
    float3 scanlineColor = CRTRoyaleSampleHorizontal(leftColor, rightColor, fracPos.x, settings);
    accum += CRTRoyaleScanlineContrib((float)y - fracPos.y, scanlineColor, settings);
  }

  return accum;
}

float3 CRTRoyalePhosphorMask(float2 uv, float2 outputResolution, CRTRoyaleSettings settings) {
  float triadSize = max(settings.maskTriadSize, 1.0f);
  float2 maskPos = float2(uv.x * outputResolution.x / triadSize, uv.y * outputResolution.y / triadSize);
  float triadPhase = frac(maskPos.x);
  float rowPhase = frac(maskPos.y);

  float3 grilleMask;
  if (triadPhase < 1.0f / 3.0f) {
    grilleMask = float3(1.0f, 0.18f, 0.18f);
  } else if (triadPhase < 2.0f / 3.0f) {
    grilleMask = float3(0.18f, 1.0f, 0.18f);
  } else {
    grilleMask = float3(0.18f, 0.18f, 1.0f);
  }

  float slotRow = lerp(0.78f, 1.0f, step(0.22f, rowPhase) * step(rowPhase, 0.78f));
  float3 slotMask = grilleMask * slotRow;

  float checker = frac(floor(maskPos.x) + floor(maskPos.y));
  float3 shadowMask = lerp(float3(1.0f, 0.2f, 0.2f), float3(0.2f, 1.0f, 0.2f), checker);
  shadowMask = lerp(shadowMask, float3(0.2f, 0.2f, 1.0f), step(2.0f / 3.0f, triadPhase));

  float3 maskColor = slotMask;
  if (settings.maskType < 0.5f) {
    maskColor = grilleMask;
  } else if (settings.maskType > 1.5f) {
    maskColor = shadowMask;
  }

  float compensation = rcp(max(settings.maskBrightness, 1e-4f));
  return lerp(1.0f.xxx, maskColor * compensation, saturate(settings.maskStrength));
}

float3 CRTRoyaleDiffusion(Texture2D<float4> sourceTexture, SamplerState sourceSampler, float2 uv,
                          float2 outputTexelSize, CRTRoyaleSettings settings) {
  float2 stepUv = outputTexelSize * lerp(0.75f, 1.5f, saturate(settings.bloomExcess));
  float3 center = CRTRoyaleLinearize(sourceTexture.SampleLevel(sourceSampler, uv, 0.0f).rgb, settings.crtGamma);
  float3 blur = center * 0.2270270270f;
  blur += CRTRoyaleLinearize(sourceTexture.SampleLevel(sourceSampler, uv + float2(stepUv.x, 0.0f), 0.0f).rgb, settings.crtGamma) * 0.1945945946f;
  blur += CRTRoyaleLinearize(sourceTexture.SampleLevel(sourceSampler, uv - float2(stepUv.x, 0.0f), 0.0f).rgb, settings.crtGamma) * 0.1945945946f;
  blur += CRTRoyaleLinearize(sourceTexture.SampleLevel(sourceSampler, uv + float2(0.0f, stepUv.y), 0.0f).rgb, settings.crtGamma) * 0.1945945946f;
  blur += CRTRoyaleLinearize(sourceTexture.SampleLevel(sourceSampler, uv - float2(0.0f, stepUv.y), 0.0f).rgb, settings.crtGamma) * 0.1945945946f;
  return blur;
}

float CRTRoyaleBorder(float2 uv, CRTRoyaleSettings settings) {
  float edge = min(min(uv.x, uv.y), min(1.0f - uv.x, 1.0f - uv.y));
  float border = smoothstep(0.0f, max(settings.borderSize, 1e-4f), edge);
  return lerp(1.0f / max(settings.borderDarkness, 1.0f), 1.0f, border);
}

float3 ApplyCRTRoyalePrescaled(Texture2D<float4> sourceTexture, SamplerState sourceSampler, float2 uv,
                               float2 outputTexelSize, float2 prescaledTextureSize, float2 logicalSourceSize,
                               CRTRoyaleSettings settings) {
  float2 curvedUv = CRTRoyaleCurve(uv, settings.curvature);
  float inside = step(0.0f, curvedUv.x) * step(curvedUv.x, 1.0f) * step(0.0f, curvedUv.y) * step(curvedUv.y, 1.0f);
  if (inside <= 0.0f) return 0.0f.xxx;

  float3 linearR = CRTRoyaleBeamSample(sourceTexture, curvedUv, prescaledTextureSize, logicalSourceSize, settings.convergenceR, settings);
  float3 linearG = CRTRoyaleBeamSample(sourceTexture, curvedUv, prescaledTextureSize, logicalSourceSize, settings.convergenceG, settings);
  float3 linearB = CRTRoyaleBeamSample(sourceTexture, curvedUv, prescaledTextureSize, logicalSourceSize, settings.convergenceB, settings);

  float3 beamColor = float3(linearR.r, linearG.g, linearB.b);
  float beamLuma = dot(beamColor, float3(0.2126f, 0.7152f, 0.0722f));
  float bloomScale = lerp(settings.bloomUnderestimateLevels, 1.0f, saturate(beamLuma));
  beamColor *= lerp(1.0f, bloomScale, settings.scanlineStrength);

  float3 diffusion = CRTRoyaleDiffusion(sourceTexture, sourceSampler, curvedUv, outputTexelSize, settings);
  float3 combined = beamColor;
  combined += diffusion * settings.diffusionWeight;
  combined += diffusion * settings.halationWeight * 0.5f.xxx;

  float2 outputResolution = 1.0f.xx / max(outputTexelSize, 1e-6f.xx);
  combined *= CRTRoyalePhosphorMask(curvedUv, outputResolution, settings);
  combined *= settings.levelsContrast.xxx;
  combined *= CRTRoyaleBorder(curvedUv, settings);

  return CRTRoyaleEncode(max(combined, 0.0f.xxx), settings.lcdGamma) * inside;
}

float3 ApplyCRTRoyale(Texture2D<float4> sourceTexture, SamplerState sourceSampler, float2 uv,
                      float2 outputTexelSize, float2 sourceTexelSize, CRTRoyaleSettings settings) {
  float2 sourceSize = 1.0f.xx / max(sourceTexelSize, 1e-6f.xx);
  return ApplyCRTRoyalePrescaled(sourceTexture, sourceSampler, uv, outputTexelSize, sourceSize, sourceSize, settings);
}

#ifndef CRT_ROYALE_HELPERS_ONLY
CRTRoyaleVSOutput CRTRoyaleVS(CRTRoyaleVSInput input) {
  CRTRoyaleVSOutput output;
  output.position = mul(MVP, input.position);
  output.texcoord = input.texcoord;
  return output;
}

float4 CRTRoyalePS(CRTRoyaleVSOutput input) : SV_TARGET {
  CRTRoyaleSettings settings = GetCRTRoyaleSettings();
  float3 color = ApplyCRTRoyalePrescaled(Source, SourceSampler, input.texcoord, OutputSize.zw, SourceSize.xy, OriginalSize.xy, settings);
  return float4(color, 1.0f);
}
#endif
