#!/bin/bash
test_number(){
case $1 in
    ''|*[!0-9]*) return 1 ;;
    *) return 0 ;;
esac
}

t=0
while [ $t -eq 0 ]; do
 echo -n "Enter the first string with numbers: "
 read -a str1
 for i in ${str1[*]}
 do 
  test_number $i
  if [ $? -ne 0 ]; then
     echo -e "\033[31m Error in string! Use only numbers! \033[0m"
     t=0
     break
  else
   t=1 
  fi 
 done
done

tt=0
while [ $tt -eq 0 ];
do
 t=0
 while [ $t -eq 0 ]; do
  echo -n "Enter the second string with numbers: "
  read -a str2
  for i in ${str2[*]}
  do 
   test_number $i
   if [ $? -ne 0 ]; then
      echo -e "\033[31m Error in string! Use only numbers! \033[0m"
      t=0
      break
   else
    t=1 
   fi 
  done
 done

 if [ ${#str1[*]} -ne ${#str2[*]} ]; then
  echo -e "\033[31m The number of numbers in the lines does not match! Try again.. \033[0m"
 else
  tt=1 
 fi
done

echo -n "sum "
for Numbr in ${!str1[*]}
do 
 Dats=$(expr ${str1[$Numbr]} + ${str2[$Numbr]})
 echo -n $Dats " "
done
echo

echo -n "ave "
for Numbr in ${!str1[*]}
do 
 ((Dats= (${str1[$Numbr]} + ${str2[$Numbr]} )/2))
 echo -n $Dats " "
done
echo 