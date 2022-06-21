#!/bin/bash
while [ 1 -eq 1 ]
echo -n "Enter Username: "
read Newuser
do
 cut -d: -f1 /etc/passwd | grep "$Newuser" > /dev/null
  ExisTest=$?
  if [ $ExisTest -eq 0 ]
  then
    echo "User  $Newuser already exists!"
    exit
  else
    echo -n "Enter Password: " 
    read Newpass
    echo -n "Enter Homedir: " 
    read Newhome 
    useradd -m -d /home/$Newhome -s /bin/bash $Newuser
    echo "$Newuser:$Newpass" | chpasswd
    exit
  fi
done