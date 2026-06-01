// Port/adaptation of RetroArch crt/shaders/newpixie/newpixie-crt.slang for helper-style integration.
// Original shader by Mattias Gustavsson, adapted for slang by hunterk.
// Original source offers dual licensing: MIT or Public Domain / Unlicense.
// This helper preserves the single-call integration style used by `lcd-grid-v2.hlsl`.
//
// Note: the original preset is multipass (`accumulate`, `blur_horiz`, `blur_vert`, `newpixie-crt`).
// This helper recreates the look under the same usage conditions as the LCD helper by approximating
// the accumulation/blur passes from the current source texture in one pass.

// Ported with AI

struct NewPixieCRTSettings {
  float curvature;
  float wiggleToggle;
  float scanroll;
  float vignette;
  float ghosting;
  float blurX;
  float blurY;
  float accumulateModulate;
};

static const float kNewPixieGaussianWeights[9] = {
  0.0162162162f,
  0.0540540541f,
  0.1216216216f,
  0.1945945946f,
  0.2270270270f,
  0.1945945946f,
  0.1216216216f,
  0.0540540541f,
  0.0162162162f,
};

#ifdef NEWPIXIE_CRT_CUSTOM_SETTINGS
NewPixieCRTSettings GetNewPixieCRTSettings();
#else
NewPixieCRTSettings GetNewPixieCRTSettings() {
  NewPixieCRTSettings settings;
  settings.curvature = 2.0f;
  settings.wiggleToggle = 0.0f;
  settings.scanroll = 1.0f;
  settings.vignette = 1.0f;
  settings.ghosting = 1.0f;
  settings.blurX = 1.0f;
  settings.blurY = 1.0f;
  settings.accumulateModulate = 0.65f;
  return settings;
}
#endif

float3 NewPixieFilmic(float3 linearColor) {
  float3 x = max(0.0f.xxx, linearColor - 0.004f.xxx);
  return (x * (6.2f * x + 0.5f.xxx)) / (x * (6.2f * x + 1.7f.xxx) + 0.06f.xxx);
}

float2 NewPixieCurve(float2 uv, float curvature) {
  uv -= 0.5f.xx;
  uv *= float2(0.925f, 1.095f);
  uv *= curvature;
  uv.x *= 1.0f + pow(abs(uv.y) / 4.0f, 2.0f);
  uv.y *= 1.0f + pow(abs(uv.x) / 3.0f, 2.0f);
  uv /= curvature;
  uv += 0.5f.xx;
  uv = uv * 0.92f.xx + 0.04f.xx;
  return uv;
}

float NewPixieRand(float2 co) {
  return frac(sin(dot(co, float2(12.9898f, 78.233f))) * 43758.5453f);
}

float2 NewPixiePrescale(float2 prescaledTextureSize, float2 logicalSourceSize) {
  return max(round(prescaledTextureSize / logicalSourceSize), 1.0f.xx);
}

float2 NewPixieLogicalTexelSize(float2 logicalSourceSize) {
  return 1.0f.xx / logicalSourceSize;
}

float2 NewPixieQuantizePrescaledUV(float2 uv, float2 prescaledTextureSize, float2 logicalSourceSize, float2 logicalOffset) {
  float2 prescale = NewPixiePrescale(prescaledTextureSize, logicalSourceSize);
  float2 logicalUv = uv * logicalSourceSize - 0.5f.xx + logicalOffset;
  float2 logicalCenter = floor(logicalUv) + 0.5f.xx;
  float2 prescaledCenter = logicalCenter * prescale;
  return prescaledCenter / prescaledTextureSize;
}

float2 NewPixieResolveSampleUV(float2 tc) {
  float2 resolved = tc * float2(1.025f, 0.92f) + float2(-0.0125f, 0.04f);
  return saturate(resolved);
}

float3 NewPixieSample(Texture2D<float4> sourceTexture, SamplerState sourceSampler, float2 uv) {
  return sourceTexture.SampleLevel(sourceSampler, saturate(uv), 0.0f).rgb;
}

float3 NewPixieTSample(Texture2D<float4> sourceTexture, SamplerState sourceSampler, float2 tc, float2 prescaledTextureSize, float2 logicalSourceSize) {
  float2 sampleUv = NewPixieResolveSampleUV(tc);
  float3 sampleColor = pow(abs(NewPixieSample(sourceTexture, sourceSampler, sampleUv)), 2.2f.xxx);
  return sampleColor * 1.25f.xxx;
}

float3 NewPixieGaussianBlur(Texture2D<float4> sourceTexture, SamplerState sourceSampler, float2 uv, float2 blurStep) {
  float3 result = 0.0f.xxx;
  [unroll]
  for (int i = -4; i <= 4; ++i) {
    float weight = kNewPixieGaussianWeights[i + 4];
    result += NewPixieSample(sourceTexture, sourceSampler, uv + blurStep * (float)i) * weight;
  }
  return result;
}

float3 NewPixieBlurTSample(Texture2D<float4> sourceTexture, SamplerState sourceSampler, float2 tc,
                           float2 prescaledTextureSize, NewPixieCRTSettings settings) {
  float2 sampleUv = NewPixieResolveSampleUV(tc);
  float2 blurStep = float2(settings.blurX, settings.blurY) / max(prescaledTextureSize, 1.0f.xx);
  float3 blurX = NewPixieGaussianBlur(sourceTexture, sourceSampler, sampleUv, float2(blurStep.x, 0.0f));
  float3 blurY = NewPixieGaussianBlur(sourceTexture, sourceSampler, sampleUv, float2(0.0f, blurStep.y));
  float3 sampleColor = 0.5f * (blurX + blurY);
  sampleColor = pow(abs(sampleColor), 2.2f.xxx);
  return sampleColor * 1.25f.xxx;
}

float3 ApplyNewPixieCRT(Texture2D<float4> sourceTexture, SamplerState sourceSampler, float2 uv, float2 outputTexelSize,
                        float2 prescaledTextureSize, float2 logicalSourceSize, float frameCount, NewPixieCRTSettings settings) {
  float2 resolution = 1.0f.xx / max(outputTexelSize, 1e-6f.xx);

  float time = fmod(frameCount, 849.0f) * 36.0f;
  float2 curvedUv = lerp(NewPixieCurve(uv, settings.curvature), uv, 0.4f);
  float scale = -0.101f;
  float2 scuv = curvedUv * (1.0f - scale) + scale * 0.5f.xx + float2(0.003f, -0.001f);

  float x = settings.wiggleToggle
      * sin(0.1f * time + curvedUv.y * 13.0f)
      * sin(0.23f * time + curvedUv.y * 19.0f)
      * sin(0.3f + 0.11f * time + curvedUv.y * 23.0f)
      * 0.0012f;
  float o = sin(uv.y * resolution.y * 1.5f) / resolution.x;
  x += o * 0.25f;

  time = fmod(frameCount, 640.0f);

  float3 col;
  col.r = NewPixieTSample(sourceTexture, sourceSampler, float2(x + scuv.x + 0.0009f, scuv.y + 0.0009f), prescaledTextureSize, logicalSourceSize).r + 0.02f;
  col.g = NewPixieTSample(sourceTexture, sourceSampler, float2(x + scuv.x + 0.0000f, scuv.y - 0.0011f), prescaledTextureSize, logicalSourceSize).g + 0.02f;
  col.b = NewPixieTSample(sourceTexture, sourceSampler, float2(x + scuv.x - 0.0015f, scuv.y + 0.0000f), prescaledTextureSize, logicalSourceSize).b + 0.02f;

  float i = saturate(dot(col, float3(0.299f, 0.587f, 0.114f)));
  i = pow(1.0f - i * i, 1.0f);
  i = (1.0f - i) * 0.85f + 0.15f;

  float ghs = 0.15f * settings.ghosting;
  float2 wobbleR = 0.007f * float2(0.35f * sin(1.0f / 7.0f + 15.0f * curvedUv.y + 0.9f * time),
                                   0.35f * sin(2.0f / 7.0f + 10.0f * curvedUv.y + 1.37f * time));
  float2 wobbleG = 0.007f * float2(0.35f * cos(1.0f / 9.0f + 15.0f * curvedUv.y + 0.5f * time),
                                   0.35f * sin(2.0f / 9.0f + 10.0f * curvedUv.y + 1.50f * time));
  float2 wobbleB = 0.007f * float2(0.35f * sin(2.0f / 3.0f + 15.0f * curvedUv.y + 0.7f * time),
                                   0.35f * cos(2.0f / 3.0f + 10.0f * curvedUv.y + 1.63f * time));

  float3 r = NewPixieBlurTSample(
      sourceTexture,
      sourceSampler,
      float2(x - 0.014f, -0.027f) * 0.85f + wobbleR + float2(scuv.x + 0.001f, scuv.y + 0.001f),
      prescaledTextureSize,
      settings) * float3(0.5f, 0.25f, 0.25f);
  float3 g = NewPixieBlurTSample(
      sourceTexture,
      sourceSampler,
      float2(x - 0.019f, -0.020f) * 0.85f + wobbleG + float2(scuv.x + 0.000f, scuv.y - 0.002f),
      prescaledTextureSize,
      settings) * float3(0.25f, 0.5f, 0.25f);
  float3 b = NewPixieBlurTSample(
      sourceTexture,
      sourceSampler,
      float2(x - 0.017f, -0.003f) * 0.85f + wobbleB + float2(scuv.x - 0.002f, scuv.y + 0.000f),
      prescaledTextureSize,
      settings) * float3(0.25f, 0.25f, 0.5f);

  col += (ghs * (1.0f - 0.299f)).xxx * pow(saturate(3.0f.xxx * r), 2.0f.xxx) * i.xxx;
  col += (ghs * (1.0f - 0.587f)).xxx * pow(saturate(3.0f.xxx * g), 2.0f.xxx) * i.xxx;
  col += (ghs * (1.0f - 0.114f)).xxx * pow(saturate(3.0f.xxx * b), 2.0f.xxx) * i.xxx;

  col *= float3(0.95f, 1.05f, 0.95f);
  col = saturate(col * 1.3f + 0.75f * col * col + 1.25f * col * col * col * col * col);

  float vig = ((1.0f - 0.99f * settings.vignette) + 16.0f * curvedUv.x * curvedUv.y * (1.0f - curvedUv.x) * (1.0f - curvedUv.y));
  vig = 1.3f * sqrt(max(vig, 0.0f));
  col *= vig;

  float scanTime = time * settings.scanroll;
  float scans = saturate(0.35f + 0.18f * sin(6.0f * scanTime - curvedUv.y * resolution.y * 1.5f));
  col *= pow(scans, 0.9f).xxx;

  col *= 1.0f - 0.23f * saturate(fmod(uv.x * resolution.x, 3.0f) / 2.0f);

  col = NewPixieFilmic(col);

  float2 seed = curvedUv * resolution;
  col -= 0.015f * pow(float3(
      NewPixieRand(seed + scanTime),
      NewPixieRand(seed + scanTime * 2.0f),
      NewPixieRand(seed + scanTime * 3.0f)), 1.5f.xxx);

  col *= 1.0f - 0.004f * (sin(50.0f * scanTime + curvedUv.y * 2.0f) * 0.5f + 0.5f);

  float inside = step(0.0f, curvedUv.x) * step(curvedUv.x, 1.0f) * step(0.0f, curvedUv.y) * step(curvedUv.y, 1.0f);
  return max(col, 0.0f.xxx) * inside;
}
