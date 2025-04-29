import pandas as pd
import matplotlib.pyplot as plt

def main():
    # Adjust path if needed
    df = pd.read_csv('./report/data/result_f1.csv', sep='\t')

    # X-axis: number of threads/CPUs
    threads = df['threads']

    # Map legend labels to the exact CSV column names
    speedup_cols = {
        'Mountain30000'  : 'mountain30000.raw/1 (speedup)',
        'Mountain4096'   : 'mountain4096.raw/1 (speedup)',
        'Mountain1024'   : 'mountain1024.raw/1 (speedup)',
        'Lena256'        : 'lena256.raw/1 (speedup)',
    }

    # Create the plot
    plt.figure(figsize=(8, 6))
    for label, col_name in speedup_cols.items():
        plt.plot(threads, df[col_name], marker='o', label=label)

    # Labels, title, legend, grid
    plt.xlabel('CPUs')
    plt.ylabel('Speedup')
    plt.title('Parallel Speedup vs CPUs')
    plt.legend()
    plt.grid(False)
    plt.tight_layout()

    plt.savefig(
        "./report/pics/speedupPlot.svg",
        bbox_inches='tight',
        pad_inches=0.1
    )

    # Show the plot
    plt.show()

if __name__ == '__main__':
    main()
