#!/bin/bash

# This script takes an input video file, copies the video stream,
# converts the audio stream to PCM (signed 16-bit little-endian),
# and saves the output as an MP4 file.

# Check if an input file is provided
if [ -z "$1" ]; then
  echo "Error: Please provide an input file."
  echo "Usage: $0 <input_file> <output_file>"
  exit 1
fi

# Set the input and output file names
input_file="$1"
# If output file is provided, use it. Otherwise, construct a default name.
if [ -z "$2" ]; then
  # Default output file name: input file name with "_out.mp4" appended.
  # Remove the extension from the input file name.
  base_name=$(basename "$input_file" | sed 's/\.[^.]*$//')
  output_file="${base_name}_out.mp4"
else
  output_file="$2"
fi

# Print the input and output files for confirmation
echo "Input file:  $input_file"
echo "Output file: $output_file"

# Execute the ffmpeg command
ffmpeg -i "$input_file" -c:v copy -c:a pcm_s16le -f mp4 "$output_file"

# Check the exit code of ffmpeg
if [ $? -eq 0 ]; then
  echo "Conversion successful!"
else
  echo "Conversion failed."
  exit 1
fi
