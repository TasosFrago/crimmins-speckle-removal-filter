#!/usr/bin/env python3
import os
import subprocess
import re
import csv
import argparse
import tempfile
import shutil

THREAD_COUNTS = [1, 2, 4, 8, 16, 32, 64]
SEPERATOR = "\t"

def measure_speedups(exe, image, output, w, h, iters):
    """Run speckle for all THREAD_COUNTS and return dict t → (serial, parallel, speedup)."""
    results = {}
    for t in THREAD_COUNTS:
        env = os.environ.copy()
        env["OMP_NUM_THREADS"]   = str(t)
        env["OMP_PLACES"]        = "cores"
        env["OMP_PROC_BIND"]     = "close"

        cmd = [exe, image, output, str(w), str(h), str(iters)]
        proc = subprocess.run(cmd, env=env,
                              stdout=subprocess.PIPE,
                              stderr=subprocess.PIPE,
                              universal_newlines=True)
        if proc.returncode != 0:
            raise RuntimeError(f"[threads={t}] exited {proc.returncode}:\n{proc.stderr}")

        # Parse times and speedup (allow newlines between labels and numbers)
        serial_match = re.search(
            r"Serial algorithm[\s\S]*?Time taken:\s*([0-9.]+)s",
            proc.stdout
        )
        parallel_match = re.search(
            r"Parallel algorithm[\s\S]*?Time taken:\s*([0-9.]+)s",
            proc.stdout
        )
        speedup_match = re.search(r"Speedup:\s*([0-9.]+)", proc.stdout)

        if not (serial_match and parallel_match and speedup_match):
            raise RuntimeError(f"[threads={t}] could not find all timing data in:\n{proc.stdout}")

        serial_time = float(serial_match.group(1))
        parallel_time = float(parallel_match.group(1))
        speedup = float(speedup_match.group(1))

        print(f"\tThreads={t}: Serial={serial_time:.6f}s, Parallel={parallel_time:.6f}s, Speedup={speedup:.4f}")
        results[t] = (serial_time, parallel_time, speedup)
    return results

def load_csv(path):
    """Return header_list, rows_list (each a list of strings)."""
    with open(path, newline="") as f:
        reader = csv.reader(f, delimiter=SEPERATOR)
        data = list(reader)
    if not data:
        raise RuntimeError("Existing CSV is empty")
    return data[0], data[1:]

def write_csv(path, header, rows):
    """Atomically write CSV (list of lists)."""
    dirn = os.path.dirname(path) or "."
    fd, tmp = tempfile.mkstemp(dir=dirn, suffix=".tmp")
    os.close(fd)
    try:
        with open(tmp, "w", newline="") as f:
            writer = csv.writer(f, delimiter=SEPERATOR)
            writer.writerow(header)
            writer.writerows(rows)
        shutil.move(tmp, path)
    finally:
        if os.path.exists(tmp):
            os.remove(tmp)

def main():
    p = argparse.ArgumentParser()
    p.add_argument("-i","--image", required=True,
                   help="input .raw image")
    p.add_argument("-W","--width",  type=int, required=True,
                   help="image width")
    p.add_argument("-H","--height", type=int, required=True,
                   help="image height")
    p.add_argument("-o","--output", default="out.raw",
                   help="speckle output file")
    p.add_argument("-c","--csv",    default="results.csv",
                   help="CSV file to update")
    p.add_argument("--iters", type=int, default=10,
                   help="iterations for speckle")
    args = p.parse_args()

    img_key = os.path.basename(args.image) + f"/{args.iters}"
    headers_for_img = [f"{img_key} (serial)", f"{img_key} (parallel)", f"{img_key} (speedup)"]

    # 1) measure
    print(f"Measuring speedups for `{img_key}` …")
    results = measure_speedups(
        exe="./speckle",
        image=args.image,
        output=args.output,
        w=args.width,
        h=args.height,
        iters=args.iters
    )

    # 2) load or init CSV
    if os.path.isfile(args.csv):
        header, rows = load_csv(args.csv)
        if header[0] != "threads":
            raise RuntimeError("First column of CSV must be 'threads'")
        thread_to_row = { int(r[0]) : r for r in rows }
    else:
        header = ["threads"]
        rows = []
        thread_to_row = {}
        for t in THREAD_COUNTS:
            thread_to_row[t] = [ str(t) ]

    # 3) append new column headers
    header.extend(headers_for_img)

    # 4) build new rows in order of THREAD_COUNTS
    new_rows = []
    for t in THREAD_COUNTS:
        row = thread_to_row.get(t)
        if row is None:
            row = [ str(t) ] + [""] * (len(header) - 4)
        serial_time, parallel_time, speedup = results[t]
        row.extend([
            f"{serial_time:.6f}",
            f"{parallel_time:.6f}",
            f"{speedup:.4f}"
        ])
        new_rows.append(row)

    # 5) write CSV back
    write_csv(args.csv, header, new_rows)
    print(f"✅ Updated {args.csv} with columns for '{img_key}'")

if __name__ == "__main__":
    main()
