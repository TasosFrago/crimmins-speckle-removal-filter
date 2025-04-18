#include <stdlib.h>
#include <stdint.h>
#include <assert.h>
#include <string.h>

#include "crimmins.h"


void pass_f_opt(uint8_t *image, uint8_t *tmp_image, uint32_t width, uint32_t height, uint8_t (*logic_f)(uint8_t, uint8_t, uint8_t))
{
	// y * width + x
	for(int y = 1; y < height - 1; y++) {
		for(int x = 1; x < width - 1; x++) {
			uint8_t a = tmp_image[(y-1) * width + (x-1)];
			uint8_t b = tmp_image[(y-1) * width + x];
			uint8_t c = tmp_image[(y-1) * width + (x+1)];

			uint8_t d = tmp_image[y * width + (x-1)];
			uint8_t e = tmp_image[y * width + x];
			uint8_t f = tmp_image[y * width + (x+1)];

			uint8_t g = tmp_image[(y+1) * width + (x-1)];
			uint8_t h = tmp_image[(y+1) * width + x];
			uint8_t i = tmp_image[(y+1) * width + (x+1)];

			e = logic_f(b, e, h); // NS
			e = logic_f(d, e, f); // EW
			e = logic_f(a, e, i); // NW-SE
			e = logic_f(c, e, g); // NW-SE

			image[y * width + x] = (e < 0) ? 0 :
					       (e > 255) ? 255 :
						e;
		}
	}
}

void crimmins_speckle_opt(uint8_t *image, uint32_t width, uint32_t height, int iterations)
{
	uint8_t *tmp_image = malloc(width * height);
	assert(tmp_image != NULL && "Failed to allocate tmp image buffer");
	memcpy(tmp_image, image, width * height);

	for(int iter = 0; iter < iterations; iter++) {
		pass_f_opt(image, tmp_image, width, height, light_pass_logic);
		memcpy(tmp_image, image, width * height);
		// SWAP(image, tmp_image);
		
		pass_f_opt(image, tmp_image, width, height, dark_pass_logic);
		memcpy(tmp_image, image, width * height);
		// SWAP(image, tmp_image);
	}

	free(tmp_image);
}
