#!/bin/bash

#Display a report showing the full name of all the users currently connected, and the number of processes belonging to each of them.

names=`grep -E 'logged in' last.fake | awk '{print $1}'`

for name in $names ; do
	echo "Username: $name, procs: "
	grep $name last.fake | awk '{print $2}' | uniq
	count=`grep $name last.fake | awk '{print $2}' | uniq | wc -l`
	echo "Count: $count"
done
