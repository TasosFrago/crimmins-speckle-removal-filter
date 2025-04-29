import os
import sys
import numpy as np
import matplotlib.pyplot as plt


def main():
    if len(sys.argv) < 5:
        print("Usage: python disp_two.py <original-image-path> <output-image-path> <width> <height>")
        sys.exit(1)

    in_image_path = sys.argv[1]
    out_image_path = sys.argv[2]
    width = int(sys.argv[3])
    height = int(sys.argv[4])
    print(f"{sys.argv[5]=}")
    save: bool = bool(sys.argv[5]) if len(sys.argv) >= 6 else False
    print(f"{save=}")

    if not os.path.isfile(in_image_path) or not os.path.isfile(out_image_path):
        print(f"Error: File '{in_image_path}' or '{out_image_path}' not found.")
        sys.exit(1)

    with open(in_image_path, 'rb') as f:
        in_raw_data = f.read()

    with open(out_image_path, 'rb') as f:
        out_raw_data = f.read()

    expected_bytes = width * height * 1

    if len(in_raw_data) != expected_bytes:
        print(f"Error: Expected {expected_bytes} bytes, but got {len(in_raw_data)} bytes.")
        sys.exit(1)
    if len(out_raw_data) != expected_bytes:
        print(f"Error: Expected {expected_bytes} bytes, but got {len(out_raw_data)} bytes.")
        sys.exit(1)

    try:
        in_image = np.frombuffer(in_raw_data, dtype=np.uint8).reshape((height, width, 1)).squeeze()
        out_image = np.frombuffer(out_raw_data, dtype=np.uint8).reshape((height, width, 1))
    except ValueError as e:
        print(f"Error reshaping images: {e}")
        sys.exit(1)

    fig, (ax1, ax2) = plt.subplots(1, 2)

    ax1.imshow(in_image, cmap='gray')
    ax1.axis('off')
    ax1.set_title(in_image_path.split("/")[-1], fontsize=10)

    ax2.imshow(out_image, cmap='gray')
    ax2.axis('off')
    ax2.set_title(out_image_path.split("/")[-1], fontsize=10)

    if save:
        print("Saving")
        plt.savefig(
            "".join(["".join(in_image_path.split("/")[-1].split(".")[:-1]), ".svg"]),
            bbox_inches='tight',
            pad_inches=0.1
        )

    plt.show()

if __name__=="__main__":
    main()
