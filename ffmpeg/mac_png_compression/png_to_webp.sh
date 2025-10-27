for f in *.png; do
  ffmpeg -i "$f" -vf "scale=w=min(iw\,1600):h=-1" -compression_level 6 -q:v 80 "${f%.*}.webp"
done