#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <assert.h>
#include <omp.h>
#include <sys/types.h>

#include "crimmins.h"

uint8_t dark_pass_logic(uint8_t a, uint8_t b, uint8_t c)
{
	if(a >= b + 2) b++;
	if(a > b && b <= c) b++;
	if(c > b && b <= a) b++;
	if(c >= b + 2) b++;
	return b;
}

uint8_t light_pass_logic(uint8_t a, uint8_t b, uint8_t c)
{
	if(a <= b - 2) b--;
	if(a < b && b >= c) b--;
	if(c < b && b >= a) b--;
	if(c <= b - 2) b--;
	return b;
}


// Serial Implementation

void pass_func(uint8_t *image, uint8_t *tmp_image, uint32_t width, uint32_t height, int dx, int dy, uint8_t (*pass_logic_func)(uint8_t, uint8_t, uint8_t))
{
	for(int y = 1; y < height - 1; y++) {
		uint8_t *row_a = tmp_image + (y-dy) * width;
		uint8_t *row_b = tmp_image + y * width;
		uint8_t *row_c = tmp_image + (y+dy) * width;
		uint8_t *row_out = image + y * width;

		for(int x = 1; x < width - 1; x++) {
			uint8_t a = row_a[x-dx];
			uint8_t b = row_b[x];
			uint8_t c = row_c[x+dx];

			b = pass_logic_func(a, b, c);

			row_out[x] = (b < 0) ? 0 :
				(b > 255) ? 255 :
				b;
		}
	}
}

void crimmings_speckle_removal_filter(uint8_t *image, uint32_t width, uint32_t height, uint8_t iterations)
{
	uint8_t *tmp_image = malloc(width * height);
	assert(tmp_image != NULL && "Failed allocating temp image buffer");

	memcpy(tmp_image, image, width * height);
	for(int i = 0; i < iterations; i++) {

		for(int p = 0; p < 8; p++) {
			pass_func(image, tmp_image, width, height, passes[p].dx, passes[p].dy, passes[p].pass_logic_func);
			SWAP(image, tmp_image);
		}
	}
	free(tmp_image);
}


// Parallel implementation

void pass_func_par(uint8_t *image, uint8_t *tmp_image, uint32_t width, uint32_t height, int dx, int dy, uint8_t (*pass_logic_func)(uint8_t, uint8_t, uint8_t), int chunk)
{
	#pragma omp parallel for schedule(static, chunk)
	for(int y = 1; y < height - 1; y++) {
		uint8_t *row_a = tmp_image + (y-dy) * width;
		uint8_t *row_b = tmp_image + y * width;
		uint8_t *row_c = tmp_image + (y+dy) * width;
		uint8_t *row_out = image + y * width;

		for(int x = 1; x < width - 1; x++) {
			// uint8_t a = tmp_image[(y-dy) * width + (x-dx)];
			// uint8_t b = tmp_image[y * width + x]; // middle
			// uint8_t c = tmp_image[(y+dy) * width + (x+dx)];
			uint8_t a = row_a[x-dx];
			uint8_t b = row_b[x];
			uint8_t c = row_c[x+dx];

			b = pass_logic_func(a, b, c);

			row_out[x] = (b < 0) ? 0 :
				(b > 255) ? 255 :
				b;
		}
	}
}

void crimmings_speckle_removal_filter_par(uint8_t *image, uint32_t width, uint32_t height, uint8_t iterations)
{
	uint8_t *tmp_image = malloc(width * height);
	assert(tmp_image != NULL && "Failed allocating temp image buffer");
	const int chunk = height / omp_get_max_threads();
	printf("Num of threads: %d,\t", omp_get_max_threads());
	// const int chunk = 8;
	printf("Chunk = %d\n", chunk);

	memcpy(tmp_image, image, width * height);
	for(int i = 0; i < iterations; i++) {
		for(int p = 0; p < 8; p++) {
			pass_func_par(image, tmp_image, width, height, passes[p].dx, passes[p].dy, passes[p].pass_logic_func, chunk);
			SWAP(image, tmp_image);
		}
	}
	free(tmp_image);
}
