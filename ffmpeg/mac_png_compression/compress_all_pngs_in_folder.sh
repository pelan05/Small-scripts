for f in *.png; do 
    ffmpeg -i "$f" -compression_level 100 -pred mixed -pix_fmt rgba "tmp_$f" && mv "tmp_$f" "$f" 
done