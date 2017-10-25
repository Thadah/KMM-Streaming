#!/bin/bash

ffmpeg -re -i /dev/video0 -f alsa -i hw:1 -acodec libvorbis -g 52 -b:a 64k -r 30 -ar 44100 -vcodec libx264 -s 640x480 -preset ultrafast -f mp4 -movflags frag_keyframe+empty_moov stream.mp4
