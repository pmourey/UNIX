#!/bin/bash

INFILE=input.txt

#tail -n +2 $INFILE | sed 's/\(|".*\)?"\([^|]\)*"\(.*"|\)/\1\/"\2\/"\3/g' 

#awk ' BEGIN { RS="\"" ; FS="|" ; ORS="\"" ; OFS="|" } (NR>1) { for (i=0;i<NF;i++) print $i } ' $INFILE

awk ' BEGIN { RS="\"" ; FS="|" ; ORS="\"" ; OFS="|" }
	{
		for (i=1;i<NF;i++) {
			gsub("\"","/\"",$i)
		}
	}
	END { print NF }
	} ' $INFILE

#awk ' BEGIN { FS="|" ; RS=" } (NR>1) { for (i=0;i<NF;i++) print sub("\"","/\"",$i) } ' $INFILE

