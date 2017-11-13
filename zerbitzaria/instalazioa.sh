#!/bin/bash
echo "Apache, MP4Box eta X264 instalatzen..."
sudo add-apt-repository ppa:jonathonf/ffmpeg-3 -y
sudo apt update
sudo apt install -y --install-recommends apache2 ffmpeg x264 #aldatzeko
sudo npm install -g grunt-cli
sudo apt install -y subversion
svn co https://svn.code.sf.net/p/gpac/code/trunk/gpac gpac
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
