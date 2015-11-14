#!/usr/bin/env bash

rhost3_ip=192.168.0.144
rhost3_pass=calvin
rhost4_ip=192.168.0.145
rhost4_pass=calvin
host3_ip=192.168.0.146
host3_pass=calvin
host4_ip=192.168.0.147
host4_pass=calvin

srv=$1
if [ "$srv" == "" ]; then
	echo "Usage: $0 ServerName(host3/4 or rhost3/4)"
	exit
fi

eval ip=\$"$srv""_ip"
eval pass=\$"$srv""_pass"

if [ "$ip" == "" ]; then
	echo "Empty IP for $srv"
else
	echo "Connecting to $ip (use ~. "tilde-space-dot" to terminate connection )"
	ipmitool -I lanplus -U root -P $pass -H $ip sol activate
fi
