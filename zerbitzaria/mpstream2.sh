#!/bin/bash

MP4Box -dash-ctx dash-live.txt -dash-live 4000 -profile "dashavc264:live" \
-rap -ast-offset 12 -no-frags-default -bs-switching no \
-min-buffer 4000 -url-template -time-shift 1800 \
-segment-name live_ -out live.mpd \
-dynamic -mpd-refresh 2 -subsegs-per-sidx -1 stream.mp4#video stream.mp4#audio
