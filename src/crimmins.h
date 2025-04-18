#pragma once

#include <stdint.h>

#define SWAP(a, b) do { uint8_t *__tmp = (a); (a) = (b); (b) = __tmp; } while(0);

struct PassDescr {
	int dx, dy;
	uint8_t (*pass_logic_func)(uint8_t, uint8_t, uint8_t);
};

uint8_t light_pass_logic(uint8_t a, uint8_t b, uint8_t c);
uint8_t dark_pass_logic(uint8_t a, uint8_t b, uint8_t c);

void crimmings_speckle_removal_filter(uint8_t *image, uint32_t width, uint32_t height, uint8_t iterations);
void pass_func(uint8_t *image, uint8_t *tmp_image, uint32_t width, uint32_t height, int dx, int dy, uint8_t (*pass_logic_func)(uint8_t, uint8_t, uint8_t));

void crimmings_speckle_removal_filter_par(uint8_t *image, uint32_t width, uint32_t height, uint8_t iterations);
void pass_func_par(uint8_t *image, uint8_t *tmp_image, uint32_t width, uint32_t height, int dx, int dy, uint8_t (*pass_logic_func)(uint8_t, uint8_t, uint8_t), int chunk);

const static struct PassDescr passes[] = {
	{ 1, 0, dark_pass_logic },  // Horizontal (dx, dy) = (1,0)
	{ 0, 1, dark_pass_logic },  // Vertical (dx, dy) = (0,1)
	{ 1, 1, dark_pass_logic },  // Diagonal (dx, dy) = (1,1)
	{ 1, -1, dark_pass_logic }, // Other Diagonal (dx, dy) = (1,-1)

	{ 1, 0, light_pass_logic }, // Horizontal (dx, dy) = (1,0)
	{ 0, 1, light_pass_logic }, // Vertical (dx, dy) = (0,1)
	{ 1, 1, light_pass_logic }, // Diagonal (dx, dy) = (1,1)
	{ 1, -1, light_pass_logic },// Other Diagonal (dx, dy) = (1,-1)
};
