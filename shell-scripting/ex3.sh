#!/bin/bash

# Find recursively in a directory, all the files with the extension ".log" and sort their lines (replace the original file with the sorted content).

if [ $# -ne 1 ] ; then
	echo "Argc must be 1."
fi

if [ ! -d $1 ] ; then
	echo "Argument must be a directory."
fi

for f in `find $1 -type f -name "*.log"` ; do
	sort "$f" > tmp.log && mv tmp.log "$f"
done
