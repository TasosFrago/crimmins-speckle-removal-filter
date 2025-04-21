#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <assert.h>

const char* modify_filename(const char* path, const char* suffix)
{
	const char* ext = strrchr(path, '.'); // Find last dot
	if (!ext || strcmp(ext, ".raw") != 0) {
		// Invalid or missing .raw extension
		fprintf(stderr, "Invalid or missing .raw extension\n");
		return NULL;
	}

	size_t path_len = ext - path; // Length up to ".raw"
	size_t suffix_len = strlen(suffix);
	size_t new_len = path_len + 1 + suffix_len + 4 + 1; // base + "_" + suffix + ".raw" + '\0'

	char* new_path = malloc(new_len);
	if (!new_path) return NULL;

	strncpy(new_path, path, path_len);
	new_path[path_len] = '\0';
	sprintf(new_path + path_len, "_%s.raw", suffix);

	return new_path;
}

void image_validator(uint8_t *image1, uint8_t *image2, uint32_t width, uint32_t height)
{
	int error_cnt = 0;
	int idx = 0;
	FILE *resf = fopen("out.log", "w");
	assert(resf != NULL);
	int sum = 0;

	#pragma omp parallel for private(idx)
	for(int y = 0; y < height; y++) {
		for(int x = 0; x < width; x++) {
			idx = y * width + x;
			if(image1[idx] != image2[idx]) {
				#pragma omp critical
				{
					error_cnt++;
					sum += abs(image1[idx] - image2[idx]);
					fprintf(resf ,"Error on pixel (%d,\t%d),\t with %d\n", x, y, (image1[idx] - image2[idx]));
				}
			}
		}
	}
	fclose(resf);

	double avg_err = (sum != 0) ? (float)sum / error_cnt : 0;
	printf("Error cnt = %d / %d,\t avg_err  = %.4f\n", error_cnt, width * height, avg_err);
}

int fwriteImage(const char *output_path, uint8_t *image, uint32_t image_size)
{
	assert(output_path != NULL && "Incorect output file");
	FILE *outfd = fopen(output_path, "wb");
	if(!outfd) {
		fprintf(stderr, "Error writing output file %s.\n", output_path);
		return -1;
	}
	fwrite(image, 1, image_size, outfd);
	fclose(outfd);
	return 0;
}
