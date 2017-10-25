#!/bin/bash

MP4Box -min-buffer 2000 -time-shift 10 -dash 10000 -frag 2000 -dash-live 2000 -mpd-refresh 4 -profile "dashavc265:live" -bs-switching no -rap -segment-name stream/segment_ -out mpdtest.mpd stream.mp4
