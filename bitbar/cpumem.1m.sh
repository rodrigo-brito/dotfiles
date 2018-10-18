#!/bin/zsh
CPU=$(ps -A -o %cpu | awk '{s+=$1} END {print s "%"}')
MEM=$(ps -A -o %mem | awk '{s+=$1} END {print s "%"}')
echo "MEM $MEM / CPU $CPU"
