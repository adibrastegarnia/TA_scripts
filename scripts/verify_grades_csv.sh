#!/bin/bash

grades_file=cs240_summer17_grades_sent_to_Prof.csv
grades_dir=/u/data/u3/park/pub/cs240/grades/
i=0

cat $grades_file |\
	while read line
	do
		if [ $i -eq 0 ]
		then
			i=`expr $i + 1`
			continue
		fi

		i=`expr $i + 1`

		line=`echo $line | tr -d '\r'`
		student=`echo $line | gawk 'BEGIN {FS = ","}; {print $1}'`
		#echo "Checking grades for student: ${student}"

		lab1_1=`echo $line | gawk 'BEGIN {FS = ","}; {print $4}'`
		lab2_1=`echo $line | gawk 'BEGIN {FS = ","}; {print $5}'`
		lab3_1=`echo $line | gawk 'BEGIN {FS = ","}; {print $6}'`
		lab4_1=`echo $line | gawk 'BEGIN {FS = ","}; {print $8}'`
		lab5_1=`echo $line | gawk 'BEGIN {FS = ","}; {print $9}'`
		lab6_1=`echo $line | gawk 'BEGIN {FS = ","}; {print $10}'`
		lab7_1=`echo $line | gawk 'BEGIN {FS = ","}; {print $11}'`
		late_1=`echo $line | gawk 'BEGIN {FS = ","}; {print $13}'`
		mid_1=`echo $line | gawk 'BEGIN {FS = ","}; {print $7}'`
		fin_1=`echo $line | gawk 'BEGIN {FS = ","}; {print $12}'`

		lab1_2=`grep early ${grades_dir}/${student}/lab1.rpt | gawk 'BEGIN {FS = ": "}; {print $2}' | gawk 'BEGIN {FS = "/"}; {print $1}'`
		lab2_2=`grep early ${grades_dir}/${student}/lab2.rpt | gawk 'BEGIN {FS = ": "}; {print $2}' | gawk 'BEGIN {FS = "/"}; {print $1}'`
		lab3_2=`grep early ${grades_dir}/${student}/lab3.rpt | gawk 'BEGIN {FS = ": "}; {print $2}' | gawk 'BEGIN {FS = "/"}; {print $1}'`
		lab4_2=`grep early ${grades_dir}/${student}/lab4.rpt | gawk 'BEGIN {FS = ": "}; {print $2}' | gawk 'BEGIN {FS = "/"}; {print $1}'`
		lab5_2=`grep early ${grades_dir}/${student}/lab5.rpt | gawk 'BEGIN {FS = ": "}; {print $2}' | gawk 'BEGIN {FS = "/"}; {print $1}'`
		lab6_2=`grep early ${grades_dir}/${student}/lab6.rpt | gawk 'BEGIN {FS = ": "}; {print $2}' | gawk 'BEGIN {FS = "/"}; {print $1}'`
		lab7_2=`grep early ${grades_dir}/${student}/lab7.rpt | gawk 'BEGIN {FS = ": "}; {print $2}' | gawk 'BEGIN {FS = "/"}; {print $1}'`
		late_2=`grep -i late ${grades_dir}/${student}/lab7.rpt | gawk 'BEGIN {FS = ": "}; {print $2}' | gawk 'BEGIN {FS = "/"}; {print $1}'`
		late_2=`expr $late_2 \* 25`
		mid_2=`grep Total ${grades_dir}/${student}/mid.rpt | gawk 'BEGIN {FS = ": "}; {print $2}' | gawk 'BEGIN {FS = "/"}; {print $1}'`
		fin_2=`grep Total ${grades_dir}/${student}/fin.rpt | gawk 'BEGIN {FS = ": "}; {print $2}' | gawk 'BEGIN {FS = "/"}; {print $1}'`

		lab1_3=`grep ${student} lab1_grades.tsv | gawk 'BEGIN {FS = "\t"}; {print $18}' | tr -d '\r'`
		lab2_3=`grep ${student} lab2_grades.tsv | gawk 'BEGIN {FS = "\t"}; {print $26}' | tr -d '\r'`
		lab3_3=`grep ${student} lab3_grades.tsv | gawk 'BEGIN {FS = "\t"}; {print $13}' | tr -d '\r'`
		lab4_3=`grep ${student} lab4_grades.tsv | gawk 'BEGIN {FS = "\t"}; {print $12}' | tr -d '\r'`
		lab5_3=`grep ${student} lab5_grades.tsv | gawk 'BEGIN {FS = "\t"}; {print $12}' | tr -d '\r'`
		lab6_3=`grep ${student} lab6_grades.tsv | gawk 'BEGIN {FS = "\t"}; {print $12}' | tr -d '\r'`
		lab7_3=`grep ${student} lab7_grades.tsv | gawk 'BEGIN {FS = "\t"}; {print $8}' | tr -d '\r'`
		late_3=`grep ${student} late_days.tsv | gawk 'BEGIN {FS = "\t"}; {print $9}' | tr -d '\r'` 
		late_3=`expr $late_3 \* 25`
		mid_3=`grep ${student} midterm_grades.tsv | gawk 'BEGIN {FS = "\t"}; {print $4}' | tr -d '\r'`
		fin_3=`grep ${student} final_grades.tsv | gawk 'BEGIN {FS = "\t"}; {print $4}' | tr -d '\r'`

		test1_1=`echo "$lab1_1 == $lab1_2" | bc -l`
		test2_1=`echo "$lab2_1 == $lab2_2" | bc -l`
		test3_1=`echo "$lab3_1 == $lab3_2" | bc -l`
		test4_1=`echo "$lab4_1 == $lab4_2" | bc -l`
		test5_1=`echo "$lab5_1 == $lab5_2" | bc -l`
		test6_1=`echo "$lab6_1 == $lab6_2" | bc -l`
		test7_1=`echo "$lab7_1 == $lab7_2" | bc -l`
		test8_1=`echo "$mid_1 == $mid_2" | bc -l`
		test9_1=`echo "$fin_1 == $fin_2" | bc -l`
		test10_1=`echo "$late_1 == $late_2" | bc -l`

		test1_2=`echo "$lab1_3 == $lab1_2" | bc -l`
		test2_2=`echo "$lab2_3 == $lab2_2" | bc -l`
		test3_2=`echo "$lab3_3 == $lab3_2" | bc -l`
		test4_2=`echo "$lab4_3 == $lab4_2" | bc -l`
		test5_2=`echo "$lab5_3 == $lab5_2" | bc -l`
		test6_2=`echo "$lab6_3 == $lab6_2" | bc -l`
		test7_2=`echo "$lab7_3 == $lab7_2" | bc -l`
		test8_2=`echo "$mid_3 == $mid_2" | bc -l`
		test9_2=`echo "$fin_3 == $fin_2" | bc -l`
		test10_2=`echo "$late_3 == $late_2" | bc -l`

		if [ $test1_1 -eq 0 ]
		then
			echo "Student ${student}, Lab1 score differs: global $lab1_1, file $lab1_2"
		fi
		if [ $test1_2 -eq 0 ]
		then
			echo "Student ${student}, Lab1 score differs: indv $lab1_3, global $lab1_2"
		fi

		if [ $test2_1 -eq 0 ]
		then
			echo "Student ${student}, Lab2 score differs: global $lab2_1, file $lab2_2"
		fi
		if [ $test2_2 -eq 0 ]
		then
			echo "Student ${student}, Lab2 score differs: indv $lab2_3, global $lab2_2"
		fi

		if [ $test3_1 -eq 0 ]
		then
			echo "Student ${student}, Lab3 score differs: global $lab3_1, file $lab3_2"
		fi
		if [ $test3_2 -eq 0 ]
		then
			echo "Student ${student}, Lab3 score differs: indv $lab3_3, global $lab3_2"
		fi

		if [ $test4_1 -eq 0 ]
		then
			echo "Student ${student}, Lab4 score differs: global $lab4_1, file $lab4_2"
		fi
		if [ $test4_2 -eq 0 ]
		then
			echo "Student ${student}, Lab1 score differs: indv $lab4_3, global $lab4_2"
		fi

		if [ $test5_1 -eq 0 ]
		then
			echo "Student ${student}, Lab5 score differs: global $lab5_1, file $lab5_2"
		fi
		if [ $test5_2 -eq 0 ]
		then
			echo "Student ${student}, Lab5 score differs: indv $lab5_3, global $lab5_2"
		fi

		if [ $test6_1 -eq 0 ]
		then
			echo "Student ${student}, Lab6 score differs: global $lab6_1, file $lab6_2"
		fi
		if [ $test6_2 -eq 0 ]
		then
			echo "Student ${student}, Lab6 score differs: indv $lab6_3, global $lab6_2"
		fi

		if [ $test7_1 -eq 0 ]
		then
			echo "Student ${student}, Lab7 score differs: global $lab7_1, file $lab7_2"
		fi
		if [ $test7_2 -eq 0 ]
		then
			echo "Student ${student}, Lab7 score differs: indv $lab7_3, global $lab7_2"
		fi

		if [ $test8_1 -eq 0 ]
		then
			echo "Student ${student}, Mid score differs: global $mid_1, file $mid_2"
		fi
		if [ $test8_2 -eq 0 ]
		then
			echo "Student ${student}, Mid score differs: indv $mid_3, global $mid_2"
		fi

		if [ $test9_1 -eq 0 ]
		then
			echo "Student ${student}, Fin score differs: global $fin_1, file $fin_2"
		fi
		if [ $test9_2 -eq 0 ]
		then
			echo "Student ${student}, Fin score differs: indv $fin_3, global $fin_2"
		fi

		if [ $test10_1 -eq 0 ]
		then
			echo "Student ${student}, Late score differs: global $late_1, file $late_2"
		fi
		if [ $test10_2 -eq 0 ]
		then
			echo "Student ${student}, Late score differs: indv $late_3, global $late_2"
		fi

	done
