#!/bin/bash

base_dir=`pwd`

reports_dir="${base_dir}/reports"
extract_dir="${base_dir}/extracted"

student_list=`ls ${extract_dir}`

for s in $student_list
do
	file=`find ${extract_dir}/${s} -iname *lab*1*.pdf`
	if [ "$file" = "" ]
	then
		echo "Cannot extract report of student: $s"
		continue
	fi
	file=`echo "$file" | sed -e 's/ /\\\\ /'`
	echo $file
	#base=`basename $file`
	cmd="cp -p ${file} ${reports_dir}/${s}_lab1.pdf"
	$cmd
done
