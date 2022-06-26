#!/bin/bash

directoryname=$(dirname "$0")/lightswitch05;

rm $directoryname/lightswitch05-hosts.txt;

touch $directoryname/lightswitch05-hosts.txt;

while IFS= read -r line;

do 

	mapfile -t hostsArray < $directoryname/lightswitch05-hosts.txt;

	if [[ ! " ${hostsArray[*]} " =~ " ${line} " ]];
	then
		wget "$line" -O ->> $directoryname/lightswitch05-hosts.txt;
	fi
done < $directoryname/lightswitch05-lists.txt
