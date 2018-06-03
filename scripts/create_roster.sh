#!/bin/bash

cat uid-names.txt |\
	while read line
	do
		uid=`echo $line | gawk '{print $1}'`
		ln=`echo $line | gawk '{print $2}' | tr -d ,`
		fn=`echo $line | gawk '{print $3}'`
		echo $uid,$ln,$fn >> roster.csv
	done
