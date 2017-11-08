#!/bin/bash

sudo apt install -y  apache2 ffmpeg subversion x264 zlib1g-dev #programak, subversion mp4box instalatzeko
svn co https://svn.code.sf.net/p/gpac/code/trunk/gpac gpac #mp4box
cd gpac
sudo chmod +x configure
./configure
sudo make
sudo make install
sudo cp bin/gcc/libgpac.so /usr/lib
mp4box -version
cd ..
sudo rm -r gpac
echo " "
echo "Bukatu da instalazioa"
exit
