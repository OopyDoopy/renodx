#include "./tonemap.hlsli"

// Shader 0x6B87C44F -- faithful ps_3_0 HLSL rewrite of supplied bytecode.
// This is an FXAA-style edge-aware anti-aliasing pass using green as luma.
// Original c0.xy = texel offset for texture s0; original c1-c4 = literal constants.
// Coordinates and all branches follow the original assembly, rather than a generic FXAA port.
// The disassembly is preserved beside expressions for auditing.

float4 c0 : register(c0);
sampler2D s0 : register(s0);

float4 main(float2 texCoord : TEXCOORD0) : COLOR0
{
    if (CUSTOM_FXAA_ENABLED == 0.f) {
        float4 center = tex2Dlod(s0, float4(texCoord, 0.f, 0.f));
        center.rgb = renodx::color::srgb::DecodeSafe(center.rgb);
        if (CUSTOM_FILM_GRAIN_STRENGTH != 0.f) {
            center.rgb = renodx::effects::ApplyFilmGrain(center.rgb, texCoord, CUSTOM_RANDOM, CUSTOM_FILM_GRAIN_STRENGTH * 0.03f);
        }
        center.rgb = IntermediatePass(GuildWarsToneMap(center.rgb, true));
        return center;
    }
    const float4 c1 = float4(1.0, 0.0, -1.0, 0.166);
    const float4 c2 = float4(-0.0833, -2.0, 2.0, 0.0833333358);
    const float4 c3 = float4(0.5, -2.0, 3.0, 0.25);
    const float4 c4 = float4(1.5, 4.0, 12.0, 0.75);

    float4 v0 = float4(texCoord, 0.0, 0.0);
    float4 outColor = float4(0.0, 0.0, 0.0, 0.0);
    float4 r0=0, r1=0, r2=0, r3=0, r4=0;
    float4 r5=0, r6=0, r7=0, r8=0, r9=0;

    // Initial five-tap neighborhood sampling and local edge detection.
    r0 = float4((c1.x * v0.x), (c1.x * v0.y), (c1.y * v0.x), (c1.y * v0.x));  // 031: mul r0, c1.xxyy, v0.xyxx
    r0 = tex2Dlod(s0, r0);  // 035: texldl r0, r0, s0
    r1.xyz = float3(c1.x, c1.y, c1.z);  // 039: mov r1.xyz, c1
    r2.xyz = float3((c0.y * r1.x + v0.y), (c0.x * r1.x + v0.x), (c0.y * r1.y + v0.y));  // 042: mad r2.xyz, c0.yxyw, r1.xxyw, v0.yxyw
    r3.xzw = float3((c1.x * v0.x), (c1.y * v0.x), (c1.y * v0.x));  // 047: mul r3.xzw, c1.xyyy, v0.x
    r3.y = r2.x;  // 051: mov r3.y, r2.x
    r3 = tex2Dlod(s0, r3);  // 054: texldl r3, r3, s0
    r2 = float4((r2.y * c1.x), (r2.z * c1.x), (r2.y * c1.y), (r2.y * c1.y));  // 058: mul r2, r2.yzyy, c1.xxyy
    r2 = tex2Dlod(s0, r2);  // 062: texldl r2, r2, s0
    r2.xzw = float3((c0.y * r1.z + v0.y), (c0.x * r1.z + v0.x), (c0.y * r1.y + v0.y));  // 066: mad r2.xzw, c0.yyxy, r1.zyzy, v0.yyxy
    r4.xzw = float3((c1.x * v0.x), (c1.y * v0.x), (c1.y * v0.x));  // 071: mul r4.xzw, c1.xyyy, v0.x
    r4.y = r2.x;  // 075: mov r4.y, r2.x
    r4 = tex2Dlod(s0, r4);  // 078: texldl r4, r4, s0
    r5 = float4((r2.z * c1.x), (r2.w * c1.x), (r2.z * c1.y), (r2.z * c1.y));  // 082: mul r5, r2.zwzz, c1.xxyy
    r5 = tex2Dlod(s0, r5);  // 086: texldl r5, r5, s0
    r1.w = max(r3.y, r0.y);  // 090: max r1.w, r3.y, r0.y
    r2.x = min(r0.y, r3.y);  // 094: min r2.x, r0.y, r3.y
    r3.x = max(r2.y, r1.w);  // 098: max r3.x, r2.y, r1.w
    r1.w = min(r2.x, r2.y);  // 102: min r1.w, r2.x, r2.y
    r2.x = max(r4.y, r5.y);  // 106: max r2.x, r4.y, r5.y
    r2.z = min(r5.y, r4.y);  // 110: min r2.z, r5.y, r4.y
    r4.x = max(r2.x, r3.x);  // 114: max r4.x, r2.x, r3.x
    r3.x = min(r1.w, r2.z);  // 118: min r3.x, r1.w, r2.z
    r1.w = (r4.x * c1.w);  // 122: mul r1.w, r4.x, c1.w
    r2.x = (-r3.x + r4.x);  // 126: add r2.x, -r3.x, r4.x
    r2.z = min(-r1.w, c2.x);  // 130: min r2.z, -r1.w, c2.x
    // Skip anti-aliasing where the luma range is below the edge threshold.
    if (r2.x < -r2.z) {  // 134: ifc r2.x, -r2.z [flags=0x04]
        outColor = float4(r0.x, r0.y, r0.z, r0.w);  // 137: mov oC0, r0
    } else {
        r6.xy = float2((-c0.x + v0.x), (-c0.y + v0.y));  // 141: add r6.xy, -c0, v0
        r6.zw = float2(c1.y, c1.y);  // 145: mov r6.zw, c1.y
        r6 = tex2Dlod(s0, r6);  // 148: texldl r6, r6, s0
        r7.xy = float2((c0.x + v0.x), (c0.y + v0.y));  // 152: add r7.xy, c0, v0
        r7.zw = float2(c1.y, c1.y);  // 156: mov r7.zw, c1.y
        r7 = tex2Dlod(s0, r7);  // 159: texldl r7, r7, s0
        r8 = float4((c0.x * r1.x + v0.x), (c0.y * r1.z + v0.y), (c0.x * r1.z + v0.x), (c0.y * r1.x + v0.y));  // 163: mad r8, c0.xyxy, r1.xzzx, v0.xyxy
        r9 = float4((r8.x * c1.x), (r8.y * c1.x), (r8.x * c1.y), (r8.x * c1.y));  // 168: mul r9, r8.xyxx, c1.xxyy
        r9 = tex2Dlod(s0, r9);  // 172: texldl r9, r9, s0
        r8 = float4((r8.z * c1.x), (r8.w * c1.x), (r8.x * c1.y), (r8.x * c1.y));  // 176: mul r8, r8.zwxx, c1.xxyy
        r8 = tex2Dlod(s0, r8);  // 180: texldl r8, r8, s0
        r0.x = (r3.y + r4.y);  // 184: add r0.x, r3.y, r4.y
        r0.z = (r2.y + r5.y);  // 188: add r0.z, r2.y, r5.y
        r0.w = (1.0 / r2.x);  // 192: rcp r0.w, r2.x
        r1.x = (r0.z + r0.x);  // 195: add r1.x, r0.z, r0.x
        r0.x = (r0.y * c2.y + r0.x);  // 199: mad r0.x, r0.y, c2.y, r0.x
        r0.z = (r0.y * c2.y + r0.z);  // 204: mad r0.z, r0.y, c2.y, r0.z
        r1.z = (r7.y + r9.y);  // 209: add r1.z, r7.y, r9.y
        r1.w = (r6.y + r9.y);  // 213: add r1.w, r6.y, r9.y
        r2.x = (r2.y * c2.y + r1.z);  // 217: mad r2.x, r2.y, c2.y, r1.z
        r1.w = (r4.y * c2.y + r1.w);  // 222: mad r1.w, r4.y, c2.y, r1.w
        r2.z = (r6.y + r8.y);  // 227: add r2.z, r6.y, r8.y
        r2.w = (r7.y + r8.y);  // 231: add r2.w, r7.y, r8.y
        r0.x = (abs(r0.x) * c2.z + abs(r2.x));  // 235: mad r0.x, abs(r0.x), c2.z, abs(r2.x)
        r0.z = (abs(r0.z) * c2.z + abs(r1.w));  // 240: mad r0.z, abs(r0.z), c2.z, abs(r1.w)
        r1.w = (r5.y * c2.y + r2.z);  // 245: mad r1.w, r5.y, c2.y, r2.z
        r2.x = (r3.y * c2.y + r2.w);  // 250: mad r2.x, r3.y, c2.y, r2.w
        r0.x = (r0.x + abs(r1.w));  // 255: add r0.x, r0.x, abs(r1.w)
        r0.z = (r0.z + abs(r2.x));  // 259: add r0.z, r0.z, abs(r2.x)
        r1.z = (r1.z + r2.z);  // 263: add r1.z, r1.z, r2.z
        r0.x = (-r0.z + r0.x);  // 267: add r0.x, -r0.z, r0.x
        r0.z = (r1.x * c2.z + r1.z);  // 271: mad r0.z, r1.x, c2.z, r1.z
        // Choose dominant edge orientation and interpolation direction.
        r1.x = (r0.x >= 0.0 ? r4.y : r5.y);  // 276: cmp r1.x, r0.x, r4.y, r5.y
        r1.z = (r0.x >= 0.0 ? r3.y : r2.y);  // 281: cmp r1.z, r0.x, r3.y, r2.y
        r1.w = (r0.x >= 0.0 ? c0.y : c0.x);  // 286: cmp r1.w, r0.x, c0.y, c0.x
        r0.z = (r0.z * c2.w + -r0.y);  // 291: mad r0.z, r0.z, c2.w, -r0.y
        r2.xy = float2((-r0.y + r1.x), (-r0.y + r1.z));  // 296: add r2.xy, -r0.y, r1.xzzw
        r1.xz = float2((r0.y + r1.x), (r0.y + r1.z));  // 300: add r1.xz, r0.y, r1
        r2.z = (-abs(r2.y) + abs(r2.x));  // 304: add r2.z, -abs(r2.y), abs(r2.x)
        r3.x = max(abs(r2.x), abs(r2.y));  // 308: max r3.x, abs(r2.x), abs(r2.y)
        r1.w = (r2.z >= 0.0 ? -r1.w : r1.w);  // 312: cmp r1.w, r2.z, -r1.w, r1.w
        r0.z = saturate((r0.w * abs(r0.z)));  // 317: mul r0.z[sat], r0.w, abs(r0.z)
        r0.w = (r0.x >= 0.0 ? c0.x : r1.y);  // 321: cmp r0.w, r0.x, c0.x, r1.y
        r1.y = (r0.x >= 0.0 ? r1.y : c0.y);  // 326: cmp r1.y, r0.x, r1.y, c0.y
        r2.xy = float2((r1.w * c3.x + v0.x), (r1.w * c3.x + v0.y));  // 331: mad r2.xy, r1.w, c3.x, v0
        r2.x = (r0.x >= 0.0 ? v0.x : r2.x);  // 336: cmp r2.x, r0.x, v0.x, r2.x
        r2.y = (r0.x >= 0.0 ? r2.y : v0.y);  // 341: cmp r2.y, r0.x, r2.y, v0.y
        r4.x = (-r0.w + r2.x);  // 346: add r4.x, -r0.w, r2.x
        r4.y = (-r1.y + r2.y);  // 350: add r4.y, -r1.y, r2.y
        r5.x = (r0.w + r2.x);  // 354: add r5.x, r0.w, r2.x
        r5.y = (r1.y + r2.y);  // 358: add r5.y, r1.y, r2.y
        r2.x = (r0.z * c3.y + c3.z);  // 362: mad r2.x, r0.z, c3.y, c3.z
        r4.zw = float2(c1.y, c1.y);  // 367: mov r4.zw, c1.y
        r6 = tex2Dlod(s0, r4);  // 370: texldl r6, r4, s0
        r0.z = (r0.z * r0.z);  // 374: mul r0.z, r0.z, r0.z
        r5.zw = float2(c1.y, c1.y);  // 378: mov r5.zw, c1.y
        r7 = tex2Dlod(s0, r5);  // 381: texldl r7, r5, s0
        r1.x = (r2.z >= 0.0 ? r1.x : r1.z);  // 385: cmp r1.x, r2.z, r1.x, r1.z
        r1.z = (r3.x * c3.w);  // 390: mul r1.z, r3.x, c3.w
        r2.y = (r1.x * -c3.x + r0.y);  // 394: mad r2.y, r1.x, -c3.x, r0.y
        r0.z = (r0.z * r2.x);  // 399: mul r0.z, r0.z, r2.x
        r2.x = (r1.x * -c3.x + r6.y);  // 403: mad r2.x, r1.x, -c3.x, r6.y
        r2.z = (r1.x * -c3.x + r7.y);  // 408: mad r2.z, r1.x, -c3.x, r7.y
        r3.yz = float2((r3.x * -c3.w + abs(r2.x)), (r3.x * -c3.w + abs(r2.z)));  // 413: mad r3.yz, r3.x, -c3.w, abs(r2.xxzw)
        r2.w = (r0.w * -c4.x + r4.x);  // 418: mad r2.w, r0.w, -c4.x, r4.x
        r6.x = (r3.y >= 0.0 ? r4.x : r2.w);  // 423: cmp r6.x, r3.y, r4.x, r2.w
        r2.w = (r1.y * -c4.x + r4.y);  // 428: mad r2.w, r1.y, -c4.x, r4.y
        r6.y = (r3.y >= 0.0 ? r4.y : r2.w);  // 433: cmp r6.y, r3.y, r4.y, r2.w
        r4.xy = float2((r3.y >= 0.0 ? c1.y : c1.x), (r3.z >= 0.0 ? c1.y : c1.x));  // 438: cmp r4.xy, r3.yzzw, c1.y, c1.x
        r2.w = (r4.y + r4.x);  // 443: add r2.w, r4.y, r4.x
        r3.w = (r0.w * c4.x + r5.x);  // 447: mad r3.w, r0.w, c4.x, r5.x
        r4.x = (r3.z >= 0.0 ? r5.x : r3.w);  // 452: cmp r4.x, r3.z, r5.x, r3.w
        r3.w = (r1.y * c4.x + r5.y);  // 457: mad r3.w, r1.y, c4.x, r5.y
        r4.y = (r3.z >= 0.0 ? r5.y : r3.w);  // 462: cmp r4.y, r3.z, r5.y, r3.w
        // Iterative quality search for the two ends of the dominant edge.
        if (-r2.w < c1.y) {  // 467: ifc -r2.w, c1.y [flags=0x04]
            if (abs(r2.x) >= r1.z) {  // 470: ifc abs(r2.x), r1.z [flags=0x03]
            } else {
                r6.zw = float2(c1.y, c1.y);  // 474: mov r6.zw, c1.y
                r5 = tex2Dlod(s0, r6);  // 477: texldl r5, r6, s0
                r2.x = r5.y;  // 481: mov r2.x, r5.y
            }
            if (abs(r2.z) >= r1.z) {  // 485: ifc abs(r2.z), r1.z [flags=0x03]
            } else {
                r4.zw = float2(c1.y, c1.y);  // 489: mov r4.zw, c1.y
                r5 = tex2Dlod(s0, r4);  // 492: texldl r5, r4, s0
                r2.z = r5.y;  // 496: mov r2.z, r5.y
            }
            r2.w = (r1.x * -c3.x + r2.x);  // 500: mad r2.w, r1.x, -c3.x, r2.x
            r2.x = (r3.y >= 0.0 ? r2.x : r2.w);  // 505: cmp r2.x, r3.y, r2.x, r2.w
            r2.w = (r1.x * -c3.x + r2.z);  // 510: mad r2.w, r1.x, -c3.x, r2.z
            r2.z = (r3.z >= 0.0 ? r2.z : r2.w);  // 515: cmp r2.z, r3.z, r2.z, r2.w
            r3.yz = float2((r3.x * -c3.w + abs(r2.x)), (r3.x * -c3.w + abs(r2.z)));  // 520: mad r3.yz, r3.x, -c3.w, abs(r2.xxzw)
            r2.w = (r0.w * -c2.z + r6.x);  // 525: mad r2.w, r0.w, -c2.z, r6.x
            r6.x = (r3.y >= 0.0 ? r6.x : r2.w);  // 530: cmp r6.x, r3.y, r6.x, r2.w
            r2.w = (r1.y * -c2.z + r6.y);  // 535: mad r2.w, r1.y, -c2.z, r6.y
            r6.y = (r3.y >= 0.0 ? r6.y : r2.w);  // 540: cmp r6.y, r3.y, r6.y, r2.w
            r5.xy = float2((r3.y >= 0.0 ? c1.y : c1.x), (r3.z >= 0.0 ? c1.y : c1.x));  // 545: cmp r5.xy, r3.yzzw, c1.y, c1.x
            r2.w = (r5.y + r5.x);  // 550: add r2.w, r5.y, r5.x
            r3.w = (r0.w * c2.z + r4.x);  // 554: mad r3.w, r0.w, c2.z, r4.x
            r4.x = (r3.z >= 0.0 ? r4.x : r3.w);  // 559: cmp r4.x, r3.z, r4.x, r3.w
            r3.w = (r1.y * c2.z + r4.y);  // 564: mad r3.w, r1.y, c2.z, r4.y
            r4.y = (r3.z >= 0.0 ? r4.y : r3.w);  // 569: cmp r4.y, r3.z, r4.y, r3.w
            if (-r2.w < c1.y) {  // 574: ifc -r2.w, c1.y [flags=0x04]
                if (abs(r2.x) >= r1.z) {  // 577: ifc abs(r2.x), r1.z [flags=0x03]
                } else {
                    r6.zw = float2(c1.y, c1.y);  // 581: mov r6.zw, c1.y
                    r5 = tex2Dlod(s0, r6);  // 584: texldl r5, r6, s0
                    r2.x = r5.y;  // 588: mov r2.x, r5.y
                }
                if (abs(r2.z) >= r1.z) {  // 592: ifc abs(r2.z), r1.z [flags=0x03]
                } else {
                    r4.zw = float2(c1.y, c1.y);  // 596: mov r4.zw, c1.y
                    r5 = tex2Dlod(s0, r4);  // 599: texldl r5, r4, s0
                    r2.z = r5.y;  // 603: mov r2.z, r5.y
                }
                r2.w = (r1.x * -c3.x + r2.x);  // 607: mad r2.w, r1.x, -c3.x, r2.x
                r2.x = (r3.y >= 0.0 ? r2.x : r2.w);  // 612: cmp r2.x, r3.y, r2.x, r2.w
                r2.w = (r1.x * -c3.x + r2.z);  // 617: mad r2.w, r1.x, -c3.x, r2.z
                r2.z = (r3.z >= 0.0 ? r2.z : r2.w);  // 622: cmp r2.z, r3.z, r2.z, r2.w
                r3.yz = float2((r3.x * -c3.w + abs(r2.x)), (r3.x * -c3.w + abs(r2.z)));  // 627: mad r3.yz, r3.x, -c3.w, abs(r2.xxzw)
                r2.w = (r0.w * -c4.y + r6.x);  // 632: mad r2.w, r0.w, -c4.y, r6.x
                r6.x = (r3.y >= 0.0 ? r6.x : r2.w);  // 637: cmp r6.x, r3.y, r6.x, r2.w
                r2.w = (r1.y * -c4.y + r6.y);  // 642: mad r2.w, r1.y, -c4.y, r6.y
                r6.y = (r3.y >= 0.0 ? r6.y : r2.w);  // 647: cmp r6.y, r3.y, r6.y, r2.w
                r5.xy = float2((r3.y >= 0.0 ? c1.y : c1.x), (r3.z >= 0.0 ? c1.y : c1.x));  // 652: cmp r5.xy, r3.yzzw, c1.y, c1.x
                r2.w = (r5.y + r5.x);  // 657: add r2.w, r5.y, r5.x
                r3.w = (r0.w * c4.y + r4.x);  // 661: mad r3.w, r0.w, c4.y, r4.x
                r4.x = (r3.z >= 0.0 ? r4.x : r3.w);  // 666: cmp r4.x, r3.z, r4.x, r3.w
                r3.w = (r1.y * c4.y + r4.y);  // 671: mad r3.w, r1.y, c4.y, r4.y
                r4.y = (r3.z >= 0.0 ? r4.y : r3.w);  // 676: cmp r4.y, r3.z, r4.y, r3.w
                if (-r2.w < c1.y) {  // 681: ifc -r2.w, c1.y [flags=0x04]
                    if (abs(r2.x) >= r1.z) {  // 684: ifc abs(r2.x), r1.z [flags=0x03]
                    } else {
                        r6.zw = float2(c1.y, c1.y);  // 688: mov r6.zw, c1.y
                        r5 = tex2Dlod(s0, r6);  // 691: texldl r5, r6, s0
                        r2.x = r5.y;  // 695: mov r2.x, r5.y
                    }
                    if (abs(r2.z) >= r1.z) {  // 699: ifc abs(r2.z), r1.z [flags=0x03]
                    } else {
                        r4.zw = float2(c1.y, c1.y);  // 703: mov r4.zw, c1.y
                        r5 = tex2Dlod(s0, r4);  // 706: texldl r5, r4, s0
                        r2.z = r5.y;  // 710: mov r2.z, r5.y
                    }
                    r1.z = (r1.x * -c3.x + r2.x);  // 714: mad r1.z, r1.x, -c3.x, r2.x
                    r1.x = (r1.x * -c3.x + r2.z);  // 719: mad r1.x, r1.x, -c3.x, r2.z
                    r2.xz = float2((r3.y >= 0.0 ? r2.x : r1.z), (r3.z >= 0.0 ? r2.z : r1.x));  // 724: cmp r2.xz, r3.yyzw, r2, r1.zyxw
                    r1.xz = float2((r3.x * -c3.w + abs(r2.x)), (r3.x * -c3.w + abs(r2.z)));  // 729: mad r1.xz, r3.x, -c3.w, abs(r2)
                    r2.w = (r0.w * -c4.z + r6.x);  // 734: mad r2.w, r0.w, -c4.z, r6.x
                    r6.x = (r1.x >= 0.0 ? r6.x : r2.w);  // 739: cmp r6.x, r1.x, r6.x, r2.w
                    r2.w = (r1.y * -c4.z + r6.y);  // 744: mad r2.w, r1.y, -c4.z, r6.y
                    r6.y = (r1.x >= 0.0 ? r6.y : r2.w);  // 749: cmp r6.y, r1.x, r6.y, r2.w
                    r0.w = (r0.w * c4.z + r4.x);  // 754: mad r0.w, r0.w, c4.z, r4.x
                    r4.x = (r1.z >= 0.0 ? r4.x : r0.w);  // 759: cmp r4.x, r1.z, r4.x, r0.w
                    r0.w = (r1.y * c4.z + r4.y);  // 764: mad r0.w, r1.y, c4.z, r4.y
                    r4.y = (r1.z >= 0.0 ? r4.y : r0.w);  // 769: cmp r4.y, r1.z, r4.y, r0.w
                }
            }
        }
        // Final subpixel and edge-derived UV offset.
        r0.w = (-r6.x + v0.x);  // 777: add r0.w, -r6.x, v0.x
        r1.y = (-r6.y + v0.y);  // 781: add r1.y, -r6.y, v0.y
        r0.w = (r0.x >= 0.0 ? r0.w : r1.y);  // 785: cmp r0.w, r0.x, r0.w, r1.y
        r1.xy = float2((r4.x + -v0.x), (r4.y + -v0.y));  // 790: add r1.xy, r4, -v0
        r1.x = (r0.x >= 0.0 ? r1.x : r1.y);  // 794: cmp r1.x, r0.x, r1.x, r1.y
        r1.yz = float2((r2.x >= 0.0 ? c1.y : c1.x), (r2.z >= 0.0 ? c1.y : c1.x));  // 799: cmp r1.yz, r2.xxzw, c1.y, c1.x
        r2.x = (r2.y >= 0.0 ? -c1.y : -c1.x);  // 804: cmp r2.x, r2.y, -c1.y, -c1.x
        r1.yz = float2((r1.y + r2.x), (r1.z + r2.x));  // 809: add r1.yz, r1, r2.x
        r2.x = (r0.w + r1.x);  // 813: add r2.x, r0.w, r1.x
        r2.x = (1.0 / r2.x);  // 817: rcp r2.x, r2.x
        r2.y = (r0.w + -r1.x);  // 820: add r2.y, r0.w, -r1.x
        r2.z = min(r1.x, r0.w);  // 824: min r2.z, r1.x, r0.w
        r0.w = (r2.y >= 0.0 ? abs(r1.z) : abs(r1.y));  // 828: cmp r0.w, r2.y, abs(r1.z), abs(r1.y)
        r0.z = (r0.z * r0.z);  // 833: mul r0.z, r0.z, r0.z
        r1.x = (r2.z * -r2.x + c3.x);  // 837: mad r1.x, r2.z, -r2.x, c3.x
        r0.z = (r0.z * c4.w);  // 842: mul r0.z, r0.z, c4.w
        r0.w = (-r0.w >= 0.0 ? c1.y : r1.x);  // 846: cmp r0.w, -r0.w, c1.y, r1.x
        r1.x = max(r0.w, r0.z);  // 851: max r1.x, r0.w, r0.z
        r0.zw = float2((r1.x * r1.w + v0.x), (r1.x * r1.w + v0.y));  // 855: mad r0.zw, r1.x, r1.w, v0.xyxy
        r1.x = (r0.x >= 0.0 ? v0.x : r0.z);  // 860: cmp r1.x, r0.x, v0.x, r0.z
        r1.y = (r0.x >= 0.0 ? r0.w : v0.y);  // 865: cmp r1.y, r0.x, r0.w, v0.y
        r1.zw = float2(c1.y, c1.y);  // 870: mov r1.zw, c1.y
        r1 = tex2Dlod(s0, r1);  // 873: texldl r1, r1, s0
        outColor.xyz = float3(r1.x, r1.y, r1.z);  // 877: mov oC0.xyz, r1
        outColor.w = r0.y;  // 880: mov oC0.w, r0.y
    }
    outColor.rgb = renodx::color::srgb::DecodeSafe(outColor.rgb);
    if (CUSTOM_FILM_GRAIN_STRENGTH != 0.f) {
        outColor.rgb = renodx::effects::ApplyFilmGrain(outColor.rgb, texCoord, CUSTOM_RANDOM, CUSTOM_FILM_GRAIN_STRENGTH * 0.03f);
    }
    outColor.rgb = IntermediatePass(GuildWarsToneMap(outColor.rgb, true));
    return outColor;
}
