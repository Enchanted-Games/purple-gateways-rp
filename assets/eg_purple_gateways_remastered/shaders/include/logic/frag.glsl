const mat4 SCALE_TRANSLATE = mat4(
    0.5, 0.0, 0.0, 0.25,
    0.0, 0.5, 0.0, 0.25,
    0.0, 0.0, 1.0, 0.0,
    0.0, 0.0, 0.0, 1.0
);

mat4 end_portal_layer(float layer) {
    mat4 translate = mat4(
        1.0, 0.0, 0.0, 17.0 / layer,
        0.0, 1.0, 0.0, (2.0 + layer / 1.5) * GameTime * SPEED_MULTIPLIER * 3.5,
        0.0, 0.0, 1.0, 0.0,
        0.0, 0.0, 0.0, 1.0
    );

    mat2 rotate = mat2_rotate_z(radians((layer * layer * 4321.0 + layer * 9.0) * 2.0));

    mat2 scale = mat2(
        mix(MIN_STAR_SIZE, MAX_STAR_SIZE, (layer / float(STAR_LAYERS)))
    );

    return mat4(rotate * scale) * translate * SCALE_TRANSLATE;
}

vec3 drawPortalEffect(vec2 texCoord, sampler2D starsTexture, sampler2D baseTexture) {
    // draw grayscale stars
    #if STARS_BLENDING_MODE == 2
    vec4 stars = vec4(texture(baseTexture, texCoord).rgb * COLORS[0], 1.0);
    #else
    vec4 stars = vec4(0.);
    #endif
    for (int i = 0; i < STAR_LAYERS; i++) {
        vec4 star = texture(starsTexture, (vec4(texCoord, 1, 1) * end_portal_layer(i + 1)).xy);

        #if STARS_BLENDING_MODE == 0
            stars = mix(stars, star, star.a);
        #elif STARS_BLENDING_MODE == 1
            stars += star * star.aaaa;
        #elif STARS_BLENDING_MODE == 2
            stars += star * vec4(COLORS[i], 1.0);
        #endif
    }

    #if STARS_BLENDING_MODE == 2
    vec3 gradient = stars.rgb;
    #else
    // apply gradient map
    vec3 gradient = COLORS[0];
    for(int i = 0; i < COLORS.length(); i++){
        float len_f = COLORS.length();

        float _step = (float(i)-0.5)/len_f;
        float _step2 = (float(i)+0.5)/len_f;

        gradient = mix(
            gradient,
            COLORS[i],
            smoothstep(_step, _step2, clamp(stars.r,0.,1.) )
        );
    }
    #endif

    return gradient;
}
