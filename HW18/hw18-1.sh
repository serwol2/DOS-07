#!/bin/bash

Mutipl2(){
Mult1=$(( $1 * $2 ))

echo $Mult1
if [[ $Mult1%2 -eq 0 ]]
then 
  return 0
else
  return 1
 fi
}

if [[ $# -lt 2 ]]
then 
 echo "Less than 2 arguments! "
 exit
fi

Mutipl2 $1 $2 
echo $?
