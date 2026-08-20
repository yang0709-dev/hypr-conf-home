import zlib
import sys

if len(sys.argv) != 3:
    print("Usage: python decompress.py <input_file> <output_file>")
    sys.exit(1)

input_file = sys.argv[1]
output_file = sys.argv[2]

try:
    with open(input_file, 'rb') as f_in:
        compressed_data = f_in.read()
    
    # decompressobj handles the raw zlib stream
    decompressor = zlib.decompressobj()
    decompressed_data = decompressor.decompress(compressed_data)
    
    with open(output_file, 'wb') as f_out:
        f_out.write(decompressed_data)
    
    print(f"Successfully extracted to {output_file}")

except zlib.error as e:
    print(f"Error: The file does not appear to be valid zlib data. {e}")
except Exception as e:
    print(f"Error: {e}")
