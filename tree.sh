#!/bin/bash
echo "Today is " `date`
IN="/"
echo -e "~~~~~~~ (1) SEARCH FROM ROOT: ~~~~~~~ \n"
ls $IN
echo -e "~~~~~~(2) SEARCH FROM HOME: ~~~~~~ \n"
ls $HOME
echo -e "~~~~~~(3) SEARCH FOR FILE: ~~~~~~ \n"
read -p "Please enter the number of your first choice, and the name of the item to search {FORMAT: 1|2 Directory OR 3 filename} " the_path
NUMBER=$(echo $the_path | sed 's/[^0-9]*//g')
echo -e "YOU CHOSE ${NUMBER} \n"
if [ $NUMBER = 1 ]
then
  find  $IN | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/"
fi
if [ $NUMBER = 2 ]
then
  find  $HOME | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/"
  fi
if [ $NUMBER = 3 ]
then
  echo -e "COMMENCING SYSTEM SEARCH.... \n"
  find / -iname 'zshrc*'
fi
echo -e "\n DONE ... CLEANING UP! \n"
#LISTS THE FILE TREE FOUND AT INPUT DIRECTORY
#BEST TO BE RUN WITH SUDO E.G. SUDO ./tree.sh
