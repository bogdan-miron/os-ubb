#!/bin/bash
#Display all the mounted file systems who are either smaller than than 1GB or have less than 20% free space.

if [ $# -ne 1 ] ; then
	echo "Argument count must be 1."
	exit
fi

if [ ! -r $1 ] ; then
	echo "Argument must be a readable file."
	exit
fi

sed '1d' $1 | awk '{print $1 , $3 , $5 , $6}' | sed -E 's/M/''/g' | sed -E 's/%/''/g' | awk '$2 <= 1024 || $3 <= 20 {print $4}' 


