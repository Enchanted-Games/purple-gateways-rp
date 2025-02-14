#version 150

uniform sampler2D Sampler0;
uniform sampler2D Sampler1;

uniform float GameTime;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;

in vec4 texProj0;
in float vertexDistance;

#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:matrix.glsl>

#if PORTAL_LAYERS == 15
// end portal stuff
#moj_import <eg_purple_gateways_remastered/end_portal_settings.glsl>
#endif

#if PORTAL_LAYERS == 16
// end gateway stuff
#moj_import <eg_purple_gateways_remastered/end_gateway_settings.glsl>
#endif

#if !(PORTAL_LAYERS == 16 || PORTAL_LAYERS == 15)
// fallback in case some mod uses pipeline with a custom define or something
const vec3[] COLORS = vec3[](
    vec3(0.022087, 0.098399, 0.110818),
    vec3(0.011892, 0.095924, 0.089485),
    vec3(0.027636, 0.101689, 0.100326),
    vec3(0.046564, 0.109883, 0.114838),
    vec3(0.064901, 0.117696, 0.097189),
    vec3(0.063761, 0.086895, 0.123646),
    vec3(0.084817, 0.111994, 0.166380),
    vec3(0.097489, 0.154120, 0.091064),
    vec3(0.106152, 0.131144, 0.195191),
    vec3(0.097721, 0.110188, 0.187229),
    vec3(0.133516, 0.138278, 0.148582),
    vec3(0.070006, 0.243332, 0.235792),
    vec3(0.196766, 0.142899, 0.214696),
    vec3(0.047281, 0.315338, 0.321970),
    vec3(0.204675, 0.390010, 0.302066),
    vec3(0.080955, 0.314821, 0.661491)
);
#endif

vec2 ScreenSize = vec2(1920,1920);
#moj_import <eg_purple_gateways_remastered/logic/portal_variables.glsl>

out vec4 fragColor;

void main() {
    #moj_import <eg_purple_gateways_remastered/logic/portal_main.glsl>
}
