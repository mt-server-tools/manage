#!/bin/bash

mapper=/usr/local/bin/mtmapper-rogier

if [[ ! -f "$mapper" ]]; then
	echo "[1;31mAdvanced mapper not found. Please run extras/installmapper.sh[0m"
	exit 1
fi

cd /root/mt-manage

bin/mtctl stop
cp /var/games/minetest-server/.minetest/worlds/world /tmp/mtworld
bin/mtctl start

nice 19 "$mapper" -i /tmp/world -o /var/www/html/worldmap.png --geometry -3000,3000:3000,-3000
chmod 644 /var/www/html/worldmap.png
rm -r /tmp/world


