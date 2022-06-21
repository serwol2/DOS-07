#!/bin/bash

funkprarray() {
    #string=$1
    Arr=($@)
    #Carr=()
    for i in ${Arr[*]}
    do
     #echo ${Arr[i]}
     echo $i
    done 
}

Myarr=(A B C Q y d r e t)
funkprarray "${Myarr[@]}"