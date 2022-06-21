#!/bin/bash

PrintFiles() {
    local Katt=$1
    if [ -z "$(ls -A $Katt)" ] 
    then
       echo "Empty"
       return
    fi

    for file in $Katt/*
    do 
     if [[ -f $file ]]
     then
      basename "$file"
     else
      echo "Dir: " "$file" 
      PrintFiles $file
     fi 
    done 
}

echo -n "Enter a directory (full pass): "
read Kat

if [ -d "$Kat" ] 
then
    PrintFiles $Kat
else 
    echo "The directory does not exist!"
fi

