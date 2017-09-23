# Reformat a UNIX text file
# Upwork

Given infile (see attached), desired output is:


col $1 = numerical value
col $2 = date as +%Y/%m/%d

e.g.:

2017/8/20,1200


Applying the below transformations,

awk '/Earnings|Request Date:/ {print}' earned | sed 's/<span>Request Date: //g' | sed 's/<\/span>//g' | sed 's/<span>Earnings: <em>//g' | sed 's/<\/em>//g' | paste -d " " - - | sed 's/JPY//g' | sed 's/2017.*/2017/' | sed -e 's/^[ \t]*//'

We get something like:

64      August 31, 2017
22.50      August 31, 2017
204      August 31, 2017
368      August 31, 2017
2,132      August 31, 2017
1,092      August 30, 2017
396      August 30, 2017
360      August 29, 2017
2,172      August 29, 2017


The final steps are:

1. convert long format dates to %Y/%m/%d
2. Remove spaces between columns and set "," as field separator
3. Remove commas in col 1
4. Flip col 2 and col 1

Quick and dirty script is needed. Submit your finished work for immediate payment.  

