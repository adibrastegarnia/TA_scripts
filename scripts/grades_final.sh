#!/bin/bash

grades_file="final_grades.tsv"
#grades_dir="/homes/rkarandi/TA/summer17/cs240/grades/tmp_grades/"
grades_dir="/u/data/u3/park/pub/cs240/grades/"

i=0
while read -r line
do
	i=`expr $i + 1`

	if [ $i -eq 1 ]
	then
		continue
	fi

	cat $grades_file | head -n ${i} | tail -1 > tfile

	student=`cat tfile | gawk 'BEGIN { FS = "\t" } ; { print $3 }'`
	echo $student

	#mkdir -p tmp_grades/${student}/
	#echo $student > tmp_grades/${student}/fin.rpt
	#continue

	echo -e "\nGrade for final" >> ${grades_dir}/${student}/fin.rpt

	cat tfile | gawk 'BEGIN {FS = "\t"} ; {

		printf "\nProblem 1 graded by X (x@purdue.edu)\n"

		printf "\nProblem 2 graded by Y (y@purdue.edu)\n"

		printf "\nProblem 3 graded by Z (z@purdue.edu)\n"

		printf "\nBonus graded by x (x@purdue.edu)\n"

		printf "\nTotal: %d/100\n", $4

	}' >> ${grades_dir}/${student}/fin.rpt

done < $grades_file

echo "Total: $i"
