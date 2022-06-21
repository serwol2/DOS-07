#!/bin/bash
Myfile="/home/sergey/test/123.txt"

if [ ! -f "$Myfile" ];
then 
 echo "File $Myfile not found!"
 exit
fi

valid_ip() 
{
  local ip=$1
  local stat=1

  if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
    OIFS=$IFS
    IFS='.'
    ip=($ip)
    IFS=$OIFS
    [[ ${ip[0]} -le 255 && ${ip[1]} -le 255 \
      && ${ip[2]} -le 255 && ${ip[3]} -le 255 ]]
    stat=$?
  fi
  return $stat
}


echo -n "Enter ip addres: "
read Ipa

valid_ip $Ipa

if [ $? -eq 0 ]; 
then
 ping -c1 $Ipa 2>/dev/null 1>/dev/null

 if [ "$?" -eq 0 ]; 
 then

  scp $Myfile sergey@$Ipa:/tmp

  if [ $? -eq 0 ];
   then
   echo "File copied!"
  else
   echo "File not copied!"
   exit
  fi
 else
  echo "Host not found"
  exit
 fi
else
 echo "Ip adress is BAD!!"
 exit
fi
