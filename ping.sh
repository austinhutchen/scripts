#!/bin/bash

clear

echo -e "+-----------+-----------------+\n| Interface | IP Address      |\n+-----------+-----------------+"
for iface in $(ip -o -4 addr list | awk '{print $2}' | tr '\n' ' ')
do
    ipaddr=$(ip -o -4 addr list $iface | awk '{print $4}' | cut -d/ -f1)
    printf "|%10s | %-16s|\n" $iface $ipaddr
done
