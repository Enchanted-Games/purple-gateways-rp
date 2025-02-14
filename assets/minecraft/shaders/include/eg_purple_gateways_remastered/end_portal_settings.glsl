#define MIN_STAR_SIZE 3
#define MAX_STAR_SIZE 0.7

// Controls how the star layers are blended together
//   0 - Alpha blending
//     | Colour value of stars overlays previous ones based on transparency (similar to blocks like stained glass)
//   1 - Additive blending
//     | Colour value of stars is added to previous ones (vanilla end portal behaviour)
#define STARS_BLENDING_MODE 1

// How many layers of stars to draw
#define STAR_LAYERS 20

// The colours applied to the image
//   Stars "furthest" from (and the background) you will use colours near the start of the list
//   Stars "closest" to you will use colours near the bottom of the list
const vec3[] COLORS = vec3[](
  vec3(0.024, 0.008, 0.039),
  vec3(0.11, 0.078, 0.173),
  vec3(0.176, 0.235, 0.322),
  vec3(0.302, 0.443, 0.525),
  vec3(0.553, 0.784, 0.616),
  vec3(0.757, 0.918, 0.725),
  vec3(0.941, 0.996, 0.914)
);