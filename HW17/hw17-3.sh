#!/bin/bash

# Develop a script which will recursively print all files in the directory provided
# as a parameter provided via READ.
# If this path contains folders - script should recursively do the same in this folder.

# dirname=/home/sergey/Desktop
echo -n "Enter the full path to the directory: "
read dirname
echo
echo

if [ -d "$dirname" ]
then

  while read -r line ; do
    echo "Directory $line:"
    echo
    find "$line" -maxdepth 1 -type f -exec basename {} \;
    echo
    echo
  done < <(find $dirname -maxdepth 1 -type d)

else
 echo "No directory!!"
fi