#!/bin/bash

#Simple pingsweep
# Allows you to see active users on a given network (NMAP SCANNER)
#
echo -e "YOU ARE CURRENTLY ON SUBNET @IP:"
ifconfig en0 |awk '/inet / {print $2; }'
read -p  "Please enter the subnet (first three digits in IP ADDRESS e.g. x.x.x.y): "
for IP in $(seq 100 254); do 
       ping -c 2 $SUBNET.$IP
done
