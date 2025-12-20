#!/usr/bin/env bash

for input in *.mp4; do
  # Skip if no mp4 files exist
  [ -e "$input" ] || continue

  output="Compressed_$input"

  # Skip if output already exists
  if [ -f "$output" ]; then
    echo "Skipping (already exists): $output"
    continue
  fi

  echo "Compressing: $input -> $output"

  ffmpeg -i "$input" \
    -c:v libx264 \
    -preset slow \
    -crf 23 \
    -pix_fmt yuv420p \
    -profile:v high \
    -level 4.1 \
    -movflags +faststart \
    -c:a aac \
    -b:a 128k \
    "$output"
done
