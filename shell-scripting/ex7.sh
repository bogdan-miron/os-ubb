#!/bin/bash

#Consider a file containing a username on each line. Generate a comma-separated string with email addresses of the users that exist. The email address will be obtained by appending "@scs.ubbcluj.ro" at the end of each username. Make sure the generated string does NOT end in a comma.

if [ $# -ne 1 ] ; then
	echo "Argument count must be 1."
	exit
fi

if [ ! -r $1 ] ; then
	echo "File must be readable."
	exit
fi


count=0
names=`grep -E -v '^\s*$' $1`
for name in $names ; do
	count=$(($count + 1))
	if [ $count -eq `grep -E -v '^\s*$' $1 | wc -l` ] ; then
		echo -n "$name.@scs.ubbcluj.ro," | sed -E 's/(,$)/''/g'
	else
		echo -n "$name.@scs.ubbcluj.ro,"
	fi
	
done

