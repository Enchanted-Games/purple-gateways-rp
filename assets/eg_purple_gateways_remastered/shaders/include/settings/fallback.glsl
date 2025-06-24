#define MIN_STAR_SIZE 5
#define MAX_STAR_SIZE 0.55

#define SPEED_MULTIPLIER 0.5

// Controls how the star layers are blended together
//   0 - Alpha blending
//     | Colour value of stars overlays previous ones based on transparency
//   1 - Additive blending
//     | Colour value of stars is added to previous ones
//   2 - Vanilla
//     | Draws stars the same was as vanilla each layer on top of the previous
#define STARS_BLENDING_MODE 2

// How many layers of stars to draw
#define STAR_LAYERS getFallbackLayers()

// The colours applied to the image
//   Stars "furthest" from (and the background) you will use colours near the start of the list
//   Stars "closest" to you will use colours near the bottom of the list
// If STARS_BLENDING_MODE is 2, each star layer takes its colour directly from the corresponding
//   index in this array. Otherwise this array is used as a gradient map
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
