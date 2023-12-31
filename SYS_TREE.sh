#!/bin/bash
echo "Today is " `date`
OS=$(uname -m) 
case $OS in
amd64|x86_64) bits=64;;  
i386|i586|i686) bits=32;; 
*) bits=unknown;;         
esac  
echo -e "You have a ${bits}-bit machine.\n"
echo "YOUR OPTIONS: "

echo -e "~~~~~~(1) SEARCH FROM ROOT: ~~~~~~ "
ls $IN
echo -e "~~~~~~(2) SEARCH FROM HOME: ~~~~~~ "
ls $HOME
echo -e "~~~~~~(3) GLOBAL FILE SEARCH: ~~~~ \n"
read -p "Please enter the number of your first choice, and the name of the item to search {FORMAT: 1|2 Directory OR 3 filename} " the_path
NUMBER=$(echo $the_path | sed 's/[^0-9]*//g')
echo -e "YOU CHOSE ${NUMBER} \n"
if [ $NUMBER = 1 ]
then
  echo -e "COMMENCING $IN SEARCH.... \n"
  find  $IN | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/"
fi
if [ $NUMBER = 2 ]
then
  echo -e "COMMENCING $HOME SEARCH.... \n"
  find  $HOME | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/"
  fi
if [ $NUMBER = 3 ]
then
  echo -e "COMMENCING SYSTEM SEARCH.... \n"
  find / -type f -iname "napsack.cpp*"
fi
echo -e "\n DONE ... CLEANING UP! \n"
echo -e "SYSTEM INFO:\n"
top -l 1 | grep -E "^CPU|^Phys"
echo -e "\n"
echo -e 'PAGE TABLE INFO:'
vm_stat
echo -e 'MEMORY SIZE:'
pagesize
CHOICE=0
read -p "ADDITIONALS (1-Y/0-N):" CHOICE

if [ $CHOICE = 1 ]
then
  system_profiler SPSoftwareDataType SPHardwareDataType   SPBluetoothDataType SPStartupItemDataType SPStorageDataType SPSecureElementDataType
fi
exit 1

#LISTS THE FILE TREE FOUND AT INPUT DIRECTORY
#BEST TO BE RUN WITH SUDO E.G. SUDO ./tree.sh
