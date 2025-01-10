#!/bin/bash

# Display total CPU usage
echo "+-------------------------------+"
echo "|Total CPU usage		|"
echo "+-------------------------------+"

top -bn1 | grep '%Cpu(s)'| cut -d ',' -f 4 | awk '{print 100-$1 "%"}'

#Display total memory usage including percentage
echo "+-------------------------------+"
echo "|Total memory usage		|"
echo "+-------------------------------+"

free -m | awk 'NR == 2 {print $2 "\n" $3 "\n" 100*$3/$2 "%"}'

#Display total disk usage including percentage
echo "+-------------------------------+"
echo "|Total disk usage		|"
echo "+-------------------------------+"

df -h --total | tail -1 | awk '{printf "Free: %s\nUsed: %s / %s\n", $4, $3, $5}'

# Display top 5 processes used by the cpu
echo "+-------------------------------+"
echo "|Top 5 CPU processes		|"
echo "+-------------------------------+"

ps -eo pcpu,pid,user,args | sort -k 1 -r | head -5

# Display top 5 processes used by memory
echo "+-------------------------------+"
echo "|Top 5 Memory processes		|"
echo "+-------------------------------+"

ps -eo pmem,pid,user,args | sort -k 1 -r | head -5
