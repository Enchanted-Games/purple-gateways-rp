int getFallbackLayers() {
    return PORTAL_LAYERS;
}

#if PORTAL_LAYERS == 15
// end portal settings
#moj_import <eg_purple_gateways_remastered:settings/end_portal.glsl>
#endif

#if PORTAL_LAYERS == 16
// end gateway settings
#moj_import <eg_purple_gateways_remastered:settings/end_gateway.glsl>
#endif

#if !(PORTAL_LAYERS == 16 || PORTAL_LAYERS == 15)
// fallback in case some mod uses this shader with a custom amount of layers or something
#moj_import <eg_purple_gateways_remastered:settings/fallback.glsl>
#endif