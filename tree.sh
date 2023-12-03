#!/bin/bash
#LISTS THE FILE TREE FOUND AT INPUT DIRECTORY
#BEST TO BE RUN WITH SUDO E.G. SUDO ./tree.sh
echo "Today is " `date`
IN="/"
echo -e "~~~~~~~ (1) SEARCH FROM ROOT: ~~~~~~~ \n"
ls $IN
echo -e "~~~~~~~         END               ~~~~~~~ \n"
echo -e "~~~~~~(2) SEARCH FROM HOME: ~~~~~~ \n"
ls $HOME
echo -e "~~~~~~~         END               ~~~~~~~ \n"
read -p "Please enter the number of your first choice, and the name of the directory to search. FORMAT: 1 Library " the_path
NUMBER=$(echo $the_path | sed 's/[^0-9]*//g')
echo -e "YOU CHOSE ${NUMBER} \n"
if [ $NUMBER = 1 ]
then
  find  $IN | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/" 
else
  find  $HOME | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/" 
echo -e "\n DONE ... CLEANING UP! \n"
fi
