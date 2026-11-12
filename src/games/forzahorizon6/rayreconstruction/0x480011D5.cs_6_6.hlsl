// spatialfilter_0x480011D5: RTGI_SpatialFilter_Disk bypass.
//
// This replacement forwards the current radiance pair while preserving the
// target's depth guard, hash-jittered sampling coordinate, and thread swizzle.

cbuffer cb : register(b0, space36)
{
    float4 m[50] : packoffset(c0);
};

Texture2D<float4> g_depth : register(t1, space36);
Texture2D<float4> g_hist_a : register(t22, space36);
Texture2D<float4> g_hist_b : register(t23, space36);
RWTexture2D<float4> g_out_a : register(u2, space36);
RWTexture2D<float4> g_out_b : register(u3, space36);

[numthreads(8, 8, 1)]
void main(uint3 global_id : SV_DispatchThreadID)
{
    const uint half_x = global_id.x >> 1u;
    const uint y2 = global_id.y << 1u;
    const uint px = ((half_x & 2u) | (global_id.x & 4294967289u)) | (y2 & 4u);
    const uint py = ((global_id.y & 4294967292u) | (half_x & 1u)) | (y2 & 2u);
    uint output_width, output_height;
    g_out_a.GetDimensions(output_width, output_height);
    if (px >= output_width || py >= output_height)
    {
        return;
    }

    const uint seed = (px * 5u) + py;
    const uint hx = seed + 37u;
    const uint rx = ((hx >> 8u) ^ hx) + 1759714724u;
    const uint rrx = ((rx << 8u) ^ rx) * 458671337u;
    const uint hy = seed + 38u;
    const uint ry = ((hy >> 8u) ^ hy) + 1759714724u;
    const uint rry = ((ry << 8u) ^ ry) * 458671337u;
    const float jitter_x = float((rrx & 16777215u) ^ (rrx >> 8u)) * 5.9604644775390625e-08f;
    const float jitter_y = float((rry & 16777215u) ^ (rry >> 8u)) * 5.9604644775390625e-08f;
    const uint full_x = uint((jitter_x + float(px)) * m[25].x);
    const uint full_y = uint((jitter_y + float(py)) * m[25].y);

    const float depth = g_depth.Load(int3(uint2(full_x, full_y), 0)).x;
    const bool valid = (depth > 0.0f) && ((m[0].w / (depth - m[0].z)) > 0.0f);

    if (valid)
    {
        g_out_a[uint2(px, py)] = g_hist_a.Load(int3(uint2(px, py), 0));
        g_out_b[uint2(px, py)] = g_hist_b.Load(int3(uint2(px, py), 0));
    }
    else
    {
        g_out_a[uint2(px, py)] = float4(0.0f, 0.0f, 0.0f, 1.0f);
        g_out_b[uint2(px, py)] = 0.0f.xxxx;
    }
}
