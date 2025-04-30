#!/bin/bash

# This script finds all .mp4 files in the current directory and its subdirectories,
# and removes the audio stream from each file using ffmpeg.
# It creates a new file with ".ns.mp4" appended to the original filename.

# Find all .mp4 files in the current directory and its subdirectories.
find . -type f -name "*.mp4" -print0 | while IFS= read -r -d $'\0' input_file; do
  # Use printf to debug the filename
  printf "Processing file: %s\n" "$input_file"

  # Extract the filename without the extension.
  base_name=$(basename "$input_file" .mp4)

  # Construct the output filename.
  output_file="${base_name}.ns.mp4"

  # Execute the ffmpeg command to remove the audio stream.
  ffmpeg -i "$input_file" -c copy -an "$output_file"

  # Check the exit code of ffmpeg.
  if [ $? -eq 0 ]; then
    printf "Audio removed successfully. Output file: %s\n" "$output_file"
  else
    printf "Error removing audio from %s\n" "$input_file"
    # Decide if you want the script to continue or stop on error.
    # If you want it to stop, uncomment the exit command:
    # exit 1
  fi
done

echo "Script completed."
