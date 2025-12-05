#!/bin/bash

# Recursively find all .flac files and convert them to MP3 (320 kbps)
# Requires: ffmpeg installed via brew (brew install ffmpeg)

find . -type f -iname "*.flac" | while read -r f; do
    out="${f%.*}.mp3"

    echo "Converting: $f"
    ffmpeg -i "$f" -codec:a libmp3lame -b:a 320k "$out"

    # Optional: Keep original timestamp
    touch -r "$f" "$out"
done
