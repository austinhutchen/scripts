#!/bin/bash
# Simple pingsweep
# Allows you to see listening posts ports on a submask / local network.
# I USE THIS SCRIPT TO CHECK IF MY RASPBERRY PI IS ON 
finish() {
  exit
}

echo -e "YOU ARE CURRENTLY ON SUBNET @IP:"
for name in $(ifconfig -l); do
  ifconfig $name | awk -v name=$name '/inet / {printf "%s: %s\n", name, $2; }'
done

read -p "Please enter the subnet (first three digits in IP ADDRESS e.g. x.x.x.BLAH): " SUBNET
for IP in $(seq 202 254); do
  if [ "$IP % 5 " = 0 ]; then
    read -p "continue or exit pings? 1/0" PROMPT
    if [ "$PROMPT" = 0 ]; then
      finish
    fi
  fi
  ping -c 1 $SUBNET.$IP

done
read -p "PRINT MORE? (y/n | 1/0)" PROMPT
if [ "$PROMPT" = "1" ] || [ "$PROMPT" = "y" ]; then
  exec netstat -rn
fi
