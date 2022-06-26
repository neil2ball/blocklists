#!/bin/bash

directoryname=$(dirname "$0")/blocklistproject;

rm $directoryname/blocklistproject-hosts.txt;

touch $directoryname/blocklistproject-hosts.txt;

while IFS= read -r line;

do 

	mapfile -t hostsArray < $directoryname/blocklistproject-hosts.txt;

	if [[ ! " ${hostsArray[*]} " =~ " ${line} " ]];
	then
		wget "$line" -O ->> $directoryname/blocklistproject-hosts.txt;
	fi
done < $directoryname/blocklistproject-lists.txt
