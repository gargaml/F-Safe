#!/bin/bash

set +x

TESTDIR=$(dirname $0)
RESULTS=results
GOOD=good
BAD=bad

for d in $(find $TESTDIR -mindepth 1 -maxdepth 1 -type d -printf "%f ")
do
	if [ -d $TESTDIR/$d/$RESULTS ] ; then
		echo -e "\nCleaning olds results of $TESTDIR/$d..."
		rm -f $TESTDIR/$d/$RESULTS/*
	else
		mkdir $TESTDIR/$d/$RESULTS
	fi
	case $d in 
		( $GOOD )
			EXPECT=0 ;;
		( $BAD )
			EXPECT=1 ;;
	esac
	for f in $(find $TESTDIR/$d -type f)
	do
		RESULT=2
		df=$f
		f=$(basename $df .fsf)
		echo -e "Testing $df... \c"
		./fsafe $df > $TESTDIR/$d/$RESULTS/$f.log 2>&1
		if [ -f callgraph.dot ] ; then
			mv -vf callgraph.dot $TESTDIR/$d/$RESULTS/$f.dot >> $TESTDIR/$d/$RESULTS/$f.log
			RESULT=1 ;
		fi
		if [ $RESULT -eq $EXPECT ] ; then
			echo "PASSED"
		else
			echo "FAILED (see $TESTDIR/$d/$RESULTS/$f.log)"
		fi
	done;
done ;
