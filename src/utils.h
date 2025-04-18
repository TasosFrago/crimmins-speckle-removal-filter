#pragma once

#include <stdint.h>
#include <omp.h>

#define TIME_FUNC(func, time) \
	do { \
		time = omp_get_wtime(); \
		(func); \
		time = omp_get_wtime() - time; \
		printf("Time taken: %lfs\n", time); \
	} while(0) 

const char* modify_filename(const char* path, const char* suffix);
void image_validator(uint8_t *image1, uint8_t *image2, uint32_t width, uint32_t height);
int fwriteImage(const char *output_path, uint8_t *image, uint32_t image_size);
