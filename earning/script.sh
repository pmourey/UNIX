#!/bin/bash

INFILE=infile

awk '/Earnings|Request Date:/ {print}' $INFILE | sed 's/<span>Request Date: //g' | sed 's/<\/span>//g' | sed 's/<span>Earnings: <em>//g' | sed 's/<\/em>//g' | paste -d " " - - | sed 's/JPY//g' | sed 's/2017.*/2017/' | sed -e 's/^[ \t]*//' | while read LINE
do
	earningField=`echo $LINE | cut -d" " -f1 | sed 's/,//g'`
	dateField=`echo $LINE | cut -d" " -f2-`
	newDate=`date -d"$dateField" +%Y/%m/%d`
	echo $newDate "," $earningField | sed 's/ //g'
done
