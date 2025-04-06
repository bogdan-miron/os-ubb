#!/bin/bash

# variables

a='Bogdan'
b=5
c=7

sampledir='.'

echo $a , $b
ls $sampledir

myvar1=`ls /etc | wc -l`
myvar2=$( ls /etc | wc )
echo $myvar1
echo $myvar2

d=$(($b + $c))
echo $d

read input
if [ $(($input%2)) -eq 0 ] ; then
	echo 'Even number'
else
	echo 'Odd number'
fi


