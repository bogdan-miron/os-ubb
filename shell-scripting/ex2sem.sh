#!/bin/bash

# Cititi intrarea consolei pana cand utilizatorul furnizeaza un nume de fisier care exista si poate fi citit.

while [ 1 ] ; do
	read input
	if [ -w $input ] ; then
		echo 'This is a valid filename.'
		exit
	fi
done
