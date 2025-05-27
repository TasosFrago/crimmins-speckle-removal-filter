# Crimmins Speckle Removal Filter

Removes salt-and-pepper noise from grayscale images. The algorithm was implemented in three different ways: a serial implementation, a CPU-parallel implementation using OpenMP, and a GPU-parallel implementation using CUDA. This is part of a university assignment for the Parallel Computing course, and its purpose is to compare the performance of these parallel implementations for this specific algorithm.

## Contents

- **Serial implementation**: Basic CPU version  
- **OpenMP implementation**: Multi-core CPU parallelization  
- **CUDA implementation**: GPU acceleration  
- **Performance benchmarks**: Detailed timing comparisons across different image sizes and iteration counts

The OpenMP algorithm was run on a platform with four Intel Xeon Gold 5218 CPUs @ 2.30GHz, totaling 64 cores. The CUDA implementation was tested on both a GTX 950 and an RTX 3080.

## Report

See [report.pdf](./report/report.pdf) for complete implementation details, algorithm explanation, and performance analysis.
