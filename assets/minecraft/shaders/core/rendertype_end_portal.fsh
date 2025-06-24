#version 150

#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:matrix.glsl>
#moj_import <minecraft:globals.glsl>

uniform sampler2D Sampler0;
uniform sampler2D Sampler1;

in vec4 texProj0;
in float sphericalVertexDistance;
in float cylindricalVertexDistance;

out vec4 fragColor;

#moj_import <eg_purple_gateways_remastered:logic/settings.glsl>
#moj_import <eg_purple_gateways_remastered:logic/frag.glsl>

void main() {
    float aspect = ScreenSize.x / ScreenSize.y;
    vec2 texCoord = (gl_FragCoord.xy / ScreenSize) * vec2(aspect, 1);
    fragColor = apply_fog(vec4(drawPortalEffect(texCoord, Sampler1, Sampler0), 1.0), sphericalVertexDistance, cylindricalVertexDistance, FogEnvironmentalStart, FogEnvironmentalEnd, FogRenderDistanceStart, FogRenderDistanceEnd, FogColor);
}
