#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <omp.h>

#include "crimmins.h"
#include "utils.h"


#define ITERATIONS 1


int main(int argc, char *argv[])
{
	// target image/path output/path [width] [height] [num of passes]
	if(argc < 5) {
		fprintf(stderr, "Not enough input arguments given.\n");
		fprintf(stderr, "USAGE: %s path/to/input/image path/to/output/image [width] [height] [optional num of passes]\n", argv[0]);
		return -1;
	}

	const char *input_path = argv[1];
	const char *output_path = argv[2];
	const uint32_t width = atoi(argv[3]);
	const uint32_t height = atoi(argv[4]);
	const uint8_t iterations = (argc >= 6) ? atoi(argv[5]) : ITERATIONS;

	size_t image_s = width * height;

	FILE *infd = fopen(input_path, "rb");
	if(!infd) {
		fprintf(stderr, "Error opening the input image\n");
		return -2;
	}

	uint8_t *image_ser = malloc(image_s);
	uint8_t *image_par = malloc(image_s);
	if(!image_ser || !image_par) {
		fprintf(stderr, "Error allocating image buffer");
		fclose(infd);
		return -3;
	}
	if(fread(image_ser, 1, image_s, infd) != image_s) {
		fprintf(stderr, "Error reading input image\n");
		fclose(infd);
		free(image_ser);
		free(image_par);
		return -4;
	}
	fclose(infd);
	memcpy(image_par, image_ser, image_s);

	printf("Serial algorithm\n");
	double time_ser;
	TIME_FUNC(crimmings_speckle_removal_filter(image_ser, width, height, iterations), time_ser);

	//==========================================
	const char *output_path_ser = modify_filename(output_path, "ser");
	int res = fwriteImage(output_path_ser, image_ser, image_s);
	free((void *)output_path_ser);
	if(res) {
		free(image_ser);
		free(image_par);
		return -1;
	}
	//==========================================

	printf("Parallel algorithm\n");
	double time_par;
	TIME_FUNC(crimmings_speckle_removal_filter_par(image_par, width, height, iterations), time_par);

	//==========================================
	const char *output_path_par = modify_filename(output_path, "par");
	res = fwriteImage(output_path_par, image_par, image_s);
	free((void *)output_path_par);
	if(res) {
		free(image_ser);
		free(image_par);
		return -5;
	}
	//==========================================
	printf("Speedup: %.4f\n", (time_ser/time_par));


	printf("\nValidating ser with par\n");
	image_validator(image_ser, image_par, width, height);

	free(image_ser);
	free(image_par);
	printf("Filtering complete!!!\n");

	return 0;
}
