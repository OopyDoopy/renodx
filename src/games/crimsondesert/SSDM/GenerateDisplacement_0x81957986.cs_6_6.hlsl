StructuredBuffer<float2> __3__37__0__0__g_displacementBuffer : register(t2, space37);

RWTexture2D<float4> __3__38__0__1__g_displacementUAV[4] : register(u0, space38);

cbuffer __3__35__0__0__SeaConstantBuffer : register(b1, space35) {
  float _seaBaseline : packoffset(c000.x);
  float2 _seedPoint : packoffset(c000.y);
  float _dirDependency : packoffset(c000.w);
  float _choppyScale : packoffset(c001.x);
  float _cascadeSize1 : packoffset(c001.y);
  float _cascadeSize2 : packoffset(c001.z);
  float _cascadeSize3 : packoffset(c001.w);
  float _cascadeSize4 : packoffset(c002.x);
  float _cascadeAmplitude1 : packoffset(c002.y);
  float _cascadeAmplitude2 : packoffset(c002.z);
  float _cascadeAmplitude3 : packoffset(c002.w);
  float _cascadeAmplitude4 : packoffset(c003.x);
  float _seaExtinctionCoefficient : packoffset(c003.y);
  uint _scatteringAlbedo : packoffset(c003.z);
};

[numthreads(16, 16, 1)]
void main(
  uint3 SV_DispatchThreadID : SV_DispatchThreadID,
  uint3 SV_GroupID : SV_GroupID,
  uint3 SV_GroupThreadID : SV_GroupThreadID,
  uint SV_GroupIndex : SV_GroupIndex
) {
  int _16;
  if (!((uint)((int)(SV_DispatchThreadID.y) | (int)(SV_DispatchThreadID.x)) > (uint)63)) {
    float _12 = select(((((int)(SV_DispatchThreadID.y + SV_DispatchThreadID.x)) & 1) != 0), -1.0f, 1.0f);
    _16 = 0;
    while(true) {
      float _21 = __3__37__0__0__g_displacementBuffer[((int)(((SV_DispatchThreadID.y << 6) + SV_DispatchThreadID.x) + ((uint)(_16 * 12288))))].x;
      float _25 = __3__37__0__0__g_displacementBuffer[((int)((((SV_DispatchThreadID.y << 6) + SV_DispatchThreadID.x) + ((uint)(_16 * 12288))) + 4096u))].x;
      float _28 = _choppyScale * _12;
      float _32 = __3__37__0__0__g_displacementBuffer[((int)((((SV_DispatchThreadID.y << 6) + SV_DispatchThreadID.x) + ((uint)(_16 * 12288))) + 8192u))].x;
      __3__38__0__1__g_displacementUAV[((int)((uint)(_16) + 0u))][int2((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y))] = float4((_28 * _25), (_21 * _12), (_28 * _32), 0.0f);
      if (!((_16 + 1) == 4)) {
        _16 = (_16 + 1);
        continue;
      }
      break;
    }
  }
}