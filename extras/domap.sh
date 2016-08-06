#!/bin/bash

set -eu

mapper=/usr/local/bin/mtmapper-rogier
tempworld=tmp_mtworld
colorsfile=/etc/minetest/colors.txt

if [[ ! -f "$mapper" ]]; then
	echo "[1;31mAdvanced mapper not found. Please run extras/installmapper.sh[0m"
	exit 1
fi

cd /root/mt-manage

bin/mtctl stop --force

echo "[1;34mCopying world data ...[0m"
cp -r /var/games/minetest-server/.minetest/worlds/world "$tempworld"
worldcopy=$?

bin/mtctl start

if [[ "$worldcopy" = 0 ]]; then
	echo "[1;34mGenerating image from $PWD/$tempworld using "$colorsfile" ...[0m"
	nice -n 19 "$mapper" -i "$tempworld" -o /var/www/html/worldmap.png --geometry -3000,3000:3000,-3000 --colors "$colorsfile" 2>&1 >> mtimage_gen.log
	echo "----------------- separator -----------------------"  >> mtimage_gen.log
	echo "[1;32mDone.[0m"
	chmod 644 /var/www/html/worldmap.png
	rm -r "$tempworld"
else
echo "[1;31mFAILED copying world data.[0m"
fi


