#!/bin/bash

list=`ls submit`

for s in $list
do
	student=`basename $s .Z`
	echo $student
	mkdir -p extracted/${student}
	rm -rf extracted/${student}/*
	tar xf submit/${s} -C extracted/${student}
	tars=`ls extracted/${student}/mylab2/*.tar 2>/dev/null`
	for f in ${tars}
	do
		tar xf ${f} -C extracted/${student}/mylab2/
	done
done
