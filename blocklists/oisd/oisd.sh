#!/bin/bash

directoryname=$(dirname "$0")/oisd;

rm $directoryname/oisd-hosts.txt;

touch $directoryname/oisd-hosts.txt;

while IFS= read -r line;

do 

	mapfile -t hostsArray < $directoryname/oisd-hosts.txt;

	if [[ ! " ${hostsArray[*]} " =~ " ${line} " ]];
	then
		wget "$line" -O ->> $directoryname/oisd-hosts.txt;
	fi
done < $directoryname/oisd-lists.txt
