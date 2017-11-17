#!/bin/bash
echo "Apache, MP4Box, DashCast eta X264 instalatzen..."
sudo apt install -y gpac gcc make zlib1g-dev
sudo add-apt-repository ppa:jonathonf/ffmpeg-3 -y
sudo apt update
sudo apt install -y --install-recommends apache2 ffmpeg x264
git clone https://github.com/gpac/gpac.git
cd gpac
./configure
make
sudo make install
sudo make install-lib
MP4Box -version
cd ..
sudo rm -r gpac
echo " "
echo "Bukatu da instalazioa"
exit
