import pandas as pd
import matplotlib.pyplot as plt
import re

iteration = 1

df_omp  = pd.read_csv('./report/data/result_f1_new.csv', sep='\t')
df_cuda = pd.read_csv('./report/data/cudaCom.csv',    sep='\t')

df_omp_64: pd.DataFrame = df_omp.loc[df_omp['threads'] == 64]

# Function to extract the numeric width from a header like 'mri512.raw/1 (serial)'
def extract_width(col_name: str):
    m = re.search(r'([A-Za-z]+)(\d+)\.raw/(\d+)', col_name)
    assert(m is not None)
    return int(m.group(2))

# Build lists of column names for serial and parallel times (for the chosen iteration)
pat_ser = rf'\.raw/{iteration} \(serial\)'
pat_par = rf'\.raw/{iteration} \(parallel\)'

cols_omp_ser = sorted([c for c in df_omp_64.columns if re.search(pat_ser, c)], key=extract_width)
cols_omp_par = sorted([c for c in df_omp_64.columns if re.search(pat_par, c)], key=extract_width)

cols_cuda_ser = sorted([c for c in df_cuda.columns if re.search(pat_ser, c)], key=extract_width)
cols_cuda_par = [c.replace('(serial)', '(parallel)') for c in cols_cuda_ser]

# Extract widths and timing data
widths_ser_omp = [tmp for c in cols_omp_ser if (tmp := extract_width(c))]
serial_omp    = df_omp_64[cols_omp_ser].to_numpy().flatten().tolist()

widths_par_omp = [tmp for c in cols_omp_par if (tmp := extract_width(c))]
parallel_omp   = df_omp_64[cols_omp_par].to_numpy().flatten().tolist()

widths_ser_cuda = [tmp for c in cols_cuda_ser if (tmp := extract_width(c))]
serial_cuda1    = [df_cuda.iloc[0][c] for c in cols_cuda_ser]  # GTX 950
parallel_cuda1  = [df_cuda.iloc[0][c] for c in cols_cuda_par]

serial_cuda2    = [df_cuda.iloc[1][c] for c in cols_cuda_ser]  # RTX 3080
parallel_cuda2  = [df_cuda.iloc[1][c] for c in cols_cuda_par]

# Define consistent colors for each machine
colors = {
    'omp':   'green',
    'cuda1': 'blue',   # GTX 950
    'cuda2': 'red'     # RTX 3080
}

# Plotting
plt.figure(figsize=(10, 6))

# OpenMP curves
plt.plot(widths_ser_omp,  serial_omp,   '--o', color=colors['omp'],   label='Serial (OpenMP)')
plt.plot(widths_par_omp,  parallel_omp, '-o',  color=colors['omp'],   label='64 Threads (OpenMP)')

# CUDA GTX 950
plt.plot(widths_ser_cuda, serial_cuda1,   '--s', color=colors['cuda1'], label='Serial (GTX950)')
plt.plot(widths_ser_cuda, parallel_cuda1, '-s',  color=colors['cuda1'], label='CUDA (GTX950)')

# CUDA RTX 3080
plt.plot(widths_ser_cuda, serial_cuda2,   '--^', color=colors['cuda2'], label='Serial (RTX3080)')
plt.plot(widths_ser_cuda, parallel_cuda2, '-^',  color=colors['cuda2'], label='CUDA (RTX3080)')

plt.xlabel('Image size (pixels²)')
plt.ylabel('Runtime (s)')
plt.title(f'Runtime vs. Image Size (Iteration {iteration})')

plt.yscale('log')

plt.xticks(widths_ser_omp)  
plt.xscale('linear')
plt.legend()
plt.grid(True)
plt.tight_layout()
# plt.savefig(
#     f"./report/pics/runtimeCurves_{iteration}.svg",
#     bbox_inches='tight',
#     pad_inches=0.1
# )
plt.show()
