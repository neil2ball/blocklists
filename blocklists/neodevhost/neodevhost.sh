#!/bin/bash

directoryname=$(dirname "$0")/neodevhost;

rm $directoryname/neodevhost-hosts.txt;

touch $directoryname/neodevhost-hosts.txt;

while IFS= read -r line;

do 

	mapfile -t hostsArray < $directoryname/neodevhost-hosts.txt;

	if [[ ! " ${hostsArray[*]} " =~ " ${line} " ]];
	then
		wget "$line" -O ->> $directoryname/neodevhost-hosts.txt;
	fi
done < $directoryname/neodevhost-lists.txt
