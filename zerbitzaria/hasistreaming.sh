#!/bin/bash

#ffmpeg -i /dev/video0 -vcodec libvpx -vb 2500k -keyint_min 150 -g 150 -an /home/user/Vídeos/stream.webm

ffmpeg -i /dev/video0 -f alsa -i hw:1 -acodec libvorbis -c:v libx265 -preset medium -crf 28 -c:a libvorbis -b:a 128k output.mp4
