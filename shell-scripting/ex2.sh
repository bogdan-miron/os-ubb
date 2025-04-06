#!/bin/bash

#Find recursively in a directory all ".c" files having more than 500 lines. Stop after finding 2 such files.

if [ $# -ne 1 ] ; then
	echo 'Argument count must be 1.'
	exit
fi

if [ ! -d $1 ] ; then
	echo 'Argument must be directory.'
	exit
fi

count=0

for f in `find $1 -type f -name "*.c"` ; do
	tmp=`cat $f | wc -l`
	if [ $tmp -ge 500 ] ; then
		echo "Filename: $f has $tmp lines."
		count=$(($count + 1))
	fi

	if [ $count -eq 2 ] ; then
		exit
	fi
done
