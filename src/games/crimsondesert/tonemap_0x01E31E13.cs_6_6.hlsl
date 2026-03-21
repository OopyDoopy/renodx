#include "./common.hlsl"

Texture3D<float4> __3__36__0__0__g_displayRenderingTransformLUT : register(t135, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t29, space36);

RWTexture2D<float4> __3__38__0__1__g_textureUAV : register(u13, space38);

cbuffer __3__35__0__0__ExposureConstantBuffer : register(b31, space35) {
  float4 _exposure0 : packoffset(c000.x);
  float4 _exposure1 : packoffset(c001.x);
  float4 _exposure2 : packoffset(c002.x);
  float4 _exposure3 : packoffset(c003.x);
  float4 _exposure4 : packoffset(c004.x);
};

cbuffer __3__1__0__0__GlobalPushConstants : register(b0, space1) {
  float4 _postProcessParams : packoffset(c000.x);
  float4 _postProcessParams1 : packoffset(c001.x);
  float4 _toneMapParams0 : packoffset(c002.x);
  float4 _toneMapParams1 : packoffset(c003.x);
  float4 _colorGradingParams : packoffset(c004.x);
  float4 _colorCorrectionParams : packoffset(c005.x);
  float4 _localToneMappingParams : packoffset(c006.x);
  float4 _etcParams : packoffset(c007.x);
  float4 _userImageAdjust : packoffset(c008.x);
  float4 _slopeParams : packoffset(c009.x);
  float4 _offsetParams : packoffset(c010.x);
  float4 _powerParams : packoffset(c011.x);
};

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

float3 ConvertAP1ToBT709(float3 scene_ap1) {
  return float3(
    max(0.0f, (((scene_ap1.x * 1.705049991607666f) - (scene_ap1.y * 0.6217899918556213f)) - (scene_ap1.z * 0.08325999975204468f))),
    max(0.0f, (((scene_ap1.y * 1.1407999992370605f) - (scene_ap1.x * 0.13026000559329987f)) - (scene_ap1.z * 0.01054999977350235f))),
    max(0.0f, (((scene_ap1.x * -0.024000000208616257f) - (scene_ap1.y * 0.12896999716758728f)) + (scene_ap1.z * 1.1529699563980103f))));
}

float3 ApplyDisplayCurvesAndSaturation(float3 bt709, bool clamp = true) {
  float3 graded_components = ((bt709) * _slopeParams.xyz) + _offsetParams.xyz;
  if (clamp) {
    graded_components = max(0.0f, graded_components);
  }
  float3 curved = exp2(log2(graded_components) * _powerParams.xyz);
  float display_transform_luminance = dot(curved, float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
  return lerp(display_transform_luminance.xxx, curved, _powerParams.w);
}

float3 EncodeLutInputPQ(float3 linear_saturated) {
  return exp2(log2(linear_saturated * 0.0003509999660309404f) * 0.1593017578125f);
}

float3 EncodeDisplayTransformLutCoordinates(float3 lut_input) {
  return exp2(log2((1.0f / ((lut_input * 18.6875f) + 1.0f)) * ((lut_input * 18.8515625f) + 0.8359375f)) * 78.84375f);
}

[numthreads(8, 8, 1)]
void main(
  uint3 SV_DispatchThreadID : SV_DispatchThreadID,
  uint3 SV_GroupID : SV_GroupID,
  uint3 SV_GroupThreadID : SV_GroupThreadID,
  uint SV_GroupIndex : SV_GroupIndex
) {
  float4 _12 = __3__36__0__0__g_sceneColor.Load(int3((uint)(SV_DispatchThreadID.x), (uint)(SV_DispatchThreadID.y), 0));
  float _21 = _userImageAdjust.z * _exposure0.x;
  _12.xyz *= _21;


  if (RENODX_TONE_MAP_TYPE != 0) {
    float3 ungraded_ap1 = _12.xyz;
    float3 ungraded_bt709 = renodx::color::bt709::from::AP1(ungraded_ap1);
    float3 graded_bt709 = ApplyDisplayCurvesAndSaturation(ungraded_bt709, true);

    float3 input_color = lerp(ungraded_bt709, graded_bt709, RENODX_COLOR_GRADE_STRENGTH);
    float3 output_color = CustomTonemap(input_color);
    #if 1
    output_color = renodx::color::srgb::EncodeSafe(output_color);
#endif
    __3__38__0__1__g_textureUAV[int2((uint)(SV_DispatchThreadID.x), (uint)(SV_DispatchThreadID.y))] = float4(output_color, _12.w);
  } else {
    float3 display_transform_bt709 = ConvertAP1ToBT709(_12.xyz);
    float3 display_saturated = ApplyDisplayCurvesAndSaturation(display_transform_bt709);
    float3 display_transform_lut_input = EncodeLutInputPQ(display_saturated);
    float3 display_transform_lut_uv = EncodeDisplayTransformLutCoordinates(display_transform_lut_input);

    float4 _125 = __3__36__0__0__g_displayRenderingTransformLUT.SampleLevel(__0__4__0__0__g_staticBilinearClamp, display_transform_lut_uv, 0.0f);

    #if 1
    __3__38__0__1__g_textureUAV[int2((uint)(SV_DispatchThreadID.x), (uint)(SV_DispatchThreadID.y))] = float4(select((_125.x <= 0.0031308000907301903f), (_125.x * 12.920000076293945f), (((pow(_125.x, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f)), select((_125.y <= 0.0031308000907301903f), (_125.y * 12.920000076293945f), (((pow(_125.y, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f)), select((_125.z <= 0.0031308000907301903f), (_125.z * 12.920000076293945f), (((pow(_125.z, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f)), _12.w);
    #else
    __3__38__0__1__g_textureUAV[int2((uint)(SV_DispatchThreadID.x), (uint)(SV_DispatchThreadID.y))] = float4(_125.xyz, _12.w);
    #endif
  }
  
}
