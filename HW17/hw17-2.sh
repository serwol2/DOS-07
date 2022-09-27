#!/bin/bash
i=0
n=$#
while [ $i -lt $n ]
do 
 echo "$1"
 shift
 ((i++))
done    