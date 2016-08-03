#!/bin/bash

sudo apt-get update &&
	sudo apt-get install git build-essential libgd3 cmake zlib1g-dev libgd-dev libsqlite3-dev libsqlite3-dev

mkdir ~/build
cd ~/build

git clone "https://github.com/Rogier-5/minetest-mapper-cpp"
cd minetest-mapper-cpp

cmake . && make && sudo cp minetestmapper /usr/local/bin/mtmapper-rogier

