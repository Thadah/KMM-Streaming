#!/bin/bash

echo "Dash.js Jaisten..."
echo " "
wget https://github.com/Dash-Industry-Forum/dash.js/archive/development.zip
unzip development.zip
cd dash.js-development
npm install
grunt

echo " "
echo "Bukatu da dependentzien instalazioa"
