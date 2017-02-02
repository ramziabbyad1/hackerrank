#!/bin/bash
#read string

while read string
do
	echo $string | cut -c3
done
#cut -c3 file
