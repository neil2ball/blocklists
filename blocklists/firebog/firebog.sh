#!/bin/bash

directoryname=$(dirname "$0")/firebog;

rm $directoryname/firebog-hosts.txt;
rm $directoryname/firebog-lists.txt;

wget -O $directoryname/firebog-lists.txt "https://v.firebog.net/hosts/lists.php?type=nocross";

touch $directoryname/firebog-hosts.txt;

while IFS= read -r line;

do 

	mapfile -t hostsArray < $directoryname/firebog-hosts.txt;

	if [[ ! " ${hostsArray[*]} " =~ " ${line} " ]];
	then
		wget "$line" -O ->> $directoryname/firebog-hosts.txt;
	fi
done < $directoryname/firebog-lists.txt
