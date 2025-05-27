import pandas as pd
import matplotlib.pyplot as plt
import re

# User-configurable parameters
iteration = 10

# Read the data
df_omp = pd.read_csv('./report/data/result_f1_new.csv', sep='\t')
df_cuda = pd.read_csv('./report/data/cudaCom.csv', sep='\t')

# Filter for OpenMP 64-thread row
df_omp_64 = df_omp[df_omp['threads'] == 64]

# Utility: extract width from column name
def extract_width(col_name):
    m = re.search(r'([A-Za-z]+)(\d+)\.raw/(\d+)', col_name)
    return int(m.group(2)) if m else None

# Pattern for speedup columns for selected iteration
pat_speedup = rf'\.raw/{iteration} \(speedup\)'

# --- Get columns ---
cols_omp_speedup   = sorted([c for c in df_omp_64.columns if re.search(pat_speedup, c)], key=extract_width)
cols_cuda_speedup  = sorted([c for c in df_cuda.columns    if re.search(pat_speedup, c)], key=extract_width)

widths_omp         = [extract_width(c) for c in cols_omp_speedup]
speedup_omp        = df_omp_64[cols_omp_speedup].values.flatten().tolist()

widths_cuda        = [extract_width(c) for c in cols_cuda_speedup]
speedup_cuda1      = [df_cuda.iloc[0][c] for c in cols_cuda_speedup]  # GTX950
speedup_cuda2      = [df_cuda.iloc[1][c] for c in cols_cuda_speedup]  # RTX3080

# Color map
colors = {
    'omp': 'green',
    'cuda1': 'blue',
    'cuda2': 'red'
}

# Plot
plt.figure(figsize=(10, 6))

plt.plot(widths_omp,  speedup_omp,     '-o', color=colors['omp'],   label='OpenMP (64 threads)')
plt.plot(widths_cuda, speedup_cuda1,   '-s', color=colors['cuda1'], label='CUDA (GTX950)')
plt.plot(widths_cuda, speedup_cuda2,   '-^', color=colors['cuda2'], label='CUDA (RTX3080)')

plt.xlabel('Image size (pixels²)')
plt.ylabel('Speedup (×)')
plt.title(f'Speedup vs. Image Size (Iteration {iteration})')
plt.yscale('linear')
plt.xticks(widths_omp)
plt.xscale('linear')
plt.grid(True)
plt.legend()
plt.tight_layout()
plt.savefig(
    f"./report/pics/sppedupCurves_{iteration}.svg",
    bbox_inches='tight',
    pad_inches=0.1
)
plt.show()
