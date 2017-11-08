#!/bin/bash

x264 --output intermediate_1080.264 --fps 24 --preset fast --bitrate 5500 --vbv-maxrate 7552 --vbv-bufsize 9600 --min-keyint 48 --keyint 48 --scenecut 0 --no-scenecut --pass 1 --video-filter "resize:width=1920,height=1080" input.mp4
x264 --output intermediate_720.264 --fps 24 --preset fast --bitrate 2496 --vbv-maxrate 3072 --vbv-bufsize 9600 --min-keyint 48 --keyint 48 --scenecut 0 --no-scenecut --pass 1 --video-filter "resize:width=1280,height=720" input.mp4
x264 --output intermediate_576.264 --fps 24 --preset fast --bitrate 1216 --vbv-maxrate 1536 --vbv-bufsize 9600 --min-keyint 48 --keyint 48 --scenecut 0 --no-scenecut --pass 1 --video-filter "resize:width=1024,height=576" input.mp4
x264 --output intermediate_360.264 --fps 24 --preset fast --bitrate 896 --vbv-maxrate 900 --vbv-bufsize 9600 --min-keyint 48 --keyint 48 --scenecut 0 --no-scenecut --pass 1 --video-filter "resize:width=640,height=360" input.mp4
MP4Box -add intermediate_1080.264 -fps 24 output_1080.mp4
MP4Box -add intermediate_720.264 -fps 24 output_720.mp4
MP4Box -add intermediate_576.264 -fps 24 output_576.mp4
MP4Box -add intermediate_360.264 -fps 24 output_360.mp4
rm intermediate_1080.264
rm intermediate_720.264
rm intermediate_576.264
rm intermediate_360.264
MP4Box -dash 4000 -frag 4000 -rap -profile dashavc265:onDemand -out output_dash.mpd output_1080.mp4#video output_720.mp4#video output_576.mp4#video output_360.mp4#video input.mp4#audio
rm output_576.mp4
rm output_360.mp4
