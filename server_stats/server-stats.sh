#!/bin/bash

#Display system overview
echo "+-------------------------------+"
echo "|System information		|"
echo "+-------------------------------+"

awk -F= '/^NAME/{print $2}' /etc/*release
uname -r | awk '{printf "Kernel version: %s\n", $1}'

#Display total CPU usage
echo "+-------------------------------+"
echo "|Total CPU usage		|"
echo "+-------------------------------+"

top -bn1 | awk -F ',' '/%Cpu\(s\)/ {print 100 - $4 "%"}'

#Display total memory usage including percentage
echo "+-------------------------------+"
echo "|Total memory usage		|"
echo "+-------------------------------+"

free -m | awk 'NR == 2 {printf "Free: %sMi\nUsed: %sMi / %.2f%\n", $4, $3, 100*$3/$2}'

#Display total disk usage including percentage
echo "+-------------------------------+"
echo "|Total disk usage		|"
echo "+-------------------------------+"

df -h --total | tail -1 | awk '{printf "Free: %s\nUsed: %s / %s\n", $4, $3, $5}'

# Display top 5 processes used by the cpu
echo "+-------------------------------+"
echo "|Top 5 CPU processes		|"
echo "+-------------------------------+"

ps -eo pcpu,pid,user,args | sort -k 1 -r | head -6

# Display top 5 processes used by memory
echo "+-------------------------------+"
echo "|Top 5 Memory processes		|"
echo "+-------------------------------+"

ps -eo pmem,pid,user,args | sort -k 1 -r | head -6
