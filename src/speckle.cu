#include <assert.h>
#include <cuda_runtime.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define CHECK_CUDA(call)                                                       \
  do {                                                                         \
    cudaError_t err = (call);                                                  \
    if (err != cudaSuccess) {                                                  \
      fprintf(stderr, "CUDA error %s:%d: %s\n", __FILE__, __LINE__,            \
              cudaGetErrorString(err));                                        \
      exit(EXIT_FAILURE);                                                      \
    }                                                                          \
  } while (0)

#define TIME_FUNC(func, time)                                                  \
  do {                                                                         \
    time = clock();                                                            \
    (func);                                                                    \
    time = (clock() - time) / CLOCKS_PER_SEC;                                  \
    printf("Time taken: %lfs\n", time);                                        \
  } while (0)

#define TIME_FUNC3(func, time, res)                                            \
  do {                                                                         \
    time = clock();                                                            \
    res = (func);                                                              \
    time = (clock() - time) / CLOCKS_PER_SEC;                                  \
    printf("Time taken: %lfs\n", time);                                        \
  } while (0)

#define SWAP(a, b)                                                             \
  do {                                                                         \
    uint8_t *__tmp = (a);                                                      \
    (a) = (b);                                                                 \
    (b) = __tmp;                                                               \
  } while (0);

#define ITERATIONS 1

uint8_t dark_pass_logic(uint8_t a, uint8_t b, uint8_t c);
uint8_t light_pass_logic(uint8_t a, uint8_t b, uint8_t c);

struct PassDescr {
  int dx, dy;
  uint8_t (*pass_logic_func)(uint8_t, uint8_t, uint8_t);
};

const static struct PassDescr passes[] = {
    {1, 0, dark_pass_logic},  // Horizontal (dx, dy) = (1,0)
    {0, 1, dark_pass_logic},  // Vertical (dx, dy) = (0,1)
    {1, 1, dark_pass_logic},  // Diagonal (dx, dy) = (1,1)
    {1, -1, dark_pass_logic}, // Other Diagonal (dx, dy) = (1,-1)

    {1, 0, light_pass_logic},  // Horizontal (dx, dy) = (1,0)
    {0, 1, light_pass_logic},  // Vertical (dx, dy) = (0,1)
    {1, 1, light_pass_logic},  // Diagonal (dx, dy) = (1,1)
    {1, -1, light_pass_logic}, // Other Diagonal (dx, dy) = (1,-1)
};

int fwriteImage(const char *output_path, uint8_t *image, uint32_t image_size);
void image_validator(uint8_t *image1, uint8_t *image2, uint32_t width,
                     uint32_t height);

/* Device versions of your logic functions */
__device__ uint8_t dark_pass_logic_dev(uint8_t a, uint8_t b, uint8_t c) {
  if (a >= b + 2)
    b++;
  if (a > b && b <= c)
    b++;
  if (c > b && b <= a)
    b++;
  if (c >= b + 2)
    b++;
  return b;
}

__device__ uint8_t light_pass_logic_dev(uint8_t a, uint8_t b, uint8_t c) {
  if (a <= b - 2)
    b--;
  if (a < b && b >= c)
    b--;
  if (c < b && b >= a)
    b--;
  if (c <= b - 2)
    b--;
  return b;
}

/* Single CUDA kernel per pass */
__global__ void crimmins_pass_kernel(uint8_t *out, const uint8_t *in, int width,
                                     int height, int dx, int dy, int is_light) {
  int x = blockIdx.x * blockDim.x + threadIdx.x + 1;
  int y = blockIdx.y * blockDim.y + threadIdx.y + 1;

  if (x >= width - 1 || y >= height - 1)
    return;

  uint8_t a = in[(y - dy) * width + (x - dx)];
  uint8_t b = in[y * width + x];
  uint8_t c = in[(y + dy) * width + (x + dx)];

  b = is_light ? light_pass_logic_dev(a, b, c) : dark_pass_logic_dev(a, b, c);

  out[y * width + x] = b;
}

/* Host API: allocate device buffers, launch passes, swap, copy back */
float crimmings_speckle_removal_filter_cuda(uint8_t *h_image, uint32_t width,
                                            uint32_t height,
                                            uint8_t iterations) {
  size_t numPixels = (size_t)(width * height);
  size_t bufBytes = numPixels * sizeof(uint8_t);

  cudaEvent_t start, stop;
  cudaEventCreate(&start);
  cudaEventCreate(&stop);
  cudaEventRecord(start, 0);

  uint8_t *d_buf1 = NULL;
  uint8_t *d_buf2 = NULL;
  CHECK_CUDA(cudaMalloc((void **)&d_buf1, bufBytes));
  CHECK_CUDA(cudaMalloc((void **)&d_buf2, bufBytes));

  /* copy host→device into d_buf2 */
  CHECK_CUDA(cudaMemcpy(d_buf1, h_image, bufBytes, cudaMemcpyHostToDevice));
  CHECK_CUDA(cudaMemcpy(d_buf2, h_image, bufBytes, cudaMemcpyHostToDevice));

  /* block/grid dims */
  dim3 block = {16, 16, 1};
  dim3 grid = {(uint32_t)((width + block.x - 3) / block.x),
               (uint32_t)((height + block.y - 3) / block.y), 1};
  printf("grid.x = %d, grid.y = %d\n", grid.x, grid.y);

  uint8_t *d_in = d_buf2;
  uint8_t *d_out = d_buf1;

  for (int iter = 0; iter < iterations; iter++) {
    for (int p = 0; p < 8; p++) {
      int is_light = (passes[p].pass_logic_func == light_pass_logic);

      crimmins_pass_kernel<<<grid, block>>>(
          d_out, d_in, width, height, passes[p].dx, passes[p].dy, is_light);
      // CHECK_CUDA(cudaGetLastError());

      SWAP(d_out, d_in);
    }
  }
  // if ((iterations * 8) % 2 == 1) {
  // 	SWAP(d_out, d_in);
  // }
  CHECK_CUDA(cudaMemcpy(h_image, d_out, bufBytes, cudaMemcpyDeviceToHost));

  cudaEventRecord(stop, 0);
  cudaEventSynchronize(stop);
  float time = 0;
  cudaEventElapsedTime(&time, start, stop);

  cudaEventDestroy(start);
  cudaEventDestroy(stop);

  time = time * 1e-3f;

  cudaFree(d_buf1);
  cudaFree(d_buf2);
  return time;
}

uint8_t dark_pass_logic(uint8_t a, uint8_t b, uint8_t c) {
  if (a >= b + 2)
    b++;
  if (a > b && b <= c)
    b++;
  if (c > b && b <= a)
    b++;
  if (c >= b + 2)
    b++;
  return b;
}

uint8_t light_pass_logic(uint8_t a, uint8_t b, uint8_t c) {
  if (a <= b - 2)
    b--;
  if (a < b && b >= c)
    b--;
  if (c < b && b >= a)
    b--;
  if (c <= b - 2)
    b--;
  return b;
}

// Serial Implementation

void pass_func(uint8_t *image, uint8_t *tmp_image, uint32_t width,
               uint32_t height, int dx, int dy,
               uint8_t (*pass_logic_func)(uint8_t, uint8_t, uint8_t)) {
  for (int y = 1; y < height - 1; y++) {
    uint8_t *row_a = tmp_image + (y - dy) * width;
    uint8_t *row_b = tmp_image + y * width;
    uint8_t *row_c = tmp_image + (y + dy) * width;
    uint8_t *row_out = image + y * width;

    for (int x = 1; x < width - 1; x++) {
      uint8_t a = row_a[x - dx];
      uint8_t b = row_b[x];
      uint8_t c = row_c[x + dx];

      b = pass_logic_func(a, b, c);

      row_out[x] = b;
    }
  }
}

void crimmings_speckle_removal_filter(uint8_t *image, uint32_t width,
                                      uint32_t height, uint8_t iterations) {
  uint8_t *tmp_image = (uint8_t *)malloc(width * height);
  assert(tmp_image != NULL && "Failed allocating temp image buffer");

  memcpy(tmp_image, image, width * height);
  for (int i = 0; i < iterations; i++) {
    for (int p = 0; p < 8; p++) {
      pass_func(image, tmp_image, width, height, passes[p].dx, passes[p].dy,
                passes[p].pass_logic_func);
      SWAP(image, tmp_image);
    }
  }
  // if ( (iterations * 8) % 2 == 1 ) {
  // 	memcpy(image, tmp_image, width*height);
  // }
  free(tmp_image);
}

int main(int argc, char *argv[]) {
  if (argc < 4) {
    fprintf(stderr, "Not enough input arguments given.\n");
    fprintf(stderr,
            "USAGE: %s path/to/input/image [width] [height] [optional num of "
            "passes]\n",
            argv[0]);
    return -1;
  }

  const char *input_path = argv[1];
  const uint32_t width = atoi(argv[2]);
  const uint32_t height = atoi(argv[3]);
  const uint8_t iterations = (argc >= 4) ? atoi(argv[4]) : ITERATIONS;

  size_t image_s = width * height;

  FILE *infd = fopen(input_path, "rb");
  if (!infd) {
    fprintf(stderr, "Error opening the input image\n");
    return -2;
  }

  uint8_t *image_ser = (uint8_t *)malloc(image_s);
  uint8_t *image_par = (uint8_t *)malloc(image_s);
  if (!image_ser || !image_par) {
    fprintf(stderr, "Error allocating image buffer");
    fclose(infd);
    return -3;
  }
  if (fread(image_ser, 1, image_s, infd) != image_s) {
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
  TIME_FUNC(
      crimmings_speckle_removal_filter(image_ser, width, height, iterations),
      time_ser);

  //==========================================
  int res = fwriteImage("out_ser.raw", image_ser, image_s);
  if (res) {
    free(image_ser);
    free(image_par);
    return -1;
  }
  //==========================================

  printf("Parallel algorithm\n");
  double time_par, time_par_cuda;
  // double time_par_cuda = crimmings_speckle_removal_filter_cuda(image_par,
  // width, 						 height, iterations);
  TIME_FUNC3(crimmings_speckle_removal_filter_cuda(image_par, width, height,
                                                   iterations),
             time_par, time_par_cuda);
  printf("Time cuda taken: %lfs\n", time_par_cuda);

  //==========================================
  res = fwriteImage("out_par.raw", image_par, image_s);
  if (res) {
    free(image_ser);
    free(image_par);
    return -5;
  }
  //==========================================
  printf("Speedup: %.4f\n", (time_ser / time_par));

  printf("\nValidating ser with par\n");
  image_validator(image_ser, image_par, width, height);

  free(image_ser);
  free(image_par);
  printf("Filtering complete!!!\n");

  return 0;
}

void image_validator(uint8_t *image1, uint8_t *image2, uint32_t width,
                     uint32_t height) {
  int error_cnt = 0;
  int idx = 0;
  FILE *resf = fopen("out.log", "w");
  assert(resf != NULL);
  int sum = 0;

  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      idx = y * width + x;
      if (image1[idx] != image2[idx]) {
        error_cnt++;
        sum += abs(image1[idx] - image2[idx]);
        fprintf(resf, "Error on pixel (%d,\t%d),\t with %d\n", x, y,
                (image1[idx] - image2[idx]));
      }
    }
  }
  fclose(resf);

  double avg_err = (sum != 0) ? (float)sum / error_cnt : 0;
  printf("Error cnt = %d / %d,\t avg_err  = %.4f\n", error_cnt, width * height,
         avg_err);
}

int fwriteImage(const char *output_path, uint8_t *image, uint32_t image_size) {
  assert(output_path != NULL && "Incorect output file");
  FILE *outfd = fopen(output_path, "wb");
  if (!outfd) {
    fprintf(stderr, "Error writing output file %s.\n", output_path);
    return -1;
  }
  fwrite(image, 1, image_size, outfd);
  fclose(outfd);
  return 0;
}
