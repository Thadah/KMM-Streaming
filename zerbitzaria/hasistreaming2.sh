#!/bin/bash

ffmpeg -re -i /dev/video0 -f alsa -i hw:1 -acodec libvorbis -c:v libx264 -keyint_min 150 -g 150 -r 30 -tile-columns 4 -frame-parallel 1 -f mp4 -dash 1 -an -vf scale=640:480 -b:v 1000k -dash 1 -movflags frag_keyframe+empty_moov stream.mp4
