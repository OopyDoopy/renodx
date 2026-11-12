// temporalfilter_0x95FA8898: current-frame spatial reconstruction replacing
// the Medium RTGI_TemporalFilter_Neighborhood_Search pass.
// Centre-only: no 3x3 neighbourhood reconstruction and no cross-frame state.
// Shared body in resolve_spatial_raw.hlsli.
#define FH6_SPATIAL_BOTH 1
#include "./resolve_spatial_raw.hlsli"
