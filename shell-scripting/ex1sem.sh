#!/bin/bash

# Write a script that counts the number of nonempty lines in .c files in specified directory and all of its subdirectories.

if [ ! $# -eq 1 ] ; then
	echo 'Argc must be 1.'
	exit
fi

if [ ! -d $1 ] ; then
	echo 'Not a directory.'
	exit
fi

count=0

for f in `find $1 -type f -name '*.c'`; do
	tmp=`grep -E -v '^\s$' $f | wc -l`
	count=$(($count + $tmp)) 
	
done

echo "Number of non empty .c lines in directory $dir : $count ."
