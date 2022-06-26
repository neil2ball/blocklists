#!/bin/bash

directoryname=$(dirname "$0")/default;

rm $directoryname/default-hosts.txt;

touch $directoryname/default-hosts.txt;

while IFS= read -r line;

do 

	mapfile -t hostsArray < $directoryname/default-hosts.txt;

	if [[ ! " ${hostsArray[*]} " =~ " ${line} " ]];
	then
		wget "$line" -O ->> $directoryname/default-hosts.txt;
	fi
done < $directoryname/default-lists.txt
