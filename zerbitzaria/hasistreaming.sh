#!/bin/bash
#ffmpeg -re -i /dev/video0 -f alsa -i hw:1 -acodec libvorbis -c:v libx264 -keyint_min 150 -g 150 -r 30 -tile-columns 4 -frame-parallel 1 -f mp4 -dash 1 -an -vf scale=640:480 -b:v 1000k -dash 1 -movflags frag_keyframe+empty_moov stream.mp4

VP9_LIVE_PARAMS="-speed 6 -tile-columns 4 -frame-parallel 1 -threads 8 -static-thresh 0 -max-intra-rate 300 -deadline realtime -lag-in-frames 0 -error-resilient 1"
ffmpeg -f v4l2 -input_format mjpeg -r 30 -s 640x480 -i /dev/video0 \
-f alsa -ar 44100 -ac 2 -i hw:1 \
-map 0:0 \
-pix_fmt yuv420p \
-c:v libvpx-vp9 \
  -s 640x480 -keyint_min 60 -g 60 ${VP9_LIVE_PARAMS} \
  -b:v 3000k \
-f webm_chunk \
  -header "/home/thadah/Documentos/GitHub/kmmstreaming/bezeroa/stream/glass_360.hdr" \
  -chunk_start_index 1 \
/home/thadah/Documentos/GitHub/kmmstreaming/bezeroa/stream/glass_360_%d.chk \
-map 1:0 \
-c:a libvorbis \
  -b:a 128k -ar 44100 \
-f webm_chunk \
  -audio_chunk_duration 2000 \
  -header /home/thadah/Documentos/GitHub/kmmstreaming/bezeroa/stream/glass_171.hdr \
  -chunk_start_index 1 \
/home/thadah/Documentos/GitHub/kmmstreaming/bezeroa/stream/glass_171_%d.chk
