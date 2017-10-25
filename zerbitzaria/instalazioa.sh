#!/bin/bash

sudo apt install -y  apache2 ffmpeg nodejs
sudo npm install -g grunt-cli
sudo apt install -y subversion
svn co https://svn.code.sf.net/p/gpac/code/trunk/gpac gpac
cd gpac
sudo chmod +x configure
./configure
sudo make
sudo make install
sudo cp bin/gcc/libgpac.so /usr/lib

echo " "
echo "Bukatu da instalazioa, egin 'MP4Box -version' ondo instalatu dela segurtatzeko"
exit
