#!/bin/bash

sdir="$(dirname "$0")"

[[ "$UID" = 0 ]] || {
	echo "You need to be root to run this script"
	exit
}

apt-get update && apt-get install git ca-certificates

cp "$sdir/pkg/etc/logrotate.d/"* / -rvn
cp "$sdir/pkg/usr/local/bin/"* / -rv
