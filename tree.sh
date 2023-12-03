#!/bin/bash
#LISTS THE FILE TREE FOUND AT INPUT DIRECTORY
echo "Today is " `date`
IN="/"
ls $IN
read -p "Please enter the name of the directory to search: " the_path
IN+=$the_path
find $IN | sort | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/"
echo "\n DONE ... CLEANING UP!"

