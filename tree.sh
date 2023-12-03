#!/bin/bash
#LISTS THE FILE TREE FOUND AT INPUT DIRECTORY
echo "Today is " `date`
echo -e "Enter the name of the directory to search, in format (ROOT)/{search}"
IN="/"
read the_path
IN+=$the_path

find $IN | sort | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/"
echo "\n DONE ... CLEANING UP!"
