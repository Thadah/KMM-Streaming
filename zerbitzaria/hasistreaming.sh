#!/bin/bash

DashCast -vf video4linux2 -v /dev/video0 -af alsa -a hw:1 -seg-dur 4000 -frag-dur 1000 -out "stream/" -mpd "stream.mpd" -low-delay -live
