#!/bin/bash

#MP4Box -min-buffer 2000 -dash-live 2000 -mpd-refresh 4 -profile "dashavc264:live" -bs-switching no -rap -segment-name stream/stream_ -out stream.mpd stream.mp4#video stream.mp4#audio
ffmpeg \
-f webm_dash_manifest -live 1 \
-i /home/thadah/Documentos/GitHub/kmmstreaming/bezeroa/stream/glass_360.hdr \
-f webm_dash_manifest -live 1 \
-i /home/thadah/Documentos/GitHub/kmmstreaming/bezeroa/stream/glass_171.hdr \
-c copy \
-map 0 -map 1 \
-f webm_dash_manifest -live 1 \
-adaptation_sets "id=0,streams=0 id=1,streams=1" \
-chunk_start_index 1 \
-chunk_duration_ms 2000 \
-time_shift_buffer_depth 7200 \
-minimum_update_period 7200 \
/home/thadah/Documentos/GitHub/kmmstreaming/bezeroa/stream/glass_live_manifest.mpd
