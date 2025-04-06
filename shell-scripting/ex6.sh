#!/bin/bash

## Find recursively in a directory, all the files that have write permissions for everyone. Display their names, and the permissions before and after removing the write permission for everybody. You will need to use chmod's symbolic permissions mode, instead of the octal mode we have used in class. The the chmod manual for details.

if [ $# -ne 1 ] ; then
        echo "Argc must be 1."
fi

if [ ! -d $1 ] ; then
        echo "Argument must be a directory."
fi

for f in `find $1 -type f -perm -o=w` ; do
	permissions=`ls -l $f | awk '{print $1}'`
	echo $permissions $f

	chmod o-w $f

	permissions=`ls -l $f | awk '{print $1}'`
        echo $permissions $f

done
