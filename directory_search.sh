#!/bin/bash
echo "Today is " `date`
echo -e "Enter the name of the directory to search, in format (ROOT)/{search}"
IN="/"
read the_path
IN+=$the_path
echo -e "Your path has the following files and folders: "
ls $IN
