#version 450

layout(set = 0, binding = 0, std140) uniform support_buffer
{
    uint _m0;
    uint _m1[8];
    vec4 _m2;
    vec4 _m3;
    int _m4;
    float _m5[73];
    ivec4 _m6;
    int _m7;
} support_buffer_1;

layout(set = 0, binding = 22, std140) uniform fp_c3
{
    vec4 _m0[4096];
} fp_c3_1;

layout(set = 0, binding = 20, std140) uniform fp_c1
{
    vec4 _m0[4096];
} fp_c1_1;

layout(set = 2, binding = 128) uniform sampler2D fp_t_tcb_A;
layout(set = 2, binding = 129) uniform sampler2D fp_t_tcb_8;

layout(location = 0) in vec4 vTexCoordPair;
layout(location = 0) out vec4 oColor;

void main()
{
    vec2 uv = vTexCoordPair.xy;
    vec2 uvAlt = vTexCoordPair.zw;

    vec2 lumaAlt = textureGather(fp_t_tcb_A, uvAlt).xz;
    vec3 lumaMain = textureGather(fp_t_tcb_A, uv).xzw;

    float lumaNW = lumaAlt.x;
    float lumaSE = lumaAlt.y;
    float lumaNE = lumaMain.x;
    float lumaSW = lumaMain.y;
    float lumaM = lumaMain.z;

    float lumaMax = max(lumaM, max(max(lumaNW, lumaSE), max(lumaNE, lumaSW)));
    float lumaMin = min(lumaM, min(min(lumaNW, lumaSE), min(lumaNE, lumaSW)));
    float lumaRange = lumaMax - lumaMin;
    float rangeThreshold = max(lumaMax * fp_c3_1._m0[3].x, fp_c3_1._m0[3].y);
    if (lumaRange < rangeThreshold)
    {
        oColor = texture(fp_t_tcb_8, uv);
        return;
    }

    float lumaDiagA = textureOffset(fp_t_tcb_A, uv, ivec2(1, -1)).x;
    float lumaDiagB = textureOffset(fp_t_tcb_A, uv, ivec2(-1, 1)).x;

    float sumSW_NW = lumaSW + lumaNW;
    float sumNE_SE = lumaNE + lumaSE;
    float gradMainA = fma(lumaM, -2.0, sumSW_NW);
    float gradMainB = fma(lumaM, -2.0, sumNE_SE);

    float sumNW_DiagA = lumaNW + lumaDiagA;
    float sumNW_DiagB = lumaNW + lumaDiagB;
    float gradNW_A = fma(lumaSE, -2.0, sumNW_DiagA);
    float gradNW_B = fma(lumaNW, -2.0, sumNW_DiagB);

    float sumSW_DiagA = lumaSW + lumaDiagA;
    float sumSW_DiagB = lumaSW + lumaDiagB;
    float gradSW_A = fma(lumaSW, -2.0, sumSW_DiagA);
    float gradSW_B = fma(lumaNE, -2.0, sumSW_DiagB);

    float edgeH = abs(gradSW_B) + fma(abs(gradMainA), 2.0, abs(gradNW_A));
    float edgeV = abs(gradSW_A) + fma(abs(gradMainB), 2.0, abs(gradNW_B));
    bool useY = edgeV >= edgeH;

    float selectY = useY ? 1.0 : 0.0;
    float selectX = useY ? 0.0 : 1.0;

    float edgeSampleA = fma(lumaNW, selectX, lumaSE * selectY);
    float edgeSampleB = fma(lumaSW, selectX, lumaNE * selectY);
    float deltaA = edgeSampleA - lumaM;
    float deltaB = edgeSampleB - lumaM;
    bool useA = abs(deltaA) >= abs(deltaB);

    float dirScaleBase = fma(selectX, fp_c3_1._m0[0].x, selectY * fp_c3_1._m0[0].y);
    float dirScale = useA ? -dirScaleBase : dirScaleBase;

    vec2 axisStep = vec2(selectY * fp_c3_1._m0[0].x, selectX * fp_c3_1._m0[0].y);
    vec2 axisDir = vec2(selectX, selectY);
    vec2 centerUV = uv + 0.5 * (axisDir * dirScale);

    float chosenNeighbor = useA ? edgeSampleA : edgeSampleB;
    float edgeAbs = abs(useA ? deltaA : deltaB);

    vec2 negUV = centerUV - axisStep;
    vec2 posUV = centerUV + axisStep;
    float samplePos = texture(fp_t_tcb_A, posUV).x;
    float sampleNeg = texture(fp_t_tcb_A, negUV).x;

    float lumaAvg = 0.5 * (lumaM + chosenNeighbor);
    float edgeLimit = 0.25 * edgeAbs;

    bool keepPos = edgeLimit >= abs(samplePos - lumaAvg);
    bool keepNeg = edgeLimit >= abs(sampleNeg - lumaAvg);

    float step0 = fp_c1_1._m0[0].x;

    float keepPosScale = keepPos ? step0 : 0.0;
    float keepNegScale = keepNeg ? step0 : 0.0;
    vec2 pos1 = vec2(fma(axisStep.x * keepPosScale, step0, posUV.x), fma(axisStep.y * keepPosScale, step0, posUV.y));
    vec2 neg1 = vec2(fma(axisStep.x * keepNegScale, -step0, negUV.x), fma(axisStep.y * keepNegScale, -step0, negUV.y));
    float samplePos1 = texture(fp_t_tcb_A, pos1).x;
    float sampleNeg1 = texture(fp_t_tcb_A, neg1).x;

    keepPos = edgeLimit >= abs(samplePos1 - lumaAvg);
    keepNeg = edgeLimit >= abs(sampleNeg1 - lumaAvg);
    keepPosScale = keepPos ? step0 : 0.0;
    keepNegScale = keepNeg ? step0 : 0.0;
    vec2 pos2 = vec2(fma(axisStep.x * keepPosScale, fp_c1_1._m0[1].x, pos1.x), fma(axisStep.y * keepPosScale, fp_c1_1._m0[1].x, pos1.y));
    vec2 neg2 = vec2(fma(axisStep.x * keepNegScale, -fp_c1_1._m0[1].x, neg1.x), fma(axisStep.y * keepNegScale, -fp_c1_1._m0[1].x, neg1.y));
    float samplePos2 = texture(fp_t_tcb_A, pos2).x;
    float sampleNeg2 = texture(fp_t_tcb_A, neg2).x;

    keepPos = edgeLimit >= abs(samplePos2 - lumaAvg);
    keepNeg = edgeLimit >= abs(sampleNeg2 - lumaAvg);
    keepPosScale = keepPos ? step0 : 0.0;
    keepNegScale = keepNeg ? step0 : 0.0;
    vec2 pos3 = vec2(fma(axisStep.x * keepPosScale, fp_c1_1._m0[2].x, pos2.x), fma(axisStep.y * keepPosScale, fp_c1_1._m0[2].x, pos2.y));
    vec2 neg3 = vec2(fma(axisStep.x * keepNegScale, -fp_c1_1._m0[2].x, neg2.x), fma(axisStep.y * keepNegScale, -fp_c1_1._m0[2].x, neg2.y));
    float samplePos3 = texture(fp_t_tcb_A, pos3).x;
    float sampleNeg3 = texture(fp_t_tcb_A, neg3).x;

    keepPos = edgeLimit >= abs(samplePos3 - lumaAvg);
    keepNeg = edgeLimit >= abs(sampleNeg3 - lumaAvg);
    keepPosScale = keepPos ? step0 : 0.0;
    keepNegScale = keepNeg ? step0 : 0.0;
    vec2 pos4 = vec2(fma(axisStep.x * keepPosScale, fp_c1_1._m0[3].x, pos3.x), fma(axisStep.y * keepPosScale, fp_c1_1._m0[3].x, pos3.y));
    vec2 neg4 = vec2(fma(axisStep.x * keepNegScale, -fp_c1_1._m0[3].x, neg3.x), fma(axisStep.y * keepNegScale, -fp_c1_1._m0[3].x, neg3.y));
    float samplePos4 = texture(fp_t_tcb_A, pos4).x;
    float sampleNeg4 = texture(fp_t_tcb_A, neg4).x;

    float lumaComposite = fma(sumNE_SE + sumSW_NW, 2.0, sumSW_DiagA + sumNW_DiagB);
    float subpixMetric = abs(fma(lumaComposite, -fp_c1_1._m0[4].x, lumaM));
    float subpix = clamp((1.0 / lumaRange) * subpixMetric, 0.0, 1.0);

    float distPos = fma(pos4.y - uv.y, selectX, (pos4.x - uv.x) * selectY);
    float distNeg = fma(uv.y - neg4.y, selectX, (uv.x - neg4.x) * selectY);
    float spanInv = 1.0 / (distPos + distNeg);
    float minDist = min(distPos, distNeg);
    float edgeOffset = fma(spanInv, -minDist, fp_c1_1._m0[4].z);

    bool centerIsDark = lumaM < lumaAvg;
    bool negIsDark = sampleNeg4 < lumaAvg;
    bool posIsDark = samplePos4 < lumaAvg;

    int centerSide = centerIsDark ? 1 : 0;
    bool negCrosses = ((negIsDark ? 1 : 0) != centerSide);
    bool posCrosses = ((posIsDark ? 1 : 0) != centerSide);
    bool choosePosSide = distPos < distNeg;
    bool useEdgeOffset = choosePosSide ? negCrosses : posCrosses;

    float subpixPoly = fma(subpix, fma(subpix, 6.0, -15.0), fp_c1_1._m0[4].y);
    float subpixOffset = 0.75 * subpix * subpix * subpix * subpixPoly;
    float finalOffset = max(subpixOffset, useEdgeOffset ? edgeOffset : 0.0);

    vec2 finalUV = uv + axisDir * (finalOffset * dirScale);
    oColor = texture(fp_t_tcb_8, finalUV);
}

