#!/bin/bash
# Simple pingsweep
# Allows you to see listening posts ports on a local network and see wireless ports on a submask.
finish() {
  yell "$*"
  exit 111
}

echo -e "YOU ARE CURRENTLY ON SUBNET @IP:"
for name in $(ifconfig -l); do
  ifconfig $name | awk -v name=$name '/inet / {printf "%s: %s\n", name, $2; }'
done

read -p "Please enter the subnet (first three digits in IP ADDRESS e.g. x.x.x.BLAH): " SUBNET
for IP in $(seq 248 254); do
  read -p "continue or exit pings? 1/0" PROMPT
  if [ "$PROMPT" = 0 ]; then
    finish
  fi
  ping -c 2 $SUBNET.$IP

done
read -p "Additionals? (y/n 1/0)" PROMPT
if [ "$PROMPT" = "1" ] || [ "$PROMPT" = "y" ]; then
  exec netstat -rn
fi