// temporalfilter_0xAF4E3D44: current-frame spatial reconstruction replacing
// the High RTGI_TemporalFilter pass.
// Centre-only: no 3x3 neighbourhood reconstruction and no cross-frame state.
// Shared body in resolve_spatial_raw.hlsli.
#define FH6_SPATIAL_BOTH 1
#include "./resolve_spatial_raw.hlsli"
