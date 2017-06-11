#!/bin/bash

sdir="$(dirname "$0")"

[[ "$UID" = 0 ]] || {
	echo "You need to be root to run this script"
	exit
}

apt-get update && apt-get install git ca-certificates

echo "Setting up logrotate files ..."
cp "$sdir/pkg/etc/logrotate.d/minetest" /etc/logrotate.d/ -vi

echo "Installing mt-manage ..."
cp "$sdir/pkg/usr/local/bin/"* /usr/local/bin/ -rv
