#!/bin/bash

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
