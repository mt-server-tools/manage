#!/bin/bash

if [[ "$UID != 0 ]]; then
	echo "[1;31mYou are not root[0m"
	exit 1
fi

cp bin/* /usr/local/bin

cp mtmanage.conf /etc/minetest/mtmanage.conf
chmod 644 /etc/minetest/mtmanage.conf
cp extras/colors.txt /etc/minetest/colors.txt
