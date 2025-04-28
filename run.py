#!/usr/bin/env python3
import os
import subprocess
import re
import csv
import argparse
import tempfile
import shutil

THREAD_COUNTS = [1, 2, 4, 8, 16, 32, 64]

def measure_speedups(exe, image, output, w, h, iters):
    """Run speckle for all THREAD_COUNTS and return dict t→speedup."""
    speedups = {}
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

        m = re.search(r"Speedup:\s*([\d.]+)", proc.stdout)
        if not m:
            raise RuntimeError(f"[threads={t}] no Speedup line in:\n{proc.stdout}")
        print(f"Parsed Speedup {float(m.group(1))}")
        speedups[t] = float(m.group(1))
    return speedups

def load_csv(path):
    """Return header_list, rows_list (each a list of strings)."""
    with open(path, newline="") as f:
        reader = csv.reader(f)
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
            writer = csv.writer(f)
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

    img_name = os.path.basename(args.image) + " / " + str(args.iters)

    # 1) measure
    print(f"Measuring speedups for `{img_name}` …")
    speeds = measure_speedups(
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
        # if img_name in header:
        #     raise RuntimeError(f"Column '{img_name}' already exists in {args.csv}")
        # map existing rows by thread
        thread_to_row = { int(r[0]) : r for r in rows }
    else:
        header = ["threads"]
        rows = []
        thread_to_row = {}
        for t in THREAD_COUNTS:
            thread_to_row[t] = [ str(t) ]

    # 3) append new column header
    header.append(img_name)

    # 4) build new rows in order of THREAD_COUNTS
    new_rows = []
    for t in THREAD_COUNTS:
        row = thread_to_row.get(t)
        if row is None:
            # if CSV had missing thread, initialize it
            row = [ str(t) ] + [""]*(len(header)-2)
        # append our new speedup
        row.append(f"{speeds[t]:.4f}")
        new_rows.append(row)

    # 5) write CSV back
    write_csv(args.csv, header, new_rows)
    print(f"✅ Updated {args.csv} with column '{img_name}'")

if __name__ == "__main__":
    main()
