import sys
import numpy as np
import matplotlib.pyplot as plt
import os

def main():
    if len(sys.argv) < 4:
        print("Usage: python view_raw.py <image_path> <width> <height> [channels]")
        sys.exit(1)

    image_path = sys.argv[1]
    width = int(sys.argv[2])
    height = int(sys.argv[3])
    channels = int(sys.argv[4]) if len(sys.argv) >= 5 else 3  # Default to RGB
    save: bool = bool(sys.argv[5]) if len(sys.argv) >= 6 else False

    if not os.path.isfile(image_path):
        print(f"Error: File '{image_path}' not found.")
        sys.exit(1)

    with open(image_path, 'rb') as f:
        raw_data = f.read()

    expected_bytes = width * height * channels
    if len(raw_data) != expected_bytes:
        print(f"Error: Expected {expected_bytes} bytes, but got {len(raw_data)} bytes.")
        sys.exit(1)

    try:
        image = np.frombuffer(raw_data, dtype=np.uint8).reshape((height, width, channels))
        if channels == 1:
            image = image.squeeze()  # Remove extra dimension for grayscale
    except ValueError as e:
        print(f"Error reshaping image: {e}")
        sys.exit(1)

    plt.imshow(image, cmap='gray' if channels == 1 else None)
    plt.axis('off')
    plt.title(f"{os.path.basename(image_path)}")
    if save:
        plt.savefig(
            "".join(["".join(image_path.split("/")[-1].split(".")[:-1]), ".png"]),
            bbox_inches='tight',
            pad_inches=0.1
        )
    plt.show()

if __name__ == "__main__":
    main()
