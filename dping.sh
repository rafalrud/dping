#!/bin/bash
clear
echo "Pinging $1"
echo -e "! - ping alive     \e[1;31m.\e[0m - ping dead\n"
echo $(date +%d/%m/%Y)
while true
        do
        printf "$(date +%H:%M) "
        l=0
        while [ $l -lt 6 ]; do
        d=0
while [ $d -lt 10 ]; do
count=$(fping -r1 -t100 $1  2> /dev/null | grep alive | cut -f3 -d' ')
if [ "$count" == "alive" ]; then
        echo -ne '!' && sleep 1
else
        echo -ne '\e[1;31m.\e[0m' && sleep 1
fi
d=$(($d + 1))
done
printf " "
l=$(($l + 1))
        done
        printf "\n"
done