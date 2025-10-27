ffmpeg -i input.mpg -c:v libx264 -b:v 1000k -c:a aac -b:a 128k -strict experimental output.mp4
