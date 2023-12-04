#!/bin/bash

#Simple pingsweep
# Allows you to see active users on a given network (NMAP SCANNER)
#
echo -e "YOU ARE CURRENTLY ON SUBNET @IP:"
for name in $(ifconfig -l)
do
    ifconfig $name |awk -v name=$name '/inet / {printf "%s: %s\n", name, $2; }'
done

read -p  "Please enter the subnet (first three digits in IP ADDRESS e.g. x.x.x.y): "
for IP in $(seq 100 254); do 
       ping -c 2 $SUBNET.$IP
done
