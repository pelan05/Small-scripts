for f in *.png; do
  ffmpeg -i "$f" -vf "scale=w=min(iw\,1920):h=-1" -c:v libaom-av1 -still-picture 1 -crf 30 -b:v 0 "${f%.*}.avif"
done