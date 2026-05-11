#include "../tonemap.hlsli"

struct PostProcessTransition_CDStruct {
  uint _chapterNoiseTex;
  uint _chapterCardTex;
  uint _lensDirtTex;
  float _chapterTransition;
  uint _sceneTintColor;
  uint _chapterCardColor;
  uint _chapterBackgroundColor;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t36, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t29, space36);

cbuffer __3__35__0__0__SceneConstantBuffer : register(b16, space35) {
  uint4 __3__35__0__0__SceneConstantBuffer_raw[172];
};

#if 0 // Provided by tonemap.hlsli
cbuffer __3__35__0__0__ExposureConstantBuffer : register(b31, space35) {
  float4 _exposure0 : packoffset(c000.x);
  float4 _exposure1 : packoffset(c001.x);
  float4 _exposure2 : packoffset(c002.x);
  float4 _exposure3 : packoffset(c003.x);
  float4 _exposure4 : packoffset(c004.x);
};
#endif

#if 0 // Provided by tonemap.hlsli
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
  int _colorBlindParam : packoffset(c012.x);
  int _nightToneParm : packoffset(c012.y);
  int2 _padding : packoffset(c012.z);
};
#endif

cbuffer __3__1__0__0__PostProcessMaterialIndex : register(b2, space1) {
  int _materialIndex : packoffset(c000.x);
  int _passIndex : packoffset(c000.y);
};

struct BindlessParameters_PostProcessTransition_CD {
  PostProcessTransition_CDStruct BindlessParameters_PostProcessTransition_CD;
};

typedef BindlessParameters_PostProcessTransition_CD BindlessParameters_PostProcessTransition_CD_t;
ConstantBuffer<BindlessParameters_PostProcessTransition_CD_t> BindlessParameters_PostProcessTransition_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _24;
  float4 _27;
  int _31;
  float _39;
  bool _40;
  float _41;
  float _43;
  float _142;
  float _215;
  float _288;
  float _535;
  float _618;
  float _857;
  float _858;
  float _859;
  float _924;
  float _925;
  float _926;
  float _940;
  float _1145;
  float _1146;
  float _1147;
  float _1240;
  float _1241;
  float _1242;
  float _1362;
  float _1363;
  float _1364;
  float _1385;
  float _1386;
  float _1387;
  float _1420;
  float _1421;
  float _1422;
  float _1436;
  float _1437;
  float _1438;
  float _46;
  int _54;
  int _62;
  float4 _69;
  float _73;
  float _75;
  float _77;
  float _78;
  float _80;
  float _84;
  float _85;
  float _87;
  float _88;
  float _89;
  float _90;
  float _91;
  float _101;
  float _102;
  float _103;
  float _113;
  float _114;
  float _117;
  float _129;
  float _130;
  float _151;
  float _152;
  float _153;
  float _155;
  float _157;
  float _161;
  float _162;
  float _163;
  float _164;
  float _174;
  float _175;
  float _176;
  float _186;
  float _187;
  float _190;
  float _202;
  float _203;
  float _224;
  float _225;
  float _226;
  float _228;
  float _230;
  float _234;
  float _235;
  float _236;
  float _237;
  float _247;
  float _248;
  float _249;
  float _259;
  float _260;
  float _263;
  float _275;
  float _276;
  float _297;
  float _298;
  float _299;
  int _300;
  int _308;
  float _311;
  float _314;
  float _316;
  float _341;
  float _342;
  float _343;
  int _344;
  int _352;
  float _355;
  float _358;
  float _360;
  float _385;
  float _386;
  float _387;
  int _388;
  int _396;
  float _399;
  float _402;
  float _404;
  float _429;
  float _430;
  float _431;
  float4 _436;
  float _453;
  float _462;
  float _470;
  float _472;
  float _473;
  float _474;
  float _484;
  float _485;
  float _486;
  float _495;
  float _496;
  float _503;
  bool _505;
  float _508;
  float _522;
  float _523;
  float _544;
  float _545;
  float _548;
  float _552;
  float _553;
  float _554;
  float _556;
  float _557;
  float _567;
  float _568;
  float _569;
  float _578;
  float _579;
  float _586;
  bool _588;
  float _591;
  float _605;
  float _606;
  float _627;
  float _628;
  float _631;
  float _639;
  float _646;
  float _647;
  float _648;
  float _649;
  float _652;
  float _656;
  float _663;
  float _667;
  float _668;
  float _669;
  float _672;
  float _675;
  float _679;
  float _680;
  float _682;
  float _683;
  float _692;
  float _693;
  float _696;
  float _702;
  float _703;
  float _705;
  float _706;
  float _708;
  float _711;
  int _714;
  int _722;
  float4 _729;
  int _731;
  int _739;
  float _748;
  float _749;
  float _755;
  float _760;
  float _774;
  float _776;
  float _783;
  float _784;
  float _785;
  float _786;
  float _796;
  float _798;
  int _802;
  int _810;
  float4 _817;
  float _830;
  float _837;
  float _852;
  float _875;
  float _876;
  float _877;
  float _878;
  float _891;
  float _892;
  float _893;
  float _894;
  float _898;
  float _908;
  float _909;
  float _910;
  float _913;
  uint _927;
  float _949;
  float _998;
  float _999;
  float _1000;
  float _1002;
  float _1009;
  float _1010;
  float _1011;
  float _1030;
  float _1031;
  float _1032;
  float _1033;
  float _1034;
  float _1035;
  float _1036;
  float _1037;
  float _1038;
  float _1084;
  float _1085;
  float _1086;
  float _1087;
  float _1088;
  float _1089;
  float _1090;
  float _1107;
  float _1108;
  float _1109;
  float _1110;
  float _1116;
  float _1119;
  float _1126;
  float _1127;
  float _1128;
  float _1157;
  float _1182;
  float _1183;
  float _1184;
  float _1203;
  float _1204;
  float _1205;
  float _1211;
  float _1215;
  float _1216;
  float _1217;
  float _1218;
  float _1223;
  float _1248;
  float _1252;
  float _1253;
  float _1254;
  float _1255;
  int _1296;
  float _1351;
  float _1375;
  float _1376;
  float _1380;
  float _1427;
  float _18[36];
  _24 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].x) / asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y);
  _27 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _31 = WaveReadLaneFirst(_materialIndex);
  _39 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_31 < (uint)170000), _31, 0)) + 0u))].BindlessParameters_PostProcessTransition_CD._chapterTransition);
  _40 = (_39 > 0.5f);
  _41 = _39 * 2.0f;
  _43 = select(_40, (2.0f - _41), _41);
  if (_43 > 0.0f) {
    _46 = _24 * TEXCOORD.x;
    _54 = WaveReadLaneFirst(_materialIndex);
    _62 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_54 < (uint)170000), _54, 0)) + 0u))].BindlessParameters_PostProcessTransition_CD._chapterNoiseTex);
    _69 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_62 < (uint)65000), _62, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((_46 * 4.0f) - ((_43 * TEXCOORD.x) * rsqrt(TEXCOORD.x * TEXCOORD.x))), (TEXCOORD.y * 4.0f)));
    _73 = (_69.x * 0.009999999776482582f) + -0.004980391822755337f;
    _75 = (_69.y * 0.009999999776482582f) + -0.004980391822755337f;
    _77 = (_69.y * 0.03999999910593033f) + -0.019921567291021347f;
    _78 = saturate(_43);
    _80 = saturate(_78 * 2.0f);
    _84 = TEXCOORD.x + -0.5f;
    _85 = select(_40, -1.0f, 1.0f) + _84;
    _87 = TEXCOORD.y + -0.5f;
    _88 = (_73 * _80) + _87;
    _89 = ((_77 * _80) + _85) * _24;
    _90 = _89 * 32.0f;
    _91 = _88 * 32.0f;
    _101 = frac(sin(dot(float2((ceil(_90 + 0.5f) * 0.125f), (ceil(_91 + 0.5f) * 0.125f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.546875f);
    _102 = round(_90);
    _103 = round(_91);
    _113 = saturate(((0.25f - (_78 * 3.0f)) + (sqrt((_103 * _103) + (_102 * _102)) * 0.03125f)) * 0.800000011920929f);
    _114 = 1.0f - _113;
    if (!(_114 < 0.0010000000474974513f)) {
      _117 = _114 * -9.6875f;
      _129 = _113 * 0.1666666716337204f;
      _130 = _114 * 0.3125f;
      _142 = float((bool)((uint)((abs((_130 * ((_89 * (_117 + 32.0f)) - _102)) * (1.0f - frac(_101 * 7.0f))) < _129) && (abs((_130 * ((_88 * (_117 + 32.0f)) - _103)) * frac(_101 * 3.0f)) < _129))));
    } else {
      _142 = 1.0f;
    }
    _151 = saturate(1.0f - abs((saturate(_114 - ((_101 + -0.5f) * 0.125f)) * 3.0f) + -2.0f));
    _152 = _151 * _151;
    _153 = _152 * _152;
    _155 = saturate(_43 + -0.0833333358168602f);
    _157 = saturate(_155 * 2.0f);
    _161 = (_157 * _73) + _87;
    _162 = ((_157 * _77) + _85) * _24;
    _163 = _162 * 16.0f;
    _164 = _161 * 16.0f;
    _174 = frac(sin(dot(float2((ceil(_163 + 0.5f) * 0.25f), (ceil(_164 + 0.5f) * 0.25f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.546875f);
    _175 = round(_163);
    _176 = round(_164);
    _186 = saturate(((0.25f - (_155 * 3.0f)) + (sqrt((_176 * _176) + (_175 * _175)) * 0.0625f)) * 0.800000011920929f);
    _187 = 1.0f - _186;
    if (!(_187 < 0.0010000000474974513f)) {
      _190 = _187 * -4.6875f;
      _202 = _186 * 0.1666666716337204f;
      _203 = _187 * 0.3125f;
      _215 = float((bool)((uint)((abs((_203 * ((_162 * (_190 + 16.0f)) - _175)) * (1.0f - frac(_174 * 7.0f))) < _202) && (abs((_203 * ((_161 * (_190 + 16.0f)) - _176)) * frac(_174 * 3.0f)) < _202))));
    } else {
      _215 = 1.0f;
    }
    _224 = saturate(1.0f - abs((saturate(_187 - ((_174 + -0.5f) * 0.125f)) * 3.0f) + -2.0f));
    _225 = _224 * _224;
    _226 = _225 * _225;
    _228 = saturate(_43 + -0.1666666716337204f);
    _230 = saturate(_228 * 2.0f);
    _234 = (_230 * _73) + _87;
    _235 = ((_230 * _77) + _85) * _24;
    _236 = _235 * 10.666666984558105f;
    _237 = _234 * 10.666666984558105f;
    _247 = frac(sin(dot(float2((ceil(_236 + 0.5f) * 0.375f), (ceil(_237 + 0.5f) * 0.375f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.546875f);
    _248 = round(_236);
    _249 = round(_237);
    _259 = saturate(((0.25f - (_228 * 3.0f)) + (sqrt((_249 * _249) + (_248 * _248)) * 0.09375f)) * 0.800000011920929f);
    _260 = 1.0f - _259;
    if (!(_260 < 0.0010000000474974513f)) {
      _263 = _260 * -3.0208334922790527f;
      _275 = _259 * 0.1666666716337204f;
      _276 = _260 * 0.3125f;
      _288 = float((bool)((uint)((abs((_276 * ((_235 * (_263 + 10.666666984558105f)) - _248)) * (1.0f - frac(_247 * 7.0f))) < _275) && (abs((_276 * ((_234 * (_263 + 10.666666984558105f)) - _249)) * frac(_247 * 3.0f)) < _275))));
    } else {
      _288 = 1.0f;
    }
    _297 = saturate(1.0f - abs((saturate(_260 - ((_247 + -0.5f) * 0.125f)) * 3.0f) + -2.0f));
    _298 = _297 * _297;
    _299 = _298 * _298;
    _300 = WaveReadLaneFirst(_materialIndex);
    _308 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_300 < (uint)170000), _300, 0)) + 0u))].BindlessParameters_PostProcessTransition_CD._chapterBackgroundColor);
    _311 = float((uint)((uint)(((uint)(_308) >> 16) & 255)));
    _314 = float((uint)((uint)(((uint)(_308) >> 8) & 255)));
    _316 = float((uint)((uint)(_308 & 255)));
    _341 = select(((_311 * 0.003921568859368563f) < 0.040449999272823334f), (_311 * 0.0003035269910469651f), exp2(log2((_311 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _342 = select(((_314 * 0.003921568859368563f) < 0.040449999272823334f), (_314 * 0.0003035269910469651f), exp2(log2((_314 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _343 = select(((_316 * 0.003921568859368563f) < 0.040449999272823334f), (_316 * 0.0003035269910469651f), exp2(log2((_316 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _344 = WaveReadLaneFirst(_materialIndex);
    _352 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_344 < (uint)170000), _344, 0)) + 0u))].BindlessParameters_PostProcessTransition_CD._chapterCardColor);
    _355 = float((uint)((uint)(((uint)(_352) >> 16) & 255)));
    _358 = float((uint)((uint)(((uint)(_352) >> 8) & 255)));
    _360 = float((uint)((uint)(_352 & 255)));
    _385 = select(((_355 * 0.003921568859368563f) < 0.040449999272823334f), (_355 * 0.0003035269910469651f), exp2(log2((_355 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _386 = select(((_358 * 0.003921568859368563f) < 0.040449999272823334f), (_358 * 0.0003035269910469651f), exp2(log2((_358 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _387 = select(((_360 * 0.003921568859368563f) < 0.040449999272823334f), (_360 * 0.0003035269910469651f), exp2(log2((_360 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _388 = WaveReadLaneFirst(_materialIndex);
    _396 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_388 < (uint)170000), _388, 0)) + 0u))].BindlessParameters_PostProcessTransition_CD._sceneTintColor);
    _399 = float((uint)((uint)(((uint)(_396) >> 16) & 255)));
    _402 = float((uint)((uint)(((uint)(_396) >> 8) & 255)));
    _404 = float((uint)((uint)(_396 & 255)));
    _429 = select(((_399 * 0.003921568859368563f) < 0.040449999272823334f), (_399 * 0.0003035269910469651f), exp2(log2((_399 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _430 = select(((_402 * 0.003921568859368563f) < 0.040449999272823334f), (_402 * 0.0003035269910469651f), exp2(log2((_402 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _431 = select(((_404 * 0.003921568859368563f) < 0.040449999272823334f), (_404 * 0.0003035269910469651f), exp2(log2((_404 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _436 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_73 + TEXCOORD.x), (_75 + TEXCOORD.y)));
    _453 = saturate(_43 * 4.0f);
    if (_43 > 0.20000000298023224f) {
      _462 = _24 * _84;
      _470 = ((((0.5f - TEXCOORD.y) + _462) * 0.7071067690849304f) + _77) + _73;
      _472 = (((_462 + _87) * 0.7071067690849304f) + _73) + _75;
      _473 = _470 * 16.0f;
      _474 = _472 * 16.0f;
      _484 = frac(sin(dot(float2((ceil(_473 + 0.5f) * 0.25f), (ceil(_474 + 0.5f) * 0.25f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.546875f);
      _485 = round(_473);
      _486 = round(_474);
      _495 = saturate(((0.800000011920929f - (_43 * 0.800000011920929f)) + (sqrt((_486 * _486) + (_485 * _485)) * 0.0625f)) * 1.25f);
      _496 = 1.0f - _495;
      if (!(_496 < 0.0010000000474974513f)) {
        _503 = sin((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * _484) + 0.800000011920929f);
        _505 = (frac(_484) > 0.5f);
        _508 = _496 * -3.0f;
        _522 = _495 * 0.1666666716337204f;
        _523 = _496 * 0.20000000298023224f;
        _535 = float((bool)((uint)((abs(((1.0f - frac(_484 * 7.0f)) * _523) * (((_470 * (_508 + 16.0f)) - _485) + select(_505, _503, 0.0f))) < _522) && (abs((frac(_484 * 3.0f) * _523) * (((_472 * (_508 + 16.0f)) - _486) + select(_505, 0.0f, _503))) < _522))));
      } else {
        _535 = 1.0f;
      }
      _544 = saturate(1.0f - abs((saturate(_496 - ((_484 + -0.5f) * 0.125f)) * 3.0f) + -2.0f));
      _545 = _544 * _544;
      _548 = (_535 * 0.2999999523162842f) * (_545 * _545);
      _552 = (_548 * _341) + _341;
      _553 = (_548 * _342) + _342;
      _554 = (_548 * _343) + _343;
      _556 = _470 * 8.0f;
      _557 = _472 * 8.0f;
      _567 = frac(sin(dot(float2((ceil(_556 + 0.5f) * 0.5f), (ceil(_557 + 0.5f) * 0.5f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.546875f);
      _568 = round(_556);
      _569 = round(_557);
      _578 = saturate(((1.25f - (_43 * 1.4249999523162842f)) + (sqrt((_569 * _569) + (_568 * _568)) * 0.125f)) * 0.800000011920929f);
      _579 = 1.0f - _578;
      if (!(_579 < 0.0010000000474974513f)) {
        _586 = sin((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * _567) + 1.25f);
        _588 = (frac(_567) > 0.5f);
        _591 = _579 * -2.1875f;
        _605 = _578 * 0.1666666716337204f;
        _606 = _579 * 0.3125f;
        _618 = float((bool)((uint)((abs(((1.0f - frac(_567 * 7.0f)) * _606) * (((_470 * (_591 + 8.0f)) - _568) + select(_588, _586, 0.0f))) < _605) && (abs((frac(_567 * 3.0f) * _606) * (((_472 * (_591 + 8.0f)) - _569) + select(_588, 0.0f, _586))) < _605))));
      } else {
        _618 = 1.0f;
      }
      _627 = saturate(1.0f - abs((saturate(_579 - ((_567 + -0.5f) * 0.125f)) * 3.0f) + -2.0f));
      _628 = _627 * _627;
      _631 = (_618 * 0.6000000238418579f) * (_628 * _628);
      _639 = _87 * _87;
      _646 = 1.0f - (exp2(log2(sqrt((_462 * _462) + _639)) * 1.5f) * 0.75f);
      _647 = ((_631 * _552) + _552) * _646;
      _648 = ((_631 * _553) + _553) * _646;
      _649 = ((_631 * _554) + _554) * _646;
      _652 = saturate((_43 + -0.5f) * 2.0f);
      _656 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.015707964077591896f) + 0.7853981852531433f;
      _663 = saturate((exp2(log2(1.0f - _652) * 2.5f) + -0.05000000074505806f) * 1.1111111640930176f);
      _667 = (_663 * _663) * (3.0f - (_663 * 2.0f));
      _668 = _667 * 0.5f;
      _669 = 1.0f - _668;
      _672 = _667 * -0.25f;
      _675 = (_24 + -1.0f) * 0.5f;
      _679 = ((-0.5f - _672) + (_669 * _46)) - (_669 * _675);
      _680 = cos(_656);
      _682 = ((_669 * TEXCOORD.y) - _672) + -0.5f;
      _683 = sin(_656);
      _692 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.03141592815518379f) + 1.5707963705062866f;
      _693 = 0.6000000238418579f - _668;
      _696 = _667 * 0.25f;
      _702 = ((_696 + -0.30000001192092896f) + (_693 * _46)) - (_693 * _675);
      _703 = cos(_692);
      _705 = ((_693 * TEXCOORD.y) - (-0.20000000298023224f - _696)) + -0.5f;
      _706 = sin(_692);
      _708 = (_702 * _703) - (_705 * _706);
      _711 = (_702 * _706) + (_705 * _703);
      _714 = WaveReadLaneFirst(_materialIndex);
      _722 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_714 < (uint)170000), _714, 0)) + 0u))].BindlessParameters_PostProcessTransition_CD._chapterCardTex);
      _729 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_722 < (uint)65000), _722, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(((0.5f - (_682 * _683)) + (_679 * _680)), (((_682 * _680) + 0.5f) + (_679 * _683))));
      _731 = WaveReadLaneFirst(_materialIndex);
      _739 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_731 < (uint)170000), _731, 0)) + 0u))].BindlessParameters_PostProcessTransition_CD._chapterCardTex);
      _748 = abs(_708);
      _749 = _748 * 120.0f;
      _755 = abs(_711);
      _760 = _755 * 120.0f;
      _774 = saturate((saturate(((saturate(_760 + -56.0f) * saturate(60.0f - _760)) * saturate(10.0f - (_748 * 20.0f))) + ((saturate(_749 + -54.0f) * saturate(58.0f - _749)) * saturate(10.0f - (_755 * 20.0f)))) * 0.5f) + (((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_739 < (uint)65000), _739, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2((_708 + 0.5f), (_711 + 0.5f))))).x));
      _776 = (_729.x * _729.x) * _652;
      _783 = (_776 * (_385 - _647)) + _647;
      _784 = (_776 * (_386 - _648)) + _648;
      _785 = (_776 * (_387 - _649)) + _649;
      _786 = _774 * _652;
      _796 = abs(_84);
      _798 = 1.0f - (_796 * 0.800000011920929f);
      _802 = WaveReadLaneFirst(_materialIndex);
      _810 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_802 < (uint)170000), _802, 0)) + 0u))].BindlessParameters_PostProcessTransition_CD._lensDirtTex);
      _817 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_810 < (uint)65000), _810, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_46, TEXCOORD.y));
      _830 = saturate(_796 * 2.0f) * exp2(log2(saturate(sqrt(_639 + (_84 * _84)))) * 6.0f);
      _837 = saturate(((_618 + _535) + _729.x) + _774);
      _852 = max(0.0010000000474974513f, _exposure0.x);
      _857 = ((((((((_786 * (_385 - _783)) + _783) * _798) - _341) + (_830 * _817.x)) * _837) + _341) / _852);
      _858 = ((((((((_786 * (_386 - _784)) + _784) * _798) - _342) + (_830 * _817.y)) * _837) + _342) / _852);
      _859 = ((((((((_786 * (_387 - _785)) + _785) * _798) - _343) + (_830 * _817.z)) * _837) + _343) / _852);
    } else {
      _857 = _341;
      _858 = _342;
      _859 = _343;
    }
    _875 = 1.0f - ((_299 * _299) * (_288 * 0.5f));
    _876 = ((((_436.x * _429) - _857) * _288) + _857) * _875;
    _877 = ((((_436.y * _430) - _858) * _288) + _858) * _875;
    _878 = ((((_436.z * _431) - _859) * _288) + _859) * _875;
    _891 = 1.0f - ((_226 * _226) * (_215 * 0.5f));
    _892 = ((((_436.x * (((_429 + -1.0f) * 0.5f) + 1.0f)) - _876) * _215) + _876) * _891;
    _893 = ((((_436.y * (((_430 + -1.0f) * 0.5f) + 1.0f)) - _877) * _215) + _877) * _891;
    _894 = ((((_436.z * (((_431 + -1.0f) * 0.5f) + 1.0f)) - _878) * _215) + _878) * _891;
    _898 = 1.0f - ((_153 * _153) * (_142 * 0.5f));
    _908 = (((((_453 * _27.x) + _27.x) * _898) - _892) * _142) + _892;
    _909 = (((((_453 * _27.y) + _27.y) * _898) - _893) * _142) + _893;
    _910 = (((((_453 * _27.z) + _27.z) * _898) - _894) * _142) + _894;
    _913 = saturate((_43 * 15.0f) + -14.0f);
    _924 = (lerp(_908, _857, _913));
    _925 = (lerp(_909, _858, _913));
    _926 = (lerp(_910, _859, _913));
  } else {
    _924 = _27.x;
    _925 = _27.y;
    _926 = _27.z;
  }
  _927 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _940 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _927, 0)))).x) & 127))) + 0.5f);
  } else {
    _940 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_924, _925, _926));
    _1362 = output_color.x;
    _1363 = output_color.y;
    _1364 = output_color.z;
  } else {
    _1362 = _924;
    _1363 = _925;
    _1364 = _926;
  }
  if (_etcParams.y > 1.0f) {
    _1375 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _1376 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _1380 = saturate(1.0f - (dot(float2(_1375, _1376), float2(_1375, _1376)) * saturate(_etcParams.y + -1.0f)));
    _1385 = (_1380 * _1362);
    _1386 = (_1380 * _1363);
    _1387 = (_1380 * _1364);
  } else {
    _1385 = _1362;
    _1386 = _1363;
    _1387 = _1364;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _1420 = select((_1385 <= 0.0031308000907301903f), (_1385 * 12.920000076293945f), (((pow(_1385, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1421 = select((_1386 <= 0.0031308000907301903f), (_1386 * 12.920000076293945f), (((pow(_1386, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1422 = select((_1387 <= 0.0031308000907301903f), (_1387 * 12.920000076293945f), (((pow(_1387, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1420 = _1385;
    _1421 = _1386;
    _1422 = _1387;
  }
  if (!(_etcParams.y < 1.0f)) {
    _1427 = float((uint)_927);
    if (!(_1427 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_1427 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _1436 = _1420;
        _1437 = _1421;
        _1438 = _1422;
      } else {
        _1436 = 0.0f;
        _1437 = 0.0f;
        _1438 = 0.0f;
      }
    } else {
      _1436 = 0.0f;
      _1437 = 0.0f;
      _1438 = 0.0f;
    }
  } else {
    _1436 = _1420;
    _1437 = _1421;
    _1438 = _1422;
  }
  SV_Target.x = _1436;
  SV_Target.y = _1437;
  SV_Target.z = _1438;
  SV_Target.w = _940;
  return SV_Target;
}